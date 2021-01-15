Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D2A122F82A5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Jan 2021 18:41:38 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DHT4v0ghQzDsPL
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Jan 2021 04:41:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52f;
 helo=mail-pg1-x52f.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=AhfuI9xs; dkim-atps=neutral
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com
 [IPv6:2607:f8b0:4864:20::52f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DHRzH47DszDqBd
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Jan 2021 03:51:39 +1100 (AEDT)
Received: by mail-pg1-x52f.google.com with SMTP id g15so6347023pgu.9
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Jan 2021 08:51:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=m5BWe7D7WxyRyYiMtz3JT/sp3Kz4YbXoIbO4vUD8G2s=;
 b=AhfuI9xsWQqVPoLw8zRQf+jm3cmHuY4QzclgjMs6uAR7vsRtGm9Y3hB9W5Ckx4UhlM
 +sI9OhvoFMOCcMWo+hlh+NFILa0Zz2azwMXDMu1Na50N6I/pnx1uDlfXKtGcAxrUnNUD
 IGgSQS+dDy+1K5RwW/AbER85hr6kdJJXFVkudYunmDAWLeIem23zxwhTMfqIuQZHMGHW
 oir845pTUufgcIrTH5m4m4IvCFISc43je/WAz4bAwbZAOT4sZ0oTNDT9fD7e0KOnqCpc
 MTI3P98Tt4cFj8kgFmsr7P77ouvJ2HtuIh2WUHBgQoerLkcCsOLux+BN709t3NYDlfI6
 FiZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=m5BWe7D7WxyRyYiMtz3JT/sp3Kz4YbXoIbO4vUD8G2s=;
 b=HmH6xDPkuq15JQ29tcz3f43/MllwsEfZRUXOoJcwxZedrjZ1VRCYusvRSRcPec52H5
 1gvqSEdip0DTakiYzP2KIJ/9kPKDcanhSHr1YKsZcfZ0pFBKWIThXTfkWwuDlavpiG3C
 oEiKujJtxb/Zob6vJEpHC8xQPFTTmi/LxsvGRYmXTprsCubO0yngN4iS1s3tr/mRSBpX
 qHnuzEHJRIaMgFzcCaEmyVG22SBXayU6a2X1plrmXWhPaZWtnKU5MT82vrB3XI3E73lB
 uODikN5hoiKTEYNxILZQNfJNWu1AKFoJhO9N7qGoWPzolmgjuO8QFGCaxikgaDMekr8K
 Cirg==
X-Gm-Message-State: AOAM5304gZzogn404J97XNqwDvXwzNs41eexzWRd1hB+oOIG6+VI+o7s
 6NJm52BeX0Aj/n0AC4aTNXGMHQxrnHs=
X-Google-Smtp-Source: ABdhPJx+/DwkJME0Es5hqMLrm1LOU7XOq7WMPHhfUvt90Iuz9g8k9c4TdU0al0EJ8AvqQuwdRv+wvA==
X-Received: by 2002:a63:d041:: with SMTP id s1mr13372696pgi.249.1610729496642; 
 Fri, 15 Jan 2021 08:51:36 -0800 (PST)
Received: from bobo.ibm.com ([124.170.13.62])
 by smtp.gmail.com with ESMTPSA id u1sm8455477pjr.51.2021.01.15.08.51.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 08:51:36 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v6 20/39] powerpc: introduce die_mce
Date: Sat, 16 Jan 2021 02:49:53 +1000
Message-Id: <20210115165012.1260253-21-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210115165012.1260253-1-npiggin@gmail.com>
References: <20210115165012.1260253-1-npiggin@gmail.com>
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

