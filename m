Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C834421F598
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jul 2020 16:59:51 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B5kFc6X7bzDqfD
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jul 2020 00:59:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::443;
 helo=mail-wr1-x443.google.com; envelope-from=lee.jones@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=Yr1SJcM2; dkim-atps=neutral
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B5k3V4dgGzDqV6
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Jul 2020 00:51:01 +1000 (AEST)
Received: by mail-wr1-x443.google.com with SMTP id q5so22195468wru.6
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jul 2020 07:51:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sa7IFFvEjkUEYkKGNfZ4AaOfAhDNPotc0mtcZbr7pMU=;
 b=Yr1SJcM2AwK2hW8wKdiFtlaK6rKbZ3NlkGx8d1Od6cqVH4nDmmoGCDQVhLHIDws+3d
 2OVvC3aJXzU/ZjRq+haMRmCsqS9W94aOftUL13uUTXk4ZnJIiwTbqrjSFcSQ6+MBToTA
 Wlf9HuAi0Aza+9dtw/LHZF7rOTCDvLKrgawrfm5e6w/OV2eflKYPT6fW2ypIM7ewVmNc
 6sZcE8UtKJDkeu8wqVxcoXJajhBkeReoa/7FhnEB2BS2H5Z5vYRvhfarz4C2XXTsWwBv
 aBmWOuw/i4Vdi3oCKJV1Zdhv/857tPWI3NzjMDJuHyaPTGpybciaeB3NKBD0sTczkWGs
 so9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sa7IFFvEjkUEYkKGNfZ4AaOfAhDNPotc0mtcZbr7pMU=;
 b=B4dCE8jjBki5YMbG/NJg78s9yX/nd9yZEHL8NqL2g/Ybfp8CNX656Zy6khfCBbqx3Z
 4A+gQ7Axm87z1gctQ9qdapxJTOQaYoCGTkRejJ58H/qULoij3TtCnpvbMNTYHA7Un11z
 UpGf+iZJ8H24520KsSCEfOqWFS/stYdzsfF68lalO1MubaAGLTOCutsTRvn5tapi8ogi
 3Af/H5KujN8WumHAco30TNrs8wWhjkNPjERvD3PAk5SDq7nzprpeoouBJGrgaBwlAfNZ
 1XgJtsA9XxwdDrxH8LX48HpP/8GjATsWcbGExqCHL+wWLr5lRRDtG7OEI2UD7ffKWBYd
 YVFg==
X-Gm-Message-State: AOAM531RUkMf7+O+Tc8sVEzWQ+hCrf5UItKnbzTfZBuCy4bDLyeGtxhY
 6+zL3Nw39uKSNoTgTVtNh8o6+w==
X-Google-Smtp-Source: ABdhPJzNf9Z+WHkT0D9c7/YKzZVAjpjagqUFxoxaf/blhTxuH25LgfvUKpph8N2tIaWR9WV7qZZ8hg==
X-Received: by 2002:adf:82f5:: with SMTP id 108mr6084464wrc.218.1594738257584; 
 Tue, 14 Jul 2020 07:50:57 -0700 (PDT)
Received: from localhost.localdomain ([2.31.163.61])
 by smtp.gmail.com with ESMTPSA id a84sm4653305wmh.47.2020.07.14.07.50.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jul 2020 07:50:57 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: rjw@rjwysocki.net,
	viresh.kumar@linaro.org
Subject: [PATCH 05/13] cpufreq/arch: powerpc: pasemi: Move prototypes to
 shared header
Date: Tue, 14 Jul 2020 15:50:41 +0100
Message-Id: <20200714145049.2496163-6-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200714145049.2496163-1-lee.jones@linaro.org>
References: <20200714145049.2496163-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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
Cc: linux-pm@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 Olof Johansson <olof@lixom.net>, Lee Jones <lee.jones@linaro.org>,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

If function callers and providers do not share the same prototypes the
compiler complains of missing prototypes.  Fix this by moving the
already existing prototypes out to a mutually convenient location.

