Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E4A5F436D7A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Oct 2021 00:31:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hb2J32mnWz3bj8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Oct 2021 09:30:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=VlA0U8/m;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::432;
 helo=mail-pf1-x432.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=VlA0U8/m; dkim-atps=neutral
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hb2HT74Glz2yp8
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Oct 2021 09:30:27 +1100 (AEDT)
Received: by mail-pf1-x432.google.com with SMTP id t184so1982631pfd.0
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Oct 2021 15:30:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CUx1zrTY0Ka69PwK0HuQcXj89HkMpPrH2ks6HQYuL00=;
 b=VlA0U8/mJiWgU+q4pCwKz8a9xBkfiHOsSUmibV8cgVclSpzMOUi9ZMHRpZeYMANXco
 JWtX98yK9x3EodLtGR7BDiiMnCpcc/+yO1EwoUdrrdzfOkM25d2jtA+ips4yjXzZMSCt
 pT0BtCXem4K+xQ1Kxkt6cYgRi3vigFghP0DprF1f2uIPA4sp6mHUskSUQFL/4DERJ1K/
 r/gTfvxH4JGVbp+dNrzPeETZ1DsWZ44Q/EcaJHkRHv/WXKJi3USy5z6WNvMToG/iAher
 0mAy0zlfZNmvXrvCkacG4fa5XnOy8mnGhV+t9VhP3BF//0U8SpuMsjKoAt5RY5yk99Yh
 ERGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CUx1zrTY0Ka69PwK0HuQcXj89HkMpPrH2ks6HQYuL00=;
 b=SqKdHFeagZxLH/vaDmMngaTGk4pw1pbP0VaFhaoWDTA5XeXjQq5CK3Tgn+nz0mh6fh
 Bo05kjOYDTa+/3WGZlAuHvcfbFqCcdxJ4TH5OKSCN4/x7Yq6GEcRVovNi8Zw/+FW/95z
 3MEMzWSe+yFDNWN9XcZ21dVfR4CIdoJJi3NBot1n933QP4DQWbpdoKuDUd4oPJl/sRqW
 AEAe1ZqdxyM5Wbs387YJAEMynZdv72zvXmCmL8BoyjyPnoKRaTwKI0KibndcSAj5e/4r
 9tJwu6x2+CqJ+XB4IoogxRFj8V6LrbxLaB/tEw1x4VB6up05liq/Tq6muhuCKth+al4X
 Zs4w==
X-Gm-Message-State: AOAM531TZ4dMb5a+KmghcCvnPx5OgIHvFt6GtQ6pnrm5rFzYvgKJUdBV
 89sCCKM/4I6/qAP69sfgt8uW2gcyG1A=
X-Google-Smtp-Source: ABdhPJzJCgjVuUsogihqPkhiG63C/AisK3KXsPUeppjdA0xh2Z9mE0sSiMO8ot+iqz+WNh4eIICsuQ==
X-Received: by 2002:a63:7e48:: with SMTP id o8mr6539622pgn.157.1634855425980; 
 Thu, 21 Oct 2021 15:30:25 -0700 (PDT)
Received: from bobo.ibm.com (14-203-144-177.static.tpgi.com.au.
 [14.203.144.177])
 by smtp.gmail.com with ESMTPSA id e6sm7205716pfm.212.2021.10.21.15.30.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Oct 2021 15:30:25 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 01/18] powerpc: Remove unused FW_FEATURE_NATIVE references
Date: Fri, 22 Oct 2021 08:29:56 +1000
Message-Id: <20211021223013.2641952-2-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20211021223013.2641952-1-npiggin@gmail.com>
References: <20211021223013.2641952-1-npiggin@gmail.com>
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

