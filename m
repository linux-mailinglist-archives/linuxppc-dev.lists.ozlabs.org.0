Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7015844667D
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Nov 2021 16:51:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hm4kB2hNFz3cbF
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Nov 2021 02:51:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20210705 header.b=SOZuh1jg;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=canonical.com (client-ip=185.125.188.122;
 helo=smtp-relay-internal-0.canonical.com;
 envelope-from=alexandre.ghiti@canonical.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=canonical.com header.i=@canonical.com
 header.a=rsa-sha256 header.s=20210705 header.b=SOZuh1jg; 
 dkim-atps=neutral
Received: from smtp-relay-internal-0.canonical.com
 (smtp-relay-internal-0.canonical.com [185.125.188.122])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hm4jT2qZFz2yPk
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  6 Nov 2021 02:50:53 +1100 (AEDT)
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id B533340029
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Nov 2021 15:50:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1636127450;
 bh=0bEssfmXxHPGUprNSso7Mjq6wm8EF4TYvKsU8/02BBE=;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=SOZuh1jgruWyhKpzphF4MfDp205NeFT1DMV+YGxF2o/S9etbRrImfXNt5guybkFyH
 4AlK3s2JOtOOf+efGDSRBcw12wAWvzdUQCr4eYrKZ91f0A8NYddClRMwISpanPH9JP
 QYZU6XGymXTDUtZwys835HDoSMyqrXrSLTRgdAmCrOOAwfXr5MlVhMlfA1/UHzI1Ux
 MDutFTSLvX1CMJBAQNTFTcy1dq/2SUAdOj9ewsvp46QdRi7QEjZwbTyF5OuQp2n/QP
 rriJNj5/WVrysKjrVOoYl4wHdkhp7mwnKSiaJhvQ5ylzbv6JoHZMRahRFVuqJ7Q/fa
 Twmj4VXhAB4qw==
Received: by mail-wm1-f69.google.com with SMTP id
 m1-20020a1ca301000000b003231d5b3c4cso5862282wme.5
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 05 Nov 2021 08:50:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0bEssfmXxHPGUprNSso7Mjq6wm8EF4TYvKsU8/02BBE=;
 b=AhTG3gq00+sm3rKf4zq8Ho979FrY8kwMfjViQNcMpEGOh+cbHaXZ1k6q2QUY0dkcmw
 U9Q/osaa9fT7y3JgDO0HlQ2tcrwWOLZTOzTwIM2aUDFf2cK83DRde/t6bn9TFa3L48if
 McyMyPa1XxLcwXEHMWawiKMAofUBWR8YSLRGEvjk1easQsebIDO4KgWSVHsLR4NZezIT
 ZgWzQoPz6/IOcwhiWHXj4cJCMbKTZ8Hj8bzEgsRMZck9BlxfJzG7DN5x3me5EuTxxx0l
 LTrGJrn6AfqbUkj+jxkxKGr+DTxVjWque03/3BO+kWQcQoDM1fjziLEj9Pn9089Ogs4M
 3h4g==
X-Gm-Message-State: AOAM530IYVvW4+XiBRnkU1dsXZhVUZSWG+ZYGvxX1X8EERn3AIzjiuSo
 cR6I9UsAgeY/vQNWaTeYU4NBqHtd09FhEp0A6BumUSyXRow/UP1CZcJn+3OC7Q9HhxaRhBijeIh
 vqNz4WKnP+9Fbl6Y9VGD1h8MAXpwQ+i9in7aFWWPOFGM=
X-Received: by 2002:a5d:468f:: with SMTP id u15mr60369044wrq.171.1636127449752; 
 Fri, 05 Nov 2021 08:50:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyP30QeivC6b36TFL+IkuxX7YAofe7sXVJxsbORnG4EhnoSVTTf2FUxAHUW+sOGX9Deb4eenw==
X-Received: by 2002:a5d:468f:: with SMTP id u15mr60368997wrq.171.1636127449594; 
 Fri, 05 Nov 2021 08:50:49 -0700 (PDT)
Received: from localhost.localdomain (lfbn-lyo-1-470-249.w2-7.abo.wanadoo.fr.
 [2.7.60.249])
 by smtp.gmail.com with ESMTPSA id h27sm13219037wmc.43.2021.11.05.08.50.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Nov 2021 08:50:49 -0700 (PDT)
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
Subject: [PATCH 7/7] arch: Remove leftovers from prism54 wireless driver
Date: Fri,  5 Nov 2021 16:43:34 +0100
Message-Id: <20211105154334.1841927-8-alexandre.ghiti@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211105154334.1841927-1-alexandre.ghiti@canonical.com>
References: <20211105154334.1841927-1-alexandre.ghiti@canonical.com>
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

This driver was removed so remove all references to it.

Fixes: d249ff28b1d8 ("intersil: remove obsolete prism54 wireless driver")
Signed-off-by: Alexandre Ghiti <alexandre.ghiti@canonical.com>
---
 arch/mips/configs/ip27_defconfig        | 1 -
 arch/mips/configs/malta_defconfig       | 1 -
 arch/mips/configs/malta_kvm_defconfig   | 1 -
 arch/mips/configs/maltaup_xpa_defconfig | 1 -
 arch/powerpc/configs/pmac32_defconfig   | 1 -
 5 files changed, 5 deletions(-)

diff --git a/arch/mips/configs/ip27_defconfig b/arch/mips/configs/ip27_defconfig
index 638d7cf5ef01..821630ac1be7 100644
--- a/arch/mips/configs/ip27_defconfig
+++ b/arch/mips/configs/ip27_defconfig
@@ -223,7 +223,6 @@ CONFIG_TMD_HERMES=m
 CONFIG_NORTEL_HERMES=m
 CONFIG_P54_COMMON=m
 CONFIG_P54_PCI=m
-CONFIG_PRISM54=m
 CONFIG_LIBERTAS=m
 CONFIG_LIBERTAS_THINFIRM=m
 CONFIG_MWL8K=m
diff --git a/arch/mips/configs/malta_defconfig b/arch/mips/configs/malta_defconfig
index 9cb2cf2595e0..3321bb576944 100644
--- a/arch/mips/configs/malta_defconfig
+++ b/arch/mips/configs/malta_defconfig
@@ -302,7 +302,6 @@ CONFIG_HOSTAP_FIRMWARE=y
 CONFIG_HOSTAP_FIRMWARE_NVRAM=y
 CONFIG_HOSTAP_PLX=m
 CONFIG_HOSTAP_PCI=m
-CONFIG_PRISM54=m
 CONFIG_LIBERTAS=m
 CONFIG_INPUT_MOUSEDEV=y
 CONFIG_MOUSE_PS2_ELANTECH=y
diff --git a/arch/mips/configs/malta_kvm_defconfig b/arch/mips/configs/malta_kvm_defconfig
index 5924e48fd3ec..009b30372226 100644
--- a/arch/mips/configs/malta_kvm_defconfig
+++ b/arch/mips/configs/malta_kvm_defconfig
@@ -310,7 +310,6 @@ CONFIG_HOSTAP_FIRMWARE=y
 CONFIG_HOSTAP_FIRMWARE_NVRAM=y
 CONFIG_HOSTAP_PLX=m
 CONFIG_HOSTAP_PCI=m
-CONFIG_PRISM54=m
 CONFIG_LIBERTAS=m
 CONFIG_INPUT_MOUSEDEV=y
 CONFIG_SERIAL_8250=y
diff --git a/arch/mips/configs/maltaup_xpa_defconfig b/arch/mips/configs/maltaup_xpa_defconfig
index c0d3156ef640..e214e136101c 100644
--- a/arch/mips/configs/maltaup_xpa_defconfig
+++ b/arch/mips/configs/maltaup_xpa_defconfig
@@ -309,7 +309,6 @@ CONFIG_HOSTAP_FIRMWARE=y
 CONFIG_HOSTAP_FIRMWARE_NVRAM=y
 CONFIG_HOSTAP_PLX=m
 CONFIG_HOSTAP_PCI=m
-CONFIG_PRISM54=m
 CONFIG_LIBERTAS=m
 CONFIG_INPUT_MOUSEDEV=y
 CONFIG_MOUSE_PS2_ELANTECH=y
diff --git a/arch/powerpc/configs/pmac32_defconfig b/arch/powerpc/configs/pmac32_defconfig
index 7aefac5afab0..13885ec563d1 100644
--- a/arch/powerpc/configs/pmac32_defconfig
+++ b/arch/powerpc/configs/pmac32_defconfig
@@ -169,7 +169,6 @@ CONFIG_USB_USBNET=m
 CONFIG_B43=m
 CONFIG_B43LEGACY=m
 CONFIG_P54_COMMON=m
-CONFIG_PRISM54=m
 CONFIG_INPUT_EVDEV=y
 # CONFIG_KEYBOARD_ATKBD is not set
 # CONFIG_MOUSE_PS2 is not set
-- 
2.32.0

