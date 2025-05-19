Return-Path: <linuxppc-dev+bounces-8702-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D0BBABCBC1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 May 2025 01:50:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b1ZDl0Yqcz301G;
	Tue, 20 May 2025 09:50:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.17
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747698615;
	cv=none; b=A8kO/hzHlo4Ew+CHsS3/SOO9P7lSPOQxqLteJ+3X08bURMygzFS08aFeN7skGYwi0ENL69jFnIp+agrzjcK1T1k2XO0ETeaWMn/ovTcMFTSaa25oRJVtcpukcxADblSVTObqC4dk1y6XHDEg341C5PxfrTdKXa9b2+NA5Fy06Gj58dODUcIqv8XbuS00UPD9R2HxAOlGXKEDlEauq6rYJ6KWVq3yZTx+EuGIsqSQgfe856NuradShEqQ3SveTjze2yQVu44gQ7yIItUY19PiD40KJH9pueDbtDiVWKHlrPR4yZz3avv5TgROdtC7phzEktqhOkNXRCPUouPwKTikmw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747698615; c=relaxed/relaxed;
	bh=Fvwu8clKJZjG43Oesfp/T2eR/H2A0ltmZsM9zLvhNuE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XBWUJvBSizRTB2anLwdRtFIf/fekTkVNlOV9ZuZwIJ59rriveK1bOqHoRHSSJ222VYfYPxS/Y/F/xQbjpIL7YlxZ/jfcTj9J3Vd9WRw9ufI90i5wn9v8WA2F4PMVpIcgl2PG7ypkc5VoOY74gff4vM+jkG+isTUdhDJZLTpzroB9zMuyu8Yap4zZ1yh81lLdjkKfEttOQRK6fmPdp7QIiaden2qfLxkHmKVqHQc7qH3LNAqnuIXTVglQHF6E0ooMbH0qsSOQU6xNQiRHGZ9f1uY1lfxWu9+8FVC1GTQcmJnTBgQKzIJ9RLUc8jIMDzHRetoGH8fTRES3bkO8swbFHg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=N2F3+BDu; dkim-atps=neutral; spf=none (client-ip=198.175.65.17; helo=mgamail.intel.com; envelope-from=sathyanarayanan.kuppuswamy@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=N2F3+BDu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.17; helo=mgamail.intel.com; envelope-from=sathyanarayanan.kuppuswamy@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b1ZDk0lL6z2yrN
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 May 2025 09:50:12 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747698615; x=1779234615;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=lZceSJXorFTEkulyn9ZEpocZ9KdHmanpjYWje8SpBZE=;
  b=N2F3+BDuBWiXLXKgXcidmMrxyWg6DHSCiAslVhZzTFltS2by+g+KuWi/
   ZiEtI0Zbw2Hu0dszmrJP5pXqONvGSotaX8RAx2vSXD43qNq9/MDJ8+O1D
   omXwUlgfuCLV15c2vwALa3KXDilmeaL8qLr7gehPkjxsE78+2R2qkTmNX
   4mhHYjuALXz3Lty6tVpj4fjarEqp6Q6Uf+ivwHDb2tEBkHeFK/tyGzCUd
   qTVVMKbgYwwH66mS5g+Wc6iy6BYYFjeDr68do7CzeEByGp+rcHxbeKzD4
   Hq2y8ixB1+bMcukYKJMhomlfV6RXv35dII1nI4Tza4Ju9g4BNTTL1/cWG
   Q==;
X-CSE-ConnectionGUID: hGdkw95VQNGoCoYZCOg9IA==
X-CSE-MsgGUID: N1Er7z93SBSiyUn00ibP2w==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="49597534"
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="49597534"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2025 16:50:12 -0700
X-CSE-ConnectionGUID: BHWC+09MQHe2nNUF1Md6Uw==
X-CSE-MsgGUID: iqvNMD7aRDOTuCwHgojYgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="162811471"
Received: from mdroper-mobl2.amr.corp.intel.com (HELO [10.124.221.39]) ([10.124.221.39])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2025 16:50:09 -0700
Message-ID: <ef2fec8c-2efa-44be-add7-480344d1c446@linux.intel.com>
Date: Mon, 19 May 2025 16:50:09 -0700
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
Subject: Re: [PATCH v6 07/16] PCI/AER: Initialize aer_err_info before using it
To: Bjorn Helgaas <helgaas@kernel.org>, linux-pci@vger.kernel.org
Cc: Jon Pan-Doh <pandoh@google.com>,
 Karolina Stolarek <karolina.stolarek@oracle.com>,
 Martin Petersen <martin.petersen@oracle.com>,
 Ben Fuller <ben.fuller@oracle.com>, Drew Walton <drewwalton@microsoft.com>,
 Anil Agrawal <anilagrawal@meta.com>, Tony Luck <tony.luck@intel.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Lukas Wunner <lukas@wunner.de>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Sargun Dhillon <sargun@meta.com>, "Paul E . McKenney" <paulmck@kernel.org>,
 Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
 Oliver O'Halloran <oohall@gmail.com>, Kai-Heng Feng <kaihengf@nvidia.com>,
 Keith Busch <kbusch@kernel.org>, Robert Richter <rrichter@amd.com>,
 Terry Bowman <terry.bowman@amd.com>, Shiju Jose <shiju.jose@huawei.com>,
 Dave Jiang <dave.jiang@intel.com>, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, Bjorn Helgaas <bhelgaas@google.com>
References: <20250519213603.1257897-1-helgaas@kernel.org>
 <20250519213603.1257897-8-helgaas@kernel.org>
Content-Language: en-US
From: Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>
In-Reply-To: <20250519213603.1257897-8-helgaas@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


On 5/19/25 2:35 PM, Bjorn Helgaas wrote:
> From: Bjorn Helgaas <bhelgaas@google.com>
>
> Previously the struct aer_err_info "e_info" was allocated on the stack
> without being initialized, so it contained junk except for the fields we
> explicitly set later.
>
> Initialize "e_info" at declaration with a designated initializer list,
> which initializes the other members to zero.
>
> Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
> ---

Reviewed-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>

>   drivers/pci/pcie/aer.c | 37 ++++++++++++++++---------------------
>   1 file changed, 16 insertions(+), 21 deletions(-)
>
> diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
> index 95a4cab1d517..40f003eca1c5 100644
> --- a/drivers/pci/pcie/aer.c
> +++ b/drivers/pci/pcie/aer.c
> @@ -1281,7 +1281,7 @@ static void aer_isr_one_error(struct aer_rpc *rpc,
>   		struct aer_err_source *e_src)
>   {
>   	struct pci_dev *pdev = rpc->rpd;
> -	struct aer_err_info e_info;
> +	u32 status = e_src->status;
>   
>   	pci_rootport_aer_stats_incr(pdev, e_src);
>   
> @@ -1289,14 +1289,13 @@ static void aer_isr_one_error(struct aer_rpc *rpc,
>   	 * There is a possibility that both correctable error and
>   	 * uncorrectable error being logged. Report correctable error first.
>   	 */
> -	if (e_src->status & PCI_ERR_ROOT_COR_RCV) {
> -		e_info.id = ERR_COR_ID(e_src->id);
> -		e_info.severity = AER_CORRECTABLE;
> -
> -		if (e_src->status & PCI_ERR_ROOT_MULTI_COR_RCV)
> -			e_info.multi_error_valid = 1;
> -		else
> -			e_info.multi_error_valid = 0;
> +	if (status & PCI_ERR_ROOT_COR_RCV) {
> +		int multi = status & PCI_ERR_ROOT_MULTI_COR_RCV;
> +		struct aer_err_info e_info = {
> +			.id = ERR_COR_ID(e_src->id),
> +			.severity = AER_CORRECTABLE,
> +			.multi_error_valid = multi ? 1 : 0,
> +		};
>   
>   		if (find_source_device(pdev, &e_info)) {
>   			aer_print_source(pdev, &e_info, "");
> @@ -1304,18 +1303,14 @@ static void aer_isr_one_error(struct aer_rpc *rpc,
>   		}
>   	}
>   
> -	if (e_src->status & PCI_ERR_ROOT_UNCOR_RCV) {
> -		e_info.id = ERR_UNCOR_ID(e_src->id);
> -
> -		if (e_src->status & PCI_ERR_ROOT_FATAL_RCV)
> -			e_info.severity = AER_FATAL;
> -		else
> -			e_info.severity = AER_NONFATAL;
> -
> -		if (e_src->status & PCI_ERR_ROOT_MULTI_UNCOR_RCV)
> -			e_info.multi_error_valid = 1;
> -		else
> -			e_info.multi_error_valid = 0;
> +	if (status & PCI_ERR_ROOT_UNCOR_RCV) {
> +		int fatal = status & PCI_ERR_ROOT_FATAL_RCV;
> +		int multi = status & PCI_ERR_ROOT_MULTI_UNCOR_RCV;
> +		struct aer_err_info e_info = {
> +			.id = ERR_UNCOR_ID(e_src->id),
> +			.severity = fatal ? AER_FATAL : AER_NONFATAL,
> +			.multi_error_valid = multi ? 1 : 0,
> +		};
>   
>   		if (find_source_device(pdev, &e_info)) {
>   			aer_print_source(pdev, &e_info, "");

-- 
Sathyanarayanan Kuppuswamy
Linux Kernel Developer


