Return-Path: <linuxppc-dev+bounces-8619-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 82EE4ABA28C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 May 2025 20:10:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZzZrY2lYTz30Tc;
	Sat, 17 May 2025 04:10:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.15
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747419053;
	cv=none; b=HV7hY1tEWJ17sJVYNcphBthwxUDM+BHJFvDUBE/XUBgCay0m8rIWee0utHArGrtGHxYxNaDJKgm6f9x6D+gb0+H0UMQTg9XeDy8+Bied0jTVSgZUzX9qVF03QE+nen/lTIBmpCnOgeDNoS36oKP5yXZR9kOTOJO2vGs6Z4XdIfSJYbYVhnF5BhJ0nCfcwACFAe5NVg+9d5DQ7cyG9YUMNT+abdC20SSz9S7vkgYxiMlhSZOG2Nm/mwdHFOZqfuQMStkmYxiB3S76yG4YbwS6EMexO+MVoBVk9P7/8tDEn8HwF46k/dcp5BGe461feV1hFCBqCbG7LEMwBljE0pCNFw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747419053; c=relaxed/relaxed;
	bh=FsU/dKDOlWhlAdbe9vrNBQ1K/iDS0cnVmHYj6kjTKR4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MfWEaVWmluihOR7xM7ObHJrGtc/hbBqsBvi5RUkjprlw4UoV7PEnOb+9UtHqctYNJw9VI/Ns9psAfRpmfMH8RYnkwrP+lcTzPVqlHks7Gn8lQqG4AqJfhMHf4UB9+X6sC8fFOuzUDbwZpFQq5IWMb5ffcYK8eGZmzolR2t2jmM8zA6TgyEChT+deEVrmO6bYctNzu0wWBJ1x0eq2ZNMHG5NTfs0Hb1dGXYKELNcCWhX+f1RH1YT7T7YyjF09xm1czWkSsH3hAfsKOciokL+vUOJYf4D2BAOsWNwQTCtVTuDGR98qhXLaCFFyD8yfaRTqnovARpEI9RPK6f3aIhZo/g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BnuYJWZI; dkim-atps=neutral; spf=none (client-ip=192.198.163.15; helo=mgamail.intel.com; envelope-from=sathyanarayanan.kuppuswamy@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BnuYJWZI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.198.163.15; helo=mgamail.intel.com; envelope-from=sathyanarayanan.kuppuswamy@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZzZrV42CLz30TY
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 May 2025 04:10:49 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747419051; x=1778955051;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=wDKdX71pZ8RSkAEOfqZqETFChZbI516QjeBcBUpi1XQ=;
  b=BnuYJWZItBuQtxKGryf4IJxtQKowtfvFki2LG6Oz4Y7TLX5t4wqVpwOE
   fOTPlnCMaA89LTclNSBy47YVwiqdbA4EES9/Ayq+dKf33OTcOSmbbkJS8
   UhhPctet7Xw9fckQQWgrGYF9C6lkSaFBhaAY5M6QW9Qm6pCDBcFBW9muc
   KwRFA87BdUYA2tWlTiRBlHwBfG+YPcbqGNe7aqq6JEJ5EZ8Ha/Yi+ynd1
   ejSsVCWMF7QA4IuK6VP43wi+WY7YXvN3nP0D/ZApPEyktnv1Q39KNxVoI
   SLyElx7GY2L1KKZuITpg/TtDgE4Yv5Pl5WiX5+pb9AdVVi4cAtfdVLTQu
   A==;
X-CSE-ConnectionGUID: nNXqEpaiTe+bbinXL80+bQ==
X-CSE-MsgGUID: hWCzsuULTBiykrtHiUURhw==
X-IronPort-AV: E=McAfee;i="6700,10204,11435"; a="49540259"
X-IronPort-AV: E=Sophos;i="6.15,294,1739865600"; 
   d="scan'208";a="49540259"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2025 11:10:47 -0700
X-CSE-ConnectionGUID: 4tM8a3nFSWazvToF6VMjTA==
X-CSE-MsgGUID: FtR3MuS2RRCOpAPatdZMEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,294,1739865600"; 
   d="scan'208";a="139289169"
Received: from tfalcon-desk.amr.corp.intel.com (HELO [10.124.220.15]) ([10.124.220.15])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2025 11:10:47 -0700
Message-ID: <a1fdd6e1-8cd9-46b0-bd27-526729a1199d@linux.intel.com>
Date: Fri, 16 May 2025 11:10:45 -0700
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
Content-Language: en-US
From: Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>
In-Reply-To: <20250516165518.125495-1-18255117159@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


On 5/16/25 9:55 AM, Hans Zhang wrote:
> The following series introduces a new kernel command-line option aer_panic
> to enhance error handling for PCIe Advanced Error Reporting (AER) in
> mission-critical environments. This feature ensures deterministic recover
> from fatal PCIe errors by triggering a controlled kernel panic when device
> recovery fails, avoiding indefinite system hangs.

Why would a device recovery failure lead to a system hang? Worst case
that device may not be accessible, right?  Any real use case?

>
> Problem Statement
> In systems where unresolved PCIe errors (e.g., bus hangs) occur,
> traditional error recovery mechanisms may leave the system unresponsive
> indefinitely. This is unacceptable for high-availability environment
> requiring prompt recovery via reboot.
>
> Solution
> The aer_panic option forces a kernel panic on unrecoverable AER errors.
> This bypasses prolonged recovery attempts and ensures immediate reboot.
>
> Patch Summary:
> Documentation Update: Adds aer_panic to kernel-parameters.txt, explaining
> its purpose and usage.
>
> Command-Line Handling: Implements pci=aer_panic parsing and state
> management in PCI core.
>
> State Exposure: Introduces pci_aer_panic_enabled() to check if the panic
> mode is active.
>
> Panic Trigger: Modifies recovery logic to panic the system when recovery
> fails and aer_panic is enabled.
>
> Impact
> Controlled Recovery: Reduces downtime by replacing hangs with immediate
> reboots.
>
> Optional: Enabled via pci=aer_panic; no default behavior change.
>
> Dependency: Requires CONFIG_PCIEAER.
>
> For example, in mobile phones and tablets, when there is a problem with
> the PCIe link and it cannot be restored, it is expected to provide an
> alternative method to make the system panic without waiting for the
> battery power to be completely exhausted before restarting the system.
>
> ---
> For example, the sm8250 and sm8350 of qcom will panic and restart the
> system when they are linked down.
>
> https://github.com/DOITfit/xiaomi_kernel_sm8250/blob/d42aa408e8cef14f4ec006554fac67ef80b86d0d/drivers/pci/controller/pci-msm.c#L5440
>
> https://github.com/OnePlusOSS/android_kernel_oneplus_sm8350/blob/13ca08fdf0979fdd61d5e8991661874bb2d19150/drivers/net/wireless/cnss2/pci.c#L950
>
>
> Since the design schemes of each SOC manufacturer are different, the AXI
> and other buses connected by PCIe do not have a design to prevent hanging.
> Once a FATAL error occurs in the PCIe link and cannot be restored, the
> system needs to be restarted.
>
>
> Dear Mani,
>
> I wonder if you know how other SoCs of qcom handle FATAL errors that occur
> in PCIe link.
> ---
>
> Hans Zhang (4):
>    pci: implement "pci=aer_panic"
>    PCI/AER: Introduce aer_panic kernel command-line option
>    PCI/AER: Expose AER panic state via pci_aer_panic_enabled()
>    PCI/AER: Trigger kernel panic on recovery failure if aer_panic is set
>
>   .../admin-guide/kernel-parameters.txt          |  7 +++++++
>   drivers/pci/pci.c                              |  2 ++
>   drivers/pci/pci.h                              |  4 ++++
>   drivers/pci/pcie/aer.c                         | 18 ++++++++++++++++++
>   drivers/pci/pcie/err.c                         |  8 ++++++--
>   5 files changed, 37 insertions(+), 2 deletions(-)
>
>
> base-commit: fee3e843b309444f48157e2188efa6818bae85cf
> prerequisite-patch-id: 299f33d3618e246cd7c04de10e591ace2d0116e6
> prerequisite-patch-id: 482ad0609459a7654a4100cdc9f9aa4b671be50b

-- 
Sathyanarayanan Kuppuswamy
Linux Kernel Developer


