Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 42C411EDBF0
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Jun 2020 05:50:04 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49csHF3MRqzDqkk
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Jun 2020 13:50:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ravi.bangoria@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49cryl6rTNzDqV5
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Jun 2020 13:35:43 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0543W2Jt023191; Wed, 3 Jun 2020 23:35:34 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31epx7u828-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 03 Jun 2020 23:35:34 -0400
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0543WmSR025666;
 Wed, 3 Jun 2020 23:35:33 -0400
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31epx7u81e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 03 Jun 2020 23:35:33 -0400
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0543W7nR029918;
 Thu, 4 Jun 2020 03:35:30 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma03fra.de.ibm.com with ESMTP id 31bf47bqdp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 04 Jun 2020 03:35:30 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0543ZRP110944528
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 4 Jun 2020 03:35:27 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2D29511C050;
 Thu,  4 Jun 2020 03:35:27 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8D53911C04A;
 Thu,  4 Jun 2020 03:35:23 +0000 (GMT)
Received: from bangoria.ibmuc.com (unknown [9.199.58.254])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu,  4 Jun 2020 03:35:23 +0000 (GMT)
From: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
To: mpe@ellerman.id.au, mikey@neuling.org
Subject: [PATCH v2 6/8] powerpc/watchpoint: Guest support for 2nd DAWR hcall
Date: Thu,  4 Jun 2020 09:04:41 +0530
Message-Id: <20200604033443.70591-7-ravi.bangoria@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200604033443.70591-1-ravi.bangoria@linux.ibm.com>
References: <20200604033443.70591-1-ravi.bangoria@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-03_13:2020-06-02,
 2020-06-03 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0
 mlxlogscore=999 priorityscore=1501 clxscore=1015 adultscore=0 spamscore=0
 bulkscore=0 phishscore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0
 cotscore=-2147483648 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2004280000 definitions=main-2006040017
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
Cc: christophe.leroy@c-s.fr, ravi.bangoria@linux.ibm.com, apopple@linux.ibm.com,
 peterz@infradead.org, fweisbec@gmail.com, oleg@redhat.com, npiggin@gmail.com,
 linux-kernel@vger.kernel.org, paulus@samba.org, jolsa@kernel.org,
 naveen.n.rao@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org,
 mingo@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

2nd DAWR can be set/unset using H_SET_MODE hcall with resource value 5.
Enable powervm guest support with that. This has no effect on kvm guest
because kvm will return error if guest does hcall with resource value 5.

Signed-off-by: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
---
 arch/powerpc/include/asm/hvcall.h         | 1 +
 arch/powerpc/include/asm/machdep.h        | 2 +-
 arch/powerpc/include/asm/plpar_wrappers.h | 5 +++++
 arch/powerpc/kernel/dawr.c                | 2 +-
 arch/powerpc/platforms/pseries/setup.c    | 7 +++++--
 5 files changed, 13 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/include/asm/hvcall.h b/arch/powerpc/include/asm/hvcall.h
index a7f6f1aeda6b..3f170b9496a1 100644
--- a/arch/powerpc/include/asm/hvcall.h
+++ b/arch/powerpc/include/asm/hvcall.h
@@ -357,6 +357,7 @@
 #define H_SET_MODE_RESOURCE_SET_DAWR0		2
 #define H_SET_MODE_RESOURCE_ADDR_TRANS_MODE	3
 #define H_SET_MODE_RESOURCE_LE			4
+#define H_SET_MODE_RESOURCE_SET_DAWR1		5
 
 /* Values for argument to H_SIGNAL_SYS_RESET */
 #define H_SIGNAL_SYS_RESET_ALL			-1
diff --git a/arch/powerpc/include/asm/machdep.h b/arch/powerpc/include/asm/machdep.h
index 7bcb64444a39..a90b892f0bfe 100644
--- a/arch/powerpc/include/asm/machdep.h
+++ b/arch/powerpc/include/asm/machdep.h
@@ -131,7 +131,7 @@ struct machdep_calls {
 				    unsigned long dabrx);
 
 	/* Set DAWR for this platform, leave empty for default implementation */
-	int		(*set_dawr)(unsigned long dawr,
+	int		(*set_dawr)(int nr, unsigned long dawr,
 				    unsigned long dawrx);
 
 #ifdef CONFIG_PPC32	/* XXX for now */
diff --git a/arch/powerpc/include/asm/plpar_wrappers.h b/arch/powerpc/include/asm/plpar_wrappers.h
index 93eb133d572c..d7a1acc83593 100644
--- a/arch/powerpc/include/asm/plpar_wrappers.h
+++ b/arch/powerpc/include/asm/plpar_wrappers.h
@@ -315,6 +315,11 @@ static inline long plpar_set_watchpoint0(unsigned long dawr0, unsigned long dawr
 	return plpar_set_mode(0, H_SET_MODE_RESOURCE_SET_DAWR0, dawr0, dawrx0);
 }
 
+static inline long plpar_set_watchpoint1(unsigned long dawr1, unsigned long dawrx1)
+{
+	return plpar_set_mode(0, H_SET_MODE_RESOURCE_SET_DAWR1, dawr1, dawrx1);
+}
+
 static inline long plpar_signal_sys_reset(long cpu)
 {
 	return plpar_hcall_norets(H_SIGNAL_SYS_RESET, cpu);
diff --git a/arch/powerpc/kernel/dawr.c b/arch/powerpc/kernel/dawr.c
index 500f52fa4711..cdc2dccb987d 100644
--- a/arch/powerpc/kernel/dawr.c
+++ b/arch/powerpc/kernel/dawr.c
@@ -37,7 +37,7 @@ int set_dawr(int nr, struct arch_hw_breakpoint *brk)
 	dawrx |= (mrd & 0x3f) << (63 - 53);
 
 	if (ppc_md.set_dawr)
-		return ppc_md.set_dawr(dawr, dawrx);
+		return ppc_md.set_dawr(nr, dawr, dawrx);
 
 	if (nr == 0) {
 		mtspr(SPRN_DAWR0, dawr);
diff --git a/arch/powerpc/platforms/pseries/setup.c b/arch/powerpc/platforms/pseries/setup.c
index 64d18f4bf093..b001cde1a2d7 100644
--- a/arch/powerpc/platforms/pseries/setup.c
+++ b/arch/powerpc/platforms/pseries/setup.c
@@ -832,12 +832,15 @@ static int pseries_set_xdabr(unsigned long dabr, unsigned long dabrx)
 	return plpar_hcall_norets(H_SET_XDABR, dabr, dabrx);
 }
 
-static int pseries_set_dawr(unsigned long dawr, unsigned long dawrx)
+static int pseries_set_dawr(int nr, unsigned long dawr, unsigned long dawrx)
 {
 	/* PAPR says we can't set HYP */
 	dawrx &= ~DAWRX_HYP;
 
-	return  plpar_set_watchpoint0(dawr, dawrx);
+	if (nr == 0)
+		return plpar_set_watchpoint0(dawr, dawrx);
+	else
+		return plpar_set_watchpoint1(dawr, dawrx);
 }
 
 #define CMO_CHARACTERISTICS_TOKEN 44
-- 
2.26.2

