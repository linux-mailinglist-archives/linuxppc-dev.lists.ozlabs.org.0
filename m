Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E16B126DD94
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Sep 2020 16:09:17 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bsf3G6jrYzDqcy
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Sep 2020 00:09:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=arndb.de
 (client-ip=212.227.126.133; helo=mout.kundenserver.de;
 envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arndb.de
X-Greylist: delayed 309 seconds by postgrey-1.36 at bilbo;
 Fri, 18 Sep 2020 00:07:01 AEST
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bsf0j0v4NzDqVW
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Sep 2020 00:07:00 +1000 (AEST)
Received: from mail-qk1-f177.google.com ([209.85.222.177]) by
 mrelayeu.kundenserver.de (mreue011 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1Mdva2-1ksnGR0QCs-00b5gJ for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Sep
 2020 16:01:45 +0200
Received: by mail-qk1-f177.google.com with SMTP id o5so2229918qke.12
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Sep 2020 07:01:44 -0700 (PDT)
X-Gm-Message-State: AOAM530UOs57qlle+96Er9PPJ5EPPgbfh8+hGOGotuCUr7zW9u04LIA4
 PKn0oH5+dziNB+/lHmOf1GuT8+YLVCSRubN/B6E=
X-Google-Smtp-Source: ABdhPJypvKt5K6vsRgjllHkNp0imyN+bOqaU9zpMG48JdwZ9KbFYFADzd403hy36sDpE2nZf6WeaV+/92apRwmmxTPo=
X-Received: by 2002:a37:a495:: with SMTP id
 n143mr28117696qke.394.1600351303235; 
 Thu, 17 Sep 2020 07:01:43 -0700 (PDT)
MIME-Version: 1.0
References: <20200916074214.995128-1-Tony.Ambardar@gmail.com>
 <20200917000757.1232850-1-Tony.Ambardar@gmail.com>
 <87363gpqhz.fsf@mpe.ellerman.id.au>
In-Reply-To: <87363gpqhz.fsf@mpe.ellerman.id.au>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 17 Sep 2020 16:01:27 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3FVoDzNb1TOA6cRQDdEc+st7KkBL70t0FeStEziQG4+A@mail.gmail.com>
Message-ID: <CAK8P3a3FVoDzNb1TOA6cRQDdEc+st7KkBL70t0FeStEziQG4+A@mail.gmail.com>
Subject: Re: [PATCH v2] powerpc: fix EDEADLOCK redefinition error in
 uapi/asm/errno.h
To: Michael Ellerman <mpe@ellerman.id.au>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:wOR6mhAnmuSRFeYKf4cRTURKdMyT494BS8Jz5QiGGUqdhMkeluS
 Yk5EfDa9wQAgarMVl3/4IjshLFq0qfb9CVy5k1ySNEdAcfHrgT0e9K7GzLqZ9O4VxMBxB1b
 Tfwd6na6JKlBPyx81MxIALBcIJl2zQFFiKTawG1ecBtK5k4Db6K8gHmdszU87L1Gg+eyEUR
 AFwWV9rXmEPsRa+HGlWag==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:pbAw47vV1tE=:fbuyloNOxjGhkb4S5aTf/+
 LtP8EdIWtmOkSu4e/FS3PVnSF/MmQWuI7h3/lqkJSpEiJXY0y39J9J4LKaFloLg51N2+6w0fg
 eGu0PvaaOKfHm18woVNDjX4dOodJ5jo4IwEblLX9jBhavP4Dnpa3TEzhpa7rr1cIGqPRBDEy3
 soFYAktWZy44aItkHxwfPn0ouTMO47+sSXw3KkHYsEz7Fk33x4b5AI1YoseH8nsepxvk0J6OP
 RYMqvQrwTBaoZb8t9ILR1oZIr28ko+l1xepRz8rtUcMDOD16ApT+RLocFgcS29PbPpfMh+LU8
 ZcylPteszg6URGckNzjb5vLT2ooDIza3grSuux3T/kROY+HuZCW0GPSJ18tPSXlWlBOBYShnr
 LvGisMEUQu3aBX9lnx8FQHCvjdATCZUWAjpUF/kbdFpLTZuNsAl2rtieV0uuOyOpDF050KTWe
 QFmkEYFqGnVvvwhnfxlsC6Wy1lIQFy1fSfQLSNSP7OpwwenzlTWOkBkRlhP7zx6pKBz8ULXUO
 LjIsxNvXNK/h5UT43mS821v47QKPQvJOH5MmcaBg1oDJPgSj+KGUyw5bMlbaBjXFKw1zVK3bv
 a9IMv0KVo6lqiJAQGYZpV4hXDXKCFQwrTR+1J7+XTTR138SEV7NxRqiC36qpMGB8+g5zA3eS7
 /izHQ9OH/EotS1fPlswntVaEJv7s9xCsmvfQxaMSKJBkVzBBM+R8bxO4dCZVY22MIufonBzju
 P3WFjb0ciFOmtKdIr0WM0qYOToLikSPHHPxmv1xT8PWogiSav//67CXCCieZVvzK+PNTBlqR6
 Bq6EfWgcDg36lPomhbYg3kb8/x4vghYn4B6VQF/9tQTJ586Jx2QtUDkTjaVdK9uu9/6sHaz
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
Cc: linux-arch <linux-arch@vger.kernel.org>,
 Tony Ambardar <tony.ambardar@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Paul Mackerras <paulus@samba.org>, Rosen Penev <rosenp@gmail.com>,
 bpf <bpf@vger.kernel.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Sep 17, 2020 at 1:55 PM Michael Ellerman <mpe@ellerman.id.au> wrote:
>
> [ Cc += linux-arch & Arnd ]
>
> Hi Tony,
>
> This looks OK to me, but I'm always a bit nervous about changes in uapi.
> I've Cc'ed linux-arch and Arnd who look after the asm-generic headers,
> which this is slightly related to, just in case.
>
> One minor comment below.
>
> Tony Ambardar <tony.ambardar@gmail.com> writes:
> > A few archs like powerpc have different errno.h values for macros
> > EDEADLOCK and EDEADLK. In code including both libc and linux versions of
> > errno.h, this can result in multiple definitions of EDEADLOCK in the
> > include chain. Definitions to the same value (e.g. seen with mips) do
> > not raise warnings, but on powerpc there are redefinitions changing the
> > value, which raise warnings and errors (if using "-Werror").
> >
> > Guard against these redefinitions to avoid build errors like the following,
> > first seen cross-compiling libbpf v5.8.9 for powerpc using GCC 8.4.0 with
> > musl 1.1.24:
> >
> >   In file included from ../../arch/powerpc/include/uapi/asm/errno.h:5,
> >                    from ../../include/linux/err.h:8,
> >                    from libbpf.c:29:
> >   ../../include/uapi/asm-generic/errno.h:40: error: "EDEADLOCK" redefined [-Werror]
> >    #define EDEADLOCK EDEADLK
> >
> >   In file included from toolchain-powerpc_8540_gcc-8.4.0_musl/include/errno.h:10,
> >                    from libbpf.c:26:
> >   toolchain-powerpc_8540_gcc-8.4.0_musl/include/bits/errno.h:58: note: this is the location of the previous definition
> >    #define EDEADLOCK       58
> >
> >   cc1: all warnings being treated as errors
> >
> > Fixes: 95f28190aa01 ("tools include arch: Grab a copy of errno.h for arch's supported by perf")
> > Fixes: c3617f72036c ("UAPI: (Scripted) Disintegrate arch/powerpc/include/asm")
>
> I suspect that's not the right commit to tag. It just moved errno.h from
> arch/powerpc/include/asm to arch/powerpc/include/uapi/asm. It's content
> was almost identical, and entirely identical as far as EDEADLOCK was
> concerned.
>
> Prior to that the file lived in asm-powerpc/errno.h, eg:
>
> $ git cat-file -p b8b572e1015f^:include/asm-powerpc/errno.h
>
> Before that it was include/asm-ppc64/errno.h, content still the same.
>
> To go back further we'd have to look at the historical git trees, which
> is probably overkill. I'm pretty sure it's always had this problem.
>
> So we should probably drop the Fixes tags and just Cc: stable, that
> means please backport it as far back as possible.

I can see that the two numbers (35 and 58) were consistent across
multiple architectures (i386, m68k, ppc32) up to linux-2.0.1, while
other architectures had two unique numbers (alpha, mips, sparc)
at the time, and sparc had BSD and Solaris compatible numbers
in addition.

In linux-2.0.2, alpha and i386 got changed to use 35 for both,
but the other architectures remained unchanged. All later
architectures followed x86 in using the same number for both.

I foudn a message about tcl breaking at compile time when
it changed:
http://lkml.iu.edu/hypermail/linux/kernel/9607.3/0500.html

The errno man page says they are supposed to be synonyms,
and glibc defines it that way, while musl uses the numbers
from the kernel.

        Arnd
