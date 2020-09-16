Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D955C26C277
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Sep 2020 14:07:19 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BrzP000dYzDqSQ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Sep 2020 22:07:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=h1XEdoZV; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BrzLj2BS0zDqQN
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Sep 2020 22:05:17 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08GBYqXU096694; Wed, 16 Sep 2020 08:05:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject : date : message-id; s=pp1;
 bh=lmfYUwKzrcRrhqX4b+NuLoSeEzLDhC6LHbjWxI16NGs=;
 b=h1XEdoZVNMkQXWlbcojlGuu2C2R20KcR/oJtXNBwMWrs0guN8E3ScPdIkGG4X9+3lh/R
 OCgC0w6g6ISVmHkN0aggr4dtI94L9/Ucb46lMdn+Lcr4MQMBYs06qv16nHmRbTDfbsM9
 Yo5TngTFZiBsNHcL/jTpK+1GWV8IYnveQq4dfGrcEUy0yzZH3ACjBRQXWh0/iNceXT0I
 BZNh9KteAuQtH8K0bKDWBuJXFDzBizgYdk6F6Z38420QhakyqqIJyiPP/4Q+2yM7IOXQ
 27ThB5XVNwIFZK70f/XYv7uFjrZeYPkGpnom8JDn1m/RGMQyyYEh5jUfkxNe60UFZdaB Zg== 
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 33kgrn3459-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Sep 2020 08:05:07 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 08GBvFJ8001793;
 Wed, 16 Sep 2020 12:05:05 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma06ams.nl.ibm.com with ESMTP id 33k9ge8f7t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Sep 2020 12:05:05 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 08GC53TA17301780
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 16 Sep 2020 12:05:03 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E24964C059;
 Wed, 16 Sep 2020 12:05:02 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DCAAC4C044;
 Wed, 16 Sep 2020 12:05:01 +0000 (GMT)
Received: from localhost.localdomain.localdomain (unknown [9.85.104.26])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 16 Sep 2020 12:05:01 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH] powerpc/perf: Exclude pmc5/6 from the irrelevant PMU group
 constraints
Date: Wed, 16 Sep 2020 08:05:00 -0400
Message-Id: <1600257900-2043-1-git-send-email-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-16_06:2020-09-16,
 2020-09-16 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 mlxlogscore=775
 mlxscore=0 suspectscore=1 phishscore=0 spamscore=0 adultscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009160082
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
Cc: maddy@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

PMU counter support functions enforces event constraints for group of
events to check if all events in a group can be monitored. Incase of
event codes using PMC5 and PMC6 ( 500fa and 600f4 respectively ),
not all constraints are applicable, say the threshold or sample bits.
But current code includes pmc5 and pmc6 in some group constraints (like
IC_DC Qualifier bits) which is actually not applicable and hence results
in those events not getting counted when scheduled along with group of
other events. Patch fixes this by excluding PMC5/6 from constraints
which are not relevant for it.

Fixes: 7ffd948 ('powerpc/perf: factor out power8 pmu functions')
Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
---
 arch/powerpc/perf/isa207-common.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/powerpc/perf/isa207-common.c b/arch/powerpc/perf/isa207-common.c
index 964437a..186fad8 100644
--- a/arch/powerpc/perf/isa207-common.c
+++ b/arch/powerpc/perf/isa207-common.c
@@ -288,6 +288,9 @@ int isa207_get_constraint(u64 event, unsigned long *maskp, unsigned long *valp)
 
 		mask  |= CNST_PMC_MASK(pmc);
 		value |= CNST_PMC_VAL(pmc);
+
+		if (pmc >= 5)
+			goto ebb_bhrb;
 	}
 
 	if (pmc <= 4) {
@@ -357,6 +360,7 @@ int isa207_get_constraint(u64 event, unsigned long *maskp, unsigned long *valp)
 		}
 	}
 
+ebb_bhrb:
 	if (!pmc && ebb)
 		/* EBB events must specify the PMC */
 		return -1;
-- 
1.8.3.1

