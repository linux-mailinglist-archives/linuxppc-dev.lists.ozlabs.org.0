Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 52B1A86BC63
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Feb 2024 00:56:48 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=RsRJfzsJ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TlWV54ZdLz3vdW
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Feb 2024 10:56:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=RsRJfzsJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=mailbox.org (client-ip=80.241.56.172; helo=mout-p-202.mailbox.org; envelope-from=erhard_f@mailbox.org; receiver=lists.ozlabs.org)
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TlWTH0dKNz3bqB
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Feb 2024 10:56:01 +1100 (AEDT)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4TlWT60lZHz9t2F;
	Thu, 29 Feb 2024 00:55:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1709164554;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zrQzX1Nvy7Gpwkdo36FM120NqaaIU999mXvkVPJVuSA=;
	b=RsRJfzsJ2s2YX3uTd0n2F/edD+DR1dfq2nnLlrx9/qrK8i8gzRYsBD7QMipyFWVUYkKNRD
	mOLZCY10yGRTVKi3K2ftCadtYrY0dF1vamOzxMFtqnbUDnnfNOnFTl9Xj1qZy7H93Z0hTh
	UOxpNq6m4PNS0uYP5iSaLissuFb+ky0SS6bsEz+SWKwSCf/MUICzrhBil0wsx0oLQPcL7N
	oL2l+ABkj4quFC/PJai2+U6gSDF/4d9eP/EeTVps7Oz9ayG30W6yd488/GmoPe2EaNW8NZ
	tKdfnJ3K3WynEdkzg24yoeF/UEntqiy2i4yoWTLJTmXX7N8yBULWm7Y6u7f7MA==
Date: Thu, 29 Feb 2024 00:55:46 +0100
From: Erhard Furtner <erhard_f@mailbox.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: KASAN debug kernel fails to boot at early stage when
 CONFIG_SMP=y is set (kernel 6.5-rc5, PowerMac G4 3,6)
Message-ID: <20240229005546.4c4249cf@yea>
In-Reply-To: <c0cbb50f-5b0c-7b67-447a-26d79093c532@csgroup.eu>
References: <20230811014845.1bf6771d@yea>
	<6d710a2b-5cac-9f0a-cd30-0ad18172932b@csgroup.eu>
	<20230815220156.5c234b52@yea>
	<0876e754-7bee-ec61-4e3c-c0ee08d59d87@csgroup.eu>
	<20230817203202.2b4c273c@yea>
	<87y1i9clf2.fsf@mail.lhotse>
	<20230818111641.7f680ce7@yea>
	<fcdf2bf7-0834-b27f-4d24-28e05815ee6f@csgroup.eu>
	<20230818182316.79303545@yea>
	<5ea3302e-0fb1-1670-e4b6-adba5115ab94@csgroup.eu>
	<20230824020015.78733931@yea>
	<87jztkvfid.fsf@mail.lhotse>
	<20230828011758.3b7b9daf@yea>
	<1085cc49-b5e8-0aa5-dc97-ec4a100463b5@csgroup.eu>
	<20230901004417.631dc019@yea>
	<b9671cd2-9cad-c5d9-dd94-8b39f67e29b4@csgroup.eu>
	<20230903230635.5751b620@yea>
	<438d8790-8a55-2f36-4ef0-2fddcb39edae@csgroup.eu>
	<c0891617-43b9-5b56-2c51-69eec81e3b48@csgroup.eu>
	<20230912021147.57c85033@yea>
	<22f67fc2-ae70-bbc7-ca2a-dffbf62731f3@csgroup.eu>
	<20230912175941.0fca47bb@yea>
	<453090a5-0d01-40ee-50a5-794c8f0f1f95@csgroup.eu>
	<c0cbb50f-5b0c-7b67-447a-26d79093c532@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MBO-RS-META: fhmtwkrbx5sopunjbubsech1j4fts5ti
X-MBO-RS-ID: 65e7082fa2c3f4af041
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 14 Sep 2023 04:54:17 +0000
Christophe Leroy <christophe.leroy@csgroup.eu> wrote:

