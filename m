Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 30D003CBF13
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Jul 2021 00:12:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GRQTX13ypz303h
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Jul 2021 08:12:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=iK9mLkNC;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::22e;
 helo=mail-oi1-x22e.google.com; envelope-from=groeck7@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=iK9mLkNC; dkim-atps=neutral
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com
 [IPv6:2607:f8b0:4864:20::22e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GRQT252gPz2yLm
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Jul 2021 08:12:05 +1000 (AEST)
Received: by mail-oi1-x22e.google.com with SMTP id t143so12639026oie.8
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Jul 2021 15:12:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uhc96iDfUismyOsdoxs7/ERFXZzsM2MwVzkn+Ev/tXE=;
 b=iK9mLkNC2bmrCqXsxiHy+mjJxxav4jcOkbCCUMqpHaT41aqOPnkjS+uetYobt6kPUr
 IOI7ZItZlhxi4TbH/6x+v+QpdJ2VUy8XkwpzoAlJuwPHM4/EkoNM8+1c5qJ+2MISEw0e
 rIjKzKls2emvH3yzYxxMcEsKDwj1QsoZVcV6i+T7nlh93JfREk/iqMGrAphwS8CW9bsr
 zMIBOq6vFYlx1fKlHtTGyVAS1ZKvq99liBJ/xGthOkWAGNzIwQqT1hT8X+8Da7ZHF71b
 TcedbQI1GMXfp8tMI748Bk3d9q9by726OWS1l7D/gGsRar5Un23QPXHtT9LrhaW8C4V4
 445A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=uhc96iDfUismyOsdoxs7/ERFXZzsM2MwVzkn+Ev/tXE=;
 b=MNfPfHwx16tZCXF1zipYo2gsjiluOMTBkY5PVYozge7vOykQTDqBacRbHJrxEOHAz5
 jfl6anAPYFSS5aqv9CfCigxeY8Oe7W9GE1TfH9w2J/L4N2NgOsvzIwMYI035yxchEgmn
 7MESL36gPx7Q3Vto+ZqFSM2rh5ACr4kQoF/C6TzW1LzCCZnr1Kv4svwgGyTEs69xTyiV
 aZgq8+uitSalmYsONv0WncTIbjZ4klaK2gi1WFeNbsfQ7fKgZJGfm1gpVwv2DpY0HMc7
 LffkgWRK1Xu3+tfjdIzT/tbrI5E05WKe73ndX0I7uXUu+6/xgzAeQkqHpXWUktJHGb8I
 0ZLw==
X-Gm-Message-State: AOAM530DOrXlpz/4ks+MDDKa5h/+RzdA7cgeCiuyEFW/OINXwXAtEFpL
 blhweXqXLJBxVNXAQHZ/njc=
X-Google-Smtp-Source: ABdhPJx3MiZKE723dnDc+TEhStH47VXkFrYTUKVnEyISKuZMRA0D7uP0yGFef0fYyG3nh5JqMEwFtA==
X-Received: by 2002:a05:6808:3d1:: with SMTP id
 o17mr13467715oie.27.1626473522173; 
 Fri, 16 Jul 2021 15:12:02 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 d14sm1109159oiw.42.2021.07.16.15.12.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Jul 2021 15:12:01 -0700 (PDT)
From: Guenter Roeck <linux@roeck-us.net>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH] powerpc/chrp: Revert "Move PHB discovery" and "Make
 hydra_init() static"
