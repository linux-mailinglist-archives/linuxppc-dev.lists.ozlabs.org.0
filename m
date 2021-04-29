Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 571A636E692
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Apr 2021 10:08:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FW7R22b8wz30C1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Apr 2021 18:07:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=mymJPklf;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=arnd@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=mymJPklf; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FW7Qc06rwz2xgP
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Apr 2021 18:07:36 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 08B9E61446;
 Thu, 29 Apr 2021 08:07:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1619683652;
 bh=2DlbYxunUevwnqh+Ong8MaEHb0LiPaIl1Ok8WmzGuC0=;
 h=From:To:Cc:Subject:Date:From;
 b=mymJPklfL0ZdniTD3N+MWED8nyjPviqzLYjhTAO9CwOtOlMAc5Yikt0vbNuMpsMcq
 JJcLc8HGlhvjlKM94tLwKjShqHZQ+6JgLliD1lz+WxxHaDN1V0m1FTVk0IeMQDJn/O
 f2t0RwiL5h+1KtZy5SB8QFo3zjbTv/SgBa28WbpwaC+drlFM6tXiC5vXASU3qu996F
 VrLQk6nuZMtZMvU95X3Pp3ZqofFnubP+rS1eKkUeqkD8/6iuaCAt+wuohcmb0uk+UA
 plLQVK9tGKsIcd4rtNkQxruxahYKNzyKeGNZI7MmIl7hoWRvduXtaYGv91cmaBf/IW
 rmtY1ZJj8MZAQ==
From: Arnd Bergmann <arnd@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH] powerpc: mark local variables around longjmp as volatile
Date: Thu, 29 Apr 2021 10:06:38 +0200
Message-Id: <20210429080708.1520360-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Ravi Bangoria <ravi.bangoria@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>,
 linux-kernel@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Arnd Bergmann <arnd@arndb.de>

gcc-11 points out that modifying local variables next to a
longjmp/setjmp may cause undefined behavior:

arch/powerpc/kexec/crash.c: In function 'crash_kexec_prepare_cpus.constprop':
arch/powerpc/kexec/crash.c:108:22: error: variable 'ncpus' might be clobbered by 'longjmp' or 'vfork' [-Werror=clobbere
d]
arch/powerpc/kexec/crash.c:109:13: error: variable 'tries' might be clobbered by 'longjmp' or 'vfork' [-Werror=clobbere
d]
arch/powerpc/xmon/xmon.c: In function 'xmon_print_symbol':
arch/powerpc/xmon/xmon.c:3625:21: error: variable 'name' might be clobbered by 'longjmp' or 'vfork' [-Werror=clobbered]
arch/powerpc/xmon/xmon.c: In function 'stop_spus':
arch/powerpc/xmon/xmon.c:4057:13: error: variable 'i' might be clobbered by 'longjmp' or 'vfork' [-Werror=clobbered]
arch/powerpc/xmon/xmon.c: In function 'restart_spus':
arch/powerpc/xmon/xmon.c:4098:13: error: variable 'i' might be clobbered by 'longjmp' or 'vfork' [-Werror=clobbered]
arch/powerpc/xmon/xmon.c: In function 'dump_opal_msglog':
arch/powerpc/xmon/xmon.c:3008:16: error: variable 'pos' might be clobbered by 'longjmp' or 'vfork' [-Werror=clobbered]
arch/powerpc/xmon/xmon.c: In function 'show_pte':
arch/powerpc/xmon/xmon.c:3207:29: error: variable 'tsk' might be clobbered by 'longjmp' or 'vfork' [-Werror=clobbered]
arch/powerpc/xmon/xmon.c: In function 'show_tasks':
arch/powerpc/xmon/xmon.c:3302:29: error: variable 'tsk' might be clobbered by 'longjmp' or 'vfork' [-Werror=clobbered]
arch/powerpc/xmon/xmon.c: In function 'xmon_core':
arch/powerpc/xmon/xmon.c:494:13: error: variable 'cmd' might be clobbered by 'longjmp' or 'vfork' [-Werror=clobbered]
arch/powerpc/xmon/xmon.c:860:21: error: variable 'bp' might be clobbered by 'longjmp' or 'vfork' [-Werror=clobbered]
arch/powerpc/xmon/xmon.c:860:21: error: variable 'bp' might be clobbered by 'longjmp' or 'vfork' [-Werror=clobbered]
arch/powerpc/xmon/xmon.c:492:48: error: argument 'fromipi' might be clobbered by 'longjmp' or 'vfork' [-Werror=clobbered]

