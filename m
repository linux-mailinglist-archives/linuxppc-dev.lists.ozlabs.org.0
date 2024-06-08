Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C065900FC8
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Jun 2024 09:07:53 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=NyIO59+E;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vx8KG6xg2z3cVS
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Jun 2024 17:07:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=NyIO59+E;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vx8Hm3Jccz3cXT
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 Jun 2024 17:06:28 +1000 (AEST)
Received: from pps.filterd (m0353727.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4586pXkG002918;
	Sat, 8 Jun 2024 07:06:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to; s=pp1; bh=J
	Wp15AgTYXOmkMihCN9uUDq/fJj8+NIpDaT4n3kTfjU=; b=NyIO59+E3RqYjCnu2
	hsSlrkZegiXfjkxlKRg4c2ClRMVg+cR0m/wlHWmxz7os+qM/mOmkNmhOBkE+UdXs
	panV8S8Q0YGoLk747Rixv3U0EMWUvt67l6frn816riHRdvjy4CJfbuv915duTcel
	TQqqoxXnDYD2sAwu2f1UsS/yzIVQQ7eN2UBDe4+hlGBVK43V5fi1VWDEBa53+Bzn
	C71npgjpAoXJVxuCKDT2xJc87RDASCMrHNofIeYIWxT1FcPAYtA5ePRgYqolgaTm
	jxU1FXtjnWvp1Ru19c9pGnfW8ZR3fw7/auykA8Pqbh3Ssl/MR5xnDG8MjgTl8/GJ
	1x2vQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ymhf8046k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 08 Jun 2024 07:06:25 +0000 (GMT)
Received: from m0353727.ppops.net (m0353727.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 45876O4H005892;
	Sat, 8 Jun 2024 07:06:24 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ymhf8046j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 08 Jun 2024 07:06:24 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 4583gL9n025354;
	Sat, 8 Jun 2024 07:06:23 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3ymfmp8rh2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 08 Jun 2024 07:06:23 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 45876HGU50594054
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 8 Jun 2024 07:06:19 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 79AA320043;
	Sat,  8 Jun 2024 07:06:17 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 202D620040;
	Sat,  8 Jun 2024 07:06:15 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.43.125.209])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Sat,  8 Jun 2024 07:06:14 +0000 (GMT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.500.171.1.1\))
Subject: Re: [PATCH 1/3] tools/perf: Fix the nrcpus in perf bench futex to
 enable the run when all CPU's are not online
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
In-Reply-To: <CAP-5=fVCXW1FEBra5aFLJm48f0-b4a+oTugTZt+VYEv1EySBKg@mail.gmail.com>
Date: Sat, 8 Jun 2024 12:36:04 +0530
Content-Transfer-Encoding: quoted-printable
Message-Id: <8232BA2A-C7C5-4413-B174-6088EBF863C0@linux.vnet.ibm.com>
References: <20240607044354.82225-1-atrajeev@linux.vnet.ibm.com>
 <CAP-5=fVCXW1FEBra5aFLJm48f0-b4a+oTugTZt+VYEv1EySBKg@mail.gmail.com>
To: Ian Rogers <irogers@google.com>
X-Mailer: Apple Mail (2.3774.500.171.1.1)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: ZQeodHpPrKo6DiahG6RJkTnE8CjRzBdc
X-Proofpoint-ORIG-GUID: UOGdbADrrMEHa15MF07ZCE0W2cSRDGZB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-08_01,2024-06-06_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 phishscore=0
 mlxscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 mlxlogscore=999 suspectscore=0 malwarescore=0
 clxscore=1015 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406080049
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
Cc: disgoel@linux.vnet.ibm.com, maddy@linux.ibm.com, kjain@linux.ibm.com, LKML <linux-kernel@vger.kernel.org>, Arnaldo Carvalho de Melo <acme@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, linux-perf-users@vger.kernel.org, Jiri Olsa <jolsa@kernel.org>, Namhyung Kim <namhyung@kernel.org>, akanksha@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 7 Jun 2024, at 10:53=E2=80=AFPM, Ian Rogers <irogers@google.com> =
wrote:
>=20
> On Thu, Jun 6, 2024 at 9:44=E2=80=AFPM Athira Rajeev
> <atrajeev@linux.vnet.ibm.com> wrote:
>>=20
>> Perf bench futex fails as below when attempted to run on
>> on a powerpc system:
>>=20
>> ./perf bench futex all
>> Running futex/hash benchmark...
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
> For the series:
> Reviewed-by: Ian Rogers <irogers@google.com>

