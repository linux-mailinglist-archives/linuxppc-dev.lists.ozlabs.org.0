Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BCE6435FC3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Oct 2021 12:55:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HZksv0r7tz3c4y
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Oct 2021 21:55:47 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=L360gpzb;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62f;
 helo=mail-pl1-x62f.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=L360gpzb; dkim-atps=neutral
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HZksC0xFnz2yHV
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Oct 2021 21:55:10 +1100 (AEDT)
Received: by mail-pl1-x62f.google.com with SMTP id i1so97395plr.13
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Oct 2021 03:55:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=JM3l6eF/OuZUiluaIrTyFQOJnEKhLNcKiKDxQ3jTZOc=;
 b=L360gpzbIJpD8nkXXPq2nJHpdEoQ56l673dg02MrzIZHHsI60Rk4jYHxUF5Ko5yMbk
 DwhTVuqwlGDCtqLduRN8akAGuUmRxgGbc5WvRDQZZN39niff9hzc87JFzoywKORfKNxT
 75GQT/mwQLvHUaddfW8Wrwjyh2CgQL0NjFxMx+SF28hNCAOz4P8IFjE3YWyPP7MndZoq
 2awyxf0O4y2gu9vRnOcajoHSoQBkjuAKpeGyuE3B8JjkgIXY8vZqMcHMJxwl87UVKcOs
 +cPchHLnhIU0WeuI5oh6Az8hASvyMRyHR2LDZZ0BBemVupx1Fyd80sdKMHmK+UbUIbLS
 G4ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=JM3l6eF/OuZUiluaIrTyFQOJnEKhLNcKiKDxQ3jTZOc=;
 b=obd0ao1/Tv+QqLrya4nNw5lD/accd2ZedwtkseWPmgb9xFQ/tUveh7b3tXh4nV2LBf
 bgd75VQ9TjbWhgkn3xWJc2EK2Ws863SinVZMTRX1W6oyf6PS2NDX19JYvdOuPDTi7eoS
 OYH1OaW79+fRVD8fOA2/hbBeNwNdhiIpk1ZvM+bMRoLAgfpF31uiVumylyeiQiyLBwxh
 QdQc1kh26w0wFVCIc/9aik0+QB+mlfHQGOFPDhvP8DbysialZ1VB+kCzEgA0wm6vSw+S
 iu8sbPBRTF2MmzniIJ+5cg6ZNfMVNhPcaS4NMT1R8lxjQ/iCCcABrIA0tBayOvA5NMAd
 FYEw==
X-Gm-Message-State: AOAM531jzzTlhjhADhIeCQZoe7YaN1aRvpckjsTKcfJJyx1nre5xDtr1
 HX7wXlzMv6BicLwV6mjbMcM=
X-Google-Smtp-Source: ABdhPJwQTFFRgJB9mw8o3B87StCNdUmzJw3UJfuU6yiUYM6tgybDK+mkLURX6hiyOgvTf5dR5Wfs4w==
X-Received: by 2002:a17:90a:de8f:: with SMTP id
 n15mr5819803pjv.155.1634813705046; 
 Thu, 21 Oct 2021 03:55:05 -0700 (PDT)
Received: from localhost (14-203-144-177.static.tpgi.com.au. [14.203.144.177])
 by smtp.gmail.com with ESMTPSA id
 k3sm8989826pjg.43.2021.10.21.03.55.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Oct 2021 03:55:04 -0700 (PDT)
Date: Thu, 21 Oct 2021 20:54:59 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH V2] powerpc/perf: Enable PMU counters post partition
 migration if PMU is active
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>, mpe@ellerman.id.au
References: <1626006357-1611-1-git-send-email-atrajeev@linux.vnet.ibm.com>
In-Reply-To: <1626006357-1611-1-git-send-email-atrajeev@linux.vnet.ibm.com>
MIME-Version: 1.0
Message-Id: <1634812863.5e9oss88pa.astroid@bobo.none>
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
Cc: kjain@linux.ibm.com, maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org,
 rnsastry@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Athira Rajeev's message of July 11, 2021 10:25 pm:
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
> mobility_pmu_enable() is called after the processor threads are
> back online to enable back the PMU counters.
>=20
> Since the performance Monitor counters ( PMCs) are not
> saved/restored during LPM, results in PMC value being zero and the
> 'event->hw.prev_count' being non-zero value. This causes problem

