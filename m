Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 11C7690522C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jun 2024 14:12:40 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=WptwwWGz;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vzkv84kRWz3fmS
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jun 2024 22:12:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=WptwwWGz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VzktR1sMXz2yvf
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jun 2024 22:11:58 +1000 (AEST)
Received: from pps.filterd (m0353722.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45CARKIn024705;
	Wed, 12 Jun 2024 12:11:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to; s=pp1; bh=d
	uwgHpuZSRCZ08T/lg1u/jzzAlv83N82f5GZE395lqg=; b=WptwwWGzi/puG0tgt
	cZ7PflEvcL0F3p7KewwfRNhGN5f9r26p50D0zaxlAEmrN7ejNprvpYPU4h9zeS78
	If7mN74HTKMF1JeFUpdoKng8dYgJWuTMfekbL+51wfwaCtmrIlGcPyHyxvRUrfrN
	cNwsLFnR95N+Kp7j6xiQMOuzfe4FqaFBP68mBvG+QaZ0+ZAKskG3d0VxxZdtFeo0
	DJSnYxA9v3cRxnLJUh9BybH1JQxP08kjchCWesD4O5UpxpvIljHoXNwSyXqSkXWE
	naxyA59oPwXUmxdqiDCT/BON2lYUnDJaFtnf8aj0uhN0bUX35Z/CI8y+ZIXZBzBr
	SY12A==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3yq7rm0m7t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Jun 2024 12:11:49 +0000 (GMT)
Received: from m0353722.ppops.net (m0353722.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 45CCBmHa020091;
	Wed, 12 Jun 2024 12:11:48 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3yq7rm0m7s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Jun 2024 12:11:48 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 45CBBNMa027220;
	Wed, 12 Jun 2024 12:11:48 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3yn210wmc0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Jun 2024 12:11:48 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 45CCBgVR52887976
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 12 Jun 2024 12:11:44 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 61B2920043;
	Wed, 12 Jun 2024 12:11:42 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0E51020040;
	Wed, 12 Jun 2024 12:11:36 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.43.60.185])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Wed, 12 Jun 2024 12:11:35 +0000 (GMT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.500.171.1.1\))
Subject: Re: [PATCH 1/3] tools/perf: Fix the nrcpus in perf bench futex to
 enable the run when all CPU's are not online
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
In-Reply-To: <92752ed4-0091-4a98-8af7-dd58bc5432bc@linux.ibm.com>
Date: Wed, 12 Jun 2024 17:41:22 +0530
Content-Transfer-Encoding: quoted-printable
Message-Id: <8AA105EF-A7DD-4890-9878-46E473743EAE@linux.vnet.ibm.com>
References: <20240607044354.82225-1-atrajeev@linux.vnet.ibm.com>
 <92752ed4-0091-4a98-8af7-dd58bc5432bc@linux.ibm.com>
To: Disha Goel <disgoel@linux.ibm.com>, Namhyung Kim <namhyung@kernel.org>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Ian Rogers <irogers@google.com>
X-Mailer: Apple Mail (2.3774.500.171.1.1)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 61axmAq69ncWZRNkvjn6JEOXZpiDrrCq
X-Proofpoint-ORIG-GUID: vZmJ5SOiax5HkuDse_ounAEaSIdNQL-u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-12_06,2024-06-12_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 spamscore=0
 suspectscore=0 adultscore=0 malwarescore=0 priorityscore=1501
 clxscore=1015 impostorscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406120087
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
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>, LKML <linux-kernel@vger.kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, akanksha@linux.ibm.com, linux-perf-users <linux-perf-users@vger.kernel.org>, Jiri Olsa <jolsa@kernel.org>, Kajol Jain <kjain@linux.ibm.com>, Disha Goel <disgoel@linux.vnet.ibm.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 10 Jun 2024, at 7:52=E2=80=AFPM, Disha Goel <disgoel@linux.ibm.com> =
wrote:
>=20
> On 07/06/24 10:13 am, Athira Rajeev wrote:
>=20
>> Perf bench futex fails as below when attempted to run on
>> on a powerpc system:
>>=20
>>  ./perf bench futex all
>>  Running futex/hash benchmark...
>> Run summary [PID 626307]: 80 threads, each operating on 1024 =
[private] futexes for 10 secs.
>>=20
>> perf: pthread_create: No such file or directory
>>=20
>> In the setup where this perf bench was ran, difference was that
>> partition had 640 CPU's, but not all CPUs were online. 80 CPUs
>> were online. While blocking the threads with futex_wait, code
>> sets the affinity using cpumask. The cpumask size used is 80
>> which is picked from "nrcpus =3D perf_cpu_map__nr(cpu)". Here the
>> benchmark reports fail while setting affinity for cpu number which
>> is greater than 80 or higher, because it attempts to set a bit
>> position which is not allocated on the cpumask. Fix this by changing
>> the size of cpumask to number of possible cpus and not the number
>> of online cpus.
>>=20
>> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
>=20
> Thanks for the fix patches, Athira.
> I have tested all three patches on a power machine (both small and max =
config),
> and the perf bench futex and epoll tests run fine.
>=20
> For the series:
> Tested-by: Disha Goel <disgoel@linux.ibm.com>

