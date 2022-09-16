Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D89D5BA3AB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Sep 2022 03:03:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MTG6K5k1Sz3c70
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Sep 2022 11:03:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=TtmEZUL3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52e; helo=mail-pg1-x52e.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=TtmEZUL3;
	dkim-atps=neutral
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MTG5h6sWQz2ypn
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Sep 2022 11:03:04 +1000 (AEST)
Received: by mail-pg1-x52e.google.com with SMTP id q9so9774750pgq.8
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Sep 2022 18:03:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date;
        bh=Zsir0UG/7GHfSDPPVpbCB7/1unN5NrwvEofGfVaWg90=;
        b=TtmEZUL3Ov6j775sUDbjYkLmTDEzlafuP4/Lrc4rwcCWCtcW2TEmuBRs1NRWK2Q2Z4
         RZ+nxd2ck6ZxWuTkrb5jK6s7mExWsn3wcd+TZ6GyN7ZbQ5Fi2iaQORHbcEHtyaWtvmR0
         NN3hx8/VcfGYw++MK807S1m3KKfp8UVMvyFk1cPRmNo/sk0MNMrDt3rRJSfHFhBqKGkH
         DkPrcVyeMGQYWanZimowXovy93wAQKS8Vz5ZMG9AXrwt/1emh2JN2MDcCRaQUK7r5a0f
         oHpRQhJ7svqF/9CrsXbQZqXPGrf4Rpo6tProzFHHZs1bBjGv4s+2qmgZVQoRRyQRb1ln
         31rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date;
        bh=Zsir0UG/7GHfSDPPVpbCB7/1unN5NrwvEofGfVaWg90=;
        b=G6qWbu2fUPJzeUUOQ0fJMMFLETYR3i0NAWsD4z+dL/agzREejjBmv2NUkw6PfN4laX
         uY5o5mymfoK9ArdkXaC+i6NHyQFcpUwXXztgyzs1aexeHQ+m1fDkm2jIY7u8hJyD6yIh
         3d5pq/l0n85GaTHH6f7PCWs5nWnNHpa/4aMXaZDYKW+neifeSK6RZQ3kStPHC4kyqwIh
         xoAIfrM6ODjPYzZCYggR0aJXO8dvEutBZPaNsIFW4o1H/cpIOyv8frLON1AECEOVZm/v
         afkBxIJ6v+UCvWH5pY4TkawDCshmQq4qEjW7EidLZDwDb1r+VR4xs3TdPFW8+2Q6xco+
         WeSg==
X-Gm-Message-State: ACrzQf1SzJ72BwB9zHJY1/gWtZXIm980zcR2c9BrIWG8tZFYRNywRrHq
	5huwmn3oj9uAxli9+w77f2w2GB9zQis=
X-Google-Smtp-Source: AMsMyM5Y1oQHbRqJr355tU9VNvfy2zBcwu/ZPR1vFT1ZRn69LPxXCudzj2j7jaGzGpwHyKY4wwcgzQ==
X-Received: by 2002:a63:d20b:0:b0:439:1c48:2209 with SMTP id a11-20020a63d20b000000b004391c482209mr2337417pgg.93.1663290181759;
        Thu, 15 Sep 2022 18:03:01 -0700 (PDT)
Received: from localhost ([118.210.107.131])
        by smtp.gmail.com with ESMTPSA id p14-20020a17090a2c4e00b001fa80cde150sm239776pjm.20.2022.09.15.18.02.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Sep 2022 18:03:00 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 16 Sep 2022 11:02:56 +1000
Message-Id: <CMXF5QO08SOS.38XBOA3F2L41P@bobo>
To: "Rohan McLure" <rmclure@linux.ibm.com>
Subject: Re: [PATCH v4 10/20] powerpc: Use common syscall handler type
From: "Nicholas Piggin" <npiggin@gmail.com>
X-Mailer: aerc 0.11.0
References: <20220824020548.62625-1-rmclure@linux.ibm.com>
 <20220824020548.62625-11-rmclure@linux.ibm.com>
 <CMUDA0ALFBSI.5KMSI1NSJZH7@bobo>
 <6E8ADD7A-6122-4615-8BFC-C1104F13B283@linux.ibm.com>
