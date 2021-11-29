Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B1EEB460D27
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Nov 2021 04:19:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J2Vvd4Qrjz3fQg
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Nov 2021 14:19:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=GSx3krxr;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::431;
 helo=mail-pf1-x431.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=GSx3krxr; dkim-atps=neutral
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com
 [IPv6:2607:f8b0:4864:20::431])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J2Vg974nfz3cXw
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Nov 2021 14:08:53 +1100 (AEDT)
Received: by mail-pf1-x431.google.com with SMTP id x131so15276652pfc.12
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 28 Nov 2021 19:08:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ec1iJ3RRwygNSblSnoglitg1g/fNrFXE3ND6zBA/J14=;
 b=GSx3krxr9BjlP1rv4liaOmEZS6Dy1iho0mYTgIg2RasQhIa61GaONo0xXwaZ8DH/xy
 9JvVRnWmu2yRUKs8oo5KPLV0hg0RoVFctE88sBSmih15tcGLfA8hc1LStWdplLbMP7R7
 sHbwosrXXTXU0wvGwsHkDarfAMwDC+cyvJ5f+yRgCCFp899jWMp3v7rjVXpbBONhoRjp
 0q87GcsGnZ4Sx3ROnyMW5gS55I316r6lgb9jy/b8nmTrdcNLgd8xGVfBpmGue1dBCSVh
 s9QZSJsUO9ebxXu+mVxmOSSFAEFUwLD/XhP5gN6OP/Gi424nVRK9lJS9ClQeL6OVaL0+
 NNCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ec1iJ3RRwygNSblSnoglitg1g/fNrFXE3ND6zBA/J14=;
 b=4cijB4Hwp5tEpIDpotneHTIkBFyC8+JUgH5kC9sTpErVmUZmeXfRzoMSLq7AiY85l0
 shbE/JFcg/2e/WrVL8arIqqVB53GFSaz072pYcTap6FB5DHs9x0w3OVvQiFGx6NgPAdG
 HDND4OE0xBuBoF0pISOHGzvpiq9Ihe1Pb189qjS4mpdXSTtruPCx2x2qucmF2pFmbTc5
 KucEwr/0xnCGNzBUalzNTyL/DItwZOa2ewEGT5Q0rnNoxaxugx42IiFyf9QdzgbHNv5V
 0IkQU5u4OWTBVOnfYC2Necnnqm4Lc6Pvp9Ftr6InHqBksmaUPegozvevCPnKNpjZdl+A
 rzWQ==
X-Gm-Message-State: AOAM530cSVqhm9A3YYMfF36YES+kfqucAVSvMZQB8qDqJOxq28G64sZo
 0ndCvKKkxnOwVAp1vknRLcObDyMqjkk=
X-Google-Smtp-Source: ABdhPJxwfHxMe+o8afY3+xr2Nk6bA+T/lDrnYhjqimOyhhyjkY0q/6CpCFIu+hXOqUCN+DBE3Rue6w==
X-Received: by 2002:a05:6a00:a14:b0:4a0:945:16fa with SMTP id
 p20-20020a056a000a1400b004a0094516famr36629777pfh.9.1638155331820; 
 Sun, 28 Nov 2021 19:08:51 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (115-64-213-93.static.tpgi.com.au.
 [115.64.213.93])
 by smtp.gmail.com with ESMTPSA id h8sm15462908pfh.10.2021.11.28.19.08.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Nov 2021 19:08:51 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v5 17/17] powerpc/microwatt: add POWER9_CPU,
 clear PPC_64S_HASH_MMU
Date: Mon, 29 Nov 2021 13:08:03 +1000
Message-Id: <20211129030803.1888161-18-npiggin@gmail.com>
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

Microwatt implements a subset of ISA v3.0 (which is equivalent to
the POWER9_CPU option). It is radix-only, so does not require hash
MMU support.

This saves 20kB compressed dtbImage and 56kB vmlinux size.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/configs/microwatt_defconfig | 3 ++-
 arch/powerpc/platforms/microwatt/Kconfig | 1 -
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/configs/microwatt_defconfig b/arch/powerpc/configs/microwatt_defconfig
index 07d87a4044b2..eff933ebbb9e 100644
--- a/arch/powerpc/configs/microwatt_defconfig
+++ b/arch/powerpc/configs/microwatt_defconfig
@@ -15,6 +15,8 @@ CONFIG_EMBEDDED=y
 # CONFIG_COMPAT_BRK is not set
 # CONFIG_SLAB_MERGE_DEFAULT is not set
 CONFIG_PPC64=y
+CONFIG_POWER9_CPU=y
+# CONFIG_PPC_64S_HASH_MMU is not set
 # CONFIG_PPC_KUEP is not set
 # CONFIG_PPC_KUAP is not set
 CONFIG_CPU_LITTLE_ENDIAN=y
@@ -27,7 +29,6 @@ CONFIG_PPC_MICROWATT=y
 CONFIG_CPU_FREQ=y
 CONFIG_HZ_100=y
 CONFIG_PPC_4K_PAGES=y
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

