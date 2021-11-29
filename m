Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9190C460CFD
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Nov 2021 04:08:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J2Vfz46Ssz3cTQ
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Nov 2021 14:08:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=iE0nXswh;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1036;
 helo=mail-pj1-x1036.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=iE0nXswh; dkim-atps=neutral
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J2VfR3XxNz2yp6
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Nov 2021 14:08:14 +1100 (AEDT)
Received: by mail-pj1-x1036.google.com with SMTP id
 nh10-20020a17090b364a00b001a69adad5ebso12849990pjb.2
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 28 Nov 2021 19:08:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CUx1zrTY0Ka69PwK0HuQcXj89HkMpPrH2ks6HQYuL00=;
 b=iE0nXswhUTRS32Qv75C/50+CtW0IIXJtT8vxvVHwmw2j3GRuwBsBaWDJW1DzwMZlKI
 QvYASpt7Uvd0lUkHA4auoVhvia4ubE6aHPhewgl6C0CM0wHRsBGXGxQstyR5Rr9v47AV
 8Owkn94G9VzTvH02RpE60k2cXQKCuzekN1DMw62hmSO95u1yU/CHjnkhMActw6BNFe/O
 JztafR+b7IPiZRIOyd802ZdLviwqfEy9cz1u11SG6X9n1WZ1RU4JVQo1/b4rUVQeJFGD
 y7/XQrGelc6cm8JApyUOykRJjmcLgzYuM2iiKri2yPjQfPrb96jQAxFnbEacgtx5dC9f
 uzRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CUx1zrTY0Ka69PwK0HuQcXj89HkMpPrH2ks6HQYuL00=;
 b=YaedHD5kRFV7/PZupql7G/5hQBXrEwZZnBeixEPsEgIZrJLC+oWSixPJ9k/fp4mHjZ
 97YFa4sve1jjsxqmX4DU2TI011hgvNwRzCbsb9qUdvu+8FpxcQDyiANiSTvhwQtxdYOJ
 Ilts8e+G6UjJb0FwcmUW3q7Hq4c4PILDIWJzY8Etpo+ORQyeB5ma/iQwWFV1Fid8qsbu
 0BamRf1+JCXV1zzkRfnyBV04yf9NZ04vbeDk00xI8ocKoMpBFD2zM6dCo+MpihtMsN5E
 Al3GBDaTdzfW6gEJVYpaQV2YIbb3jZFjKKlJqYj/IwI1D1OVVllqgR2+ZEjAmLR/tZ6n
 NBgA==
X-Gm-Message-State: AOAM5324LWL/7skPyoeWUekqkcqUHdXEgPXDOc4BNHwaHMidPdPiFka2
 1ELJOl+J2H3FEmFzspYs3o1Oiwmp5NM=
X-Google-Smtp-Source: ABdhPJzYCW3pd8USqxi1l+dAtrIFOp5zATCrrl58PrnGT+Solwbu/kY5fhDtEuaCxEtDXhxrpt2M1g==
X-Received: by 2002:a17:90b:2412:: with SMTP id
 nr18mr35974630pjb.233.1638155292651; 
 Sun, 28 Nov 2021 19:08:12 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (115-64-213-93.static.tpgi.com.au.
 [115.64.213.93])
 by smtp.gmail.com with ESMTPSA id h8sm15462908pfh.10.2021.11.28.19.08.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Nov 2021 19:08:12 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v5 01/17] powerpc: Remove unused FW_FEATURE_NATIVE references
Date: Mon, 29 Nov 2021 13:07:47 +1000
Message-Id: <20211129030803.1888161-2-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20211129030803.1888161-1-npiggin@gmail.com>
References: <20211129030803.1888161-1-npiggin@gmail.com>
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

