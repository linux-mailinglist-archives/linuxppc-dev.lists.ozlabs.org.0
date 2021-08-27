Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A6A13F9CA3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Aug 2021 18:38:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gx54J1BtLz3d9d
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Aug 2021 02:38:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=FsSzLUiW;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1034;
 helo=mail-pj1-x1034.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=FsSzLUiW; dkim-atps=neutral
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gx5064pHFz307n
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Aug 2021 02:34:30 +1000 (AEST)
Received: by mail-pj1-x1034.google.com with SMTP id
 j4-20020a17090a734400b0018f6dd1ec97so5171386pjs.3
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Aug 2021 09:34:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5ts/vsiPXiv+tHq1nfOetjjUym9c2G7L9xYKfNkKqv8=;
 b=FsSzLUiWxW0VmAiww143DsSais3C1pvKGfTSCQ0rG+Zp2WfUxZdvhGyL1+zvmgdDKU
 7AetjOYh6hiXv5cZSWF9mFe4+9g4DlOO36TTMyGsYin1ur++jwpSf+/fo16aEn3SoiP5
 5lfnRTcgujgQ27eecj+KRnvtMWnymeafMCcZBgxgweuVqM9z98hd+vDFBxSdUV4dkmCZ
 rW30kt5dmss+y2fy2SehiyCscwW27SpSfBlzZfhGgLHfu8zsB8heD6yR4etA9J4PhHT/
 XHKXfu1mg7pYTuHG2nS8vAU8ZgYoqgQXmsxLDzwdrQHU6y2YfxR/pT5pTpNy8DeJBbD8
 uedQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5ts/vsiPXiv+tHq1nfOetjjUym9c2G7L9xYKfNkKqv8=;
 b=pl0T6pRFtO1qrJykZrzcqqMCJy7cIFFf1TEhkbAXEAefDqusUv//ldwo9K6Zkl6il0
 rnqrdEOcwnYA01ZWHwCiB04CV/9ql5YjvcxG1V1La9CSExDr+UVuivuuMLN41J0bO0An
 YQHoGe3F3085P6TCx8bdORyZTeaO+Z88kvRUuCqy3vvywBhOwP7v4sUraAl7FG6pqAd5
 doWCtUlq+DmBXf8WNmAV1bGTlA5aEXTtVZBlfSgMFSc5bUKN3SZulC2e+tCe2KH0VGlD
 1lP4N0AD+4+kB9EB4kpBjY8tmUAfTXreyPITeETNABNn3tKROOAxCxPTwVkzCGatZyx7
 1jkA==
X-Gm-Message-State: AOAM530uiftPrk963wuJp7MR19WlsYGhCyU1CenESVljwZ5ZvQiH3R52
 HQGxH8RPxkWxUPKgMf6aax3W/jsMYsM=
X-Google-Smtp-Source: ABdhPJy7QLl1RCClt4oDVpQDXU22AJOMH3ffwUjfnaLvBUcvzc1+92Yu2Rk6aZPzjXgr8gmyGj7opA==
X-Received: by 2002:a17:90a:bd06:: with SMTP id
 y6mr11862988pjr.6.1630082068283; 
 Fri, 27 Aug 2021 09:34:28 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (220-244-72-10.tpgi.com.au. [220.244.72.10])
 by smtp.gmail.com with ESMTPSA id u24sm7083852pfm.85.2021.08.27.09.34.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Aug 2021 09:34:28 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH 5/6] powerpc/microwatt: select POWER9_CPU
Date: Sat, 28 Aug 2021 02:34:09 +1000
Message-Id: <20210827163410.1177154-6-npiggin@gmail.com>
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

Microwatt implements a subset of ISA v3.0 which is equivalent to
the POWER9_CPU selection.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/configs/microwatt_defconfig | 1 +
 arch/powerpc/platforms/microwatt/Kconfig | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/powerpc/configs/microwatt_defconfig b/arch/powerpc/configs/microwatt_defconfig
index a08b739123da..bf5f2e5905eb 100644
--- a/arch/powerpc/configs/microwatt_defconfig
+++ b/arch/powerpc/configs/microwatt_defconfig
@@ -14,6 +14,7 @@ CONFIG_EMBEDDED=y
 # CONFIG_COMPAT_BRK is not set
 # CONFIG_SLAB_MERGE_DEFAULT is not set
 CONFIG_PPC64=y
+CONFIG_POWER9_CPU=y
 # CONFIG_PPC_KUEP is not set
 # CONFIG_PPC_KUAP is not set
 CONFIG_CPU_LITTLE_ENDIAN=y
diff --git a/arch/powerpc/platforms/microwatt/Kconfig b/arch/powerpc/platforms/microwatt/Kconfig
index 823192e9d38a..e0ff2cfc1ca0 100644
--- a/arch/powerpc/platforms/microwatt/Kconfig
+++ b/arch/powerpc/platforms/microwatt/Kconfig
@@ -2,6 +2,7 @@
 config PPC_MICROWATT
 	depends on PPC_BOOK3S_64 && !SMP
 	bool "Microwatt SoC platform"
+	select POWER9_CPU
 	select PPC_XICS
 	select PPC_ICS_NATIVE
 	select PPC_ICP_NATIVE
-- 
2.23.0

