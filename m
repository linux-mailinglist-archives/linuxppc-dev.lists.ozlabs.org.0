Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A0B973B6C49
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Jun 2021 03:51:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GDSBX5lnRz3bbq
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Jun 2021 11:51:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=llr7ICmS;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52a;
 helo=mail-pg1-x52a.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=llr7ICmS; dkim-atps=neutral
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com
 [IPv6:2607:f8b0:4864:20::52a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GDSB24Phzz2yYH
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Jun 2021 11:51:05 +1000 (AEST)
Received: by mail-pg1-x52a.google.com with SMTP id d12so17071248pgd.9
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Jun 2021 18:51:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2BY4zqE5R7ZIdaOWowLUWYRGD/T3G3jLZaSrpreZe1o=;
 b=llr7ICmSob6w2IAgnlxolq6vUfekxPr2mXc1oZycRiSQNvr+uuv82lgiDWAoMk1p/m
 8YSy/o6jteYqnZsQ1y5O9YwhgGpLgKWimJVrR3EkWG1vRNZQ185nLUDi/Y5zRn4elnIt
 l9OHnb0N9zuFP75vNr8RI4Mp1RTAlX0IZ6aF9dGrFkjEi1ZaFxLfaTdWg/omB5GuMH0O
 ZWr89E7WX4bTM6x2rS7sOODCQjwDt/IetVDCZEVkjwynyZgEORDNCDW/fF+pvsCWIeTx
 qcr7J5YPumE7+jc1DnaaJZbnPTgVt3PGKUNs5UFIujBvt2HMw6HhRDtIm4dFhqG72TIO
 PPrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2BY4zqE5R7ZIdaOWowLUWYRGD/T3G3jLZaSrpreZe1o=;
 b=mreHQ6P+FwBNEgkdEGGOJlbfQSwG2GhQnSA1B9ZmhjELvM6DAmEGMnykb/V/+58KZv
 cIhDVsZqiaAqflMbvchTMrIjyeIfCwee7BiKwp6VTftYMcS93KqzZAyYqmi9v1EYTP4o
 42Iws/Ld5+Z6/P+uL5NKRv65Qj6cjYe2lFyYF5x3N00yq61/j/kIv3U8v9J6xWHKrlYt
 +OdQd0lqM1vwvJaVm+AQIT2a8rBh6IiyjPYj90pVOFicwegMsXJ62S+gnnHl41iNhfGd
 73uBjcAcOZRS3tUUSAhbMVqUSxWeOpzebDDHKp3g3r/V+AKfbu4Z222RNpCIkh6pKNIF
 Ml3w==
X-Gm-Message-State: AOAM530hz19KaoIe2dYbqbP5d9vaGH/qxiCbYCD8fmIZNuge6qsr3Mgu
 HkQhO2Mh1yfOVbucEdcO5DcmiEfqX1M=
X-Google-Smtp-Source: ABdhPJwHYKx/j+Ec7kT03fswwgNxk4+USqCYg7naAH8+DOxuFzDhudX5rGRk4L3ORYimJZiXQQUZ4Q==
X-Received: by 2002:a63:3143:: with SMTP id x64mr26348600pgx.14.1624931463085; 
 Mon, 28 Jun 2021 18:51:03 -0700 (PDT)
Received: from bobo.ibm.com (220-244-87-52.tpgi.com.au. [220.244.87.52])
 by smtp.gmail.com with ESMTPSA id h24sm16023638pjv.27.2021.06.28.18.51.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Jun 2021 18:51:02 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/64s: fix hash page fault interrupt handler
Date: Tue, 29 Jun 2021 11:50:57 +1000
Message-Id: <20210629015057.1635519-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
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

