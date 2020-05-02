Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A290C1C2319
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 May 2020 06:47:22 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Dc6c0wQmzDrMl
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 May 2020 14:47:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::442;
 helo=mail-pf1-x442.google.com; envelope-from=bmeng.cn@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=CWcCGLEN; dkim-atps=neutral
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Dc4d2XBZzDrG3
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  2 May 2020 14:45:34 +1000 (AEST)
Received: by mail-pf1-x442.google.com with SMTP id f7so2555015pfa.9
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 01 May 2020 21:45:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=xWUbV1bTknAW0Bm6cae3+Htidg6+0EEEOJS3c1Nz340=;
 b=CWcCGLENPQImkqqGQQ1S3R76NcIM4HXNAblks/uAoiD0EsKHrTPWYcSCIAH1I5maxB
 B3Oa8XQ9oZB/dumamkUN3bEmubcAY6KNQdlCTkaqdJA40SVLP2dEGUTP3etHX2x+3fMB
 OJWaB0nPuu+7WtKcPZy8hbYfu12AZjI5mfHuAcBY5wcC9buFzOv37AF3r3ksa2zpW7Mv
 JrDxRhYwggk6BNq0CdXOcJZBraj6DUbUAi4dewt6CTc7XAckeDK4ziGimZAtFx0EEHLQ
 OtgIqxIovzWuoa+RsGEIEO9g14UjzJPlgmz5VegYRD1WtR0i88wbxRWV0hl4PSkZgxe3
 q2MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=xWUbV1bTknAW0Bm6cae3+Htidg6+0EEEOJS3c1Nz340=;
 b=LaPEhwhy2OA5krOMZ0x/NdWdzXGbKdErrZ2BVYZmIT3J9htreIqVGlCX8f6Cd75iIP
 86mq0zJGncLx/Km3NdDJhiNmWf7/KGS27/M3RzcjlAmAE2MRmTWOw+cf0uTkqtlnHmOC
 yaneG8dnf0P+mJ5b+mpZCeAVDviY7Hl41Br/r91ZFHwpZofaZFLj7l4gknXTkxC42EIG
 CLVtdSgoXkCJA7gas6v3kljMYB4HwQJjJrsRvKHDwZDVZG6Kw+a+e1VEmOhnBxf98D1H
 xLMBJMvZJETogpWopwz8Y8bVs+dpd0urnItqZxHRklLyNbx87ZEh3z28TT8WCOm46Gxl
 Gtdg==
X-Gm-Message-State: AGi0PuYolinbhP1pTSVVb2UYupOsfUw8iy5U0xu9hhaIB/NKW54cs3tX
 SkpfAPtk1tu5DCWzvpLobf3moZZC
X-Google-Smtp-Source: APiQypItOayLSQuLFl90m701CNyQEVV584jm0Or9VVtbPtHhNAOkNrr6bvIQ/BKwQeOZGFwlS1UbJQ==
X-Received: by 2002:a63:1e22:: with SMTP id e34mr7546320pge.427.1588394731375; 
 Fri, 01 May 2020 21:45:31 -0700 (PDT)
Received: from localhost.localdomain (unknown-224-80.windriver.com.
 [147.11.224.80])
 by smtp.gmail.com with ESMTPSA id z28sm3597373pfr.3.2020.05.01.21.45.30
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Fri, 01 May 2020 21:45:30 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] powerpc: Drop CONFIG_MTD_M25P80 in 85xx-hw.config
Date: Fri,  1 May 2020 21:44:54 -0700
Message-Id: <1588394694-517-1-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 1.7.1
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
Cc: Bin Meng <bin.meng@windriver.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Bin Meng <bin.meng@windriver.com>

Drop CONFIG_MTD_M25P80 that was removed in
commit b35b9a10362d ("mtd: spi-nor: Move m25p80 code in spi-nor.c")

Signed-off-by: Bin Meng <bin.meng@windriver.com>

---

Changes in v2:
- correct the typo (5xx => 85xx) in the commit title

 arch/powerpc/configs/85xx-hw.config | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/powerpc/configs/85xx-hw.config b/arch/powerpc/configs/85xx-hw.config
index b507df6..524db76 100644
--- a/arch/powerpc/configs/85xx-hw.config
+++ b/arch/powerpc/configs/85xx-hw.config
@@ -67,7 +67,6 @@ CONFIG_MTD_CFI_AMDSTD=y
 CONFIG_MTD_CFI_INTELEXT=y
 CONFIG_MTD_CFI=y
 CONFIG_MTD_CMDLINE_PARTS=y
-CONFIG_MTD_M25P80=y
 CONFIG_MTD_NAND_FSL_ELBC=y
 CONFIG_MTD_NAND_FSL_IFC=y
 CONFIG_MTD_RAW_NAND=y
-- 
2.7.4

