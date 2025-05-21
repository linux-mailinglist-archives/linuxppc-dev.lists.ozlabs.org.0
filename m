Return-Path: <linuxppc-dev+bounces-8841-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BC13ABFB02
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 May 2025 18:17:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b2c5K1dh1z2xxr;
	Thu, 22 May 2025 02:17:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.21
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747844241;
	cv=none; b=eH43ZVD1y9DVe+F6hjXcJE9okVeKQWGK6O/uwODSYbZFwqAyfun6A+1tueYo0/LOaAhzOrWXzbRlaMWKusXJ3AR5iW+uyTDrTytRDtBhXFiBL6lMu9dHuqmRKIcNM6lQ5n0Uw3837N909s11puT8HCynFrmrg2YdxIqq0XEV47kJvZk2dIWGqOthvaSOeWEmItSovESDFaXI1JFoANEtfSx0KxAPVH0yf1frYrmqPK+wuu9Ki/+6GchdzOXlqdPCHYhkL0AnSAjCVV7Md+MPKtea/VCYnKqtlfw8CawiqHDLHDDrUc9fs4OCCa+GWUuOXdWOJ/inciF60kPpFLDKHA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747844241; c=relaxed/relaxed;
	bh=V923oqzwXwBdQGYznHnOVZyYiLVwXeY6IdByCEi6F2A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PkCH50F3I6if31qVk5X/O2sBYayu7tY3svSd2RSSceWj/daHFCVqGa3i6AHDsl6zdEgquu3y9lVhu3us8gdx2tgJvpi9lnNS87VbDM5S/g+j53q0rA4Ehj+hvE7qItucpoVR70Ps0tDsAF27evfANKBnW7QA9GwCA4dGh4oqHyQFdif1xdkpkIBgxltnoNnGTDAMsO2foHR7r16X+JdcW22sVTPeaG1PLPj2ls8Z+WJB0TXyJYcuoN4tF2tovrvBdhdh3YH5Cx+qC4Cu7Qqc9tqAB0VgcmuRC0NPEfFM+W5+/x6eM2qgDM32uZN530ftZ2O7uSpjwb8dNcnL2sD75g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Qd3QRokF; dkim-atps=neutral; spf=none (client-ip=198.175.65.21; helo=mgamail.intel.com; envelope-from=sathyanarayanan.kuppuswamy@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Qd3QRokF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.21; helo=mgamail.intel.com; envelope-from=sathyanarayanan.kuppuswamy@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b2c5B6hgbz2xdg
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 May 2025 02:17:16 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747844239; x=1779380239;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=MJMgl0cpH/CO2ZHP/LrJdO1YCs6BR4prjVQ6FDWn0Q0=;
  b=Qd3QRokFdqLNkPGbyNkM8YC3BFsg6m9WNhjGJTcRy4CfJKAAgmVwMEM4
   NdjEXnrnWYALpFaGr/eeH79NbXovYixLfaL+vI2gKaavobajTuBcFColt
   mmAc4F0fkbHtfD7zzOxLf6PSE8X/XRDzYhLhU5tFOcYTaqr27h/l3zxop
   7jvzs03O9YvrvpKqAuy/I4r9EuyJ3zGHRfrNcrW/RWdS9tZOTUlSBADCF
   MOWS3nMl8nnOYKetfgwDUncep+wEOjgsqTk9EYFceY/QSkpk9UE/VYiJ8
   snSCQ/c/a9mkcu5TYK5pSRGnKLJ+at5JsbzuoSTgD4CMl+Tb4lNSk7gZV
   A==;
X-CSE-ConnectionGUID: znVsOxPeRqmd0MGvbGjatQ==
X-CSE-MsgGUID: foLh4GlgTp+VzeJ4OJQxzA==
X-IronPort-AV: E=McAfee;i="6700,10204,11440"; a="49739795"
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; 
   d="scan'208";a="49739795"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 09:17:14 -0700
X-CSE-ConnectionGUID: h6Nu3m6eTC2tplUDmu7l+g==
X-CSE-MsgGUID: a4rvH2odTPWcKBeTNRi63Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; 
   d="scan'208";a="141206018"
Received: from rfrazer-mobl3.amr.corp.intel.com (HELO [10.124.222.247]) ([10.124.222.247])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 09:17:13 -0700
Message-ID: <97e9850f-8a74-425f-93ab-5017599c98b5@linux.intel.com>
Date: Wed, 21 May 2025 09:17:13 -0700
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] pci: implement "pci=aer_panic"
To: Hans Zhang <18255117159@163.com>, bhelgaas@google.com,
 tglx@linutronix.de, kw@linux.com, manivannan.sadhasivam@linaro.org,
 mahesh@linux.ibm.com
