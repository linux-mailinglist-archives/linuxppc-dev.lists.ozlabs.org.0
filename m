Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DB04A43A52C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Oct 2021 22:56:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HdS1K5sxDz3036
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Oct 2021 07:56:37 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=MQXHO1K6;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=MQXHO1K6; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HdLxM15F6z2xC7
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Oct 2021 04:07:50 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19PGg6gW022219; 
 Mon, 25 Oct 2021 17:07:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : message-id :
 content-type : mime-version : subject : date : in-reply-to : cc : to :
 references; s=pp1; bh=n7lMWtBn+4P1Y3YU0ZxyQUL5pg44FJUgVoCuVUYm4Jg=;
 b=MQXHO1K6l+ICzfbbkA/puSgyJBqjw5fe/pLuUGlIuUIx/+hDl2L8Ltz1rU4sXNOhddyL
 Pw4JT3IFfP95NtW1BIeAyLgWHpl0zRRqJksTWo2u9liOixJJu+70pbEG4M+pf/gHb6gG
 ivrUv/8/uaitp78zl6i46hEgMrz3zBqHunEDGyTn/W03g6Lw0sF0g18ExfvJ2j23YWtM
 rBXKbzVqJCpzmRbdk3vDinvLimcTrlqYmt00oOyOY2pB+N2THRIoH4PEOBKAPUsxI6Cq
 tEwj7+oyxpQeRuMOBlPagDoQFW2jakeSrGqdgZ/kRfm4oftxBVwbSt5dBX149CMN4Dfe Hg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3bwsvdv38m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 25 Oct 2021 17:07:41 +0000
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 19PH4ema021787;
 Mon, 25 Oct 2021 17:07:40 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3bwsvdv37j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 25 Oct 2021 17:07:40 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 19PH2r0O008956;
 Mon, 25 Oct 2021 17:07:38 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma06ams.nl.ibm.com with ESMTP id 3bv9njh4jb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 25 Oct 2021 17:07:37 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 19PH7Y5O55509266
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 25 Oct 2021 17:07:34 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 40360A4054;
 Mon, 25 Oct 2021 17:07:34 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 43B9EA405C;
 Mon, 25 Oct 2021 17:07:32 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.195.47.16])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Mon, 25 Oct 2021 17:07:32 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Message-Id: <EDB0F140-EEE8-424C-9D15-4D1465BC24F1@linux.vnet.ibm.com>
Content-Type: multipart/alternative;
 boundary="Apple-Mail=_5FBD3CB2-0A64-4B90-9569-1FEC65676D33"
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Re: [PATCH V2] powerpc/perf: Enable PMU counters post partition
 migration if PMU is active
Date: Mon, 25 Oct 2021 22:37:30 +0530
In-Reply-To: <1634812863.5e9oss88pa.astroid@bobo.none>
To: Nicholas Piggin <npiggin@gmail.com>
References: <1626006357-1611-1-git-send-email-atrajeev@linux.vnet.ibm.com>
 <1634812863.5e9oss88pa.astroid@bobo.none>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 42jOBUANUgaFTtUCcdBMAvhYM17tzZQO
X-Proofpoint-GUID: ruf92Emb5XZ7KjqD9coEtTCr4XJfEL1a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-25_06,2021-10-25_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 impostorscore=0 mlxscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 spamscore=0 malwarescore=0 phishscore=0 bulkscore=0 mlxlogscore=999
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2110250099
X-Mailman-Approved-At: Tue, 26 Oct 2021 07:56:00 +1100
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
Cc: maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, rnsastry@linux.ibm.com,
 kjain@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--Apple-Mail=_5FBD3CB2-0A64-4B90-9569-1FEC65676D33
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8



