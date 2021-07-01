Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A359F3B8CD3
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Jul 2021 06:16:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GFlJW3jVGz3bWr
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Jul 2021 14:16:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=VNmEHdcP;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::634;
 helo=mail-pl1-x634.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=VNmEHdcP; dkim-atps=neutral
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GFlJ36Kdgz2yN3
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Jul 2021 14:15:46 +1000 (AEST)
Received: by mail-pl1-x634.google.com with SMTP id i4so2901658plt.12
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Jun 2021 21:15:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=sjKXrlzHdeYKbvdR/Do66AxwituMlDFFGjAyP20Oqdw=;
 b=VNmEHdcPzbXP2eV5NeVSyaWBEg0hbe7b47s2v4RO2Vrgd2WUYt4y9WhY6BGncVVTHi
 77yi/Y98A1DTOvNyY/3PtPrbQDSZi1KgscVvwhx3mmOsKeOd7JyOl+7ytWw6qAizTDYd
 r4lJ21X+vUXQar2EcRc5tELcQb8jRnUyNgnKY20CQh0VA3c+6R7cAOUTolTlb8/T/0eR
 8wJy1zvCeOWqv8I7rTjN3AOIJbHZQxT+F2V6BcgmSEKUF1ZqaSWLEjt/sdZ9iKABPhZP
 fdTGXoS2DQZuRPPgm5Oi1RGTKBLGmXYmK/9NQgtu5aX7/hrkLhzHTr8djO5i40Niwu80
 WiVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=sjKXrlzHdeYKbvdR/Do66AxwituMlDFFGjAyP20Oqdw=;
 b=udCGygq1u3mkTxK2/cfC/8SoqUf45ADAehnL2xv5D3zEn1JNe0bh8fFLiqlr30CZO2
 1yED+JodOnXv8SbNuwchq0zXA5ylKVPUg35WRY2haoTHKf1aDozhf53DLpwwtXrQ08Cf
 C82Hhhnx8L35lOZsp6ajajDoYbkUWdG2U19bVo2ZJulq6oAyhf8LQ2AxYCblu1uDp3G1
 d47T/4iL0IkdKMAiiRSLFQQNbHpVOyEZO6zj2Xgs5nbGoCDtHPJcC+MAX3BkhR/sD4Al
 CscliFcSni+o37MBQm12VRbLPwO7o3wsz+wlaX/NpHanYl5CfrP6cmDI5qgUc3AuL3Qg
 WFPg==
X-Gm-Message-State: AOAM531AUZbW1ZEWpBad3LWTKRCzvnznGXLqmYTOoCmNYu15I4f4r5w6
 SJN2ZbyD3WldY17Hr5MNQG0=
X-Google-Smtp-Source: ABdhPJz3SWfoYmrCu8JW8hawg7Rs+2Auvv3RKl8ZUENWCFSu09Sl3JdsPvI42bH7ImO9+QzfCoR3Uw==
X-Received: by 2002:a17:90a:708:: with SMTP id
 l8mr7894359pjl.103.1625112944319; 
 Wed, 30 Jun 2021 21:15:44 -0700 (PDT)
Received: from localhost (220-244-87-52.tpgi.com.au. [220.244.87.52])
 by smtp.gmail.com with ESMTPSA id n34sm17675273pji.45.2021.06.30.21.15.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Jun 2021 21:15:44 -0700 (PDT)
Date: Thu, 01 Jul 2021 14:15:38 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [RESEND PATCH v4 05/11] powerpc/64s: Add ability to skip SLB
 preload
To: "Christopher M. Riedl" <cmr@linux.ibm.com>, Daniel Axtens
 <dja@axtens.net>, linuxppc-dev@lists.ozlabs.org
References: <20210506043452.9674-1-cmr@linux.ibm.com>
 <20210506043452.9674-6-cmr@linux.ibm.com>
 <87sg1bj4ex.fsf@dja-thinkpad.axtens.net>
 <CCHHVUNV216M.1825LSMNZ1XG7@oc8246131445.ibm.com>
In-Reply-To: <CCHHVUNV216M.1825LSMNZ1XG7@oc8246131445.ibm.com>
MIME-Version: 1.0
Message-Id: <1625112841.77uceah4w9.astroid@bobo.none>
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

