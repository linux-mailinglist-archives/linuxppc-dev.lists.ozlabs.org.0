Return-Path: <linuxppc-dev+bounces-10300-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C9A03B08F55
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Jul 2025 16:29:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bjZz558Tcz3btj;
	Fri, 18 Jul 2025 00:28:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::134"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1752762497;
	cv=none; b=R+R29ILkv4PPaTa2S7rtVPI3tR0qCAjXi/j9pEPfdmJx0yyu6A7VXMFsZ86lK3xBNA0XCUQ7yddqZi4dh3DckbMnHnDG5Wga0Dt5HwvbUbbFEe+L4ZO+5awG1Y0l9c78S2W6kyXNocK/ydUtim/xeaedmbeCf86XpigCjEjU2stAjKXiTTVOL1eVm3vV+bReZlmNnE5PVBRxzPuDTypi+ojIETwvcH+8yKusBtCJR1NysL6VTbHJ0l6hyh6mAsNZjXooesct7o88cfJLzBVYBXLaeBt+ziwDIL5ocRWjDHIP5ULKN3LtoopzSzooqbzDy1fRvw7Lp+fh0yFC4ye1sg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1752762497; c=relaxed/relaxed;
	bh=xwSPw6gFzDTyOsOkroA5OTCCxXe2CzpjscG8NASBaU4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=At0w9WRa+KyNhISW73MNdE4bNeYuhS4zUTcxuP8Y40m07Dtl5ny3qPXKFfh8a2wnjoPCqBSbQzdu58B8h5YRstwjtpO3/zOADUBpPpcKwrSEWOVghqfuTW5NSLQdIxjEvXV16/sVGLNxsCv+8IKQBpfNbj6C/StYZ1gl9pbaeqjpmY4mRWvXDexs7l4ztx/k173hvEnL/amCkZXQKgqZ6iyColOTpgLQbeAR5xMOulJal6uGouAqMdBqBHg4Qr2dzqIVVLRyCsg+GS+bYHLAIEKePfYdfMXu4wK2koPWet8Kfpr7As1mCJbQ88xkJ2qO1fXrH816t6+48zrfjQCZUg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=OKyRngkA; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::134; helo=mail-lf1-x134.google.com; envelope-from=snovitoll@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=OKyRngkA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::134; helo=mail-lf1-x134.google.com; envelope-from=snovitoll@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bjZz45shYz3bsy
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Jul 2025 00:28:16 +1000 (AEST)
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-55a25635385so1157678e87.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Jul 2025 07:28:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752762494; x=1753367294; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xwSPw6gFzDTyOsOkroA5OTCCxXe2CzpjscG8NASBaU4=;
        b=OKyRngkACYNM+5iYQhI+ZzRsmUicOLI2ojBJOCKGlyVnp0S4De9skaJWVKn8kYInbL
         YQzaFLWOg25AJBtLYMh/phhZpVFBf7UOI9qW9OMavVzzvMjlF84UWONUqDYVv1UZHko9
         dr4l+DJbymOLa0yR7YuPWQpA3Lg0WqUjFq3P5lrT3fR005jfoQvfEBRoB8LLsEPNzZT/
         SaRAfHPp0+JdE1MLNCodEJrFWPwH/hdBdbArvBxQIY3L7rU8JvDCEQvN0Du2iuMfFeio
         niWMWW2WpxNWYCu2BSBYYcQPE+miAsVac04DCVv4nPQUMRBUh4iF7+NeoqsSYq5M/V+/
         DjQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752762494; x=1753367294;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xwSPw6gFzDTyOsOkroA5OTCCxXe2CzpjscG8NASBaU4=;
        b=IB6WCUmtu3DD0Kn0DqaRMIMbrlgLo6XCpA/aQxAd4yVbQURenbJeVmfmRMoZJDlYeV
         iqOBuqj+IJg4cIduSpneohJ8KaskN4rEtDnkrAmanx/lwp6opN1Zf9yW4KRmmwQF8bgq
         TksB958EEmWtZPLz7rNhlTr5uXYMKSs+Irbih3MFU7vUBMkaID2cAg/5o+WFeqC4xgL2
         JgUTfb8yK8jBQQUM97EsZIzWRtn+XJspsDOdecAGz+to0QWIehfOYP8HTkAIAO9rZHkQ
         gRYmgoZdzKdToKpgg9IVno5HlaY2AEYEmnEI23MlN2g3OOcYJnTBshU/vOOqIdnvVlv7
         xUHQ==
