Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D62E83B8CBB
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Jul 2021 05:49:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GFkjh5Mpnz2yjK
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Jul 2021 13:49:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=FoWqUdTn;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=cmr@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=FoWqUdTn; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GFkjB5t1Kz2yhF
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Jul 2021 13:49:01 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1613XFxD044336; Wed, 30 Jun 2021 23:48:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=mime-version :
 content-transfer-encoding : content-type : date : message-id : from : to :
 cc : subject : references : in-reply-to; s=pp1;
 bh=MdbAet2K5VhgjeTXayBt8W8l7RKshfGAO4ohr6SRxEw=;
 b=FoWqUdTnQhKJkzuCjKgSKOs/wwYfsuRM3me2sdfQUBXhcebfFvm6HgxO+hTNQpBppp6Y
 JG2syfHKu9JMvmIdawFPrrTwpyu7U54LzI2cfd5IbRTSLuky/6tVhYLS9humZODoJwo5
 HOTu+sQNkREteNw22PM8C+tKg8v696MUNtK1fHsUIBGIcqtuoh5Zd2dMJbLh07LbyJ8b
 //mg/Vcd4EniCQwMOVQHxJLtGUqgx/LcD0trGLxQp0WSeSPW6z2LTzAQSYMVjzuqsCY/
 9nzlBVlqjoL+bkXd4bcF772Kbv+qgnlPqUl6FPzAEGxxnWy4ORCC5j6uY14vtUIBvDNm EQ== 
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0b-001b2d01.pphosted.com with ESMTP id 39h514hbbh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 30 Jun 2021 23:48:46 -0400
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1613mRO7021736;
 Thu, 1 Jul 2021 03:48:45 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma05wdc.us.ibm.com with ESMTP id 39duvdk0p9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 01 Jul 2021 03:48:45 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1613miJI35651860
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 1 Jul 2021 03:48:45 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DF0812805C;
 Thu,  1 Jul 2021 03:48:44 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 40D3328058;
 Thu,  1 Jul 2021 03:48:44 +0000 (GMT)
Received: from oc8246131445.ibm.com (unknown [9.211.158.151])
 by b01ledav001.gho.pok.ibm.com (Postfix) with SMTP;
 Thu,  1 Jul 2021 03:48:44 +0000 (GMT)
