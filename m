Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EBC13E9754
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Aug 2021 20:11:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GlHtw5sQDz30MC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Aug 2021 04:11:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=MmrnVFev;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=cmr@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=MmrnVFev; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GlHt9034jz2yYJ
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Aug 2021 04:10:24 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17BI2ZS6082466; Wed, 11 Aug 2021 14:10:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=mime-version :
 content-transfer-encoding : content-type : date : message-id : cc :
 subject : from : to : references : in-reply-to; s=pp1;
 bh=o1uQpYnHMNYWUyoRQJJrFrkvIbJdEqy6H9OidWTLKMo=;
 b=MmrnVFevHoer7PSuK5TgedwYlBB3eYvfiUOZNmYNbzhRwZ3G6/1gjOcB8l2gXinrZmmM
 3Fa+nC2FUMkfcaSFaDaRmMQUIwfIGGus/DUAbmu5vKKhVW1wSm7PRiEPv3il/m+Ci4Kv
 XgRBt9cShIisZNXl9pp/hpeIGBextBExnWtkc28edDnFamSkAk7Etn6ObHNpKSrFDKrc
 LHYh8HUCAIUDqF7tEU4m51OWvxN5ibzSIU/eNaM1Qr4TuTEFhrE9zPr9lyYv3VMgrB9u
 fQWFgzxBfuWHRfdAYfuQqo8O4ltek3xf06hftf5jYBwy/Iec7H+1X5eQ1LveG5S8xAct jQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3abr2vsmqr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 Aug 2021 14:10:08 -0400
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 17BI3ZtV089238;
 Wed, 11 Aug 2021 14:10:07 -0400
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3abr2vsmq9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 Aug 2021 14:10:07 -0400
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 17BI7d0x008665;
 Wed, 11 Aug 2021 18:10:06 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma03wdc.us.ibm.com with ESMTP id 3a9htdkeum-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 Aug 2021 18:10:06 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 17BIA5Ef25100624
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 11 Aug 2021 18:10:05 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D1834B2066;
 Wed, 11 Aug 2021 18:10:05 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E33F7B2067;
 Wed, 11 Aug 2021 18:10:04 +0000 (GMT)
Received: from oc8246131445.ibm.com (unknown [9.211.57.193])
 by b01ledav003.gho.pok.ibm.com (Postfix) with SMTP;
 Wed, 11 Aug 2021 18:10:04 +0000 (GMT)
