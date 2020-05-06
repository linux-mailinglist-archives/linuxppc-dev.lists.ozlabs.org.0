Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 33F691C6672
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 May 2020 05:50:01 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49H2fZ2mM8zDqkP
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 May 2020 13:49:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1041;
 helo=mail-pj1-x1041.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=NXmGroP2; dkim-atps=neutral
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49H2VW5dGYzDqb9
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 May 2020 13:42:59 +1000 (AEST)
Received: by mail-pj1-x1041.google.com with SMTP id t9so226620pjw.0
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 05 May 2020 20:42:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=iFIre/KTb3d2ogElgt9w6/b2Jn7IOdMxfM56SCHkSvg=;
 b=NXmGroP2YP8Kl6GCGoKr+yEs1I3PmCRQ9r3pg5njs8n25QkHbdh1SjbYjB243CmgGq
 Br0eE1OAqUa86UXvQGBlKdEgrdhS/qr6tGEIMvqzsuaJEU80K74qdYMczj75tB+7RjT1
 yhmM+r79N/a+DY6PRWSkRr+lNp0paks9v0lqaXzikWTZKTaYZn9WwMIipVITm2cOPSrz
 s8pAYrx0HW/r/Gm8wD1ifbiCUPbJdv6+0XARQk0bnU8B+gH1iGpYq8zj1mQ9qJ8pacRc
 EXheNe0UAp7tceKRAE/BB92UFoIC2HkY73mM5rBA3VJG0jvI/0n5OPJHOZgG7kIy5f5V
 oJpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=iFIre/KTb3d2ogElgt9w6/b2Jn7IOdMxfM56SCHkSvg=;
 b=JMQuFY83OJKzhKqfiah7oBn8dnpLTAMiXjpaZS2xwmlVy6/SKSMK0drcpzLFO8lV1K
 AFlvLMjiSSM3esx3mA4ECGxmbZRa0vAeZw/7HwfgXNHAb2IXaAjJAzh4aqIv0zSXYuAj
 vRZQuz60hxYMIRdIp2I6BbkSpidzPJVcoiyPR/ACG4Ne0mfd2if0bwKrJcwNInwS218A
 BTy3bPkoR8R635BjWOHyBq6jX5DlPJXOZHonty3Wpf3b4+nQMMfk+Nf/9PE6lrEPIkNw
 r71mJbMLtoc4+xI9FFL41/iR5RgT1N7T5qKH2Y4YX0LbJaHdfrRxjsuzerbvSPCqAwde
 1YtQ==
X-Gm-Message-State: AGi0PuZjvRyEegdgt6P9jamdwWaJtIGwMhf+fT/oAW5K0iK/S2kav/cc
 ON5xNJMrkedAdv3SLmwLKF80I96y0rF16Q==
X-Google-Smtp-Source: APiQypK2+mjIlzfARZaOp1f3QoNqdWkDBpRUj7xki+eF0wBS1KQalzS/MUA+hJ0AqbngSwegmX/fvQ==
X-Received: by 2002:a17:90a:8d12:: with SMTP id
 c18mr6864903pjo.144.1588736576909; 
 Tue, 05 May 2020 20:42:56 -0700 (PDT)
Received: from localhost.localdomain
 (180-150-65-4.b49641.syd.nbn.aussiebb.net. [180.150.65.4])
 by smtp.gmail.com with ESMTPSA id k4sm465676pgg.88.2020.05.05.20.42.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 May 2020 20:42:56 -0700 (PDT)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v8 03/30] powerpc/xmon: Move breakpoints to text section
Date: Wed,  6 May 2020 13:40:23 +1000
Message-Id: <20200506034050.24806-4-jniethe5@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200506034050.24806-1-jniethe5@gmail.com>
References: <20200506034050.24806-1-jniethe5@gmail.com>
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
Cc: alistair@popple.id.au, npiggin@gmail.com, bala24@linux.ibm.com,
 naveen.n.rao@linux.vnet.ibm.com, Jordan Niethe <jniethe5@gmail.com>,
 dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The instructions for xmon's breakpoint are stored bpt_table[] which is in
the data section. This is problematic as the data section may be marked
as no execute. Move bpt_table[] to the text section.

Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
---
v6: - New to series. Was part of the previous patch.
    - Make BPT_SIZE available in assembly
---
 arch/powerpc/kernel/asm-offsets.c |  8 ++++++++
 arch/powerpc/xmon/Makefile        |  2 +-
 arch/powerpc/xmon/xmon.c          |  6 +-----
 arch/powerpc/xmon/xmon_bpts.S     |  9 +++++++++
 arch/powerpc/xmon/xmon_bpts.h     | 14 ++++++++++++++
 5 files changed, 33 insertions(+), 6 deletions(-)
 create mode 100644 arch/powerpc/xmon/xmon_bpts.S
 create mode 100644 arch/powerpc/xmon/xmon_bpts.h

