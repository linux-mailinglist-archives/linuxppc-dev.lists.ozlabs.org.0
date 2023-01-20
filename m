Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B396675412
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Jan 2023 13:04:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NyypX0Sn3z3fJ0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Jan 2023 23:04:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=WIKk1S3u;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=WIKk1S3u;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NyynX43JYz30Bp
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Jan 2023 23:03:28 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30KADeNv026986;
	Fri, 20 Jan 2023 12:03:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=277uF/FE5ESZB6iNpx1VT4snUa286Q7JqdCIVMjIDOU=;
 b=WIKk1S3uhnXykFIrECfw8cDusrHYKZAp08l8AcL0I1HVfvHPSwZSo3e/CGNoU9ygFksM
 3nRMyfNQeVUMqPn8miFEqKAoHAtoeqR6TAvz2MbvDpZO1YsgeERrR0pd4AAtH2X8MAel
 k8TkmgjLmK/qp6oFjQO2MDHL3dLD89GVjlvNDT2xZyaKpEkfmV1dq+V+3BK/grW/IEmR
 yqDTNe3ykPz8OzEkCxDN8/hSeqgpO0lRnmhy52qtDRyb4lUAgFk7d6LDQEw85OH9YGlc
 FdA6u97IE9OazljX46iye0I1FBeIWaYljJBL3hnaKkFgOIxfTmbYQqwybF3YwUpvzAPp 3A== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3n7s0wb21d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Jan 2023 12:03:07 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 30KC2c7A017979;
	Fri, 20 Jan 2023 12:03:07 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3n7s0wb20b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Jan 2023 12:03:07 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
	by ppma06ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 30JJFE8Q006229;
	Fri, 20 Jan 2023 12:03:04 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma06ams.nl.ibm.com (PPS) with ESMTPS id 3n3knfqy11-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Jan 2023 12:03:04 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 30KC31oN51184026
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 20 Jan 2023 12:03:01 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F18EB20043;
	Fri, 20 Jan 2023 12:03:00 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6249220040;
	Fri, 20 Jan 2023 12:02:58 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.43.38.22])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 20 Jan 2023 12:02:58 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: acme@kernel.org, jolsa@kernel.org, irogers@google.com
Subject: [PATCH] tools/perf: Disable perf probe when libtraceevent is missing
Date: Fri, 20 Jan 2023 17:32:56 +0530
Message-Id: <20230120120256.34694-1-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: LfPM3VVbftXgLznQUoYrVcZefaMaRsxF
X-Proofpoint-GUID: Pb-hD9L3byWPLHXAQSf6LMM6CsIM0oED
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-20_07,2023-01-20_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 suspectscore=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 mlxlogscore=999 impostorscore=0 priorityscore=1501 adultscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2301200115
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
Cc: ak@linux.intel.com, rnsastry@linux.ibm.com, linux-perf-users@vger.kernel.org, maddy@linux.ibm.com, james.clark@arm.com, kjain@linux.ibm.com, namhyung@kernel.org, disgoel@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

While parsing the tracepoint events in parse_events_add_tracepoint()
function, code checks for HAVE_LIBTRACEEVENT support. This is needed
since libtraceevent is necessary for tracepoint. But while adding
probe points, check for LIBTRACEEVENT is not done in case of perf probe.
Hence, in environment with missing libtraceevent-devel, it is
observed that adding a probe point works even though its not
supported.

Example:
Adding probe point:
	./perf probe 'vfs_getname=getname_flags:72 pathname=result->name:string'
	Added new event:
	  probe:vfs_getname    (on getname_flags:72 with pathname=result->name:string)

	You can now use it in all perf tools, such as:

		perf record -e probe:vfs_getname -aR sleep 1

But trying perf record:
	./perf  record -e probe:vfs_getname -aR sleep 1
	event syntax error: 'probe:vfs_getname'
				\___ unsupported tracepoint
	libtraceevent is necessary for tracepoint support
	Run 'perf list' for a list of valid events

Fix this by wrapping "builtin-probe" compilation and
"perf probe" usage under "CONFIG_LIBTRACEEVENT" check.

Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
---
 tools/perf/Build  | 4 +++-
 tools/perf/perf.c | 2 ++
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/tools/perf/Build b/tools/perf/Build
index 6dd67e502295..a138a2304929 100644
--- a/tools/perf/Build
+++ b/tools/perf/Build
@@ -33,7 +33,9 @@ ifeq ($(CONFIG_LIBTRACEEVENT),y)
   perf-$(CONFIG_TRACE) += trace/beauty/
 endif
 
-perf-$(CONFIG_LIBELF) += builtin-probe.o
+ifeq ($(CONFIG_LIBTRACEEVENT),y)
+  perf-$(CONFIG_LIBELF) += builtin-probe.o
+endif
 
 perf-y += bench/
 perf-y += tests/
diff --git a/tools/perf/perf.c b/tools/perf/perf.c
index 82bbe0ca858b..7b0d79284d5a 100644
--- a/tools/perf/perf.c
+++ b/tools/perf/perf.c
@@ -80,9 +80,11 @@ static struct cmd_struct commands[] = {
 #ifdef HAVE_LIBTRACEEVENT
 	{ "sched",	cmd_sched,	0 },
 #endif
+#ifdef HAVE_LIBTRACEEVENT
 #ifdef HAVE_LIBELF_SUPPORT
 	{ "probe",	cmd_probe,	0 },
 #endif
+#endif
 #ifdef HAVE_LIBTRACEEVENT
 	{ "kmem",	cmd_kmem,	0 },
 	{ "lock",	cmd_lock,	0 },
-- 
2.39.0