Cc: oohall@gmail.com, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
References: <20250516165518.125495-1-18255117159@163.com>
 <a1fdd6e1-8cd9-46b0-bd27-526729a1199d@linux.intel.com>
 <8434dc81-5d2d-4ce1-ab73-ca1cf16cb550@163.com>
 <e6ad7ef5-de9c-49bc-9882-5e97bd549168@163.com>
 <3dd17a45-2305-4ac4-a195-4c54ce357ddc@linux.intel.com>
 <1c21ec0b-ca89-4f7e-85f2-bdb48edb8055@163.com>
Content-Language: en-US
From: Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>
In-Reply-To: <1c21ec0b-ca89-4f7e-85f2-bdb48edb8055@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


On 5/21/25 7:54 AM, Hans Zhang wrote:
>
>
> On 2025/5/21 00:09, Sathyanarayanan Kuppuswamy wrote:
>>
>> On 5/19/25 7:41 AM, Hans Zhang wrote:
>>>
>>>
>>> On 2025/5/19 22:21, Hans Zhang wrote:
>>>>
>>>>
>>>> On 2025/5/17 02:10, Sathyanarayanan Kuppuswamy wrote:
>>>>>
>>>>> On 5/16/25 9:55 AM, Hans Zhang wrote:
>>>>>> The following series introduces a new kernel command-line option aer_panic
>>>>>> to enhance error handling for PCIe Advanced Error Reporting (AER) in
>>>>>> mission-critical environments. This feature ensures deterministic recover
>>>>>> from fatal PCIe errors by triggering a controlled kernel panic when device
>>>>>> recovery fails, avoiding indefinite system hangs.
>>>>>
>>>>> Why would a device recovery failure lead to a system hang? Worst case
>>>>> that device may not be accessible, right?  Any real use case?
>>>>>
>>>>
>>>>
>>>> Dear Sathyanarayanan,
>>>>
>>>> Due to Synopsys and Cadence PCIe IP, their AER interrupts are usually SPI interrupts, not INTx/MSI/MSIx interrupts. (Some customers will design it as an MSI/MSIx interrupt, e.g.: RK3588, but not all customers have designed it this way.)  For example, when many mobile phone SoCs of Qualcomm handle AER interrupts and there is a link down, that is, a fatal problem occurs in the current PCIe physical link, the system cannot recover.  At this point, a system restart is needed to solve the problem.
>>>>
>>>> And our company design of SOC: http://radxa.com/products/orion/o6/, it has 5 road PCIe port.
>>>> There is also the same problem.  If there is a problem with one of the PCIe ports, it will cause the entire system to hang.  So I hope linux OS can offer an option that enables SOC manufacturers to choose to restart the system in case of fatal hardware errors occurring in PCIe.
>>>>
>>>> There are also products such as mobile phones and tablets. We don't want to wait until the battery is completely used up before restarting them.
>>>>
>>>> For the specific code of Qualcomm, please refer to the email I sent.
>>>>
>>>
>>>
>>> Dear Sathyanarayanan,
>>>
>>> Supplementary reasons:
>>>
>>> drivers/pci/controller/cadence/pcie-cadence-host.c
>>> cdns_pci_map_bus
>>>     /* Clear AXI link-down status */
>>>     cdns_pcie_writel(pcie, CDNS_PCIE_AT_LINKDOWN, 0x0);
>>>
>>> https://elixir.bootlin.com/linux/v6.15-rc6/source/drivers/pci/controller/cadence/pcie-cadence-host.c#L52
>>>
>>> If there has been a link down in this PCIe port, the register CDNS_PCIE_AT_LINKDOWN must be set to 0 for the AXI transmission to continue.  This is different from Synopsys.
>>>
>>> If CPU Core0 runs to code L52 and CPU Core1 is executing NVMe SSD saving files, since the CDNS_PCIE_AT_LINKDOWN register is still 1, it causes CPU Core1 to be unable to send TLP transfers and hang. This is a very extreme situation.
>>> (The current Cadence code is Legacy PCIe IP, and the HPA IP is still in the upstream process at present.)
>>>
>>> Radxa O6 uses Cadence's PCIe HPA IP.
>>> http://radxa.com/products/orion/o6/
>>>
>>
>> It sounds like a system level issue to me. Why not they rely on watchdog to reboot for
>> this case ?
>
> Dear Sathyanarayanan,
>
> Thank you for your reply. Yes, personally, I think it's also a problem at the system level. I conducted a local test. When I directly unplugged the EP device on the slot, the system would hang. It has been tested many times. Since we don't have a bus timeout response mechanism for PCIe, it hangs easily.

