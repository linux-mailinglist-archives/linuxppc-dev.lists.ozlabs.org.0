Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B4A25533D5F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 May 2022 15:10:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L7Wdw11P0z3cjC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 May 2022 23:10:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=YEN4KEns;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=farosas@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=YEN4KEns; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L7Wb411TRz2yWn
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 May 2022 23:08:15 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24PC1Pxg024467;
 Wed, 25 May 2022 13:08:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=j4u10FCt2s6dyFBW4Gj/RFJx4anrZBZGqUPiSW4qhOY=;
 b=YEN4KEnskrGcb51maMtCAiqgPy5qw44OS15Ukxqf5iiyI+p+Kw6qznRO8gf8x3kk46rc
 FP0gh6sht7wjO5Th3JyeUK93vLAxYkvvPo44Gr18L2fKmr3AZzgKpKD4DbLRP23fOrBE
 85RgWybpEvMP9XyojMSIhkqPXL61Udz82f3QuaP2qvCXYAGAQm7NiMFpDmlPP2hMF5LR
 vaphyxelAtmwugmtUb9/ez4bqocE/s4OoOiWKUtbcShxkVErnhWS9D7mKq8YiT1S/4u8
 FNyLNMuCRnIZLmTXxTSWzWwQo1aQg9vLFV3hS8QIlN5eICYscg1yF7l12YThcW6MPPkf IQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3g9h91ckmu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 25 May 2022 13:08:10 +0000
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 24PCfqgv031112;
 Wed, 25 May 2022 13:08:10 GMT
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3g9h91ckmh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 25 May 2022 13:08:10 +0000
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 24PD2S8m008699;
 Wed, 25 May 2022 13:08:09 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma04wdc.us.ibm.com with ESMTP id 3g93uyp4hm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 25 May 2022 13:08:09 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 24PD89Q937355922
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 25 May 2022 13:08:09 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3B554112065;
 Wed, 25 May 2022 13:08:09 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DB2DE112061;
 Wed, 25 May 2022 13:08:07 +0000 (GMT)
Received: from li-4707e44c-227d-11b2-a85c-f336a85283d9.ibm.com.com (unknown
 [9.160.108.97]) by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed, 25 May 2022 13:08:07 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 3/5] KVM: PPC: Book3S HV: Decouple the debug timing from the
 P8 entry path
Date: Wed, 25 May 2022 10:05:52 -0300
Message-Id: <20220525130554.2614394-4-farosas@linux.ibm.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220525130554.2614394-1-farosas@linux.ibm.com>
References: <20220525130554.2614394-1-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: S4WLK-sAdwE-r1Iay444j9MmyfTYtu8w
X-Proofpoint-GUID: rcZ8RUskNkEX2fFSBP_mE13gf4bNNytl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-25_03,2022-05-25_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 suspectscore=0 malwarescore=0
 mlxscore=0 bulkscore=0 mlxlogscore=915 priorityscore=1501 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2204290000
 definitions=main-2205250067
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
Cc: npiggin@gmail.com, kvm-ppc@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

We are currently doing the timing for debug purposes of the P9 entry
path using the accumulators and terminology defined by the old entry
path for P8 machines.

Not only the "real-mode" and "napping" mentions are out of place for
the P9 Radix entry path but also we cannot change them because the
timing code is coupled to the structures defined in struct
kvm_vcpu_arch.

Add a new CONFIG_KVM_BOOK3S_HV_P9_TIMING to enable the timing code for
the P9 entry path. For now, just add the new CONFIG and duplicate the
structures. A subsequent patch will add the P9 changes.

Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
---
 arch/powerpc/include/asm/kvm_host.h   |  8 ++++++++
 arch/powerpc/kvm/Kconfig              | 14 +++++++++++++-
 arch/powerpc/kvm/book3s_hv.c          | 13 +++++++++++--
 arch/powerpc/kvm/book3s_hv_p9_entry.c |  2 +-
 4 files changed, 33 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/include/asm/kvm_host.h b/arch/powerpc/include/asm/kvm_host.h
index faf301d0dec0..37f03665bfa2 100644
--- a/arch/powerpc/include/asm/kvm_host.h
+++ b/arch/powerpc/include/asm/kvm_host.h
@@ -826,11 +826,19 @@ struct kvm_vcpu_arch {
 #ifdef CONFIG_KVM_BOOK3S_HV_EXIT_TIMING
 	struct kvmhv_tb_accumulator *cur_activity;	/* What we're timing */
 	u64	cur_tb_start;			/* when it started */
+#ifdef CONFIG_KVM_BOOK3S_HV_P9_TIMING
 	struct kvmhv_tb_accumulator rm_entry;	/* real-mode entry code */
 	struct kvmhv_tb_accumulator rm_intr;	/* real-mode intr handling */
 	struct kvmhv_tb_accumulator rm_exit;	/* real-mode exit code */
 	struct kvmhv_tb_accumulator guest_time;	/* guest execution */
 	struct kvmhv_tb_accumulator cede_time;	/* time napping inside guest */
+#else
+	struct kvmhv_tb_accumulator rm_entry;	/* real-mode entry code */
+	struct kvmhv_tb_accumulator rm_intr;	/* real-mode intr handling */
+	struct kvmhv_tb_accumulator rm_exit;	/* real-mode exit code */
+	struct kvmhv_tb_accumulator guest_time;	/* guest execution */
+	struct kvmhv_tb_accumulator cede_time;	/* time napping inside guest */
+#endif
 #endif /* CONFIG_KVM_BOOK3S_HV_EXIT_TIMING */
 };
 
