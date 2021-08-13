Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D2933EBC01
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Aug 2021 20:25:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GmX6K6v6sz3cJN
	for <lists+linuxppc-dev@lfdr.de>; Sat, 14 Aug 2021 04:25:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20161025 header.b=T4ogPSfD;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::631;
 helo=mail-ej1-x631.google.com; envelope-from=morbo@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=T4ogPSfD; dkim-atps=neutral
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GmX5f2D7Zz3bjK
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 14 Aug 2021 04:24:36 +1000 (AEST)
Received: by mail-ej1-x631.google.com with SMTP id b10so11341996eju.9
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Aug 2021 11:24:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IgSWlgrvg7Y/toinu9+8DguAJs62b7mo/FK1YGP/k+M=;
 b=T4ogPSfDQZQc8DhKTa5ShkRKxMrzxPDTXrPMXDKVOb/W38RaGl6Pc/jYGv2Q2o/8Ma
 m5kuynAxW6I6EZPZIeKLrmm55nG3xjlEcopXls/+arcnfdX3Kwl2NmK6xqW+k4/krDxd
 HRmub3mn1XtET4oUccw9b/UczjX0B97bgwNKECdsNsgdZX33YWN9FjYwScSzszI/068y
 iSdMU2OWhnMr+c2ma4HMlL7FfFKMFdFKoaLKYPK3gMGLYxoHygH6x15c7j/quwchboAu
 35nEVxDt7NJiKNv+CxzQsV93UKsI80BCDaKoR+GpN7WMcztXLGl0dVeRg53nmeag0SCN
 i9Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IgSWlgrvg7Y/toinu9+8DguAJs62b7mo/FK1YGP/k+M=;
 b=F0kTb1I5NjwmEZ77P0N6FJ6l9LgoTrDdayZkd3hKNmB6Tna9d0L5E1wBkbAPWAgcIX
 3evNkK9hHgB7iET7b6SynMntLswhezOiuI1fkZhePiKKne0LKeAxhsZjK653Zo/efjGm
 ardGbqI+3TX36fsu1h9A1nc6xdH59RC3EOyR0WUQyXktxCFvPMbura3eT/I/K5J05xKK
 xjTRKYYXeKkrIpULHqY/Vnfm4ldfagg5tK+WBudg0HY3TsUjpbfj2yfjYZ1/xtP3m2Y1
 dnukIfqerTldg6GKNs1F54FPK9bkYTFzVn/aSxKL1pGKH3dgYy6uc0XzeH0H1IcWuv1d
 VXCw==
X-Gm-Message-State: AOAM5306B/EugD0PFEt1XgqpmiX+t5bh0n+GdN3tDB0JRNCRH4ZkOCq3
 dvJE3czWDUedlyTVOmDXyauxzyFr95sl/gn7oksy
X-Google-Smtp-Source: ABdhPJxREcD5Nm/lmdmwnWqz3zpbvhxy7XMTBhK5i3Rz2TzEsbXdqCneDNrtDsSkvz1uUmEMQ5rU+CC3GwioP1gCqEQ=
X-Received: by 2002:a17:906:f854:: with SMTP id
 ks20mr3839626ejb.421.1628879067322; 
 Fri, 13 Aug 2021 11:24:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210812204951.1551782-1-morbo@google.com>
 <87sfzde8lk.fsf@linkitivity.dja.id.au>
In-Reply-To: <87sfzde8lk.fsf@linkitivity.dja.id.au>
From: Bill Wendling <morbo@google.com>
Date: Fri, 13 Aug 2021 11:24:16 -0700
Message-ID: <CAGG=3QUz2LNgC8Hn6rU68ejjv4=J9Uidef0oH9A7=sKTs+vf7g@mail.gmail.com>
Subject: Re: [PATCH] ppc: add "-z notext" flag to disable diagnostic
To: Daniel Axtens <dja@axtens.net>, Fangrui Song <maskray@google.com>
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
Cc: Nick Desaulniers <ndesaulniers@google.com>,
 LKML <linux-kernel@vger.kernel.org>, Nathan Chancellor <nathan@kernel.org>,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Aug 13, 2021 at 7:13 AM Daniel Axtens <dja@axtens.net> wrote:
