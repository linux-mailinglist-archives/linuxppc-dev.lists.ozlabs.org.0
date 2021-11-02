Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 16AE4442D14
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Nov 2021 12:47:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hk7Ry02Wjz3fvZ
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Nov 2021 22:47:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=gZwdW5H6;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=gZwdW5H6; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hk6Sp3Q04z2xCW
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Nov 2021 22:03:05 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1A2B0Pbo021533; 
 Tue, 2 Nov 2021 11:03:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : message-id :
 content-type : subject : date : in-reply-to : cc : to : references :
 mime-version; s=pp1; bh=XSNeJ9R/eUoU6qvUoGAhTyTQTrguJAy76ZCgRv9Z4R0=;
 b=gZwdW5H6oMkJhmA8mmcCbqlSXNjPfeksaejjUMTIRzor57/l8qO4KmpF3GH1TWMnUSWx
 Tbxsu+SdR9uFm5XHpFi3WGaQ2A1E6Wl3UAF8viAVwCyYm9BrQwio0kOYFuMPwSkAcwPO
 qTfZ+nRP6I4jetIIfXWINNWT9b5DDUH6iCSxIcqE3d9YOZBvHddEVcVGgbPh9xKL5vNI
 +0OHkCJO7ec3AQn54cMNGpE7lulkdl9ILH9M2ndTJmqyuHIpPycQhY2NLY3GUYW9mtK5
 mjZLj/kXbd0zCw2KXRGlpngBojERtNjxaGvwesWpoNlN5JupOjFLqUGCNLbKFZZJqvzd +A== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3c31afv145-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Nov 2021 11:03:00 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1A2B2xbl017493;
 Tue, 2 Nov 2021 11:02:59 GMT
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3c31afv133-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Nov 2021 11:02:59 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1A2AwiTG022282;
 Tue, 2 Nov 2021 11:02:57 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma04fra.de.ibm.com with ESMTP id 3c0wpb1513-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Nov 2021 11:02:56 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1A2B2qIP39715200
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 2 Nov 2021 11:02:52 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E75B2AE1B6;
 Tue,  2 Nov 2021 11:02:51 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 16EF4AE1DC;
 Tue,  2 Nov 2021 11:02:50 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.79.185.80])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Tue,  2 Nov 2021 11:02:49 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Message-Id: <552CB828-5F44-4310-A46A-81E27DED14A2@linux.vnet.ibm.com>
Content-Type: multipart/alternative;
 boundary="Apple-Mail=_E7DA0791-9739-4362-82CB-0FEBFED4F8D2"
Subject: Re: [V3] powerpc/perf: Enable PMU counters post partition migration
 if PMU is active
Date: Tue, 2 Nov 2021 16:30:33 +0530
In-Reply-To: <87sfwk7z0m.fsf@mpe.ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>
References: <20211029030510.58797-1-atrajeev@linux.vnet.ibm.com>
 <1635487923.hwdpof7s4v.astroid@bobo.none> <87sfwk7z0m.fsf@mpe.ellerman.id.au>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: oKMOEQl5AiC2uT3tS7uFAuqT7dSAJNQi
X-Proofpoint-ORIG-GUID: uv7BUpXE2l-hBiQHczczUU299iRl7CcZ
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-02_06,2021-11-02_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 impostorscore=0
 suspectscore=0 adultscore=0 priorityscore=1501 clxscore=1015 phishscore=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2111020065
X-Mailman-Approved-At: Tue, 02 Nov 2021 22:39:50 +1100
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>, maddy@linux.vnet.ibm.com,
 rnsastry@linux.ibm.com, kjain@linux.ibm.com,
 Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--Apple-Mail=_E7DA0791-9739-4362-82CB-0FEBFED4F8D2
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable



