Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BD4674C7BC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jun 2019 08:57:32 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Tt16099MzDqyX
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jun 2019 16:57:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::543; helo=mail-pg1-x543.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="uPTWu4gA"; 
 dkim-atps=neutral
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Tqmv18JdzDqwJ
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Jun 2019 15:16:47 +1000 (AEST)
Received: by mail-pg1-x543.google.com with SMTP id 196so927167pgc.6
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jun 2019 22:16:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=owWvfI965AgWzdNshTk94HkrUvyr5lZ6alFzCEbGN40=;
 b=uPTWu4gAHE1GfoI8ZYF11qRLLFx1RjIPIwgFPgFQq/WKQvIxIDlVzHEC9Tcj3BBz1W
 UM7beXRj6rZVclrFZJ/ZeC1MXH99NZpeF6ccwSehEgc2pfzeYaGWR01pcsRK2Sjjr0ga
 IgCfcHy1nQwNNDbaHmobpa1cZU+Lfwz4oKYh1cjVYdpOTvkb/lecoqqaXfYQW1xTr6W1
 D12d2Fn32gwxFnOiAGneCu/KiX5Ap+fsunWkcb2Ym26DMohcgDQG8b+xDFWZqzStgdU3
 BxQ3PfVw6D9jg73JkpPHRwLsbB2yRHqAIWEUhM7ZwP7yLxcXDZ52jq/q5a/BOmpbqUxv
 nOLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=owWvfI965AgWzdNshTk94HkrUvyr5lZ6alFzCEbGN40=;
 b=pk3OI6YXAziNNq5OtRTvWMv9kKdHd0pCOVzRuMwHwaPjlKwsHnn+X4NH+oyxVfoREH
 hK0KgUwVfOLhK9KCgzOQPsRoS73gdhBU05iBgmf/LowTDxgOrJ+GTwQBur9D6axHj8Se
 RLbYFoz1IrymLER55MKOUfEuaDBHJcayvQPnk4igFeWxctalUuQJvNX8TXDz/zLMo/9A
 Bmc9G4sJWJaaE7xGHXqK2dWbhjFEAHGID8OTW6vbcnKHdUFDrQw0gUhjvKFd61Ab8Dyw
 1YFKmAd47iJ6zcQgAkNW4okE+fNsjXul7m3zLV3ukuMnEoFIWNuCKX0hojqt41isrO/m
 AU4A==
X-Gm-Message-State: APjAAAX68z1OBAt4Ak9sm8OqIjUDzhcvSYab9dkWk9T9Y8Vzv6sJkcE/
 Ni8tfUTe1q8mQB3BKW5P66cIV/En
X-Google-Smtp-Source: APXvYqwiKNa/Ye85X0oszI0CYo7Lz4dFSfdIbmeKepW9yG/6iPbK3pZjIjSSQfWXHHJjXiOnWohIsA==
X-Received: by 2002:a63:eb4f:: with SMTP id b15mr11253410pgk.418.1561007805149; 
 Wed, 19 Jun 2019 22:16:45 -0700 (PDT)
Received: from bobo.local0.net (193-116-72-140.tpgi.com.au. [193.116.72.140])
 by smtp.gmail.com with ESMTPSA id
 h12sm8235847pje.12.2019.06.19.22.16.43
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 19 Jun 2019 22:16:44 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 48/52] powerpc/64s/exception: simplify machine check early
 path
Date: Thu, 20 Jun 2019 15:14:55 +1000
Message-Id: <20190620051459.29573-49-npiggin@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190620051459.29573-1-npiggin@gmail.com>
References: <20190620051459.29573-1-npiggin@gmail.com>
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

machine_check_handle_early_common can reach machine_check_handle_early
directly now that it runs at the relocated address. The only reason to
do the rfi sequence is to enable MSR[ME]. Move that into a helper
function to make the normal code path a bit easier to read.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/exceptions-64s.S | 30 ++++++++++++++++++++--------
 1 file changed, 22 insertions(+), 8 deletions(-)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index 384f591ef078..be83a4e71814 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -1030,13 +1030,12 @@ EXC_COMMON_BEGIN(machine_check_early_common)
 	std	r3,_DAR(r1)
 	std	r4,_DSISR(r1)
 
-	mfmsr	r11			/* get MSR value */
-	ori	r11,r11,MSR_ME|MSR_RI	/* turn on ME, RI */
-	LOAD_HANDLER(r12, machine_check_handle_early)
-1:	mtspr	SPRN_SRR0,r12
-	mtspr	SPRN_SRR1,r11
-	RFI_TO_KERNEL
-	b	.	/* prevent speculative execution */
+	li	r10,MSR_RI
+	mtmsrd	r10,1
+
+	bl	enable_machine_check
+	b	machine_check_handle_early
+
 2:
 	/* Stack overflow. Stay on emergency stack and panic.
 	 * Keep the ME bit off while panic-ing, so that if we hit
@@ -1047,7 +1046,9 @@ EXC_COMMON_BEGIN(machine_check_early_common)
 	LOAD_HANDLER(r12, unrecover_mce)
 	li	r10,MSR_ME
 	andc	r11,r11,r10		/* Turn off MSR_ME */
-	b	1b
+	mtspr	SPRN_SRR0,r12
+	mtspr	SPRN_SRR1,r11
+	RFI_TO_KERNEL
 	b	.	/* prevent speculative execution */
 
 EXC_COMMON_BEGIN(machine_check_common)
@@ -2283,6 +2284,19 @@ CLOSE_FIXED_SECTION(virt_trampolines);
 
 USE_TEXT_SECTION()
 
+enable_machine_check:
+	mflr	r0
+	bcl	20,31,$+4
+0:	mflr	r3
+	addi	r3,r3,(1f - 0b)
+	mtspr	SPRN_SRR0,r3
+	mfmsr	r3
+	ori	r3,r3,MSR_ME
+	mtspr	SPRN_SRR1,r3
+	RFI_TO_KERNEL
+1:	mtlr	r0
+	blr
+
 /*
  * Hash table stuff
  */
-- 
2.20.1

