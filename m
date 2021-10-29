Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E8CD443F710
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Oct 2021 08:17:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HgXJh5cxSz3c88
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Oct 2021 17:17:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=WgGSGwQ0;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::632;
 helo=mail-pl1-x632.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=WgGSGwQ0; dkim-atps=neutral
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HgXJ22SPJz2xrl
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Oct 2021 17:16:32 +1100 (AEDT)
Received: by mail-pl1-x632.google.com with SMTP id z11so6151478plg.8
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Oct 2021 23:16:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=nmj1YYeS1Rdn/dPj7IdovPnRrd/pv5II9WJ9GO2m3Tw=;
 b=WgGSGwQ0k4JfRHJ8Ne0shxezoLwwQ0a5sCqYIi+XqcVSx0Kp0KP4aXD6AgTWi/zuev
 3BRSygQc7C2HcdeOsSoDhcuto6GK1ENJV92fFGRFSqXENQ/uDsOSMYc8T6P4bPkriuMN
 +7vH/GayqdMbMT6aOJCq3mUC9mPP2irsfkiFMUFvbFZA5tIeLT0vsvGpoXzvbjnfv4zN
 6AcfupNWgomorCXBdm/EDiXv2fXM5zK5CkMvx4pQa9MuMXcZJxu9XlVt8nPlmcdAIOgC
 mWSly7sYcfS/3H70GgUVIwj1lGw9b50TIgeaRYd+Vk0BVwhttYaGilkbNdmvo5of3nHE
 UvEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=nmj1YYeS1Rdn/dPj7IdovPnRrd/pv5II9WJ9GO2m3Tw=;
 b=IMXAA8QB9zuRuOx7+HD0WLKt31f2vD1349W5Hp73WKVMfICoVxn1tDxWSsx31MiX+L
 kDTgtds3lkt6wNz4N9QsrGcZPGybMrI8E1iE4liHcQrs/6ZbSi4rno4hh6UayNmmhXG1
 93Jylp8XeuiJpwLHaTkuW6TPOKgIRZ9is7G/z7uRrPFv8SWUkptA97ccmgGALCJolh9G
 ppEjO7w6nZPAVmBVvkzw/zCc6ILGQuuBQHpGxPjrNfiNYkN47bfcOyux7mstXH9vmE3t
 jhd68tgBTRaDbymxf1vo7VeDL+Xl6PENgx8G4A+dxtEWgrSg9HEQbzl8ckpNNnW+K+7T
 Hy6w==
X-Gm-Message-State: AOAM530QglThkmGwJjY8mUA12v2bdpchVhAdNxoPbILc9VzjLj0ZMN6x
 Eukczt5oGmuwjj5l0hycWxvBfJnKz9w=
X-Google-Smtp-Source: ABdhPJyNkEkK2M8FkwGphilswhLXmKf4A5nlbaIwOvwXOL4mSXr0EXTwdubUJR3z9EhgOqFVpjE5PA==
X-Received: by 2002:a17:90b:149:: with SMTP id
 em9mr17654434pjb.133.1635488189448; 
 Thu, 28 Oct 2021 23:16:29 -0700 (PDT)
Received: from localhost ([118.208.159.180])
 by smtp.gmail.com with ESMTPSA id t13sm4505873pgn.94.2021.10.28.23.16.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Oct 2021 23:16:29 -0700 (PDT)
