Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3444F32D189
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Mar 2021 12:04:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Drp0z1Z5Fz3dGx
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Mar 2021 22:04:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=jPGpa4By;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::531;
 helo=mail-pg1-x531.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=jPGpa4By; dkim-atps=neutral
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com
 [IPv6:2607:f8b0:4864:20::531])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Drp0Z6H36z3cZ5
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Mar 2021 22:04:30 +1100 (AEDT)
Received: by mail-pg1-x531.google.com with SMTP id a4so18655222pgc.11
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 04 Mar 2021 03:04:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=XCyHkCIKclR0Z1S9ufGldSQduqOpwvCwqtLN206dFsY=;
 b=jPGpa4ByAGp91jlMnb0siOIuP8aiPlVHUEjEGjb+RRPiGDmD6XFjsKovBAe3epfH0I
 mh/PftsT9APuw3MuRFBy/AyxFf3fmN6vjICdvD8s9yyJJ5Rpe+HYNW+a6G48Mlp47RY1
 W1H/VF2SwCB69V8t/NeKnsgMY1Hjov5DyG7VAM1U8oj/gf2f8snkByDWKJNNX193QBYx
 mlEEGsp5bY7Uc8aLrZz2buNCKVEg2VtUPg4+Gcg3lDjCEWfCMQHeMgg7zayTvxnSgHpR
 DIVUVGGb4FHr276TWId7muBGHgnwVh4H8PqS77g0UyWY6mJOly5MWuEOQ6MQuEydu2ge
 abCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=XCyHkCIKclR0Z1S9ufGldSQduqOpwvCwqtLN206dFsY=;
 b=TrvRIjlZCn5O6zh7bEkjuG7AQhGCJrSR+D5WcjIBZktAIJXp1Y/owTCU/HAgP+QuFF
 bPqnYPtYMCx5sj08R4v+r+P/HgiB41e6ELP1rgOdHqCX++88BX0t3Wbm6rb2be80Nsr9
 5wW4NrYRj3rSdFU+3lRCQZ2NAfIbpNbriS2eXGUwCa+OE6I/YppuSCruBhdah9FimGm8
 bFhRc/imKpTL/bxPsu+yyTAxMVF40T748OryP1CNEglJrZL4m/EybjH1difSPA26ujOC
 CSJaCIWKKOql9vXB0y8wZU9+0RB4w/UUF3tlf78ojleKT2sFrnP+aaYBgtY5m7U6JAsd
 1bGw==
X-Gm-Message-State: AOAM530n/rp9vh41tgCVauYAxKiF4YZoEbCvvIuArhYHBsdvZK9SM/UB
 ygR15OszxQP22zsfX8duxU9pD7ggDBA=
X-Google-Smtp-Source: ABdhPJwVZUk/r07+KSgmxz4OpeIPwTSH3aQg6ZrkLxdGG93/BryIfJsycsasPuYW4aBdr02kUX1Hlg==
X-Received: by 2002:aa7:97a2:0:b029:1ee:b006:f1a1 with SMTP id
 d2-20020aa797a20000b02901eeb006f1a1mr3625936pfq.8.1614855867199; 
 Thu, 04 Mar 2021 03:04:27 -0800 (PST)
Received: from localhost (58-6-239-121.tpgi.com.au. [58.6.239.121])
 by smtp.gmail.com with ESMTPSA id b15sm26048577pgj.84.2021.03.04.03.04.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Mar 2021 03:04:26 -0800 (PST)
Date: Thu, 04 Mar 2021 21:04:20 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v2 30/37] KVM: PPC: Book3S HV: Implement radix prefetch
 workaround by disabling MMU
To: Fabiano Rosas <farosas@linux.ibm.com>, kvm-ppc@vger.kernel.org
References: <20210225134652.2127648-1-npiggin@gmail.com>
 <20210225134652.2127648-31-npiggin@gmail.com> <87lfb5w8t2.fsf@linux.ibm.com>
