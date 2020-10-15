Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 893BA28F639
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Oct 2020 17:57:10 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CBv6q5RdLzDqc9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Oct 2020 02:57:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=codefail.de (client-ip=198.54.127.72;
 helo=se15-1.privateemail.com; envelope-from=cmr@codefail.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=codefail.de
Received: from se15-1.privateemail.com (se15-1.privateemail.com
 [198.54.127.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CBv556hJtzDqRR
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Oct 2020 02:55:37 +1100 (AEDT)
Received: from new-01-3.privateemail.com ([198.54.122.47])
 by se15.registrar-servers.com with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92)
 (envelope-from <cmr@codefail.de>) id 1kT4iT-0002KG-NV
 for linuxppc-dev@lists.ozlabs.org; Thu, 15 Oct 2020 07:58:58 -0700
Received: from MTA-11.privateemail.com (unknown [10.20.147.23])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by NEW-01-3.privateemail.com (Postfix) with ESMTPS id 6B2F8A73
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Oct 2020 14:58:53 +0000 (UTC)
Received: from mta-11.privateemail.com (localhost [127.0.0.1])
 by mta-11.privateemail.com (Postfix) with ESMTP id 596F98004A
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Oct 2020 10:58:53 -0400 (EDT)
Received: from geist.attlocal.net (unknown [10.20.151.235])
 by mta-11.privateemail.com (Postfix) with ESMTPA id 2D04380041
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Oct 2020 14:58:53 +0000 (UTC)
From: "Christopher M. Riedl" <cmr@codefail.de>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 3/8] powerpc: Mark functions called inside uaccess blocks w/
 'notrace'
Date: Thu, 15 Oct 2020 10:01:54 -0500
Message-Id: <20201015150159.28933-4-cmr@codefail.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201015150159.28933-1-cmr@codefail.de>
References: <20201015150159.28933-1-cmr@codefail.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: ClamAV using ClamSMTP
X-Originating-IP: 198.54.122.47
X-SpamExperts-Domain: o3.privateemail.com
X-SpamExperts-Username: out-03
Authentication-Results: registrar-servers.com;
 auth=pass (plain) smtp.auth=out-03@o3.privateemail.com
X-SpamExperts-Outgoing-Class: ham
X-SpamExperts-Outgoing-Evidence: SB/global_tokens (0.000363830439727)
X-Recommended-Action: accept
X-Filter-ID: Mvzo4OR0dZXEDF/gcnlw0Z1apovzGPsYhEeBL1aoZmqpSDasLI4SayDByyq9LIhVnBwbp0YUhe+O
 2DbR64A3hkTNWdUk1Ol2OGx3IfrIJKywOmJyM1qr8uRnWBrbSAGD34MCL/enst4vEtpA4leDRT1y
 xwOMUv2um0QcmoO8mg24Dcwf+CZK8NXgy3In+fX7koyYQEBsxcRjmyRQyjglYlO05s+oip5EC/YK
 rMQ9+O92RfE6OSObaNx/GIkER/ho6hfscI36S5ZyZNhIm1qgi83+PBTijYijPG8NZSI4ZQ7w5N/o
 jaomCoWWiTtol8oIjMLSPcwmNI0TQjQbbn/msxmYvSRMYhU3cO2EzUHwVXEwQzgH3ZUltkgdVMpa
 zhNDPjwfaB2rE/S2BhQBkwlK0UgKCrov1GasWV1vj2C+0pcXuAT86WptVNwo/cWcelODMVhfRAfm
 ME3CBgei5d0ipUHvm3Pq/TMVhLiLVSlbDnIEsVH1HkXSWW+lJituJnqw31/E3ahF5MMcDI7KdpjQ
 KUg2DwcIutxTdYYuCv7MB8w4iSij0rwbBa82X4V+KdE8ybxQmwA+8NxVIq0MJiSKg9jlDHh8k6TT
 dHl8m1/8O/92QjNLubgZSlcJjVjePeKVE0yhWxRviTEhnM4stux5zhImD2XryHHXvPaqNrPREOWT
 G1bmlWkaJteaOAtonp0aNn3Jb3/JyHGPYOHTI9g2IWZJgVZw2KizLfHKT1Ui9eqnil7sNNnzdI7c
 WFzHzXcM92PNDpgLsd6Ddd/s7VM53ngEDB0hGM25vwdLItd8JHlwRg+9bWPA7CG7LJO22QfG5uwj
 3VKIhMn3+9f/r55/JVIQ7Q4T4FbQa112ynEmNotc9aUV1oY4fX3W5eOCNA39ksRRE30nnfZObe7o
 1mbr5b4m4O41f3i6XB3J2CA/ZpSpytsBXZZv0niRRFlqwL4JNTd9Km+1fuQNFP4CpCvZPbNBqyph
 zXy+6cTE/AxalG8BEiCj5vZGv9mneHqn4w6ZRYMJqVDlz3D3q3rGz4wpqbrr3vieQzASqOF9IoeU
 DZANWzkl2RGDx1/F1uE2HybNOt0p+xrrv5paups8mshKvA==
X-Report-Abuse-To: spam@se5.registrar-servers.com
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Functions called between user_*_access_begin() and user_*_access_end()
should be either inlined or marked 'notrace' to prevent leaving
userspace access exposed. Mark any such functions relevant to signal
handling so that subsequent patches can call them inside uaccess blocks.

Signed-off-by: Christopher M. Riedl <cmr@codefail.de>
---
 arch/powerpc/kernel/process.c | 20 ++++++++++----------
 arch/powerpc/mm/mem.c         |  4 ++--
 2 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
index ba2c987b8403..bf5d9654bd2c 100644
--- a/arch/powerpc/kernel/process.c
+++ b/arch/powerpc/kernel/process.c
@@ -84,7 +84,7 @@ extern unsigned long _get_SP(void);
  */
 bool tm_suspend_disabled __ro_after_init = false;
 
-static void check_if_tm_restore_required(struct task_struct *tsk)
+static void notrace check_if_tm_restore_required(struct task_struct *tsk)
 {
 	/*
 	 * If we are saving the current thread's registers, and the
@@ -151,7 +151,7 @@ void notrace __msr_check_and_clear(unsigned long bits)
 EXPORT_SYMBOL(__msr_check_and_clear);
 
 #ifdef CONFIG_PPC_FPU
-static void __giveup_fpu(struct task_struct *tsk)
+static void notrace __giveup_fpu(struct task_struct *tsk)
 {
 	unsigned long msr;
 
@@ -163,7 +163,7 @@ static void __giveup_fpu(struct task_struct *tsk)
 	tsk->thread.regs->msr = msr;
 }
 
-void giveup_fpu(struct task_struct *tsk)
+void notrace giveup_fpu(struct task_struct *tsk)
 {
 	check_if_tm_restore_required(tsk);
 
@@ -177,7 +177,7 @@ EXPORT_SYMBOL(giveup_fpu);
  * Make sure the floating-point register state in the
  * the thread_struct is up to date for task tsk.
  */
-void flush_fp_to_thread(struct task_struct *tsk)
+void notrace flush_fp_to_thread(struct task_struct *tsk)
 {
 	if (tsk->thread.regs) {
 		/*
@@ -234,7 +234,7 @@ static inline void __giveup_fpu(struct task_struct *tsk) { }
 #endif /* CONFIG_PPC_FPU */
 
 #ifdef CONFIG_ALTIVEC
-static void __giveup_altivec(struct task_struct *tsk)
+static void notrace __giveup_altivec(struct task_struct *tsk)
 {
 	unsigned long msr;
 
@@ -246,7 +246,7 @@ static void __giveup_altivec(struct task_struct *tsk)
 	tsk->thread.regs->msr = msr;
 }
 
-void giveup_altivec(struct task_struct *tsk)
+void notrace giveup_altivec(struct task_struct *tsk)
 {
 	check_if_tm_restore_required(tsk);
 
@@ -285,7 +285,7 @@ EXPORT_SYMBOL(enable_kernel_altivec);
  * Make sure the VMX/Altivec register state in the
  * the thread_struct is up to date for task tsk.
  */
-void flush_altivec_to_thread(struct task_struct *tsk)
+void notrace flush_altivec_to_thread(struct task_struct *tsk)
 {
 	if (tsk->thread.regs) {
 		preempt_disable();
@@ -300,7 +300,7 @@ EXPORT_SYMBOL_GPL(flush_altivec_to_thread);
 #endif /* CONFIG_ALTIVEC */
 
 #ifdef CONFIG_VSX
-static void __giveup_vsx(struct task_struct *tsk)
+static void notrace __giveup_vsx(struct task_struct *tsk)
 {
 	unsigned long msr = tsk->thread.regs->msr;
 
@@ -317,7 +317,7 @@ static void __giveup_vsx(struct task_struct *tsk)
 		__giveup_altivec(tsk);
 }
 
-static void giveup_vsx(struct task_struct *tsk)
+static void notrace giveup_vsx(struct task_struct *tsk)
 {
 	check_if_tm_restore_required(tsk);
 
@@ -352,7 +352,7 @@ void enable_kernel_vsx(void)
 }
 EXPORT_SYMBOL(enable_kernel_vsx);
 
-void flush_vsx_to_thread(struct task_struct *tsk)
+void notrace flush_vsx_to_thread(struct task_struct *tsk)
 {
 	if (tsk->thread.regs) {
 		preempt_disable();
diff --git a/arch/powerpc/mm/mem.c b/arch/powerpc/mm/mem.c
index ddc32cc1b6cf..da2345a2abc6 100644
--- a/arch/powerpc/mm/mem.c
+++ b/arch/powerpc/mm/mem.c
@@ -378,7 +378,7 @@ static inline bool flush_coherent_icache(unsigned long addr)
  * @start: the start address
  * @stop: the stop address (exclusive)
  */
-static void invalidate_icache_range(unsigned long start, unsigned long stop)
+static void notrace invalidate_icache_range(unsigned long start, unsigned long stop)
 {
 	unsigned long shift = l1_icache_shift();
 	unsigned long bytes = l1_icache_bytes();
@@ -402,7 +402,7 @@ static void invalidate_icache_range(unsigned long start, unsigned long stop)
  * @start: the start address
  * @stop: the stop address (exclusive)
  */
-void flush_icache_range(unsigned long start, unsigned long stop)
+void notrace flush_icache_range(unsigned long start, unsigned long stop)
 {
 	if (flush_coherent_icache(start))
 		return;
-- 
2.28.0

