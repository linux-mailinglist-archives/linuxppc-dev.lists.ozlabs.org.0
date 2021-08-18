Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D8AC3F0488
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Aug 2021 15:22:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GqT8b1Bmpz3dC4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Aug 2021 23:22:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=hPw22OKe;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=hPw22OKe; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GqT6P3zl5z3bTR
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Aug 2021 23:20:29 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17ID2wN3147847; Wed, 18 Aug 2021 09:20:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=aV6hwjYtZHKOaOrRv8Ro7TyH8TcvhRHuRP+m5bvaVvg=;
 b=hPw22OKegLjrxO3xP/NBdVXKwl68wueN0TXebkkjibaENG6ASN2By+1rS8OaEgxmHS2t
 t7ZRyxmoN2thRnEr8klfKAQYmZiFa1nWzelqRJifAH349GRJP+KADD53iIIDhk+ExiWk
 PJY6/+vO9A8ay79wkGNnBx1OvNSeECorv6IuOUM5isLA1JVyXd34sHLxXG5BQV+Bgk5F
 s6O80eXxxucYbjku2kbcy9M/rf0z5IuQllLGXDi8UJ6ezgBbJxd2Y7CtWydY/nQMbsoR
 A410oOgAwGWP9SSUg84i+1qh9palzrg8MfhdyZGqQdM5LtUEQu1GWA/OaxvBUwegfRCS oQ== 
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3agg0a62ks-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 Aug 2021 09:20:19 -0400
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 17IDCkfo019162;
 Wed, 18 Aug 2021 13:20:16 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma03fra.de.ibm.com with ESMTP id 3agh2xh633-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 Aug 2021 13:20:16 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 17IDKDvP53477846
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 18 Aug 2021 13:20:13 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 560994204C;
 Wed, 18 Aug 2021 13:20:13 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6C83A42054;
 Wed, 18 Aug 2021 13:20:10 +0000 (GMT)
Received: from localhost.localdomain.com (unknown [9.199.45.10])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 18 Aug 2021 13:20:10 +0000 (GMT)
From: Kajol Jain <kjain@linux.ibm.com>
To: mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org,
 christophe.leroy@csgroup.eu
Subject: [PATCH v3 3/3] powerpc/perf: Fix the check for SIAR value
Date: Wed, 18 Aug 2021 18:49:49 +0530
Message-Id: <20210818131949.32008-3-kjain@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210818131949.32008-1-kjain@linux.ibm.com>
References: <20210818131949.32008-1-kjain@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: dIrh5nAqGfwK2yGlG3Hcpy8ZS16KHKbg
X-Proofpoint-GUID: dIrh5nAqGfwK2yGlG3Hcpy8ZS16KHKbg
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-18_04:2021-08-17,
 2021-08-18 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 bulkscore=0
 adultscore=0 mlxlogscore=907 phishscore=0 impostorscore=0 malwarescore=0
 priorityscore=1501 clxscore=1015 spamscore=0 lowpriorityscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108180082
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

Patch adds the check for SIAR value along with use_siar and
siar_valid checks so that the function will return regs->nip
incase SIAR is zero.

Patch drops the code under PPMU_P10_DD1 flag check
which handles SIAR 0 case only for Power10 DD1.

Fixes: 2ca13a4cc56c9 ("powerpc/perf: Use regs->nip when SIAR is zero")
Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
---

Changelog:
- Drop adding new ternary condition to check siar value.
- Remove siar check specific for PPMU_P10_DD1 and add
  it along with common checks as suggested by Christophe Leroy
  and Michael Ellermen

 arch/powerpc/perf/core-book3s.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/arch/powerpc/perf/core-book3s.c b/arch/powerpc/perf/core-book3s.c
index 23ec89a59893..55efbba7572b 100644
--- a/arch/powerpc/perf/core-book3s.c
+++ b/arch/powerpc/perf/core-book3s.c
@@ -2254,12 +2254,7 @@ unsigned long perf_instruction_pointer(struct pt_regs *regs)
 	bool use_siar = regs_use_siar(regs);
 	unsigned long siar = mfspr(SPRN_SIAR);
 
-	if (ppmu && (ppmu->flags & PPMU_P10_DD1)) {
-		if (siar)
-			return siar;
-		else
-			return regs->nip;
-	} else if (use_siar && siar_valid(regs))
+	if (use_siar && siar_valid(regs) && siar)
 		return siar + perf_ip_adjust(regs);
 	else
 		return regs->nip;
-- 
2.26.2

