Return-Path: <linuxppc-dev+bounces-15985-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 545D7D3A8C5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Jan 2026 13:30:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dvqYF0sQtz2yql;
	Mon, 19 Jan 2026 23:30:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768825825;
	cv=none; b=acelpYJYLo3GsfVCo+zGoQNeKn0bgqXnjtGedL07Bgx+OnC1czKBlg1H2HXMyemPzUr6h/0SeD9EQOwIZBI7E5ycfcd4jLuvYdIweFoKL6plJD9+vl7PpSK1koohxE+QYVRqQyEii0De6zHh3yB8XZMxgxIZqYEzwteutRQwNM8f1NWIps8NXHOZC4UFrv/PqexJwixJGrVOT7b77KJaw5ai2dwEJdtkOllXctM/uBqykrdo0MW3QtDLSvz1p6vCenfSmPup60gfAGeDlUV45jAwWrQZQGxhFSNhIu/2pUD0biycNdZYbRIXlpYZYpv5UL8QWk247v2YaCb6+OSMOw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768825825; c=relaxed/relaxed;
	bh=rCOoFmmkwZ1RnY4XYTZmb5y+/o+8moqU8+YLz6THgJo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SmxeOP7531sGoGuxk+mmLcBtzjh3nhq/jgwr4cYjU/qaaj5ZC8su5NQI0BsSprs76A3+JmxSpDjbYbEutwYkH3jtkfniMbG8h2pfAUHXRCEAL1WWb0pkIVTTJz6amiaq7lv8eeZfZix0osdY9Fll87ZwNkHK6TI5/LJf6WIh/f9/vjubH/ubrtqCtxur/Xr4SOcFSIjwbdE9T8dDL+Q7NKgw5rZTmqBybqcPL1Sxgt/Qxomswud3zOD4wfTgAAqZE3F6sm+sFW5p1c6GPBbrD9AaVi4pAmRP8oQ/Wp6jI8g9JaSI6zCH6CbgIPz0w8vRLKdMCpbbrH1ckaM0XAzK7g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=BUJo4cYk; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=rafael@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=BUJo4cYk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=rafael@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dvqYD1dSWz2xHW
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Jan 2026 23:30:24 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 40D7960131
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Jan 2026 12:30:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E776BC19424
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Jan 2026 12:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768825821;
	bh=AGiSWdIjqcCkIzUWZ+e2XIl/XdcoubBgfAl3S0l0Yy4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=BUJo4cYknabYZtdBbL+/mLHuuDSar6nIIwS1EvDKN3SwsYO7sZET9/lQywm1vdesA
	 OhPiVl7AYa1DO85LIiYFx6ee7r/TzQ7EE+VZtijohfZ4Ec4iFcfRhGWc79gqHwPN+X
	 IeqXTb9HEwq0wsq3eRGy1DWh3ovF8HFIZkUXNNYMOjcBo/rP8OJQ7z+c2NoL/C8Plv
	 srVRkJhugAjIPHV7HfCGpiOWlrh1n+De9/CZZ3DwBDiOxtWWIyWtYjIzl1NuttS9CE
	 r1c+zinZVYu6/oMs6jNjauvLcFmTPUuUXW5n/Tt13c9Gk1twM4dLtaWwlmLIcQFZWG
	 zgCOvQvcFhteA==
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-6610e72112bso1959904eaf.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Jan 2026 04:30:21 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVYGcmfMGplpVf31i8GNUZVMmxqzaNPKYqN3zOz1747QPrRNsPfFt/audlFf00Egcmsvf9DmKoKdM+4KmY=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwqllQromtsoUUOpiIov7tzCoduGI34jN4ewn3DLQ1DYyF89JMS
	j4ACEFJ5kKQ1EuEzL5uL8R80FAaY4sCMfpIjQqGoWiuqpOIsBNFNke1Xeddn8mnRSK5E1e5J/v+
	64+qV84DiaaVppEbGJMS7QdRB5xiiDZE=
X-Received: by 2002:a05:6820:625:b0:661:ae2:95ed with SMTP id
 006d021491bc7-661189adbd2mr4500479eaf.60.1768825820390; Mon, 19 Jan 2026
 04:30:20 -0800 (PST)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
