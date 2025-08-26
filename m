Return-Path: <linuxppc-dev+bounces-11305-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 95D1BB35647
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Aug 2025 10:02:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cB0WD100pz3dLh;
	Tue, 26 Aug 2025 18:02:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:8b0:10b:1:d65d:64ff:fe57:4e05"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756195336;
	cv=none; b=oF4WRD2oNXB12y+7e8AC0Nvb37qZGv+1OihsDI3r/waRqo+FojJH2fW5DuVkpj5Jt1/JBfbsxmM08GoZKzlXeVuEhxj/vv8UrzMPpwxQcoVr+emgSUhyx/eF+n1oZgoLo0CKPX0qgzlUUlT3oz99HdHqHHUd6mi1IoDTS6r8Nvm5BJN9//BGnKvK5jgKIHDKzIHS4XH3bezN1dGYGLtXKfLGam6clY/oi7NyKxkkvjIJqAmKBjgC7yqVI7wGDB0lMWGqCYdTZMUhQMyuQmLT4Xl04WOm8MNLHddLX086OP4gP78sV7BO3uhK7M8FqlcGuqt/OmrIeJ93DKyYX2iHdw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756195336; c=relaxed/relaxed;
	bh=MeaWqH2Rz3f87zQ3/bNc5oTQxLBcu0GLQKcR2xh3Qso=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DRHGA/5adwitwbyU/bBu3abOxyFozICHMMFlY4NgfX5XBVyC1ykHIVmryGgH5SUf7YVSAIzfX5arx+5yXl5z/vZxuUvUsqvmHOyPaa3g0t61W45pJQvl53yUEcaABP/miZAqeAS+jvMIkwve4V6sZst2r/qCRCBc89KjoMKuh1xMo2HM2yXI7Y9WBfoYsMwykfiZ99g/aCkkZ9nWXRoYJd2gld/ANHdbyXgwaKHjhcAl1Ua6D/hQ6xP6MTcbS576IoIUq5wMIY3+PLertJN8bOXU6WpVOCM+5uHwlIER7ZSp7OuB9x7NrA0zLb1uDJhg835O2KxnBpKCCfKgak6zRA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none (client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05; helo=desiato.infradead.org; envelope-from=peterz@infradead.org; receiver=lists.ozlabs.org) smtp.mailfrom=infradead.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05; helo=desiato.infradead.org; envelope-from=peterz@infradead.org; receiver=lists.ozlabs.org)
Received: from desiato.infradead.org (desiato.infradead.org [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cB0W54673z3dLd
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Aug 2025 18:02:09 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=MeaWqH2Rz3f87zQ3/bNc5oTQxLBcu0GLQKcR2xh3Qso=; b=YRNJLkkGouui1FXZAEdgnAYbtq
	nObm01fOGuFzOAUKso2zWlt0z2cLuE4vbV+flWhLC7PGgdGG+6C5SWh1Sstq1NVW3KejpgeiNZLqL
	Wg+R9GabyRFIyGtmOF9OoPtvi4sBIPJ4/ie2WcsQ4SEdUcc/XgDpKvsDpQ3jddTkRKOTJrfpdlPd3
	t0w3QbF1YJ+/v65cMQCWFYrMOntKPAijSzY6PW6irY2KhIyKAnJt0x6jDQwJCGHeRFAG2I8NwB5XW
	tksAkp+jD/Bdrcmvf5rrHrixtTxpOu2xCmZbJ/QzdoKQfxu03AedLbJk27bejPLIXds4Lc1xG0/fO
	405uTk/A==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqocO-00000002AI3-15mB;
	Tue, 26 Aug 2025 08:01:24 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 134803002C5; Tue, 26 Aug 2025 10:01:23 +0200 (CEST)
Date: Tue, 26 Aug 2025 10:01:23 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: K Prateek Nayak <kprateek.nayak@amd.com>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	linux-s390@vger.kernel.org,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	thomas.weissschuh@linutronix.de, Li Chen <chenl311@chinatelecom.cn>,
	Bibo Mao <maobibo@loongson.cn>, Mete Durlu <meted@linux.ibm.com>,
	Tobias Huschle <huschle@linux.ibm.com>,
	Easwar Hariharan <easwar.hariharan@linux.microsoft.com>,
	Guo Weikang <guoweikang.kernel@gmail.com>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	Brian Gerst <brgerst@gmail.com>,
	Patryk Wlazlyn <patryk.wlazlyn@linux.intel.com>,
	Swapnil Sapkal <swapnil.sapkal@amd.com>,
	"Yury Norov [NVIDIA]" <yury.norov@gmail.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Andrea Righi <arighi@nvidia.com>,
	Yicong Yang <yangyicong@hisilicon.com>,
	Ricardo Neri <ricardo.neri-calderon@linux.intel.com>,
	Tim Chen <tim.c.chen@linux.intel.com>,
	Vinicius Costa Gomes <vinicius.gomes@intel.com>
Subject: Re: [PATCH v7 5/8] sched/topology: Unify tl_smt_mask() across core
 and all arch
Message-ID: <20250826080123.GB3245006@noisy.programming.kicks-ass.net>
References: <20250826041319.1284-1-kprateek.nayak@amd.com>
 <20250826041319.1284-6-kprateek.nayak@amd.com>
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
In-Reply-To: <20250826041319.1284-6-kprateek.nayak@amd.com>
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

> diff --git a/include/linux/sched/topology.h b/include/linux/sched/topology.h
> index 602508130c8a..d75fbb7d9667 100644
> --- a/include/linux/sched/topology.h
> +++ b/include/linux/sched/topology.h
> @@ -37,7 +37,13 @@ static inline int cpu_smt_flags(void)
>  {
>  	return SD_SHARE_CPUCAPACITY | SD_SHARE_LLC;
>  }
> -#endif
> +
> +static const __maybe_unused
> +struct cpumask *tl_smt_mask(struct sched_domain_topology_level *tl, int cpu)
> +{
> +	return cpu_smt_mask(cpu);
> +}
> +#endif /* CONFIG_SCHED_SMT */

Problem with that __maybe_unused is that you forgot inline.

static inline const
struct cpumask *tl_smt_mask(struct sched_domain_topology_level *tl, int cpu)
{
	return cpu_smt_mask(cpu);
}

seems to make it happy.


