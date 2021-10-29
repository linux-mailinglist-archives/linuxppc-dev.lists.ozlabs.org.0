Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F48D43FD43
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Oct 2021 15:16:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HgjcK2SyVz306m
	for <lists+linuxppc-dev@lfdr.de>; Sat, 30 Oct 2021 00:16:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Je5fqhzk;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hgjbg6zBsz2yHH
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 30 Oct 2021 00:15:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=Je5fqhzk; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Hgjbd16p7z4xcC;
 Sat, 30 Oct 2021 00:15:41 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1635513341;
 bh=VZvej7N0IeXHmfqJurYYSYiLXRBARmIZLC6Ct8OSmws=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=Je5fqhzkMRoQtdOntntU2hF5qFId7gBHUIzcq/WP/7dardF2EuS4e082UFVf2xlXV
 0/be8cjom2pcQ0Fsv7t84OsNYl6Vi+tJB+095mpwk0iG+Kk6XyvCPTiLID/02x0TSO
 WBzli6GqRRuL0p7RNyq5QCDVybhtgYHVowvoj+cWajb1/tnDAZ6sRvjOep1rDTGH5E
 KVQ1w7dTAcHJ4ZjRmApyiHQ0bl1pfd6+m9U4ZX2DZiPc21EkPxits1T+FZYyyDuiYV
 kz8F7T0A+iucDiiLBJ8NonJPgdYRGM5DEO1+xSmlyvbVbBatlASbOtdnqTYbUw8xph
 1bOBFjdRZY1sw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>, Athira Rajeev
 <atrajeev@linux.vnet.ibm.com>
Subject: Re: [V3] powerpc/perf: Enable PMU counters post partition migration
 if PMU is active
In-Reply-To: <1635487923.hwdpof7s4v.astroid@bobo.none>
References: <20211029030510.58797-1-atrajeev@linux.vnet.ibm.com>
 <1635487923.hwdpof7s4v.astroid@bobo.none>
Date: Sat, 30 Oct 2021 00:15:37 +1100
Message-ID: <87sfwk7z0m.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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

Nicholas Piggin <npiggin@gmail.com> writes:
> Excerpts from Athira Rajeev's message of October 29, 2021 1:05 pm:
>> During Live Partition Migration (LPM), it is observed that perf
>> counter values reports zero post migration completion. However
>> 'perf stat' with workload continues to show counts post migration
>> since PMU gets disabled/enabled during sched switches. But incase
>> of system/cpu wide monitoring, zero counts were reported with 'perf
>> stat' after migration completion.
>> 
>> Example:
>>  ./perf stat -e r1001e -I 1000
>>            time             counts unit events
>>      1.001010437         22,137,414      r1001e
>>      2.002495447         15,455,821      r1001e
>> <<>> As seen in next below logs, the counter values shows zero
>>         after migration is completed.
>> <<>>
>>     86.142535370    129,392,333,440      r1001e
>>     87.144714617                  0      r1001e
>>     88.146526636                  0      r1001e
>>     89.148085029                  0      r1001e
>
> This is the output without the patch? After the patch it keeps counting 
> I suppose? And does the very large count go away too?
>
>> 
>> Here PMU is enabled during start of perf session and counter
>> values are read at intervals. Counters are only disabled at the
>> end of session. The powerpc mobility code presently does not handle
>> disabling and enabling back of PMU counters during partition
>> migration. Also since the PMU register values are not saved/restored
>> during migration, PMU registers like Monitor Mode Control Register 0
>> (MMCR0), Monitor Mode Control Register 1 (MMCR1) will not contain
>> the value it was programmed with. Hence PMU counters will not be
>> enabled correctly post migration.
>> 
>> Fix this in mobility code by handling disabling and enabling of
>> PMU in all cpu's before and after migration. Patch introduces two
>> functions 'mobility_pmu_disable' and 'mobility_pmu_enable'.
>> mobility_pmu_disable() is called before the processor threads goes
>> to suspend state so as to disable the PMU counters. And disable is
>> done only if there are any active events running on that cpu.
>> mobility_pmu_enable() is called after the migrate is done to enable
>> back the PMU counters.
>> 
>> Since the performance Monitor counters ( PMCs) are not
>> saved/restored during LPM, results in PMC value being zero and the
>> 'event->hw.prev_count' being non-zero value. This causes problem
>> during updation of event->count since we always accumulate
>> (event->hw.prev_count - PMC value) in event->count.  If
>> event->hw.prev_count is greater PMC value, event->count becomes
>> negative. To fix this, 'prev_count' also needs to be re-initialised
>> for all events while enabling back the events. Hence read the
>> existing events and clear the PMC index (stored in event->hw.idx)
>> for all events im mobility_pmu_disable. By this way, event count
>> settings will get re-initialised correctly in power_pmu_enable.
>> 
>> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
>> [ Fixed compilation error reported by kernel test robot ]
>> Reported-by: kernel test robot <lkp@intel.com>
>> ---
>> Changelog:
>> Change from v2 -> v3:
>> Addressed review comments from Nicholas Piggin.
>>  - Removed the "migrate" field which was added in initial
>>    patch to address updation of event count settings correctly
>>    in power_pmu_enable. Instead read off existing events in
>>    mobility_pmu_disable before power_pmu_enable.
>>  - Moved the mobility_pmu_disable/enable declaration from
>>    rtas.h to perf event header file.
>> 
>> Addressed review comments from Nathan.
>>  - Moved the mobility function calls from stop_machine
>>    context out to pseries_migrate_partition. Also now this
>>    is a per cpu invocation.
>> 
>> Change from v1 -> v2:
>>  - Moved the mobility_pmu_enable and mobility_pmu_disable
>>    declarations under CONFIG_PPC_PERF_CTRS in rtas.h.
>>    Also included 'asm/rtas.h' in core-book3s to fix the
>>    compilation warning reported by kernel test robot.
>> 
>>  arch/powerpc/include/asm/perf_event.h     |  8 +++++
>>  arch/powerpc/perf/core-book3s.c           | 39 +++++++++++++++++++++++
>>  arch/powerpc/platforms/pseries/mobility.c |  7 ++++
>>  3 files changed, 54 insertions(+)
>> 
>> diff --git a/arch/powerpc/include/asm/perf_event.h b/arch/powerpc/include/asm/perf_event.h
>> index 164e910bf654..88aab6cf840c 100644
>> --- a/arch/powerpc/include/asm/perf_event.h
>> +++ b/arch/powerpc/include/asm/perf_event.h
>> @@ -17,6 +17,14 @@ static inline bool is_sier_available(void) { return false; }
>>  static inline unsigned long get_pmcs_ext_regs(int idx) { return 0; }
>>  #endif
>>  
>> +#ifdef CONFIG_PPC_PERF_CTRS
>> +void mobility_pmu_disable(void *unused);
>> +void mobility_pmu_enable(void *unused);
>> +#else
>> +static inline void mobility_pmu_disable(void *unused) { }
>> +static inline void mobility_pmu_enable(void *unused) { }
>> +#endif
>> +
>>  #ifdef CONFIG_FSL_EMB_PERF_EVENT
>>  #include <asm/perf_event_fsl_emb.h>
>>  #endif
>> diff --git a/arch/powerpc/perf/core-book3s.c b/arch/powerpc/perf/core-book3s.c
>> index 73e62e9b179b..2e8c4c668fa3 100644
>> --- a/arch/powerpc/perf/core-book3s.c
>> +++ b/arch/powerpc/perf/core-book3s.c
>> @@ -1343,6 +1343,33 @@ static void power_pmu_disable(struct pmu *pmu)
>>  	local_irq_restore(flags);
>>  }
>>  
>> +/*
>> + * Called from pseries_migrate_partition() function
>> + * before migration, from powerpc/mobility code.
>> + */

