Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E22E436D8B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Oct 2021 00:36:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hb2Q041VFz3cXw
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Oct 2021 09:36:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=qLUwkJ79;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1031;
 helo=mail-pj1-x1031.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=qLUwkJ79; dkim-atps=neutral
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hb2Hn4mp4z3cCw
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Oct 2021 09:30:45 +1100 (AEDT)
Received: by mail-pj1-x1031.google.com with SMTP id
 o4-20020a17090a3d4400b001a1c8344c3fso2144401pjf.3
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Oct 2021 15:30:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/TWT/1VO2cM4mkWhFKaRQ6kP++Q2gMqGBqdMOR/cLj0=;
 b=qLUwkJ79BykCBrX6zupRfcreZvk/y4xOgPLjzNz2s1EDZUovQspDAAnvsQenOfrT9C
 MF1yymFxFBPsX7LyPboK+qeiLZdHiMKsfVtY8Rati7PgCUz9mINAHGy34krj9wxE94ZC
 bdoQukuDCxW6rhhQhacqaMQ7dKEiIgkhdal2udW77qtbi3olIFwtlY00N+j/tagR+ifW
 bPudfa1reJZjKhXzr3TJn8nYBeqFLlVVbBCAJZnD94cQioQI1Jxp9ogztZRqdQOWBovX
 Ybv9LVE2Zz2T8Ekphzfo+B4W9kmvIJvjRJd0iCMF1qm6ZQ8d0ZwjaT+xAxDzuKr7SXAE
 7TMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/TWT/1VO2cM4mkWhFKaRQ6kP++Q2gMqGBqdMOR/cLj0=;
 b=HaxeiGAedaHu9YkHZd6J7d9dxzstsnB1eztCbFeUUt7NogKSxycInlUC8Ay+W7tubB
 xgqHrzsiIqDB496zuZ2yQ/oA1uotOieQ0fYRdgMwB9IZvHAjFMNwKnngjahXNx1w5/XG
 cysOM9jqYJ6PBZgEEosU2dy0IKDxs3ybrric0AInS1kUBW6wj0+N2z69j2NgwOPvxh6j
 tMHiX53XjuH0v+qvGWdzH1CYDjOIwlvysY9E6cGFiUGkSZH5ZN7HO189AtudMbGgsDSj
 q11j/O+AJPQnlT+5Tf5PA4g2ZfYq6pj8p7EUvVfM3+/TnjFb9vr67rgfYjlpAPc6Abqo
 TOrQ==
X-Gm-Message-State: AOAM533+vCApBL4qbVo+356qez58mH9pHF3ZOEa28Uu5QKapwsIf3DVF
 483o0PXW1UyjfsyoechPRxYIORkya3E=
X-Google-Smtp-Source: ABdhPJxiJAj4so8lbFC1yfqHPcpxizaXJRLkgSxVrhopEEy6bpd98AF/tqLCRLFTcvKJzhB9R3SNfw==
X-Received: by 2002:a17:902:9a43:b0:13f:8f31:101c with SMTP id
 x3-20020a1709029a4300b0013f8f31101cmr7805719plv.76.1634855443573; 
 Thu, 21 Oct 2021 15:30:43 -0700 (PDT)
Received: from bobo.ibm.com (14-203-144-177.static.tpgi.com.au.
 [14.203.144.177])
 by smtp.gmail.com with ESMTPSA id e6sm7205716pfm.212.2021.10.21.15.30.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Oct 2021 15:30:43 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 08/18] powerpc/64s: Make flush_and_reload_slb a no-op when
 radix is enabled
Date: Fri, 22 Oct 2021 08:30:03 +1000
Message-Id: <20211021223013.2641952-9-npiggin@gmail.com>
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

The radix test can exclude slb_flush_all_realmode() from being called
because flush_and_reload_slb() is only expected to flush ERAT when
called by flush_erat(), which is only on pre-ISA v3.0 CPUs that do not
support radix.

This helps the later change to make hash support configurable to not
introduce runtime changes to radix mode behaviour.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/mce_power.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/kernel/mce_power.c b/arch/powerpc/kernel/mce_power.c
index c2f55fe7092d..cf5263b648fc 100644
--- a/arch/powerpc/kernel/mce_power.c
+++ b/arch/powerpc/kernel/mce_power.c
@@ -80,12 +80,12 @@ static bool mce_in_guest(void)
 #ifdef CONFIG_PPC_BOOK3S_64
 void flush_and_reload_slb(void)
 {
-	/* Invalidate all SLBs */
-	slb_flush_all_realmode();
-
 	if (early_radix_enabled())
 		return;
 
+	/* Invalidate all SLBs */
+	slb_flush_all_realmode();
+
 	/*
 	 * This probably shouldn't happen, but it may be possible it's
 	 * called in early boot before SLB shadows are allocated.
-- 
2.23.0

