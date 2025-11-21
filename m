Return-Path: <linuxppc-dev+bounces-14384-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F26CBC76FE5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Nov 2025 03:22:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dCJsF68rXz2yrQ;
	Fri, 21 Nov 2025 13:22:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=113.46.200.224
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763691761;
	cv=none; b=Px+iCeyTbqshjaYzNVrvPtbngCBpkN+0eQ6Oc+griWaICUmNsYydcvyhcmZ1eTsmbSS4XJLC/XOJQL7+UoZSBOJCZVtVnXAsmNSKWeY7COceOVK8t9sVZeMBy48f0mf+EIY245CVGHtY5EoF+rzT/u/COMO3mhBD7TjsgPzYx3BE2lMRvg6WQNERVwituRj8SvHYXvPHi7Im/xKt+Mw/WnvuiXHmXKUYnGEzxadxeRxjBOzlyUNEwHXw8BZckDmooLSNDZ+2uqR3T2rsRYtLm0qqLS9wAPGvWvAOaqJ/erBqAHPO9rEDLNNllIBM3nbTDNfMn03tPqfeNB9lkdBeaA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763691761; c=relaxed/relaxed;
	bh=OWpop7EczyzMtxVk1H5X074PcZRbXBU8JW4kSewAWro=;
	h=Subject:To:CC:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=LhfLzxAD7J8+o2sMlATpOHHbEWr1Ctg5+rAirvnmSEPbhgOCiCQSPBRwv/kZIJoubpuzfFStT9odkLfcOm/vWcePRC7nampoONuaeaX41R1Vu3ND14938WgQeTtS0AtvAS6kxOWgogRrjniKImkRqjutRwX53VKsReVHeQjS4qpJrbwFWoWRhyLz7/o3ibpYS+qBPnPyvY8mokKatk3kbGbif+C7QH4Rs/7mm7++MO7lPN8fLbh+cPBqJ0TOExtjxllPPuhwKW9YZfXtftusKp6zAiRx98SMXVdX7Vzh1xzQB5Mqut1qYPiz1Ls7MWH0jyV2US89maw59wu4xIENXw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; dkim=pass (1024-bit key; unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=R1hj1NNz; dkim-atps=neutral; spf=pass (client-ip=113.46.200.224; helo=canpmsgout09.his.huawei.com; envelope-from=guohanjun@huawei.com; receiver=lists.ozlabs.org) smtp.mailfrom=huawei.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=R1hj1NNz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=113.46.200.224; helo=canpmsgout09.his.huawei.com; envelope-from=guohanjun@huawei.com; receiver=lists.ozlabs.org)
Received: from canpmsgout09.his.huawei.com (canpmsgout09.his.huawei.com [113.46.200.224])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dCJsD4636z2yD5
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Nov 2025 13:22:40 +1100 (AEDT)
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=OWpop7EczyzMtxVk1H5X074PcZRbXBU8JW4kSewAWro=;
	b=R1hj1NNznJn+tfgB0ayfX5o8vmLAqmDbDTi1fp3nnhDkgAf6rMG/ePZi+uUhRMkQV4/vAbCoN
	Poc/xtx15swDW+oJSzVQMLYtuQYTppIcU7FHk/aGDH+GjZutx7oVhiNgAd+CjL9/xHjmo4B6B9Q
	jJ8vGiLRCyw+nWn0bw39sao=
Received: from mail.maildlp.com (unknown [172.19.163.44])
	by canpmsgout09.his.huawei.com (SkyGuard) with ESMTPS id 4dCJq63xSKz1cyQG;
	Fri, 21 Nov 2025 10:20:50 +0800 (CST)
Received: from dggpemf500002.china.huawei.com (unknown [7.185.36.57])
	by mail.maildlp.com (Postfix) with ESMTPS id AB8A8140295;
	Fri, 21 Nov 2025 10:22:35 +0800 (CST)
Received: from [10.174.178.247] (10.174.178.247) by
 dggpemf500002.china.huawei.com (7.185.36.57) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 21 Nov 2025 10:22:34 +0800
Subject: Re: [PATCH 5/6 v7] acpi/ghes: Add helper to copy CXL protocol error
 info to work struct
To: "Fabio M. De Francesco" <fabio.m.de.francesco@linux.intel.com>,
	<linux-cxl@vger.kernel.org>
CC: "Rafael J . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
	Tony Luck <tony.luck@intel.com>, Borislav Petkov <bp@alien8.de>, Mauro
 Carvalho Chehab <mchehab@kernel.org>, Shuai Xue <xueshuai@linux.alibaba.com>,
	Davidlohr Bueso <dave@stgolabs.net>, Jonathan Cameron
	<jonathan.cameron@huawei.com>, Dave Jiang <dave.jiang@intel.com>, Alison
 Schofield <alison.schofield@intel.com>, Vishal Verma
	<vishal.l.verma@intel.com>, Ira Weiny <ira.weiny@intel.com>, Dan Williams
	<dan.j.williams@intel.com>, Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
	Oliver O'Halloran <oohall@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>,
	<linux-kernel@vger.kernel.org>, <linux-acpi@vger.kernel.org>,
	<linuxppc-dev@lists.ozlabs.org>, <linux-pci@vger.kernel.org>
