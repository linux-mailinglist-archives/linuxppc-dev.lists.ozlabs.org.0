Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A43233BFAC1
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Jul 2021 14:57:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GLGXr2qwXz3blm
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Jul 2021 22:57:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=MQAwU+Nj;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42c;
 helo=mail-pf1-x42c.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=MQAwU+Nj; dkim-atps=neutral
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com
 [IPv6:2607:f8b0:4864:20::42c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GLGXL4W9Bz2ymb
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Jul 2021 22:57:05 +1000 (AEST)
Received: by mail-pf1-x42c.google.com with SMTP id d12so5389613pfj.2
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 08 Jul 2021 05:57:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=W5HxMER8hb4dLNB9ENuzMhUkc9v3oqs/gPiw+4JCqB0=;
 b=MQAwU+Njs+CKb2Y/oUnmTybxbJUIYHctuFZm6/MOU9xR3X4wH200/i6edEIt0EgOIQ
 erz38IfDYj5Md5n68FEowyhFh4oyN/nrYRDzwcuAKWalM5em9aLb+jS0A60UC/+oj1CA
 Z3rHn38xJgLNQbstZC7T03+1JZAjtMMNr8fLNgQNrAPZcPaw6dM9A00X3Q8VpGb+rZs+
 pw/tsQi/VbZ7pYFN5M0bGPBlf7OjiEV+eXLnbAPRN8JiKwDJq37TwseJGSc07wiA1TQQ
 1RIIQ91aPC/PmhCjV4iV91RlQ44+cm89qGGcdvtgYRkF9IBVHZHLSMeY7y9/mH/uUr/3
 kT9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=W5HxMER8hb4dLNB9ENuzMhUkc9v3oqs/gPiw+4JCqB0=;
 b=jSyDun8PuueGcIr5ZTjpaGkXnB1zGDMPjxLr+L8YhDYm4sYy6X+VBFPCSpqsjZ3x6e
 aDFfry+6euojBVrEj/nNDegJZpUD8/PMSw72uFuKZj+blIurNZAcnvLFIQgVChoN2neC
 0O1W1hLXsgyPKpAUs7uefTYtUp31/E8NOzEIHuLM3nQOJcJXzf5WWW4QMiKnDTdEhLTl
 0RhhFthVBcDfRMWDJxcmM2g2cjvzNhfICVJu33ip7+jrbDFUQnIF895YRjKj4e6stXJg
 dq5BpewuL0ztcRRnMsTy583ymue5RcjWhorxSdh2DhxFevE5Z/OE47eBfMo9Hxbgx7Bg
 gFYA==
X-Gm-Message-State: AOAM530KT78Geu2hPUGX9qK7MXBJk2U585Dr1/4OrgtcW0Byd5B2lxMQ
 k9IGh/J6LbaSOYAzr6HHKwE=
X-Google-Smtp-Source: ABdhPJwU7reWPRYqgm76lH27UoBIzNe66f1QtpAyb4K2hBhq9A37nbVHM+28mHsuE90mN5BjvGmSIw==
X-Received: by 2002:a63:4e42:: with SMTP id o2mr32295510pgl.49.1625749022644; 
 Thu, 08 Jul 2021 05:57:02 -0700 (PDT)
Received: from localhost (14-203-186-173.tpgi.com.au. [14.203.186.173])
 by smtp.gmail.com with ESMTPSA id j23sm3103816pfd.12.2021.07.08.05.57.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 05:57:02 -0700 (PDT)
Date: Thu, 08 Jul 2021 22:56:57 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH] powerpc/perf: Fix cycles/instructions as
 PM_CYC/PM_INST_CMPL in power10
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>, mpe@ellerman.id.au
References: <1625639981-1424-1-git-send-email-atrajeev@linux.vnet.ibm.com>
In-Reply-To: <1625639981-1424-1-git-send-email-atrajeev@linux.vnet.ibm.com>
MIME-Version: 1.0
Message-Id: <1625748771.problnjoqz.astroid@bobo.none>
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
Cc: maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Athira Rajeev's message of July 7, 2021 4:39 pm:
> From: Athira Rajeev <atrajeev@linux.vnet.ibm.cm>
>=20
> Power10 performance monitoring unit (PMU) driver uses performance
> monitor counter 5 (PMC5) and performance monitor counter 6 (PMC6)
> for counting instructions and cycles. Event used for cycles is
> PM_RUN_CYC and instructions is PM_RUN_INST_CMPL. But counting of these
> events in wait state is controlled by the CC56RUN bit setting in
> Monitor Mode Control Register0 (MMCR0). If the CC56RUN bit is not
> set, PMC5/6 will not count when CTRL[RUN] is zero.

What's the acutal bug here, can you explain a bit more? I thought
PM_RUN_CYC is supposed to be gated by the runlatch.

POWER9 code looks similar, it doesn't have the same problem?

Thanks,
Nick

