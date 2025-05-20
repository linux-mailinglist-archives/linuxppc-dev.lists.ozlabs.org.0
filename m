Return-Path: <linuxppc-dev+bounces-8761-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 486E0ABE00C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 May 2025 18:09:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b1zyh0rpWz30DX;
	Wed, 21 May 2025 02:09:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.8
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747757370;
	cv=none; b=gdgElQ1prlHABTRfcsQXu6t9XS6Y4IYvH7Sb3cxxeCd8114C7g9BBD7/Ik27X8gnvkpIKlfQQ0UAHTci+bQF0GdpGZClO2oHdXAZrknRMgIROSbzwaygRFU3bJp5QymfZJfQ9AwaJoRmDyO75ElPgDlu2LeIaRBtZHjxn3o4KZBc+ZgnEIPcf2ozSAGEKgycmiMLjJ6AekbKtwHIGJyxQMQ7z+8TgT/gRoocLoD009DdHpoPeZHDC6gCxJHIjjKyPWYPh4bbI0bOxsHRyKgZaDTJVOXq2Hofs5sp5+GyoylfWBwwf1YQ3APDGtQUerH2++udb72tiSw16n3heOS2GA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747757370; c=relaxed/relaxed;
	bh=dF4qH8llIFwIWJy2XSjhvB+4LXWYhcfkhe5JMQ++nXs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UUlcQWyoLwYVixjShKybGL3gpWYhZ7YDS1HHdHbqXSFkD4oQ2BvCPUzWlQFAlAoFKCdiNtlgOp3wF89a5eANPUYkOubn9MlPtkvFWx7muJEzQ8LRpEQthB6MLEMBm2+XS8g0vrkNDOHO4cXAXsYzeF8wSQBa2/bsCI0ntgXaOhVXPn2R2nsuXWP53C7P80noaFf690xXjhAOUBZztESnF7Ngz3rvRWdgzm3Lt6mBwmB8NRHHNLythnHgjLhnI708XJYTd79DP0IzFomjP/0D5BcRpGhpJcDPhqxWIbLq6dAJv1B0ULjF7lKijbUZYTQ2EKV6dzO+RKmDCLRfevn5Vw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ngY41bOh; dkim-atps=neutral; spf=none (client-ip=192.198.163.8; helo=mgamail.intel.com; envelope-from=sathyanarayanan.kuppuswamy@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ngY41bOh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.198.163.8; helo=mgamail.intel.com; envelope-from=sathyanarayanan.kuppuswamy@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b1zyb3qtcz2yrN
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 May 2025 02:09:25 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747757368; x=1779293368;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=EJXFb+XddUeHCetLI8orU9U87ooUcIVtB4tWRHZm93k=;
  b=ngY41bOhlf5qBQ9xlK4FS1M1pjCaXMld+JiPn1ukk/Acg4BGGMY6ey3s
   a0ZIZdO2QuQBMRxq2TWt0dNFgQzoU31jv4Et3fYq46CGcyTEd02TIajj/
   3LjcpQSHCHdkrdvFACGdvjNOv2VQxfopYAutua8UHZEVJuSBnaOxUgJgx
   rYQ9cpgfpdGwKv4bJe0jeG229E9j7KEvACv2FAVPs7avnqO5w1+TDrWDg
   MqNeylCFTTQL/qy6yyzPdOg4m0RrDXF5GJpWyMsYqJJXtYQyjqWYDZWOW
   8kIknSxKX6FcACdZzyVzHhtw/DIuZu7hbhbBTTXd5DObXbzXplHDA2Spx
   w==;
X-CSE-ConnectionGUID: 61SBdFD0R9y6SHBZEoTzIA==
X-CSE-MsgGUID: LQRFFAdFS7muCWtlPJlYFA==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="67256438"
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="67256438"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 09:09:24 -0700
X-CSE-ConnectionGUID: Ag+J9HIZSDuCjiEShKf8GA==
X-CSE-MsgGUID: dIBIza+KRWiskrFtGhjq1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="143730925"
Received: from iweiny-desk3.amr.corp.intel.com (HELO [10.124.221.231]) ([10.124.221.231])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 09:09:23 -0700
Message-ID: <3dd17a45-2305-4ac4-a195-4c54ce357ddc@linux.intel.com>
Date: Tue, 20 May 2025 09:09:22 -0700
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
Content-Language: en-US
From: Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>
In-Reply-To: <e6ad7ef5-de9c-49bc-9882-5e97bd549168@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


On 5/19/25 7:41 AM, Hans Zhang wrote:
>
>
> On 2025/5/19 22:21, Hans Zhang wrote:
>>
>>
>> On 2025/5/17 02:10, Sathyanarayanan Kuppuswamy wrote:
>>>
>>> On 5/16/25 9:55 AM, Hans Zhang wrote:
>>>> The following series introduces a new kernel command-line option aer_panic
>>>> to enhance error handling for PCIe Advanced Error Reporting (AER) in
>>>> mission-critical environments. This feature ensures deterministic recover
>>>> from fatal PCIe errors by triggering a controlled kernel panic when device
>>>> recovery fails, avoiding indefinite system hangs.
>>>
>>> Why would a device recovery failure lead to a system hang? Worst case
>>> that device may not be accessible, right?  Any real use case?
>>>
>>
>>
>> Dear Sathyanarayanan,
>>
>> Due to Synopsys and Cadence PCIe IP, their AER interrupts are usually SPI interrupts, not INTx/MSI/MSIx interrupts.  (Some customers will design it as an MSI/MSIx interrupt, e.g.: RK3588, but not all customers have designed it this way.)  For example, when many mobile phone SoCs of Qualcomm handle AER interrupts and there is a link down, that is, a fatal problem occurs in the current PCIe physical link, the system cannot recover.  At this point, a system restart is needed to solve the problem.
>>
>> And our company design of SOC: http://radxa.com/products/orion/o6/, it has 5 road PCIe port.
>> There is also the same problem.  If there is a problem with one of the PCIe ports, it will cause the entire system to hang.  So I hope linux OS can offer an option that enables SOC manufacturers to choose to restart the system in case of fatal hardware errors occurring in PCIe.
>>
>> There are also products such as mobile phones and tablets.  We don't want to wait until the battery is completely used up before restarting them.
>>
>> For the specific code of Qualcomm, please refer to the email I sent.
>>
>
>
> Dear Sathyanarayanan,
>
> Supplementary reasons:
>
> drivers/pci/controller/cadence/pcie-cadence-host.c
> cdns_pci_map_bus
>     /* Clear AXI link-down status */
>     cdns_pcie_writel(pcie, CDNS_PCIE_AT_LINKDOWN, 0x0);
>
> https://elixir.bootlin.com/linux/v6.15-rc6/source/drivers/pci/controller/cadence/pcie-cadence-host.c#L52
>
> If there has been a link down in this PCIe port, the register CDNS_PCIE_AT_LINKDOWN must be set to 0 for the AXI transmission to continue.  This is different from Synopsys.
>
> If CPU Core0 runs to code L52 and CPU Core1 is executing NVMe SSD saving files, since the CDNS_PCIE_AT_LINKDOWN register is still 1, it causes CPU Core1 to be unable to send TLP transfers and hang. This is a very extreme situation.
> (The current Cadence code is Legacy PCIe IP, and the HPA IP is still in the upstream process at present.)
>
> Radxa O6 uses Cadence's PCIe HPA IP.
> http://radxa.com/products/orion/o6/
>

It sounds like a system level issue to me. Why not they rely on watchdog to reboot for
this case ?

Even if you want to add this support, I think it is more appropriate to add this to your
specific PCIe controller driver.  I don't see why you want to add it part of generic
AER driver.

> Best regards,
> Hans
>
>>
>>>>
>>>> Problem Statement
>>>> In systems where unresolved PCIe errors (e.g., bus hangs) occur,
>>>> traditional error recovery mechanisms may leave the system unresponsive
>>>> indefinitely. This is unacceptable for high-availability environment
>>>> requiring prompt recovery via reboot.
>>>>
>>>> Solution
>>>> The aer_panic option forces a kernel panic on unrecoverable AER errors.
>>>> This bypasses prolonged recovery attempts and ensures immediate reboot.
>>>>
>>>> Patch Summary:
>>>> Documentation Update: Adds aer_panic to kernel-parameters.txt, explaining
>>>> its purpose and usage.
>>>>
>>>> Command-Line Handling: Implements pci=aer_panic parsing and state
>>>> management in PCI core.
>>>>
>>>> State Exposure: Introduces pci_aer_panic_enabled() to check if the panic
>>>> mode is active.
>>>>
>>>> Panic Trigger: Modifies recovery logic to panic the system when recovery
>>>> fails and aer_panic is enabled.
>>>>
>>>> Impact
>>>> Controlled Recovery: Reduces downtime by replacing hangs with immediate
>>>> reboots.
>>>>
>>>> Optional: Enabled via pci=aer_panic; no default behavior change.
>>>>
>>>> Dependency: Requires CONFIG_PCIEAER.
>>>>
>>>> For example, in mobile phones and tablets, when there is a problem with
>>>> the PCIe link and it cannot be restored, it is expected to provide an
>>>> alternative method to make the system panic without waiting for the
>>>> battery power to be completely exhausted before restarting the system.
>>>>
>>>> ---
>>>> For example, the sm8250 and sm8350 of qcom will panic and restart the
>>>> system when they are linked down.
>>>>
>>>> https://github.com/DOITfit/xiaomi_kernel_sm8250/blob/d42aa408e8cef14f4ec006554fac67ef80b86d0d/drivers/pci/controller/pci-msm.c#L5440
>>>>
>>>> https://github.com/OnePlusOSS/android_kernel_oneplus_sm8350/blob/13ca08fdf0979fdd61d5e8991661874bb2d19150/drivers/net/wireless/cnss2/pci.c#L950
>>>>
>>>>
>>>> Since the design schemes of each SOC manufacturer are different, the AXI
>>>> and other buses connected by PCIe do not have a design to prevent hanging.
>>>> Once a FATAL error occurs in the PCIe link and cannot be restored, the
>>>> system needs to be restarted.
>>>>
>>>>
>>>> Dear Mani,
>>>>
>>>> I wonder if you know how other SoCs of qcom handle FATAL errors that occur
>>>> in PCIe link.
>>>> ---
>>>>
>>>> Hans Zhang (4):
>>>>    pci: implement "pci=aer_panic"
>>>>    PCI/AER: Introduce aer_panic kernel command-line option
>>>>    PCI/AER: Expose AER panic state via pci_aer_panic_enabled()
>>>>    PCI/AER: Trigger kernel panic on recovery failure if aer_panic is set
>>>>
>>>>   .../admin-guide/kernel-parameters.txt          |  7 +++++++
>>>>   drivers/pci/pci.c                              |  2 ++
>>>>   drivers/pci/pci.h                              |  4 ++++
>>>>   drivers/pci/pcie/aer.c                         | 18 ++++++++++++++++++
>>>>   drivers/pci/pcie/err.c                         |  8 ++++++--
>>>>   5 files changed, 37 insertions(+), 2 deletions(-)
>>>>
>>>>
>>>> base-commit: fee3e843b309444f48157e2188efa6818bae85cf
>>>> prerequisite-patch-id: 299f33d3618e246cd7c04de10e591ace2d0116e6
>>>> prerequisite-patch-id: 482ad0609459a7654a4100cdc9f9aa4b671be50b
>>>
>
>
-- 
Sathyanarayanan Kuppuswamy
Linux Kernel Developer


