Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BEEC72442F
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Jun 2023 15:19:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qb9zs2Pfrz3dtM
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Jun 2023 23:19:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=bDdQO5Z4;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42c; helo=mail-pf1-x42c.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=bDdQO5Z4;
	dkim-atps=neutral
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qb9z31jJTz3bkn
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 Jun 2023 23:18:37 +1000 (AEST)
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-65311774e52so2222546b3a.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 06 Jun 2023 06:18:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686057515; x=1688649515;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=d1/c9OzWaiciJysjSvl1gaCa2QQ5xdkMYGozaH30jAU=;
        b=bDdQO5Z4xKQRkRdDNeskzOTz66NKHWoEkwtf17znEmqOMyb5AuFFBYz9BQVirzocGN
         o7wP7CrWgI8Bu9Jr0dqw4QoC3WVc1gXn1T2cyFFlBIiV1qRoAQTsw32vv6C6R3oQ7tR/
         ByIV91STYE0gTppFQY4lNEnZnHf57j/R0OrKDfiPgSblYxZX8phfWOBXhAcyIWCHu6Xt
         oAG5qhHSxFyHuPkD/l7VN2HrhRoatQvOlchIJjVdIu4/lswCCsDjTM38waVitx4j5eri
         o6dz0vJzGs7W2WmyvxBTnuGBfWK/u+zLabu2r8SnOpwf2tWtr/TTWOuf2g+6cvelSuot
         gI/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686057515; x=1688649515;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d1/c9OzWaiciJysjSvl1gaCa2QQ5xdkMYGozaH30jAU=;
        b=KUtnPx5T0EGFRs6BYjZkz/g3z1PHvIL6r3A61wMaN3NQ7Egb0EXYTVJh4JL2VJbSfT
         F87UBXW0JGCf0jXR6l5QOkwJv4kmkEoOAT3xOl3VH4kdJOzIvS9IK2gJ5CYscf2qQwY/
         GfO/EntW1teAGl9z7iiQrE949eW/TPOu/Ard0U9u8cbSct9SpgCIx46muAwQ4M05358m
         Ik7S30KKQDdgmfGv7b+xC0ejTFdqZjy8H6D5vRuGL/OfkgXH5+vd/kLYd/VYVff738qt
         Mv/CuPr7P8XO5zq+jnlfAd3d3fNNXDL5gK4I4lW3Dds27YPZ1O3GnoLWf5fm7689uatn
         8xdQ==
X-Gm-Message-State: AC+VfDy/rmbnW6lOFysq8Lbk7DM6dKODSPYh6PYz+9bPJRnzVLaW7ibg
	BBKwJTFKxBTlgiPv/IRuV0YeipBtUVI=
X-Google-Smtp-Source: ACHHUZ5igTzDQVF9KJVcxQDl6lVkIQTbqRRAIfrBk3qpTw+v7xNZAb9peSa3o0LjCgjcimQJuO1LNA==
X-Received: by 2002:a05:6a21:788d:b0:10f:c81d:f18a with SMTP id bf13-20020a056a21788d00b0010fc81df18amr935501pzc.49.1686057514708;
        Tue, 06 Jun 2023 06:18:34 -0700 (PDT)
Received: from wheely.local0.net (58-6-230-127.tpgi.com.au. [58.6.230.127])
        by smtp.gmail.com with ESMTPSA id c17-20020a62e811000000b00658670ebe7dsm4088725pfi.119.2023.06.06.06.18.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jun 2023 06:18:34 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/32s: Fix LLVM SMP build
Date: Tue,  6 Jun 2023 23:18:28 +1000
Message-Id: <20230606131828.315427-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.40.1
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

LLVM assembler does not recognise 3-operand cmpi, use cmpwi.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/mm/book3s32/hash_low.S | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/mm/book3s32/hash_low.S b/arch/powerpc/mm/book3s32/hash_low.S
index 6925ce998557..a5a21d444e72 100644
--- a/arch/powerpc/mm/book3s32/hash_low.S
+++ b/arch/powerpc/mm/book3s32/hash_low.S
@@ -199,12 +199,12 @@ _GLOBAL(add_hash_page)
 	lis	r6, (mmu_hash_lock - PAGE_OFFSET)@ha
 	addi	r6, r6, (mmu_hash_lock - PAGE_OFFSET)@l
 10:	lwarx	r0,0,r6			/* take the mmu_hash_lock */
-	cmpi	0,r0,0
+	cmpwi	0,r0,0
 	bne-	11f
 	stwcx.	r8,0,r6
 	beq+	12f
 11:	lwz	r0,0(r6)
-	cmpi	0,r0,0
+	cmpwi	0,r0,0
 	beq	10b
 	b	11b
 12:	isync
@@ -512,12 +512,12 @@ _GLOBAL(flush_hash_pages)
 	lwz	r8, TASK_CPU(r8)
 	oris	r8,r8,9
 10:	lwarx	r0,0,r9
-	cmpi	0,r0,0
+	cmpwi	0,r0,0
 	bne-	11f
 	stwcx.	r8,0,r9
 	beq+	12f
 11:	lwz	r0,0(r9)
-	cmpi	0,r0,0
+	cmpwi	0,r0,0
 	beq	10b
 	b	11b
 12:	isync
-- 
2.40.1

