Return-Path: <linuxppc-dev+bounces-11075-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CE02CB2940A
	for <lists+linuxppc-dev@lfdr.de>; Sun, 17 Aug 2025 18:11:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c4gp33qf9z3bV6;
	Mon, 18 Aug 2025 02:11:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.14
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755447099;
	cv=none; b=T1CZ1QuVPex+dpm7cCH339J2Xd1szFAohg2ntDSPTEMV6pGKD7cLcz7HbEiRVda7sF5Kz7FROt6QLefG7LhAm6ILC02weCLt78SFNVZK2zgOEqKhY90UD6PBoSMaMMnTVTe0nAJ2XgqDbI1R4zYBCRMgk0U4HHO5qiYzzkZEJQi0Fd7CcVfgKHQa9/e2EkCnk7Q3wJhvQzHCT+/MzrM9uN7XtZoTchRrqyqGtKgSY5O10gmexL9jCpPBNqKXf2KiN9enEOMU+8FD0q1XU3ZsB9Y3d7bHgX/YdjBs57b5/EaO/hlhhkK4GB6uHCjPXzhUyt4M3wgq9d5sODrXBYCp2A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755447099; c=relaxed/relaxed;
	bh=34NrFUNvZl0GjYjV/T30TIvtpL1VcwzF6hoGN3AQ7lw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FTdLrJatI51IS97cQWhdOUnk7ZbFNRR/chwd9gJIJIk8IB6xqe2WH6IWUIgqPRLq6CQBkIFWqBxbkQYofU+HotLcKKp/s8XVsaFvfVu4G9xnJWGRoyYUlTSwKA671dwVZ0J3y6lsdVrq8gGtoElha6YhQtl9BgLOK3IFv0rIWDWQwBAn9BdMaCtdaDfWzbLnLl7/9n0IsDEYg5+dMPQz0X6k+6iuzibArqnhVLqYpCzloQ+mc1jA1qMAUvRCBekp9nUsRwASVaOaQuEN3rr3Zn8Ye7mLbFaPFEwGyap0qYUcqgCEE6dGTxZeERH7yjLPmZqHpUILCcN1pgzGlfZhxw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=afVyT5RQ; dkim-atps=neutral; spf=none (client-ip=198.175.65.14; helo=mgamail.intel.com; envelope-from=sathyanarayanan.kuppuswamy@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=afVyT5RQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.14; helo=mgamail.intel.com; envelope-from=sathyanarayanan.kuppuswamy@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c4gp24Vmrz3bTf
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Aug 2025 02:11:38 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755447099; x=1786983099;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=OmKfIZC4v/Yh+lxG9tt63RrqXnAkHxol+BcPkY7gV0w=;
  b=afVyT5RQNabhyz02WcxZuGTb4M4+jWp+s50rzvVtp2cWa2s4zpGLLOzE
   lZgGxksF+sxMLJdiIP7ylDdL91DQeuNhSOhMV476+/+Ir38CZXyoji7eH
   z1mW/bIf6Oi6BmIGi+18qJ++71P8ZHph3RWHdz3Mr7HZFqngL7BTQXotF
   ZSRgvWqtI/xWUo7lF6Vx8Oj/AO6GrUCu2cmgMsO936M/BDzSSrxyHHwrA
   OF8RxOuf0DKcntq54F6ce2B1MmhONfEtoItI/uq40gG8LzpE5souRKicb
   J7dwYeoso2lbb54JH2E5Tj27TBP8bsX9LYFw4wv/aSpmSXF/4ybCt7xPV
   g==;
X-CSE-ConnectionGUID: l+z7/K6+RTKMB/m2bRdWmA==
X-CSE-MsgGUID: piTi4p89Rfu4gdQwoNnVqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11524"; a="61523951"
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="61523951"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2025 09:11:37 -0700
X-CSE-ConnectionGUID: TuFVHhY8QwC69x8GRdpclg==
X-CSE-MsgGUID: 2cs05UscQxuFTiszn0qtIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="166563795"
Received: from linux.intel.com ([10.54.29.200])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2025 09:11:36 -0700
Received: from [10.124.223.240] (unknown [10.124.223.240])
	by linux.intel.com (Postfix) with ESMTP id A4C0F20B571C;
	Sun, 17 Aug 2025 09:11:35 -0700 (PDT)
Message-ID: <8491adbd-d8e8-465a-971e-3fe50e2561b1@linux.intel.com>
Date: Sun, 17 Aug 2025 09:11:20 -0700
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
Subject: Re: [PATCH 1/5] PCI/AER: Allow drivers to opt in to Bus Reset on
 Non-Fatal Errors
To: Lukas Wunner <lukas@wunner.de>, Bjorn Helgaas <helgaas@kernel.org>
Cc: Riana Tauro <riana.tauro@intel.com>,
 Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>,
 "Sean C. Dardis" <sean.c.dardis@intel.com>,
 Terry Bowman <terry.bowman@amd.com>, Niklas Schnelle
 <schnelle@linux.ibm.com>, Linas Vepstas <linasvepstas@gmail.com>,
 Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
 Oliver OHalloran <oohall@gmail.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
 linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org
References: <cover.1755008151.git.lukas@wunner.de>
 <28fd805043bb57af390168d05abb30898cf4fc58.1755008151.git.lukas@wunner.de>
Content-Language: en-US
From: Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>
In-Reply-To: <28fd805043bb57af390168d05abb30898cf4fc58.1755008151.git.lukas@wunner.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


On 8/12/25 10:11 PM, Lukas Wunner wrote:
> When Advanced Error Reporting was introduced in September 2006 by commit
> 6c2b374d7485 ("PCI-Express AER implemetation: AER core and aerdriver"), it
> sought to adhere to the recovery flow and callbacks specified in
> Documentation/PCI/pci-error-recovery.rst.
>
> That document had been added in January 2006, when Enhanced Error Handling
> (EEH) was introduced for PowerPC with commit 065c6359071c ("[PATCH] PCI
> Error Recovery: documentation").
>
> However the AER driver deviates from the document in that it never
> performs a Secondary Bus Reset on Non-Fatal Errors, but always on Fatal
> Errors.  By contrast, EEH allows drivers to opt in or out of a Bus Reset
> regardless of error severity, by returning PCI_ERS_RESULT_NEED_RESET or
> PCI_ERS_RESULT_CAN_RECOVER from their ->error_detected() callback.  If all
> drivers agree that they can recover without a Bus Reset, EEH skips it.
> Should one of them request a Bus Reset, it overrides all other drivers.
>
> This inconsistency between EEH and AER seems problematic because drivers
> need to be aware of and cope with it.
>
> The file Documentation/PCI/pcieaer-howto.rst hints at a rationale for
> always performing a Bus Reset on Fatal Errors:  "Fatal errors [...] cause
> the link to be unreliable.  [...] This [reset_link] callback is used to
> reset the PCIe physical link when a fatal error happens.  If an error
> message indicates a fatal error, [...] performing link reset at upstream
> is necessary."
>
> There's no such rationale provided for never performing a Bus Reset on
> Non-Fatal Errors.
>
> The "xe" driver has a need to attempt a reset of local units on graphics
> cards upon a Non-Fatal Error.  If that is insufficient for recovery, the
> driver wants to opt in to a Bus Reset.
>
> Accommodate such use cases and align AER more closely with EEH by
> performing a Bus Reset in pcie_do_recovery() if drivers request it and the
> faulting device's channel_state is pci_channel_io_normal.  The AER driver
> sets this channel_state for Non-Fatal Errors.  For Fatal Errors, it uses
> pci_channel_io_frozen.
>
> This limits the deviation from Documentation/PCI/pci-error-recovery.rst
> and EEH to the unconditional Bus Reset on Fatal Errors.
>
> pcie_do_recovery() is also invoked by the Downstream Port Containment and
> Error Disconnect Recover drivers.  They both set the channel_state to
> pci_channel_io_frozen, hence pcie_do_recovery() continues to always invoke
> the ->reset_subordinates() callback in their case.  That is necessary
> because the callback brings the link back up at the containing Downstream
> Port.
>
> There are two behavioral changes resulting from this commit:
>
> First, if channel_state is pci_channel_io_normal and one of the affected
> drivers returns PCI_ERS_RESULT_NEED_RESET from its ->error_detected()
> callback, a Bus Reset will now be performed.  There are drivers doing this
> and although it would be possible to avoid a behavioral change by letting
> them return PCI_ERS_RESULT_CAN_RECOVER instead, the impression I got from
> examination of all drivers is that they actually expect or want a Bus
> Reset (cxl_error_detected() is a case in point).  In any case, if they can
> cope with a Bus Reset on Fatal Errors, they shouldn't have issues with a
> Bus Reset on Non-Fatal Errors.
>
> Second, if channel_state is pci_channel_io_frozen and all affected drivers
> return PCI_ERS_RESULT_CAN_RECOVER from ->error_detected(), their
> ->mmio_enabled() callback is now invoked prior to performing a Bus Reset,
> instead of afterwards.  This actually makes sense:  For example,
> drivers/scsi/sym53c8xx_2/sym_glue.c dumps debug registers in its
> ->mmio_enabled() callback.  Doing so after reset right now captures the
> post-reset state instead of the faulting state, which is useless.
>
> There is only one other driver which implements ->mmio_enabled() and
> returns PCI_ERS_RESULT_CAN_RECOVER from ->error_detected() for
> channel_state pci_channel_io_frozen, drivers/scsi/ipr.c (IBM Power RAID).
> It appears to only be used on EEH platforms.  So the second behavioral
> change is limited to these two drivers.
>
> Signed-off-by: Lukas Wunner <lukas@wunner.de>
> ---

Reviewed-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>

>   drivers/pci/pcie/err.c | 17 ++++++++++-------
>   1 file changed, 10 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/pci/pcie/err.c b/drivers/pci/pcie/err.c
> index de6381c690f5..e795e5ae6b03 100644
> --- a/drivers/pci/pcie/err.c
> +++ b/drivers/pci/pcie/err.c
> @@ -217,15 +217,10 @@ pci_ers_result_t pcie_do_recovery(struct pci_dev *dev,
>   	pci_walk_bridge(bridge, pci_pm_runtime_get_sync, NULL);
>   
>   	pci_dbg(bridge, "broadcast error_detected message\n");
> -	if (state == pci_channel_io_frozen) {
> +	if (state == pci_channel_io_frozen)
>   		pci_walk_bridge(bridge, report_frozen_detected, &status);
> -		if (reset_subordinates(bridge) != PCI_ERS_RESULT_RECOVERED) {
> -			pci_warn(bridge, "subordinate device reset failed\n");
> -			goto failed;
> -		}
> -	} else {
> +	else
>   		pci_walk_bridge(bridge, report_normal_detected, &status);
> -	}
>   
>   	if (status == PCI_ERS_RESULT_CAN_RECOVER) {
>   		status = PCI_ERS_RESULT_RECOVERED;
> @@ -233,6 +228,14 @@ pci_ers_result_t pcie_do_recovery(struct pci_dev *dev,
>   		pci_walk_bridge(bridge, report_mmio_enabled, &status);
>   	}
>   
> +	if (status == PCI_ERS_RESULT_NEED_RESET ||
> +	    state == pci_channel_io_frozen) {
> +		if (reset_subordinates(bridge) != PCI_ERS_RESULT_RECOVERED) {
> +			pci_warn(bridge, "subordinate device reset failed\n");
> +			goto failed;
> +		}
> +	}
> +
>   	if (status == PCI_ERS_RESULT_NEED_RESET) {
>   		/*
>   		 * TODO: Should call platform-specific

-- 
Sathyanarayanan Kuppuswamy
Linux Kernel Developer


