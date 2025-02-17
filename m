Return-Path: <linuxppc-dev+bounces-6260-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CE459A37DEF
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Feb 2025 10:10:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YxH1n42LGz30KY;
	Mon, 17 Feb 2025 20:10:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=194.107.17.57
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739783437;
	cv=none; b=neZyg3FDd/aA5drKThkGb4EdFZ7a7jMi0IacgsNixfAo3pYa9z0Qz0hb9LIhm6AxKUiOwy9aSH1LM4Z8w2QrXCM6wjBTeM0xYYd/iEjFQCFc0IJ3hvYxtTyDrsgFEHHGGEMNYSx6K2huunsHYWi8DwbgH4LnhAKxFLZ0Kpa8ZqhhpGpDAs3pYqQ8x8uK0K/QaQITnlYrFx6nDLA8EgGYjGCVo27wIwrb9ZLqCFPqhptSLsCOrXPa9R93Zmf4WLXCc0qM2P9Y7PIBkY7McfplBuZApIDKPA7SQTvviERfw54rZJJ4f8KK6uJ2GRzB2HoMNblprhgAo9KPamG7RIf49g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739783437; c=relaxed/relaxed;
	bh=61cJEXuw0GqyMXYQr4L5r4PlnsR/UzeTP0vQjk84U54=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=SQp3rHw36q7YGylRFvezxuw9em48oaBMzQm+N2hduHfSF/I6i5OK9PRfpBDSEWj8Vor60a+X3FsjMASb0uuRhrYGcOEl+15NPEW+AAcHA4XRsCz5tsSybLHvX/5FfTMZeuz8LfrScmSW/sZKrigaLz20HAT0oLBWdEbHpIOde+sR4HGnRIEQW0WX6Vhiw4YM8uYPZEYFW+knF3sP+YeXgjX4iaFTh/Stsz5TLuGbFBAL12sjg5bfHcdElyhylsXRkaTs6wH0bebzv6HO7B+5jOt+SoJczsd/yVb8YgG6zRj9uHsxlLHmJVRafFf1TNDAdus9Fat6R6m4QIZkWQ3ZqQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=strace.io; spf=pass (client-ip=194.107.17.57; helo=vmicros1.altlinux.org; envelope-from=ldv@altlinux.org; receiver=lists.ozlabs.org) smtp.mailfrom=altlinux.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=strace.io
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=altlinux.org (client-ip=194.107.17.57; helo=vmicros1.altlinux.org; envelope-from=ldv@altlinux.org; receiver=lists.ozlabs.org)
Received: from vmicros1.altlinux.org (vmicros1.altlinux.org [194.107.17.57])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YxH1m242Fz307q
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Feb 2025 20:10:36 +1100 (AEDT)
Received: from mua.local.altlinux.org (mua.local.altlinux.org [192.168.1.14])
	by vmicros1.altlinux.org (Postfix) with ESMTP id B62C172C90D;
	Mon, 17 Feb 2025 12:10:34 +0300 (MSK)
Received: by mua.local.altlinux.org (Postfix, from userid 508)
	id A6DB97CCB3A; Mon, 17 Feb 2025 11:10:34 +0200 (IST)
Date: Mon, 17 Feb 2025 11:10:34 +0200
From: "Dmitry V. Levin" <ldv@strace.io>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Oleg Nesterov <oleg@redhat.com>, Alexey Gladkov <legion@kernel.org>,
	Eugene Syromyatnikov <evgsyr@gmail.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Helge Deller <deller@gmx.de>, Mike Frysinger <vapier@gentoo.org>,
	Renzo Davoli <renzo@cs.unibo.it>,
	Davide Berardi <berardi.dav@gmail.com>,
	Vineet Gupta <vgupta@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Brian Cain <bcain@quicinc.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Michal Simek <monstr@monstr.eu>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Dinh Nguyen <dinguyen@kernel.org>, Jonas Bonn <jonas@southpole.se>,
	Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
	Stafford Horne <shorne@gmail.com>,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	"David S. Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>,
	Richard Weinberger <richard@nod.at>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, Chris Zankel <chris@zankel.net>,
	Max Filippov <jcmvbkbc@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
	strace-devel@lists.strace.io, linux-snps-arc@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-hexagon@vger.kernel.org, loongarch@lists.linux.dev,
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
	linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org, linux-um@lists.infradead.org,
	linux-arch@vger.kernel.org
