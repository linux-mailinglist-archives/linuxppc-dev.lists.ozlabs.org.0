Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A98A3500401
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Apr 2022 04:07:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kf2sR4vPPz3bfC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Apr 2022 12:07:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=gE4AEiKq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=disgoel@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=gE4AEiKq; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KdlQd2P2Xz2xKT
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Apr 2022 00:31:36 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 23DCmeth031326; 
 Wed, 13 Apr 2022 14:31:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version; s=pp1; bh=Y8jlYoG6vVAI6ionQZqVLq6nwk37g/rdsB0wsUqn3d4=;
 b=gE4AEiKqstPDjTo+skvCCgfzk+A5hLNqyM1Wi7vXBrQck3qaqkX8Bw847/qL9FiPmmt3
 om2iIDvKYrKcK9AzDdxizokBIjrmIILf7WlIl360zavshHBpIn0W9106fsgeVEFtWZYk
 sUorM6dIdF17QK0tMgUo90mNRNBb3YXJc8jPsqakZ1BVK2fa0o1rQ5+PvzuGI65PGJcw
 HQz/j4bQ5VYpcoeEVBRRFBO2Wab0KwzqGPtqselj5I0LgGdKV4TClnL7MMSURSfFLORM
 wFHGis1NVhdY/DRCuYUecAHVfiQesRX/r6s4wiNq4y3euSZu6lFhbUMlPvAx09Soo34M OQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3fdxusagkp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 13 Apr 2022 14:31:22 +0000
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 23DEVMgW021021;
 Wed, 13 Apr 2022 14:31:22 GMT
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3fdxusagjh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 13 Apr 2022 14:31:22 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 23DEE075013256;
 Wed, 13 Apr 2022 14:31:19 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma05fra.de.ibm.com with ESMTP id 3fb1s8nmbb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 13 Apr 2022 14:31:19 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 23DEVPt143254160
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 13 Apr 2022 14:31:25 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5ECAF4C044;
 Wed, 13 Apr 2022 14:31:16 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 768E24C040;
 Wed, 13 Apr 2022 14:31:10 +0000 (GMT)
Received: from disgoel-ibm-com (unknown [9.43.116.244])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 13 Apr 2022 14:31:10 +0000 (GMT)
Message-ID: <c977f552a37f092b69b22fe07b2adef053a4d721.camel@linux.vnet.ibm.com>
Subject: Re: [PATCH V3 0/2] Fix perf bench numa to work with machines having
 #CPUs > 1K
From: Disha Goel <disgoel@linux.vnet.ibm.com>
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>, acme@kernel.org,
 jolsa@kernel.org
Date: Wed, 13 Apr 2022 20:01:08 +0530
In-Reply-To: <20220412164059.42654-1-atrajeev@linux.vnet.ibm.com>
References: <20220412164059.42654-1-atrajeev@linux.vnet.ibm.com>
Content-Type: multipart/alternative; boundary="=-L2vVa6joYbbKvsUwutrU"
X-Mailer: Evolution 3.28.5 (3.28.5-18.el8) 
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 86artl2ZVaCK9fKhb283Vfrz3GaVEc0_
X-Proofpoint-ORIG-GUID: _6rMQWkCwL9tk1yTt0EBdhFIokyYWZft
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-13_02,2022-04-13_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 clxscore=1011 impostorscore=0
 adultscore=0 malwarescore=0 mlxlogscore=999 lowpriorityscore=0 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204130077
X-Mailman-Approved-At: Thu, 14 Apr 2022 12:06:48 +1000
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
Cc: irogers@google.com, maddy@linux.vnet.ibm.com, srikar@linux.vnet.ibm.com,
 rnsastry@linux.ibm.com, linux-kernel@vger.kernel.org,
 linux-perf-users@vger.kernel.org, kjain@linux.ibm.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--=-L2vVa6joYbbKvsUwutrU
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit



