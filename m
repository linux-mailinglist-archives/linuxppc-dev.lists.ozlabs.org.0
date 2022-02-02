Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 331884A6AD8
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Feb 2022 05:19:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JpT8m0ds1z3cHC
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Feb 2022 15:19:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=YA0ynaQ3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=YA0ynaQ3; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JpT823jp4z2xrt
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Feb 2022 15:18:57 +1100 (AEDT)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 2124FpKj005245; 
 Wed, 2 Feb 2022 04:18:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=ima2qDQ/aE/Z0N3orOJ+E1eW5baW8ZkO/X7Y1RZy3Ec=;
 b=YA0ynaQ3sA+w7egWQgZhmQz2PIGLjuWEs8nEWhTnYYndvEqIEaFZU38pCVNi+suJXq0G
 vN2YwDdT2bZ8GLriv8EmWA0PZIP0MMCmTaH1AMawpkfBmTzXl3va9EB2eD/JYmXZZY3R
 FqGFKk6z85ZvPFz2my9kvJIUSe0Dpn7yyOf/EEBjl7VkMk8I/4RQXLkj11ubxZFhppgx
 Rkc3jsgAE0CKrOiVtwczn+WXlHinDLjDlyjNUDJDmniXHkHiewAWHbnfGAhyOlmjc+qg
 45y/h8OWmbLbPuIWpJXKL3Bp9io7e693oQPwIDUn00pZ4PPEQy/Ye38P5lBQdwOEnyWK Yg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dyjs680yr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Feb 2022 04:18:51 +0000
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 2124IoxP010162;
 Wed, 2 Feb 2022 04:18:50 GMT
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dyjs680yj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Feb 2022 04:18:50 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2124CNPn000530;
 Wed, 2 Feb 2022 04:18:49 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma01fra.de.ibm.com with ESMTP id 3dvw79g8by-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Feb 2022 04:18:48 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2124Ijn433161504
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 2 Feb 2022 04:18:45 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 81D41AE04D;
 Wed,  2 Feb 2022 04:18:45 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5DF8DAE045;
 Wed,  2 Feb 2022 04:18:42 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.163.12.225])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed,  2 Feb 2022 04:18:41 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH V2] powerpc/perf: Fix task context setting for trace imc
Date: Wed,  2 Feb 2022 09:48:37 +0530
Message-Id: <20220202041837.65968-1-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: HDthEgzedCxq88GHBYXS4jbF_mYfABMb
X-Proofpoint-ORIG-GUID: ovvmVeLqri8IRyonCRZpi3AZ6h6sYS1s
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-02_01,2022-02-01_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 mlxlogscore=999
 malwarescore=0 adultscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 mlxscore=0 priorityscore=1501 spamscore=0 phishscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2202020017
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
Cc: kjain@linux.ibm.com, maddy@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com, rnsastry@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Trace IMC (In-Memory collection counters) in powerpc is
useful for application level profiling. For trace_imc,
presently task context (task_ctx_nr) is set to
perf_hw_context. But perf_hw_context is to be used for
cpu PMU. So for trace_imc, even though it is per thread
PMU, it is preferred to use sw_context inorder to be able
to do application level monitoring. Hence change the
task_ctx_nr to use perf_sw_context.

Fixes: 012ae244845f ("powerpc/perf: Trace imc PMU functions")
Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Reviewed-by: Madhavan Srinivasan <maddy@linux.vnet.ibm.com>
---
Changelog:
v1 -> v2:
 Added comment in code on why perf_sw_context is used.
Notes:
 trace_imc_event_init currently uses context as
 perf_hw_context. But ideally there can only be a single
 PMU for perf_hw_context events which is core PMU.
 Reference:
 commit 26657848502b ("perf/core: Verify we have a single perf_hw_context PMU")
 Reason for using "perf_sw_context" instead of invalid_context
 is that, task level monitoring is restricted with
 invalid_context.

 arch/powerpc/perf/imc-pmu.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/perf/imc-pmu.c b/arch/powerpc/perf/imc-pmu.c
index e106909ff9c3..8fe57601e61d 100644
--- a/arch/powerpc/perf/imc-pmu.c
+++ b/arch/powerpc/perf/imc-pmu.c
@@ -1457,7 +1457,13 @@ static int trace_imc_event_init(struct perf_event *event)
 
 	event->hw.idx = -1;
 
-	event->pmu->task_ctx_nr = perf_hw_context;
+	/*
+	 * There can only be a single PMU for
+	 * perf_hw_context events which is assigned
+	 * to core PMU. Hence use "perf_sw_context" for
+	 * trace_imc.
+	 */
+	event->pmu->task_ctx_nr = perf_sw_context;
 	event->destroy = reset_global_refc;
 	return 0;
 }
-- 
2.33.0

