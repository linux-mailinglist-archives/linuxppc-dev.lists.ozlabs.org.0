Return-Path: <linuxppc-dev+bounces-13946-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5008AC4148F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 07 Nov 2025 19:30:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d370v6Skbz3054;
	Sat,  8 Nov 2025 05:30:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.20
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762540255;
	cv=none; b=BDQGq3TIBaD3Syn2dZIkAxwAyS1Bpz1/Y8OP9PGbzfOH1Z3/uFTbSN+8lrFz8XZsei3jEtpZ6WXqLrvPn8QwGkUQ2tu1IGXWV4zQG9+bwKhsNRGNKv+4lCPLLAlkOQz8wB0te4yR4PPGpKjvEINrTHMsGCGBKCcQUjVUA4bO91McwnyOfy+K6KyI/btVY7iXFdmf5jR94PtB5AF7/bPfLaeYnGyKnfjlJfP03not+ZyMcYHOaBpvOP9YLoxUg+w14u3t5UbCUCWJ7OFv+J3TcUbFTltzIGmWJKIgwcnF4P69YimJGVtAgSjVyunqFp3KpYlajSx3+JsTKtt3mYM1Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762540255; c=relaxed/relaxed;
	bh=r+J+Mk/9We4AXxEYEJVgeItSdSiTZKUcuy29ynNU4Zs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nL1IjBrcteQTpEX2x5IbfQpqPX+cYZelwBrzAMcCpGvVKKNYn5t6yFeu6Wd3AwYyZxCCqW4fdysuQDmwJv9qHyqVjxiEXhrMOapJi5GlVJHgBkZoWgn4RR5u3GWc4ME2NhSnAKFnxFc7bQmbOqiMCHDCkFKVqAwJ37/5IB0lo/BVX9B3QdGVX0bBc8ocNbIzdhWnXTDZ1VgidoHy5jdM+mHwbJpwwZypdHR5tdOohGSUssd/V59MKvlUXKJdKNKGzodvq3XJUBoLO/bTzyY2L0bAQi4dGyzJY88C0Go5vsPR+qT+cjf4dYPT5vNCnoi6tA7U0eFXmROj4BEL76wdrw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=acZpd7C0; dkim-atps=neutral; spf=pass (client-ip=198.175.65.20; helo=mgamail.intel.com; envelope-from=dave.jiang@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=acZpd7C0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.20; helo=mgamail.intel.com; envelope-from=dave.jiang@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d370s2d0qz2yrF
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 Nov 2025 05:30:50 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762540253; x=1794076253;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=NQMzSf1AbuMYunJf1VM25Q78A/AsP25m0nmjU1brY+o=;
  b=acZpd7C0SjiNiJMIzuD6XpTwci9Gkzhvm1PhERoDYiiV8jZTOFrvSE/V
   PdHPUnCPfYPhXeSOA86nvRRswzPNuGWoscXM+PM/sCfy5Vh0cFywTZAmG
   NiY+SK47LuCFdYlSVubVWWtW/YhDCjFfpDM0EN5GbPOcVR3O1OB9OXG4Q
   psEGnu6E8LLrPnA5FpDT9IuYnHIybAsZ4ot6P/GjpBRfS+0WhHvxLqvSN
   YOu4+Bir6mha/foKUqpOp7VUybLJSpZAvDPBywG7N+79tbQDVSxvwBfcl
   /TrXMsyFYFAPZcgiU7uVURGVHDpsCUTIRvEVlc5owR6Fr+5X8+V4WzTbO
   g==;
X-CSE-ConnectionGUID: zUxKEbRmSS6jYnfKw37zPw==
X-CSE-MsgGUID: 37WULdEoSyqqAFoy9plMpg==
X-IronPort-AV: E=McAfee;i="6800,10657,11606"; a="64393769"
X-IronPort-AV: E=Sophos;i="6.19,287,1754982000"; 
   d="scan'208";a="64393769"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2025 10:30:48 -0800
X-CSE-ConnectionGUID: EXjax2rlQKKiYHZkpDrlCA==
X-CSE-MsgGUID: opz/TgNzSJqcl3I4SWkXtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,287,1754982000"; 
   d="scan'208";a="187355089"
Received: from cmdeoliv-mobl4.amr.corp.intel.com (HELO [10.125.111.112]) ([10.125.111.112])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2025 10:30:47 -0800
Message-ID: <02a7c72f-6d8f-4cd9-af97-9b5e0b6093cb@intel.com>
Date: Fri, 7 Nov 2025 11:30:46 -0700
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
Subject: Re: [PATCH 4/6 v7] acpi/ghes: Add helper for CXL protocol errors
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
 linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org
References: <20251104182446.863422-1-fabio.m.de.francesco@linux.intel.com>
 <20251104182446.863422-5-fabio.m.de.francesco@linux.intel.com>
From: Dave Jiang <dave.jiang@intel.com>
Content-Language: en-US
In-Reply-To: <20251104182446.863422-5-fabio.m.de.francesco@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On 11/4/25 11:22 AM, Fabio M. De Francesco wrote:
> Move the CPER CXL protocol errors validity check out of
> cxl_cper_post_prot_err() to new cxl_cper_sec_prot_err_valid() and limit
> the serial number check only to CXL agents that are CXL devices (UEFI
> v2.10, Appendix N.2.13).
> 
> Export the new symbol for reuse by ELOG.
> 
> Signed-off-by: Fabio M. De Francesco <fabio.m.de.francesco@linux.intel.com>

Reviewed-by: Dave Jiang <dave.jiang@intel.com>> ---
>  drivers/acpi/apei/ghes.c | 32 ++++++++++++++++++++++----------
>  include/cxl/event.h      | 10 ++++++++++
>  2 files changed, 32 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/acpi/apei/ghes.c b/drivers/acpi/apei/ghes.c
> index d6fe5f020e96..e69ae864f43d 100644
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
> index 6fd90f9cc203..4d7d1036ea9c 100644
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
> +	return -EOPNOTSUPP;
> +}
> +#endif
> +
>  #endif /* _LINUX_CXL_EVENT_H */


