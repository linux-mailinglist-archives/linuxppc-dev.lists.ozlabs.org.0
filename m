Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 00B043B8E42
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Jul 2021 09:37:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GFqnC6pKwz3bWn
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Jul 2021 17:37:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=HaKEnizP;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1036;
 helo=mail-pj1-x1036.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=HaKEnizP; dkim-atps=neutral
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GFqmm2ZtVz2ydk
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Jul 2021 17:37:27 +1000 (AEST)
Received: by mail-pj1-x1036.google.com with SMTP id
 cx9-20020a17090afd89b0290170a3e085edso3427276pjb.0
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 01 Jul 2021 00:37:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=DxkG59SNSALlN+ZP9F93+04IN1CaRZTRqsGF0n3Qwxg=;
 b=HaKEnizP9chcoRY0XzY6BUvCy+XdLws0YGbo6Kv7x9bu9w885TkqXkYkRXCrbqPtfQ
 CRMJuO7lwUHnbkZITxPN+1cz1xzyF8qIsbKdtDH/wrbnwS6vjGBKlS6MfpdaaSJN7vMP
 RJz5FDW5e23llduV6o4Cx4SyGgXACoLUMe48DT4EX2GcUAxdSBZHiK3tBwyBIf/buX4z
 1YZZb3GjA5eZs7VDxqNmr02L2LCW9cfdKgXHUKf2Qu/aE4mGtM5D88dDoQ/qOThd2T5l
 Tc18zayFhuciArztlzLeFTkjtCky+EHriaW1tKb1nwGK3Pmf83CfOLMR/7HC6b6yYELH
 OT6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=DxkG59SNSALlN+ZP9F93+04IN1CaRZTRqsGF0n3Qwxg=;
 b=kOqhFhUx5M3cwYc4MXBadD0CzuJPQqgX0dvpTv2BAanaNDBUIREMhjhQIKSfKQqSmM
 W5YvcMNKAUZ7U04FewMHSPBCefgXNFg7bHDuaGW9clBLEzIsfiSrtlVvNNZRSoZbrDJm
 28T7MxNMf1zM89K8NFB+v+r7bhJH5N1IwGKLW3oqJP64yZ8ISpKVn/E2iOvgSzuixF7Q
 TaVuacUeWBQlqIv+M3lgVl1sv/pqyoWd3uNS+LTc5RTpIc7UUhYWSwKrQpkGipiWh6nn
 hm8z/GnNqMH6jC0wwiv0D7baqbDWVJBtrEVQPYgPcRPfTDIvH55RfqIFMijJVl8vuokn
 gTYg==
X-Gm-Message-State: AOAM533cXjwkgQy6w3P6ARWwQrVR6fLmrhWqW0yu+8XMU7mn/XlVI1qX
 MfvVsiMGPHoh1Y7LUalSoFk=
X-Google-Smtp-Source: ABdhPJwoAR//OG5laV/zM/SEv/lji01RbY3oIHyrusrmySXLmwAoRJK+uY9GCOg1RzVVIHlySzFBJg==
X-Received: by 2002:a17:90a:e286:: with SMTP id
 d6mr12167411pjz.157.1625125042543; 
 Thu, 01 Jul 2021 00:37:22 -0700 (PDT)
Received: from localhost (220-244-87-52.tpgi.com.au. [220.244.87.52])
 by smtp.gmail.com with ESMTPSA id 194sm1913986pfy.51.2021.07.01.00.37.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Jul 2021 00:37:22 -0700 (PDT)
Date: Thu, 01 Jul 2021 17:37:16 +1000
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
In-Reply-To: <CCHLT13VBZR8.3S2BSB3TXT3CJ@oc8246131445.ibm.com>
MIME-Version: 1.0
Message-Id: <1625124601.4ahxocq4e6.astroid@bobo.none>
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

