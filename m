Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 14455876F83
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Mar 2024 08:27:38 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=sqoXtLHF;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TsF4761tmz3vdP
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Mar 2024 18:27:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=sqoXtLHF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TsF272p72z3vX7
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 Mar 2024 18:25:51 +1100 (AEDT)
Received: from pps.filterd (m0353722.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 42972CkG006716;
	Sat, 9 Mar 2024 07:25:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=wR8wsx8XHoyJZG6Govc76HMoUvHf7YwLRQtEF1VahdQ=;
 b=sqoXtLHFJQAPYJvmeeqYmgLqWKhzEPiFgZ6ARxcNAlgS0sz49wRz2XYsqlY9Bos7ml+K
 3jBjHJPu7YvhHdXsLhM5REouc3bypqnYTFVCoj5AXHnZo6zeAEIf77XkCTB/EuwLyOyH
 x0tjYTQTQhQsMuCNbsySJdqxZprwWouKmc4TC6SkD5gT25S0iQcMQtneBJv46vPhyonF
 ddWp91Qo36lr5nCLedt6JslpflYcsq8GKaDQ8HkWM9bKfeg4Nr0BW+UgrFDCtvYMBG2w
 l+vx/iVH0SSzPASrc6aUrH9QTFnerlRDqMdN40hwA0LbTziOu3RUOEdsicAdawtqZhCD Hw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3wrk1988gb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 09 Mar 2024 07:25:44 +0000
Received: from m0353722.ppops.net (m0353722.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 4297Ph34024158;
	Sat, 9 Mar 2024 07:25:43 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3wrk1988fv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 09 Mar 2024 07:25:43 +0000
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 42970ik3025371;
	Sat, 9 Mar 2024 07:25:43 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3wmeu09jsx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 09 Mar 2024 07:25:43 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4297Pbqs14483852
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 9 Mar 2024 07:25:39 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9E1B02004D;
	Sat,  9 Mar 2024 07:25:37 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8974420040;
	Sat,  9 Mar 2024 07:25:31 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.43.52.192])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sat,  9 Mar 2024 07:25:31 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: acme@kernel.org, jolsa@kernel.org, adrian.hunter@intel.com,
        irogers@google.com, namhyung@kernel.org
Subject: [PATCH 2/3] tools/erf/util/annotate: Set register_char and memory_ref_char for powerpc
Date: Sat,  9 Mar 2024 12:55:12 +0530
Message-Id: <20240309072513.9418-3-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20240309072513.9418-1-atrajeev@linux.vnet.ibm.com>
References: <20240309072513.9418-1-atrajeev@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 1vILPxsCoA81CPPLa4vqYmwTmJvCatci
X-Proofpoint-ORIG-GUID: zx1AJFM9EJB3F8iB_AM9B92-y1JqWLqD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-08_08,2024-03-06_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 spamscore=0 adultscore=0 phishscore=0 mlxscore=0 lowpriorityscore=0
 mlxlogscore=999 malwarescore=0 priorityscore=1501 impostorscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2403090058
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
Cc: atrajeev@linux.vnet.ibm.com, kjain@linux.ibm.com, linux-perf-users@vger.kernel.org, maddy@linux.ibm.com, disgoel@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

To identify if the instruction has any memory reference,
"memory_ref_char" field needs to be set for specific architecture.
Example memory instruction:
lwz     r10,0(r9)

Here "(" is the memory_ref_char. Set this as part of arch->objdump

To get register number and access offset from the given instruction,
arch->objdump.register_char is used. In case of powerpc, the register
char is "r" (since reg names are r0 to r31). Hence set register_char
as "r".

Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
---
 tools/perf/util/annotate.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tools/perf/util/annotate.c b/tools/perf/util/annotate.c
index ac002d907d81..d69bd6edafcb 100644
--- a/tools/perf/util/annotate.c
+++ b/tools/perf/util/annotate.c
@@ -216,6 +216,11 @@ static struct arch architectures[] = {
 	{
 		.name = "powerpc",
 		.init = powerpc__annotate_init,
+		.objdump =  {
+			.comment_char = '#',
+			.register_char = 'r',
+			.memory_ref_char = '(',
+		},
 	},
 	{
 		.name = "riscv64",
-- 
2.43.0

