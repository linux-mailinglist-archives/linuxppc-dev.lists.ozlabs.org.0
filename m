Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A0C93B5940
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Jun 2021 08:46:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GCynm3dL7z3bVR
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Jun 2021 16:46:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=A7u6Gj6F;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=A7u6Gj6F; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GCynD4JjKz2yyC
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Jun 2021 16:46:24 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15S6Wuv2109736; Mon, 28 Jun 2021 02:46:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=3lUoxGRsZo2rNOcYcEWmlWl0EPUyRMPtxvHL6XDDRNg=;
 b=A7u6Gj6FY4e6eM/2cu9InSrGyFN8LJbhBNur0bJBXytqctP+AR1GMXGatwXE/Sv/5zMp
 KIy/6WTESS7xkvn+SzL90f4FN1BAae0Zv50OuerjY8ftRnjFfPoA+mDyf3BDtyUlTs0g
 90HU+owE3hJMZzlvJMxTLUfMG2NDVfN6DhHFGwL+LlHZm2/rJFrRi8XKlJLMpczSkA0D
 M3/yIi3lly1mfuJQfOrmZ4NNcASfEmVgR2Ea7/f6C1jbHEUB2B4cTDFPJeHBOYjQEGnS
 Sh2DnQj7YIAKuiT5gCLleNhjiZLb2k/9ouWp1/Ba7xNiV1YtxlOqG4poDJwO7sxrYrIm kg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39f8jw99ur-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Jun 2021 02:46:21 -0400
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 15S6YKr2115641;
 Mon, 28 Jun 2021 02:46:20 -0400
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39f8jw99tt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Jun 2021 02:46:20 -0400
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15S6fmJh017013;
 Mon, 28 Jun 2021 06:46:18 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma05fra.de.ibm.com with ESMTP id 39duv8gas5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Jun 2021 06:46:18 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 15S6iiNG25297294
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 28 Jun 2021 06:44:44 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 701FE52461;
 Mon, 28 Jun 2021 06:46:08 +0000 (GMT)
Received: from localhost.localdomain.com (unknown [9.85.85.15])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id E0A2CAA090;
 Mon, 28 Jun 2021 06:23:46 +0000 (GMT)
From: Kajol Jain <kjain@linux.ibm.com>
To: acme@kernel.org
Subject: [PATCH] perf script python: Fix buffer size to report iregs in perf
 script
Date: Mon, 28 Jun 2021 11:53:41 +0530
Message-Id: <20210628062341.155839-1-kjain@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: xBT7H1znd9OS5IelVUx880gerWTL5G6V
X-Proofpoint-ORIG-GUID: PRHUAZxCwXo4nlF5vgkbNl-3tWymYUfE
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-06-28_03:2021-06-25,
 2021-06-28 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 adultscore=0 spamscore=0 malwarescore=0 impostorscore=0 phishscore=0
 bulkscore=0 mlxlogscore=999 clxscore=1015 suspectscore=0 mlxscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106280045
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
Cc: ravi.bangoria@linux.ibm.com, atrajeev@linux.vnet.ibm.com,
 rnsastry@linux.ibm.com, kjain@linux.ibm.com, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
 maddy@linux.vnet.ibm.com, pc@us.ibm.com, jolsa@redhat.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Commit 48a1f565261d ("perf script python: Add more PMU fields
to event handler dict") added functionality to report fields like
weight, iregs, uregs etc via perf report.
That commit predefined buffer size to 512 bytes to print those fields.

But incase of powerpc, since we added extended regs support
in commits:

Commit 068aeea3773a ("perf powerpc: Support exposing Performance Monitor
Counter SPRs as part of extended regs")
Commit d735599a069f ("powerpc/perf: Add extended regs support for
power10 platform")

Now iregs can carry more bytes of data and this predefined buffer size
can result to data loss in perf script output.

Patch resolve this issue by making buffer size dynamic based on number
of registers needed to print. It also changed return type for function
"regs_map" from int to void, as the return value is not being used by
the caller function "set_regs_in_dict".

Fixes: 068aeea3773a ("perf powerpc: Support exposing Performance Monitor
Counter SPRs as part of extended regs")
Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
---
 .../util/scripting-engines/trace-event-python.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/tools/perf/util/scripting-engines/trace-event-python.c b/tools/perf/util/scripting-engines/trace-event-python.c
index 4e4aa4c97ac5..c8c9706b4643 100644
--- a/tools/perf/util/scripting-engines/trace-event-python.c
+++ b/tools/perf/util/scripting-engines/trace-event-python.c
@@ -687,7 +687,7 @@ static void set_sample_datasrc_in_dict(PyObject *dict,
 			_PyUnicode_FromString(decode));
 }
 
-static int regs_map(struct regs_dump *regs, uint64_t mask, char *bf, int size)
+static void regs_map(struct regs_dump *regs, uint64_t mask, char *bf, int size)
 {
 	unsigned int i = 0, r;
 	int printed = 0;
@@ -695,7 +695,7 @@ static int regs_map(struct regs_dump *regs, uint64_t mask, char *bf, int size)
 	bf[0] = 0;
 
 	if (!regs || !regs->regs)
-		return 0;
+		return;
 
 	for_each_set_bit(r, (unsigned long *) &mask, sizeof(mask) * 8) {
 		u64 val = regs->regs[i++];
@@ -704,8 +704,6 @@ static int regs_map(struct regs_dump *regs, uint64_t mask, char *bf, int size)
 				     "%5s:0x%" PRIx64 " ",
 				     perf_reg_name(r), val);
 	}
-
-	return printed;
 }
 
 static void set_regs_in_dict(PyObject *dict,
@@ -713,7 +711,16 @@ static void set_regs_in_dict(PyObject *dict,
 			     struct evsel *evsel)
 {
 	struct perf_event_attr *attr = &evsel->core.attr;
-	char bf[512];
+
+	/*
+	 * Here value 28 is a constant size which can be used to print
+	 * one register value and its corresponds to:
+	 * 16 chars is to specify 64 bit register in hexadecimal.
+	 * 2 chars is for appending "0x" to the hexadecimal value and
+	 * 10 chars is for register name.
+	 */
+	int size = __sw_hweight64(attr->sample_regs_intr) * 28;
+	char bf[size];
 
 	regs_map(&sample->intr_regs, attr->sample_regs_intr, bf, sizeof(bf));
 
-- 
2.31.1