Excerpts from Christopher M. Riedl's message of July 1, 2021 4:53 pm:
> On Thu Jul 1, 2021 at 1:04 AM CDT, Nicholas Piggin wrote:
>> Excerpts from Christopher M. Riedl's message of July 1, 2021 3:28 pm:
>> > On Wed Jun 30, 2021 at 11:15 PM CDT, Nicholas Piggin wrote:
>> >> Excerpts from Christopher M. Riedl's message of July 1, 2021 1:48 pm:
>> >> > On Sun Jun 20, 2021 at 10:13 PM CDT, Daniel Axtens wrote:
>> >> >> "Christopher M. Riedl" <cmr@linux.ibm.com> writes:
>> >> >>
>> >> >> > Switching to a different mm with Hash translation causes SLB ent=
ries to
>> >> >> > be preloaded from the current thread_info. This reduces SLB faul=
ts, for
>> >> >> > example when threads share a common mm but operate on different =
address
>> >> >> > ranges.
>> >> >> >
>> >> >> > Preloading entries from the thread_info struct may not always be
>> >> >> > appropriate - such as when switching to a temporary mm. Introduc=
e a new
>> >> >> > boolean in mm_context_t to skip the SLB preload entirely. Also m=
ove the
>> >> >> > SLB preload code into a separate function since switch_slb() is =
already
>> >> >> > quite long. The default behavior (preloading SLB entries from th=
e
>> >> >> > current thread_info struct) remains unchanged.
>> >> >> >
>> >> >> > Signed-off-by: Christopher M. Riedl <cmr@linux.ibm.com>
>> >> >> >
>> >> >> > ---
>> >> >> >
>> >> >> > v4:  * New to series.
>> >> >> > ---
>> >> >> >  arch/powerpc/include/asm/book3s/64/mmu.h |  3 ++
>> >> >> >  arch/powerpc/include/asm/mmu_context.h   | 13 ++++++
>> >> >> >  arch/powerpc/mm/book3s64/mmu_context.c   |  2 +
>> >> >> >  arch/powerpc/mm/book3s64/slb.c           | 56 ++++++++++++++---=
-------
>> >> >> >  4 files changed, 50 insertions(+), 24 deletions(-)
>> >> >> >
>> >> >> > diff --git a/arch/powerpc/include/asm/book3s/64/mmu.h b/arch/pow=
erpc/include/asm/book3s/64/mmu.h
>> >> >> > index eace8c3f7b0a1..b23a9dcdee5af 100644
>> >> >> > --- a/arch/powerpc/include/asm/book3s/64/mmu.h
>> >> >> > +++ b/arch/powerpc/include/asm/book3s/64/mmu.h
>> >> >> > @@ -130,6 +130,9 @@ typedef struct {
>> >> >> >  	u32 pkey_allocation_map;
>> >> >> >  	s16 execute_only_pkey; /* key holding execute-only protection =
*/
>> >> >> >  #endif
>> >> >> > +
>> >> >> > +	/* Do not preload SLB entries from thread_info during switch_s=
lb() */
>> >> >> > +	bool skip_slb_preload;
>> >> >> >  } mm_context_t;
>> >> >> > =20
>> >> >> >  static inline u16 mm_ctx_user_psize(mm_context_t *ctx)
>> >> >> > diff --git a/arch/powerpc/include/asm/mmu_context.h b/arch/power=
pc/include/asm/mmu_context.h
>> >> >> > index 4bc45d3ed8b0e..264787e90b1a1 100644
>> >> >> > --- a/arch/powerpc/include/asm/mmu_context.h
>> >> >> > +++ b/arch/powerpc/include/asm/mmu_context.h
>> >> >> > @@ -298,6 +298,19 @@ static inline int arch_dup_mmap(struct mm_s=
truct *oldmm,
>> >> >> >  	return 0;
>> >> >> >  }
>> >> >> > =20
>> >> >> > +#ifdef CONFIG_PPC_BOOK3S_64
>> >> >> > +
>> >> >> > +static inline void skip_slb_preload_mm(struct mm_struct *mm)
>> >> >> > +{
>> >> >> > +	mm->context.skip_slb_preload =3D true;
>> >> >> > +}
>> >> >> > +
>> >> >> > +#else
>> >> >> > +
>> >> >> > +static inline void skip_slb_preload_mm(struct mm_struct *mm) {}
>> >> >> > +
>> >> >> > +#endif /* CONFIG_PPC_BOOK3S_64 */
>> >> >> > +
>> >> >> >  #include <asm-generic/mmu_context.h>
>> >> >> > =20
>> >> >> >  #endif /* __KERNEL__ */
>> >> >> > diff --git a/arch/powerpc/mm/book3s64/mmu_context.c b/arch/power=
pc/mm/book3s64/mmu_context.c
>> >> >> > index c10fc8a72fb37..3479910264c59 100644
>> >> >> > --- a/arch/powerpc/mm/book3s64/mmu_context.c
>> >> >> > +++ b/arch/powerpc/mm/book3s64/mmu_context.c
>> >> >> > @@ -202,6 +202,8 @@ int init_new_context(struct task_struct *tsk=
, struct mm_struct *mm)
>> >> >> >  	atomic_set(&mm->context.active_cpus, 0);
>> >> >> >  	atomic_set(&mm->context.copros, 0);
>> >> >> > =20
>> >> >> > +	mm->context.skip_slb_preload =3D false;
>> >> >> > +
>> >> >> >  	return 0;
>> >> >> >  }
>> >> >> > =20
>> >> >> > diff --git a/arch/powerpc/mm/book3s64/slb.c b/arch/powerpc/mm/bo=
ok3s64/slb.c
>> >> >> > index c91bd85eb90e3..da0836cb855af 100644
>> >> >> > --- a/arch/powerpc/mm/book3s64/slb.c
>> >> >> > +++ b/arch/powerpc/mm/book3s64/slb.c
>> >> >> > @@ -441,10 +441,39 @@ static void slb_cache_slbie_user(unsigned =
int index)
>> >> >> >  	asm volatile("slbie %0" : : "r" (slbie_data));
>> >> >> >  }
>> >> >> > =20
>> >> >> > +static void preload_slb_entries(struct task_struct *tsk, struct=
 mm_struct *mm)