As explained by commit daf00ae71dad ("powerpc/traps: restore
recoverability of machine_check interrupts"), die() can't be called from
within nmi_enter to nicely kill a process context that was interrupted.
nmi_exit must be called first.

This adds a function die_mce which takes care of this for machine check
handlers.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/bug.h        |  1 +
 arch/powerpc/kernel/traps.c           | 21 +++++++++++++++------
 arch/powerpc/platforms/powernv/opal.c |  2 +-
 arch/powerpc/platforms/pseries/ras.c  |  2 +-
 4 files changed, 18 insertions(+), 8 deletions(-)

diff --git a/arch/powerpc/include/asm/bug.h b/arch/powerpc/include/asm/bug.h
index 8f09ddae9305..c10ae0a9bbaf 100644
--- a/arch/powerpc/include/asm/bug.h
+++ b/arch/powerpc/include/asm/bug.h
@@ -118,6 +118,7 @@ void do_bad_page_fault_segv(struct pt_regs *regs);
 extern void _exception(int, struct pt_regs *, int, unsigned long);
 extern void _exception_pkey(struct pt_regs *, unsigned long, int);
 extern void die(const char *, struct pt_regs *, long);
+void die_mce(const char *str, struct pt_regs *regs, long err);
 extern bool die_will_crash(void);
 extern void panic_flush_kmsg_start(void);
 extern void panic_flush_kmsg_end(void);
diff --git a/arch/powerpc/kernel/traps.c b/arch/powerpc/kernel/traps.c
index 6691774fe1fb..f9ef183a5454 100644
--- a/arch/powerpc/kernel/traps.c
+++ b/arch/powerpc/kernel/traps.c
@@ -789,6 +789,19 @@ int machine_check_generic(struct pt_regs *regs)
 }
 #endif /* everything else */
 
+void die_mce(const char *str, struct pt_regs *regs, long err)
+{
+	/*
+	 * The machine check wants to kill the interrupted context, but
+	 * do_exit() checks for in_interrupt() and panics in that case, so
+	 * exit the irq/nmi before calling die.
+	 */
+	if (!IS_ENABLED(CONFIG_PPC_BOOK3S_64))
+		nmi_exit();
+	die(str, regs, err);
+}
+NOKPROBE_SYMBOL(die_mce);
+
 void machine_check_exception(struct pt_regs *regs)
 {
 	int recover = 0;
@@ -831,15 +844,11 @@ void machine_check_exception(struct pt_regs *regs)
 	if (check_io_access(regs))
 		goto bail;
 
-	if (nmi) nmi_exit();
-
-	die("Machine check", regs, SIGBUS);
+	die_mce("Machine check", regs, SIGBUS);
 
 	/* Must die if the interrupt is not recoverable */
 	if (!(regs->msr & MSR_RI))
-		die("Unrecoverable Machine check", regs, SIGBUS);
-
-	return;
+		die_mce("Unrecoverable Machine check", regs, SIGBUS);
 
 bail:
 	if (nmi) nmi_exit();
diff --git a/arch/powerpc/platforms/powernv/opal.c b/arch/powerpc/platforms/powernv/opal.c
index c61c3b62c8c6..303d7c775740 100644
--- a/arch/powerpc/platforms/powernv/opal.c
+++ b/arch/powerpc/platforms/powernv/opal.c
@@ -624,7 +624,7 @@ static int opal_recover_mce(struct pt_regs *regs,
 			 */
 			recovered = 0;
 		} else {
-			die("Machine check", regs, SIGBUS);
+			die_mce("Machine check", regs, SIGBUS);
 			recovered = 1;
 		}
 	}
diff --git a/arch/powerpc/platforms/pseries/ras.c b/arch/powerpc/platforms/pseries/ras.c
index 149cec2212e6..2d9f985fd13a 100644
--- a/arch/powerpc/platforms/pseries/ras.c
+++ b/arch/powerpc/platforms/pseries/ras.c
@@ -813,7 +813,7 @@ static int recover_mce(struct pt_regs *regs, struct machine_check_event *evt)
 			 */
 			recovered = 0;
 		} else {
-			die("Machine check", regs, SIGBUS);
+			die_mce("Machine check", regs, SIGBUS);
 			recovered = 1;
 		}
 	}
-- 
2.23.0