Fixes the following W=1 kernel build warning(s):

 drivers/cpufreq/pasemi-cpufreq.c:109:5: warning: no previous prototype for ‘check_astate’ [-Wmissing-prototypes]
 109 | int check_astate(void)
 | ^~~~~~~~~~~~
 drivers/cpufreq/pasemi-cpufreq.c:114:6: warning: no previous prototype for ‘restore_astate’ [-Wmissing-prototypes]
 114 | void restore_astate(int cpu)
 | ^~~~~~~~~~~~~~

Cc: Olof Johansson <olof@lixom.net>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Paul Mackerras <paulus@samba.org>
Cc: linuxppc-dev@lists.ozlabs.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 arch/powerpc/platforms/pasemi/pasemi.h    | 15 ------------
 arch/powerpc/platforms/pasemi/powersave.S |  2 ++
 drivers/cpufreq/pasemi-cpufreq.c          |  1 +
 include/linux/platform_data/pasemi.h      | 28 +++++++++++++++++++++++
 4 files changed, 31 insertions(+), 15 deletions(-)
 create mode 100644 include/linux/platform_data/pasemi.h

diff --git a/arch/powerpc/platforms/pasemi/pasemi.h b/arch/powerpc/platforms/pasemi/pasemi.h
index 70b56048ed1be..528d81ef748ad 100644
--- a/arch/powerpc/platforms/pasemi/pasemi.h
+++ b/arch/powerpc/platforms/pasemi/pasemi.h
@@ -15,21 +15,6 @@ extern void __init pasemi_map_registers(void);
 extern void idle_spin(void);
 extern void idle_doze(void);
 
-/* Restore astate to last set */
-#ifdef CONFIG_PPC_PASEMI_CPUFREQ
-extern int check_astate(void);
-extern void restore_astate(int cpu);
-#else
-static inline int check_astate(void)
-{
-	/* Always return >0 so we never power save */
-	return 1;
-}
-static inline void restore_astate(int cpu)
-{
-}
-#endif
-
 extern struct pci_controller_ops pasemi_pci_controller_ops;
 
 #endif /* _PASEMI_PASEMI_H */
diff --git a/arch/powerpc/platforms/pasemi/powersave.S b/arch/powerpc/platforms/pasemi/powersave.S
index d0215d5329ca7..7747b48963286 100644
--- a/arch/powerpc/platforms/pasemi/powersave.S
+++ b/arch/powerpc/platforms/pasemi/powersave.S
@@ -5,6 +5,8 @@
  * Maintained by: Olof Johansson <olof@lixom.net>
  */
 
+#include <linux/platform_data/pasemi.h>
+
 #include <asm/processor.h>
 #include <asm/page.h>
 #include <asm/ppc_asm.h>
diff --git a/drivers/cpufreq/pasemi-cpufreq.c b/drivers/cpufreq/pasemi-cpufreq.c
index c66f566a854cb..c6bb3ecc90ef3 100644
--- a/drivers/cpufreq/pasemi-cpufreq.c
+++ b/drivers/cpufreq/pasemi-cpufreq.c
@@ -15,6 +15,7 @@
 #include <linux/timer.h>
 #include <linux/module.h>
 #include <linux/of_address.h>
+#include <linux/platform_data/pasemi.h>
 
 #include <asm/hw_irq.h>
 #include <asm/io.h>
diff --git a/include/linux/platform_data/pasemi.h b/include/linux/platform_data/pasemi.h
new file mode 100644
index 0000000000000..3fed0687fcc9a
--- /dev/null
+++ b/include/linux/platform_data/pasemi.h
@@ -0,0 +1,28 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2020 Linaro Ltd.
+ *
+ * Author: Lee Jones <lee.jones@linaro.org>
+ */
+
+#ifndef _LINUX_PLATFORM_DATA_PASEMI_H
+#define _LINUX_PLATFORM_DATA_PASEMI_H
+
+/* Restore astate to last set */
+#ifdef CONFIG_PPC_PASEMI_CPUFREQ
+int check_astate(void);
+void restore_astate(int cpu);
+#else
+static inline int check_astate(void)
+{
+	/* Always return >0 so we never power save */
+	return 1;
+}
+static inline void restore_astate(int cpu)
+{
+}
+#endif
+
+#endif /* _LINUX_PLATFORM_DATA_PASEMI_H */
+
+
-- 
2.25.1

