Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C9AE702308
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 May 2023 06:49:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QKRjM70qNz3dyX
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 May 2023 14:49:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=Kq4tfyKg;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::529; helo=mail-pg1-x529.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=Kq4tfyKg;
	dkim-atps=neutral
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QKRdl4Nzpz3cDG
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 May 2023 14:46:03 +1000 (AEST)
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-51452556acdso8333950a12.2
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 14 May 2023 21:46:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684125961; x=1686717961;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LegGZF5zpwOw9SSHp7oQFfhQgmATjrmoKgqyv+YTxxU=;
        b=Kq4tfyKgeW6pgHNcdGK8WTUiVqjHWAPaiEtulIoMIEmu0lHQxk6iPNgxlb+NUhMBEv
         T2fk9cBce9y3EMLs8JIT5LB04p9Xu9eUmK2PBma34MkdFSRfkTIifQKoQE5TU70FcyhP
         iS1hrgs8mqrF4ykSvuLtsMqEmZagSGfz6QONZUB8rpnG5KlFCL/U+C/bQRnSJcgRTpEv
         u025yiXdw7rWjhNPuzwZk0v6VN4ddW4mLE1UYVrCdovd+WmR5c7twfYfu6dmTwZHl2Mp
         LxUkR5Z/qSFnf5aiaXZa66UZNmMi4osuOD/aGmKgKFVQX2F4kvG5ntqnKDthZ6kmHuyJ
         5K6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684125961; x=1686717961;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LegGZF5zpwOw9SSHp7oQFfhQgmATjrmoKgqyv+YTxxU=;
        b=F4LLPZ3uPgVXJRVJeSg0p5PYQBFudmoukEIKmVMp8FO5aOjD7d5pC4L8lh6Ux+sJcQ
         Y/nYWNdh1PqNrY5crDU6jLUW2USJBg9kk2ryyRbHEWJPQylWmmz/HqTWZmh9uaoLtZxP
         896542jMpdyYClGJtF9H9onNnQvAYXTKrSbapQHrBQmAfmCVSHxKbz0uxDzFkmwtUxoj
         YfmlWuK1oHUqECFN97FQOykjWezsNnNbqi1vTtq3cm7dFk0d0XlZ1aSCeqXRSCdBV0mz
         EhgvYutxINYt9iREABZ2pTVIaSQQll4ZJy4C9TU/Ydm0oLfpzQvinQH1N5rxnSKWPDsX
         yxSw==
X-Gm-Message-State: AC+VfDzp5xkhyKa/1ilivHrkIC5bKhFLHA9PbySYt+bg6CXi/ZQNxOZO
	jF0hkdjPNFKXTi7GGYpvBhNU1RIBMPi/ow==
X-Google-Smtp-Source: ACHHUZ4oUKvSIqkBFsPCwrUvCrqIgPJi3k35Ldx1XB3JAftqKVu556fd0406jFEkERwiBugCequJBg==
X-Received: by 2002:a17:902:ec82:b0:1a9:581d:3efb with SMTP id x2-20020a170902ec8200b001a9581d3efbmr43322910plg.6.1684125960959;
        Sun, 14 May 2023 21:46:00 -0700 (PDT)
Received: from wheely.local0.net ([1.146.102.8])
        by smtp.gmail.com with ESMTPSA id u17-20020a170903125100b001a64851087bsm2514018plh.272.2023.05.14.21.45.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 May 2023 21:46:00 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 3/6] powerpc/32: Remove sync from _switch
Date: Mon, 15 May 2023 14:45:40 +1000
Message-Id: <20230515044543.78903-4-npiggin@gmail.com>
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

