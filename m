Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 65B224F56C2
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Apr 2022 09:16:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KYG5r1QPhz3bbn
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Apr 2022 17:16:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=lt9yVY1/;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=lt9yVY1/; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KYG562q02z2xdN
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Apr 2022 17:15:53 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 2366dpkE031369; 
 Wed, 6 Apr 2022 07:15:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=f5aykivf1pIhOZd41V/+jcTwrIlJUaqct6xA14ZOS/4=;
 b=lt9yVY1/+7qqg/+gnmhFHxfPDbOhIXBgb7MD7GYkAc6Vv+OCOSK9dDxvavE1s9aLksGt
 16RvFy5JPbL2XEKQM/J42kRWQfPVXJaaSKawAZpzxPqrzirzl/diM8zz8Nu44J2pnkIi
 fSPwuYa2zJ5dlj0noqQz/SWpI86FwGWMQFq/GW+p8/FW2qXziFvQkbT7GNV9eFGU/Vaz
 Xu7TFvFl4FJwz+92rqMA9ufWcgjgn5VL+0YES1AaTmoPhysbX0bsYINrL0NMsaElCLP6
 B9XoIoSGXRUu6uX1Z2rO3kB979jlhSYmCeLCPZMJesIkRryLmpQDytjVqn+L04rGNzBr iA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3f944pa96d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 06 Apr 2022 07:15:48 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 2367Fl4B005321;
 Wed, 6 Apr 2022 07:15:47 GMT
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3f944pa95k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 06 Apr 2022 07:15:47 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2367DbD7016863;
 Wed, 6 Apr 2022 07:15:39 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma02fra.de.ibm.com with ESMTP id 3f6e48p0u2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 06 Apr 2022 07:15:39 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2367Fabl25559548
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 6 Apr 2022 07:15:36 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 60FA9A4040;
 Wed,  6 Apr 2022 07:15:36 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8D500A4053;
 Wed,  6 Apr 2022 07:15:32 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.211.90.125])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Wed,  6 Apr 2022 07:15:32 +0000 (GMT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Re: [PATCH 3/4] tools/perf: Fix perf numa bench to fix usage of
 affinity for machines with #CPUs > 1K
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
In-Reply-To: <CAP-5=fX6n-VkQWAxLm4YHCkfUAvB+dwiaTJyD5Xpowv-OE9z8g@mail.gmail.com>
Date: Wed, 6 Apr 2022 12:45:28 +0530
Content-Transfer-Encoding: quoted-printable
Message-Id: <94107053-FDE7-444D-BC20-0467962A5765@linux.vnet.ibm.com>
References: <20220401185853.23912-1-atrajeev@linux.vnet.ibm.com>
 <20220401185853.23912-4-atrajeev@linux.vnet.ibm.com>
 <CAP-5=fX6n-VkQWAxLm4YHCkfUAvB+dwiaTJyD5Xpowv-OE9z8g@mail.gmail.com>
To: Ian Rogers <irogers@google.com>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: QVLldewd-LyDVOc1xabQNhrBcBtBDqPB
X-Proofpoint-ORIG-GUID: _itJ-x2lFJwmWK45scD00kGY0JeCBU5l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-04-06_02,2022-04-05_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 lowpriorityscore=0 spamscore=0 mlxscore=0 bulkscore=0 phishscore=0
 adultscore=0 suspectscore=0 impostorscore=0 priorityscore=1501
 malwarescore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2202240000 definitions=main-2204060032
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
Cc: maddy@linux.vnet.ibm.com, Nageswara Sastry <rnsastry@linux.ibm.com>,
 kajoljain <kjain@linux.ibm.com>, Arnaldo Carvalho de Melo <acme@kernel.org>,
 linux-perf-users@vger.kernel.org, Jiri Olsa <jolsa@kernel.org>,
 disgoel@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 05-Apr-2022, at 11:22 PM, Ian Rogers <irogers@google.com> wrote:
>=20
> On Fri, Apr 1, 2022 at 11:59 AM Athira Rajeev
> <atrajeev@linux.vnet.ibm.com> wrote:
>>=20
>> perf bench numa testcase fails on systems with CPU's
>> more than 1K.
>>=20
>> Testcase: perf bench numa mem -p 1 -t 3 -P 512 -s 100 -zZ0qcm --thp  =
1
>> Snippet of code:
>> <<>>
>> perf: bench/numa.c:302: bind_to_node: Assertion `!(ret)' failed.
>> Aborted (core dumped)
>> <<>>
>>=20
>> bind_to_node function uses "sched_getaffinity" to save the original
>> cpumask and this call is returning EINVAL ((invalid argument).
>> This happens because the default mask size in glibc is 1024.
>> To overcome this 1024 CPUs mask size limitation of cpu_set_t,
>> change the mask size using the CPU_*_S macros ie, use CPU_ALLOC to
>> allocate cpumask, CPU_ALLOC_SIZE for size. Apart from fixing this
>> for "orig_mask", apply same logic to "mask" as well which is used to
>> setaffinity so that mask size is large enough to represent number
>> of possible CPU's in the system.
>>=20
>> sched_getaffinity is used in one more place in perf numa bench. It
>> is in "bind_to_cpu" function. Apply the same logic there also. Though
>> currently no failure is reported from there, it is ideal to change
>> getaffinity to work with such system configurations having CPU's more
>> than default mask size supported by glibc.
>>=20
>> Also fix "sched_setaffinity" to use mask size which is large enough
>> to represent number of possible CPU's in the system.
>>=20
>> Fixed all places where "bind_cpumask" which is part of "struct
>> thread_data" is used such that bind_cpumask works in all =
configuration.
>>=20
>> Reported-by: Disha Goel <disgoel@linux.vnet.ibm.com>
>> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
>> ---
>> tools/perf/bench/numa.c | 109 =
+++++++++++++++++++++++++++++-----------
>> 1 file changed, 81 insertions(+), 28 deletions(-)
>>=20
>> diff --git a/tools/perf/bench/numa.c b/tools/perf/bench/numa.c
>> index f2640179ada9..333896907e45 100644
>> --- a/tools/perf/bench/numa.c
>> +++ b/tools/perf/bench/numa.c
>> @@ -54,7 +54,7 @@
>>=20
>> struct thread_data {
>>        int                     curr_cpu;
>> -       cpu_set_t               bind_cpumask;
>> +       cpu_set_t               *bind_cpumask;
>>        int                     bind_node;
>>        u8                      *process_data;
>>        int                     process_nr;
>> @@ -266,46 +266,75 @@ static bool node_has_cpus(int node)
>>        return ret;
>> }
>>=20
>> -static cpu_set_t bind_to_cpu(int target_cpu)
>> +static cpu_set_t *bind_to_cpu(int target_cpu)
>> {
>> -       cpu_set_t orig_mask, mask;
>> +       int nrcpus =3D numa_num_possible_cpus();
>> +       cpu_set_t *orig_mask, *mask;
>> +       size_t size;
>>        int ret;
>>=20
>> -       ret =3D sched_getaffinity(0, sizeof(orig_mask), &orig_mask);
>> -       BUG_ON(ret);
>> +       orig_mask =3D CPU_ALLOC(nrcpus);
>> +       BUG_ON(!orig_mask);
>> +       size =3D CPU_ALLOC_SIZE(nrcpus);
>> +       CPU_ZERO_S(size, orig_mask);
>> +
>> +       ret =3D sched_getaffinity(0, size, orig_mask);
>> +       if (ret) {
>> +               CPU_FREE(orig_mask);
>> +               BUG_ON(ret);
>> +       }
>>=20
>> -       CPU_ZERO(&mask);
>> +       mask =3D CPU_ALLOC(nrcpus);
>> +       BUG_ON(!mask);
>> +       CPU_ZERO_S(size, mask);
>>=20
>>        if (target_cpu =3D=3D -1) {
>>                int cpu;
>>=20
>>                for (cpu =3D 0; cpu < g->p.nr_cpus; cpu++)
>> -                       CPU_SET(cpu, &mask);
>> +                       CPU_SET_S(cpu, size, mask);
>>        } else {
>>                BUG_ON(target_cpu < 0 || target_cpu >=3D =
g->p.nr_cpus);
>> -               CPU_SET(target_cpu, &mask);
>> +               CPU_SET_S(target_cpu, size, mask);
>>        }
>>=20
>> -       ret =3D sched_setaffinity(0, sizeof(mask), &mask);
>> -       BUG_ON(ret);
>> +       ret =3D sched_setaffinity(0, size, mask);
>> +       if (ret) {
>> +               CPU_FREE(mask);
>> +               BUG_ON(ret);
>> +       }
>> +
>> +       CPU_FREE(mask);
>=20
> This all looks good, a nit here it could it be a little shorter as:
> ret =3D sched_setaffinity(0, size, mask);
> CPU_FREE(mask);
> BUG_ON(ret);
>=20
> Thanks,
> Ian
>=20

Thanks for the review Ian.
Sure, I will address this change in V2

Thanks
Athira
>>=20
>>        return orig_mask;
>> }
>>=20
>> -static cpu_set_t bind_to_node(int target_node)
>> +static cpu_set_t *bind_to_node(int target_node)
>> {
>> -       cpu_set_t orig_mask, mask;
>> +       int nrcpus =3D numa_num_possible_cpus();
>> +       cpu_set_t *orig_mask, *mask;
>> +       size_t size;
>>        int cpu;
>>        int ret;
>>=20
>> -       ret =3D sched_getaffinity(0, sizeof(orig_mask), &orig_mask);
>> -       BUG_ON(ret);
>> +       orig_mask =3D CPU_ALLOC(nrcpus);
>> +       BUG_ON(!orig_mask);
>> +       size =3D CPU_ALLOC_SIZE(nrcpus);
>> +       CPU_ZERO_S(size, orig_mask);
>> +
>> +       ret =3D sched_getaffinity(0, size, orig_mask);
>> +       if (ret) {
>> +               CPU_FREE(orig_mask);
>> +               BUG_ON(ret);
>> +       }
>>=20
>> -       CPU_ZERO(&mask);
>> +       mask =3D CPU_ALLOC(nrcpus);
>> +       BUG_ON(!mask);
>> +       CPU_ZERO_S(size, mask);
>>=20
>>        if (target_node =3D=3D NUMA_NO_NODE) {
>>                for (cpu =3D 0; cpu < g->p.nr_cpus; cpu++)
>> -                       CPU_SET(cpu, &mask);
>> +                       CPU_SET_S(cpu, size, mask);
>>        } else {
>>                struct bitmask *cpumask =3D numa_allocate_cpumask();
>>=20
>> @@ -313,24 +342,33 @@ static cpu_set_t bind_to_node(int target_node)
>>                if (!numa_node_to_cpus(target_node, cpumask)) {
>>                        for (cpu =3D 0; cpu < (int)cpumask->size; =
cpu++) {
>>                                if (numa_bitmask_isbitset(cpumask, =
cpu))
>> -                                       CPU_SET(cpu, &mask);
>> +                                       CPU_SET_S(cpu, size, mask);
>>                        }
>>                }
>>                numa_free_cpumask(cpumask);
>>        }
>>=20
>> -       ret =3D sched_setaffinity(0, sizeof(mask), &mask);
>> -       BUG_ON(ret);
>> +       ret =3D sched_setaffinity(0, size, mask);
>> +       if (ret) {
>> +               CPU_FREE(mask);
>> +               BUG_ON(ret);
>> +       }
>> +
>> +       CPU_FREE(mask);
>>=20
>>        return orig_mask;
>> }
>>=20
>> -static void bind_to_cpumask(cpu_set_t mask)
>> +static void bind_to_cpumask(cpu_set_t *mask)
>> {
>>        int ret;
>> +       size_t size =3D CPU_ALLOC_SIZE(numa_num_possible_cpus());
>>=20
>> -       ret =3D sched_setaffinity(0, sizeof(mask), &mask);
>> -       BUG_ON(ret);
>> +       ret =3D sched_setaffinity(0, size, mask);
>> +       if (ret) {
>> +               CPU_FREE(mask);
>> +               BUG_ON(ret);
>> +       }
>> }
>>=20
>> static void mempol_restore(void)
>> @@ -376,7 +414,7 @@ do {                                              =
          \
>> static u8 *alloc_data(ssize_t bytes0, int map_flags,
>>                      int init_zero, int init_cpu0, int thp, int =
init_random)
>> {
>> -       cpu_set_t orig_mask;
>> +       cpu_set_t *orig_mask;
>>        ssize_t bytes;
>>        u8 *buf;
>>        int ret;
>> @@ -434,6 +472,7 @@ static u8 *alloc_data(ssize_t bytes0, int =
map_flags,
>>        /* Restore affinity: */
>>        if (init_cpu0) {
>>                bind_to_cpumask(orig_mask);
>> +               CPU_FREE(orig_mask);
>>                mempol_restore();
>>        }
>>=20
>> @@ -589,6 +628,7 @@ static int parse_setup_cpu_list(void)
>>                BUG_ON(bind_cpu_0 > bind_cpu_1);
>>=20
>>                for (bind_cpu =3D bind_cpu_0; bind_cpu <=3D =
bind_cpu_1; bind_cpu +=3D step) {
>> +                       size_t size =3D CPU_ALLOC_SIZE(g->p.nr_cpus);
>>                        int i;
>>=20
>>                        for (i =3D 0; i < mul; i++) {
>> @@ -608,10 +648,12 @@ static int parse_setup_cpu_list(void)
>>                                        tprintf("%2d", bind_cpu);
>>                                }
>>=20
>> -                               CPU_ZERO(&td->bind_cpumask);
>> +                               td->bind_cpumask =3D =
CPU_ALLOC(g->p.nr_cpus);
>> +                               BUG_ON(!td->bind_cpumask);
>> +                               CPU_ZERO_S(size, td->bind_cpumask);
>>                                for (cpu =3D bind_cpu; cpu < =
bind_cpu+bind_len; cpu++) {
>>                                        BUG_ON(cpu < 0 || cpu >=3D =
g->p.nr_cpus);
>> -                                       CPU_SET(cpu, =
&td->bind_cpumask);
>> +                                       CPU_SET_S(cpu, size, =
td->bind_cpumask);
>>                                }
>>                                t++;
>>                        }
>> @@ -1241,7 +1283,7 @@ static void *worker_thread(void *__tdata)
>>                 * by migrating to CPU#0:
>>                 */
>>                if (first_task && g->p.perturb_secs && =
(int)(stop.tv_sec - last_perturbance) >=3D g->p.perturb_secs) {
>> -                       cpu_set_t orig_mask;
>> +                       cpu_set_t *orig_mask;
>>                        int target_cpu;
>>                        int this_cpu;
>>=20
>> @@ -1265,6 +1307,7 @@ static void *worker_thread(void *__tdata)
>>                                printf(" (injecting perturbalance, =
moved to CPU#%d)\n", target_cpu);
>>=20
>>                        bind_to_cpumask(orig_mask);
>> +                       CPU_FREE(orig_mask);
>>                }
>>=20
>>                if (details >=3D 3) {
>> @@ -1398,21 +1441,31 @@ static void init_thread_data(void)
>>=20
>>        for (t =3D 0; t < g->p.nr_tasks; t++) {
>>                struct thread_data *td =3D g->threads + t;
>> +               size_t cpuset_size =3D CPU_ALLOC_SIZE(g->p.nr_cpus);
>>                int cpu;
>>=20
>>                /* Allow all nodes by default: */
>>                td->bind_node =3D NUMA_NO_NODE;
>>=20
>>                /* Allow all CPUs by default: */
>> -               CPU_ZERO(&td->bind_cpumask);
>> +               td->bind_cpumask =3D CPU_ALLOC(g->p.nr_cpus);
>> +               BUG_ON(!td->bind_cpumask);
>> +               CPU_ZERO_S(cpuset_size, td->bind_cpumask);
>>                for (cpu =3D 0; cpu < g->p.nr_cpus; cpu++)
>> -                       CPU_SET(cpu, &td->bind_cpumask);
>> +                       CPU_SET_S(cpu, cpuset_size, =
td->bind_cpumask);
>>        }
>> }
>>=20
>> static void deinit_thread_data(void)
>> {
>>        ssize_t size =3D sizeof(*g->threads)*g->p.nr_tasks;
>> +       int t;
>> +
>> +       /* Free the bind_cpumask allocated for thread_data */
>> +       for (t =3D 0; t < g->p.nr_tasks; t++) {
>> +               struct thread_data *td =3D g->threads + t;
>> +               CPU_FREE(td->bind_cpumask);
>> +       }
>>=20
>>        free_data(g->threads, size);
>> }
>> --
>> 2.35.1