-----Original Message-----
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: acme@kernel.org, jolsa@kernel.org, disgoel@linux.vnet.ibm.com
Cc: mpe@ellerman.id.au, linux-perf-users@vger.kernel.org, 
linuxppc-dev@lists.ozlabs.org, maddy@linux.vnet.ibm.com, 
rnsastry@linux.ibm.com, kjain@linux.ibm.com, 
linux-kernel@vger.kernel.org, srikar@linux.vnet.ibm.com, 
irogers@google.com
Subject: [PATCH V3 0/2] Fix perf bench numa to work with machines
having #CPUs > 1K
Date: Tue, 12 Apr 2022 22:10:57 +0530

The perf benchmark for collections: numa hits failure in
systemconfiguration with CPU's more than 1024. These benchmarks
uses"sched_getaffinity" and "sched_setaffinity" in the code towork with
affinity.
Example snippet from numa benchmark:<<>>perf: bench/numa.c:302:
bind_to_node: Assertion `!(ret)' failed.Aborted (core dumped)<<>>
bind_to_node function uses "sched_getaffinity" to save the cpumask.This
fails with EINVAL because the default mask size in glibc is 1024
To overcome this 1024 CPUs mask size limitation of cpu_set_t,change the
mask size using the CPU_*_S macros ie, use CPU_ALLOC toallocate
cpumask, CPU_ALLOC_SIZE for size, CPU_SET_S to set mask bit.
Fix all the relevant places in the code to use mask size which is
largeenough to represent number of possible CPU's in the system.
This patchset also address a fix for parse_setup_cpu_list function
innuma bench to check if input CPU is online before binding task tothat
CPU. This is to fix failures where, though CPU number is withinmax CPU,
it could happen that CPU is offline. Here, sched_setaffinitywill result
in failure when using cpumask having that cpu bit setin the mask.
Patch 1 address fix for parse_setup_cpu_list to check if CPU used to
bindtask is online. Patch 2 has fix for bench numa to work with
machineshaving #CPUs > 1K
Athira Rajeev (2):  tools/perf: Fix perf bench numa testcase to check
if CPU used to bind    task is online  perf bench: Fix numa bench to
fix usage of affinity for machines with    #CPUs > 1K
Changelog:v2 -> v3Link to the v2 version :
https://lore.kernel.org/all/20220406175113.87881-1-atrajeev@linux.vnet.ibm.com/
 - From the v2 version, patch 1 and patch 2 are now part of upstream. -
This v3 version separates patch 3 and patch 4 to address
review   comments from arnaldo which includes using sysfs__read_str for
reading   sysfs file and fixing the compilation issues observed in
debian
Tesed the patches on powerpc with CPU > 1K and other configurations as
well, verified the perf bench numa with the patch set.Tested-by: Disha
Goel <disgoel@linux.vnet.ibm.com>
 tools/perf/bench/numa.c  | 136 +++++++++++++++++++++++++++++----------
tools/perf/util/header.c |  51 +++++++++++++++ tools/perf/util/header.h
|   1 + 3 files changed, 153 insertions(+), 35 deletions(-)


--=-L2vVa6joYbbKvsUwutrU
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
a>, <a href=3D"mailto:kjain@linux.ibm.com">kjain@linux.ibm.com</a>, <a href=
=3D"mailto:linux-kernel@vger.kernel.org">linux-kernel@vger.kernel.org</a>, =
<a href=3D"mailto:srikar@linux.vnet.ibm.com">srikar@linux.vnet.ibm.com</a>,=
 <a href=3D"mailto:irogers@google.com">irogers@google.com</a></div><div><b>=
Subject</b>: [PATCH V3 0/2] Fix perf bench numa to work with machines havin=
g #CPUs &gt; 1K</div><div><b>Date</b>: Tue, 12 Apr 2022 22:10:57 +0530</div=
><div><br></div><pre>The perf benchmark for collections: numa hits failure =
in system</pre><pre>configuration with CPU's more than 1024. These benchmar=
ks uses</pre><pre>"sched_getaffinity" and "sched_setaffinity" in the code t=
o</pre><pre>work with affinity.</pre><pre><br></pre><pre>Example snippet fr=
om numa benchmark:</pre><pre>&lt;&lt;&gt;&gt;</pre><pre>perf: bench/numa.c:=
302: bind_to_node: Assertion `!(ret)' failed.</pre><pre>Aborted (core dumpe=
d)</pre><pre>&lt;&lt;&gt;&gt;</pre><pre><br></pre><pre>bind_to_node functio=
n uses "sched_getaffinity" to save the cpumask.</pre><pre>This fails with E=
INVAL because the default mask size in glibc is 1024</pre><pre><br></pre><p=
re>To overcome this 1024 CPUs mask size limitation of cpu_set_t,</pre><pre>=
change the mask size using the CPU_*_S macros ie, use CPU_ALLOC to</pre><pr=
e>allocate cpumask, CPU_ALLOC_SIZE for size, CPU_SET_S to set mask bit.</pr=
e><pre><br></pre><pre>Fix all the relevant places in the code to use mask s=
ize which is large</pre><pre>enough to represent number of possible CPU's i=
n the system.</pre><pre><br></pre><pre>This patchset also address a fix for=
 parse_setup_cpu_list function in</pre><pre>numa bench to check if input CP=
