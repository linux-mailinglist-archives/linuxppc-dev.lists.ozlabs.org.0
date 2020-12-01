Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 73DB52CA415
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Dec 2020 14:43:22 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cljwj1LLKzDqTT
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Dec 2020 00:43:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (domain owner discourages use of this
 host) smtp.mailfrom=kernel.org (client-ip=202.248.20.74;
 helo=condef-09.nifty.com; envelope-from=masahiroy@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=nifty.com header.i=@nifty.com header.a=rsa-sha256
 header.s=dec2015msa header.b=iWwW+u7A; 
 dkim-atps=neutral
X-Greylist: delayed 361 seconds by postgrey-1.36 at bilbo;
 Wed, 02 Dec 2020 00:40:12 AEDT
Received: from condef-09.nifty.com (condef-09.nifty.com [202.248.20.74])
 by lists.ozlabs.org (Postfix) with ESMTP id 4Cljs90254zDqDL
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Dec 2020 00:40:12 +1100 (AEDT)
Received: from conssluserg-03.nifty.com ([10.126.8.82])by condef-09.nifty.com
 with ESMTP id 0B1DTeVA016026
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 1 Dec 2020 22:29:40 +0900
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com
 [209.85.215.179]) (authenticated)
 by conssluserg-03.nifty.com with ESMTP id 0B1DT784011162
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 1 Dec 2020 22:29:08 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-03.nifty.com 0B1DT784011162
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1606829348;
 bh=zMmj+GVqjUXMVH8pNvSfsy5XEgzhkJMYROtJdnMN3pY=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=iWwW+u7AL0wi0eiCli/wxrySa1Ui0X2/+q040eqPUcBUg0OpAQVTSbNkrpTlbQiVo
 y2Gn/lLQ1NrrOj1Epa0ZR4DXlxVXAFSrPi4LKHY+1m4cT1RatL/mDTpnbQ27Ft5UuS
 ZMSkRtKi179h2FVxV4/ywcJJshTUC5dXcO92eRfmcU/1V5/YvOC1i8q21I/RYslapR
 QaFcRUytmzIvxKR5E/N1DgSrDcIg3y6JhOHkTmoUQg+ghDvEF0otzPtYF2XQdXmWcS
 +5igzk5l1lvtycWphzgOoIDGHXH9pH+UJfdQBtyfPJDLWbpG6+CR9kmQhskO3eBaIA
 QNDTwavPoQk6w==
X-Nifty-SrcIP: [209.85.215.179]
Received: by mail-pg1-f179.google.com with SMTP id w4so1177694pgg.13
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 01 Dec 2020 05:29:08 -0800 (PST)
X-Gm-Message-State: AOAM530i3QqPC1yvGcX7gXrZewvR46JpMdfYE9o7KpI5NclCxYStKZUJ
 k5i/Ha/yFGmgvBQwz2S7XErgGplo/eDgxyiCgIU=
X-Google-Smtp-Source: ABdhPJwLhVrfKiBGqZeTDEx8ocu6LlfKlsT/3v235qiU0r8c0WZO0DqBqtiJr5jMPBwrzY0PYOy/XUJP6+BhtIdsI3s=
X-Received: by 2002:aa7:9606:0:b029:198:14c4:4f44 with SMTP id
 q6-20020aa796060000b029019814c44f44mr2478107pfg.80.1606829347544; Tue, 01 Dec
 2020 05:29:07 -0800 (PST)
MIME-Version: 1.0
References: <20201113195553.1487659-1-natechancellor@gmail.com>
 <20201119204656.3261686-1-natechancellor@gmail.com>
 <202011201607.75FA476@keescook>
In-Reply-To: <202011201607.75FA476@keescook>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 1 Dec 2020 22:28:30 +0900
X-Gmail-Original-Message-ID: <CAK7LNASmiWkw3+F1_AJWYDAXntcpcNQmdX0d_hVQq7oxQ_m74A@mail.gmail.com>
Message-ID: <CAK7LNASmiWkw3+F1_AJWYDAXntcpcNQmdX0d_hVQq7oxQ_m74A@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] kbuild: Hoist '--orphan-handling' into Kconfig
To: Kees Cook <keescook@chromium.org>
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
Cc: Michal Marek <michal.lkml@markovi.net>,
 Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, X86 ML <x86@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Russell King <linux@armlinux.org.uk>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Arvind Sankar <nivedita@alum.mit.edu>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 Nathan Chancellor <natechancellor@gmail.com>, Will Deacon <will@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Nov 21, 2020 at 9:08 AM Kees Cook <keescook@chromium.org> wrote:
>
> On Thu, Nov 19, 2020 at 01:46:56PM -0700, Nathan Chancellor wrote:
> > Currently, '--orphan-handling=warn' is spread out across four different
> > architectures in their respective Makefiles, which makes it a little
> > unruly to deal with in case it needs to be disabled for a specific
> > linker version (in this case, ld.lld 10.0.1).
> >
> > To make it easier to control this, hoist this warning into Kconfig and
> > the main Makefile so that disabling it is simpler, as the warning will
> > only be enabled in a couple places (main Makefile and a couple of
> > compressed boot folders that blow away LDFLAGS_vmlinx) and making it
> > conditional is easier due to Kconfig syntax. One small additional
> > benefit of this is saving a call to ld-option on incremental builds
> > because we will have already evaluated it for CONFIG_LD_ORPHAN_WARN.
> >
> > To keep the list of supported architectures the same, introduce
> > CONFIG_ARCH_WANT_LD_ORPHAN_WARN, which an architecture can select to
> > gain this automatically after all of the sections are specified and size
> > asserted. A special thanks to Kees Cook for the help text on this
> > config.
> >
> > Link: https://github.com/ClangBuiltLinux/linux/issues/1187
> > Acked-by: Kees Cook <keescook@chromium.org>
> > Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)
> > Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
> > Tested-by: Nick Desaulniers <ndesaulniers@google.com>
> > Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
>
> Masahiro, do you want to take these to get them to Linus for v5.10? I
> can send them if you'd prefer.
>



Sorry for the delay.

Applied to linux-kbuild.





> -Kees
>
> --
> Kees Cook
>
> --
> You received this message because you are subscribed to the Google Groups "Clang Built Linux" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to clang-built-linux+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/clang-built-linux/202011201607.75FA476%40keescook.



-- 
Best Regards
Masahiro Yamada
