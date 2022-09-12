Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1888D5B5617
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Sep 2022 10:24:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MR04y6yptz3f4g
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Sep 2022 18:24:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=qBD3GAJi;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sv@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=qBD3GAJi;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MR0152c7tz3c1N
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Sep 2022 18:21:13 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28C7fxwA030053;
	Mon, 12 Sep 2022 08:20:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=WT8Jf7gK3ATSkgS5/8C3DBYFtK1GXvo9OvkQHqs8YrM=;
 b=qBD3GAJiow8tIid7qzD3iskEygI5Y8NlHlYIl0x3gVWoVxfZPC80AIFYw1mVcfVbhr28
 fE1QEE+QuLdGhsKG34Nt12aubVDzDuYTkVmw7cv2PPvMBT9o/mJigVu566ITz6NGmnqC
 aWV4Qy+4DBZu2kfS/oOxipDsYbxjKtUwKt/uD9gmYbnb2xFnwRYOIxn7//I34OIg0Fk8
 agZ4qvRDsdWtudk+BU27hvW7tBsdcbiiWzt1ymvm2PNC28YmrDH+O6CyUj5uaQ/IJVvC
 k52bI27znZs8NN4ZnoHyx8hJhz2ARaDqEqKN+j1xmQMOnJAcXMnI6j2VJqw73mq7kjin ew== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jj0kv92wn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 Sep 2022 08:20:58 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 28C7m5tg021523;
	Mon, 12 Sep 2022 08:20:58 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jj0kv92vf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 Sep 2022 08:20:57 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
	by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 28C86m1m015974;
	Mon, 12 Sep 2022 08:20:55 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
	by ppma03ams.nl.ibm.com with ESMTP id 3jgj79j33b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 Sep 2022 08:20:55 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com [9.149.105.59])
	by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 28C8Kr7U36831540
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 12 Sep 2022 08:20:53 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 29F2CA404D;
	Mon, 12 Sep 2022 08:20:53 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5184EA4040;
	Mon, 12 Sep 2022 08:20:48 +0000 (GMT)
Received: from li-c3569c4c-1ef8-11b2-a85c-ee139cda3133.ibm.com.com (unknown [9.43.91.220])
	by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Mon, 12 Sep 2022 08:20:48 +0000 (GMT)
From: Sathvika Vasireddy <sv@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 04/16] powerpc: Curb objtool unannotated intra-function warnings
Date: Mon, 12 Sep 2022 13:50:08 +0530
Message-Id: <20220912082020.226755-5-sv@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220912082020.226755-1-sv@linux.ibm.com>
References: <20220912082020.226755-1-sv@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 65SP0-IlUANUda7Ylb9Y2O0LDOCBLayb
X-Proofpoint-ORIG-GUID: blCEuajfoLFORYmNUEXu__Z4RFEUWfmE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-12_04,2022-09-09_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 spamscore=0 mlxlogscore=999 mlxscore=0 phishscore=0 impostorscore=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2209120027
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
Cc: peterz@infradead.org, npiggin@gmail.com, linux-kernel@vger.kernel.org, aik@ozlabs.ru, mingo@redhat.com, sv@linux.ibm.com, rostedt@goodmis.org, jpoimboe@redhat.com, naveen.n.rao@linux.vnet.ibm.com, mbenes@suse.cz, chenzhongjin@huawei.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

objtool throws the following unannotated intra-function call warnings:
arch/powerpc/kernel/entry_64.o: warning: objtool: .text+0x4: unannotated intra-function call
arch/powerpc/kvm/book3s_hv_rmhandlers.o: warning: objtool: .text+0xe64: unannotated intra-function call
arch/powerpc/kvm/book3s_hv_rmhandlers.o: warning: objtool: .text+0xee4: unannotated intra-function call

Fix these warnings by annotating intra-function calls, using
ANNOTATE_INTRA_FUNCTION_CALL macro, to indicate that the branch targets
are valid.

Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Signed-off-by: Sathvika Vasireddy <sv@linux.ibm.com>
---
 arch/powerpc/kernel/entry_64.S          | 2 ++
 arch/powerpc/kvm/book3s_hv_rmhandlers.S | 3 +++
 2 files changed, 5 insertions(+)

diff --git a/arch/powerpc/kernel/entry_64.S b/arch/powerpc/kernel/entry_64.S
index 01ace4c56104..fb444bc64f3f 100644
--- a/arch/powerpc/kernel/entry_64.S
+++ b/arch/powerpc/kernel/entry_64.S
@@ -14,6 +14,7 @@
  *  code, and exception/interrupt return code for PowerPC.
  */
 
+#include <linux/objtool.h>
 #include <linux/errno.h>
 #include <linux/err.h>
 #include <asm/cache.h>
@@ -73,6 +74,7 @@ flush_branch_caches:
 
 	// Flush the link stack
 	.rept 64
+	ANNOTATE_INTRA_FUNCTION_CALL
 	bl	.+4
 	.endr
 	b	1f
diff --git a/arch/powerpc/kvm/book3s_hv_rmhandlers.S b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
index bc187bb216ac..20212eb30764 100644
--- a/arch/powerpc/kvm/book3s_hv_rmhandlers.S
+++ b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
@@ -11,6 +11,7 @@
  */
 
 #include <linux/linkage.h>
+#include <linux/objtool.h>
 #include <asm/ppc_asm.h>
 #include <asm/code-patching-asm.h>
 #include <asm/kvm_asm.h>
@@ -1523,12 +1524,14 @@ kvm_flush_link_stack:
 
 	/* Flush the link stack. On Power8 it's up to 32 entries in size. */
 	.rept 32
+	ANNOTATE_INTRA_FUNCTION_CALL
 	bl	.+4
 	.endr
 
 	/* And on Power9 it's up to 64. */
 BEGIN_FTR_SECTION
 	.rept 32
+	ANNOTATE_INTRA_FUNCTION_CALL
 	bl	.+4
 	.endr
 END_FTR_SECTION_IFSET(CPU_FTR_ARCH_300)
-- 
2.31.1

