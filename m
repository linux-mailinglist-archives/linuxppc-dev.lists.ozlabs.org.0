Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 82966447DDA
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Nov 2021 11:23:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HnnJ63DwCz3c9b
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Nov 2021 21:23:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=dkim header.b=MS1gmIM/;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=alien8.de (client-ip=5.9.137.197; helo=mail.skyhub.de;
 envelope-from=bp@alien8.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256
 header.s=dkim header.b=MS1gmIM/; dkim-atps=neutral
Received: from mail.skyhub.de (mail.skyhub.de [5.9.137.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HnnGp3Y9Zz2yNv
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  8 Nov 2021 21:22:10 +1100 (AEDT)
Received: from zn.tnic (p200300ec2f33110088892b77bd117736.dip0.t-ipconnect.de
 [IPv6:2003:ec:2f33:1100:8889:2b77:bd11:7736])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 0F41B1EC051F;
 Mon,  8 Nov 2021 11:12:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
 t=1636366355;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WLe9ZSF1Lv1EDaI8nEzWPaF/7AwCYsNUrHmzLm4SFqw=;
 b=MS1gmIM/QZLStat+1JoM5V56E2GOIz67eGJ40UaPaEO4KIaLSUvw+9eQ3B4vtBNCUiGVcS
 GWo7m5k31XIfHESuFzbJUspmUZqG6WbTAzJlm9k82SgX+Cw63RISNUNx0yL+zSiqY0Luf2
 3w2gQcYwezEk6jRypH6qR5XU9wS0tV0=
From: Borislav Petkov <bp@alien8.de>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [PATCH v0 34/42] powerpc: Check notifier registration return value
Date: Mon,  8 Nov 2021 11:11:49 +0100
Message-Id: <20211108101157.15189-35-bp@alien8.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20211108101157.15189-1-bp@alien8.de>
References: <20211108101157.15189-1-bp@alien8.de>
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Borislav Petkov <bp@suse.de>

Avoid homegrown notifier registration checks.

No functional changes.

Signed-off-by: Borislav Petkov <bp@suse.de>
Cc: linuxppc-dev@lists.ozlabs.org
---
 arch/powerpc/kernel/setup-common.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/kernel/setup-common.c b/arch/powerpc/kernel/setup-common.c
index b1e43b69a559..32f9900cd4f4 100644
--- a/arch/powerpc/kernel/setup-common.c
+++ b/arch/powerpc/kernel/setup-common.c
@@ -725,14 +725,18 @@ static struct notifier_block kernel_offset_notifier = {
 
 void __init setup_panic(void)
 {
-	if (IS_ENABLED(CONFIG_RANDOMIZE_BASE) && kaslr_offset() > 0)
-		atomic_notifier_chain_register(&panic_notifier_list,
-					       &kernel_offset_notifier);
+	if (IS_ENABLED(CONFIG_RANDOMIZE_BASE) && kaslr_offset() > 0) {
+		if (atomic_notifier_chain_register(&panic_notifier_list,
+						   &kernel_offset_notifier))
+			pr_warn("Kernel offset notifier already registered\n");
+	}
 
 	/* PPC64 always does a hard irq disable in its panic handler */
 	if (!IS_ENABLED(CONFIG_PPC64) && !ppc_md.panic)
 		return;
-	atomic_notifier_chain_register(&panic_notifier_list, &ppc_panic_block);
+
+	if (atomic_notifier_chain_register(&panic_notifier_list, &ppc_panic_block))
+		pr_warn("Panic notifier already registered\n");
 }
 
 #ifdef CONFIG_CHECK_CACHE_COHERENCY
-- 
2.29.2