diff --git a/arch/powerpc/kernel/asm-offsets.c b/arch/powerpc/kernel/asm-offsets.c
index fcf24a365fc0..9b9cde07e396 100644
--- a/arch/powerpc/kernel/asm-offsets.c
+++ b/arch/powerpc/kernel/asm-offsets.c
@@ -70,6 +70,10 @@
 #include <asm/fixmap.h>
 #endif
 
+#ifdef CONFIG_XMON
+#include "../xmon/xmon_bpts.h"
+#endif
+
 #define STACK_PT_REGS_OFFSET(sym, val)	\
 	DEFINE(sym, STACK_FRAME_OVERHEAD + offsetof(struct pt_regs, val))
 
@@ -795,5 +799,9 @@ int main(void)
 	DEFINE(VIRT_IMMR_BASE, (u64)__fix_to_virt(FIX_IMMR_BASE));
 #endif
 
+#ifdef CONFIG_XMON
+	DEFINE(BPT_SIZE, BPT_SIZE);
+#endif
+
 	return 0;
 }
diff --git a/arch/powerpc/xmon/Makefile b/arch/powerpc/xmon/Makefile
index 6f9cccea54f3..89c76ca35640 100644
--- a/arch/powerpc/xmon/Makefile
+++ b/arch/powerpc/xmon/Makefile
@@ -18,7 +18,7 @@ endif
 
 ccflags-$(CONFIG_PPC64) := $(NO_MINIMAL_TOC)
 
-obj-y			+= xmon.o nonstdio.o spr_access.o
+obj-y			+= xmon.o nonstdio.o spr_access.o xmon_bpts.o
 
 ifdef CONFIG_XMON_DISASSEMBLY
 obj-y			+= ppc-dis.o ppc-opc.o
diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
index 14c578e0383a..4ecb7e73b017 100644
--- a/arch/powerpc/xmon/xmon.c
+++ b/arch/powerpc/xmon/xmon.c
@@ -62,6 +62,7 @@
 
 #include "nonstdio.h"
 #include "dis-asm.h"
+#include "xmon_bpts.h"
 
 #ifdef CONFIG_SMP
 static cpumask_t cpus_in_xmon = CPU_MASK_NONE;
@@ -109,7 +110,6 @@ struct bpt {
 #define BP_TRAP		2
 #define BP_DABR		4
 
-#define NBPTS	256
 static struct bpt bpts[NBPTS];
 static struct bpt dabr;
 static struct bpt *iabr;
@@ -117,10 +117,6 @@ static unsigned bpinstr = 0x7fe00008;	/* trap */
 
 #define BP_NUM(bp)	((bp) - bpts + 1)
 
-#define BPT_SIZE       (sizeof(unsigned int) * 2)
-#define BPT_WORDS      (BPT_SIZE / sizeof(unsigned int))
-static unsigned int bpt_table[NBPTS * BPT_WORDS];
-
 /* Prototypes */
 static int cmds(struct pt_regs *);
 static int mread(unsigned long, void *, int);
diff --git a/arch/powerpc/xmon/xmon_bpts.S b/arch/powerpc/xmon/xmon_bpts.S
new file mode 100644
index 000000000000..f3ad0ab50854
--- /dev/null
+++ b/arch/powerpc/xmon/xmon_bpts.S
@@ -0,0 +1,9 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/ppc_asm.h>
+#include <asm/asm-compat.h>
+#include <asm/asm-offsets.h>
+#include "xmon_bpts.h"
+
+.global bpt_table
+bpt_table:
+	.space NBPTS * BPT_SIZE
diff --git a/arch/powerpc/xmon/xmon_bpts.h b/arch/powerpc/xmon/xmon_bpts.h
new file mode 100644
index 000000000000..b7e94375db86
--- /dev/null
+++ b/arch/powerpc/xmon/xmon_bpts.h
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef XMON_BPTS_H
+#define XMON_BPTS_H
+
+#define NBPTS	256
+#ifndef __ASSEMBLY__
+#define BPT_SIZE	(sizeof(unsigned int) * 2)
+#define BPT_WORDS	(BPT_SIZE / sizeof(unsigned int))
+
+extern unsigned int bpt_table[NBPTS * BPT_WORDS];
+
+#endif /* __ASSEMBLY__ */
+
+#endif /* XMON_BPTS_H */
-- 
2.17.1

