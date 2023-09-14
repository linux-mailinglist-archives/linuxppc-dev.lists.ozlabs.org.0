Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1438B7A03F8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Sep 2023 14:34:52 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=pHXL8XlA;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RmcGK62cpz3cK8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Sep 2023 22:34:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=pHXL8XlA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=mailbox.org (client-ip=80.241.56.152; helo=mout-p-102.mailbox.org; envelope-from=erhard_f@mailbox.org; receiver=lists.ozlabs.org)
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RmcFQ4Np3z3c3M
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Sep 2023 22:33:59 +1000 (AEST)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4RmcFD0FRKz9slY;
	Thu, 14 Sep 2023 14:33:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1694694832;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=udx4C8MoCCLQeRo2OEyblE72zQCftVe1I1Dr1zb1rdo=;
	b=pHXL8XlAUKnKTBVBvKK8Fd4GuwuCYJB/rPhV2bzL3BpxE/lsJX+eW68/azCns9qJXJRfsc
	appXwgqtmQRuP9ql/vQ0ZvSlu7NKmpBXao6VlWmKwIljgSEYLEmhsiCoNZEixWO7PjATcv
	NdkFW+CLzzqUQs2VstkDD2PGNTFp5Tsv1JoP3HakpqCV2jR4CR9g1+cNiT7wDmkXjpOmNi
	C/lYHVgJHhDu3WZeBbOpkkt6N0coF5l0mnWPpw1AscMLH+8PNzRe+28uUR/vPF4ATjtA2J
	WAYdyDdVtvkl0qZ0uSe9x2+nzSsxGHFiXG/MUKTwH/kMapAmDLTzEH93CyI9uA==
Date: Thu, 14 Sep 2023 14:33:48 +0200
From: Erhard Furtner <erhard_f@mailbox.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: KASAN debug kernel fails to boot at early stage when
 CONFIG_SMP=y is set (kernel 6.5-rc5, PowerMac G4 3,6)
Message-ID: <20230914143348.6c3c76cc@yea>
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
Content-Type: multipart/mixed; boundary="MP_/5y/SBkmccjdwFH8FB1ZAt_q"
X-MBO-RS-META: ez6ce9bzy3zbnpnxfgjic4o9wnbu34hz
X-MBO-RS-ID: b0fa0bcdd7a2fe4455e
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

--MP_/5y/SBkmccjdwFH8FB1ZAt_q
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

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

For me no problems show up on QEMU either. But QEMU does not seem able to m=
imic my G4 DPs configuration. That would be a dual CPU G4 + SMP config.

> So lets forget that for the moment, allthought you may try with=20
> CONFIG_STRICT_KERNEL_RWX, in that case you should have enough BATs.

CONFIG_STRICT_KERNEL_RWX=3Dy was enabled all along on my kernel .config. Bu=
t for comparison I disabled it. If I disable STRICT_KERNEL_RWX I get no out=
put about BATs whatsoever. Details below.

> In your last mail you say you tried with all patches. Did it include the=
=20
> two above changes ?
>=20
> If not can you perform the tests with those two changes in addition,=20
> first one by one then both together depending on the result ?

I think I did apply both but I re-did the checks just to be sure. For my 'a=
ll patches applied' config please check the attached git diff.

dmesg with patch 1 "MEMBLOCK_ALLOC_ACCESSIBLE);" applied:

printk: bootconsole [udbg0] enabled
Total memory =3D 2048MB; using 4096kB for hash table
mapin_ram:125
mmu_mapin_ram:170 0 30000000 1400000 2000000
__mmu_mapin_ram:147 0 1400000
__mmu_mapin_ram:156 1400000
__mmu_mapin_ram:147 1400000 30000000
NO FREE BAT (8)
__mmu_mapin_ram:156 20000000
__mapin_ram_chunk:107 20000000 30000000
__mapin_ram_chunk:117
mapin_ram:134
kasan_mmu_init:129
kasan_mmu_init:132 0
kasan_mmu_init:137
ioremap() called early from btext_map+0x64/0xdc. Use early_ioremap() instead
Linux version 6.6.0-rc1-PMacG4-dirty (root@T1000) (gcc (Gentoo 12.3.1_p2023=
0526 p2) 12.3.1 20230526, GNU ld (Gentoo 2.40 p7) 2.40.0) #23 SMP Thu Sep 1=
4 13:05:23 CEST 2023
kasan_init_region: c0000000 30000000 f8000000 fe000000
NO FREE BAT (8)
kasan_init_region: loop f8000000 fe000000

dmesg with patch 2 "if (k_start =3D=3D k_end) return;" applied:

