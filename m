Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FC375B0B5F
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Sep 2022 19:22:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MN8FP0VtLz3c70
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Sep 2022 03:22:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MN8F04hSqz2xYj
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Sep 2022 03:21:40 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4MN8Dw2BCLz9skr;
	Wed,  7 Sep 2022 19:21:36 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DuwBRwQWXqUM; Wed,  7 Sep 2022 19:21:36 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4MN8Dw1DWKz9skq;
	Wed,  7 Sep 2022 19:21:36 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 0C93C8B78B;
	Wed,  7 Sep 2022 19:21:36 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id MLVDGr0fKSvO; Wed,  7 Sep 2022 19:21:35 +0200 (CEST)
Received: from [192.168.232.239] (unknown [192.168.232.239])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 9AAC08B763;
	Wed,  7 Sep 2022 19:21:35 +0200 (CEST)
Message-ID: <7cb1285a-42e6-2b67-664f-7d206bc9fd80@csgroup.eu>
Date: Wed, 7 Sep 2022 19:21:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH] powerpc/lib/xor_vmx: Relax frame size for clang
Content-Language: fr-FR
To: Mathieu Malaterre <malat@debian.org>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Nick Desaulniers <ndesaulniers@google.com>
References: <20190621085822.1527-1-malat@debian.org>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20190621085822.1527-1-malat@debian.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: linuxppc-dev@lists.ozlabs.org, Paul Mackerras <paulus@samba.org>, linux-kernel@vger.kernel.org, Joel Stanley <joel@jms.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 21/06/2019 à 10:58, Mathieu Malaterre a écrit :
> When building with clang-8 the frame size limit is hit:
> 
>    ../arch/powerpc/lib/xor_vmx.c:119:6: error: stack frame size of 1200 bytes in function '__xor_altivec_5' [-Werror,-Wframe-larger-than=]
> 
> Follow the same approach as commit 9c87156cce5a ("powerpc/xmon: Relax
> frame size for clang") until a proper fix is implemented upstream in
> clang and relax requirement for clang.

With Clang 14 I get the following errors, but only with KASAN selected.

   CC      arch/powerpc/lib/xor_vmx.o
arch/powerpc/lib/xor_vmx.c:95:6: error: stack frame size (1040) exceeds 
limit (1024) in '__xor_altivec_4' [-Werror,-Wframe-larger-than]
void __xor_altivec_4(unsigned long bytes,
      ^
arch/powerpc/lib/xor_vmx.c:124:6: error: stack frame size (1312) exceeds 
limit (1024) in '__xor_altivec_5' [-Werror,-Wframe-larger-than]
void __xor_altivec_5(unsigned long bytes,
      ^


Is this patch still relevant ?

Or should frame size be relaxed when KASAN is selected ? After all the 
stack size is multiplied by 2 when we have KASAN, so maybe the warning 
limit should be increased as well ?

Thanks
Christophe

> 
> Link: https://github.com/ClangBuiltLinux/linux/issues/563
> Cc: Joel Stanley <joel@jms.id.au>
> Signed-off-by: Mathieu Malaterre <malat@debian.org>
> ---
>   arch/powerpc/lib/Makefile | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/arch/powerpc/lib/Makefile b/arch/powerpc/lib/Makefile
> index c55f9c27bf79..b3f7d64caaf0 100644
> --- a/arch/powerpc/lib/Makefile
> +++ b/arch/powerpc/lib/Makefile
> @@ -58,5 +58,9 @@ obj-$(CONFIG_FTR_FIXUP_SELFTEST) += feature-fixups-test.o
>   
>   obj-$(CONFIG_ALTIVEC)	+= xor_vmx.o xor_vmx_glue.o
>   CFLAGS_xor_vmx.o += -maltivec $(call cc-option,-mabi=altivec)
> +ifdef CONFIG_CC_IS_CLANG
> +# See https://github.com/ClangBuiltLinux/linux/issues/563
> +CFLAGS_xor_vmx.o += -Wframe-larger-than=4096
> +endif
>   
>   obj-$(CONFIG_PPC64) += $(obj64-y)
