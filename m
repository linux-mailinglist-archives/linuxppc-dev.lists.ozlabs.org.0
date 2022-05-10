Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F755520E38
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 May 2022 08:57:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ky84C2BwQz3cH9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 May 2022 16:57:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=nifty.com header.i=@nifty.com header.a=rsa-sha256 header.s=dec2015msa header.b=wCwaSRXE;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (domain owner discourages use of this
 host) smtp.mailfrom=kernel.org (client-ip=210.131.2.90;
 helo=conssluserg-05.nifty.com; envelope-from=masahiroy@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=nifty.com header.i=@nifty.com header.a=rsa-sha256
 header.s=dec2015msa header.b=wCwaSRXE; 
 dkim-atps=neutral
Received: from conssluserg-05.nifty.com (conssluserg-05.nifty.com
 [210.131.2.90])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Ky83X5g8Zz2xnT
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 May 2022 16:56:56 +1000 (AEST)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
 [209.85.216.48]) (authenticated)
 by conssluserg-05.nifty.com with ESMTP id 24A6uWDh018533
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 May 2022 15:56:33 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com 24A6uWDh018533
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1652165793;
 bh=fEURvXR77OoRUwAby4ssOCC2y+9cYzZS2BTBBdHY5s4=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=wCwaSRXELTeXaq2guIuReTuZg7U66E7IGNEBvRfkfezGlyZXsSMCiDdUr9QEJxarS
 XrfMKl2ilUNX5U21uZSXL6zLwnIp0vZsPMbwwzeaW+huMjJN0lDJ6x9fPRe4b3ioLX
 d1CWYofvXhCGeTNOH4b2zCthanuoTTMVhHVGhU/G+RblgSvtBBoQY1q8W0F5FwtyK8
 pFbA+pcE2bpadKfX8PQAdO+AHk9AEs+Qvcqfz+EpBxXnZR+DExiobCnjj/rrTS0tnx
 CZPaFmdEMVXzwdp/7Jw3Kyv3btpFQ7MhJ18jWwmea1L+fCMHlCb2QwIfpTWtpSAEz9
 0NOjUjI1wdR0w==
X-Nifty-SrcIP: [209.85.216.48]
Received: by mail-pj1-f48.google.com with SMTP id
 j10-20020a17090a94ca00b001dd2131159aso1309359pjw.0
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 09 May 2022 23:56:33 -0700 (PDT)
X-Gm-Message-State: AOAM531znkEO/p5AtNdt3HvumkJRUBZ/cWnwjAcHrZmeDEx65Uv9dCzW
 bUAV0QhQALUD249b2trRlQXnF3aYuD9yxNuYCzk=
X-Google-Smtp-Source: ABdhPJyEgi0eqH+b8oqMunpHr855g62eqCOt9y9rnuZ3PqXxdNPec+4B1Ab1EtAdW8GXjXd92AJ/4rFTNMbUFO627GA=
X-Received: by 2002:a17:90a:e7cd:b0:1dc:74eb:7526 with SMTP id
 kb13-20020a17090ae7cd00b001dc74eb7526mr21753943pjb.144.1652165792292; Mon, 09
 May 2022 23:56:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220508190631.2386038-1-masahiroy@kernel.org>
 <CAK7LNAQtedww_RiemfTV7Ls=M01iKJhY14G3TiuAg=C3bvJjww@mail.gmail.com>
 <YnmSCNDBlMMJCbjj@dev-arch.thelio-3990X>
In-Reply-To: <YnmSCNDBlMMJCbjj@dev-arch.thelio-3990X>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 10 May 2022 15:55:21 +0900
X-Gmail-Original-Message-ID: <CAK7LNATkm+GzqNLgpbh4F+M=U8LU48p2NH9MyqeO6uA_KYJFaQ@mail.gmail.com>
Message-ID: <CAK7LNATkm+GzqNLgpbh4F+M=U8LU48p2NH9MyqeO6uA_KYJFaQ@mail.gmail.com>
Subject: Re: [PATCH v4 00/14] kbuild: yet another series of cleanups (modpost, 
 LTO, MODULE_REL_CRCS, export.h)