> On 21-Oct-2021, at 4:24 PM, Nicholas Piggin <npiggin@gmail.com> wrote:
>=20
> Excerpts from Athira Rajeev's message of July 11, 2021 10:25 pm:
>> During Live Partition Migration (LPM), it is observed that perf
>> counter values reports zero post migration completion. However
>> 'perf stat' with workload continues to show counts post migration
>> since PMU gets disabled/enabled during sched switches. But incase
>> of system/cpu wide monitoring, zero counts were reported with 'perf
>> stat' after migration completion.
>>=20
>> Example:
>> ./perf stat -e r1001e -I 1000
>>           time             counts unit events
>>     1.001010437         22,137,414      r1001e
>>     2.002495447         15,455,821      r1001e
>> <<>> As seen in next below logs, the counter values shows zero
>>        after migration is completed.
>> <<>>
>>    86.142535370    129,392,333,440      r1001e
>>    87.144714617                  0      r1001e
>>    88.146526636                  0      r1001e
>>    89.148085029                  0      r1001e
>>=20
>> Here PMU is enabled during start of perf session and counter
>> values are read at intervals. Counters are only disabled at the
>> end of session. The powerpc mobility code presently does not handle
>> disabling and enabling back of PMU counters during partition
>> migration. Also since the PMU register values are not saved/restored
>> during migration, PMU registers like Monitor Mode Control Register 0
>> (MMCR0), Monitor Mode Control Register 1 (MMCR1) will not contain
>> the value it was programmed with. Hence PMU counters will not be
>> enabled correctly post migration.
>>=20
>> Fix this in mobility code by handling disabling and enabling of
>> PMU in all cpu's before and after migration. Patch introduces two
>> functions 'mobility_pmu_disable' and 'mobility_pmu_enable'.
>> mobility_pmu_disable() is called before the processor threads goes
>> to suspend state so as to disable the PMU counters. And disable is
>> done only if there are any active events running on that cpu.
>> mobility_pmu_enable() is called after the processor threads are
>> back online to enable back the PMU counters.
>>=20
>> Since the performance Monitor counters ( PMCs) are not
>> saved/restored during LPM, results in PMC value being zero and the
>> 'event->hw.prev_count' being non-zero value. This causes problem
>=20
> Interesting. Are they defined to not be migrated, or may not be=20
> migrated?
>=20
> I wonder what QEMU migration does with PMU registers.
>=20
>> during updation of event->count since we always accumulate
>> (event->hw.prev_count - PMC value) in event->count.  If
>> event->hw.prev_count is greater PMC value, event->count becomes
>> negative. Fix this by re-initialising 'prev_count' also for all
>> events while enabling back the events. A new variable 'migrate' is
>> introduced in 'struct cpu_hw_event' to achieve this for LPM cases
>> in power_pmu_enable. Use the 'migrate' value to clear the PMC
>> index (stored in event->hw.idx) for all events so that event
>> count settings will get re-initialised correctly.
>>=20
>> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
>> [ Fixed compilation error reported by kernel test robot ]
>> Reported-by: kernel test robot <lkp@intel.com>
>> ---
>> Change from v1 -> v2:
>> - Moved the mobility_pmu_enable and mobility_pmu_disable
>>   declarations under CONFIG_PPC_PERF_CTRS in rtas.h.
>>   Also included 'asm/rtas.h' in core-book3s to fix the
>>   compilation warning reported by kernel test robot.
>>=20
>> arch/powerpc/include/asm/rtas.h           |  8 ++++++
>> arch/powerpc/perf/core-book3s.c           | 44 =
++++++++++++++++++++++++++++---
>> arch/powerpc/platforms/pseries/mobility.c |  4 +++
>> 3 files changed, 53 insertions(+), 3 deletions(-)
>>=20
>> diff --git a/arch/powerpc/include/asm/rtas.h =
b/arch/powerpc/include/asm/rtas.h
>> index 9dc97d2..cea72d7 100644
>> --- a/arch/powerpc/include/asm/rtas.h
>> +++ b/arch/powerpc/include/asm/rtas.h
>> @@ -380,5 +380,13 @@ static inline void rtas_initialize(void) { }
>> static inline void read_24x7_sys_info(void) { }
>> #endif
>>=20
>> +#ifdef CONFIG_PPC_PERF_CTRS
>> +void mobility_pmu_disable(void);
>> +void mobility_pmu_enable(void);
>> +#else
>> +static inline void mobility_pmu_disable(void) { }
>> +static inline void mobility_pmu_enable(void) { }
>> +#endif
>> +
>> #endif /* __KERNEL__ */
>> #endif /* _POWERPC_RTAS_H */
>=20
> It's not implemented in rtas, maybe consider putting this into a perf=20=

> header?

Hi Nick,
Thanks for the review comments.

Sure, I will move this to perf_event header file