Thanks Disha for testing the patchset.=20

Athira
>=20
>> ---
>>  tools/perf/bench/futex-hash.c          | 2 +-
>>  tools/perf/bench/futex-lock-pi.c       | 2 +-
>>  tools/perf/bench/futex-requeue.c       | 2 +-
>>  tools/perf/bench/futex-wake-parallel.c | 2 +-
>>  tools/perf/bench/futex-wake.c          | 2 +-
>>  5 files changed, 5 insertions(+), 5 deletions(-)
>>=20
>> diff --git a/tools/perf/bench/futex-hash.c =
b/tools/perf/bench/futex-hash.c
>> index 0c69d20efa32..b472eded521b 100644
>> --- a/tools/perf/bench/futex-hash.c
>> +++ b/tools/perf/bench/futex-hash.c
>> @@ -174,7 +174,7 @@ int bench_futex_hash(int argc, const char **argv)
>>   pthread_attr_init(&thread_attr);
>>   gettimeofday(&bench__start, NULL);
>>  - nrcpus =3D perf_cpu_map__nr(cpu);
>> + nrcpus =3D cpu__max_cpu().cpu;
>>   cpuset =3D CPU_ALLOC(nrcpus);
>>   BUG_ON(!cpuset);
>>   size =3D CPU_ALLOC_SIZE(nrcpus);
>> diff --git a/tools/perf/bench/futex-lock-pi.c =
b/tools/perf/bench/futex-lock-pi.c
>> index 7a4973346180..0416120c091b 100644
>> --- a/tools/perf/bench/futex-lock-pi.c
>> +++ b/tools/perf/bench/futex-lock-pi.c
>> @@ -122,7 +122,7 @@ static void create_threads(struct worker *w, =
struct perf_cpu_map *cpu)
>>  {
>>   cpu_set_t *cpuset;
>>   unsigned int i;
>> - int nrcpus =3D  perf_cpu_map__nr(cpu);
>> + int nrcpus =3D  cpu__max_cpu().cpu;
>>   size_t size;
>>     threads_starting =3D params.nthreads;
>> diff --git a/tools/perf/bench/futex-requeue.c =
b/tools/perf/bench/futex-requeue.c
>> index d9ad736c1a3e..aad5bfc4fe18 100644
>> --- a/tools/perf/bench/futex-requeue.c
>> +++ b/tools/perf/bench/futex-requeue.c
>> @@ -125,7 +125,7 @@ static void block_threads(pthread_t *w, struct =
perf_cpu_map *cpu)
>>  {
>>   cpu_set_t *cpuset;
>>   unsigned int i;
>> - int nrcpus =3D perf_cpu_map__nr(cpu);
>> + int nrcpus =3D cpu__max_cpu().cpu;
>>   size_t size;
>>     threads_starting =3D params.nthreads;
>> diff --git a/tools/perf/bench/futex-wake-parallel.c =
b/tools/perf/bench/futex-wake-parallel.c
>> index b66df553e561..90a5b91bf139 100644
>> --- a/tools/perf/bench/futex-wake-parallel.c
>> +++ b/tools/perf/bench/futex-wake-parallel.c
>> @@ -149,7 +149,7 @@ static void block_threads(pthread_t *w, struct =
perf_cpu_map *cpu)
>>  {
>>   cpu_set_t *cpuset;
>>   unsigned int i;
>> - int nrcpus =3D perf_cpu_map__nr(cpu);
>> + int nrcpus =3D cpu__max_cpu().cpu;
>>   size_t size;
>>     threads_starting =3D params.nthreads;
>> diff --git a/tools/perf/bench/futex-wake.c =
b/tools/perf/bench/futex-wake.c
>> index 690fd6d3da13..49b3c89b0b35 100644
>> --- a/tools/perf/bench/futex-wake.c
>> +++ b/tools/perf/bench/futex-wake.c
>> @@ -100,7 +100,7 @@ static void block_threads(pthread_t *w, struct =
perf_cpu_map *cpu)
>>   cpu_set_t *cpuset;
>>   unsigned int i;
>>   size_t size;
>> - int nrcpus =3D perf_cpu_map__nr(cpu);
>> + int nrcpus =3D cpu__max_cpu().cpu;
>>   threads_starting =3D params.nthreads;
>>     cpuset =3D CPU_ALLOC(nrcpus);