> On 29-Oct-2021, at 6:45 PM, Michael Ellerman <mpe@ellerman.id.au> wrote:
>=20
> Nicholas Piggin <npiggin@gmail.com <mailto:npiggin@gmail.com>> writes:
>> Excerpts from Athira Rajeev's message of October 29, 2021 1:05 pm:
>>> During Live Partition Migration (LPM), it is observed that perf
>>> counter values reports zero post migration completion. However
>>> 'perf stat' with workload continues to show counts post migration
>>> since PMU gets disabled/enabled during sched switches. But incase
>>> of system/cpu wide monitoring, zero counts were reported with 'perf
>>> stat' after migration completion.
>>>=20
>>> Example:
>>> ./perf stat -e r1001e -I 1000
>>>           time             counts unit events
>>>     1.001010437         22,137,414      r1001e
>>>     2.002495447         15,455,821      r1001e
>>> <<>> As seen in next below logs, the counter values shows zero
>>>        after migration is completed.
>>> <<>>
>>>    86.142535370    129,392,333,440      r1001e
>>>    87.144714617                  0      r1001e
>>>    88.146526636                  0      r1001e
>>>    89.148085029                  0      r1001e
>>=20
>> This is the output without the patch? After the patch it keeps counting=
=20
>> I suppose? And does the very large count go away too?
>>=20
>>>=20
>>> Here PMU is enabled during start of perf session and counter
>>> values are read at intervals. Counters are only disabled at the
>>> end of session. The powerpc mobility code presently does not handle
>>> disabling and enabling back of PMU counters during partition
>>> migration. Also since the PMU register values are not saved/restored
>>> during migration, PMU registers like Monitor Mode Control Register 0
>>> (MMCR0), Monitor Mode Control Register 1 (MMCR1) will not contain
>>> the value it was programmed with. Hence PMU counters will not be
>>> enabled correctly post migration.
>>>=20
>>> Fix this in mobility code by handling disabling and enabling of
>>> PMU in all cpu's before and after migration. Patch introduces two
>>> functions 'mobility_pmu_disable' and 'mobility_pmu_enable'.
>>> mobility_pmu_disable() is called before the processor threads goes
>>> to suspend state so as to disable the PMU counters. And disable is
>>> done only if there are any active events running on that cpu.
>>> mobility_pmu_enable() is called after the migrate is done to enable
>>> back the PMU counters.
>>>=20
>>> Since the performance Monitor counters ( PMCs) are not
>>> saved/restored during LPM, results in PMC value being zero and the
>>> 'event->hw.prev_count' being non-zero value. This causes problem
>>> during updation of event->count since we always accumulate
>>> (event->hw.prev_count - PMC value) in event->count.  If
>>> event->hw.prev_count is greater PMC value, event->count becomes
>>> negative. To fix this, 'prev_count' also needs to be re-initialised
>>> for all events while enabling back the events. Hence read the
>>> existing events and clear the PMC index (stored in event->hw.idx)
>>> for all events im mobility_pmu_disable. By this way, event count
>>> settings will get re-initialised correctly in power_pmu_enable.
>>>=20
>>> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
>>> [ Fixed compilation error reported by kernel test robot ]
>>> Reported-by: kernel test robot <lkp@intel.com>
>>> ---
>>> Changelog:
>>> Change from v2 -> v3:
>>> Addressed review comments from Nicholas Piggin.
>>> - Removed the "migrate" field which was added in initial
>>>   patch to address updation of event count settings correctly
>>>   in power_pmu_enable. Instead read off existing events in
>>>   mobility_pmu_disable before power_pmu_enable.
>>> - Moved the mobility_pmu_disable/enable declaration from
>>>   rtas.h to perf event header file.
>>>=20
>>> Addressed review comments from Nathan.
>>> - Moved the mobility function calls from stop_machine
>>>   context out to pseries_migrate_partition. Also now this
>>>   is a per cpu invocation.
>>>=20
>>> Change from v1 -> v2:
>>> - Moved the mobility_pmu_enable and mobility_pmu_disable
>>>   declarations under CONFIG_PPC_PERF_CTRS in rtas.h.
>>>   Also included 'asm/rtas.h' in core-book3s to fix the
>>>   compilation warning reported by kernel test robot.
>>>=20
>>> arch/powerpc/include/asm/perf_event.h     |  8 +++++
>>> arch/powerpc/perf/core-book3s.c           | 39 +++++++++++++++++++++++
>>> arch/powerpc/platforms/pseries/mobility.c |  7 ++++
>>> 3 files changed, 54 insertions(+)
>>>=20
>>> diff --git a/arch/powerpc/include/asm/perf_event.h b/arch/powerpc/inclu=
de/asm/perf_event.h
>>> index 164e910bf654..88aab6cf840c 100644
>>> --- a/arch/powerpc/include/asm/perf_event.h
>>> +++ b/arch/powerpc/include/asm/perf_event.h
>>> @@ -17,6 +17,14 @@ static inline bool is_sier_available(void) { return =
false; }
>>> static inline unsigned long get_pmcs_ext_regs(int idx) { return 0; }
>>> #endif
>>>=20
>>> +#ifdef CONFIG_PPC_PERF_CTRS
>>> +void mobility_pmu_disable(void *unused);
>>> +void mobility_pmu_enable(void *unused);
>>> +#else
>>> +static inline void mobility_pmu_disable(void *unused) { }
>>> +static inline void mobility_pmu_enable(void *unused) { }
>>> +#endif
>>> +
>>> #ifdef CONFIG_FSL_EMB_PERF_EVENT
>>> #include <asm/perf_event_fsl_emb.h>
>>> #endif
>>> diff --git a/arch/powerpc/perf/core-book3s.c b/arch/powerpc/perf/core-b=
ook3s.c
>>> index 73e62e9b179b..2e8c4c668fa3 100644
>>> --- a/arch/powerpc/perf/core-book3s.c
>>> +++ b/arch/powerpc/perf/core-book3s.c
>>> @@ -1343,6 +1343,33 @@ static void power_pmu_disable(struct pmu *pmu)
>>> 	local_irq_restore(flags);
>>> }
>>>=20
>>> +/*
>>> + * Called from pseries_migrate_partition() function
>>> + * before migration, from powerpc/mobility code.
>>> + */
>=20
> These are only needed if pseries is built, so should be inside a PSERIES
> ifdef.