printk: bootconsole [udbg0] enabled
Total memory =3D 2048MB; using 4096kB for hash table
mapin_ram:125
mmu_mapin_ram:170 0 30000000 1400000 2000000
__mmu_mapin_ram:147 0 1400000
__mmu_mapin_ram:156 1400000
__mmu_mapin_ram:147 1400000 30000000
NO FREE BAT (8)
__mmu_mapin_ram:156 20000000
__mapin_ram_chunk:107 20000000 30000000
__mapin_ram_chunk:117
mapin_ram:134
kasan_mmu_init:132
kasan_mmu_init:135 0
kasan_mmu_init:140
ioremap() called early from btext_map+0x64/0xdc. Use early_ioremap() instead
Linux version 6.6.0-rc1-PMacG4-dirty (root@T1000) (gcc (Gentoo 12.3.1_p2023=
0526 p2) 12.3.1 20230526, GNU ld (Gentoo 2.40 p7) 2.40.0) #23 SMP Thu Sep 1=
4 13:05:23 CEST 2023
kasan_init_region: c0000000 30000000 f8000000 fe000000
NO FREE BAT (8)
kasan_init_region: loop f8000000 fe000000

dmesg with both KASAN patches applied:

printk: bootconsole [udbg0] enabled
Total memory =3D 2048MB; using 4096kB for hash table
mapin_ram:125
mmu_mapin_ram:170 0 30000000 1400000 2000000
__mmu_mapin_ram:147 0 1400000
__mmu_mapin_ram:156 1400000
__mmu_mapin_ram:147 1400000 30000000
NO FREE BAT (8)
__mmu_mapin_ram:156 20000000
__mapin_ram_chunk:107 20000000 30000000
__mapin_ram_chunk:117
mapin_ram:134
kasan_mmu_init:132
kasan_mmu_init:135 0
kasan_mmu_init:140
ioremap() called early from btext_map+0x64/0xdc. Use early_ioremap() instead
Linux version 6.6.0-rc1-PMacG4-dirty (root@T1000) (gcc (Gentoo 12.3.1_p2023=
0526 p2) 12.3.1 20230526, GNU ld (Gentoo 2.40 p7) 2.40.0) #23 SMP Thu Sep 1=
4 13:05:23 CEST 2023
kasan_init_region: c0000000 30000000 f8000000 fe000000
NO FREE BAT (8)
kasan_init_region: loop f8000000 fe000000

dmesg with both KASAN patches and STRICT_KERNEL_RWX=3Dn applied:

printk: bootconsole [udbg0] enabled
Total memory =3D 2048MB; using 4096kB for hash table
mapin_ram:125
mmu_mapin_ram:170 0 30000000 1400000 2000000
__mmu_mapin_ram:147 0 1400000
__mmu_mapin_ram:156 1400000
__mmu_mapin_ram:147 1400000 30000000
__mmu_mapin_ram:156 20000000
__mapin_ram_chunk:107 20000000 30000000
__mapin_ram_chunk:117
mapin_ram:134
kasan_mmu_init:132
kasan_mmu_init:135 0
kasan_mmu_init:140

> Many thanks for your help and perseverance
> Christophe

You're welcome! Same to you! :)

Regards,
Erhard

--MP_/5y/SBkmccjdwFH8FB1ZAt_q
Content-Type: text/x-patch
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=all_patches.patch

diff --git a/arch/powerpc/kernel/btext.c b/arch/powerpc/kernel/btext.c
index 19e46fd623b0..ec989e1011f0 100644
--- a/arch/powerpc/kernel/btext.c
+++ b/arch/powerpc/kernel/btext.c
@@ -126,7 +126,9 @@ void __init btext_setup_display(int width, int height, int depth, int pitch,
 
 void __init btext_unmap(void)
 {
+	pr_info("%s:%d\n", __func__, __LINE__);
 	boot_text_mapped = 0;
+	pr_info("%s:%d\n", __func__, __LINE__);
 }
 
 /* Here's a small text engine to use during early boot
diff --git a/arch/powerpc/kernel/traps.c b/arch/powerpc/kernel/traps.c
index eeff136b83d9..341a0635e131 100644
--- a/arch/powerpc/kernel/traps.c
+++ b/arch/powerpc/kernel/traps.c
@@ -198,8 +198,6 @@ static unsigned long oops_begin(struct pt_regs *regs)
 	die_owner = cpu;
 	console_verbose();
 	bust_spinlocks(1);
-	if (machine_is(powermac))
-		pmac_backlight_unblank();
 	return flags;
 }
 NOKPROBE_SYMBOL(oops_begin);
diff --git a/arch/powerpc/mm/book3s32/kuap.c b/arch/powerpc/mm/book3s32/kuap.c
index 3a8815555a48..79b9fb0adfb4 100644
--- a/arch/powerpc/mm/book3s32/kuap.c
+++ b/arch/powerpc/mm/book3s32/kuap.c
@@ -5,18 +5,23 @@
 
 void setup_kuap(bool disabled)
 {
+	pr_info("%s:%d\n", __func__, __LINE__);
 	if (!disabled) {
+		pr_info("%s:%d\n", __func__, __LINE__);
 		update_user_segments(mfsr(0) | SR_KS);
 		isync();        /* Context sync required after mtsr() */
 		init_mm.context.sr0 |= SR_KS;
 		current->thread.sr0 |= SR_KS;
 	}
