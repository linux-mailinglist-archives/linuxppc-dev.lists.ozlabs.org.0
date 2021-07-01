Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E219B3B9132
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Jul 2021 13:31:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GFwyF68ghz3bbs
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Jul 2021 21:31:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=Xzr8zb2z;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::630;
 helo=mail-pl1-x630.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Xzr8zb2z; dkim-atps=neutral
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [IPv6:2607:f8b0:4864:20::630])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GFwxp5Xzvz301j
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Jul 2021 21:30:37 +1000 (AEST)
Received: by mail-pl1-x630.google.com with SMTP id h6so2340303plf.11
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 01 Jul 2021 04:30:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=FWYMeCrA8a3SZtEwTurSCHZzPq1Ldj75mQlitbwPIds=;
 b=Xzr8zb2zr3GneS+T3P+kYmwaSBqNPoUa+IiaQC9RmAUtGRYj7SodqfqfIvoT+oiV+2
 d6kBAXeB42dyRXxMCS728zwjENFe1zYTf3hkI9YOYlNXh0ByjD7RE5hlrOzjNEOoGW0X
 sG2whOuIrPKYji7CumBK262Kd8r40GY463di0AE/J9SwYmnY8kw4uZuy4cQI9muI1Sr5
 zFrkMXQvjo9GZJDCrbohV7HYVzcg1qgzpKnMNu/AYjmKncLm+ismbnGOOIwlZOY0Ea64
 L1zcCq5jvp5ZlfjbbYbISkuj5GTCiLdHf3F27OlOgG95YLNtoxDVs2MliihNcf5wMCX0
 6b6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=FWYMeCrA8a3SZtEwTurSCHZzPq1Ldj75mQlitbwPIds=;
 b=ATE19jkThTWIU46+bG8sqeZ1JbvFos9RXhrLegiD9W57FEWk5rA7EtqwTdWqtiBLXO
 D/4FsOqx2ypPEVekRKu+xE83uIJttr7IDIZS8+JTZOIHO6XKUEW8XNJyD8tDZaljBf1o
 HEmCE/PfZjIwnGD+Ij6YzS4vScVWOVNnyez2wDxsaqq2AiK4FVKgq5ruIRMb2dJT7AuL
 xNahGL+6AvXRDUXgvbJGXPZCOinDOCq4wsZHBhSCc0FnK7HPVoNoELHMhvXKqRIZkS7O
 Z7YPYwKzDsvJIWuHWA8/tzjDgm63k6Fvcv1RGm8zQT27ZBf8KXhQ04QRwc+6qxlhqkjY
 IyMg==
X-Gm-Message-State: AOAM533zSNZftZIIxmVkPHRwvnwdoRjPkCRmSWKRBsXyTHHEHrkAcVlZ
 AD+BgQod4qM7bxwZlPCfbuA=
X-Google-Smtp-Source: ABdhPJwJl9kjrKBUCU8Zl/2OJHQbWY8/1Bi0LY7eJg+9i/uksUrG5PAsoJ+rMV0+M2j+0wrzWW/s6A==
X-Received: by 2002:a17:90b:3581:: with SMTP id
 mm1mr9274222pjb.98.1625139032292; 
 Thu, 01 Jul 2021 04:30:32 -0700 (PDT)
Received: from localhost ([118.209.250.144])
 by smtp.gmail.com with ESMTPSA id l12sm24333867pff.105.2021.07.01.04.30.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Jul 2021 04:30:31 -0700 (PDT)
Date: Thu, 01 Jul 2021 21:30:25 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [RESEND PATCH v4 05/11] powerpc/64s: Add ability to skip SLB
 preload
To: "Christopher M. Riedl" <cmr@linux.ibm.com>, Daniel Axtens
 <dja@axtens.net>, linuxppc-dev@lists.ozlabs.org
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
MIME-Version: 1.0
Message-Id: <1625138588.ghd7fktvnl.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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

Excerpts from Nicholas Piggin's message of July 1, 2021 5:37 pm:
> Excerpts from Christopher M. Riedl's message of July 1, 2021 4:53 pm:
>> On Thu Jul 1, 2021 at 1:04 AM CDT, Nicholas Piggin wrote:
>>> Excerpts from Christopher M. Riedl's message of July 1, 2021 3:28 pm:
>>> > On Wed Jun 30, 2021 at 11:15 PM CDT, Nicholas Piggin wrote:
>>> >> Excerpts from Christopher M. Riedl's message of July 1, 2021 1:48 pm=
:
>>> >> > On Sun Jun 20, 2021 at 10:13 PM CDT, Daniel Axtens wrote:
>>> >> >> "Christopher M. Riedl" <cmr@linux.ibm.com> writes:
>>> >> >>
>>> >> >> > Switching to a different mm with Hash translation causes SLB en=
tries to
>>> >> >> > be preloaded from the current thread_info. This reduces SLB fau=
lts, for
>>> >> >> > example when threads share a common mm but operate on different=
 address
