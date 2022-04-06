Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A0B874F56E2
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Apr 2022 09:48:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KYGpx2jyQz3bWf
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Apr 2022 17:48:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=CVmwF8cq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=CVmwF8cq; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KYGp84Yrvz2xf9
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Apr 2022 17:47:59 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 2365juZh017884; 
 Wed, 6 Apr 2022 07:47:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=ow8wwcItE63GnSABEuSBDjmu4YqU1yE+RCNQy9u8SIk=;
 b=CVmwF8cqfUByqSAwnrD9pF+d4j1x9QEAkkd4uhqkdsPOReQndH1yLktyrh6xrctwBQBn
 oOGPOtBwjRh7B+pqX6y+b997YvDDHEdz8bOM9seXkZ+8WaRxEUeJ35UxMaScCL3MhEcV
 VImQctWHhVHSdb8owdyk1uqItMSkwRMeY5TnnriBXj0eP7Py5Z8T6YiT8CBiseDleBos
 2wwnMtnK/sxzy0eeBEw/HVdkq1UJALi5ekL0g9bvE8PTAUacPlkBGlsxEmI2Tk/YF79i
 Xsq5HU7h64uFHgxNVZaM/pwVVPOGi0+3m6w6gpYuqkFoI4Rgtobt0NluxwDwDLuWs6pY GA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3f8twfvntr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 06 Apr 2022 07:47:46 +0000
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 2367ThQ5028574;
 Wed, 6 Apr 2022 07:47:45 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3f8twfvnsx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 06 Apr 2022 07:47:45 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2367hEKn011281;
 Wed, 6 Apr 2022 07:47:42 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma03fra.de.ibm.com with ESMTP id 3f6e48x1pp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 06 Apr 2022 07:47:42 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2367lddh36766010
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 6 Apr 2022 07:47:39 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 59BB1A4040;
 Wed,  6 Apr 2022 07:47:39 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C004FA4051;
 Wed,  6 Apr 2022 07:47:34 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.211.90.125])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Wed,  6 Apr 2022 07:47:34 +0000 (GMT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Re: [PATCH 2/4] tools/perf: Fix perf bench epoll to correct usage of
 affinity for machines with #CPUs > 1K
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
In-Reply-To: <CAP-5=fUi9f5V+kEgNJQyHDVxivxz-kEXY3-pdaLwf6wJhqyO5Q@mail.gmail.com>
Date: Wed, 6 Apr 2022 13:17:30 +0530
Content-Transfer-Encoding: quoted-printable
Message-Id: <A930DD19-865F-4B82-A39E-68E2B8D559D0@linux.vnet.ibm.com>
References: <20220401185853.23912-1-atrajeev@linux.vnet.ibm.com>
 <20220401185853.23912-3-atrajeev@linux.vnet.ibm.com>
 <CAP-5=fUi9f5V+kEgNJQyHDVxivxz-kEXY3-pdaLwf6wJhqyO5Q@mail.gmail.com>
To: Ian Rogers <irogers@google.com>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Uv-Blsiy_7Ve4CItbbWfxGdZXPe5jdzH
X-Proofpoint-GUID: cfHiusSfBtFOzgMBsUHDw5RidPFGDOD-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-04-06_02,2022-04-05_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0
 priorityscore=1501 impostorscore=0 adultscore=0 malwarescore=0 mlxscore=0
 bulkscore=0 lowpriorityscore=0 mlxlogscore=999 clxscore=1015 phishscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204060034
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
Cc: maddy@linux.vnet.ibm.com, rnsastry@linux.ibm.com,
 Arnaldo Carvalho de Melo <acme@kernel.org>, linux-perf-users@vger.kernel.org,
 Jiri Olsa <jolsa@kernel.org>, kjain@linux.ibm.com, disgoel@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 05-Apr-2022, at 11:26 PM, Ian Rogers <irogers@google.com> wrote:
>=20
> On Fri, Apr 1, 2022 at 12:00 PM Athira Rajeev
> <atrajeev@linux.vnet.ibm.com> wrote:
>>=20
>> perf bench epoll testcase fails on systems with CPU's
>> more than 1K.
>>=20
>> Testcase: perf bench epoll all
>> Result snippet:
>> <<>>
>> Run summary [PID 106497]: 1399 threads monitoring on 64 =
file-descriptors for 8 secs.
>>=20
>> perf: pthread_create: No such file or directory
>> <<>>
>>=20
>> In epoll benchmarks (ctl, wait) pthread_create is invoked in =
do_threads
>> from respective bench_epoll_*  function. Though the logs shows direct
>> failure from pthread_create, the actual failure is from  =
"sched_setaffinity"
>> returning EINVAL (invalid argument). This happens because the default
>> mask size in glibc is 1024. To overcome this 1024 CPUs mask size
>> limitation of cpu_set_t, change the mask size using the CPU_*_S =
macros.
>>=20
>> Patch addresses this by fixing all the epoll benchmarks to use
>> CPU_ALLOC to allocate cpumask, CPU_ALLOC_SIZE for size, and
>> CPU_SET_S to set the mask.
>>=20
>> Reported-by: Disha Goel <disgoel@linux.vnet.ibm.com>
>> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
>> ---
>> tools/perf/bench/epoll-ctl.c  | 25 +++++++++++++++++++------
>> tools/perf/bench/epoll-wait.c | 25 +++++++++++++++++++------
>> 2 files changed, 38 insertions(+), 12 deletions(-)
>>=20
>> diff --git a/tools/perf/bench/epoll-ctl.c =
b/tools/perf/bench/epoll-ctl.c
>> index 1a17ec83d3c4..91c53f6c6d87 100644
>> --- a/tools/perf/bench/epoll-ctl.c
>> +++ b/tools/perf/bench/epoll-ctl.c
>> @@ -222,13 +222,20 @@ static void init_fdmaps(struct worker *w, int =
pct)
>> static int do_threads(struct worker *worker, struct perf_cpu_map =
*cpu)
>> {
>>        pthread_attr_t thread_attr, *attrp =3D NULL;
>> -       cpu_set_t cpuset;
>> +       cpu_set_t *cpuset;
>>        unsigned int i, j;
>>        int ret =3D 0;
>> +       int nrcpus;
>> +       size_t size;
>>=20
>>        if (!noaffinity)
>>                pthread_attr_init(&thread_attr);
>>=20
>> +       nrcpus =3D perf_cpu_map__nr(cpu);
>> +       cpuset =3D CPU_ALLOC(nrcpus);
>> +       BUG_ON(!cpuset);
>> +       size =3D CPU_ALLOC_SIZE(nrcpus);
>> +
>>        for (i =3D 0; i < nthreads; i++) {
>>                struct worker *w =3D &worker[i];
>>=20
>> @@ -252,22 +259,28 @@ static int do_threads(struct worker *worker, =
struct perf_cpu_map *cpu)
>>                        init_fdmaps(w, 50);
>>=20
>>                if (!noaffinity) {
>> -                       CPU_ZERO(&cpuset);
>> -                       CPU_SET(perf_cpu_map__cpu(cpu, i % =
perf_cpu_map__nr(cpu)).cpu, &cpuset);
>> +                       CPU_ZERO_S(size, cpuset);
>> +                       CPU_SET_S(perf_cpu_map__cpu(cpu, i % =
perf_cpu_map__nr(cpu)).cpu,
>> +                                       size, cpuset);
>>=20
>> -                       ret =3D =
pthread_attr_setaffinity_np(&thread_attr, sizeof(cpu_set_t), &cpuset);
>> -                       if (ret)
>> +                       ret =3D =
pthread_attr_setaffinity_np(&thread_attr, size, cpuset);
>> +                       if (ret) {
>> +                               CPU_FREE(cpuset);
>>                                err(EXIT_FAILURE, =
"pthread_attr_setaffinity_np");
>> +                       }
>>=20
>>                        attrp =3D &thread_attr;
>>                }
>>=20
>>                ret =3D pthread_create(&w->thread, attrp, workerfn,
>>                                     (void *)(struct worker *) w);
>> -               if (ret)
>> +               if (ret) {
>> +                       CPU_FREE(cpuset);
>>                        err(EXIT_FAILURE, "pthread_create");
>> +               }
>>        }
>>=20
>> +       CPU_FREE(cpuset);
>=20
> A nit here you could CPU_FREE right after the ret =3D =
pthread_create...
> to make it a bit shorter.
>=20
> Thanks,
> Ian

Hi Ian,

Here, the pthread_create is run in loop for nthreads.
And CPU_ALLOC for cpu set is done before the loop. I am doing =
=E2=80=9CCPU_FREE" inside loop only for cases when pthread_create fails =
where benchmark exits. In other cases, we need the mask allocated till =
loop completes for =E2=80=9Cnthreads=E2=80=9D.=20
So, we need CPU_FREE outside loop also.=20

Thanks
Athira
>=20
>>        if (!noaffinity)
>>                pthread_attr_destroy(&thread_attr);
>>=20
>> diff --git a/tools/perf/bench/epoll-wait.c =
b/tools/perf/bench/epoll-wait.c
>> index 0d1dd8879197..9469a53ffab9 100644
>> --- a/tools/perf/bench/epoll-wait.c
>> +++ b/tools/perf/bench/epoll-wait.c
>> @@ -291,9 +291,11 @@ static void print_summary(void)
>> static int do_threads(struct worker *worker, struct perf_cpu_map =
*cpu)
>> {
>>        pthread_attr_t thread_attr, *attrp =3D NULL;
>> -       cpu_set_t cpuset;
>> +       cpu_set_t *cpuset;
>>        unsigned int i, j;
>>        int ret =3D 0, events =3D EPOLLIN;
>> +       int nrcpus;
>> +       size_t size;
>>=20
>>        if (oneshot)
>>                events |=3D EPOLLONESHOT;
>> @@ -306,6 +308,11 @@ static int do_threads(struct worker *worker, =
struct perf_cpu_map *cpu)
>>        if (!noaffinity)
>>                pthread_attr_init(&thread_attr);
>>=20
>> +       nrcpus =3D perf_cpu_map__nr(cpu);
>> +       cpuset =3D CPU_ALLOC(nrcpus);
>> +       BUG_ON(!cpuset);
>> +       size =3D CPU_ALLOC_SIZE(nrcpus);
>> +
>>        for (i =3D 0; i < nthreads; i++) {
>>                struct worker *w =3D &worker[i];
>>=20
>> @@ -341,22 +348,28 @@ static int do_threads(struct worker *worker, =
struct perf_cpu_map *cpu)
>>                }
>>=20
>>                if (!noaffinity) {
>> -                       CPU_ZERO(&cpuset);
>> -                       CPU_SET(perf_cpu_map__cpu(cpu, i % =
perf_cpu_map__nr(cpu)).cpu, &cpuset);
>> +                       CPU_ZERO_S(size, cpuset);
>> +                       CPU_SET_S(perf_cpu_map__cpu(cpu, i % =
perf_cpu_map__nr(cpu)).cpu,
>> +                                       size, cpuset);
>>=20
>> -                       ret =3D =
pthread_attr_setaffinity_np(&thread_attr, sizeof(cpu_set_t), &cpuset);
>> -                       if (ret)
>> +                       ret =3D =
pthread_attr_setaffinity_np(&thread_attr, size, cpuset);
>> +                       if (ret) {
>> +                               CPU_FREE(cpuset);
>>                                err(EXIT_FAILURE, =
"pthread_attr_setaffinity_np");
>> +                       }
>>=20
>>                        attrp =3D &thread_attr;
>>                }
>>=20
>>                ret =3D pthread_create(&w->thread, attrp, workerfn,
>>                                     (void *)(struct worker *) w);
>> -               if (ret)
>> +               if (ret) {
>> +                       CPU_FREE(cpuset);
>>                        err(EXIT_FAILURE, "pthread_create");
>> +               }
>>        }
>>=20
>> +       CPU_FREE(cpuset);
>>        if (!noaffinity)
>>                pthread_attr_destroy(&thread_attr);
>>=20
>> --
>> 2.35.1