Subject: [PATCH v6 3/6] syscall.h: introduce syscall_set_nr()
Message-ID: <20250217091034.GD18175@strace.io>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250217090834.GA18175@strace.io>
X-Spam-Status: No, score=0.1 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Similar to syscall_set_arguments() that complements
syscall_get_arguments(), introduce syscall_set_nr()
that complements syscall_get_nr().

syscall_set_nr() is going to be needed along with
syscall_set_arguments() on all HAVE_ARCH_TRACEHOOK
architectures to implement PTRACE_SET_SYSCALL_INFO API.

Signed-off-by: Dmitry V. Levin <ldv@strace.io>
Tested-by: Charlie Jenkins <charlie@rivosinc.com>
Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>
Acked-by: Helge Deller <deller@gmx.de> # parisc
---
 arch/arc/include/asm/syscall.h        | 11 +++++++++++
 arch/arm/include/asm/syscall.h        | 24 ++++++++++++++++++++++++
 arch/arm64/include/asm/syscall.h      | 16 ++++++++++++++++
 arch/hexagon/include/asm/syscall.h    |  7 +++++++
 arch/loongarch/include/asm/syscall.h  |  7 +++++++
 arch/m68k/include/asm/syscall.h       |  7 +++++++
 arch/microblaze/include/asm/syscall.h |  7 +++++++
 arch/mips/include/asm/syscall.h       | 14 ++++++++++++++
 arch/nios2/include/asm/syscall.h      |  5 +++++
 arch/openrisc/include/asm/syscall.h   |  6 ++++++
 arch/parisc/include/asm/syscall.h     |  7 +++++++
 arch/powerpc/include/asm/syscall.h    | 10 ++++++++++
 arch/riscv/include/asm/syscall.h      |  7 +++++++
 arch/s390/include/asm/syscall.h       | 12 ++++++++++++
 arch/sh/include/asm/syscall_32.h      | 12 ++++++++++++
 arch/sparc/include/asm/syscall.h      | 12 ++++++++++++
 arch/um/include/asm/syscall-generic.h |  5 +++++
 arch/x86/include/asm/syscall.h        |  7 +++++++
 arch/xtensa/include/asm/syscall.h     |  7 +++++++
 include/asm-generic/syscall.h         | 14 ++++++++++++++
 20 files changed, 197 insertions(+)

diff --git a/arch/arc/include/asm/syscall.h b/arch/arc/include/asm/syscall.h
index 89c1e1736356..728d625a10f1 100644
--- a/arch/arc/include/asm/syscall.h
+++ b/arch/arc/include/asm/syscall.h
@@ -23,6 +23,17 @@ syscall_get_nr(struct task_struct *task, struct pt_regs *regs)
 		return -1;
 }
 
