Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C4FD346923F
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Dec 2021 10:22:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J6yd44y4Xz3cHS
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Dec 2021 20:22:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=pu7cMa8b;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=pu7cMa8b; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J6yYp48Ncz3081
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Dec 2021 20:19:42 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1B68pWmc031978; 
 Mon, 6 Dec 2021 09:19:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=j+i3Eu60oXN+XFrZgHqc1xymBBicpx8rh6KREPU8OFo=;
 b=pu7cMa8bTlF8Q1kXnjly8GBrKEb4eZrzX2Ul1eycEFvhihe2PVY48Xs0QBE7vkoVIUXW
 3GqHrPy5lhC5VqRe3gj3mZVtpu8/K9q25My3aCPUgB4bRNdSb/tK2uai12r8OqfLtzSf
 2FKXLYK/ngU33QUfsY+tTsWvcZQEu9y+flOfhXXuCNhMoTQZjf3g4a3y6FWzAgrHfNzo
 EsdX5DAQ0pi/tHl89KECRqn+XW7VQI1OcdS6NBsVz625ZjI4eBeUc7pagB+7jnlv3FNk
 6zoEcP6Y3gOwuO1n+W6WGDqgXW96Cy/eqQMZCKlraCdFesEYCW0prr4YdMcrq2Y83/AS QQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3csfcm8g09-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Dec 2021 09:19:19 +0000
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1B68qCMe006916;
 Mon, 6 Dec 2021 09:19:19 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3csfcm8fyv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Dec 2021 09:19:18 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1B69CwSl025459;
 Mon, 6 Dec 2021 09:19:16 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma04ams.nl.ibm.com with ESMTP id 3cqyyaaftb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Dec 2021 09:19:13 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1B69J1nK30474568
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 6 Dec 2021 09:19:01 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4B67EA4040;
 Mon,  6 Dec 2021 09:19:01 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7C7B4A4051;
 Mon,  6 Dec 2021 09:18:54 +0000 (GMT)
Received: from li-e8dccbcc-2adc-11b2-a85c-bc1f33b9b810.ibm.com.com (unknown
 [9.43.39.249]) by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon,  6 Dec 2021 09:18:54 +0000 (GMT)
From: Kajol Jain <kjain@linux.ibm.com>
To: mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, peterz@infradead.org, mingo@redhat.com,
 acme@kernel.org, jolsa@kernel.org, namhyung@kernel.org, ak@linux.intel.com
Subject: [PATCH 4/4] powerpc/perf: Add data source encodings for power10
 platform
Date: Mon,  6 Dec 2021 14:47:49 +0530
Message-Id: <20211206091749.87585-5-kjain@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20211206091749.87585-1-kjain@linux.ibm.com>
References: <20211206091749.87585-1-kjain@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: CPOZOI_-NdMY7WqrkOW4xMR2yyS6JWO0
X-Proofpoint-GUID: YaE5Bd6ruhjCf83lHUzfYOVQvSU5n5IC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-06_03,2021-12-06_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0
 clxscore=1015 impostorscore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 suspectscore=0 mlxscore=0 spamscore=0 priorityscore=1501 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2112060054
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
Cc: mark.rutland@arm.com, songliubraving@fb.com, atrajeev@linux.vnet.ibm.com,
 daniel@iogearbox.net, rnsastry@linux.ibm.com,
 alexander.shishkin@linux.intel.com, kjain@linux.ibm.com, ast@kernel.org,
 linux-perf-users@vger.kernel.org, yao.jin@linux.intel.com, maddy@linux.ibm.com,
 paulus@samba.org, kan.liang@linux.intel.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The code represent memory/cache level data based on PERF_MEM_LVL_*
namespace, which is in the process of deprication in the favour of
newer composite PERF_MEM_{LVLNUM_,REMOTE_,SNOOPX_,HOPS_} fields.
Add data source encodings to represent cache/memory data based on
newer composite PERF_MEM_{LVLNUM_,REMOTE_,SNOOPX_,HOPS_} fields.

Add data source encodings to represent data coming from local
memory/Remote memory/distant memory and remote/distant cache hits.

Inorder to represent data coming from OpenCAPI cache/memory, we use
LVLNUM "PMEM" field which is used to present persistent memory accesses.

Result in power10 system with patch changes:

