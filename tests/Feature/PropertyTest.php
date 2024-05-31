// tests/Feature/PropertyTest.php

namespace Tests\Feature;

use Tests\TestCase;
use App\Models\Property;

class PropertyTest extends TestCase
{
    /**
     * @test
     */
    public function can_create_a_new_property()
    {
        // Create a new property
        $property = factory(Property::class)->make();

        // Assert that the property was created successfully
        $this->assertCount(1, Property::all());
    }

    /**
     * @test
     */
    public function can_update_an_existing_property()
    {
        // Create a new property
        $property = factory(Property::class)->create();

        // Update the property
        $property->update(['name' => 'New Name']);

        // Assert that the property was updated successfully
        $this->assertEquals('New Name', $property->fresh()->name);
    }

    // Add more tests for other property-related functionality
}
