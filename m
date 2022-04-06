Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C10E4F6F5B
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Apr 2022 02:56:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KYjcL27Zzz3bY8
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Apr 2022 10:56:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=QbXyXCat;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=disgoel@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=QbXyXCat; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KYGVL4RB8z2xdN
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Apr 2022 17:34:18 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 2367VcW5040028; 
 Wed, 6 Apr 2022 07:34:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version; s=pp1; bh=RTJ8FLGvZHPTSxc5uG+vrEOs3cBxgBw2bARZ5DxKOgk=;
 b=QbXyXCatG6P/YgAWtTeyqIzcUl5TAoqw1xJUrWpl0l57kYwcaOL37Qo2PuQ+CDmmOqwt
 g+tffyhZyS8Hp1/6u0ak9TC8+ixdvl/iq9MwX2ConWHgDzHZcwiTBRJJR7iqIQsDP7FC
 EVKn/3/qflsbZPFy8zmZo7yBNI1dS8OWL/baGMSdE6tswL3FNnSm3MHkDB5RL5FZ2eFJ
 STdQtjVm43b5mUntoPS+EK+7OaXsHNYuvgoSGlrawOG8O5Lh4pczKtLWLd1fiHWKhk0M
 NbfShYtW/wdN81E4mxkYJS4uD9Qes5JM/qo6cVMen1bfs1nwd3YL9s3xde9LUuAUOJrv vA== 
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3f8tfjw07g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 06 Apr 2022 07:34:07 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2367XLZw002015;
 Wed, 6 Apr 2022 07:34:05 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma03fra.de.ibm.com with ESMTP id 3f6e48x10y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 06 Apr 2022 07:34:05 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2367Y2Ma39387572
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 6 Apr 2022 07:34:02 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2B0F9A4051;
 Wed,  6 Apr 2022 07:34:02 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 16A66A404D;
 Wed,  6 Apr 2022 07:33:58 +0000 (GMT)
Received: from disgoel-ibm-com (unknown [9.43.2.185])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed,  6 Apr 2022 07:33:57 +0000 (GMT)
Message-ID: <d8202853dfabeefd2c23f534ad3bd67c856a2cc7.camel@linux.vnet.ibm.com>
Subject: Re: [PATCH 0/4] tools/perf: Fix perf bench numa, futex and epoll to
 work with machines having #CPUs > 1K
From: Disha Goel <disgoel@linux.vnet.ibm.com>
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>, acme@kernel.org,
 jolsa@kernel.org
Date: Wed, 06 Apr 2022 13:03:55 +0530
In-Reply-To: <20220401185853.23912-1-atrajeev@linux.vnet.ibm.com>
References: <20220401185853.23912-1-atrajeev@linux.vnet.ibm.com>
Content-Type: multipart/alternative; boundary="=-ofgAJE5RZSyPp+LpVbqp"
X-Mailer: Evolution 3.28.5 (3.28.5-18.el8) 
Mime-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 1PkTl95tsz4yB0S4eztUR5hpjqF36Rx8
X-Proofpoint-GUID: 1PkTl95tsz4yB0S4eztUR5hpjqF36Rx8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-04-06_02,2022-04-05_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 phishscore=0 adultscore=0 impostorscore=0 bulkscore=0 mlxlogscore=999
 suspectscore=0 mlxscore=0 spamscore=0 clxscore=1011 priorityscore=1501
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204060034
X-Mailman-Approved-At: Thu, 07 Apr 2022 10:55:27 +1000
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
 linux-perf-users@vger.kernel.org, kjain@linux.ibm.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--=-ofgAJE5RZSyPp+LpVbqp
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit



-----Original Message-----
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: acme@kernel.org, jolsa@kernel.org, disgoel@linux.vnet.ibm.com
Cc: mpe@ellerman.id.au, linux-perf-users@vger.kernel.org, 
linuxppc-dev@lists.ozlabs.org, maddy@linux.vnet.ibm.com, 
rnsastry@linux.ibm.com, kjain@linux.ibm.com
Subject: [PATCH 0/4] tools/perf: Fix perf bench numa, futex and epoll
to work with machines having #CPUs > 1K
Date: Sat,  2 Apr 2022 00:28:49 +0530