These are only needed if pseries is built, so should be inside a PSERIES
ifdef.

This function should handle iterating over CPUs, that shouldn't be left
up to the mobility.c code.

And the names should be something like pmu_start_migration(),
pmu_finish_migration().

>> +void mobility_pmu_disable(void *unused)
>> +{
>> +	struct cpu_hw_events *cpuhw = this_cpu_ptr(&cpu_hw_events);
>> +	struct perf_event *event;
>> +
>> +	if (cpuhw->n_events != 0) {
>> +		int i;
>> +
>> +		power_pmu_disable(NULL);
>> +		/*
>> +		 * Read off any pre-existing events because the register
>> +		 * values may not be migrated.
>> +		 */
>> +		for (i = 0; i < cpuhw->n_events; ++i) {
>> +			event = cpuhw->event[i];
>> +			if (event->hw.idx) {
>> +				power_pmu_read(event);
>> +				event->hw.idx = 0;
>> +			}
>> +		}
>> +	}
>> +}
>> +
>>  /*
>>   * Re-enable all events if disable == 0.
>>   * If we were previously disabled and events were added, then
>> @@ -1515,6 +1542,18 @@ static void power_pmu_enable(struct pmu *pmu)
>>  	local_irq_restore(flags);
>>  }
>>  
>> +/*
>> + * Called from pseries_migrate_partition() function
>> + * after migration, from powerpc/mobility code.
>> + */
>> +void mobility_pmu_enable(void *unused)
>> +{
>> +	struct cpu_hw_events *cpuhw = this_cpu_ptr(&cpu_hw_events);
>> +
>> +	cpuhw->n_added = cpuhw->n_events;
>> +	power_pmu_enable(NULL);
>> +}
>> +
>>  static int collect_events(struct perf_event *group, int max_count,
>>  			  struct perf_event *ctrs[], u64 *events,
>>  			  unsigned int *flags)
>> diff --git a/arch/powerpc/platforms/pseries/mobility.c b/arch/powerpc/platforms/pseries/mobility.c
>> index e83e0891272d..3e96485ccba4 100644
>> --- a/arch/powerpc/platforms/pseries/mobility.c
>> +++ b/arch/powerpc/platforms/pseries/mobility.c
>> @@ -22,6 +22,7 @@
>>  #include <linux/delay.h>
>>  #include <linux/slab.h>
>>  #include <linux/stringify.h>
>> +#include <linux/perf_event.h>
>>  
>>  #include <asm/machdep.h>
>>  #include <asm/rtas.h>
>> @@ -631,12 +632,18 @@ static int pseries_migrate_partition(u64 handle)
>>  	if (ret)
>>  		return ret;
>>  
>> +	/* Disable PMU before suspend */
>> +	on_each_cpu(&mobility_pmu_disable, NULL, 0);
>
> Why was this moved out of stop machine and to an IPI?
>
> My concern would be, what are the other CPUs doing at this time? Is it 
> possible they could take interrupts and schedule? Could that mess up the
> perf state here?

pseries_migrate_partition() is called directly from migration_store(),
which is the sysfs store function, which can be called concurrently by
different CPUs.

It's also potentially called from rtas_syscall_dispatch_ibm_suspend_me(),
from sys_rtas(), again with no locking.

So we could have two CPUs calling into here at the same time, which
might not crash, but is unlikely to work well.

I think the lack of locking might have been OK in the past because only
one CPU will successfully get the other CPUs to call do_join() in
pseries_suspend(). But I could be wrong.

Anyway, now that we're mutating the PMU state before suspending we need
to be more careful. So I think we need a lock around the whole sequence.

cheers