> Le 12/09/2023 =C3=A0 19:39, Christophe Leroy a =C3=A9crit=C2=A0:
> >=20
> >=20
> > Le 12/09/2023 =C3=A0 17:59, Erhard Furtner a =C3=A9crit=C2=A0: =20
> >>
> >> printk: bootconsole [udbg0] enabled
> >> Total memory =3D 2048MB; using 4096kB for hash table
> >> mapin_ram:125
> >> mmu_mapin_ram:169 0 30000000 1400000 2000000
> >> __mmu_mapin_ram:146 0 1400000
> >> __mmu_mapin_ram:155 1400000
> >> __mmu_mapin_ram:146 1400000 30000000
> >> __mmu_mapin_ram:155 20000000
> >> __mapin_ram_chunk:107 20000000 30000000
> >> __mapin_ram_chunk:117
> >> mapin_ram:134
> >> kasan_mmu_init:129
> >> kasan_mmu_init:132 0
> >> kasan_mmu_init:137
> >> ioremap() called early from btext_map+0x64/0xdc. Use early_ioremap() i=
nstead
> >> Linux version 6.6.0-rc1-PMacG4-dirty (root@T1000) (gcc (Gentoo 12.3.1_=
p20230526 p2) 12.3.1 20230526, GNU ld (Gentoo 2.40 p7) 2.40.0) #5 SMP Tue S=
ep 12 16:50:47 CEST 2023
> >> kasan_init_region: c0000000 30000000 f8000000 fe000000
> >> kasan_init_region: loop f8000000 fe000000
> >>
> >>
> >> So I get no "kasan_init_region: setbat" line and don't reach "KASAN in=
it done". =20
> >=20
> > Ah ok, maybe your CPU only has 4 BATs and they are all used, following
> > change would tell us.
> >=20
> > diff --git a/arch/powerpc/mm/book3s32/mmu.c b/arch/powerpc/mm/book3s32/=
mmu.c
> > index 850783cfa9c7..bd26767edce7 100644
> > --- a/arch/powerpc/mm/book3s32/mmu.c
> > +++ b/arch/powerpc/mm/book3s32/mmu.c
> > @@ -86,6 +86,7 @@ int __init find_free_bat(void)
> >    		if (!(bat[1].batu & 3))
> >    			return b;
> >    	}
> > +	pr_err("NO FREE BAT (%d)\n", n);
> >    	return -1;
> >    }
> >=20
> >=20
> > Or you have 8 BATs in which case it's an alignment problem, you need to
> > increase CONFIG_DATA_SHIFT to 23, for that you need CONFIG_ADVANCED and
> > CONFIG_DATA_SHIFT_BOOL
> >=20
> > But regardless of that there is a problem we need to find out, because
> > it should work without BATs.
> >=20
> > As the BATs allocation fails, it falls back to :
> >=20
> > 	phys =3D memblock_phys_alloc_range(k_end - k_start, PAGE_SIZE, 0,
> > 						 MEMBLOCK_ALLOC_ANYWHERE);
> > 		if (!phys)
> > 			return -ENOMEM;
> > 	}
> >=20
> > 	ret =3D kasan_init_shadow_page_tables(k_start, k_end);
> > 	if (ret)
> > 		return ret;
> >=20
> > 	for (k_cur =3D k_start; k_cur < k_end; k_cur +=3D PAGE_SIZE) {
> > 		pmd_t *pmd =3D pmd_off_k(k_cur);
> > 		pte_t pte =3D pfn_pte(PHYS_PFN(phys + k_cur - k_start), PAGE_KERNEL);
> >=20
> > 		__set_pte_at(&init_mm, k_cur, pte_offset_kernel(pmd, k_cur), pte, 0);
> > 	}
> > 	flush_tlb_kernel_range(k_start, k_end);
> > 	memset(kasan_mem_to_shadow(start), 0, k_end - k_start);
> >=20
> >=20
> > While the __weak function that you confirmed working is:
> >=20
> > 	ret =3D kasan_init_shadow_page_tables(k_start, k_end);
> > 	if (ret)
> > 		return ret;
> >=20
> > 	block =3D memblock_alloc(k_end - k_start, PAGE_SIZE);
> > 	if (!block)
> > 		return -ENOMEM;
> >=20
> > 	for (k_cur =3D k_start & PAGE_MASK; k_cur < k_end; k_cur +=3D PAGE_SIZ=
E) {
> > 		pmd_t *pmd =3D pmd_off_k(k_cur);
> > 		void *va =3D block + k_cur - k_start;
> > 		pte_t pte =3D pfn_pte(PHYS_PFN(__pa(va)), PAGE_KERNEL);
> >=20
> > 		__set_pte_at(&init_mm, k_cur, pte_offset_kernel(pmd, k_cur), pte, 0);
> > 	}
> > 	flush_tlb_kernel_range(k_start, k_end);
> >=20
> >=20
> > I'm having hard time to understand what's could be wrong at the first p=
lace.
> >=20
> > Could you try following change:
> >=20
> > diff --git a/arch/powerpc/mm/kasan/book3s_32.c
> > b/arch/powerpc/mm/kasan/book3s_32.c
> > index 9954b7a3b7ae..e04f21908c6a 100644
> > --- a/arch/powerpc/mm/kasan/book3s_32.c
> > +++ b/arch/powerpc/mm/kasan/book3s_32.c
> > @@ -38,7 +38,7 @@ int __init kasan_init_region(void *start, size_t size)
> >=20
> >    	if (k_nobat < k_end) {
> >    		phys =3D memblock_phys_alloc_range(k_end - k_nobat, PAGE_SIZE, 0,
> > -						 MEMBLOCK_ALLOC_ANYWHERE);
> > +						 MEMBLOCK_ALLOC_ACCESSIBLE);
> >    		if (!phys)
> >    			return -ENOMEM;
> >    	}
> >=20
> > And also that one:
> >=20
> >=20
> > diff --git a/arch/powerpc/mm/kasan/init_32.c
> > b/arch/powerpc/mm/kasan/init_32.c
> > index a70828a6d935..bc1c075489f4 100644
> > --- a/arch/powerpc/mm/kasan/init_32.c
> > +++ b/arch/powerpc/mm/kasan/init_32.c
> > @@ -84,6 +84,9 @@ kasan_update_early_region(unsigned long k_start,
> > unsigned long k_end, pte_t pte)
> >    {
> >    	unsigned long k_cur;
> >=20
> > +	if (k_start =3D=3D k_end)
> > +		return;
> > +
> >    	for (k_cur =3D k_start; k_cur !=3D k_end; k_cur +=3D PAGE_SIZE) {
> >    		pmd_t *pmd =3D pmd_off_k(k_cur);
> >    		pte_t *ptep =3D pte_offset_kernel(pmd, k_cur);
> >=20
> >=20
> >  =20
>=20
> I tested the two vmlinux you sent me offlist, they both start without=20
> problem on QEMU.
>=20
> Regarding the use of BATs, in fact a shift of 23 is still not enough to=20
> get free BATs for KASAN. But at least it allows you to map all linear=20
> mem with BATS whereas a shift of 22 would require 9 BATs :
>=20
> With shift 22 you have BATs with size : 4+4+8+16+32+64+128+256+256
> With shift 23 you have BATs with size : 8+8+16+32+64+128+256+256
>=20
> So lets forget that for the moment, allthought you may try with=20
> CONFIG_STRICT_KERNEL_RWX, in that case you should have enough BATs.
>=20
> But lets try to refocus on the real problem.
>=20
> In your last mail you say you tried with all patches. Did it include the=
=20
> two above changes ?
>=20
> If not can you perform the tests with those two changes in addition,=20
> first one by one then both together depending on the result ?
>=20
> Many thanks for your help and perseverance
> Christophe

Revisited this issue with kernel v6.8-rc6 on the same machine.

Now this strange KASAN cold boot issue is gone or at least I can no longer =
reproduce it. Be it with KASAN_OUTLINE or KASAN_INLINE, SMP boot works just=
 fine on my G4 DP. Which is a good thing. :)

Regards,
Erhard