Received: from localhost (localhost6 [IPv6:::1])
 by oc8246131445.ibm.com (Postfix) with ESMTP id 99FF5BC0CFF;
 Wed, 30 Jun 2021 22:48:41 -0500 (CDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 30 Jun 2021 22:48:41 -0500
Message-Id: <CCHHVUNV216M.1825LSMNZ1XG7@oc8246131445.ibm.com>
From: "Christopher M. Riedl" <cmr@linux.ibm.com>
To: "Daniel Axtens" <dja@axtens.net>, <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [RESEND PATCH v4 05/11] powerpc/64s: Add ability to skip SLB
 preload
References: <20210506043452.9674-1-cmr@linux.ibm.com>
 <20210506043452.9674-6-cmr@linux.ibm.com>
 <87sg1bj4ex.fsf@dja-thinkpad.axtens.net>
In-Reply-To: <87sg1bj4ex.fsf@dja-thinkpad.axtens.net>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: kci6_Gx1AOBZnDgQmbCjZ2LJfubhg-01
X-Proofpoint-GUID: kci6_Gx1AOBZnDgQmbCjZ2LJfubhg-01
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-01_01:2021-06-30,
 2021-07-01 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0
 adultscore=0 phishscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 clxscore=1011 suspectscore=0 malwarescore=0 mlxlogscore=999
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107010023
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
Cc: tglx@linutronix.de, x86@kernel.org, linux-hardening@vger.kernel.org,
 keescook@chromium.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun Jun 20, 2021 at 10:13 PM CDT, Daniel Axtens wrote:
> "Christopher M. Riedl" <cmr@linux.ibm.com> writes:
>
> > Switching to a different mm with Hash translation causes SLB entries to
> > be preloaded from the current thread_info. This reduces SLB faults, for
> > example when threads share a common mm but operate on different address
> > ranges.
> >
> > Preloading entries from the thread_info struct may not always be
> > appropriate - such as when switching to a temporary mm. Introduce a new
> > boolean in mm_context_t to skip the SLB preload entirely. Also move the
> > SLB preload code into a separate function since switch_slb() is already
> > quite long. The default behavior (preloading SLB entries from the
> > current thread_info struct) remains unchanged.
> >
> > Signed-off-by: Christopher M. Riedl <cmr@linux.ibm.com>
> >
> > ---
> >
> > v4:  * New to series.
> > ---
> >  arch/powerpc/include/asm/book3s/64/mmu.h |  3 ++
> >  arch/powerpc/include/asm/mmu_context.h   | 13 ++++++
> >  arch/powerpc/mm/book3s64/mmu_context.c   |  2 +
> >  arch/powerpc/mm/book3s64/slb.c           | 56 ++++++++++++++----------
> >  4 files changed, 50 insertions(+), 24 deletions(-)
> >
> > diff --git a/arch/powerpc/include/asm/book3s/64/mmu.h b/arch/powerpc/in=
clude/asm/book3s/64/mmu.h
> > index eace8c3f7b0a1..b23a9dcdee5af 100644
> > --- a/arch/powerpc/include/asm/book3s/64/mmu.h
> > +++ b/arch/powerpc/include/asm/book3s/64/mmu.h
> > @@ -130,6 +130,9 @@ typedef struct {
> >  	u32 pkey_allocation_map;
> >  	s16 execute_only_pkey; /* key holding execute-only protection */
> >  #endif
> > +
> > +	/* Do not preload SLB entries from thread_info during switch_slb() */
> > +	bool skip_slb_preload;
> >  } mm_context_t;
> > =20
> >  static inline u16 mm_ctx_user_psize(mm_context_t *ctx)
> > diff --git a/arch/powerpc/include/asm/mmu_context.h b/arch/powerpc/incl=
ude/asm/mmu_context.h
> > index 4bc45d3ed8b0e..264787e90b1a1 100644
> > --- a/arch/powerpc/include/asm/mmu_context.h
> > +++ b/arch/powerpc/include/asm/mmu_context.h
> > @@ -298,6 +298,19 @@ static inline int arch_dup_mmap(struct mm_struct *=
oldmm,
> >  	return 0;
> >  }
> > =20
> > +#ifdef CONFIG_PPC_BOOK3S_64
> > +
> > +static inline void skip_slb_preload_mm(struct mm_struct *mm)
> > +{
> > +	mm->context.skip_slb_preload =3D true;
> > +}
> > +
> > +#else
> > +
> > +static inline void skip_slb_preload_mm(struct mm_struct *mm) {}
> > +
> > +#endif /* CONFIG_PPC_BOOK3S_64 */
> > +
> >  #include <asm-generic/mmu_context.h>
> > =20
> >  #endif /* __KERNEL__ */
> > diff --git a/arch/powerpc/mm/book3s64/mmu_context.c b/arch/powerpc/mm/b=
ook3s64/mmu_context.c
> > index c10fc8a72fb37..3479910264c59 100644
> > --- a/arch/powerpc/mm/book3s64/mmu_context.c
> > +++ b/arch/powerpc/mm/book3s64/mmu_context.c
> > @@ -202,6 +202,8 @@ int init_new_context(struct task_struct *tsk, struc=
t mm_struct *mm)
> >  	atomic_set(&mm->context.active_cpus, 0);
> >  	atomic_set(&mm->context.copros, 0);
> > =20
> > +	mm->context.skip_slb_preload =3D false;
> > +
> >  	return 0;
> >  }
> > =20
> > diff --git a/arch/powerpc/mm/book3s64/slb.c b/arch/powerpc/mm/book3s64/=
slb.c
> > index c91bd85eb90e3..da0836cb855af 100644
> > --- a/arch/powerpc/mm/book3s64/slb.c
> > +++ b/arch/powerpc/mm/book3s64/slb.c
> > @@ -441,10 +441,39 @@ static void slb_cache_slbie_user(unsigned int ind=
ex)
> >  	asm volatile("slbie %0" : : "r" (slbie_data));
> >  }
> > =20
> > +static void preload_slb_entries(struct task_struct *tsk, struct mm_str=
uct *mm)
> Should this be explicitly inline or even __always_inline? I'm thinking
> switch_slb is probably a fairly hot path on hash?

