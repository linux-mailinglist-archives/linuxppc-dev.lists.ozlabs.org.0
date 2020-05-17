Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DB8371D6DC6
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 May 2020 00:09:47 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49QGXR57KpzDqWs
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 May 2020 08:09:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::442;
 helo=mail-wr1-x442.google.com; envelope-from=emil.l.velikov@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=DHyJsjBB; dkim-atps=neutral
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49QGVp0SkJzDqV4
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 May 2020 08:08:17 +1000 (AEST)
Received: by mail-wr1-x442.google.com with SMTP id 50so9560112wrc.11
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 17 May 2020 15:08:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vlQG2udc7GDr5JGXbF/q4vF+mhIn8QekfFy1X7bhtvY=;
 b=DHyJsjBBHryBZH7glNoiQGUO7uk4uXwkkHGzn8Cp6rxZHsbFV6vGvDfTQ53aaDGZ1K
 BkIGkLCUuk4pweI4DpTcgK2Nekp2Jq9HOswvUsft68N7L0r5jtEmBlOGMEj9eYFiXcwE
 XeFzHic8KOMsH+dxliASyngPvtqSJNN+JTNeqjBC+SYBVlZ+qNNuWtBCqyObScliTop8
 1UtCt2TsKtCsj/WFVaAGVhvIkuZw1UGmMl8FMm2n/niXQZG1nALiJacRLQ5caPoGIlrD
 lKA6LUxr9oHYV73oshAeez7/epvHrZ4pRTHY0mg0nkQvwAdo2IbzrHMGitB10DmOzbti
 mAig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vlQG2udc7GDr5JGXbF/q4vF+mhIn8QekfFy1X7bhtvY=;
 b=Y+Uasg8fz0A5E5w9G+MGlLuQFsQTqoz+sr/EHSxj6GgQE3Y/HRZnLXeh6a/PqfYPZ/
 MzG+hng0yVydjczCdtwBolcn4f5KLtzZd61XgH8pXvsich9L+L1e5r/WdEVh//tAxBCm
 DS8NzwyW/nV+fsfo/1RFvsZzCS8CkBlwzNK1C5q9/p9kxb3ur7QhgEgyvW9M6eTVWzWg
 OUyPbMbqVBi/AiaAjSRlop2iLMvop/L6+Sq1PaI1/SE+MxVOF30Wn8Oh30dnzxO2hWoL
 q33TqJkFy22off0uhPzm38AoEsQNIHIlSBnaUHkSIymNJFgusbT58FkRNEo0n9BHzap5
 n3Ew==
X-Gm-Message-State: AOAM532e1iazw8mQfEsGWceeSF+25GamuyOGiBg8Ji5+zFWmHkImHkPk
 daV/DzuJXLIpGmBf0nvO4g8=
X-Google-Smtp-Source: ABdhPJztZqF86REgFZUlLolQDOtb+TvD9sDFoqDx5vwO0wz5kqneUY3+1a0p10+sjgxN4zO6IVtQkg==
X-Received: by 2002:adf:e5c8:: with SMTP id a8mr15611191wrn.335.1589753294182; 
 Sun, 17 May 2020 15:08:14 -0700 (PDT)
Received: from localhost.localdomain
 (cpc91192-cmbg18-2-0-cust374.5-4.cable.virginm.net. [80.6.113.119])
 by smtp.gmail.com with ESMTPSA id d9sm13805482wmd.10.2020.05.17.15.08.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 May 2020 15:08:13 -0700 (PDT)
From: Emil Velikov <emil.l.velikov@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 2/2] powerpc/configs: replace deprecated riva/nvidia with
 nouveau
Date: Sun, 17 May 2020 23:05:24 +0100
Message-Id: <20200517220524.4036334-2-emil.l.velikov@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200517220524.4036334-1-emil.l.velikov@gmail.com>
References: <20200517220524.4036334-1-emil.l.velikov@gmail.com>
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
Cc: linux-fbdev@vger.kernel.org, Antonino Daplas <adaplas@gmail.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, emil.l.velikov@gmail.com,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

As mentioned in earlier commit, the riva and nvidia fbdev drivers have
seen no love over the years, are short on features and overall below par

Users are encouraged to switch to the nouveau drm driver instead.

v2: Split configs to separate patch, enable nouveau (Bartlomiej)

Cc: Antonino Daplas <adaplas@gmail.com>
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc: linux-fbdev@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Paul Mackerras <paulus@samba.org>
Cc: linuxppc-dev@lists.ozlabs.org
Signed-off-by: Emil Velikov <emil.l.velikov@gmail.com>
Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch> (v1)
---
Hi all unless, there are objections I would prefer to merge this via
the drm tree.

Thanks
Emil
---
 arch/powerpc/configs/g5_defconfig     | 10 ++++++++--
 arch/powerpc/configs/pasemi_defconfig |  9 +++++++--
 arch/powerpc/configs/pmac32_defconfig |  9 +++++++--
 arch/powerpc/configs/ppc6xx_defconfig | 10 +++++++---
 4 files changed, 29 insertions(+), 9 deletions(-)

diff --git a/arch/powerpc/configs/g5_defconfig b/arch/powerpc/configs/g5_defconfig
index a68c7f3af10e..213472f373b3 100644
--- a/arch/powerpc/configs/g5_defconfig
+++ b/arch/powerpc/configs/g5_defconfig
@@ -124,12 +124,18 @@ CONFIG_RAW_DRIVER=y
 CONFIG_I2C_CHARDEV=y
 CONFIG_AGP=m
 CONFIG_AGP_UNINORTH=m
