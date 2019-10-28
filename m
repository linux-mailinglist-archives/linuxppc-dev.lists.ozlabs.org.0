Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DC22E7A6F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Oct 2019 21:47:03 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4726GB58njzDrSG
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Oct 2019 07:46:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=lca.pw
 (client-ip=2607:f8b0:4864:20::744; helo=mail-qk1-x744.google.com;
 envelope-from=cai@lca.pw; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lca.pw
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=lca.pw header.i=@lca.pw header.b="ZIWictY0"; 
 dkim-atps=neutral
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4726Cd01GjzDrWR
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Oct 2019 07:44:44 +1100 (AEDT)
Received: by mail-qk1-x744.google.com with SMTP id m4so9855562qke.9
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Oct 2019 13:44:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lca.pw; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=jCeXW/iQVileFnjio6pHN19c+809WESUARAGyyHFMiw=;
 b=ZIWictY08313cWqh5rWJ0/Q79pOhAgqgJu9Wv5RPOkOyjHvbbsWC93irpJkneqcJGf
 EU++BTh/VNla43NivG90yKxl/Dx0DZoFa7R1vGPRBDnogAkfWYnCJGb4uXGrZc+1wuIB
 knwNWyw470r3PbNPA+Nq8NU8Z7IgmPh2oC8SHqqcjw3ihFnC/kn8WSvzoTgVwKCqjsR7
 zLWlZy0vdyV8FH9P/gtZ0ha0x/Xd6YfUKXwFEXPWQI4xknUpsJWzq55ZhlDrLLegZy4H
 VZyg9qf16H1oGqBGMS6MZXnUx2pl9/+IghjX63BuOIN4BDzQ4SZnOSD5ik/v8pWoejKQ
 4EZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=jCeXW/iQVileFnjio6pHN19c+809WESUARAGyyHFMiw=;
 b=kyacSd1URtZHWhAEQNyve6BVC/f/6cC+reeRyP7EdFIx9oDMSbxn1bnmr7IhdMNHVq
 IrtvYcMjuPLOITmCp1ccZmXTnop+HtNWkZbZHsAKvVIjAEMsS26M0ik2jnZRDLa0juag
 aImbRCdJLz6wwZ1xeMXjV7w7Lafda0Ni63SqmlXfHeJMN4oiWlX4xDvnNbkBw2Z2J97y
 zjWL0tp7/bq+QGyHABIzyDz6GKjRRvTBdudeu/Q3Cw3MsVxNpRwdSkJIVoL6rAaipypx
 yI5qFjk3ANWe4LbYCwJXl7gOWIlV3LFOgDfq+YB2Mm6yA99vPIl8J1f2qu5KugEk1QS5
 oL8g==
X-Gm-Message-State: APjAAAW5SWoKZwS75zDnw9C0ghZWETNkEV8XlLZDwgCTp9eNGmIobLuo
 3ydo720pyOH+ZRtLR9LoK2hqVw==
X-Google-Smtp-Source: APXvYqzYpIGH4S94deT2nN70Tmize13/ElVqKsLU5ZvrP/dWPuIIZ4r+5OAFvpHgH0uuEwvdpsHpaA==
X-Received: by 2002:a37:2ec5:: with SMTP id u188mr17969151qkh.94.1572295480832; 
 Mon, 28 Oct 2019 13:44:40 -0700 (PDT)
Received: from qcai.nay.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
 by smtp.gmail.com with ESMTPSA id m25sm8972825qtc.0.2019.10.28.13.44.38
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 28 Oct 2019 13:44:40 -0700 (PDT)
From: Qian Cai <cai@lca.pw>
To: mpe@ellerman.id.au
Subject: [PATCH] powerpc/powernv/smp: fix a warning at CPU hotplug
Date: Mon, 28 Oct 2019 16:44:27 -0400
Message-Id: <1572295467-14686-1-git-send-email-cai@lca.pw>
X-Mailer: git-send-email 1.8.3.1
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
Cc: peterz@infradead.org, linux-kernel@vger.kernel.org, npiggin@gmail.com,
 paulus@samba.org, Qian Cai <cai@lca.pw>, paulmck@linux.ibm.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The commit e78a7614f387 ("idle: Prevent late-arriving interrupts from
disrupting offline") introduced a warning on powerpc with CPU hotplug,

WARNING: CPU: 1 PID: 0 at arch/powerpc/platforms/powernv/smp.c:160
pnv_smp_cpu_kill_self+0x5c/0x330
Call Trace:
 cpu_die+0x48/0x64
 arch_cpu_idle_dead+0x30/0x50
 do_idle+0x2e4/0x460
 cpu_startup_entry+0x3c/0x40
 start_secondary+0x7a8/0xa80
 start_secondary_resume+0x10/0x14

because it calls local_irq_disable() before arch_cpu_idle_dead().

Fixes: e78a7614f387 ("idle: Prevent late-arriving interrupts from disrupting offline")
Signed-off-by: Qian Cai <cai@lca.pw>
---
 arch/powerpc/platforms/powernv/smp.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/powerpc/platforms/powernv/smp.c b/arch/powerpc/platforms/powernv/smp.c
index fbd6e6b7bbf2..51f4e07b9168 100644
--- a/arch/powerpc/platforms/powernv/smp.c
+++ b/arch/powerpc/platforms/powernv/smp.c
@@ -157,7 +157,6 @@ static void pnv_smp_cpu_kill_self(void)
 	 * This hard disables local interurpts, ensuring we have no lazy
 	 * irqs pending.
 	 */
-	WARN_ON(irqs_disabled());
 	hard_irq_disable();
 	WARN_ON(lazy_irq_pending());
 
-- 
1.8.3.1