>> >> >> Should this be explicitly inline or even __always_inline? I'm thin=
king
>> >> >> switch_slb is probably a fairly hot path on hash?
>> >> >=20
>> >> > Yes absolutely. I'll make this change in v5.
>> >> >=20
>> >> >>
>> >> >> > +{
>> >> >> > +	struct thread_info *ti =3D task_thread_info(tsk);
>> >> >> > +	unsigned char i;
>> >> >> > +
>> >> >> > +	/*
>> >> >> > +	 * We gradually age out SLBs after a number of context switche=
s to
>> >> >> > +	 * reduce reload overhead of unused entries (like we do with F=
P/VEC
>> >> >> > +	 * reload). Each time we wrap 256 switches, take an entry out =
of the
>> >> >> > +	 * SLB preload cache.
>> >> >> > +	 */
>> >> >> > +	tsk->thread.load_slb++;
>> >> >> > +	if (!tsk->thread.load_slb) {
>> >> >> > +		unsigned long pc =3D KSTK_EIP(tsk);
>> >> >> > +
>> >> >> > +		preload_age(ti);
>> >> >> > +		preload_add(ti, pc);
>> >> >> > +	}
>> >> >> > +
>> >> >> > +	for (i =3D 0; i < ti->slb_preload_nr; i++) {
>> >> >> > +		unsigned char idx;
>> >> >> > +		unsigned long ea;
>> >> >> > +
>> >> >> > +		idx =3D (ti->slb_preload_tail + i) % SLB_PRELOAD_NR;
>> >> >> > +		ea =3D (unsigned long)ti->slb_preload_esid[idx] << SID_SHIFT;
>> >> >> > +
>> >> >> > +		slb_allocate_user(mm, ea);
>> >> >> > +	}
>> >> >> > +}
>> >> >> > +
>> >> >> >  /* Flush all user entries from the segment table of the current=
 processor. */
