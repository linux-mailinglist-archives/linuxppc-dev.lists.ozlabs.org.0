Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0027D1BA844
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Apr 2020 17:45:36 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 499pyN5bq2zDqcM
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Apr 2020 01:45:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.88; helo=mga01.intel.com;
 envelope-from=sathyanarayanan.kuppuswamy@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 499pvd4C1PzDqYV
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Apr 2020 01:43:08 +1000 (AEST)
IronPort-SDR: ualyudOXaQB0vSfoRxNU7auk4BX/3HXh4sH7mSOydcPT4V+/lDDfTFXSTwWQTIC/97DePbCZTJ
 FfCbMlhjNKDA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2020 08:43:04 -0700
IronPort-SDR: xzyccRZCToBiEJJk7VKV/GPt/PAPE3bvggxB4tPyWAm6ywDykKrxSp9+ORjMHYMItH+bBWnPKY
 gPL7deJG9Vfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,324,1583222400"; d="scan'208";a="336331704"
Received: from djmuller-mobl.amr.corp.intel.com (HELO [10.255.231.74])
 ([10.255.231.74])
 by orsmga001.jf.intel.com with ESMTP; 27 Apr 2020 08:43:04 -0700
Subject: Re: [PATCH v2 2/2] PCI/DPC: Allow Native DPC Host Bridges to use DPC
To: "Derrick, Jonathan" <jonathan.derrick@intel.com>,
 "helgaas@kernel.org" <helgaas@kernel.org>
References: <1587418630-13562-1-git-send-email-jonathan.derrick@intel.com>
 <1587418630-13562-3-git-send-email-jonathan.derrick@intel.com>
 <0058b993-0663-7fed-ed31-cb0adf845a39@linux.intel.com>
 <ea21d9475b0af277c7288504ff2cd32b3f91e4ba.camel@intel.com>
 <7e574cc1-a24b-5c4b-7d4f-3fda3f395390@linux.intel.com>
 <6344a9afcc585504c5dfbc00174280613683064d.camel@intel.com>
From: "Kuppuswamy, Sathyanarayanan"
 <sathyanarayanan.kuppuswamy@linux.intel.com>
Message-ID: <6ee30f16-0a91-04cd-c8ba-72d177fab8f4@linux.intel.com>
Date: Mon, 27 Apr 2020 08:43:03 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <6344a9afcc585504c5dfbc00174280613683064d.camel@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Cc: "bhelgaas@google.com" <bhelgaas@google.com>, "Patel,
 Mayurkumar" <mayurkumar.patel@intel.com>,
 "fred@fredlawl.com" <fred@fredlawl.com>,
 "sbobroff@linux.ibm.com" <sbobroff@linux.ibm.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "Wysocki,
 Rafael J" <rafael.j.wysocki@intel.com>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
 "olof@lixom.net" <olof@lixom.net>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 "oohall@gmail.com" <oohall@gmail.com>, "kbusch@kernel.org" <kbusch@kernel.org>,
 "rajatja@google.com" <rajatja@google.com>,
 "mika.westerberg@linux.intel.com" <mika.westerberg@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 4/27/20 8:15 AM, Derrick, Jonathan wrote:
