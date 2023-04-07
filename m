Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F6796DA826
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Apr 2023 06:10:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pt4dt267qz3fX1
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Apr 2023 14:10:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=DRv3mSUI;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102e; helo=mail-pj1-x102e.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=DRv3mSUI;
	dkim-atps=neutral
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pt4cy5JRLz3fCJ
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Apr 2023 14:09:21 +1000 (AEST)
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-244a5ccf13eso56204a91.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 06 Apr 2023 21:09:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680840557; x=1683432557;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SK2YYoIN21b85zRF1/8XYFAeQz2kUWAkleEQep6ySX8=;
        b=DRv3mSUIv4U4KCVgAgfwdVcPqrN75uduOlGLXUtYrog+4uw6vA9VLGcEKEMTmkqiSc
         Q3cT2s8jS22jb5ZwIuiKqz+1NpoudJ+ztlGp9kGth1/pKK/ZZdIgGBIDXP9mQ4BznYF0
         lxoiWhwhdLi0UE8v6EpqN4Al9Ro+tp83TU89lPblaFkCLPlGswvLaeptTC/igpV3tCwF
         QqkScUadcLAf/H2c6jw2puckn1GKienZC1lyP6NoVY9t50B05yDLiWOcHgHuu1BInJkp
         UF0G7N1jlc/jb+xhTdsha6C1Ga1hryoG4V3PrG4gMmP8h2n7HWpavGpxF/FlIpautDmK
         wvLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680840557; x=1683432557;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SK2YYoIN21b85zRF1/8XYFAeQz2kUWAkleEQep6ySX8=;
        b=nAfVD4Pu9b0WC3FFJnbP4zz5Zj0pKBYhBlgoKlf0IwNal/9VGdncMRsDa+m+alnAIQ
         O4pN0CLazvK2ikYECg8m3Wa1XFXQBMy1UPE+lNYc67IGL9XE0lqUHvAKb7+KNE19YU05
         efS9ONdy5qKfLbQaUgLs29/wpVXsXFqIULfaGsX+wlnrU0A6kU0g3PdumsaGx3/UoCVv
         nVWARF5fQZP29xHM1ezjK2o9GI0XTlU9QAhJ+SAMjSwoa2QrmIRXOcIqMs+Eh7O20S1+
         shRVxl0Q+SYOBcGDIFHTfVwKAcdhNBIqaFhSVAS3ZafSY22q6QbMhIBUXjSFPBigVkRd
         H3iw==
X-Gm-Message-State: AAQBX9eazC28LnjvbVBSOrqmqDlKKJcVLmI0Nljc/tf9PuCSadmJht4H
	RYl+SV3jA7hty+Pg48BE0Mk+pB8q6AzhbQ==
X-Google-Smtp-Source: AKy350ZfFYTjkGGPsO95oC3oqLiWDKCpKnUi9vQZ9hHn5riT+yEbu0bAqM0XrBeK9J2frUx5YZDiGw==
X-Received: by 2002:a62:1d52:0:b0:62d:af5a:27bf with SMTP id d79-20020a621d52000000b0062daf5a27bfmr1232539pfd.6.1680840557226;
        Thu, 06 Apr 2023 21:09:17 -0700 (PDT)
Received: from wheely.local0.net ([203.59.189.25])
        by smtp.gmail.com with ESMTPSA id m26-20020a056a00165a00b0059442ec49a2sm2137505pfc.146.2023.04.06.21.09.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Apr 2023 21:09:16 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/boot: Fix boot wrapper code generation with CONFIG_POWER10_CPU
Date: Fri,  7 Apr 2023 14:09:09 +1000
Message-Id: <20230407040909.230998-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.40.0
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
Cc: Danny Tsen <dtsen@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

-mcpu=power10 will generate prefixed and pcrel code by default, which
we do not support. The general kernel disables these with cflags, but
those were missed for the boot wrapper.

Reported-by: Danny Tsen <dtsen@linux.ibm.com>
Fixes: 4b2a9315f20d9 ("powerpc/64s: POWER10 CPU Kconfig build option")
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/boot/Makefile | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/powerpc/boot/Makefile b/arch/powerpc/boot/Makefile
index 295f76df13b5..13fad4f0a6d8 100644
--- a/arch/powerpc/boot/Makefile
+++ b/arch/powerpc/boot/Makefile
@@ -34,6 +34,8 @@ endif
 
 BOOTCFLAGS    := -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs \
 		 -fno-strict-aliasing -O2 -msoft-float -mno-altivec -mno-vsx \
+		 $(call cc-option,-mno-prefixed) $(call cc-option,-mno-pcrel) \
+		 $(call cc-option,-mno-mma) \
 		 $(call cc-option,-mno-spe) $(call cc-option,-mspe=no) \
 		 -pipe -fomit-frame-pointer -fno-builtin -fPIC -nostdinc \
 		 $(LINUXINCLUDE)
-- 
2.40.0