+	pr_info("%s:%d\n", __func__, __LINE__);
 
 	if (smp_processor_id() != boot_cpuid)
 		return;
 
+	pr_info("%s:%d\n", __func__, __LINE__);
 	if (disabled)
 		cur_cpu_spec->mmu_features &= ~MMU_FTR_KUAP;
 	else
 		pr_info("Activating Kernel Userspace Access Protection\n");
+	pr_info("%s:%d\n", __func__, __LINE__);
 }
diff --git a/arch/powerpc/mm/book3s32/mmu.c b/arch/powerpc/mm/book3s32/mmu.c
index 850783cfa9c7..65a3bb4213cd 100644
--- a/arch/powerpc/mm/book3s32/mmu.c
+++ b/arch/powerpc/mm/book3s32/mmu.c
@@ -86,6 +86,7 @@ int __init find_free_bat(void)
 		if (!(bat[1].batu & 3))
 			return b;
 	}
+	pr_err("NO FREE BAT (%d)\n", n);
 	return -1;
 }
 
@@ -143,6 +144,7 @@ static unsigned long __init __mmu_mapin_ram(unsigned long base, unsigned long to
 {
 	int idx;
 
+	pr_info("%s:%d %lx %lx\n", __func__, __LINE__, base, top);
 	while ((idx = find_free_bat()) != -1 && base != top) {
 		unsigned int size = bat_block_size(base, top);
 
@@ -151,6 +153,7 @@ static unsigned long __init __mmu_mapin_ram(unsigned long base, unsigned long to
 		setbat(idx, PAGE_OFFSET + base, base, size, PAGE_KERNEL_X);
 		base += size;
 	}
+	pr_info("%s:%d %lx\n", __func__, __LINE__, base);
 
 	return base;
 }
@@ -164,6 +167,7 @@ unsigned long __init mmu_mapin_ram(unsigned long base, unsigned long top)
 	size = roundup_pow_of_two((unsigned long)_einittext - PAGE_OFFSET);
 	setibat(0, PAGE_OFFSET, 0, size, PAGE_KERNEL_X);
 
+	pr_info("%s:%d %lx %lx %lx %lx\n", __func__, __LINE__, base, top, border, size);
 	if (debug_pagealloc_enabled_or_kfence()) {
 		pr_debug_once("Read-Write memory mapped without BATs\n");
 		if (base >= border)
diff --git a/arch/powerpc/mm/init_32.c b/arch/powerpc/mm/init_32.c
index d8adc452f431..54a45eced552 100644
--- a/arch/powerpc/mm/init_32.c
+++ b/arch/powerpc/mm/init_32.c
@@ -117,11 +117,6 @@ void __init MMU_init(void)
 	if (ppc_md.progress)
 		ppc_md.progress("MMU:exit", 0x211);
 
-	/* From now on, btext is no longer BAT mapped if it was at all */
-#ifdef CONFIG_BOOTX_TEXT
-	btext_unmap();
-#endif
-
 	kasan_mmu_init();
 
 	setup_kup();
@@ -130,4 +125,9 @@ void __init MMU_init(void)
 
 	/* Shortly after that, the entire linear mapping will be available */
 	memblock_set_current_limit(lowmem_end_addr);
+
+	/* From now on, btext is no longer BAT mapped if it was at all */
+#ifdef CONFIG_BOOTX_TEXT
+	btext_map();
+#endif
 }
diff --git a/arch/powerpc/mm/kasan/book3s_32.c b/arch/powerpc/mm/kasan/book3s_32.c
index 450a67ef0bbe..e04f21908c6a 100644
--- a/arch/powerpc/mm/kasan/book3s_32.c
+++ b/arch/powerpc/mm/kasan/book3s_32.c
@@ -15,6 +15,7 @@ int __init kasan_init_region(void *start, size_t size)
 	phys_addr_t phys;
 	int ret;
 
+	pr_err("%s: %px %x %lx %lx\n", __func__, start, size, k_start, k_end);
 	while (k_nobat < k_end) {
 		unsigned int k_size = bat_block_size(k_nobat, k_end);
 		int idx = find_free_bat();
@@ -28,6 +29,7 @@ int __init kasan_init_region(void *start, size_t size)
 		if (!phys)
 			break;
 
+		pr_err("%s: setbat %d %lx %x %x\n", __func__, idx, k_nobat, phys, k_size);
 		setbat(idx, k_nobat, phys, k_size, PAGE_KERNEL);
 		k_nobat += k_size;
 	}
@@ -36,7 +38,7 @@ int __init kasan_init_region(void *start, size_t size)
 
 	if (k_nobat < k_end) {
 		phys = memblock_phys_alloc_range(k_end - k_nobat, PAGE_SIZE, 0,
-						 MEMBLOCK_ALLOC_ANYWHERE);
+						 MEMBLOCK_ALLOC_ACCESSIBLE);
 		if (!phys)
 			return -ENOMEM;
 	}
@@ -47,6 +49,7 @@ int __init kasan_init_region(void *start, size_t size)
 
 	kasan_update_early_region(k_start, k_nobat, __pte(0));
 
+	pr_err("%s: loop %lx %lx\n", __func__, k_nobat, k_end);
 	for (k_cur = k_nobat; k_cur < k_end; k_cur += PAGE_SIZE) {
 		pmd_t *pmd = pmd_off_k(k_cur);
 		pte_t pte = pfn_pte(PHYS_PFN(phys + k_cur - k_nobat), PAGE_KERNEL);
diff --git a/arch/powerpc/mm/kasan/init_32.c b/arch/powerpc/mm/kasan/init_32.c
index a70828a6d935..d734e0e74942 100644
--- a/arch/powerpc/mm/kasan/init_32.c
+++ b/arch/powerpc/mm/kasan/init_32.c
@@ -84,6 +84,9 @@ kasan_update_early_region(unsigned long k_start, unsigned long k_end, pte_t pte)
 {
 	unsigned long k_cur;
 
+	if (k_start == k_end)
+		return;
+
 	for (k_cur = k_start; k_cur != k_end; k_cur += PAGE_SIZE) {
 		pmd_t *pmd = pmd_off_k(k_cur);
 		pte_t *ptep = pte_offset_kernel(pmd, k_cur);
@@ -126,12 +129,15 @@ void __init kasan_mmu_init(void)
 {
 	int ret;
 
+	pr_info("%s:%d\n", __func__, __LINE__);
 	if (early_mmu_has_feature(MMU_FTR_HPTE_TABLE)) {
 		ret = kasan_init_shadow_page_tables(KASAN_SHADOW_START, KASAN_SHADOW_END);
+		pr_info("%s:%d %d\n", __func__, __LINE__, ret);
 
 		if (ret)
 			panic("kasan: kasan_init_shadow_page_tables() failed");
 	}
+	pr_info("%s:%d\n", __func__, __LINE__);
 }
 
 void __init kasan_init(void)
diff --git a/arch/powerpc/mm/pgtable_32.c b/arch/powerpc/mm/pgtable_32.c
index 5c02fd08d61e..d75084f67d9b 100644
--- a/arch/powerpc/mm/pgtable_32.c
+++ b/arch/powerpc/mm/pgtable_32.c
@@ -104,6 +104,7 @@ static void __init __mapin_ram_chunk(unsigned long offset, unsigned long top)
 	phys_addr_t p;
 	bool ktext;
 
+	pr_info("%s:%d %lx %lx\n", __func__, __LINE__, offset, top);
 	s = offset;
 	v = PAGE_OFFSET + s;
 	p = memstart_addr + s;
@@ -113,6 +114,7 @@ static void __init __mapin_ram_chunk(unsigned long offset, unsigned long top)
 		v += PAGE_SIZE;
 		p += PAGE_SIZE;
 	}
+	pr_info("%s:%d\n", __func__, __LINE__);
 }
 
 void __init mapin_ram(void)
@@ -120,6 +122,7 @@ void __init mapin_ram(void)
 	phys_addr_t base, end;
 	u64 i;
 
+	pr_info("%s:%d\n", __func__, __LINE__);
 	for_each_mem_range(i, &base, &end) {
 		phys_addr_t top = min(end, total_lowmem);
 
@@ -128,6 +131,7 @@ void __init mapin_ram(void)
 		base = mmu_mapin_ram(base, top);
 		__mapin_ram_chunk(base, top);
 	}
+	pr_info("%s:%d\n", __func__, __LINE__);
 }
 
 void mark_initmem_nx(void)

--MP_/5y/SBkmccjdwFH8FB1ZAt_q--
