Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8141D3F9C93
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Aug 2021 18:35:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gx5172fTrz3c9m
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Aug 2021 02:35:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=eWVphLen;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1036;
 helo=mail-pj1-x1036.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=eWVphLen; dkim-atps=neutral
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gx4zx3mTTz2yd6
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Aug 2021 02:34:21 +1000 (AEST)
Received: by mail-pj1-x1036.google.com with SMTP id
 g13-20020a17090a3c8d00b00196286963b9so2278322pjc.3
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Aug 2021 09:34:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HtmwT8vhW+Y+D4cWH4otl9pkKTymcFpPF2qJbGTC360=;
 b=eWVphLenKgK+bg6luoHoine9WrJW6N814UDqURG75XpthbPEibv5dWKZdbztybZyZj
 8eE21dHWL6sdIROkeqyig3jhbvVa4VP1nCoITETxvlFCyZgySToIU9PNw4MAbh2SyISA
 0gD04KxbcLsDSt1VJQJlAgBELPLACDq2Pc5yislxayKLbDTD8eijQRWSlzcAtWZu5dr/
 RTXwYSB5+8KAkfzpNp1HSOA8pvPefPdMXA88s/DLYS2RzkPw640Sqbuv+ylwUnRLU8iw
 al1fGBVeJhr87EFBsFzqKc2HOq6bhG/u3OajarJJJHEwaJ5i5Km+OT8MWBA7UP53JcMx
 nlpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HtmwT8vhW+Y+D4cWH4otl9pkKTymcFpPF2qJbGTC360=;
 b=QmoGO63xQqvSbltqbTXxws7k68AUNvXQGJcB86mKtTwwIyBYAu3Sv99H/03/XavtMf
 XSeY9CDGHHdjO5gDYMSZY1NG+cHS4KgKpWnLdczzMrCgn1L4EYea8I0oaRfJKYTT2d2n
 rq0TT2s71XqAqm0ECTpihO2KAv6uBdXfALynrEeUu9wfdkvmWuqAtzZ1SHb76E4NMeZe
 RoFUOCXnTjXDP486SfgvFT7X0RR668cEsmCTwdrtIalWaSk0e4qYF319g7QWP+mqIjdY
 dbKmrmmolpdyWO6DoaMMScTgJ1Z1Ewv9l/UTElxch13PaL5wnR/Aw/4cLYiu1fscaxBQ
 s8zA==
X-Gm-Message-State: AOAM533Q6yaorjiFK9RcOSzU7+BDccZV/B8BcZ3aWGaVr32EWKnSFw2W
 vTvlWcmQ1EJfRbuW4/YT8tSVEjztoxk=
X-Google-Smtp-Source: ABdhPJyPgFAtpQGKW5SrZ7OKIMs+OSeF3nErdkbCuoVw4YzqLtimhumKdQxc2SxkqKFxOsCZ5WYlrw==
X-Received: by 2002:a17:902:b711:b029:11e:6480:258a with SMTP id
 d17-20020a170902b711b029011e6480258amr9383867pls.41.1630082058994; 
 Fri, 27 Aug 2021 09:34:18 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (220-244-72-10.tpgi.com.au. [220.244.72.10])
 by smtp.gmail.com with ESMTPSA id u24sm7083852pfm.85.2021.08.27.09.34.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Aug 2021 09:34:18 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH 1/6] powerpc: Remove unused FW_FEATURE_NATIVE references
Date: Sat, 28 Aug 2021 02:34:05 +1000
Message-Id: <20210827163410.1177154-2-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210827163410.1177154-1-npiggin@gmail.com>
References: <20210827163410.1177154-1-npiggin@gmail.com>
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
index 7604673787d6..df9e4aae917e 100644
--- a/arch/powerpc/include/asm/firmware.h
+++ b/arch/powerpc/include/asm/firmware.h
@@ -79,8 +79,6 @@ enum {
 	FW_FEATURE_POWERNV_ALWAYS = 0,
 	FW_FEATURE_PS3_POSSIBLE = FW_FEATURE_LPAR | FW_FEATURE_PS3_LV1,
 	FW_FEATURE_PS3_ALWAYS = FW_FEATURE_LPAR | FW_FEATURE_PS3_LV1,
-	FW_FEATURE_NATIVE_POSSIBLE = 0,
-	FW_FEATURE_NATIVE_ALWAYS = 0,
 	FW_FEATURE_POSSIBLE =
 #ifdef CONFIG_PPC_PSERIES
 		FW_FEATURE_PSERIES_POSSIBLE |
@@ -90,9 +88,6 @@ enum {
 #endif
 #ifdef CONFIG_PPC_PS3
 		FW_FEATURE_PS3_POSSIBLE |
-#endif
-#ifdef CONFIG_PPC_NATIVE
-		FW_FEATURE_NATIVE_ALWAYS |
 #endif
 		0,
 	FW_FEATURE_ALWAYS =
@@ -104,9 +99,6 @@ enum {
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

