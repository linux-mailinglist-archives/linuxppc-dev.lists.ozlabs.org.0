Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 38D5925A497
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Sep 2020 06:34:14 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BhB0g1tR7zDqjX
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Sep 2020 14:34:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ravi.bangoria@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=YoUagbRp; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bh9w00SVbzDqbs
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Sep 2020 14:30:07 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08240iGX133779; Wed, 2 Sep 2020 00:30:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=WueL5bbnAhStAjp91dYVMqaOCtsmfsblMRkQBxibmcs=;
 b=YoUagbRpGI6C36m5v68OKwd+I4QEd8eiHkpFTlDwVLDyrHyYwuN6MoqZebeHAkl/sJ53
 VlVNsYwXcmPBV08UpMxe3d9d83V2OfS8st37tZXQ8+n/r5vL/JqTitqljzn3oVTCszCh
 KsL74MWM0iDJeOyJhROl6AT65D1j+hcl+If5f+zRRcu7KpRQKppc5AjVTHaCefd1tzrT
 njHqkvt3YXbc8r4mVkLgW+d67qOaMiN4uJ+xCXxB9sq3c0Ov31u+8FFHG9Rws5NfCJfL
 CofUa1OJ+MSYyhMZEHMQMvoW/yni8LKQ8O+/gzY7jy9Mrvhgo+aH1W8jbp5z4NVbQBUW bg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 33a160mbtk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Sep 2020 00:30:00 -0400
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 08240iZF133734;
 Wed, 2 Sep 2020 00:30:00 -0400
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0b-001b2d01.pphosted.com with ESMTP id 33a160mbt1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Sep 2020 00:30:00 -0400
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0824QfA5011524;
 Wed, 2 Sep 2020 04:29:58 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma04fra.de.ibm.com with ESMTP id 339ap7rwy1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Sep 2020 04:29:58 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 0824SNwL16515494
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 2 Sep 2020 04:28:23 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B8212A405B;
 Wed,  2 Sep 2020 04:29:54 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1DF68A4054;
 Wed,  2 Sep 2020 04:29:52 +0000 (GMT)
Received: from bangoria.ibmuc.com (unknown [9.199.37.120])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed,  2 Sep 2020 04:29:51 +0000 (GMT)
From: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
To: mpe@ellerman.id.au, christophe.leroy@c-s.fr
Subject: [PATCH v6 1/8] powerpc/watchpoint: Fix quarword instruction handling
 on p10 predecessors
Date: Wed,  2 Sep 2020 09:59:38 +0530
Message-Id: <20200902042945.129369-2-ravi.bangoria@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200902042945.129369-1-ravi.bangoria@linux.ibm.com>
References: <20200902042945.129369-1-ravi.bangoria@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-02_02:2020-09-01,
 2020-09-02 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0
 spamscore=0 malwarescore=0 mlxscore=0 clxscore=1015 mlxlogscore=999
 lowpriorityscore=0 suspectscore=0 priorityscore=1501 adultscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009020031
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
 arch/powerpc/include/asm/hw_breakpoint.h |  1 +
 arch/powerpc/kernel/hw_breakpoint.c      | 12 ++++++++++--
 2 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/include/asm/hw_breakpoint.h b/arch/powerpc/include/asm/hw_breakpoint.h
index db206a7f38e2..9b68eafebf43 100644
--- a/arch/powerpc/include/asm/hw_breakpoint.h
+++ b/arch/powerpc/include/asm/hw_breakpoint.h
@@ -42,6 +42,7 @@ struct arch_hw_breakpoint {
 #else
 #define HW_BREAKPOINT_SIZE  0x8
 #endif
+#define HW_BREAKPOINT_SIZE_QUADWORD	0x10
 
 #define DABR_MAX_LEN	8
 #define DAWR_MAX_LEN	512
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

