Return-Path: <linuxppc-dev+bounces-13067-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C429BBF24CC
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Oct 2025 18:05:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cr0d72j2Kz304h;
	Tue, 21 Oct 2025 03:05:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.15
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760976315;
	cv=none; b=LTly56JaMFfJ03fynMPeu0hpz7NRn7vZdTImSQImNS2Bzr41sQCkPaUHMLLwTKpdBJHd+o5oXBv6JeJdIwTYSf+p/DwDB/4T9hT7ig6z4EliNheBzJJYLqnMMpJqtnob4M7teMOAKzbmHVmOfw0o2yHlm+aI/V7yPOtSTThImAK/aETfAo843OwDQjoZQmqH6CJysEZA4e1ya062LvTVos44Wir/hwyTnrKSgDqgJHYmgvM4DfxWO/2HjLoBaxWevAvnQDl3zuINZzQZTPDQB53k0jBRhTTKRWLhEWKpfoswA6UEuF2AKR7+i5gq1BVhnYifxbuVKWqZlxXNY19D+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760976315; c=relaxed/relaxed;
	bh=9zqmfJzfxpgIM2tZpR3SI8F5iWo5zFm0WqX/VDgqzME=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CTNLR/S0dc/FdVJiQ6UsxZLn0wyv7LnMLkTDrKsbPei5zmWHiUtc9ZuZbwAkv7wLGGSlu9pdqOeJA7T/pmzFIoAa8aE/jEehCYyPclGWTxDBGKV1mpdaVqHsi0oWEjOjou9GLXcDxWZP6lAzCD2azsnFGUvN9Y+FDxIV97LRfvzu0fZBd/1fbgYoiECUQ7OeXhdhhlhgtEITVix2mjhx9ihMKYiLwD7Sb/LkMJxeBc8CE9sW27DxcbN9ySkIa5KRyg8Ydat6hHKoppMQhSSv2fd247UtycqDWOtNq9HGCZKdBJnKinIVzVFnuXSWFaZiSr5TCP5ve9m2bL/CDlL6YQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BawEUh7D; dkim-atps=neutral; spf=pass (client-ip=198.175.65.15; helo=mgamail.intel.com; envelope-from=dave.jiang@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BawEUh7D;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.15; helo=mgamail.intel.com; envelope-from=dave.jiang@intel.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 63 seconds by postgrey-1.37 at boromir; Tue, 21 Oct 2025 03:05:12 AEDT
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cr0d45jPyz300M
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Oct 2025 03:05:12 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760976314; x=1792512314;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=y87Qov3Jt4LC0JXlONBamFdqUvce5uT3fMcKNGfdSck=;
  b=BawEUh7DubRy8miaBivdRfpy7UvRtYNNrMrpnj3v2vsAa7WKl7LniKx1
   nFMIq1xs7wiIj/LrNU76R1ivPBg6MEV8c0FQXCyhrl20kCbnfM25NS47G
   tQNEMrG90Vsd3Ahehbyr5kVg9dfcDnVXWJBgRBSAQTNrDz8eWql1BsAUl
   wobCRyBO/Q4igNvLV5uSF35J3Az/XTxcgP+eSpSHPdlMnpNhUf222r1/o
   kZSW94s+Gm4m6KmWXFYaSmsL67gyI0pSOfz3C4nmKwJhn2kSQZhrVoZHP
   fu3n4GXkRsay5+oVx7PJZ5/fKjDosuY+seOlpF76swRFcbsSz5nVZeL/i
   w==;
X-CSE-ConnectionGUID: u0Gc2Yo5S7+iHE4mpoReTw==
X-CSE-MsgGUID: +XlklpTlQmGt6rzpg7aRaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="66730461"
X-IronPort-AV: E=Sophos;i="6.19,242,1754982000"; 
   d="scan'208";a="66730461"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2025 09:04:05 -0700
X-CSE-ConnectionGUID: +BNDHO+tROOuyxe325cjEA==
X-CSE-MsgGUID: tGqTHgdfTEq/PAYuNSvGDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,242,1754982000"; 
   d="scan'208";a="183379002"
Received: from cmdeoliv-mobl4.amr.corp.intel.com (HELO [10.125.108.103]) ([10.125.108.103])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2025 09:04:02 -0700
Message-ID: <7d4a53ea-1d2b-42b5-ad22-3a023f415cd2@intel.com>
Date: Mon, 20 Oct 2025 09:04:01 -0700
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
Subject: Re: [PATCH 4/6 v5] acpi/ghes: Add helper for CPER CXL protocol errors
 checks
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
 <20251017133357.1150982-5-fabio.m.de.francesco@linux.intel.com>
From: Dave Jiang <dave.jiang@intel.com>
Content-Language: en-US
In-Reply-To: <20251017133357.1150982-5-fabio.m.de.francesco@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On 10/17/25 6:30 AM, Fabio M. De Francesco wrote:
> Move the CPER CXL protocol errors validity checks out of
> cxl_cper_post_prot_err() to cxl_cper_sec_prot_err_valid() and check the
> serial number only for CXL agents that are CXL devices (UEFI v2.10,
> Appendix N.2.13).
> 
> Signed-off-by: Fabio M. De Francesco <fabio.m.de.francesco@linux.intel.com>
> ---
>  drivers/acpi/apei/ghes.c | 32 ++++++++++++++++++++++----------
>  include/cxl/event.h      | 10 ++++++++++
>  2 files changed, 32 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/acpi/apei/ghes.c b/drivers/acpi/apei/ghes.c
> index d6fe5f020e96e..e69ae864f43d3 100644
> --- a/drivers/acpi/apei/ghes.c
> +++ b/drivers/acpi/apei/ghes.c
> @@ -706,30 +706,42 @@ static DEFINE_KFIFO(cxl_cper_prot_err_fifo, struct cxl_cper_prot_err_work_data,
>  static DEFINE_SPINLOCK(cxl_cper_prot_err_work_lock);
>  struct work_struct *cxl_cper_prot_err_work;
>  
> -static void cxl_cper_post_prot_err(struct cxl_cper_sec_prot_err *prot_err,
> -				   int severity)
> +int cxl_cper_sec_prot_err_valid(struct cxl_cper_sec_prot_err *prot_err)
>  {
> -	struct cxl_cper_prot_err_work_data wd;
> -	u8 *dvsec_start, *cap_start;
> -
>  	if (!(prot_err->valid_bits & PROT_ERR_VALID_AGENT_ADDRESS)) {
>  		pr_err_ratelimited("CXL CPER invalid agent type\n");
> -		return;
> +		return -EINVAL;
>  	}
>  
>  	if (!(prot_err->valid_bits & PROT_ERR_VALID_ERROR_LOG)) {
>  		pr_err_ratelimited("CXL CPER invalid protocol error log\n");
> -		return;
> +		return -EINVAL;
>  	}
>  
>  	if (prot_err->err_len != sizeof(struct cxl_ras_capability_regs)) {
>  		pr_err_ratelimited("CXL CPER invalid RAS Cap size (%u)\n",
>  				   prot_err->err_len);
> -		return;
> +		return -EINVAL;
>  	}
>  
> -	if (!(prot_err->valid_bits & PROT_ERR_VALID_SERIAL_NUMBER))
> -		pr_warn(FW_WARN "CXL CPER no device serial number\n");
> +	if ((prot_err->agent_type == RCD || prot_err->agent_type == DEVICE ||
> +	     prot_err->agent_type == LD || prot_err->agent_type == FMLD) &&
> +	    !(prot_err->valid_bits & PROT_ERR_VALID_SERIAL_NUMBER))
> +		pr_warn_ratelimited(FW_WARN
> +				    "CXL CPER no device serial number\n");
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(cxl_cper_sec_prot_err_valid);
> +
> +static void cxl_cper_post_prot_err(struct cxl_cper_sec_prot_err *prot_err,
> +				   int severity)
> +{
> +	struct cxl_cper_prot_err_work_data wd;
> +	u8 *dvsec_start, *cap_start;
> +
> +	if (cxl_cper_sec_prot_err_valid(prot_err))
> +		return;
>  
>  	guard(spinlock_irqsave)(&cxl_cper_prot_err_work_lock);
>  
> diff --git a/include/cxl/event.h b/include/cxl/event.h
> index 6fd90f9cc2034..e1deb66c2197e 100644
> --- a/include/cxl/event.h
> +++ b/include/cxl/event.h
> @@ -320,4 +320,14 @@ static inline int cxl_cper_prot_err_kfifo_get(struct cxl_cper_prot_err_work_data
>  }
>  #endif
>  
> +#ifdef CONFIG_ACPI_APEI_PCIEAER
> +int cxl_cper_sec_prot_err_valid(struct cxl_cper_sec_prot_err *prot_err);
> +#else
> +static inline int
> +cxl_cper_sec_prot_err_valid(struct cxl_cper_sec_prot_err *prot_err)
> +{
> +	return -EINVAL;

-EOPNOTSUPP?

> +}
> +#endif
> +
>  #endif /* _LINUX_CXL_EVENT_H */



