Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BDF03E0FAE
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Aug 2021 09:51:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GgLQv0gdqz3dDm
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Aug 2021 17:51:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=CtS0bbts;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::32c;
 helo=mail-wm1-x32c.google.com; envelope-from=lee.jones@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=CtS0bbts; dkim-atps=neutral
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GgLPw2CXFz3bNk
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Aug 2021 17:50:42 +1000 (AEST)
Received: by mail-wm1-x32c.google.com with SMTP id
 k38-20020a05600c1ca6b029025af5e0f38bso5553223wms.5
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 05 Aug 2021 00:50:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ro7OShpO6RJIHt4cRWAvzM1FfbjLqId3ie3kqum3rr4=;
 b=CtS0bbtslxt846nEMBXk4xi36ElfmECD3LRRTNU8Nc8TAF3XtChgxLxLpQA+vRFumZ
 k58fJAtIsIqJP0eWueItBXopvQubiooWSg0vEC5flvW9MdmU0vQsu1DCrH2DCv125OoK
 8OA8f4RlmvaNGcSxrG8LXOqw1DIpjdvnPMEKgSv4gZh81bk97v0+7ofkRCIh8dbg8SeN
 ZwEiU9R6ywp6kDCpQ5nDKfV1Hi+elZGJ4sLIrgpcmTk/f4Y9/VoPAZbpgBarAwaQuQqQ
 gNZRu5nxcPECD5FIQEYxsYU4R5PMVg/N8qW3l8kav1XyXPlpCJTvfDrWPpwCiK43iIhc
 HvcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ro7OShpO6RJIHt4cRWAvzM1FfbjLqId3ie3kqum3rr4=;
 b=W2syepf3X1NiP/hIxfh22Jl8o4fXRUGkf2EldIfrQE1TkY/2GsibO2lLEawaT5MqEX
 ju+KxcAD7oh9vkj8GFyk1L0OYxzDWjeKdmqYqkcOW68HGz1fDftA58C3jRrooOA5Oebi
 VtEhrr2eEZOGQURQxSf05WYLtVlSjQ4ImFU0fXMKqMfGbtFswdNg0rLvhtogEHgxfBs0
 /FgzxoE2JE4wU9SyFq04xaen8QKUTwIwEWsiFzu80HU5+u5e9HmBwc6pY8L6AI3G9AGT
 Q4S2jR5JVJK4wndjsPBxshEmOCHp1mZeg+JdR01vct2b00IeWE/VDvnGB+QQmqtQuZR7
 mP1g==
X-Gm-Message-State: AOAM530jxnl0bOlCddk+HrMN0qgJwukT2bffdSLpYDRioLBTQl4zFfCp
 IxX+9LlgRxKfN/V8VXeAIWkr6g==
X-Google-Smtp-Source: ABdhPJzjNNL2xPsFzq/3pkdQxAU75H9j2rHkLl0pate4L47soMAxPtQ8xOlYUdKzgy2/jhR+z22Zyw==
X-Received: by 2002:a1c:48d:: with SMTP id 135mr3660203wme.31.1628149837982;
 Thu, 05 Aug 2021 00:50:37 -0700 (PDT)
Received: from localhost.localdomain ([109.180.115.228])
 by smtp.gmail.com with ESMTPSA id h16sm5154491wre.52.2021.08.05.00.50.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Aug 2021 00:50:37 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 1/3] arch: Export machine_restart() instances so they can be
 called from modules