According to the documentation, marking these as 'volatile' is
sufficient to avoid the problem, and it shuts up the warning.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/powerpc/kexec/crash.c |  4 ++--
 arch/powerpc/xmon/xmon.c   | 22 +++++++++++-----------
 2 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/arch/powerpc/kexec/crash.c b/arch/powerpc/kexec/crash.c
index 0196d0c211ac..10f997e6bb95 100644
--- a/arch/powerpc/kexec/crash.c
+++ b/arch/powerpc/kexec/crash.c
@@ -105,8 +105,8 @@ void crash_ipi_callback(struct pt_regs *regs)
 static void crash_kexec_prepare_cpus(int cpu)
 {
 	unsigned int msecs;
-	unsigned int ncpus = num_online_cpus() - 1;/* Excluding the panic cpu */
-	int tries = 0;
+	volatile unsigned int ncpus = num_online_cpus() - 1;/* Excluding the panic cpu */
+	volatile int tries = 0;
 	int (*old_handler)(struct pt_regs *regs);
 
 	printk(KERN_EMERG "Sending IPI to other CPUs\n");
diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
index c8173e92f19d..ce0eacf77645 100644
--- a/arch/powerpc/xmon/xmon.c
+++ b/arch/powerpc/xmon/xmon.c
@@ -489,10 +489,10 @@ static void xmon_touch_watchdogs(void)
 	touch_nmi_watchdog();
 }
 
-static int xmon_core(struct pt_regs *regs, int fromipi)
+static int xmon_core(struct pt_regs *regs, volatile int fromipi)
 {
-	int cmd = 0;
-	struct bpt *bp;
+	volatile int cmd = 0;
+	struct bpt *volatile bp;
 	long recurse_jmp[JMP_BUF_LEN];
 	bool locked_down;
 	unsigned long offset;
@@ -857,7 +857,7 @@ static inline void force_enable_xmon(void)
 static struct bpt *at_breakpoint(unsigned long pc)
 {
 	int i;
-	struct bpt *bp;
+	struct bpt *volatile bp;
 
 	bp = bpts;
 	for (i = 0; i < NBPTS; ++i, ++bp)
@@ -3005,7 +3005,7 @@ static void dump_opal_msglog(void)
 {
 	unsigned char buf[128];
 	ssize_t res;
-	loff_t pos = 0;
+	volatile loff_t pos = 0;
 
 	if (!firmware_has_feature(FW_FEATURE_OPAL)) {
 		printf("Machine is not running OPAL firmware.\n");
@@ -3160,7 +3160,7 @@ memzcan(void)
 		printf("%.8lx\n", a - mskip);
 }
 
-static void show_task(struct task_struct *tsk)
+static void show_task(struct task_struct *volatile tsk)
 {
 	char state;
 
@@ -3204,7 +3204,7 @@ static void format_pte(void *ptep, unsigned long pte)
 static void show_pte(unsigned long addr)
 {
 	unsigned long tskv = 0;
-	struct task_struct *tsk = NULL;
+	struct task_struct *volatile tsk = NULL;
 	struct mm_struct *mm;
 	pgd_t *pgdp;
 	p4d_t *p4dp;
@@ -3299,7 +3299,7 @@ static void show_pte(unsigned long addr)
 static void show_tasks(void)
 {
 	unsigned long tskv;
-	struct task_struct *tsk = NULL;
+	struct task_struct *volatile tsk = NULL;
 
 	printf("     task_struct     ->thread.ksp    ->thread.regs    PID   PPID S  P CMD\n");
 
@@ -3622,7 +3622,7 @@ static void xmon_print_symbol(unsigned long address, const char *mid,
 			      const char *after)
 {
 	char *modname;
-	const char *name = NULL;
+	const char *volatile name = NULL;
 	unsigned long offset, size;
 
 	printf(REG, address);
@@ -4054,7 +4054,7 @@ void xmon_register_spus(struct list_head *list)
 static void stop_spus(void)
 {
 	struct spu *spu;
-	int i;
+	volatile int i;
 	u64 tmp;
 
 	for (i = 0; i < XMON_NUM_SPUS; i++) {
@@ -4095,7 +4095,7 @@ static void stop_spus(void)
 static void restart_spus(void)
 {
 	struct spu *spu;
-	int i;
+	volatile int i;
 
 	for (i = 0; i < XMON_NUM_SPUS; i++) {
 		if (!spu_info[i].spu)
-- 
2.29.2

