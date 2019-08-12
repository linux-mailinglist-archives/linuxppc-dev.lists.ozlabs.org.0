Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9667C8A4C6
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Aug 2019 19:37:52 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 466jjV0d4TzDqc8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Aug 2019 03:37:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::443; helo=mail-pf1-x443.google.com;
 envelope-from=ndesaulniers@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="RsNkwjci"; 
 dkim-atps=neutral
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 466jgb2NwfzDqYM
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Aug 2019 03:36:09 +1000 (AEST)
Received: by mail-pf1-x443.google.com with SMTP id b13so50035171pfo.1
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Aug 2019 10:36:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oZi4p9sU++IMNyLOoMu4O4MSpldoBC3la4O/D+JmVeE=;
 b=RsNkwjciAZJFroOX5ILBuBvMy8TWcIT9hJzrTA5xuOZfMYJaav94/bNa1G1AZHA/sx
 IqeuX0m5wrq1olWYnCUFdWcRs4HHNmD+fSaxGCDngxV9gs9hEaGvpwiel6l6FYROI+wM
 b2h/J/0MtTn4wk+24P+lye5PvT7SR216V5ztbRz1yijbJD2TeXZKy39Wwf+AkV8DYbM0
 CP6fjXz/iairhkQqUorj+Ear31cpwrY8D8/ls28sODMfPbYKCYDBl2dAo83EtHCePTLH
 MGmTVzL/6+j8BOjr0vRr/sKO1HKHpXTj0Kqk+R5o3T3ezXSVTGqzUJFXtYU7FXUZdbq9
 iK5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oZi4p9sU++IMNyLOoMu4O4MSpldoBC3la4O/D+JmVeE=;
 b=RWWKCdCsehdiO7HAdY2elal/T5pHvuoR88WDRMNZfNVplwHhyXzW66u8ATe3UtZF3U
 I8iv25kMOtXJwqGFume0z0efnQRbZLk3+ySwxdWaDUy5tVSoVVboIMY158PWPS6QCCIS
 WTgPigzI2kkwD+yqhhUzMLKeIcQ99JV+E/v4u6J5yiYEzzMxCvws977q+gXmeXwheaO8
 rhZke8dK4G08v7upEOpz8AZbHEM1JOF8DiUq8LQJkxHgm3m3ZE2uu8LMz6ghD15GvS7c
 zRq7c/xyVlmioF8ZxNnwmC6KE12cslRge+xBFSfnNRdWYsck1NEk4HV8PL1HBvqUX15X
 ODVw==
X-Gm-Message-State: APjAAAXVI9WJr3LTTiumo3Z91V+UWg/jX9SphD2C6MuLSVAREaMzl8W3
 MShIC63qtaloyxuRV46MAAKwUoYk974MF1QUn5IjAg==
X-Google-Smtp-Source: APXvYqy2zouhlUGYS7Kh1lajVcXBTrIvaZyDmn96K5pB0TaQUQP3OryMKFONA/xS83RgDSxvOsb01vVyUXq5xlXLvmE=
X-Received: by 2002:a63:f94c:: with SMTP id q12mr30736518pgk.10.1565631367302; 
 Mon, 12 Aug 2019 10:36:07 -0700 (PDT)