localhost:# ./perf mem report --sort="mem,sym,dso" --stdio
 # Overhead       Samples  Memory access             Symbol                      Shared Object
 # ........  ............  ........................  ..........................  ................
 #
    29.46%          2331  L1 or L1 hit              [.] __random                                     libc-2.28.so
    23.11%          2121  L1 or L1 hit              [.] producer_populate_cache                      producer_consumer
    18.56%          1758  L1 or L1 hit              [.] __random_r                                   libc-2.28.so
    15.64%          1559  L2 or L2 hit              [.] __random                                     libc-2.28.so
    .....
    0.09%              5  Remote socket, same board Any cache hit             [.] __random         libc-2.28.so
    0.07%              4  Remote socket, same board Any cache hit             [.] __random         libc-2.28.so
    .....

Reviewed-by: Madhavan Srinivasan <maddy@linux.ibm.com>
Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
---
 arch/powerpc/perf/isa207-common.c | 54 ++++++++++++++++++++++++-------
 1 file changed, 42 insertions(+), 12 deletions(-)

diff --git a/arch/powerpc/perf/isa207-common.c b/arch/powerpc/perf/isa207-common.c
index 6c6bc8b7d887..4037ea652522 100644
--- a/arch/powerpc/perf/isa207-common.c
+++ b/arch/powerpc/perf/isa207-common.c
@@ -229,13 +229,28 @@ static inline u64 isa207_find_source(u64 idx, u32 sub_idx)
 		ret = PH(LVL, L3) | LEVEL(L3) | P(SNOOP, HIT);
 		break;
 	case 4:
-		if (sub_idx <= 1)
-			ret = PH(LVL, LOC_RAM);
-		else if (sub_idx > 1 && sub_idx <= 2)
-			ret = PH(LVL, REM_RAM1);
-		else
-			ret = PH(LVL, REM_RAM2);
-		ret |= P(SNOOP, HIT);
+		if (cpu_has_feature(CPU_FTR_ARCH_31)) {
+			ret = P(SNOOP, HIT);
+
+			if (sub_idx == 1)
+				ret |= PH(LVL, LOC_RAM) | LEVEL(RAM);
+			else if (sub_idx == 2 || sub_idx == 3)
+				ret |= P(LVL, HIT) | LEVEL(PMEM);
+			else if (sub_idx == 4)
+				ret |= PH(LVL, REM_RAM1) | REM | LEVEL(RAM) | P(HOPS, 2);
+			else if (sub_idx == 5 || sub_idx == 7)
+				ret |= P(LVL, HIT) | LEVEL(PMEM) | REM;
+			else if (sub_idx == 6)
+				ret |= PH(LVL, REM_RAM2) | REM | LEVEL(RAM) | P(HOPS, 3);
+		} else {
+			if (sub_idx <= 1)
+				ret = PH(LVL, LOC_RAM);
+			else if (sub_idx > 1 && sub_idx <= 2)
+				ret = PH(LVL, REM_RAM1);
+			else
+				ret = PH(LVL, REM_RAM2);
+			ret |= P(SNOOP, HIT);
+		}
 		break;
 	case 5:
 		if (cpu_has_feature(CPU_FTR_ARCH_31)) {
@@ -261,11 +276,26 @@ static inline u64 isa207_find_source(u64 idx, u32 sub_idx)
 		}
 		break;
 	case 6:
-		ret = PH(LVL, REM_CCE2);
-		if ((sub_idx == 0) || (sub_idx == 2))
-			ret |= P(SNOOP, HIT);
-		else if ((sub_idx == 1) || (sub_idx == 3))
-			ret |= P(SNOOP, HITM);
+		if (cpu_has_feature(CPU_FTR_ARCH_31)) {
+			if (sub_idx == 0)
+				ret = PH(LVL, REM_CCE1) | LEVEL(ANY_CACHE) | REM |
+					P(SNOOP, HIT) | P(HOPS, 2);
+			else if (sub_idx == 1)
+				ret = PH(LVL, REM_CCE1) | LEVEL(ANY_CACHE) | REM |
+					P(SNOOP, HITM) | P(HOPS, 2);
+			else if (sub_idx == 2)
+				ret = PH(LVL, REM_CCE2) | LEVEL(ANY_CACHE) | REM |
+					P(SNOOP, HIT) | P(HOPS, 3);
+			else if (sub_idx == 3)
+				ret = PH(LVL, REM_CCE2) | LEVEL(ANY_CACHE) | REM |
+					P(SNOOP, HITM) | P(HOPS, 3);
+		} else {
+			ret = PH(LVL, REM_CCE2);
+			if (sub_idx == 0 || sub_idx == 2)
+				ret |= P(SNOOP, HIT);
+			else if (sub_idx == 1 || sub_idx == 3)
+				ret |= P(SNOOP, HITM);
+		}
 		break;
 	case 7:
 		ret = PM(LVL, L1);
-- 
2.27.0

