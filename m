Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EA16D3C4155
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Jul 2021 04:51:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GNSvL5r5cz3bX0
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Jul 2021 12:51:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=peHg2NZY;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102d;
 helo=mail-pj1-x102d.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=peHg2NZY; dkim-atps=neutral
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GNStt0HS2z2yXX
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Jul 2021 12:50:45 +1000 (AEST)
Received: by mail-pj1-x102d.google.com with SMTP id
 d9-20020a17090ae289b0290172f971883bso11296158pjz.1
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 11 Jul 2021 19:50:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=w2r4qfv5vAYJ00NUqIGFvURWuXmn7VNm7e5xDqKTB40=;
 b=peHg2NZYicXl7JUKveOTepsa2bfhyjmB2JQE0hW9wkOmsUl933a9C0q2v7O6jLtBbE
 V/hTspmlE9CvELtFH2zhZPBQxafCjsu3yjh7G2YL/ikow9cuUl+NiwMjpdELfGhjb1Lt
 1pvNKDa2evs8wYVWo+FA/4p7yLhI60nZjAcYf8G3MudWU4XciPBWUnV+EXC6eGg02f9p
 NMM1eR4X7ihRox92tW8AveGdHUq5OPFaU+80UNZ32B65kysP3ANu600CtC2S7qY4aa3M
 V2sDwWadsl6ORLOuDfKxdydFmKur6d3x8UWTCdVmGttwli3k55fo6PuiZ1Odq0Ci7kuI
 1hwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=w2r4qfv5vAYJ00NUqIGFvURWuXmn7VNm7e5xDqKTB40=;
 b=bajdR0j8Xg7KFrZHU5LLVE1Q8vsQSUWcqA9VzF0QLNPa7akR9oBiPRFqRNlzdUV7cP
 fea2Af1+XO/iC1ypNjwUjXwBfRotbUJjrgJOuYEk1Pb0inMwIyjOQfbt6Vva7wHJRrpz
 0m/U1yuXk0m+dZz8oDd9+nhiaWRHNpc2hsWsuts2SGXNUcXTWo0OFUdlBGXl70uxvMqf
 fd+0eMMELf3IwSdyQpnXdtQF8/rZroPq0XkNrYKoRtR0VtCSTQBpspx4ANs9my2i7Xfu
 fAU5BQ73CIqW+Zph2zz+kyR1/ZLwFEJzy4gDMSouh8+Y+pxrbMKJtl4h2Gm/Qp4T2cZg
 Yufg==
X-Gm-Message-State: AOAM5305M9l8SsVuAzI+2XqUPawvjzeP0yrOlxluTfNx+UgX7KQ4KRBW
 lx2A10YxtfOds/7Z4LTZ4ww=
X-Google-Smtp-Source: ABdhPJx8vYHuMpqABVE2A8PY2LXzGVCyvJikwfxTgN5gLhmU21scm0Rou6G7ltnJo7pMYtthEp3pXg==
X-Received: by 2002:a17:90b:384f:: with SMTP id
 nl15mr51537121pjb.88.1626058243048; 
 Sun, 11 Jul 2021 19:50:43 -0700 (PDT)
Received: from localhost (203-219-181-43.static.tpgi.com.au. [203.219.181.43])
 by smtp.gmail.com with ESMTPSA id
 t1sm11565859pjo.33.2021.07.11.19.50.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Jul 2021 19:50:42 -0700 (PDT)
Date: Mon, 12 Jul 2021 12:50:37 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [RFC PATCH 27/43] KVM: PPC: Book3S HV P9: Move host OS
 save/restore functions to built-in
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
References: <20210622105736.633352-1-npiggin@gmail.com>
 <20210622105736.633352-28-npiggin@gmail.com>
 <983C1FE6-79CB-4DBD-BD00-8CFDA3685FEB@linux.vnet.ibm.com>
