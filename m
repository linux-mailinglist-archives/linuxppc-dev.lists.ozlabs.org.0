Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 779925F066E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Sep 2022 10:30:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mf3Ly1Dqfz3f2r
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Sep 2022 18:30:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=O0AdGHxt;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mf3K91yplz3c2q
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Sep 2022 18:28:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=O0AdGHxt;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Mf3K73YZTz4xGZ;
	Fri, 30 Sep 2022 18:28:27 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1664526507;
	bh=bNInHcguQVUPfj5J1CREi3zqsFusom2kwnM8+PYDMoA=;
	h=From:To:Cc:Subject:Date:From;
	b=O0AdGHxtiHERKhUSYUYqBu8jdEnIfpMtRoeEne7abdwgoSuaiTdbKWCe1uXGC7P6q
	 uR1EB5CqF4O7yCFYNOPfFmoJBMy59rSB585B9n4dpijuHagOxXMLkEfvg+gEtrtZU0
	 RNA4AgK8NDuswDS4J1HBYnpEDQXDQQqa8Pb2V7kWsjkjEuss+wWwZ0jAgFWah0fVIt
	 ZMKF0RVq5RXlR9dFsDZ10vDCW4awsXJNWu0Rdk4QrZyfCwsqX+QmodifeN+pZp/n+e
	 Rw6nblMgtgMcryaq/yL51fEwK6KtcP1hzegDSckhAWPPDchGTHa8lq9/NE9M4uL+a6
	 /k/2KTvBdbDYw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH v3 1/6] powerpc: Add hardware description string
Date: Fri, 30 Sep 2022 18:27:04 +1000
Message-Id: <20220930082709.55830-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.37.3
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
Cc: nathanl@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Create a hardware description string, which we will use to record
various details of the hardware platform we are running on.

Print the accumulated description at boot, and use it to set the generic
description which is printed in oopses.

To begin with add ppc_md.name, aka the "machine description".

Example output at boot with the full series applied:

  Linux version 6.0.0-rc2-gcc-11.1.0-00199-g893f9007a5ce-dirty (michael@alpine1-p1) (powerpc64-linux-gcc (GCC) 11.1.0, GNU ld (GNU Binutils) 2.36.1) #844 SMP Thu Sep 29 22:29:53 AEST 2022
  Hardware name: IBM pSeries (emulated by qemu) POWER9 (raw) 0x4e1200 0xf000005 of:SLOF,git-5b4c5a pSeries
  printk: bootconsole [udbg0] enabled

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/include/asm/setup.h   |  2 ++
 arch/powerpc/kernel/setup-common.c | 19 ++++++++++++++++++-
 2 files changed, 20 insertions(+), 1 deletion(-)

v3: Drop 'machine:' tag for brevity.

diff --git a/arch/powerpc/include/asm/setup.h b/arch/powerpc/include/asm/setup.h
index 85143849a586..e29e83f8a89c 100644
--- a/arch/powerpc/include/asm/setup.h
+++ b/arch/powerpc/include/asm/setup.h
@@ -88,6 +88,8 @@ unsigned long __init prom_init(unsigned long r3, unsigned long r4,
 			       unsigned long pp, unsigned long r6,
 			       unsigned long r7, unsigned long kbase);
 
+extern struct seq_buf ppc_hw_desc;
+
 #endif /* !__ASSEMBLY__ */
 
 #endif	/* _ASM_POWERPC_SETUP_H */
diff --git a/arch/powerpc/kernel/setup-common.c b/arch/powerpc/kernel/setup-common.c
index dd98f43bd685..6d041993a45d 100644
--- a/arch/powerpc/kernel/setup-common.c
+++ b/arch/powerpc/kernel/setup-common.c
@@ -18,6 +18,7 @@
 #include <linux/delay.h>
 #include <linux/initrd.h>
 #include <linux/platform_device.h>
+#include <linux/printk.h>
 #include <linux/seq_file.h>
 #include <linux/ioport.h>
 #include <linux/console.h>
@@ -25,6 +26,7 @@
 #include <linux/root_dev.h>
 #include <linux/cpu.h>
 #include <linux/unistd.h>
+#include <linux/seq_buf.h>
 #include <linux/serial.h>
 #include <linux/serial_8250.h>
 #include <linux/percpu.h>
@@ -588,6 +590,15 @@ static __init int add_pcspkr(void)
 device_initcall(add_pcspkr);
 #endif	/* CONFIG_PCSPKR_PLATFORM */
 
+static char ppc_hw_desc_buf[128] __initdata;
+
+struct seq_buf ppc_hw_desc __initdata = {
+	.buffer = ppc_hw_desc_buf,
+	.size = sizeof(ppc_hw_desc_buf),
+	.len = 0,
+	.readpos = 0,
+};
+
 static __init void probe_machine(void)
 {
 	extern struct machdep_calls __machine_desc_start;
@@ -628,7 +639,13 @@ static __init void probe_machine(void)
 		for (;;);
 	}
 
-	printk(KERN_INFO "Using %s machine description\n", ppc_md.name);
+	// Append the machine name to other info we've gathered
+	seq_buf_puts(&ppc_hw_desc, ppc_md.name);
+
+	// Set the generic hardware description shown in oopses
+	dump_stack_set_arch_desc(ppc_hw_desc.buffer);
+
+	pr_info("Hardware name: %s\n", ppc_hw_desc.buffer);
 }
 
 /* Match a class of boards, not a specific device configuration. */
-- 
2.37.3

