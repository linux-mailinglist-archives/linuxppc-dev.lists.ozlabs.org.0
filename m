Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F90A896F1
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Aug 2019 07:39:34 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 466Pmg45x4zDqb9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Aug 2019 15:39:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="X5Zrx/RX"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 466Pkv3KdzzDqPg
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Aug 2019 15:37:58 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 466Pkg1rcXzB09b6;
 Mon, 12 Aug 2019 07:37:47 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=X5Zrx/RX; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 0YC7Mo5kUr_h; Mon, 12 Aug 2019 07:37:47 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 466Pkg0mpxzB09Zx;
 Mon, 12 Aug 2019 07:37:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1565588267; bh=zPe15F+ILVBJRhKhdywc5kLzTzCdvp6RH6BIPfn1N74=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=X5Zrx/RXi/1fNWx7+BFLq+zHp0ZniXnyyKmusuRcixROTUiRtVKRXeQcHhDNfq+/4
 bCMf8RFOzID7B/1Yqi4RvcZA8hHE8XeWjQSFDQcf4ko/Ki+7VZ00UhQFQaOmGSnXYU
 VtY3DFWXwGAK4sGuHiUhrPrHkObcNCV4vN7jQ2cY=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 032B38B791;
 Mon, 12 Aug 2019 07:37:52 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 3WTBnr-EQg93; Mon, 12 Aug 2019 07:37:51 +0200 (CEST)
Received: from [172.25.230.101] (po15451.idsi0.si.c-s.fr [172.25.230.101])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id CCB228B752;
 Mon, 12 Aug 2019 07:37:51 +0200 (CEST)
Subject: Re: [PATCH] powerpc: Avoid clang warnings around setjmp and longjmp
To: Nathan Chancellor <natechancellor@gmail.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Nick Desaulniers <ndesaulniers@google.com>
References: <20190812023214.107817-1-natechancellor@gmail.com>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <5da5478f-9320-43bd-0f5e-430db2ee9195@c-s.fr>
Date: Mon, 12 Aug 2019 07:37:51 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190812023214.107817-1-natechancellor@gmail.com>
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
Cc: clang-built-linux@googlegroups.com, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 12/08/2019 à 04:32, Nathan Chancellor a écrit :
> Commit aea447141c7e ("powerpc: Disable -Wbuiltin-requires-header when
> setjmp is used") disabled -Wbuiltin-requires-header because of a warning
> about the setjmp and longjmp declarations.
> 
> r367387 in clang added another diagnostic around this, complaining that
> there is no jmp_buf declaration.
> 
[...]

> 
> Cc: stable@vger.kernel.org # 4.19+
> Link: https://github.com/ClangBuiltLinux/linux/issues/625
> Link: https://github.com/llvm/llvm-project/commit/3be25e79477db2d31ac46493d97eca8c20592b07
> Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
> ---
> 
[...]

> 
>   arch/powerpc/kernel/Makefile | 5 +++--
>   arch/powerpc/xmon/Makefile   | 5 +++--

What about scripts/recordmcount.c and scripts/sortextable.c which 
contains calls to setjmp() and longjmp() ?

And arch/um/ ?

Christophe

>   2 files changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/powerpc/kernel/Makefile b/arch/powerpc/kernel/Makefile
> index ea0c69236789..44e340ed4722 100644
> --- a/arch/powerpc/kernel/Makefile
> +++ b/arch/powerpc/kernel/Makefile
> @@ -5,8 +5,9 @@
>   
>   CFLAGS_ptrace.o		+= -DUTS_MACHINE='"$(UTS_MACHINE)"'
>   
> -# Disable clang warning for using setjmp without setjmp.h header
> -CFLAGS_crash.o		+= $(call cc-disable-warning, builtin-requires-header)
> +# Avoid clang warnings about longjmp and setjmp built-ins (inclusion of setjmp.h and declaration of jmp_buf type)
> +CFLAGS_crash.o		+= $(call cc-disable-warning, builtin-requires-header) \
> +			   $(call cc-disable-warning, incomplete-setjmp-declaration)
>   
>   ifdef CONFIG_PPC64
>   CFLAGS_prom_init.o	+= $(NO_MINIMAL_TOC)
> diff --git a/arch/powerpc/xmon/Makefile b/arch/powerpc/xmon/Makefile
> index f142570ad860..53f341391210 100644
> --- a/arch/powerpc/xmon/Makefile
> +++ b/arch/powerpc/xmon/Makefile
> @@ -1,8 +1,9 @@
>   # SPDX-License-Identifier: GPL-2.0
>   # Makefile for xmon
>   
> -# Disable clang warning for using setjmp without setjmp.h header
> -subdir-ccflags-y := $(call cc-disable-warning, builtin-requires-header)
> +# Avoid clang warnings about longjmp and setjmp built-ins (inclusion of setjmp.h and declaration of jmp_buf type)
> +subdir-ccflags-y := $(call cc-disable-warning, builtin-requires-header) \
> +		    $(call cc-disable-warning, incomplete-setjmp-declaration)
>   
>   GCOV_PROFILE := n
>   KCOV_INSTRUMENT := n
> 
