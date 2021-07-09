Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BDA9C3C1EAE
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Jul 2021 06:56:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GLgqL5GdZz3bXb
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Jul 2021 14:56:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=sSU6VKIp;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=cmr@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=sSU6VKIp; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GLgpp3rBbz3bWB
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Jul 2021 14:56:01 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1694XjRt051037; Fri, 9 Jul 2021 00:55:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=mime-version :
 content-transfer-encoding : content-type : date : message-id : subject :
 from : to : cc : references : in-reply-to; s=pp1;
 bh=ojhLPUmSvV3UpNu2krlcYJbnTTxtqcSXO8P2hF98ja8=;
 b=sSU6VKIpVmircGZsjYHQ62KyN+zwp2/6bhkApMUjvlukZUf4Ky89XPWb7KfjyS8aAV6E
 nsveS6ZcHT/uoXDXb7udGVoG2ChmgbHh76JquE17NNZImyU+iznhRgy4qoyo1CDQzR2J
 8vVNiCH5GHkwfi9ccwsnDQmOJB2koSwKwFd19CObqHR4U9UpsjGupFaimhNwZbLnxUMV
 w/r6HOzWi5iftmdXLVgktzEI8BJUCkBvpaWDOkRNQxtK3IV6OYXvdwrrHrV52hGfRSkb
 wTqVKhiHUq1mlfa2pTKgajTKfznJ7vOVqozYGmDDRyNR3h9BFlFldLDMQ/9R3pOA3dM/ 6Q== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39pcs63vfr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 09 Jul 2021 00:55:53 -0400
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1694XkTV051126;
 Fri, 9 Jul 2021 00:55:53 -0400
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39pcs63vfk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 09 Jul 2021 00:55:53 -0400
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1694lIoG012863;
 Fri, 9 Jul 2021 04:55:52 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma01wdc.us.ibm.com with ESMTP id 39jfhd5pty-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 09 Jul 2021 04:55:52 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1694tpIW34472374
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 9 Jul 2021 04:55:51 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 77A03124058;
 Fri,  9 Jul 2021 04:55:51 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BE963124052;
 Fri,  9 Jul 2021 04:55:50 +0000 (GMT)
Received: from oc8246131445.ibm.com (unknown [9.163.19.100])
 by b01ledav002.gho.pok.ibm.com (Postfix) with SMTP;
 Fri,  9 Jul 2021 04:55:50 +0000 (GMT)
