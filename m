Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A96F75EF712
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Sep 2022 16:02:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MdZmm3rPkz3c6h
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Sep 2022 00:02:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Ua43jonE;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MdZjk08wQz3bgC
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Sep 2022 23:59:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Ua43jonE;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4MdZjd4CxHz4xG9;
	Thu, 29 Sep 2022 23:59:33 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1664459973;
	bh=u3TXYeQt9rInKhmoH8H+01eCOOlELxmcVZjdu707DoM=;
	h=From:To:Cc:Subject:Date:From;
	b=Ua43jonEC577FJXB9d2Kz4En2qrQHOH1yAxtZzN4JyTWvCQmHGDumFc/yxDE6tu5e
	 QH4NcCR+9ocwH3DYSwAHEacryEl+b8ZQm2njtae4L7pkoex9C6OIDmFM3JyimldYWS
	 J5imYEziNVqm2Cxkqncw2oShXWrzmTNRxL2RUfAjmLuKztgKFXctObi4R8c8xEntGs
	 2D9JP46GQApeevtzdPQlKdFCkuvaGZ4d/H99VB4vV0pvbm63lJgYYVi2RyGmV/HVGz
	 vvzT+/B667KZCfNS5mvRhuUm13O7Kfmvu1eV0639KSYwFiKh5MJ8hYYLxmnBHSn1lZ
	 krK/ni6bQBbEQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH v2 1/6] powerpc: Add hardware description string
Date: Thu, 29 Sep 2022 23:59:14 +1000
Message-Id: <20220929135919.1983269-1-mpe@ellerman.id.au>
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
  Hardware name: model:'IBM pSeries (emulated by qemu)' cpu:'POWER8 (raw)' pvr:0x4d0200 lpvr:0xf000004 of:'SLOF,HEAD' machine:pSeries
  printk: bootconsole [udbg0] enabled

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/include/asm/setup.h   |  2 ++
 arch/powerpc/kernel/setup-common.c | 19 ++++++++++++++++++-
 2 files changed, 20 insertions(+), 1 deletion(-)

v2: Print the string at boot as suggested by Nathan.
    Add some comments, update change log.

diff --git a/arch/powerpc/kernel/setup-common.c b/arch/powerpc/kernel/setup-common.c
index dd98f43bd685..99f1c52a3ca4 100644
--- a/arch/powerpc/kernel/setup-common.c
+++ b/arch/powerpc/kernel/setup-common.c
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
+	seq_buf_printf(&ppc_hw_desc, "machine:%s", ppc_md.name);
+
+	// Set the generic hardware description shown in oopses
+	dump_stack_set_arch_desc(ppc_hw_desc.buffer);
+
+	pr_info("Hardware name: %s\n", ppc_hw_desc.buffer);
 }
 
 /* Match a class of boards, not a specific device configuration. */
-- 
2.37.3

