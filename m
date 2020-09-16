Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 567DF26BA77
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Sep 2020 05:04:19 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BrlLS09qYzDqWh
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Sep 2020 13:04:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::444;
 helo=mail-pf1-x444.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=fPZIUlMD; dkim-atps=neutral
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BrlJp0n2hzDqHf
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Sep 2020 13:02:48 +1000 (AEST)
Received: by mail-pf1-x444.google.com with SMTP id o68so3136702pfg.2
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Sep 2020 20:02:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4Zm7Guls/ByzVfzJfeWyVDwQBxSXXpKqrvCI05duBdU=;
 b=fPZIUlMDywirbhn4+3edQiKvK21QldUFYIgfcRQwEcfhbb5rH1qIpTDgnx4t7GzDMz
 0gOQWx+uTlx/i6Z60Q3vNJ7ecx518uIuRgBwqk50hjuGDYHWn7zJ+yk3HTZIYid85o+z
 JiioaQ2BikwRv8I4eMvy9p9n30wC8o8MHDq2b83SFYwthI9sV3VBCLncSX5osxM41xiK
 LhK7eiA6WtJImGzNTrKm1K0P7NkehhCxrgIJZAcdjHK7/RQ2B0v5Hh9J4/NGkTH0iscK
 LdQHpAYvKtdHqKc/3gNn+jZolDCwQ7cf7P8a98+cL0OvNJZ9hOwlBDl0qPsOLDD7G9cy
 m3Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4Zm7Guls/ByzVfzJfeWyVDwQBxSXXpKqrvCI05duBdU=;
 b=UamTxxR1MfDo1+intsWuRzsO4ZNKlwCMCD9LzNET2wppeWa4k0Ic42x3dcnAKi+b6d
 cHWccHFPYqAPLVAJ4tXsJJR5aJlHw57USVtfTXciDVfXs7F9IyDUEV17FopSHtGZJeem
 T7pSNHHXPVrY1nMW/fplLrYb5mj8fvoQ8Ie6Q0W+XkmqiBXLFFTx+dKS1TnPGE/AN4Fj
 6G04/CydV701B3FvVdgtuwkqfD8gCDIhfpmtTTwVW3c0VYSg+xNoVs0Awtt282Na8ipx
 VB3q0Tx9iNvn96dvRXfOLJocPyUybdsxAwM5pynC6hHQZPAdTEQZT+jK5vF+7TGTnzTt
 r9Iw==
X-Gm-Message-State: AOAM5302WZ5KW3z3TWZACn5qQgubHGWUQh/pkCNihGBF6kWNEBgHj5fQ
 GFglpVozle7Msh/vkcJ5uFWkrgMGs6wtMA==
X-Google-Smtp-Source: ABdhPJw2hcXRpVniLdAJpqLcdkUN2E1vSGfCuF/qLM6m7uHTmoxj+xT1pnmpDYLT5AZc60JDv2jjIQ==
X-Received: by 2002:a63:e249:: with SMTP id y9mr16928839pgj.117.1600225364508; 
 Tue, 15 Sep 2020 20:02:44 -0700 (PDT)
Received: from bobo.ibm.com ([203.185.249.227])
 by smtp.gmail.com with ESMTPSA id v26sm13090432pgo.83.2020.09.15.20.02.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Sep 2020 20:02:43 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 1/2] powerpc: untangle cputable mce include
Date: Wed, 16 Sep 2020 13:02:33 +1000
Message-Id: <20200916030234.4110379-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
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

Having cputable.h include mce.h means it pulls in a bunch of low level
headers (e.g., synch.h) which then can't use CPU_FTR_ definitions.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/cputable.h | 5 -----
 arch/powerpc/kernel/cputable.c      | 1 +
 arch/powerpc/kernel/dt_cpu_ftrs.c   | 1 +
 3 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/include/asm/cputable.h b/arch/powerpc/include/asm/cputable.h
index 32a15dc49e8c..f89205eff691 100644
--- a/arch/powerpc/include/asm/cputable.h
+++ b/arch/powerpc/include/asm/cputable.h
@@ -9,11 +9,6 @@
 
 #ifndef __ASSEMBLY__
 
-/*
- * Added to include __machine_check_early_realmode_* functions
- */
-#include <asm/mce.h>
-
 /* This structure can grow, it's real size is used by head.S code
  * via the mkdefs mechanism.
  */
diff --git a/arch/powerpc/kernel/cputable.c b/arch/powerpc/kernel/cputable.c
index 2aa89c6b2896..b5bc2edef440 100644
--- a/arch/powerpc/kernel/cputable.c
+++ b/arch/powerpc/kernel/cputable.c
@@ -16,6 +16,7 @@
 #include <asm/oprofile_impl.h>
 #include <asm/cputable.h>
 #include <asm/prom.h>		/* for PTRRELOC on ARCH=ppc */
+#include <asm/mce.h>
 #include <asm/mmu.h>
 #include <asm/setup.h>
 
diff --git a/arch/powerpc/kernel/dt_cpu_ftrs.c b/arch/powerpc/kernel/dt_cpu_ftrs.c
index f204ad79b6b5..1098863e17ee 100644
--- a/arch/powerpc/kernel/dt_cpu_ftrs.c
+++ b/arch/powerpc/kernel/dt_cpu_ftrs.c
@@ -17,6 +17,7 @@
 
 #include <asm/cputable.h>
 #include <asm/dt_cpu_ftrs.h>
+#include <asm/mce.h>
 #include <asm/mmu.h>
 #include <asm/oprofile_impl.h>
 #include <asm/prom.h>
-- 
2.23.0