Received: from localhost (localhost6 [IPv6:::1])
 by oc8246131445.ibm.com (Postfix) with ESMTP id 3E228BC0B0E;
 Thu,  8 Jul 2021 23:55:48 -0500 (CDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 08 Jul 2021 23:55:48 -0500
Message-Id: <CCOCBLDVNRNH.2AYK4L1QLJ0F6@oc8246131445.ibm.com>
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
 <CCHK05L5IMIU.2P6V21JLTU3E5@oc8246131445.ibm.com>
 <1625119343.ozhm53mipc.astroid@bobo.none>
 <CCHLT13VBZR8.3S2BSB3TXT3CJ@oc8246131445.ibm.com>
 <1625124601.4ahxocq4e6.astroid@bobo.none>
In-Reply-To: <1625124601.4ahxocq4e6.astroid@bobo.none>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 8cZcG39EWV63wTn0TottwB1uGeLP9mFS
X-Proofpoint-GUID: 9aYAq-XsVA9M_iCL3e0gGcJPeIOn0vG0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-09_01:2021-07-09,
 2021-07-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 bulkscore=0 adultscore=0
 impostorscore=0 priorityscore=1501 mlxlogscore=999 suspectscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107090020
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

On Thu Jul 1, 2021 at 2:37 AM CDT, Nicholas Piggin wrote:
> Excerpts from Christopher M. Riedl's message of July 1, 2021 4:53 pm:
> > On Thu Jul 1, 2021 at 1:04 AM CDT, Nicholas Piggin wrote:
> >> Excerpts from Christopher M. Riedl's message of July 1, 2021 3:28 pm:
> >> > On Wed Jun 30, 2021 at 11:15 PM CDT, Nicholas Piggin wrote:
> >> >> Excerpts from Christopher M. Riedl's message of July 1, 2021 1:48 p=
m:
> >> >> > On Sun Jun 20, 2021 at 10:13 PM CDT, Daniel Axtens wrote:
> >> >> >> "Christopher M. Riedl" <cmr@linux.ibm.com> writes:
> >> >> >>
> >> >> >> > Switching to a different mm with Hash translation causes SLB e=
ntries to
> >> >> >> > be preloaded from the current thread_info. This reduces SLB fa=
ults, for
> >> >> >> > example when threads share a common mm but operate on differen=
t address
> >> >> >> > ranges.
> >> >> >> >
> >> >> >> > Preloading entries from the thread_info struct may not always =
be
> >> >> >> > appropriate - such as when switching to a temporary mm. Introd=
uce a new
> >> >> >> > boolean in mm_context_t to skip the SLB preload entirely. Also=
 move the
> >> >> >> > SLB preload code into a separate function since switch_slb() i=
s already
> >> >> >> > quite long. The default behavior (preloading SLB entries from =
the
> >> >> >> > current thread_info struct) remains unchanged.
> >> >> >> >
> >> >> >> > Signed-off-by: Christopher M. Riedl <cmr@linux.ibm.com>
> >> >> >> >
> >> >> >> > ---
> >> >> >> >
> >> >> >> > v4:  * New to series.
> >> >> >> > ---
> >> >> >> >  arch/powerpc/include/asm/book3s/64/mmu.h |  3 ++
> >> >> >> >  arch/powerpc/include/asm/mmu_context.h   | 13 ++++++
> >> >> >> >  arch/powerpc/mm/book3s64/mmu_context.c   |  2 +
> >> >> >> >  arch/powerpc/mm/book3s64/slb.c           | 56 ++++++++++++++-=
---------
> >> >> >> >  4 files changed, 50 insertions(+), 24 deletions(-)
> >> >> >> >
> >> >> >> > diff --git a/arch/powerpc/include/asm/book3s/64/mmu.h b/arch/p=
owerpc/include/asm/book3s/64/mmu.h
> >> >> >> > index eace8c3f7b0a1..b23a9dcdee5af 100644
> >> >> >> > --- a/arch/powerpc/include/asm/book3s/64/mmu.h
> >> >> >> > +++ b/arch/powerpc/include/asm/book3s/64/mmu.h
> >> >> >> > @@ -130,6 +130,9 @@ typedef struct {
> >> >> >> >  	u32 pkey_allocation_map;
> >> >> >> >  	s16 execute_only_pkey; /* key holding execute-only protectio=
n */
> >> >> >> >  #endif
> >> >> >> > +
> >> >> >> > +	/* Do not preload SLB entries from thread_info during switch=
_slb() */
> >> >> >> > +	bool skip_slb_preload;
> >> >> >> >  } mm_context_t;
> >> >> >> > =20
> >> >> >> >  static inline u16 mm_ctx_user_psize(mm_context_t *ctx)
> >> >> >> > diff --git a/arch/powerpc/include/asm/mmu_context.h b/arch/pow=
erpc/include/asm/mmu_context.h
> >> >> >> > index 4bc45d3ed8b0e..264787e90b1a1 100644
> >> >> >> > --- a/arch/powerpc/include/asm/mmu_context.h
> >> >> >> > +++ b/arch/powerpc/include/asm/mmu_context.h
> >> >> >> > @@ -298,6 +298,19 @@ static inline int arch_dup_mmap(struct mm=
_struct *oldmm,
> >> >> >> >  	return 0;
> >> >> >> >  }
> >> >> >> > =20
> >> >> >> > +#ifdef CONFIG_PPC_BOOK3S_64
> >> >> >> > +
> >> >> >> > +static inline void skip_slb_preload_mm(struct mm_struct *mm)
> >> >> >> > +{
> >> >> >> > +	mm->context.skip_slb_preload =3D true;
> >> >> >> > +}
> >> >> >> > +
> >> >> >> > +#else
> >> >> >> > +
> >> >> >> > +static inline void skip_slb_preload_mm(struct mm_struct *mm) =
{}
> >> >> >> > +
> >> >> >> > +#endif /* CONFIG_PPC_BOOK3S_64 */
> >> >> >> > +
> >> >> >> >  #include <asm-generic/mmu_context.h>
> >> >> >> > =20
> >> >> >> >  #endif /* __KERNEL__ */
> >> >> >> > diff --git a/arch/powerpc/mm/book3s64/mmu_context.c b/arch/pow=
erpc/mm/book3s64/mmu_context.c
> >> >> >> > index c10fc8a72fb37..3479910264c59 100644
> >> >> >> > --- a/arch/powerpc/mm/book3s64/mmu_context.c
> >> >> >> > +++ b/arch/powerpc/mm/book3s64/mmu_context.c
> >> >> >> > @@ -202,6 +202,8 @@ int init_new_context(struct task_struct *t=
sk, struct mm_struct *mm)
> >> >> >> >  	atomic_set(&mm->context.active_cpus, 0);
> >> >> >> >  	atomic_set(&mm->context.copros, 0);
> >> >> >> > =20
> >> >> >> > +	mm->context.skip_slb_preload =3D false;
> >> >> >> > +
> >> >> >> >  	return 0;
> >> >> >> >  }
> >> >> >> > =20
> >> >> >> > diff --git a/arch/powerpc/mm/book3s64/slb.c b/arch/powerpc/mm/=
book3s64/slb.c
> >> >> >> > index c91bd85eb90e3..da0836cb855af 100644
> >> >> >> > --- a/arch/powerpc/mm/book3s64/slb.c
> >> >> >> > +++ b/arch/powerpc/mm/book3s64/slb.c
> >> >> >> > @@ -441,10 +441,39 @@ static void slb_cache_slbie_user(unsigne=
d int index)
> >> >> >> >  	asm volatile("slbie %0" : : "r" (slbie_data));
> >> >> >> >  }
> >> >> >> > =20
> >> >> >> > +static void preload_slb_entries(struct task_struct *tsk, stru=
ct mm_struct *mm)
> >> >> >> Should this be explicitly inline or even __always_inline? I'm th=
inking
> >> >> >> switch_slb is probably a fairly hot path on hash?
> >> >> >=20
> >> >> > Yes absolutely. I'll make this change in v5.
> >> >> >=20
> >> >> >>
> >> >> >> > +{
> >> >> >> > +	struct thread_info *ti =3D task_thread_info(tsk);
> >> >> >> > +	unsigned char i;
> >> >> >> > +
> >> >> >> > +	/*
> >> >> >> > +	 * We gradually age out SLBs after a number of context switc=
hes to
> >> >> >> > +	 * reduce reload overhead of unused entries (like we do with=
 FP/VEC
> >> >> >> > +	 * reload). Each time we wrap 256 switches, take an entry ou=
t of the
> >> >> >> > +	 * SLB preload cache.
> >> >> >> > +	 */
> >> >> >> > +	tsk->thread.load_slb++;
> >> >> >> > +	if (!tsk->thread.load_slb) {
> >> >> >> > +		unsigned long pc =3D KSTK_EIP(tsk);
> >> >> >> > +
> >> >> >> > +		preload_age(ti);
> >> >> >> > +		preload_add(ti, pc);
> >> >> >> > +	}
> >> >> >> > +
> >> >> >> > +	for (i =3D 0; i < ti->slb_preload_nr; i++) {
> >> >> >> > +		unsigned char idx;
> >> >> >> > +		unsigned long ea;
> >> >> >> > +
> >> >> >> > +		idx =3D (ti->slb_preload_tail + i) % SLB_PRELOAD_NR;
> >> >> >> > +		ea =3D (unsigned long)ti->slb_preload_esid[idx] << SID_SHIF=
T;
> >> >> >> > +
> >> >> >> > +		slb_allocate_user(mm, ea);
> >> >> >> > +	}
> >> >> >> > +}
> >> >> >> > +
> >> >> >> >  /* Flush all user entries from the segment table of the curre=
nt processor. */
> >> >> >> >  void switch_slb(struct task_struct *tsk, struct mm_struct *mm=
)
> >> >> >> >  {
> >> >> >> > -	struct thread_info *ti =3D task_thread_info(tsk);
> >> >> >> >  	unsigned char i;
> >> >> >> > =20
> >> >> >> >  	/*
> >> >> >> > @@ -502,29 +531,8 @@ void switch_slb(struct task_struct *tsk, =
struct mm_struct *mm)
> >> >> >> > =20
> >> >> >> >  	copy_mm_to_paca(mm);
> >> >> >> > =20
> >> >> >> > -	/*
> >> >> >> > -	 * We gradually age out SLBs after a number of context switc=
hes to
> >> >> >> > -	 * reduce reload overhead of unused entries (like we do with=
 FP/VEC
> >> >> >> > -	 * reload). Each time we wrap 256 switches, take an entry ou=
t of the
> >> >> >> > -	 * SLB preload cache.
> >> >> >> > -	 */
> >> >> >> > -	tsk->thread.load_slb++;
> >> >> >> > -	if (!tsk->thread.load_slb) {
> >> >> >> > -		unsigned long pc =3D KSTK_EIP(tsk);
> >> >> >> > -
> >> >> >> > -		preload_age(ti);
> >> >> >> > -		preload_add(ti, pc);
> >> >> >> > -	}
> >> >> >> > -
> >> >> >> > -	for (i =3D 0; i < ti->slb_preload_nr; i++) {
> >> >> >> > -		unsigned char idx;
> >> >> >> > -		unsigned long ea;
> >> >> >> > -
> >> >> >> > -		idx =3D (ti->slb_preload_tail + i) % SLB_PRELOAD_NR;
> >> >> >> > -		ea =3D (unsigned long)ti->slb_preload_esid[idx] << SID_SHIF=
T;
> >> >> >> > -
> >> >> >> > -		slb_allocate_user(mm, ea);
> >> >> >> > -	}
> >> >> >> > +	if (!mm->context.skip_slb_preload)
> >> >> >> > +		preload_slb_entries(tsk, mm);
> >> >> >>
> >> >> >> Should this be wrapped in likely()?
> >> >> >=20
> >> >> > Seems like a good idea - yes.
> >> >> >=20
> >> >> >>
> >> >> >> > =20
> >> >> >> >  	/*
> >> >> >> >  	 * Synchronize slbmte preloads with possible subsequent user=
 memory
> >> >> >>
> >> >> >> Right below this comment is the isync. It seems to be specifical=
ly
> >> >> >> concerned with synchronising preloaded slbs. Do you need it if y=
ou are
> >> >> >> skipping SLB preloads?
> >> >> >>
> >> >> >> It's probably not a big deal to have an extra isync in the fairl=
y rare
> >> >> >> path when we're skipping preloads, but I thought I'd check.
> >> >> >=20
> >> >> > I don't _think_ we need the `isync` if we are skipping the SLB pr=
eloads,
> >> >> > but then again it was always in the code-path before. If someone =
can
> >> >> > make a compelling argument to drop it when not preloading SLBs I =
will,
> >> >> > otherwise (considering some of the other non-obvious things I ste=
pped
> >> >> > into with the Hash code) I will keep it here for now.
> >> >>
> >> >> The ISA says slbia wants an isync afterward, so we probably should =
keep
> >> >> it. The comment is a bit misleading in that case.
> >> >>
> >> >> Why isn't preloading appropriate for a temporary mm?
> >> >=20
> >> > The preloaded entries come from the thread_info struct which isn't
> >> > necessarily related to the temporary mm at all. I saw SLB multihits
> >> > while testing this series with my LKDTM test where the "patching
> >> > address" (userspace address for the temporary mapping w/
> >> > write-permissions) ends up in a thread's preload list and then we
> >> > explicitly insert it again in map_patch() when trying to patch. At t=
hat
> >> > point the SLB multihit triggers.
> >>
> >> Hmm, so what if we use a mm, take some SLB faults then unuse it and
> >> use a different one? I wonder if kthread_use_mm has existing problems
> >> with this incorrect SLB preloading. Quite possibly. We should clear
> >> the preload whenever mm changes I think. That should cover this as
> >> well.
> >=20
> > I actually did this initially but thought it was a bit too intrusive to
> > include as part of this series and hurt performance. I agree that
> > preloading the SLB from the thread may be a problem in general when
> > switching in/out an mm.
> >=20
> > kthread_use_mm may not be affected unless we explicitly insert some SLB
> > entries which could collide with an existing preload (which I don't
> > think we do anywhere until this series).
>
> kthread_use_mm(mm1);
> *ea =3D blah; /* slb preload[n++][ea] =3D va */
> kthread_unuse_mm(mm1);
>
> kthread_use_mm(mm2);
> switch_slb();
> schedule();
> /* preload ea=3Dva? */
> x =3D *ea;
> kthread_unuse_mm(mm2);
>
> ? I'm sure we'd have a bug in existing code if you're hitting a bug
> there.

Not exactly - the SLB multihit happens because of the new code in this
series - specifically the slb_allocate_user() call during patching:

put_user(..., ea); /* insert ea into thread's preload list */
...
patch_instruction(..., ea);
  map_patch()
    switch_slb(); /* preload slb entry for ea from thread_info */
    ...
    slb_allocate_user(..., ea); /* insert slb entry for ea */
    __put_kernel_nofault(..., ea); /* ie. a 'stw' to patch */
    >>> SLB Multihit since we have an SLBE from the preload and the
        explicit slb_allocate_user()

Based on your other comments on this series I am dropping the Hash
support for percpu temp mm altogether for now so this is moot. But, I
still think it doesn't make much sense to preload SLB entries from a
thread_info struct when switching to a completely different mm.

>
> Thanks,
> Nick

