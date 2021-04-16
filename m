Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0818A36204F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Apr 2021 14:54:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FMGPn02Z0z3c3c
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Apr 2021 22:54:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=nifty.com header.i=@nifty.com header.a=rsa-sha256 header.s=dec2015msa header.b=pnl4cChP;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (domain owner discourages use of this
 host) smtp.mailfrom=kernel.org (client-ip=210.131.2.81;
 helo=conssluserg-02.nifty.com; envelope-from=masahiroy@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=nifty.com header.i=@nifty.com header.a=rsa-sha256
 header.s=dec2015msa header.b=pnl4cChP; 
 dkim-atps=neutral
Received: from conssluserg-02.nifty.com (conssluserg-02.nifty.com
 [210.131.2.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FMGPL2Bkzz3bSj
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Apr 2021 22:54:13 +1000 (AEST)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com
 [209.85.216.52]) (authenticated)
 by conssluserg-02.nifty.com with ESMTP id 13GCruic029992
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Apr 2021 21:53:57 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com 13GCruic029992
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1618577637;
 bh=FpBTE/PmjepHTlzWsrX59REOgQgL2WrtsCCIoF/CYWE=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=pnl4cChP9BDT4wIiEZMCXce74IYPbyviH0geJnOMydzhvTMMKqvimUCJ8LuO/ydUi
 B7GCRGzMyz8AbBjXaIdqdOj97w4Mvl4+xM1yl+DjOmMRHy8sXXrxwF2VPV6p3HkIDh
 n6j6f7LmOePGYddtG4MeM1IJTF09NZL2HYvxNn0VmUbtcoGAQN0WIk8JwzmNwqxNuH
 IfVvglF9RnOeg2qR9OQZYFuxmRVvfEgsWCD65f5cmxQGtubERM4wyCwE/Fx0XhOF6+
 fHFg+T4J4DNZEIcoxa3aGVqRu3zGr7QifJpt93kYMOXSvEw6iuQScro++18+YzyjqF
 Xuddd4D8zQwkQ==
X-Nifty-SrcIP: [209.85.216.52]
Received: by mail-pj1-f52.google.com with SMTP id
 k23-20020a17090a5917b02901043e35ad4aso16317504pji.3
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Apr 2021 05:53:57 -0700 (PDT)
X-Gm-Message-State: AOAM530jcLOfpvGZzEDAcDX2Q+2P9fw+x9K7qVhHbfAvmrUfcQqHOd0/
 n7t70utHBazu3/21BBNHJj2hm3zKx9TNsFxrTtk=
X-Google-Smtp-Source: ABdhPJxb/FC19twtF+zRiYRXoqGzOZCJTyiYCPanDW2DbASdA2RE0I7WCFpU5qPpBix6mu/jtdFnthAB/xgwIUGoUjg=
X-Received: by 2002:a17:90a:1056:: with SMTP id
 y22mr9094969pjd.153.1618577636323; 
 Fri, 16 Apr 2021 05:53:56 -0700 (PDT)
MIME-Version: 1.0
References: <20210415072700.147125-1-masahiroy@kernel.org>
 <20210415072700.147125-2-masahiroy@kernel.org>
 <eb623ea6-a2f4-9692-ff3d-cb9f9b9ea15f@de.ibm.com>
 <0eeed665-a105-917b-e7fb-8dafe2ae9d94@de.ibm.com>
In-Reply-To: <0eeed665-a105-917b-e7fb-8dafe2ae9d94@de.ibm.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Fri, 16 Apr 2021 21:53:18 +0900
X-Gmail-Original-Message-ID: <CAK7LNASfiiLJd9dOpaJ47pJ4FzgV8JL3vU8okOYz0=eaE4OYgQ@mail.gmail.com>
Message-ID: <CAK7LNASfiiLJd9dOpaJ47pJ4FzgV8JL3vU8okOYz0=eaE4OYgQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] tools: do not include scripts/Kbuild.include
To: Christian Borntraeger <borntraeger@de.ibm.com>
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
Cc: Song Liu <songliubraving@fb.com>, kvm@vger.kernel.org,
 Alexei Starovoitov <ast@kernel.org>, Paul Mackerras <paulus@samba.org>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 Shuah Khan <shuah@kernel.org>, Janosch Frank <frankja@linux.ibm.com>,
 Daniel Borkmann <daniel@iogearbox.net>,
 John Fastabend <john.fastabend@gmail.com>, Andrii Nakryiko <andrii@kernel.org>,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 Harish <harish@linux.ibm.com>, Yonghong Song <yhs@fb.com>,
 Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
 KP Singh <kpsingh@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
 Networking <netdev@vger.kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Paolo Bonzini <pbonzini@redhat.com>, bpf <bpf@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Martin KaFai Lau <kafai@fb.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Apr 16, 2021 at 2:56 PM Christian Borntraeger
<borntraeger@de.ibm.com> wrote:
>
>
> On 15.04.21 10:06, Christian Borntraeger wrote:
> >
> > On 15.04.21 09:27, Masahiro Yamada wrote:
> >> Since commit d9f4ff50d2aa ("kbuild: spilt cc-option and friends to
> >> scripts/Makefile.compiler"), some kselftests fail to build.
> >>
> >> The tools/ directory opted out Kbuild, and went in a different
> >> direction. They copy any kind of files to the tools/ directory
> >> in order to do whatever they want to do in their world.
> >>
> >> tools/build/Build.include mimics scripts/Kbuild.include, but some
> >> tool Makefiles included the Kbuild one to import a feature that is
> >> missing in tools/build/Build.include:
> >>
> >>   - Commit ec04aa3ae87b ("tools/thermal: tmon: use "-fstack-protector"
> >>     only if supported") included scripts/Kbuild.include from
> >>     tools/thermal/tmon/Makefile to import the cc-option macro.
> >>
> >>   - Commit c2390f16fc5b ("selftests: kvm: fix for compilers that do
> >>     not support -no-pie") included scripts/Kbuild.include from
> >>     tools/testing/selftests/kvm/Makefile to import the try-run macro.
> >>
> >>   - Commit 9cae4ace80ef ("selftests/bpf: do not ignore clang
> >>     failures") included scripts/Kbuild.include from
> >>     tools/testing/selftests/bpf/Makefile to import the .DELETE_ON_ERROR
> >>     target.
> >>
> >>   - Commit 0695f8bca93e ("selftests/powerpc: Handle Makefile for
> >>     unrecognized option") included scripts/Kbuild.include from
> >>     tools/testing/selftests/powerpc/pmu/ebb/Makefile to import the
> >>     try-run macro.
> >>
> >> Copy what they want there, and stop including scripts/Kbuild.include
> >> from the tool Makefiles.
> >>
> >> Link: https://lore.kernel.org/lkml/86dadf33-70f7-a5ac-cb8c-64966d2f45a1@linux.ibm.com/
> >> Fixes: d9f4ff50d2aa ("kbuild: spilt cc-option and friends to scripts/Makefile.compiler")
> >> Reported-by: Janosch Frank <frankja@linux.ibm.com>
> >> Reported-by: Christian Borntraeger <borntraeger@de.ibm.com>
> >> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> >
> > When applying this on top of d9f4ff50d2aa ("kbuild: spilt cc-option and friends to scripts/Makefile.compiler")
> >
> > I still do get
> >
> > # ==== Test Assertion Failure ====
> > #   lib/kvm_util.c:142: vm->fd >= 0
> > #   pid=315635 tid=315635 - Invalid argument
> > #      1    0x0000000001002f4b: vm_open at kvm_util.c:142
> > #      2     (inlined by) vm_create at kvm_util.c:258
> > #      3    0x00000000010015ef: test_add_max_memory_regions at set_memory_region_test.c:351
> > #      4     (inlined by) main at set_memory_region_test.c:397
> > #      5    0x000003ff971abb89: ?? ??:0
> > #      6    0x00000000010017ad: .annobin_abi_note.c.hot at crt1.o:?
> > #   KVM_CREATE_VM ioctl failed, rc: -1 errno: 22
> > not ok 7 selftests: kvm: set_memory_region_test # exit=254
> >
> > and the testcase compilation does not pickup the pgste option.
>
> What does work is the following:
> diff --git a/tools/testing/selftests/kvm/Makefile b/tools/testing/selftests/kvm/Makefile
> index a6d61f451f88..d9c6d9c2069e 100644
> --- a/tools/testing/selftests/kvm/Makefile
> +++ b/tools/testing/selftests/kvm/Makefile
> @@ -1,5 +1,6 @@
>   # SPDX-License-Identifier: GPL-2.0-only
>   include ../../../../scripts/Kbuild.include
> +include ../../../../scripts/Makefile.compiler
>
>   all:
>
>
> as it does pickup the linker option handling.


Kbuild and the tools are divorced.

They cannot be married unless the tools/
build system is largely refactored.
That will be a tons of works (and
I am not sure if it is welcome).

The Kbuild refactoring should not be bothered by
the tools.
For now, I want them separated from each other.



--
Best Regards

Masahiro Yamada
