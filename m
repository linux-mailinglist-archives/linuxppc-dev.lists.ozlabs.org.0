Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B5881C24CB
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 May 2020 13:44:26 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49DnMq15SKzDrPn
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 May 2020 21:44:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::541;
 helo=mail-pg1-x541.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=DzXBTipT; dkim-atps=neutral
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Dmqk5CsjzDr7K
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  2 May 2020 21:20:02 +1000 (AEST)
Received: by mail-pg1-x541.google.com with SMTP id 207so252401pgc.6
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 02 May 2020 04:20:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RGNzrwTjIMK1/vfI1lYVYwt1wjtTA/Pvo6Eyc0KS950=;
 b=DzXBTipTgudZ9DiQWipBQn4CBHaoaZVRK+WYG7cMuO9KsxQaR4tG2cwgImNuIvveRK
 p5kQXGOs+uSvzuge28hRRXoTn5f1F/iJshaS+RJcXsR/XK5gOZoaimM2wNqNFbuofb1J
 l6OgHBOSvQs4kY1ouLVOk03Fi2DgLnXDTBIw/SO6eTai8QQ+3DBqq2eZmH3WCazOGe6/
 qztd3WDn0AvjshFZh26veBjoMN2IskLdn6fjbznG4gHcAzEKpWKPmQMealBPm/J699qt
 HmJkKtsMluEwsrIx3oyrBQJZlloQHvonMrxMNl9iDj4Y8L9Hbw3G6qnqCwjgG5OjPiXl
 lifQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RGNzrwTjIMK1/vfI1lYVYwt1wjtTA/Pvo6Eyc0KS950=;
 b=flVx6pkhj0rSp/FD7gIXtDvlCI257Fj9h866rvcwt/GNd0EFpZmZaYBbqydkf+MmI6
 KPqFYhgyBu4XC+CrBidbAQe9H36C9KyU30EFi7vDndip7z/pvdtZRnEoIwIrFwcmyqQD
 +snhYmFtSpZF2U+SR4xok+wRmrEwkDOV/fSGBaZWOrzttkLUKyWmacL+gn6UC4YPDWUQ
 FJT7TuJQiRkOGuO4ztHGB2kIjNrVYZtIcywcdBnNTKU6XZQAq6JTil8BlToY9blKP2xl
 9zmP28cZTriVmmh94FT8lDQlDedGwDuGfEG5Gk0x8TTEX0x8KQtlW4Wn2zgA65MzBfDz
 p4aw==
X-Gm-Message-State: AGi0PuYJJzLyvTQ1Qj55rXVFbdb2sFzlcxW6yORVxnpM4NChurwQBPES
 fjQadg+yESUfHgKwTvK0t2QsZcjg
X-Google-Smtp-Source: APiQypLYmTFprmFqQOriy9XGrNoELx7TcVD14sHDyRYwD8r6sKqdd+CluUYD1xSbJao1Igc9EyC7Qg==
X-Received: by 2002:a63:5a5d:: with SMTP id k29mr8109539pgm.176.1588418399537; 
 Sat, 02 May 2020 04:19:59 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com ([203.220.177.17])
 by smtp.gmail.com with ESMTPSA id q15sm3862790pgj.52.2020.05.02.04.19.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 May 2020 04:19:59 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH 03/10] powerpc/powernv: Use OPAL_REPORT_TRAP to cope with
 trap interrupts from OPAL
Date: Sat,  2 May 2020 21:19:07 +1000
Message-Id: <20200502111914.166578-4-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200502111914.166578-1-npiggin@gmail.com>
References: <20200502111914.166578-1-npiggin@gmail.com>
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This isn't used yet, because OPAL is nice enough not to cause unexpected
program check interrupts to the OS. A future patch will allow OPAL to
start using traps. Like so.

  [OPAL] < assert failed at core/opal.c:814 >
  [OPAL]     .
  [OPAL]      .
  [OPAL]       .
  [OPAL]         OO__)
  [OPAL]        <"__/
  [OPAL]         ^ ^
   cpu 0x0: Vector: 700 (Program Check) at [c000000080287770]
       pc: 000000003002f360: opal_poll_events+0x54/0x174 [OPAL]
       lr: 000000003002f344: opal_poll_events+0x38/0x174 [OPAL]
       sp: c000000080287a00
      msr: 9000000000021033
     current = 0xc0000000016fa100
     paca    = 0xc0000000012c0000^I irqmask: 0x03^I irq_happened: 0x01
       pid   = 19, comm = kopald
   Linux version 5.7.0-rc3-00053-g2d9c3c965178-dirty
   enter ? for help
   [c000000080287a80] 000000003002e6b8 opal_v4_le_entry+0x224/0x29c [OPAL]
   [c000000080287b50] c000000000096ce8 opal_call+0x1c8/0x580
   [c000000080287c90] c000000000097448 opal_poll_events+0x28/0x40
   [c000000080287d00] c0000000000a26e0 opal_handle_events+0x70/0x140
   [c000000080287d50] c00000000009a198 kopald+0x98/0x140
   [c000000080287db0] c00000000012139c kthread+0x18c/0x1a0
   [c000000080287e20] c00000000000cc28 ret_from_kernel_thread+0x5c/0x74

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/opal-api.h        |  7 +++-
 arch/powerpc/include/asm/opal.h            |  2 ++
 arch/powerpc/kernel/traps.c                | 39 ++++++++++++++++------
 arch/powerpc/platforms/powernv/opal-call.c |  1 +
 4 files changed, 37 insertions(+), 12 deletions(-)

