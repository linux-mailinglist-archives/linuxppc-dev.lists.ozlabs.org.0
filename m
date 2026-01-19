Return-Path: <linuxppc-dev+bounces-15946-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FCB7D39DDA
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Jan 2026 06:37:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dvfPJ2Bykz2yDk;
	Mon, 19 Jan 2026 16:37:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::62a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768801076;
	cv=none; b=Sa4O3gZvhxUOlHovBlqYMidBR2h1QDmkuwekKBjK10fA39jd1B+Nh1pBpQm/rigshEj1Y5lbkesFrs9vffPK+MpNMj3Qj32P+jjWDpn0ifLNZQ1ld82aqaRrNMTOsYNWsnvtYMF48It8kyGq4wJIftSRtdM/4CtgnKvqzBPTmyr7kOG7pLH2lbUSbxIGcUPHLcjtLs7++i3xUL+V85rN04KkZXvunvrgBufyKF6KZG/poqi9LmzWUeFh07DK7TtjWD4jUyzUYrisjbZFPHvC0oLx6Aj3WQhDOxzkR92k3NEyzf6mpPgBp3bKW9pc0DAtjX0CHKogx8LZLlBaPfNZiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768801076; c=relaxed/relaxed;
	bh=rV07savPRO0IKbzKw21+aHwR+cCqLisS1/gIxq8rFVs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R4eRBsyUSSfFXiPVQcJKksS52/z/v/PAGHzFdntkijkkFt6q8vxQQN1sfa0C2vK0kXeIA+2TkWp+vbfmRbMUFlqCcDZGhYmMNdrijr07aIQisfT3tZ2ygypMzg71uEa4IqlLQpWLRYYlqpHxFFVXs4QtJT9/1LJ2wvrz9GfonaNaj6G9ZieSIXX42BNVZrKcNgXIjFUWqxrYx0Iv6K0P2Som5wyiCMNnBVrD2Ka/emh9R6RWf43K8bcHUkQFBK/9iKnuqKKuigpApzajyFiI9Xf9mwhY0F+zXstGHLx3Jw4GgcAKPN+K7K+DrPiEKua5RQ6h2hKK/o1+4YnUjCqfdQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org; dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Aqh0b0ZY; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::62a; helo=mail-pl1-x62a.google.com; envelope-from=viresh.kumar@linaro.org; receiver=lists.ozlabs.org) smtp.mailfrom=linaro.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Aqh0b0ZY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::62a; helo=mail-pl1-x62a.google.com; envelope-from=viresh.kumar@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dvfPH0xtyz2xSZ
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Jan 2026 16:37:53 +1100 (AEDT)
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2a07f8dd9cdso24485275ad.1
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 18 Jan 2026 21:37:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768801070; x=1769405870; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rV07savPRO0IKbzKw21+aHwR+cCqLisS1/gIxq8rFVs=;
        b=Aqh0b0ZYfjdro5V0QTS1jeRSBbJTNIdPLQeD0DfuePQUKJpRN8R1UdH1fefVBV9lcv
         ZZDuGbBtbb+rQKXZJlZQoErwR+1Px7aW7aWERksZ1qeGRbcZnnAEHO3DWa4FbO7lXZUi
         vVZKCPBxWPWzBdsp4DSFrEfc/4DNpR4TZ60WGZPh35hk3QvqDwFtwrZVxlv/40pb8UKk
         g1bWXT9ipQ5hJpKAjv3Ed0fgWcZjN+JS1eZTbRHmvczOgDoq6PhBiNHwKZ6prCq/RyFd
         PWaBYdQklFZFuYes1D9nOSLiB5tNnZguBQVTR6X+VUUR8ZaCvbn8P3OF9n8VuJ2IlERM
         ZVwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768801070; x=1769405870;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rV07savPRO0IKbzKw21+aHwR+cCqLisS1/gIxq8rFVs=;
        b=xLvF+5t5/15+OzRGM4qdBSHnpLjoTjuvhQjNsjixUF354ktBqXGUnpQcxg7UiEibzU
         UFASSlfEHok0CNrXwymRbYzXayQpqSI/BK+z46Mxgd/tR6kIQnXeoJuMUmBG2spM6IwG
         25ZJZnDT0QSxo9lzWxrQhY8woYvy0RNuVvJyw9BMw9C7FJN+n7e60t6GQFUEiIbvx63W
         GwAfAoYLDgf/PPKGylCO20c3wyxYTopoyJwLt2JVCrjH3v9Vkyf8rXZZEKm0WYxnRp9b
         Yf79Jlud6OJQz+68CNGBCUIocA/YJ8QmTb23gC/XErFpvgcym7CHMzpIwOK0yoV32hbM
         fZzA==
