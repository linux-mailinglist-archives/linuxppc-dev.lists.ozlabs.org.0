Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DE29549865
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jun 2019 06:38:15 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Sb1K2YrbzDqVR
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jun 2019 14:38:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=ravi.bangoria@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45SZnX4CpQzDqWj
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jun 2019 14:28:00 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5I4RG96085328
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jun 2019 00:27:57 -0400
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2t6k5eah26-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jun 2019 00:27:57 -0400
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <ravi.bangoria@linux.ibm.com>;
 Tue, 18 Jun 2019 05:27:55 +0100
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 18 Jun 2019 05:27:52 +0100
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x5I4Rq2u52625532
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 18 Jun 2019 04:27:52 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E86A211C05E;
 Tue, 18 Jun 2019 04:27:51 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4733C11C04A;
 Tue, 18 Jun 2019 04:27:49 +0000 (GMT)
Received: from bangoria.ibmuc.com (unknown [9.199.63.86])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 18 Jun 2019 04:27:49 +0000 (GMT)
From: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH 4/5] Powerpc/hw-breakpoint: Optimize disable path
Date: Tue, 18 Jun 2019 09:57:31 +0530
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190618042732.5582-1-ravi.bangoria@linux.ibm.com>
References: <20190618042732.5582-1-ravi.bangoria@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19061804-0020-0000-0000-0000034AFDFF
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19061804-0021-0000-0000-0000219E4885
Message-Id: <20190618042732.5582-5-ravi.bangoria@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-18_02:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=470 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1906180035
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
Cc: Ravi Bangoria <ravi.bangoria@linux.ibm.com>, mikey@neuling.org,
 linux-kernel@vger.kernel.org, npiggin@gmail.com, paulus@samba.org,
 naveen.n.rao@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Directly setting dawr and dawrx with 0 should be enough to
disable watchpoint. No need to reset individual bits in
variable and then set in hw.

Signed-off-by: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
---
 arch/powerpc/include/asm/hw_breakpoint.h |  3 ++-
 arch/powerpc/kernel/process.c            | 12 ++++++++++++
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/include/asm/hw_breakpoint.h b/arch/powerpc/include/asm/hw_breakpoint.h
index 78202d5fb13a..8acbbdd4a2d5 100644
--- a/arch/powerpc/include/asm/hw_breakpoint.h
+++ b/arch/powerpc/include/asm/hw_breakpoint.h
@@ -19,6 +19,7 @@ struct arch_hw_breakpoint {
 /* Note: Don't change the the first 6 bits below as they are in the same order
  * as the dabr and dabrx.
  */
+#define HW_BRK_TYPE_DISABLE		0x00
 #define HW_BRK_TYPE_READ		0x01
 #define HW_BRK_TYPE_WRITE		0x02
 #define HW_BRK_TYPE_TRANSLATE		0x04
@@ -68,7 +69,7 @@ static inline void hw_breakpoint_disable(void)
 	struct arch_hw_breakpoint brk;
 
 	brk.address = 0;
-	brk.type = 0;
+	brk.type = HW_BRK_TYPE_DISABLE;
 	brk.len = 0;
 	if (ppc_breakpoint_available())
 		__set_breakpoint(&brk);
diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
index f002d2ffff86..265fac9fb3a4 100644
--- a/arch/powerpc/kernel/process.c
+++ b/arch/powerpc/kernel/process.c
@@ -793,10 +793,22 @@ static inline int set_dabr(struct arch_hw_breakpoint *brk)
 	return __set_dabr(dabr, dabrx);
 }
 
+static int disable_dawr(void)
+{
+	if (ppc_md.set_dawr)
+		return ppc_md.set_dawr(0, 0);
+
+	mtspr(SPRN_DAWRX, 0);
+	return 0;
+}
+
 int set_dawr(struct arch_hw_breakpoint *brk)
 {
 	unsigned long dawr, dawrx, mrd;
 
+	if (brk->type == HW_BRK_TYPE_DISABLE)
+		return disable_dawr();
+
 	dawr = brk->address;
 
 	dawrx  = (brk->type & HW_BRK_TYPE_RDWR) << (63 - 58);
-- 
2.20.1

