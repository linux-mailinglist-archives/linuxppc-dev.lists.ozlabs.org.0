Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 814F2294A14
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Oct 2020 11:03:54 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CGPgC4QgmzDqT7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Oct 2020 20:03:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=tLkMA9wg; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CGPSG19JrzDqfs
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Oct 2020 19:54:21 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09L8XdqG030511; Wed, 21 Oct 2020 04:54:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=NK9gkr7cqpcy4XvCUqZX4FvrDoE9siIxBcoTTyrgi2g=;
 b=tLkMA9wg5zfCE8LNujt1bbiWba8rRZWpj/DTQxviJwlSaYi5QgLnrVIQDyuVlKqMTLIC
 95hFWPZbrNR8HPvsDgY2+9LvufrGQKqaELyJq7bRE8FTgqMIkruBNIhhIDJUk68OvQAs
 pP6Y5CgVstjf0kHV8NvrdcjljuvvnpRVQskTb5+X0y2mJ9sFkNZ7RKArOIuN1hVD0BZX
 mvwwCuXJ3SEFGbmQwXi9uYFqo/Rt2REh5igzvn6ocbWSEBCLBXxErJUWWYps3J1TaHJL
 0vpIhfXRU2eSUoUrAeEiN3zYIM0O8BKFZuylSBpPEoQ0AcmZwrKRYoJgkBkMqY3VHfjc dQ== 
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 34agdtjsts-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 21 Oct 2020 04:54:17 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 09L8rkhe008754;
 Wed, 21 Oct 2020 08:54:11 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma06ams.nl.ibm.com with ESMTP id 347qvhc4j2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 21 Oct 2020 08:54:11 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 09L8s9js25231754
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 21 Oct 2020 08:54:09 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4F394A4055;
 Wed, 21 Oct 2020 08:54:09 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BAC7FA4051;
 Wed, 21 Oct 2020 08:54:07 +0000 (GMT)
Received: from Madhavan.com (unknown [9.85.89.85])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 21 Oct 2020 08:54:07 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH 5/5] powerpc/perf: use regs->nip when siar is zero
Date: Wed, 21 Oct 2020 14:23:29 +0530
Message-Id: <20201021085329.384535-5-maddy@linux.ibm.com>
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
 score=100 adultscore=0
 clxscore=1015 impostorscore=0 priorityscore=1501 suspectscore=0
 phishscore=0 mlxlogscore=456 spamscore=0 lowpriorityscore=0 malwarescore=0
 mlxscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2010210069
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

In power10 DD1, there is an issue where the
Sampled Instruction Address Register (SIAR)
not latching to the sampled address during
random sampling. This results in value of 0s
in the SIAR. Patch adds a check to use regs->nip
when SIAR is zero.

Signed-off-by: Madhavan Srinivasan <maddy@linux.ibm.com>
---
 arch/powerpc/perf/core-book3s.c | 21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/perf/core-book3s.c b/arch/powerpc/perf/core-book3s.c
index e675c7c8ce0e..63de77eb0ac0 100644
--- a/arch/powerpc/perf/core-book3s.c
+++ b/arch/powerpc/perf/core-book3s.c
@@ -263,9 +263,16 @@ static inline u32 perf_get_misc_flags(struct pt_regs *regs)
 	 * DD1.
 	 */
 	if (marked && (ppmu->flags & PPMU_P10_DD1)) {
-		if (is_kernel_addr(mfspr(SPRN_SIAR)))
-			return PERF_RECORD_MISC_KERNEL;
-		return PERF_RECORD_MISC_USER;
+		unsigned long siar = mfspr(SPRN_SIAR);
+		if (siar) {
+			if (is_kernel_addr(siar))
+				return PERF_RECORD_MISC_KERNEL;
+			return PERF_RECORD_MISC_USER;
+		} else {
+			if (is_kernel_addr(regs->nip))
+				return PERF_RECORD_MISC_KERNEL;
+			return PERF_RECORD_MISC_USER;
+		}
 	}
 
 	/*
@@ -2211,8 +2218,14 @@ unsigned long perf_misc_flags(struct pt_regs *regs)
 unsigned long perf_instruction_pointer(struct pt_regs *regs)
 {
 	bool use_siar = regs_use_siar(regs);
+	unsigned long siar = mfspr(SPRN_SIAR);
 
-	if (use_siar && siar_valid(regs))
+	if (ppmu->flags & PPMU_P10_DD1) {
+		if (siar)
+			return siar;
+		else
+			return regs->nip;
+	} else if (use_siar && siar_valid(regs))
 		return mfspr(SPRN_SIAR) + perf_ip_adjust(regs);
 	else if (use_siar)
 		return 0;		// no valid instruction pointer
-- 
2.26.2

