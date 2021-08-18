Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC8213F0A24
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Aug 2021 19:18:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GqZNS2GFRz3d8T
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Aug 2021 03:18:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=NnviZtnD;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=NnviZtnD; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GqZMF4sLVz3clM
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Aug 2021 03:16:57 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17IH33lQ071180; Wed, 18 Aug 2021 13:16:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=X2oC8sAho7YLJqSyfB2CJeZxd2Uh7AjyMUCLEB02zY0=;
 b=NnviZtnDl8eWS/BxEI+8kTCfg2OjubvozLK09Br8ln6zgoziSvZLf/E5NxZCvyaPsHx/
 MhW7cztXydACm/IJlDBlcnYdJAcWScM3Y9AfOIEICk3T4+B5aMNPzhNPBallE5lsP8Va
 pFX4GPaczf2i6U7FAWDEBVrNHH7/0zTExweLMsp3kA3f0+yMXpwBZvlx9I9D+JAA8/4J
 tSfBO3isYiWR18ZbW3/ohWvzk/kN8hZHLfAxI6rsYRcR5Vuws0Of7R9kWdUo18y6aldd
 bvcW/E6ONZzwo79jVuhvzw06o7JzS9Ha9Ib84AD4Tih0CZBez+Yx+Ab3HHrndFFDOENh og== 
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3agp1pbej2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 Aug 2021 13:16:45 -0400
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 17IH8cvf019957;
 Wed, 18 Aug 2021 17:16:43 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma02fra.de.ibm.com with ESMTP id 3ae5f8dygh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 Aug 2021 17:16:43 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 17IHGeAV49152380
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 18 Aug 2021 17:16:40 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4663011C05C;
 Wed, 18 Aug 2021 17:16:40 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0DDC411C069;
 Wed, 18 Aug 2021 17:16:38 +0000 (GMT)
Received: from localhost.localdomain.com (unknown [9.199.41.222])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 18 Aug 2021 17:16:37 +0000 (GMT)
From: Kajol Jain <kjain@linux.ibm.com>
To: mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org,
 christophe.leroy@csgroup.eu
Subject: [PATCH v4 3/3] powerpc/perf: Fix the check for SIAR value
Date: Wed, 18 Aug 2021 22:45:56 +0530
Message-Id: <20210818171556.36912-3-kjain@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210818171556.36912-1-kjain@linux.ibm.com>
References: <20210818171556.36912-1-kjain@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: NnHAh6lmzv1QZCF9ZTg-h_bEZeoj-Ae_
X-Proofpoint-ORIG-GUID: NnHAh6lmzv1QZCF9ZTg-h_bEZeoj-Ae_
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-18_06:2021-08-17,
 2021-08-18 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=999
 mlxscore=0 suspectscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0
 phishscore=0 priorityscore=1501 spamscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108180107
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
Cc: kjain@linux.ibm.com, atrajeev@linux.vnet.ibm.com, maddy@linux.ibm.com,
 rnsastry@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Incase of random sampling, there can be scenarios where
Sample Instruction Address Register(SIAR) may not latch
to the sampled instruction and could result in
the value of 0. In these scenarios it is preferred to
return regs->nip. These corner cases are seen in the
previous generation (p9) also.

Patch adds the check for SIAR value along with regs_use_siar
and siar_valid checks so that the function will return
regs->nip incase SIAR is zero.

Patch drops the code under PPMU_P10_DD1 flag check
which handles SIAR 0 case only for Power10 DD1.

Fixes: 2ca13a4cc56c9 ("powerpc/perf: Use regs->nip when SIAR is zero")
Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
---

Changelog:
v3 -> v4
- Remove use_siar variable and directly using regs_use_siar call as
  suggested by Christophe Leroy

v2 -> v3
- Drop adding new ternary condition to check siar value.
- Remove siar check specific for PPMU_P10_DD1 and add
  it along with common checks as suggested by Christophe Leroy
  and Michael Ellermen

 arch/powerpc/perf/core-book3s.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/arch/powerpc/perf/core-book3s.c b/arch/powerpc/perf/core-book3s.c
index 23ec89a59893..b0a589409039 100644
--- a/arch/powerpc/perf/core-book3s.c
+++ b/arch/powerpc/perf/core-book3s.c
@@ -2251,15 +2251,9 @@ unsigned long perf_misc_flags(struct pt_regs *regs)
  */
 unsigned long perf_instruction_pointer(struct pt_regs *regs)
 {
-	bool use_siar = regs_use_siar(regs);
 	unsigned long siar = mfspr(SPRN_SIAR);
 
-	if (ppmu && (ppmu->flags & PPMU_P10_DD1)) {
-		if (siar)
-			return siar;
-		else
-			return regs->nip;
-	} else if (use_siar && siar_valid(regs))
+	if (regs_use_siar(regs) && siar_valid(regs) && siar)
 		return siar + perf_ip_adjust(regs);
 	else
 		return regs->nip;
-- 
2.26.2

