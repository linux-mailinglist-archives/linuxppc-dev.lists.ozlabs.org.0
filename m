Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C33E5152FD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Apr 2022 19:50:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kqg4b0Syvz3dvd
	for <lists+linuxppc-dev@lfdr.de>; Sat, 30 Apr 2022 03:50:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=LdrJUKTh;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=disgoel@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=LdrJUKTh; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KqflX27gVz3bYn
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 30 Apr 2022 03:35:35 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 23THIXJi018260;
 Fri, 29 Apr 2022 17:35:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version; s=pp1; bh=+/6BIlgunlgG30XMhEZi8l941iHxYHcxJ8421jNRvDw=;
 b=LdrJUKThYG54yvBmv8FzoucL7oqTQk9gKEIGKuQ3ceYFDczBuuf2oaPmVXSHB3SuQjMT
 WBkiAz1bdiDquNKRYHHQ6YuIImfUnvevNkxzeu0stS4m0EWMxaI0vA/ruX7n+Yi5YbZQ
 3dmvMBcy4hfHgmMH5wK0Hlsn/KIaN5lftwdrrQdYKmq5ZWD3SY+0ZfNnnahxvCCI5szV
 N9gdmPOsmN4rbnu6yL8vDGCPFzhuUOj2WtgNmSfrg7YSYz1S1w9xNdxfyvVAYIkUCC44
 dTLtJJyUowuwt++jeMqdMB+gIm8FQJgJ1IY2fXC52ECKSMMMyYkIijN2p8iK2zailuUw Ag== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3frma4ganq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 29 Apr 2022 17:35:25 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 23THJQLd023816;
 Fri, 29 Apr 2022 17:35:25 GMT
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3frma4gamt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 29 Apr 2022 17:35:25 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 23THGOI9026024;
 Fri, 29 Apr 2022 17:35:23 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma06fra.de.ibm.com with ESMTP id 3fm8qhqgqk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 29 Apr 2022 17:35:22 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 23THMAa736569412
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 29 Apr 2022 17:22:10 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5AA58A405B;
 Fri, 29 Apr 2022 17:35:19 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1BDDAA4054;
 Fri, 29 Apr 2022 17:35:14 +0000 (GMT)
Received: from disgoel-ibm-com (unknown [9.43.111.62])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 29 Apr 2022 17:35:13 +0000 (GMT)
Message-ID: <32e64f2af0ffe545fee07e641870e8deb67aaf08.camel@linux.vnet.ibm.com>
Subject: Re: [PATCH 0/2] Fix session topology test for powerpc and add
 utility function to get cpuinfo entries
From: Disha Goel <disgoel@linux.vnet.ibm.com>
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>, acme@kernel.org,
 jolsa@kernel.org
Date: Fri, 29 Apr 2022 23:05:12 +0530
In-Reply-To: <20220428150829.30733-1-atrajeev@linux.vnet.ibm.com>
References: <20220428150829.30733-1-atrajeev@linux.vnet.ibm.com>
Content-Type: multipart/alternative; boundary="=-yT4bCEGVdsMB7jA0c9Kx"
X-Mailer: Evolution 3.28.5 (3.28.5-18.el8) 
Mime-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: AMOYc6GcXaPmAgHUO0DmM2L-cMWw6xJr
X-Proofpoint-GUID: ToOngbhzXd5bxVhKzUEsess8-s4E4KFS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-29_08,2022-04-28_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0
 clxscore=1015 phishscore=0 priorityscore=1501 malwarescore=0 mlxscore=0
 lowpriorityscore=0 bulkscore=0 mlxlogscore=999 impostorscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2204290088
X-Mailman-Approved-At: Sat, 30 Apr 2022 03:44:36 +1000
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


--=-yT4bCEGVdsMB7jA0c9Kx
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit



-----Original Message-----
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: acme@kernel.org, jolsa@kernel.org, disgoel@linux.vnet.ibm.com
Cc: mpe@ellerman.id.au, linux-perf-users@vger.kernel.org, 
linuxppc-dev@lists.ozlabs.org, maddy@linux.vnet.ibm.com, 
rnsastry@linux.ibm.com, kjain@linux.ibm.com, irogers@google.com
Subject: [PATCH 0/2] Fix session topology test for powerpc and add
utility function to get cpuinfo entries
Date: Thu, 28 Apr 2022 20:38:27 +0530