The perf benchmark for collections: numa, futex and epollhits failure
in system configuration with CPU's more than 1024.These benchmarks uses
"sched_getaffinity" and "sched_setaffinity"in the code to work with
affinity.
Example snippet from numa benchmark:<<>>perf: bench/numa.c:302:
bind_to_node: Assertion `!(ret)' failed.Aborted (core dumped)<<>>
bind_to_node function uses "sched_getaffinity" to save the cpumask.This
fails with EINVAL because the default mask size in glibc is 1024.
Similarly in futex and epoll benchmark, uses sched_setaffinity
duringpthread_create with affinity. And since it returns EINVAL in such
systemconfiguration, benchmark doesn't run.
To overcome this 1024 CPUs mask size limitation of cpu_set_t,change the
mask size using the CPU_*_S macros ie, use CPU_ALLOC toallocate
cpumask, CPU_ALLOC_SIZE for size, CPU_SET_S to set mask bit.
Fix all the relevant places in the code to use mask size which is
largeenough to represent number of possible CPU's in the system.
Fix parse_setup_cpu_list function in numa bench to check if input CPUis
online before binding task to that CPU. This is to fix failures
where,though CPU number is within max CPU, it could happen that CPU is
offline.Here, sched_setaffinity will result in failure when using
cpumask havingthat cpu bit set in the mask.
Patch 1 and Patch 2 address fix for perf bench futex and perf
benchepoll benchmark. Patch 3 and Patch 4 address fix in perf bench
numabenchmark
Athira Rajeev (4):  tools/perf: Fix perf bench futex to correct usage
of affinity for    machines with #CPUs > 1K  tools/perf: Fix perf bench
epoll to correct usage of affinity for    machines with #CPUs >
1K  tools/perf: Fix perf numa bench to fix usage of affinity for
machines    with #CPUs > 1K  tools/perf: Fix perf bench numa testcase
to check if CPU used to bind    task is online
Tesed the patches on powerpc with CPU > 1K and other configurations as
well, verified the perf benchmark numa, futex and epoll for whole
series with the patch set.Tested-by: Disha Goel <
disgoel@linux.vnet.ibm.com>
 tools/perf/bench/epoll-ctl.c           |  25 ++++--
tools/perf/bench/epoll-wait.c          |  25 ++++--
tools/perf/bench/futex-hash.c          |  26 ++++--
tools/perf/bench/futex-lock-pi.c       |  21 +++--
tools/perf/bench/futex-requeue.c       |  21 +++--
tools/perf/bench/futex-wake-parallel.c |  21 +++--
tools/perf/bench/futex-wake.c          |  22 +++--
tools/perf/bench/numa.c                | 117 ++++++++++++++++++-------
tools/perf/util/header.c               |  43 +++++++++
tools/perf/util/header.h               |   1 + 10 files changed, 252
insertions(+), 70 deletions(-)


--=-ofgAJE5RZSyPp+LpVbqp
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<html dir=3D"ltr"><head></head><body style=3D"text-align:left; direction:lt=
r;"><div><br></div><div><br></div><div>-----Original Message-----</div><div=
><b>From</b>: Athira Rajeev &lt;<a href=3D"mailto:Athira%20Rajeev%20%3catra=
jeev@linux.vnet.ibm.com%3e">atrajeev@linux.vnet.ibm.com</a>&gt;</div><div><=
b>To</b>: <a href=3D"mailto:acme@kernel.org">acme@kernel.org</a>, <a href=
=3D"mailto:jolsa@kernel.org">jolsa@kernel.org</a>, <a href=3D"mailto:disgoe=
l@linux.vnet.ibm.com">disgoel@linux.vnet.ibm.com</a></div><div><b>Cc</b>: <=
a href=3D"mailto:mpe@ellerman.id.au">mpe@ellerman.id.au</a>, <a href=3D"mai=
lto:linux-perf-users@vger.kernel.org">linux-perf-users@vger.kernel.org</a>,=
 <a href=3D"mailto:linuxppc-dev@lists.ozlabs.org">linuxppc-dev@lists.ozlabs=
.org</a>, <a href=3D"mailto:maddy@linux.vnet.ibm.com">maddy@linux.vnet.ibm.=
com</a>, <a href=3D"mailto:rnsastry@linux.ibm.com">rnsastry@linux.ibm.com</=
a>, <a href=3D"mailto:kjain@linux.ibm.com">kjain@linux.ibm.com</a></div><di=
v><b>Subject</b>: [PATCH 0/4] tools/perf: Fix perf bench numa, futex and ep=
oll to work with machines having #CPUs &gt; 1K</div><div><b>Date</b>: Sat, =
 2 Apr 2022 00:28:49 +0530</div><div><br></div><pre>The perf benchmark for =
collections: numa, futex and epoll</pre><pre>hits failure in system configu=
ration with CPU's more than 1024.</pre><pre>These benchmarks uses "sched_ge=
taffinity" and "sched_setaffinity"</pre><pre>in the code to work with affin=
ity.</pre><pre><br></pre><pre>Example snippet from numa benchmark:</pre><pr=
e>&lt;&lt;&gt;&gt;</pre><pre>perf: bench/numa.c:302: bind_to_node: Assertio=
n `!(ret)' failed.</pre><pre>Aborted (core dumped)</pre><pre>&lt;&lt;&gt;&g=
t;</pre><pre><br></pre><pre>bind_to_node function uses "sched_getaffinity" =
to save the cpumask.</pre><pre>This fails with EINVAL because the default m=
ask size in glibc is 1024.</pre><pre><br></pre><pre>Similarly in futex and =
epoll benchmark, uses sched_setaffinity during</pre><pre>pthread_create wit=
h affinity. And since it returns EINVAL in such system</pre><pre>configurat=
ion, benchmark doesn't run.</pre><pre><br></pre><pre>To overcome this 1024 =
CPUs mask size limitation of cpu_set_t,</pre><pre>change the mask size usin=
g the CPU_*_S macros ie, use CPU_ALLOC to</pre><pre>allocate cpumask, CPU_A=
LLOC_SIZE for size, CPU_SET_S to set mask bit.</pre><pre><br></pre><pre>Fix=
 all the relevant places in the code to use mask size which is large</pre><=
