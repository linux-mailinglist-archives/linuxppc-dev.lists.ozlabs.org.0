Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CC5D6442A8A
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Nov 2021 10:39:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hk4cF5KRHz2xsv
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Nov 2021 20:39:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=OXCHWrkd;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=OXCHWrkd; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hk0BD4YsQz2xCy
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Nov 2021 17:20:03 +1100 (AEDT)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1A22lcJP016640; 
 Tue, 2 Nov 2021 06:19:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : message-id :
 content-type : mime-version : subject : date : in-reply-to : cc : to :
 references; s=pp1; bh=Vs6WpOcScjnhIQGOU90T6/DxHzXfk249m2PuXdKHdMc=;
 b=OXCHWrkdTyG2prfQYaQOob6KttsZMZamJ9OpgAP2ff4bxJki5RqU4PJIeTI4sTX1RyNW
 waxdMuwyv5121tjc4v4twkKjrIKr9rHFXzq+vtuj5RCrf7bRD0IzFEL6ba12eUYVetZD
 q2Xr0JTGohUh+T8ult5pry3XnZbi9sA9tr5h/IS6ZYWizRTYL0oZ45qnd2dodId/K/Zw
 vIgxOMcNY0Ywo/dbggXTgcEGQB9qyCzFjt9CZYWnaw//AoSkCxr0zUmSU5+nhYhldtr0
 paUBQgsml+SlSldj7Hj+QrIwsyEfkXuiuEBiW9QLU6BQVoKa9Gjh79dvGy3E0PSU644Q dA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3c2ufumqpt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Nov 2021 06:19:57 +0000
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1A26CWqG004764;
 Tue, 2 Nov 2021 06:19:56 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3c2ufumqpf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Nov 2021 06:19:56 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1A26DPlk026358;
 Tue, 2 Nov 2021 06:19:54 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma03ams.nl.ibm.com with ESMTP id 3c0wp9fytd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Nov 2021 06:19:54 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1A26JpBx46137692
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 2 Nov 2021 06:19:51 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E414611C052;
 Tue,  2 Nov 2021 06:19:50 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2215E11C04A;
 Tue,  2 Nov 2021 06:19:49 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.195.36.47])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Tue,  2 Nov 2021 06:19:48 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Message-Id: <87D1D57E-7AA7-457F-B3EB-4A555DB5DB16@linux.vnet.ibm.com>
Content-Type: multipart/alternative;
 boundary="Apple-Mail=_89EDB47B-69D1-4A36-A2E0-47853F825CEB"
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Re: [V3] powerpc/perf: Enable PMU counters post partition migration
 if PMU is active
Date: Tue, 2 Nov 2021 11:43:38 +0530
In-Reply-To: <1635487923.hwdpof7s4v.astroid@bobo.none>
To: Nicholas Piggin <npiggin@gmail.com>
References: <20211029030510.58797-1-atrajeev@linux.vnet.ibm.com>
 <1635487923.hwdpof7s4v.astroid@bobo.none>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 7A1ze_ZSPcZtA_w7jf8WtbeZJaZc_GvO
X-Proofpoint-ORIG-GUID: cINCoywwLTExqKlWfNyH63R1kEV30Z8X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-02_01,2021-11-01_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 lowpriorityscore=0
 spamscore=0 clxscore=1015 priorityscore=1501 malwarescore=0 adultscore=0
 mlxlogscore=999 bulkscore=0 impostorscore=0 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2111020034
X-Mailman-Approved-At: Tue, 02 Nov 2021 20:38:46 +1100
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
 rnsastry@linux.ibm.com, kjain@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--Apple-Mail=_89EDB47B-69D1-4A36-A2E0-47853F825CEB
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii



> On 29-Oct-2021, at 11:46 AM, Nicholas Piggin <npiggin@gmail.com> =
wrote:
>=20
> Excerpts from Athira Rajeev's message of October 29, 2021 1:05 pm:
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
>=20
> This is the output without the patch? After the patch it keeps =
counting=20
> I suppose? And does the very large count go away too?

Hi Nick,

Thanks for the review comments.
The output is without the patch. After the patch it keeps counting and =
negative count goes away.
My bad, missed to keep both results in present version. I will add the =
before and after patch results in next version.