The session topology test fails in powerpc pSeries platform.Test
logs:<<>>Session topology : FAILED!<<>>
This test uses cpu topology information and in powerpc,some of the
topology info is restricted in environmentlike virtualized platform.
Hence this test needs to beskipped in pSeries platform for powerpc. The
informationabout platform is available in /proc/cpuinfo.
Patch 1 adds generic utility function in "util/header.c"to read
/proc/cpuinfo for any entry. Though the testcasefix needs value from
"platform" entry, making this as ageneric function to return value for
any entry from the/proc/cpuinfo file which can be used commonly in
futureusecases.
Patch 2 uses the newly added utility function to look forplatform and
skip the test in pSeries platform for powerpc.
Athira Rajeev (2):  tools/perf: Add utility function to read
/proc/cpuinfo for any field  tools/perf/tests: Fix session topology
test to skip the test in guest    environment
Tested the patches on powerpc and powernv, verified perf test session
topology test with the patch set.Tested-by: Disha Goel <
disgoel@linux.vnet.ibm.com>
 tools/perf/tests/topology.c | 17 ++++++++++++
tools/perf/util/header.c    | 54 +++++++++++++++++++++++++++++++++++++
tools/perf/util/header.h    |  1 + 3 files changed, 72 insertions(+)


--=-yT4bCEGVdsMB7jA0c9Kx
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
=3D"mailto:irogers@google.com">irogers@google.com</a></div><div><b>Subject<=
/b>: [PATCH 0/2] Fix session topology test for powerpc and add utility func=
tion to get cpuinfo entries</div><div><b>Date</b>: Thu, 28 Apr 2022 20:38:2=
7 +0530</div><div><br></div><pre>The session topology test fails in powerpc=
 pSeries platform.</pre><pre>Test logs:</pre><pre>&lt;&lt;&gt;&gt;</pre><pr=
e>Session topology : FAILED!</pre><pre>&lt;&lt;&gt;&gt;</pre><pre><br></pre=
><pre>This test uses cpu topology information and in powerpc,</pre><pre>som=
e of the topology info is restricted in environment</pre><pre>like virtuali=
zed platform. Hence this test needs to be</pre><pre>skipped in pSeries plat=
form for powerpc. The information</pre><pre>about platform is available in =
/proc/cpuinfo.</pre><pre><br></pre><pre>Patch 1 adds generic utility functi=
on in "util/header.c"</pre><pre>to read /proc/cpuinfo for any entry. Though=
 the testcase</pre><pre>fix needs value from "platform" entry, making this =
as a</pre><pre>generic function to return value for any entry from the</pre=
><pre>/proc/cpuinfo file which can be used commonly in future</pre><pre>use=
cases.</pre><pre><br></pre><pre>Patch 2 uses the newly added utility functi=
on to look for</pre><pre>platform and skip the test in pSeries platform for=
 powerpc.</pre><pre><br></pre><pre>Athira Rajeev (2):</pre><pre>  tools/per=
f: Add utility function to read /proc/cpuinfo for any field</pre><pre>  too=
ls/perf/tests: Fix session topology test to skip the test in guest</pre><pr=
e>    environment</pre><pre><br></pre><pre style=3D"caret-color: rgb(0, 0, =
0); color: rgb(0, 0, 0);">Tested the patches on powerpc and powernv, verifi=
ed perf test session topology test with the patch set.</pre><pre><span styl=
e=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);">Tested-by: Disha Goel=
 &lt;</span><a href=3D"mailto:disgoel@linux.vnet.ibm.com" style=3D"caret-co=
lor: rgb(0, 0, 0);"><a href=3D"mailto:disgoel@linux.vnet.ibm.com">disgoel@l=
inux.vnet.ibm.com</a></a><span style=3D"caret-color: rgb(0, 0, 0); color: r=
gb(0, 0, 0);">&gt;</span></pre><pre><br></pre><pre> tools/perf/tests/topolo=
gy.c | 17 ++++++++++++</pre><pre> tools/perf/util/header.c    | 54 ++++++++=
+++++++++++++++++++++++++++++</pre><pre> tools/perf/util/header.h    |  1 +=
</pre><pre> 3 files changed, 72 insertions(+)</pre><pre><br></pre></body></=
html>

--=-yT4bCEGVdsMB7jA0c9Kx--