Any comment on why watchdog is not used to reboot the unresponsive system?

>
>>
>> Even if you want to add this support, I think it is more appropriate to add this to your
>> specific PCIe controller driver.  I don't see why you want to add it part of generic
>> AER driver.
>>
> Because we want to use the processing logic of the general AER driver. If the recovery is successful, there will be no problem. If the recovery fails, my original intention was to restart the system.
>
> If added to the specific PCIe controller driver, a lot of repetitive AER processing logic will be written. So I was thinking whether the AER driver could be changed to be compiled as a KO module.

May be you can rely on err handler callbacks to get notification on fatal errors or you can even use uevent handler to detect the disconnected device event and handle it there.

>
>
> If this series is not reasonable, I'll drop it.

Adding new kernel param to solve a specific system issue is not recommended. Try to find some custom solution for your chip/controller.

>
>
> Best regards,
> Hans
>
>>>>
>>>>>>
>>>>>> Problem Statement
>>>>>> In systems where unresolved PCIe errors (e.g., bus hangs) occur,
>>>>>> traditional error recovery mechanisms may leave the system unresponsive
>>>>>> indefinitely. This is unacceptable for high-availability environment
>>>>>> requiring prompt recovery via reboot.
>>>>>>
>>>>>> Solution
>>>>>> The aer_panic option forces a kernel panic on unrecoverable AER errors.
>>>>>> This bypasses prolonged recovery attempts and ensures immediate reboot.
>>>>>>
>>>>>> Patch Summary:
>>>>>> Documentation Update: Adds aer_panic to kernel-parameters.txt, explaining
>>>>>> its purpose and usage.
>>>>>>
>>>>>> Command-Line Handling: Implements pci=aer_panic parsing and state
>>>>>> management in PCI core.
>>>>>>
>>>>>> State Exposure: Introduces pci_aer_panic_enabled() to check if the panic
>>>>>> mode is active.
>>>>>>
>>>>>> Panic Trigger: Modifies recovery logic to panic the system when recovery
>>>>>> fails and aer_panic is enabled.
>>>>>>
>>>>>> Impact
>>>>>> Controlled Recovery: Reduces downtime by replacing hangs with immediate
>>>>>> reboots.
>>>>>>
>>>>>> Optional: Enabled via pci=aer_panic; no default behavior change.
>>>>>>
>>>>>> Dependency: Requires CONFIG_PCIEAER.
>>>>>>
>>>>>> For example, in mobile phones and tablets, when there is a problem with
>>>>>> the PCIe link and it cannot be restored, it is expected to provide an
>>>>>> alternative method to make the system panic without waiting for the
>>>>>> battery power to be completely exhausted before restarting the system.
>>>>>>
>>>>>> ---
>>>>>> For example, the sm8250 and sm8350 of qcom will panic and restart the
>>>>>> system when they are linked down.
>>>>>>
>>>>>> https://github.com/DOITfit/xiaomi_kernel_sm8250/blob/d42aa408e8cef14f4ec006554fac67ef80b86d0d/drivers/pci/controller/pci-msm.c#L5440
>>>>>>
>>>>>> https://github.com/OnePlusOSS/android_kernel_oneplus_sm8350/blob/13ca08fdf0979fdd61d5e8991661874bb2d19150/drivers/net/wireless/cnss2/pci.c#L950
>>>>>>
>>>>>>
>>>>>> Since the design schemes of each SOC manufacturer are different, the AXI
>>>>>> and other buses connected by PCIe do not have a design to prevent hanging.
>>>>>> Once a FATAL error occurs in the PCIe link and cannot be restored, the
>>>>>> system needs to be restarted.
>>>>>>
>>>>>>
>>>>>> Dear Mani,
>>>>>>
>>>>>> I wonder if you know how other SoCs of qcom handle FATAL errors that occur
>>>>>> in PCIe link.
>>>>>> ---
>>>>>>
>
-- 
Sathyanarayanan Kuppuswamy
Linux Kernel Developer