Hi Ian

Thanks for the review=20

Athira
>=20
> Thanks,
> Ian
>=20
>> ---
>> tools/perf/bench/futex-hash.c          | 2 +-
>> tools/perf/bench/futex-lock-pi.c       | 2 +-
>> tools/perf/bench/futex-requeue.c       | 2 +-
>> tools/perf/bench/futex-wake-parallel.c | 2 +-
>> tools/perf/bench/futex-wake.c          | 2 +-
>> 5 files changed, 5 insertions(+), 5 deletions(-)
>>=20
>> diff --git a/tools/perf/bench/futex-hash.c =
b/tools/perf/bench/futex-hash.c
>> index 0c69d20efa32..b472eded521b 100644
>> --- a/tools/perf/bench/futex-hash.c
>> +++ b/tools/perf/bench/futex-hash.c
>> @@ -174,7 +174,7 @@ int bench_futex_hash(int argc, const char **argv)
>>        pthread_attr_init(&thread_attr);
>>        gettimeofday(&bench__start, NULL);
>>=20
>> -       nrcpus =3D perf_cpu_map__nr(cpu);
>> +       nrcpus =3D cpu__max_cpu().cpu;
>>        cpuset =3D CPU_ALLOC(nrcpus);
>>        BUG_ON(!cpuset);
>>        size =3D CPU_ALLOC_SIZE(nrcpus);
>> diff --git a/tools/perf/bench/futex-lock-pi.c =
b/tools/perf/bench/futex-lock-pi.c
>> index 7a4973346180..0416120c091b 100644
>> --- a/tools/perf/bench/futex-lock-pi.c
>> +++ b/tools/perf/bench/futex-lock-pi.c
>> @@ -122,7 +122,7 @@ static void create_threads(struct worker *w, =
struct perf_cpu_map *cpu)
>> {
>>        cpu_set_t *cpuset;
>>        unsigned int i;
>> -       int nrcpus =3D  perf_cpu_map__nr(cpu);
>> +       int nrcpus =3D  cpu__max_cpu().cpu;
>>        size_t size;
>>=20
>>        threads_starting =3D params.nthreads;
>> diff --git a/tools/perf/bench/futex-requeue.c =
b/tools/perf/bench/futex-requeue.c
>> index d9ad736c1a3e..aad5bfc4fe18 100644
>> --- a/tools/perf/bench/futex-requeue.c
>> +++ b/tools/perf/bench/futex-requeue.c
>> @@ -125,7 +125,7 @@ static void block_threads(pthread_t *w, struct =
perf_cpu_map *cpu)
>> {
>>        cpu_set_t *cpuset;
>>        unsigned int i;
>> -       int nrcpus =3D perf_cpu_map__nr(cpu);
>> +       int nrcpus =3D cpu__max_cpu().cpu;
>>        size_t size;
>>=20
>>        threads_starting =3D params.nthreads;
>> diff --git a/tools/perf/bench/futex-wake-parallel.c =
b/tools/perf/bench/futex-wake-parallel.c
>> index b66df553e561..90a5b91bf139 100644
>> --- a/tools/perf/bench/futex-wake-parallel.c
>> +++ b/tools/perf/bench/futex-wake-parallel.c
>> @@ -149,7 +149,7 @@ static void block_threads(pthread_t *w, struct =
perf_cpu_map *cpu)
>> {
>>        cpu_set_t *cpuset;
>>        unsigned int i;
>> -       int nrcpus =3D perf_cpu_map__nr(cpu);
>> +       int nrcpus =3D cpu__max_cpu().cpu;
>>        size_t size;
>>=20
>>        threads_starting =3D params.nthreads;
>> diff --git a/tools/perf/bench/futex-wake.c =
b/tools/perf/bench/futex-wake.c
>> index 690fd6d3da13..49b3c89b0b35 100644
>> --- a/tools/perf/bench/futex-wake.c
>> +++ b/tools/perf/bench/futex-wake.c
>> @@ -100,7 +100,7 @@ static void block_threads(pthread_t *w, struct =
perf_cpu_map *cpu)
>>        cpu_set_t *cpuset;
>>        unsigned int i;
>>        size_t size;
>> -       int nrcpus =3D perf_cpu_map__nr(cpu);
>> +       int nrcpus =3D cpu__max_cpu().cpu;
>>        threads_starting =3D params.nthreads;
>>=20
>>        cpuset =3D CPU_ALLOC(nrcpus);
>> --
>> 2.43.0