>=20
> Patch sets the CC56RUN bit in MMCR0 for power10 which makes PMC5 and
> PMC6 count instructions and cycles regardless of the run bit. With this
> change, these events are also now renamed to PM_CYC and PM_INST_CMPL
> rather than PM_RUN_CYC and PM_RUN_INST_CMPL.
>=20
> Fixes: a64e697cef23 ("powerpc/perf: power10 Performance Monitoring suppor=
t")
> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.cm>
> Reviewed-by: Madhavan Srinivasan <maddy@linux.ibm.com>
> ---
> Notes on testing done for this change:
>  Tested this patch change with a kernel module that
>  turns off and turns on the runlatch. kernel module also
>  reads the counter values for PMC5 and PMC6 during the
>  period when runlatch is off.
>  - Started PMU counters via "perf stat" and loaded the
>    test module.
>  - Checked the counter values captured from module during
>    the runlatch off period.
>  - Verified that counters were frozen without the patch and
>    with the patch, observed counters were incrementing.
>=20
>  arch/powerpc/perf/power10-events-list.h |  8 +++---
>  arch/powerpc/perf/power10-pmu.c         | 44 +++++++++++++++++++++++----=
------
>  2 files changed, 35 insertions(+), 17 deletions(-)
>=20
> diff --git a/arch/powerpc/perf/power10-events-list.h b/arch/powerpc/perf/=
power10-events-list.h
> index 93be719..564f1409 100644
> --- a/arch/powerpc/perf/power10-events-list.h
> +++ b/arch/powerpc/perf/power10-events-list.h
> @@ -9,10 +9,10 @@
>  /*
>   * Power10 event codes.
>   */
> -EVENT(PM_RUN_CYC,				0x600f4);
> +EVENT(PM_CYC,				0x600f4);
>  EVENT(PM_DISP_STALL_CYC,			0x100f8);
>  EVENT(PM_EXEC_STALL,				0x30008);
> -EVENT(PM_RUN_INST_CMPL,				0x500fa);
> +EVENT(PM_INST_CMPL,				0x500fa);
>  EVENT(PM_BR_CMPL,                               0x4d05e);
>  EVENT(PM_BR_MPRED_CMPL,                         0x400f6);
>  EVENT(PM_BR_FIN,				0x2f04a);
> @@ -50,8 +50,8 @@
>  /* ITLB Reloaded */
>  EVENT(PM_ITLB_MISS,				0x400fc);
> =20
> -EVENT(PM_RUN_CYC_ALT,				0x0001e);
> -EVENT(PM_RUN_INST_CMPL_ALT,			0x00002);
> +EVENT(PM_CYC_ALT,				0x0001e);
> +EVENT(PM_INST_CMPL_ALT,				0x00002);
> =20
>  /*
>   * Memory Access Events
> diff --git a/arch/powerpc/perf/power10-pmu.c b/arch/powerpc/perf/power10-=
pmu.c
> index f9d64c6..9dd75f3 100644
> --- a/arch/powerpc/perf/power10-pmu.c
> +++ b/arch/powerpc/perf/power10-pmu.c
> @@ -91,8 +91,8 @@
> =20
>  /* Table of alternatives, sorted by column 0 */
>  static const unsigned int power10_event_alternatives[][MAX_ALT] =3D {
> -	{ PM_RUN_CYC_ALT,		PM_RUN_CYC },
> -	{ PM_RUN_INST_CMPL_ALT,		PM_RUN_INST_CMPL },
> +	{ PM_CYC_ALT,			PM_CYC },
> +	{ PM_INST_CMPL_ALT,		PM_INST_CMPL },
>  };
> =20
>  static int power10_get_alternatives(u64 event, unsigned int flags, u64 a=
lt[])
> @@ -118,8 +118,8 @@ static int power10_check_attr_config(struct perf_even=
t *ev)
>  	return 0;
>  }
> =20
> -GENERIC_EVENT_ATTR(cpu-cycles,			PM_RUN_CYC);
> -GENERIC_EVENT_ATTR(instructions,		PM_RUN_INST_CMPL);
> +GENERIC_EVENT_ATTR(cpu-cycles,			PM_CYC);
> +GENERIC_EVENT_ATTR(instructions,		PM_INST_CMPL);
>  GENERIC_EVENT_ATTR(branch-instructions,		PM_BR_CMPL);
>  GENERIC_EVENT_ATTR(branch-misses,		PM_BR_MPRED_CMPL);
>  GENERIC_EVENT_ATTR(cache-references,		PM_LD_REF_L1);
> @@ -148,8 +148,8 @@ static int power10_check_attr_config(struct perf_even=
t *ev)
>  CACHE_EVENT_ATTR(iTLB-load-misses,		PM_ITLB_MISS);
> =20
>  static struct attribute *power10_events_attr_dd1[] =3D {
> -	GENERIC_EVENT_PTR(PM_RUN_CYC),
> -	GENERIC_EVENT_PTR(PM_RUN_INST_CMPL),
> +	GENERIC_EVENT_PTR(PM_CYC),
> +	GENERIC_EVENT_PTR(PM_INST_CMPL),
>  	GENERIC_EVENT_PTR(PM_BR_CMPL),
>  	GENERIC_EVENT_PTR(PM_BR_MPRED_CMPL),
>  	GENERIC_EVENT_PTR(PM_LD_REF_L1),
> @@ -173,8 +173,8 @@ static int power10_check_attr_config(struct perf_even=
t *ev)
>  };
> =20
>  static struct attribute *power10_events_attr[] =3D {
> -	GENERIC_EVENT_PTR(PM_RUN_CYC),
> -	GENERIC_EVENT_PTR(PM_RUN_INST_CMPL),
> +	GENERIC_EVENT_PTR(PM_CYC),
> +	GENERIC_EVENT_PTR(PM_INST_CMPL),
>  	GENERIC_EVENT_PTR(PM_BR_FIN),
>  	GENERIC_EVENT_PTR(PM_MPRED_BR_FIN),
>  	GENERIC_EVENT_PTR(PM_LD_REF_L1),
> @@ -271,8 +271,8 @@ static int power10_check_attr_config(struct perf_even=
t *ev)
>  };
> =20
>  static int power10_generic_events_dd1[] =3D {
> -	[PERF_COUNT_HW_CPU_CYCLES] =3D			PM_RUN_CYC,
> -	[PERF_COUNT_HW_INSTRUCTIONS] =3D			PM_RUN_INST_CMPL,
> +	[PERF_COUNT_HW_CPU_CYCLES] =3D			PM_CYC,
> +	[PERF_COUNT_HW_INSTRUCTIONS] =3D			PM_INST_CMPL,
>  	[PERF_COUNT_HW_BRANCH_INSTRUCTIONS] =3D		PM_BR_CMPL,
>  	[PERF_COUNT_HW_BRANCH_MISSES] =3D			PM_BR_MPRED_CMPL,
>  	[PERF_COUNT_HW_CACHE_REFERENCES] =3D		PM_LD_REF_L1,
> @@ -280,8 +280,8 @@ static int power10_check_attr_config(struct perf_even=
t *ev)
>  };
> =20
>  static int power10_generic_events[] =3D {
> -	[PERF_COUNT_HW_CPU_CYCLES] =3D			PM_RUN_CYC,
> -	[PERF_COUNT_HW_INSTRUCTIONS] =3D			PM_RUN_INST_CMPL,
> +	[PERF_COUNT_HW_CPU_CYCLES] =3D			PM_CYC,
> +	[PERF_COUNT_HW_INSTRUCTIONS] =3D			PM_INST_CMPL,
>  	[PERF_COUNT_HW_BRANCH_INSTRUCTIONS] =3D		PM_BR_FIN,
>  	[PERF_COUNT_HW_BRANCH_MISSES] =3D			PM_MPRED_BR_FIN,
>  	[PERF_COUNT_HW_CACHE_REFERENCES] =3D		PM_LD_REF_L1,
> @@ -548,6 +548,24 @@ static void power10_config_bhrb(u64 pmu_bhrb_filter)
> =20
>  #undef C
> =20
> +/*
> + * Set the MMCR0[CC56RUN] bit to enable counting for
> + * PMC5 and PMC6 regardless of the state of CTRL[RUN],
> + * so that we can use counters 5 and 6 as PM_INST_CMPL and
> + * PM_CYC.
> + */
> +static int power10_compute_mmcr(u64 event[], int n_ev,
> +				unsigned int hwc[], struct mmcr_regs *mmcr,
> +				struct perf_event *pevents[], u32 flags)
> +{
> +	int ret;
> +
> +	ret =3D isa207_compute_mmcr(event, n_ev, hwc, mmcr, pevents, flags);
> +	if (!ret)
> +		mmcr->mmcr0 |=3D MMCR0_C56RUN;
> +	return ret;
> +}
> +
>  static struct power_pmu power10_pmu =3D {
>  	.name			=3D "POWER10",
>  	.n_counter		=3D MAX_PMU_COUNTERS,
> @@ -555,7 +573,7 @@ static void power10_config_bhrb(u64 pmu_bhrb_filter)
>  	.test_adder		=3D ISA207_TEST_ADDER,
>  	.group_constraint_mask	=3D CNST_CACHE_PMC4_MASK,
>  	.group_constraint_val	=3D CNST_CACHE_PMC4_VAL,
> -	.compute_mmcr		=3D isa207_compute_mmcr,
> +	.compute_mmcr		=3D power10_compute_mmcr,
>  	.config_bhrb		=3D power10_config_bhrb,
>  	.bhrb_filter_map	=3D power10_bhrb_filter_map,
>  	.get_constraint		=3D isa207_get_constraint,
> --=20
> 1.8.3.1
>=20
>=20
