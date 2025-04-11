Return-Path: <linuxppc-dev+bounces-7602-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 96F53A85810
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Apr 2025 11:31:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZYryR0mvLz3c7R;
	Fri, 11 Apr 2025 19:30:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=80.241.56.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744363839;
	cv=none; b=eCgVwGnACtu3B3b5ARZX5s7V/lgrdp986fj9/AmH3HvWl8PDrUxNSmCTA+pwk2ZGmuTUf2FspFxh2BwpVIH6zeKPqHi7JYCvbjT+yC2LHOcrxJkZiwNEt6ZCXMyH1VTDNE0tj8V1UsQK6FPjIlA8grVDeqMDPbRS4HSZWPAwk+Rtao10wzAi4hlFvPq5pTOWiap2qPjVp4EI/krKYINqH5QU30wb6kR1aKqMyZ0/2HO1EyoORVa7fiwV0ugm8qQ3RIQkVSTUGz+uePn7NdHhT7foN71s1kT0QztH0r/yU3n8z+d/k/HOM6dSNEdgiXUsZ5gujAMFPdu/0nhwqzvc1A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744363839; c=relaxed/relaxed;
	bh=rBsQRiZC45bjFjV3jw++v6998Pf2+dYp8OjenfLrvw8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DX8p/QP2e40SlALyMjg8sxTt1dlUdCg8vWtK7rhzqweia+A+jVWVwr4FKdIiACx9nJb0nDyWECVRyFYQ6rC2mYvWtwiK5/Z5y0AXb3A788RmY+LolC8J0MQCfoNE+CZhMVTfVqS/AbvVub/kSt7+XYHjppZV5zCfk/0c6s79c7ha9gAeCzmErJp52ZCl4mDI3HhrRaYXlmlvWZBDD7gpJvPfyunJZjRpOkpzDHJBAqdqE2x2kU7n9bKjZHY5zsReEOz0r8vLGZU3KrSEMUOL/LJ+urfUGHaHPHMRI7I/aigTr1h4cUejXTbE5zcM8PjWK3kwD2G1v+gakCAMgwzYRQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=Bf7prMX0; dkim-atps=neutral; spf=pass (client-ip=80.241.56.172; helo=mout-p-202.mailbox.org; envelope-from=erhard_f@mailbox.org; receiver=lists.ozlabs.org) smtp.mailfrom=mailbox.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=Bf7prMX0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=mailbox.org (client-ip=80.241.56.172; helo=mout-p-202.mailbox.org; envelope-from=erhard_f@mailbox.org; receiver=lists.ozlabs.org)
X-Greylist: delayed 334 seconds by postgrey-1.37 at boromir; Fri, 11 Apr 2025 19:30:37 AEST
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZYryP0bz5z3c5h
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Apr 2025 19:30:36 +1000 (AEST)
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4ZYrqc6BNLz9sq2;
	Fri, 11 Apr 2025 11:24:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1744363484;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rBsQRiZC45bjFjV3jw++v6998Pf2+dYp8OjenfLrvw8=;
	b=Bf7prMX0GlQ9qCqblYltw6vokIAZCSUwRHmAabV1xwygVHxwfwIVvxS2NHkQqWDVNLBixJ
	2g+8JBoyEqA7fMfbWV///W4hoEs2WV+kCkrWI7dvzeKMrNebcodkmex37XI0L2jhwlEzPQ
	CnJItXyjfIEZIJKQ0Sgq0SPPI1LWg21Y1ydUy1IOTEKbyreYko27pPq6cG1a/cMDSWHyjT
	pGmi4qRQaBK++GHPwCWBU9CuxX9dcRbtk9CwFxLbECArB/SIRmnM//U5ONFBKcof3q6oRK
	iFWKc5PFHV9+LxUiHWp/d+vSp0N8AarnOr2yNUK3Sdkwv2NOefuHH8v9pDDTGw==
Date: Fri, 11 Apr 2025 11:24:42 +0200
From: Erhard Furtner <erhard_f@mailbox.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: linuxppc-dev@lists.ozlabs.org, willy@infradead.org
Subject: Re: [Bisected] PowerMac G5 fails booting kernel 6.6-rc3 (BUG:
 Unable to handle kernel data access at 0xfeffbb62ffec65fe)
Message-ID: <20250411112442.4c84b43c@yea>
In-Reply-To: <fd4a0ee2-f67f-469e-acc2-fb94b749fb31@csgroup.eu>
References: <20230929132750.3cd98452@yea>
	<fd4a0ee2-f67f-469e-acc2-fb94b749fb31@csgroup.eu>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MBO-RS-META: b7iuwgb4gwdcoz7gphb3gge4tpta57dj