>>> >> >> > ranges.
>>> >> >> >
>>> >> >> > Preloading entries from the thread_info struct may not always b=
e
>>> >> >> > appropriate - such as when switching to a temporary mm. Introdu=
ce a new
>>> >> >> > boolean in mm_context_t to skip the SLB preload entirely. Also =
move the
>>> >> >> > SLB preload code into a separate function since switch_slb() is=
 already
>>> >> >> > quite long. The default behavior (preloading SLB entries from t=
he
>>> >> >> > current thread_info struct) remains unchanged.
>>> >> >> >
>>> >> >> > Signed-off-by: Christopher M. Riedl <cmr@linux.ibm.com>
>>> >> >> >
>>> >> >> > ---
>>> >> >> >
>>> >> >> > v4:  * New to series.
>>> >> >> > ---
>>> >> >> >  arch/powerpc/include/asm/book3s/64/mmu.h |  3 ++
>>> >> >> >  arch/powerpc/include/asm/mmu_context.h   | 13 ++++++
>>> >> >> >  arch/powerpc/mm/book3s64/mmu_context.c   |  2 +
>>> >> >> >  arch/powerpc/mm/book3s64/slb.c           | 56 ++++++++++++++--=
--------
>>> >> >> >  4 files changed, 50 insertions(+), 24 deletions(-)
>>> >> >> >
>>> >> >> > diff --git a/arch/powerpc/include/asm/book3s/64/mmu.h b/arch/po=
werpc/include/asm/book3s/64/mmu.h
>>> >> >> > index eace8c3f7b0a1..b23a9dcdee5af 100644
>>> >> >> > --- a/arch/powerpc/include/asm/book3s/64/mmu.h
>>> >> >> > +++ b/arch/powerpc/include/asm/book3s/64/mmu.h
>>> >> >> > @@ -130,6 +130,9 @@ typedef struct {
>>> >> >> >  	u32 pkey_allocation_map;
>>> >> >> >  	s16 execute_only_pkey; /* key holding execute-only protection=
 */
>>> >> >> >  #endif
>>> >> >> > +
>>> >> >> > +	/* Do not preload SLB entries from thread_info during switch_=
slb() */
>>> >> >> > +	bool skip_slb_preload;
>>> >> >> >  } mm_context_t;
>>> >> >> > =20
>>> >> >> >  static inline u16 mm_ctx_user_psize(mm_context_t *ctx)
>>> >> >> > diff --git a/arch/powerpc/include/asm/mmu_context.h b/arch/powe=
rpc/include/asm/mmu_context.h
>>> >> >> > index 4bc45d3ed8b0e..264787e90b1a1 100644
>>> >> >> > --- a/arch/powerpc/include/asm/mmu_context.h
>>> >> >> > +++ b/arch/powerpc/include/asm/mmu_context.h
>>> >> >> > @@ -298,6 +298,19 @@ static inline int arch_dup_mmap(struct mm_=
struct *oldmm,
>>> >> >> >  	return 0;
>>> >> >> >  }
>>> >> >> > =20
>>> >> >> > +#ifdef CONFIG_PPC_BOOK3S_64
>>> >> >> > +
>>> >> >> > +static inline void skip_slb_preload_mm(struct mm_struct *mm)
>>> >> >> > +{
>>> >> >> > +	mm->context.skip_slb_preload =3D true;
>>> >> >> > +}
>>> >> >> > +
>>> >> >> > +#else
>>> >> >> > +
>>> >> >> > +static inline void skip_slb_preload_mm(struct mm_struct *mm) {=
}
>>> >> >> > +
>>> >> >> > +#endif /* CONFIG_PPC_BOOK3S_64 */
>>> >> >> > +
>>> >> >> >  #include <asm-generic/mmu_context.h>
>>> >> >> > =20
>>> >> >> >  #endif /* __KERNEL__ */
>>> >> >> > diff --git a/arch/powerpc/mm/book3s64/mmu_context.c b/arch/powe=
rpc/mm/book3s64/mmu_context.c
>>> >> >> > index c10fc8a72fb37..3479910264c59 100644
>>> >> >> > --- a/arch/powerpc/mm/book3s64/mmu_context.c
>>> >> >> > +++ b/arch/powerpc/mm/book3s64/mmu_context.c
>>> >> >> > @@ -202,6 +202,8 @@ int init_new_context(struct task_struct *ts=
k, struct mm_struct *mm)
>>> >> >> >  	atomic_set(&mm->context.active_cpus, 0);
>>> >> >> >  	atomic_set(&mm->context.copros, 0);
>>> >> >> > =20
>>> >> >> > +	mm->context.skip_slb_preload =3D false;
>>> >> >> > +
>>> >> >> >  	return 0;
>>> >> >> >  }
>>> >> >> > =20
>>> >> >> > diff --git a/arch/powerpc/mm/book3s64/slb.c b/arch/powerpc/mm/b=
ook3s64/slb.c
>>> >> >> > index c91bd85eb90e3..da0836cb855af 100644
>>> >> >> > --- a/arch/powerpc/mm/book3s64/slb.c
>>> >> >> > +++ b/arch/powerpc/mm/book3s64/slb.c
>>> >> >> > @@ -441,10 +441,39 @@ static void slb_cache_slbie_user(unsigned=
 int index)
