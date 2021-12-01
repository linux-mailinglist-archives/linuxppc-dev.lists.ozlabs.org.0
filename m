Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 667E4465097
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Dec 2021 15:54:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J42DW1xWjz3fXV
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Dec 2021 01:54:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=UTmQnANj;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102a;
 helo=mail-pj1-x102a.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=UTmQnANj; dkim-atps=neutral
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J41yw6pBFz304y
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Dec 2021 01:42:48 +1100 (AEDT)
Received: by mail-pj1-x102a.google.com with SMTP id iq11so18173888pjb.3
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 01 Dec 2021 06:42:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ec1iJ3RRwygNSblSnoglitg1g/fNrFXE3ND6zBA/J14=;
 b=UTmQnANjs/dQlCD7hi36u3XMhcag39eaowg6nD7kYhAO0k2YY+GJJNPy3syXMOOut1
 NuSf/HXqPRjnOLabKcErYxgAvpbsT9g0GpBr8YFeqtyKXe50KAsTrYuxJhZ/dPoOc0De
 1roQCRcSRKr2Q8Vxry1y90IoZ1SjMizNOgbnmbzuAm5+Vm7EGjPBGvrxH4T/NTqwm/Va
 Y2ZTjqBld/M1Yi9iJETleEZ3LmrfAu3mnLYCg/9YzBdbhvVx+ZWffE7HB0u13eFZzniV
 tFf4WYWogxinQYoVOTqahTMibVMPHQttKVL7BVcbt1bL2EsEjG+ICvm4nrF6dsyA/hmH
 U5Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ec1iJ3RRwygNSblSnoglitg1g/fNrFXE3ND6zBA/J14=;
 b=66XVm/z9iaVsiZzJ9suGPzv9jZv6uFyMusD/s/Xs+sRLri5jiCeBOoCzoGbfSw8Go3
 mxCE15mH4jI80yTN9sgN53yeGnF+GwIqUNSTt+QDdsTmRgtpV2hF/G0UwFd+3UyeUtgt
 mFr9nJUf1YLQxk9KwEJWwpzi56ObG6Iiko16Wf5yBQ/uYJpWQDwNId/MJBsKTOtA1z3S
 TXHKRUZmK90kuVrM/D8X49FabDlHQKtx/FhXPWIGybDpNsoR4mMVuE3uNuBMTFNSB6Hg
 7oByPOLjrisqjnznoB6MPPmyVCNcOOuLRAup+V5lTWuor5L8MmoCob2nuGdbt7gtX9XV
 kNyg==
X-Gm-Message-State: AOAM530tDmACM6puYk6JVMXO0SaMCBKNDKvjoXI7DgJpbTAVg9kR5HxU
 PFVYfayIIADiwYq2jkjLsI9KARcfqwQ=
X-Google-Smtp-Source: ABdhPJyBD/sjdLvg/CxxtWIuAxdF8eWkUclV+XvDZWz0Sg83OcInOTlmWzAHk/OpeVnbbW7JFfEIQg==
X-Received: by 2002:a17:902:b682:b0:143:7eb8:222 with SMTP id
 c2-20020a170902b68200b001437eb80222mr7937209pls.31.1638369766767; 
 Wed, 01 Dec 2021 06:42:46 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (115-64-213-93.static.tpgi.com.au.
 [115.64.213.93])
 by smtp.gmail.com with ESMTPSA id e13sm29230pgb.8.2021.12.01.06.42.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Dec 2021 06:42:46 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v6 18/18] powerpc/microwatt: add POWER9_CPU,
 clear PPC_64S_HASH_MMU
Date: Thu,  2 Dec 2021 00:41:53 +1000
Message-Id: <20211201144153.2456614-19-npiggin@gmail.com>
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

