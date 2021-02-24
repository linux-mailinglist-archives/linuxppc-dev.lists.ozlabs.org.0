Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2189C323F26
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Feb 2021 15:29:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DlyxG04MKz3ckX
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Feb 2021 01:29:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=dcdrUoys;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=dcdrUoys; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dlywq2fVnz30Ny
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Feb 2021 01:29:30 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 11OE2U4g196555; Wed, 24 Feb 2021 09:29:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=orBYsPLE7c4klPIlU/lkh+Zi2iGhrD6u41SxJzq3yGg=;
 b=dcdrUoysAXrVsORw7GiNN/OZf07aYVLyGI1UkmtIqEc2v9pgEQvvokG8pCKbL+qX+SQ8
 41JT/EOoL58THFXCaRyg/tbXwY5aTD1kI+MnxxnPXNj3MhYD9D8rTI0v9Y1tzP5klKk0
 7JG5zlza96GzhxSCo1gf4J23eRVV7avxDlyomDOexySVibHqijuJb8EYHSLkwnjzTWtw
 14olc9tLJ5SQWDvTZoeYalry6WbjiIx/5V4bN12EDwY34+1UdvKwL9ISyTXV7KIq6FMF
 TyZrr5Ui0mxp1TU2EktOqoWQVw0y7liJOseLKKy2jO12u54GX+NuGRHZI7zH/AUca4DC 9g== 
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0b-001b2d01.pphosted.com with ESMTP id 36wmabt3hw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 24 Feb 2021 09:29:22 -0500
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 11OES6XG023345;
 Wed, 24 Feb 2021 14:29:21 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma06ams.nl.ibm.com with ESMTP id 36tsph3mew-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 24 Feb 2021 14:29:20 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 11OETImx65798416
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 24 Feb 2021 14:29:18 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AE2B7AE053;
 Wed, 24 Feb 2021 14:29:18 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CC8FEAE055;
 Wed, 24 Feb 2021 14:29:16 +0000 (GMT)
Received: from Madhavan.PrimaryTP (unknown [9.80.228.132])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 24 Feb 2021 14:29:16 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH 1/2] powerpc/perf: Infrastructure to support checking of
 attr.config*
Date: Wed, 24 Feb 2021 19:58:39 +0530
Message-Id: <20210224142840.1170088-1-maddy@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-02-24_04:2021-02-24,
 2021-02-24 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0
 spamscore=0 priorityscore=1501 impostorscore=0 mlxscore=0 clxscore=1011
 lowpriorityscore=0 bulkscore=0 phishscore=0 adultscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2102240109
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>,
 Madhavan Srinivasan <maddy@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Introduce code to support the checking of attr.config* for
values which are reserved for a given platform.
Performance Monitoring Unit (PMU) configuration registers
have fileds that are reserved and specific values to bit fields
as reserved. Writing a none zero values in these fields
or writing invalid value to bit fields will have unknown
behaviours.

Patch here add a generic call-back function "check_attr_config"
in "struct power_pmu", to be called in event_init to
check for attr.config* values for a given platform.
"check_attr_config" is valid only for raw event type.

Suggested-by: Alexey Kardashevskiy <aik@ozlabs.ru>
Signed-off-by: Madhavan Srinivasan <maddy@linux.ibm.com>
---
 arch/powerpc/include/asm/perf_event_server.h |  6 ++++++
 arch/powerpc/perf/core-book3s.c              | 12 ++++++++++++
 2 files changed, 18 insertions(+)

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
index 6817331e22ff..679d67506299 100644
--- a/arch/powerpc/perf/core-book3s.c
+++ b/arch/powerpc/perf/core-book3s.c
@@ -1958,6 +1958,18 @@ static int power_pmu_event_init(struct perf_event *event)
 
 		if (ppmu->blacklist_ev && is_event_blacklisted(ev))
 			return -EINVAL;
+		/*
+		 * PMU config registers have fileds that are
+		 * reserved and spacific values to bit fileds be reserved.
+		 * This call-back will check the event code for same.
+		 *
+		 * Event type hardware and hw_cache will not value
+		 * invalid values in the event code which is not true
+		 * for raw event type.
+		 */
+		if (ppmu->check_attr_config &&
+		    ppmu->check_attr_config(event))
+			return -EINVAL;
 		break;
 	default:
 		return -ENOENT;
-- 
2.26.2

