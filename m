Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 33CD0DD6DA
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Oct 2019 08:06:22 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46wC8551RqzDq5y
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Oct 2019 17:06:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46wByC5dZzzDqDt
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Oct 2019 16:57:39 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x9J5HkR4016561; Sat, 19 Oct 2019 01:57:34 -0400
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2vqren5kea-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 19 Oct 2019 01:57:34 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x9J5JPZh024610;
 Sat, 19 Oct 2019 05:57:33 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma01dal.us.ibm.com with ESMTP id 2vqt45h6a9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 19 Oct 2019 05:57:33 +0000
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x9J5vWgt52167124
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 19 Oct 2019 05:57:32 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0AB5913604F;
 Sat, 19 Oct 2019 05:57:32 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AE32D13605D;
 Sat, 19 Oct 2019 05:57:31 +0000 (GMT)
Received: from [9.70.82.143] (unknown [9.70.82.143])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP;
 Sat, 19 Oct 2019 05:57:31 +0000 (GMT)
Subject: [RFC PATCH 07/13] powerpc/vas: Update CSB and notify process for
 fault CRBs
From: Haren Myneni <haren@linux.vnet.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 18 Oct 2019 22:57:16 -0700
Message-ID: <1571464636.24387.32.camel@hbabu-laptop>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-10-19_01:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=952 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1910190051
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
Cc: sukadev@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


For each fault CRB, update fault address in CRB (fault_storage_addr)
and translation error status in CSB. If the actual fault is in CSB,
send signal to process with SIGSEGV. Process can send new request by
touching the fault address.

Signed-off-by: Sukadev Bhattiprolu <sukadev@linux.vnet.ibm.com>
Signed-off-by: Haren Myneni <haren@us.ibm.com>
---
 arch/powerpc/platforms/powernv/vas-fault.c | 115 +++++++++++++++++++++++++++++
 arch/powerpc/platforms/powernv/vas.h       |   5 ++
 2 files changed, 120 insertions(+)

diff --git a/arch/powerpc/platforms/powernv/vas-fault.c b/arch/powerpc/platforms/powernv/vas-fault.c
index 02b5c10..7aacce9 100644
--- a/arch/powerpc/platforms/powernv/vas-fault.c
+++ b/arch/powerpc/platforms/powernv/vas-fault.c
@@ -40,6 +40,120 @@ void vas_wakeup_fault_handler(int virq, void *arg)
 }
 
 /*
+ * Check if the fault occurred in the CSB itself. Return true if so, false
+ */
+static bool fault_in_csb(struct coprocessor_request_block *crb)
+{
+	u64 fault_addr, csb_start, csb_end;
+
+	fault_addr = crb_nx_fault_addr(crb);
+	csb_start = crb_csb_addr(crb);
+	csb_end = csb_start + sizeof(struct coprocessor_status_block);
+
+	if (fault_addr >= csb_start && fault_addr < csb_end) {
+		pr_err("CSB Fault: csb start/end 0x%llx/0x%llx, addr 0x%llx\n",
+			csb_start, csb_end, fault_addr);
+		return true;
+	}
+
+	return false;
+}
+
+static void notify_process(pid_t pid, u64 fault_addr)
+{
+	int rc;
+	struct kernel_siginfo info;
+
+	memset(&info, 0, sizeof(info));
+
+	info.si_signo = SIGSEGV;
+	info.si_errno = 0;
+	info.si_code = 0;
+
+	info.si_addr = (void *)fault_addr;
+	rcu_read_lock();
+	rc = kill_pid_info(SIGSEGV, &info, find_vpid(pid));
+	rcu_read_unlock();
+
+	pr_devel("%s(): pid %d kill_proc_info() rc %d\n", __func__, pid, rc);
+}
+
+/*
+ * Update the CSB to indicate a translation error.
+ *
+ * If the fault is in the CSB address itself or if we are unable to
+ * update the CSB, send a signal to the process, because we have no
+ * other way of notifying the user process.
+ *
+ * Remaining settings in the CSB are based on wait_for_csb() of
+ * NX-GZIP.
+*/
+static void update_csb(int pid, struct coprocessor_request_block *crb)
+{
+	int rc;
+	void __user *csb_addr;
+	struct task_struct *tsk;
+	struct coprocessor_status_block csb;
+
+	if (fault_in_csb(crb))
+		goto notify;
+
+	csb_addr = (void *)__be64_to_cpu(crb->csb_addr);
+
+	csb.cc = CSB_CC_TRANSLATION;
+	csb.ce = CSB_CE_TERMINATION;
+	csb.cs = 0;
+	csb.count = 0;
+
+	/*
+	 * Returns the fault address in CPU format since it is passed with
+	 * signal. But if the user space expects BE format, need changes.
+	 * i.e either kernel (here) or user should convert to CPU format.
+	 * Not both!
+	 */
+	csb.address = crb_nx_fault_addr(crb);
+	csb.flags = CSB_V;
+
+	rcu_read_lock();
+	tsk = find_task_by_vpid(pid);
+	if (!tsk) {
+		/*
+		 * vas_win_close() waits for any pending CRBs and pending
+		 * send window credits. In case of this fault CRB, the send
+		 * credit is not yet returned. So we should NOT end up with a
+		 * non-existent task for this fault CRB.
+		 */
+		WARN_ON_ONCE(!tsk);
+		rcu_read_unlock();
+		return;
+	}
+
+	if (tsk->flags & PF_EXITING) {
+		rcu_read_unlock();
+		return;
+	}
+
+	get_task_struct(tsk);
+	rcu_read_unlock();
+
+	use_mm(tsk->mm);
+	rc = copy_to_user(csb_addr, &csb, sizeof(csb));
+	unuse_mm(tsk->mm);
+	put_task_struct(tsk);
+
+	if (rc) {
+		pr_err("CSB: Error updating CSB address 0x%p signalling\n",
+			csb_addr);
+		goto notify;
+	}
+
+	return;
+
+notify:
+	notify_process(pid, crb_nx_fault_addr(crb));
+}
+
+/*
  * Process CRBs that we receive on the fault window.
  */
 static void process_fault_crbs(struct vas_instance *vinst)
@@ -116,6 +230,7 @@ static void process_fault_crbs(struct vas_instance *vinst)
 			return;
 		}
 
+		update_csb(vas_window_pid(window), crb);
 	} while (true);
 }
 
diff --git a/arch/powerpc/platforms/powernv/vas.h b/arch/powerpc/platforms/powernv/vas.h
index eb929c7..be1aefa 100644
--- a/arch/powerpc/platforms/powernv/vas.h
+++ b/arch/powerpc/platforms/powernv/vas.h
@@ -424,6 +424,11 @@ struct vas_winctx {
 extern struct vas_window *vas_pswid_to_window(struct vas_instance *vinst,
 						uint32_t pswid);
 
+static inline int vas_window_pid(struct vas_window *window)
+{
+	return window->pid;
+}
+
 static inline void vas_log_write(struct vas_window *win, char *name,
 			void *regptr, u64 val)
 {
-- 
1.8.3.1



