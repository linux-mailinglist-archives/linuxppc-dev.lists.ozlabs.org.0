Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 01ECC3B8D69
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Jul 2021 07:29:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GFmwX6hrWz3bX9
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Jul 2021 15:29:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=dHaxw1R+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=cmr@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=dHaxw1R+; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GFmw11pPqz2ysm
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Jul 2021 15:28:32 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16154PqI097220; Thu, 1 Jul 2021 01:28:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=mime-version :
 content-transfer-encoding : content-type : date : message-id : cc :
 subject : from : to : references : in-reply-to; s=pp1;
 bh=IBtXFcC5g/QDxH1/d1ZLnJ86yY1wJRByV56H1GtRF70=;
 b=dHaxw1R+hRbsrzVYF8Nfj9txPBTwg2cqSBC+YARW5AhZnAYQbhx0mCDoGIJ8sheZVMhO
 OZuYFA75GiGQTo3VyGWH8tVc6a4pGn290oQZkrAyFITXGM8NFfypSgS4zs1ykLzpkakU
 ey8RvocojZcEu8J6bniXTt4McEyIENSpepsPH8N1N+ofKPeVuZysojAyYBA5xID8nyQN
 GToyAruXQmFUlXYcIixRYvjs2ul1ERSXgwubhFMElNghAZNoeVB/8jn0VazPKefMLhkv
 SlGobuXGvODU8A+eIfkRYJqr7YnsSVweIlylbHoclYvBp0f0JH1sFDizelY9WCdjASH2 sQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 39h5mq2mem-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 01 Jul 2021 01:28:26 -0400
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 16154Qso097314;
 Thu, 1 Jul 2021 01:28:25 -0400
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0b-001b2d01.pphosted.com with ESMTP id 39h5mq2mef-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 01 Jul 2021 01:28:25 -0400
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1615NBX3029532;
 Thu, 1 Jul 2021 05:28:24 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma03wdc.us.ibm.com with ESMTP id 39duvdcfsx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 01 Jul 2021 05:28:24 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1615SN3L34079138
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 1 Jul 2021 05:28:23 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C1740BE054;
 Thu,  1 Jul 2021 05:28:23 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5C3F3BE051;
 Thu,  1 Jul 2021 05:28:23 +0000 (GMT)
Received: from oc8246131445.ibm.com (unknown [9.211.158.151])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with SMTP;
 Thu,  1 Jul 2021 05:28:23 +0000 (GMT)
