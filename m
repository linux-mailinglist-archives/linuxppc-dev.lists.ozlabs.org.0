Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CA458525C63
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 May 2022 09:36:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L00nR5P2nz3c5C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 May 2022 17:36:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=PgNNHrKN;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=disgoel@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=PgNNHrKN; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kzz3L2zKtz3bWx
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 May 2022 16:18:06 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24D4gUCQ002969;
 Fri, 13 May 2022 06:17:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version; s=pp1; bh=AnFQIBVkSDQR5qv1SW1Mywff5wzy1eA0RqorbjTDN3I=;
 b=PgNNHrKN5cOcT7EaSXAMwrKDPSY7wy7cmw2NW7hKoul/2IAEKpQy3DVzmiegguFZ4bQa
 RUlBwRgA8TNw/HYI7mFMOXoUCCoAqALqkDi3WjpVXkHIPFkupuuGqbObpQo+2fdpBXRw
 v5Yqf6eSbDjx6q6UfRLpcS37zPYVtdbrN0XBRUxZQ4vrDGB6LOXuASY4cOJYYzQanbWo
 NR4aELB1H17AEVJCQweCkoKPVH2idsjAwvsgkqEM5EverzqRw181z37xvUmORCi+5j4v
 31J2+JPxpi7SnAyN/dSXUt6c2ELvEPx4b5o1Q/zTr+v0NbFPF0lbE/OwBZuXrEaQqsoH 4Q== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3g1ghh9hfb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 13 May 2022 06:17:59 +0000
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 24D66HZN007044;
 Fri, 13 May 2022 06:17:59 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3g1ghh9hef-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 13 May 2022 06:17:58 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 24D6DlkU026346;
 Fri, 13 May 2022 06:17:56 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma06ams.nl.ibm.com with ESMTP id 3fyrkk3y7e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 13 May 2022 06:17:56 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 24D64DIL17826200
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 13 May 2022 06:04:13 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1E013A404D;
 Fri, 13 May 2022 06:17:53 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2CAAEA4040;
 Fri, 13 May 2022 06:17:48 +0000 (GMT)
Received: from disgoel-ibm-com (unknown [9.43.101.217])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 13 May 2022 06:17:47 +0000 (GMT)
Message-ID: <151b1538daf92259702242dbf734230aea3199fe.camel@linux.vnet.ibm.com>
Subject: Re: [PATCH V2] tools/perf/tests: Fix session topology test to skip
 the test in guest environment
From: Disha Goel <disgoel@linux.vnet.ibm.com>
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>, acme@kernel.org,
 jolsa@kernel.org
Date: Fri, 13 May 2022 11:47:40 +0530
In-Reply-To: <20220511114959.84002-1-atrajeev@linux.vnet.ibm.com>
References: <20220511114959.84002-1-atrajeev@linux.vnet.ibm.com>
Content-Type: multipart/alternative; boundary="=-PBMcJGwZeFXngpPcygBd"
X-Mailer: Evolution 3.28.5 (3.28.5-18.el8) 
Mime-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: THJRjP3VpUS0PzMbja87XpsyHS6KtF7G
X-Proofpoint-GUID: JoivnUHvjhBsj2JliCMamtGMPCEYMmiG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-13_02,2022-05-12_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0
 lowpriorityscore=0 suspectscore=0 mlxlogscore=999 spamscore=0 mlxscore=0
 impostorscore=0 adultscore=0 phishscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2205130026
X-Mailman-Approved-At: Fri, 13 May 2022 17:34:55 +1000
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
Cc: irogers@google.com, maddy@linux.vnet.ibm.com, rnsastry@linux.ibm.com,
 linux-perf-users@vger.kernel.org, kjain@linux.ibm.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--=-PBMcJGwZeFXngpPcygBd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit



-----Original Message-----
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: acme@kernel.org, jolsa@kernel.org
Cc: mpe@ellerman.id.au, linux-perf-users@vger.kernel.org, 
linuxppc-dev@lists.ozlabs.org, maddy@linux.vnet.ibm.com, 
rnsastry@linux.ibm.com, kjain@linux.ibm.com, disgoel@linux.vnet.ibm.com
, irogers@google.com
Subject: [PATCH V2] tools/perf/tests: Fix session topology test to skip
the test in guest environment
Date: Wed, 11 May 2022 17:19:59 +0530