Date: Thu,  5 Aug 2021 08:50:30 +0100
Message-Id: <20210805075032.723037-2-lee.jones@linaro.org>
X-Mailer: git-send-email 2.32.0.605.g8dce9f2422-goog
In-Reply-To: <20210805075032.723037-1-lee.jones@linaro.org>
References: <20210805075032.723037-1-lee.jones@linaro.org>
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
Cc: Rich Felker <dalias@libc.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Sebastian Reichel <sre@kernel.org>,
 "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Guo Ren <guoren@kernel.org>,
 linux-csky@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-hexagon@vger.kernel.org, linux-riscv@lists.infradead.org,
 Will Deacon <will@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Jonas Bonn <jonas@southpole.se>, linux-s390@vger.kernel.org,
 Brian Cain <bcain@codeaurora.org>, Helge Deller <deller@gmx.de>,
 linux-sh@vger.kernel.org, Ley Foon Tan <ley.foon.tan@intel.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, linux-snps-arc@lists.infradead.org,
 Jeff Dike <jdike@addtoit.com>, uclinux-h8-devel@lists.sourceforge.jp,
 linux-xtensa@linux-xtensa.org, Albert Ou <aou@eecs.berkeley.edu>,
 Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 linux-um@lists.infradead.org,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 linux-m68k@lists.linux-m68k.org, openrisc@lists.librecores.org,
 Borislav Petkov <bp@alien8.de>, John Crispin <john@phrozen.org>,
 Stafford Horne <shorne@gmail.com>, linux-arm-kernel@lists.infradead.org,
 Chris Zankel <chris@zankel.net>, Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-mips@vger.kernel.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>, linux-parisc@vger.kernel.org,
 Vineet Gupta <vgupta@synopsys.com>, linux-kernel@vger.kernel.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Richard Weinberger <richard@nod.at>,
 linuxppc-dev@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

A recent attempt to convert the Power Reset Restart driver to tristate
failed because of the following compile error (reported once merged by
Stephen Rothwell via Linux Next):

  ERROR: "machine_restart" [drivers/power/reset/restart-poweroff.ko] undefined!

This error occurs since some of the machine_restart() instances are
not currently exported for use in modules.  This patch aims to rectify
that.

Cc: Vineet Gupta <vgupta@synopsys.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Guo Ren <guoren@kernel.org>
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
Cc: Brian Cain <bcain@codeaurora.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Michal Simek <monstr@monstr.eu>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: John Crispin <john@phrozen.org>
Cc: Ley Foon Tan <ley.foon.tan@intel.com>
Cc: Jonas Bonn <jonas@southpole.se>
Cc: Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>
Cc: Stafford Horne <shorne@gmail.com>
Cc: James E.J. Bottomley <James.Bottomley@HansenPartnership.com>
Cc: Helge Deller <deller@gmx.de>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Paul Walmsley <paul.walmsley@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>
Cc: Heiko Carstens <hca@linux.ibm.com>
Cc: Vasily Gorbik <gor@linux.ibm.com>
Cc: Christian Borntraeger <borntraeger@de.ibm.com>
Cc: Rich Felker <dalias@libc.org>
Cc: David S. Miller <davem@davemloft.net>
Cc: Jeff Dike <jdike@addtoit.com>
Cc: Richard Weinberger <richard@nod.at>
Cc: Anton Ivanov <anton.ivanov@cambridgegreys.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Borislav Petkov <bp@alien8.de>
Cc: Chris Zankel <chris@zankel.net>
Cc: Max Filippov <jcmvbkbc@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Sebastian Reichel <sre@kernel.org>
Cc: linux-snps-arc@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-csky@vger.kernel.org
Cc: uclinux-h8-devel@lists.sourceforge.jp
Cc: linux-hexagon@vger.kernel.org
Cc: linux-m68k@lists.linux-m68k.org
Cc: linux-mips@vger.kernel.org
Cc: openrisc@lists.librecores.org
Cc: linux-parisc@vger.kernel.org
Cc: linuxppc-dev@lists.ozlabs.org
Cc: linux-riscv@lists.infradead.org
Cc: linux-s390@vger.kernel.org
Cc: linux-sh@vger.kernel.org
Cc: sparclinux@vger.kernel.org
Cc: linux-um@lists.infradead.org
Cc: linux-xtensa@linux-xtensa.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---

The 2 patches this change supports have the required Acks already.