Sure mpe, will address this change in next version
>=20
> This function should handle iterating over CPUs, that shouldn't be left
> up to the mobility.c code.
>=20
> And the names should be something like pmu_start_migration(),
> pmu_finish_migration().

Ok, will change
>=20
>>> +void mobility_pmu_disable(void *unused)
>>> +{
>>> +	struct cpu_hw_events *cpuhw =3D this_cpu_ptr(&cpu_hw_events);
>>> +	struct perf_event *event;
>>> +
>>> +	if (cpuhw->n_events !=3D 0) {
>>> +		int i;
>>> +
>>> +		power_pmu_disable(NULL);
>>> +		/*
>>> +		 * Read off any pre-existing events because the register
>>> +		 * values may not be migrated.
>>> +		 */
>>> +		for (i =3D 0; i < cpuhw->n_events; ++i) {
>>> +			event =3D cpuhw->event[i];
>>> +			if (event->hw.idx) {
>>> +				power_pmu_read(event);
>>> +				event->hw.idx =3D 0;
>>> +			}
>>> +		}
>>> +	}
>>> +}
>>> +
>>> /*
>>>  * Re-enable all events if disable =3D=3D 0.
>>>  * If we were previously disabled and events were added, then
>>> @@ -1515,6 +1542,18 @@ static void power_pmu_enable(struct pmu *pmu)
>>> 	local_irq_restore(flags);
>>> }
>>>=20
>>> +/*
>>> + * Called from pseries_migrate_partition() function
>>> + * after migration, from powerpc/mobility code.
>>> + */
>>> +void mobility_pmu_enable(void *unused)
>>> +{
>>> +	struct cpu_hw_events *cpuhw =3D this_cpu_ptr(&cpu_hw_events);
>>> +
>>> +	cpuhw->n_added =3D cpuhw->n_events;
>>> +	power_pmu_enable(NULL);
>>> +}
>>> +
>>> static int collect_events(struct perf_event *group, int max_count,
>>> 			  struct perf_event *ctrs[], u64 *events,
>>> 			  unsigned int *flags)
>>> diff --git a/arch/powerpc/platforms/pseries/mobility.c b/arch/powerpc/p=
latforms/pseries/mobility.c
>>> index e83e0891272d..3e96485ccba4 100644
>>> --- a/arch/powerpc/platforms/pseries/mobility.c
>>> +++ b/arch/powerpc/platforms/pseries/mobility.c
>>> @@ -22,6 +22,7 @@
>>> #include <linux/delay.h>
>>> #include <linux/slab.h>
>>> #include <linux/stringify.h>
>>> +#include <linux/perf_event.h>
>>>=20
>>> #include <asm/machdep.h>
>>> #include <asm/rtas.h>
>>> @@ -631,12 +632,18 @@ static int pseries_migrate_partition(u64 handle)
>>> 	if (ret)
>>> 		return ret;
>>>=20
>>> +	/* Disable PMU before suspend */
>>> +	on_each_cpu(&mobility_pmu_disable, NULL, 0);
>>=20
>> Why was this moved out of stop machine and to an IPI?
>>=20
>> My concern would be, what are the other CPUs doing at this time? Is it=20
>> possible they could take interrupts and schedule? Could that mess up the
>> perf state here?
>=20
> pseries_migrate_partition() is called directly from migration_store(),
> which is the sysfs store function, which can be called concurrently by
> different CPUs.
>=20
> It's also potentially called from rtas_syscall_dispatch_ibm_suspend_me(),
> from sys_rtas(), again with no locking.
>=20
> So we could have two CPUs calling into here at the same time, which
> might not crash, but is unlikely to work well.
>=20
> I think the lack of locking might have been OK in the past because only
> one CPU will successfully get the other CPUs to call do_join() in
> pseries_suspend(). But I could be wrong.
>=20
> Anyway, now that we're mutating the PMU state before suspending we need
> to be more careful. So I think we need a lock around the whole sequence.

