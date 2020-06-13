Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 82B5F1F802A
	for <lists+linuxppc-dev@lfdr.de>; Sat, 13 Jun 2020 03:16:56 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49kKSP3TY6zDr1g
	for <lists+linuxppc-dev@lfdr.de>; Sat, 13 Jun 2020 11:16:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.151; helo=mga17.intel.com;
 envelope-from=fenghua.yu@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49kJhG1bGHzDqw6
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 13 Jun 2020 10:42:06 +1000 (AEST)
IronPort-SDR: KlkFcr7PAUs7A3RkCtZbPanvXG7kVuVDNcV+C4ckKnIEDgErJyaHdvqEujvDs67RTujZ8Xlf9f
 FVMu6U2T86ow==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2020 17:41:53 -0700
IronPort-SDR: fmiiY19X0mVPhAZTCXrrWpeLLJUOyorevwMoQve0wMIiAHWDFz2n3Eu+8jteSAJwCs62ov0p2h
 I9/9SJi9hUyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,505,1583222400"; d="scan'208";a="261011233"
Received: from romley-ivt3.sc.intel.com ([172.25.110.60])
 by orsmga007.jf.intel.com with ESMTP; 12 Jun 2020 17:41:53 -0700
From: Fenghua Yu <fenghua.yu@intel.com>
To: "Thomas Gleixner" <tglx@linutronix.de>, "Ingo Molnar" <mingo@redhat.com>,
 "Borislav Petkov" <bp@alien8.de>, "H Peter Anvin" <hpa@zytor.com>,
 "David Woodhouse" <dwmw2@infradead.org>,
 "Lu Baolu" <baolu.lu@linux.intel.com>,
 "Frederic Barrat" <fbarrat@linux.ibm.com>,
 "Andrew Donnellan" <ajd@linux.ibm.com>,
 "Felix Kuehling" <Felix.Kuehling@amd.com>,
 "Joerg Roedel" <joro@8bytes.org>, "Dave Hansen" <dave.hansen@intel.com>,
 "Tony Luck" <tony.luck@intel.com>, "Ashok Raj" <ashok.raj@intel.com>,
 "Jacob Jun Pan" <jacob.jun.pan@intel.com>,
 "Dave Jiang" <dave.jiang@intel.com>, "Yu-cheng Yu" <yu-cheng.yu@intel.com>,
 "Sohil Mehta" <sohil.mehta@intel.com>,
 "Ravi V Shankar" <ravi.v.shankar@intel.com>
Subject: [PATCH v2 10/12] x86/process: Clear PASID state for a newly
 forked/cloned thread
Date: Fri, 12 Jun 2020 17:41:31 -0700
Message-Id: <1592008893-9388-11-git-send-email-fenghua.yu@intel.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1592008893-9388-1-git-send-email-fenghua.yu@intel.com>
References: <1592008893-9388-1-git-send-email-fenghua.yu@intel.com>
X-Mailman-Approved-At: Sat, 13 Jun 2020 10:59:17 +1000
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
Cc: Fenghua Yu <fenghua.yu@intel.com>, x86 <x86@kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 amd-gfx <amd-gfx@lists.freedesktop.org>, iommu@lists.linux-foundation.org,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The PASID state has to be cleared on forks, since the child has a
different address space. The PASID is also cleared for thread clone. While
it would be correct to inherit the PASID in this case, it is unknown
whether the new task will use ENQCMD. Giving it the PASID "just in case"
would have the downside of increased context switch overhead to setting
the PASID MSR.

Since #GP faults have to be handled on any threads that were created before
the PASID was assigned to the mm of the process, newly created threads
might as well be treated in a consistent way.

Suggested-by: Thomas Gleixner <tglx@linutronix.de>
Signed-off-by: Fenghua Yu <fenghua.yu@intel.com>
Reviewed-by: Tony Luck <tony.luck@intel.com>
---
v2:
- Modify init_task_pasid().

 arch/x86/kernel/process.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/x86/kernel/process.c b/arch/x86/kernel/process.c
index f362ce0d5ac0..1b1492e337a6 100644
--- a/arch/x86/kernel/process.c
+++ b/arch/x86/kernel/process.c
@@ -121,6 +121,21 @@ static int set_new_tls(struct task_struct *p, unsigned long tls)
 		return do_set_thread_area_64(p, ARCH_SET_FS, tls);
 }
 
+/* Initialize the PASID state for the forked/cloned thread. */
+static void init_task_pasid(struct task_struct *task)
+{
+	struct ia32_pasid_state *ppasid;
+
+	/*
+	 * Initialize the PASID state so that the PASID MSR will be
+	 * initialized to its initial state (0) by XRSTORS when the task is
+	 * scheduled for the first time.
+	 */
+	ppasid = get_xsave_addr(&task->thread.fpu.state.xsave, XFEATURE_PASID);
+	if (ppasid)
+		ppasid->pasid = INIT_PASID;
+}
+
 int copy_thread_tls(unsigned long clone_flags, unsigned long sp,
 		    unsigned long arg, struct task_struct *p, unsigned long tls)
 {
@@ -174,6 +189,9 @@ int copy_thread_tls(unsigned long clone_flags, unsigned long sp,
 	task_user_gs(p) = get_user_gs(current_pt_regs());
 #endif
 
+	if (static_cpu_has(X86_FEATURE_ENQCMD))
+		init_task_pasid(p);
+
 	/* Set a new TLS for the child thread? */
 	if (clone_flags & CLONE_SETTLS)
 		ret = set_new_tls(p, tls);
-- 
2.19.1

