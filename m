Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 78EC9309587
	for <lists+linuxppc-dev@lfdr.de>; Sat, 30 Jan 2021 14:51:31 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DSbGS4yb0zDrQH
	for <lists+linuxppc-dev@lfdr.de>; Sun, 31 Jan 2021 00:51:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::629;
 helo=mail-pl1-x629.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Xa4qdw2w; dkim-atps=neutral
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DSZLT1zp3zDrTL
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 31 Jan 2021 00:09:53 +1100 (AEDT)
Received: by mail-pl1-x629.google.com with SMTP id y10so2838432plk.7
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 30 Jan 2021 05:09:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YYhlx1AbEH4h9GiU/j7CJo15sE/z/XimzYIwcAFgUNA=;
 b=Xa4qdw2w4WhpqTiwGzPQplgjFifCWae5dGnImCEWuDSLBoaZgY4xNrErhCpCP49zTv
 MnR4fZijuPoeRjMlWOsYuIFnD32i5WZGO3DT47aIQ5aGAK+EgFhccEpGS/uaCqlFqlrD
 r5tFv5gpK65XRX+e6YgHoUGtv43IrDldly/8x+h8RFePPYHjOzXClJ62fEN+MJqqR5Jm
 0bIacSTnmaXTSxC64s5PtTNj+VGT+ujwaOSLG654nUPEbskVW95UN4DMg3uyyG8DptcY
 iPWxpm8qms7GJC5Z0ihMi8TUXnJokGekRZIFWCpgqxjFR3UA/JLSnVbUdRJk05Vu+IeV
 F/og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YYhlx1AbEH4h9GiU/j7CJo15sE/z/XimzYIwcAFgUNA=;
 b=moEG2HLQ4AUqOKcR6ebsyFD126luKlaZk9Hfp+wlBmMTTafHBuyp4c+zNu/VDr5ITr
 F+gWogaPfwZLDUEZw2PEThl39ipod9V7HyXrCK1SFcluz989jIQt0vYdH30id6pPJWTY
 wE7RBISO838xhYTWK1rV/fNyP/MBo4tgWCHsuOO3lcgxzpDtHUUVFCwbSid9x5cOfUG5
 cEFLxR/bYSSTzoaLlPAFC42PfvU+Fvxq2RKviAsu8qnqOHq5mMYXoPLlazQnl2EtS7QV
 a4PAEbQKG5O3DZltuKGeY9LeyIKm9cg+DDc0y81069jmVZxkmLs/UdNjRa4VEPQj5SL5
 vFeA==
X-Gm-Message-State: AOAM532FzkIOqpbqC1ukEBHpvKgtYGG70jG1XP2x8R1jyvRQOWzzoLRo
 UeBaw166dVWf+XYK1sORHSuDPBMOhMA=
X-Google-Smtp-Source: ABdhPJzp3xAODtbBqgA0mOh9XJS9SZ7Q6Z2FYwQ/6DU7yY8UyTI0j98Z9yR8jF7oFutnf71QSfGi1Q==
X-Received: by 2002:a17:90a:2e88:: with SMTP id
 r8mr9269406pjd.84.1612012189848; 
 Sat, 30 Jan 2021 05:09:49 -0800 (PST)
Received: from bobo.ozlabs.ibm.com
 (192.156.221.203.dial.dynamic.acc50-nort-cbr.comindico.com.au.
 [203.221.156.192])
 by smtp.gmail.com with ESMTPSA id y16sm12102240pgg.20.2021.01.30.05.09.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Jan 2021 05:09:49 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v7 13/42] powerpc: rearrange do_page_fault error case to be
 inside exception_enter
Date: Sat, 30 Jan 2021 23:08:23 +1000
Message-Id: <20210130130852.2952424-14-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210130130852.2952424-1-npiggin@gmail.com>
References: <20210130130852.2952424-1-npiggin@gmail.com>
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
Cc: Athira Rajeev <atrajeev@linux.vnet.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This keeps the context tracking over the entire interrupt handler which
helps later with moving context tracking into interrupt wrappers.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/mm/fault.c | 23 ++++++++++++++---------
 1 file changed, 14 insertions(+), 9 deletions(-)

diff --git a/arch/powerpc/mm/fault.c b/arch/powerpc/mm/fault.c
index e476d7701413..970ac317e018 100644
--- a/arch/powerpc/mm/fault.c
+++ b/arch/powerpc/mm/fault.c
@@ -545,19 +545,24 @@ NOKPROBE_SYMBOL(__do_page_fault);
 long do_page_fault(struct pt_regs *regs)
 {
 	const struct exception_table_entry *entry;
-	enum ctx_state prev_state = exception_enter();
-	int rc = __do_page_fault(regs, regs->dar, regs->dsisr);
-	exception_exit(prev_state);
-	if (likely(!rc))
-		return 0;
+	enum ctx_state prev_state;
+	long err;
+
+	prev_state = exception_enter();
+	err = __do_page_fault(regs, regs->dar, regs->dsisr);
+	if (likely(!err))
+		goto out;
 
 	entry = search_exception_tables(regs->nip);
-	if (unlikely(!entry))
-		return rc;
+	if (likely(entry)) {
+		instruction_pointer_set(regs, extable_fixup(entry));
+		err = 0;
+	}
 
-	instruction_pointer_set(regs, extable_fixup(entry));
+out:
+	exception_exit(prev_state);
 
-	return 0;
+	return err;
 }
 NOKPROBE_SYMBOL(do_page_fault);
 
-- 
2.23.0