Date: Fri, 29 Oct 2021 16:16:23 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [V3] powerpc/perf: Enable PMU counters post partition migration
 if PMU is active
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>, mpe@ellerman.id.au
References: <20211029030510.58797-1-atrajeev@linux.vnet.ibm.com>
In-Reply-To: <20211029030510.58797-1-atrajeev@linux.vnet.ibm.com>
MIME-Version: 1.0
Message-Id: <1635487923.hwdpof7s4v.astroid@bobo.none>
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
Cc: nathanl@linux.ibm.com, kjain@linux.ibm.com, maddy@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org, rnsastry@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Athira Rajeev's message of October 29, 2021 1:05 pm:
> During Live Partition Migration (LPM), it is observed that perf
> counter values reports zero post migration completion. However
> 'perf stat' with workload continues to show counts post migration
> since PMU gets disabled/enabled during sched switches. But incase
> of system/cpu wide monitoring, zero counts were reported with 'perf
> stat' after migration completion.
>=20
> Example:
>  ./perf stat -e r1001e -I 1000
>            time             counts unit events
>      1.001010437         22,137,414      r1001e
>      2.002495447         15,455,821      r1001e
> <<>> As seen in next below logs, the counter values shows zero
>         after migration is completed.
> <<>>
>     86.142535370    129,392,333,440      r1001e
>     87.144714617                  0      r1001e
>     88.146526636                  0      r1001e
>     89.148085029                  0      r1001e

This is the output without the patch? After the patch it keeps counting=20
I suppose? And does the very large count go away too?