Interesting. Are they defined to not be migrated, or may not be=20
migrated?

I wonder what QEMU migration does with PMU registers.

> during updation of event->count since we always accumulate
> (event->hw.prev_count - PMC value) in event->count.  If
> event->hw.prev_count is greater PMC value, event->count becomes
> negative. Fix this by re-initialising 'prev_count' also for all
> events while enabling back the events. A new variable 'migrate' is
> introduced in 'struct cpu_hw_event' to achieve this for LPM cases
> in power_pmu_enable. Use the 'migrate' value to clear the PMC
> index (stored in event->hw.idx) for all events so that event
> count settings will get re-initialised correctly.
>=20
> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
> [ Fixed compilation error reported by kernel test robot ]
> Reported-by: kernel test robot <lkp@intel.com>
> ---
> Change from v1 -> v2:
>  - Moved the mobility_pmu_enable and mobility_pmu_disable
>    declarations under CONFIG_PPC_PERF_CTRS in rtas.h.
>    Also included 'asm/rtas.h' in core-book3s to fix the
>    compilation warning reported by kernel test robot.
>=20
>  arch/powerpc/include/asm/rtas.h           |  8 ++++++
>  arch/powerpc/perf/core-book3s.c           | 44 +++++++++++++++++++++++++=
+++---
>  arch/powerpc/platforms/pseries/mobility.c |  4 +++
>  3 files changed, 53 insertions(+), 3 deletions(-)
>=20
> diff --git a/arch/powerpc/include/asm/rtas.h b/arch/powerpc/include/asm/r=
tas.h
> index 9dc97d2..cea72d7 100644
> --- a/arch/powerpc/include/asm/rtas.h
> +++ b/arch/powerpc/include/asm/rtas.h
> @@ -380,5 +380,13 @@ static inline void rtas_initialize(void) { }
>  static inline void read_24x7_sys_info(void) { }
>  #endif
> =20
> +#ifdef CONFIG_PPC_PERF_CTRS
> +void mobility_pmu_disable(void);
> +void mobility_pmu_enable(void);
> +#else
> +static inline void mobility_pmu_disable(void) { }
> +static inline void mobility_pmu_enable(void) { }
> +#endif
> +
>  #endif /* __KERNEL__ */
>  #endif /* _POWERPC_RTAS_H */

It's not implemented in rtas, maybe consider putting this into a perf=20
header?

