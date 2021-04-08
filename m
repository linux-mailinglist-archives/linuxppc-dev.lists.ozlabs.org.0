Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DFCB4357D87
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Apr 2021 09:46:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FGCxk5XM6z3c0s
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Apr 2021 17:46:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ov9/vm3V;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=ov9/vm3V; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FGCwn0pP0z304Y
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Apr 2021 17:45:28 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1387YeXQ006389; Thu, 8 Apr 2021 03:45:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=QaaKHMrrJe9KfkGnreLvtOAtRD8o4dtbkB+6CXboInc=;
 b=ov9/vm3VdWc9BM5CVhEBA4QTiNJfGa7APy6PlmehdTspsynr8jZrlKQbI5FZdlL8maor
 tWKjRWYCIhgB2i9U45k55CA37SUcX6vtkdp1r+Imwmr/Tq2jH/Rbu0osCkRlZPPYo2+3
 n7Osm3kKGlaSnaexVeIoDvLlDp3UyxFwNdfGs3l9rIm7zHh34j7AXOwyKridb/Rx5d2r
 BeMRA9MynhCi6wUefOoCRvtdR7TTMAAI3wqghgkimrNcmVhSAGLxZmd//dcJoN2MS9ug
 O9X+lMYCm2bg8XVTyLKPPSOEVS2z1O8F+bs0S/h8m1nqO/WZZ+JkwEEWNRY8bmo8HB2T Yg== 
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37rvm127vs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 08 Apr 2021 03:45:20 -0400
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 1387hN3G005024;
 Thu, 8 Apr 2021 07:45:18 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma02fra.de.ibm.com with ESMTP id 37rvbsgr0d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 08 Apr 2021 07:45:18 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 1387irb335193342
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 8 Apr 2021 07:44:53 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9D647A4062;
 Thu,  8 Apr 2021 07:45:14 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 08645A405C;
 Thu,  8 Apr 2021 07:45:13 +0000 (GMT)
Received: from Madhavan.PrimaryTP (unknown [9.80.215.14])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu,  8 Apr 2021 07:45:12 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH v4 1/2] powerpc/perf: Infrastructure to support checking of
 attr.config*
Date: Thu,  8 Apr 2021 13:15:03 +0530
Message-Id: <20210408074504.248211-1-maddy@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: QCuDJGVDm0V_K-FbagLVETFOJ5ygwp-m
X-Proofpoint-ORIG-GUID: QCuDJGVDm0V_K-FbagLVETFOJ5ygwp-m
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-08_02:2021-04-08,
 2021-04-08 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0 mlxscore=0
 mlxlogscore=999 adultscore=0 priorityscore=1501 clxscore=1015 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104060000
 definitions=main-2104080050
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
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Introduce code to support the checking of attr.config* for
values which are reserved for a given platform.
Performance Monitoring Unit (PMU) configuration registers
have fields that are reserved and some specific values for
bit fields are reserved. For ex., MMCRA[61:62] is
Random Sampling Mode (SM) and value of 0b11 for this field
is reserved.

Writing non-zero or invalid values in these fields will
have unknown behaviours.

Patch adds a generic call-back function "check_attr_config"
in "struct power_pmu", to be called in event_init to
check for attr.config* values for a given platform.

Signed-off-by: Madhavan Srinivasan <maddy@linux.ibm.com>
---
Changelog v3:
-Made the check_attr_config() to be called for all event type of instead
 only for raw event type.

Changelog v2:
-Fixed commit message

Changelog v1:
-Fixed commit message and in-code comments

 arch/powerpc/include/asm/perf_event_server.h |  6 ++++++
 arch/powerpc/perf/core-book3s.c              | 11 +++++++++++
 2 files changed, 17 insertions(+)

diff --git a/arch/powerpc/include/asm/perf_event_server.h b/arch/powerpc/include/asm/perf_event_server.h
index 00e7e671bb4b..dde97d7d9253 100644
--- a/arch/powerpc/include/asm/perf_event_server.h
+++ b/arch/powerpc/include/asm/perf_event_server.h
@@ -67,6 +67,12 @@ struct power_pmu {
 	 * the pmu supports extended perf regs capability
 	 */
 	int		capabilities;
+	/*
+	 * Function to check event code for values which are
+	 * reserved. Function takes struct perf_event as input,
+	 * since event code could be spread in attr.config*
+	 */
+	int		(*check_attr_config)(struct perf_event *ev);
 };
 
 /*
diff --git a/arch/powerpc/perf/core-book3s.c b/arch/powerpc/perf/core-book3s.c
index 766f064f00fb..b17358e8dc12 100644
--- a/arch/powerpc/perf/core-book3s.c
+++ b/arch/powerpc/perf/core-book3s.c
@@ -1963,6 +1963,17 @@ static int power_pmu_event_init(struct perf_event *event)
 		return -ENOENT;
 	}
 
+	/*
+	 * PMU config registers have fields that are
+	 * reserved and some specific values for bit fields are reserved.
+	 * For ex., MMCRA[61:62] is Randome Sampling Mode (SM)
+	 * and value of 0b11 to this field is reserved.
+	 * Check for invalid values in attr.config.
+	 */
+	if (ppmu->check_attr_config &&
+	    ppmu->check_attr_config(event))
+		return -EINVAL;
+
 	event->hw.config_base = ev;
 	event->hw.idx = 0;
 
-- 
2.26.2

