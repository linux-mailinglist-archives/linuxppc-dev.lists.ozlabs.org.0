Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 04ACA490A3A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Jan 2022 15:25:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JcvMV6P7Hz3cCv
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jan 2022 01:25:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=ZVJkIVvI;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62f;
 helo=mail-pl1-x62f.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=ZVJkIVvI; dkim-atps=neutral
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JcvL922Xjz2yNC
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jan 2022 01:24:33 +1100 (AEDT)
Received: by mail-pl1-x62f.google.com with SMTP id f13so11133372plg.0
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Jan 2022 06:24:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QRHifGif16JCCn49dyCq0MN5RzFNhrY4jExwm5tX9WA=;
 b=ZVJkIVvIPoUp8LobQC5cwKovXemN7W7J94T9aNdkZx811kiaEkaMGPaGRTEk0+4OD7
 bKtHEkQiC/kMdiJCy6xG5fknQPTByoE3XgqcaeypMaKsDpgpbbEpfud+SsRrxzUDtnoK
 e6o6xE9tqOqNKjEVl8T9cdyfe4TG1ULsLPjMw4o0CcaERQ45AFO8U3yN8iKJdaKJ9cy/
 ZtlAW7BOnjyrc8Z9jNPeOCkyBPDeE/tUQX/Nkd/CD9OiXCwx73ycgFSiW6v+nIrb4xjH
 45pVGYVOZhkWeUqOAMfvckT2l0Kj5MBxE5SIl7FO7eAeFUxvEM/8SV8uPKO8CyRvAst3
 NrtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QRHifGif16JCCn49dyCq0MN5RzFNhrY4jExwm5tX9WA=;
 b=YzuiAPo5oH89EKmigqCv8JRRYIcBncacVKeWPQIrydA8TYKaNwpTzVMEz7eaAOI30Z
 WnNBVPpBwfK0yff5A+BdTCsbZJ2b/af1/0i9qf8Q0fdTkBE4ooJUMG9cFV0dHbm4Q1Q+
 bzOFTzFlLSd9hgSvZGgPYPHPuQNqtWVYlQIRMP8ptGXeMdWKHHD7+6kR7rgpz5LvO/kW
 D8fwNNHElYtMgPX2ZaPfpW+ZFx9LGf/n3ZiP7TAaX1bSe9gvtxr3XXa44ME2+cUKoGZE
 3OiN2lwQ4iQjf7air03o9/F7RvuPjiCTg8jricTxLjd5iXM0o7oMSgHdBmpPtXcE30YT
 wT7w==
X-Gm-Message-State: AOAM531pQlYzczpJ9MTGKCH/f3vXkl1rvY8JpDVNm0lXuEjYA/dJPvfv
 r3LkvS1ic318uORW46QnkiqZ32l/2pM=
X-Google-Smtp-Source: ABdhPJynQnv3DvgIBTWaO4IJOIg4SRbHW1xyDao7+njE3LxWMDDbYsEpIBU4Pq4Zw5dSH63dziYohQ==
X-Received: by 2002:a17:90b:3504:: with SMTP id
 ls4mr10528896pjb.132.1642429470922; 
 Mon, 17 Jan 2022 06:24:30 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (124-171-74-95.tpgi.com.au. [124.171.74.95])
 by smtp.gmail.com with ESMTPSA id ga1sm7086325pjb.24.2022.01.17.06.24.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jan 2022 06:24:30 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH 2/3] powerpc/64s: Emulate scv syscalls if facility
 unavailable and PR KVM is possible
Date: Tue, 18 Jan 2022 00:24:22 +1000
Message-Id: <20220117142423.3038570-2-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20220117142423.3038570-1-npiggin@gmail.com>
References: <20220117142423.3038570-1-npiggin@gmail.com>
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
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The SCV facility will be disabled at runtime in the host by PR KVM by
the next change, emulate it in the facility unavailable handler.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/traps.c | 45 +++++++++++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/arch/powerpc/kernel/traps.c b/arch/powerpc/kernel/traps.c
index 11741703d26e..6e4eaa6bf58d 100644
--- a/arch/powerpc/kernel/traps.c
+++ b/arch/powerpc/kernel/traps.c
@@ -58,6 +58,7 @@
 #include <asm/ppc-opcode.h>
 #include <asm/rio.h>
 #include <asm/fadump.h>
+#include <asm/sstep.h>
 #include <asm/switch_to.h>
 #include <asm/tm.h>
 #include <asm/debug.h>
@@ -1778,6 +1779,49 @@ DEFINE_INTERRUPT_HANDLER(facility_unavailable_exception)
 		return;
 	}
 
+	if (status == FSCR_SCV_LG) {
+		u32 lev;
+		ppc_inst_t instr;
+
+		/* If we didn't advertise the feature to userspace, SIGILL */
+		if (!(cur_cpu_spec->cpu_user_features2 & PPC_FEATURE2_SCV))
+			goto out_msg;
+
+		/*
+		 * PR KVM disables the FSCR[SCV] facility even if the rest of
+		 * the kernel and userspace thought SCV was enabled. THis
+		 * causes scv instructions executed by both the host and the
+		 * guest to come here, in their respective kernels.
+		 *
+		 * If radix is enabled then PR KVM can not be in use and can
+		 * not be our hypervisor, so treat this as a normal illegal
+		 * instruction. If we are hash guest or host, we might need
+		 * to emulate a legitimate scv interrupt here.
+		 */
+		if (radix_enabled())
+			goto out_msg;
+
+		/*
+		 * User is making SCV call with SCV disabled. Emulate it.
+		 */
+		if (get_user_instr(instr, (void __user *)regs->nip)) {
+			pr_err("Failed to fetch the user instruction\n");
+			return;
+		}
+
+		instword = ppc_inst_val(instr);
+		if (WARN_ON_ONCE((instword & 0xfffff01f) != 0x44000001))
+			goto out;
+
+		lev = (instword >> 5) & 0x7f;
+		if (lev == 0) {
+			if (emulate_step(regs, instr) > 0)
+				return;
+			else
+				pr_err_ratelimited("Failed to emulate SCV\n");
+		}
+	}
+
 	if (status == FSCR_TM_LG) {
 		/*
 		 * If we're here then the hardware is TM aware because it
@@ -1799,6 +1843,7 @@ DEFINE_INTERRUPT_HANDLER(facility_unavailable_exception)
 		return;
 	}
 
+out_msg:
 	pr_err_ratelimited("%sFacility '%s' unavailable (%d), exception at 0x%lx, MSR=%lx\n",
 		hv ? "Hypervisor " : "", facility, status, regs->nip, regs->msr);
 
-- 
2.23.0

