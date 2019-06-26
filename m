Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 707715639F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Jun 2019 09:46:44 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45YZq42KkmzDqYJ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Jun 2019 17:46:40 +1000 (AEST)
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
 header.i=@ozlabs-ru.20150623.gappssmtp.com header.b="YUSikd56"; 
 dkim-atps=neutral
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45YZmt576jzDqSL
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Jun 2019 17:44:44 +1000 (AEST)
Received: by mail-pf1-x442.google.com with SMTP id p184so890125pfp.7
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Jun 2019 00:44:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=vy6mQVlU0KOfUw4m/PI3XEvU3SSXTjzomsJoAAMbON4=;
 b=YUSikd56FWQc8xGu7+N89iFRIVFfFnJfbW9shaFobiuEU31hKh9P/dBmyhbiYO8TtK
 vRV4fvOBmwfTziDIlGDdXWKdArhbgJfd4oHoM3xiKORyUM9mZFia3qDidWmXwigAOYS+
 eAxJHvkspnNn99FSU4qx+O75H7eRo2b3Pt3WFKbJCV4OVmGEmJetVjpTIy6qGxprs1s1
 bwCvVdME5/n3BAHv3ATey7PSHKx+8bFeZvUxEGTxC19isD2oGE5oNRGKhOqDpHhgwxMY
 AjcRP9vbyjYZx3+SiuuGXwFYnMGCKX2q3z2xhyJzYE7Z7CGFC5/9JOxAPuIpyb+zQOog
 KGJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=vy6mQVlU0KOfUw4m/PI3XEvU3SSXTjzomsJoAAMbON4=;
 b=Eqma9/MjTrTmgmoPeqaXJRSejGl3MsLiyy4kpL5WyIVd0+iSXjSUS7SBFZ6PDCxiYT
 j7sbxIKUnnF6lYxK6rASi3W6J/CwjOnlRb2yrhk58RhQ5U5UqSPno7lYYl5ZmQSv/p3V
 XPp6ITb6bqQ0a+I1pREP09dhOXWx8asOPH4n2WuUap24uS+xdjyEP6gcJdvx0xjiYiky
 xDev9ARs9cGriY1n0E6PesNPLEeXvIYTt5L7Piu6ZLj9FxVS8od+mMGZZ2R5A43H7Ofj
 Ft8QBL+GFP+rhqfYx57xc4gEc7qHY8SGHMGHIoJDmPb5mT8H8WwA42npjhaQDDjjSxUf
 HeJg==
X-Gm-Message-State: APjAAAWkeUABaSr5ZwPEcSm0OPKqSeurT3hMK3+Xwj3zGYhkZB3bkMXn
 S97F/03hSQzFKfFRD7QOOC6NoA==
X-Google-Smtp-Source: APXvYqyG4Br7cvTylP+6sGJGQvf8P0Agwv7Ni5UVSIMe7FenQ8vvwk3hzk4PyyY1pmcZ7fNeeFI+UQ==
X-Received: by 2002:a63:fb4b:: with SMTP id w11mr1555774pgj.415.1561535081832; 
 Wed, 26 Jun 2019 00:44:41 -0700 (PDT)
Received: from [10.61.2.175] ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id s66sm7959162pgs.39.2019.06.26.00.44.37
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 26 Jun 2019 00:44:41 -0700 (PDT)
Subject: Re: [RFC PATCH 03/12] powerpc/prom_init: Add the ESM call to prom_init
To: Thiago Jung Bauermann <bauerman@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
References: <20190521044912.1375-1-bauerman@linux.ibm.com>
 <20190521044912.1375-4-bauerman@linux.ibm.com>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
Openpgp: preference=signencrypt
Autocrypt: addr=aik@ozlabs.ru; keydata=
 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
Message-ID: <3b45cc84-273b-b333-831c-85c501b7e78e@ozlabs.ru>
Date: Wed, 26 Jun 2019 17:44:35 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190521044912.1375-4-bauerman@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
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



