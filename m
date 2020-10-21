Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DD99A29499A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Oct 2020 10:57:09 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CGPWR12vRzDqlD
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Oct 2020 19:57:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Lg7PLjJ8; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CGPRy5GNbzDqXm
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Oct 2020 19:54:06 +1100 (AEDT)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09L8hwRC155651; Wed, 21 Oct 2020 04:53:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=u4iWAOaxyL+lAUEkzi4w1tYIRRbX61TUfoX/K4yNcXk=;
 b=Lg7PLjJ8uAOiFVfuRLeXvJQcMOfDEOux++TEp7Z+e1JDev2hIaqSg6jFHB6JLyTMXwY/
 LANKIOe1TocqgLsSwGsK6cj1UvJoz7pSrC4PbOVOMYS6w2OsGhMfhQMg8czlecMaUKYB
 CGm2SlqRs1BsxN+bRe6gAflSmNWP5zgRJbYCTRD7n+nRrGTuaL7ObZJG3+khpgyycTQ/
 nJfNjImln9185sS7OYFRoqtvyDHRb9RHu/d0TBRbb3avzCMqgjLM+z6XocLRDIGdvgYp
 V5zbCGpFHChWot8umwu4SpeW0/JadvEbqghtnUUK0XbhIWy4RyUuqeui8AmIuRN97H82 sg== 
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com with ESMTP id 34ahqxg7n9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 21 Oct 2020 04:53:59 -0400
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 09L8pwcf007830;
 Wed, 21 Oct 2020 08:53:58 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma05fra.de.ibm.com with ESMTP id 347r8824mu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 21 Oct 2020 08:53:56 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 09L8rspA33489250
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 21 Oct 2020 08:53:54 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6F3C8A404D;
 Wed, 21 Oct 2020 08:53:54 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D8C2CA4051;
 Wed, 21 Oct 2020 08:53:52 +0000 (GMT)
Received: from Madhavan.com (unknown [9.85.89.85])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 21 Oct 2020 08:53:52 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH v2 2/5] powerpc/perf: Drop the check for SIAR_VALID
Date: Wed, 21 Oct 2020 14:23:26 +0530
Message-Id: <20201021085329.384535-2-maddy@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201021085329.384535-1-maddy@linux.ibm.com>
References: <20201021085329.384535-1-maddy@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.737
 definitions=2020-10-21_03:2020-10-20,
 2020-10-21 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_spam_definite policy=outbound
 score=100 mlxscore=0
 bulkscore=0 spamscore=0 impostorscore=0 mlxlogscore=533 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 suspectscore=0 phishscore=0 adultscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2010210065
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
Cc: atrajeev@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org,
 Madhavan Srinivasan <maddy@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>

In power10 DD1, there is an issue that causes the SIAR_VALID
bit of Sampled Instruction Event Register(SIER) not to be
set. But the SIAR_VALID bit is used for fetching the instruction
address from Sampled Instruction Address Register(SIAR), and
marked events are sampled only if the SIAR_VALID bit is set.
So drop the check for SIAR_VALID and return true always incase of
power10 DD1.

Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Signed-off-by: Madhavan Srinivasan <maddy@linux.ibm.com>
---
Changelog v1:
- Drop the check for SIER[CMPL] and retur true instead
- Made changes to commit message

 arch/powerpc/perf/core-book3s.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/perf/core-book3s.c b/arch/powerpc/perf/core-book3s.c
index 08643cba1494..3b62dbb94796 100644
--- a/arch/powerpc/perf/core-book3s.c
+++ b/arch/powerpc/perf/core-book3s.c
@@ -350,7 +350,14 @@ static inline int siar_valid(struct pt_regs *regs)
 	int marked = mmcra & MMCRA_SAMPLE_ENABLE;
 
 	if (marked) {
-		if (ppmu->flags & PPMU_HAS_SIER)
+		/*
+		 * SIER[SIAR_VALID] is not set for some
+		 * marked events on power10 DD1, so drop
+		 * the check for SIER[SIAR_VALID] and return true.
+		 */
+		if (ppmu->flags & PPMU_P10_DD1)
+			return 0x1;
+		else if (ppmu->flags & PPMU_HAS_SIER)
 			return regs->dar & SIER_SIAR_VALID;
 
 		if (ppmu->flags & PPMU_SIAR_VALID)
-- 
2.26.2

