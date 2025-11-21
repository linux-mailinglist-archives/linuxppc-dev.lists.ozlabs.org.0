Return-Path: <linuxppc-dev+bounces-14383-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A5163C76FC3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Nov 2025 03:16:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dCJkT3CRDz2yG5;
	Fri, 21 Nov 2025 13:16:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=113.46.200.222
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763691409;
	cv=none; b=oJ33HGmxE8Bj0YOrWCaV/tvag4y20B1oHkP7BhDufNMkS1zApYKUF99Db6pzcD3RKZIm6sAEVgsAh6xeLd8aoEs4gOTa2CHPSn+2yiyqrc7XNwA4CiVAS1Wc+/ehq2LA1QjQFdQBFJAV4hQkhIs7yw82EPLVrgwTF6WYzieB0dPdstCa4fb7MucwWhj2nQyf/mqvWLl7nxyPG0+dC8thjyjY8WG0B3CTTKH+0H8A1uetxJS/X9E680wYBTcXr7fqS7jVR6PifYSVy1Qv/3XEUHEA0V3uSSTiMJILCeOolE4dzIatifGijVGQ9+MOxJK+/J6f70gP24GgWdXQQHNu/w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763691409; c=relaxed/relaxed;
	bh=unDFX70B+FQbAkazFOoPJRogIVHvfB0DVd2thP7YQjA=;
	h=Subject:To:CC:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=cwV8iIzAMqbreHSybMghkX5EVKZMtp4NrL9x3JnWZ7q8xW+AA0D2WpoisSjFdtzAPL6N0Hgvv3ex6QeerrrMlkiZX8mbGX7foYG8sZgFPFMalVg1hqizwrVV9BkJpIEsM10NZJvyIjP0YSlTyaUu60gJiLKc7svjcvMVM+7wXWioZZRTzLE198d4jE/y9mDQsqTsKULWoRdJFsjMooxFCnoWksaiQBQ7JCrfdMUiD3r9ZE1O7rzfO/MmVT3DaMlXHXVTaIuMTVEY38ynRMnH37ay+8Z+9nM7yWW0z8kUUMNJ/9tz6u1lNPNB+6AaqZ0Vg3XVemR8WtLp6DsX5Mh4Xw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; dkim=pass (1024-bit key; unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=RvqFAzh+; dkim-atps=neutral; spf=pass (client-ip=113.46.200.222; helo=canpmsgout07.his.huawei.com; envelope-from=guohanjun@huawei.com; receiver=lists.ozlabs.org) smtp.mailfrom=huawei.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=RvqFAzh+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=113.46.200.222; helo=canpmsgout07.his.huawei.com; envelope-from=guohanjun@huawei.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 268 seconds by postgrey-1.37 at boromir; Fri, 21 Nov 2025 13:16:46 AEDT
Received: from canpmsgout07.his.huawei.com (canpmsgout07.his.huawei.com [113.46.200.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dCJkQ5Cwhz2yD5
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Nov 2025 13:16:45 +1100 (AEDT)
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=unDFX70B+FQbAkazFOoPJRogIVHvfB0DVd2thP7YQjA=;
	b=RvqFAzh+qpKThBRqRW6kA80R70j3IuhxyjOmmvhA93YhlQPV1s8Zx8t8fVQ5t41sFFKciqovn
	K48KnlhRMiyY/v8UUuVtN8+wkrSevMoirig60uW9NKOgkl4my+p4EGMz5i+0lLr2JOomFfAOXok
	F/JwpkKB9oS/QfQG6Fk5OFE=
Received: from mail.maildlp.com (unknown [172.19.88.163])
	by canpmsgout07.his.huawei.com (SkyGuard) with ESMTPS id 4dCJhH4K5dzLlSZ;
	Fri, 21 Nov 2025 10:14:55 +0800 (CST)
Received: from dggpemf500002.china.huawei.com (unknown [7.185.36.57])
	by mail.maildlp.com (Postfix) with ESMTPS id 0FFE4180043;
	Fri, 21 Nov 2025 10:16:40 +0800 (CST)
Received: from [10.174.178.247] (10.174.178.247) by
 dggpemf500002.china.huawei.com (7.185.36.57) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 21 Nov 2025 10:16:38 +0800
Subject: Re: [PATCH 4/6 v7] acpi/ghes: Add helper for CXL protocol errors
 checks
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
 <20251104182446.863422-5-fabio.m.de.francesco@linux.intel.com>
From: Hanjun Guo <guohanjun@huawei.com>
Message-ID: <356c8be5-1397-a317-2354-4e8e25bba305@huawei.com>
Date: Fri, 21 Nov 2025 10:16:37 +0800
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
In-Reply-To: <20251104182446.863422-5-fabio.m.de.francesco@linux.intel.com>
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
> Move the CPER CXL protocol errors validity check out of
> cxl_cper_post_prot_err() to new cxl_cper_sec_prot_err_valid() and limit
> the serial number check only to CXL agents that are CXL devices (UEFI
> v2.10, Appendix N.2.13).
> 
> Export the new symbol for reuse by ELOG.
> 
> Signed-off-by: Fabio M. De Francesco <fabio.m.de.francesco@linux.intel.com>
> ---
>   drivers/acpi/apei/ghes.c | 32 ++++++++++++++++++++++----------
>   include/cxl/event.h      | 10 ++++++++++
>   2 files changed, 32 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/acpi/apei/ghes.c b/drivers/acpi/apei/ghes.c
> index d6fe5f020e96..e69ae864f43d 100644
> --- a/drivers/acpi/apei/ghes.c
> +++ b/drivers/acpi/apei/ghes.c
> @@ -706,30 +706,42 @@ static DEFINE_KFIFO(cxl_cper_prot_err_fifo, struct cxl_cper_prot_err_work_data,
>   static DEFINE_SPINLOCK(cxl_cper_prot_err_work_lock);
>   struct work_struct *cxl_cper_prot_err_work;
>   
> -static void cxl_cper_post_prot_err(struct cxl_cper_sec_prot_err *prot_err,
> -				   int severity)
> +int cxl_cper_sec_prot_err_valid(struct cxl_cper_sec_prot_err *prot_err)
>   {
> -	struct cxl_cper_prot_err_work_data wd;
> -	u8 *dvsec_start, *cap_start;
> -
>   	if (!(prot_err->valid_bits & PROT_ERR_VALID_AGENT_ADDRESS)) {
>   		pr_err_ratelimited("CXL CPER invalid agent type\n");
> -		return;
> +		return -EINVAL;
>   	}
>   
>   	if (!(prot_err->valid_bits & PROT_ERR_VALID_ERROR_LOG)) {
>   		pr_err_ratelimited("CXL CPER invalid protocol error log\n");
> -		return;
> +		return -EINVAL;
>   	}
>   
>   	if (prot_err->err_len != sizeof(struct cxl_ras_capability_regs)) {
>   		pr_err_ratelimited("CXL CPER invalid RAS Cap size (%u)\n",
>   				   prot_err->err_len);
> -		return;
> +		return -EINVAL;
>   	}
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
>   	guard(spinlock_irqsave)(&cxl_cper_prot_err_work_lock);
>   
> diff --git a/include/cxl/event.h b/include/cxl/event.h
> index 6fd90f9cc203..4d7d1036ea9c 100644
> --- a/include/cxl/event.h
> +++ b/include/cxl/event.h
> @@ -320,4 +320,14 @@ static inline int cxl_cper_prot_err_kfifo_get(struct cxl_cper_prot_err_work_data
>   }
>   #endif
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
>   #endif /* _LINUX_CXL_EVENT_H */

Reviewed-by: Hanjun Guo <guohanjun@huawei.com>

Thanks
Hanjun