In-Reply-To: <87lfb5w8t2.fsf@linux.ibm.com>
MIME-Version: 1.0
Message-Id: <1614855773.k7it9unvzd.astroid@bobo.none>
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Fabiano Rosas's message of March 3, 2021 7:21 am:
> Nicholas Piggin <npiggin@gmail.com> writes:
>=20
>> Rather than partition the guest PID space and catch and flush a rogue
>> guest, instead work around this issue by ensuring the MMU is always
>> disabled in HV mode while the guest MMU context is switched in.
>>
>> This may be a bit less efficient, but it is a lot less complicated and
>> allows the P9 path to trivally implement the workaround too. Newer CPUs
>> are not subject to this issue.
>>
>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>> ---
>>  arch/powerpc/include/asm/mmu_context.h   |  6 ----
>>  arch/powerpc/kvm/book3s_hv.c             | 10 ++++--
>>  arch/powerpc/kvm/book3s_hv_interrupt.c   | 14 ++++++--
>>  arch/powerpc/kvm/book3s_hv_rmhandlers.S  | 34 ------------------
>>  arch/powerpc/mm/book3s64/radix_pgtable.c | 27 +++++---------
>>  arch/powerpc/mm/book3s64/radix_tlb.c     | 46 ------------------------
>>  arch/powerpc/mm/mmu_context.c            |  4 +--
>>  7 files changed, 28 insertions(+), 113 deletions(-)
>>
>> diff --git a/arch/powerpc/include/asm/mmu_context.h b/arch/powerpc/inclu=
de/asm/mmu_context.h
>> index 652ce85f9410..bb5c7e5e142e 100644
>> --- a/arch/powerpc/include/asm/mmu_context.h
>> +++ b/arch/powerpc/include/asm/mmu_context.h
>> @@ -122,12 +122,6 @@ static inline bool need_extra_context(struct mm_str=
uct *mm, unsigned long ea)
>>  }
>>  #endif
>>
>> -#if defined(CONFIG_KVM_BOOK3S_HV_POSSIBLE) && defined(CONFIG_PPC_RADIX_=
MMU)
>> -extern void radix_kvm_prefetch_workaround(struct mm_struct *mm);
>> -#else
>> -static inline void radix_kvm_prefetch_workaround(struct mm_struct *mm) =
{ }
>> -#endif
>> -
>>  extern void switch_cop(struct mm_struct *next);
>>  extern int use_cop(unsigned long acop, struct mm_struct *mm);
>>  extern void drop_cop(unsigned long acop, struct mm_struct *mm);
>> diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
>> index ad16331c3370..c3064075f1d7 100644
>> --- a/arch/powerpc/kvm/book3s_hv.c
>> +++ b/arch/powerpc/kvm/book3s_hv.c
>> @@ -806,6 +806,10 @@ static int kvmppc_h_set_mode(struct kvm_vcpu *vcpu,=
 unsigned long mflags,
>>  		/* KVM does not support mflags=3D2 (AIL=3D2) */
>>  		if (mflags !=3D 0 && mflags !=3D 3)
>>  			return H_UNSUPPORTED_FLAG_START;
>> +		/* Prefetch bug */
>> +		if (cpu_has_feature(CPU_FTR_P9_RADIX_PREFETCH_BUG) &&
>> +				kvmhv_vcpu_is_radix(vcpu) && mflags =3D=3D 3)
>> +			return H_UNSUPPORTED_FLAG_START;
>=20
> So does this mean that if the host has the prefetch bug, all of its
> guests will run with AIL=3D0 all the time?

All radix guests will, yes.

> And what we're avoiding here is
> a guest setting AIL=3D3 which would (since there's no HAIL) cause
> hypervisor interrupts to be taken with MMU on, is that it?

Yes that's right.

> Do we need to add this verification to kvmppc_set_lpcr as well? QEMU
> could in theory call the KVM_SET_ONE_REG ioctl and set AIL to any value.

Yeah I guess so. We don't restrict other AIL values there by the looks
but maybe we should.

Thanks,
Nick
