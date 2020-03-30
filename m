Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E489919756E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Mar 2020 09:16:47 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48rP082sq0zDqfB
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Mar 2020 18:16:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ganeshgr@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48rNy15PHXzDqcX
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Mar 2020 18:14:49 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02U73nDr131779
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Mar 2020 03:14:46 -0400
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3022f20wf8-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Mar 2020 03:14:46 -0400
Received: from localhost
 by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <ganeshgr@linux.ibm.com>;
 Mon, 30 Mar 2020 08:14:34 +0100
Received: from b06avi18878370.portsmouth.uk.ibm.com (9.149.26.194)
 by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 30 Mar 2020 08:14:31 +0100
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 02U7EeBb46858570
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 30 Mar 2020 07:14:40 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5753BAE053;
 Mon, 30 Mar 2020 07:14:40 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 44996AE055;
 Mon, 30 Mar 2020 07:14:37 +0000 (GMT)
Received: from localhost.localdomain.com (unknown [9.85.105.175])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 30 Mar 2020 07:14:36 +0000 (GMT)
From: Ganesh Goudar <ganeshgr@linux.ibm.com>
To: mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/mce: Add MCE notification chain
Date: Mon, 30 Mar 2020 12:42:19 +0530
X-Mailer: git-send-email 2.17.2
X-TM-AS-GCONF: 00
x-cbid: 20033007-4275-0000-0000-000003B611B2
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20033007-4276-0000-0000-000038CB5CB2
Message-Id: <20200330071219.12284-1-ganeshgr@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-30_01:2020-03-27,
 2020-03-30 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_spam_definite policy=outbound
 score=100 adultscore=0
 mlxscore=0 priorityscore=1501 bulkscore=0 spamscore=0 suspectscore=0
 mlxlogscore=512 malwarescore=0 impostorscore=0 phishscore=0 clxscore=1015
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2003300062
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
Cc: santosh@fossix.org, mahesh@linux.vnet.ibm.com, npiggin@gmail.com,
 Ganesh Goudar <ganeshgr@linux.ibm.com>, aneesh.kumar@linux.ibm.com,
 arbab@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Santosh S <santosh@fossix.org>

Introduce notification chain which lets know about uncorrected memory
errors(UE). This would help prospective users in pmem or nvdimm subsystem
to track bad blocks for better handling of persistent memory allocations.

Signed-off-by: Santosh S <santosh@fossix.org>
Signed-off-by: Ganesh Goudar <ganeshgr@linux.ibm.com>
---
 arch/powerpc/include/asm/mce.h |  2 ++
 arch/powerpc/kernel/mce.c      | 15 +++++++++++++++
 2 files changed, 17 insertions(+)

diff --git a/arch/powerpc/include/asm/mce.h b/arch/powerpc/include/asm/mce.h
index 6a6ddaabdb34..6e222a94a68a 100644
--- a/arch/powerpc/include/asm/mce.h
+++ b/arch/powerpc/include/asm/mce.h
@@ -218,6 +218,8 @@ extern void machine_check_queue_event(void);
 extern void machine_check_print_event_info(struct machine_check_event *evt,
 					   bool user_mode, bool in_guest);
 unsigned long addr_to_pfn(struct pt_regs *regs, unsigned long addr);
+int mce_register_notifier(struct notifier_block *nb);
+int mce_unregister_notifier(struct notifier_block *nb);
 #ifdef CONFIG_PPC_BOOK3S_64
 void flush_and_reload_slb(void);
 #endif /* CONFIG_PPC_BOOK3S_64 */
diff --git a/arch/powerpc/kernel/mce.c b/arch/powerpc/kernel/mce.c
index 34c1001e9e8b..f50d7f56c02c 100644
--- a/arch/powerpc/kernel/mce.c
+++ b/arch/powerpc/kernel/mce.c
@@ -47,6 +47,20 @@ static struct irq_work mce_ue_event_irq_work = {
 
 DECLARE_WORK(mce_ue_event_work, machine_process_ue_event);
 
+static BLOCKING_NOTIFIER_HEAD(mce_notifier_list);
+
+int mce_register_notifier(struct notifier_block *nb)
+{
+	return blocking_notifier_chain_register(&mce_notifier_list, nb);
+}
+EXPORT_SYMBOL_GPL(mce_register_notifier);
+
+int mce_unregister_notifier(struct notifier_block *nb)
+{
+	return blocking_notifier_chain_unregister(&mce_notifier_list, nb);
+}
+EXPORT_SYMBOL_GPL(mce_unregister_notifier);
+
 static void mce_set_error_info(struct machine_check_event *mce,
 			       struct mce_error_info *mce_err)
 {
@@ -263,6 +277,7 @@ static void machine_process_ue_event(struct work_struct *work)
 	while (__this_cpu_read(mce_ue_count) > 0) {
 		index = __this_cpu_read(mce_ue_count) - 1;
 		evt = this_cpu_ptr(&mce_ue_event_queue[index]);
+		blocking_notifier_call_chain(&mce_notifier_list, 0, evt);
 #ifdef CONFIG_MEMORY_FAILURE
 		/*
 		 * This should probably queued elsewhere, but
-- 
2.17.2

