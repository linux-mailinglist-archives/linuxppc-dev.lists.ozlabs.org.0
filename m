Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 810FD325DB6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Feb 2021 07:51:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dn0g85WtJz3cxX
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Feb 2021 17:51:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=OQQON9NK;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=OQQON9NK; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dn0fg6tqxz3cXh
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Feb 2021 17:50:51 +1100 (AEDT)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 11Q6hopp003818; Fri, 26 Feb 2021 01:50:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=fx0POZkWUN6+bijp8mIdL+816PtvwhU8jxTuFHyTRBA=;
 b=OQQON9NKNhxr82MWfr2zpVynAq9vrUsi6xfgGRhGdzpkpHF8mfpljUyCeI7qYvS/fWQK
 /rFYqtzAExrv47MvyY4BfzgEHVWv8BHV52QCdPg4TuD95qdFjE1/byuRCvSt49AjSGAI
 kp5qcHdu2I8rUpGDbKJ3QfmqVzSCSDy2kiuHLewCSKTVN6a7CsJ7RpW9z//XcFnwjrOA
 aUSp8YQ7TIyr6BgI8H/hfTrJoQmBjBdG+SDvKieKwPwCMAhCPZLQgrRxJFbg7P8bSisC
 oRqqnTab9C8eZj8qzbuUQfuQXTSJk9z0IxLmHvqgV7U6e7aebFxDgobWAQ3xdKpmv+Il yA== 
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36xuyk8203-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Feb 2021 01:50:42 -0500
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 11Q6lg2g030757;
 Fri, 26 Feb 2021 06:50:40 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma04ams.nl.ibm.com with ESMTP id 36tt28d1fg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Feb 2021 06:50:39 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 11Q6obJ436241902
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 26 Feb 2021 06:50:37 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F01E011C050;
 Fri, 26 Feb 2021 06:50:36 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7106411C04A;
 Fri, 26 Feb 2021 06:50:35 +0000 (GMT)
Received: from Madhavan.PrimaryTP (unknown [9.85.180.74])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 26 Feb 2021 06:50:35 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH V2 1/2] powerpc/perf: Infrastructure to support checking of
 attr.config*
Date: Fri, 26 Feb 2021 12:20:24 +0530
Message-Id: <20210226065025.1254973-1-maddy@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-02-26_01:2021-02-24,
 2021-02-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 adultscore=0
 mlxlogscore=999 spamscore=0 clxscore=1015 malwarescore=0 suspectscore=0
 impostorscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102260049
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
have fields that are reserved and specific value to bit field
as reserved. For ex., MMCRA[61:62] is Randome Sampling Mode (SM)
and value of 0b11 to this field is reserved.

Writing a non-zero values in these fields or writing invalid
value to bit fields will have unknown behaviours.

Patch adds a generic call-back function "check_attr_config"
in "struct power_pmu", to be called in event_init to
check for attr.config* values for a given platform.
"check_attr_config" is valid only for raw event type.

Signed-off-by: Madhavan Srinivasan <maddy@linux.ibm.com>
---
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

