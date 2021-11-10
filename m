Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CE91044B9AB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Nov 2021 01:39:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HpmFL4myQz3cW2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Nov 2021 11:39:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=JIhKCnzL;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62e;
 helo=mail-pl1-x62e.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=JIhKCnzL; dkim-atps=neutral
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HpmCG205dz2xXB
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Nov 2021 11:37:29 +1100 (AEDT)
Received: by mail-pl1-x62e.google.com with SMTP id v20so1547100plo.7
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 09 Nov 2021 16:37:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hI5qO+iLs1Icw0RwXkga/qBssOGyWJOJPoNMfMvfgV8=;
 b=JIhKCnzL4MmUOWj2PwsRE8g5vStXgFTj+cEIa1QbBwYuW+OSbmzSRLPyIGu/2PX88X
 CSCIKoSEdFKoH0BEZm54RQ9BlwBXuxTV/fwB5O+/ujXyeUGUvQkjD4BeGxs4OdHC5EHY
 skq3s3515Enkd7EWRdbDM7xGWX/z4s4r+LLKYYdhtZ5Az8nYiivezQs5zEl1IvPyZqNt
 fzxVFDwuDUsiCpLlEir5zSlcqzoVX0E0fEfszepZO1JQqxCj133u8/UQwmdZGMYwYK5P
 Bl7lWP+ejDUXkhySxHqr+gechs84nzauT2pRf57rsguiNUnxOU2H/9s75LfywJ6fSNjA
 p4YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hI5qO+iLs1Icw0RwXkga/qBssOGyWJOJPoNMfMvfgV8=;
 b=GOj+YPx5USXm1I8+X/O11vT64iZUWg9yWj75oDL2dYIcVxOv0dwZm2aJgyCoC35Li9
 Tmp605WouxhoDp/1VmT0xMMchQlxaszHXqVu3ooaV6q1z2BM19aS6sXzlc0xmApAKARA
 NSnJuyHf8+5Qefb9mef12vH7NJBgAopqY4Siq0Avvpx+KPO+5VvKCP/kzAsujm5TKhE9
 mJIUTb39aKlTgqS4J3USoha7G55Ho/19W8bSCzYTqwceCM4xJI2BVTKllr5GCjnsJ5yk
 S9K2UhJ1Jpuk5sM+fk0UGIZtX2OJu9jP6wTiJXjBBg0jUPGsP7i+xuwRAxT7757PSa3B
 1rtg==
X-Gm-Message-State: AOAM530fq4onbYlcXWvAb2WrO1XMK21l2RAuTkA3BEOrPhSE0x+BBJdn
 ZhZnAWBLDn+ZqhkCHvZcxl89M5gFzCAJiQ==
X-Google-Smtp-Source: ABdhPJycfObs+Ufewi2xFUgQRb4XSXUEKoYlD22zjYeoaPA7e9ie8pMui+6bSuheSBjascXdszjFXA==
X-Received: by 2002:a17:90b:4b03:: with SMTP id
 lx3mr11583817pjb.18.1636504647153; 
 Tue, 09 Nov 2021 16:37:27 -0800 (PST)
Received: from tee480.ozlabs.ibm.com
 (159-196-117-139.9fc475.syd.nbn.aussiebb.net. [159.196.117.139])
 by smtp.gmail.com with ESMTPSA id t21sm15854074pgo.12.2021.11.09.16.37.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Nov 2021 16:37:26 -0800 (PST)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v7 2/5] powerpc/64s: Introduce temporary mm for Radix MMU
Date: Wed, 10 Nov 2021 11:37:14 +1100
Message-Id: <20211110003717.1150965-3-jniethe5@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211110003717.1150965-1-jniethe5@gmail.com>
References: <20211110003717.1150965-1-jniethe5@gmail.com>
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
Cc: Jordan Niethe <jniethe5@gmail.com>, cmr@bluescreens.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: "Christopher M. Riedl" <cmr@bluescreens.de>

x86 supports the notion of a temporary mm which restricts access to
temporary PTEs to a single CPU. A temporary mm is useful for situations
where a CPU needs to perform sensitive operations (such as patching a
STRICT_KERNEL_RWX kernel) requiring temporary mappings without exposing
said mappings to other CPUs. Another benefit is that other CPU TLBs do
not need to be flushed when the temporary mm is torn down.

Mappings in the temporary mm can be set in the userspace portion of the
address-space.

Interrupts must be disabled while the temporary mm is in use. HW
breakpoints, which may have been set by userspace as watchpoints on
addresses now within the temporary mm, are saved and disabled when
loading the temporary mm. The HW breakpoints are restored when unloading
the temporary mm. All HW breakpoints are indiscriminately disabled while
the temporary mm is in use - this may include breakpoints set by perf.

Based on x86 implementation:

commit cefa929c034e
("x86/mm: Introduce temporary mm structs")

Signed-off-by: Christopher M. Riedl <cmr@bluescreens.de>
Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
---
v7: - use breakpoint_pause()/breakpoint_unpause()
    - simplify the temp mm struct, don't need init_temp_mm()
---
 arch/powerpc/lib/code-patching.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/arch/powerpc/lib/code-patching.c b/arch/powerpc/lib/code-patching.c
index c5ed98823835..29a30c3068ff 100644
--- a/arch/powerpc/lib/code-patching.c
+++ b/arch/powerpc/lib/code-patching.c
@@ -17,6 +17,9 @@
 #include <asm/code-patching.h>
 #include <asm/setup.h>
 #include <asm/inst.h>
+#include <asm/mmu_context.h>
+#include <asm/debug.h>
+#include <asm/tlb.h>
 
 static int __patch_instruction(u32 *exec_addr, struct ppc_inst instr, u32 *patch_addr)
 {
@@ -45,6 +48,32 @@ int raw_patch_instruction(u32 *addr, struct ppc_inst instr)
 }
 
 #ifdef CONFIG_STRICT_KERNEL_RWX
+
+struct temp_mm_state {
+	struct mm_struct *mm;
+};
+
+static inline struct temp_mm_state start_using_temp_mm(struct mm_struct *mm)
+{
+	struct temp_mm_state temp_state;
+
+	lockdep_assert_irqs_disabled();
+	temp_state.mm = current->active_mm;
+	switch_mm_irqs_off(current->active_mm, mm, current);
+
+	WARN_ON(!mm_is_thread_local(mm));
+
+	pause_breakpoints();
+	return temp_state;
+}
+
+static inline void stop_using_temp_mm(struct temp_mm_state prev_state)
+{
+	lockdep_assert_irqs_disabled();
+	switch_mm_irqs_off(current->active_mm, prev_state.mm, current);
+	unpause_breakpoints();
+}
+
 static DEFINE_PER_CPU(struct vm_struct *, text_poke_area);
 
 static int text_area_cpu_up(unsigned int cpu)
-- 
2.25.1