pre>enough to represent number of possible CPU's in the system.</pre><pre><=
br></pre><pre>Fix parse_setup_cpu_list function in numa bench to check if i=
nput CPU</pre><pre>is online before binding task to that CPU. This is to fi=
x failures where,</pre><pre>though CPU number is within max CPU, it could h=
appen that CPU is offline.</pre><pre>Here, sched_setaffinity will result in=
 failure when using cpumask having</pre><pre>that cpu bit set in the mask.<=
/pre><pre><br></pre><pre>Patch 1 and Patch 2 address fix for perf bench fut=
ex and perf bench</pre><pre>epoll benchmark. Patch 3 and Patch 4 address fi=
x in perf bench numa</pre><pre>benchmark</pre><pre><br></pre><pre>Athira Ra=
jeev (4):</pre><pre>  tools/perf: Fix perf bench futex to correct usage of =
affinity for</pre><pre>    machines with #CPUs &gt; 1K</pre><pre>  tools/pe=
rf: Fix perf bench epoll to correct usage of affinity for</pre><pre>    mac=
hines with #CPUs &gt; 1K</pre><pre>  tools/perf: Fix perf numa bench to fix=
 usage of affinity for machines</pre><pre>    with #CPUs &gt; 1K</pre><pre>=
  tools/perf: Fix perf bench numa testcase to check if CPU used to bind</pr=
e><pre>    task is online</pre><pre><br></pre><pre>Tesed the patches on pow=
erpc with CPU &gt; 1K and other configurations as well, verified the perf b=
enchmark numa, futex and epoll for whole series with the patch set.</pre><p=
re>Tested-by: Disha Goel &lt;<a href=3D"mailto:disgoel@linux.vnet.ibm.com">=
disgoel@linux.vnet.ibm.com</a>&gt;</pre><pre><span class=3D"c-message__edit=
ed_label" dir=3D"ltr" delay=3D"300" data-sk=3D"tooltip_parent" aria-describ=
edby=3D"sk-tooltip-7876" style=3D"box-sizing: inherit; cursor: default; fon=
t-size: 13px; white-space: nowrap; color: rgba(var(--sk_foreground_high_sol=
id,134,134,134),1); font-family: Slack-Lato, Slack-Fractions, appleLogo, sa=
ns-serif; font-variant-ligatures: common-ligatures; orphans: 2; widows: 2; =
background-color: rgb(248, 248, 248); text-decoration-thickness: initial;">=
<br></span></pre><pre> tools/perf/bench/epoll-ctl.c           |  25 ++++--<=
/pre><pre> tools/perf/bench/epoll-wait.c          |  25 ++++--</pre><pre> t=
ools/perf/bench/futex-hash.c          |  26 ++++--</pre><pre> tools/perf/be=
nch/futex-lock-pi.c       |  21 +++--</pre><pre> tools/perf/bench/futex-req=
ueue.c       |  21 +++--</pre><pre> tools/perf/bench/futex-wake-parallel.c =
|  21 +++--</pre><pre> tools/perf/bench/futex-wake.c          |  22 +++--</=
pre><pre> tools/perf/bench/numa.c                | 117 ++++++++++++++++++--=
-----</pre><pre> tools/perf/util/header.c               |  43 +++++++++</pr=
e><pre> tools/perf/util/header.h               |   1 +</pre><pre> 10 files =
changed, 252 insertions(+), 70 deletions(-)</pre><pre><br></pre></body></ht=
ml>

--=-ofgAJE5RZSyPp+LpVbqp--

