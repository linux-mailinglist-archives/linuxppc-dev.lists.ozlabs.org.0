Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 416A61CD02F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 May 2020 05:11:49 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49L5ZB0hkGzDqF3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 May 2020 13:11:46 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49L5JV66wlzDqSr
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 May 2020 12:59:54 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 04B2Xfco166375; Sun, 10 May 2020 22:59:46 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30ws475c20-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 10 May 2020 22:59:45 -0400
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 04B2ZpTR173338;
 Sun, 10 May 2020 22:59:45 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30ws475c1c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 10 May 2020 22:59:45 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 04B2tJvV029931;
 Mon, 11 May 2020 02:59:43 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma04ams.nl.ibm.com with ESMTP id 30wm55bfq9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 11 May 2020 02:59:42 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 04B2wTGP61014304
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 11 May 2020 02:58:29 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 232FBAE04D;
 Mon, 11 May 2020 02:59:40 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 87D99AE045;
 Mon, 11 May 2020 02:59:36 +0000 (GMT)
Received: from bangoria.ibmuc.com (unknown [9.199.53.64])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 11 May 2020 02:59:36 +0000 (GMT)
From: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
To: mpe@ellerman.id.au, mikey@neuling.org
Subject: [PATCH v5 05/16] powerpc/watchpoint: Provide DAWR number to set_dawr
Date: Mon, 11 May 2020 08:29:00 +0530
Message-Id: <20200511025911.212827-6-ravi.bangoria@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200511025911.212827-1-ravi.bangoria@linux.ibm.com>
References: <20200511025911.212827-1-ravi.bangoria@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.676
 definitions=2020-05-10_11:2020-05-08,
 2020-05-10 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0
 adultscore=0 mlxscore=0 malwarescore=0 mlxlogscore=999 phishscore=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2005110017
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
Reviewed-by: Michael Neuling <mikey@neuling.org>
---
 arch/powerpc/include/asm/hw_breakpoint.h |  4 ++--
 arch/powerpc/kernel/dawr.c               | 15 ++++++++++-----
 arch/powerpc/kernel/process.c            |  2 +-
 3 files changed, 13 insertions(+), 8 deletions(-)

diff --git a/arch/powerpc/include/asm/hw_breakpoint.h b/arch/powerpc/include/asm/hw_breakpoint.h
index 518b41eef924..5b3b02834e0b 100644
--- a/arch/powerpc/include/asm/hw_breakpoint.h
+++ b/arch/powerpc/include/asm/hw_breakpoint.h
@@ -104,10 +104,10 @@ static inline bool dawr_enabled(void)
 {
 	return dawr_force_enable;
 }
-int set_dawr(struct arch_hw_breakpoint *brk);
+int set_dawr(int nr, struct arch_hw_breakpoint *brk);
 #else
 static inline bool dawr_enabled(void) { return false; }
-static inline int set_dawr(struct arch_hw_breakpoint *brk) { return -1; }
+static inline int set_dawr(int nr, struct arch_hw_breakpoint *brk) { return -1; }
 #endif
 
 #endif	/* __KERNEL__ */
diff --git a/arch/powerpc/kernel/dawr.c b/arch/powerpc/kernel/dawr.c
index e91b613bf137..8114ad3a8574 100644
--- a/arch/powerpc/kernel/dawr.c
+++ b/arch/powerpc/kernel/dawr.c
@@ -16,7 +16,7 @@
 bool dawr_force_enable;
 EXPORT_SYMBOL_GPL(dawr_force_enable);
 
-int set_dawr(struct arch_hw_breakpoint *brk)
+int set_dawr(int nr, struct arch_hw_breakpoint *brk)
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
+	set_dawr(0, info);
 }
 
 static ssize_t dawr_write_file_bool(struct file *file,
@@ -60,7 +65,7 @@ static ssize_t dawr_write_file_bool(struct file *file,
 	/* Send error to user if they hypervisor won't allow us to write DAWR */
 	if (!dawr_force_enable &&
 	    firmware_has_feature(FW_FEATURE_LPAR) &&
-	    set_dawr(&null_brk) != H_SUCCESS)
+	    set_dawr(0, &null_brk) != H_SUCCESS)
 		return -ENODEV;
 
 	rc = debugfs_write_file_bool(file, user_buf, count, ppos);
diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
index 8479c762aef2..7488adf4d61c 100644
--- a/arch/powerpc/kernel/process.c
+++ b/arch/powerpc/kernel/process.c
@@ -806,7 +806,7 @@ void __set_breakpoint(struct arch_hw_breakpoint *brk)
 
 	if (dawr_enabled())
 		// Power8 or later
-		set_dawr(brk);
+		set_dawr(0, brk);
 	else if (IS_ENABLED(CONFIG_PPC_8xx))
 		set_breakpoint_8xx(brk);
 	else if (!cpu_has_feature(CPU_FTR_ARCH_207S))
-- 
2.21.1

