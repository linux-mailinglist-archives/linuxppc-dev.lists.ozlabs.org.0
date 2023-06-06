Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 385E5724462
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Jun 2023 15:28:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QbB9x05wcz3ffl
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Jun 2023 23:28:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=rZ5Mb5Jl;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62a; helo=mail-pl1-x62a.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=rZ5Mb5Jl;
	dkim-atps=neutral
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QbB6W2mrTz3dwS
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 Jun 2023 23:25:07 +1000 (AEST)
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-1b02085bf8dso26891555ad.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 06 Jun 2023 06:25:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686057904; x=1688649904;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LegGZF5zpwOw9SSHp7oQFfhQgmATjrmoKgqyv+YTxxU=;
        b=rZ5Mb5Jlf8+x0NZiYcW69j6lhGf9sqPrR40UP/u6rfZueRf4WQ3oukHgywaTD6JQBq
         ijKTecHad/VSZ+J/NAugGvd8vycB0LVbCPTgF/cGWRFw+MWeBtKgagkay19pe4WLvrkc
         HOI4NJgojUJNIWyfIcrCsBTeMJIr5LctcQSHqkjfCaQxXA3SeMd/EE/3MHe6zERbbWg9
         NgO6YO0Y5HyAHSg1ePMMnAiEJZwT4DkFfvFp8uYr4rhKBsBVXA2y6JKSQmAC1KEzCqvr
         pAR/5TbQXfk35WGi95kp8JST3Stv/1ZHMyWbMT0AtDedvsklLiIcX5WC4sO6pdKK683I
         WBBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686057904; x=1688649904;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LegGZF5zpwOw9SSHp7oQFfhQgmATjrmoKgqyv+YTxxU=;
        b=alj2LL++ea0UOFEdNwF45jvECwUSzkEL4+iqKUNDA8pdqOsm3E9BP11osTZxTYzqSy
         MdPyRW7sb8clKGYknM3DoqImQvVJI6WI+UYwiarI21Tk0p23O61STZiaRWnXxsaPPW8X
         a2fhF4mYcowr1tNF3nIJaTfuXzrw3NRsYdBJW3SokkGOY8posZyFRhe68ZfyZNTHadTa
         hgoyoGTiwuWehRb3ajJLs/uCAkJg04lCwXPGdGF8W4Tx0y8zW94+lpNAgR+dTu2pvGBN
         fyT2wRiYgYlLC1LQbFbs1uEIG8l11jRq5UK5D/+yl6aFmntB3F+t/4eeBkvYAhl1blCR
         ZKMw==
X-Gm-Message-State: AC+VfDxCbj8AIQ5iSnA66guYNJ+/WD1SCE5mWF1PyzGHSUy3pmm0O8jd
	nuC2GdX23PKKVLHTg2g7ZSVxj3t9XdE=
X-Google-Smtp-Source: ACHHUZ6bh3HhOHy/0K6D4ctGw6Oh2o/NoLq7ZVK90aFv/OXQQnITHZCfMzKx4WcBrZV8INHJFSBU7w==
X-Received: by 2002:a17:902:da89:b0:1b0:3742:e718 with SMTP id j9-20020a170902da8900b001b03742e718mr1003564plx.25.1686057904673;
        Tue, 06 Jun 2023 06:25:04 -0700 (PDT)
Received: from wheely.local0.net (58-6-230-127.tpgi.com.au. [58.6.230.127])
        by smtp.gmail.com with ESMTPSA id jd18-20020a170903261200b001ac2c3e54adsm8522132plb.118.2023.06.06.06.25.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jun 2023 06:25:04 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 3/6] powerpc/32: Remove sync from _switch
Date: Tue,  6 Jun 2023 23:24:44 +1000
Message-Id: <20230606132447.315714-4-npiggin@gmail.com>
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

64-bit has removed the sync from _switch since commit 9145effd626d1
("powerpc/64: Drop explicit hwsync in context switch"). The same
logic there should apply to 32-bit. Remove the sync and replace with
a placeholder comment (32 and 64 will be merged with a later change).

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/entry_32.S | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/arch/powerpc/kernel/entry_32.S b/arch/powerpc/kernel/entry_32.S
index 47f0dd9a45ad..089432128571 100644
--- a/arch/powerpc/kernel/entry_32.S
+++ b/arch/powerpc/kernel/entry_32.S
@@ -243,13 +243,7 @@ _GLOBAL(_switch)
 	stw	r10,_CCR(r1)
 	stw	r1,KSP(r3)	/* Set old stack pointer */
 
-#ifdef CONFIG_SMP
-	/* We need a sync somewhere here to make sure that if the
-	 * previous task gets rescheduled on another CPU, it sees all
-	 * stores it has performed on this one.
-	 */
-	sync
-#endif /* CONFIG_SMP */
+	/* The sync for SMP migration is taken care of, see entry_64.S */
 
 	tophys(r0,r4)
 	mtspr	SPRN_SPRG_THREAD,r0	/* Update current THREAD phys addr */
-- 
2.40.1

