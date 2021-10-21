Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B7362436DAC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Oct 2021 00:42:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hb2Yh1QWrz3fQr
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Oct 2021 09:42:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=W2W84vyM;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::631;
 helo=mail-pl1-x631.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=W2W84vyM; dkim-atps=neutral
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hb2JJ0x82z3cRj
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Oct 2021 09:31:11 +1100 (AEDT)
Received: by mail-pl1-x631.google.com with SMTP id y4so1447381plb.0
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Oct 2021 15:31:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZAFk1YHTcSz2eAhy4ezc+vDrdOnkjyj1IjUxvVuP3Rs=;
 b=W2W84vyM9zdnkb4R3y/rwVPR71T390XYC9lH0wkPmgkD+XmgIvsH2TBcppU+aaBEQR
 ay4wpX4n2plMQ8nXozyFAt1BeXx75jBqNf7p+Kgb8BXoynStJdoIbMvy3mWOzksamxJw
 mKeHf35VArcnReInnkWRc3e2NhEtauwAX8Jt49lbjUKy4xzM2dom8bpBew3XatAYhMBX
 Hq/flpgPQKXYFvdobF1Xe3CoaTUGmp26wvlightRRp4V63K28xcQpoQPW93vQ8/3ICy4
 0zrMOVjHUFB2zyWkyDEW0xfnk5LfMffcYFzm5+qZKJtpiO2WVduLdNZwpZ1NBfzLDlxg
 bd6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZAFk1YHTcSz2eAhy4ezc+vDrdOnkjyj1IjUxvVuP3Rs=;
 b=TpkQPCIPcEo39UmLBoFUrlakAPi53zM8IvSH0k352KFzqkV8EcxUnThT/ve1vNZkLx
 WOwUmzGe7X6n6fLuMKz5xsP+VPjVvXkI0HAYwntWoPU8uV2hbZawnpjLS6SEveY28sb1
 jaWmyKQgjR/NdqHdCE3pdsqCBMlB+TW7MF+m7vW/UGYlRfYi+dCbiAeBRu0rwWcS69ir
 kgLLXP0xQnBQTSTda2vHQi1FjAOZLEkRUBcOaO6SEjlc+FLkgNLoCx9QqWSf96sBlv0g
 1mFWWemeyhyk/9DcSCQOyP5ZVxzOgsmm7umATwbuXhbz9x8sPuWxaj9ZwIJLJAR9Jlny
 A7Sw==
X-Gm-Message-State: AOAM533+Cy+jGDIAWyUFpaRxIr1jwtBIKWjNerDyiG6Cnzjellk45Lg8
 q+BX1em9aEKvBeik31gfCQsiFMCR0i8=
X-Google-Smtp-Source: ABdhPJzLMRfWIu+Zfg5nEx0aXPFrhC2mFDJnQN82CqLmT4UzkQBw1iIdDz7aIXooHd6NeUxw5wXvWQ==
X-Received: by 2002:a17:90b:4d09:: with SMTP id
 mw9mr9722187pjb.100.1634855469671; 
 Thu, 21 Oct 2021 15:31:09 -0700 (PDT)
Received: from bobo.ibm.com (14-203-144-177.static.tpgi.com.au.
 [14.203.144.177])
 by smtp.gmail.com with ESMTPSA id e6sm7205716pfm.212.2021.10.21.15.31.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Oct 2021 15:31:09 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 18/18] powerpc/microwatt: Don't select the hash MMU code
Date: Fri, 22 Oct 2021 08:30:13 +1000
Message-Id: <20211021223013.2641952-19-npiggin@gmail.com>
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

Microwatt is radix-only, so it does not require hash MMU support.

This saves 20kB compressed dtbImage and 56kB vmlinux size.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/configs/microwatt_defconfig | 2 +-
 arch/powerpc/platforms/microwatt/Kconfig | 1 -
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/powerpc/configs/microwatt_defconfig b/arch/powerpc/configs/microwatt_defconfig
index 6e62966730d3..de1dcff05734 100644
--- a/arch/powerpc/configs/microwatt_defconfig
+++ b/arch/powerpc/configs/microwatt_defconfig
@@ -16,6 +16,7 @@ CONFIG_EMBEDDED=y
 # CONFIG_SLAB_MERGE_DEFAULT is not set
 CONFIG_PPC64=y
 CONFIG_POWER9_CPU=y
+# CONFIG_PPC_64S_HASH_MMU is not set
 # CONFIG_PPC_KUEP is not set
 # CONFIG_PPC_KUAP is not set
 CONFIG_CPU_LITTLE_ENDIAN=y
@@ -27,7 +28,6 @@ CONFIG_PPC_MICROWATT=y
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

