Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7999D1C0CCB
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 May 2020 05:51:01 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Cyw21Hd1zDr9C
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 May 2020 13:50:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1044;
 helo=mail-pj1-x1044.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=hATElW/h; dkim-atps=neutral
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Cym01rsvzDrGC
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 May 2020 13:44:00 +1000 (AEST)
Received: by mail-pj1-x1044.google.com with SMTP id ms17so1911723pjb.0
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Apr 2020 20:44:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=SBlnqv3VYv4rxH5Yo0iC3rZ22WBOg0DhSBSmVvgSw48=;
 b=hATElW/hqKCtOkCdrnBzUM5/5A1BRNMQFiiScn6fqQopFtHoxBA2UYR6b4kc0Z9wIA
 5uWZ1pnTsOB6MCGUtoeDOeVXct8aX+im+wbr3NmQ4C4IaZqYHVh36lkTXZvKE3z2Guyh
 Ud6wqxK7WNsIpC+Sike7duwaZfFpsd6kcxmtCHnOnDffzKzRvExtb5bYtTebZTs4dCZJ
 aBMhw+wI4WJze21vU8dXjpgHXeXZBPPxbY+bE1jR8HGRIGwO+PImeobwYW/BlRKkwWsL
 0vWeaoJ5iQlHqdBzInXoXrH4rsNAjbY4nj9MEWxgwr1V53voY2kEBDNxq2jYe5Hzyv2T
 +ngg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=SBlnqv3VYv4rxH5Yo0iC3rZ22WBOg0DhSBSmVvgSw48=;
 b=nRxS4XqYfkk/EaXWgnGutQ/tdaycQa4LdU4dGL5fEfTTX/IsWttFkaRiuo9BevGvLR
 1HgVVmRc1pn4A/t7v8UYTj+a50UnuUomu3yE2Nb9jNFZPlKf3O6iyv9+XxwpJVVzYWXL
 JMXMm4knruMUiaPHgl5EAB7kOc6xlyo5UhFOafz+0zAH0qQELZ2bLfR/PXqSKOOSA/FT
 GjwNnTlE69WuBpxKKhv8a0gqbDC/dfexhh0gYn525A/GyVRibpygxD7ct52wDsh99nZy
 +vMOApopFicna7PGHYN4vIldi/60v1W7422HnDlxoVQWPG7i320DqPiygVmEDlpQ4NNk
 931g==
X-Gm-Message-State: AGi0Puaab4nSQDvJSEXZDd/NZedknFSwiJaSR5Ktjc8bPOQz+zenKY7t
 wvinnLMZqSh5HkjaHndJjit3VYyVULpR7A==
X-Google-Smtp-Source: APiQypJqIi8GT7PtdKf236Y1vITp2BOi/6l0OHoQKJ7JMpPsXBTDRMRuO2KI7eLlDrhNjhMNycdRFA==
X-Received: by 2002:a17:902:ea8a:: with SMTP id
 x10mr2632006plb.166.1588304637517; 
 Thu, 30 Apr 2020 20:43:57 -0700 (PDT)
Received: from localhost.localdomain
 (180-150-65-4.b49641.syd.nbn.aussiebb.net. [180.150.65.4])
 by smtp.gmail.com with ESMTPSA id w28sm940082pgc.26.2020.04.30.20.43.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Apr 2020 20:43:57 -0700 (PDT)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v7 03/28] powerpc/xmon: Move breakpoints to text section
Date: Fri,  1 May 2020 13:41:55 +1000
Message-Id: <20200501034220.8982-4-jniethe5@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200501034220.8982-1-jniethe5@gmail.com>
References: <20200501034220.8982-1-jniethe5@gmail.com>
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
index 6ba7f66c1dd0..bbfea22f4a96 100644
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