Excerpts from Christopher M. Riedl's message of July 1, 2021 1:48 pm:
> On Sun Jun 20, 2021 at 10:13 PM CDT, Daniel Axtens wrote:
>> "Christopher M. Riedl" <cmr@linux.ibm.com> writes:
>>
>> > Switching to a different mm with Hash translation causes SLB entries t=
o
>> > be preloaded from the current thread_info. This reduces SLB faults, fo=
r
>> > example when threads share a common mm but operate on different addres=
s
>> > ranges.
>> >
>> > Preloading entries from the thread_info struct may not always be
>> > appropriate - such as when switching to a temporary mm. Introduce a ne=
w
>> > boolean in mm_context_t to skip the SLB preload entirely. Also move th=
e
>> > SLB preload code into a separate function since switch_slb() is alread=
y
>> > quite long. The default behavior (preloading SLB entries from the
>> > current thread_info struct) remains unchanged.
>> >
>> > Signed-off-by: Christopher M. Riedl <cmr@linux.ibm.com>
>> >
>> > ---
>> >
>> > v4:  * New to series.
>> > ---
>> >  arch/powerpc/include/asm/book3s/64/mmu.h |  3 ++
>> >  arch/powerpc/include/asm/mmu_context.h   | 13 ++++++
>> >  arch/powerpc/mm/book3s64/mmu_context.c   |  2 +
>> >  arch/powerpc/mm/book3s64/slb.c           | 56 ++++++++++++++---------=
-
>> >  4 files changed, 50 insertions(+), 24 deletions(-)
>> >
>> > diff --git a/arch/powerpc/include/asm/book3s/64/mmu.h b/arch/powerpc/i=
nclude/asm/book3s/64/mmu.h
>> > index eace8c3f7b0a1..b23a9dcdee5af 100644
>> > --- a/arch/powerpc/include/asm/book3s/64/mmu.h
>> > +++ b/arch/powerpc/include/asm/book3s/64/mmu.h
>> > @@ -130,6 +130,9 @@ typedef struct {
>> >  	u32 pkey_allocation_map;
>> >  	s16 execute_only_pkey; /* key holding execute-only protection */
>> >  #endif
>> > +
>> > +	/* Do not preload SLB entries from thread_info during switch_slb() *=
/
>> > +	bool skip_slb_preload;
>> >  } mm_context_t;
>> > =20
>> >  static inline u16 mm_ctx_user_psize(mm_context_t *ctx)
>> > diff --git a/arch/powerpc/include/asm/mmu_context.h b/arch/powerpc/inc=
lude/asm/mmu_context.h
>> > index 4bc45d3ed8b0e..264787e90b1a1 100644
>> > --- a/arch/powerpc/include/asm/mmu_context.h
>> > +++ b/arch/powerpc/include/asm/mmu_context.h
>> > @@ -298,6 +298,19 @@ static inline int arch_dup_mmap(struct mm_struct =
*oldmm,
>> >  	return 0;
>> >  }
>> > =20
>> > +#ifdef CONFIG_PPC_BOOK3S_64
>> > +
>> > +static inline void skip_slb_preload_mm(struct mm_struct *mm)
>> > +{
>> > +	mm->context.skip_slb_preload =3D true;
>> > +}
>> > +
>> > +#else
>> > +
>> > +static inline void skip_slb_preload_mm(struct mm_struct *mm) {}
>> > +
>> > +#endif /* CONFIG_PPC_BOOK3S_64 */
>> > +
>> >  #include <asm-generic/mmu_context.h>
>> > =20
>> >  #endif /* __KERNEL__ */
>> > diff --git a/arch/powerpc/mm/book3s64/mmu_context.c b/arch/powerpc/mm/=
book3s64/mmu_context.c
>> > index c10fc8a72fb37..3479910264c59 100644
>> > --- a/arch/powerpc/mm/book3s64/mmu_context.c
>> > +++ b/arch/powerpc/mm/book3s64/mmu_context.c
>> > @@ -202,6 +202,8 @@ int init_new_context(struct task_struct *tsk, stru=
ct mm_struct *mm)
>> >  	atomic_set(&mm->context.active_cpus, 0);
>> >  	atomic_set(&mm->context.copros, 0);
>> > =20
>> > +	mm->context.skip_slb_preload =3D false;
>> > +
>> >  	return 0;
>> >  }
>> > =20
>> > diff --git a/arch/powerpc/mm/book3s64/slb.c b/arch/powerpc/mm/book3s64=
/slb.c
>> > index c91bd85eb90e3..da0836cb855af 100644
>> > --- a/arch/powerpc/mm/book3s64/slb.c
>> > +++ b/arch/powerpc/mm/book3s64/slb.c
>> > @@ -441,10 +441,39 @@ static void slb_cache_slbie_user(unsigned int in=
dex)
>> >  	asm volatile("slbie %0" : : "r" (slbie_data));
>> >  }
>> > =20
>> > +static void preload_slb_entries(struct task_struct *tsk, struct mm_st=
ruct *mm)
>> Should this be explicitly inline or even __always_inline? I'm thinking
>> switch_slb is probably a fairly hot path on hash?
>=20
> Yes absolutely. I'll make this change in v5.
>=20
>>
>> > +{
>> > +	struct thread_info *ti =3D task_thread_info(tsk);
>> > +	unsigned char i;
>> > +
>> > +	/*
>> > +	 * We gradually age out SLBs after a number of context switches to
>> > +	 * reduce reload overhead of unused entries (like we do with FP/VEC
>> > +	 * reload). Each time we wrap 256 switches, take an entry out of the
>> > +	 * SLB preload cache.
>> > +	 */
>> > +	tsk->thread.load_slb++;
>> > +	if (!tsk->thread.load_slb) {
>> > +		unsigned long pc =3D KSTK_EIP(tsk);
>> > +
>> > +		preload_age(ti);
>> > +		preload_add(ti, pc);
>> > +	}
>> > +
>> > +	for (i =3D 0; i < ti->slb_preload_nr; i++) {
>> > +		unsigned char idx;
>> > +		unsigned long ea;
>> > +
>> > +		idx =3D (ti->slb_preload_tail + i) % SLB_PRELOAD_NR;
>> > +		ea =3D (unsigned long)ti->slb_preload_esid[idx] << SID_SHIFT;
>> > +
>> > +		slb_allocate_user(mm, ea);
>> > +	}
>> > +}
>> > +
>> >  /* Flush all user entries from the segment table of the current proce=
ssor. */
>> >  void switch_slb(struct task_struct *tsk, struct mm_struct *mm)
>> >  {
>> > -	struct thread_info *ti =3D task_thread_info(tsk);
>> >  	unsigned char i;
>> > =20
>> >  	/*
>> > @@ -502,29 +531,8 @@ void switch_slb(struct task_struct *tsk, struct m=
m_struct *mm)
>> > =20
>> >  	copy_mm_to_paca(mm);
>> > =20
>> > -	/*
>> > -	 * We gradually age out SLBs after a number of context switches to
>> > -	 * reduce reload overhead of unused entries (like we do with FP/VEC
>> > -	 * reload). Each time we wrap 256 switches, take an entry out of the
>> > -	 * SLB preload cache.
>> > -	 */
>> > -	tsk->thread.load_slb++;
>> > -	if (!tsk->thread.load_slb) {
>> > -		unsigned long pc =3D KSTK_EIP(tsk);
>> > -
>> > -		preload_age(ti);
>> > -		preload_add(ti, pc);
>> > -	}
>> > -
>> > -	for (i =3D 0; i < ti->slb_preload_nr; i++) {
>> > -		unsigned char idx;
>> > -		unsigned long ea;
>> > -
>> > -		idx =3D (ti->slb_preload_tail + i) % SLB_PRELOAD_NR;
>> > -		ea =3D (unsigned long)ti->slb_preload_esid[idx] << SID_SHIFT;
>> > -
>> > -		slb_allocate_user(mm, ea);
>> > -	}
>> > +	if (!mm->context.skip_slb_preload)
>> > +		preload_slb_entries(tsk, mm);
>>
>> Should this be wrapped in likely()?
>=20
> Seems like a good idea - yes.
>=20
>>
>> > =20
>> >  	/*
>> >  	 * Synchronize slbmte preloads with possible subsequent user memory
>>
>> Right below this comment is the isync. It seems to be specifically
>> concerned with synchronising preloaded slbs. Do you need it if you are
>> skipping SLB preloads?
>>
>> It's probably not a big deal to have an extra isync in the fairly rare
>> path when we're skipping preloads, but I thought I'd check.
>=20
> I don't _think_ we need the `isync` if we are skipping the SLB preloads,
> but then again it was always in the code-path before. If someone can
> make a compelling argument to drop it when not preloading SLBs I will,
> otherwise (considering some of the other non-obvious things I stepped
> into with the Hash code) I will keep it here for now.

The ISA says slbia wants an isync afterward, so we probably should keep=20
it. The comment is a bit misleading in that case.

Why isn't preloading appropriate for a temporary mm?=20

Thanks,
Nick
