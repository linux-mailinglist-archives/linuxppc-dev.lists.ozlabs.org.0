Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E85F82130FC
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Jul 2020 03:27:34 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49yclS09XvzDqZw
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Jul 2020 11:27:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1041;
 helo=mail-pj1-x1041.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=XvguNpRZ; dkim-atps=neutral
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49ycbG5GdGzDr6q
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Jul 2020 11:20:26 +1000 (AEST)
Received: by mail-pj1-x1041.google.com with SMTP id u8so12870914pje.4
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 02 Jul 2020 18:20:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=o8LwC+qktyP8ZqLNY6wHCDbWY3Ky3sWMv7KAmaONrVU=;
 b=XvguNpRZTZP/h71d93R73VBOlM08LPuaeOBlneU63ne/L7GLBObyffyWirquXwzInf
 59t68Sik6FbFSfnqXHjB9LmnXjakPzB8VDLhS/RbAAziGzaIv+Sncs0FV3mfuwzt7AFX
 gLIt/5rvF/ONaC+jkxf2MHxcxslGczknFLwtC238Vw3nzbqnGFqV8b/1ZJa8Y8QQIItG
 9Q/OubfWO1HtogwuIrDelys65tKh+KSZwYhYusdsiQpYyLUqDXDGhCJ8eqvU0LILRmeB
 jRgxPziUKmXugrRCu8qc6vh58u4756iZfl8/VXOQRfMPFab7InZAUaLJIz7aueuRVuYF
 x2bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=o8LwC+qktyP8ZqLNY6wHCDbWY3Ky3sWMv7KAmaONrVU=;
 b=ZNnN4/nNHoYAwoRnaSdYEpc7QvmX8hpPEKsEv85lZ9mnjODSh6oxCBFngtDV8jqvLC
 gSDrOhNKBEjARdMGjnJx2mYQ6EvO0IUN/yBTlKlitxA/easZ9KVC/GPvv1wLJ3xyxrpb
 kuS+g5hMpdvS+HOI7xQWv2Bf8HaHjX3D0Ko5pJI927gYCDIHZRio1dYeU9VYV/Z00x+2
 XN3uG2nuIkelbOT1fX0qNxIcLXq+j7btDf4qg3/l69s8CZt3qr8FTyfZyNBUCaAkodhR
 54c+89aJ/TwshsppgxvV7JQPT9z3KMi0ibsMnAUDc+FqEAwQBhprh71hawqXaHZrAC8+
 q4OA==
X-Gm-Message-State: AOAM531DElLNvZgL/QT1wsTIOtwhNiyiOkS6sJ76mS+TeGCKnmz3q2Hd
 FkGAeYE5ny7rCW4lJ/O2rKMa6SSk
X-Google-Smtp-Source: ABdhPJzjRaAlp7XO//YM/8n2zmmXsVRaggi4uCA028UZFvDs8+H+qXrObFXTvNH00boHgly3COvZYw==
X-Received: by 2002:a17:90a:e618:: with SMTP id
 j24mr4699964pjy.41.1593739221038; 
 Thu, 02 Jul 2020 18:20:21 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (61-68-186-125.tpgi.com.au. [61.68.186.125])
 by smtp.gmail.com with ESMTPSA id v186sm10094222pfv.141.2020.07.02.18.20.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jul 2020 18:20:20 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 3/3] powerpc/64s/hash: disable subpage_prot syscall by
 default
Date: Fri,  3 Jul 2020 11:19:58 +1000
Message-Id: <20200703011958.1166620-4-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200703011958.1166620-1-npiggin@gmail.com>
References: <20200703011958.1166620-1-npiggin@gmail.com>
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
Cc: linux-mm@kvack.org, kvm-ppc@vger.kernel.org,
 Nicholas Piggin <npiggin@gmail.com>, linux-api@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The subpage_prot syscall was added for specialised system software
(Lx86) that has been discontinued for about 7 years, and is not thought
to be used elsewhere, so disable it by default.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/Kconfig                   | 7 +++++--
 arch/powerpc/configs/powernv_defconfig | 1 -
 arch/powerpc/configs/pseries_defconfig | 1 -
 3 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 9fa23eb320ff..04c6ca17661a 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -833,13 +833,16 @@ config FORCE_MAX_ZONEORDER
 	  this in mind when choosing a value for this option.
 
 config PPC_SUBPAGE_PROT
-	bool "Support setting protections for 4k subpages"
+	bool "Support setting protections for 4k subpages (subpage_prot syscall)"
+	default n
 	depends on PPC_BOOK3S_64 && PPC_64K_PAGES
 	help
-	  This option adds support for a system call to allow user programs
+	  This option adds support for system call to allow user programs
 	  to set access permissions (read/write, readonly, or no access)
 	  on the 4k subpages of each 64k page.
 
+	  If unsure, say N here.
+
 config PPC_COPRO_BASE
 	bool
 
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

