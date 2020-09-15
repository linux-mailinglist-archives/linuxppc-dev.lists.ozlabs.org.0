Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D161E26A45F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Sep 2020 13:48:43 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BrM205Nl4zDqSd
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Sep 2020 21:48:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::641;
 helo=mail-pl1-x641.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=RN3KtSW9; dkim-atps=neutral
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BrM0C2lNXzDqLJ
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Sep 2020 21:47:06 +1000 (AEST)
Received: by mail-pl1-x641.google.com with SMTP id k13so1205749plk.3
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Sep 2020 04:47:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mBodfAavl6YpXRkpNdZIPjBFDzVXQNMTLs1HNKGJY0c=;
 b=RN3KtSW97UAS1U4OmPDTmTqw6oUbCdgP+uUoYySrQ6f5xzxgaPM5lXhANBmzacR2M6
 oFwngNmROlV6IvK53OyG8H/lIFRGwCnMlUvMEypR+tbkRldHAqKkUj2JYF1/BfFndpk1
 mM4HR9hhPTWyOBbZKHzzjqbngNV337YfO0KRkm2b1zmZ/JXh1IlOclORXkzb5iALi/s9
 qdu9hVU7xdrceFWcWH8bihx0lSSQbmBud/3P2/1EFbOMjGFuA0kYN+i7UE5t/HQkoSWr
 iGSAZVEF7cb565mzbQV8D9Lfw0JmHktmfp1vxBsS4JF9tto33FJKUTIkhAnqxqxl+u83
 exCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mBodfAavl6YpXRkpNdZIPjBFDzVXQNMTLs1HNKGJY0c=;
 b=K4OkElVcvKwVVoyBlAr74w8eXcPoIRywN2ezilC6M7zG4wv+9+trrntPtpO1TPjL5W
 7tVPiW3OK17EXYRZrvBaGtDbQCEk0GX2Q0o5T6zY8LLJwToUjhDuZK24P3lg85Hfgazy
 eh8+3+50dQ1H94yhMVWbozMWqIuYUtuDppvDRq9H2oxYyTqRNYxoQXILCjgEAFF3KIyJ
 zCBfZMXZEDSVE+rX16pYE0GVX2zjeEpbxge72JV/rKzhyn3Luu4m/gYyvwE4ci/5hKPG
 huNJBbLV43sgQN9ZeFeGeZITBGoF0b3I+lPNLZIqrpdoasWLEuigCRmfZfftVydHcafZ
 B5Yw==
X-Gm-Message-State: AOAM531XnXs0q1FACCo4QZvWEMoS3xjl248Qge2cnf6QKSUPUN3Ti60v
 t6XFggeIKrwn0+tt0gCtR2UwvoENAY3zrg==
X-Google-Smtp-Source: ABdhPJy3AFkXUvp2cegu3tYB2GfcgaXdBG8JKlXV1OpOaUDft4S+pSUMSUszK7EUOMOEstXaOz/M3A==
X-Received: by 2002:a17:902:cf8f:b029:d0:90a3:24e9 with SMTP id
 l15-20020a170902cf8fb02900d090a324e9mr18348002ply.8.1600170424321; 
 Tue, 15 Sep 2020 04:47:04 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com ([203.185.249.227])
 by smtp.gmail.com with ESMTPSA id u2sm12118077pji.50.2020.09.15.04.47.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Sep 2020 04:47:04 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 2/6] powerpc/64: fix irq replay pt_regs->softe value
Date: Tue, 15 Sep 2020 21:46:46 +1000
Message-Id: <20200915114650.3980244-2-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200915114650.3980244-1-npiggin@gmail.com>
References: <20200915114650.3980244-1-npiggin@gmail.com>
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

Replayed interrupts get an "artificial" struct pt_regs constructed to
pass to interrupt handler functions. This did not get the softe field
set correctly, it's as though the interrupt has hit while irqs are
disabled. It should be IRQS_ENABLED.

This is possibly harmless, asynchronous handlers should not be testing
if irqs were disabled, but it might be possible for example some code
is shared with synchronous or NMI handlers, and it makes more sense if
debug output looks at this.

Fixes: 3282a3da25bd ("powerpc/64: Implement soft interrupt replay in C")
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/irq.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/irq.c b/arch/powerpc/kernel/irq.c
index 77019699606a..3fdad9336885 100644
--- a/arch/powerpc/kernel/irq.c
+++ b/arch/powerpc/kernel/irq.c
@@ -214,7 +214,7 @@ void replay_soft_interrupts(void)
 	struct pt_regs regs;
 
 	ppc_save_regs(&regs);
-	regs.softe = IRQS_ALL_DISABLED;
+	regs.softe = IRQS_ENABLED;
 
 again:
 	if (IS_ENABLED(CONFIG_PPC_IRQ_SOFT_MASK_DEBUG))
-- 
2.23.0

