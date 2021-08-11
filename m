Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D3AE83E97A8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Aug 2021 20:29:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GlJHw5Dv2z3cKk
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Aug 2021 04:29:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=lah6rTwN;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=cmr@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=lah6rTwN; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GlJH65bQxz30F1
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Aug 2021 04:28:34 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17BI3efg166697; Wed, 11 Aug 2021 14:28:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=content-type : date :
 message-id : cc : subject : from : to : references : in-reply-to :
 content-transfer-encoding : mime-version; s=pp1;
 bh=suBMUIEprMJNS+7u4bGx1UDpsRwA4okqzGzIZ83gaT8=;
 b=lah6rTwNLyx9JsXGiZcUoXIi4ePdg/zX1CMp3CGUM2K1DrfGq0iqHMKnzCKKKTRW7AvY
 8GP6UEmFlAF8PLIwxZKI9UyijN4UAxIZAH9B/OqBSMaPBaN72fqVkNrCH9uwj3Ts7nHo
 RoKDqC6X92tIxNS0YvYuhHMcMBMNTBj8ZIPKdw7BOG4VgT1hf0nLFuIKk1XN2YJj+Tnk
 DuZ6imOlCfc3CchVhsWYbhhxj0fck1uLswNvXVyq2ZfCc5ccHSMlSkk/aflxyWyNWAxj
 9JjfITNwfAmqRJXFmFBfG/y1l+mUcnHRwGU1x4vdXcqSpKSnGQRjBEB2ojKu7UxsG9GQ Ug== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3acgg7623v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 Aug 2021 14:28:19 -0400
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 17BI3hKt167029;
 Wed, 11 Aug 2021 14:28:18 -0400
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3acgg7623m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 Aug 2021 14:28:18 -0400
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 17BIRcA6018341;
 Wed, 11 Aug 2021 18:28:17 GMT
Received: from b03cxnp07027.gho.boulder.ibm.com
 (b03cxnp07027.gho.boulder.ibm.com [9.17.130.14])
 by ppma03wdc.us.ibm.com with ESMTP id 3a9htdm1jq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 Aug 2021 18:28:17 +0000
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp07027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 17BISG3827918692
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 11 Aug 2021 18:28:16 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CA2091360BB;
 Wed, 11 Aug 2021 18:28:16 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6AD31136068;
 Wed, 11 Aug 2021 18:28:16 +0000 (GMT)
Received: from oc8246131445.ibm.com (unknown [9.211.57.193])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with SMTP;
 Wed, 11 Aug 2021 18:28:16 +0000 (GMT)
Received: from localhost (localhost6 [IPv6:::1])
 by oc8246131445.ibm.com (Postfix) with ESMTP id DF3D2BC0CFB;
 Wed, 11 Aug 2021 13:28:13 -0500 (CDT)
Content-Type: text/plain; charset=UTF-8
Date: Wed, 11 Aug 2021 13:28:13 -0500
Message-Id: <CDGW9M12KW2B.2NQPM0FLOIL1Y@oc8246131445.ibm.com>
Subject: Re: [PATCH v5 7/8] powerpc/64s: Initialize and use a temporary mm
 for patching on Radix
From: "Christopher M. Riedl" <cmr@linux.ibm.com>
To: "Christophe Leroy" <christophe.leroy@csgroup.eu>,
 <linuxppc-dev@lists.ozlabs.org>
References: <20210713053113.4632-1-cmr@linux.ibm.com>
 <20210713053113.4632-8-cmr@linux.ibm.com>
 <9cc03303-ca54-94b8-7d0b-42647ff4d5a7@csgroup.eu>