Thanks for the review comments.

The PMU callback invocations were from inside stop machine ( inside =E2=80=
=9Cdo_join=E2=80=9D ) in initial version.
Moved these out to pseries_migrate_partition as an IPI so as to minimise ca=
lls to other sub-system from =E2=80=9Cdo_join=E2=80=9D context, as pointed =
by Nathan.
But if it is not safe to have per-cpu invocation from pseries_migrate_parti=
tion, should we handle this under the interrupt disable path in do_join its=
elf ( as in the initial version ) ?=20

Please share your thoughts/suggestions.

Thanks
Athira

>=20
> cheers


--Apple-Mail=_E7DA0791-9739-4362-82CB-0FEBFED4F8D2
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dutf-8"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" class=3D""><br =
class=3D""><div><br class=3D""><blockquote type=3D"cite" class=3D""><div =
class=3D"">On 29-Oct-2021, at 6:45 PM, Michael Ellerman &lt;<a =
href=3D"mailto:mpe@ellerman.id.au" class=3D"">mpe@ellerman.id.au</a>&gt; =
wrote:</div><br class=3D"Apple-interchange-newline"><div class=3D""><meta =
charset=3D"UTF-8" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">Nicholas Piggin &lt;</span><a href=3D"mailto:npiggin@gmail.com"=
 style=3D"font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
orphans: auto; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px;" =
class=3D"">npiggin@gmail.com</a><span style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">&gt; writes:</span><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><blockquote type=3D"cite" =
style=3D"font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
orphans: auto; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D"">Excerpts from Athira Rajeev's message =
of October 29, 2021 1:05 pm:<br class=3D""><blockquote type=3D"cite" =
class=3D"">During Live Partition Migration (LPM), it is observed that =
perf<br class=3D"">counter values reports zero post migration =
completion. However<br class=3D"">'perf stat' with workload continues to =
show counts post migration<br class=3D"">since PMU gets disabled/enabled =
during sched switches. But incase<br class=3D"">of system/cpu wide =
monitoring, zero counts were reported with 'perf<br class=3D"">stat' =
after migration completion.<br class=3D""><br class=3D"">Example:<br =
class=3D"">./perf stat -e r1001e -I 1000<br =
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
class=3D""></blockquote><br class=3D"">This is the output without the =
patch? After the patch it keeps counting<span =
class=3D"Apple-converted-space">&nbsp;</span><br class=3D"">I suppose? =
And does the very large count go away too?<br class=3D""><br =
class=3D""><blockquote type=3D"cite" class=3D""><br class=3D"">Here PMU =
is enabled during start of perf session and counter<br class=3D"">values =
are read at intervals. Counters are only disabled at the<br class=3D"">end=
 of session. The powerpc mobility code presently does not handle<br =