>=20
>> diff --git a/arch/powerpc/perf/core-book3s.c =
b/arch/powerpc/perf/core-book3s.c
>> index bb0ee71..90da7fa 100644
>> --- a/arch/powerpc/perf/core-book3s.c
>> +++ b/arch/powerpc/perf/core-book3s.c
>> @@ -18,6 +18,7 @@
>> #include <asm/ptrace.h>
>> #include <asm/code-patching.h>
>> #include <asm/interrupt.h>
>> +#include <asm/rtas.h>
>>=20
>> #ifdef CONFIG_PPC64
>> #include "internal.h"
>> @@ -58,6 +59,7 @@ struct cpu_hw_events {
>>=20
>> 	/* Store the PMC values */
>> 	unsigned long pmcs[MAX_HWEVENTS];
>> +	int migrate;
>> };
>>=20
>> static DEFINE_PER_CPU(struct cpu_hw_events, cpu_hw_events);
>> @@ -1335,6 +1337,22 @@ static void power_pmu_disable(struct pmu *pmu)
>> }
>>=20
>> /*
>> + * Called from powerpc mobility code
>> + * before migration to disable counters
>> + * if the PMU is active.
>> + */
>> +void mobility_pmu_disable(void)
>> +{
>> +	struct cpu_hw_events *cpuhw;
>> +
>> +	cpuhw =3D this_cpu_ptr(&cpu_hw_events);
>> +	if (cpuhw->n_events !=3D 0) {
>> +		power_pmu_disable(NULL);
>> +		cpuhw->migrate =3D 1;
>> +	}
>=20
> Rather than add this migrate logic into power_pmu_enable(), would you =
be=20
> able to do the work in the mobility callbacks instead? Something like
> this:
>=20
> void mobility_pmu_disable(void)
> {
>        struct cpu_hw_events *cpuhw;
>=20
>        cpuhw =3D this_cpu_ptr(&cpu_hw_events);
>        if (cpuhw->n_events !=3D 0) {
>                int i;
>=20
>                power_pmu_disable(NULL);
>                /*
>                 * Read off any pre-existing events because the =
register
>                 * values may not be migrated.
>                 */
>                for (i =3D 0; i < cpuhw->n_events; ++i) {
>                        event =3D cpuhw->event[i];
>                        if (event->hw.idx) {
>                                power_pmu_read(event);
>                                event->hw.idx =3D 0;
>                        }
>                }
>        }
> }
>=20
> void mobility_pmu_enable(void)
> {
>        struct cpu_hw_events *cpuhw;
>=20
>        cpuhw =3D this_cpu_ptr(&cpu_hw_events);
>        cpuhw->n_added =3D cpuhw->n_events;
>        power_pmu_enable(NULL);
> }
>=20

Ok Nick, Will address these changes in next version.
With this approach, I won=E2=80=99t need the =E2=80=9Cmigrate=E2=80=9D =
field.
>> +}
>> +
>> +/*
>>  * Re-enable all events if disable =3D=3D 0.
>>  * If we were previously disabled and events were added, then
>>  * put the new config on the PMU.
>> @@ -1379,8 +1397,10 @@ static void power_pmu_enable(struct pmu *pmu)
>> 	 * no need to recalculate MMCR* settings and reset the PMCs.
>> 	 * Just reenable the PMU with the current MMCR* settings
>> 	 * (possibly updated for removal of events).
>> +	 * While reenabling PMU during partition migration, continue
>> +	 * with normal flow.
>> 	 */
>> -	if (!cpuhw->n_added) {
>> +	if (!cpuhw->n_added && !cpuhw->migrate) {
>> 		mtspr(SPRN_MMCRA, cpuhw->mmcr.mmcra & =
~MMCRA_SAMPLE_ENABLE);
>> 		mtspr(SPRN_MMCR1, cpuhw->mmcr.mmcr1);
>> 		if (ppmu->flags & PPMU_ARCH_31)
>> @@ -1434,11 +1454,15 @@ static void power_pmu_enable(struct pmu *pmu)
>> 	/*
>> 	 * Read off any pre-existing events that need to move
>> 	 * to another PMC.
>> +	 * While enabling PMU during partition migration,
>> +	 * skip power_pmu_read since all event count settings
>> +	 * needs to be re-initialised after migration.
>> 	 */
>> 	for (i =3D 0; i < cpuhw->n_events; ++i) {
>> 		event =3D cpuhw->event[i];
>> -		if (event->hw.idx && event->hw.idx !=3D hwc_index[i] + =
1) {
>> -			power_pmu_read(event);
>> +		if ((event->hw.idx && event->hw.idx !=3D hwc_index[i] + =
1) || (cpuhw->migrate)) {
>> +			if (!cpuhw->migrate)
>> +				power_pmu_read(event);
>> 			write_pmc(event->hw.idx, 0);
>> 			event->hw.idx =3D 0;
>> 		}
>> @@ -1506,6 +1530,20 @@ static void power_pmu_enable(struct pmu *pmu)
>> 	local_irq_restore(flags);
>> }
>>=20
>> +/*
>> + * Called from powerpc mobility code
>> + * during migration completion to
>> + * enable back PMU counters.
>> + */
>> +void mobility_pmu_enable(void)
>> +{
>> +	struct cpu_hw_events *cpuhw;
>> +
>> +	cpuhw =3D this_cpu_ptr(&cpu_hw_events);
>> +	power_pmu_enable(NULL);
>> +	cpuhw->migrate =3D 0;
>> +}
>> +
>> static int collect_events(struct perf_event *group, int max_count,
>> 			  struct perf_event *ctrs[], u64 *events,
>> 			  unsigned int *flags)
>> diff --git a/arch/powerpc/platforms/pseries/mobility.c =
b/arch/powerpc/platforms/pseries/mobility.c
>> index e83e089..ff7a77c 100644
>> --- a/arch/powerpc/platforms/pseries/mobility.c
>> +++ b/arch/powerpc/platforms/pseries/mobility.c
>> @@ -476,6 +476,8 @@ static int do_join(void *arg)
>> retry:
>> 	/* Must ensure MSR.EE off for H_JOIN. */
>> 	hard_irq_disable();
>> +	/* Disable PMU before suspend */
>> +	mobility_pmu_disable();
>> 	hvrc =3D plpar_hcall_norets(H_JOIN);
>>=20
>> 	switch (hvrc) {
>=20
> Does the retry case cause mobility_pmu_disable to be called twice=20
> without mobility_pmu_enable called? Would be neater if it was
> balanced.
>=20

I will be moving these mobility callbacks to =
=E2=80=9Cpseries_migrate_partition=E2=80=9D as Nathan suggested.
Will send a V3 with new changes.=20

Thanks
Athira

>=20
>> @@ -530,6 +532,8 @@ static int do_join(void *arg)
>> 	 * reset the watchdog.
>> 	 */
>> 	touch_nmi_watchdog();
>> +	/* Enable PMU after resuming */
>> +	mobility_pmu_enable();
>> 	return ret;
>> }
>=20
> Not really a big deal but while you're updating it, you could leave=20
> touch_nmi_watchdog() at the very end.
>=20
> Thanks,
> Nick


--Apple-Mail=_5FBD3CB2-0A64-4B90-9569-1FEC65676D33
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dutf-8"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" class=3D""><br =
class=3D""><div><br class=3D""><blockquote type=3D"cite" class=3D""><div =
class=3D"">On 21-Oct-2021, at 4:24 PM, Nicholas Piggin &lt;<a =
href=3D"mailto:npiggin@gmail.com" class=3D"">npiggin@gmail.com</a>&gt; =
wrote:</div><br class=3D"Apple-interchange-newline"><div class=3D""><meta =
charset=3D"UTF-8" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">Excerpts from Athira Rajeev's message of July 11, 2021 10:25 =
pm:</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><blockquote type=3D"cite" style=3D"font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; orphans: auto; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D"">During =
Live Partition Migration (LPM), it is observed that perf<br =
class=3D"">counter values reports zero post migration completion. =
However<br class=3D"">'perf stat' with workload continues to show counts =
post migration<br class=3D"">since PMU gets disabled/enabled during =
sched switches. But incase<br class=3D"">of system/cpu wide monitoring, =
zero counts were reported with 'perf<br class=3D"">stat' after migration =
completion.<br class=3D""><br class=3D"">Example:<br class=3D"">./perf =
stat -e r1001e -I 1000<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;tim=
e =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;co=
unts unit events<br class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;1.001010437 =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;22,137,414 =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;r1001e<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;2.002495447 =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;15,455,821 =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;r1001e<br class=3D"">&lt;&lt;&gt;&gt; As =
seen in next below logs, the counter values shows zero<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;after migration is =
completed.<br class=3D"">&lt;&lt;&gt;&gt;<br =
class=3D"">&nbsp;&nbsp;&nbsp;86.142535370 =
&nbsp;&nbsp;&nbsp;129,392,333,440 =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;r1001e<br =
class=3D"">&nbsp;&nbsp;&nbsp;87.144714617 =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;0 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;r1001e<br =
class=3D"">&nbsp;&nbsp;&nbsp;88.146526636 =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;0 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;r1001e<br =
class=3D"">&nbsp;&nbsp;&nbsp;89.148085029 =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;0 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;r1001e<br =
class=3D""><br class=3D"">Here PMU is enabled during start of perf =
session and counter<br class=3D"">values are read at intervals. Counters =
are only disabled at the<br class=3D"">end of session. The powerpc =
mobility code presently does not handle<br class=3D"">disabling and =
enabling back of PMU counters during partition<br class=3D"">migration. =
Also since the PMU register values are not saved/restored<br =
class=3D"">during migration, PMU registers like Monitor Mode Control =
Register 0<br class=3D"">(MMCR0), Monitor Mode Control Register 1 =
(MMCR1) will not contain<br class=3D"">the value it was programmed with. =
Hence PMU counters will not be<br class=3D"">enabled correctly post =
migration.<br class=3D""><br class=3D"">Fix this in mobility code by =
handling disabling and enabling of<br class=3D"">PMU in all cpu's before =
and after migration. Patch introduces two<br class=3D"">functions =
'mobility_pmu_disable' and 'mobility_pmu_enable'.<br =
class=3D"">mobility_pmu_disable() is called before the processor threads =
goes<br class=3D"">to suspend state so as to disable the PMU counters. =
And disable is<br class=3D"">done only if there are any active events =
running on that cpu.<br class=3D"">mobility_pmu_enable() is called after =
the processor threads are<br class=3D"">back online to enable back the =
PMU counters.<br class=3D""><br class=3D"">Since the performance Monitor =
counters ( PMCs) are not<br class=3D"">saved/restored during LPM, =
results in PMC value being zero and the<br =
class=3D"">'event-&gt;hw.prev_count' being non-zero value. This causes =
problem<br class=3D""></blockquote><br style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">Interesting. Are they defined to not be migrated, or may not =
be<span class=3D"Apple-converted-space">&nbsp;</span></span><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D""><span =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none; float: none; =
display: inline !important;" class=3D"">migrated?</span><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D""><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D""><span =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none; float: none; =
display: inline !important;" class=3D"">I wonder what QEMU migration =
does with PMU registers.</span><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><br style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><blockquote type=3D"cite" =
style=3D"font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
orphans: auto; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D"">during updation of event-&gt;count =
since we always accumulate<br class=3D"">(event-&gt;hw.prev_count - PMC =
value) in event-&gt;count. &nbsp;If<br class=3D"">event-&gt;hw.prev_count =
is greater PMC value, event-&gt;count becomes<br class=3D"">negative. =
Fix this by re-initialising 'prev_count' also for all<br class=3D"">events=
 while enabling back the events. A new variable 'migrate' is<br =
class=3D"">introduced in 'struct cpu_hw_event' to achieve this for LPM =
cases<br class=3D"">in power_pmu_enable. Use the 'migrate' value to =
clear the PMC<br class=3D"">index (stored in event-&gt;hw.idx) for all =
events so that event<br class=3D"">count settings will get =
re-initialised correctly.<br class=3D""><br class=3D"">Signed-off-by: =
Athira Rajeev &lt;<a href=3D"mailto:atrajeev@linux.vnet.ibm.com" =
class=3D"">atrajeev@linux.vnet.ibm.com</a>&gt;<br class=3D"">[ Fixed =
compilation error reported by kernel test robot ]<br =
class=3D"">Reported-by: kernel test robot &lt;<a =
href=3D"mailto:lkp@intel.com" class=3D"">lkp@intel.com</a>&gt;<br =
class=3D"">---<br class=3D"">Change from v1 -&gt; v2:<br class=3D"">- =
Moved the mobility_pmu_enable and mobility_pmu_disable<br =
class=3D"">&nbsp;&nbsp;declarations under CONFIG_PPC_PERF_CTRS in =
rtas.h.<br class=3D"">&nbsp;&nbsp;Also included 'asm/rtas.h' in =
core-book3s to fix the<br class=3D"">&nbsp;&nbsp;compilation warning =
reported by kernel test robot.<br class=3D""><br =
class=3D"">arch/powerpc/include/asm/rtas.h =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;| &nbsp;8 =
++++++<br class=3D"">arch/powerpc/perf/core-book3s.c =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;| 44 =
++++++++++++++++++++++++++++---<br =
class=3D"">arch/powerpc/platforms/pseries/mobility.c | &nbsp;4 +++<br =
class=3D"">3 files changed, 53 insertions(+), 3 deletions(-)<br =
class=3D""><br class=3D"">diff --git a/arch/powerpc/include/asm/rtas.h =
b/arch/powerpc/include/asm/rtas.h<br class=3D"">index 9dc97d2..cea72d7 =
100644<br class=3D"">--- a/arch/powerpc/include/asm/rtas.h<br =
class=3D"">+++ b/arch/powerpc/include/asm/rtas.h<br class=3D"">@@ -380,5 =
+380,13 @@ static inline void rtas_initialize(void) { }<br =
class=3D"">static inline void read_24x7_sys_info(void) { }<br =
class=3D"">#endif<br class=3D""><br class=3D"">+#ifdef =
CONFIG_PPC_PERF_CTRS<br class=3D"">+void mobility_pmu_disable(void);<br =
class=3D"">+void mobility_pmu_enable(void);<br class=3D"">+#else<br =
class=3D"">+static inline void mobility_pmu_disable(void) { }<br =
class=3D"">+static inline void mobility_pmu_enable(void) { }<br =
class=3D"">+#endif<br class=3D"">+<br class=3D"">#endif /* __KERNEL__ =
*/<br class=3D"">#endif /* _POWERPC_RTAS_H */<br =
class=3D""></blockquote><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">It's not implemented in rtas, maybe consider putting this =
into a perf<span class=3D"Apple-converted-space">&nbsp;</span></span><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D""><span =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none; float: none; =
display: inline !important;" class=3D"">header?</span><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;" =
class=3D""></div></blockquote><div><br class=3D""></div><div>Hi =
Nick,</div><div>Thanks for the review comments.</div><div><br =
class=3D""></div><div>Sure, I will move this to perf_event header =
file</div><br class=3D""><blockquote type=3D"cite" class=3D""><div =
class=3D""><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><blockquote type=3D"cite" style=3D"font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; orphans: auto; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D"">diff =
--git a/arch/powerpc/perf/core-book3s.c =
b/arch/powerpc/perf/core-book3s.c<br class=3D"">index bb0ee71..90da7fa =
100644<br class=3D"">--- a/arch/powerpc/perf/core-book3s.c<br =
class=3D"">+++ b/arch/powerpc/perf/core-book3s.c<br class=3D"">@@ -18,6 =
+18,7 @@<br class=3D"">#include &lt;asm/ptrace.h&gt;<br =
class=3D"">#include &lt;asm/code-patching.h&gt;<br class=3D"">#include =
&lt;asm/interrupt.h&gt;<br class=3D"">+#include &lt;asm/rtas.h&gt;<br =
class=3D""><br class=3D"">#ifdef CONFIG_PPC64<br class=3D"">#include =
"internal.h"<br class=3D"">@@ -58,6 +59,7 @@ struct cpu_hw_events {<br =
class=3D""><br class=3D""><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>/* Store the PMC values */<br =
class=3D""><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>unsigned long pmcs[MAX_HWEVENTS];<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>int =
migrate;<br class=3D"">};<br class=3D""><br class=3D"">static =
DEFINE_PER_CPU(struct cpu_hw_events, cpu_hw_events);<br class=3D"">@@ =
-1335,6 +1337,22 @@ static void power_pmu_disable(struct pmu *pmu)<br =
class=3D"">}<br class=3D""><br class=3D"">/*<br class=3D"">+ * Called =
from powerpc mobility code<br class=3D"">+ * before migration to disable =
counters<br class=3D"">+ * if the PMU is active.<br class=3D"">+ */<br =
class=3D"">+void mobility_pmu_disable(void)<br class=3D"">+{<br =
class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>struct cpu_hw_events *cpuhw;<br class=3D"">+<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>cpuhw =3D =
this_cpu_ptr(&amp;cpu_hw_events);<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>if =
(cpuhw-&gt;n_events !=3D 0) {<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>power_pmu_disable(NULL);<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>cpuhw-&gt;migrate =3D 1;<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>}<br =
class=3D""></blockquote><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">Rather than add this migrate logic into power_pmu_enable(), =
would you be<span class=3D"Apple-converted-space">&nbsp;</span></span><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D""><span =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none; float: none; =
display: inline !important;" class=3D"">able to do the work in the =
mobility callbacks instead? Something like</span><br style=3D"caret-color:=
 rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">this:</span><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><br style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">void mobility_pmu_disable(void)</span><br style=3D"caret-color:=
 rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">{</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;" =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;struct =
cpu_hw_events *cpuhw;</span><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><br style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;cpuhw =3D =
this_cpu_ptr(&amp;cpu_hw_events);</span><br style=3D"caret-color: rgb(0, =
0, 0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if =
(cpuhw-&gt;n_events !=3D 0) {</span><br style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;int i;</span><br style=3D"caret-color: rgb(0, =
0, 0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><br style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;power_pmu_disable(NULL);</span><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D""><span =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none; float: none; =
display: inline !important;" =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;/*</span><br style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;* Read off any pre-existing events =
because the register</span><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;* values may not be migrated.</span><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D""><span =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none; float: none; =
display: inline !important;" =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*/</span><br style=3D"caret-color: =
rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;for (i =3D 0; i &lt; cpuhw-&gt;n_events; ++i) =
{</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; =
font-size: 12px; font-style: normal; font-variant-caps: normal; =
font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;" =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;event =3D cpuhw-&gt;event[i];</span><br style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;if (event-&gt;hw.idx) {</span><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;power_pmu_read(event);</s=
pan><br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; =
font-size: 12px; font-style: normal; font-variant-caps: normal; =
font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;" =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;event-&gt;hw.idx =3D =
0;</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; =
font-size: 12px; font-style: normal; font-variant-caps: normal; =
font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;" =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;}</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; =
font-size: 12px; font-style: normal; font-variant-caps: normal; =
font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;" =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;}</span><br style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}</span><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D""><span =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none; float: none; =
display: inline !important;" class=3D"">}</span><br style=3D"caret-color: =
rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><br style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">void mobility_pmu_enable(void)</span><br style=3D"caret-color: =
rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">{</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;" =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;struct =
cpu_hw_events *cpuhw;</span><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><br style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;cpuhw =3D =
this_cpu_ptr(&amp;cpu_hw_events);</span><br style=3D"caret-color: rgb(0, =
0, 0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;cpuhw-&gt;n_added =3D=
 cpuhw-&gt;n_events;</span><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;power_pmu_enable(NULL=
);</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; =
font-size: 12px; font-style: normal; font-variant-caps: normal; =
font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;" class=3D"">}</span><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D""><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;" =
class=3D""></div></blockquote><div><br class=3D""></div><div>Ok Nick, =
Will address these changes in next version.</div><div>With this =
approach, I won=E2=80=99t need the =E2=80=9Cmigrate=E2=80=9D =
field.</div><blockquote type=3D"cite" class=3D""><div =
class=3D""><blockquote type=3D"cite" style=3D"font-family: Helvetica; =
font-size: 12px; font-style: normal; font-variant-caps: normal; =
font-weight: normal; letter-spacing: normal; orphans: auto; text-align: =
start; text-indent: 0px; text-transform: none; white-space: normal; =
widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D"">+}<br =
class=3D"">+<br class=3D"">+/*<br class=3D"">&nbsp;* Re-enable all =
events if disable =3D=3D 0.<br class=3D"">&nbsp;* If we were previously =
disabled and events were added, then<br class=3D"">&nbsp;* put the new =
config on the PMU.<br class=3D"">@@ -1379,8 +1397,10 @@ static void =
power_pmu_enable(struct pmu *pmu)<br class=3D""><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-converted-space">&nbsp;</span>* no need to recalculate =
MMCR* settings and reset the PMCs.<br class=3D""><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-converted-space">&nbsp;</span>* Just reenable the PMU =
with the current MMCR* settings<br class=3D""><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-converted-space">&nbsp;</span>* (possibly updated for =
removal of events).<br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span =
class=3D"Apple-converted-space">&nbsp;</span>* While reenabling PMU =
during partition migration, continue<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-converted-space">&nbsp;</span>* with normal flow.<br =
class=3D""><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-converted-space">&nbsp;</span>*/<br =
class=3D"">-<span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>if (!cpuhw-&gt;n_added) {<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>if =
(!cpuhw-&gt;n_added &amp;&amp; !cpuhw-&gt;migrate) {<br class=3D""><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>mtspr(SPRN_MMCRA, cpuhw-&gt;mmcr.mmcra &amp; =
~MMCRA_SAMPLE_ENABLE);<br class=3D""><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>mtspr(SPRN_MMCR1, =
cpuhw-&gt;mmcr.mmcr1);<br class=3D""><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>if (ppmu-&gt;flags &amp; =
PPMU_ARCH_31)<br class=3D"">@@ -1434,11 +1454,15 @@ static void =
power_pmu_enable(struct pmu *pmu)<br class=3D""><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>/*<br =
class=3D""><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-converted-space">&nbsp;</span>* Read off any =
pre-existing events that need to move<br class=3D""><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-converted-space">&nbsp;</span>* to another PMC.<br =
class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-converted-space">&nbsp;</span>* While =
enabling PMU during partition migration,<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-converted-space">&nbsp;</span>* skip power_pmu_read since =
all event count settings<br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span =
class=3D"Apple-converted-space">&nbsp;</span>* needs to be =
re-initialised after migration.<br class=3D""><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-converted-space">&nbsp;</span>*/<br class=3D""><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>for (i =3D =
0; i &lt; cpuhw-&gt;n_events; ++i) {<br class=3D""><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>event =3D =
cpuhw-&gt;event[i];<br class=3D"">-<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>if (event-&gt;hw.idx &amp;&amp; =
event-&gt;hw.idx !=3D hwc_index[i] + 1) {<br class=3D"">-<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>power_pmu_read(event);<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>if =
((event-&gt;hw.idx &amp;&amp; event-&gt;hw.idx !=3D hwc_index[i] + 1) || =
(cpuhw-&gt;migrate)) {<br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>if (!cpuhw-&gt;migrate)<br =
class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>power_pmu_read(event);<br class=3D""><span class=3D"Apple-tab-span"=
 style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>write_pmc(event-&gt;hw.idx, =
0);<br class=3D""><span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span><span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span><span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span>event-&gt;hw.idx =3D 0;<br class=3D""><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>}<br =
class=3D"">@@ -1506,6 +1530,20 @@ static void power_pmu_enable(struct =
pmu *pmu)<br class=3D""><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>local_irq_restore(flags);<br =
class=3D"">}<br class=3D""><br class=3D"">+/*<br class=3D"">+ * Called =
from powerpc mobility code<br class=3D"">+ * during migration completion =
to<br class=3D"">+ * enable back PMU counters.<br class=3D"">+ */<br =
class=3D"">+void mobility_pmu_enable(void)<br class=3D"">+{<br =
class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>struct cpu_hw_events *cpuhw;<br class=3D"">+<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>cpuhw =3D =
this_cpu_ptr(&amp;cpu_hw_events);<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>power_pmu_enable(NULL);<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>cpuhw-&gt;migrate =3D 0;<br class=3D"">+}<br class=3D"">+<br =
class=3D"">static int collect_events(struct perf_event *group, int =
max_count,<br class=3D""><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span =
class=3D"Apple-converted-space">&nbsp;</span>&nbsp;struct perf_event =
*ctrs[], u64 *events,<br class=3D""><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span =
class=3D"Apple-converted-space">&nbsp;</span>&nbsp;unsigned int =
*flags)<br class=3D"">diff --git =
a/arch/powerpc/platforms/pseries/mobility.c =
b/arch/powerpc/platforms/pseries/mobility.c<br class=3D"">index =
e83e089..ff7a77c 100644<br class=3D"">--- =
a/arch/powerpc/platforms/pseries/mobility.c<br class=3D"">+++ =
b/arch/powerpc/platforms/pseries/mobility.c<br class=3D"">@@ -476,6 =
+476,8 @@ static int do_join(void *arg)<br class=3D"">retry:<br =
class=3D""><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>/* Must ensure MSR.EE off for H_JOIN. */<br class=3D""><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>hard_irq_disable();<br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>/* Disable PMU before suspend =
*/<br class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span>mobility_pmu_disable();<br class=3D""><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>hvrc =3D =
plpar_hcall_norets(H_JOIN);<br class=3D""><br class=3D""><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>switch =
(hvrc) {<br class=3D""></blockquote><br style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">Does the retry case cause mobility_pmu_disable to be called =
twice<span class=3D"Apple-converted-space">&nbsp;</span></span><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D""><span =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none; float: none; =
display: inline !important;" class=3D"">without mobility_pmu_enable =
called? Would be neater if it was</span><br style=3D"caret-color: rgb(0, =
0, 0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">balanced.</span><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><br style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""></div></blockquote><div><br =
class=3D""></div><div>I will be moving these mobility callbacks to =
=E2=80=9Cpseries_migrate_partition=E2=80=9D as Nathan =
suggested.</div><div>Will send a V3 with new =
changes.&nbsp;</div><div><br =
class=3D""></div><div>Thanks</div><div>Athira</div><br =
class=3D""><blockquote type=3D"cite" class=3D""><div class=3D""><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;" =
class=3D""><blockquote type=3D"cite" style=3D"font-family: Helvetica; =
font-size: 12px; font-style: normal; font-variant-caps: normal; =
font-weight: normal; letter-spacing: normal; orphans: auto; text-align: =
start; text-indent: 0px; text-transform: none; white-space: normal; =
widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D"">@@ =
-530,6 +532,8 @@ static int do_join(void *arg)<br class=3D""><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-converted-space">&nbsp;</span>* reset the watchdog.<br =
class=3D""><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-converted-space">&nbsp;</span>*/<br =
class=3D""><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>touch_nmi_watchdog();<br class=3D"">+<span class=3D"Apple-tab-span"=
 style=3D"white-space: pre;">	</span>/* Enable PMU after resuming =
*/<br class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span>mobility_pmu_enable();<br class=3D""><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>return =
ret;<br class=3D"">}<br class=3D""></blockquote><br style=3D"caret-color: =
rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">Not really a big deal but while you're updating it, you could =
leave<span class=3D"Apple-converted-space">&nbsp;</span></span><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D""><span =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none; float: none; =
display: inline !important;" class=3D"">touch_nmi_watchdog() at the very =
end.</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;" =
class=3D"">Thanks,</span><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">Nick</span></div></blockquote></div><br =
class=3D""></body></html>=

--Apple-Mail=_5FBD3CB2-0A64-4B90-9569-1FEC65676D33--

