Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 60BA73B7E50
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Jun 2021 09:47:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GFD2F2Q6jz3bWD
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Jun 2021 17:47:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=HzTIEKhB;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102c;
 helo=mail-pj1-x102c.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=HzTIEKhB; dkim-atps=neutral
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GFD1l72fjz2xvG
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Jun 2021 17:46:34 +1000 (AEST)
Received: by mail-pj1-x102c.google.com with SMTP id n11so1211210pjo.1
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Jun 2021 00:46:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KVyOVy7whQueTWP1sTcU8QFlgKdMcr7IO98Nb4Zpgno=;
 b=HzTIEKhBOskZP77Ul047OL9ePpHKy+V6Qd28eHinjWtCUcDe6otCHoh5fcc1iON3ZN
 ZjdiDVwn9dT481rGkjsCTUJAQit8kOH/YIPXBwUPbG5oEAQ3W2nVRFp9rXaLrqlqfdfA
 B+xJL0l9AuDYhsIGMLXVKJoRc/XfTCFJI1iJEdWx7pfL0qAGYzfPd7dI5Raafynjbf44
 2NXlN3IEs2XDECQfT9I+AtI7Tr4GrVrcpqSAy9h3rnDH+uTztPiV9MGuEv8AJB2KzfyT
 2iKwk/pxsSflDN7dYMpL62TL8y+ld8GhZIGKO3NZwyZxXbTpDXWbMzR9R8uCYUQJrrGK
 0OZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KVyOVy7whQueTWP1sTcU8QFlgKdMcr7IO98Nb4Zpgno=;
 b=sCZiuGCpXPWiJkgUlbDBPs1wt5A7FRubaUKaoGpVCNsNjuha8vtVZMOkM5/8Yiklmg
 aZOTTWUmyfkpapjc8z7uMXrsLT5cQgl9f6Gg2D4Kex0ORKDJ7Jx4wGWYwldIf7Vidv54
 02eDSz2SwTgoCIa80kGLWxLGntNgZ4dQBvJSV3bNkxU+pRw/Wigee/Y2TeF7cFUZflO/
 53aVNhPQAYw0O714EMgVvHXYdjhl6aJeJ9nvN/iCDVXJFoRjGLE+yL8miJI1Pm+Uflq7
 GGWQcokQ8acs6GHGatNR78ndOvJUmiY6AkNNZpmHiVoFKSIfWj6P68u3djDQf1aUsKm1
 KVnQ==
X-Gm-Message-State: AOAM532l3wQfKmiEXmIh1PKwdBnkkG7LWpEzOt93JYR5LkrdNDagj7QT
 gmpiC4JLMzNadvIUOAJjLd4msFW1EQE=
X-Google-Smtp-Source: ABdhPJynAvcXyk9HW1a8QoTRWBxa3cGwZNlbPyNzbYvxUiHcpeD4ONMvinmOG0NeBKz8x+ckLJycMw==
X-Received: by 2002:a17:90a:17e7:: with SMTP id
 q94mr37489467pja.117.1625039190813; 
 Wed, 30 Jun 2021 00:46:30 -0700 (PDT)
Received: from bobo.ibm.com (220-244-87-52.tpgi.com.au. [220.244.87.52])
 by smtp.gmail.com with ESMTPSA id g4sm20503369pfu.134.2021.06.30.00.46.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Jun 2021 00:46:30 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 1/9] powerpc/64s: fix hash page fault interrupt handler
Date: Wed, 30 Jun 2021 17:46:13 +1000
Message-Id: <20210630074621.2109197-2-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210630074621.2109197-1-npiggin@gmail.com>
References: <20210630074621.2109197-1-npiggin@gmail.com>
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

