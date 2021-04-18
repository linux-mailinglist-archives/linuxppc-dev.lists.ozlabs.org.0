Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0729036343D
	for <lists+linuxppc-dev@lfdr.de>; Sun, 18 Apr 2021 09:40:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FNMLs73XFz30N5
	for <lists+linuxppc-dev@lfdr.de>; Sun, 18 Apr 2021 17:40:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=BXFDxYB6;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=BXFDxYB6; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FNMLQ6DpSz303y
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 18 Apr 2021 17:40:30 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13I7XY1W050896; Sun, 18 Apr 2021 03:40:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=vqEB4bPbr15e8fePRFJjM/dPPIdp976wu4HLPUMYjw4=;
 b=BXFDxYB6SIfTOhbdDiWOGr3V1UwhSm1ayH23QrjDQyybamGCiW6GuCpdr0m7CytAAUE6
 SMTBGZJBXVgTOuw0s1DbO/w4YCr0AtBcIldmp0NS+zwVWvsU/ACprybgYm2E/JCaQ5uk
 pjqfbryDw47KJwEmymfoOhiOOW3utgfQ864Y/k/hS0VPgjEAZNc2Je42vHlIXnDGlAcs
 6pNANW8d3LbUQwPsyvgihjoud80rU3Mx7IWGY/lylBODDpAIcWSNU7gdrezjsVP0CKhs
 14F+E5I8vuHBiHuCieAtMbYondSsLXMvBrUVqvw2aW25FaE+BZSWWJrLHiuPRi//ALH8 AQ== 
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 380cyau5yd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 18 Apr 2021 03:40:20 -0400
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13I7amqa032182;
 Sun, 18 Apr 2021 07:40:18 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma03fra.de.ibm.com with ESMTP id 37yqa887xh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 18 Apr 2021 07:40:18 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 13I7dq9B35717488
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sun, 18 Apr 2021 07:39:53 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 93C274C04E;
 Sun, 18 Apr 2021 07:40:15 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 77AA44C044;
 Sun, 18 Apr 2021 07:40:13 +0000 (GMT)
Received: from localhost.localdomain.com (unknown [9.199.43.108])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Sun, 18 Apr 2021 07:40:13 +0000 (GMT)
From: Kajol Jain <kjain@linux.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH] powerpc/papr_scm: trivial: fix typo in a comment
Date: Sun, 18 Apr 2021 13:10:03 +0530
Message-Id: <20210418074003.6651-1-kjain@linux.ibm.com>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: V_KrWldtVgqR5EbWehUA7lDwZ0NTQc30
X-Proofpoint-ORIG-GUID: V_KrWldtVgqR5EbWehUA7lDwZ0NTQc30
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-18_03:2021-04-16,
 2021-04-18 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0
 spamscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 mlxlogscore=999
 impostorscore=0 mlxscore=0 suspectscore=0 clxscore=1011 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104060000
 definitions=main-2104180053
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
Cc: maddy@linux.vnet.ibm.com, trivial@kernel.org, kjain@linux.ibm.com,
 linux-kernel@vger.kernel.org, vaibhav@linux.ibm.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

There is a spelling mistake "byes" -> "bytes" in a comment of
function drc_pmem_query_stats(). Fix that typo.

Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
---
 arch/powerpc/platforms/pseries/papr_scm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/platforms/pseries/papr_scm.c b/arch/powerpc/platforms/pseries/papr_scm.c
index 835163f54244..ba4faa513a74 100644
--- a/arch/powerpc/platforms/pseries/papr_scm.c
+++ b/arch/powerpc/platforms/pseries/papr_scm.c
@@ -227,7 +227,7 @@ static int drc_pmem_query_n_bind(struct papr_scm_priv *p)
  * Query the Dimm performance stats from PHYP and copy them (if returned) to
  * provided struct papr_scm_perf_stats instance 'stats' that can hold atleast
  * (num_stats + header) bytes.
- * - If buff_stats == NULL the return value is the size in byes of the buffer
+ * - If buff_stats == NULL the return value is the size in bytes of the buffer
  * needed to hold all supported performance-statistics.
  * - If buff_stats != NULL and num_stats == 0 then we copy all known
  * performance-statistics to 'buff_stat' and expect to be large enough to
-- 
2.27.0

