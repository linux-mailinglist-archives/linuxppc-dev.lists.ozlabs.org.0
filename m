Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BF3E3349143
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Mar 2021 12:54:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F5k6p5ZZvz3c1P
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Mar 2021 22:54:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=XsHng9sA;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=XsHng9sA; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F5k5v4QSsz304Q
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Mar 2021 22:53:54 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12PBYidO017737; Thu, 25 Mar 2021 07:53:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=km2/i3iP+dNWrGImBe+nGm4B2o0+2wucsl59yOdNYwE=;
 b=XsHng9sACXyTf7CujVBnRgmqMKJtoF59tInXbd+CmY6J+MDv7dilVfc8S9NfzsFeoiH5
 N7nEZ1JbfAbiwBqoXyrBALDqUEp8ZUG+/a3vmc8zmTreTPoxUmpGv/AVy7zZQY3GZRlO
 Z87d2B42QZY204mf4CQe70msqw89kN7LsSHFIiz8rSuYkJWxAm9yGC8EwvpjHL9eRVEb
 r2ypF5ECLSXrvdIzvjoIWy461uUjzMTcY83WINypkR8zeABWkBQ9FisdVRxBWNWENbSk
 xqq0b+Ua5GK3yZq438W5ZL8PWYC8c3iDdmNZkxr7HcsKqzyMwlZddyb9n+99UhyMxfhQ zw== 
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0b-001b2d01.pphosted.com with ESMTP id 37ggpkp6ha-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 25 Mar 2021 07:53:43 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 12PBq4hJ007672;
 Thu, 25 Mar 2021 11:53:41 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma06ams.nl.ibm.com with ESMTP id 37d9bmnapu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 25 Mar 2021 11:53:41 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 12PBrcTi35193106
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 25 Mar 2021 11:53:38 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 55DB7AE045;
 Thu, 25 Mar 2021 11:53:38 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C78F0AE04D;
 Thu, 25 Mar 2021 11:53:36 +0000 (GMT)
Received: from Madhavan.PrimaryTP (unknown [9.85.167.233])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 25 Mar 2021 11:53:36 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH v3 1/2] powerpc/perf: Infrastructure to support checking of
 attr.config*
Date: Thu, 25 Mar 2021 17:23:25 +0530
Message-Id: <20210325115326.143151-1-maddy@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-25_02:2021-03-24,
 2021-03-25 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0
 priorityscore=1501 mlxscore=0 lowpriorityscore=0 mlxlogscore=999
 bulkscore=0 suspectscore=0 malwarescore=0 phishscore=0 adultscore=0
 clxscore=1015 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2009150000 definitions=main-2103250086
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
"check_attr_config" is valid only for raw event type.

Signed-off-by: Madhavan Srinivasan <maddy@linux.ibm.com>
---
Changelog v2:
-Fixed commit message

Changelog v1:
-Fixed commit message and in-code comments

 arch/powerpc/include/asm/perf_event_server.h |  6 ++++++
 arch/powerpc/perf/core-book3s.c              | 14 ++++++++++++++
 2 files changed, 20 insertions(+)

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
index 6817331e22ff..c6eeb4fdc5fd 100644
--- a/arch/powerpc/perf/core-book3s.c
+++ b/arch/powerpc/perf/core-book3s.c
@@ -1958,6 +1958,20 @@ static int power_pmu_event_init(struct perf_event *event)
 
 		if (ppmu->blacklist_ev && is_event_blacklisted(ev))
 			return -EINVAL;
+		/*
+		 * PMU config registers have fields that are
+		 * reserved and specific value to bit field as reserved.
+		 * For ex., MMCRA[61:62] is Randome Sampling Mode (SM)
+		 * and value of 0b11 to this field is reserved.
+		 *
+		 * This check is needed only for raw event type,
+		 * since tools like fuzzer use raw event type to
+		 * provide randomized event code values for test.
+		 *
+		 */
+		if (ppmu->check_attr_config &&
+		    ppmu->check_attr_config(event))
+			return -EINVAL;
 		break;
 	default:
 		return -ENOENT;
-- 
2.26.2