diff --git a/arch/powerpc/kvm/Kconfig b/arch/powerpc/kvm/Kconfig
index 73f8277df7d1..191347f44731 100644
--- a/arch/powerpc/kvm/Kconfig
+++ b/arch/powerpc/kvm/Kconfig
@@ -130,10 +130,22 @@ config KVM_BOOK3S_64_PR
 config KVM_BOOK3S_HV_EXIT_TIMING
 	bool
 
+config KVM_BOOK3S_HV_P9_TIMING
+	bool "Detailed timing for the P9 entry point"
+	select KVM_BOOK3S_HV_EXIT_TIMING
+	depends on KVM_BOOK3S_HV_POSSIBLE && DEBUG_FS
+	help
+	  Calculate time taken for each vcpu in various parts of the
+	  code. The total, minimum and maximum times in nanoseconds
+	  together with the number of executions are reported in debugfs in
+	  kvm/vm#/vcpu#/timings.
+
+	  If unsure, say N.
+
 config KVM_BOOK3S_HV_P8_TIMING
 	bool "Detailed timing for hypervisor real-mode code (for POWER8)"
 	select KVM_BOOK3S_HV_EXIT_TIMING
-	depends on KVM_BOOK3S_HV_POSSIBLE && DEBUG_FS
+	depends on KVM_BOOK3S_HV_POSSIBLE && DEBUG_FS && !KVM_BOOK3S_HV_P9_TIMING
 	help
 	  Calculate time taken for each vcpu in the real-mode guest entry,
 	  exit, and interrupt handling code, plus time spent in the guest
diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 6fa518f6501d..69a6b40d58b9 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -2653,11 +2653,19 @@ static struct debugfs_timings_element {
 	const char *name;
 	size_t offset;
 } timings[] = {
+#ifdef CONFIG_KVM_BOOK3S_HV_P9_TIMING
 	{"rm_entry",	offsetof(struct kvm_vcpu, arch.rm_entry)},
 	{"rm_intr",	offsetof(struct kvm_vcpu, arch.rm_intr)},
 	{"rm_exit",	offsetof(struct kvm_vcpu, arch.rm_exit)},
 	{"guest",	offsetof(struct kvm_vcpu, arch.guest_time)},
 	{"cede",	offsetof(struct kvm_vcpu, arch.cede_time)},
+#else
+	{"rm_entry",	offsetof(struct kvm_vcpu, arch.rm_entry)},
+	{"rm_intr",	offsetof(struct kvm_vcpu, arch.rm_intr)},
+	{"rm_exit",	offsetof(struct kvm_vcpu, arch.rm_exit)},
+	{"guest",	offsetof(struct kvm_vcpu, arch.guest_time)},
+	{"cede",	offsetof(struct kvm_vcpu, arch.cede_time)},
+#endif
 };
 
 #define N_TIMINGS	(ARRAY_SIZE(timings))
@@ -2776,8 +2784,9 @@ static const struct file_operations debugfs_timings_ops = {
 /* Create a debugfs directory for the vcpu */
 static int kvmppc_arch_create_vcpu_debugfs_hv(struct kvm_vcpu *vcpu, struct dentry *debugfs_dentry)
 {
-	debugfs_create_file("timings", 0444, debugfs_dentry, vcpu,
-			    &debugfs_timings_ops);
+	if (cpu_has_feature(CPU_FTR_ARCH_300) == IS_ENABLED(CONFIG_KVM_BOOK3S_HV_P9_TIMING))
+		debugfs_create_file("timings", 0444, debugfs_dentry, vcpu,
+				    &debugfs_timings_ops);
 	return 0;
 }
 
diff --git a/arch/powerpc/kvm/book3s_hv_p9_entry.c b/arch/powerpc/kvm/book3s_hv_p9_entry.c
index f7591b6c92d1..f8ce473149b7 100644
--- a/arch/powerpc/kvm/book3s_hv_p9_entry.c
+++ b/arch/powerpc/kvm/book3s_hv_p9_entry.c
@@ -437,7 +437,7 @@ void restore_p9_host_os_sprs(struct kvm_vcpu *vcpu,
 }
 EXPORT_SYMBOL_GPL(restore_p9_host_os_sprs);
 
-#ifdef CONFIG_KVM_BOOK3S_HV_EXIT_TIMING
+#ifdef CONFIG_KVM_BOOK3S_HV_P9_TIMING
 static void __accumulate_time(struct kvm_vcpu *vcpu, struct kvmhv_tb_accumulator *next)
 {
 	struct kvmppc_vcore *vc = vcpu->arch.vcore;
-- 
2.35.1

