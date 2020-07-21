Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F83622841F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Jul 2020 17:46:59 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BB2ym06S2zDqjg
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jul 2020 01:46:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=psampat@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BB2ls22TwzDqTp
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Jul 2020 01:37:29 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06LFV7eU013815; Tue, 21 Jul 2020 11:37:23 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32e1x72sy8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Jul 2020 11:37:23 -0400
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 06LFXRC6023229;
 Tue, 21 Jul 2020 11:37:22 -0400
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32e1x72sxb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Jul 2020 11:37:22 -0400
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06LFKkx5004483;
 Tue, 21 Jul 2020 15:37:20 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma04fra.de.ibm.com with ESMTP id 32dbmn0pas-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Jul 2020 15:37:20 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06LFbHiP59703496
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 21 Jul 2020 15:37:17 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C8035A4057;
 Tue, 21 Jul 2020 15:37:17 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DB2ECA4040;
 Tue, 21 Jul 2020 15:37:15 +0000 (GMT)
Received: from pratiks-thinkpad.ibmuc.com (unknown [9.79.210.59])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 21 Jul 2020 15:37:15 +0000 (GMT)
From: Pratik Rajesh Sampat <psampat@linux.ibm.com>
To: mpe@ellerman.id.au, npiggin@gmail.com, benh@kernel.crashing.org,
 paulus@samba.org, mikey@neuling.org, ego@linux.vnet.ibm.com,
 svaidy@linux.ibm.com, psampat@linux.ibm.com, pratik.r.sampat@gmail.com,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 3/3] powerpc/powernv/idle: Exclude mfspr on HID1, 4,
 5 on P9 and above
Date: Tue, 21 Jul 2020 21:07:08 +0530
Message-Id: <20200721153708.89057-4-psampat@linux.ibm.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200721153708.89057-1-psampat@linux.ibm.com>
References: <20200721153708.89057-1-psampat@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-21_09:2020-07-21,
 2020-07-21 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0
 impostorscore=0 spamscore=0 adultscore=0 mlxscore=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 suspectscore=0 priorityscore=1501
 mlxlogscore=783 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007210110
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

POWER9 onwards the support for the registers HID1, HID4, HID5 has been
receded.
Although mfspr on the above registers worked in Power9, In Power10
simulator is unrecognized. Moving their assignment under the
check for machines lower than Power9

Signed-off-by: Pratik Rajesh Sampat <psampat@linux.ibm.com>
Reviewed-by: Gautham R. Shenoy <ego@linux.vnet.ibm.com>
Reviewed-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/platforms/powernv/idle.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/idle.c b/arch/powerpc/platforms/powernv/idle.c
index 28462d59a8e1..92098d6106be 100644
--- a/arch/powerpc/platforms/powernv/idle.c
+++ b/arch/powerpc/platforms/powernv/idle.c
@@ -73,9 +73,6 @@ static int pnv_save_sprs_for_deep_states(void)
 	 */
 	uint64_t lpcr_val	= mfspr(SPRN_LPCR);
 	uint64_t hid0_val	= mfspr(SPRN_HID0);
-	uint64_t hid1_val	= mfspr(SPRN_HID1);
-	uint64_t hid4_val	= mfspr(SPRN_HID4);
-	uint64_t hid5_val	= mfspr(SPRN_HID5);
 	uint64_t hmeer_val	= mfspr(SPRN_HMEER);
 	uint64_t msr_val = MSR_IDLE;
 	uint64_t psscr_val = pnv_deepest_stop_psscr_val;
@@ -117,6 +114,9 @@ static int pnv_save_sprs_for_deep_states(void)
 
 			/* Only p8 needs to set extra HID regiters */
 			if (!cpu_has_feature(CPU_FTR_ARCH_300)) {
+				uint64_t hid1_val = mfspr(SPRN_HID1);
+				uint64_t hid4_val = mfspr(SPRN_HID4);
+				uint64_t hid5_val = mfspr(SPRN_HID5);
 
 				rc = opal_slw_set_reg(pir, SPRN_HID1, hid1_val);
 				if (rc != 0)
-- 
2.25.4

