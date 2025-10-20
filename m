Return-Path: <linuxppc-dev+bounces-13069-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 064BCBF2788
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Oct 2025 18:37:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cr1LQ3DDSz3069;
	Tue, 21 Oct 2025 03:37:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.16
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760978254;
	cv=none; b=hdH4KD8rVxn3e0T0MxBkiORkoM8VP2dnKUVHexsrkh8M+huHJXnPxIWzR8p7dFEbxluYYaEmvlfgpdGg2c7xEb+NvnODPUQj8BaXCnHMv9c7zo0eP07U1bC0+tWUgeJQa0ZYS3Zg1c4c9UsT3qnCQZZrOu+IuvzVGbeJaFy0kmTswL872EJ7+Diw+bRtT43lpfVl6QOPHxMa8s3EZtHIpEI/yZ7SCVDB01M5sA8DPyCdDynLDfM/h50hTylSEg6+rUJAQil44mFl59+H5Iv/jcNOcvWTx/pkCwFcR8o2xP1gSeagSlk0I4sqDEW1uh6gbqmMjzUEybuFn8fZDcjIGg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760978254; c=relaxed/relaxed;
	bh=9yBWFdqwht48Xxu5Yoa/0oEZl7z/SBfUaL6fqmCbdLw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WnPXTa2zt7quSUQusvMhXlnZoW0v74Po9SfXsGjPDfVR5FTPvWc05oY464682IWgRiEH1AaxtzRCvo1E2nW8sjpSTpva8CKRVQX5QgX9arvtwE/brIeMpxo0hUhc5kXSU8SxS41jatqZEM8EFzFtLSf9LkSN5V6v8XP+8QnLV+iPnsstSX9FVyfVPiV2VwOMOxs2yj5DROaa2JjTCtXgQv365zVSzkdf4D0r5dz61Uz5EGkkxNChFawsaYG4tgk2U8a0OeUarqEHYpgOPpaJ9EOqrgf1KpW/H5iHz/ShjebOyjl0lEH2pLz8dNqxxw2hld5OnWkLHMr8PMOCPc5Gdw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KwBAIEpV; dkim-atps=neutral; spf=pass (client-ip=198.175.65.16; helo=mgamail.intel.com; envelope-from=dave.jiang@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KwBAIEpV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.16; helo=mgamail.intel.com; envelope-from=dave.jiang@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cr1LM58Gnz304x
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Oct 2025 03:37:29 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760978252; x=1792514252;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=+qZlyl7YWbY2lLgbuJo2hAw91ag2rew7u58FOPhtmUc=;
  b=KwBAIEpVy4xuh/hSGr8lESC4KL2OT1afyPBGqivegJ645IrCovy1EC8H
   JaqKz4VvP1zxau7By96PO+P1DxnYTQ1qi6IYyV2eGtoopaXNfkuZpOTdr
   14sahG3AbJyRrtzN+nTSJJmjojQJ5OrRxPaATyu9+/lH6eDArkM15Ao6o
   kyjsv3QeRa78WLgnKjO4aquDYSu5Y9urlhsIPQD75fkgYB5x4s1IhDNPu
   N8h7gcQjc5WEDd23kNzxBJo5n0/VI4ZhuUEcWaJnE/i79m/tP6Hx4y9py
   KJLNO++n/F7XkiA6RS/JGh8+cUmmqReGzVgvJprPxeE39oaVIySSyX4Q/
   g==;
X-CSE-ConnectionGUID: mWYhvReFSVqwcarNRhCtAw==
X-CSE-MsgGUID: DrPpWmhHQEa/VaX9iwOIcA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63243015"
X-IronPort-AV: E=Sophos;i="6.19,242,1754982000"; 
   d="scan'208";a="63243015"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2025 09:37:28 -0700
X-CSE-ConnectionGUID: +UyQQ5tfSKWNT1m4Aaq+lw==
X-CSE-MsgGUID: MUZlesziQx6BDxCrg5eraA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,242,1754982000"; 
   d="scan'208";a="183385703"
Received: from cmdeoliv-mobl4.amr.corp.intel.com (HELO [10.125.108.103]) ([10.125.108.103])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2025 09:37:25 -0700
Message-ID: <ca6e8c5f-4420-4efa-93fc-0c79774e8a96@intel.com>
Date: Mon, 20 Oct 2025 09:37:24 -0700
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
Subject: Re: [PATCH 5/6 v5] acpi/ghes: Add helper to copy CXL protocol error
 info to work struct
To: "Fabio M. De Francesco" <fabio.m.de.francesco@linux.intel.com>,
 linux-cxl@vger.kernel.org
Cc: "Rafael J . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 Tony Luck <tony.luck@intel.com>, Borislav Petkov <bp@alien8.de>,
 Hanjun Guo <guohanjun@huawei.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Shuai Xue <xueshuai@linux.alibaba.com>,
 Davidlohr Bueso <dave@stgolabs.net>,
 Jonathan Cameron <jonathan.cameron@huawei.com>,
 Alison Schofield <alison.schofield@intel.com>,
 Vishal Verma <vishal.l.verma@intel.com>, Ira Weiny <ira.weiny@intel.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
 Oliver O'Halloran <oohall@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Sunil V L <sunilvl@ventanamicro.com>, Xiaofei Tan <tanxiaofei@huawei.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
 Arnd Bergmann <arnd@arndb.de>, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@kernel.org>, Guo Weikang <guoweikang.kernel@gmail.com>,
 Xin Li <xin@zytor.com>, Will Deacon <will@kernel.org>,
 Huang Yiwei <quic_hyiwei@quicinc.com>, Gavin Shan <gshan@redhat.com>,
 Smita Koralahalli <Smita.KoralahalliChannabasappa@amd.com>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Li Ming <ming.li@zohomail.com>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>,
 Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
 Karolina Stolarek <karolina.stolarek@oracle.com>,
 Jon Pan-Doh <pandoh@google.com>, Lukas Wunner <lukas@wunner.de>,
 Shiju Jose <shiju.jose@huawei.com>, linux-kernel@vger.kernel.org,
 linux-acpi@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-pci@vger.kernel.org
References: <20251017133357.1150982-1-fabio.m.de.francesco@linux.intel.com>
 <20251017133357.1150982-6-fabio.m.de.francesco@linux.intel.com>
From: Dave Jiang <dave.jiang@intel.com>
Content-Language: en-US
In-Reply-To: <20251017133357.1150982-6-fabio.m.de.francesco@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On 10/17/25 6:30 AM, Fabio M. De Francesco wrote:
> Make a helper out of cxl_cper_post_prot_err() that checks the CXL agent
> type and copy the CPER CXL protocol errors information to a work data
> structure.
> 
> Signed-off-by: Fabio M. De Francesco <fabio.m.de.francesco@linux.intel.com>
> ---
>  drivers/acpi/apei/ghes.c | 42 ++++++++++++++++++++++++++--------------
>  include/cxl/event.h      | 10 ++++++++++
>  2 files changed, 37 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/acpi/apei/ghes.c b/drivers/acpi/apei/ghes.c
> index e69ae864f43d3..e0f8b8ed2b7c4 100644
> --- a/drivers/acpi/apei/ghes.c
> +++ b/drivers/acpi/apei/ghes.c
> @@ -734,20 +734,12 @@ int cxl_cper_sec_prot_err_valid(struct cxl_cper_sec_prot_err *prot_err)
>  }
>  EXPORT_SYMBOL_GPL(cxl_cper_sec_prot_err_valid);
>  
> -static void cxl_cper_post_prot_err(struct cxl_cper_sec_prot_err *prot_err,
> -				   int severity)
> +int cxl_cper_sec_prot_err_copy_to_wd(struct cxl_cper_prot_err_work_data *wd,

Function name a bit awkward. Maybe cxl_cper_setup_error_work_data()?

> +				     struct cxl_cper_sec_prot_err *prot_err,
> +				     int severity)
>  {
> -	struct cxl_cper_prot_err_work_data wd;
>  	u8 *dvsec_start, *cap_start;
>  
> -	if (cxl_cper_sec_prot_err_valid(prot_err))
> -		return;
> -
> -	guard(spinlock_irqsave)(&cxl_cper_prot_err_work_lock);
> -
> -	if (!cxl_cper_prot_err_work)
> -		return;
> -
>  	switch (prot_err->agent_type) {
>  	case RCD:
>  	case DEVICE:
> @@ -756,20 +748,40 @@ static void cxl_cper_post_prot_err(struct cxl_cper_sec_prot_err *prot_err,
>  	case RP:
>  	case DSP:
>  	case USP:
> -		memcpy(&wd.prot_err, prot_err, sizeof(wd.prot_err));
> +		memcpy(wd->prot_err, prot_err, sizeof(wd->prot_err));
>  
>  		dvsec_start = (u8 *)(prot_err + 1);
>  		cap_start = dvsec_start + prot_err->dvsec_len;
>  
> -		memcpy(&wd.ras_cap, cap_start, sizeof(wd.ras_cap));
> -		wd.severity = cper_severity_to_aer(severity);
> +		memcpy(wd->ras_cap, cap_start, sizeof(wd->ras_cap));
> +		wd->severity = cper_severity_to_aer(severity);
>  		break;
>  	default:
>  		pr_err_ratelimited("CXL CPER invalid agent type: %d\n",
>  				   prot_err->agent_type);
> -		return;
> +		return -EINVAL;
>  	}
>  
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(cxl_cper_sec_prot_err_copy_to_wd);
> +
> +static void cxl_cper_post_prot_err(struct cxl_cper_sec_prot_err *prot_err,
> +				   int severity)
> +{
> +	struct cxl_cper_prot_err_work_data wd;
> +
> +	if (cxl_cper_sec_prot_err_valid(prot_err))
> +		return;
> +
> +	guard(spinlock_irqsave)(&cxl_cper_prot_err_work_lock);
> +
> +	if (!cxl_cper_prot_err_work)
> +		return;
> +
> +	if (cxl_cper_sec_prot_err_copy_to_wd(&wd, prot_err, severity))
> +		return;
> +
>  	if (!kfifo_put(&cxl_cper_prot_err_fifo, wd)) {
>  		pr_err_ratelimited("CXL CPER kfifo overflow\n");
>  		return;
> diff --git a/include/cxl/event.h b/include/cxl/event.h
> index e1deb66c2197e..5f06cea5d6005 100644
> --- a/include/cxl/event.h
> +++ b/include/cxl/event.h
> @@ -322,12 +322,22 @@ static inline int cxl_cper_prot_err_kfifo_get(struct cxl_cper_prot_err_work_data
>  
>  #ifdef CONFIG_ACPI_APEI_PCIEAER
>  int cxl_cper_sec_prot_err_valid(struct cxl_cper_sec_prot_err *prot_err);
> +int cxl_cper_sec_prot_err_copy_to_wd(struct cxl_cper_prot_err_work_data *wd,
> +				     struct cxl_cper_sec_prot_err *prot_err,
> +				     int severity);
>  #else
>  static inline int
>  cxl_cper_sec_prot_err_valid(struct cxl_cper_sec_prot_err *prot_err)
>  {
>  	return -EINVAL;
>  }
> +static inline int
> +cxl_cper_sec_prot_err_copy_to_wd(struct cxl_cper_prot_err_work_data *wd,
> +				 struct cxl_cper_sec_prot_err *prot_err,
> +				 int severity)
> +{
> +	return -EINVAL;

-EOPNOTSUPP

> +}
>  #endif
>  
>  #endif /* _LINUX_CXL_EVENT_H */


