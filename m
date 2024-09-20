Return-Path: <linuxppc-dev+bounces-1484-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F43997D0D3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Sep 2024 07:05:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X90gz5GfGz2xnX;
	Fri, 20 Sep 2024 15:05:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726808719;
	cv=none; b=FifS8KjGLzMgnUcGx+1yp24UDV1Of7bwdOo84OfcrIF/whURZUmiJy+KW3GmuS6lCuqEJdSU+R+mWYtt0AlJ0RfP4OUwioyAaeNtYk6OieKr2UpsuFciH7EvaUd+VWlQn/GuWkevDZmEtCQ+QjXA/CQhShes+eBC0iTCip7OnN67OfjKYw3tRA+CvUH6J9xIny7YZFzoupj6MYUroWzwMkqCdQg5HVNytaKdvIey5mM6txToSoNiEJwSawEuSWWJ+SjXKe8a08HIp0ACg8MsnenWsYS6t2R+Vi6A7Y0JAAx72GgyXxj7DCwGdc/SLDMqRPITqFxL8uW1kh5eX/rJvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726808719; c=relaxed/relaxed;
	bh=L7txuy2RpUW0+CVay7TizTXlbd4oklBB9HaaTNLp0ho=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=cU4AJOpKEhsXhvr5r3hERoyktZMeaVPfnTefsFRA4lGP+VQw2Z8DpYDVVsb7nY/fIH/875f8eqaSNeBNmHYIld6gq7PtESyQL9AUpXpJT9Q/0TsXrP0PudRnzJECT2mgndGJqtoLy2hq+Ztqvto+fcnqBS7Q57YJKlPG/KZKfMtHNaavN3SNc18FgiT+RhvfxiCTgd+TPvWnCDtVpJwnIroGMk7+QpSFBaQiJsPCIzqoplHlx1Jw5I85IC5mKTHDKyis65D9WK+KhruSchiDQKdNqTLsPa5JRlmQJ3UndJKsG6XzC9UXoD5wivC2Tdf4eVY9Flem41frYNKDpLNbLA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=gVSozvLI; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=gVSozvLI;
	dkim-atps=neutral
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X90gz3dRKz2xnM
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Sep 2024 15:05:19 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1726808719;
	bh=L7txuy2RpUW0+CVay7TizTXlbd4oklBB9HaaTNLp0ho=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=gVSozvLIqcb2v8T+6JCtdRgifxeejKw3DmUpZCY+OYciHmhhoDqM4Kf+YROgzQw7x
	 Zis+/qGlI2JJ5fsNyE+id7VBnY3VWIVboFPv3OvsIdL2cDm4dMX3xXn2G51rMFaUp9
	 3d1euZTNllxQ78giFBUSOiUq+FOsB/65cr1u824bUbofh4urIAZVO2+PMOZVjYv3FU
	 nnk45Rzh+hKsgayBDCX4Jq0KGJlfPh+SLu/VAiIXrDoNBkrbv3bQjc1N2oyTGCAx/r
	 +8qTP6hJeAr+wFkD0NGZDUmxkfn7xn/manNykiRxjEC6gB9QAOa7tnb1uDBQuk4r25
	 hSMkrt7TLyavw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4X90gx633Yz4xPy;
	Fri, 20 Sep 2024 15:05:17 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Markus Elfring <Markus.Elfring@web.de>, linuxppc-dev@lists.ozlabs.org,
 Anjali K <anjalik@linux.ibm.com>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Kan Liang <kan.liang@linux.intel.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>, Naveen N Rao
 <naveen@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, Peter Zijlstra
 <peterz@infradead.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Julia Lawall <julia.lawall@inria.fr>