U is online before binding task to</pre><pre>that CPU. This is to fix failu=
res where, though CPU number is within</pre><pre>max CPU, it could happen t=
hat CPU is offline. Here, sched_setaffinity</pre><pre>will result in failur=
e when using cpumask having that cpu bit set</pre><pre>in the mask.</pre><p=
re><br></pre><pre>Patch 1 address fix for parse_setup_cpu_list to check if =
CPU used to bind</pre><pre>task is online. Patch 2 has fix for bench numa t=
o work with machines</pre><pre>having #CPUs &gt; 1K</pre><pre><br></pre><pr=
e>Athira Rajeev (2):</pre><pre>  tools/perf: Fix perf bench numa testcase t=
o check if CPU used to bind</pre><pre>    task is online</pre><pre>  perf b=
ench: Fix numa bench to fix usage of affinity for machines with</pre><pre> =
   #CPUs &gt; 1K</pre><pre><br></pre><pre>Changelog:</pre><pre>v2 -&gt; v3<=
/pre><pre>Link to the v2 version :</pre><a href=3D"https://lore.kernel.org/=
all/20220406175113.87881-1-atrajeev@linux.vnet.ibm.com/"><pre>https://lore.=
kernel.org/all/20220406175113.87881-1-atrajeev@linux.vnet.ibm.com/</pre></a=
><pre><br></pre><pre> - From the v2 version, patch 1 and patch 2 are now pa=
rt of upstream.</pre><pre> - This v3 version separates patch 3 and patch 4 =
to address review</pre><pre>   comments from arnaldo which includes using s=
ysfs__read_str for reading</pre><pre>   sysfs file and fixing the compilati=
on issues observed in debian</pre><pre><br></pre><pre style=3D"caret-color:=
 rgb(0, 0, 0); color: rgb(0, 0, 0);">Tesed the patches on powerpc with CPU =
&gt; 1K and other configurations as well, verified the perf bench numa with=
 the patch set.</pre><pre style=3D"caret-color: rgb(0, 0, 0); color: rgb(0,=
 0, 0);">Tested-by: Disha Goel &lt;<a href=3D"mailto:disgoel@linux.vnet.ibm=
.com">disgoel@linux.vnet.ibm.com</a>&gt;</pre><pre style=3D"caret-color: rg=
b(0, 0, 0); color: rgb(0, 0, 0);"><br></pre><pre style=3D"caret-color: rgb(=
0, 0, 0); color: rgb(0, 0, 0);"> tools/perf/bench/numa.c  | 136 +++++++++++=
++++++++++++++++++----------</pre><pre> tools/perf/util/header.c |  51 ++++=
+++++++++++</pre><pre> tools/perf/util/header.h |   1 +</pre><pre> 3 files =
changed, 153 insertions(+), 35 deletions(-)</pre><pre><br></pre></body></ht=
ml>

--=-L2vVa6joYbbKvsUwutrU--

