Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C4A12C5BED
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Nov 2020 19:22:50 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ChmMW3PfvzDrb6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Nov 2020 05:22:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=dzZ61Og4; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Chm4q3GLyzDrP6
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Nov 2020 05:10:03 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0AQI3B1b092467; Thu, 26 Nov 2020 13:09:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=VQC0Klpd8QXt60r5+gfDgILFzBKwJcdN3RiWMaV3xX4=;
 b=dzZ61Og4yInFqoPARXx+D8L1iQfduLczY7lyCQ92ithQ7VvXmshj0oodyD7eE1527Vrk
 zQiBGSVrZtk2kFptTvdGJlM5O9i9O16/446TjHJG/JWUSF9AELBAx/LnQ7xr6P4dMET/
 P8DPImpqE5tx2PPSbEu1IetN5FqaEUinp07gP6uuPsXHTdevhefVtwwmX/gE4QgFTLXP
 y+yrL6GyOJzrA2d8shcZfibTr0cLtxgQqIvzLTYaRXeaEHw4eU5KLNsy/J5onS5o8DTL
 nNKYN9A7qsoKqjWH9Mf+uLfP5LcqorM62/Thu3y39p/tlJqpHZl/dH9Q4uWdLq0GYA4e KQ== 
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 352b28b15g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 26 Nov 2020 13:09:33 -0500
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0AQI7KOL001269;
 Thu, 26 Nov 2020 18:09:31 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma06ams.nl.ibm.com with ESMTP id 351vqqrxug-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 26 Nov 2020 18:09:31 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 0AQI9T4l61407644
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 26 Nov 2020 18:09:29 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 25157A4062;
 Thu, 26 Nov 2020 18:09:29 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9BC8DA4054;
 Thu, 26 Nov 2020 18:09:26 +0000 (GMT)
Received: from naverao1-tp.ibmuc.com (unknown [9.85.81.45])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 26 Nov 2020 18:09:26 +0000 (GMT)
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
To: Steven Rostedt <rostedt@goodmis.org>, Michael Ellerman <mpe@ellerman.id.au>
Subject: [RFC PATCH 05/14] ftrace: Add architectural helpers for
 [un]register_ftrace_direct()
Date: Thu, 26 Nov 2020 23:38:42 +0530
Message-Id: <cb0a2f7534e5f46e359fa041ead574c562b71c13.1606412433.git.naveen.n.rao@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <cover.1606412433.git.naveen.n.rao@linux.vnet.ibm.com>
References: <cover.1606412433.git.naveen.n.rao@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-26_08:2020-11-26,
 2020-11-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxscore=0
 lowpriorityscore=0 phishscore=0 mlxlogscore=875 priorityscore=1501
 bulkscore=0 impostorscore=0 suspectscore=2 clxscore=1015 adultscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011260112
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Architectures may want to do some validation (such as to ensure that the
trampoline code is reachable from the provided ftrace location) before
accepting ftrace direct registration. Add helpers for the same.

Signed-off-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
---
 include/linux/ftrace.h |  2 ++
 kernel/trace/ftrace.c  | 27 +++++++++++++++++++++------
 2 files changed, 23 insertions(+), 6 deletions(-)

diff --git a/include/linux/ftrace.h b/include/linux/ftrace.h
index 46b4b7ee28c41f..3fdcb4c513bc2d 100644
--- a/include/linux/ftrace.h
+++ b/include/linux/ftrace.h
@@ -290,6 +290,8 @@ int ftrace_modify_direct_caller(struct ftrace_func_entry *entry,
 				unsigned long old_addr,
 				unsigned long new_addr);
 unsigned long ftrace_find_rec_direct(unsigned long ip);
+int arch_register_ftrace_direct(unsigned long ip, unsigned long addr);
+void arch_unregister_ftrace_direct(unsigned long ip, unsigned long addr);
 #else
 # define ftrace_direct_func_count 0
 static inline int register_ftrace_direct(unsigned long ip, unsigned long addr)
diff --git a/kernel/trace/ftrace.c b/kernel/trace/ftrace.c
index 7476f2458b6d95..0e259b90527722 100644
--- a/kernel/trace/ftrace.c
+++ b/kernel/trace/ftrace.c
@@ -5005,6 +5005,13 @@ ftrace_set_addr(struct ftrace_ops *ops, unsigned long ip, int remove,
 }
 
 #ifdef CONFIG_DYNAMIC_FTRACE_WITH_DIRECT_CALLS
+int __weak arch_register_ftrace_direct(unsigned long ip, unsigned long addr)
+{
+	return 0;
+}
+
+void __weak arch_unregister_ftrace_direct(unsigned long ip, unsigned long addr) { }
+
 /**
  * register_ftrace_direct - Call a custom trampoline directly
  * @ip: The address of the nop at the beginning of a function
@@ -5028,6 +5035,7 @@ int register_ftrace_direct(unsigned long ip, unsigned long addr)
 	struct ftrace_hash *free_hash = NULL;
 	struct dyn_ftrace *rec;
 	int ret = -EBUSY;
+	int arch_ret;
 
 	mutex_lock(&direct_mutex);
 
@@ -5082,18 +5090,24 @@ int register_ftrace_direct(unsigned long ip, unsigned long addr)
 	entry->direct = addr;
 	__add_hash_entry(direct_functions, entry);
 
-	ret = ftrace_set_filter_ip(&direct_ops, ip, 0, 0);
+	arch_ret = arch_register_ftrace_direct(ip, addr);
 
-	if (!ret && !(direct_ops.flags & FTRACE_OPS_FL_ENABLED)) {
-		ret = register_ftrace_function(&direct_ops);
-		if (ret)
-			ftrace_set_filter_ip(&direct_ops, ip, 1, 0);
+	if (!arch_ret) {
+		ret = ftrace_set_filter_ip(&direct_ops, ip, 0, 0);
+
+		if (!ret && !(direct_ops.flags & FTRACE_OPS_FL_ENABLED)) {
+			ret = register_ftrace_function(&direct_ops);
+			if (ret)
+				ftrace_set_filter_ip(&direct_ops, ip, 1, 0);
+		}
 	}
 
-	if (ret) {
+	if (arch_ret || ret) {
 		remove_hash_entry(direct_functions, entry);
 		ftrace_direct_func_count--;
 		kfree(entry);
+		if (!arch_ret)
+			arch_unregister_ftrace_direct(ip, addr);
 	}
  out_unlock:
 	mutex_unlock(&direct_mutex);
@@ -5155,6 +5169,7 @@ int unregister_ftrace_direct(unsigned long ip, unsigned long addr)
 	remove_hash_entry(direct_functions, entry);
 	ftrace_direct_func_count--;
 	kfree(entry);
+	arch_unregister_ftrace_direct(ip, addr);
  out_unlock:
 	mutex_unlock(&direct_mutex);
 
-- 
2.25.4

