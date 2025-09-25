Return-Path: <linuxppc-dev+bounces-12586-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 484FFBA1FE9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Sep 2025 01:46:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cXr2k252dz3cbF;
	Fri, 26 Sep 2025 09:46:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758843982;
	cv=none; b=SHM145/3zp9tMN/mtEQt+O6wHpIXw9+7OkpaCn9wRnxpk/A79/p/p3+3Utwwkm8MGqwJY9FYPYWV4UkQ1sOpi9D1bZv54pQ6uIxl+zzoDrzKFCOxMV0eWaIugiGD/OegeFMNtJMFTmU+vsKpnP4tTdBhk9iCTf5uvNL0Gz2b4NYv2IaGzjxxjchdGUo916okPneWLOSn9kmLjUyjHc/QXWka0x18+woHKS9HFeGQFnDY8gO/wa1QS+5FcdsRZyiA/oaDN9cfLuhuH+JCrUZocvhjFgosoOM+0eaASSUr9xylSj7gICGemjl/YZMo5kcCDhpiddXp70/YYWTaRUsjNg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758843982; c=relaxed/relaxed;
	bh=Xj3KRzu2c6VhWOfOXg+xKc10lWhGpwRneRscgw2Csq0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kh83U5zrj6Jkrwkvsa8UIcH6yewin7vlblH+62kohvnNxogBYnfWZstTtK8CQME5OPJqwD5Joy34TTOKKrXf+3XiZxDNGjjretC7xo0JQSc+mvJT04aSE/QKpHcVPeAB+AMhTa3WfLQRXYra4tSwujihTYGs2hUR4d/GSZjgCEsLapHfjMd3DLHeA6dJeoiO27xeYsfi2+rpyr49gLKCZ7r7085tgvnajtTMNhRHJvQAU8u+qy9SHPRcsojUESSUOK1aKX39QF44X3YraMOqE/aKJ4yKQ/Tb8PuTQnoETp8EdZNunn3hPMFZBXbrVEBHuYyYJ+LCSyffouDl5asM4Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=kKxVye+3; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=nathan@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=kKxVye+3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=nathan@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cXr2j2nvHz2xQ3
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Sep 2025 09:46:21 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8249A61353;
	Thu, 25 Sep 2025 23:46:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E618BC4CEF0;
	Thu, 25 Sep 2025 23:46:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758843979;
	bh=gAxMMO8iLbRfWUQ4XZXNybZmAABcJXpeoRBJ86bPuRc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=kKxVye+3Izk9Gil8d0gYEG3VBsDXau0c2QJZb4YGVXnPcBOiDPtYQx1Secx/X25fG
	 D7k0dAyr3Pw5j1CWJQbDOqCvAwUgezBPFTdaVL9RYIFwkFmlvKd2JsdPJRq2VIKeF6
	 IP6RhJamtXE5/xungZKqnHa0fBfHlr/kJFmvT+Zni9L55woDYMvXpAbUQgAKOc+7Sd
	 hTerWBXo85W9LiioUtfaY1gUywnh/+HgTcNkBga6z/bwmWw1pDKR3JAo+eOvc/Dovv
	 Vux54+isn3hQl4RXk3iDEw2PrmuaMdyb9wMoZ91016cLO1BTvf2orKosq+KAxznJxg
	 3RpMoUxnrCGKQ==
From: Nathan Chancellor <nathan@kernel.org>
Date: Thu, 25 Sep 2025 19:46:07 -0400
Subject: [PATCH 2/2] macintosh/via-pmu-backlight: Include linux/of.h and
 uapi/linux/fb.h
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250925-ppc-fixes-for-backlight-fb-h-removal-v1-2-d256858d86a6@kernel.org>
References: <20250925-ppc-fixes-for-backlight-fb-h-removal-v1-0-d256858d86a6@kernel.org>
In-Reply-To: <20250925-ppc-fixes-for-backlight-fb-h-removal-v1-0-d256858d86a6@kernel.org>
To: Lee Jones <lee@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Daniel Thompson <danielt@kernel.org>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Simona Vetter <simona.vetter@ffwll.ch>, linuxppc-dev@lists.ozlabs.org, 
 patches@lists.linux.dev, Nathan Chancellor <nathan@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2124; i=nathan@kernel.org;
 h=from:subject:message-id; bh=gAxMMO8iLbRfWUQ4XZXNybZmAABcJXpeoRBJ86bPuRc=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDBlXrzg//Zlr5/Nn4qbse7+EVU87vnS/v0e47UlEm96dr
 Wd0S7llO0pZGMS4GGTFFFmqH6seNzScc5bxxqlJMHNYmUCGMHBxCsBEzk1n+Ctunn5VfU++zpPY
 dZayqztfPHvnJrDFQFV72rzD035mqPExMqypecY3bdk5h5n6k40aa67/F1aucOZue/1y04zjyfG
 az3kB
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

After the recent removal of the fb.h include from backlight.h, which
transitively included of.h, there are several errors from
via-pmu-backlight.c (errors from bl_curve not being properly defined
omitted):

  drivers/macintosh/via-pmu-backlight.c:22:20: error: 'FB_BACKLIGHT_LEVELS' undeclared here (not in a function)
     22 | static u8 bl_curve[FB_BACKLIGHT_LEVELS];
        |                    ^~~~~~~~~~~~~~~~~~~
  drivers/macintosh/via-pmu-backlight.c: In function 'pmu_backlight_get_level_brightness':
  drivers/macintosh/via-pmu-backlight.c:63:38: error: 'FB_BACKLIGHT_MAX' undeclared (first use in this function); did you mean 'BACKLIGHT_RAW'?
     63 |         pmulevel = bl_curve[level] * FB_BACKLIGHT_MAX / MAX_PMU_LEVEL;
        |                                      ^~~~~~~~~~~~~~~~
        |                                      BACKLIGHT_RAW
  drivers/macintosh/via-pmu-backlight.c: In function 'pmu_backlight_init':
  drivers/macintosh/via-pmu-backlight.c:144:17: error: implicit declaration of function 'of_machine_is_compatible' [-Wimplicit-function-declaration]
    144 |                 of_machine_is_compatible("AAPL,3400/2400") ||
        |                 ^~~~~~~~~~~~~~~~~~~~~~~~

FB_BACKLIGHT_{LEVELS,MAX} are available from the userspace API fb.h so
just include that avoid dragging in the full fb.h header unnecessarily.
Include linux/of.h for of_machine_is_compatible().

Fixes: 9f218f9bb9d2 ("backlight: Do not include <linux/fb.h> in header file")
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 drivers/macintosh/via-pmu-backlight.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/macintosh/via-pmu-backlight.c b/drivers/macintosh/via-pmu-backlight.c
index 26bd9ed5e664..f7b7853b3802 100644
--- a/drivers/macintosh/via-pmu-backlight.c
+++ b/drivers/macintosh/via-pmu-backlight.c
@@ -11,7 +11,9 @@
 #include <asm/ptrace.h>
 #include <linux/adb.h>
 #include <linux/backlight.h>
+#include <linux/of.h>
 #include <linux/pmu.h>
+#include <uapi/linux/fb.h>
 #include <asm/backlight.h>
 
 #define MAX_PMU_LEVEL 0xFF

-- 
2.51.0