References: <20260116145208.87445-1-frederic@kernel.org> <20260116145208.87445-8-frederic@kernel.org>
In-Reply-To: <20260116145208.87445-8-frederic@kernel.org>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Mon, 19 Jan 2026 13:30:07 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0hn81J_0N0Hy6QYtc3655w-9hDqVgWWY1BVhW=DT56Deg@mail.gmail.com>
X-Gm-Features: AZwV_QijNtZmi1zR4iwR07o__vPOI-DD5wfQBm2ysAJARvjnZxZ46W3q48jp7lk
Message-ID: <CAJZ5v0hn81J_0N0Hy6QYtc3655w-9hDqVgWWY1BVhW=DT56Deg@mail.gmail.com>
Subject: Re: [PATCH 07/15] cpufreq: ondemand: Simplify idle cputime
 granularity test
To: Frederic Weisbecker <frederic@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, 
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Anna-Maria Behnsen <anna-maria@linutronix.de>, 
	Ben Segall <bsegall@google.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Dietmar Eggemann <dietmar.eggemann@arm.com>, 
	Heiko Carstens <hca@linux.ibm.com>, Ingo Molnar <mingo@redhat.com>, 
	Jan Kiszka <jan.kiszka@siemens.com>, Joel Fernandes <joelagnelf@nvidia.com>, 
	Juri Lelli <juri.lelli@redhat.com>, Kieran Bingham <kbingham@kernel.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Mel Gorman <mgorman@suse.de>, 
	Michael Ellerman <mpe@ellerman.id.au>, Neeraj Upadhyay <neeraj.upadhyay@kernel.org>, 
	Nicholas Piggin <npiggin@gmail.com>, "Paul E . McKenney" <paulmck@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Sven Schnelle <svens@linux.ibm.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Uladzislau Rezki <urezki@gmail.com>, Valentin Schneider <vschneid@redhat.com>, 
	Vasily Gorbik <gor@linux.ibm.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Viresh Kumar <viresh.kumar@linaro.org>, Xin Zhao <jackzxcui1989@163.com>, 
	linux-pm@vger.kernel.org, linux-s390@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, Jan 16, 2026 at 3:53=E2=80=AFPM Frederic Weisbecker <frederic@kerne=
l.org> wrote:
>
> cpufreq calls get_cpu_idle_time_us() just to know if idle cputime
> accounting has a nanoseconds granularity.
>
> Use the appropriate indicator instead to make that deduction.
>
> Signed-off-by: Frederic Weisbecker <frederic@kernel.org>

Acked-by: Rafael J. Wysocki (Intel) <rafael@kernel.org>

or please let me know if you want me to take this patch.

> ---
>  drivers/cpufreq/cpufreq_ondemand.c | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
>
> diff --git a/drivers/cpufreq/cpufreq_ondemand.c b/drivers/cpufreq/cpufreq=
_ondemand.c
> index a6ecc203f7b7..2d52ee035702 100644
> --- a/drivers/cpufreq/cpufreq_ondemand.c
> +++ b/drivers/cpufreq/cpufreq_ondemand.c
> @@ -334,17 +334,12 @@ static void od_free(struct policy_dbs_info *policy_=
dbs)
>  static int od_init(struct dbs_data *dbs_data)
>  {
>         struct od_dbs_tuners *tuners;
> -       u64 idle_time;
> -       int cpu;
>
>         tuners =3D kzalloc(sizeof(*tuners), GFP_KERNEL);
>         if (!tuners)
>                 return -ENOMEM;
>
> -       cpu =3D get_cpu();
> -       idle_time =3D get_cpu_idle_time_us(cpu, NULL);
> -       put_cpu();
> -       if (idle_time !=3D -1ULL) {
> +       if (tick_nohz_enabled) {
>                 /* Idle micro accounting is supported. Use finer threshol=
ds */
>                 dbs_data->up_threshold =3D MICRO_FREQUENCY_UP_THRESHOLD;
>         } else {
> --
> 2.51.1
>
>

