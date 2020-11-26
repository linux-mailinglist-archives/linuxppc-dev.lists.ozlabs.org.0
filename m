Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A63BA2C5BDC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Nov 2020 19:20:59 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ChmKP0mP0zDrBv
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Nov 2020 05:20:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=AlJYElTY; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Chm4q4h3WzDrP9
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Nov 2020 05:10:03 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0AQI1OV3167315; Thu, 26 Nov 2020 13:09:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=7xzheff7J6FbU85vG1c/J+U9BDwWcFK58Qr0rGq75X8=;
 b=AlJYElTYBuNghqMj3n0cVVSvrn6DwRsyppsuMYDL9gdXxlOG1wscqzWv8ZJoVEfcnt32
 2umqKXD9a+Npa/KFW9Nnmvfl+G/l3niap1GEX6GuIN/jlUQEgi33rzrRsEIGSXJsfeqM
 v9gLEW90x75JCwVTwpoEbpR8WwG31o8UfwYLoN9q3WK1GW8GM1FMxyCvwSG0xAaK7pDj
 yPM3w5dslViNF/kmjFPLMYzLuh4DgI6B8YbNf/UZ/UWnN1E5AWRtwBIHNhtNqcEDzDiH
 qV2USBQKGSJuGMaCbqKIW1vwRbJ7nkXAk/TXytpSrMX9YdzWeLcJXuplaAHqazWITOqg tw== 
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0b-001b2d01.pphosted.com with ESMTP id 352gs7gtmy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 26 Nov 2020 13:09:29 -0500
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0AQI7SkX001305;
 Thu, 26 Nov 2020 18:09:28 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma06ams.nl.ibm.com with ESMTP id 351vqqrxue-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 26 Nov 2020 18:09:28 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0AQI9Pl611010658
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 26 Nov 2020 18:09:26 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D5FF1A405C;
 Thu, 26 Nov 2020 18:09:25 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C7B80A405B;
 Thu, 26 Nov 2020 18:09:23 +0000 (GMT)
Received: from naverao1-tp.ibmuc.com (unknown [9.85.81.45])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 26 Nov 2020 18:09:23 +0000 (GMT)
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
To: Steven Rostedt <rostedt@goodmis.org>, Michael Ellerman <mpe@ellerman.id.au>
Subject: [RFC PATCH 04/14] ftrace: Remove ftrace_find_direct_func()
Date: Thu, 26 Nov 2020 23:38:41 +0530
Message-Id: <a5801f46f1ef1f291249b8c924adf6822c8e7e50.1606412433.git.naveen.n.rao@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <cover.1606412433.git.naveen.n.rao@linux.vnet.ibm.com>
References: <cover.1606412433.git.naveen.n.rao@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-26_06:2020-11-26,
 2020-11-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0
 mlxscore=0 spamscore=0 suspectscore=2 clxscore=1015 phishscore=0
 malwarescore=0 priorityscore=1501 mlxlogscore=999 lowpriorityscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011260108
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

