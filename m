Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 242BC32B7E1
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Mar 2021 13:46:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DrDJv0Z4vz3cb0
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Mar 2021 23:46:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Sisvz3Nr;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::329;
 helo=mail-wm1-x329.google.com; envelope-from=lee.jones@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=Sisvz3Nr; dkim-atps=neutral
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DrDJT1XFzz2xy4
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Mar 2021 23:46:13 +1100 (AEDT)
Received: by mail-wm1-x329.google.com with SMTP id u187so5055237wmg.4
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 03 Mar 2021 04:46:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LHIHpoWITKla/9IZBsvp5706Sa7D3rYHp0QL+y3tf4c=;
 b=Sisvz3NrnqtlrK/NrwfvMh2IsHBgzMb+URq0HB3Rp611Z3MFBAI5WPTShD8NSfxQze
 fOkvPU7NbqDykF9U1MaCEBI2w9cA4RQNTKSvg5ksFbOzyVtV9AYLkyMAUtngE/yjJEwt
 slR4phu1ikc8lvCi/eYGq3gZiOGrKR6kEiFl1WpwZsQCbRVAfT5/tdCK08WZokyA+XNh
 wxhUpdYmn2GomjNBXUgYOjaqpOAcVXOfXuvpH9ZgI/N3sJsLQL/WrzMuHKstBKZ+/4dF
 DWbi4+VA9azhmMpCHlnUcAqsArhj5Aquoe+ZMcBUfYcpShEInuLa2qov/7A9rKSqLYQJ
 Ke4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LHIHpoWITKla/9IZBsvp5706Sa7D3rYHp0QL+y3tf4c=;
 b=WpfZNoGv+vFib/evUHuJH9nEFAtBRz4YBz9+cRDNZIGEeEzypRXkjXRfrnzqSiOovo
 NPnSt2TVKVuEPQyup+FfeTuhJ9UdHiHA8/dh8D8uSjuOH2p+Ils47oubhETfJSyw6qwE
 1h3D2cXCQc6Va/kTUunLtFOCYNQizx8jugvSALDyj9juuAd/Q1nbBFLiSEvHP+US7PQZ
 8cfU5+8gnTDNJMwwmiC1mBkwgzIsABhdOaxE59AU7QS6380MYcjQygwHBLcMyi2Zq9OC
 KZXsLMKORJKnVnGq1KNoFauTbZCij2jzQwogLDMj9J/v4J1pGwtFmwMpiOyGp1j1SPr3
 dYXg==
X-Gm-Message-State: AOAM532BEZKm0Kxfq80mLnDO1dt5omKQfj/crnIJEuX1SD4jvyJaqsJD
 sYNRBju6LaZhjpvTQXwzpaVQ1Q==
X-Google-Smtp-Source: ABdhPJxvfbyWe0xKuFVo6LR++FxzOh/nkBH2FsnVXfGIznDO0CIRicI/8mERVJR35yjKLHD8RhP8fg==
X-Received: by 2002:a7b:c5d0:: with SMTP id n16mr9011294wmk.27.1614775566661; 
 Wed, 03 Mar 2021 04:46:06 -0800 (PST)
Received: from dell.default ([91.110.221.155])
 by smtp.gmail.com with ESMTPSA id 18sm5581353wmj.21.2021.03.03.04.46.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Mar 2021 04:46:06 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [RESEND 1/1] powerpc: asm: hvconsole: Move 'hvc_vio_init_early's
 prototype to shared location
Date: Wed,  3 Mar 2021 12:46:03 +0000
Message-Id: <20210303124603.3150175-1-lee.jones@linaro.org>
X-Mailer: git-send-email 2.27.0
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
Cc: linuxppc-dev@lists.ozlabs.org, Paul Mackerras <paulus@samba.org>,
 linux-kernel@vger.kernel.org
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
index 4fe48c04c6c20..a13438fca10a8 100644
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
index 46e1540abc229..145e3f4c999af 100644
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
2.27.0