>>> >> >> >  	asm volatile("slbie %0" : : "r" (slbie_data));
>>> >> >> >  }
>>> >> >> > =20
>>> >> >> > +static void preload_slb_entries(struct task_struct *tsk, struc=
t mm_struct *mm)
>>> >> >> Should this be explicitly inline or even __always_inline? I'm thi=
nking
>>> >> >> switch_slb is probably a fairly hot path on hash?
>>> >> >=20
>>> >> > Yes absolutely. I'll make this change in v5.
>>> >> >=20
>>> >> >>
>>> >> >> > +{
>>> >> >> > +	struct thread_info *ti =3D task_thread_info(tsk);
>>> >> >> > +	unsigned char i;
>>> >> >> > +
>>> >> >> > +	/*
>>> >> >> > +	 * We gradually age out SLBs after a number of context switch=
es to
>>> >> >> > +	 * reduce reload overhead of unused entries (like we do with =
FP/VEC
>>> >> >> > +	 * reload). Each time we wrap 256 switches, take an entry out=
 of the
>>> >> >> > +	 * SLB preload cache.
>>> >> >> > +	 */
>>> >> >> > +	tsk->thread.load_slb++;
>>> >> >> > +	if (!tsk->thread.load_slb) {
>>> >> >> > +		unsigned long pc =3D KSTK_EIP(tsk);
>>> >> >> > +
>>> >> >> > +		preload_age(ti);
>>> >> >> > +		preload_add(ti, pc);
>>> >> >> > +	}
>>> >> >> > +
>>> >> >> > +	for (i =3D 0; i < ti->slb_preload_nr; i++) {
>>> >> >> > +		unsigned char idx;
>>> >> >> > +		unsigned long ea;
>>> >> >> > +
>>> >> >> > +		idx =3D (ti->slb_preload_tail + i) % SLB_PRELOAD_NR;
>>> >> >> > +		ea =3D (unsigned long)ti->slb_preload_esid[idx] << SID_SHIFT=
;
>>> >> >> > +
>>> >> >> > +		slb_allocate_user(mm, ea);
>>> >> >> > +	}
>>> >> >> > +}
>>> >> >> > +
>>> >> >> >  /* Flush all user entries from the segment table of the curren=
t processor. */
>>> >> >> >  void switch_slb(struct task_struct *tsk, struct mm_struct *mm)
>>> >> >> >  {
>>> >> >> > -	struct thread_info *ti =3D task_thread_info(tsk);
>>> >> >> >  	unsigned char i;
>>> >> >> > =20
>>> >> >> >  	/*
>>> >> >> > @@ -502,29 +531,8 @@ void switch_slb(struct task_struct *tsk, s=
truct mm_struct *mm)
>>> >> >> > =20
>>> >> >> >  	copy_mm_to_paca(mm);
>>> >> >> > =20
>>> >> >> > -	/*
>>> >> >> > -	 * We gradually age out SLBs after a number of context switch=
es to
>>> >> >> > -	 * reduce reload overhead of unused entries (like we do with =
FP/VEC
>>> >> >> > -	 * reload). Each time we wrap 256 switches, take an entry out=
 of the
>>> >> >> > -	 * SLB preload cache.
>>> >> >> > -	 */
>>> >> >> > -	tsk->thread.load_slb++;
>>> >> >> > -	if (!tsk->thread.load_slb) {
>>> >> >> > -		unsigned long pc =3D KSTK_EIP(tsk);
>>> >> >> > -
>>> >> >> > -		preload_age(ti);
>>> >> >> > -		preload_add(ti, pc);
>>> >> >> > -	}
>>> >> >> > -
>>> >> >> > -	for (i =3D 0; i < ti->slb_preload_nr; i++) {
>>> >> >> > -		unsigned char idx;
>>> >> >> > -		unsigned long ea;
>>> >> >> > -
>>> >> >> > -		idx =3D (ti->slb_preload_tail + i) % SLB_PRELOAD_NR;
>>> >> >> > -		ea =3D (unsigned long)ti->slb_preload_esid[idx] << SID_SHIFT=
;
>>> >> >> > -
>>> >> >> > -		slb_allocate_user(mm, ea);
>>> >> >> > -	}
>>> >> >> > +	if (!mm->context.skip_slb_preload)
>>> >> >> > +		preload_slb_entries(tsk, mm);
>>> >> >>
>>> >> >> Should this be wrapped in likely()?
>>> >> >=20
>>> >> > Seems like a good idea - yes.
>>> >> >=20
>>> >> >>
>>> >> >> > =20
>>> >> >> >  	/*
>>> >> >> >  	 * Synchronize slbmte preloads with possible subsequent user =
memory
>>> >> >>
>>> >> >> Right below this comment is the isync. It seems to be specificall=
y
>>> >> >> concerned with synchronising preloaded slbs. Do you need it if yo=
u are
>>> >> >> skipping SLB preloads?
>>> >> >>
>>> >> >> It's probably not a big deal to have an extra isync in the fairly=
 rare
>>> >> >> path when we're skipping preloads, but I thought I'd check.
>>> >> >=20
>>> >> > I don't _think_ we need the `isync` if we are skipping the SLB pre=
loads,
>>> >> > but then again it was always in the code-path before. If someone c=
an
>>> >> > make a compelling argument to drop it when not preloading SLBs I w=
ill,
>>> >> > otherwise (considering some of the other non-obvious things I step=
ped
>>> >> > into with the Hash code) I will keep it here for now.
>>> >>
>>> >> The ISA says slbia wants an isync afterward, so we probably should k=
eep
>>> >> it. The comment is a bit misleading in that case.
>>> >>
>>> >> Why isn't preloading appropriate for a temporary mm?
>>> >=20
>>> > The preloaded entries come from the thread_info struct which isn't
>>> > necessarily related to the temporary mm at all. I saw SLB multihits
>>> > while testing this series with my LKDTM test where the "patching
>>> > address" (userspace address for the temporary mapping w/
>>> > write-permissions) ends up in a thread's preload list and then we
>>> > explicitly insert it again in map_patch() when trying to patch. At th=
at
>>> > point the SLB multihit triggers.
>>>
>>> Hmm, so what if we use a mm, take some SLB faults then unuse it and
>>> use a different one? I wonder if kthread_use_mm has existing problems
>>> with this incorrect SLB preloading. Quite possibly. We should clear
>>> the preload whenever mm changes I think. That should cover this as
>>> well.
>>=20
>> I actually did this initially but thought it was a bit too intrusive to
>> include as part of this series and hurt performance. I agree that
>> preloading the SLB from the thread may be a problem in general when
>> switching in/out an mm.
>>=20
>> kthread_use_mm may not be affected unless we explicitly insert some SLB
>> entries which could collide with an existing preload (which I don't
>> think we do anywhere until this series).
>=20
> kthread_use_mm(mm1);
> *ea =3D blah; /* slb preload[n++][ea] =3D va */
> kthread_unuse_mm(mm1);
>=20
> kthread_use_mm(mm2);
>   switch_slb();
> schedule();
>   /* preload ea=3Dva? */
> x =3D *ea;
> kthread_unuse_mm(mm2);
>=20
> ? I'm sure we'd have a bug in existing code if you're hitting a bug=20
> there.

Something like this I think should prevent it. I thought there was a=20
better arch hook for it, but doesn't seem so. I have an unexplained
SLB crash bug somewhere too, better check if it matches...

Thanks,
Nick

diff --git a/arch/powerpc/mm/book3s64/slb.c b/arch/powerpc/mm/book3s64/slb.=
c
index c91bd85eb90e..cb8c8a5d861e 100644
--- a/arch/powerpc/mm/book3s64/slb.c
+++ b/arch/powerpc/mm/book3s64/slb.c
@@ -502,6 +502,9 @@ void switch_slb(struct task_struct *tsk, struct mm_stru=
ct *mm)
=20
        copy_mm_to_paca(mm);
=20
+       if (unlikely(tsk->flags & PF_KTHREAD))
+               goto no_preload;
+
        /*
         * We gradually age out SLBs after a number of context switches to
         * reduce reload overhead of unused entries (like we do with FP/VEC
@@ -526,10 +529,11 @@ void switch_slb(struct task_struct *tsk, struct mm_st=
ruct *mm)
                slb_allocate_user(mm, ea);
        }
=20
+no_preload:
        /*
-        * Synchronize slbmte preloads with possible subsequent user memory
-        * address accesses by the kernel (user mode won't happen until
-        * rfid, which is safe).
+        * Synchronize slbias and slbmte preloads with possible subsequent =
user
+        * memory address accesses by the kernel (user mode won't happen un=
til
+        * rfid, which is synchronizing).
         */
        isync();
 }