diff --git a/arch/powerpc/include/asm/opal-api.h b/arch/powerpc/include/asm/opal-api.h
index 8eb31b9aeb27..018d4734c323 100644
--- a/arch/powerpc/include/asm/opal-api.h
+++ b/arch/powerpc/include/asm/opal-api.h
@@ -216,7 +216,8 @@
 #define OPAL_SECVAR_ENQUEUE_UPDATE		178
 #define OPAL_ADDR_TO_SYM			181
 #define OPAL_SYM_TO_ADDR			182
-#define OPAL_LAST				182
+#define OPAL_REPORT_TRAP			183
+#define OPAL_LAST				183
 
 #define QUIESCE_HOLD			1 /* Spin all calls at entry */
 #define QUIESCE_REJECT			2 /* Fail all calls with OPAL_BUSY */
@@ -1184,6 +1185,10 @@ struct opal_mpipl_fadump {
 	struct	opal_mpipl_region region[];
 } __packed;
 
+#define OPAL_TRAP_FATAL	1
+#define OPAL_TRAP_WARN	2
+#define OPAL_TRAP_PANIC	3
+
 #endif /* __ASSEMBLY__ */
 
 #endif /* __OPAL_API_H */
diff --git a/arch/powerpc/include/asm/opal.h b/arch/powerpc/include/asm/opal.h
index 56b6994aefb7..dc77c2d5e036 100644
--- a/arch/powerpc/include/asm/opal.h
+++ b/arch/powerpc/include/asm/opal.h
@@ -314,6 +314,8 @@ s64 opal_quiesce(u64 shutdown_type, s32 cpu);
 
 int64_t opal_addr_to_sym(uint64_t addr, __be64 *symaddr, __be64 *symsize, char *namebuf, uint64_t buflen);
 int64_t opal_sym_to_addr(const char *name, __be64 *symaddr, __be64 *symsize);
+int64_t opal_report_trap(uint64_t nip);
+
 
 /* Internal functions */
 extern int early_init_dt_scan_opal(unsigned long node, const char *uname,
diff --git a/arch/powerpc/kernel/traps.c b/arch/powerpc/kernel/traps.c
index 3fca22276bb1..0274ae7b8a03 100644
--- a/arch/powerpc/kernel/traps.c
+++ b/arch/powerpc/kernel/traps.c
@@ -52,6 +52,7 @@
 #endif
 #ifdef CONFIG_PPC64
 #include <asm/firmware.h>
+#include <asm/opal.h>
 #include <asm/processor.h>
 #include <asm/tm.h>
 #endif
@@ -1471,7 +1472,6 @@ void program_check_exception(struct pt_regs *regs)
 		goto bail;
 	}
 	if (reason & REASON_TRAP) {
-		unsigned long bugaddr;
 		/* Debugger is first in line to stop recursive faults in
 		 * rcu_lock, notify_die, or atomic_notifier_call_chain */
 		if (debugger_bpt(regs))
@@ -1485,18 +1485,35 @@ void program_check_exception(struct pt_regs *regs)
 				== NOTIFY_STOP)
 			goto bail;
 
-		bugaddr = regs->nip;
-		/*
-		 * Fixup bugaddr for BUG_ON() in real mode
-		 */
-		if (!is_kernel_addr(bugaddr) && !(regs->msr & MSR_IR))
-			bugaddr += PAGE_OFFSET;
+		if (!(regs->msr & MSR_PR)) { /* not user-mode */
+			unsigned long bugaddr;
+			enum bug_trap_type t;
+
+			/*
+			 * Fixup bugaddr for BUG_ON() in real mode
+			 */
+			bugaddr = regs->nip;
+			if (!is_kernel_addr(bugaddr) && !(regs->msr & MSR_IR))
+				bugaddr += PAGE_OFFSET;
+			t = report_bug(bugaddr, regs);
+			if (t == BUG_TRAP_TYPE_WARN) {
+				regs->nip += 4;
+				goto bail;
+			}
+			if (t == BUG_TRAP_TYPE_BUG)
+				goto bug;
 
-		if (!(regs->msr & MSR_PR) &&  /* not user-mode */
-		    report_bug(bugaddr, regs) == BUG_TRAP_TYPE_WARN) {
-			regs->nip += 4;
-			goto bail;
+			if (firmware_has_feature(FW_FEATURE_OPAL)) {
+				int64_t ret;
+
+				ret = opal_report_trap(regs->nip);
+				if (ret == OPAL_TRAP_WARN) {
+					regs->nip += 4;
+					goto bail;
+				}
+			}
 		}
+bug:
 		_exception(SIGTRAP, regs, TRAP_BRKPT, regs->nip);
 		goto bail;
 	}
diff --git a/arch/powerpc/platforms/powernv/opal-call.c b/arch/powerpc/platforms/powernv/opal-call.c
index 2233a58924cb..506b1798081a 100644
--- a/arch/powerpc/platforms/powernv/opal-call.c
+++ b/arch/powerpc/platforms/powernv/opal-call.c
@@ -295,3 +295,4 @@ OPAL_CALL(opal_secvar_get_next,			OPAL_SECVAR_GET_NEXT);
 OPAL_CALL(opal_secvar_enqueue_update,		OPAL_SECVAR_ENQUEUE_UPDATE);
 OPAL_CALL(opal_addr_to_sym,			OPAL_ADDR_TO_SYM);
 OPAL_CALL(opal_sym_to_addr,			OPAL_SYM_TO_ADDR);
+OPAL_CALL(opal_report_trap,			OPAL_REPORT_TRAP);
-- 
2.23.0

