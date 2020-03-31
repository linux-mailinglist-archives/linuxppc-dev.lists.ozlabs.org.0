Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A9B23198A19
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Mar 2020 04:43:24 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48rttK0ptGzDqqK
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Mar 2020 13:43:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48rtrM3X03zDqdq
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 31 Mar 2020 13:41:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=informatik.wtf
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 48rtrM1GJ2z9BMl
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 31 Mar 2020 13:41:39 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 48rtrM0kbrz9sSJ; Tue, 31 Mar 2020 13:41:39 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=informatik.wtf (client-ip=131.153.2.42;
 helo=h1.fbrelay.privateemail.com; envelope-from=cmr@informatik.wtf;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org; dmarc=none (p=none dis=none)
 header.from=informatik.wtf
Received: from h1.fbrelay.privateemail.com (h1.fbrelay.privateemail.com
 [131.153.2.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 48rtrL1YW1z9sSK
 for <linuxppc-dev@ozlabs.org>; Tue, 31 Mar 2020 13:41:38 +1100 (AEDT)
Received: from MTA-13-3.privateemail.com (mta-13.privateemail.com
 [198.54.118.203])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by h1.fbrelay.privateemail.com (Postfix) with ESMTPS id 2682380B46
 for <linuxppc-dev@ozlabs.org>; Mon, 30 Mar 2020 22:41:34 -0400 (EDT)
Received: from mta-13.privateemail.com (localhost [127.0.0.1])
 by mta-13.privateemail.com (Postfix) with ESMTP id A5BF480053;
 Mon, 30 Mar 2020 22:41:29 -0400 (EDT)
Received: from APP-04 (unknown [10.20.147.154])
 by mta-13.privateemail.com (Postfix) with ESMTPA id 8898B8004B;
 Tue, 31 Mar 2020 02:41:29 +0000 (UTC)
Date: Mon, 30 Mar 2020 21:41:29 -0500 (CDT)
From: Christopher M Riedl <cmr@informatik.wtf>
To: Christophe Leroy <christophe.leroy@c-s.fr>, linuxppc-dev@ozlabs.org
Message-ID: <1121931785.111345.1585622489520@privateemail.com>
In-Reply-To: <2057834a-01d3-958a-1674-cb264029505f@c-s.fr>
References: <20200323045205.20314-1-cmr@informatik.wtf>
 <20200323045205.20314-2-cmr@informatik.wtf>
 <2057834a-01d3-958a-1674-cb264029505f@c-s.fr>
Subject: Re: [RFC PATCH 1/3] powerpc/mm: Introduce temporary mm
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Priority: 3
Importance: Normal
X-Mailer: Open-Xchange Mailer v7.10.2-Rev22
X-Originating-Client: open-xchange-appsuite
X-Virus-Scanned: ClamAV using ClamSMTP
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
Reply-To: Christopher M Riedl <cmr@informatik.wtf>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

> On March 24, 2020 11:07 AM Christophe Leroy <christophe.leroy@c-s.fr> wro=
te:
>=20
> =20
> Le 23/03/2020 =C3=A0 05:52, Christopher M. Riedl a =C3=A9crit=C2=A0:
> > x86 supports the notion of a temporary mm which restricts access to
> > temporary PTEs to a single CPU. A temporary mm is useful for situations
> > where a CPU needs to perform sensitive operations (such as patching a
> > STRICT_KERNEL_RWX kernel) requiring temporary mappings without exposing
> > said mappings to other CPUs. A side benefit is that other CPU TLBs do
> > not need to be flushed when the temporary mm is torn down.
> >=20
> > Mappings in the temporary mm can be set in the userspace portion of the
> > address-space.
> >=20
> > Interrupts must be disabled while the temporary mm is in use. HW
> > breakpoints, which may have been set by userspace as watchpoints on
> > addresses now within the temporary mm, are saved and disabled when
> > loading the temporary mm. The HW breakpoints are restored when unloadin=
g
> > the temporary mm. All HW breakpoints are indiscriminately disabled whil=
e
> > the temporary mm is in use.
> >=20
> > Based on x86 implementation:
> >=20
> > commit cefa929c034e
> > ("x86/mm: Introduce temporary mm structs")
> >=20
> > Signed-off-by: Christopher M. Riedl <cmr@informatik.wtf>
> > ---
> >   arch/powerpc/include/asm/debug.h       |  1 +
> >   arch/powerpc/include/asm/mmu_context.h | 56 +++++++++++++++++++++++++=
-
> >   arch/powerpc/kernel/process.c          |  5 +++
> >   3 files changed, 61 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/arch/powerpc/include/asm/debug.h b/arch/powerpc/include/as=
m/debug.h
> > index 7756026b95ca..b945bc16c932 100644
> > --- a/arch/powerpc/include/asm/debug.h
> > +++ b/arch/powerpc/include/asm/debug.h
> > @@ -45,6 +45,7 @@ static inline int debugger_break_match(struct pt_regs=
 *regs) { return 0; }
> >   static inline int debugger_fault_handler(struct pt_regs *regs) { retu=
rn 0; }
> >   #endif
> >  =20
> > +void __get_breakpoint(struct arch_hw_breakpoint *brk);
> >   void __set_breakpoint(struct arch_hw_breakpoint *brk);
> >   bool ppc_breakpoint_available(void);
> >   #ifdef CONFIG_PPC_ADV_DEBUG_REGS
> > diff --git a/arch/powerpc/include/asm/mmu_context.h b/arch/powerpc/incl=
ude/asm/mmu_context.h
> > index 360367c579de..3e6381d04c28 100644
> > --- a/arch/powerpc/include/asm/mmu_context.h
> > +++ b/arch/powerpc/include/asm/mmu_context.h
> > @@ -7,9 +7,10 @@
> >   #include <linux/mm.h>
> >   #include <linux/sched.h>
> >   #include <linux/spinlock.h>
> > -#include <asm/mmu.h>=09
> > +#include <asm/mmu.h>
>=20
> What's this change ?
> I see you are removing a space at the end of the line, but it shouldn't=
=20
> be part of this patch.
>=20

Overly aggressive "helpful" editor setting apparently.
Removed this change in the next version.

> >   #include <asm/cputable.h>
> >   #include <asm/cputhreads.h>
> > +#include <asm/hw_breakpoint.h>
> >  =20
> >   /*
> >    * Most if the context management is out of line
> > @@ -270,5 +271,58 @@ static inline int arch_dup_mmap(struct mm_struct *=
oldmm,
> >   =09return 0;
> >   }
> >  =20
> > +struct temp_mm {
> > +=09struct mm_struct *temp;
> > +=09struct mm_struct *prev;
> > +=09bool is_kernel_thread;
> > +=09struct arch_hw_breakpoint brk;
> > +};
> > +
> > +static inline void init_temp_mm(struct temp_mm *temp_mm, struct mm_str=
uct *mm)
> > +{
> > +=09temp_mm->temp =3D mm;
> > +=09temp_mm->prev =3D NULL;
> > +=09temp_mm->is_kernel_thread =3D false;
> > +=09memset(&temp_mm->brk, 0, sizeof(temp_mm->brk));
> > +}
> > +
> > +static inline void use_temporary_mm(struct temp_mm *temp_mm)
> > +{
> > +=09lockdep_assert_irqs_disabled();
> > +
> > +=09temp_mm->is_kernel_thread =3D current->mm =3D=3D NULL;
> > +=09if (temp_mm->is_kernel_thread)
> > +=09=09temp_mm->prev =3D current->active_mm;
> > +=09else
> > +=09=09temp_mm->prev =3D current->mm;
> > +
> > +=09/*
> > +=09 * Hash requires a non-NULL current->mm to allocate a userspace add=
ress
> > +=09 * when handling a page fault. Does not appear to hurt in Radix eit=
her.
> > +=09 */
> > +=09current->mm =3D temp_mm->temp;
> > +=09switch_mm_irqs_off(NULL, temp_mm->temp, current);
> > +
> > +=09if (ppc_breakpoint_available()) {
> > +=09=09__get_breakpoint(&temp_mm->brk);
> > +=09=09if (temp_mm->brk.type !=3D 0)
> > +=09=09=09hw_breakpoint_disable();
> > +=09}
> > +}
> > +
> > +static inline void unuse_temporary_mm(struct temp_mm *temp_mm)
> > +{
> > +=09lockdep_assert_irqs_disabled();
> > +
> > +=09if (temp_mm->is_kernel_thread)
> > +=09=09current->mm =3D NULL;
> > +=09else
> > +=09=09current->mm =3D temp_mm->prev;
> > +=09switch_mm_irqs_off(NULL, temp_mm->prev, current);
> > +
> > +=09if (ppc_breakpoint_available() && temp_mm->brk.type !=3D 0)
> > +=09=09__set_breakpoint(&temp_mm->brk);
> > +}
> > +
> >   #endif /* __KERNEL__ */
> >   #endif /* __ASM_POWERPC_MMU_CONTEXT_H */
> > diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/proces=
s.c
> > index fad50db9dcf2..5e5cf33fc358 100644
> > --- a/arch/powerpc/kernel/process.c
> > +++ b/arch/powerpc/kernel/process.c
> > @@ -793,6 +793,11 @@ static inline int set_breakpoint_8xx(struct arch_h=
w_breakpoint *brk)
> >   =09return 0;
> >   }
> >  =20
> > +void __get_breakpoint(struct arch_hw_breakpoint *brk)
> > +{
> > +=09memcpy(brk, this_cpu_ptr(&current_brk), sizeof(*brk));
> > +}
> > +
> >   void __set_breakpoint(struct arch_hw_breakpoint *brk)
> >   {
> >   =09memcpy(this_cpu_ptr(&current_brk), brk, sizeof(*brk));
> >=20
>=20
>=20
> Christophe
