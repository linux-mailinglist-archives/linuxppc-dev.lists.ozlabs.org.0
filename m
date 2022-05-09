Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 944BB51F374
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 May 2022 06:26:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KxSmd37QJz3cFF
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 May 2022 14:26:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=nifty.com header.i=@nifty.com header.a=rsa-sha256 header.s=dec2015msa header.b=ik9NLTAT;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (domain owner discourages use of this
 host) smtp.mailfrom=kernel.org (client-ip=210.131.2.82;
 helo=conssluserg-03.nifty.com; envelope-from=masahiroy@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=nifty.com header.i=@nifty.com header.a=rsa-sha256
 header.s=dec2015msa header.b=ik9NLTAT; 
 dkim-atps=neutral
Received: from conssluserg-03.nifty.com (conssluserg-03.nifty.com
 [210.131.2.82])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KxSlw34GRz3bd3
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  9 May 2022 14:26:03 +1000 (AEST)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172]) (authenticated)
 by conssluserg-03.nifty.com with ESMTP id 2494PhvG030762
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 9 May 2022 13:25:43 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-03.nifty.com 2494PhvG030762
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1652070343;
 bh=DM2Qvk/KSJwggZQc+f9r/EEPApKQ0miaQHjxBSW8IV8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=ik9NLTATGDZpCqviXayYRqfP6qx1B+yR5pNExf/jQY2Mbdv0mc2stlpjBAHLJRlSe
 W2bwCEy+G7GIPO5sXFNrwUGfj9UpnVUH1P1dfHXYf/9dKMKgWKHMPWofuCYo/tfKAp
 ro2TjOAX4IHm2jjh2aHpxfpn1XRblgykmDbH9TOE+Q+WufvnoLfAQUMyWk3almWhov
 0766UdsFoCts4U7LXyuB1C8r9zPT6BCv8WyRtSbbSie7zlVF1CQXs3dQFEkz5d7qz5
 4SL9oX5zbQZXdsgcQaU+arJuF7yJsniYoGmcM0RaBODI9FOA1fOKU9UybD4Tpr2WAP
 v1e7tlygJynDg==
X-Nifty-SrcIP: [209.85.214.172]
Received: by mail-pl1-f172.google.com with SMTP id n18so12742841plg.5
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 08 May 2022 21:25:43 -0700 (PDT)
X-Gm-Message-State: AOAM532cpOCV/+hX/WdKFqx2jTeJ2a2WVP+sxcq5h3hsYoZVuruMLoHF
 jrqaXaZnJqSkFKqdqBpP0Qf/UVUgtGSvj7eg5SA=
X-Google-Smtp-Source: ABdhPJz+EyiLX7j6uh3WzqWMOrMkF5hlrWDy6od+IPDFGCNr8NC4vk92cU3B82hmpcsJDxTmnQ5GEcRpm1eC9pqP+d0=
X-Received: by 2002:a17:902:7891:b0:15e:cae9:7620 with SMTP id
 q17-20020a170902789100b0015ecae97620mr14626650pll.136.1652070342778; Sun, 08
 May 2022 21:25:42 -0700 (PDT)
MIME-Version: 1.0
References: <20220508190631.2386038-1-masahiroy@kernel.org>
In-Reply-To: <20220508190631.2386038-1-masahiroy@kernel.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Mon, 9 May 2022 13:24:33 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQtedww_RiemfTV7Ls=M01iKJhY14G3TiuAg=C3bvJjww@mail.gmail.com>
Message-ID: <CAK7LNAQtedww_RiemfTV7Ls=M01iKJhY14G3TiuAg=C3bvJjww@mail.gmail.com>
Subject: Re: [PATCH v4 00/14] kbuild: yet another series of cleanups (modpost, 
 LTO, MODULE_REL_CRCS, export.h)
To: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
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
Cc: linux-s390 <linux-s390@vger.kernel.org>, Nicolas Schier <nicolas@fjasle.eu>,
 Peter Zijlstra <peterz@infradead.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Nathan Chancellor <nathan@kernel.org>,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 Sami Tolvanen <samitolvanen@google.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Ard Biesheuvel <ardb@kernel.org>,
 linux-modules <linux-modules@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, May 9, 2022 at 4:09 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> This is the third batch of cleanups in this development cycle.
>
> Major changes in v4:
>  - Move static EXPORT_SYMBOL check to a script
>  - Some refactoring
>
> Major changes in v3:
>
>  - Generate symbol CRCs as C code, and remove CONFIG_MODULE_REL_CRCS.
>
> Major changes in v2:
>
>  - V1 did not work with CONFIG_MODULE_REL_CRCS.
>    I fixed this for v2.
>
>  - Reflect some review comments in v1
>
>  - Refactor the code more
>
>  - Avoid too long argument error

This series is available at
git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
lto-cleanup-v4




>
>
> Masahiro Yamada (14):
>   modpost: remove left-over cross_compile declaration
>   modpost: change the license of EXPORT_SYMBOL to bool type
>   modpost: split the section mismatch checks into section-check.c
>   modpost: add sym_find_with_module() helper
>   modpost: extract symbol versions from *.cmd files
>   kbuild: link symbol CRCs at final link, removing
>     CONFIG_MODULE_REL_CRCS
>   kbuild: stop merging *.symversions
>   genksyms: adjust the output format to modpost
>   kbuild: do not create *.prelink.o for Clang LTO or IBT
>   kbuild: check static EXPORT_SYMBOL* by script instead of modpost
>   kbuild: make built-in.a rule robust against too long argument error
>   kbuild: make *.mod rule robust against too long argument error
>   kbuild: add cmd_and_savecmd macro
>   kbuild: rebuild multi-object modules when objtool is updated
>
>  arch/powerpc/Kconfig            |    1 -
>  arch/s390/Kconfig               |    1 -
>  arch/um/Kconfig                 |    1 -
>  include/asm-generic/export.h    |   22 +-
>  include/linux/export-internal.h |   16 +
>  include/linux/export.h          |   30 +-
>  init/Kconfig                    |    4 -
>  kernel/module.c                 |   10 +-
>  scripts/Kbuild.include          |   10 +-
>  scripts/Makefile.build          |  134 +--
>  scripts/Makefile.lib            |    7 -
>  scripts/Makefile.modfinal       |    5 +-
>  scripts/Makefile.modpost        |    9 +-
>  scripts/check-local-export      |   48 +
>  scripts/genksyms/genksyms.c     |   18 +-
>  scripts/link-vmlinux.sh         |   33 +-
>  scripts/mod/Makefile            |    2 +-
>  scripts/mod/modpost.c           | 1499 ++++---------------------------
>  scripts/mod/modpost.h           |   35 +-
>  scripts/mod/section-check.c     | 1222 +++++++++++++++++++++++++
>  20 files changed, 1551 insertions(+), 1556 deletions(-)
>  create mode 100644 include/linux/export-internal.h
>  create mode 100755 scripts/check-local-export
>  create mode 100644 scripts/mod/section-check.c
>
> --
> 2.32.0
>
> --
> You received this message because you are subscribed to the Google Groups "Clang Built Linux" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to clang-built-linux+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/clang-built-linux/20220508190631.2386038-1-masahiroy%40kernel.org.



-- 
Best Regards
Masahiro Yamada
