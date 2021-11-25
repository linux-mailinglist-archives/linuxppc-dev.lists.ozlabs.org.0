Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9254845DA82
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Nov 2021 13:56:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J0Hts2w3Wz3dZj
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Nov 2021 23:56:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=QKeiCJHQ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102b;
 helo=mail-pj1-x102b.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=QKeiCJHQ; dkim-atps=neutral
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J0Hmd5FjMz3bX0
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Nov 2021 23:50:57 +1100 (AEDT)
Received: by mail-pj1-x102b.google.com with SMTP id
 fv9-20020a17090b0e8900b001a6a5ab1392so5707011pjb.1
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Nov 2021 04:50:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/TWT/1VO2cM4mkWhFKaRQ6kP++Q2gMqGBqdMOR/cLj0=;
 b=QKeiCJHQi21gpL62uM6ey7zjeQBDQ8h/crdMsBVux4DqXk8BKhFyK9XQ91k7NisPnn
 AfAvlPFx9pc1fq+sOvI61yJi55tQUgbsFulx7my2e/D/EV02lCClAvcUcmT8dN+R4dti
 XOwCZPt5OXqh3feY4ESBnsT7wwa/Yx7X3W6AyfxiHbZCUMZAjQHDauFPQt/aCLGuOnIT
 POXCqNBA1PXECCDxTnQ0SLby3BsNqVwdsUA3KsCHZ0uNeRgUA4rW5UAipfDMN03JL4Pj
 ygH1ePLUECXmlm7bYUzxWy5utn8uF2Nwp30/E8h3y7esL2vu6OgDR89ZbTjh39E2Y0YL
 vfug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/TWT/1VO2cM4mkWhFKaRQ6kP++Q2gMqGBqdMOR/cLj0=;
 b=A/sFS37FXmMhAtFp59eKBqj3nJPjLq1Vh0rMdLwR30cwg7kz1uAJ3be16XCbc8mQ+i
 noOFp2/p6MMqJdxVXY0uEUWCApx4HYZlps//4NaEwZ0bedhTdv88xhkQldYGd4Ebn5NC
 0aaaNV01PW2pS7HUgAqDF/NgqdUhg8+6zQOPdDThEuTV8pKUJvH5yBfKFHXFzl2buWjM
 2p8WMPRBxdDo2f1wMBzH3qrQGPri+CLvo4AniSaykJkN4YZ5Cp/uC3IHkGzED5GXwkWw
 aPMWnJXFCVjuZEBc6cul7mR9H37Ijkc/FRkHRsQ/O7iFocBHPm9qCmsuyKJyApSvDEE/
 2X9A==
X-Gm-Message-State: AOAM5338RCxA2L1TlLfIrsWPFz2ja6posEpICiZLtBQ9Ld0n6sF4f/Uq
 JnyzFs324BzDSAqm3Fs68e54rl8AHos=
X-Google-Smtp-Source: ABdhPJyU8kjKPnNS8bYsMnWO8zxVcBDkrl14EAzKi+MKNNIVJOP5h27j/ZPKKIS8aWJaE2U6P86+gg==
X-Received: by 2002:a17:90a:e40f:: with SMTP id
 hv15mr6619114pjb.5.1637844656081; 
 Thu, 25 Nov 2021 04:50:56 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (115-64-213-93.static.tpgi.com.au.
 [115.64.213.93])
 by smtp.gmail.com with ESMTPSA id gc22sm7242851pjb.57.2021.11.25.04.50.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Nov 2021 04:50:55 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v4 08/17] powerpc/64s: Make flush_and_reload_slb a no-op when
 radix is enabled
Date: Thu, 25 Nov 2021 22:50:16 +1000
Message-Id: <20211125125025.1472060-9-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20211125125025.1472060-1-npiggin@gmail.com>
References: <20211125125025.1472060-1-npiggin@gmail.com>
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

