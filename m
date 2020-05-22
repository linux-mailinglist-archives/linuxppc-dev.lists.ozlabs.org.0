Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DFF151DF0CD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 May 2020 22:51:42 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49TJZ33YQ9zDqY7
	for <lists+linuxppc-dev@lfdr.de>; Sat, 23 May 2020 06:51:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.151; helo=mga17.intel.com;
 envelope-from=sathyanarayanan.kuppuswamy@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49TJV91j40zDqY7
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 23 May 2020 06:48:15 +1000 (AEST)
IronPort-SDR: Oyq8hxy2UYGh302I5AD+dHMWF8lvf3+QVAwKWHhT5/ocYq7AxO01+TJFXxzTlvB46EScwA5Mov
 +KXSfCyYYznA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2020 13:48:13 -0700
IronPort-SDR: Ozv8PEYBc6FfaoH9pI8tRE/Fw0hJ/UKChA6fBQHuVwIR4CsO+A31lXcVoHHrVyHLQ9nfsTivVH
 GXHKeOiNKsUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,423,1583222400"; d="scan'208";a="412866418"
Received: from mpritz-mobl.amr.corp.intel.com (HELO [10.254.66.178])
 ([10.254.66.178])
 by orsmga004.jf.intel.com with ESMTP; 22 May 2020 13:48:12 -0700
Subject: Re: [PATCH v3 0/2] PCI/ERR: Allow Native AER/DPC using _OSC
To: Bjorn Helgaas <helgaas@kernel.org>,
 "Derrick, Jonathan" <jonathan.derrick@intel.com>
References: <20200522194616.GA11359@bjorn-Precision-5520>
From: "Kuppuswamy, Sathyanarayanan"
 <sathyanarayanan.kuppuswamy@linux.intel.com>
Message-ID: <05605bef-31f1-7a5f-5078-e4eced6d36ff@linux.intel.com>
Date: Fri, 22 May 2020 13:48:12 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200522194616.GA11359@bjorn-Precision-5520>
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
Cc: "Patel, Mayurkumar" <mayurkumar.patel@intel.com>,
 "fred@fredlawl.com" <fred@fredlawl.com>,
 "sbobroff@linux.ibm.com" <sbobroff@linux.ibm.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "Wysocki,
 Rafael J" <rafael.j.wysocki@intel.com>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
 "bhelgaas@google.com" <bhelgaas@google.com>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 "oohall@gmail.com" <oohall@gmail.com>, "olof@lixom.net" <olof@lixom.net>,
 "rajatja@google.com" <rajatja@google.com>,
 "mika.westerberg@linux.intel.com" <mika.westerberg@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Bjorn, Derrick,