In-Reply-To: <6E8ADD7A-6122-4615-8BFC-C1104F13B283@linux.ibm.com>
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu Sep 15, 2022 at 3:45 PM AEST, Rohan McLure wrote:
>
>
> > On 12 Sep 2022, at 8:56 pm, Nicholas Piggin <npiggin@gmail.com> wrote:
> >=20
> > On Wed Aug 24, 2022 at 12:05 PM AEST, Rohan McLure wrote:
> >> Cause syscall handlers to be typed as follows when called indirectly
> >> throughout the kernel.
> >>=20
> >> typedef long (*syscall_fn)(unsigned long, unsigned long, unsigned long=
,
> >>                           unsigned long, unsigned long, unsigned long)=
;
> >=20
> > The point is... better type checking?
> >=20
> >>=20
> >> Since both 32 and 64-bit abis allow for at least the first six
> >> machine-word length parameters to a function to be passed by registers=
,
> >> even handlers which admit fewer than six parameters may be viewed as
> >> having the above type.
> >>=20
> >> Fixup comparisons in VDSO to avoid pointer-integer comparison. Introdu=
ce
> >> explicit cast on systems with SPUs.
> >>=20
> >> Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
> >> ---
> >> V1 -> V2: New patch.
> >> V2 -> V3: Remove unnecessary cast from const syscall_fn to syscall_fn
> >> ---
> >> arch/powerpc/include/asm/syscall.h          | 7 +++++--
> >> arch/powerpc/include/asm/syscalls.h         | 1 +
> >> arch/powerpc/kernel/systbl.c                | 6 +++---
> >> arch/powerpc/kernel/vdso.c                  | 4 ++--
> >> arch/powerpc/platforms/cell/spu_callbacks.c | 6 +++---
> >> 5 files changed, 14 insertions(+), 10 deletions(-)
> >>=20
> >> diff --git a/arch/powerpc/include/asm/syscall.h b/arch/powerpc/include=
/asm/syscall.h
> >> index 25fc8ad9a27a..d2a8dfd5de33 100644
> >> --- a/arch/powerpc/include/asm/syscall.h
> >> +++ b/arch/powerpc/include/asm/syscall.h
> >> @@ -14,9 +14,12 @@
> >> #include <linux/sched.h>
> >> #include <linux/thread_info.h>
> >>=20
> >> +typedef long (*syscall_fn)(unsigned long, unsigned long, unsigned lon=
g,
> >> +			   unsigned long, unsigned long, unsigned long);
> >> +
> >> /* ftrace syscalls requires exporting the sys_call_table */
> >> -extern const unsigned long sys_call_table[];
> >> -extern const unsigned long compat_sys_call_table[];
> >> +extern const syscall_fn sys_call_table[];
> >> +extern const syscall_fn compat_sys_call_table[];
> >=20
> > Ah you constify it in this patch. I think the previous patch should hav=
e
> > kept the const, and it should keep the unsigned long type rather than
> > use void *. Either that or do this patch first.
> >=20
> >> static inline int syscall_get_nr(struct task_struct *task, struct pt_r=
egs *regs)
> >> {
> >> diff --git a/arch/powerpc/include/asm/syscalls.h b/arch/powerpc/includ=
e/asm/syscalls.h
> >> index 91417dee534e..e979b7593d2b 100644
> >> --- a/arch/powerpc/include/asm/syscalls.h
> >> +++ b/arch/powerpc/include/asm/syscalls.h
> >> @@ -8,6 +8,7 @@
> >> #include <linux/types.h>
> >> #include <linux/compat.h>
> >>=20
> >> +#include <asm/syscall.h>
> >> #ifdef CONFIG_PPC64
> >> #include <asm/syscalls_32.h>
> >> #endif
> >=20
> > Is this necessary or should be in another patch?
>
> Good spot. This belongs in the patch that produces systbl.c.
>
> >=20
> >> diff --git a/arch/powerpc/kernel/systbl.c b/arch/powerpc/kernel/systbl=
.c
> >> index 99ffdfef6b9c..b88a9c2a1f50 100644
> >> --- a/arch/powerpc/kernel/systbl.c
> >> +++ b/arch/powerpc/kernel/systbl.c
> >> @@ -21,10 +21,10 @@
> >> #define __SYSCALL(nr, entry) [nr] =3D __powerpc_##entry,
> >> #define __powerpc_sys_ni_syscall	sys_ni_syscall
> >> #else
> >> -#define __SYSCALL(nr, entry) [nr] =3D entry,
> >> +#define __SYSCALL(nr, entry) [nr] =3D (void *) entry,
> >> #endif
> >=20
> > Also perhaps this should have been in the prior pach and this pach
> > should change the cast from void to syscall_fn ?
>
> This cast to (void *) kicks in when casting functions with six or fewer

Right, I was just wondering if it needs to be in the previous patch
because that's where you changed the type from unsigned long to void *.
Maybe there's some reason it's not required, I didn't entirely follow
all the macro expansion.

> parameters to six-parameter type accepting and returning u64. Sadly I can=
=E2=80=99t
> find a way to avoid -Wcast-function-type even with (__force syscall_fn) s=
hort
> of an ugly casti to void* here. Any suggestions?

Ah okay. I think __force is a sparse specific attribute. Not sure if
gcc/clang can do it. There is a diag thing which maybe can turn off
warnings selectively, but if (void *) is turning off the warning
selectively then there would be no benefit to using it :) That's fine to
keep using void *.

Thanks,
Nick