X-MBO-RS-ID: 45497534449378f9b76
X-Spam-Status: No, score=-1.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, 8 Apr 2025 07:55:30 +0200
Christophe Leroy <christophe.leroy@csgroup.eu> wrote:

> Hi Erhard,
>=20
> Le 29/09/2023 =C3=A0 13:27, Erhard Furtner a =C3=A9crit=C2=A0:
> > Kernel 6.5.5 boots fine on my PowerMac G5 11,2 but kernel 6.6-rc3 fails=
 to boot with following dmesg shown on the OpenFirmware console (transcribe=
d screenshot): =20
>=20
> Would you be able to recheck this issue on kernel v6.15-rc1 ?
>=20
> I fear that commit 8268af309d07 ("arch, mm: set max_mapnr when=20
> allocating memory map for FLATMEM") cancels the fix brought by commit=20
> daa9ada2093e ("powerpc/mm: Fix boot crash with FLATMEM")

Hi Christophe!

v6.15-rc1 boots up just fine on my G5 with FLATMEM_MANUAL set. Seems commit=
 8268af309d07 does not harm the FLATMEM fix, at least on my G5.

Regards,
Erhard=20

> > [...]
> > SLUB: HWalign=3D128, Order=3D0-3, MinObjects=3D0, CPUs=3D2, Nodes=3D1
> > rcu: Hierarchical RCU implementation.
> >   Tracing variant of Tasks RCU enabled.
> > rcu: RCU calculated value of scheduler-enlistment delay is 30 jiffies.
> > NR_IRQS: 512, nr_irqs: 512, preallocated irqs: 16
> > mpic: Setting up MPIC " MPIC 1   " version 1.2 at f8040000, max 2 CPUs
> > mpic: ISU size: 124, shift: 7, mask: 7f
> > mpic: Initializing for 124 sources
> > mpic: Setting up HT PICs workarounds for U3/U4
> > BUG: Unable to handle kernel data access at 0xfeffbb62ffec65fe
> > Faulting instruction address: 0xc00000000005dc40
> > Oops: Kernel access of bad area, sig: 11 [#1]
> > BE PAGE_SIZE=3D4K MMU=3DHash SMP NR_CPUS=3D2 PowerMac
> > Modules linked in:
> > CPU: 0 PID: 0 Comm: swapper/0 Tainted: G                T  6.6.0-rc3-PM=
acGS #1
> > Hardware name: PowerMac11,2 PPC970MP 0x440101 PowerMac
> > NIP:  c00000000005dc40 LR: c000000000066660 CTR: c000000000007730
> > REGS: c0000000022bf510 TRAP: 0380   Tainted: G                T (6.6.0-=
rc3-PMacGS)
> > MSR:  9000000000001032 <SF,HV,ME,IR,DR,RI>  CR: 44004242  XER: 00000000
> > IRQMASK: 3
> > GPR00: 0000000000000000 c0000000022bf7b0 c0000000010c0b00 0000000000000=
1ac
> > GPR04: 0000000003c80000 0000000000000300 c0000000f20001ae 0000000000000=
300
> > GPR08: 0000000000000006 feffbb62ffec65ff 0000000000000001 0000000000000=
000
> > GPR12: 9000000000001032 c000000002362000 c000000000f76b80 000000000349e=
cd8
> > GPR16: 0000000002367ba8 0000000002367f08 0000000000000006 0000000000000=
000
> > GPR20: 00000000000001ac c000000000f6f920 c0000000022cd985 0000000000000=
00c
> > GPR24: 0000000000000300 00000003b0a3691d c0003e008030000e 0000000000000=
000
> > GPR28: c00000000000000c c0000000f20001ee feffbb62ffec65fe 0000000000000=
1ac
> > NIP [c00000000005dc40] hash_page_do_lazy_icache+0x50/0x100
> > LR [c000000000066660] __hash_page_4K+0x420/0x590
> > Call Trace:
> > [c0000000022bf7e0] [ffffffffffffffff] 0xffffffffffffffff
> > [c0000000022bf8c0] [c00000000005e164] hash_page_mm+0x364/0x6f0
> > [c0000000022bf990] [c00000000005e684] do_hash_fault+0x114/0x2b0
> > [c0000000022bf9c0] [c0000000000078e8] data_access_common_virt+0x198/0x1=
f0
> > --- interrupt: 300 at mpic_init+0x4bc/0x10c4
> > NIP:  c000000002020a5c LR: c000000002020a04 CTR: 0000000000000000
> > REGS: c0000000022bf9f0 TRAP: 0300   Tainted: G                T (6.6.0-=
rc3-PMacGS)
> > MSR:  9000000000001032 <SF,HV,ME,IR,DR,RI>  CR: 24004248  XER: 00000000
> > DAR: c0003e008030000e DSISR: 40000000 IRQMASK: 1
> > GPR00: 0000000000000000 c0000000022bfc90 c0000000010c0b00 c0003e0080300=
000
> > GPR04: 0000000000000000 0000000000000000 0000000000000000 0000000000000=
000
> > GPR08: 0000000000000000 221b80894c06df2f 0000000000000000 0000000000000=
000
> > GPR12: 0000000000000000 c000000002362000 c000000000f76b80 000000000349e=
cd8
> > GPR16: 0000000002367ba8 0000000002367f08 0000000002367c70 0000000000000=
000
> > GPR20: 567ce25e8c9202b7 c000000000f6f920 0000000000000001 c0003e0080300=
000
> > GPR24: c00000000226f348 0000000000000004 c00000000404c640 0000000000000=
000
> > GPR28: c0003e0080300000 c00000000404c000 45886d8559cb69b4 c0000000022bf=
c90
> > NIP [c00000000005dc40] mpic_init+0x4bc/0x10c4
> > LR [c000000000066660] mpic_init+0x464/0x10c4
> > ~~~ interrupt: 300
> > [c0000000022bfd90] [c000000002022ae4] pmac_setup_one_mpic+0x258/0x2dc
> > [c0000000022bf2e0] [c000000002022df4] pmac_pic_init+0x28c/0x3d8
> > [c0000000022bfef0] [c00000000200b750] init_IRQ+0x90/0x140
> > [c0000000022bff30] [c0000000020053c0] start_kernel+0x57c/0x78c
> > [c0000000022bffe0] [c00000000000cb48] start_here_common+0x1c/0x20
> > Code: 09290000 7c292040 4081007c fbc10020 3d220127 78843664 3929d700 eb=
c90000 7fde2214 e93e0000 712a0001 40820064 <e93e0000> 71232000 40820048 e93=
e0000
> > ---[ end trace 0000000000000000 ]---
> >=20
> > Kernel panic - not syncing: Fatal exception
> > Rebooting in 40 seconds..
> >=20
> >=20
> > I bisected the issue and got 9fee28baa601f4dbf869b1373183b312d2d5ef3d a=
s 1st bad commit:
> >=20
> >   # git bisect good
> > 9fee28baa601f4dbf869b1373183b312d2d5ef3d is the first bad commit
> > commit 9fee28baa601f4dbf869b1373183b312d2d5ef3d
> > Author: Matthew Wilcox (Oracle) <willy@infradead.org>
> > Date:   Wed Aug 2 16:13:49 2023 +0100
> >=20
> >      powerpc: implement the new page table range API
> >     =20
> >      Add set_ptes(), update_mmu_cache_range() and flush_dcache_folio().=
  Change
> >      the PG_arch_1 (aka PG_dcache_dirty) flag from being per-page to pe=
r-folio.
> >     =20
> >      [willy@infradead.org: re-export flush_dcache_icache_folio()]
> >        Link: https://lkml.kernel.org/r/ZMx1daYwvD9EM7Cv@casper.infradea=
d.org
> >      Link: https://lkml.kernel.org/r/20230802151406.3735276-22-willy@in=
fradead.org
> >      Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
> >      Acked-by: Mike Rapoport (IBM) <rppt@kernel.org>
> >      Cc: Michael Ellerman <mpe@ellerman.id.au>
> >      Cc: Nicholas Piggin <npiggin@gmail.com>
> >      Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
> >      Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
> >=20
> >   arch/powerpc/include/asm/book3s/32/pgtable.h |  5 ---
> >   arch/powerpc/include/asm/book3s/64/pgtable.h |  6 +---
> >   arch/powerpc/include/asm/book3s/pgtable.h    | 11 ++----
> >   arch/powerpc/include/asm/cacheflush.h        | 14 +++++---
> >   arch/powerpc/include/asm/kvm_ppc.h           | 10 +++---
> >   arch/powerpc/include/asm/nohash/pgtable.h    | 16 +++------
> >   arch/powerpc/include/asm/pgtable.h           | 12 +++++++
> >   arch/powerpc/mm/book3s64/hash_utils.c        | 11 +++---
> >   arch/powerpc/mm/cacheflush.c                 | 41 ++++++++-----------=
--
> >   arch/powerpc/mm/nohash/e500_hugetlbpage.c    |  3 +-
> >   arch/powerpc/mm/pgtable.c                    | 53 ++++++++++++++++---=
---------
> >   11 files changed, 89 insertions(+), 93 deletions(-)
> >=20
> >=20
> > And indeed when I revert commit 9fee28baa601f4dbf869b1373183b312d2d5ef3=
d I get a booting kernel again. I reverted the commit on top of 864609c6a0b=
5f0464f6ec7869cb2a45a529c35d7 (HEAD) as I get build issues when I revert it=
 on top of 6.6-rc3.
> >=20
> > dmesg of the successful boot with the reverted commit attached, also ke=
rnel .config and the bisect.log.