X-Forwarded-Encrypted: i=1; AJvYcCU3Sflq+wKvTarI52ogjuIAN82HxYg8PFFLNEkSp0WjkhMg7RyRRQbLUFD4f8QumOpalKhOUqwAz102OUU=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwWccFs2wOE0BybapoEt35bJ6LPIGFFoc/Gu5yljtxoP6+KPcSv
	JBFZc1kT0RRXQPxFkG2qkxUJSq411tAFTh0DqkbhD9erflAaaOxMwuDZ
X-Gm-Gg: ASbGnctQzwm3i3uYbOcyV5bxwstD2RAZv2YRWTDlqVoYl/1CtG+1rhMTTMQ5+bl4dHE
	IG/Fl5A1l0Lz203Z8JoTIJ0PVRhKN+JlB86etdvvbi8MB1ILj0HNS/1mI7uw9lygyK/fAap0xFA
	IrGMFWelx+GSK/8PWBPULQ0oYnHYB2RB1KlfRICqXRQhooVNcObURbksMNt8zj6e0L/rREad1oG
	I1ttmHqXEu4N1Fwn41lIaoVt6ZMajBCMXNsqKPdxd6ITvMeEOCATyElWYeBaOZmF9IBd2PHKgZZ
	lkavJkgZea5dso/giXoiUm4p/vfkWCinOAagfGLn5+3C6Q+2HOPvWU37VnmxIAaJiYsU9MEna3f
	PW2rsIWJVgxcoQ3nWLEi+rPul0ScUB0miCnJhfzNebwBOEZ6jekVT2u56P5HzD8Kbsw8B
X-Google-Smtp-Source: AGHT+IFV4/fgUWSLQ9HeTYD1ZNc8U4khjXBXPUvRtZGAA8fcpyT35FlSXgJszoiLVDo7d7offe3D+A==
X-Received: by 2002:a05:6512:3710:b0:554:f74b:78c1 with SMTP id 2adb3069b0e04-55a233db3famr2128904e87.43.1752762493542;
        Thu, 17 Jul 2025 07:28:13 -0700 (PDT)
Received: from localhost.localdomain (178.90.89.143.dynamic.telecom.kz. [178.90.89.143])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55989825fe3sm3022975e87.223.2025.07.17.07.28.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jul 2025 07:28:12 -0700 (PDT)
From: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
To: hca@linux.ibm.com,
	christophe.leroy@csgroup.eu,
	andreyknvl@gmail.com,
	agordeev@linux.ibm.com,
	akpm@linux-foundation.org
Cc: ryabinin.a.a@gmail.com,
	glider@google.com,
	dvyukov@google.com,
	kasan-dev@googlegroups.com,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-um@lists.infradead.org,
	linux-mm@kvack.org,
	snovitoll@gmail.com
Subject: [PATCH v3 10/12] kasan/s390: call kasan_init_generic in kasan_init
Date: Thu, 17 Jul 2025 19:27:30 +0500
Message-Id: <20250717142732.292822-11-snovitoll@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250717142732.292822-1-snovitoll@gmail.com>
References: <20250717142732.292822-1-snovitoll@gmail.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Call kasan_init_generic() which handles Generic KASAN initialization
and prints the banner. Since s390 doesn't select ARCH_DEFER_KASAN,
kasan_enable() will be a no-op, and kasan_enabled() will return
IS_ENABLED(CONFIG_KASAN) for optimal compile-time behavior.

s390 sets up KASAN mappings in the decompressor and can run with KASAN
enabled from very early, so it doesn't need runtime control.

Closes: https://bugzilla.kernel.org/show_bug.cgi?id=217049
Signed-off-by: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
---
 arch/s390/kernel/early.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/s390/kernel/early.c b/arch/s390/kernel/early.c
index 54cf0923050..7ada1324f6a 100644
--- a/arch/s390/kernel/early.c
+++ b/arch/s390/kernel/early.c
@@ -21,6 +21,7 @@
 #include <linux/kernel.h>
 #include <asm/asm-extable.h>
 #include <linux/memblock.h>
+#include <linux/kasan.h>
 #include <asm/access-regs.h>
 #include <asm/asm-offsets.h>
 #include <asm/machine.h>
@@ -65,7 +66,7 @@ static void __init kasan_early_init(void)
 {
 #ifdef CONFIG_KASAN
 	init_task.kasan_depth = 0;
-	pr_info("KernelAddressSanitizer initialized\n");
+	kasan_init_generic();
 #endif
 }
 
-- 
2.34.1


