Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A88AE1C4E10
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 May 2020 08:09:39 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49GTp90502zDqYb
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 May 2020 16:09:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49GTmj63x0zDqD2
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 May 2020 16:08:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=popple.id.au
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 49GTmj1YHRz9sRf;
 Tue,  5 May 2020 16:08:21 +1000 (AEST)
From: Alistair Popple <alistair@popple.id.au>
To: Jordan Niethe <jniethe5@gmail.com>
Subject: Re: [PATCH v7 24/28] powerpc: Test prefixed code patching
Date: Tue, 05 May 2020 16:08:20 +1000
Message-ID: <6432734.T8lKEjxViR@townsend>
In-Reply-To: <20200501034220.8982-25-jniethe5@gmail.com>
References: <20200501034220.8982-1-jniethe5@gmail.com>
 <20200501034220.8982-25-jniethe5@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
Cc: npiggin@gmail.com, bala24@linux.ibm.com, naveen.n.rao@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Reviewed-by: Alistair Popple <alistair@popple.id.au>

On Friday, 1 May 2020 1:42:16 PM AEST Jordan Niethe wrote:
> Expand the code-patching self-tests to includes tests for patching
> prefixed instructions.
> 
> Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
> ---
> v6: New to series
> ---
>  arch/powerpc/lib/Makefile             |  2 +-
>  arch/powerpc/lib/code-patching.c      | 21 +++++++++++++++++++++
>  arch/powerpc/lib/test_code-patching.S | 19 +++++++++++++++++++
>  3 files changed, 41 insertions(+), 1 deletion(-)
>  create mode 100644 arch/powerpc/lib/test_code-patching.S
> 
> diff --git a/arch/powerpc/lib/Makefile b/arch/powerpc/lib/Makefile
> index 546591848219..5e994cda8e40 100644
> --- a/arch/powerpc/lib/Makefile
> +++ b/arch/powerpc/lib/Makefile
> @@ -16,7 +16,7 @@ CFLAGS_code-patching.o += -DDISABLE_BRANCH_PROFILING
>  CFLAGS_feature-fixups.o += -DDISABLE_BRANCH_PROFILING
>  endif
> 
> -obj-y += alloc.o code-patching.o feature-fixups.o pmem.o inst.o
> +obj-y += alloc.o code-patching.o feature-fixups.o pmem.o inst.o
> test_code-patching.o
> 
>  ifndef CONFIG_KASAN
>  obj-y	+=	string.o memcmp_$(BITS).o
> diff --git a/arch/powerpc/lib/code-patching.c
> b/arch/powerpc/lib/code-patching.c index b32fa707725e..7107c6d01261 100644
> --- a/arch/powerpc/lib/code-patching.c
> +++ b/arch/powerpc/lib/code-patching.c
> @@ -699,6 +699,24 @@ static void __init test_translate_branch(void)
>  	vfree(buf);
>  }
> 
> +#ifdef __powerpc64__
> +static void __init test_prefixed_patching(void)
> +{
> +	extern unsigned int code_patching_test1[];
> +	extern unsigned int code_patching_test1_expected[];
> +	extern unsigned int end_code_patching_test1[];
> +
> +	__patch_instruction((struct ppc_inst *)code_patching_test1,
> +			    ppc_inst_prefix(1 << 26, 0x00000000),
> +			    (struct ppc_inst *)code_patching_test1);
> +
> +	check(!memcmp(code_patching_test1,
> +		      code_patching_test1_expected,
> +		      sizeof(unsigned int) *
> +		      (end_code_patching_test1 - code_patching_test1)));
> +}
> +#endif
> +
>  static int __init test_code_patching(void)
>  {
>  	printk(KERN_DEBUG "Running code patching self-tests ...\n");
> @@ -707,6 +725,9 @@ static int __init test_code_patching(void)
>  	test_branch_bform();
>  	test_create_function_call();
>  	test_translate_branch();
> +#ifdef __powerpc64__
> +	test_prefixed_patching();
> +#endif
> 
>  	return 0;
>  }
> diff --git a/arch/powerpc/lib/test_code-patching.S
> b/arch/powerpc/lib/test_code-patching.S new file mode 100644
> index 000000000000..91aab208a804
> --- /dev/null
> +++ b/arch/powerpc/lib/test_code-patching.S
> @@ -0,0 +1,19 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (C) 2020 IBM Corporation
> + */
> +
> +	.text
> +
> +#define globl(x)		\
> +	.globl x;	\
> +x:
> +
> +globl(code_patching_test1)
> +	nop
> +	nop
> +globl(end_code_patching_test1)
> +
> +globl(code_patching_test1_expected)
> +	.long 1 << 26
> +	.long 0x0000000




