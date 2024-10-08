Return-Path: <linuxppc-dev+bounces-1809-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ACEF5993E33
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Oct 2024 07:10:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XN3y25FDwz30DR;
	Tue,  8 Oct 2024 16:10:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728364250;
	cv=none; b=nCN2xCI+t8BClrejNNCCIYVA13kHgR3r08NlNnrE4vqytC2geTCP9bPAP2M5mxThNAUkgBbHcUa7I8JjpRfBaxoMXf/R3VwziyeC2sLYTezoMN1hqmROrYyv0kw1oP4sIZ2e7wKqcMOAwGmVAaQU2IlO1/T0iiTxKP1BZlrfSNAfOq34oiu9IzMKbnH9BsGm7YKFuwJfgpRo7BfE3Wev4nUnUfdOvetr7oEtCw/0piVAP0QKhmRYnoqEG5ib+0eKHQdrQATCbImMwUqpp1qYQOOZyjwNM2mHrKB6Rvdbtitac4S4wq+XIPblJXD+90SlU+0JY3nc2iRiWtpSvHFmhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728364250; c=relaxed/relaxed;
	bh=u8ZHwSsvEhz/RRt+qiMZeNN7866M9xDbhSYczaylRm8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lwYaHQm2RrhdJFxrIMO8cr0tALDlxoJKKWVPYfQ/I7LicxgGHTwCyXiD7LJT4DYRK3G3t7ZE7WRwcaOOxkmSFEs9aQLcThlLocJYG20U7dVKok59Vvw6EJOevDsIWXui9EwtVpS+aAAD7gnsNwhBC5CRoG3WA2F0Ikv0nfPCyUHyZf2RkeZ5W5G/Tr22ij62698qifGMau8p9uwyXwPxy4hjd8V7+K+QPEOdE4j3fPbGYyzHH1yL7izjQEfJxzva5Tj+8G3eV1r2PFpVPIVpQzlqYG3fnxq7SQqwvNgngzba2cVvwNYXkkqRC6bKazjN5Y34pSfZ0+k2+L6jPVp0PQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XN3xz1zd6z30CD
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Oct 2024 16:10:46 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4XN3xp2XSpz9sPd;
	Tue,  8 Oct 2024 07:10:38 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nhCO1vPA-Xzj; Tue,  8 Oct 2024 07:10:38 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4XN3xp1bkjz9rvV;
	Tue,  8 Oct 2024 07:10:38 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 261A28B766;
	Tue,  8 Oct 2024 07:10:38 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id nuU85h2Dh9gI; Tue,  8 Oct 2024 07:10:38 +0200 (CEST)
Received: from [192.168.233.14] (PO18990.IDSI0.si.c-s.fr [192.168.233.14])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 883F78B763;
	Tue,  8 Oct 2024 07:10:37 +0200 (CEST)
Message-ID: <331cc7ba-ed5e-4dd3-8175-b51bacb65186@csgroup.eu>
Date: Tue, 8 Oct 2024 07:10:36 +0200
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] powerpc: Adjust adding stack protector flags to
 KBUILD_CLAGS for clang
To: Nathan Chancellor <nathan@kernel.org>,
 Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>, Naveen N Rao <naveen@kernel.org>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling
 <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Keith Packard <keithp@keithp.com>, linuxppc-dev@lists.ozlabs.org,
 llvm@lists.linux.dev, patches@lists.linux.dev
References: <20241007-powerpc-fix-stackprotector-test-clang-v1-0-08c15b2694e4@kernel.org>
 <20241007-powerpc-fix-stackprotector-test-clang-v1-2-08c15b2694e4@kernel.org>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20241007-powerpc-fix-stackprotector-test-clang-v1-2-08c15b2694e4@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



