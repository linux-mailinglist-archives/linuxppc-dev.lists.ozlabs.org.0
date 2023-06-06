Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FEEA724463
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Jun 2023 15:29:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QbBBz1Yk0z3f86
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Jun 2023 23:28:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=puouKwUo;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62b; helo=mail-pl1-x62b.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=puouKwUo;
	dkim-atps=neutral
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QbB6Y5RKtz3dyR
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 Jun 2023 23:25:09 +1000 (AEST)
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-1b010338d82so28456395ad.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 06 Jun 2023 06:25:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686057907; x=1688649907;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R59eTYwRMGFVr81odMGPF6ywJLx+SmnZQ3IQCn1fuwo=;
        b=puouKwUofx+uDCMD4TXF6jYPVR/gUPsSXtPuOWb941NrqrO0KAFLl14LEFrQF1ryz0
         rKn22YwnGiT+ZdPoal6CnjmfwI7rLS/nGTGVZ+QuW+aRbANWmgy6CCzYaNkusXA8pcq8
         /9v+g6MfhQfNbGlqXBFlk6k23O+tuaJukqXwSrgiCjimniYp23xIcGUhA87duHlEQeb/
         Dl9JbcdSttiKzA70K6VJyfv/CKCgrgbyPeyXXZLcvvcPz9nRF8KWGYMTaJUoqJ6iJkdY
         Mhp9xZAyPUgACQ/Pg8FGxiAc6OhLiTxsaSFxlgQzwM9KmwHuNJ7S9hRqDKbkjtoUmaMi
         3Tag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686057907; x=1688649907;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R59eTYwRMGFVr81odMGPF6ywJLx+SmnZQ3IQCn1fuwo=;
        b=RdZ3hZywNhasmpRACYjD5JBl0y2bZNxngY8OlUP4DQ/Ow4OAWC76cQGBoIqS2mY2m8
         KQ725o4XWqfJ/PAJEPTxE6I/hoNI2x0fkRJ1VtkcQCiuTotqwkw1ytuT2Ft9WEPz3iZR
         TTl1etzXOc96nn4mFJV/X5rK4Pfq81Ayqfr4AeWldMGGky65LDJNci1+zNMTLtqkkRRQ
         EiDyLwJ3MmowS+DnJgEFTUUwBHnOiR/sBzTjK+qeyvjt00eh2s77ZnJA8das48OaQXca
         HFFnDvtKi86ZkwHcjxAVvsB186v8mnrW5x+N3geLSRoEuYUnhXvgrLBxoGFbK+bDSw3s
         m65A==
X-Gm-Message-State: AC+VfDy6PfvkR7wK/OAgtEAKEaMUDgS9oRDc3Wr9WDYKSrsXhR/+0/tV
	f+nReB7CHo0ifHZYUUTzxBXgZ36VIL4=
X-Google-Smtp-Source: ACHHUZ7aKTiKLpruJ/kpy73Amh5rHSV5IZMJM1YwjEcEhBkrBjQ/WH/NRZkQohQjEdbVStfGVxi/LQ==
X-Received: by 2002:a17:903:110d:b0:1b1:9802:a31b with SMTP id n13-20020a170903110d00b001b19802a31bmr662001plh.41.1686057907285;
        Tue, 06 Jun 2023 06:25:07 -0700 (PDT)
Received: from wheely.local0.net (58-6-230-127.tpgi.com.au. [58.6.230.127])
        by smtp.gmail.com with ESMTPSA id jd18-20020a170903261200b001ac2c3e54adsm8522132plb.118.2023.06.06.06.25.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jun 2023 06:25:06 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 4/6] powerpc/32: Rearrange _switch to prepare for 32/64 merge
Date: Tue,  6 Jun 2023 23:24:45 +1000
Message-Id: <20230606132447.315714-5-npiggin@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230606132447.315714-1-npiggin@gmail.com>
References: <20230606132447.315714-1-npiggin@gmail.com>
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