Yes absolutely. I'll make this change in v5.

>
> > +{
> > +	struct thread_info *ti =3D task_thread_info(tsk);
> > +	unsigned char i;
> > +
> > +	/*
> > +	 * We gradually age out SLBs after a number of context switches to
> > +	 * reduce reload overhead of unused entries (like we do with FP/VEC
> > +	 * reload). Each time we wrap 256 switches, take an entry out of the
> > +	 * SLB preload cache.
> > +	 */
> > +	tsk->thread.load_slb++;
> > +	if (!tsk->thread.load_slb) {
> > +		unsigned long pc =3D KSTK_EIP(tsk);
> > +
> > +		preload_age(ti);
> > +		preload_add(ti, pc);
> > +	}
> > +
> > +	for (i =3D 0; i < ti->slb_preload_nr; i++) {
> > +		unsigned char idx;
> > +		unsigned long ea;
> > +
> > +		idx =3D (ti->slb_preload_tail + i) % SLB_PRELOAD_NR;
> > +		ea =3D (unsigned long)ti->slb_preload_esid[idx] << SID_SHIFT;
> > +
> > +		slb_allocate_user(mm, ea);
> > +	}
> > +}
> > +
> >  /* Flush all user entries from the segment table of the current proces=
sor. */
> >  void switch_slb(struct task_struct *tsk, struct mm_struct *mm)
> >  {
> > -	struct thread_info *ti =3D task_thread_info(tsk);
> >  	unsigned char i;
> > =20
> >  	/*
> > @@ -502,29 +531,8 @@ void switch_slb(struct task_struct *tsk, struct mm=
_struct *mm)
> > =20
> >  	copy_mm_to_paca(mm);
> > =20
> > -	/*
> > -	 * We gradually age out SLBs after a number of context switches to
> > -	 * reduce reload overhead of unused entries (like we do with FP/VEC
> > -	 * reload). Each time we wrap 256 switches, take an entry out of the
> > -	 * SLB preload cache.
> > -	 */
> > -	tsk->thread.load_slb++;
> > -	if (!tsk->thread.load_slb) {
> > -		unsigned long pc =3D KSTK_EIP(tsk);
> > -
> > -		preload_age(ti);
> > -		preload_add(ti, pc);
> > -	}
> > -
> > -	for (i =3D 0; i < ti->slb_preload_nr; i++) {
> > -		unsigned char idx;
> > -		unsigned long ea;
> > -
> > -		idx =3D (ti->slb_preload_tail + i) % SLB_PRELOAD_NR;
> > -		ea =3D (unsigned long)ti->slb_preload_esid[idx] << SID_SHIFT;
> > -
> > -		slb_allocate_user(mm, ea);
> > -	}
> > +	if (!mm->context.skip_slb_preload)
> > +		preload_slb_entries(tsk, mm);
>
> Should this be wrapped in likely()?

Seems like a good idea - yes.

>
> > =20
> >  	/*
> >  	 * Synchronize slbmte preloads with possible subsequent user memory
>
> Right below this comment is the isync. It seems to be specifically
> concerned with synchronising preloaded slbs. Do you need it if you are
> skipping SLB preloads?
>
> It's probably not a big deal to have an extra isync in the fairly rare
> path when we're skipping preloads, but I thought I'd check.

I don't _think_ we need the `isync` if we are skipping the SLB preloads,
but then again it was always in the code-path before. If someone can
make a compelling argument to drop it when not preloading SLBs I will,
otherwise (considering some of the other non-obvious things I stepped
into with the Hash code) I will keep it here for now.

Thanks for the comments!

>
> Kind regards,
> Daniel
>
> > --=20
> > 2.26.1

