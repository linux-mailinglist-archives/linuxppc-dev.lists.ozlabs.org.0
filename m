Return-Path: <linuxppc-dev+bounces-10963-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 68E2EB25731
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Aug 2025 01:05:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c2P946QYQz30TM;
	Thu, 14 Aug 2025 09:05:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.18
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755126312;
	cv=none; b=IJ8+JS2PGPZSJ09jjNc2Csm/ByC9CjGWUQ/FuU4nymqRQ5iJ1cf4Jb5Rkz4ILSVh6sfLCVfMczABV4BkYjcxfe4VByb3XClreQxE+LcPLBguVucd/fYMdA52nI+KZlzDn+0LYWk8q9EO+XHnmiMRCtX54I15rpracxlgo8YTkn67/1Mv3Vlu/f3nmZeM3RW71XSH2eYmBXVeh1Z1Ap/dbg5BgKBM6z8EepXf3GnqBHS5ibkzyrN5XPrM09OV4M4UdDon8rz1ZsrBfgjhXk679qRnYhVclBb4bZY9zWdGQWBqIfPM5zFXMX8QoET29O6MzWLXY9Ax0w3s5edMtr61wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755126312; c=relaxed/relaxed;
	bh=l2aiI2FtHlT7+UCVea/z2cYgVNmMSL2oEEAjyg0RsP4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gngo+N1WEbmaFYvfxuudPPRCKWvN5EoPxJf/sIycZap+Arnk84sdRc4JOnUdjcC7nsIWUHG2yzJy/jjWyILVXuXkul61J9h/nZ915MdlCY9gudkgxYBmVyWFMwWs3j//oSbLoViEHvWvAE1ufTMd5VHjXoEdoCcCZmO4ofTo2sTpRxTdEGYQjeBBroqQgith6s9akcaLvpWp2gSSIM2TROs51MlatJVFRtA23SrCyPq3MSN5yT8xw8YGWUiW+Nxq7BWZ33dgX1mXRVSjCV6NYQAXTXWVuipjvjmtNYsZjm7mVZ1RoN0arHql9nq1bdZfQl/FGTLX+BJKOcYLp+jidw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Iy4jnt1h; dkim-atps=neutral; spf=none (client-ip=198.175.65.18; helo=mgamail.intel.com; envelope-from=sathyanarayanan.kuppuswamy@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Iy4jnt1h;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.18; helo=mgamail.intel.com; envelope-from=sathyanarayanan.kuppuswamy@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c2P9400b1z30Sy
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Aug 2025 09:05:11 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755126312; x=1786662312;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=af2+KlDj0FItWaW81qBzp26/u+4WmaVEH6tIL/ZZkSo=;
  b=Iy4jnt1hS4RNk06PMi2zrrTpz1c/wLRLddW6ZqronWDXa9XmTO8cb5EV
   /5btAqP4IFg99YWAH6fBpcU827aVkIELCG+LQ2Fi9hyRyGA/rfj8Ip3DP
   gTCfipEiVoceVNFPWKAaCmLZEN/I0RUWf/nPsLBCNdGc9kXxOcRNSZ5qO
   g3I8ajAqGPG74Pg+1zyo7hDReozSKMlUQmAC8qtG/LDtXns85g2a1Jzqz
   fMcj2s73+g4ytVZ33WEQmtxFY6NaSWTX+mBhsVDZmEazJtbIDJckh1tIF
   5K2zezQAUo9Ni4b09CcDhbO8hG6d4kICcTYOn6ep3lNCoI0TbFlgw0AJX
   g==;
X-CSE-ConnectionGUID: qdHrRAgoSMCEnjYNP0njwQ==
X-CSE-MsgGUID: wW/R7LKESymSinBMtLwffg==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="57515387"
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; 
   d="scan'208";a="57515387"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2025 16:05:07 -0700
X-CSE-ConnectionGUID: CTU1+4FHTLihCfthokJ0jg==
X-CSE-MsgGUID: LFytUysMRLCmbqBI/wZ6JQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; 
   d="scan'208";a="170736148"
Received: from linux.intel.com ([10.54.29.200])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2025 16:05:06 -0700
Received: from [10.124.222.231] (unknown [10.124.222.231])
	by linux.intel.com (Postfix) with ESMTP id B97FC20B5720;
	Wed, 13 Aug 2025 16:05:05 -0700 (PDT)
Message-ID: <fa9f42ab-bced-4c7f-9977-c0b611e92e2e@linux.intel.com>
Date: Wed, 13 Aug 2025 16:05:00 -0700
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
Subject: Re: [PATCH 3/5] PCI/ERR: Notify drivers on failure to recover
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
 <ec212d4d4f5c65d29349df33acdc9768ff8279d1.1755008151.git.lukas@wunner.de>
Content-Language: en-US
From: Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>
In-Reply-To: <ec212d4d4f5c65d29349df33acdc9768ff8279d1.1755008151.git.lukas@wunner.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


On 8/12/25 10:11 PM, Lukas Wunner wrote:
> According to Documentation/PCI/pci-error-recovery.rst, the following shall
> occur on failure to recover from a PCIe Uncorrectable Error:
>
>    STEP 6: Permanent Failure
>    -------------------------
>    A "permanent failure" has occurred, and the platform cannot recover
>    the device.  The platform will call error_detected() with a
>    pci_channel_state_t value of pci_channel_io_perm_failure.
>
>    The device driver should, at this point, assume the worst. It should
>    cancel all pending I/O, refuse all new I/O, returning -EIO to
>    higher layers. The device driver should then clean up all of its
>    memory and remove itself from kernel operations, much as it would
>    during system shutdown.
>
> Sathya notes that AER does not call error_detected() on failure and thus
> deviates from the document (as well as EEH, for which the document was
> originally added).
>
> Most drivers do nothing on permanent failure, but the SCSI drivers and a
> number of Ethernet drivers do take advantage of the notification to flush
> queues and give up resources.
>
> Amend AER to notify such drivers and align with the documentation and EEH.
>
> Link: https://lore.kernel.org/r/f496fc0f-64d7-46a4-8562-dba74e31a956@linux.intel.com/
> Suggested-by: Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>
> Signed-off-by: Lukas Wunner <lukas@wunner.de>
> ---

Reviewed-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>

>   drivers/pci/pcie/err.c | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
>
> diff --git a/drivers/pci/pcie/err.c b/drivers/pci/pcie/err.c
> index 21d554359fb1..930bb60fb761 100644
> --- a/drivers/pci/pcie/err.c
> +++ b/drivers/pci/pcie/err.c
> @@ -110,7 +110,19 @@ static int report_normal_detected(struct pci_dev *dev, void *data)
>   
>   static int report_perm_failure_detected(struct pci_dev *dev, void *data)
>   {
> +	struct pci_driver *pdrv;
> +	const struct pci_error_handlers *err_handler;
> +
> +	device_lock(&dev->dev);
> +	pdrv = dev->driver;
> +	if (!pdrv || !pdrv->err_handler || !pdrv->err_handler->error_detected)
> +		goto out;
> +
> +	err_handler = pdrv->err_handler;
> +	err_handler->error_detected(dev, pci_channel_io_perm_failure);
> +out:
>   	pci_uevent_ers(dev, PCI_ERS_RESULT_DISCONNECT);
> +	device_unlock(&dev->dev);
>   	return 0;
>   }
>   

-- 
Sathyanarayanan Kuppuswamy
Linux Kernel Developer