X-Forwarded-Encrypted: i=1; AJvYcCUhdUN/UwdpiOZ2w0z5EMgV4GbwVUxoW5hzejWDaVzkjdxDxtcCgSQ+I0BkM/3Wo0Tb1lGpmbMX4p7iW2o=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxuPgWan5iK+ZAsxRtdElQu5lvIJOhnZy5Aq8eVYyCuQyJeP5fb
	VsfqbUP+R9/n7iIx8c1WCRT6fZmp6qB3OOHC2JdMnHm8zmAc57YDyLvHIaTjEGf0Wwo=
X-Gm-Gg: AZuq6aJcXbEbTjnS/i+nTGCA1i1myCcrm1AvgPZ3lWRLtEf7EEXFAyHsB9Shn8yJfwV
	bUMk0gYFQOE7hXuzmE5BwOiQgk0a71h/NpZHzpXdMhhbHBrbOqK7xKlLEtv8dnQm7FoIKEm/Pqb
	p9g4odEOfTCInxyHFrUWU5WfP1B8wmuC4Bgs8LasIt2f9PsXsrWZa/v29wM3WBdkb/z4vOJl9/s
	Uqp5+N3JeC0hfrEhNByS2RZ1jDZld7xaKamvbcpARLEbPavPSNRqGpVF6wVnSt4W4f6WqmDag86
	CenfjexOFUUoye466aknJAlkuys0J3wlpEDI/YO8EalH2SDdWFN/9M5mSBB+99C3ts006/KAwSI
	yEfZaEbDsqHlHq/QEISYgdGovSDwXsNUe3qU/SLXVS47AMyntn5yxEMn45Vo3POwyz65jJzfmoS
	CQsmUQprIPfDM=
X-Received: by 2002:a17:903:28d:b0:298:efa:511f with SMTP id d9443c01a7336-2a7176c5c7amr104119265ad.39.1768801070083;
        Sun, 18 Jan 2026 21:37:50 -0800 (PST)
Received: from localhost ([122.172.80.63])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a7190eee4fsm81033725ad.42.2026.01.18.21.37.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jan 2026 21:37:49 -0800 (PST)
Date: Mon, 19 Jan 2026 11:07:47 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
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
	Xin Zhao <jackzxcui1989@163.com>, linux-pm@vger.kernel.org, linux-s390@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 07/15] cpufreq: ondemand: Simplify idle cputime
 granularity test
Message-ID: <rnnx7nges4otjixz4n62q7vtgrdcphepbkpmdntupbdft2yvi7@b3ong66tikoh>
References: <20260116145208.87445-1-frederic@kernel.org>
 <20260116145208.87445-8-frederic@kernel.org>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260116145208.87445-8-frederic@kernel.org>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 16-01-26, 15:52, Frederic Weisbecker wrote:
> cpufreq calls get_cpu_idle_time_us() just to know if idle cputime
> accounting has a nanoseconds granularity.
> 
> Use the appropriate indicator instead to make that deduction.
> 
> Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
> ---
>  drivers/cpufreq/cpufreq_ondemand.c | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
> 
> diff --git a/drivers/cpufreq/cpufreq_ondemand.c b/drivers/cpufreq/cpufreq_ondemand.c
> index a6ecc203f7b7..2d52ee035702 100644
> --- a/drivers/cpufreq/cpufreq_ondemand.c
> +++ b/drivers/cpufreq/cpufreq_ondemand.c
> @@ -334,17 +334,12 @@ static void od_free(struct policy_dbs_info *policy_dbs)
>  static int od_init(struct dbs_data *dbs_data)
>  {
>  	struct od_dbs_tuners *tuners;
> -	u64 idle_time;
> -	int cpu;
>  
>  	tuners = kzalloc(sizeof(*tuners), GFP_KERNEL);
>  	if (!tuners)
>  		return -ENOMEM;
>  
> -	cpu = get_cpu();
> -	idle_time = get_cpu_idle_time_us(cpu, NULL);
> -	put_cpu();
> -	if (idle_time != -1ULL) {
> +	if (tick_nohz_enabled) {
>  		/* Idle micro accounting is supported. Use finer thresholds */
>  		dbs_data->up_threshold = MICRO_FREQUENCY_UP_THRESHOLD;
>  	} else {

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh

