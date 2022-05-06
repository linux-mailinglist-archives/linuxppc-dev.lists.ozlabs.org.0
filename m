Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C84C351D112
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 May 2022 08:11:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KvgDh5K5Kz3cBn
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 May 2022 16:11:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=YO+c9tYo;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=YO+c9tYo; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KvgD223fcz2yg3
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 May 2022 16:10:41 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2463hFrr023761;
 Fri, 6 May 2022 06:10:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=Gv5WwD1Yn/1RvWst8S6SlPzAXJcEhS5pSiOtWtvoWzk=;
 b=YO+c9tYoU4BX0hUOn3eRsmedWnWwHKLVz5eaAEkdiqvCL9/b9Hg7BcbgtMjXnwieC+Wy
 jVQMx6wSJ51HA6f9WPIT4FOZKv8YjoTGOEvzTESf7TaZWqPAvG0MCisb+kQZvglx9UUC
 8Gg8XKAo55EKNOqYuUOvt7PHbqaVUWnMXliUsfMkIPNhoGrfgd7Flk/BrYd1UX0Ufu9G
 MJQYHFIXyczUE58zlEYsTOuUgZ5GFH0t84yKIJqKGIv3jw8CUMZdORBmGCnMJXS+Ldif
 7dj6SQgYQBwLFV5gwCAvh83p21QAXYAKrnzDLR8enDEoIu3n7ODLaYD9ygizRvR1AnBD 4A== 
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3fvv0xtcg8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 May 2022 06:10:33 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 24668iTa028749;
 Fri, 6 May 2022 06:10:32 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma03fra.de.ibm.com with ESMTP id 3fscdk5xsk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 May 2022 06:10:32 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2466ASRD45351382
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 6 May 2022 06:10:28 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A2355A404D;
 Fri,  6 May 2022 06:10:28 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D9034A4040;
 Fri,  6 May 2022 06:10:25 +0000 (GMT)
Received: from li-e8dccbcc-2adc-11b2-a85c-bc1f33b9b810.ibm.com.com (unknown
 [9.43.19.224]) by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri,  6 May 2022 06:10:25 +0000 (GMT)
From: Kajol Jain <kjain@linux.ibm.com>
To: mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 1/2] powerpc/perf: Fix the threshold compare group constraint
 for power10
Date: Fri,  6 May 2022 11:40:14 +0530
Message-Id: <20220506061015.43916-1-kjain@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: NIZDWagoEoo4OhIMRBb2dEb6Jr9bZ1XW
X-Proofpoint-ORIG-GUID: NIZDWagoEoo4OhIMRBb2dEb6Jr9bZ1XW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-06_01,2022-05-05_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 mlxlogscore=999 adultscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 mlxscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2205060031
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
 disgoel@linux.vnet.ibm.com, rnsastry@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Thresh compare bits for a event is used to program thresh compare
field in Monitor Mode Control Register A (MMCRA: 8-18 bits for power10).
When scheduling events as a group, all events in that group should
match value in threshold bits. Otherwise event open for the sibling
events should fail. But in the current code, incase thresh compare bits are
not valid, we are not failing in group_constraint function which can result
in invalid group schduling.

Fix the issue by returning -1 incase event is threshold and threshold
compare value is not valid in group_constraint function.

Patch also fixes the p10_thresh_cmp_val function to return -1,
incase threshold bits are not valid and changes corresponding check in
is_thresh_cmp_valid function to return false only when the thresh_cmp
value is less then 0.

Thresh control bits in the event code is used to program thresh_ctl
field in Monitor Mode Control Register A (MMCRA: 48-55). In below example,
the scheduling of group events PM_MRK_INST_CMPL (3534401e0) and
PM_THRESH_MET (34340101ec) is expected to fail as both event
request different thresh control bits.

Result before the patch changes:

[command]# perf stat -e "{r35340401e0,r34340101ec}" sleep 1

 Performance counter stats for 'sleep 1':

             8,482      r35340401e0
                 0      r34340101ec

       1.001474838 seconds time elapsed

       0.001145000 seconds user
       0.000000000 seconds sys

Result after the patch changes:

[command]# perf stat -e "{r35340401e0,r34340101ec}" sleep 1

 Performance counter stats for 'sleep 1':

     <not counted>      r35340401e0
   <not supported>      r34340101ec

       1.001499607 seconds time elapsed

       0.000204000 seconds user
       0.000760000 seconds sys

Fixes: 82d2c16b350f7 ("powerpc/perf: Adds support for programming
of Thresholding in P10")
Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
---
 arch/powerpc/perf/isa207-common.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/perf/isa207-common.c b/arch/powerpc/perf/isa207-common.c
index a74d382ecbb7..013b06af6fe6 100644
--- a/arch/powerpc/perf/isa207-common.c
+++ b/arch/powerpc/perf/isa207-common.c
@@ -108,7 +108,7 @@ static void mmcra_sdar_mode(u64 event, unsigned long *mmcra)
 		*mmcra |= MMCRA_SDAR_MODE_TLB;
 }
 
-static u64 p10_thresh_cmp_val(u64 value)
+static int p10_thresh_cmp_val(u64 value)
 {
 	int exp = 0;
 	u64 result = value;
@@ -139,7 +139,7 @@ static u64 p10_thresh_cmp_val(u64 value)
 		 * exponent is also zero.
 		 */
 		if (!(value & 0xC0) && exp)
-			result = 0;
+			result = -1;
 		else
 			result = (exp << 8) | value;
 	}
@@ -187,7 +187,7 @@ static bool is_thresh_cmp_valid(u64 event)
 	unsigned int cmp, exp;
 
 	if (cpu_has_feature(CPU_FTR_ARCH_31))
-		return p10_thresh_cmp_val(event) != 0;
+		return p10_thresh_cmp_val(event) >= 0;
 
 	/*
 	 * Check the mantissa upper two bits are not zero, unless the
@@ -502,7 +502,8 @@ int isa207_get_constraint(u64 event, unsigned long *maskp, unsigned long *valp,
 			value |= CNST_THRESH_CTL_SEL_VAL(event >> EVENT_THRESH_SHIFT);
 			mask  |= p10_CNST_THRESH_CMP_MASK;
 			value |= p10_CNST_THRESH_CMP_VAL(p10_thresh_cmp_val(event_config1));
-		}
+		} else if (event_is_threshold(event))
+			return -1;
 	} else if (cpu_has_feature(CPU_FTR_ARCH_300))  {
 		if (event_is_threshold(event) && is_thresh_cmp_valid(event)) {
 			mask  |= CNST_THRESH_MASK;
-- 
2.31.1

