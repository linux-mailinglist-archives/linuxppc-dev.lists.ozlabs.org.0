Return-Path: <linuxppc-dev+bounces-10964-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A3D0B257B1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Aug 2025 01:43:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c2Q1j5wsZz30Sy;
	Thu, 14 Aug 2025 09:43:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.16
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755128633;
	cv=none; b=geytimjr4s2gmVZifQIwTagkaOSe1fSeJSvvqb6g3RsMWAjjoneCUV+thvRhbKhJI0TirX1KCmKes3Ut8r26dzVFaTwjb5fkU0buHbfTDclhuoaNx7Qsyf6pYK1tniA/1wwTCGpenRcIB3W4HV3mNd4jzpzDsL9RKqh6yMix1lBKK4oxhG2FCv+HiJzSDXZmCFWxPUkjdzr7ROw/hHKgNjlsoCTG6aQJKoQuU5XA+UqghjVh7iSuw8npKcnM/WbmiNqs9lMuCqEzauIryqDV3R9ilzxtYa3pgUezabfU6vvXzf53ywHeckdf3+7hafw6wFuoHSyb9iQaU0RGQfdK+g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755128633; c=relaxed/relaxed;
	bh=t61bpzkQ57YT8sVno7lPkJzamS/+H+59l+HhvK1Pwcc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IVY7eZ2cbBsbm8KXYkeutTWy0IcGRnprhBMPSzz5G0EjjWMZq8c4pHuxQvfuBwT4Em15nEYNqeJoXT89zDB9xNFQE4CQSbrRmtwpzYJE1BKHBGPln6wvew0ILpUFkqfN0FviEwMRpYw8f7vwhV80DKf6Tp9OhYnF7d9mciFmZnW/bWMGZrbyK1eI5k64bZwB/KiFYvIVt6m1I0+xSFX2yrHvcQjfM5rmodqUQy6hmMSCpnBPb12nJBNKHrgpd+tm49empcv9pvQdVDPCD/5DYytzG0Be8nRqXcdRYLRuOR7icY/xlTm0Q1N4zt3FUqEwP+4Q3pLM25K7foGgIWmgBQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=c7OdWVHt; dkim-atps=neutral; spf=none (client-ip=198.175.65.16; helo=mgamail.intel.com; envelope-from=sathyanarayanan.kuppuswamy@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=c7OdWVHt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.16; helo=mgamail.intel.com; envelope-from=sathyanarayanan.kuppuswamy@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c2Q1g1vg4z2xHp
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Aug 2025 09:43:49 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755128631; x=1786664631;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=qRxoXpbBePERoZiqB5iiVIHqtdhuZpMxZUw6Tz0skzY=;
  b=c7OdWVHt0FlOl1eoG1hSQvWWMwE0U02frAzpG6wrwfpTctaI+50CuMXT
   QK7niRVCPb31DaMmjFW4PdG4UmTi7XfJwXhlxrcZ8DK2wbddVJPgvlwmP
   VSb6aardCejH2Pm5AywGU4ozlCJ6Ct60zY9Ke08mmEIdWJ4/exWIk1ruI
   0NuJ2rscob7wssc9ms5Q7vDILUis7J2hJaxZlV4eQqsYoWjGe2TkcBHRA
   Gj2ZSYrptaDjooHxTQMWbCcCGwefKxQNcsuFKM6jJ729wuiVkM6pV2nu0
   AXL9lr/xsOhsUpY+d+3tH6snjLEqW3I3CZai6k7JfJfpfx+9KtTFufsFW
   w==;
X-CSE-ConnectionGUID: dQWOUw90R1q9Q1QsZGPQVg==
X-CSE-MsgGUID: K7lwz1cASl+ZrRtaEreqCg==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="57587516"
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; 
   d="scan'208";a="57587516"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2025 16:43:46 -0700
X-CSE-ConnectionGUID: 9F0bpJSxThyqZILBaQAzWA==
X-CSE-MsgGUID: ZiFmjh7ESXuPu5OPvIUMsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; 
   d="scan'208";a="197595334"
Received: from linux.intel.com ([10.54.29.200])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2025 16:43:46 -0700
Received: from [10.124.222.231] (unknown [10.124.222.231])
	by linux.intel.com (Postfix) with ESMTP id 18A7920B571C;
	Wed, 13 Aug 2025 16:43:45 -0700 (PDT)
Message-ID: <004298f7-ae08-428e-9b98-995fc56e55b1@linux.intel.com>
Date: Wed, 13 Aug 2025 16:43:39 -0700
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
Subject: Re: [PATCH 4/5] PCI/ERR: Update device error_state already after
 reset
To: Lukas Wunner <lukas@wunner.de>, Bjorn Helgaas <helgaas@kernel.org>
Cc: Riana Tauro <riana.tauro@intel.com>,
 Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>,
 "Sean C. Dardis" <sean.c.dardis@intel.com>,
 Terry Bowman <terry.bowman@amd.com>, Niklas Schnelle
 <schnelle@linux.ibm.com>, Linas Vepstas <linasvepstas@gmail.com>,
 Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
 Oliver OHalloran <oohall@gmail.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
 linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org,
 Shahed Shaikh <shshaikh@marvell.com>, Manish Chopra <manishc@marvell.com>,
 GR-Linux-NIC-Dev@marvell.com, Nilesh Javali <njavali@marvell.com>,
 GR-QLogic-Storage-Upstream@marvell.com,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 linux-scsi@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <"ku ba"@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 netdev@vger.kernel.org
References: <cover.1755008151.git.lukas@wunner.de>
 <4517af6359ffb9d66152b827a5d2833459144e3f.1755008151.git.lukas@wunner.de>
Content-Language: en-US
From: Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>
In-Reply-To: <4517af6359ffb9d66152b827a5d2833459144e3f.1755008151.git.lukas@wunner.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


On 8/12/25 10:11 PM, Lukas Wunner wrote:
> After a Fatal Error has been reported by a device and has been recovered
> through a Secondary Bus Reset, AER updates the device's error_state to
> pci_channel_io_normal before invoking its driver's ->resume() callback.
>
> By contrast, EEH updates the error_state earlier, namely after resetting
> the device and before invoking its driver's ->slot_reset() callback.
> Commit c58dc575f3c8 ("powerpc/pseries: Set error_state to
> pci_channel_io_normal in eeh_report_reset()") explains in great detail
> that the earlier invocation is necessitated by various drivers checking
> accessibility of the device with pci_channel_offline() and avoiding
> accesses if it returns true.  It returns true for any other error_state
> than pci_channel_io_normal.
>
> The device should be accessible already after reset, hence the reasoning
> is that it's safe to update the error_state immediately afterwards.
>
> This deviation between AER and EEH seems problematic because drivers
> behave differently depending on which error recovery mechanism the
> platform uses.  Three drivers have gone so far as to update the
> error_state themselves, presumably to work around AER's behavior.
>
> For consistency, amend AER to update the error_state at the same recovery
> steps as EEH.  Drop the now unnecessary workaround from the three drivers.
>
> Keep updating the error_state before ->resume() in case ->error_detected()
> or ->mmio_enabled() return PCI_ERS_RESULT_RECOVERED, which causes
> ->slot_reset() to be skipped.  There are drivers doing this even for Fatal
> Errors, e.g. mhi_pci_error_detected().
>
> Signed-off-by: Lukas Wunner <lukas@wunner.de>
> ---

Reviewed-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>

>   drivers/net/ethernet/qlogic/qlcnic/qlcnic_83xx_hw.c | 1 -
>   drivers/net/ethernet/qlogic/qlcnic/qlcnic_main.c    | 2 --
>   drivers/pci/pcie/err.c                              | 3 ++-
>   drivers/scsi/qla2xxx/qla_os.c                       | 5 -----
>   4 files changed, 2 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/net/ethernet/qlogic/qlcnic/qlcnic_83xx_hw.c b/drivers/net/ethernet/qlogic/qlcnic/qlcnic_83xx_hw.c
> index d7cdea8f604d..91e7b38143ea 100644
> --- a/drivers/net/ethernet/qlogic/qlcnic/qlcnic_83xx_hw.c
> +++ b/drivers/net/ethernet/qlogic/qlcnic/qlcnic_83xx_hw.c
> @@ -4215,7 +4215,6 @@ static pci_ers_result_t qlcnic_83xx_io_slot_reset(struct pci_dev *pdev)
>   	struct qlcnic_adapter *adapter = pci_get_drvdata(pdev);
>   	int err = 0;
>   
> -	pdev->error_state = pci_channel_io_normal;
>   	err = pci_enable_device(pdev);
>   	if (err)
>   		goto disconnect;
> diff --git a/drivers/net/ethernet/qlogic/qlcnic/qlcnic_main.c b/drivers/net/ethernet/qlogic/qlcnic/qlcnic_main.c
> index 53cdd36c4123..e051d8c7a28d 100644
> --- a/drivers/net/ethernet/qlogic/qlcnic/qlcnic_main.c
> +++ b/drivers/net/ethernet/qlogic/qlcnic/qlcnic_main.c
> @@ -3766,8 +3766,6 @@ static int qlcnic_attach_func(struct pci_dev *pdev)
>   	struct qlcnic_adapter *adapter = pci_get_drvdata(pdev);
>   	struct net_device *netdev = adapter->netdev;
>   
> -	pdev->error_state = pci_channel_io_normal;
> -
>   	err = pci_enable_device(pdev);
>   	if (err)
>   		return err;
> diff --git a/drivers/pci/pcie/err.c b/drivers/pci/pcie/err.c
> index 930bb60fb761..bebe4bc111d7 100644
> --- a/drivers/pci/pcie/err.c
> +++ b/drivers/pci/pcie/err.c
> @@ -153,7 +153,8 @@ static int report_slot_reset(struct pci_dev *dev, void *data)
>   
>   	device_lock(&dev->dev);
>   	pdrv = dev->driver;
> -	if (!pdrv || !pdrv->err_handler || !pdrv->err_handler->slot_reset)
> +	if (!pci_dev_set_io_state(dev, pci_channel_io_normal) ||
> +	    !pdrv || !pdrv->err_handler || !pdrv->err_handler->slot_reset)
>   		goto out;
>   
>   	err_handler = pdrv->err_handler;
> diff --git a/drivers/scsi/qla2xxx/qla_os.c b/drivers/scsi/qla2xxx/qla_os.c
> index d4b484c0fd9d..4460421834cb 100644
> --- a/drivers/scsi/qla2xxx/qla_os.c
> +++ b/drivers/scsi/qla2xxx/qla_os.c
> @@ -7883,11 +7883,6 @@ qla2xxx_pci_slot_reset(struct pci_dev *pdev)
>   	       "Slot Reset.\n");
>   
>   	ha->pci_error_state = QLA_PCI_SLOT_RESET;
> -	/* Workaround: qla2xxx driver which access hardware earlier
> -	 * needs error state to be pci_channel_io_online.
> -	 * Otherwise mailbox command timesout.
> -	 */
> -	pdev->error_state = pci_channel_io_normal;
>   
>   	pci_restore_state(pdev);
>   

-- 
Sathyanarayanan Kuppuswamy
Linux Kernel Developer