References: <20251104182446.863422-1-fabio.m.de.francesco@linux.intel.com>
 <20251104182446.863422-6-fabio.m.de.francesco@linux.intel.com>
From: Hanjun Guo <guohanjun@huawei.com>
Message-ID: <db92285d-43ec-c057-ad35-bbbdff7b8608@huawei.com>
Date: Fri, 21 Nov 2025 10:22:33 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
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
In-Reply-To: <20251104182446.863422-6-fabio.m.de.francesco@linux.intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.178.247]
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 dggpemf500002.china.huawei.com (7.185.36.57)
X-Spam-Status: No, score=-2.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 2025/11/5 2:22, Fabio M. De Francesco wrote:
> Make a helper out of cxl_cper_post_prot_err() that checks the CXL agent
> type and copy the CPER CXL protocol errors information to a work data
> structure.
> 
> Export the new symbol for reuse by ELOG.
> 
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
> Signed-off-by: Fabio M. De Francesco <fabio.m.de.francesco@linux.intel.com>
> ---
>   drivers/acpi/apei/ghes.c | 42 ++++++++++++++++++++++++++--------------
>   include/cxl/event.h      | 10 ++++++++++
>   2 files changed, 37 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/acpi/apei/ghes.c b/drivers/acpi/apei/ghes.c
> index e69ae864f43d..2f4632d9855a 100644
> --- a/drivers/acpi/apei/ghes.c
> +++ b/drivers/acpi/apei/ghes.c
> @@ -734,20 +734,12 @@ int cxl_cper_sec_prot_err_valid(struct cxl_cper_sec_prot_err *prot_err)
>   }
>   EXPORT_SYMBOL_GPL(cxl_cper_sec_prot_err_valid);
>   
> -static void cxl_cper_post_prot_err(struct cxl_cper_sec_prot_err *prot_err,
> -				   int severity)
> +int cxl_cper_setup_prot_err_work_data(struct cxl_cper_prot_err_work_data *wd,
> +				      struct cxl_cper_sec_prot_err *prot_err,
> +				      int severity)
>   {
> -	struct cxl_cper_prot_err_work_data wd;
>   	u8 *dvsec_start, *cap_start;
>   
> -	if (cxl_cper_sec_prot_err_valid(prot_err))
> -		return;
> -
> -	guard(spinlock_irqsave)(&cxl_cper_prot_err_work_lock);
> -
> -	if (!cxl_cper_prot_err_work)
> -		return;
> -
>   	switch (prot_err->agent_type) {
>   	case RCD:
>   	case DEVICE:
> @@ -756,20 +748,40 @@ static void cxl_cper_post_prot_err(struct cxl_cper_sec_prot_err *prot_err,
>   	case RP:
>   	case DSP:
>   	case USP:
> -		memcpy(&wd.prot_err, prot_err, sizeof(wd.prot_err));
> +		memcpy(&wd->prot_err, prot_err, sizeof(wd->prot_err));
>   
>   		dvsec_start = (u8 *)(prot_err + 1);
>   		cap_start = dvsec_start + prot_err->dvsec_len;
>   
> -		memcpy(&wd.ras_cap, cap_start, sizeof(wd.ras_cap));
> -		wd.severity = cper_severity_to_aer(severity);
> +		memcpy(&wd->ras_cap, cap_start, sizeof(wd->ras_cap));
> +		wd->severity = cper_severity_to_aer(severity);
>   		break;
>   	default:
>   		pr_err_ratelimited("CXL CPER invalid agent type: %d\n",
>   				   prot_err->agent_type);
> -		return;
> +		return -EINVAL;
>   	}
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
>   	if (!kfifo_put(&cxl_cper_prot_err_fifo, wd)) {
>   		pr_err_ratelimited("CXL CPER kfifo overflow\n");
>   		return;
> diff --git a/include/cxl/event.h b/include/cxl/event.h
> index 4d7d1036ea9c..94081aec597a 100644
> --- a/include/cxl/event.h
> +++ b/include/cxl/event.h
> @@ -322,12 +322,22 @@ static inline int cxl_cper_prot_err_kfifo_get(struct cxl_cper_prot_err_work_data
>   
>   #ifdef CONFIG_ACPI_APEI_PCIEAER
>   int cxl_cper_sec_prot_err_valid(struct cxl_cper_sec_prot_err *prot_err);
> +int cxl_cper_setup_prot_err_work_data(struct cxl_cper_prot_err_work_data *wd,
> +				      struct cxl_cper_sec_prot_err *prot_err,
> +				      int severity);
>   #else
>   static inline int
>   cxl_cper_sec_prot_err_valid(struct cxl_cper_sec_prot_err *prot_err)
>   {
>   	return -EOPNOTSUPP;
>   }
> +static inline int
> +cxl_cper_setup_prot_err_work_data(struct cxl_cper_prot_err_work_data *wd,
> +				  struct cxl_cper_sec_prot_err *prot_err,
> +				  int severity)
> +{
> +	return -EOPNOTSUPP;
> +}
>   #endif
>   
>   #endif /* _LINUX_CXL_EVENT_H */

Reviewed-by: Hanjun Guo <guohanjun@huawei.com>

Thanks
Hanjun