This is a revert of commit 013bf0da047481 ("ftrace: Add
ftrace_find_direct_func()")

ftrace_find_direct_func() was meant for use in the function graph tracer
by architecture specific code. However, commit ff205766dbbee0 ("ftrace:
Fix function_graph tracer interaction with BPF trampoline") disabled
function graph tracer for direct calls leaving this without any users.

In addition, modify_ftrace_direct() allowed redirecting the direct call
to a different trampoline that was never registered through
register_ftrace_direct(). This meant that ftrace_direct_funcs didn't
capture all trampolines.

Signed-off-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
---
 include/linux/ftrace.h |  5 ---
 kernel/trace/ftrace.c  | 84 ++----------------------------------------
 2 files changed, 4 insertions(+), 85 deletions(-)

diff --git a/include/linux/ftrace.h b/include/linux/ftrace.h
index 1bd3a0356ae478..46b4b7ee28c41f 100644
--- a/include/linux/ftrace.h
+++ b/include/linux/ftrace.h
@@ -285,7 +285,6 @@ extern int ftrace_direct_func_count;
 int register_ftrace_direct(unsigned long ip, unsigned long addr);
 int unregister_ftrace_direct(unsigned long ip, unsigned long addr);
 int modify_ftrace_direct(unsigned long ip, unsigned long old_addr, unsigned long new_addr);
-struct ftrace_direct_func *ftrace_find_direct_func(unsigned long addr);
 int ftrace_modify_direct_caller(struct ftrace_func_entry *entry,
 				struct dyn_ftrace *rec,
 				unsigned long old_addr,
@@ -306,10 +305,6 @@ static inline int modify_ftrace_direct(unsigned long ip,
 {
 	return -ENOTSUPP;
 }
-static inline struct ftrace_direct_func *ftrace_find_direct_func(unsigned long addr)
-{
-	return NULL;
-}
 static inline int ftrace_modify_direct_caller(struct ftrace_func_entry *entry,
 					      struct dyn_ftrace *rec,
 					      unsigned long old_addr,
diff --git a/kernel/trace/ftrace.c b/kernel/trace/ftrace.c
index 3844a4a1346a9c..7476f2458b6d95 100644
--- a/kernel/trace/ftrace.c
+++ b/kernel/trace/ftrace.c
@@ -5005,46 +5005,6 @@ ftrace_set_addr(struct ftrace_ops *ops, unsigned long ip, int remove,
 }
 
 #ifdef CONFIG_DYNAMIC_FTRACE_WITH_DIRECT_CALLS
-
-struct ftrace_direct_func {
-	struct list_head	next;
-	unsigned long		addr;
-	int			count;
-};
-
-static LIST_HEAD(ftrace_direct_funcs);
-
-/**
- * ftrace_find_direct_func - test an address if it is a registered direct caller
- * @addr: The address of a registered direct caller
- *
- * This searches to see if a ftrace direct caller has been registered
- * at a specific address, and if so, it returns a descriptor for it.
- *
- * This can be used by architecture code to see if an address is
- * a direct caller (trampoline) attached to a fentry/mcount location.
- * This is useful for the function_graph tracer, as it may need to
- * do adjustments if it traced a location that also has a direct
- * trampoline attached to it.
- */
-struct ftrace_direct_func *ftrace_find_direct_func(unsigned long addr)
-{
-	struct ftrace_direct_func *entry;
-	bool found = false;
-
-	/* May be called by fgraph trampoline (protected by rcu tasks) */
-	list_for_each_entry_rcu(entry, &ftrace_direct_funcs, next) {
-		if (entry->addr == addr) {
-			found = true;
-			break;
-		}
-	}
-	if (found)
-		return entry;
-
-	return NULL;
-}
-
 /**
  * register_ftrace_direct - Call a custom trampoline directly
  * @ip: The address of the nop at the beginning of a function
@@ -5064,7 +5024,6 @@ struct ftrace_direct_func *ftrace_find_direct_func(unsigned long addr)
  */
 int register_ftrace_direct(unsigned long ip, unsigned long addr)
 {
-	struct ftrace_direct_func *direct;
 	struct ftrace_func_entry *entry;
 	struct ftrace_hash *free_hash = NULL;
 	struct dyn_ftrace *rec;
@@ -5118,19 +5077,7 @@ int register_ftrace_direct(unsigned long ip, unsigned long addr)
 	if (!entry)
 		goto out_unlock;
 
-	direct = ftrace_find_direct_func(addr);
-	if (!direct) {
-		direct = kmalloc(sizeof(*direct), GFP_KERNEL);
-		if (!direct) {
-			kfree(entry);
-			goto out_unlock;
-		}
-		direct->addr = addr;
-		direct->count = 0;
-		list_add_rcu(&direct->next, &ftrace_direct_funcs);
-		ftrace_direct_func_count++;
-	}
-
+	ftrace_direct_func_count++;
 	entry->ip = ip;
 	entry->direct = addr;
 	__add_hash_entry(direct_functions, entry);
@@ -5145,18 +5092,8 @@ int register_ftrace_direct(unsigned long ip, unsigned long addr)
 
 	if (ret) {
 		remove_hash_entry(direct_functions, entry);
+		ftrace_direct_func_count--;
 		kfree(entry);
-		if (!direct->count) {
-			list_del_rcu(&direct->next);
-			synchronize_rcu_tasks();
-			kfree(direct);
-			if (free_hash)
-				free_ftrace_hash(free_hash);
-			free_hash = NULL;
-			ftrace_direct_func_count--;
-		}
-	} else {
-		direct->count++;
 	}
  out_unlock:
 	mutex_unlock(&direct_mutex);
@@ -5199,7 +5136,6 @@ static struct ftrace_func_entry *find_direct_entry(unsigned long *ip,
 
 int unregister_ftrace_direct(unsigned long ip, unsigned long addr)
 {
-	struct ftrace_direct_func *direct;
 	struct ftrace_func_entry *entry;
 	int ret = -ENODEV;
 
@@ -5217,20 +5153,8 @@ int unregister_ftrace_direct(unsigned long ip, unsigned long addr)
 	WARN_ON(ret);
 
 	remove_hash_entry(direct_functions, entry);
-
-	direct = ftrace_find_direct_func(addr);
-	if (!WARN_ON(!direct)) {
-		/* This is the good path (see the ! before WARN) */
-		direct->count--;
-		WARN_ON(direct->count < 0);
-		if (!direct->count) {
-			list_del_rcu(&direct->next);
-			synchronize_rcu_tasks();
-			kfree(direct);
-			kfree(entry);
-			ftrace_direct_func_count--;
-		}
-	}
+	ftrace_direct_func_count--;
+	kfree(entry);
  out_unlock:
 	mutex_unlock(&direct_mutex);
 
-- 
2.25.4