>=20
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
>> mobility_pmu_enable() is called after the migrate is done to enable
>> back the PMU counters.
>>=20
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
>>=20
>> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
>> [ Fixed compilation error reported by kernel test robot ]
>> Reported-by: kernel test robot <lkp@intel.com>
>> ---
>> Changelog:
>> Change from v2 -> v3:
>> Addressed review comments from Nicholas Piggin.
>> - Removed the "migrate" field which was added in initial
>>   patch to address updation of event count settings correctly
>>   in power_pmu_enable. Instead read off existing events in
>>   mobility_pmu_disable before power_pmu_enable.
>> - Moved the mobility_pmu_disable/enable declaration from
>>   rtas.h to perf event header file.
>>=20
>> Addressed review comments from Nathan.
>> - Moved the mobility function calls from stop_machine
>>   context out to pseries_migrate_partition. Also now this
>>   is a per cpu invocation.
>>=20
>> Change from v1 -> v2:
>> - Moved the mobility_pmu_enable and mobility_pmu_disable
>>   declarations under CONFIG_PPC_PERF_CTRS in rtas.h.
>>   Also included 'asm/rtas.h' in core-book3s to fix the
>>   compilation warning reported by kernel test robot.
>>=20
>> arch/powerpc/include/asm/perf_event.h     |  8 +++++
>> arch/powerpc/perf/core-book3s.c           | 39 =
+++++++++++++++++++++++
>> arch/powerpc/platforms/pseries/mobility.c |  7 ++++
>> 3 files changed, 54 insertions(+)
>>=20
>> diff --git a/arch/powerpc/include/asm/perf_event.h =
b/arch/powerpc/include/asm/perf_event.h
>> index 164e910bf654..88aab6cf840c 100644
>> --- a/arch/powerpc/include/asm/perf_event.h
>> +++ b/arch/powerpc/include/asm/perf_event.h
>> @@ -17,6 +17,14 @@ static inline bool is_sier_available(void) { =
return false; }
>> static inline unsigned long get_pmcs_ext_regs(int idx) { return 0; }
>> #endif
>>=20
>> +#ifdef CONFIG_PPC_PERF_CTRS
>> +void mobility_pmu_disable(void *unused);
>> +void mobility_pmu_enable(void *unused);
>> +#else
>> +static inline void mobility_pmu_disable(void *unused) { }
>> +static inline void mobility_pmu_enable(void *unused) { }
>> +#endif
>> +
>> #ifdef CONFIG_FSL_EMB_PERF_EVENT
>> #include <asm/perf_event_fsl_emb.h>
>> #endif
>> diff --git a/arch/powerpc/perf/core-book3s.c =
b/arch/powerpc/perf/core-book3s.c
>> index 73e62e9b179b..2e8c4c668fa3 100644
>> --- a/arch/powerpc/perf/core-book3s.c
>> +++ b/arch/powerpc/perf/core-book3s.c
>> @@ -1343,6 +1343,33 @@ static void power_pmu_disable(struct pmu *pmu)
>> 	local_irq_restore(flags);
>> }
>>=20
>> +/*
>> + * Called from pseries_migrate_partition() function
>> + * before migration, from powerpc/mobility code.
>> + */
>> +void mobility_pmu_disable(void *unused)
>> +{
>> +	struct cpu_hw_events *cpuhw =3D this_cpu_ptr(&cpu_hw_events);
>> +	struct perf_event *event;
>> +
>> +	if (cpuhw->n_events !=3D 0) {
>> +		int i;
>> +
>> +		power_pmu_disable(NULL);
>> +		/*
>> +		 * Read off any pre-existing events because the register
>> +		 * values may not be migrated.
>> +		 */
>> +		for (i =3D 0; i < cpuhw->n_events; ++i) {
>> +			event =3D cpuhw->event[i];
>> +			if (event->hw.idx) {
>> +				power_pmu_read(event);
>> +				event->hw.idx =3D 0;
>> +			}
>> +		}
>> +	}
>> +}
>> +
>> /*
>>  * Re-enable all events if disable =3D=3D 0.
>>  * If we were previously disabled and events were added, then
>> @@ -1515,6 +1542,18 @@ static void power_pmu_enable(struct pmu *pmu)
>> 	local_irq_restore(flags);
>> }
>>=20
>> +/*
>> + * Called from pseries_migrate_partition() function
>> + * after migration, from powerpc/mobility code.
>> + */
>> +void mobility_pmu_enable(void *unused)
>> +{
>> +	struct cpu_hw_events *cpuhw =3D this_cpu_ptr(&cpu_hw_events);
>> +
>> +	cpuhw->n_added =3D cpuhw->n_events;
>> +	power_pmu_enable(NULL);
>> +}
>> +
>> static int collect_events(struct perf_event *group, int max_count,
>> 			  struct perf_event *ctrs[], u64 *events,
>> 			  unsigned int *flags)
>> diff --git a/arch/powerpc/platforms/pseries/mobility.c =
b/arch/powerpc/platforms/pseries/mobility.c
>> index e83e0891272d..3e96485ccba4 100644
>> --- a/arch/powerpc/platforms/pseries/mobility.c
>> +++ b/arch/powerpc/platforms/pseries/mobility.c
>> @@ -22,6 +22,7 @@
>> #include <linux/delay.h>
>> #include <linux/slab.h>
>> #include <linux/stringify.h>
>> +#include <linux/perf_event.h>
>>=20
>> #include <asm/machdep.h>
>> #include <asm/rtas.h>
>> @@ -631,12 +632,18 @@ static int pseries_migrate_partition(u64 =
handle)
>> 	if (ret)
>> 		return ret;
>>=20
>> +	/* Disable PMU before suspend */
>> +	on_each_cpu(&mobility_pmu_disable, NULL, 0);
>=20
> Why was this moved out of stop machine and to an IPI?
>=20
> My concern would be, what are the other CPUs doing at this time? Is it=20=