Received: from localhost (localhost6 [IPv6:::1])
 by oc8246131445.ibm.com (Postfix) with ESMTP id 5BF12BC0CFB;
 Wed, 11 Aug 2021 13:10:02 -0500 (CDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 11 Aug 2021 13:10:02 -0500
Message-Id: <CDGVVOKRBQTE.3638HALWGHB17@oc8246131445.ibm.com>
Subject: Re: [PATCH v5 6/8] powerpc: Rework and improve STRICT_KERNEL_RWX
 patching
From: "Christopher M. Riedl" <cmr@linux.ibm.com>
To: "Christophe Leroy" <christophe.leroy@csgroup.eu>,
 <linuxppc-dev@lists.ozlabs.org>
References: <20210713053113.4632-1-cmr@linux.ibm.com>
 <20210713053113.4632-7-cmr@linux.ibm.com>
 <9c53e997-3609-20f8-74c0-7776c867ce6c@csgroup.eu>
In-Reply-To: <9c53e997-3609-20f8-74c0-7776c867ce6c@csgroup.eu>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: oS5HHLLAeGLCOn-QambiZS07l5gUzztJ
X-Proofpoint-ORIG-GUID: FTzlFZkVFzRi6hVlPsddIWW6j5QQGI15
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-11_06:2021-08-11,
 2021-08-11 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0
 spamscore=0 bulkscore=0 suspectscore=0 mlxlogscore=999 lowpriorityscore=0
 phishscore=0 priorityscore=1501 clxscore=1015 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108110124
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

On Thu Aug 5, 2021 at 4:34 AM CDT, Christophe Leroy wrote:
>
>
> Le 13/07/2021 =C3=A0 07:31, Christopher M. Riedl a =C3=A9crit :
> > Rework code-patching with STRICT_KERNEL_RWX to prepare for the next
> > patch which uses a temporary mm for patching under the Book3s64 Radix
> > MMU. Make improvements by adding a WARN_ON when the patchsite doesn't
> > match after patching and return the error from __patch_instruction()
> > properly.
> >=20
> > Signed-off-by: Christopher M. Riedl <cmr@linux.ibm.com>
> >=20
> > ---
> >=20
> > v5:  * New to series.
> > ---
> >   arch/powerpc/lib/code-patching.c | 51 +++++++++++++++++--------------=
-
> >   1 file changed, 27 insertions(+), 24 deletions(-)
> >=20
> > diff --git a/arch/powerpc/lib/code-patching.c b/arch/powerpc/lib/code-p=
atching.c
> > index 3122d8e4cc013..9f2eba9b70ee4 100644
> > --- a/arch/powerpc/lib/code-patching.c
> > +++ b/arch/powerpc/lib/code-patching.c
> > @@ -102,11 +102,12 @@ static inline void unuse_temporary_mm(struct temp=
_mm *temp_mm)
> >   }
> >  =20
> >   static DEFINE_PER_CPU(struct vm_struct *, text_poke_area);
> > +static DEFINE_PER_CPU(unsigned long, cpu_patching_addr);
> >  =20
> >   #if IS_BUILTIN(CONFIG_LKDTM)
> >   unsigned long read_cpu_patching_addr(unsigned int cpu)
> >   {
> > -	return (unsigned long)(per_cpu(text_poke_area, cpu))->addr;
> > +	return per_cpu(cpu_patching_addr, cpu);
> >   }
> >   #endif
> >  =20
> > @@ -121,6 +122,7 @@ static int text_area_cpu_up(unsigned int cpu)
> >   		return -1;
> >   	}
> >   	this_cpu_write(text_poke_area, area);
> > +	this_cpu_write(cpu_patching_addr, (unsigned long)area->addr);
> >  =20
> >   	return 0;
> >   }
> > @@ -146,7 +148,7 @@ void __init poking_init(void)
> >   /*
> >    * This can be called for kernel text or a module.
> >    */
> > -static int map_patch_area(void *addr, unsigned long text_poke_addr)
> > +static int map_patch_area(void *addr)
> >   {
> >   	unsigned long pfn;
> >   	int err;
> > @@ -156,17 +158,20 @@ static int map_patch_area(void *addr, unsigned lo=
ng text_poke_addr)
> >   	else
> >   		pfn =3D __pa_symbol(addr) >> PAGE_SHIFT;
> >  =20
> > -	err =3D map_kernel_page(text_poke_addr, (pfn << PAGE_SHIFT), PAGE_KER=
NEL);
> > +	err =3D map_kernel_page(__this_cpu_read(cpu_patching_addr),
> > +			      (pfn << PAGE_SHIFT), PAGE_KERNEL);
> >  =20
> > -	pr_devel("Mapped addr %lx with pfn %lx:%d\n", text_poke_addr, pfn, er=
r);
> > +	pr_devel("Mapped addr %lx with pfn %lx:%d\n",
> > +		 __this_cpu_read(cpu_patching_addr), pfn, err);
> >   	if (err)
> >   		return -1;
> >  =20
> >   	return 0;
> >   }
> >  =20
> > -static inline int unmap_patch_area(unsigned long addr)
> > +static inline int unmap_patch_area(void)
> >   {
> > +	unsigned long addr =3D __this_cpu_read(cpu_patching_addr);
> >   	pte_t *ptep;
> >   	pmd_t *pmdp;
> >   	pud_t *pudp;
> > @@ -175,23 +180,23 @@ static inline int unmap_patch_area(unsigned long =
addr)
> >  =20
> >   	pgdp =3D pgd_offset_k(addr);
> >   	if (unlikely(!pgdp))
> > -		return -EINVAL;
> > +		goto out_err;
> >  =20
> >   	p4dp =3D p4d_offset(pgdp, addr);
> >   	if (unlikely(!p4dp))
> > -		return -EINVAL;
> > +		goto out_err;
> >  =20
> >   	pudp =3D pud_offset(p4dp, addr);
> >   	if (unlikely(!pudp))
> > -		return -EINVAL;
> > +		goto out_err;
> >  =20
> >   	pmdp =3D pmd_offset(pudp, addr);
> >   	if (unlikely(!pmdp))
> > -		return -EINVAL;
> > +		goto out_err;
> >  =20
> >   	ptep =3D pte_offset_kernel(pmdp, addr);
> >   	if (unlikely(!ptep))
> > -		return -EINVAL;
> > +		goto out_err;
> >  =20
> >   	pr_devel("clearing mm %p, pte %p, addr %lx\n", &init_mm, ptep, addr)=
;
> >  =20
> > @@ -202,15 +207,17 @@ static inline int unmap_patch_area(unsigned long =
addr)
> >   	flush_tlb_kernel_range(addr, addr + PAGE_SIZE);
> >  =20
> >   	return 0;
> > +
> > +out_err:
> > +	pr_warn("failed to unmap %lx\n", addr);
> > +	return -EINVAL;
>
> Can you keep that in the caller of unmap_patch_area() instead of all
> those goto stuff ?
>

Yeah I think that's fair. I'll do this in the next spin.

> >   }
> >  =20
> >   static int do_patch_instruction(u32 *addr, struct ppc_inst instr)
> >   {
> > -	int err;
> > +	int err, rc =3D 0;
> >   	u32 *patch_addr =3D NULL;
> >   	unsigned long flags;
> > -	unsigned long text_poke_addr;
> > -	unsigned long kaddr =3D (unsigned long)addr;
> >  =20
> >   	/*
> >   	 * During early early boot patch_instruction is called
> > @@ -222,24 +229,20 @@ static int do_patch_instruction(u32 *addr, struct=
 ppc_inst instr)
> >  =20
> >   	local_irq_save(flags);
> >  =20
> > -	text_poke_addr =3D (unsigned long)__this_cpu_read(text_poke_area)->ad=
dr;
> > -	if (map_patch_area(addr, text_poke_addr)) {
> > -		err =3D -1;
> > +	err =3D map_patch_area(addr);
> > +	if (err)
> >   		goto out;
> > -	}
> > -
> > -	patch_addr =3D (u32 *)(text_poke_addr + (kaddr & ~PAGE_MASK));
> >  =20
> > -	__patch_instruction(addr, instr, patch_addr);
> > +	patch_addr =3D (u32 *)(__this_cpu_read(cpu_patching_addr) | offset_in=
_page(addr));
> > +	rc =3D __patch_instruction(addr, instr, patch_addr);
> >  =20
> > -	err =3D unmap_patch_area(text_poke_addr);
> > -	if (err)
> > -		pr_warn("failed to unmap %lx\n", text_poke_addr);
> > +	err =3D unmap_patch_area();
> >  =20
> >   out:
> >   	local_irq_restore(flags);
> > +	WARN_ON(!ppc_inst_equal(ppc_inst_read(addr), instr));
>
> Why adding that WARN_ON(), what could make that happen that is worth a
> WARN_ON() ?

Failing to patch something could cause very strange issues later, so
explicitly calling out a failure when it happens is warranted IMO.

>
> Patching is quite a critical fast path, I'm not sure we want to afford
> too many checks during
> patching, we want it quick at first.

Hmm, I'd prefer to measure the impact first - if it's a huge degradation
then sure we can drop the WARN_ON()... I'll add some data with the next
spin.

>
> >  =20
> > -	return err;
> > +	return rc ? rc : err;
> >   }
> >   #else /* !CONFIG_STRICT_KERNEL_RWX */
> >  =20
> >=20

