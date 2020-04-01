Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6868019A54C
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Apr 2020 08:26:22 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48sbn61NTVzDqQK
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Apr 2020 17:26:18 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48sbW90S0DzDr15
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Apr 2020 17:14:12 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03163ST1018278
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 1 Apr 2020 02:14:11 -0400
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30227wrkgv-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 01 Apr 2020 02:14:10 -0400
Received: from localhost
 by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <ravi.bangoria@linux.ibm.com>;
 Wed, 1 Apr 2020 07:13:54 +0100
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
 by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 1 Apr 2020 07:13:49 +0100
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0316E1Mc60489818
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 1 Apr 2020 06:14:01 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D719AA4040;
 Wed,  1 Apr 2020 06:14:01 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7BD15A4055;
 Wed,  1 Apr 2020 06:13:58 +0000 (GMT)
Received: from bangoria.ibmuc.com (unknown [9.199.48.114])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed,  1 Apr 2020 06:13:58 +0000 (GMT)
From: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
To: mpe@ellerman.id.au, mikey@neuling.org
Subject: [PATCH v2 05/16] powerpc/watchpoint: Provide DAWR number to set_dawr
Date: Wed,  1 Apr 2020 11:42:58 +0530
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200401061309.92442-1-ravi.bangoria@linux.ibm.com>
References: <20200401061309.92442-1-ravi.bangoria@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 20040106-4275-0000-0000-000003B769C1
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20040106-4276-0000-0000-000038CCBB6F
Message-Id: <20200401061309.92442-6-ravi.bangoria@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-03-31_07:2020-03-31,
 2020-03-31 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 mlxscore=0 bulkscore=0
 impostorscore=0 spamscore=0 suspectscore=0 mlxlogscore=844
 lowpriorityscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2003020000 definitions=main-2004010054
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
Cc: apopple@linux.ibm.com, ravi.bangoria@linux.ibm.com, peterz@infradead.org,
 fweisbec@gmail.com, oleg@redhat.com, npiggin@gmail.com,
 linux-kernel@vger.kernel.org, paulus@samba.org, jolsa@kernel.org,
 naveen.n.rao@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org,
 mingo@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Introduce new parameter 'nr' to set_dawr() which indicates which DAWR
should be programed.

Signed-off-by: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
---
 arch/powerpc/include/asm/hw_breakpoint.h |  4 ++--
 arch/powerpc/kernel/dawr.c               | 15 ++++++++++-----
 arch/powerpc/kernel/process.c            |  2 +-
 3 files changed, 13 insertions(+), 8 deletions(-)

diff --git a/arch/powerpc/include/asm/hw_breakpoint.h b/arch/powerpc/include/asm/hw_breakpoint.h
index 518b41eef924..62549007c87a 100644
--- a/arch/powerpc/include/asm/hw_breakpoint.h
+++ b/arch/powerpc/include/asm/hw_breakpoint.h
@@ -104,10 +104,10 @@ static inline bool dawr_enabled(void)
 {
 	return dawr_force_enable;
 }
-int set_dawr(struct arch_hw_breakpoint *brk);
+int set_dawr(struct arch_hw_breakpoint *brk, int nr);
 #else
 static inline bool dawr_enabled(void) { return false; }
-static inline int set_dawr(struct arch_hw_breakpoint *brk) { return -1; }
+static inline int set_dawr(struct arch_hw_breakpoint *brk, int nr) { return -1; }
 #endif
 
 #endif	/* __KERNEL__ */
diff --git a/arch/powerpc/kernel/dawr.c b/arch/powerpc/kernel/dawr.c
index e91b613bf137..311e51ee09f4 100644
--- a/arch/powerpc/kernel/dawr.c
+++ b/arch/powerpc/kernel/dawr.c
@@ -16,7 +16,7 @@
 bool dawr_force_enable;
 EXPORT_SYMBOL_GPL(dawr_force_enable);
 
-int set_dawr(struct arch_hw_breakpoint *brk)
+int set_dawr(struct arch_hw_breakpoint *brk, int nr)
 {
 	unsigned long dawr, dawrx, mrd;
 
@@ -39,15 +39,20 @@ int set_dawr(struct arch_hw_breakpoint *brk)
 	if (ppc_md.set_dawr)
 		return ppc_md.set_dawr(dawr, dawrx);
 
-	mtspr(SPRN_DAWR0, dawr);
-	mtspr(SPRN_DAWRX0, dawrx);
+	if (nr == 0) {
+		mtspr(SPRN_DAWR0, dawr);
+		mtspr(SPRN_DAWRX0, dawrx);
+	} else {
+		mtspr(SPRN_DAWR1, dawr);
+		mtspr(SPRN_DAWRX1, dawrx);
+	}
 
 	return 0;
 }
 
 static void set_dawr_cb(void *info)
 {
-	set_dawr(info);
+	set_dawr(info, 0);
 }
 
 static ssize_t dawr_write_file_bool(struct file *file,
@@ -60,7 +65,7 @@ static ssize_t dawr_write_file_bool(struct file *file,
 	/* Send error to user if they hypervisor won't allow us to write DAWR */
 	if (!dawr_force_enable &&
 	    firmware_has_feature(FW_FEATURE_LPAR) &&
-	    set_dawr(&null_brk) != H_SUCCESS)
+	    set_dawr(&null_brk, 0) != H_SUCCESS)
 		return -ENODEV;
 
 	rc = debugfs_write_file_bool(file, user_buf, count, ppos);
diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
index 110db94cdf3c..b548a584e465 100644
--- a/arch/powerpc/kernel/process.c
+++ b/arch/powerpc/kernel/process.c
@@ -799,7 +799,7 @@ void __set_breakpoint(struct arch_hw_breakpoint *brk)
 
 	if (dawr_enabled())
 		// Power8 or later
-		set_dawr(brk);
+		set_dawr(brk, 0);
 	else if (IS_ENABLED(CONFIG_PPC_8xx))
 		set_breakpoint_8xx(brk);
 	else if (!cpu_has_feature(CPU_FTR_ARCH_207S))
-- 
2.21.1