Subject: Re: [PATCH] powerpc/perf: Use guard(irqsave)() in eight functions
In-Reply-To: <096fc4ee-8ffe-4eb6-88f8-28dc944b079f@web.de>
References: <096fc4ee-8ffe-4eb6-88f8-28dc944b079f@web.de>
Date: Fri, 20 Sep 2024 15:05:17 +1000
Message-ID: <871q1eoqya.fsf@mail.lhotse>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Markus Elfring <Markus.Elfring@web.de> writes:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Mon, 16 Sep 2024 19:25:00 +0200
>
> Scope-based resource management became supported for some
> programming interfaces by contributions of Peter Zijlstra on 2023-05-26.
> See also the commit 54da6a0924311c7cf5015533991e44fb8eb12773 ("locking:
> Introduce __cleanup() based infrastructure").
>
> * Thus replace local_irq_save() and local_irq_restore() calls by calls
>   of the macro =E2=80=9Cguard(irqsave)=E2=80=9D.
>
> * Omit the local variables =E2=80=9Cflags=E2=80=9D and =E2=80=9Cirq_flags=
=E2=80=9D.
>
> * Replace selected usage of the label =E2=80=9Cout=E2=80=9D by a few retu=
rn statements.
>
>
> This issue was detected by using the Coccinelle software.
>
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  arch/powerpc/perf/core-book3s.c | 102 +++++++++++++-------------------
>  1 file changed, 42 insertions(+), 60 deletions(-)

These mostly look good.

I don't think the change to power_pmu_event_init() is an improvement.

I'll drop that hunk when applying, or you can send a v2 without that
change if you prefer.

cheers

> @@ -1996,7 +1980,7 @@ static bool is_event_blacklisted(u64 ev)
>  static int power_pmu_event_init(struct perf_event *event)
>  {
>  	u64 ev;
> -	unsigned long flags, irq_flags;
> +	unsigned long flags;
>  	struct perf_event *ctrs[MAX_HWEVENTS];
>  	u64 events[MAX_HWEVENTS];
>  	unsigned int cflags[MAX_HWEVENTS];
> @@ -2115,43 +2099,41 @@ static int power_pmu_event_init(struct perf_event=
 *event)
>  	if (check_excludes(ctrs, cflags, n, 1))
>  		return -EINVAL;
>
> -	local_irq_save(irq_flags);
> -	cpuhw =3D this_cpu_ptr(&cpu_hw_events);
> +	{
> +		guard(irqsave)();
> +		cpuhw =3D this_cpu_ptr(&cpu_hw_events);
>
> -	err =3D power_check_constraints(cpuhw, events, cflags, n + 1, ctrs);
> +		err =3D power_check_constraints(cpuhw, events, cflags, n + 1, ctrs);
>
> -	if (has_branch_stack(event)) {
> -		u64 bhrb_filter =3D -1;
> +		if (has_branch_stack(event)) {
> +			u64 bhrb_filter =3D -1;
>
> -		/*
> -		 * Currently no PMU supports having multiple branch filters
> -		 * at the same time. Branch filters are set via MMCRA IFM[32:33]
> -		 * bits for Power8 and above. Return EOPNOTSUPP when multiple
> -		 * branch filters are requested in the event attr.
> -		 *
> -		 * When opening event via perf_event_open(), branch_sample_type
> -		 * gets adjusted in perf_copy_attr(). Kernel will automatically
> -		 * adjust the branch_sample_type based on the event modifier
> -		 * settings to include PERF_SAMPLE_BRANCH_PLM_ALL. Hence drop
> -		 * the check for PERF_SAMPLE_BRANCH_PLM_ALL.
> -		 */
> -		if (hweight64(event->attr.branch_sample_type & ~PERF_SAMPLE_BRANCH_PLM=
_ALL) > 1) {
> -			local_irq_restore(irq_flags);
> -			return -EOPNOTSUPP;
> -		}
> +			/*
> +			 * Currently no PMU supports having multiple branch filters
> +			 * at the same time. Branch filters are set via MMCRA IFM[32:33]
> +			 * bits for Power8 and above. Return EOPNOTSUPP when multiple
> +			 * branch filters are requested in the event attr.
> +			 *
> +			 * When opening event via perf_event_open(), branch_sample_type
> +			 * gets adjusted in perf_copy_attr(). Kernel will automatically
> +			 * adjust the branch_sample_type based on the event modifier
> +			 * settings to include PERF_SAMPLE_BRANCH_PLM_ALL. Hence drop
> +			 * the check for PERF_SAMPLE_BRANCH_PLM_ALL.
> +			 */
> +			if (hweight64(event->attr.branch_sample_type & ~PERF_SAMPLE_BRANCH_PL=
M_ALL)
> +			    > 1)
> +				return -EOPNOTSUPP;
>
> -		if (ppmu->bhrb_filter_map)
> -			bhrb_filter =3D ppmu->bhrb_filter_map(
> -					event->attr.branch_sample_type);
> +			if (ppmu->bhrb_filter_map)
> +				bhrb_filter =3D ppmu->bhrb_filter_map(event->attr.branch_sample_type=
);
>
> -		if (bhrb_filter =3D=3D -1) {
> -			local_irq_restore(irq_flags);
> -			return -EOPNOTSUPP;
> +			if (bhrb_filter =3D=3D -1)
> +				return -EOPNOTSUPP;
> +
> +			cpuhw->bhrb_filter =3D bhrb_filter;
>  		}
> -		cpuhw->bhrb_filter =3D bhrb_filter;
>  	}
>
> -	local_irq_restore(irq_flags);
>  	if (err)
>  		return -EINVAL;
>
> --
> 2.46.0