+static inline void
+syscall_set_nr(struct task_struct *task, struct pt_regs *regs, int nr)
+{
+	/*
+	 * Unlike syscall_get_nr(), syscall_set_nr() can be called only when
+	 * the target task is stopped for tracing on entering syscall, so
+	 * there is no need to have the same check syscall_get_nr() has.
+	 */
+	regs->r8 = nr;
+}
+
 static inline void
 syscall_rollback(struct task_struct *task, struct pt_regs *regs)
 {
diff --git a/arch/arm/include/asm/syscall.h b/arch/arm/include/asm/syscall.h
index 21927fa0ae2b..18b102a30741 100644
--- a/arch/arm/include/asm/syscall.h
+++ b/arch/arm/include/asm/syscall.h
@@ -68,6 +68,30 @@ static inline void syscall_set_return_value(struct task_struct *task,
 	regs->ARM_r0 = (long) error ? error : val;
 }
 
+static inline void syscall_set_nr(struct task_struct *task,
+				  struct pt_regs *regs,
+				  int nr)
+{
+	if (nr == -1) {
+		task_thread_info(task)->abi_syscall = -1;
+		/*
+		 * When the syscall number is set to -1, the syscall will be
+		 * skipped.  In this case the syscall return value has to be
+		 * set explicitly, otherwise the first syscall argument is
+		 * returned as the syscall return value.
+		 */
+		syscall_set_return_value(task, regs, -ENOSYS, 0);
+		return;
+	}
+	if ((IS_ENABLED(CONFIG_AEABI) && !IS_ENABLED(CONFIG_OABI_COMPAT))) {
+		task_thread_info(task)->abi_syscall = nr;
+		return;
+	}
+	task_thread_info(task)->abi_syscall =
+		(task_thread_info(task)->abi_syscall & ~__NR_SYSCALL_MASK) |
+		(nr & __NR_SYSCALL_MASK);
+}
+
 #define SYSCALL_MAX_ARGS 7
 
 static inline void syscall_get_arguments(struct task_struct *task,
diff --git a/arch/arm64/include/asm/syscall.h b/arch/arm64/include/asm/syscall.h
index 76020b66286b..712daa90e643 100644
--- a/arch/arm64/include/asm/syscall.h
+++ b/arch/arm64/include/asm/syscall.h
@@ -61,6 +61,22 @@ static inline void syscall_set_return_value(struct task_struct *task,
 	regs->regs[0] = val;
 }
 
+static inline void syscall_set_nr(struct task_struct *task,
+				  struct pt_regs *regs,
+				  int nr)
+{
+	regs->syscallno = nr;
+	if (nr == -1) {
+		/*
+		 * When the syscall number is set to -1, the syscall will be
+		 * skipped.  In this case the syscall return value has to be
+		 * set explicitly, otherwise the first syscall argument is
+		 * returned as the syscall return value.
+		 */
+		syscall_set_return_value(task, regs, -ENOSYS, 0);
+	}
+}
+
 #define SYSCALL_MAX_ARGS 6
 
 static inline void syscall_get_arguments(struct task_struct *task,
diff --git a/arch/hexagon/include/asm/syscall.h b/arch/hexagon/include/asm/syscall.h
index 1024a6548d78..70637261817a 100644
--- a/arch/hexagon/include/asm/syscall.h
+++ b/arch/hexagon/include/asm/syscall.h
@@ -26,6 +26,13 @@ static inline long syscall_get_nr(struct task_struct *task,
 	return regs->r06;
 }
 
+static inline void syscall_set_nr(struct task_struct *task,
+				  struct pt_regs *regs,
+				  int nr)
+{
+	regs->r06 = nr;
+}
+
 static inline void syscall_get_arguments(struct task_struct *task,
 					 struct pt_regs *regs,
 					 unsigned long *args)
diff --git a/arch/loongarch/include/asm/syscall.h b/arch/loongarch/include/asm/syscall.h
index ff415b3c0a8e..81d2733f7b94 100644
--- a/arch/loongarch/include/asm/syscall.h
+++ b/arch/loongarch/include/asm/syscall.h
@@ -26,6 +26,13 @@ static inline long syscall_get_nr(struct task_struct *task,
 	return regs->regs[11];
 }
 
+static inline void syscall_set_nr(struct task_struct *task,
+				  struct pt_regs *regs,
+				  int nr)
+{
+	regs->regs[11] = nr;
+}
+
 static inline void syscall_rollback(struct task_struct *task,
 				    struct pt_regs *regs)
 {
diff --git a/arch/m68k/include/asm/syscall.h b/arch/m68k/include/asm/syscall.h
index d1453e850cdd..bf84b160c2eb 100644
--- a/arch/m68k/include/asm/syscall.h
+++ b/arch/m68k/include/asm/syscall.h
@@ -14,6 +14,13 @@ static inline int syscall_get_nr(struct task_struct *task,
 	return regs->orig_d0;
 }
 
+static inline void syscall_set_nr(struct task_struct *task,
+				  struct pt_regs *regs,
+				  int nr)
+{
+	regs->orig_d0 = nr;
+}
+
 static inline void syscall_rollback(struct task_struct *task,
 				    struct pt_regs *regs)
 {
diff --git a/arch/microblaze/include/asm/syscall.h b/arch/microblaze/include/asm/syscall.h
index 5eb3f624cc59..b5b6b91fae3e 100644
--- a/arch/microblaze/include/asm/syscall.h
+++ b/arch/microblaze/include/asm/syscall.h
@@ -14,6 +14,13 @@ static inline long syscall_get_nr(struct task_struct *task,
 	return regs->r12;
 }
 
+static inline void syscall_set_nr(struct task_struct *task,
+				  struct pt_regs *regs,
+				  int nr)
+{
+	regs->r12 = nr;
+}
+
 static inline void syscall_rollback(struct task_struct *task,
 				    struct pt_regs *regs)
 {
diff --git a/arch/mips/include/asm/syscall.h b/arch/mips/include/asm/syscall.h
index ea050b23d428..b956b015641c 100644
--- a/arch/mips/include/asm/syscall.h
+++ b/arch/mips/include/asm/syscall.h
@@ -41,6 +41,20 @@ static inline long syscall_get_nr(struct task_struct *task,
 	return task_thread_info(task)->syscall;
 }
 
+static inline void syscall_set_nr(struct task_struct *task,
+				  struct pt_regs *regs,
+				  int nr)
+{
+	/*
+	 * New syscall number has to be assigned to regs[2] because
+	 * syscall_trace_entry() loads it from there unconditionally.
+	 *
+	 * Consequently, if the syscall was indirect and nr != __NR_syscall,
+	 * then after this assignment the syscall will cease to be indirect.
+	 */
+	task_thread_info(task)->syscall = regs->regs[2] = nr;
+}
+
 static inline void mips_syscall_update_nr(struct task_struct *task,
 					  struct pt_regs *regs)
 {
diff --git a/arch/nios2/include/asm/syscall.h b/arch/nios2/include/asm/syscall.h
index 526449edd768..8e3eb1d689bb 100644
--- a/arch/nios2/include/asm/syscall.h
+++ b/arch/nios2/include/asm/syscall.h
@@ -15,6 +15,11 @@ static inline int syscall_get_nr(struct task_struct *task, struct pt_regs *regs)
 	return regs->r2;
 }
 
+static inline void syscall_set_nr(struct task_struct *task, struct pt_regs *regs, int nr)
+{
+	regs->r2 = nr;
+}
+
 static inline void syscall_rollback(struct task_struct *task,
 				struct pt_regs *regs)
 {
diff --git a/arch/openrisc/include/asm/syscall.h b/arch/openrisc/include/asm/syscall.h
index e6383be2a195..5e037d9659c5 100644
--- a/arch/openrisc/include/asm/syscall.h
+++ b/arch/openrisc/include/asm/syscall.h
@@ -25,6 +25,12 @@ syscall_get_nr(struct task_struct *task, struct pt_regs *regs)
 	return regs->orig_gpr11;
 }
 
+static inline void
+syscall_set_nr(struct task_struct *task, struct pt_regs *regs, int nr)
+{
+	regs->orig_gpr11 = nr;
+}
+
 static inline void
 syscall_rollback(struct task_struct *task, struct pt_regs *regs)
 {
diff --git a/arch/parisc/include/asm/syscall.h b/arch/parisc/include/asm/syscall.h
index b146d0ae4c77..c11222798ab2 100644
--- a/arch/parisc/include/asm/syscall.h
+++ b/arch/parisc/include/asm/syscall.h
@@ -17,6 +17,13 @@ static inline long syscall_get_nr(struct task_struct *tsk,
 	return regs->gr[20];
 }
 
+static inline void syscall_set_nr(struct task_struct *tsk,
+				  struct pt_regs *regs,
+				  int nr)
+{
+	regs->gr[20] = nr;
+}
+
 static inline void syscall_get_arguments(struct task_struct *tsk,
 					 struct pt_regs *regs,
 					 unsigned long *args)
diff --git a/arch/powerpc/include/asm/syscall.h b/arch/powerpc/include/asm/syscall.h
index 521f279e6b33..7505dcfed247 100644
--- a/arch/powerpc/include/asm/syscall.h
+++ b/arch/powerpc/include/asm/syscall.h
@@ -39,6 +39,16 @@ static inline int syscall_get_nr(struct task_struct *task, struct pt_regs *regs)
 		return -1;
 }
 
+static inline void syscall_set_nr(struct task_struct *task, struct pt_regs *regs, int nr)
+{
+	/*
+	 * Unlike syscall_get_nr(), syscall_set_nr() can be called only when
+	 * the target task is stopped for tracing on entering syscall, so
+	 * there is no need to have the same check syscall_get_nr() has.
+	 */
+	regs->gpr[0] = nr;
+}
+
 static inline void syscall_rollback(struct task_struct *task,
 				    struct pt_regs *regs)
 {
diff --git a/arch/riscv/include/asm/syscall.h b/arch/riscv/include/asm/syscall.h
index 8d389ba995c8..a5281cdf2b10 100644
--- a/arch/riscv/include/asm/syscall.h
+++ b/arch/riscv/include/asm/syscall.h
@@ -30,6 +30,13 @@ static inline int syscall_get_nr(struct task_struct *task,
 	return regs->a7;
 }
 
+static inline void syscall_set_nr(struct task_struct *task,
+				  struct pt_regs *regs,
+				  int nr)
+{
+	regs->a7 = nr;
+}
+
 static inline void syscall_rollback(struct task_struct *task,
 				    struct pt_regs *regs)
 {
diff --git a/arch/s390/include/asm/syscall.h b/arch/s390/include/asm/syscall.h
index 0e3296a32e6a..db6ca55564ff 100644
--- a/arch/s390/include/asm/syscall.h
+++ b/arch/s390/include/asm/syscall.h
@@ -24,6 +24,18 @@ static inline long syscall_get_nr(struct task_struct *task,
 		(regs->int_code & 0xffff) : -1;
 }
 
+static inline void syscall_set_nr(struct task_struct *task,
+				  struct pt_regs *regs,
+				  int nr)
+{
+	/*
+	 * Unlike syscall_get_nr(), syscall_set_nr() can be called only when
+	 * the target task is stopped for tracing on entering syscall, so
+	 * there is no need to have the same check syscall_get_nr() has.
+	 */
+	regs->int_code = (regs->int_code & ~0xffff) | (nr & 0xffff);
+}
+
 static inline void syscall_rollback(struct task_struct *task,
 				    struct pt_regs *regs)
 {
diff --git a/arch/sh/include/asm/syscall_32.h b/arch/sh/include/asm/syscall_32.h
index cb51a7528384..7027d87d901d 100644
--- a/arch/sh/include/asm/syscall_32.h
+++ b/arch/sh/include/asm/syscall_32.h
@@ -15,6 +15,18 @@ static inline long syscall_get_nr(struct task_struct *task,
 	return (regs->tra >= 0) ? regs->regs[3] : -1L;
 }
 
+static inline void syscall_set_nr(struct task_struct *task,
+				  struct pt_regs *regs,
+				  int nr)
+{
+	/*
+	 * Unlike syscall_get_nr(), syscall_set_nr() can be called only when
+	 * the target task is stopped for tracing on entering syscall, so
+	 * there is no need to have the same check syscall_get_nr() has.
+	 */
+	regs->regs[3] = nr;
+}
+
 static inline void syscall_rollback(struct task_struct *task,
 				    struct pt_regs *regs)
 {
diff --git a/arch/sparc/include/asm/syscall.h b/arch/sparc/include/asm/syscall.h
index 62a5a78804c4..b0233924d323 100644
--- a/arch/sparc/include/asm/syscall.h
+++ b/arch/sparc/include/asm/syscall.h
@@ -25,6 +25,18 @@ static inline long syscall_get_nr(struct task_struct *task,
 	return (syscall_p ? regs->u_regs[UREG_G1] : -1L);
 }
 
+static inline void syscall_set_nr(struct task_struct *task,
+				  struct pt_regs *regs,
+				  int nr)
+{
+	/*
+	 * Unlike syscall_get_nr(), syscall_set_nr() can be called only when
+	 * the target task is stopped for tracing on entering syscall, so
+	 * there is no need to have the same check syscall_get_nr() has.
+	 */
+	regs->u_regs[UREG_G1] = nr;
+}
+
 static inline void syscall_rollback(struct task_struct *task,
 				    struct pt_regs *regs)
 {
diff --git a/arch/um/include/asm/syscall-generic.h b/arch/um/include/asm/syscall-generic.h
index 2984feb9d576..bcd73bcfe577 100644
--- a/arch/um/include/asm/syscall-generic.h
+++ b/arch/um/include/asm/syscall-generic.h
@@ -21,6 +21,11 @@ static inline int syscall_get_nr(struct task_struct *task, struct pt_regs *regs)
 	return PT_REGS_SYSCALL_NR(regs);
 }
 
+static inline void syscall_set_nr(struct task_struct *task, struct pt_regs *regs, int nr)
+{
+	PT_REGS_SYSCALL_NR(regs) = nr;
+}
+
 static inline void syscall_rollback(struct task_struct *task,
 				    struct pt_regs *regs)
 {
diff --git a/arch/x86/include/asm/syscall.h b/arch/x86/include/asm/syscall.h
index b9c249dd9e3d..c10dbb74cd00 100644
--- a/arch/x86/include/asm/syscall.h
+++ b/arch/x86/include/asm/syscall.h
@@ -38,6 +38,13 @@ static inline int syscall_get_nr(struct task_struct *task, struct pt_regs *regs)
 	return regs->orig_ax;
 }
 
+static inline void syscall_set_nr(struct task_struct *task,
+				  struct pt_regs *regs,
+				  int nr)
+{
+	regs->orig_ax = nr;
+}
+
 static inline void syscall_rollback(struct task_struct *task,
 				    struct pt_regs *regs)
 {
diff --git a/arch/xtensa/include/asm/syscall.h b/arch/xtensa/include/asm/syscall.h
index f9a671cbf933..7db3b489c8ad 100644
--- a/arch/xtensa/include/asm/syscall.h
+++ b/arch/xtensa/include/asm/syscall.h
@@ -28,6 +28,13 @@ static inline long syscall_get_nr(struct task_struct *task,
 	return regs->syscall;
 }
 
+static inline void syscall_set_nr(struct task_struct *task,
+				  struct pt_regs *regs,
+				  int nr)
+{
+	regs->syscall = nr;
+}
+
 static inline void syscall_rollback(struct task_struct *task,
 				    struct pt_regs *regs)
 {
diff --git a/include/asm-generic/syscall.h b/include/asm-generic/syscall.h
index 292b412f4e9a..c5a3ad53beec 100644
--- a/include/asm-generic/syscall.h
+++ b/include/asm-generic/syscall.h
@@ -37,6 +37,20 @@ struct pt_regs;
  */
 int syscall_get_nr(struct task_struct *task, struct pt_regs *regs);
 
+/**
+ * syscall_set_nr - change the system call a task is executing
+ * @task:	task of interest, must be blocked
+ * @regs:	task_pt_regs() of @task
+ * @nr:		system call number
+ *
+ * Changes the system call number @task is about to execute.
+ *
+ * It's only valid to call this when @task is stopped for tracing on
+ * entry to a system call, due to %SYSCALL_WORK_SYSCALL_TRACE or
+ * %SYSCALL_WORK_SYSCALL_AUDIT.
+ */
+void syscall_set_nr(struct task_struct *task, struct pt_regs *regs, int nr);
+
 /**
  * syscall_rollback - roll back registers after an aborted system call
  * @task:	task of interest, must be in system call exit tracing
-- 
ldv