NB: If it's safe to omit some of these, let me know and I'll revise the patch.

 arch/arc/kernel/reset.c            | 1 +
 arch/arm/kernel/reboot.c           | 1 +
 arch/arm64/kernel/process.c        | 1 +
 arch/csky/kernel/power.c           | 1 +
 arch/h8300/kernel/process.c        | 1 +
 arch/hexagon/kernel/reset.c        | 1 +
 arch/m68k/kernel/process.c         | 1 +
 arch/microblaze/kernel/reset.c     | 1 +
 arch/mips/kernel/reset.c           | 1 +
 arch/mips/lantiq/falcon/reset.c    | 1 +
 arch/mips/sgi-ip27/ip27-reset.c    | 1 +
 arch/nios2/kernel/process.c        | 1 +
 arch/openrisc/kernel/process.c     | 1 +
 arch/parisc/kernel/process.c       | 1 +
 arch/powerpc/kernel/setup-common.c | 1 +
 arch/riscv/kernel/reset.c          | 1 +
 arch/s390/kernel/setup.c           | 1 +
 arch/sh/kernel/reboot.c            | 1 +
 arch/sparc/kernel/process_32.c     | 1 +
 arch/sparc/kernel/reboot.c         | 1 +
 arch/um/kernel/reboot.c            | 1 +
 arch/x86/kernel/reboot.c           | 1 +
 arch/xtensa/kernel/setup.c         | 1 +
 23 files changed, 23 insertions(+)

diff --git a/arch/arc/kernel/reset.c b/arch/arc/kernel/reset.c
index fd6c3eb930bad..ae4f8a43b0af4 100644
--- a/arch/arc/kernel/reset.c
+++ b/arch/arc/kernel/reset.c
@@ -20,6 +20,7 @@ void machine_restart(char *__unused)
 	pr_info("Put your restart handler here\n");
 	machine_halt();
 }
+EXPORT_SYMBOL(machine_restart);
 
 void machine_power_off(void)
 {
diff --git a/arch/arm/kernel/reboot.c b/arch/arm/kernel/reboot.c
index 0ce388f154226..2878260efd130 100644
--- a/arch/arm/kernel/reboot.c
+++ b/arch/arm/kernel/reboot.c
@@ -150,3 +150,4 @@ void machine_restart(char *cmd)
 	printk("Reboot failed -- System halted\n");
 	while (1);
 }
+EXPORT_SYMBOL(machine_restart);
diff --git a/arch/arm64/kernel/process.c b/arch/arm64/kernel/process.c
index b4bb67f17a2ca..cf89ce91d7145 100644
--- a/arch/arm64/kernel/process.c
+++ b/arch/arm64/kernel/process.c
@@ -212,6 +212,7 @@ void machine_restart(char *cmd)
 	printk("Reboot failed -- System halted\n");
 	while (1);
 }
+EXPORT_SYMBOL(machine_restart);
 
 #define bstr(suffix, str) [PSR_BTYPE_ ## suffix >> PSR_BTYPE_SHIFT] = str
 static const char *const btypes[] = {
diff --git a/arch/csky/kernel/power.c b/arch/csky/kernel/power.c
index 923ee4e381b81..b466c825cbb3c 100644
--- a/arch/csky/kernel/power.c
+++ b/arch/csky/kernel/power.c
@@ -28,3 +28,4 @@ void machine_restart(char *cmd)
 	do_kernel_restart(cmd);
 	asm volatile ("bkpt");
 }
+EXPORT_SYMBOL(machine_restart);
diff --git a/arch/h8300/kernel/process.c b/arch/h8300/kernel/process.c
index 46b1342ce515b..8203ac5cd33ec 100644
--- a/arch/h8300/kernel/process.c
+++ b/arch/h8300/kernel/process.c
@@ -66,6 +66,7 @@ void machine_restart(char *__unused)
 	local_irq_disable();
 	__asm__("jmp @@0");
 }
+EXPORT_SYMBOL(machine_restart);
 
 void machine_halt(void)
 {
diff --git a/arch/hexagon/kernel/reset.c b/arch/hexagon/kernel/reset.c
index da36114d928f0..433378d52063c 100644
--- a/arch/hexagon/kernel/reset.c
+++ b/arch/hexagon/kernel/reset.c
@@ -19,6 +19,7 @@ void machine_halt(void)
 void machine_restart(char *cmd)
 {
 }
+EXPORT_SYMBOL(machine_restart);
 
 void (*pm_power_off)(void) = NULL;
 EXPORT_SYMBOL(pm_power_off);
diff --git a/arch/m68k/kernel/process.c b/arch/m68k/kernel/process.c
index da83cc83e7912..e0264704686e9 100644
--- a/arch/m68k/kernel/process.c
+++ b/arch/m68k/kernel/process.c
@@ -57,6 +57,7 @@ void machine_restart(char * __unused)
 		mach_reset();
 	for (;;);
 }
