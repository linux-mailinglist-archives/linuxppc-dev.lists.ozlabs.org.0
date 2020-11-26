Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 68C4A2C5152
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Nov 2020 10:38:58 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ChXl31gWQzDqZm
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Nov 2020 20:38:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::442;
 helo=mail-wr1-x442.google.com; envelope-from=lee.jones@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=pZuWw9w7; dkim-atps=neutral
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4ChXhN1l8vzDqt3
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Nov 2020 20:36:33 +1100 (AEDT)
Received: by mail-wr1-x442.google.com with SMTP id s8so1367217wrw.10
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Nov 2020 01:36:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=VNTdg6uSFyVYv0FKJ+yGxhaNjehS8G/rV5edZ4pYTiI=;
 b=pZuWw9w7rVcJMYBmZ/6gy0ZUhOd7j0c3RHq1Vd9a/HHbmMPrN4jIXdpxJmJwobp7GC
 mxURWBCirtUl0coDUoUCJiV7iHFodMnYSUcolj+eGBvv8j/EUKM/bY/rIaBSrlIiAJz2
 oRWGH/Jf3MlaHfvJTtWEKaLIBKuz6tBhffVMYVcuh/rCdame0rDgv0389MA0gZqKzfiS
 S+SW72FQs+e8NDdfEGGPlFrSCc/OI5R01K2KDIqgCU5s5Ha5N2OgGw4r/EUll57tnJnr
 vFeTY2axQtcOgpmQLaTFZuUxyI+mzZjmln+OhrdmUSRyRji3Mnk3rRBukxnFuiM2xKu7
 s7Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=VNTdg6uSFyVYv0FKJ+yGxhaNjehS8G/rV5edZ4pYTiI=;
 b=dZaNXDFYZPbmqYhLT6mRpgLLWG6qeg0+W+HLog7NO8sjDmDLwjBw2wZObj7V+zM4gM
 JpewsF8bxVMbVcdXahRpxacNogY2i0g7m4+brYlJ13jPaDUaOpcupCzU+AaG7aLHCOH5
 GHA3MR4IeosOsfHf0U1HwQdQVw3EFVlPJp/KkVMn3O8pzDfb2uo+IOburB+K9kI1gQQ/
 sOSbvbpEJzxyRNDYpyI0hIFslssYfc+ISn6tp8F/XT19WH58ebsPh8+nDirWdl8fhLhU
 0BfH8S5WxaVixwLXkW3TJAiGfluez3fRXwnfxgE0HTv5WvxfSpSCMCqL0B7aehpmQliG
 Yv/w==
X-Gm-Message-State: AOAM533R1J/TFzOHq+846664muOJfj5At9SF++uuFlciRqO02ntQA2Pk
 72FtKYK3eu0lk5wRDSPRD4bA6g==
X-Google-Smtp-Source: ABdhPJziLLHTjlCheIGft72jKItK/SD8v+6hBiWGcPZzZbG7sP4TLb47T4jUL8kvroQiNBktUNxGXQ==
X-Received: by 2002:a5d:4d92:: with SMTP id b18mr2773267wru.260.1606383389033; 
 Thu, 26 Nov 2020 01:36:29 -0800 (PST)
Received: from dell ([91.110.221.235])
 by smtp.gmail.com with ESMTPSA id o2sm8102710wrv.4.2020.11.26.01.36.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Nov 2020 01:36:28 -0800 (PST)
Date: Thu, 26 Nov 2020 09:36:26 +0000
From: Lee Jones <lee.jones@linaro.org>
To: linux-kernel@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 31/36] powerpc: asm: hvconsole: Move 'hvc_vio_init_early's
 prototype to shared location
Message-ID: <20201126093626.GC2455276@dell>
References: <20201104193549.4026187-1-lee.jones@linaro.org>
 <20201104193549.4026187-32-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201104193549.4026187-32-lee.jones@linaro.org>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Fixes the following W=1 kernel build warning(s):

 drivers/tty/hvc/hvc_vio.c:385:13: warning: no previous prototype for ‘hvc_vio_init_early’ [-Wmissing-prototypes]
 385 | void __init hvc_vio_init_early(void)
 | ^~~~~~~~~~~~~~~~~~

Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Paul Mackerras <paulus@samba.org>
Cc: linuxppc-dev@lists.ozlabs.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
Acked-by: Michael Ellerman <mpe@ellerman.id.au>
---

v2:
- Removed 'extern' keyword

 arch/powerpc/include/asm/hvconsole.h     | 3 +++
 arch/powerpc/platforms/pseries/pseries.h | 3 ---
 arch/powerpc/platforms/pseries/setup.c   | 1 +
 3 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/include/asm/hvconsole.h b/arch/powerpc/include/asm/hvconsole.h
index 999ed5ac90531..ccb2034506f0f 100644
--- a/arch/powerpc/include/asm/hvconsole.h
+++ b/arch/powerpc/include/asm/hvconsole.h
@@ -24,5 +24,8 @@
 extern int hvc_get_chars(uint32_t vtermno, char *buf, int count);
 extern int hvc_put_chars(uint32_t vtermno, const char *buf, int count);
 
+/* Provided by HVC VIO */
+void hvc_vio_init_early(void);
+
 #endif /* __KERNEL__ */
 #endif /* _PPC64_HVCONSOLE_H */
diff --git a/arch/powerpc/platforms/pseries/pseries.h b/arch/powerpc/platforms/pseries/pseries.h
index 593840847cd3d..693f58d784b5b 100644
--- a/arch/powerpc/platforms/pseries/pseries.h
+++ b/arch/powerpc/platforms/pseries/pseries.h
@@ -43,9 +43,6 @@ extern void pSeries_final_fixup(void);
 /* Poweron flag used for enabling auto ups restart */
 extern unsigned long rtas_poweron_auto;
 
-/* Provided by HVC VIO */
-extern void hvc_vio_init_early(void);
-
 /* Dynamic logical Partitioning/Mobility */
 extern void dlpar_free_cc_nodes(struct device_node *);
 extern void dlpar_free_cc_property(struct property *);
diff --git a/arch/powerpc/platforms/pseries/setup.c b/arch/powerpc/platforms/pseries/setup.c
index 090c13f6c8815..b5513eefd12c9 100644
--- a/arch/powerpc/platforms/pseries/setup.c
+++ b/arch/powerpc/platforms/pseries/setup.c
@@ -71,6 +71,7 @@
 #include <asm/swiotlb.h>
 #include <asm/svm.h>
 #include <asm/dtl.h>
+#include <asm/hvconsole.h>
 
 #include "pseries.h"
 #include "../../../../drivers/pci/pci.h"
-- 
2.25.1