class=3D"">disabling and enabling back of PMU counters during =
partition<br class=3D"">migration. Also since the PMU register values =
are not saved/restored<br class=3D"">during migration, PMU registers =
like Monitor Mode Control Register 0<br class=3D"">(MMCR0), Monitor Mode =
Control Register 1 (MMCR1) will not contain<br class=3D"">the value it =
was programmed with. Hence PMU counters will not be<br class=3D"">enabled =
correctly post migration.<br class=3D""><br class=3D"">Fix this in =
mobility code by handling disabling and enabling of<br class=3D"">PMU in =
all cpu's before and after migration. Patch introduces two<br =
class=3D"">functions 'mobility_pmu_disable' and =
'mobility_pmu_enable'.<br class=3D"">mobility_pmu_disable() is called =
before the processor threads goes<br class=3D"">to suspend state so as =
to disable the PMU counters. And disable is<br class=3D"">done only if =
there are any active events running on that cpu.<br =
class=3D"">mobility_pmu_enable() is called after the migrate is done to =
enable<br class=3D"">back the PMU counters.<br class=3D""><br =
class=3D"">Since the performance Monitor counters ( PMCs) are not<br =
class=3D"">saved/restored during LPM, results in PMC value being zero =
and the<br class=3D"">'event-&gt;hw.prev_count' being non-zero value. =
This causes problem<br class=3D"">during updation of event-&gt;count =
since we always accumulate<br class=3D"">(event-&gt;hw.prev_count - PMC =
value) in event-&gt;count. &nbsp;If<br class=3D"">event-&gt;hw.prev_count =
is greater PMC value, event-&gt;count becomes<br class=3D"">negative. To =
fix this, 'prev_count' also needs to be re-initialised<br class=3D"">for =
all events while enabling back the events. Hence read the<br =
class=3D"">existing events and clear the PMC index (stored in =
event-&gt;hw.idx)<br class=3D"">for all events im mobility_pmu_disable. =
By this way, event count<br class=3D"">settings will get re-initialised =
correctly in power_pmu_enable.<br class=3D""><br class=3D"">Signed-off-by:=
 Athira Rajeev &lt;<a href=3D"mailto:atrajeev@linux.vnet.ibm.com" =
class=3D"">atrajeev@linux.vnet.ibm.com</a>&gt;<br class=3D"">[ Fixed =
compilation error reported by kernel test robot ]<br =
class=3D"">Reported-by: kernel test robot &lt;<a =
href=3D"mailto:lkp@intel.com" class=3D"">lkp@intel.com</a>&gt;<br =
class=3D"">---<br class=3D"">Changelog:<br class=3D"">Change from v2 =
-&gt; v3:<br class=3D"">Addressed review comments from Nicholas =
Piggin.<br class=3D"">- Removed the "migrate" field which was added in =
initial<br class=3D"">&nbsp;&nbsp;patch to address updation of event =
count settings correctly<br class=3D"">&nbsp;&nbsp;in power_pmu_enable. =
Instead read off existing events in<br =
class=3D"">&nbsp;&nbsp;mobility_pmu_disable before power_pmu_enable.<br =
class=3D"">- Moved the mobility_pmu_disable/enable declaration from<br =
class=3D"">&nbsp;&nbsp;rtas.h to perf event header file.<br class=3D""><br=
 class=3D"">Addressed review comments from Nathan.<br class=3D"">- Moved =
