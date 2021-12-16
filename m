Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C609476E2C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Dec 2021 10:49:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JF6lx2FrRz3bjB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Dec 2021 20:49:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20210705 header.b=eeZy+6F9;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=canonical.com (client-ip=185.125.188.122;
 helo=smtp-relay-internal-0.canonical.com;
 envelope-from=alexandre.ghiti@canonical.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=canonical.com header.i=@canonical.com
 header.a=rsa-sha256 header.s=20210705 header.b=eeZy+6F9; 
 dkim-atps=neutral
Received: from smtp-relay-internal-0.canonical.com
 (smtp-relay-internal-0.canonical.com [185.125.188.122])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JF6lF6bdZz3df0
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Dec 2021 20:49:13 +1100 (AEDT)
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 658EA3F1F2
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Dec 2021 09:49:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1639648151;
 bh=WUEOV0Puf0rdsNKOWUqNq9jf3IbOHS9FDzqSlVW9pZ4=;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=eeZy+6F91YTqwyb7BlBrS9DNtRBJYJDSrUZ+BH0/ubGM9f+55bQEH1CstwYviY9cR
 hIwU8gLn8G2p+dVc6s0wmpeWAsYSuMGXVtoILJdsEUHBvoor/DtFh0VVSBz7M45hgn
 pkUqGgYKfnbfjd/kD2W9nWH8yKs2xoHr+FBrqOz0tYAxrwSgmpD2s31BibU1Pd2kxw
 pFTrhq24jJ/dsT+I86Bl57IpTNU4jPfKAgrhhcCth0TXMjJ2eqz/8eOi8w+yc4b+7N
 HTedsmpq8c7XIbFrx4OZKzWAEy3ocHNsuWntQiBHkdkzoVxsis7edh/WmIY+n9p34u
 LLrfKv5VLxzPQ==
Received: by mail-ed1-f69.google.com with SMTP id
 w17-20020a056402269100b003f7ed57f96bso3784401edd.16
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Dec 2021 01:49:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WUEOV0Puf0rdsNKOWUqNq9jf3IbOHS9FDzqSlVW9pZ4=;
 b=O/1bO243nGdf8TV9zwXo+Fp8ETFSPCUpE7KlgVkiTF0ZSewVMwVR19ncyMwgX6TWuY
 KP0qCXvyeq/dsukakAlPuPcqWc/QPJYCQ+WiMRE7dEwvZex/ZsLli1AqXYIQwPp0vC2Z
 2lC11mihunMoO6nxxbXQRG6qxYM/qOgw3eycWyPKRtY0Gxn5flluhpN3pVgM+ZZDb2WD
 FqV4XUqHrO6lRMCzi7zbx3fwxuX/9YrurDrFIp8K3UOe31+iUyBOWTbIgtXLP3+hnizq
 IH6Bfd7S8c1F4ooui4/pgd15zaY+LmSBaVMInRSXvdc42Yt/tkqrSp+NY2ZocqMxXEuA
 1lgA==
X-Gm-Message-State: AOAM530TojvwL4u84AZ57aVtq8mX9JWBGRB9umlxlmuV9fMVgSFDJwic
 OFlU7XtJEKbtEtTMqTxLQ9XXlGFrntT7Ysn9C5h671+Ud8dxbcB275wgy8C8HNG7anP4JBgfsmN
 E2S2uy7y2r85MrrNL1Weo2yIP3guws4YZl16F2FIMEJk=
X-Received: by 2002:a5d:69c5:: with SMTP id s5mr8274595wrw.283.1639648139310; 
 Thu, 16 Dec 2021 01:48:59 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy4D7RcuSiJhn58Bkp9nDVxQgFgFxFbQZtRi6SJVIaJvvuUPrIa3b5F/cBoS8baOoKUv8xnUw==
X-Received: by 2002:a5d:69c5:: with SMTP id s5mr8274584wrw.283.1639648139155; 
 Thu, 16 Dec 2021 01:48:59 -0800 (PST)
Received: from alex.home (lfbn-gre-1-195-1.w90-112.abo.wanadoo.fr.
 [90.112.158.1])
 by smtp.gmail.com with ESMTPSA id m36sm4145891wms.25.2021.12.16.01.48.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Dec 2021 01:48:58 -0800 (PST)
From: Alexandre Ghiti <alexandre.ghiti@canonical.com>
To: Steve French <sfrench@samba.org>, Jonathan Corbet <corbet@lwn.net>,
 David Howells <dhowells@redhat.com>, Russell King <linux@armlinux.org.uk>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 Lee Jones <lee.jones@linaro.org>, Jeff Layton <jlayton@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Arnd Bergmann <arnd@arndb.de>, Ronnie Sahlberg <lsahlber@redhat.com>,
 Guenter Roeck <linux@roeck-us.net>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Lukas Bulwahn <lukas.bulwahn@gmail.com>,
 Luis Chamberlain <mcgrof@kernel.org>, Kalle Valo <kvalo@codeaurora.org>,
 linux-cifs@vger.kernel.org, samba-technical@lists.samba.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-cachefs@redhat.com, linux-arm-kernel@lists.infradead.org,
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-sh@vger.kernel.org, linux-power@fi.rohmeurope.com
Subject: [PATCH v2 4/6] arch: Remove leftovers from mandatory file locking
Date: Thu, 16 Dec 2021 10:44:24 +0100
Message-Id: <20211216094426.2083802-5-alexandre.ghiti@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211216094426.2083802-1-alexandre.ghiti@canonical.com>
References: <20211216094426.2083802-1-alexandre.ghiti@canonical.com>
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
Cc: Alexandre Ghiti <alexandre.ghiti@canonical.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This config was removed so remove all references to it.

Fixes: f7e33bdbd6d1 ("fs: remove mandatory file locking support")
Signed-off-by: Alexandre Ghiti <alexandre.ghiti@canonical.com>
Reviewed-by: Jeff Layton <jlayton@kernel.org>
---
 arch/mips/configs/decstation_64_defconfig  | 1 -
 arch/mips/configs/decstation_defconfig     | 1 -
 arch/mips/configs/decstation_r4k_defconfig | 1 -
 3 files changed, 3 deletions(-)

diff --git a/arch/mips/configs/decstation_64_defconfig b/arch/mips/configs/decstation_64_defconfig
index 85f1955b4b00..e2ed105f8c97 100644
--- a/arch/mips/configs/decstation_64_defconfig
+++ b/arch/mips/configs/decstation_64_defconfig
@@ -144,7 +144,6 @@ CONFIG_EXT2_FS_SECURITY=y
 CONFIG_EXT3_FS=y
 CONFIG_EXT3_FS_POSIX_ACL=y
 CONFIG_EXT3_FS_SECURITY=y
-# CONFIG_MANDATORY_FILE_LOCKING is not set
 CONFIG_ISO9660_FS=y
 CONFIG_JOLIET=y
 CONFIG_PROC_KCORE=y
diff --git a/arch/mips/configs/decstation_defconfig b/arch/mips/configs/decstation_defconfig
index 30a6eafdb1d0..7e987d6f5e34 100644
--- a/arch/mips/configs/decstation_defconfig
+++ b/arch/mips/configs/decstation_defconfig
@@ -140,7 +140,6 @@ CONFIG_EXT2_FS_SECURITY=y
 CONFIG_EXT3_FS=y
 CONFIG_EXT3_FS_POSIX_ACL=y
 CONFIG_EXT3_FS_SECURITY=y
-# CONFIG_MANDATORY_FILE_LOCKING is not set
 CONFIG_ISO9660_FS=y
 CONFIG_JOLIET=y
 CONFIG_PROC_KCORE=y
diff --git a/arch/mips/configs/decstation_r4k_defconfig b/arch/mips/configs/decstation_r4k_defconfig
index e2b58dbf4aa9..6df5f6f2ac8e 100644
--- a/arch/mips/configs/decstation_r4k_defconfig
+++ b/arch/mips/configs/decstation_r4k_defconfig
@@ -140,7 +140,6 @@ CONFIG_EXT2_FS_SECURITY=y
 CONFIG_EXT3_FS=y
 CONFIG_EXT3_FS_POSIX_ACL=y
 CONFIG_EXT3_FS_SECURITY=y
-# CONFIG_MANDATORY_FILE_LOCKING is not set
 CONFIG_ISO9660_FS=y
 CONFIG_JOLIET=y
 CONFIG_PROC_KCORE=y
-- 
2.32.0

