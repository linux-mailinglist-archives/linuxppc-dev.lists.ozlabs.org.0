Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7518F206C5E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Jun 2020 08:31:33 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49sCwL2cwczDqjR
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Jun 2020 16:31:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::743;
 helo=mail-qk1-x743.google.com; envelope-from=leobras.c@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=PnIaqCxb; dkim-atps=neutral
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49sCmQ1Cx7zDqWq
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Jun 2020 16:24:38 +1000 (AEST)
Received: by mail-qk1-x743.google.com with SMTP id r22so855178qke.13
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Jun 2020 23:24:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=N10+Pl+gOu4SRdVCuPEwIFjCanYEHvINmOUco6mnksM=;
 b=PnIaqCxbQhnFAmJ4SHRKyyXB3hXczKTrf+1hinuFIOaCleQEnhfbAoz1on6TOAbXsZ
 LRI7LFZj5eJIlJwL7gnzlu7t6b5KG7bJOLp7oQGRB6mXiahgt43va5x/3xLImJf6Odg0
 j3ey5JKaHxbk3sjtdci+KWcdFb5jL0UoeBGaIvU3+A+OkDLhR3TLrOVLRrcRaisc0M94
 fbJHxnTVuON0goVl25TLFsmkSBGI4f59s14Y0raqEflqEiqAeK6HhQGxK+lKWTYY9qQb
 TL7GOWQ87GoGhID9oHQHk3wxZyJJqAkc1CYhLCWvEF+jC3gMCY2Bia4j7YZ3Y9/ERU/y
 Tgdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=N10+Pl+gOu4SRdVCuPEwIFjCanYEHvINmOUco6mnksM=;
 b=NWeHtn6V7FLFrV6SPKhjeCQ+ZLKKQpRQdvFLoWxzcptI1SAWMR6eM7YzTmTca3DBVq
 iRL9uyNCq708AwmvmM4YrcG3tyfg7dWQyNBcyxOZVaN2j/DXJYqOkofdqjC3yeyAAxm4
 yKH+GB/SwiuqDtaRgNQ+/Sq3ouDxWqa/yCn5VFnWgww+tXsWJrWErjRQ6WuVMTlMt8mi
 p7k5qNJxwpHyPEEJNA+/LBaVS2VHjrFDmCwfAbeBPnecBaSB7UlyFGLHEOkO0FLgfveD
 QeAanoQc70HUmuonOuekQjYiduc6zCVZh5bBkKb5Hfypj34P9taJRgHxlLVENEFgFRBr
 wE8w==
X-Gm-Message-State: AOAM5327Jdet88On+khHuXsODoYF1VQyL0U9jRnvou0XWmXqgUcbICAR
 MSLyHy8ymhES8WW71XCTOJY=
X-Google-Smtp-Source: ABdhPJwxoT0vKhWBynRYyaDEfIsChaZUQLTNLN1fuHnEAOSZkkIRfg9zum2U1I9g7O/w+XwSq3L25Q==
X-Received: by 2002:a37:4c0d:: with SMTP id z13mr12702783qka.170.1592979874849; 
 Tue, 23 Jun 2020 23:24:34 -0700 (PDT)
Received: from LeoBras.ibmuc.com (179-125-148-1.dynamic.desktop.com.br.
 [179.125.148.1])
 by smtp.gmail.com with ESMTPSA id n2sm2489727qtp.45.2020.06.23.23.24.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jun 2020 23:24:34 -0700 (PDT)
From: Leonardo Bras <leobras.c@gmail.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Leonardo Bras <leobras.c@gmail.com>,
 Alexey Kardashevskiy <aik@ozlabs.ru>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>,
 Ram Pai <linuxram@us.ibm.com>
Subject: [PATCH v2 3/6] powerpc/pseries/iommu: Move window-removing part of
 remove_ddw into remove_dma_window
Date: Wed, 24 Jun 2020 03:24:08 -0300
Message-Id: <20200624062411.367796-4-leobras.c@gmail.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200624062411.367796-1-leobras.c@gmail.com>
References: <20200624062411.367796-1-leobras.c@gmail.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Move the window-removing part of remove_ddw into a new function
(remove_dma_window), so it can be used to remove other DMA windows.

It's useful for removing DMA windows that don't create DIRECT64_PROPNAME
property, like the default DMA window from the device, which uses
"ibm,dma-window".

Signed-off-by: Leonardo Bras <leobras.c@gmail.com>
---
 arch/powerpc/platforms/pseries/iommu.c | 45 +++++++++++++++-----------
 1 file changed, 27 insertions(+), 18 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/iommu.c b/arch/powerpc/platforms/pseries/iommu.c
index 558e5441c355..a8840d9e1c35 100644
--- a/arch/powerpc/platforms/pseries/iommu.c
+++ b/arch/powerpc/platforms/pseries/iommu.c
@@ -776,25 +776,14 @@ static int __init disable_ddw_setup(char *str)
 
 early_param("disable_ddw", disable_ddw_setup);
 
-static void remove_ddw(struct device_node *np, bool remove_prop)
+static void remove_dma_window(struct device_node *np, u32 *ddw_avail,
+			      struct property *win)
 {
 	struct dynamic_dma_window_prop *dwp;
-	struct property *win64;
-	u32 ddw_avail[DDW_APPLICABLE_SIZE];
 	u64 liobn;
-	int ret = 0;
-
-	ret = of_property_read_u32_array(np, "ibm,ddw-applicable",
-					 &ddw_avail[0], DDW_APPLICABLE_SIZE);
-
-	win64 = of_find_property(np, DIRECT64_PROPNAME, NULL);
-	if (!win64)
-		return;
-
-	if (ret || win64->length < sizeof(*dwp))
-		goto delprop;
+	int ret;
 
-	dwp = win64->value;
+	dwp = win->value;
 	liobn = (u64)be32_to_cpu(dwp->liobn);
 
 	/* clear the whole window, note the arg is in kernel pages */
@@ -816,10 +805,30 @@ static void remove_ddw(struct device_node *np, bool remove_prop)
 		pr_debug("%pOF: successfully removed direct window: rtas returned "
 			"%d to ibm,remove-pe-dma-window(%x) %llx\n",
 			np, ret, ddw_avail[DDW_REMOVE_PE_DMA_WIN], liobn);
+}
+
+static void remove_ddw(struct device_node *np, bool remove_prop)
+{
+	struct property *win;
+	u32 ddw_avail[DDW_APPLICABLE_SIZE];
+	int ret = 0;
+
+	ret = of_property_read_u32_array(np, "ibm,ddw-applicable",
+					 &ddw_avail[0], DDW_APPLICABLE_SIZE);
+	if (ret)
+		return;
+
+	win = of_find_property(np, DIRECT64_PROPNAME, NULL);
+	if (!win)
+		return;
+
+	if (win->length >= sizeof(struct dynamic_dma_window_prop))
+		remove_dma_window(np, ddw_avail, win);
+
+	if (!remove_prop)
+		return;
 
-delprop:
-	if (remove_prop)
-		ret = of_remove_property(np, win64);
+	ret = of_remove_property(np, win);
 	if (ret)
 		pr_warn("%pOF: failed to remove direct window property: %d\n",
 			np, ret);
-- 
2.25.4