Le 08/10/2024 à 06:22, Nathan Chancellor a écrit :
> After fixing the HAVE_STACKPROTECTER checks for clang's in-progress
> per-task stack protector support [1], the build fails during prepare0
> because '-mstack-protector-guard-offset' has not been added to
> KBUILD_CFLAGS yet but the other '-mstack-protector-guard' flags have.
> 
>    clang: error: '-mstack-protector-guard=tls' is used without '-mstack-protector-guard-offset', and there is no default
>    clang: error: '-mstack-protector-guard=tls' is used without '-mstack-protector-guard-offset', and there is no default
>    make[4]: *** [scripts/Makefile.build:229: scripts/mod/empty.o] Error 1
>    make[4]: *** [scripts/Makefile.build:102: scripts/mod/devicetable-offsets.s] Error 1
> 
> Mirror other architectures and add all '-mstack-protector-guard' flags
> to KBUILD_CFLAGS atomically during stack_protector_prepare, which
> resolves the issue and allows clang's implementation to fully work with
> the kernel.
> 
> Link: https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgithub.com%2Fllvm%2Fllvm-project%2Fpull%2F110928&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7Cc099707fa5464808c49108dce750d65e%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C638639581583232977%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C0%7C%7C%7C&sdata=b%2BcqodA6k739DD%2F74EJMXUtIHAZDt1DGcyd7mzzhbd8%3D&reserved=0 [1]
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Is it worth a Fixes: tag so that it gets applied on stable, or wont 
CLANG 20 be used with kernels older than 6.13 ?

> ---
>   arch/powerpc/Makefile | 15 ++++++---------
>   1 file changed, 6 insertions(+), 9 deletions(-)
> 
> diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
> index bbfe4a1f06ef9db9b2f2e48e02096b1e0500a14b..8f9e387c4c7dd06d8756dca3eac808cc344a937d 100644
> --- a/arch/powerpc/Makefile
> +++ b/arch/powerpc/Makefile
> @@ -100,13 +100,6 @@ KBUILD_AFLAGS	+= -m$(BITS)
>   KBUILD_LDFLAGS	+= -m elf$(BITS)$(LDEMULATION)
>   endif
>   
> -cflags-$(CONFIG_STACKPROTECTOR)	+= -mstack-protector-guard=tls
> -ifdef CONFIG_PPC64
> -cflags-$(CONFIG_STACKPROTECTOR)	+= -mstack-protector-guard-reg=r13
> -else
> -cflags-$(CONFIG_STACKPROTECTOR)	+= -mstack-protector-guard-reg=r2
> -endif
> -
>   LDFLAGS_vmlinux-y := -Bstatic
>   LDFLAGS_vmlinux-$(CONFIG_RELOCATABLE) := -pie
>   LDFLAGS_vmlinux-$(CONFIG_RELOCATABLE) += -z notext
> @@ -402,9 +395,13 @@ prepare: stack_protector_prepare
>   PHONY += stack_protector_prepare
>   stack_protector_prepare: prepare0
>   ifdef CONFIG_PPC64
> -	$(eval KBUILD_CFLAGS += -mstack-protector-guard-offset=$(shell awk '{if ($$2 == "PACA_CANARY") print $$3;}' include/generated/asm-offsets.h))
> +	$(eval KBUILD_CFLAGS += -mstack-protector-guard=tls \
> +				-mstack-protector-guard-reg=r13 \

Can you put both above lines on a single line to avoid having too many 
lines at the end:

+	$(eval KBUILD_CFLAGS += -mstack-protector-guard=tls 
-mstack-protector-guard-reg=r13 \

> +				-mstack-protector-guard-offset=$(shell awk '{if ($$2 == "PACA_CANARY") print $$3;}' include/generated/asm-offsets.h))
>   else
> -	$(eval KBUILD_CFLAGS += -mstack-protector-guard-offset=$(shell awk '{if ($$2 == "TASK_CANARY") print $$3;}' include/generated/asm-offsets.h))
> +	$(eval KBUILD_CFLAGS += -mstack-protector-guard=tls \
> +				-mstack-protector-guard-reg=r2 \

Same

> +				-mstack-protector-guard-offset=$(shell awk '{if ($$2 == "TASK_CANARY") print $$3;}' include/generated/asm-offsets.h))
>   endif
>   endif
>   
> 

