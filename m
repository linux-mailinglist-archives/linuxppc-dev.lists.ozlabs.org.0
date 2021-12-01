Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 067C646503C
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Dec 2021 15:43:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J41zT6H8Xz3cbg
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Dec 2021 01:43:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=PvLUzCUn;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62c;
 helo=mail-pl1-x62c.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=PvLUzCUn; dkim-atps=neutral
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J41yD4b3mz2ywX
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Dec 2021 01:42:12 +1100 (AEDT)
Received: by mail-pl1-x62c.google.com with SMTP id y7so17907925plp.0
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 01 Dec 2021 06:42:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CUx1zrTY0Ka69PwK0HuQcXj89HkMpPrH2ks6HQYuL00=;
 b=PvLUzCUnNm5YeXj6ZAtbwPl71pEZYUjHxklGPUyPSBCXWw0C7NJ/6IL9vilec+92UP
 Fhe9Xnje9k8seowjoExVQbqYzCy5cpqyQOewylzJINUbZOZ2sP3943uTFYi/Ma1LJWUT
 QgLuQPxMgTxSDdY5cPK09BoI4VHqJAvzQg6B1S/3vOumoyGvlsqqwQYJK3HPhUbSUByX
 CBwsmch8vdJt3hXIL7s7Mczrg5XZEKOjBvQlSHcCCbI82dReTXbg3191piod8IYjhR5S
 hIYkQw52+0wcmVp3HphmEA3d2sc3zbtUw4s6gZoZzZ3hA2gwaflY4AAAZ7PL69A5cjaf
 dJJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CUx1zrTY0Ka69PwK0HuQcXj89HkMpPrH2ks6HQYuL00=;
 b=IiklBSr69Nrx0+CzOD7pnrsCAHIVoek0Qq5ilgG6jER8MNvN00y3Ebl5Fg+38qW+6w
 QM/xbgaT4w0nnJ2+N8CkfrWcZfmMG1t3t3dLm3ClJ329Hdo15yIvOpu9RmlFzYFz+gqL
 LG32x+jgngfrpBT0NCihvkHPH6wVlI2jJOhtNnqT2MnxBpUKeRT65MD5BGZJPpcszUCG
 xqYx8LdMgaMhG23t4T36RwpP8tXmTUNuASSzZslzrQb+wlz1+jAXOnSCZCwqBuNIMoeJ
 kmfS/efbis6O3cnnnc7e37YXbwf59A4AzH+uM5juHi3jGVKoBNnca18LC2vGAHKxpHbz
 /qvA==
X-Gm-Message-State: AOAM531OGge/J76hLfolVkATgFd35vcm7/S/3clM+pZUpeuPueYNasK0
 719GKKHDqpy4+6AGN4SlEK0kJZr6jUQ=
X-Google-Smtp-Source: ABdhPJwzqSNebgaojNVhHnn9giXF0fOh0ZUp2sPXgc3TxY6gWQjb4cbmA4AYowPlNkm4UouQqm9xdA==
X-Received: by 2002:a17:902:d28a:b0:142:61ce:ae4c with SMTP id
 t10-20020a170902d28a00b0014261ceae4cmr7898798plc.35.1638369728209; 
 Wed, 01 Dec 2021 06:42:08 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (115-64-213-93.static.tpgi.com.au.
 [115.64.213.93])
 by smtp.gmail.com with ESMTPSA id e13sm29230pgb.8.2021.12.01.06.42.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Dec 2021 06:42:07 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v6 01/18] powerpc: Remove unused FW_FEATURE_NATIVE references
Date: Thu,  2 Dec 2021 00:41:36 +1000
Message-Id: <20211201144153.2456614-2-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20211201144153.2456614-1-npiggin@gmail.com>
References: <20211201144153.2456614-1-npiggin@gmail.com>
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

FW_FEATURE_NATIVE_ALWAYS and FW_FEATURE_NATIVE_POSSIBLE are always
zero and never do anything. Remove them.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/firmware.h | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/arch/powerpc/include/asm/firmware.h b/arch/powerpc/include/asm/firmware.h
index 97a3bd9ffeb9..9b702d2b80fb 100644
--- a/arch/powerpc/include/asm/firmware.h
+++ b/arch/powerpc/include/asm/firmware.h
@@ -80,8 +80,6 @@ enum {
 	FW_FEATURE_POWERNV_ALWAYS = 0,
 	FW_FEATURE_PS3_POSSIBLE = FW_FEATURE_LPAR | FW_FEATURE_PS3_LV1,
 	FW_FEATURE_PS3_ALWAYS = FW_FEATURE_LPAR | FW_FEATURE_PS3_LV1,
-	FW_FEATURE_NATIVE_POSSIBLE = 0,
-	FW_FEATURE_NATIVE_ALWAYS = 0,
 	FW_FEATURE_POSSIBLE =
 #ifdef CONFIG_PPC_PSERIES
 		FW_FEATURE_PSERIES_POSSIBLE |
@@ -91,9 +89,6 @@ enum {
 #endif
 #ifdef CONFIG_PPC_PS3
 		FW_FEATURE_PS3_POSSIBLE |
-#endif
-#ifdef CONFIG_PPC_NATIVE
-		FW_FEATURE_NATIVE_ALWAYS |
 #endif
 		0,
 	FW_FEATURE_ALWAYS =
@@ -105,9 +100,6 @@ enum {
 #endif
 #ifdef CONFIG_PPC_PS3
 		FW_FEATURE_PS3_ALWAYS &
-#endif
-#ifdef CONFIG_PPC_NATIVE
-		FW_FEATURE_NATIVE_ALWAYS &
 #endif
 		FW_FEATURE_POSSIBLE,
 
-- 
2.23.0