On 21/05/2019 14:49, Thiago Jung Bauermann wrote:
> From: Ram Pai <linuxram@us.ibm.com>
> 
> Make the Enter-Secure-Mode (ESM) ultravisor call to switch the VM to secure
> mode. Add "svm=" command line option to turn off switching to secure mode.
> Introduce CONFIG_PPC_SVM to control support for secure guests.
> 
> Signed-off-by: Ram Pai <linuxram@us.ibm.com>
> [ Generate an RTAS os-term hcall when the ESM ucall fails. ]
> Signed-off-by: Michael Anderson <andmike@linux.ibm.com>
> [ Cleaned up the code a bit. ]
> Signed-off-by: Thiago Jung Bauermann <bauerman@linux.ibm.com>
> ---
>  .../admin-guide/kernel-parameters.txt         |   5 +
>  arch/powerpc/include/asm/ultravisor-api.h     |   1 +
>  arch/powerpc/kernel/prom_init.c               | 124 ++++++++++++++++++
>  3 files changed, 130 insertions(+)
> 
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index c45a19d654f3..7237d86b25c6 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -4501,6 +4501,11 @@
>  			/sys/power/pm_test). Only available when CONFIG_PM_DEBUG
>  			is set. Default value is 5.
>  
> +	svm=		[PPC]
> +			Format: { on | off | y | n | 1 | 0 }
> +			This parameter controls use of the Protected
> +			Execution Facility on pSeries.
> +
>  	swapaccount=[0|1]
>  			[KNL] Enable accounting of swap in memory resource
>  			controller if no parameter or 1 is given or disable
> diff --git a/arch/powerpc/include/asm/ultravisor-api.h b/arch/powerpc/include/asm/ultravisor-api.h
> index 15e6ce77a131..0e8b72081718 100644
> --- a/arch/powerpc/include/asm/ultravisor-api.h
> +++ b/arch/powerpc/include/asm/ultravisor-api.h
> @@ -19,6 +19,7 @@
>  
>  /* opcodes */
>  #define UV_WRITE_PATE			0xF104
> +#define UV_ESM				0xF110
>  #define UV_RETURN			0xF11C
>  
>  #endif /* _ASM_POWERPC_ULTRAVISOR_API_H */
> diff --git a/arch/powerpc/kernel/prom_init.c b/arch/powerpc/kernel/prom_init.c
> index 523bb99d7676..5d8a3efb54f2 100644
> --- a/arch/powerpc/kernel/prom_init.c
> +++ b/arch/powerpc/kernel/prom_init.c
> @@ -44,6 +44,7 @@
>  #include <asm/sections.h>
>  #include <asm/machdep.h>
>  #include <asm/asm-prototypes.h>
> +#include <asm/ultravisor-api.h>
>  
>  #include <linux/linux_logo.h>
>  
> @@ -174,6 +175,10 @@ static unsigned long __prombss prom_tce_alloc_end;
>  static bool __prombss prom_radix_disable;
>  #endif
>  
> +#ifdef CONFIG_PPC_SVM
> +static bool __prombss prom_svm_disable;
> +#endif
> +
>  struct platform_support {
>  	bool hash_mmu;
>  	bool radix_mmu;
> @@ -809,6 +814,17 @@ static void __init early_cmdline_parse(void)
>  	if (prom_radix_disable)
>  		prom_debug("Radix disabled from cmdline\n");
>  #endif /* CONFIG_PPC_PSERIES */
> +
> +#ifdef CONFIG_PPC_SVM
> +	opt = prom_strstr(prom_cmd_line, "svm=");
> +	if (opt) {
> +		bool val;
> +
> +		opt += sizeof("svm=") - 1;
> +		if (!prom_strtobool(opt, &val))
> +			prom_svm_disable = !val;
> +	}
> +#endif /* CONFIG_PPC_SVM */
>  }
>  
>  #ifdef CONFIG_PPC_PSERIES
> @@ -1707,6 +1723,43 @@ static void __init prom_close_stdin(void)
>  	}
>  }
>  
> +#ifdef CONFIG_PPC_SVM
> +static int prom_rtas_os_term_hcall(uint64_t args)