the mobility function calls from stop_machine<br =
class=3D"">&nbsp;&nbsp;context out to pseries_migrate_partition. Also =
now this<br class=3D"">&nbsp;&nbsp;is a per cpu invocation.<br =
class=3D""><br class=3D"">Change from v1 -&gt; v2:<br class=3D"">- Moved =
the mobility_pmu_enable and mobility_pmu_disable<br =
class=3D"">&nbsp;&nbsp;declarations under CONFIG_PPC_PERF_CTRS in =
rtas.h.<br class=3D"">&nbsp;&nbsp;Also included 'asm/rtas.h' in =
core-book3s to fix the<br class=3D"">&nbsp;&nbsp;compilation warning =
reported by kernel test robot.<br class=3D""><br =
class=3D"">arch/powerpc/include/asm/perf_event.h =
&nbsp;&nbsp;&nbsp;&nbsp;| &nbsp;8 +++++<br =
class=3D"">arch/powerpc/perf/core-book3s.c =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;| 39 =
+++++++++++++++++++++++<br =
class=3D"">arch/powerpc/platforms/pseries/mobility.c | &nbsp;7 ++++<br =
class=3D"">3 files changed, 54 insertions(+)<br class=3D""><br =
class=3D"">diff --git a/arch/powerpc/include/asm/perf_event.h =
b/arch/powerpc/include/asm/perf_event.h<br class=3D"">index =
164e910bf654..88aab6cf840c 100644<br class=3D"">--- =
a/arch/powerpc/include/asm/perf_event.h<br class=3D"">+++ =
b/arch/powerpc/include/asm/perf_event.h<br class=3D"">@@ -17,6 +17,14 @@ =
static inline bool is_sier_available(void) { return false; }<br =
class=3D"">static inline unsigned long get_pmcs_ext_regs(int idx) { =
return 0; }<br class=3D"">#endif<br class=3D""><br class=3D"">+#ifdef =
CONFIG_PPC_PERF_CTRS<br class=3D"">+void mobility_pmu_disable(void =
*unused);<br class=3D"">+void mobility_pmu_enable(void *unused);<br =
class=3D"">+#else<br class=3D"">+static inline void =
mobility_pmu_disable(void *unused) { }<br class=3D"">+static inline void =
mobility_pmu_enable(void *unused) { }<br class=3D"">+#endif<br =
class=3D"">+<br class=3D"">#ifdef CONFIG_FSL_EMB_PERF_EVENT<br =
class=3D"">#include &lt;asm/perf_event_fsl_emb.h&gt;<br =
class=3D"">#endif<br class=3D"">diff --git =
a/arch/powerpc/perf/core-book3s.c b/arch/powerpc/perf/core-book3s.c<br =
class=3D"">index 73e62e9b179b..2e8c4c668fa3 100644<br class=3D"">--- =
a/arch/powerpc/perf/core-book3s.c<br class=3D"">+++ =
b/arch/powerpc/perf/core-book3s.c<br class=3D"">@@ -1343,6 +1343,33 @@ =
static void power_pmu_disable(struct pmu *pmu)<br class=3D""><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>local_irq_restore(flags);<br class=3D"">}<br class=3D""><br =
class=3D"">+/*<br class=3D"">+ * Called from pseries_migrate_partition() =
function<br class=3D"">+ * before migration, from powerpc/mobility =
code.<br class=3D"">+ */<br class=3D""></blockquote></blockquote><br =
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
display: inline !important;" class=3D"">These are only needed if pseries =
is built, so should be inside a PSERIES</span><br style=3D"caret-color: =
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
class=3D"">ifdef.</span><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""></div></blockquote><div><br =
class=3D""></div>Sure mpe, will address this change in next version<br =
class=3D""><blockquote type=3D"cite" class=3D""><div class=3D""><br =
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
display: inline !important;" class=3D"">This function should handle =
iterating over CPUs, that shouldn't be left</span><br =
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
display: inline !important;" class=3D"">up to the mobility.c =
code.</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
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
none; float: none; display: inline !important;" class=3D"">And the names =
should be something like pmu_start_migration(),</span><br =
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
display: inline !important;" class=3D"">pmu_finish_migration().</span><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;" =
class=3D""></div></blockquote><div><br class=3D""></div>Ok, will =
change<br class=3D""><blockquote type=3D"cite" class=3D""><div =
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
-webkit-text-stroke-width: 0px; text-decoration: none;" =
class=3D""><blockquote type=3D"cite" class=3D"">+void =
mobility_pmu_disable(void *unused)<br class=3D"">+{<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>struct =
cpu_hw_events *cpuhw =3D this_cpu_ptr(&amp;cpu_hw_events);<br =
class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>struct perf_event *event;<br class=3D"">+<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>if =
(cpuhw-&gt;n_events !=3D 0) {<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>int i;<br =
class=3D"">+<br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>power_pmu_disable(NULL);<br =
class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>/*<br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span =
class=3D"Apple-converted-space">&nbsp;</span>* Read off any pre-existing =
events because the register<br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span =
class=3D"Apple-converted-space">&nbsp;</span>* values may not be =
migrated.<br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span =
class=3D"Apple-converted-space">&nbsp;</span>*/<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>for (i =3D =
0; i &lt; cpuhw-&gt;n_events; ++i) {<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>event =3D =
cpuhw-&gt;event[i];<br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>if (event-&gt;hw.idx) {<br =
class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>power_pmu_read(event);<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>event-&gt;hw.idx =3D 0;<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>}<br =
class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>}<br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>}<br class=3D"">+}<br =
class=3D"">+<br class=3D"">/*<br class=3D"">&nbsp;* Re-enable all events =
if disable =3D=3D 0.<br class=3D"">&nbsp;* If we were previously =
disabled and events were added, then<br class=3D"">@@ -1515,6 +1542,18 =
@@ static void power_pmu_enable(struct pmu *pmu)<br class=3D""><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>local_irq_restore(flags);<br class=3D"">}<br class=3D""><br =
class=3D"">+/*<br class=3D"">+ * Called from pseries_migrate_partition() =
function<br class=3D"">+ * after migration, from powerpc/mobility =
code.<br class=3D"">+ */<br class=3D"">+void mobility_pmu_enable(void =
*unused)<br class=3D"">+{<br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>struct cpu_hw_events *cpuhw =3D =
this_cpu_ptr(&amp;cpu_hw_events);<br class=3D"">+<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>cpuhw-&gt;n_added =3D cpuhw-&gt;n_events;<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>power_pmu_enable(NULL);<br class=3D"">+}<br class=3D"">+<br =
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
e83e0891272d..3e96485ccba4 100644<br class=3D"">--- =
a/arch/powerpc/platforms/pseries/mobility.c<br class=3D"">+++ =
b/arch/powerpc/platforms/pseries/mobility.c<br class=3D"">@@ -22,6 +22,7 =
@@<br class=3D"">#include &lt;linux/delay.h&gt;<br class=3D"">#include =
&lt;linux/slab.h&gt;<br class=3D"">#include &lt;linux/stringify.h&gt;<br =
class=3D"">+#include &lt;linux/perf_event.h&gt;<br class=3D""><br =
class=3D"">#include &lt;asm/machdep.h&gt;<br class=3D"">#include =
&lt;asm/rtas.h&gt;<br class=3D"">@@ -631,12 +632,18 @@ static int =
pseries_migrate_partition(u64 handle)<br class=3D""><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>if =
(ret)<br class=3D""><span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span><span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span>return ret;<br class=3D""><br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>/* =
Disable PMU before suspend */<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>on_each_cpu(&amp;mobility_pmu_disable, NULL, 0);<br =
class=3D""></blockquote><br class=3D"">Why was this moved out of stop =
machine and to an IPI?<br class=3D""><br class=3D"">My concern would be, =
what are the other CPUs doing at this time? Is it<span =
class=3D"Apple-converted-space">&nbsp;</span><br class=3D"">possible =
they could take interrupts and schedule? Could that mess up the<br =
class=3D"">perf state here?<br class=3D""></blockquote><br =
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
display: inline !important;" class=3D"">pseries_migrate_partition() is =
called directly from migration_store(),</span><br style=3D"caret-color: =
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
class=3D"">which is the sysfs store function, which can be called =
concurrently by</span><br style=3D"caret-color: rgb(0, 0, 0); =
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
class=3D"">different CPUs.</span><br style=3D"caret-color: rgb(0, 0, 0); =
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
class=3D"">It's also potentially called from =
rtas_syscall_dispatch_ibm_suspend_me(),</span><br style=3D"caret-color: =
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
class=3D"">from sys_rtas(), again with no locking.</span><br =
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
display: inline !important;" class=3D"">So we could have two CPUs =
calling into here at the same time, which</span><br style=3D"caret-color: =
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
class=3D"">might not crash, but is unlikely to work well.</span><br =
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
display: inline !important;" class=3D"">I think the lack of locking =
might have been OK in the past because only</span><br =
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
display: inline !important;" class=3D"">one CPU will successfully get =
the other CPUs to call do_join() in</span><br style=3D"caret-color: =
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
class=3D"">pseries_suspend(). But I could be wrong.</span><br =
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
display: inline !important;" class=3D"">Anyway, now that we're mutating =
the PMU state before suspending we need</span><br style=3D"caret-color: =
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
class=3D"">to be more careful. So I think we need a lock around the =
whole sequence.</span><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""></div></blockquote><div><br =
class=3D""></div><div>Thanks for the review comments.</div><div><br =
class=3D""></div><div>The PMU callback invocations were from inside stop =
machine ( inside =E2=80=9Cdo_join=E2=80=9D ) in initial =
version.</div><div>Moved these out to pseries_migrate_partition as an =
IPI so as to minimise calls to other sub-system from =E2=80=9Cdo_join=E2=80=
=9D context, as pointed by Nathan.</div><div>But if it is not safe to =
have per-cpu invocation from pseries_migrate_partition, should we handle =
this under the interrupt disable path in do_join itself ( as in the =
initial version ) ?&nbsp;</div><div><br class=3D""></div><div>Please =
share your thoughts/suggestions.</div><div><br =
class=3D""></div><div>Thanks</div><div>Athira</div><br =
class=3D""><blockquote type=3D"cite" class=3D""><div class=3D""><br =
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
class=3D"">cheers</span></div></blockquote></div><br =
class=3D""></body></html>=

--Apple-Mail=_E7DA0791-9739-4362-82CB-0FEBFED4F8D2--

