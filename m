Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F3E4170230B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 May 2023 06:50:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QKRkJ5l8kz3fc9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 May 2023 14:50:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=K36/y/Wj;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52a; helo=mail-pg1-x52a.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=K36/y/Wj;
	dkim-atps=neutral
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QKRdq143Pz3fWd
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 May 2023 14:46:06 +1000 (AEST)
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-52cb78647ecso7460358a12.1
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 14 May 2023 21:46:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684125964; x=1686717964;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R59eTYwRMGFVr81odMGPF6ywJLx+SmnZQ3IQCn1fuwo=;
        b=K36/y/WjttDZ8iW/OWWJFwKLpObKRhNd43vA3q/gs+OWgEyQ0c6FCbgNvbUDCpq3Fp
         dWJCa0KwHnj3fMcUsEEfL4pOKgtGPufQjE2Z0/vKLpHN91+2TWF9iApqOZ0Bnw0BJjVU
         F7WQu2+wmNJBXXPOBkpml3dFYFMKWggMwjy2b01OseC69gzpuaapACZBynqkDDzOQUCX
         2B8jhqHIItblycP4qr7zTUr45AYoS7Tt3kGA6ySVOHcY+JTG8tqaEoM+Zk5HTFcF2V9O
         SIuYPxQh9s9Lo42US57oaRRUDUthSUYuiG2Zpp27Vn0mUBZS4rNlGL9FNPlyLIqH+Tzf
         jH5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684125964; x=1686717964;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R59eTYwRMGFVr81odMGPF6ywJLx+SmnZQ3IQCn1fuwo=;
        b=atmDQwFdxYh5X5qoQwJrH0RHvGI9W8gsBaVbUDW+XB4ruZvLwSsr3ObbZLIovXblYG
         SFxX88MUkyTqpc9H16POhcvBjHV7tMBgCAuCoBois+53iXu8ILmhRTkP6BoduudfpFUK
         NivB/FhxZS2HAoqCM7WeRXaj8ML0/uId8HDOs1IHx3Bfc6JNCiMNiDn+H7PDPDoWaCeb
         i8lM6OnumPgTX3lOu2RZQX2QXQlVhMEhL+xmsGRJgN1mXQFf29U1vGkN/mmZVBo3nfIi
         4vMTcKEAUfOHn6vay8wwfKyP6h/UFHgiLYEiNdPOlCBE986GKqubeU1myCGnsSQIy2Yx
         Wfzg==
X-Gm-Message-State: AC+VfDzl3EY+uR7UDBl2orTPub6/tm/hClDpcIAjsJfC3z1x+frrSEXd
	kzdHbZ2FN5U+VDympDPF25BbaIlhWJ0jaQ==
X-Google-Smtp-Source: ACHHUZ5U6WknxjyXrnh5WjMsbOUlHWnf7kJy6XJNGjJwaaDNoSexgVDcvCxGeayLRZjnph2pU2VcNg==
X-Received: by 2002:a17:902:d2c4:b0:1ac:71a7:a1fb with SMTP id n4-20020a170902d2c400b001ac71a7a1fbmr35181401plc.18.1684125964457;
        Sun, 14 May 2023 21:46:04 -0700 (PDT)
Received: from wheely.local0.net ([1.146.102.8])
        by smtp.gmail.com with ESMTPSA id u17-20020a170903125100b001a64851087bsm2514018plh.272.2023.05.14.21.46.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 May 2023 21:46:03 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 4/6] powerpc/32: Rearrange _switch to prepare for 32/64 merge
Date: Mon, 15 May 2023 14:45:41 +1000
Message-Id: <20230515044543.78903-5-npiggin@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230515044543.78903-1-npiggin@gmail.com>
References: <20230515044543.78903-1-npiggin@gmail.com>
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
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Change the order of some operations and change some register numbers in
preparation to merge 32-bit and 64-bit switch.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/entry_32.S | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/kernel/entry_32.S b/arch/powerpc/kernel/entry_32.S
index 089432128571..2d17b14bb9e5 100644
--- a/arch/powerpc/kernel/entry_32.S
+++ b/arch/powerpc/kernel/entry_32.S
@@ -236,12 +236,12 @@ _GLOBAL(_switch)
 	stwu	r1,-SWITCH_FRAME_SIZE(r1)
 	mflr	r0
 	stw	r0,SWITCH_FRAME_SIZE+4(r1)
+	stw	r1,KSP(r3)	/* Set old stack pointer */
 	/* r3-r12 are caller saved -- Cort */
 	SAVE_NVGPRS(r1)
 	stw	r0,_NIP(r1)	/* Return to switch caller */
-	mfcr	r10
-	stw	r10,_CCR(r1)
-	stw	r1,KSP(r3)	/* Set old stack pointer */
+	mfcr	r0
+	stw	r0,_CCR(r1)
 
 	/* The sync for SMP migration is taken care of, see entry_64.S */
 
@@ -258,8 +258,8 @@ _GLOBAL(_switch)
 	/* r3-r12 are destroyed -- Cort */
 	REST_NVGPRS(r1)
 
-	lwz	r4,_NIP(r1)	/* Return to _switch caller in new task */
-	mtlr	r4
+	lwz	r0,_NIP(r1)	/* Return to _switch caller in new task */
+	mtlr	r0
 	addi	r1,r1,SWITCH_FRAME_SIZE
 	blr
 
-- 
2.40.1