Received: from localhost (localhost6 [IPv6:::1])
 by oc8246131445.ibm.com (Postfix) with ESMTP id 0B3BEBC1F26;
 Thu,  1 Jul 2021 00:28:21 -0500 (CDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 01 Jul 2021 00:28:21 -0500
Message-Id: <CCHK05L5IMIU.2P6V21JLTU3E5@oc8246131445.ibm.com>
Subject: Re: [RESEND PATCH v4 05/11] powerpc/64s: Add ability to skip SLB
 preload
From: "Christopher M. Riedl" <cmr@linux.ibm.com>
To: "Nicholas Piggin" <npiggin@gmail.com>, "Daniel Axtens" <dja@axtens.net>,
 <linuxppc-dev@lists.ozlabs.org>
References: <20210506043452.9674-1-cmr@linux.ibm.com>
 <20210506043452.9674-6-cmr@linux.ibm.com>
 <87sg1bj4ex.fsf@dja-thinkpad.axtens.net>
 <CCHHVUNV216M.1825LSMNZ1XG7@oc8246131445.ibm.com>
 <1625112841.77uceah4w9.astroid@bobo.none>
In-Reply-To: <1625112841.77uceah4w9.astroid@bobo.none>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: TrBl3u4xtouLDVkVG50rOFgljGH39lUK
X-Proofpoint-GUID: 8Vqcc4QAQX0pJn1O0ZSuwIScOw6vI0Em
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-01_01:2021-06-30,
 2021-07-01 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 phishscore=0 adultscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 mlxscore=0 impostorscore=0 spamscore=0 malwarescore=0 mlxlogscore=999
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107010034
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
Cc: tglx@linutronix.de, x86@kernel.org, keescook@chromium.org,
 linux-hardening@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed Jun 30, 2021 at 11:15 PM CDT, Nicholas Piggin wrote:
> Excerpts from Christopher M. Riedl's message of July 1, 2021 1:48 pm:
> > On Sun Jun 20, 2021 at 10:13 PM CDT, Daniel Axtens wrote:
> >> "Christopher M. Riedl" <cmr@linux.ibm.com> writes:
> >>
> >> > Switching to a different mm with Hash translation causes SLB entries=
 to
> >> > be preloaded from the current thread_info. This reduces SLB faults, =
for
> >> > example when threads share a common mm but operate on different addr=
ess
> >> > ranges.
> >> >
> >> > Preloading entries from the thread_info struct may not always be
> >> > appropriate - such as when switching to a temporary mm. Introduce a =
new
> >> > boolean in mm_context_t to skip the SLB preload entirely. Also move =
the
> >> > SLB preload code into a separate function since switch_slb() is alre=
ady
> >> > quite long. The default behavior (preloading SLB entries from the
> >> > current thread_info struct) remains unchanged.
> >> >
> >> > Signed-off-by: Christopher M. Riedl <cmr@linux.ibm.com>
> >> >
> >> > ---
> >> >
> >> > v4:  * New to series.
> >> > ---
> >> >  arch/powerpc/include/asm/book3s/64/mmu.h |  3 ++
> >> >  arch/powerpc/include/asm/mmu_context.h   | 13 ++++++
> >> >  arch/powerpc/mm/book3s64/mmu_context.c   |  2 +
> >> >  arch/powerpc/mm/book3s64/slb.c           | 56 ++++++++++++++-------=
---
> >> >  4 files changed, 50 insertions(+), 24 deletions(-)
> >> >
> >> > diff --git a/arch/powerpc/include/asm/book3s/64/mmu.h b/arch/powerpc=
/include/asm/book3s/64/mmu.h
> >> > index eace8c3f7b0a1..b23a9dcdee5af 100644
> >> > --- a/arch/powerpc/include/asm/book3s/64/mmu.h
> >> > +++ b/arch/powerpc/include/asm/book3s/64/mmu.h
> >> > @@ -130,6 +130,9 @@ typedef struct {
> >> >  	u32 pkey_allocation_map;
> >> >  	s16 execute_only_pkey; /* key holding execute-only protection */
> >> >  #endif
> >> > +
> >> > +	/* Do not preload SLB entries from thread_info during switch_slb()=
 */
> >> > +	bool skip_slb_preload;
> >> >  } mm_context_t;
> >> > =20
> >> >  static inline u16 mm_ctx_user_psize(mm_context_t *ctx)
> >> > diff --git a/arch/powerpc/include/asm/mmu_context.h b/arch/powerpc/i=
nclude/asm/mmu_context.h
> >> > index 4bc45d3ed8b0e..264787e90b1a1 100644
> >> > --- a/arch/powerpc/include/asm/mmu_context.h
> >> > +++ b/arch/powerpc/include/asm/mmu_context.h
> >> > @@ -298,6 +298,19 @@ static inline int arch_dup_mmap(struct mm_struc=
t *oldmm,
> >> >  	return 0;
> >> >  }
> >> > =20
> >> > +#ifdef CONFIG_PPC_BOOK3S_64
> >> > +
> >> > +static inline void skip_slb_preload_mm(struct mm_struct *mm)
> >> > +{
> >> > +	mm->context.skip_slb_preload =3D true;
> >> > +}
> >> > +
> >> > +#else
> >> > +
> >> > +static inline void skip_slb_preload_mm(struct mm_struct *mm) {}
> >> > +
> >> > +#endif /* CONFIG_PPC_BOOK3S_64 */
> >> > +
> >> >  #include <asm-generic/mmu_context.h>
> >> > =20
> >> >  #endif /* __KERNEL__ */
> >> > diff --git a/arch/powerpc/mm/book3s64/mmu_context.c b/arch/powerpc/m=
m/book3s64/mmu_context.c
> >> > index c10fc8a72fb37..3479910264c59 100644
> >> > --- a/arch/powerpc/mm/book3s64/mmu_context.c
> >> > +++ b/arch/powerpc/mm/book3s64/mmu_context.c
> >> > @@ -202,6 +202,8 @@ int init_new_context(struct task_struct *tsk, st=
ruct mm_struct *mm)
> >> >  	atomic_set(&mm->context.active_cpus, 0);
> >> >  	atomic_set(&mm->context.copros, 0);
> >> > =20
> >> > +	mm->context.skip_slb_preload =3D false;
> >> > +
> >> >  	return 0;
> >> >  }
> >> > =20
> >> > diff --git a/arch/powerpc/mm/book3s64/slb.c b/arch/powerpc/mm/book3s=
64/slb.c
> >> > index c91bd85eb90e3..da0836cb855af 100644
> >> > --- a/arch/powerpc/mm/book3s64/slb.c
> >> > +++ b/arch/powerpc/mm/book3s64/slb.c
> >> > @@ -441,10 +441,39 @@ static void slb_cache_slbie_user(unsigned int =
index)
> >> >  	asm volatile("slbie %0" : : "r" (slbie_data));
> >> >  }
> >> > =20
> >> > +static void preload_slb_entries(struct task_struct *tsk, struct mm_=
struct *mm)
> >> Should this be explicitly inline or even __always_inline? I'm thinking
> >> switch_slb is probably a fairly hot path on hash?
> >=20
> > Yes absolutely. I'll make this change in v5.
> >=20
> >>
> >> > +{
> >> > +	struct thread_info *ti =3D task_thread_info(tsk);
> >> > +	unsigned char i;
> >> > +
> >> > +	/*
> >> > +	 * We gradually age out SLBs after a number of context switches to
> >> > +	 * reduce reload overhead of unused entries (like we do with FP/VE=
C
> >> > +	 * reload). Each time we wrap 256 switches, take an entry out of t=
he
> >> > +	 * SLB preload cache.
> >> > +	 */
> >> > +	tsk->thread.load_slb++;
> >> > +	if (!tsk->thread.load_slb) {
> >> > +		unsigned long pc =3D KSTK_EIP(tsk);
> >> > +
> >> > +		preload_age(ti);
> >> > +		preload_add(ti, pc);
> >> > +	}
> >> > +
> >> > +	for (i =3D 0; i < ti->slb_preload_nr; i++) {
> >> > +		unsigned char idx;
> >> > +		unsigned long ea;
> >> > +
> >> > +		idx =3D (ti->slb_preload_tail + i) % SLB_PRELOAD_NR;
> >> > +		ea =3D (unsigned long)ti->slb_preload_esid[idx] << SID_SHIFT;
> >> > +
> >> > +		slb_allocate_user(mm, ea);
> >> > +	}
> >> > +}
> >> > +
> >> >  /* Flush all user entries from the segment table of the current pro=
cessor. */
> >> >  void switch_slb(struct task_struct *tsk, struct mm_struct *mm)
> >> >  {
> >> > -	struct thread_info *ti =3D task_thread_info(tsk);
> >> >  	unsigned char i;
> >> > =20
> >> >  	/*
> >> > @@ -502,29 +531,8 @@ void switch_slb(struct task_struct *tsk, struct=
 mm_struct *mm)
> >> > =20
> >> >  	copy_mm_to_paca(mm);
> >> > =20
> >> > -	/*
> >> > -	 * We gradually age out SLBs after a number of context switches to
> >> > -	 * reduce reload overhead of unused entries (like we do with FP/VE=
C
> >> > -	 * reload). Each time we wrap 256 switches, take an entry out of t=
he
> >> > -	 * SLB preload cache.
> >> > -	 */
> >> > -	tsk->thread.load_slb++;
> >> > -	if (!tsk->thread.load_slb) {
> >> > -		unsigned long pc =3D KSTK_EIP(tsk);
> >> > -
> >> > -		preload_age(ti);
> >> > -		preload_add(ti, pc);
> >> > -	}
> >> > -
> >> > -	for (i =3D 0; i < ti->slb_preload_nr; i++) {
> >> > -		unsigned char idx;
> >> > -		unsigned long ea;
> >> > -
> >> > -		idx =3D (ti->slb_preload_tail + i) % SLB_PRELOAD_NR;
> >> > -		ea =3D (unsigned long)ti->slb_preload_esid[idx] << SID_SHIFT;
> >> > -
> >> > -		slb_allocate_user(mm, ea);
> >> > -	}
> >> > +	if (!mm->context.skip_slb_preload)
> >> > +		preload_slb_entries(tsk, mm);
> >>
> >> Should this be wrapped in likely()?
> >=20
> > Seems like a good idea - yes.
> >=20
> >>
> >> > =20
> >> >  	/*
> >> >  	 * Synchronize slbmte preloads with possible subsequent user memor=
y
> >>
> >> Right below this comment is the isync. It seems to be specifically
> >> concerned with synchronising preloaded slbs. Do you need it if you are
> >> skipping SLB preloads?
> >>
> >> It's probably not a big deal to have an extra isync in the fairly rare
> >> path when we're skipping preloads, but I thought I'd check.
> >=20
> > I don't _think_ we need the `isync` if we are skipping the SLB preloads=
,
> > but then again it was always in the code-path before. If someone can
> > make a compelling argument to drop it when not preloading SLBs I will,
> > otherwise (considering some of the other non-obvious things I stepped
> > into with the Hash code) I will keep it here for now.
>
> The ISA says slbia wants an isync afterward, so we probably should keep
> it. The comment is a bit misleading in that case.
>
> Why isn't preloading appropriate for a temporary mm?

The preloaded entries come from the thread_info struct which isn't
necessarily related to the temporary mm at all. I saw SLB multihits
while testing this series with my LKDTM test where the "patching
address" (userspace address for the temporary mapping w/
write-permissions) ends up in a thread's preload list and then we
explicitly insert it again in map_patch() when trying to patch. At that
point the SLB multihit triggers.

>
> Thanks,
> Nick