>
> Bill Wendling <morbo@google.com> writes:
>
> > The "-z notext" flag disables reporting an error if DT_TEXTREL is set on
> > PPC with CONFIG=kdump:
> >
> >   ld.lld: error: can't create dynamic relocation R_PPC64_ADDR64 against
> >     local symbol in readonly segment; recompile object files with -fPIC
> >     or pass '-Wl,-z,notext' to allow text relocations in the output
> >   >>> defined in built-in.a(arch/powerpc/kernel/misc.o)
> >   >>> referenced by arch/powerpc/kernel/misc.o:(.text+0x20) in archive
> >       built-in.a
> >
> > The BFD linker disables this by default (though it's configurable in
> > current versions). LLD enables this by default. So we add the flag to
> > keep LLD from emitting the error.
>
> You didn't provide a huge amount of context but I was able to reproduce
> a similar set of errors with pseries_le_defconfig and
>
My apologies for the lack of context. We discovered this issue when
moving to use LLD instead of BFD for our linker. This change suggested
by Fangrui Song. Here's his comments from
https://github.com/ClangBuiltLinux/linux/issues/811. (Nick Desaulniers
added a "Link" tag with his review.)

```
The text relocations are real. lld can link .tmp_vmlinux1 smoothly if
you pass -z notext. Though, it will still be insightful to investigate
where these text relocations come from. I believe there are only 2
categories.

(a) For a CONFIG_HAVE_ARCH_PREL32_RELOCATIONS=y build (x86 and arm64
select the option by default), ___ksymtab+* sections (non-SHF_WRITE)
contains entries relocated by PC relative relocations. These entries
do not need dynamic relocations.

out/powerpc64le/.config generated by ppc64le_defconfig does not enable
CONFIG_HAVE_ARCH_PREL32_RELOCATIONS=y.

% readelf -r out/x86_64/entry/entry_64.o
...
Relocation section '.rela___ksymtab+native_load_gs_index' at offset
0x6460 contains 2 entries:
    Offset             Info             Type               Symbol's
Value  Symbol's Name + Addend
0000000000000000  0000007a00000002 R_X86_64_PC32
0000000000000ea0 native_load_gs_index + 0
0000000000000004  0000001d00000002 R_X86_64_PC32
0000000000000000 __ksymtab_strings + 0

include/asm-generic/export.h

ld.lld: error: can't create dynamic relocation R_PPC64_ADDR64 against
local symbol in readonly segment; recompile object files with -fPIC or
pass '-Wl
,-z,notext' to allow text relocations in the output
>>> defined in init/built-in.a(do_mounts.o)
>>> referenced by do_mounts.c
>>>               do_mounts.o:(__ksymtab_name_to_dev_t) in archive init/built-in.a

(b) R_PPC64_ADDR64 in __mcount_loc sections.

ld.lld: error: can't create dynamic relocation R_PPC64_ADDR64 against
local symbol in readonly segment; recompile object files with -fPIC or
pass '-Wl
,-z,notext' to allow text relocations in the output
>>> defined in init/built-in.a(do_mounts_rd.o)
>>> referenced by do_mounts_rd.c
>>>               do_mounts_rd.o:(__mcount_loc+0x0) in archive init/built-in.a

This section is generated by ./scripts/recordmcount
"init/do_mounts_rd.o". The tool hard codes R_PPC64_ADDR64.

% grep PPC64 scripts/recordmcount.c
        case EM_PPC64:  reltype = R_PPC64_ADDR64; break;
```

> make ARCH=powerpc CROSS_COMPILE=powerpc64-linux-gnu- CC="ccache clang-11" LD=ld.lld-11 AR=llvm-ar-11 -j4 vmlinux
>
> I also checked the manpage, and indeed the system ld does not issue this
> warning/error by default.
>
It should be noted that the BFD linker can emit this warning/error if
binutils is configured with
"--enable-textrel-check={warning,error,yes}".

> > ---
> >  arch/powerpc/Makefile | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
> > index 6505d66f1193..17a9fbf9b789 100644
> > --- a/arch/powerpc/Makefile
> > +++ b/arch/powerpc/Makefile
> > @@ -122,6 +122,7 @@ endif
> >
> >  LDFLAGS_vmlinux-y := -Bstatic
> >  LDFLAGS_vmlinux-$(CONFIG_RELOCATABLE) := -pie
> > +LDFLAGS_vmlinux-$(CONFIG_RELOCATABLE) += -z notext
>
> Is there any reason this should be gated on CONFIG_RELOCATABLE? (I tried
> without it and got different but possibly related linker errors...)
>
My understanding is that '-z notext' allows (i.e. doesn't emit
warnings/errors for) relocations against read-only segments. So it's
not really relevant to non-relocatable builds.

Unrelated question: Should the "-pie" flag be added with "+= -pie"
(note the plus sign)?

> Also, is this behaviour new?
>
I don't believe so. It's only when we wanted to use LLD that it was noticed.

BTW, this patch should more properly be attributed to Fangrui Song. I
can send a follow-up patch that reflects this and adds more context to
the commit message.

-bw

> Kind regards,
> Daniel
>
> >  LDFLAGS_vmlinux      := $(LDFLAGS_vmlinux-y)
> >
> >  ifdef CONFIG_PPC64
> > --
> > 2.33.0.rc1.237.g0d66db33f3-goog