+EXPORT_SYMBOL(machine_restart);
 
 void machine_halt(void)
 {
diff --git a/arch/microblaze/kernel/reset.c b/arch/microblaze/kernel/reset.c
index 5f4722908164d..902fbe3777846 100644
--- a/arch/microblaze/kernel/reset.c
+++ b/arch/microblaze/kernel/reset.c
@@ -41,3 +41,4 @@ void machine_restart(char *cmd)
 	pr_emerg("Reboot failed -- System halted\n");
 	while (1);
 }
+EXPORT_SYMBOL(machine_restart);
diff --git a/arch/mips/kernel/reset.c b/arch/mips/kernel/reset.c
index 6288780b779e7..2d3193a3cf68b 100644
--- a/arch/mips/kernel/reset.c
+++ b/arch/mips/kernel/reset.c
@@ -99,6 +99,7 @@ void machine_restart(char *command)
 	pr_emerg("Reboot failed -- System halted\n");
 	machine_hang();
 }
+EXPORT_SYMBOL(machine_restart);
 
 void machine_halt(void)
 {
diff --git a/arch/mips/lantiq/falcon/reset.c b/arch/mips/lantiq/falcon/reset.c
index 261996c230cf6..80dd9759ffa55 100644
--- a/arch/mips/lantiq/falcon/reset.c
+++ b/arch/mips/lantiq/falcon/reset.c
@@ -51,6 +51,7 @@ static void machine_restart(char *command)
 		(void *)WDT_REG_BASE);
 	unreachable();
 }
+EXPORT_SYMBOL(machine_restart);
 
 static void machine_halt(void)
 {
diff --git a/arch/mips/sgi-ip27/ip27-reset.c b/arch/mips/sgi-ip27/ip27-reset.c
index 5ac5ad6387343..a3f8f4498b7c5 100644
--- a/arch/mips/sgi-ip27/ip27-reset.c
+++ b/arch/mips/sgi-ip27/ip27-reset.c
@@ -29,6 +29,7 @@
 #include "ip27-common.h"
 
 void machine_restart(char *command) __noreturn;
+EXPORT_SYMBOL(machine_restart);
 void machine_halt(void) __noreturn;
 void machine_power_off(void) __noreturn;
 
diff --git a/arch/nios2/kernel/process.c b/arch/nios2/kernel/process.c
index c5f916ca6845f..6f9459e8ae4ed 100644
--- a/arch/nios2/kernel/process.c
+++ b/arch/nios2/kernel/process.c
@@ -51,6 +51,7 @@ void machine_restart(char *__unused)
 	: "r" (cpuinfo.reset_addr)
 	: "r4");
 }
+EXPORT_SYMBOL(machine_restart);
 
 void machine_halt(void)
 {
diff --git a/arch/openrisc/kernel/process.c b/arch/openrisc/kernel/process.c
index eb62429681fc8..12c3022c46387 100644
--- a/arch/openrisc/kernel/process.c
+++ b/arch/openrisc/kernel/process.c
@@ -61,6 +61,7 @@ void machine_restart(char *cmd)
 	pr_emerg("Reboot failed -- System halted\n");
 	while (1);
 }
