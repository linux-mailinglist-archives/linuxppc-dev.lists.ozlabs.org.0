Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E99A11F0B0E
	for <lists+linuxppc-dev@lfdr.de>; Sun,  7 Jun 2020 14:04:02 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49fw5q0MlSzDqbG
	for <lists+linuxppc-dev@lfdr.de>; Sun,  7 Jun 2020 22:03:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::643;
 helo=mail-pl1-x643.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=pS45+YEy; dkim-atps=neutral
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49fw414DZmzDqT8
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  7 Jun 2020 22:02:25 +1000 (AEST)
Received: by mail-pl1-x643.google.com with SMTP id y17so5537046plb.8
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 07 Jun 2020 05:02:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hSYjfHJ8+STByhPKXHr46UIyEIebKceDyam7oa7YMgs=;
 b=pS45+YEy8k8TtQzURz/729dp6F0p3vD3PZv6XLCkmcNkWa8BvuLv2RFhp4gXtnL/i3
 gwrBLAAomqF6KRkpWot0rgrinjBd+ifKBzDfkzqifUIjDIxgT7KWJ6lidRtdwvUmBwhA
 NoQH/RW+eISDOXUp0ODC9tACFHKkBg0I5sPsAgXSVWzqKxVQp1rYFLhKVUA1unRu3R9N
 o70fvWY2kVWICfnHeF8I9hSHkKz88PKgEfx9GaDKJdArpIweuqOquqY3mBXxkGTguasq
 HthrCkVr96paj9VawBDQnxdc1lqKGRHZyY7//wGGKHOlZNaHd2o90lWtDf4bYbt40Gfe
 0slQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hSYjfHJ8+STByhPKXHr46UIyEIebKceDyam7oa7YMgs=;
 b=ars9HKPYi/HRrlq6xq4hMjfi0fvjNBoBVPOzgCxS8qIdZC0YRbrp6AFbVfp6vbQCta
 1T8CvvUPBryeJR57gU/ZXncpammh5SrdZUv4oeUrGu9SdNme/36BzZaPs6TNTx7qdmp6
 x9FIOrP30kRKBspICDyh37Z0agmkx92z97uSzb123R5erbI5Yvy1LD1HbAdH+Un6Vjsa
 q6AdgIr1ZrpJUN4FhMEv0eNE8svav4/Qc5F21tB/zS2Z6aVJhS3tNRWDBeRjEOjXkPNp
 KVrOiE8wPogHW2qcMd+PwARV/cAxB3/qIgpY4eVVmT49wZZy1vlHMcBuOSTQK5hrQZ0R
 /gdw==
X-Gm-Message-State: AOAM533YVVmNjk0Tzwc4TZdIyKQw2SYCIhwjoqf1f5DYfeaeDeJHqWtw
 Tsh9s5rUqx/tW17QmVL3zTaPGRHh
X-Google-Smtp-Source: ABdhPJzywC4Bajm2lXN5AsN+WlwR6dBUmZfwgphAslAHPsaq3pbadZUAb9LkVh0Xy7lTJA1PM8b4RA==
X-Received: by 2002:a17:90a:1aaa:: with SMTP id
 p39mr12610214pjp.127.1591531342442; 
 Sun, 07 Jun 2020 05:02:22 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com ([202.125.31.243])
 by smtp.gmail.com with ESMTPSA id b29sm4411482pfr.159.2020.06.07.05.02.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Jun 2020 05:02:22 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 2/2] powerpc/64s/hash: disable subpage_prot syscall by default
Date: Sun,  7 Jun 2020 22:02:09 +1000
Message-Id: <20200607120209.463501-2-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200607120209.463501-1-npiggin@gmail.com>
References: <20200607120209.463501-1-npiggin@gmail.com>
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

The subpage_prot syscall was added for specialised system software
(Lx86) that has been discontinued for about 7 years, and is not thought
to be used elsewhere, so disable it by default.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/Kconfig                   | 1 +
 arch/powerpc/configs/powernv_defconfig | 1 -
 arch/powerpc/configs/pseries_defconfig | 1 -
 3 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 9fa23eb320ff..1701646f845d 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -834,6 +834,7 @@ config FORCE_MAX_ZONEORDER
 
 config PPC_SUBPAGE_PROT
 	bool "Support setting protections for 4k subpages"
+	default n
 	depends on PPC_BOOK3S_64 && PPC_64K_PAGES
 	help
 	  This option adds support for a system call to allow user programs
diff --git a/arch/powerpc/configs/powernv_defconfig b/arch/powerpc/configs/powernv_defconfig
index 2de9aadf0f50..afc0dd73a1e6 100644
--- a/arch/powerpc/configs/powernv_defconfig
+++ b/arch/powerpc/configs/powernv_defconfig
@@ -64,7 +64,6 @@ CONFIG_HWPOISON_INJECT=m
 CONFIG_TRANSPARENT_HUGEPAGE=y
 CONFIG_DEFERRED_STRUCT_PAGE_INIT=y
 CONFIG_PPC_64K_PAGES=y
-CONFIG_PPC_SUBPAGE_PROT=y
 CONFIG_SCHED_SMT=y
 CONFIG_PM=y
 CONFIG_HOTPLUG_PCI=y
diff --git a/arch/powerpc/configs/pseries_defconfig b/arch/powerpc/configs/pseries_defconfig
index dfa4a726333b..894e8d85fb48 100644
--- a/arch/powerpc/configs/pseries_defconfig
+++ b/arch/powerpc/configs/pseries_defconfig
@@ -57,7 +57,6 @@ CONFIG_MEMORY_HOTREMOVE=y
 CONFIG_KSM=y
 CONFIG_TRANSPARENT_HUGEPAGE=y
 CONFIG_PPC_64K_PAGES=y
-CONFIG_PPC_SUBPAGE_PROT=y
 CONFIG_SCHED_SMT=y
 CONFIG_HOTPLUG_PCI=y
 CONFIG_HOTPLUG_PCI_RPA=m
-- 
2.23.0