In-Reply-To: <9cc03303-ca54-94b8-7d0b-42647ff4d5a7@csgroup.eu>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: CbnGc2rIf-qN4scxkQaXm2_pSPQdIhRn
X-Proofpoint-ORIG-GUID: Qdu3ijV5mwnpbuOd3w6xEFlmnQ54k-qp
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-11_06:2021-08-11,
 2021-08-11 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 mlxlogscore=999 priorityscore=1501 mlxscore=0 lowpriorityscore=0
 bulkscore=0 impostorscore=0 malwarescore=0 clxscore=1015 phishscore=0
 adultscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108110124
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
Cc: keescook@chromium.org, peterz@infradead.org, x86@kernel.org,
 npiggin@gmail.com, linux-hardening@vger.kernel.org, tglx@linutronix.de,
 dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu Aug 5, 2021 at 4:48 AM CDT, Christophe Leroy wrote:
>
>
> Le 13/07/2021 =C3=A0 07:31, Christopher M. Riedl a =C3=A9crit :
> > When code patching a STRICT_KERNEL_RWX kernel the page containing the
> > address to be patched is temporarily mapped as writeable. Currently, a
> > per-cpu vmalloc patch area is used for this purpose. While the patch
> > area is per-cpu, the temporary page mapping is inserted into the kernel
> > page tables for the duration of patching. The mapping is exposed to CPUs
> > other than the patching CPU - this is undesirable from a hardening
> > perspective. Use a temporary mm instead which keeps the mapping local to
> > the CPU doing the patching.
> >=20
> > Use the `poking_init` init hook to prepare a temporary mm and patching
> > address. Initialize the temporary mm by copying the init mm. Choose a
> > randomized patching address inside the temporary mm userspace address
> > space. The patching address is randomized between PAGE_SIZE and
> > DEFAULT_MAP_WINDOW-PAGE_SIZE.
> >=20
> > Bits of entropy with 64K page size on BOOK3S_64:
> >=20
> >          bits of entropy =3D log2(DEFAULT_MAP_WINDOW_USER64 / PAGE_SIZE)
> >=20
> >          PAGE_SIZE=3D64K, DEFAULT_MAP_WINDOW_USER64=3D128TB
> >          bits of entropy =3D log2(128TB / 64K)
> > 	bits of entropy =3D 31
> >=20
> > The upper limit is DEFAULT_MAP_WINDOW due to how the Book3s64 Hash MMU
> > operates - by default the space above DEFAULT_MAP_WINDOW is not
> > available. Currently the Hash MMU does not use a temporary mm so
> > technically this upper limit isn't necessary; however, a larger
> > randomization range does not further "harden" this overall approach and
> > future work may introduce patching with a temporary mm on Hash as well.
> >=20
> > Randomization occurs only once during initialization at boot for each
> > possible CPU in the system.
> >=20
> > Introduce two new functions, map_patch() and unmap_patch(), to
> > respectively create and remove the temporary mapping with write
> > permissions at patching_addr. Map the page with PAGE_KERNEL to set
> > EAA[0] for the PTE which ignores the AMR (so no need to unlock/lock
> > KUAP) according to PowerISA v3.0b Figure 35 on Radix.
> >=20
> > Based on x86 implementation:
> >=20
> > commit 4fc19708b165
> > ("x86/alternatives: Initialize temporary mm for patching")
> >=20
> > and:
> >=20
> > commit b3fd8e83ada0
> > ("x86/alternatives: Use temporary mm for text poking")
> >=20
> > Signed-off-by: Christopher M. Riedl <cmr@linux.ibm.com>
> >=20
> > ---
> >=20
> > v5:  * Only support Book3s64 Radix MMU for now.
> >       * Use a per-cpu datastructure to hold the patching_addr and
> >         patching_mm to avoid the need for a synchronization lock/mutex.
> >=20
> > v4:  * In the previous series this was two separate patches: one to init
> >         the temporary mm in poking_init() (unused in powerpc at the tim=
e)
> >         and the other to use it for patching (which removed all the
> >         per-cpu vmalloc code). Now that we use poking_init() in the
> >         existing per-cpu vmalloc approach, that separation doesn't work
> >         as nicely anymore so I just merged the two patches into one.
> >       * Preload the SLB entry and hash the page for the patching_addr
> >         when using Hash on book3s64 to avoid taking an SLB and Hash fau=
lt
> >         during patching. The previous implementation was a hack which
> >         changed current->mm to allow the SLB and Hash fault handlers to
> >         work with the temporary mm since both of those code-paths always
> >         assume mm =3D=3D current->mm.
> >       * Also (hmm - seeing a trend here) with the book3s64 Hash MMU we
> >         have to manage the mm->context.active_cpus counter and mm cpuma=
sk
> >         since they determine (via mm_is_thread_local()) if the TLB flush
> >         in pte_clear() is local or not - it should always be local when
> >         we're using the temporary mm. On book3s64's Radix MMU we can
> >         just call local_flush_tlb_mm().
> >       * Use HPTE_USE_KERNEL_KEY on Hash to avoid costly lock/unlock of
> >         KUAP.
> > ---
> >   arch/powerpc/lib/code-patching.c | 132 +++++++++++++++++++++++++++++--
> >   1 file changed, 125 insertions(+), 7 deletions(-)
> >=20
> > diff --git a/arch/powerpc/lib/code-patching.c b/arch/powerpc/lib/code-p=
atching.c
> > index 9f2eba9b70ee4..027dabd42b8dd 100644
> > --- a/arch/powerpc/lib/code-patching.c
> > +++ b/arch/powerpc/lib/code-patching.c
> > @@ -11,6 +11,7 @@
> >   #include <linux/cpuhotplug.h>
> >   #include <linux/slab.h>
> >   #include <linux/uaccess.h>
> > +#include <linux/random.h>
> >=20=20=20
> >   #include <asm/tlbflush.h>
> >   #include <asm/page.h>
> > @@ -103,6 +104,7 @@ static inline void unuse_temporary_mm(struct temp_m=
m *temp_mm)
> >=20=20=20
> >   static DEFINE_PER_CPU(struct vm_struct *, text_poke_area);
> >   static DEFINE_PER_CPU(unsigned long, cpu_patching_addr);
> > +static DEFINE_PER_CPU(struct mm_struct *, cpu_patching_mm);
> >=20=20=20
> >   #if IS_BUILTIN(CONFIG_LKDTM)
> >   unsigned long read_cpu_patching_addr(unsigned int cpu)
> > @@ -133,6 +135,51 @@ static int text_area_cpu_down(unsigned int cpu)
> >   	return 0;
> >   }
> >=20=20=20
> > +static __always_inline void __poking_init_temp_mm(void)
> > +{
> > +	int cpu;
> > +	spinlock_t *ptl; /* for protecting pte table */
> > +	pte_t *ptep;
> > +	struct mm_struct *patching_mm;
> > +	unsigned long patching_addr;
> > +
> > +	for_each_possible_cpu(cpu) {
> > +		/*
> > +		 * Some parts of the kernel (static keys for example) depend on
> > +		 * successful code patching. Code patching under
> > +		 * STRICT_KERNEL_RWX requires this setup - otherwise we cannot
> > +		 * patch at all. We use BUG_ON() here and later since an early
> > +		 * failure is preferred to buggy behavior and/or strange
> > +		 * crashes later.
> > +		 */
> > +		patching_mm =3D copy_init_mm();
> > +		BUG_ON(!patching_mm);
>
> Read
> https://www.kernel.org/doc/html/latest/process/deprecated.html#bug-and-bu=
g-on
> and
> https://github.com/linuxppc/issues/issues/88
>
> Avoid BUG_ON()s thanks.
>

Fine, @mpe's reply on the GH issue says the check is probably redundant:

"In general we don't need to BUG_ON(!ptr), the MMU will catch NULL
pointer dereferences for us."

> > +
> > +		per_cpu(cpu_patching_mm, cpu) =3D patching_mm;
> > +
> > +		/*
> > +		 * Choose a randomized, page-aligned address from the range:
> > +		 * [PAGE_SIZE, DEFAULT_MAP_WINDOW - PAGE_SIZE] The lower
> > +		 * address bound is PAGE_SIZE to avoid the zero-page.  The
> > +		 * upper address bound is DEFAULT_MAP_WINDOW - PAGE_SIZE to
> > +		 * stay under DEFAULT_MAP_WINDOW with the Book3s64 Hash MMU.
> > +		 */
> > +		patching_addr =3D PAGE_SIZE + ((get_random_long() & PAGE_MASK)
> > +				% (DEFAULT_MAP_WINDOW - 2 * PAGE_SIZE));
>
> % should be at the end of first line and the second line alignment
> should match open parenthesis in
> first line.

Ok - thanks!

>
> > +
> > +		per_cpu(cpu_patching_addr, cpu) =3D patching_addr;
> > +
> > +		/*
> > +		 * PTE allocation uses GFP_KERNEL which means we need to
> > +		 * pre-allocate the PTE here because we cannot do the
> > +		 * allocation during patching when IRQs are disabled.
> > +		 */
> > +		ptep =3D get_locked_pte(patching_mm, patching_addr, &ptl);
> > +		BUG_ON(!ptep);
>
> Avoid BUG_ON() please
>

Yup, I'll remove these in the next spin.

>
> > +		pte_unmap_unlock(ptep, ptl);
> > +	}
> > +}
> > +
> >   /*
> >    * Although BUG_ON() is rude, in this case it should only happen if E=
NOMEM, and
> >    * we judge it as being preferable to a kernel that will crash later =
when
> > @@ -140,6 +187,11 @@ static int text_area_cpu_down(unsigned int cpu)
> >    */
> >   void __init poking_init(void)
> >   {
> > +	if (radix_enabled()) {
> > +		__poking_init_temp_mm();
> > +		return;
> > +	}
> > +
> >   	BUG_ON(!cpuhp_setup_state(CPUHP_AP_ONLINE_DYN,
> >   		"powerpc/text_poke:online", text_area_cpu_up,
> >   		text_area_cpu_down));
> > @@ -213,30 +265,96 @@ static inline int unmap_patch_area(void)
> >   	return -EINVAL;
> >   }
> >=20=20=20
> > +struct patch_mapping {
> > +	spinlock_t *ptl; /* for protecting pte table */
> > +	pte_t *ptep;
> > +	struct temp_mm temp_mm;
> > +};
> > +
> > +/*
> > + * This can be called for kernel text or a module.
> > + */
> > +static int map_patch(const void *addr, struct patch_mapping *patch_map=
ping)
> > +{
> > +	struct page *page;
> > +	pte_t pte;
> > +	pgprot_t pgprot;
> > +	struct mm_struct *patching_mm =3D __this_cpu_read(cpu_patching_mm);
> > +	unsigned long patching_addr =3D __this_cpu_read(cpu_patching_addr);
> > +
> > +	if (is_vmalloc_or_module_addr(addr))
> > +		page =3D vmalloc_to_page(addr);
> > +	else
> > +		page =3D virt_to_page(addr);
> > +
> > +	patch_mapping->ptep =3D get_locked_pte(patching_mm, patching_addr,
> > +					     &patch_mapping->ptl);
>
> Not sure you need to split this line, checkpatch now allows 100 chars
> per line.
>

I prefer sticking to 80 columns unless readability *really* improves by
going over that limit.

>
> > +	if (unlikely(!patch_mapping->ptep)) {
> > +		pr_warn("map patch: failed to allocate pte for patching\n");
>
> That's a lot better than all above BUG_ONs
>
>
> > +		return -1;
> > +	}
> > +
> > +	pgprot =3D PAGE_KERNEL;
> > +	pte =3D mk_pte(page, pgprot);
> > +	pte =3D pte_mkdirty(pte);
>
> I'm sure you can do
>
> pte =3D pte_mkdirty(mk_pte(page, PAGE_KERNEL));
>
> And indeed PAGE_KERNEL already includes _PAGE_DIRTY, so all you should
> need is
>
> pte =3D mk_pte(page, PAGE_KERNEL);
>
> Or even just
>
> set_pte_at(patching_mm, patching_addr, patch_mapping->ptep, mk_pte(page,
> PAGE_KERNEL));
>

Ok, I'll consolidate this in the next spin. Thanks!

>
> > +	set_pte_at(patching_mm, patching_addr, patch_mapping->ptep, pte);
> > +
> > +	init_temp_mm(&patch_mapping->temp_mm, patching_mm);
> > +	use_temporary_mm(&patch_mapping->temp_mm);
> > +
> > +	return 0;
> > +}
> > +
> > +static void unmap_patch(struct patch_mapping *patch_mapping)
> > +{
> > +	struct mm_struct *patching_mm =3D __this_cpu_read(cpu_patching_mm);
> > +	unsigned long patching_addr =3D __this_cpu_read(cpu_patching_addr);
> > +
> > +	pte_clear(patching_mm, patching_addr, patch_mapping->ptep);
> > +
> > +	local_flush_tlb_mm(patching_mm);
> > +
> > +	pte_unmap_unlock(patch_mapping->ptep, patch_mapping->ptl);
> > +
> > +	unuse_temporary_mm(&patch_mapping->temp_mm);
>
> Shouldn't you stop using it before unmapping/unlocking it ?
>

Yes I think you're right - IIRC I had to do this for the Hash MMU (which
we don't support w/ this verion of the series anymore anyways). I'll
revisit this for the next spin.

>
> > +}
> > +
> >   static int do_patch_instruction(u32 *addr, struct ppc_inst instr)
> >   {
> >   	int err, rc =3D 0;
> >   	u32 *patch_addr =3D NULL;
> >   	unsigned long flags;
> > +	struct patch_mapping patch_mapping;
> >=20=20=20
> >   	/*
> > -	 * During early early boot patch_instruction is called
> > -	 * when text_poke_area is not ready, but we still need
> > -	 * to allow patching. We just do the plain old patching
> > +	 * During early early boot patch_instruction is called when the
> > +	 * patching_mm/text_poke_area is not ready, but we still need to allow
> > +	 * patching. We just do the plain old patching.
> >   	 */
> > -	if (!this_cpu_read(text_poke_area))
> > -		return raw_patch_instruction(addr, instr);
> > +	if (radix_enabled()) {
> > +		if (!this_cpu_read(cpu_patching_mm))
> > +			return raw_patch_instruction(addr, instr);
> > +	} else {
> > +		if (!this_cpu_read(text_poke_area))
> > +			return raw_patch_instruction(addr, instr);
> > +	}
> >=20=20=20
> >   	local_irq_save(flags);
> >=20=20=20
> > -	err =3D map_patch_area(addr);
> > +	if (radix_enabled())
> > +		err =3D map_patch(addr, &patch_mapping);
>
> Maybe call it map_patch_mm() or map_patch_mapping() ?

Yes that does sound better.

>
> > +	else
> > +		err =3D map_patch_area(addr);
> >   	if (err)
> >   		goto out;
> >=20=20=20
> >   	patch_addr =3D (u32 *)(__this_cpu_read(cpu_patching_addr) | offset_i=
n_page(addr));
> >   	rc =3D __patch_instruction(addr, instr, patch_addr);
> >=20=20=20
> > -	err =3D unmap_patch_area();
> > +	if (radix_enabled())
> > +		unmap_patch(&patch_mapping);
>
> No err ? Would be better if it could return something, allthough always
> 0.

Ok I'll do that.

>
> And same comment about naming.
>

Yes I'll use your suggested names.

> > +	else
> > +		err =3D unmap_patch_area();
> >=20=20=20
> >   out:
> >   	local_irq_restore(flags);
> >=20

