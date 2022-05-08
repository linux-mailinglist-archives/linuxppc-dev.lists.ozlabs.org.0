Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3282C51EF14
	for <lists+linuxppc-dev@lfdr.de>; Sun,  8 May 2022 20:31:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KxCYW120Wz3cHn
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 May 2022 04:31:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=nifty.com header.i=@nifty.com header.a=rsa-sha256 header.s=dec2015msa header.b=cMEmerC0;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (domain owner discourages use of this
 host) smtp.mailfrom=kernel.org (client-ip=210.131.2.83;
 helo=conssluserg-04.nifty.com; envelope-from=masahiroy@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=nifty.com header.i=@nifty.com header.a=rsa-sha256
 header.s=dec2015msa header.b=cMEmerC0; 
 dkim-atps=neutral
Received: from conssluserg-04.nifty.com (conssluserg-04.nifty.com
 [210.131.2.83])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KxCXp5hn2z3bpj
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  9 May 2022 04:30:34 +1000 (AEST)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com
 [209.85.215.169]) (authenticated)
 by conssluserg-04.nifty.com with ESMTP id 248IU6CN015089
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 9 May 2022 03:30:06 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com 248IU6CN015089
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1652034606;
 bh=lYdfiXpHTiwBCIC8Ig2nInkqB5OuwCT5uW2/zGo7dOE=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=cMEmerC0haPzAMsseBA0u5NCSJOpYa/e4X6PrzqlSV+bSZbf9aQ2aKqAv3RHC/AhV
 xfoqt/Etmn9tMjGv1IqSyCv20jW9g/rI6RiBZkRzk/S61u6AEz5PhF8ZzoETI9242S
 OT9F7UQRzWuaH2O35ACFv5hts0uPubkXibXfzOib4AZddVMhVbDqjEXi4Cn2to2WMK
 c8XUpWGeLria3yAO1BOWYsf1blox2mNkzO6KJBvESxt5n8UBHJneaEPXB2v40VDt+2
 4rYAbK+I8szZGiS5o2MS887+husQeDGrf44xndkjt49MT8olk/H0iRasKhtKtK0cSR
 r3EIi0nFSmslw==
X-Nifty-SrcIP: [209.85.215.169]
Received: by mail-pg1-f169.google.com with SMTP id 15so10269796pgf.4
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 08 May 2022 11:30:06 -0700 (PDT)
X-Gm-Message-State: AOAM530LUzv4RIo+z/chRZYYvkBU08LSbfBStqL7KDS38ucDem4wOult
 pLyie+qm8Gzs8A0K8nNvxoo77c+qflKkQ2Ml/KM=
X-Google-Smtp-Source: ABdhPJzSZw3CPCsDznAcGlLU11AUbvg46ozEB8e0OAnUju+5EAH166Q3DSIdjEyp9NwVCGBOR0PvXe4zM/kxvMm2SEI=
X-Received: by 2002:a05:6a00:24cc:b0:50d:58bf:5104 with SMTP id
 d12-20020a056a0024cc00b0050d58bf5104mr12632485pfv.36.1652034605828; Sun, 08
 May 2022 11:30:05 -0700 (PDT)
MIME-Version: 1.0
References: <20220505072244.1155033-1-masahiroy@kernel.org>
In-Reply-To: <20220505072244.1155033-1-masahiroy@kernel.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Mon, 9 May 2022 03:28:55 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQg2JG2DAuRJmNLryDh_o_PoFUXnJ+6C=-AE+NXZy9pTg@mail.gmail.com>
Message-ID: <CAK7LNAQg2JG2DAuRJmNLryDh_o_PoFUXnJ+6C=-AE+NXZy9pTg@mail.gmail.com>
Subject: Re: [PATCH v3 00/15] kbuild: yet another series of cleanups (modpost, 
 LTO, MODULE_REL_CRCS)
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
Cc: linux-s390 <linux-s390@vger.kernel.org>,
 Nicolas Schier a <nicolas@fjasle.eu>, Peter Zijlstra <peterz@infradead.org>,
 Nick Desaulniers <ndesaulniers@google.com>, linux-um@lists.infradead.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 Luis Chamberlain <mcgrof@kernel.org>, Sami Tolvanen <samitolvanen@google.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Ard Biesheuvel <ardb@kernel.org>,
 Kees Cook <keescook@chromium.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, May 5, 2022 at 4:24 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
>
> This is the third batch of cleanups in this development cycle.
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
>
>
> Masahiro Yamada (15):
>   modpost: mitigate false-negatives for static EXPORT_SYMBOL checks
>   modpost: change the license of EXPORT_SYMBOL to bool type
>   modpost: merge add_{intree_flag,retpoline,staging_flag} to add_header
>   modpost: move *.mod.c generation to write_mod_c_files()
>   kbuild: generate a list of objects in vmlinux
>   kbuild: record symbol versions in *.cmd files
>   modpost: extract symbol versions from *.cmd files
>   kbuild: link symbol CRCs at final link, removing
>     CONFIG_MODULE_REL_CRCS
>   kbuild: stop merging *.symversions
>   genksyms: adjust the output format to modpost
>   kbuild: do not create *.prelink.o for Clang LTO or IBT
>   modpost: simplify the ->is_static initialization
>   modpost: use hlist for hash table implementation
>   kbuild: make built-in.a rule robust against too long argument error
>   kbuild: make *.mod rule robust against too long argument error


Only 03-06 were applied.

I will send v4 for the rest.
(I rewrote the static EXPORT checks).

>
>  arch/powerpc/Kconfig         |   1 -
>  arch/s390/Kconfig            |   1 -
>  arch/um/Kconfig              |   1 -
>  include/asm-generic/export.h |  22 +-
>  include/linux/export.h       |  30 +--
>  include/linux/symversion.h   |  13 +
>  init/Kconfig                 |   4 -
>  kernel/module.c              |  10 +-
>  scripts/Kbuild.include       |   4 +
>  scripts/Makefile.build       | 118 +++------
>  scripts/Makefile.lib         |   7 -
>  scripts/Makefile.modfinal    |   5 +-
>  scripts/Makefile.modpost     |   9 +-
>  scripts/genksyms/genksyms.c  |  18 +-
>  scripts/link-vmlinux.sh      |  46 ++--
>  scripts/mod/file2alias.c     |   2 -
>  scripts/mod/list.h           |  52 ++++
>  scripts/mod/modpost.c        | 449 ++++++++++++++++++++---------------
>  scripts/mod/modpost.h        |   2 +
>  19 files changed, 402 insertions(+), 392 deletions(-)
>  create mode 100644 include/linux/symversion.h
>
> --
> 2.32.0
>
> --
> You received this message because you are subscribed to the Google Groups "Clang Built Linux" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to clang-built-linux+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/clang-built-linux/20220505072244.1155033-1-masahiroy%40kernel.org.



-- 
Best Regards
Masahiro Yamada
