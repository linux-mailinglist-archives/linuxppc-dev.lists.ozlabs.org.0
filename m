Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 304743E5272
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Aug 2021 06:54:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GkLFn6xWyz30Kh
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Aug 2021 14:54:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=CxTY+x93;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=CxTY+x93; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GkLF5471Cz306m
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Aug 2021 14:53:29 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17A4c5H2091681; Tue, 10 Aug 2021 00:53:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=CHNfh++tx+l5Y7r/lyyaYIVPTVOYZKUFM3NMMF2YYt0=;
 b=CxTY+x93yGr3uNno/qFzxq9CsAM87osy10tHgfDyXpqSVIpKo5pMKUT1lZZun1Be16+Y
 IcuY90IGE60guR/J4PTc2lTlQQC7xL4j+SvOWfumrL7YrbochXyT75rgIEp3vUp6dRWf
 d5ZlD3H5+X3I0MoojtkqtN+HxrpClWFZ2aPYSZauXIIPMEg9H7oSJ66hW0hEX6qPOtJg
 cU8qfU2oRAtVAT37Fgk0s1leXdz7VfUFGhfrJCAQGLylol8IzXo6aM1Oy/hPKNAWBKhH
 C/IcG9W1d/t35nRzG22NbiMbdUodv4YUA5iZXevfc2OzXp0YNAW5Y+7A6SFBV06jcsA5 YQ== 
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3abg7kas72-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 10 Aug 2021 00:53:19 -0400
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 17A4hZbw006482;
 Tue, 10 Aug 2021 04:53:18 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma01wdc.us.ibm.com with ESMTP id 3a9htbg9sf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 10 Aug 2021 04:53:18 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 17A4rINo38732168
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 10 Aug 2021 04:53:18 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1E26128058;
 Tue, 10 Aug 2021 04:53:18 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 997832805E;
 Tue, 10 Aug 2021 04:53:16 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.199.41.101])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue, 10 Aug 2021 04:53:16 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH] powerpc/book3s64/radix: make tlb_single_page_flush_ceiling a
 debugfs entry
Date: Tue, 10 Aug 2021 10:23:07 +0530
Message-Id: <20210810045307.11892-1-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 3Z86PQ1akAPa8RT6o10mkgfNySV5bvUM
X-Proofpoint-ORIG-GUID: 3Z86PQ1akAPa8RT6o10mkgfNySV5bvUM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-10_01:2021-08-06,
 2021-08-10 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0
 bulkscore=0 lowpriorityscore=0 mlxlogscore=999 adultscore=0 phishscore=0
 priorityscore=1501 spamscore=0 mlxscore=0 impostorscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108100028
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Similar to x86/s390 add a debugfs file to tune tlb_single_page_flush_ceiling.

Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 arch/powerpc/mm/book3s64/radix_tlb.c | 48 ++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/arch/powerpc/mm/book3s64/radix_tlb.c b/arch/powerpc/mm/book3s64/radix_tlb.c
index aefc100d79a7..5cca0fe130e7 100644
--- a/arch/powerpc/mm/book3s64/radix_tlb.c
+++ b/arch/powerpc/mm/book3s64/radix_tlb.c
@@ -17,6 +17,7 @@
 #include <asm/trace.h>
 #include <asm/cputhreads.h>
 #include <asm/plpar_wrappers.h>
+#include <asm/debugfs.h>
 
 #include "internal.h"
 
@@ -1524,3 +1525,50 @@ void do_h_rpt_invalidate_prt(unsigned long pid, unsigned long lpid,
 EXPORT_SYMBOL_GPL(do_h_rpt_invalidate_prt);
 
 #endif /* CONFIG_KVM_BOOK3S_HV_POSSIBLE */
+
+static ssize_t tlbflush_read_file(struct file *file, char __user *user_buf,
+			     size_t count, loff_t *ppos)
+{
+	char buf[32];
+	unsigned int len;
+
+	len = sprintf(buf, "%ld\n", tlb_single_page_flush_ceiling);
+	return simple_read_from_buffer(user_buf, count, ppos, buf, len);
+}
+
+static ssize_t tlbflush_write_file(struct file *file,
+		 const char __user *user_buf, size_t count, loff_t *ppos)
+{
+	char buf[32];
+	ssize_t len;
+	int ceiling;
+
+	len = min(count, sizeof(buf) - 1);
+	if (copy_from_user(buf, user_buf, len))
+		return -EFAULT;
+
+	buf[len] = '\0';
+	if (kstrtoint(buf, 0, &ceiling))
+		return -EINVAL;
+
+	if (ceiling < 0)
+		return -EINVAL;
+
+	tlb_single_page_flush_ceiling = ceiling;
+	return count;
+}
+
+static const struct file_operations fops_tlbflush = {
+	.read = tlbflush_read_file,
+	.write = tlbflush_write_file,
+	.llseek = default_llseek,
+};
+
+static int __init create_tlb_single_page_flush_ceiling(void)
+{
+	debugfs_create_file("tlb_single_page_flush_ceiling", S_IRUSR | S_IWUSR,
+			    powerpc_debugfs_root, NULL, &fops_tlbflush);
+	return 0;
+}
+late_initcall(create_tlb_single_page_flush_ceiling);
+
-- 
2.31.1

