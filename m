Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 87C553B7A5A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Jun 2021 00:20:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GDzSg3g3Rz3bWH
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Jun 2021 08:20:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=LinAUT5M;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::532;
 helo=mail-pg1-x532.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=LinAUT5M; dkim-atps=neutral
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com
 [IPv6:2607:f8b0:4864:20::532])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GDzS90p7mz2yXh
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Jun 2021 08:20:08 +1000 (AEST)
Received: by mail-pg1-x532.google.com with SMTP id a7so140219pga.1
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Jun 2021 15:20:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KVyOVy7whQueTWP1sTcU8QFlgKdMcr7IO98Nb4Zpgno=;
 b=LinAUT5M61+QEWwICiK7KByINtzxP3i6Fe8XhGGbryFrg/BNRELkGEgG1jnZGz+GwN
 24Aj0Um5X2DT8Z/B/B/sLvvI3wq6iUao2/y+WcQQeY7QOP6lRgosPJBkEIc/YunDMLMm
 Zm+KTB2grJoxdE+teIandILWmkJrRRoTdbeyO99Vo90xVafBOn0Rvj4BeF+Z3NNcRVlr
 LhAxu6/MsSWQEl5rea963qayDb618BwVUInA6JuW1xivJoIETPm0aZV8VtEJhyZaq7Ad
 hWs6LNhelsHO6/DrqNYnetdqcRq6759lUHS1vkmfh1IIBoITXhg1wSQZirlTfFjOSZri
 dSoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KVyOVy7whQueTWP1sTcU8QFlgKdMcr7IO98Nb4Zpgno=;
 b=E7S64st6Q0SkJj2NSsRMHRLBeZedaepUCix7oc7Lvvb54AtwKxxvJq0FTkiqxYZf85
 mbePJtzV3nYK10xYhD7aQIxWo5a2tZ2CD5jlH7FU8ZSsP/uoFpThWDrLKssC3tuLiAGS
 TOVxy7abIB73Ljx7KFDidzCuL38LSeIsyXV1wLEF2JhBZR0HaUrqBujBTOzxf2EKl4ZL
 07grHWuIwUs+K4KPueveQmRIwwIKaF3zReHMXeuMl9rYEMZ/ta/s7JT7Zv/zDZN/7IBG
 +vQ5YnnYu83wqPn32DqolQZ4TSeLre/G6SLfpG+di9Hmiez2ueDiEmVN/LHTvnYMhpSd
 PUDA==
X-Gm-Message-State: AOAM531yRMFV/RL9fVqtXYILqRnUAq0qSY5KQSakeXLdj9+ksP+qa9Ar
 ++aYlIAPNnMYfMv/Hapi1tMUlpwDtA4=
X-Google-Smtp-Source: ABdhPJxiG4wMckNMbQj42BYxGwLP6H46+rgaOslX//Fbwgw/gjfGlwBYfi+lTkZoCJaVea6yXB4g6A==
X-Received: by 2002:a62:f24b:0:b029:309:d1a1:55fb with SMTP id
 y11-20020a62f24b0000b0290309d1a155fbmr23765356pfl.61.1625005206199; 
 Tue, 29 Jun 2021 15:20:06 -0700 (PDT)
Received: from bobo.ibm.com (220-244-87-52.tpgi.com.au. [220.244.87.52])
 by smtp.gmail.com with ESMTPSA id l7sm19316583pgb.19.2021.06.29.15.20.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Jun 2021 15:20:05 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 1/9] powerpc/64s: fix hash page fault interrupt handler
Date: Wed, 30 Jun 2021 08:19:49 +1000
Message-Id: <20210629221957.1947577-2-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210629221957.1947577-1-npiggin@gmail.com>
References: <20210629221957.1947577-1-npiggin@gmail.com>
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
Cc: Sachin Sant <sachinp@linux.vnet.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The early bad fault or key fault test in do_hash_fault() ends up calling
into ___do_page_fault without having gone through an interrupt handler
wrapper (except the initial _RAW one). This can end up calling local irq
functions while the interrupt has not been reconciled, which will likely
cause crashes and it trips up on a later patch that adds more assertions.

pkey_exec_prot from selftests causes this path to be executed.

There is no real reason to run the in_nmi() test should be performed
before the key fault check. In fact if a perf interrupt in the hash
fault code did a stack walk that was made to take a key fault somehow
then running ___do_page_fault could possibly cause another hash fault
causing problems. Move the in_nmi() test first, and then do everything
else inside the regular interrupt handler function.

Fixes: 3a96570ffceb ("powerpc: convert interrupt handlers to use wrappers")
Reported-by: Sachin Sant <sachinp@linux.vnet.ibm.com>
Tested-by: Sachin Sant <sachinp@linux.vnet.ibm.com>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/mm/book3s64/hash_utils.c | 24 +++++++++++-------------
 1 file changed, 11 insertions(+), 13 deletions(-)

diff --git a/arch/powerpc/mm/book3s64/hash_utils.c b/arch/powerpc/mm/book3s64/hash_utils.c
index 96d9aa164007..ac5720371c0d 100644
--- a/arch/powerpc/mm/book3s64/hash_utils.c
+++ b/arch/powerpc/mm/book3s64/hash_utils.c
@@ -1522,8 +1522,8 @@ int hash_page(unsigned long ea, unsigned long access, unsigned long trap,
 }
 EXPORT_SYMBOL_GPL(hash_page);
 
-DECLARE_INTERRUPT_HANDLER_RET(__do_hash_fault);
-DEFINE_INTERRUPT_HANDLER_RET(__do_hash_fault)
+DECLARE_INTERRUPT_HANDLER(__do_hash_fault);
+DEFINE_INTERRUPT_HANDLER(__do_hash_fault)
 {
 	unsigned long ea = regs->dar;
 	unsigned long dsisr = regs->dsisr;
@@ -1533,6 +1533,11 @@ DEFINE_INTERRUPT_HANDLER_RET(__do_hash_fault)
 	unsigned int region_id;
 	long err;
 
+	if (unlikely(dsisr & (DSISR_BAD_FAULT_64S | DSISR_KEYFAULT))) {
+		hash__do_page_fault(regs);
+		return;
+	}
+
 	region_id = get_region_id(ea);
 	if ((region_id == VMALLOC_REGION_ID) || (region_id == IO_REGION_ID))
 		mm = &init_mm;
@@ -1571,9 +1576,10 @@ DEFINE_INTERRUPT_HANDLER_RET(__do_hash_fault)
 			bad_page_fault(regs, SIGBUS);
 		}
 		err = 0;
-	}
 
-	return err;
+	} else if (err) {
+		hash__do_page_fault(regs);
+	}
 }
 
 /*
@@ -1582,13 +1588,6 @@ DEFINE_INTERRUPT_HANDLER_RET(__do_hash_fault)
  */
 DEFINE_INTERRUPT_HANDLER_RAW(do_hash_fault)
 {
-	unsigned long dsisr = regs->dsisr;
-
-	if (unlikely(dsisr & (DSISR_BAD_FAULT_64S | DSISR_KEYFAULT))) {
-		hash__do_page_fault(regs);
-		return 0;
-	}
-
 	/*
 	 * If we are in an "NMI" (e.g., an interrupt when soft-disabled), then
 	 * don't call hash_page, just fail the fault. This is required to
@@ -1607,8 +1606,7 @@ DEFINE_INTERRUPT_HANDLER_RAW(do_hash_fault)
 		return 0;
 	}
 
-	if (__do_hash_fault(regs))
-		hash__do_page_fault(regs);
+	__do_hash_fault(regs);
 
 	return 0;
 }
-- 
2.23.0