> diff --git a/arch/powerpc/perf/core-book3s.c b/arch/powerpc/perf/core-boo=
k3s.c
> index bb0ee71..90da7fa 100644
> --- a/arch/powerpc/perf/core-book3s.c
> +++ b/arch/powerpc/perf/core-book3s.c
> @@ -18,6 +18,7 @@
>  #include <asm/ptrace.h>
>  #include <asm/code-patching.h>
>  #include <asm/interrupt.h>
> +#include <asm/rtas.h>
> =20
>  #ifdef CONFIG_PPC64
>  #include "internal.h"
> @@ -58,6 +59,7 @@ struct cpu_hw_events {
> =20
>  	/* Store the PMC values */
>  	unsigned long pmcs[MAX_HWEVENTS];
> +	int migrate;
>  };
> =20
>  static DEFINE_PER_CPU(struct cpu_hw_events, cpu_hw_events);
> @@ -1335,6 +1337,22 @@ static void power_pmu_disable(struct pmu *pmu)
>  }
> =20
>  /*
> + * Called from powerpc mobility code
> + * before migration to disable counters
> + * if the PMU is active.
> + */
> +void mobility_pmu_disable(void)
> +{
> +	struct cpu_hw_events *cpuhw;
> +
> +	cpuhw =3D this_cpu_ptr(&cpu_hw_events);
> +	if (cpuhw->n_events !=3D 0) {
> +		power_pmu_disable(NULL);
> +		cpuhw->migrate =3D 1;
> +	}

Rather than add this migrate logic into power_pmu_enable(), would you be=20
able to do the work in the mobility callbacks instead? Something like
this:

void mobility_pmu_disable(void)
{
        struct cpu_hw_events *cpuhw;

        cpuhw =3D this_cpu_ptr(&cpu_hw_events);
        if (cpuhw->n_events !=3D 0) {
                int i;

                power_pmu_disable(NULL);
                /*
                 * Read off any pre-existing events because the register
                 * values may not be migrated.
                 */
                for (i =3D 0; i < cpuhw->n_events; ++i) {
                        event =3D cpuhw->event[i];
                        if (event->hw.idx) {
                                power_pmu_read(event);
                                event->hw.idx =3D 0;
                        }
                }
        }
}

void mobility_pmu_enable(void)
{
        struct cpu_hw_events *cpuhw;
=20
        cpuhw =3D this_cpu_ptr(&cpu_hw_events);
        cpuhw->n_added =3D cpuhw->n_events;
        power_pmu_enable(NULL);
}

> +}
> +
> +/*
>   * Re-enable all events if disable =3D=3D 0.
>   * If we were previously disabled and events were added, then
>   * put the new config on the PMU.
> @@ -1379,8 +1397,10 @@ static void power_pmu_enable(struct pmu *pmu)
>  	 * no need to recalculate MMCR* settings and reset the PMCs.
>  	 * Just reenable the PMU with the current MMCR* settings
>  	 * (possibly updated for removal of events).
> +	 * While reenabling PMU during partition migration, continue
> +	 * with normal flow.
>  	 */
> -	if (!cpuhw->n_added) {
> +	if (!cpuhw->n_added && !cpuhw->migrate) {
>  		mtspr(SPRN_MMCRA, cpuhw->mmcr.mmcra & ~MMCRA_SAMPLE_ENABLE);
>  		mtspr(SPRN_MMCR1, cpuhw->mmcr.mmcr1);
>  		if (ppmu->flags & PPMU_ARCH_31)
> @@ -1434,11 +1454,15 @@ static void power_pmu_enable(struct pmu *pmu)
>  	/*
>  	 * Read off any pre-existing events that need to move
>  	 * to another PMC.
> +	 * While enabling PMU during partition migration,
> +	 * skip power_pmu_read since all event count settings
> +	 * needs to be re-initialised after migration.
>  	 */
>  	for (i =3D 0; i < cpuhw->n_events; ++i) {
>  		event =3D cpuhw->event[i];
> -		if (event->hw.idx && event->hw.idx !=3D hwc_index[i] + 1) {
> -			power_pmu_read(event);
> +		if ((event->hw.idx && event->hw.idx !=3D hwc_index[i] + 1) || (cpuhw->=
migrate)) {
> +			if (!cpuhw->migrate)
> +				power_pmu_read(event);
>  			write_pmc(event->hw.idx, 0);
>  			event->hw.idx =3D 0;
>  		}
> @@ -1506,6 +1530,20 @@ static void power_pmu_enable(struct pmu *pmu)
>  	local_irq_restore(flags);
>  }
> =20
> +/*
> + * Called from powerpc mobility code
> + * during migration completion to
> + * enable back PMU counters.
> + */
> +void mobility_pmu_enable(void)
> +{
> +	struct cpu_hw_events *cpuhw;
> +
> +	cpuhw =3D this_cpu_ptr(&cpu_hw_events);
> +	power_pmu_enable(NULL);
> +	cpuhw->migrate =3D 0;
> +}
> +
>  static int collect_events(struct perf_event *group, int max_count,
>  			  struct perf_event *ctrs[], u64 *events,
>  			  unsigned int *flags)
> diff --git a/arch/powerpc/platforms/pseries/mobility.c b/arch/powerpc/pla=
tforms/pseries/mobility.c
> index e83e089..ff7a77c 100644
> --- a/arch/powerpc/platforms/pseries/mobility.c
> +++ b/arch/powerpc/platforms/pseries/mobility.c
> @@ -476,6 +476,8 @@ static int do_join(void *arg)
>  retry:
>  	/* Must ensure MSR.EE off for H_JOIN. */
>  	hard_irq_disable();
> +	/* Disable PMU before suspend */
> +	mobility_pmu_disable();
>  	hvrc =3D plpar_hcall_norets(H_JOIN);
> =20
>  	switch (hvrc) {

Does the retry case cause mobility_pmu_disable to be called twice=20
without mobility_pmu_enable called? Would be neater if it was
balanced.


> @@ -530,6 +532,8 @@ static int do_join(void *arg)
>  	 * reset the watchdog.
>  	 */
>  	touch_nmi_watchdog();
> +	/* Enable PMU after resuming */
> +	mobility_pmu_enable();
>  	return ret;
>  }

Not really a big deal but while you're updating it, you could leave=20
touch_nmi_watchdog() at the very end.

Thanks,
Nick