> Hi Sathyanarayanan,
> 
> On Sat, 2020-04-25 at 13:46 -0700, Kuppuswamy, Sathyanarayanan wrote:
>>
>> On 4/23/20 8:11 AM, Derrick, Jonathan wrote:
>>> Hi Sathyanarayanan,
>>>
>>> On Wed, 2020-04-22 at 15:50 -0700, Kuppuswamy, Sathyanarayanan wrote:
>>>> On 4/20/20 2:37 PM, Jon Derrick wrote:
>>>>> The existing portdrv model prevents DPC services without either OS
>>>>> control (_OSC) granted to AER services, a Host Bridge requesting Native
>>>>> AER, or using one of the 'pcie_ports=' parameters of 'native' or
>>>>> 'dpc-native'.
>>>>>
>>>>> The DPC port service driver itself will also fail to probe if the kernel
>>>>> assumes the port is using Firmware-First AER. It's a reasonable
>>>>> expectation that a port using Firmware-First AER will also be using
>>>>> Firmware-First DPC, however if a Host Bridge requests Native DPC, the
>>>>> DPC driver should allow it and not fail to bind due to AER capability
>>>>> settings.
>>>>>
>>>>> Host Bridges which request Native DPC port services will also likely
>>>>> request Native AER, however it shouldn't be a requirement. This patch
>>>>> allows ports on those Host Bridges to have DPC port services.
>>>>>
>>>>> This will avoid the unlikely situation where the port is Firmware-First
>>>>> AER and Native DPC, and a BIOS or switch firmware preconfiguration of
>>>>> the DPC trigger could result in unhandled DPC events.
>>>>>
>>>>> Signed-off-by: Jon Derrick <jonathan.derrick@intel.com>
>>>>> ---
>>>>>     drivers/pci/pcie/dpc.c          | 3 ++-
>>>>>     drivers/pci/pcie/portdrv_core.c | 3 ++-
>>>>>     2 files changed, 4 insertions(+), 2 deletions(-)
>>>>>
>>>>> diff --git a/drivers/pci/pcie/dpc.c b/drivers/pci/pcie/dpc.c
>>>>> index 7621704..3f3106f 100644
>>>>> --- a/drivers/pci/pcie/dpc.c
>>>>> +++ b/drivers/pci/pcie/dpc.c
>>>>> @@ -284,7 +284,8 @@ static int dpc_probe(struct pcie_device *dev)
>>>>>     	int status;
>>>>>     	u16 ctl, cap;
>>>>>     
>>>>> -	if (pcie_aer_get_firmware_first(pdev) && !pcie_ports_dpc_native)
>>>>> +	if (pcie_aer_get_firmware_first(pdev) && !pcie_ports_dpc_native &&
>>>>> +	    !pci_find_host_bridge(pdev->bus)->native_dpc)
>>>> Why do it in probe as well ? if host->native_dpc is not set then the
>>>> device DPC probe it self won't happen right ?
>>>
>>> Portdrv only enables the interrupt and allows the probe to occur.
>>
>> Please check the following snippet of code (from portdrv_core.c).
>>
>> IIUC, pcie_device_init() will not be called if PCIE_PORT_SERVICE_DPC is
>> not set in capabilities. Your change in portdrv_core.c already
>> selectively enables the PCIE_PORT_SERVICE_DPC service based on
>> native_dpc value.
>>
> That's right. So pcie_device_init registers the port service driver
> allowing the services enumeration to occur.
> 
>> So IMO, adding native_dpc check in dpc_probe() is redundant.
>>
>> int pcie_port_device_register(struct pci_dev *dev)
>> 	/* Allocate child services if any */
>> 	status = -ENODEV;
>> 	nr_service = 0;
>> 	for (i = 0; i < PCIE_PORT_DEVICE_MAXSERVICES; i++) {
>> 		int service = 1 << i;
>> 		if (!(capabilities & service))
>> 			continue;
>> 		if (!pcie_device_init(dev, service, irqs[i]))
>> 			nr_service++;
>> 	}
>>
> This is the tricky part
> There's still a check in dpc_probe for AER FFS or pcie_ports=dpc-
> native:
> 
> if (pcie_aer_get_firmware_first(pdev) && !pcie_ports_dpc_native)
> 	return -ENOTSUPP;
> 
> One option is to move that to get_port_device_capability and remove the
> dpc_probe check
Yes, its better to group them together in get_port_device_capability().

But it should be done in a separate patch.
> 
>>> The probe itself will still fail if there's a mixed-mode _OSC
>>> negotiated AER & DPC, due to pcie_aer_get_firmware_first returning 1
>>> for AER and no check for DPC.
>>>
>>> I don't know if such a platform will exist, but the kernel is already
>>> wired for 'dpc-native' so it makes sense to extend it for this..
>>>
>>> This transform might be more readable:
>>> 	if (pcie_aer_get_firmware_first(pdev) &&
>>> 	    !(pcie_ports_dpc_native || hb->native_dpc))
>>>
>>>
>>>
>>>>>     		return -ENOTSUPP;
>>>>>     
>>>>>     	status = devm_request_threaded_irq(device, dev->irq, dpc_irq,
>>>>> diff --git a/drivers/pci/pcie/portdrv_core.c b/drivers/pci/pcie/portdrv_core.c
>>>>> index 50a9522..f2139a1 100644
>>>>> --- a/drivers/pci/pcie/portdrv_core.c
>>>>> +++ b/drivers/pci/pcie/portdrv_core.c
>>>>> @@ -256,7 +256,8 @@ static int get_port_device_capability(struct pci_dev *dev)
>>>>>     	 */
>>>>>     	if (pci_find_ext_capability(dev, PCI_EXT_CAP_ID_DPC) &&
>>>>>     	    pci_aer_available() &&
>>>>> -	    (pcie_ports_dpc_native || (services & PCIE_PORT_SERVICE_AER)))
>>>>> +	    (pcie_ports_dpc_native || host->native_dpc ||
>>>>> +	     (services & PCIE_PORT_SERVICE_AER)))
>>>>>     		services |= PCIE_PORT_SERVICE_DPC;
>>>>>     
>>>>>     	if (pci_pcie_type(dev) == PCI_EXP_TYPE_DOWNSTREAM ||
>>>>>
