Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BE8921AAD59
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Apr 2020 18:28:38 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 492STW5lMRzDqCC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Apr 2020 02:28:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=informatik.wtf (client-ip=131.153.2.45;
 helo=h4.fbrelay.privateemail.com; envelope-from=cmr@informatik.wtf;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=informatik.wtf
Received: from h4.fbrelay.privateemail.com (h4.fbrelay.privateemail.com
 [131.153.2.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 492SMJ3Pn0zDqF1
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Apr 2020 02:23:07 +1000 (AEST)
Received: from MTA-12-3.privateemail.com (mta-12.privateemail.com
 [198.54.127.105])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by h3.fbrelay.privateemail.com (Postfix) with ESMTPS id 9A4A980807
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Apr 2020 12:23:03 -0400 (EDT)
Received: from mta-12.privateemail.com (localhost [127.0.0.1])
 by mta-12.privateemail.com (Postfix) with ESMTP id AAAC280050;
 Wed, 15 Apr 2020 12:22:56 -0400 (EDT)
Received: from APP-02 (unknown [10.20.147.152])
 by mta-12.privateemail.com (Postfix) with ESMTPA id 888B28005C;
 Wed, 15 Apr 2020 16:22:56 +0000 (UTC)
Date: Wed, 15 Apr 2020 11:22:56 -0500 (CDT)
From: Christopher M Riedl <cmr@informatik.wtf>
To: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <1418874364.198277.1586967776509@privateemail.com>
In-Reply-To: <badfcf58-9fcb-6189-c9db-e8429f88799e@c-s.fr>
References: <c88b13ede49744d81fdab32e037a7ae10f0b241f.1585233657.git.christophe.leroy@c-s.fr>
 <581069710.188209.1586927814880@privateemail.com>
 <badfcf58-9fcb-6189-c9db-e8429f88799e@c-s.fr>
Subject: Re: [RFC PATCH] powerpc/lib: Fixing use a temporary mm for code
 patching
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Priority: 3
Importance: Normal
X-Mailer: Open-Xchange Mailer v7.10.2-Rev24
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

> On April 15, 2020 4:12 AM Christophe Leroy <christophe.leroy@c-s.fr> wrot=
e:
>=20
> =20
> Le 15/04/2020 =C3=A0 07:16, Christopher M Riedl a =C3=A9crit=C2=A0:
> >> On March 26, 2020 9:42 AM Christophe Leroy <christophe.leroy@c-s.fr> w=
rote:
> >>
> >>  =20
> >> This patch fixes the RFC series identified below.
> >> It fixes three points:
> >> - Failure with CONFIG_PPC_KUAP
> >> - Failure to write do to lack of DIRTY bit set on the 8xx
> >> - Inadequaly complex WARN post verification
> >>
> >> However, it has an impact on the CPU load. Here is the time
> >> needed on an 8xx to run the ftrace selftests without and
> >> with this series:
> >> - Without CONFIG_STRICT_KERNEL_RWX=09=09=3D=3D> 38 seconds
> >> - With CONFIG_STRICT_KERNEL_RWX=09=09=09=3D=3D> 40 seconds
> >> - With CONFIG_STRICT_KERNEL_RWX + this series=09=3D=3D> 43 seconds
> >>
> >> Link: https://patchwork.ozlabs.org/project/linuxppc-dev/list/?series=
=3D166003
> >> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
> >> ---
> >>   arch/powerpc/lib/code-patching.c | 5 ++++-
> >>   1 file changed, 4 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/arch/powerpc/lib/code-patching.c b/arch/powerpc/lib/code-=
patching.c
> >> index f156132e8975..4ccff427592e 100644
> >> --- a/arch/powerpc/lib/code-patching.c
> >> +++ b/arch/powerpc/lib/code-patching.c
> >> @@ -97,6 +97,7 @@ static int map_patch(const void *addr, struct patch_=
mapping *patch_mapping)
> >>   =09}
> >>  =20
> >>   =09pte =3D mk_pte(page, pgprot);
> >> +=09pte =3D pte_mkdirty(pte);
> >>   =09set_pte_at(patching_mm, patching_addr, ptep, pte);
> >>  =20
> >>   =09init_temp_mm(&patch_mapping->temp_mm, patching_mm);
> >> @@ -168,7 +169,9 @@ static int do_patch_instruction(unsigned int *addr=
, unsigned int instr)
> >>   =09=09=09(offset_in_page((unsigned long)addr) /
> >>   =09=09=09=09sizeof(unsigned int));
> >>  =20
> >> +=09allow_write_to_user(patch_addr, sizeof(instr));
> >>   =09__patch_instruction(addr, instr, patch_addr);
> >> +=09prevent_write_to_user(patch_addr, sizeof(instr));
> >>
> >=20
> > On radix we can map the page with PAGE_KERNEL protection which ends up
> > setting EAA[0] in the radix PTE. This means the KUAP (AMR) protection i=
s
> > ignored (ISA v3.0b Fig. 35) since we are accessing the page from MSR[PR=
]=3D0.
> >=20
> > Can we employ a similar approach on the 8xx? I would prefer *not* to wr=
ap
> > the __patch_instruction() with the allow_/prevent_write_to_user() KUAP =
things
> > because this is a temporary kernel mapping which really isn't userspace=
 in
> > the usual sense.
>=20
> On the 8xx, that's pretty different.
>=20
> The PTE doesn't control whether a page is user page or a kernel page.=20
> The only thing that is set in the PTE is whether a page is linked to a=20
> given PID or not.
> PAGE_KERNEL tells that the page can be addressed with any PID.
>=20
> The user access right is given by a kind of zone, which is in the PGD=20
> entry. Every pages above PAGE_OFFSET are defined as belonging to zone 0.=
=20
> Every pages below PAGE_OFFSET are defined as belonging to zone 1.
>=20
> By default, zone 0 can only be accessed by kernel, and zone 1 can only=20
> be accessed by user. When kernel wants to access zone 1, it temporarily=
=20
> changes properties of zone 1 to allow both kernel and user accesses.
>=20
> So, if your mapping is below PAGE_OFFSET, it is in zone 1 and kernel=20
> must unlock it to access it.
>=20
>=20
> And this is more or less the same on hash/32. This is managed by segment=
=20
> registers. One segment register corresponds to a 256Mbytes area. Every=20
> pages below PAGE_OFFSET can only be read by default by kernel. Only user=
=20
> can write if the PTE allows it. When the kernel needs to write at an=20
> address below PAGE_OFFSET, it must change the segment properties in the=
=20
> corresponding segment register.
>=20
> So, for both cases, if we want to have it local to a task while still=20
> allowing kernel access, it means we have to define a new special area=20
> between TASK_SIZE and PAGE_OFFSET which belongs to kernel zone.
>=20
> That looks complex to me for a small benefit, especially as 8xx is not=20
> SMP and neither are most of the hash/32 targets.
>=20

Agreed. So I guess the solution is to differentiate between radix/non-radix
and use PAGE_SHARED for non-radix along with the KUAP functions when KUAP
is enabled. Hmm, I need to think about this some more, especially if it's
acceptable to temporarily map kernel text as PAGE_SHARED for patching. Do
you see any obvious problems on 8xx and hash/32 w/ using PAGE_SHARED?

I don't necessarily want to drop the local mm patching idea for non-radix
platforms since that means we would have to maintain two implementations.

> Christophe