>> >> >> >  void switch_slb(struct task_struct *tsk, struct mm_struct *mm)
>> >> >> >  {
>> >> >> > -	struct thread_info *ti =3D task_thread_info(tsk);
>> >> >> >  	unsigned char i;
>> >> >> > =20
>> >> >> >  	/*
>> >> >> > @@ -502,29 +531,8 @@ void switch_slb(struct task_struct *tsk, st=
ruct mm_struct *mm)
>> >> >> > =20
>> >> >> >  	copy_mm_to_paca(mm);
>> >> >> > =20
>> >> >> > -	/*
>> >> >> > -	 * We gradually age out SLBs after a number of context switche=
s to
>> >> >> > -	 * reduce reload overhead of unused entries (like we do with F=
P/VEC
>> >> >> > -	 * reload). Each time we wrap 256 switches, take an entry out =
of the
>> >> >> > -	 * SLB preload cache.
>> >> >> > -	 */
>> >> >> > -	tsk->thread.load_slb++;
>> >> >> > -	if (!tsk->thread.load_slb) {
>> >> >> > -		unsigned long pc =3D KSTK_EIP(tsk);
>> >> >> > -
>> >> >> > -		preload_age(ti);
>> >> >> > -		preload_add(ti, pc);
>> >> >> > -	}
>> >> >> > -
>> >> >> > -	for (i =3D 0; i < ti->slb_preload_nr; i++) {
>> >> >> > -		unsigned char idx;
>> >> >> > -		unsigned long ea;
>> >> >> > -
>> >> >> > -		idx =3D (ti->slb_preload_tail + i) % SLB_PRELOAD_NR;
>> >> >> > -		ea =3D (unsigned long)ti->slb_preload_esid[idx] << SID_SHIFT;
>> >> >> > -
>> >> >> > -		slb_allocate_user(mm, ea);
>> >> >> > -	}
>> >> >> > +	if (!mm->context.skip_slb_preload)
>> >> >> > +		preload_slb_entries(tsk, mm);
>> >> >>
>> >> >> Should this be wrapped in likely()?
>> >> >=20
>> >> > Seems like a good idea - yes.
>> >> >=20
>> >> >>
>> >> >> > =20
>> >> >> >  	/*
>> >> >> >  	 * Synchronize slbmte preloads with possible subsequent user m=
emory
>> >> >>
>> >> >> Right below this comment is the isync. It seems to be specifically
>> >> >> concerned with synchronising preloaded slbs. Do you need it if you=
 are
>> >> >> skipping SLB preloads?
>> >> >>
>> >> >> It's probably not a big deal to have an extra isync in the fairly =
rare
>> >> >> path when we're skipping preloads, but I thought I'd check.
>> >> >=20
>> >> > I don't _think_ we need the `isync` if we are skipping the SLB prel=
oads,
>> >> > but then again it was always in the code-path before. If someone ca=
n
>> >> > make a compelling argument to drop it when not preloading SLBs I wi=
ll,
>> >> > otherwise (considering some of the other non-obvious things I stepp=
ed
>> >> > into with the Hash code) I will keep it here for now.
>> >>
>> >> The ISA says slbia wants an isync afterward, so we probably should ke=
ep
>> >> it. The comment is a bit misleading in that case.
>> >>
>> >> Why isn't preloading appropriate for a temporary mm?
>> >=20
>> > The preloaded entries come from the thread_info struct which isn't
>> > necessarily related to the temporary mm at all. I saw SLB multihits
>> > while testing this series with my LKDTM test where the "patching
>> > address" (userspace address for the temporary mapping w/
>> > write-permissions) ends up in a thread's preload list and then we
>> > explicitly insert it again in map_patch() when trying to patch. At tha=
t
>> > point the SLB multihit triggers.
>>
>> Hmm, so what if we use a mm, take some SLB faults then unuse it and
>> use a different one? I wonder if kthread_use_mm has existing problems
>> with this incorrect SLB preloading. Quite possibly. We should clear
>> the preload whenever mm changes I think. That should cover this as
>> well.
>=20
> I actually did this initially but thought it was a bit too intrusive to
> include as part of this series and hurt performance. I agree that
> preloading the SLB from the thread may be a problem in general when
> switching in/out an mm.
>=20
> kthread_use_mm may not be affected unless we explicitly insert some SLB
> entries which could collide with an existing preload (which I don't
> think we do anywhere until this series).

kthread_use_mm(mm1);
*ea =3D blah; /* slb preload[n++][ea] =3D va */
kthread_unuse_mm(mm1);

kthread_use_mm(mm2);
  switch_slb();
schedule();
  /* preload ea=3Dva? */
x =3D *ea;
kthread_unuse_mm(mm2);

? I'm sure we'd have a bug in existing code if you're hitting a bug=20
there.

Thanks,
Nick