>=20
> Here PMU is enabled during start of perf session and counter
> values are read at intervals. Counters are only disabled at the
> end of session. The powerpc mobility code presently does not handle
> disabling and enabling back of PMU counters during partition
> migration. Also since the PMU register values are not saved/restored
> during migration, PMU registers like Monitor Mode Control Register 0
> (MMCR0), Monitor Mode Control Register 1 (MMCR1) will not contain
> the value it was programmed with. Hence PMU counters will not be
> enabled correctly post migration.
>=20
> Fix this in mobility code by handling disabling and enabling of
> PMU in all cpu's before and after migration. Patch introduces two
> functions 'mobility_pmu_disable' and 'mobility_pmu_enable'.
> mobility_pmu_disable() is called before the processor threads goes
> to suspend state so as to disable the PMU counters. And disable is
> done only if there are any active events running on that cpu.
> mobility_pmu_enable() is called after the migrate is done to enable
> back the PMU counters.
>=20
> Since the performance Monitor counters ( PMCs) are not
> saved/restored during LPM, results in PMC value being zero and the
> 'event->hw.prev_count' being non-zero value. This causes problem
> during updation of event->count since we always accumulate
> (event->hw.prev_count - PMC value) in event->count.  If
> event->hw.prev_count is greater PMC value, event->count becomes
> negative. To fix this, 'prev_count' also needs to be re-initialised
> for all events while enabling back the events. Hence read the
> existing events and clear the PMC index (stored in event->hw.idx)
> for all events im mobility_pmu_disable. By this way, event count
> settings will get re-initialised correctly in power_pmu_enable.
>=20
> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
> [ Fixed compilation error reported by kernel test robot ]
> Reported-by: kernel test robot <lkp@intel.com>
> ---
> Changelog:
> Change from v2 -> v3:
> Addressed review comments from Nicholas Piggin.
>  - Removed the "migrate" field which was added in initial
>    patch to address updation of event count settings correctly
>    in power_pmu_enable. Instead read off existing events in
>    mobility_pmu_disable before power_pmu_enable.
>  - Moved the mobility_pmu_disable/enable declaration from
>    rtas.h to perf event header file.
>=20
> Addressed review comments from Nathan.
>  - Moved the mobility function calls from stop_machine
>    context out to pseries_migrate_partition. Also now this
>    is a per cpu invocation.
>=20
> Change from v1 -> v2:
>  - Moved the mobility_pmu_enable and mobility_pmu_disable
>    declarations under CONFIG_PPC_PERF_CTRS in rtas.h.
>    Also included 'asm/rtas.h' in core-book3s to fix the
>    compilation warning reported by kernel test robot.
>=20
>  arch/powerpc/include/asm/perf_event.h     |  8 +++++
>  arch/powerpc/perf/core-book3s.c           | 39 +++++++++++++++++++++++
>  arch/powerpc/platforms/pseries/mobility.c |  7 ++++
>  3 files changed, 54 insertions(+)
>=20
> diff --git a/arch/powerpc/include/asm/perf_event.h b/arch/powerpc/include=
/asm/perf_event.h
> index 164e910bf654..88aab6cf840c 100644
> --- a/arch/powerpc/include/asm/perf_event.h
> +++ b/arch/powerpc/include/asm/perf_event.h
> @@ -17,6 +17,14 @@ static inline bool is_sier_available(void) { return fa=
lse; }
>  static inline unsigned long get_pmcs_ext_regs(int idx) { return 0; }
>  #endif
> =20
> +#ifdef CONFIG_PPC_PERF_CTRS
> +void mobility_pmu_disable(void *unused);
> +void mobility_pmu_enable(void *unused);
> +#else
> +static inline void mobility_pmu_disable(void *unused) { }
> +static inline void mobility_pmu_enable(void *unused) { }
> +#endif
> +
>  #ifdef CONFIG_FSL_EMB_PERF_EVENT
>  #include <asm/perf_event_fsl_emb.h>
>  #endif
> diff --git a/arch/powerpc/perf/core-book3s.c b/arch/powerpc/perf/core-boo=
k3s.c
> index 73e62e9b179b..2e8c4c668fa3 100644
> --- a/arch/powerpc/perf/core-book3s.c
> +++ b/arch/powerpc/perf/core-book3s.c
> @@ -1343,6 +1343,33 @@ static void power_pmu_disable(struct pmu *pmu)
>  	local_irq_restore(flags);
>  }
> =20
> +/*
> + * Called from pseries_migrate_partition() function
> + * before migration, from powerpc/mobility code.
> + */
> +void mobility_pmu_disable(void *unused)
> +{
> +	struct cpu_hw_events *cpuhw =3D this_cpu_ptr(&cpu_hw_events);
> +	struct perf_event *event;
> +
> +	if (cpuhw->n_events !=3D 0) {
> +		int i;
> +
> +		power_pmu_disable(NULL);
> +		/*
> +		 * Read off any pre-existing events because the register
> +		 * values may not be migrated.
> +		 */
> +		for (i =3D 0; i < cpuhw->n_events; ++i) {
> +			event =3D cpuhw->event[i];
> +			if (event->hw.idx) {
> +				power_pmu_read(event);
> +				event->hw.idx =3D 0;
> +			}
> +		}
> +	}
> +}
> +
>  /*
>   * Re-enable all events if disable =3D=3D 0.
>   * If we were previously disabled and events were added, then
> @@ -1515,6 +1542,18 @@ static void power_pmu_enable(struct pmu *pmu)
>  	local_irq_restore(flags);
>  }
> =20
> +/*
> + * Called from pseries_migrate_partition() function
> + * after migration, from powerpc/mobility code.
> + */
> +void mobility_pmu_enable(void *unused)
> +{
> +	struct cpu_hw_events *cpuhw =3D this_cpu_ptr(&cpu_hw_events);
> +
> +	cpuhw->n_added =3D cpuhw->n_events;
> +	power_pmu_enable(NULL);
> +}
> +
>  static int collect_events(struct perf_event *group, int max_count,
>  			  struct perf_event *ctrs[], u64 *events,
>  			  unsigned int *flags)
> diff --git a/arch/powerpc/platforms/pseries/mobility.c b/arch/powerpc/pla=
tforms/pseries/mobility.c
> index e83e0891272d..3e96485ccba4 100644
> --- a/arch/powerpc/platforms/pseries/mobility.c
> +++ b/arch/powerpc/platforms/pseries/mobility.c
> @@ -22,6 +22,7 @@
>  #include <linux/delay.h>
>  #include <linux/slab.h>
>  #include <linux/stringify.h>
> +#include <linux/perf_event.h>
> =20
>  #include <asm/machdep.h>
>  #include <asm/rtas.h>
> @@ -631,12 +632,18 @@ static int pseries_migrate_partition(u64 handle)
>  	if (ret)
>  		return ret;
> =20
> +	/* Disable PMU before suspend */
> +	on_each_cpu(&mobility_pmu_disable, NULL, 0);

Why was this moved out of stop machine and to an IPI?

My concern would be, what are the other CPUs doing at this time? Is it=20
possible they could take interrupts and schedule? Could that mess up the
perf state here?

Thanks,
Nick
