Return-Path: <linuxppc-dev+bounces-11037-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B771B26FAD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Aug 2025 21:29:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c2wKw3ymWz3bTf;
	Fri, 15 Aug 2025 05:29:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.8
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755199780;
	cv=none; b=HnoT+6N7HjiuRkazlM2GWqgw6/Vn8qBO9ivdIsX5Z5SXMLqM+uoe+6Nyua/WC7THC0ExSnQQr3yh5+w84gREt0XjOxQNLJ8LPYz+gZ2Wi/W/I4RrrtLipxMRobjIoqyFDIGg46UiGUVeO3xPJDBu12wUhLTlXlNEnxFPiJc1TDCxgwHuoFM/u/jLGVFKG5jRs8brTwqtgadLPBGYUn+vNlQeztPumhCESmOUf0t8/H5M6a2nqpdrk9qxVLXqJXreXUBFOg/a14qG+ZqxGvIxKnJvFWCXYZb5xqgWYuETUwAeai8Mc145YJkbVCeKSDEoYPg8iNRVSGiknvYEkJqvEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755199780; c=relaxed/relaxed;
	bh=MJ0LWiov42gFKU6cKchdyGz/VlTSQJHWGZwbQtWT61s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PQ+wIR3zK69oiTmTfhyCjqbLE31P3xTqr7RPhhzSXgAFAs6hZ1148iBu2B+DRtNI5U8okCRgap5IT3vjFbq7KxH9x/iz2N+vlX+b0Tqk/ZupLPy1QEXADfKdu/GZwEaDGCXyieaztOvOziIgcUWUYETIlVsulK9BCOzICCiX1+DSSBrMEW9i4rxo5SiKnDqv73PlxwMf905BbhcgFOvxJ8Whm8Y6TDf2Uu6w1eBVbzA9dbAgWlfpj8fZf9l2VmrJo+96DqjBFubPejrSyZQRicKJv6duviSHqfbasjFxORTc5fk4t/sckUvineGBKeiSJCq+sZsO/4P9+roofhN0tw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=E9Vw2ckd; dkim-atps=neutral; spf=none (client-ip=192.198.163.8; helo=mgamail.intel.com; envelope-from=sathyanarayanan.kuppuswamy@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=E9Vw2ckd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.198.163.8; helo=mgamail.intel.com; envelope-from=sathyanarayanan.kuppuswamy@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c2wKt0Cjmz30Yb
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Aug 2025 05:29:36 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755199778; x=1786735778;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=C722KyueZgnml44yiZSKGL6Emhwa8sk1grG/A7G7Xiw=;
  b=E9Vw2ckdtrqHWpQLJf+rRhAgYamqigralojPQLrfSf4orQyke4MRzwyj
   GOKdOIymkXoAbOacztV2dJqxKSgyFrZ5Jz2CL7orkA3nRVITmUrLCtF5e
   8x/G5SZFFh/lVz2vr0whtnMRP8D153c9OUKDCo+XguttO/oUB4YW6ID2W
   1Ob7aIkd9r+hAMlnNdUNupq5VEq7kVZe+2qPqC2fOKo8PccANX8rbJ3ke
   X+4H9ct/NX/fXAWNh4b66rfd9UsqEhLe0hbk9o0HJ7y4rUV5veYMgieDZ
   gQ8n/ySgsQeL+QSv5xqR7UEKuQv0yIntKbqAoFfx50Iw9lcx3FDUuBPZe
   w==;
X-CSE-ConnectionGUID: DTKDZ+lSSnGiWyo6RwnQ7g==
X-CSE-MsgGUID: Z7MTZV1jTGCdqpBMi7k8Uw==
X-IronPort-AV: E=McAfee;i="6800,10657,11522"; a="75096425"
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; 
   d="scan'208";a="75096425"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2025 12:29:34 -0700
X-CSE-ConnectionGUID: vx0X23xmR8+w93glgb0cww==
X-CSE-MsgGUID: C81WM5VmTFmlpBHRfeABtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; 
   d="scan'208";a="166055654"
Received: from linux.intel.com ([10.54.29.200])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2025 12:29:34 -0700
Received: from [10.124.223.17] (unknown [10.124.223.17])
	by linux.intel.com (Postfix) with ESMTP id E9B1420B571C;
	Thu, 14 Aug 2025 12:29:32 -0700 (PDT)
Message-ID: <eec85830-e024-4801-bbc8-5cfa60048932@linux.intel.com>
Date: Thu, 14 Aug 2025 12:29:25 -0700
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
To: Lukas Wunner <lukas@wunner.de>, Niklas Schnelle <schnelle@linux.ibm.com>
Cc: Bjorn Helgaas <helgaas@kernel.org>, Riana Tauro <riana.tauro@intel.com>,
 Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>,
 "Sean C. Dardis" <sean.c.dardis@intel.com>,
 Terry Bowman <terry.bowman@amd.com>, Linas Vepstas <linasvepstas@gmail.com>,
 Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
 Oliver OHalloran <oohall@gmail.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
 linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org
References: <cover.1755008151.git.lukas@wunner.de>
 <28fd805043bb57af390168d05abb30898cf4fc58.1755008151.git.lukas@wunner.de>
 <7c545fff40629b612267501c0c74bc40c3df29e2.camel@linux.ibm.com>
 <aJ2uE6v46Zib30Jh@wunner.de>
Content-Language: en-US
From: Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>
In-Reply-To: <aJ2uE6v46Zib30Jh@wunner.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


On 8/14/25 2:36 AM, Lukas Wunner wrote:
> On Thu, Aug 14, 2025 at 09:56:09AM +0200, Niklas Schnelle wrote:
>> On Wed, 2025-08-13 at 07:11 +0200, Lukas Wunner wrote:
>>> +++ b/drivers/pci/pcie/err.c
>>> @@ -217,15 +217,10 @@ pci_ers_result_t pcie_do_recovery(struct pci_dev *dev,
>>>   	pci_walk_bridge(bridge, pci_pm_runtime_get_sync, NULL);
>>>   
>>>   	pci_dbg(bridge, "broadcast error_detected message\n");
>>> -	if (state == pci_channel_io_frozen) {
>>> +	if (state == pci_channel_io_frozen)
>>>   		pci_walk_bridge(bridge, report_frozen_detected, &status);
>>> -		if (reset_subordinates(bridge) != PCI_ERS_RESULT_RECOVERED) {
>>> -			pci_warn(bridge, "subordinate device reset failed\n");
>>> -			goto failed;
>>> -		}
>>> -	} else {
>>> +	else
>>>   		pci_walk_bridge(bridge, report_normal_detected, &status);
>>> -	}
>>>   
>>>   	if (status == PCI_ERS_RESULT_CAN_RECOVER) {
>>>   		status = PCI_ERS_RESULT_RECOVERED;
>> On s390 PCI errors leave the device with MMIO blocked until either the
>> error state is cleared or we reset via the firmware interface. With
>> this change and the pci_channel_io_frozen case AER would now do the
>> report_mmio_enabled() before the reset with nothing happening between
>> report_frozen_detected() and report_mmio_enabled() is MMIO enabled at
>> this point?
> Yes, MMIO access is controlled through the Memory Space Enable and
> Bus Master Enable bits in the Command Register (PCIe r7.0 sec 7.5.1.1.3).
> Drivers generally set those bits on probe and they're not automatically
> cleared by hardware upon an Uncorrectable Error.
>
> EEH and s390 blocking MMIO access likely serves the purpose of preventing
> corrupted data being propagated upstream.  AER doesn't support that
> (or at least doesn't mandate that -- certain implementations might
> be capable of blocking poisoned data).
>
> Thus with AER, MMIO access is usually possible already in ->error_detected().
> The only reason why drivers shouldn't be doing that and instead defer
> MMIO access to ->mmio_enabled() is to be compatible with EEH and s390.
>
> There are exceptions to this rule:  E.g. if the Uncorrectable Error
> was "Surprise Down", the link to the device is down and MMIO access
> isn't possible, neither in ->error_detected() nor ->mmio_enabled().
> Drivers should check whether an MMIO read results in an "all ones"
> response (PCI_POSSIBLE_ERROR()), which is usually what the host bridge
> fabricates upon a Completion Timeout caused by the link being down
> and the Endpoint being inaccessible.
>
> (There's a list of all the errors with default severity etc in PCIe r7.0
> sec 6.2.7.)
>
> I believe DPC was added to the PCIe Base Specification to prevent
> propagating corrupted data upstream, similarly to EEH and s390.
> DPC brings down the link immediately upon an Uncorrectable Error
> (the Linux driver confines this to Fatal Errors), but as a side
> effect this results in a Hot Reset being propagated down the
> hierarchy, making it impossible to access the device in the
> faulting state to retrieve debug information etc.  After the link
> has been brought up again, the device is in post-reset state.
> So DPC doesn't allow for reset-less recovery.
>
> With the ordering change introduced by this commit, ->mmio_enabled()
> will no longer be able to access MMIO space in the DPC case because
> the link hasn't been brought back up until ->slot_reset().  But as
> explained in the commit message, I only found two drivers affected
> by this.  One seems to be EEH-specific (drivers/scsi/ipr.c).
> And the other one (drivers/scsi/sym53c8xx_2/sym_glue.c) dumps debug
> registers in ->mmio_enabled() and I'm arguing that with this commit
> it's dumping "all ones", but right now it's dumping the post-reset
> state of the device, which isn't any more useful.
>
>> I think this callback really only makes sense if you have
>> an equivalent to s390's clearing of the error state that enables MMIO
>> but doesn't otherwise reset. Similarly EEH has eeh_pci_enable(pe,
>> EEH_OPT_THAW_MMIO).
> Right.
>
>>> @@ -233,6 +228,14 @@ pci_ers_result_t pcie_do_recovery(struct pci_dev *dev,
>>>   		pci_walk_bridge(bridge, report_mmio_enabled, &status);
>>>   	}
>>>   
>>> +	if (status == PCI_ERS_RESULT_NEED_RESET ||
>>> +	    state == pci_channel_io_frozen) {
>>> +		if (reset_subordinates(bridge) != PCI_ERS_RESULT_RECOVERED) {
>>> +			pci_warn(bridge, "subordinate device reset failed\n");
>>> +			goto failed;
>>> +		}
>>> +	}
>>> +
>>>   	if (status == PCI_ERS_RESULT_NEED_RESET) {
>>>   		/*
>>>   		 * TODO: Should call platform-specific
>> I wonder if it might make sense to merge the reset into the above
>> existing if.
> There are drivers such as drivers/bus/mhi/host/pci_generic.c which
> return PCI_ERS_RESULT_RECOVERED from ->error_detected().  So they
> fall through directly to the ->resume() stage.  They're doing this
> even in the pci_channel_io_frozen case (i.e. for Fatal Errors).
>
> But for DPC we must call reset_subordinates() to bring the link back up.
> And for Fatal Errors, Documentation/PCI/pcieaer-howto.rst suggests that
> we must likewise call it because the link may be unreliable.

For fatal errors, since we already ignore the value returned by
->error_detected() (by calling reset_subordinates() unconditionally), why
not update status accordingly in report_frozen_detected() and notify the
driver about the reset?

That way, the reset logic could be unified under a single if
(status == PCI_ERS_RESULT_NEED_RESET) condition.

Checking the drivers/bus/mhi/host/pci_generic.c implementation, it looks
like calling slot_reset callback looks harmless.
>
> Hence the if-condition must use a boolean OR, i.e.:
>
> 	if (status == PCI_ERS_RESULT_NEED_RESET ||
> 	    state == pci_channel_io_frozen) {
>
> ... whereas if I would move the invocation of reset_subordinates() inside
> the existing "if (status == PCI_ERS_RESULT_NEED_RESET)", it would be
> equivalent to a boolean AND.
>
> I would have to amend drivers such as drivers/bus/mhi/host/pci_generic.c
> to work with the changed logic and I figured that it's simpler to only
> change pcie_do_recovery() rather than touching all affected drivers.
> I don't have any of that hardware and so it seems risky touching all
> those drivers.
>
>> I'm a bit confused by that TODO comment and
>> anyway, it asks for a platform-specific reset to be added bu
>> reset_subordinate() already seems to allow platform specific behavior,
>> so maybe the moved reset should replace the TODO?
> Manivannan has a patch pending which removes the TODO:
>
> https://lore.kernel.org/all/20250715-pci-port-reset-v6-1-6f9cce94e7bb@oss.qualcomm.com/
>
>> Also I think for the
>> kind of broken case where the state is pci_channel_io_frozen but the
>> drivers just reports PCI_ERS_RESULT_CAN_RECOVER it looks like there
>> would be a reset but no calls to ->slot_reset().
> Right, but that's what AER is currently doing and drivers such as
> drivers/bus/mhi/host/pci_generic.c are written to work with the
> existing flow.
>
> Thanks,
>
> Lukas
>
-- 
Sathyanarayanan Kuppuswamy
Linux Kernel Developer


