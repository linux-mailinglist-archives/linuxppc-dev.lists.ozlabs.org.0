Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D0BFB4C76E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jun 2019 08:23:26 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45TsFk4jmJzDqP9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jun 2019 16:23:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::441; helo=mail-pf1-x441.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="fFrtkQ1o"; 
 dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45TqmB6qNMzDqv8
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Jun 2019 15:16:10 +1000 (AEST)
Received: by mail-pf1-x441.google.com with SMTP id p184so964618pfp.7
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jun 2019 22:16:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XK0z2sodRjLiq0Py7J6ZCsmhyaz31IBp/GjjI92KHiQ=;
 b=fFrtkQ1o/8YFQF05jHRttSmlbRNnkAgY//ZK9aT+4oIA7o5e0P3MQZL2RpWARMOxKx
 M8MyWAwvtOikQMCjxtYI0D1aQrGb0eNi95mziKwKFesGfC8nJomXBBT+8Fk4X2+TEYw9
 EqVRk6/D3ixHjoNKFv7bCLVMAOPAr1wNe0w62N5TuHxuMH7Y5IDLfVf/o7cqsSX/BXPT
 3wxwTkm34uK75DzpFgle4ZdTBP5cQKtRdPFD0uZ8x3bB0XSPeyr0qgi/m8Nvihjjjkit
 1ei6TtqW8msv0OXneUgq/0isuPy4JFry+Nsa7kUkFg4TjNR/aM9AKqq8tX054xCqTw7S
 MsWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XK0z2sodRjLiq0Py7J6ZCsmhyaz31IBp/GjjI92KHiQ=;
 b=AlDtiyPRuKdbLR/1uzM3FNpxvm5g2yjfGG9p8ckF7az6pDpabLPxS0sRbrCeOrFV3q
 BU33Qjb9DhxhyD6kMJH5Dbv37V9PMbk/mbOD1tB9GJQ7LRrGks26IyiG+Bado58IhfZ4
 7y9uoN7pQV6viwq9spyfmcOLr77C6zH4CV++wVH7OFDTvyY6IfSLKTwOV+/ICCKXR76P
 RLAfOeHMXE34WCkDyx8cCYjrsfqqYrt0ayVtBC4q9bi3ioJa44O+UHEqXv/Htyqi4F3U
 jdj4WUXCpbLRc/xUJHzFAQ0/ALZle0ueA35x7++8QtoPBrGBChUOTN1Gy04VgqCDfrCj
 CzsQ==
X-Gm-Message-State: APjAAAWnzFS2CzkDzD0SVRE/1jVKxi+B51ia43gInpKMqPpieGzNO171
 xheDPvFY/6k+xFMaRA8aH0NsTD6N
X-Google-Smtp-Source: APXvYqx1NejjlGkne8QLvmOph+DXO0U1lhMYa4PZBbtbTaEaGJ2QbHQU51IP5uhhvC8avhTHTyKKWg==
X-Received: by 2002:a63:f957:: with SMTP id q23mr11402510pgk.326.1561007767995; 
 Wed, 19 Jun 2019 22:16:07 -0700 (PDT)
Received: from bobo.local0.net (193-116-72-140.tpgi.com.au. [193.116.72.140])
 by smtp.gmail.com with ESMTPSA id
 h12sm8235847pje.12.2019.06.19.22.16.06
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 19 Jun 2019 22:16:07 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 32/52] powerpc/64s/exception: windup use r9 consistently to
 restore SPRs
Date: Thu, 20 Jun 2019 15:14:39 +1000
Message-Id: <20190620051459.29573-33-npiggin@gmail.com>
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

Trivial code change, r3->r9.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/exceptions-64s.S | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index 539bb1b83d90..804438669454 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -914,8 +914,8 @@ EXC_COMMON_BEGIN(system_reset_common)
 	/* Move original SRR0 and SRR1 into the respective regs */
 	ld	r9,_MSR(r1)
 	mtspr	SPRN_SRR1,r9
-	ld	r3,_NIP(r1)
-	mtspr	SPRN_SRR0,r3
+	ld	r9,_NIP(r1)
+	mtspr	SPRN_SRR0,r9
 	ld	r9,_CTR(r1)
 	mtctr	r9
 	ld	r9,_XER(r1)
@@ -1075,8 +1075,8 @@ EXC_COMMON_BEGIN(machine_check_common)
 	/* Move original SRR0 and SRR1 into the respective regs */	\
 	ld	r9,_MSR(r1);				\
 	mtspr	SPRN_SRR1,r9;				\
-	ld	r3,_NIP(r1);				\
-	mtspr	SPRN_SRR0,r3;				\
+	ld	r9,_NIP(r1);				\
+	mtspr	SPRN_SRR0,r9;				\
 	ld	r9,_CTR(r1);				\
 	mtctr	r9;					\
 	ld	r9,_XER(r1);				\
@@ -1781,8 +1781,8 @@ TRAMP_REAL_BEGIN(hmi_exception_early)
 	/* Move original HSRR0 and HSRR1 into the respective regs */
 	ld	r9,_MSR(r1)
 	mtspr	SPRN_HSRR1,r9
-	ld	r3,_NIP(r1)
-	mtspr	SPRN_HSRR0,r3
+	ld	r9,_NIP(r1)
+	mtspr	SPRN_HSRR0,r9
 	ld	r9,_CTR(r1)
 	mtctr	r9
 	ld	r9,_XER(r1)
-- 
2.20.1

