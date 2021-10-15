Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 941D142F76F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Oct 2021 17:54:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HW9n71k70z2xth
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Oct 2021 02:54:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=eLpDu04I;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62e;
 helo=mail-pl1-x62e.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=eLpDu04I; dkim-atps=neutral
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HW9cf2Wpqz3cBT
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Oct 2021 02:46:58 +1100 (AEDT)
Received: by mail-pl1-x62e.google.com with SMTP id y4so6681500plb.0
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Oct 2021 08:46:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zu5KRphZeWP1V/tNwiBsxoWshA0nNYHtx7ymVNXLm7o=;
 b=eLpDu04In0LfoQXdVsRnJpz7POQ3Qj7BMIyZRlL+1DhnruYQly9oAYFTnPrTU2TbzO
 5Pi7zsqoiKdUEC2WA9COYtzS57mDbKtU7yBVdhEaTB37Mr99+9r0Of+K9oDqvtXI0nD4
 iUkYcTrQmVWDQVBUSYn7lztRO0GAW2dxpIlTo90YSDatfYouVJI/fwGP5l3jHVgw1s9S
 nHhn+mI6XuTe23Hho/0bvLAHbEfmxXKdMereFeu1h5FKXrlBYO3mCk6UkikiSuczNaJO
 0Ly+ZUJmknMOmDLAqzP5sJ+Ch6Opxs1KaqCbi+QtGY6muxcKFMMz6x+d4N0HO8MKaiEO
 IOjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zu5KRphZeWP1V/tNwiBsxoWshA0nNYHtx7ymVNXLm7o=;
 b=feCpRzboRFuUivMrphti/UKJYuzU/xk4IvadurJVVmGGI0e2a7w0hdiwylNMSiDi4G
 znTGuOp+AMavbvroT0p1/AN43IIgmkU1Ai3R+aHAYGd2Zn7puWaRZ1wK2V3+I0+36kpZ
 Q7zAJkLkfdcGPY35XYdQJ8xAe78vmozHR34UPAWng/jHPm64H3LfOQ9dKJMNs4TPm26g
 hcSaTPr0lyqBAqs3d3SwUCvorKHrTpygdbEGw0FDuLQL8qmsf8y0LXl1DslRBQFMFb6U
 AFcfsSyRElHBo8bgTKfiUEwMaoZihNRccDcjWH7MR6JfB0xbzroMXXwWXE9EHCxUpoAu
 zeDw==
X-Gm-Message-State: AOAM530t5GHCiw3G29O5CZ3g8o5ldLbQkSPlsI+6O4XrRl+2NjZrakmE
 wz9Deu0LdMGj3pZWTkNJX+1EnVkIUx8=
X-Google-Smtp-Source: ABdhPJwTCsXpvTtY4A0he7LwD+EHaLgb1sF6NeKkgmLet/XR9PJxTkvqpJhGu0wuPzwUMwfi3x+9YA==
X-Received: by 2002:a17:90b:388f:: with SMTP id
 mu15mr14407385pjb.28.1634312815939; 
 Fri, 15 Oct 2021 08:46:55 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (14-203-144-177.static.tpgi.com.au.
 [14.203.144.177])
 by smtp.gmail.com with ESMTPSA id y1sm5392092pfo.104.2021.10.15.08.46.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Oct 2021 08:46:55 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v1 11/11] powerpc/microwatt: Don't select the hash MMU code
Date: Sat, 16 Oct 2021 01:46:24 +1000
Message-Id: <20211015154624.922960-12-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20211015154624.922960-1-npiggin@gmail.com>
References: <20211015154624.922960-1-npiggin@gmail.com>
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

Microwatt is radix-only, so it does not require hash MMU support.

This saves 20kB compressed dtbImage and 56kB vmlinux size.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/configs/microwatt_defconfig | 1 -
 arch/powerpc/platforms/microwatt/Kconfig | 1 -
 2 files changed, 2 deletions(-)

diff --git a/arch/powerpc/configs/microwatt_defconfig b/arch/powerpc/configs/microwatt_defconfig
index 6e62966730d3..7c8eb29d8afe 100644
--- a/arch/powerpc/configs/microwatt_defconfig
+++ b/arch/powerpc/configs/microwatt_defconfig
@@ -27,7 +27,6 @@ CONFIG_PPC_MICROWATT=y
 # CONFIG_PPC_OF_BOOT_TRAMPOLINE is not set
 CONFIG_CPU_FREQ=y
 CONFIG_HZ_100=y
-# CONFIG_PPC_MEM_KEYS is not set
 # CONFIG_SECCOMP is not set
 # CONFIG_MQ_IOSCHED_KYBER is not set
 # CONFIG_COREDUMP is not set
diff --git a/arch/powerpc/platforms/microwatt/Kconfig b/arch/powerpc/platforms/microwatt/Kconfig
index 823192e9d38a..5e320f49583a 100644
--- a/arch/powerpc/platforms/microwatt/Kconfig
+++ b/arch/powerpc/platforms/microwatt/Kconfig
@@ -5,7 +5,6 @@ config PPC_MICROWATT
 	select PPC_XICS
 	select PPC_ICS_NATIVE
 	select PPC_ICP_NATIVE
-	select PPC_HASH_MMU_NATIVE if PPC_64S_HASH_MMU
 	select PPC_UDBG_16550
 	select ARCH_RANDOM
 	help
-- 
2.23.0

