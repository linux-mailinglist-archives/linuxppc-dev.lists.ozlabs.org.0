Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2373551BD81
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 May 2022 12:51:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kv9Tt0tL9z3bqv
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 May 2022 20:50:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=RCwLZbxu;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=disgoel@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=RCwLZbxu; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kv9SL3y4dz3bpL
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 May 2022 20:49:38 +1000 (AEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2458hPml002374;
 Thu, 5 May 2022 10:49:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version; s=pp1; bh=AWUZ5Ho50UzPD5Gb07pTCfV0zNZizD4kCVWLZ/fulng=;
 b=RCwLZbxuyUmBiZvYF4MR/wuLCqu41R+fW1tvTjqPb3JA8wXE86+BIQHvjnrEPjB207Cd
 DuyFzPyMvyOlceqI0I33qrTu1c85tb4jdzqR56CWxWQNVfBq9lc0I2clTDbZwNLu1BIW
 gwqsZT628PMt24ld7OycSfRcotcTAV0PCU5T2lFV1+OjD5K43AkFDesl7vlGhKJhiuVq
 aHhC9PN7D53+FrTa8BDZKCRnRv6NsOvSxsXzYudXWzfTotnLLElZx0gBGHCa9mZVBsnL
 tloW5h5j4S9CHM6ALKSyzNbX/6MfpWT5bARuCz7vqw+w2+ESm9L8fJBhkWcFUjbOih50 tA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3fv8gd525e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 May 2022 10:49:30 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 245AUELd031620;
 Thu, 5 May 2022 10:49:29 GMT
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3fv8gd524t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 May 2022 10:49:29 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 245Alv1g012992;
 Thu, 5 May 2022 10:49:27 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma02fra.de.ibm.com with ESMTP id 3fuyn78rht-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 May 2022 10:49:27 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 245AnN5J49611080
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 5 May 2022 10:49:23 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8E0DCA405F;
 Thu,  5 May 2022 10:49:23 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C01F0A4054;
 Thu,  5 May 2022 10:49:19 +0000 (GMT)
Received: from disgoel-ibm-com (unknown [9.43.14.111])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu,  5 May 2022 10:49:19 +0000 (GMT)
Message-ID: <c3c66a0ef4a5441bd469e4d4e2c8f8a137d929a7.camel@linux.vnet.ibm.com>
Subject: Re: [PATCH V2 0/2]  Fix session topology test for powerpc and add
 utility function to get cpuinfo entries
From: Disha Goel <disgoel@linux.vnet.ibm.com>
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>, acme@kernel.org,
 jolsa@kernel.org
Date: Thu, 05 May 2022 16:19:17 +0530
In-Reply-To: <20220505094000.58220-1-atrajeev@linux.vnet.ibm.com>
References: <20220505094000.58220-1-atrajeev@linux.vnet.ibm.com>
Content-Type: multipart/alternative; boundary="=-fzjFb1q5KzRJG1N/h8R/"
X-Mailer: Evolution 3.28.5 (3.28.5-18.el8) 
Mime-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 89kqVCXThEFuJVK0b0sJqf99naEj7JTv
X-Proofpoint-GUID: s-zXC-idDPfnWpU7y1v5cUUmYZhYFvW1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-05_04,2022-05-05_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0
 malwarescore=0 mlxscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 mlxlogscore=999 suspectscore=0 impostorscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2205050075
X-Mailman-Approved-At: Thu, 05 May 2022 20:50:24 +1000
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


--=-fzjFb1q5KzRJG1N/h8R/
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit



-----Original Message-----
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: acme@kernel.org, jolsa@kernel.org, disgoel@linux.vnet.ibm.com
Cc: mpe@ellerman.id.au, linux-perf-users@vger.kernel.org, 
linuxppc-dev@lists.ozlabs.org, maddy@linux.vnet.ibm.com, 
rnsastry@linux.ibm.com, kjain@linux.ibm.com, irogers@google.com
Subject: [PATCH V2 0/2]  Fix session topology test for powerpc and add
utility function to get cpuinfo entries
Date: Thu,  5 May 2022 15:09:58 +0530

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
Changelog: V1 -> v2: Addressed review comments from Kajol. Use "strim"
to remove space from string. Also use "feof" to check for EOF instead
of using new variable "ret".
Tested the patches on powervm and powernv, verified perf test session
topology test with the patch set.Tested-by: Disha Goel <
disgoel@linux.vnet.ibm.com>
 tools/perf/tests/topology.c | 17 ++++++++++++
tools/perf/util/header.c    | 53 +++++++++++++++++++++++++++++++++++++
tools/perf/util/header.h    |  1 + 3 files changed, 71 insertions(+)

--=-fzjFb1q5KzRJG1N/h8R/
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
/b>: [PATCH V2 0/2]  Fix session topology test for powerpc and add utility =
function to get cpuinfo entries</div><div><b>Date</b>: Thu,  5 May 2022 15:=
09:58 +0530</div><div><br></div><pre>The session topology test fails in pow=
erpc pSeries platform.</pre><pre>Test logs:</pre><pre>&lt;&lt;&gt;&gt;</pre=
><pre>Session topology : FAILED!</pre><pre>&lt;&lt;&gt;&gt;</pre><pre><br><=
/pre><pre>This test uses cpu topology information and in powerpc,</pre><pre=
>some of the topology info is restricted in environment</pre><pre>like virt=
ualized platform. Hence this test needs to be</pre><pre>skipped in pSeries =
platform for powerpc. The information</pre><pre>about platform is available=
 in /proc/cpuinfo.</pre><pre><br></pre><pre>Patch 1 adds generic utility fu=
nction in "util/header.c"</pre><pre>to read /proc/cpuinfo for any entry. Th=
ough the testcase</pre><pre>fix needs value from "platform" entry, making t=
his as a</pre><pre>generic function to return value for any entry from the<=
/pre><pre>/proc/cpuinfo file which can be used commonly in future</pre><pre=
>usecases.</pre><pre><br></pre><pre>Patch 2 uses the newly added utility fu=
nction to look for</pre><pre>platform and skip the test in pSeries platform=
 for powerpc.</pre><pre><br></pre><pre>Athira Rajeev (2):</pre><pre>  tools=
/perf: Add utility function to read /proc/cpuinfo for any field</pre><pre> =
 tools/perf/tests: Fix session topology test to skip the test in guest</pre=
><pre>    environment</pre><pre><br></pre><pre>Changelog:</pre><pre> V1 -&g=
t; v2:</pre><pre> Addressed review comments from Kajol.</pre><pre> Use "str=
im" to remove space from string. Also</pre><pre> use "feof" to check for EO=
F instead of using new</pre><pre> variable "ret".</pre><pre><br></pre><pre>=
<pre style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);">Tested the p=
atches on powervm and powernv, verified perf test session topology test wit=
h the patch set.</pre><pre style=3D"caret-color: rgb(0, 0, 0); color: rgb(0=
, 0, 0);">Tested-by: Disha Goel &lt;<a href=3D"mailto:disgoel@linux.vnet.ib=
m.com"></a><a href=3D"mailto:disgoel@linux.vnet.ibm.com">disgoel@linux.vnet=
.ibm.com</a>&gt;</pre><pre style=3D"caret-color: rgb(0, 0, 0); color: rgb(0=
, 0, 0);"><br></pre></pre><pre> tools/perf/tests/topology.c | 17 ++++++++++=
++</pre><pre> tools/perf/util/header.c    | 53 ++++++++++++++++++++++++++++=
+++++++++</pre><pre> tools/perf/util/header.h    |  1 +</pre><pre> 3 files =
changed, 71 insertions(+)</pre><pre><br></pre></body></html>

--=-fzjFb1q5KzRJG1N/h8R/--