In-Reply-To: <983C1FE6-79CB-4DBD-BD00-8CFDA3685FEB@linux.vnet.ibm.com>
MIME-Version: 1.0
Message-Id: <1626058210.6twtrgfync.astroid@bobo.none>
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
Cc: linuxppc-dev@lists.ozlabs.org, kvm-ppc@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Athira Rajeev's message of July 8, 2021 3:32 pm:
>=20
>=20
>> On 22-Jun-2021, at 4:27 PM, Nicholas Piggin <npiggin@gmail.com> wrote:
>>=20
>> Move the P9 guest/host register switching functions to the built-in
>> P9 entry code, and export it for nested to use as well.
>>=20
>> This allows more flexibility in scheduling these supervisor privileged
>> SPR accesses with the HV privileged and PR SPR accesses in the low level
>> entry code.
>>=20
>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>> ---
>> arch/powerpc/kvm/book3s_hv.c          | 351 +-------------------------
>> arch/powerpc/kvm/book3s_hv.h          |  39 +++
>> arch/powerpc/kvm/book3s_hv_p9_entry.c | 332 ++++++++++++++++++++++++
>> 3 files changed, 372 insertions(+), 350 deletions(-)
>> create mode 100644 arch/powerpc/kvm/book3s_hv.h
>>=20
>> diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
>> index 35749b0b663f..a7660af22161 100644
>> --- a/arch/powerpc/kvm/book3s_hv.c
>> +++ b/arch/powerpc/kvm/book3s_hv.c
>> @@ -79,6 +79,7 @@
>> #include <asm/dtl.h>
>>=20
>> #include "book3s.h"
>> +#include "book3s_hv.h"
>>=20
>> #define CREATE_TRACE_POINTS
>> #include "trace_hv.h"
>> @@ -3675,356 +3676,6 @@ static noinline void kvmppc_run_core(struct kvmp=
pc_vcore *vc)
>> 	trace_kvmppc_run_core(vc, 1);
>> }
>>=20
>> -/*
>> - * Privileged (non-hypervisor) host registers to save.
>> - */
>> -struct p9_host_os_sprs {
>> -	unsigned long dscr;
>> -	unsigned long tidr;
>> -	unsigned long iamr;
>> -	unsigned long amr;
>> -	unsigned long fscr;
>> -
>> -	unsigned int pmc1;
>> -	unsigned int pmc2;
>> -	unsigned int pmc3;
>> -	unsigned int pmc4;
>> -	unsigned int pmc5;
>> -	unsigned int pmc6;
>> -	unsigned long mmcr0;
>> -	unsigned long mmcr1;
>> -	unsigned long mmcr2;
>> -	unsigned long mmcr3;
>> -	unsigned long mmcra;
>> -	unsigned long siar;
>> -	unsigned long sier1;
>> -	unsigned long sier2;
>> -	unsigned long sier3;
>> -	unsigned long sdar;
>> -};
>> -
>> -static void freeze_pmu(unsigned long mmcr0, unsigned long mmcra)
>> -{
>> -	if (!(mmcr0 & MMCR0_FC))
>> -		goto do_freeze;
>> -	if (mmcra & MMCRA_SAMPLE_ENABLE)
>> -		goto do_freeze;
>> -	if (cpu_has_feature(CPU_FTR_ARCH_31)) {
>> -		if (!(mmcr0 & MMCR0_PMCCEXT))
>> -			goto do_freeze;
>> -		if (!(mmcra & MMCRA_BHRB_DISABLE))
>> -			goto do_freeze;
>> -	}
>> -	return;
>> -
>> -do_freeze:
>> -	mmcr0 =3D MMCR0_FC;
>> -	mmcra =3D 0;
>> -	if (cpu_has_feature(CPU_FTR_ARCH_31)) {
>> -		mmcr0 |=3D MMCR0_PMCCEXT;
>> -		mmcra =3D MMCRA_BHRB_DISABLE;
>> -	}
>> -
>> -	mtspr(SPRN_MMCR0, mmcr0);
>> -	mtspr(SPRN_MMCRA, mmcra);
>> -	isync();
>> -}
>> -
>> -static void switch_pmu_to_guest(struct kvm_vcpu *vcpu,
>> -				struct p9_host_os_sprs *host_os_sprs)
>> -{
>> -	struct lppaca *lp;
>> -	int load_pmu =3D 1;
>> -
>> -	lp =3D vcpu->arch.vpa.pinned_addr;
>> -	if (lp)
>> -		load_pmu =3D lp->pmcregs_in_use;
>> -
>> -	if (load_pmu)
>> -	      vcpu->arch.hfscr |=3D HFSCR_PM;
>> -
>> -	/* Save host */
>> -	if (ppc_get_pmu_inuse()) {
>> -		/*
>> -		 * It might be better to put PMU handling (at least for the
>> -		 * host) in the perf subsystem because it knows more about what
>> -		 * is being used.
>> -		 */
>> -
>> -		/* POWER9, POWER10 do not implement HPMC or SPMC */
>> -
>> -		host_os_sprs->mmcr0 =3D mfspr(SPRN_MMCR0);
>> -		host_os_sprs->mmcra =3D mfspr(SPRN_MMCRA);
>> -
>> -		freeze_pmu(host_os_sprs->mmcr0, host_os_sprs->mmcra);
>> -
>> -		host_os_sprs->pmc1 =3D mfspr(SPRN_PMC1);
>> -		host_os_sprs->pmc2 =3D mfspr(SPRN_PMC2);
>> -		host_os_sprs->pmc3 =3D mfspr(SPRN_PMC3);
>> -		host_os_sprs->pmc4 =3D mfspr(SPRN_PMC4);
>> -		host_os_sprs->pmc5 =3D mfspr(SPRN_PMC5);
>> -		host_os_sprs->pmc6 =3D mfspr(SPRN_PMC6);
>> -		host_os_sprs->mmcr1 =3D mfspr(SPRN_MMCR1);
>> -		host_os_sprs->mmcr2 =3D mfspr(SPRN_MMCR2);
>> -		host_os_sprs->sdar =3D mfspr(SPRN_SDAR);
>> -		host_os_sprs->siar =3D mfspr(SPRN_SIAR);
>> -		host_os_sprs->sier1 =3D mfspr(SPRN_SIER);
>> -
>> -		if (cpu_has_feature(CPU_FTR_ARCH_31)) {
>> -			host_os_sprs->mmcr3 =3D mfspr(SPRN_MMCR3);
>> -			host_os_sprs->sier2 =3D mfspr(SPRN_SIER2);
>> -			host_os_sprs->sier3 =3D mfspr(SPRN_SIER3);
>> -		}
>> -	}
>> -
>> -#ifdef CONFIG_PPC_PSERIES
>> -	if (kvmhv_on_pseries()) {
>> -		if (vcpu->arch.vpa.pinned_addr) {
>> -			struct lppaca *lp =3D vcpu->arch.vpa.pinned_addr;
>> -			get_lppaca()->pmcregs_in_use =3D lp->pmcregs_in_use;
>> -		} else {
>> -			get_lppaca()->pmcregs_in_use =3D 1;
>> -		}
>> -	}
>> -#endif
>> -
>> -	/* Load guest */
>> -	if (vcpu->arch.hfscr & HFSCR_PM) {
>> -		mtspr(SPRN_PMC1, vcpu->arch.pmc[0]);
>> -		mtspr(SPRN_PMC2, vcpu->arch.pmc[1]);
>> -		mtspr(SPRN_PMC3, vcpu->arch.pmc[2]);
>> -		mtspr(SPRN_PMC4, vcpu->arch.pmc[3]);
>> -		mtspr(SPRN_PMC5, vcpu->arch.pmc[4]);
>> -		mtspr(SPRN_PMC6, vcpu->arch.pmc[5]);
>> -		mtspr(SPRN_MMCR1, vcpu->arch.mmcr[1]);
>> -		mtspr(SPRN_MMCR2, vcpu->arch.mmcr[2]);
>> -		mtspr(SPRN_SDAR, vcpu->arch.sdar);
>> -		mtspr(SPRN_SIAR, vcpu->arch.siar);
>> -		mtspr(SPRN_SIER, vcpu->arch.sier[0]);
>> -
>> -		if (cpu_has_feature(CPU_FTR_ARCH_31)) {
>> -			mtspr(SPRN_MMCR3, vcpu->arch.mmcr[4]);
>=20
>=20
> Hi Nick,
>=20
> Have a doubt here..
> For MMCR3, it is  vcpu->arch.mmcr[3) ?

Hey, yea it is you're right. Good catch.

Thanks,
Nick

