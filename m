Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 531444C796
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jun 2019 08:42:27 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Tsgh69JYzDqQl
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jun 2019 16:42:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::441; helo=mail-pf1-x441.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="JcPTH5Wg"; 
 dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45TqmY5DmpzDqvv
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Jun 2019 15:16:29 +1000 (AEST)
Received: by mail-pf1-x441.google.com with SMTP id a186so969203pfa.5
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jun 2019 22:16:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Qi+gU4bdS1324GMD/HpQ+oVtyQ4HGJmZVo7c1VMCmPY=;
 b=JcPTH5WgRXdIZPQ3fiZSSKdAK/awwwXEQpssGOyxXtPpfnCzSemHVN8VoXwHke8gqQ
 DU+IgLwFikAYbVmiAA3hsortAF/18G1l0ye+f5xw2C4pJmUSPe9bFFJjQJPPKBwb7+NX
 BHUj7Ob2Mk7ZI1YPjdqvteb0VUdDaxasHYdaPGWblBUNw94LYaERA7PbDUS6Fy3U9cEh
 mumEiJH8w5x0JAVrFtVGJXJdd99Wm9VGzvmhPChhAqPgQY8Opmw5HHwqk/7KD7DlSf97
 Oxr+GisKQE5IIxiaEuZakUoK/+qhs3R3aMNozrrKv1CV/i08pk4EESD7aADOJQNcegka
 FIkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Qi+gU4bdS1324GMD/HpQ+oVtyQ4HGJmZVo7c1VMCmPY=;
 b=dMTC3KxeJNk225+3yykAaSTfwAmZxXIAW19QFjMGm/L9tgbMHzKSl49yJq2MV3YP0R
 TlkXu47aKF+tCI/Se9lOw5uEgKuxmjf5mmXCsuT/ZGciVSnMuzb+heWlaIXThn2Y21IW
 D6hWG2ut744Dq9M+FUkdA+j5ICDwO7p0vqh30r+RS+uq1vZi+wH7aLi621Gw1FgxBTtF
 ZNHFvOrZ/z4SdLnlVjfko5HTByX9J5zkqmhmdCargNFsBGLJRHpiUADMC9xMXZspwIfX
 R1Ap/j99ru2nGGLv1UZl5GlxAnLOzz147jdkCZE2UN86fcvY9TA0IH8sp3JkvrcmPL4w
 Er+Q==
X-Gm-Message-State: APjAAAUtnMTxlqaU8PsBslskinMy/x5nRNrGP/BOksMRCZhDGGP7lnQy
 gBF54VGdz4Kv1NfQUyDVDeWoICDi
X-Google-Smtp-Source: APXvYqxwrQMNp/5W/QRN8KVWGsynQ4K5ulaIB32V7+7NXkqon1sN7glpziKTjoceqR6Aq4/G4UZasw==
X-Received: by 2002:a63:d944:: with SMTP id e4mr11141099pgj.261.1561007787647; 
 Wed, 19 Jun 2019 22:16:27 -0700 (PDT)
Received: from bobo.local0.net (193-116-72-140.tpgi.com.au. [193.116.72.140])
 by smtp.gmail.com with ESMTPSA id
 h12sm8235847pje.12.2019.06.19.22.16.25
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 19 Jun 2019 22:16:27 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 41/52] powerpc/tm: update comment about interrupt
 re-entrancy
Date: Thu, 20 Jun 2019 15:14:48 +1000
Message-Id: <20190620051459.29573-42-npiggin@gmail.com>
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

Since the system reset interrupt began to use its own stack, and
machine check interrupts have done so for some time, r1 can be
changed without clearing MSR[RI], provided no other interrupts
(including SLB misses) are taken.

MSR[RI] does have to be cleared when using SCRATCH0, however.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/tm.S | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kernel/tm.S b/arch/powerpc/kernel/tm.S
index 9fabdce255cd..6ba0fdd1e7f8 100644
--- a/arch/powerpc/kernel/tm.S
+++ b/arch/powerpc/kernel/tm.S
@@ -148,7 +148,7 @@ _GLOBAL(tm_reclaim)
 	/* Stash the stack pointer away for use after reclaim */
 	std	r1, PACAR1(r13)
 
-	/* Clear MSR RI since we are about to change r1, EE is already off. */
+	/* Clear MSR RI since we are about to use SCRATCH0, EE is already off */
 	li	r5, 0
 	mtmsrd	r5, 1
 
@@ -474,7 +474,7 @@ restore_gprs:
 
 	REST_GPR(7, r7)
 
-	/* Clear MSR RI since we are about to change r1. EE is already off */
+	/* Clear MSR RI since we are about to use SCRATCH0. EE is already off */
 	li	r5, 0
 	mtmsrd	r5, 1
 
-- 
2.20.1