On 5/22/20 12:46 PM, Bjorn Helgaas wrote:
> On Fri, May 22, 2020 at 05:23:31PM +0000, Derrick, Jonathan wrote:
>> On Fri, 2020-05-01 at 11:35 -0600, Jonathan Derrick wrote:
>>> On Fri, 2020-05-01 at 12:16 -0500, Bjorn Helgaas wrote:
>>>> On Thu, Apr 30, 2020 at 12:46:07PM -0600, Jon Derrick wrote:
>>>>> Hi Bjorn & Kuppuswamy,
>>>>>
>>>>> I see a problem in the DPC ECN [1] to _OSC in that it doesn't
>>>>> give us a way to determine if firmware supports _OSC DPC
>>>>> negotation, and therefore how to handle DPC.
>>>>>
>>>>> Here is the wording of the ECN that implies that Firmware
>>>>> without _OSC DPC negotiation support should have the OSPM rely
>>>>> on _OSC AER negotiation when determining DPC control:
>>>>>
>>>>>    PCIe Base Specification suggests that Downstream Port
>>>>>    Containment may be controlled either by the Firmware or the
>>>>>    Operating System. It also suggests that the Firmware retain
>>>>>    ownership of Downstream Port Containment if it also owns
>>>>>    AER. When the Firmware owns Downstream Port Containment, it
>>>>>    is expected to use the new "Error Disconnect Recover"
>>>>>    notification to alert OSPM of a Downstream Port Containment
>>>>>    event.
>>>>>
>>>>> In legacy platforms, as bits in _OSC are reserved prior to
>>>>> implementation, ACPI Root Bus enumeration will mark these Host
>>>>> Bridges as without Native DPC support, even though the
>>>>> specification implies it's expected that AER _OSC negotiation
>>>>> determines DPC control for these platforms. There seems to be
>>>>> a need for a way to determine if the DPC control bit in _OSC
>>>>> is supported and fallback on AER otherwise.
>>>>>
>>>>>
>>>>> Currently portdrv assumes DPC control if the port has Native
>>>>> AER services:
>>>>>
>>>>> static int get_port_device_capability(struct pci_dev *dev)
>>>>> ...
>>>>> 	if (pci_find_ext_capability(dev, PCI_EXT_CAP_ID_DPC) &&
>>>>> 	    pci_aer_available() &&
>>>>> 	    (pcie_ports_dpc_native || (services & PCIE_PORT_SERVICE_AER)))
>>>>> 		services |= PCIE_PORT_SERVICE_DPC;
>>>>>
>>>>> Newer firmware may not grant OSPM DPC control, if for
>>>>> instance, it expects to use Error Disconnect Recovery. However
>>>>> it looks like ACPI will use DPC services via the EDR driver,
>>>>> without binding the full DPC port service driver.
>>>>>
>>>>>
>>>>> If we change portdrv to probe based on host->native_dpc and
>>>>> not AER, then we break instances with legacy firmware where
>>>>> OSPM will clear host->native_dpc solely due to _OSC bits being
>>>>> reserved:
>>>>>
>>>>> struct pci_bus *acpi_pci_root_create(struct acpi_pci_root *root,
>>>>> ...
>>>>> 	if (!(root->osc_control_set & OSC_PCI_EXPRESS_DPC_CONTROL))
>>>>> 		host_bridge->native_dpc = 0;
>>>>>
>>>>>
>>>>>
>>>>> So my assumption instead is that host->native_dpc can be 0 and
>>>>> expect Native DPC services if AER is used. In other words, if
>>>>> and only if DPC probe is invoked from portdrv, then it needs
>>>>> to rely on the AER dependency. Otherwise it should be assumed
>>>>> that ACPI set up DPC via EDR. This covers legacy firmware.
>>>>>
>>>>> However it seems like that could be trouble with newer
>>>>> firmware that might give OSPM control of AER but not DPC, and
>>>>> would result in both Native DPC and EDR being in effect.
>>>>>
>>>>>
>>>>> Anyways here are two patches that give control of AER and DPC
>>>>> on the results of _OSC. They don't mess with the HEST parser
>>>>> as I expect those to be removed at some point. I need these
>>>>> for VMD support which doesn't even rely on _OSC, but I suspect
>>>>> this won't be the last effort as we detangle Firmware First.
>>>>>
>>>>> [1] https://members.pcisig.com/wg/PCI-SIG/document/12888
>>>>
>>>> Hi Jon, I think we need to sort out the _OSC/FIRMWARE_FIRST patches
>>>> from Alex and Sathy first, then see what needs to be done on top of
>>>> those, so I'm going to push these off for a few days and they'll
>>>> probably need a refresh.
>>>>
>>>> Bjorn
>>>
>>> Agreed, no need to merge now. Just wanted to bring up the DPC
>>> ambiguity, which I think was first addressed by dpc-native:
>>>
>>> commit 35a0b2378c199d4f26e458b2ca38ea56aaf2d9b8
>>> Author: Olof Johansson <olof@lixom.net>
>>> Date:   Wed Oct 23 12:22:05 2019 -0700
>>>
>>>      PCI/DPC: Add "pcie_ports=dpc-native" to allow DPC without AER control
>>>      
>>>      Prior to eed85ff4c0da7 ("PCI/DPC: Enable DPC only if AER is available"),
>>>      Linux handled DPC events regardless of whether firmware had granted it
>>>      ownership of AER or DPC, e.g., via _OSC.
>>>      
>>>      PCIe r5.0, sec 6.2.10, recommends that the OS link control of DPC to
>>>      control of AER, so after eed85ff4c0da7, Linux handles DPC events only if it
>>>      has control of AER.
>>>      
>>>      On platforms that do not grant OS control of AER via _OSC, Linux DPC
>>>      handling worked before eed85ff4c0da7 but not after.
>>>      
>>>      To make Linux DPC handling work on those platforms the same way they did
>>>      before, add a "pcie_ports=dpc-native" kernel parameter that makes Linux
>>>      handle DPC events regardless of whether it has control of AER.
>>>      
>>>      [bhelgaas: commit log, move pcie_ports_dpc_native to drivers/pci/]
>>>      Link: https://lore.kernel.org/r/20191023192205.97024-1-olof@lixom.net
>>>      Signed-off-by: Olof Johansson <olof@lixom.net>
>>>      Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
>>
>> Are you still thinking about removing the HEST parser?
>>
>> For VMD we still need the ability to bind DPC if native_dpc==1.
>> I think if we can do that, this set should still pretty much still
>> apply with a modification to patch 2 to allow matching
>> pcie_ports_dpc_native in dpc_probe.
> 
> Yes, I think we should remove the HEST firmware-first parsing, because
> IIRC the spec really doesn't specify any action the OS should take
> based on it.  I was thinking Sathy might update the patch, and it fell
> off my radar.

Sorry for the delay.

I was just waiting to see whether we get any issues with merging
following commit.

commit c100beb9ccfb98e2474586a4006483cbf770c823
Author: Alexandru Gagniuc <mr.nuke.me@gmail.com>
Date:   Mon Apr 27 18:25:13 2020 -0500

     PCI/AER: Use only _OSC to determine AER ownership

Since I did not see any email reporting any issues about it,
I will work on follow up patch.

> 
> Bjorn
> 
