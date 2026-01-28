Return-Path: <linuxppc-dev+bounces-16371-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +J+iAepAemmr4wEAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16371-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Jan 2026 18:01:30 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B5D9DA679A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Jan 2026 18:01:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f1T7j19Snz2ySS;
	Thu, 29 Jan 2026 04:01:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.19
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769619681;
	cv=none; b=KRjcVyWnwa2fE8TUS8dXFceUxRSqBDmgpJeRIykD/rZ0hHc8ankBM5JHrcgWQyfnW/d1VA4Z/R3LLdrabHIPxuXRCuJGEbV0VlJPP8Mtl+ageq+kXqkbzT0fsRuk3tdsHQYVKAtl6PGxrm9NPvOd25hjBTynqf1uKSs1oWNMvtadg5R+7ofQPPshzRhPDUurVZhNkk62Ksmn/CMFRgPVra8XvawVK5Ctvq7EJzggJHul/5GCcWWBwL8m3vPo5qC6fVaXsG88a72NK2vHwKQzIQBM06VD8OXMa8h9M9Le29lM85M/CG7kSJxy5P0MICLJkEDt0Bbst9vEx/ebMR82IA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769619681; c=relaxed/relaxed;
	bh=lOS7l+8PKfZhYe4XVBunFphhlLD0iT79qHccK6qZF0s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IE3W0DOOSCrMoemQGDJJWKzlJtRTgI7YN4rP4VzpElqEGDrRx/+Ns4iQJ/EK6LyWFAg8Ey4ZOUWvCRsqnFJ/o7sbG5grmTi4Cxp3F7DuGSgwTEI2oG15oKm371FgMGecgumuewIyykekWTOU0iWL34mVwJxkC2gmkk/J7itPrZnQ6eAmTLkowPHJziHFsXO/fj8fzR4wr2J+I2nujcC8Xmj4pWyyhRNiaUEJuEMa2H2Gy0nDkAtTb282PjdPhJjLSYDuMiGyP2lFuieQVRQZAmiwE868Sw9ZUldx5yTO482TLPIA4MyT7XxmLzZDef2Qia8R23E7XAzn9jGitlJAnA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cllkYfCe; dkim-atps=neutral; spf=pass (client-ip=192.198.163.19; helo=mgamail.intel.com; envelope-from=sathyanarayanan.kuppuswamy@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cllkYfCe;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.intel.com (client-ip=192.198.163.19; helo=mgamail.intel.com; envelope-from=sathyanarayanan.kuppuswamy@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f1T7g6nHnz2xgv
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Jan 2026 04:01:19 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769619680; x=1801155680;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=b42Kfhku1yAub1jkIsORkr2G+VtXYCHjFwFhrlH7wTU=;
  b=cllkYfCeQnsE/A797BT+4t1w3axpNMa6KuCfhHJtaShj/yuJcDbixrCX
   xyfZDOAKYoMgnsJr4Aii/RVLk96KbqrH8nMPb7GMDG7DkacQeGgbg3GHQ
   BFswjrQEeDRUFx2ASVp1z02Z6eG+zL197zZQz6GVtkIj4vGGKkKzi0e3p
   xfHFVKXZpDnFotCkBw0PsvNfwrgyWZxB3Nq99OpzK1J/Nhg97jAc9JklN
   CMFw2DQot9IC72elq7tOjJyjeawpo4UvT4UrpIzH2xVFYTOfOctJX5QjY
   y284sMnKKeaFv/0j5eSfbWrcu52tjNxeDxanGsT4ubJMKzMQreT+9+4YA
   Q==;
X-CSE-ConnectionGUID: 4Sljt3zfTv28yEpn3hHz9w==
X-CSE-MsgGUID: eBJZUq1KR5udCfoniIkqpQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="69853372"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="69853372"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2026 09:01:17 -0800
X-CSE-ConnectionGUID: 2B7v17WWSw2Kl8eHEq4ODg==
X-CSE-MsgGUID: NPjSMGlKS0+fE2yCr1mUIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="208341510"
Received: from soc-pf446t5c.clients.intel.com (HELO [10.24.81.126]) ([10.24.81.126])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2026 09:01:17 -0800
Message-ID: <acf0a082-93b3-49a6-a02c-a0b82b83391a@linux.intel.com>
Date: Wed, 28 Jan 2026 09:01:16 -0800
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
Subject: Re: [PATCH v7 5/5] PCI/AER: Only clear error bits in
 pcie_clear_device_status()
To: Shuai Xue <xueshuai@linux.alibaba.com>, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 bhelgaas@google.com, kbusch@kernel.org
Cc: mahesh@linux.ibm.com, oohall@gmail.com, Jonathan.Cameron@huawei.com,
 terry.bowman@amd.com, tianruidong@linux.alibaba.com, lukas@wunner.de
References: <20260124074557.73961-1-xueshuai@linux.alibaba.com>
 <20260124074557.73961-6-xueshuai@linux.alibaba.com>
Content-Language: en-US
From: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
In-Reply-To: <20260124074557.73961-6-xueshuai@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.21 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:xueshuai@linux.alibaba.com,m:linux-pci@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:bhelgaas@google.com,m:kbusch@kernel.org,m:mahesh@linux.ibm.com,m:oohall@gmail.com,m:Jonathan.Cameron@huawei.com,m:terry.bowman@amd.com,m:tianruidong@linux.alibaba.com,m:lukas@wunner.de,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER(0.00)[sathyanarayanan.kuppuswamy@linux.intel.com,linuxppc-dev@lists.ozlabs.org];
	ASN_FAIL(0.00)[117.38.213.112.asn.rspamd.com:query timed out];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-16371-lists,linuxppc-dev=lfdr.de];
	DKIM_TRACE(0.00)[intel.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sathyanarayanan.kuppuswamy@linux.intel.com,linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[linux.ibm.com,gmail.com,huawei.com,amd.com,linux.alibaba.com,wunner.de];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RSPAMD_EMAILBL_FAIL(0.00)[xueshuai.linux.alibaba.com:server fail];
	DBL_BLOCKED_OPENRESOLVER(0.00)[alibaba.com:email,wunner.de:email,intel.com:email,intel.com:dkim,linux.intel.com:mid,lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: B5D9DA679A
X-Rspamd-Action: no action



On 1/23/2026 11:45 PM, Shuai Xue wrote:
> Currently, pcie_clear_device_status() clears the entire PCIe Device
> Status register (PCI_EXP_DEVSTA), which includes both error status bits
> and other status bits such as AUX Power Detected (AUXPD) and
> Transactions Pending (TRPND).
> 
> Clearing non-error status bits can interfere with other drivers or
> subsystems that may rely on these bits. To fix it, only clear the error
> bits (0xf) while preserving other status bits.
> 
> Fixes: ec752f5d54d7 ("PCI/AER: Clear device status bits during ERR_FATAL and ERR_NONFATAL")
> Cc: stable@vger.kernel.org
> Suggested-by: Lukas Wunner <lukas@wunner.de>
> Signed-off-by: Shuai Xue <xueshuai@linux.alibaba.com>
> ---

Reviewed-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>


>  drivers/pci/pci.c             | 2 +-
>  include/uapi/linux/pci_regs.h | 1 +
>  2 files changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
> index 13dbb405dc31..0b947f90c333 100644
> --- a/drivers/pci/pci.c
> +++ b/drivers/pci/pci.c
> @@ -2246,7 +2246,7 @@ void pcie_clear_device_status(struct pci_dev *dev)
>  	u16 sta;
>  
>  	pcie_capability_read_word(dev, PCI_EXP_DEVSTA, &sta);
> -	pcie_capability_write_word(dev, PCI_EXP_DEVSTA, sta);
> +	pcie_capability_write_word(dev, PCI_EXP_DEVSTA, sta & PCI_EXP_DEVSTA_ERR);
>  }
>  #endif
>  
> diff --git a/include/uapi/linux/pci_regs.h b/include/uapi/linux/pci_regs.h
> index 3add74ae2594..f4b68203bc4e 100644
> --- a/include/uapi/linux/pci_regs.h
> +++ b/include/uapi/linux/pci_regs.h
> @@ -534,6 +534,7 @@
>  #define  PCI_EXP_DEVSTA_NFED	0x0002	/* Non-Fatal Error Detected */
>  #define  PCI_EXP_DEVSTA_FED	0x0004	/* Fatal Error Detected */
>  #define  PCI_EXP_DEVSTA_URD	0x0008	/* Unsupported Request Detected */
> +#define  PCI_EXP_DEVSTA_ERR	0xf	/* Error bits */

To align with other macros, use 0x000F?

>  #define  PCI_EXP_DEVSTA_AUXPD	0x0010	/* AUX Power Detected */
>  #define  PCI_EXP_DEVSTA_TRPND	0x0020	/* Transactions Pending */
>  #define PCI_CAP_EXP_RC_ENDPOINT_SIZEOF_V1	12	/* v1 endpoints without link end here */

-- 
Sathyanarayanan Kuppuswamy
Linux Kernel Developer