+EXPORT_SYMBOL(machine_restart);
 
 /*
  * Similar to machine_power_off, but don't shut off power.  Add code
diff --git a/arch/parisc/kernel/process.c b/arch/parisc/kernel/process.c
index b144fbe29bc16..05e9f03124b64 100644
--- a/arch/parisc/kernel/process.c
+++ b/arch/parisc/kernel/process.c
@@ -96,6 +96,7 @@ void machine_restart(char *cmd)
 	while (1) ;
 
 }
+EXPORT_SYMBOL(machine_restart);
 
 void (*chassis_power_off)(void);
 
diff --git a/arch/powerpc/kernel/setup-common.c b/arch/powerpc/kernel/setup-common.c
index 74a98fff2c2f9..54ebae540dd7d 100644
--- a/arch/powerpc/kernel/setup-common.c
+++ b/arch/powerpc/kernel/setup-common.c
@@ -159,6 +159,7 @@ void machine_restart(char *cmd)
 
 	machine_hang();
 }
+EXPORT_SYMBOL(machine_restart);
 
 void machine_power_off(void)
 {
diff --git a/arch/riscv/kernel/reset.c b/arch/riscv/kernel/reset.c
index ee5878d968cc1..596a36b91eaa2 100644
--- a/arch/riscv/kernel/reset.c
+++ b/arch/riscv/kernel/reset.c
@@ -20,6 +20,7 @@ void machine_restart(char *cmd)
 	do_kernel_restart(cmd);
 	while (1);
 }
+EXPORT_SYMBOL(machine_restart);
 
 void machine_halt(void)
 {
diff --git a/arch/s390/kernel/setup.c b/arch/s390/kernel/setup.c
index 5aab59ad56881..fd2394af0d43a 100644
--- a/arch/s390/kernel/setup.c
+++ b/arch/s390/kernel/setup.c
@@ -276,6 +276,7 @@ void machine_restart(char *command)
 		console_unblank();
 	_machine_restart(command);
 }
+EXPORT_SYMBOL(machine_restart);
 
 void machine_halt(void)
 {
diff --git a/arch/sh/kernel/reboot.c b/arch/sh/kernel/reboot.c
index 5c33f036418be..36b6c61f3b129 100644
--- a/arch/sh/kernel/reboot.c
+++ b/arch/sh/kernel/reboot.c
@@ -83,6 +83,7 @@ void machine_restart(char *cmd)
 {
 	machine_ops.restart(cmd);
 }
+EXPORT_SYMBOL(machine_restart);
 
 void machine_halt(void)
 {
diff --git a/arch/sparc/kernel/process_32.c b/arch/sparc/kernel/process_32.c
index 3b9794978e5bc..30a1674683946 100644
--- a/arch/sparc/kernel/process_32.c
+++ b/arch/sparc/kernel/process_32.c
@@ -104,6 +104,7 @@ void machine_restart(char * cmd)
 	prom_feval ("reset");
 	panic("Reboot failed!");
 }
+EXPORT_SYMBOL(machine_restart);
 
 void machine_power_off(void)
 {
diff --git a/arch/sparc/kernel/reboot.c b/arch/sparc/kernel/reboot.c
index 69c1b6c047d53..53adef425d7de 100644
--- a/arch/sparc/kernel/reboot.c
+++ b/arch/sparc/kernel/reboot.c
@@ -52,4 +52,5 @@ void machine_restart(char *cmd)
 	prom_reboot("");
 	panic("Reboot failed!");
 }
+EXPORT_SYMBOL(machine_restart);
 
diff --git a/arch/um/kernel/reboot.c b/arch/um/kernel/reboot.c
index 48c0610d506e0..4b764311efb89 100644
--- a/arch/um/kernel/reboot.c
+++ b/arch/um/kernel/reboot.c
@@ -47,6 +47,7 @@ void machine_restart(char * __unused)
 	uml_cleanup();
 	reboot_skas();
 }
+EXPORT_SYMBOL(machine_restart);
 
 void machine_power_off(void)
 {
diff --git a/arch/x86/kernel/reboot.c b/arch/x86/kernel/reboot.c
index b29657b76e3fa..b48c30ead7167 100644
--- a/arch/x86/kernel/reboot.c
+++ b/arch/x86/kernel/reboot.c
@@ -733,6 +733,7 @@ static void native_machine_restart(char *__unused)
 		machine_shutdown();
 	__machine_emergency_restart(0);
 }
+EXPORT_SYMBOL(machine_restart);
 
 static void native_machine_halt(void)
 {
diff --git a/arch/xtensa/kernel/setup.c b/arch/xtensa/kernel/setup.c
index ed184106e4cf9..a84cc934300d5 100644
--- a/arch/xtensa/kernel/setup.c
+++ b/arch/xtensa/kernel/setup.c
@@ -564,6 +564,7 @@ void machine_restart(char * cmd)
 {
 	platform_restart();
 }
+EXPORT_SYMBOL(machine_restart);
 
 void machine_halt(void)
 {
-- 
2.32.0.605.g8dce9f2422-goog

