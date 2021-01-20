Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B6B02FD6E7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Jan 2021 18:32:14 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DLXdj5ZWDzDqvR
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Jan 2021 04:32:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=robin.murphy@arm.com; receiver=<UNKNOWN>)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 4DLXbf5TS4zDqJY
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Jan 2021 04:30:22 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0CA6C31B;
 Wed, 20 Jan 2021 09:30:15 -0800 (PST)
Received: from [10.57.39.58] (unknown [10.57.39.58])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EF5433F68F;
 Wed, 20 Jan 2021 09:30:08 -0800 (PST)
Subject: Re: [RFC PATCH v3 5/6] dt-bindings: of: Add restricted DMA pool
To: Rob Herring <robh@kernel.org>, Claire Chang <tientzu@chromium.org>
References: <20210106034124.30560-1-tientzu@chromium.org>
 <20210106034124.30560-6-tientzu@chromium.org>
 <20210120165348.GA220770@robh.at.kernel.org>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <313f8052-a591-75de-c4c2-ee9ea8f02e7f@arm.com>
Date: Wed, 20 Jan 2021 17:30:07 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210120165348.GA220770@robh.at.kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: heikki.krogerus@linux.intel.com, peterz@infradead.org,
 linux-kernel@vger.kernel.org, grant.likely@arm.com, paulus@samba.org,
 will@kernel.org, mingo@kernel.org, m.szyprowski@samsung.com,
 sstabellini@kernel.org, saravanak@google.com, joro@8bytes.org,
 rafael.j.wysocki@intel.com, hch@lst.de, bgolaszewski@baylibre.com,
 xen-devel@lists.xenproject.org, treding@nvidia.com, devicetree@vger.kernel.org,
 konrad.wilk@oracle.com, dan.j.williams@intel.com, drinkcat@chromium.org,
 boris.ostrovsky@oracle.com, andriy.shevchenko@linux.intel.com, jgross@suse.com,
 gregkh@linuxfoundation.org, rdunlap@infradead.org, frowand.list@gmail.com,
 tfiga@chromium.org, iommu@lists.linux-foundation.org, xypron.glpk@gmx.de,
 linuxppc-dev@lists.ozlabs.org, bauerman@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2021-01-20 16:53, Rob Herring wrote:
> On Wed, Jan 06, 2021 at 11:41:23AM +0800, Claire Chang wrote:
>> Introduce the new compatible string, restricted-dma-pool, for restricted
>> DMA. One can specify the address and length of the restricted DMA memory
>> region by restricted-dma-pool in the device tree.
> 
> If this goes into DT, I think we should be able to use dma-ranges for
> this purpose instead. Normally, 'dma-ranges' is for physical bus
> restrictions, but there's no reason it can't be used for policy or to
> express restrictions the firmware has enabled.

There would still need to be some way to tell SWIOTLB to pick up the 
corresponding chunk of memory and to prevent the kernel from using it 
for anything else, though.

>> Signed-off-by: Claire Chang <tientzu@chromium.org>
>> ---
>>   .../reserved-memory/reserved-memory.txt       | 24 +++++++++++++++++++
>>   1 file changed, 24 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt b/Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
>> index e8d3096d922c..44975e2a1fd2 100644
>> --- a/Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
>> +++ b/Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
>> @@ -51,6 +51,20 @@ compatible (optional) - standard definition
>>             used as a shared pool of DMA buffers for a set of devices. It can
>>             be used by an operating system to instantiate the necessary pool
>>             management subsystem if necessary.
>> +        - restricted-dma-pool: This indicates a region of memory meant to be
>> +          used as a pool of restricted DMA buffers for a set of devices. The
>> +          memory region would be the only region accessible to those devices.
>> +          When using this, the no-map and reusable properties must not be set,
>> +          so the operating system can create a virtual mapping that will be used
>> +          for synchronization. The main purpose for restricted DMA is to
>> +          mitigate the lack of DMA access control on systems without an IOMMU,
>> +          which could result in the DMA accessing the system memory at
>> +          unexpected times and/or unexpected addresses, possibly leading to data
>> +          leakage or corruption. The feature on its own provides a basic level
>> +          of protection against the DMA overwriting buffer contents at
>> +          unexpected times. However, to protect against general data leakage and
>> +          system memory corruption, the system needs to provide way to restrict
>> +          the DMA to a predefined memory region.
>>           - vendor specific string in the form <vendor>,[<device>-]<usage>
>>   no-map (optional) - empty property
>>       - Indicates the operating system must not create a virtual mapping
>> @@ -120,6 +134,11 @@ one for multimedia processing (named multimedia-memory@77000000, 64MiB).
>>   			compatible = "acme,multimedia-memory";
>>   			reg = <0x77000000 0x4000000>;
>>   		};
>> +
>> +		restricted_dma_mem_reserved: restricted_dma_mem_reserved {
>> +			compatible = "restricted-dma-pool";
>> +			reg = <0x50000000 0x400000>;
>> +		};
>>   	};
>>   
>>   	/* ... */
>> @@ -138,4 +157,9 @@ one for multimedia processing (named multimedia-memory@77000000, 64MiB).
>>   		memory-region = <&multimedia_reserved>;
>>   		/* ... */
>>   	};
>> +
>> +	pcie_device: pcie_device@0,0 {
>> +		memory-region = <&restricted_dma_mem_reserved>;
> 
> PCI hosts often have inbound window configurations that limit the
> address range and translate PCI to bus addresses. Those windows happen
> to be configured by dma-ranges. In any case, wouldn't you want to put
> the configuration in the PCI host node? Is there a usecase of
> restricting one PCIe device and not another?

The general design seems to accommodate devices having their own pools 
such that they can't even snoop on each others' transient DMA data. If 
the interconnect had a way of wiring up, say, PCI RIDs to AMBA NSAIDs, 
then in principle you could certainly apply that to PCI endpoints too 
(presumably you'd also disallow them from peer-to-peer transactions at 
the PCI level too).

Robin.