MIME-Version: 1.0
References: <20190812023214.107817-1-natechancellor@gmail.com>
In-Reply-To: <20190812023214.107817-1-natechancellor@gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 12 Aug 2019 10:35:56 -0700
Message-ID: <CAKwvOd=RzY2bkOOYUrvNSxZxz6B2VPn2siXA8pRFc9EP-W77qQ@mail.gmail.com>
Subject: Re: [PATCH] powerpc: Avoid clang warnings around setjmp and longjmp
To: Nathan Chancellor <natechancellor@gmail.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: LKML <linux-kernel@vger.kernel.org>, "# 3.4.x" <stable@vger.kernel.org>,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 Paul Mackerras <paulus@samba.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, Aug 11, 2019 at 7:42 PM Nathan Chancellor
<natechancellor@gmail.com> wrote:
>
> Commit aea447141c7e ("powerpc: Disable -Wbuiltin-requires-header when
> setjmp is used") disabled -Wbuiltin-requires-header because of a warning
> about the setjmp and longjmp declarations.
>
> r367387 in clang added another diagnostic around this, complaining that
> there is no jmp_buf declaration.
>
> In file included from ../arch/powerpc/xmon/xmon.c:47:
> ../arch/powerpc/include/asm/setjmp.h:10:13: error: declaration of
> built-in function 'setjmp' requires the declaration of the 'jmp_buf'
> type, commonly provided in the header <setjmp.h>.
> [-Werror,-Wincomplete-setjmp-declaration]
> extern long setjmp(long *);
>             ^
> ../arch/powerpc/include/asm/setjmp.h:11:13: error: declaration of
> built-in function 'longjmp' requires the declaration of the 'jmp_buf'
> type, commonly provided in the header <setjmp.h>.
> [-Werror,-Wincomplete-setjmp-declaration]
> extern void longjmp(long *, long);
>             ^
> 2 errors generated.
>
> Take the same approach as the above commit by disabling the warning for
> the same reason, we provide our own longjmp/setjmp function.
>
> Cc: stable@vger.kernel.org # 4.19+
> Link: https://github.com/ClangBuiltLinux/linux/issues/625
> Link: https://github.com/llvm/llvm-project/commit/3be25e79477db2d31ac46493d97eca8c20592b07
> Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>

Thanks for the patch, Nathan.
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
>
> It may be worth using -fno-builtin-setjmp and -fno-builtin-longjmp
> instead as it makes it clear to clang that we are not using the builtin
> longjmp and setjmp functions, which I think is why these warnings are
> appearing (at least according to the commit that introduced this waring).
>
> Sample patch:
> https://github.com/ClangBuiltLinux/linux/issues/625#issuecomment-519251372
>
> However, this is the most conservative approach, as I have already had
> someone notice this error when building LLVM with PGO on tip of tree
> LLVM.
>
>  arch/powerpc/kernel/Makefile | 5 +++--
>  arch/powerpc/xmon/Makefile   | 5 +++--
>  2 files changed, 6 insertions(+), 4 deletions(-)
>
> diff --git a/arch/powerpc/kernel/Makefile b/arch/powerpc/kernel/Makefile
> index ea0c69236789..44e340ed4722 100644
> --- a/arch/powerpc/kernel/Makefile
> +++ b/arch/powerpc/kernel/Makefile
> @@ -5,8 +5,9 @@
>
>  CFLAGS_ptrace.o                += -DUTS_MACHINE='"$(UTS_MACHINE)"'
>
> -# Disable clang warning for using setjmp without setjmp.h header
> -CFLAGS_crash.o         += $(call cc-disable-warning, builtin-requires-header)
> +# Avoid clang warnings about longjmp and setjmp built-ins (inclusion of setjmp.h and declaration of jmp_buf type)
> +CFLAGS_crash.o         += $(call cc-disable-warning, builtin-requires-header) \
> +                          $(call cc-disable-warning, incomplete-setjmp-declaration)
>
>  ifdef CONFIG_PPC64
>  CFLAGS_prom_init.o     += $(NO_MINIMAL_TOC)
> diff --git a/arch/powerpc/xmon/Makefile b/arch/powerpc/xmon/Makefile
> index f142570ad860..53f341391210 100644
> --- a/arch/powerpc/xmon/Makefile
> +++ b/arch/powerpc/xmon/Makefile
> @@ -1,8 +1,9 @@
>  # SPDX-License-Identifier: GPL-2.0
>  # Makefile for xmon
>
> -# Disable clang warning for using setjmp without setjmp.h header
> -subdir-ccflags-y := $(call cc-disable-warning, builtin-requires-header)
> +# Avoid clang warnings about longjmp and setjmp built-ins (inclusion of setjmp.h and declaration of jmp_buf type)
> +subdir-ccflags-y := $(call cc-disable-warning, builtin-requires-header) \
> +                   $(call cc-disable-warning, incomplete-setjmp-declaration)
>
>  GCOV_PROFILE := n
>  KCOV_INSTRUMENT := n
> --
> 2.23.0.rc2
>


-- 
Thanks,
~Nick Desaulniers