Date: Fri, 16 Jul 2021 15:11:59 -0700
Message-Id: <20210716221159.3587039-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.25.1
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
Cc: linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>,
 Oliver O'Halloran <oohall@gmail.com>, Paul Mackerras <paulus@samba.org>,
 linuxppc-dev@lists.ozlabs.org, Guenter Roeck <linux@roeck-us.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This patch reverts commit 407d418f2fd4 ("powerpc/chrp: Move PHB
discovery") and commit 9634afa67bfd ("powerpc/chrp: Make hydra_init()
static").

Running the upstream kernel on Qemu's brand new "pegasos2" emulation
results in a variety of backtraces such as

Kernel attempted to write user page (a1) - exploit attempt? (uid: 0)
------------[ cut here ]------------
Bug: Write fault blocked by KUAP!
WARNING: CPU: 0 PID: 0 at arch/powerpc/mm/fault.c:230 do_page_fault+0x4f4/0x920
CPU: 0 PID: 0 Comm: swapper Not tainted 5.13.2 #40
NIP:  c0021824 LR: c0021824 CTR: 00000000
REGS: c1085d50 TRAP: 0700   Not tainted  (5.13.2)
MSR:  00021032 <ME,IR,DR,RI>  CR: 24042254  XER: 00000000

GPR00: c0021824 c1085e10 c0f8c520 00000021 3fffefff c1085c60 c1085c58 00000000
GPR08: 00001032 00000000 00000000 c0ffb3ec 44042254 00000000 00000000 00000004
GPR16: 00000000 ffffffff 000000c4 000000d0 0188c6e0 01006000 00000001 40b14000
GPR24: c0ec000c 00000300 02000000 00000000 42000000 000000a1 00000000 c1085e60
NIP [c0021824] do_page_fault+0x4f4/0x920
LR [c0021824] do_page_fault+0x4f4/0x920
Call Trace:
[c1085e10] [c0021824] do_page_fault+0x4f4/0x920 (unreliable)
[c1085e50] [c0004254] DataAccess_virt+0xd4/0xe4

and the system fails to boot. Bisect points to commit 407d418f2fd4
("powerpc/chrp: Move PHB discovery"). Reverting this patch together with
commit 9634afa67bfd ("powerpc/chrp: Make hydra_init() static") fixes
the problem.

Cc: Oliver O'Halloran <oohall@gmail.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>
Fixes: 407d418f2fd4 ("powerpc/chrp: Move PHB discovery")
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 arch/powerpc/include/asm/hydra.h    |  2 ++
 arch/powerpc/platforms/chrp/pci.c   | 11 ++---------
 arch/powerpc/platforms/chrp/setup.c | 12 +++++++++++-
 3 files changed, 15 insertions(+), 10 deletions(-)

diff --git a/arch/powerpc/include/asm/hydra.h b/arch/powerpc/include/asm/hydra.h
index d024447283a0..ae02eb53d6ef 100644
--- a/arch/powerpc/include/asm/hydra.h
+++ b/arch/powerpc/include/asm/hydra.h
@@ -94,6 +94,8 @@ extern volatile struct Hydra __iomem *Hydra;
 #define HYDRA_INT_EXT7		18	/* Power Off Request */
 #define HYDRA_INT_SPARE		19
 
+extern int hydra_init(void);
+
 #endif /* __KERNEL__ */
 
 #endif /* _ASMPPC_HYDRA_H */
diff --git a/arch/powerpc/platforms/chrp/pci.c b/arch/powerpc/platforms/chrp/pci.c
index 76e6256cb0a7..b2c2bf35b76c 100644
--- a/arch/powerpc/platforms/chrp/pci.c
+++ b/arch/powerpc/platforms/chrp/pci.c
@@ -131,7 +131,8 @@ static struct pci_ops rtas_pci_ops =
 
 volatile struct Hydra __iomem *Hydra = NULL;
 
-static int __init hydra_init(void)
+int __init
+hydra_init(void)
 {
 	struct device_node *np;
 	struct resource r;
@@ -313,14 +314,6 @@ chrp_find_bridges(void)
 		}
 	}
 	of_node_put(root);
-
-	/*
-	 *  "Temporary" fixes for PCI devices.
-	 *  -- Geert
-	 */
-	hydra_init();		/* Mac I/O */
-
-	pci_create_OF_bus_map();
 }
 
 /* SL82C105 IDE Control/Status Register */
diff --git a/arch/powerpc/platforms/chrp/setup.c b/arch/powerpc/platforms/chrp/setup.c
index 3cfc382841e5..c45435aa5e36 100644
--- a/arch/powerpc/platforms/chrp/setup.c
+++ b/arch/powerpc/platforms/chrp/setup.c
@@ -334,11 +334,22 @@ static void __init chrp_setup_arch(void)
 	/* On pegasos, enable the L2 cache if not already done by OF */
 	pegasos_set_l2cr();
 
+	/* Lookup PCI host bridges */
+	chrp_find_bridges();
+
+	/*
+	 *  Temporary fixes for PCI devices.
+	 *  -- Geert
+	 */
+	hydra_init();		/* Mac I/O */
+
 	/*
 	 *  Fix the Super I/O configuration
 	 */
 	sio_init();
 
+	pci_create_OF_bus_map();
+
 	/*
 	 * Print the banner, then scroll down so boot progress
 	 * can be printed.  -- Cort
@@ -571,7 +582,6 @@ define_machine(chrp) {
 	.name			= "CHRP",
 	.probe			= chrp_probe,
 	.setup_arch		= chrp_setup_arch,
-	.discover_phbs		= chrp_find_bridges,
 	.init			= chrp_init2,
 	.show_cpuinfo		= chrp_show_cpuinfo,
 	.init_IRQ		= chrp_init_IRQ,
-- 
2.25.1

