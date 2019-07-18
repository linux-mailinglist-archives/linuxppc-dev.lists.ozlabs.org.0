Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 444D86CAAE
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Jul 2019 10:13:56 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45q6NK26v7zDqL9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Jul 2019 18:13:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=ozlabs.ru
 (client-ip=2607:f8b0:4864:20::442; helo=mail-pf1-x442.google.com;
 envelope-from=aik@ozlabs.ru; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ozlabs.ru
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ozlabs-ru.20150623.gappssmtp.com
 header.i=@ozlabs-ru.20150623.gappssmtp.com header.b="dV1qtd4V"; 
 dkim-atps=neutral
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45q6L81vXBzDqJM
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Jul 2019 18:11:57 +1000 (AEST)
Received: by mail-pf1-x442.google.com with SMTP id 19so12243989pfa.4
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Jul 2019 01:11:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=AAMO+YwwE2ieI993U2rCRnUi2WpqUahZkNfrTH4tCog=;
 b=dV1qtd4VTc9kjcu7gVzQDzhPj/t3ziv79DJ+Zpn9gcg0hf+W9bdrO/2s7c8IhEIesm
 H1fDCz79BwDQLp9BKbEAolZcJaDpoIuGGz34zMLOKZu00YDtUSX2KBBRh7YfNahtevx5
 x/x4TPlwP6eFkfeFTMkcez4hG7LCisVF1ZwmkF2LXKeYKdzfxyL028JABQfWrOGXLY4U
 LCdoaDAhWkID/CYyerXweTQoFuwCjlQbGPf4o/Tsr4aL0tFK9ctqm9nxY413/mWN5JT2
 YwvIuyG8MwUUAmiMDRKK4Prw18L9Q8LYNEfDmCBiUc2Xvf056uW9J6yI9v92PrMhGtmL
 vQHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=AAMO+YwwE2ieI993U2rCRnUi2WpqUahZkNfrTH4tCog=;
 b=gNMdUklIwAJfuIu8eA9VG2tuytHGbds9yDMUrmdQET34WILmGnsJ7vZgv98nM+Qub0
 3m0T98wgpgLOhZ/pBcdN7O1l9kRtZnZtqEa0OjsVWQsWwFH00PkYGkAgIRXCDA5+l8fU
 XSrG3d6xcdiZ2/zANFwUOI8Wf1ETIg4QmDsK5JNSRy5Jl7rVEae1dOSLKTpsXL4xkIdW
 GT2EES7WV71qfFCOI9mDBLHrLh/ZfBO9gGY70fubrX8Q556PAZXwm3IpG8vYwf1KiNEV
 iKcY0R58Fg2ronj6XdUUIRLiVz+tvyJAoXqgOGGJy47Ve/CxdKNvBCeKsDeZyUuVpVyw
 4+rg==
X-Gm-Message-State: APjAAAXClosMSl/tz3HqaXl1Yh6TLIrw0Rwpukq4wAGsy+vVtRmfOiVQ
 /KycP7tyJNFitYaMjkGMXWg=
X-Google-Smtp-Source: APXvYqy+dtMibJbgTdLODBR8eI2/4NAMgMIVbLeZLw0ShahLUBycyZuuofCvZRR9+0q2qnM/CbdZjA==
X-Received: by 2002:a65:500a:: with SMTP id f10mr15393467pgo.105.1563437515134; 
 Thu, 18 Jul 2019 01:11:55 -0700 (PDT)
Received: from [10.61.2.175] ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id 143sm42084649pgc.6.2019.07.18.01.11.50
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 18 Jul 2019 01:11:54 -0700 (PDT)
Subject: Re: [PATCH v2 03/13] powerpc/prom_init: Add the ESM call to prom_init
To: Thiago Jung Bauermann <bauerman@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
References: <20190713060023.8479-1-bauerman@linux.ibm.com>
 <20190713060023.8479-4-bauerman@linux.ibm.com>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
Message-ID: <70f8097f-7222-fe18-78b4-9372c21bfc9d@ozlabs.ru>
Date: Thu, 18 Jul 2019 18:11:48 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190713060023.8479-4-bauerman@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: Anshuman Khandual <anshuman.linux@gmail.com>,
 Mike Anderson <andmike@linux.ibm.com>, Ram Pai <linuxram@us.ibm.com>,
 linux-kernel@vger.kernel.org, Claudio Carvalho <cclaudio@linux.ibm.com>,
 Paul Mackerras <paulus@samba.org>, Christoph Hellwig <hch@lst.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 13/07/2019 16:00, Thiago Jung Bauermann wrote:
> From: Ram Pai <linuxram@us.ibm.com>
> 
> Make the Enter-Secure-Mode (ESM) ultravisor call to switch the VM to secure
> mode. Add "svm=" command line option to turn on switching to secure mode.
> 
> Signed-off-by: Ram Pai <linuxram@us.ibm.com>
> [ andmike: Generate an RTAS os-term hcall when the ESM ucall fails. ]
> Signed-off-by: Michael Anderson <andmike@linux.ibm.com>
> [ bauerman: Cleaned up the code a bit. ]
> Signed-off-by: Thiago Jung Bauermann <bauerman@linux.ibm.com>
> ---
>   .../admin-guide/kernel-parameters.txt         |  5 +
>   arch/powerpc/include/asm/ultravisor-api.h     |  1 +
>   arch/powerpc/kernel/prom_init.c               | 99 +++++++++++++++++++
>   3 files changed, 105 insertions(+)
> 
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index 7b15abf7db21..c611891b5992 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -4585,6 +4585,11 @@
>   			/sys/power/pm_test). Only available when CONFIG_PM_DEBUG
>   			is set. Default value is 5.
>   
> +	svm=		[PPC]
> +			Format: { on | off | y | n | 1 | 0 }
> +			This parameter controls use of the Protected
> +			Execution Facility on pSeries.
> +
>   	swapaccount=[0|1]
>   			[KNL] Enable accounting of swap in memory resource
>   			controller if no parameter or 1 is given or disable
> diff --git a/arch/powerpc/include/asm/ultravisor-api.h b/arch/powerpc/include/asm/ultravisor-api.h
> index c8180427fa01..fe9a0d8d7673 100644
> --- a/arch/powerpc/include/asm/ultravisor-api.h
> +++ b/arch/powerpc/include/asm/ultravisor-api.h
> @@ -19,6 +19,7 @@
>   
>   /* opcodes */
>   #define UV_WRITE_PATE			0xF104
> +#define UV_ESM				0xF110
>   #define UV_RETURN			0xF11C
>   #define UV_REGISTER_MEM_SLOT		0xF120
>   #define UV_UNREGISTER_MEM_SLOT		0xF124
> diff --git a/arch/powerpc/kernel/prom_init.c b/arch/powerpc/kernel/prom_init.c
> index a3fb90bb5a39..6389a992451b 100644
> --- a/arch/powerpc/kernel/prom_init.c
> +++ b/arch/powerpc/kernel/prom_init.c
> @@ -44,6 +44,7 @@
>   #include <asm/sections.h>
>   #include <asm/machdep.h>
>   #include <asm/asm-prototypes.h>
> +#include <asm/ultravisor-api.h>
>   
>   #include <linux/linux_logo.h>
>   
> @@ -175,6 +176,10 @@ static bool __prombss prom_radix_disable;
>   static bool __prombss prom_xive_disable;
>   #endif
>   
> +#ifdef CONFIG_PPC_SVM
> +static bool __prombss prom_svm_enable;
> +#endif
> +
>   struct platform_support {
>   	bool hash_mmu;
>   	bool radix_mmu;
> @@ -816,6 +821,17 @@ static void __init early_cmdline_parse(void)
>   		prom_debug("XIVE disabled from cmdline\n");
>   	}
>   #endif /* CONFIG_PPC_PSERIES */
> +
> +#ifdef CONFIG_PPC_SVM
> +	opt = prom_strstr(prom_cmd_line, "svm=");
> +	if (opt) {
> +		bool val;
> +
> +		opt += sizeof("svm=") - 1;
> +		if (!prom_strtobool(opt, &val))
> +			prom_svm_enable = val;
> +	}
> +#endif /* CONFIG_PPC_SVM */
>   }
>   
>   #ifdef CONFIG_PPC_PSERIES
> @@ -1716,6 +1732,43 @@ static void __init prom_close_stdin(void)
>   	}
>   }
>   
> +#ifdef CONFIG_PPC_SVM
> +static int prom_rtas_hcall(uint64_t args)
> +{
> +	register uint64_t arg1 asm("r3") = H_RTAS;
> +	register uint64_t arg2 asm("r4") = args;
> +
> +	asm volatile("sc 1\n" : "=r" (arg1) :
> +			"r" (arg1),
> +			"r" (arg2) :);
> +	return arg1;
> +}
> +
> +static struct rtas_args __prombss os_term_args;
> +
> +static void __init prom_rtas_os_term(char *str)
> +{
> +	phandle rtas_node;
> +	__be32 val;
> +	u32 token;
> +
> +	prom_debug("%s: start...\n", __func__);
> +	rtas_node = call_prom("finddevice", 1, 1, ADDR("/rtas"));
> +	prom_debug("rtas_node: %x\n", rtas_node);
> +	if (!PHANDLE_VALID(rtas_node))
> +		return;
> +
> +	val = 0;
> +	prom_getprop(rtas_node, "ibm,os-term", &val, sizeof(val));
> +	token = be32_to_cpu(val);
> +	prom_debug("ibm,os-term: %x\n", token);
> +	if (token == 0)
> +		prom_panic("Could not get token for ibm,os-term\n");
> +	os_term_args.token = cpu_to_be32(token);
> +	prom_rtas_hcall((uint64_t)&os_term_args);
> +}
> +#endif /* CONFIG_PPC_SVM */
> +
>   /*
>    * Allocate room for and instantiate RTAS
>    */
> @@ -3172,6 +3225,49 @@ static void unreloc_toc(void)
>   #endif
>   #endif
>   
> +#ifdef CONFIG_PPC_SVM
> +/*
> + * Perform the Enter Secure Mode ultracall.
> + */
> +static int enter_secure_mode(unsigned long kbase, unsigned long fdt)
> +{
> +	register uint64_t func asm("r3") = UV_ESM;
> +	register uint64_t arg1 asm("r4") = (uint64_t)kbase;
> +	register uint64_t arg2 asm("r5") = (uint64_t)fdt;



What does UV do with kbase and fdt precisely? Few words in the commit 
log will do.


> +
> +	asm volatile("sc 2\n"
> +		     : "=r"(func)
> +		     : "0"(func), "r"(arg1), "r"(arg2)
> +		     :);
> +
> +	return (int)func;


And why "func"? Is it "function"? Weird name. Thanks,


> +}
> +
> +/*
> + * Call the Ultravisor to transfer us to secure memory if we have an ESM blob.
> + */
> +static void setup_secure_guest(unsigned long kbase, unsigned long fdt)
> +{
> +	int ret;
> +
> +	if (!prom_svm_enable)
> +		return;
> +
> +	/* Switch to secure mode. */
> +	prom_printf("Switching to secure mode.\n");
> +
> +	ret = enter_secure_mode(kbase, fdt);
> +	if (ret != U_SUCCESS) {
> +		prom_printf("Returned %d from switching to secure mode.\n", ret);
> +		prom_rtas_os_term("Switch to secure mode failed.\n");
> +	}
> +}
> +#else
> +static void setup_secure_guest(unsigned long kbase, unsigned long fdt)
> +{
> +}
> +#endif /* CONFIG_PPC_SVM */
> +
>   /*
>    * We enter here early on, when the Open Firmware prom is still
>    * handling exceptions and the MMU hash table for us.
> @@ -3370,6 +3466,9 @@ unsigned long __init prom_init(unsigned long r3, unsigned long r4,
>   	unreloc_toc();
>   #endif
>   
> +	/* Move to secure memory if we're supposed to be secure guests. */
> +	setup_secure_guest(kbase, hdr);
> +
>   	__start(hdr, kbase, 0, 0, 0, 0, 0);
>   
>   	return 0;
> 

-- 
Alexey