> possible they could take interrupts and schedule? Could that mess up =
the
> perf state here?
>=20
> Thanks,
> Nick


--Apple-Mail=_89EDB47B-69D1-4A36-A2E0-47853F825CEB
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=us-ascii

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dus-ascii"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" class=3D""><br =
class=3D""><div><br class=3D""><blockquote type=3D"cite" class=3D""><div =
class=3D"">On 29-Oct-2021, at 11:46 AM, Nicholas Piggin &lt;<a =
href=3D"mailto:npiggin@gmail.com" class=3D"">npiggin@gmail.com</a>&gt; =
wrote:</div><br class=3D"Apple-interchange-newline"><div class=3D""><meta =
charset=3D"UTF-8" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">Excerpts from Athira Rajeev's message of October 29, 2021 =
1:05 pm:</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
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
class=3D"">This is the output without the patch? After the patch it =
keeps counting<span =
class=3D"Apple-converted-space">&nbsp;</span></span><br =
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
display: inline !important;" class=3D"">I suppose? And does the very =
large count go away too?</span><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""></div></blockquote><div><br =
class=3D""></div>Hi Nick,</div><div><br class=3D""></div><div>Thanks for =
the review comments.</div><div>The output is without the patch. After =
the patch it keeps counting and negative count goes =
away.</div><div><span style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, =
0, 0);" class=3D"">My bad, missed to keep both results in present =
version.&nbsp;</span>I will add the before and after patch results in =
next version.</div><div><br class=3D""></div><div><br =
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
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D""><br =
class=3D"">Here PMU is enabled during start of perf session and =
counter<br class=3D"">values are read at intervals. Counters are only =
disabled at the<br class=3D"">end of session. The powerpc mobility code =
presently does not handle<br class=3D"">disabling and enabling back of =
PMU counters during partition<br class=3D"">migration. Also since the =
PMU register values are not saved/restored<br class=3D"">during =
migration, PMU registers like Monitor Mode Control Register 0<br =
class=3D"">(MMCR0), Monitor Mode Control Register 1 (MMCR1) will not =
contain<br class=3D"">the value it was programmed with. Hence PMU =
counters will not be<br class=3D"">enabled correctly post migration.<br =
class=3D""><br class=3D"">Fix this in mobility code by handling =
disabling and enabling of<br class=3D"">PMU in all cpu's before and =
after migration. Patch introduces two<br class=3D"">functions =
'mobility_pmu_disable' and 'mobility_pmu_enable'.<br =
class=3D"">mobility_pmu_disable() is called before the processor threads =
goes<br class=3D"">to suspend state so as to disable the PMU counters. =
And disable is<br class=3D"">done only if there are any active events =
running on that cpu.<br class=3D"">mobility_pmu_enable() is called after =
the migrate is done to enable<br class=3D"">back the PMU counters.<br =
class=3D""><br class=3D"">Since the performance Monitor counters ( PMCs) =
are not<br class=3D"">saved/restored during LPM, results in PMC value =
being zero and the<br class=3D"">'event-&gt;hw.prev_count' being =
non-zero value. This causes problem<br class=3D"">during updation of =
event-&gt;count since we always accumulate<br =
class=3D"">(event-&gt;hw.prev_count - PMC value) in event-&gt;count. =
&nbsp;If<br class=3D"">event-&gt;hw.prev_count is greater PMC value, =
event-&gt;count becomes<br class=3D"">negative. To fix this, =
'prev_count' also needs to be re-initialised<br class=3D"">for all =
events while enabling back the events. Hence read the<br =
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
code.<br class=3D"">+ */<br class=3D"">+void mobility_pmu_disable(void =
*unused)<br class=3D"">+{<br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>struct cpu_hw_events *cpuhw =3D =
this_cpu_ptr(&amp;cpu_hw_events);<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>struct =
perf_event *event;<br class=3D"">+<br class=3D"">+<span =
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
class=3D"">Why was this moved out of stop machine and to an =
IPI?</span></div></blockquote><blockquote type=3D"cite" class=3D""><div =
class=3D""><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;" class=3D"">My concern =
would be, what are the other CPUs doing at this time? Is it<span =
class=3D"Apple-converted-space">&nbsp;</span></span><br =
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
display: inline !important;" class=3D"">possible they could take =
interrupts and schedule? Could that mess up the</span><br =
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
display: inline !important;" class=3D"">perf state here?</span><br =
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
display: inline !important;" class=3D"">Thanks,</span><br =
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
class=3D"">Nick</span></div></blockquote></div><br =
class=3D""></body></html>=

--Apple-Mail=_89EDB47B-69D1-4A36-A2E0-47853F825CEB--