This is just an rtas hcall, nothing special about "os-term".


> +{
> +	register uint64_t arg1 asm("r3") = 0xf000;
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
> +	prom_printf("%s: start...\n", __func__);
> +	rtas_node = call_prom("finddevice", 1, 1, ADDR("/rtas"));
> +	prom_printf("rtas_node: %x\n", rtas_node);
> +	if (!PHANDLE_VALID(rtas_node))
> +		return;
> +
> +	val = 0;
> +	prom_getprop(rtas_node, "ibm,os-term", &val, sizeof(val));
> +	token = be32_to_cpu(val);
> +	prom_printf("ibm,os-term: %x\n", token);
> +	if (token == 0)
> +		prom_panic("Could not get token for ibm,os-term\n");
> +	os_term_args.token = cpu_to_be32(token);
> +	prom_rtas_os_term_hcall((uint64_t)&os_term_args);
> +}
> +#endif /* CONFIG_PPC_SVM */
> +
>  /*
>   * Allocate room for and instantiate RTAS
>   */
> @@ -3162,6 +3215,74 @@ static void unreloc_toc(void)
>  #endif
>  #endif
>  
> +#ifdef CONFIG_PPC_SVM
> +/*
> + * The ESM blob is a data structure with information needed by the Ultravisor to
> + * validate the integrity of the secure guest.
> + */
> +static void *get_esm_blob(void)
> +{
> +	/*
> +	 * FIXME: We are still finalizing the details on how prom_init will grab
> +	 * the ESM blob. When that is done, this function will be updated.
> +	 */
> +	return (void *)0xdeadbeef;
> +}
> +
> +/*
> + * Perform the Enter Secure Mode ultracall.
> + */
> +static int enter_secure_mode(void *esm_blob, void *retaddr, void *fdt)
> +{
> +	register uint64_t func asm("r0") = UV_ESM;
> +	register uint64_t arg1 asm("r3") = (uint64_t)esm_blob;
> +	register uint64_t arg2 asm("r4") = (uint64_t)retaddr;
> +	register uint64_t arg3 asm("r5") = (uint64_t)fdt;
> +
> +	asm volatile("sc 2\n"
> +		     : "=r"(arg1)
> +		     : "r"(func), "0"(arg1), "r"(arg2), "r"(arg3)
> +		     :);
> +
> +	return (int)arg1;
> +}
> +
> +/*
> + * Call the Ultravisor to transfer us to secure memory if we have an ESM blob.
> + */
> +static void setup_secure_guest(void *fdt)
> +{
> +	void *esm_blob;
> +	int ret;
> +
> +	if (prom_svm_disable) {
> +		prom_printf("Secure mode is OFF\n");
> +		return;
> +	}
> +
> +	esm_blob = get_esm_blob();
> +	if (esm_blob == NULL)
> +		/*
> +		 * Absence of an ESM blob isn't an error, it just means we
> +		 * shouldn't switch to secure mode.
> +		 */
> +		return;
> +
> +	/* Switch to secure mode. */
> +	prom_printf("Switching to secure mode.\n");
> +
> +	ret = enter_secure_mode(esm_blob, NULL, fdt);
> +	if (ret != U_SUCCESS) {
> +		prom_printf("Returned %d from switching to secure mode.\n", ret);
> +		prom_rtas_os_term("Switch to secure mode failed.\n");
> +	}
> +}
> +#else
> +static void setup_secure_guest(void *fdt)
> +{
> +}
> +#endif /* CONFIG_PPC_SVM */
> +
>  /*
>   * We enter here early on, when the Open Firmware prom is still
>   * handling exceptions and the MMU hash table for us.
> @@ -3360,6 +3481,9 @@ unsigned long __init prom_init(unsigned long r3, unsigned long r4,
>  	unreloc_toc();
>  #endif
>  
> +	/* Move to secure memory if we're supposed to be secure guests. */
> +	setup_secure_guest((void *)hdr);
> +
>  	__start(hdr, kbase, 0, 0, 0, 0, 0);
>  
>  	return 0;
> 

-- 
Alexey
