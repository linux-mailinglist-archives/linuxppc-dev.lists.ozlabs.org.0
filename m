Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 14017198A73
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Mar 2020 05:21:36 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48rvkP25ZQzDqpB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Mar 2020 14:21:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48rvhc2SVczDqhR
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 31 Mar 2020 14:20:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=informatik.wtf
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 48rvhb3pS1z8tRw
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 31 Mar 2020 14:19:59 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 48rvhb3PK9z9sSJ; Tue, 31 Mar 2020 14:19:59 +1100 (AEDT)
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
 by ozlabs.org (Postfix) with ESMTPS id 48rvhZ6llYz9sP7
 for <linuxppc-dev@ozlabs.org>; Tue, 31 Mar 2020 14:19:58 +1100 (AEDT)
Received: from MTA-11-3.privateemail.com (mta-11.privateemail.com
 [198.54.118.200])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by h1.fbrelay.privateemail.com (Postfix) with ESMTPS id C281780BB7
 for <linuxppc-dev@ozlabs.org>; Mon, 30 Mar 2020 23:19:56 -0400 (EDT)
Received: from mta-11.privateemail.com (localhost [127.0.0.1])
 by mta-11.privateemail.com (Postfix) with ESMTP id EA78680041;
 Mon, 30 Mar 2020 23:19:52 -0400 (EDT)
Received: from APP-04 (unknown [10.20.147.154])
 by mta-11.privateemail.com (Postfix) with ESMTPA id CA1F080040;
 Tue, 31 Mar 2020 03:19:52 +0000 (UTC)
Date: Mon, 30 Mar 2020 22:19:52 -0500 (CDT)
From: Christopher M Riedl <cmr@informatik.wtf>
To: Christophe Leroy <christophe.leroy@c-s.fr>, linuxppc-dev@ozlabs.org
Message-ID: <1782990079.111623.1585624792778@privateemail.com>
In-Reply-To: <ecccbeb2-731b-f9a3-1039-f2a662e3a9a5@c-s.fr>
References: <20200323045205.20314-1-cmr@informatik.wtf>
 <20200323045205.20314-3-cmr@informatik.wtf>
 <ecccbeb2-731b-f9a3-1039-f2a662e3a9a5@c-s.fr>
Subject: Re: [RFC PATCH 2/3] powerpc/lib: Initialize a temporary mm for code
 patching
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

> On March 24, 2020 11:10 AM Christophe Leroy <christophe.leroy@c-s.fr> wro=
te:
>=20
> =20
> Le 23/03/2020 =C3=A0 05:52, Christopher M. Riedl a =C3=A9crit=C2=A0:
> > When code patching a STRICT_KERNEL_RWX kernel the page containing the
> > address to be patched is temporarily mapped with permissive memory
> > protections. Currently, a per-cpu vmalloc patch area is used for this
> > purpose. While the patch area is per-cpu, the temporary page mapping is
> > inserted into the kernel page tables for the duration of the patching.
> > The mapping is exposed to CPUs other than the patching CPU - this is
> > undesirable from a hardening perspective.
> >=20
> > Use the `poking_init` init hook to prepare a temporary mm and patching
> > address. Initialize the temporary mm by copying the init mm. Choose a
> > randomized patching address inside the temporary mm userspace address
> > portion. The next patch uses the temporary mm and patching address for
> > code patching.
> >=20
> > Based on x86 implementation:
> >=20
> > commit 4fc19708b165
> > ("x86/alternatives: Initialize temporary mm for patching")
> >=20
> > Signed-off-by: Christopher M. Riedl <cmr@informatik.wtf>
> > ---
> >   arch/powerpc/lib/code-patching.c | 26 ++++++++++++++++++++++++++
> >   1 file changed, 26 insertions(+)
> >=20
> > diff --git a/arch/powerpc/lib/code-patching.c b/arch/powerpc/lib/code-p=
atching.c
> > index 3345f039a876..18b88ecfc5a8 100644
> > --- a/arch/powerpc/lib/code-patching.c
> > +++ b/arch/powerpc/lib/code-patching.c
> > @@ -11,6 +11,8 @@
> >   #include <linux/cpuhotplug.h>
> >   #include <linux/slab.h>
> >   #include <linux/uaccess.h>
> > +#include <linux/sched/task.h>
> > +#include <linux/random.h>
> >  =20
> >   #include <asm/pgtable.h>
> >   #include <asm/tlbflush.h>
> > @@ -39,6 +41,30 @@ int raw_patch_instruction(unsigned int *addr, unsign=
ed int instr)
> >   }
> >  =20
> >   #ifdef CONFIG_STRICT_KERNEL_RWX
> > +
> > +__ro_after_init struct mm_struct *patching_mm;
> > +__ro_after_init unsigned long patching_addr;
>=20
> Can we make those those static ?
>=20

Yes, makes sense to me.

> > +
> > +void __init poking_init(void)
> > +{
> > +=09spinlock_t *ptl; /* for protecting pte table */
> > +=09pte_t *ptep;
> > +
> > +=09patching_mm =3D copy_init_mm();
> > +=09BUG_ON(!patching_mm);
>=20
> Does it needs to be a BUG_ON() ? Can't we fail gracefully with just a=20
> WARN_ON ?
>

I'm not sure what failing gracefully means here? The main reason this could
fail is if there is not enough memory to allocate the patching_mm. The
previous implementation had this justification for BUG_ON():

/*
 * Run as a late init call. This allows all the boot time patching to be do=
ne
 * simply by patching the code, and then we're called here prior to
 * mark_rodata_ro(), which happens after all init calls are run. Although
 * BUG_ON() is rude, in this case it should only happen if ENOMEM, and we j=
udge
 * it as being preferable to a kernel that will crash later when someone tr=
ies
 * to use patch_instruction().
 */
static int __init setup_text_poke_area(void)
{
        BUG_ON(!cpuhp_setup_state(CPUHP_AP_ONLINE_DYN,
                "powerpc/text_poke:online", text_area_cpu_up,
                text_area_cpu_down));

        return 0;
}
late_initcall(setup_text_poke_area);

I think the BUG_ON() is appropriate even if only to adhere to the previous
judgement call. I can add a similar comment explaining the reasoning if
that helps.

> > +
> > +=09/*
> > +=09 * In hash we cannot go above DEFAULT_MAP_WINDOW easily.
> > +=09 * XXX: Do we want additional bits of entropy for radix?
> > +=09 */
> > +=09patching_addr =3D (get_random_long() & PAGE_MASK) %
> > +=09=09(DEFAULT_MAP_WINDOW - PAGE_SIZE);
> > +
> > +=09ptep =3D get_locked_pte(patching_mm, patching_addr, &ptl);
> > +=09BUG_ON(!ptep);
>=20
> Same here, can we fail gracefully instead ?
>

Same reasoning as above.

> > +=09pte_unmap_unlock(ptep, ptl);
> > +}
> > +
> >   static DEFINE_PER_CPU(struct vm_struct *, text_poke_area);
> >  =20
> >   static int text_area_cpu_up(unsigned int cpu)
> >=20
>=20
> Christophe
