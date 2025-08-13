Return-Path: <linuxppc-dev+bounces-10962-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 27109B25726
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Aug 2025 01:01:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c2P5F6ntcz30Vs;
	Thu, 14 Aug 2025 09:01:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.19
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755126113;
	cv=none; b=nfmmRmpJ9vy3Ueq+oUCtG12TewSI63viCxc3vpo5brZMkTl0P9bhYEiR0guiidnWHukeAhgUgGGtKQ5ISMbKFY4ijdHADLXPWs05CNPewMZUbkvhLlcDf/t/h60wOrS6G6MJKFENBLycqLa/y1kBbikWjV7MgBkNrHhKphq9FApkGwB9dHj3wgffySNbDrTa2+t2Y0GqhuGV/gyw5DsusWi6JzijeOMOUpjO2Kd6Ee4hUKTa0Oej8KFfRN5uAjiHkCUUzbfMTTPK4BQy6WuFXiiEsY2tYgr2aADjAftgi8tkN7cwArYcDhSZ+H3IqoN2P919LmFjFJQVMtfLFlp4nA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755126113; c=relaxed/relaxed;
	bh=l/3UtxYLRWFM02FG5PW7HRn6UPr+bI2M5olz2uI3wYA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hyP5vYlfUDduibT1ygLUOD5t1DlEf1qoEv5txLBXWtW2f0/lwk3IB/LItNdLZkx8TMIKFAcheV+9nKLFQK367ULQfBHF/Mn6Ounrsw4w2BgNUoNC7Z6y3aTmtCkGg536l2JY7XB8TxbfSMm4o7x9fb1t/3HooTHW/An1znmuKI6jGUvfbcbYOi1kskJzMSpzVxmDzSESw8kCz6cF0d9iuvhayUOt8/1FuE6WglZAhvsACDACkxF7o5yi7Siom8OpxIMEbNdZdCbk8TOWvHbiES80MKG95Wvws2OCqVzd1u+GrlZkPBqsbJ53wc9M2bdcairxqeY/ELuWa7+X//Ntjw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VIo+YGHb; dkim-atps=neutral; spf=none (client-ip=198.175.65.19; helo=mgamail.intel.com; envelope-from=sathyanarayanan.kuppuswamy@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VIo+YGHb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.19; helo=mgamail.intel.com; envelope-from=sathyanarayanan.kuppuswamy@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c2P5D6sz8z30Vr
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Aug 2025 09:01:52 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755126113; x=1786662113;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=W2L9yzRV2c5O9B7IEtrjF8WUFbxs5s8QKfHx3/oiOIQ=;
  b=VIo+YGHbMtdDRbuJ54NUAoXXtILlcY2vrMu5s1sQ++zHhaik2o3nb4Ym
   fosW+HzkwQWixxZukbHgpt87wUi4GWBeDoVHeImAFeYA34eRM+skCxlkX
   y6BTs7ULL2ipLJD8m3e+Ct0TSHTyaaDWaJdMvc6yN79wQJij3tP1SLF6Q
   M7O3U62vzgD9/TrrFZF+4XdpF4QfWEr7mygHWXPV4UDN0By7AMTyLWY86
   3PFjbZGEARM1RpXd8K/ffDO48bIFXYCvzaltGAS5wPVkzeMWgLya3K1VY
   3SAxN/noeL6qW+8jB7HDDZAVwwzJDlchlWXpzO1S0y2EKa/6fHu5VXbvf
   w==;
X-CSE-ConnectionGUID: 37kmdqnsTM66KhGVdSP+IQ==
X-CSE-MsgGUID: /7oZ3qFcR9mPW9tcaV85Bg==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="57304153"
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; 
   d="scan'208";a="57304153"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2025 16:01:51 -0700
X-CSE-ConnectionGUID: sl5NCfc+T2iQoqPkdGLMHQ==
X-CSE-MsgGUID: vjLDRcRHTk2RnazkJtkl1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; 
   d="scan'208";a="166245339"
Received: from linux.intel.com ([10.54.29.200])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2025 16:01:50 -0700
Received: from [10.124.222.231] (unknown [10.124.222.231])
	by linux.intel.com (Postfix) with ESMTP id EE6C020B571C;
	Wed, 13 Aug 2025 16:01:48 -0700 (PDT)
Message-ID: <f0b59604-ae4d-4afe-8522-a8fbe5568e96@linux.intel.com>
Date: Wed, 13 Aug 2025 16:01:43 -0700
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
Subject: Re: [PATCH 2/5] PCI/ERR: Fix uevent on failure to recover
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
 <68fc527a380821b5d861dd554d2ce42cb739591c.1755008151.git.lukas@wunner.de>
Content-Language: en-US
From: Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>
In-Reply-To: <68fc527a380821b5d861dd554d2ce42cb739591c.1755008151.git.lukas@wunner.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


On 8/12/25 10:11 PM, Lukas Wunner wrote:
> Upon failure to recover from a PCIe error through AER, DPC or EDR, a
> uevent is sent to inform user space about disconnection of the bridge
> whose subordinate devices failed to recover.
>
> However the bridge itself is not disconnected.  Instead, a uevent should
> be sent for each of the subordinate devices.
>
> Only if the "bridge" happens to be a Root Complex Event Collector or
> Integrated Endpoint does it make sense to send a uevent for it (because
> there are no subordinate devices).
>
> Right now if there is a mix of subordinate devices with and without
> pci_error_handlers, a BEGIN_RECOVERY event is sent for those with
> pci_error_handlers but no FAILED_RECOVERY event is ever sent for them
> afterwards.  Fix it.
>
> Fixes: 856e1eb9bdd4 ("PCI/AER: Add uevents in AER and EEH error/resume")
> Signed-off-by: Lukas Wunner <lukas@wunner.de>
> Cc: stable@vger.kernel.org  # v4.16+
> ---

Reviewed-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>

>   drivers/pci/pcie/err.c | 8 +++++++-
>   1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/pci/pcie/err.c b/drivers/pci/pcie/err.c
> index e795e5ae6b03..21d554359fb1 100644
> --- a/drivers/pci/pcie/err.c
> +++ b/drivers/pci/pcie/err.c
> @@ -108,6 +108,12 @@ static int report_normal_detected(struct pci_dev *dev, void *data)
>   	return report_error_detected(dev, pci_channel_io_normal, data);
>   }
>   
> +static int report_perm_failure_detected(struct pci_dev *dev, void *data)
> +{
> +	pci_uevent_ers(dev, PCI_ERS_RESULT_DISCONNECT);
> +	return 0;
> +}
> +
>   static int report_mmio_enabled(struct pci_dev *dev, void *data)
>   {
>   	struct pci_driver *pdrv;
> @@ -272,7 +278,7 @@ pci_ers_result_t pcie_do_recovery(struct pci_dev *dev,
>   failed:
>   	pci_walk_bridge(bridge, pci_pm_runtime_put, NULL);
>   
> -	pci_uevent_ers(bridge, PCI_ERS_RESULT_DISCONNECT);
> +	pci_walk_bridge(bridge, report_perm_failure_detected, NULL);
>   
>   	pci_info(bridge, "device recovery failed\n");
>   

-- 
Sathyanarayanan Kuppuswamy
Linux Kernel Developer


