Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EC156DA82A
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Apr 2023 06:11:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pt4fq1rvkz3fS1
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Apr 2023 14:10:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=FlcQ8gm8;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1030; helo=mail-pj1-x1030.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=FlcQ8gm8;
	dkim-atps=neutral
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pt4dX1RsJz3fVW
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Apr 2023 14:09:51 +1000 (AEST)
Received: by mail-pj1-x1030.google.com with SMTP id h12-20020a17090aea8c00b0023d1311fab3so42427431pjz.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 06 Apr 2023 21:09:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680840589; x=1683432589;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hhIiRh7EzxhjdmrHT5VjZse9vIB/0sBoYqIF5QV+6tk=;
        b=FlcQ8gm8PUUZbtqRQTaKJ+AeZX7OWVqQj8kNTVfh7+bQMCmmkNcAAB+YS2MT7XJ9Dx
         76XaRq/rAZz3I53wh739EQbs22etkKw6YXGLLf/WIGUjyO7Q/3359Ea/6zJ3hV4ORJRy
         ytsRa7uQvzTA9COkQosO+GYGulM+qayO91pI7Fo8Jp/L5aXzRdOR2lQDP9r3jvRE1Xg/
         o3tBI2dlrLUrLGqA7GYsqxJ54dGb7wkwR4GoVxe4rzxsNqNLErIzyw0MOR1STd+6TWJC
         oOFHyVtER+7SjAqmlNQyRY0Bjarjl7rtHKoy7/X9Xtmqb/Lyhd1YBWWFJba0V31d4vX1
         L7nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680840589; x=1683432589;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hhIiRh7EzxhjdmrHT5VjZse9vIB/0sBoYqIF5QV+6tk=;
        b=5mWWXwZLBpjicrDu+AZ1WJkMUf9ItlthcNOlap0j/4MHFxvJ33Ii5FTY9A97vqEWKi
         cY+oQOg7TDskyPjaRDR9jsDrLUbUnac8YCj8O7kRA+V3fO7SMh2fhKXBo3JT29EwodeY
         4SM38wjq0cVyq1syb6GBt85S2/2APfVcHMwRMHmsQaI/kfYCrlmfTTiW33DANH2F8f7g
         aX+fIEalIaI8PXOslJ5ZgXhNlnXQA9uAfa2f533wFADup4Cuke9dRTsUphVDr8QkHgar
         01RvAznT2CMF/GPm9niIPLCfxFvkh0w4XJjfHVO+917hOjgry4DFp/kdy0LOWKlcmJQc
         2Jzw==
X-Gm-Message-State: AAQBX9f553au2cSF16DXTKxJD8zgKVosi48czhJiSMTNgIANap6YHlhC
	zLH7+pPGKHWXtfipt31AbQge3Cc1EYECeg==
X-Google-Smtp-Source: AKy350a5jYE3nE5BM5Mo3FVtm8TW5Cv8p8ECNpnN1CmmfLNrR33gqGAwj+rei1zPq3+K8k4z7DmGZw==
X-Received: by 2002:a17:903:1389:b0:19d:611:2815 with SMTP id jx9-20020a170903138900b0019d06112815mr1484173plb.42.1680840589506;
        Thu, 06 Apr 2023 21:09:49 -0700 (PDT)
Received: from wheely.local0.net ([203.59.189.25])
        by smtp.gmail.com with ESMTPSA id s3-20020a170902b18300b001990028c0c9sm2074432plr.68.2023.04.06.21.09.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Apr 2023 21:09:48 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/boot: Fix crt0.S current address branch form
Date: Fri,  7 Apr 2023 14:09:24 +1000
Message-Id: <20230407040924.231023-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.40.0
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

Use the preferred form of branch-and-link for finding the current
address so objtool doesn't think it is an unannotated intra-function
call.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/boot/crt0.S | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/boot/crt0.S b/arch/powerpc/boot/crt0.S
index 44544720daae..121cab9d579b 100644
--- a/arch/powerpc/boot/crt0.S
+++ b/arch/powerpc/boot/crt0.S
@@ -51,7 +51,7 @@ _zimage_start:
 _zimage_start_lib:
 	/* Work out the offset between the address we were linked at
 	   and the address where we're running. */
-	bl	.+4
+	bcl	20,31,.+4
 p_base:	mflr	r10		/* r10 now points to runtime addr of p_base */
 #ifndef __powerpc64__
 	/* grab the link address of the dynamic section in r11 */
@@ -274,7 +274,7 @@ prom:
 	mtsrr1	r10
 
 	/* Load FW address, set LR to label 1, and jump to FW */
-	bl	0f
+	bcl	20,31,0f
 0:	mflr	r10
 	addi	r11,r10,(1f-0b)
 	mtlr	r11
-- 
2.40.0

