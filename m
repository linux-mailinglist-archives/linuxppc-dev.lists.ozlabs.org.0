Return-Path: <linuxppc-dev+bounces-13947-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 59E84C4149E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 07 Nov 2025 19:31:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d371l2sX3z3bsC;
	Sat,  8 Nov 2025 05:31:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.18
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762540299;
	cv=none; b=Xtqv7gL1BUpo+Bcr6I+zgrfZrXENk1jYLkR+jxITv6hoagHyPK4PFtfUyL0VzrhSMp4rhaArsaMlZsZrCxBD6M4S+MtXiK7UXAiLLErOH7P3IxFTaP7Kb4Bk+xgdY9wjktxE8hKuAIM+RyHJErrbE7TPuYUwR/XxH94c8B1i80hyegv1ltxKd5E6DocIJg9jy+xftD24g971CYWZ5fnPll0T3RspYDy/qVb6uanWEw5h+WWizLbfVFIahw0Ru0D4o2b+iXMV606aRIXgCj3nF8DH3px/c6hqZNcBErsifG1848jsWiFb9AJmTRaBEK0qK4qiIlDiFCuSmjjmlazk5g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762540299; c=relaxed/relaxed;
	bh=Mg7pQk95Lo8v4PgBF6lzEt883DljsAjXxbuHNa125fc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BFHzCeygsuuljAeJAAzXOOQdGfqka7FHVzjaulgFIhajd+T2CXmz1uHb5mVxbBUg2nlLWIvSK7w/lswwrKMOBfYN0qPjgwNEK2RtRbPX8W0P0rCFh0ngE4paiMoXfw3UFctmc/J9ml11SejFhg7xQ23eUwjbvv9e5uqsYVSgBBcjUO3eQvVMcxwYz6Ey3yyEKv02TU82L0mq2IUyLmXSs38GXfnhNIVhlTfSscXfBm4ESd6GfhEJPk+zBa53r001Gn0uo7/qGho8cz/ciVkiPt/9gPDjoxi2aN4aU+reEeddJy4DPzIMMM+DJdw2F12YjJAJwAIVBmDb0xO8VyK/rA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hvVxoDzg; dkim-atps=neutral; spf=pass (client-ip=192.198.163.18; helo=mgamail.intel.com; envelope-from=dave.jiang@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hvVxoDzg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.18; helo=mgamail.intel.com; envelope-from=dave.jiang@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d371k3m5yz2yrF
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 Nov 2025 05:31:38 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762540299; x=1794076299;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=Ivwc2M/ZDTDNDN4wnIiRBUD82UImX2K8AEI+zfxIyOU=;
  b=hvVxoDzg5dvEmxnK0Puzm6qAIFkG8FzT3PkicSPRqxgmfVE4XkVaiXLm
   SCjlAaQ9txzfrp5yXlOW1EH9+mlt17F6vFj2d6MwHcuxojEp0t6LQiant
   7lw/FK+jg+dq59zlELr4mHeViPrjTvSulygV8k/GF9jrl9umU+y+HZsBR
   UfjGXdAT3bukdtrHCBs6Rms8C4K+QKohQUs51dw4N+AvoPd0XxaksWAQP
   XKOEIhtxs8jFJddgNNVVs5RhgrW1q5SIfTPKj9w3tRf6HTxpqDCGrj8TB
   Cpg0EEJCvJH7igNJBLb0rdf3pdX3f+Iwwk5rCKVWuCMnOJbAJH1e63+uY
   Q==;
X-CSE-ConnectionGUID: LCBeQVfPS/6V2OgPCP8H7Q==
X-CSE-MsgGUID: JAO6yhhxTHG8IeWsYswOPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11606"; a="63902319"
X-IronPort-AV: E=Sophos;i="6.19,287,1754982000"; 
   d="scan'208";a="63902319"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2025 10:31:36 -0800
X-CSE-ConnectionGUID: RgnJVNmPQuS+l15b/XeJnA==
X-CSE-MsgGUID: T3lEpinBQaalfC++rcdn3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,287,1754982000"; 
   d="scan'208";a="187355309"
Received: from cmdeoliv-mobl4.amr.corp.intel.com (HELO [10.125.111.112]) ([10.125.111.112])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2025 10:31:35 -0800
Message-ID: <d84eafa5-0038-436e-aa53-9675d4e630b6@intel.com>
Date: Fri, 7 Nov 2025 11:31:34 -0700
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
Subject: Re: [PATCH 5/6 v7] acpi/ghes: Add helper to copy CXL protocol error
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
 linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org
References: <20251104182446.863422-1-fabio.m.de.francesco@linux.intel.com>
 <20251104182446.863422-6-fabio.m.de.francesco@linux.intel.com>
From: Dave Jiang <dave.jiang@intel.com>
Content-Language: en-US
In-Reply-To: <20251104182446.863422-6-fabio.m.de.francesco@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On 11/4/25 11:22 AM, Fabio M. De Francesco wrote:
> Make a helper out of cxl_cper_post_prot_err() that checks the CXL agent
> type and copy the CPER CXL protocol errors information to a work data
> structure.
> 
> Export the new symbol for reuse by ELOG.
> 
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
> Signed-off-by: Fabio M. De Francesco <fabio.m.de.francesco@linux.intel.com>

Reviewed-by: Dave Jiang <dave.jiang@intel.com>> ---
>  drivers/acpi/apei/ghes.c | 42 ++++++++++++++++++++++++++--------------
>  include/cxl/event.h      | 10 ++++++++++
>  2 files changed, 37 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/acpi/apei/ghes.c b/drivers/acpi/apei/ghes.c
> index e69ae864f43d..2f4632d9855a 100644
> --- a/drivers/acpi/apei/ghes.c
> +++ b/drivers/acpi/apei/ghes.c
> @@ -734,20 +734,12 @@ int cxl_cper_sec_prot_err_valid(struct cxl_cper_sec_prot_err *prot_err)
>  }
>  EXPORT_SYMBOL_GPL(cxl_cper_sec_prot_err_valid);
>  
> -static void cxl_cper_post_prot_err(struct cxl_cper_sec_prot_err *prot_err,
> -				   int severity)
> +int cxl_cper_setup_prot_err_work_data(struct cxl_cper_prot_err_work_data *wd,
> +				      struct cxl_cper_sec_prot_err *prot_err,
> +				      int severity)
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
> +		memcpy(&wd->prot_err, prot_err, sizeof(wd->prot_err));
>  
>  		dvsec_start = (u8 *)(prot_err + 1);
>  		cap_start = dvsec_start + prot_err->dvsec_len;
>  
> -		memcpy(&wd.ras_cap, cap_start, sizeof(wd.ras_cap));
> -		wd.severity = cper_severity_to_aer(severity);
> +		memcpy(&wd->ras_cap, cap_start, sizeof(wd->ras_cap));
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
> +EXPORT_SYMBOL_GPL(cxl_cper_setup_prot_err_work_data);
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
> +	if (cxl_cper_setup_prot_err_work_data(&wd, prot_err, severity))
> +		return;
> +
>  	if (!kfifo_put(&cxl_cper_prot_err_fifo, wd)) {
>  		pr_err_ratelimited("CXL CPER kfifo overflow\n");
>  		return;
> diff --git a/include/cxl/event.h b/include/cxl/event.h
> index 4d7d1036ea9c..94081aec597a 100644
> --- a/include/cxl/event.h
> +++ b/include/cxl/event.h
> @@ -322,12 +322,22 @@ static inline int cxl_cper_prot_err_kfifo_get(struct cxl_cper_prot_err_work_data
>  
>  #ifdef CONFIG_ACPI_APEI_PCIEAER
>  int cxl_cper_sec_prot_err_valid(struct cxl_cper_sec_prot_err *prot_err);
> +int cxl_cper_setup_prot_err_work_data(struct cxl_cper_prot_err_work_data *wd,
> +				      struct cxl_cper_sec_prot_err *prot_err,
> +				      int severity);
>  #else
>  static inline int
>  cxl_cper_sec_prot_err_valid(struct cxl_cper_sec_prot_err *prot_err)
>  {
>  	return -EOPNOTSUPP;
>  }
> +static inline int
> +cxl_cper_setup_prot_err_work_data(struct cxl_cper_prot_err_work_data *wd,
> +				  struct cxl_cper_sec_prot_err *prot_err,
> +				  int severity)
> +{
> +	return -EOPNOTSUPP;
> +}
>  #endif
>  
>  #endif /* _LINUX_CXL_EVENT_H */


