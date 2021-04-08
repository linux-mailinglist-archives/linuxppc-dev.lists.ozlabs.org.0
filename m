Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 558C6357B69
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Apr 2021 06:39:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FG7p81V9hz30JL
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Apr 2021 14:39:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FG7np5sflz2yx1
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Apr 2021 14:39:06 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4FG7nf67X2z9vBnX;
 Thu,  8 Apr 2021 06:39:02 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 7Ulh6JSdMufP; Thu,  8 Apr 2021 06:39:02 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4FG7nf4Vgwz9vBnS;
 Thu,  8 Apr 2021 06:39:02 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 6568E8B7BE;
 Thu,  8 Apr 2021 06:39:03 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 3uhCu6FeRQ6b; Thu,  8 Apr 2021 06:39:03 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id E9BFB8B75F;
 Thu,  8 Apr 2021 06:39:02 +0200 (CEST)
Subject: Re: [PATCH] powerpc: remove old workaround for GCC < 4.9
To: Masahiro Yamada <masahiroy@kernel.org>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org
References: <20210408030534.196347-1-masahiroy@kernel.org>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <c1252dda-42e8-d920-c46f-1fd8250870ab@csgroup.eu>
Date: Thu, 8 Apr 2021 06:39:00 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210408030534.196347-1-masahiroy@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
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
Cc: linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 08/04/2021 à 05:05, Masahiro Yamada a écrit :
> According to Documentation/process/changes.rst, the minimum supported
> GCC version is 4.9.
> 
> This workaround is dead code.

This workaround is already on the way out, see 
https://github.com/linuxppc/linux/commit/802b5560393423166e436c7914b565f3cda9e6b9



> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
> 
>   arch/powerpc/Makefile | 6 ------
>   1 file changed, 6 deletions(-)
> 
> diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
> index 5f8544cf724a..32dd693b4e42 100644
> --- a/arch/powerpc/Makefile
> +++ b/arch/powerpc/Makefile
> @@ -181,12 +181,6 @@ CC_FLAGS_FTRACE := -pg
>   ifdef CONFIG_MPROFILE_KERNEL
>   CC_FLAGS_FTRACE += -mprofile-kernel
>   endif
> -# Work around gcc code-gen bugs with -pg / -fno-omit-frame-pointer in gcc <= 4.8
> -# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=44199
> -# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=52828
> -ifndef CONFIG_CC_IS_CLANG
> -CC_FLAGS_FTRACE	+= $(call cc-ifversion, -lt, 0409, -mno-sched-epilog)
> -endif
>   endif
>   
>   CFLAGS-$(CONFIG_TARGET_CPU_BOOL) += $(call cc-option,-mcpu=$(CONFIG_TARGET_CPU))
> 