+CONFIG_DRM=y
+CONFIG_DRM_NOUVEAU=m
+# CONFIG_NOUVEAU_LEGACY_CTX_SUPPORT is not set
+CONFIG_NOUVEAU_DEBUG=5
+CONFIG_NOUVEAU_DEBUG_DEFAULT=3
+# CONFIG_NOUVEAU_DEBUG_MMU is not set
+CONFIG_DRM_NOUVEAU_BACKLIGHT=y
+# CONFIG_DRM_NOUVEAU_SVM is not set
 CONFIG_FB=y
 CONFIG_FIRMWARE_EDID=y
 CONFIG_FB_TILEBLITTING=y
 CONFIG_FB_OF=y
-CONFIG_FB_NVIDIA=y
-CONFIG_FB_NVIDIA_I2C=y
 CONFIG_FB_RADEON=y
 # CONFIG_VGA_CONSOLE is not set
 CONFIG_FRAMEBUFFER_CONSOLE=y
diff --git a/arch/powerpc/configs/pasemi_defconfig b/arch/powerpc/configs/pasemi_defconfig
index 08b7f4cef243..ccb3ab5e01da 100644
--- a/arch/powerpc/configs/pasemi_defconfig
+++ b/arch/powerpc/configs/pasemi_defconfig
@@ -102,11 +102,16 @@ CONFIG_SENSORS_LM85=y
 CONFIG_SENSORS_LM90=y
 CONFIG_DRM=y
 CONFIG_DRM_RADEON=y
+CONFIG_DRM_NOUVEAU=m
+# CONFIG_NOUVEAU_LEGACY_CTX_SUPPORT is not set
+CONFIG_NOUVEAU_DEBUG=5
+CONFIG_NOUVEAU_DEBUG_DEFAULT=3
+# CONFIG_NOUVEAU_DEBUG_MMU is not set
+CONFIG_DRM_NOUVEAU_BACKLIGHT=y
+# CONFIG_DRM_NOUVEAU_SVM is not set
 CONFIG_FIRMWARE_EDID=y
 CONFIG_FB_TILEBLITTING=y
 CONFIG_FB_VGA16=y
-CONFIG_FB_NVIDIA=y
-CONFIG_FB_NVIDIA_I2C=y
 CONFIG_FB_RADEON=y
 # CONFIG_LCD_CLASS_DEVICE is not set
 CONFIG_VGACON_SOFT_SCROLLBACK=y
diff --git a/arch/powerpc/configs/pmac32_defconfig b/arch/powerpc/configs/pmac32_defconfig
index 05e325ca3fbd..f858627385c8 100644
--- a/arch/powerpc/configs/pmac32_defconfig
+++ b/arch/powerpc/configs/pmac32_defconfig
@@ -199,6 +199,13 @@ CONFIG_DRM=m
 CONFIG_DRM_RADEON=m
 CONFIG_DRM_LEGACY=y
 CONFIG_DRM_R128=m
+CONFIG_DRM_NOUVEAU=m
+# CONFIG_NOUVEAU_LEGACY_CTX_SUPPORT is not set
+CONFIG_NOUVEAU_DEBUG=5
+CONFIG_NOUVEAU_DEBUG_DEFAULT=3
+# CONFIG_NOUVEAU_DEBUG_MMU is not set
+CONFIG_DRM_NOUVEAU_BACKLIGHT=y
+# CONFIG_DRM_NOUVEAU_SVM is not set
 CONFIG_FB=y
 CONFIG_FB_OF=y
 CONFIG_FB_CONTROL=y
@@ -206,8 +213,6 @@ CONFIG_FB_PLATINUM=y
 CONFIG_FB_VALKYRIE=y
 CONFIG_FB_CT65550=y
 CONFIG_FB_IMSTT=y
-CONFIG_FB_NVIDIA=y
-CONFIG_FB_NVIDIA_I2C=y
 CONFIG_FB_MATROX=y
 CONFIG_FB_MATROX_MILLENIUM=y
 CONFIG_FB_MATROX_MYSTIQUE=y
diff --git a/arch/powerpc/configs/ppc6xx_defconfig b/arch/powerpc/configs/ppc6xx_defconfig
index feb5d47d8d1e..48421f5007ed 100644
--- a/arch/powerpc/configs/ppc6xx_defconfig
+++ b/arch/powerpc/configs/ppc6xx_defconfig
@@ -738,15 +738,19 @@ CONFIG_DRM_MGA=m
 CONFIG_DRM_SIS=m
 CONFIG_DRM_VIA=m
 CONFIG_DRM_SAVAGE=m
+CONFIG_DRM_NOUVEAU=m
+# CONFIG_NOUVEAU_LEGACY_CTX_SUPPORT is not set
+CONFIG_NOUVEAU_DEBUG=5
+CONFIG_NOUVEAU_DEBUG_DEFAULT=3
+# CONFIG_NOUVEAU_DEBUG_MMU is not set
+CONFIG_DRM_NOUVEAU_BACKLIGHT=y
+# CONFIG_DRM_NOUVEAU_SVM is not set
 CONFIG_FB=y
 CONFIG_FB_CIRRUS=m
 CONFIG_FB_OF=y
 CONFIG_FB_PLATINUM=y
 CONFIG_FB_VALKYRIE=y
 CONFIG_FB_CT65550=y
-CONFIG_FB_NVIDIA=y
-CONFIG_FB_NVIDIA_I2C=y
-CONFIG_FB_RIVA=m
 CONFIG_FB_MATROX=y
 CONFIG_FB_MATROX_MILLENIUM=y
 CONFIG_FB_MATROX_MYSTIQUE=y
-- 
2.25.1

