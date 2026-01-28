Return-Path: <linuxppc-dev+bounces-16369-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CBVBJFxAemm14wEAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16369-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Jan 2026 17:59:08 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DE94A66CC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Jan 2026 17:59:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f1T546pGNz2xpg;
	Thu, 29 Jan 2026 03:59:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769619544;
	cv=none; b=liNqlyK4ZSt6NRzcutFGUUH93aBsg+dKha/7zn924SKzzZYMHJLnjTvT1yXTe25zLfq+NobirREwvPUT3oVOA+00SerRds6y9POWk/mg42zfqnVXb1JrRgPrNk7SNJpYHIY0tl6rBE/VSImV1WLw5HsS0sBhG5LpcR8u4qKBljAnYfpPyfF46CPZBQLcrsB7LuCwutFWVbHjmVdAjc4Ezhsiilo2HrEoT7zQHjehuB2ZdYifGP0OMNwUabwnNf0bA1yWzXnwUgH7ltBbtjJnBy298F6UspixmkjJmF9PYN0JENHwfpjGGjTeLbWlOfVhtt1YY8xxq2U9LcRPh3U+dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769619544; c=relaxed/relaxed;
	bh=3GI7Hnlo9tD5UoBmqHIIESrY3FeVdBtOoymNBTRCgg8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lcOyisNT4VSgypNNCuafb5E4xrxCoszCG6nYYl3cwhN7Bz2Ka0Z5EV01ijgHVS5b+LCj23xAbjL6BABofdHCX+OKnD19Q+qpHXvqthANoCvC88bWkQzcoAksPXeAfuixl3OXr1ha1nngoAzPtNHeOr/KthOFGV+vaRPyLQFRSFJvs4w0zorm7DKB0mo6hnLvq78JjPnx+sV4N47WSMq6YtHEbAEnRiopEe2pC0yzvWqtyNpeCPA8MZDuJoDki2dUAzWN0VBCNlH+4FVMBu3KDWOQf37uINBmtSd+Sq4m0a/cpBTApsK/Q/eChVAu7G7QVlrUkIwy9AQ/9ndZAXtwqA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mjKyEe2K; dkim-atps=neutral; spf=pass (client-ip=198.175.65.10; helo=mgamail.intel.com; envelope-from=sathyanarayanan.kuppuswamy@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mjKyEe2K;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.10; helo=mgamail.intel.com; envelope-from=sathyanarayanan.kuppuswamy@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f1T534fTKz2xgv
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Jan 2026 03:59:03 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769619544; x=1801155544;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=bnHXPMPNgHRvQiG4GLdo6odlzdOHxKJIHAHU+qCgXrA=;
  b=mjKyEe2KZK0Vvge48WsbUNWp14/rppXskOOgA6XTrSDB44+8opJoR7cP
   nYsCTTJlJ4KKjMsXTBiO1ise/n/SvdS7lM6VQkI0wfKeJnTrS+mipKJP6
   ySgR9nHqyDiej0ZYo956ACh8VBk0YAVVGSJyhZUSjHB0Udv9WEVVgIW4h
   W7CrzKdqLDyKG66VKPEKztwvAArr31s5VI5IoNuvXncmILnFuZo9F7Gts
   TK9mhd3ZCU9HE2KeJ7WfqoiDOc9FVaTEgxcBvnAxRwgtwDNU5DRWFpCy9
   o4rzMe/R/hBMbfECydm6gpbmGf3xO/VtZKPqSuKvizL7fRi31IHHvgwif
   g==;
X-CSE-ConnectionGUID: 4vlhxrIoQTyXe49yqRO3Kg==
X-CSE-MsgGUID: 7Ngr2t2dTOOHAU34nDlLIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="88257699"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="88257699"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2026 08:59:01 -0800
X-CSE-ConnectionGUID: S6k9xmHPR7qDkRvMokBb7Q==
X-CSE-MsgGUID: MijA/aemRcKq3WeA4g3K1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="208225520"
Received: from soc-pf446t5c.clients.intel.com (HELO [10.24.81.126]) ([10.24.81.126])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2026 08:59:00 -0800
Message-ID: <f98c4da6-502a-4d9c-8df7-8db3b3ea5d15@linux.intel.com>
Date: Wed, 28 Jan 2026 08:58:59 -0800
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
Subject: Re: [PATCH v7 4/5] PCI/AER: Clear both AER fatal and non-fatal status
To: Shuai Xue <xueshuai@linux.alibaba.com>, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 bhelgaas@google.com, kbusch@kernel.org
Cc: mahesh@linux.ibm.com, oohall@gmail.com, Jonathan.Cameron@huawei.com,
 terry.bowman@amd.com, tianruidong@linux.alibaba.com, lukas@wunner.de
References: <20260124074557.73961-1-xueshuai@linux.alibaba.com>
 <20260124074557.73961-5-xueshuai@linux.alibaba.com>
Content-Language: en-US
From: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
In-Reply-To: <20260124074557.73961-5-xueshuai@linux.alibaba.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-16369-lists,linuxppc-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[sathyanarayanan.kuppuswamy@linux.intel.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS(0.00)[m:xueshuai@linux.alibaba.com,m:linux-pci@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:bhelgaas@google.com,m:kbusch@kernel.org,m:mahesh@linux.ibm.com,m:oohall@gmail.com,m:Jonathan.Cameron@huawei.com,m:terry.bowman@amd.com,m:tianruidong@linux.alibaba.com,m:lukas@wunner.de,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[linux.ibm.com,gmail.com,huawei.com,amd.com,linux.alibaba.com,wunner.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sathyanarayanan.kuppuswamy@linux.intel.com,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.intel.com:mid,alibaba.com:email,lists.ozlabs.org:helo,lists.ozlabs.org:rdns,intel.com:email,intel.com:dkim]
X-Rspamd-Queue-Id: 8DE94A66CC
X-Rspamd-Action: no action



On 1/23/2026 11:45 PM, Shuai Xue wrote:
> The DPC driver clears AER fatal status for the port that reported the
> error, but not for the downstream device that deteced the error.  The
> current recovery code only clears non-fatal AER status, leaving fatal
> status bits set in the error device.
> 
> Use pci_aer_raw_clear_status() to clear both fatal and non-fatal error
> status in the error device, ensuring all AER status bits are properly
> cleared after recovery.
> 
> Fixes: aa344bc8b727 ("PCI/ERR: Clear AER status only when we control AER")
> Cc: stable@vger.kernel.org
> Signed-off-by: Shuai Xue <xueshuai@linux.alibaba.com>
> ---

Reviewed-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>


>  drivers/pci/pcie/err.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/pcie/err.c b/drivers/pci/pcie/err.c
> index 0780ea09478b..5e463efc3d05 100644
> --- a/drivers/pci/pcie/err.c
> +++ b/drivers/pci/pcie/err.c
> @@ -285,7 +285,7 @@ pci_ers_result_t pcie_do_recovery(struct pci_dev *dev,
>  	 */
>  	if (host->native_aer || pcie_ports_native) {
>  		pcie_clear_device_status(dev);
> -		pci_aer_clear_nonfatal_status(dev);
> +		pci_aer_raw_clear_status(dev);
>  	}
>  
>  	pci_walk_bridge(bridge, pci_pm_runtime_put, NULL);

-- 
Sathyanarayanan Kuppuswamy
Linux Kernel Developer


