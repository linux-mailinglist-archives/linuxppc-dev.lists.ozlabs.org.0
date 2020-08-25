Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2773E2510D2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Aug 2020 06:40:30 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BbGWb0LfRzDqM3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Aug 2020 14:40:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ravi.bangoria@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=s08+8sOF; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BbGRD4RnrzDqL2
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Aug 2020 14:36:40 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07P4XGjT112175; Tue, 25 Aug 2020 00:36:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=g8/ESLF6QPK7iC7HMbfZ/nTQORJG2JSioRv2Q4EOBXc=;
 b=s08+8sOFM8gz8EVRy4i5mQw6IMrMpdePBNua8f/qYghPMSW8koWawYg+gkN2DHCxZ2gX
 D+TyUPGcJTsE4JVFPNy/uoI9gIC+YC2lx878GqRsDglhpbSf1bpdrPxvYjIj7AM0J+94
 KbiVasg/J++lKOGgow5YSXiIrOdrPJa2P3SVupEiXR3koHebDdG8MurVJdCg2lCjzA+O
 oOWDkR4ovmM4UhrzBoW5XIljm0VRr7APn0qii/RjDonxSyUX5Wy3oKCajZoB3w3jE89u
 KLAletjOvxqvbcvxEgPhHCWFM/jBJv4yblDAkxhEaTh4F+iL+HF05lr+AyXRswQ+nCvs FA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 334s1ybjgj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 25 Aug 2020 00:36:33 -0400
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 07P4Yje2115479;
 Tue, 25 Aug 2020 00:36:32 -0400
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com with ESMTP id 334s1ybjev-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 25 Aug 2020 00:36:32 -0400
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 07P4WfXH008323;
 Tue, 25 Aug 2020 04:36:30 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma02fra.de.ibm.com with ESMTP id 332ujrsua9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 25 Aug 2020 04:36:29 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 07P4aRxB28246280
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 25 Aug 2020 04:36:27 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EA14DAE051;
 Tue, 25 Aug 2020 04:36:26 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 353A9AE045;
 Tue, 25 Aug 2020 04:36:24 +0000 (GMT)
Received: from bangoria.ibmuc.com (unknown [9.199.33.167])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 25 Aug 2020 04:36:23 +0000 (GMT)
From: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
To: mpe@ellerman.id.au, christophe.leroy@c-s.fr
Subject: [PATCH v5 1/8] powerpc/watchpoint: Fix quarword instruction handling
 on p10 predecessors
Date: Tue, 25 Aug 2020 10:06:10 +0530
Message-Id: <20200825043617.1073634-2-ravi.bangoria@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200825043617.1073634-1-ravi.bangoria@linux.ibm.com>
References: <20200825043617.1073634-1-ravi.bangoria@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-24_12:2020-08-24,
 2020-08-24 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 mlxlogscore=999 suspectscore=0 adultscore=0 bulkscore=0 spamscore=0
 lowpriorityscore=0 phishscore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 mlxscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2006250000 definitions=main-2008250035
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
Cc: ravi.bangoria@linux.ibm.com, mikey@neuling.org, jniethe5@gmail.com,
 pedromfc@linux.ibm.com, linux-kernel@vger.kernel.org, paulus@samba.org,
 rogealve@linux.ibm.com, naveen.n.rao@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On p10 predecessors, watchpoint with quarword access is compared at
quardword length. If the watch range is doubleword or less than that
in a first half of quarword aligned 16 bytes, and if there is any
unaligned quadword access which will access only the 2nd half, the
handler should consider it as extraneous and emulate/single-step it
before continuing.

Reported-by: Pedro Miraglia Franco de Carvalho <pedromfc@linux.ibm.com>
Fixes: 74c6881019b7 ("powerpc/watchpoint: Prepare handler to handle more than one watchpoint")
Signed-off-by: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
---
 arch/powerpc/include/asm/hw_breakpoint.h |  3 ++-
 arch/powerpc/kernel/hw_breakpoint.c      | 12 ++++++++++--
 2 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/include/asm/hw_breakpoint.h b/arch/powerpc/include/asm/hw_breakpoint.h
index db206a7f38e2..da38e05e04d9 100644
--- a/arch/powerpc/include/asm/hw_breakpoint.h
+++ b/arch/powerpc/include/asm/hw_breakpoint.h
@@ -40,7 +40,8 @@ struct arch_hw_breakpoint {
 #ifdef CONFIG_PPC_8xx
 #define HW_BREAKPOINT_SIZE  0x4
 #else
-#define HW_BREAKPOINT_SIZE  0x8
+#define HW_BREAKPOINT_SIZE		0x8
+#define HW_BREAKPOINT_SIZE_QUADWORD	0x10
 #endif
 
 #define DABR_MAX_LEN	8
diff --git a/arch/powerpc/kernel/hw_breakpoint.c b/arch/powerpc/kernel/hw_breakpoint.c
index 1f4a1efa0074..9f7df1c37233 100644
--- a/arch/powerpc/kernel/hw_breakpoint.c
+++ b/arch/powerpc/kernel/hw_breakpoint.c
@@ -520,9 +520,17 @@ static bool ea_hw_range_overlaps(unsigned long ea, int size,
 				 struct arch_hw_breakpoint *info)
 {
 	unsigned long hw_start_addr, hw_end_addr;
+	unsigned long align_size = HW_BREAKPOINT_SIZE;
 
-	hw_start_addr = ALIGN_DOWN(info->address, HW_BREAKPOINT_SIZE);
-	hw_end_addr = ALIGN(info->address + info->len, HW_BREAKPOINT_SIZE);
+	/*
+	 * On p10 predecessors, quadword is handle differently then
+	 * other instructions.
+	 */
+	if (!cpu_has_feature(CPU_FTR_ARCH_31) && size == 16)
+		align_size = HW_BREAKPOINT_SIZE_QUADWORD;
+
+	hw_start_addr = ALIGN_DOWN(info->address, align_size);
+	hw_end_addr = ALIGN(info->address + info->len, align_size);
 
 	return ((ea < hw_end_addr) && (ea + size > hw_start_addr));
 }
-- 
2.26.2