To: Nathan Chancellor <nathan@kernel.org>
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
 Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
 Peter Zijlstra <peterz@infradead.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 Sami Tolvanen <samitolvanen@google.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Ard Biesheuvel <ardb@kernel.org>,
 linux-modules <linux-modules@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, May 10, 2022 at 7:13 AM Nathan Chancellor <nathan@kernel.org> wrote:
>
> On Mon, May 09, 2022 at 01:24:33PM +0900, Masahiro Yamada wrote:
> > On Mon, May 9, 2022 at 4:09 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
> > >
> > > This is the third batch of cleanups in this development cycle.
> > >
> > > Major changes in v4:
> > >  - Move static EXPORT_SYMBOL check to a script
> > >  - Some refactoring
> > >
> > > Major changes in v3:
> > >
> > >  - Generate symbol CRCs as C code, and remove CONFIG_MODULE_REL_CRCS.
> > >
> > > Major changes in v2:
> > >
> > >  - V1 did not work with CONFIG_MODULE_REL_CRCS.
> > >    I fixed this for v2.
> > >
> > >  - Reflect some review comments in v1
> > >
> > >  - Refactor the code more
> > >
> > >  - Avoid too long argument error
> >
> > This series is available at
> > git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
> > lto-cleanup-v4
>
> Hi Masahiro,
>
> I checked this out and went to run it through my QEMU tests but I see
> two new errors.
>
> Failure #1:
>
> In file included from scripts/mod/section-check.c:3:
> scripts/mod/modpost.h:15:10: fatal error: 'elfconfig.h' file not found
> #include "elfconfig.h"
>          ^~~~~~~~~~~~~
> 1 error generated.
>
> I was able to get past that with
>
> diff --git a/scripts/mod/Makefile b/scripts/mod/Makefile
> index ca739c6c68a1..c33b83bfbcad 100644
> --- a/scripts/mod/Makefile
> +++ b/scripts/mod/Makefile
> @@ -16,7 +16,7 @@ targets += $(devicetable-offsets-file) devicetable-offsets.s
>
>  # dependencies on generated files need to be listed explicitly
>
> -$(obj)/modpost.o $(obj)/file2alias.o $(obj)/sumversion.o: $(obj)/elfconfig.h
> +$(obj)/modpost.o $(obj)/file2alias.o $(obj)/sumversion.o $(obj)/section-check.o: $(obj)/elfconfig.h
>  $(obj)/file2alias.o: $(obj)/$(devicetable-offsets-file)
>

Thanks for testing.


I will slightly refactor the code as follows.




@@ -16,7 +16,7 @@ targets += $(devicetable-offsets-file) devicetable-offsets.s

 # dependencies on generated files need to be listed explicitly

-$(obj)/modpost.o $(obj)/file2alias.o $(obj)/sumversion.o: $(obj)/elfconfig.h
+$(addprefix $(obj)/, $(modpost-objs)): $(obj)/elfconfig.h

 $(obj)/file2alias.o: $(obj)/$(devicetable-offsets-file)

 quiet_cmd_elfconfig = MKELF   $@








>  quiet_cmd_elfconfig = MKELF   $@
>
> Failure #2:
>
>   GEN     .version
>   CHK     include/generated/compile.h
>   GEN     .tmp_initcalls.lds
>   LTO     vmlinux.o
>   OBJTOOL vmlinux.o
>   MODPOST vmlinux.symvers
>   MODINFO modules.builtin.modinfo
>   GEN     modules.builtin
>   LD      .tmp_vmlinux.btf
> ld.lld: error: cannot open .vmlinux.export.o: No such file or directory
>   BTF     .btf.vmlinux.bin.o
> pahole: .tmp_vmlinux.btf: No such file or directory
>   CC      .vmlinux.export.c
>   LD      .tmp_vmlinux.kallsyms1
> ld.lld: error: .btf.vmlinux.bin.o: unknown file type
> make[1]: *** [Makefile:1159: vmlinux] Error 1
>
> I was not really able to see what is going wrong here. Attached is the
> configuration that I ran into this with. If you need any other
> information, please let me know!

Ah, OK.
This is because .vmlinux.export.o is compiled after gen_btf.

I will swap the order in v5.





> Cheers,
> Nathan



--
Best Regards
Masahiro Yamada