The session topology test fails in powerpc pSeries platform.Test
logs:<<>>Session topology : FAILED!<<>>
This testcases tests cpu topology by checking the core_id andsocket_id
stored in perf_env from perf session. The data fromperf session is
compared with the cpu topology informationfrom
"/sys/devices/system/cpu/cpuX/topology" like
core_id,physical_package_id. In case of virtual environment, detaillike
physical_package_id is restricted to be exposed.
Hencephysical_package_id is set to -1. The testcase fails on
suchplatforms since socket_id can't be fetched from topology info.
Skip the testcase in powerpc if physical_package_id returns -1
Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>---
Changelog:v1 -> v2: Addressed review comments from Arnaldo and Michael
Ellerman. skip the test in powerpc when physical_package_id is set to
-1. Dropped patch 1 from V1 since current change doesn't use info from
/proc/cpuinfo and rather uses physical_package_id value.
 tools/perf/tests/topology.c | 11 +++++++++++ 1 file changed, 11
insertions(+)
Tested the patch on powerpc and powernv, session topology test works
fine with the patch.Tested-by: Disha Goel <disgoel@linux.vnet.ibm.com>
diff --git a/tools/perf/tests/topology.c
b/tools/perf/tests/topology.cindex ee1e3dcbc0bd..d23a9e322ff5 100644---
a/tools/perf/tests/topology.c+++ b/tools/perf/tests/topology.c@@ -109,6
+109,17 @@ static int check_cpu_topology(char *path, struct
perf_cpu_map *map) 			&& strncmp(session-
>header.env.arch, "aarch64", 7)) 		return TEST_SKIP;
+	/*+	 * In powerpc pSeries platform, not all the topology
information+	 * are exposed via sysfs. Due to restriction, detail
like+	 * physical_package_id will be set to -1. Hence skip this+	
 * test if physical_package_id returns -1 for cpu from perf_cpu_map.+	
 */+	if (strncmp(session->header.env.arch, "powerpc", 7)) {+		
if (cpu__get_socket_id(perf_cpu_map__cpu(map, 0)) == -1)+		
	return TEST_SKIP;+	}+ 	TEST_ASSERT_VAL("Session header
CPU map not set", session->header.env.cpu);
 	for (i = 0; i < session->header.env.nr_cpus_avail; i++) {

--=-PBMcJGwZeFXngpPcygBd
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<html dir=3D"ltr"><head></head><body style=3D"text-align:left; direction:lt=
r;"><div><br></div><div><br></div><div>-----Original Message-----</div><div=
><b>From</b>: Athira Rajeev &lt;<a href=3D"mailto:Athira%20Rajeev%20%3catra=
jeev@linux.vnet.ibm.com%3e">atrajeev@linux.vnet.ibm.com</a>&gt;</div><div><=
b>To</b>: <a href=3D"mailto:acme@kernel.org">acme@kernel.org</a>, <a href=
=3D"mailto:jolsa@kernel.org">jolsa@kernel.org</a></div><div><b>Cc</b>: <a h=
ref=3D"mailto:mpe@ellerman.id.au">mpe@ellerman.id.au</a>, <a href=3D"mailto=
:linux-perf-users@vger.kernel.org">linux-perf-users@vger.kernel.org</a>, <a=
 href=3D"mailto:linuxppc-dev@lists.ozlabs.org">linuxppc-dev@lists.ozlabs.or=
g</a>, <a href=3D"mailto:maddy@linux.vnet.ibm.com">maddy@linux.vnet.ibm.com=
</a>, <a href=3D"mailto:rnsastry@linux.ibm.com">rnsastry@linux.ibm.com</a>,=
 <a href=3D"mailto:kjain@linux.ibm.com">kjain@linux.ibm.com</a>, <a href=3D=
"mailto:disgoel@linux.vnet.ibm.com">disgoel@linux.vnet.ibm.com</a>, <a href=
=3D"mailto:irogers@google.com">irogers@google.com</a></div><div><b>Subject<=
/b>: [PATCH V2] tools/perf/tests: Fix session topology test to skip the tes=
t in guest environment</div><div><b>Date</b>: Wed, 11 May 2022 17:19:59 +05=
30</div><div><br></div><pre>The session topology test fails in powerpc pSer=
ies platform.</pre><pre>Test logs:</pre><pre>&lt;&lt;&gt;&gt;</pre><pre>Ses=
sion topology : FAILED!</pre><pre>&lt;&lt;&gt;&gt;</pre><pre><br></pre><pre=
>This testcases tests cpu topology by checking the core_id and</pre><pre>so=
cket_id stored in perf_env from perf session. The data from</pre><pre>perf =
session is compared with the cpu topology information</pre><pre>from "/sys/=
devices/system/cpu/cpuX/topology" like core_id,</pre><pre>physical_package_=
id. In case of virtual environment, detail</pre><pre>like physical_package_=
id is restricted to be exposed. Hence</pre><pre>physical_package_id is set =
to -1. The testcase fails on such</pre><pre>platforms since socket_id can't=
 be fetched from topology info.</pre><pre><br></pre><pre>Skip the testcase =
in powerpc if physical_package_id returns -1</pre><pre><br></pre><pre>Signe=
d-off-by: Athira Rajeev &lt;</pre><a href=3D"mailto:atrajeev@linux.vnet.ibm=
.com"><pre>atrajeev@linux.vnet.ibm.com</pre></a><pre>&gt;</pre><pre>---</pr=
e><pre>Changelog:</pre><pre>v1 -&gt; v2:</pre><pre> Addressed review commen=
ts from Arnaldo and Michael Ellerman.</pre><pre> skip the test in powerpc w=
hen physical_package_id is set to</pre><pre> -1.</pre><pre> Dropped patch 1=
 from V1 since current change doesn't use info</pre><pre> from /proc/cpuinf=
o and rather uses physical_package_id value.</pre><pre><br></pre><pre> tool=
s/perf/tests/topology.c | 11 +++++++++++</pre><pre> 1 file changed, 11 inse=
rtions(+)</pre><pre><br></pre><pre><pre style=3D"caret-color: rgb(0, 0, 0);=
 color: rgb(0, 0, 0);">Tested the patch on powerpc and powernv, session top=
ology test works fine with the patch.</pre><pre style=3D"caret-color: rgb(0=
, 0, 0); color: rgb(0, 0, 0);">Tested-by: Disha Goel &lt;<a href=3D"mailto:=
disgoel@linux.vnet.ibm.com"></a><a href=3D"mailto:disgoel@linux.vnet.ibm.co=
m">disgoel@linux.vnet.ibm.com</a>&gt;</pre><div><br></div></pre><pre>diff -=
-git a/tools/perf/tests/topology.c b/tools/perf/tests/topology.c</pre><pre>=
index ee1e3dcbc0bd..d23a9e322ff5 100644</pre><pre>--- a/tools/perf/tests/to=
pology.c</pre><pre>+++ b/tools/perf/tests/topology.c</pre><pre>@@ -109,6 +1=
09,17 @@ static int check_cpu_topology(char *path, struct perf_cpu_map *map=
)</pre><pre> 			&amp;&amp; strncmp(session-&gt;header.env.arch, "aarch64", =
7))</pre><pre> 		return TEST_SKIP;</pre><pre><br></pre><pre>+	/*</pre><pre>=
+	 * In powerpc pSeries platform, not all the topology information</pre><pr=
e>+	 * are exposed via sysfs. Due to restriction, detail like</pre><pre>+	 =
* physical_package_id will be set to -1. Hence skip this</pre><pre>+	 * tes=
t if physical_package_id returns -1 for cpu from perf_cpu_map.</pre><pre>+	=
 */</pre><pre>+	if (strncmp(session-&gt;header.env.arch, "powerpc", 7)) {</=
pre><pre>+		if (cpu__get_socket_id(perf_cpu_map__cpu(map, 0)) =3D=3D -1)</p=
re><pre>+			return TEST_SKIP;</pre><pre>+	}</pre><pre>+</pre><pre> 	TEST_AS=
SERT_VAL("Session header CPU map not set", session-&gt;header.env.cpu);</pr=
e><pre><br></pre><pre> 	for (i =3D 0; i &lt; session-&gt;header.env.nr_cpus=
_avail; i++) {</pre></body></html>

--=-PBMcJGwZeFXngpPcygBd--

