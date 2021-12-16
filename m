Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D5AE0476DA6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Dec 2021 10:45:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JF6gD5khwz3cZG
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Dec 2021 20:45:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20210705 header.b=sIowv1FK;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=canonical.com (client-ip=185.125.188.122;
 helo=smtp-relay-internal-0.canonical.com;
 envelope-from=alexandre.ghiti@canonical.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=canonical.com header.i=@canonical.com
 header.a=rsa-sha256 header.s=20210705 header.b=sIowv1FK; 
 dkim-atps=neutral
Received: from smtp-relay-internal-0.canonical.com
 (smtp-relay-internal-0.canonical.com [185.125.188.122])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JF6fY6cK8z2yZv
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Dec 2021 20:45:09 +1100 (AEDT)
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 538633FFD6
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Dec 2021 09:45:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1639647905;
 bh=QTOsClZwyZOKWiOCdpIZ53KKqBtgpNixsjVEw+qtuPg=;
 h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
 b=sIowv1FKt2JxTDq2nl05gs9LML63c7jFhyhhT9MHsA+SCsoRWkbByg7MOIfQLi3e5
 W+Jeg28/IgZvokXaO8X54bUB872t7nPIQIy6vOX285nPYdccYmlg+wGPk/jWEIVKdG
 T3fz+6zy3j+V6CZEXwFBoqhqNJZ3fbiXn/RKJtqyobsxcAtmIkdAJFyeEYbWnOzPMB
 MtTXIk52hMhpevk2uMa+U6UurLTgK2TD9Ux58oYEMBIxlUbQCRZxKljCeXxTmD1Spw
 9oQ30JKIJjSy4YNy5XhXqAMvW5oZ0iVdi5ME1xP4EZa59/jbkf9P3hYRZeRcGFgV0B
 JgRUkezBZMDFQ==
Received: by mail-lj1-f199.google.com with SMTP id
 r20-20020a2eb894000000b0021a4e932846so8356673ljp.6
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Dec 2021 01:45:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QTOsClZwyZOKWiOCdpIZ53KKqBtgpNixsjVEw+qtuPg=;
 b=Z6Nj9NET0jrmNF6uy/yT5p3Jcul2X0ijbVqLFvhzYD+pETFGSZHJYYb2a/81Oe9VPZ
 EpBPVycd8J0acR7uK0NVIMVMUa9rxMZPmVjsMk+GTRLiwVtyBKYfeTrurXtdq5I3aRDw
 42MBMqDadmCsbupnbxvFSTzb7W/NQdyIOdWWa8MFrEgK6kCuc7hxXDkmlNxmhIST2NCP
 Ki5PygsqC5OJJ3oCq8Yw2S61PVU9OrTXq/0bYxt8k74tD7szAXFJv4DJ1z13D1/sE1qk
 GTgZPv80bSOhIhWcu6WRrnfc8DF+bNi4j0OEgkYvLUOqeM4DyYO1lKiDok92g1OSoTDX
 AnkA==
X-Gm-Message-State: AOAM532wX3P8x/q+BXtmY4RSkoRJb9YUzklD0tnjz996EWQ7NQWLamjO
 v5paGqWXjK+Vq7BF5ty3bGyurE55C/YVzcu6cKYQS3PkwD3IXKP8E6/LM7lyEHf3cE3QetRHuzo
 wBn+KDaZ6KGyEoz6W8AbiJI1X4NumFvhJ/OM5TMZDjUs=
X-Received: by 2002:a5d:650f:: with SMTP id x15mr646240wru.57.1639647893946;
 Thu, 16 Dec 2021 01:44:53 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxZMiPMQ+W+qW8IbAibX8DdTl4xnrovvGfEQoGvcsc6W8MrweFtPS/7ET8ki9T9yPPhmGQd1g==
X-Received: by 2002:a5d:650f:: with SMTP id x15mr646199wru.57.1639647893659;
 Thu, 16 Dec 2021 01:44:53 -0800 (PST)
Received: from alex.home (lfbn-gre-1-195-1.w90-112.abo.wanadoo.fr.
 [90.112.158.1])
 by smtp.gmail.com with ESMTPSA id h4sm4313251wrf.93.2021.12.16.01.44.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Dec 2021 01:44:53 -0800 (PST)
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
Subject: [PATCH v2 0/6] Cleanup after removal of configs
Date: Thu, 16 Dec 2021 10:44:20 +0100
Message-Id: <20211216094426.2083802-1-alexandre.ghiti@canonical.com>
X-Mailer: git-send-email 2.32.0
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

While bumping from 5.13 to 5.15, I found that a few deleted configs had
left some pieces here and there: this patchset cleans that.

Changes in v2:
- Rebase on top of v5.16-rc1
- Removed patch 6 since Matti said he would take care of that
- Added AB, RB

Alexandre Ghiti (6):
  Documentation, arch: Remove leftovers from fscache/cachefiles
    histograms
  Documentation, arch: Remove leftovers from raw device
  Documentation, arch: Remove leftovers from CIFS_WEAK_PW_HASH
  arch: Remove leftovers from mandatory file locking
  Documentation, arch, fs: Remove leftovers from fscache object list
  arch: Remove leftovers from prism54 wireless driver

 Documentation/admin-guide/cifs/usage.rst      |   7 +-
 Documentation/admin-guide/devices.txt         |   8 +-
 .../filesystems/caching/cachefiles.rst        |  34 -----
 Documentation/filesystems/caching/fscache.rst | 123 +-----------------
 arch/arm/configs/axm55xx_defconfig            |   3 -
 arch/arm/configs/cm_x300_defconfig            |   1 -
 arch/arm/configs/ezx_defconfig                |   1 -
 arch/arm/configs/imote2_defconfig             |   1 -
 arch/arm/configs/nhk8815_defconfig            |   1 -
 arch/arm/configs/pxa_defconfig                |   1 -
 arch/arm/configs/spear13xx_defconfig          |   1 -
 arch/arm/configs/spear3xx_defconfig           |   1 -
 arch/arm/configs/spear6xx_defconfig           |   1 -
 arch/mips/configs/decstation_64_defconfig     |   1 -
 arch/mips/configs/decstation_defconfig        |   1 -
 arch/mips/configs/decstation_r4k_defconfig    |   1 -
 arch/mips/configs/fuloong2e_defconfig         |   1 -
 arch/mips/configs/ip27_defconfig              |   1 -
 arch/mips/configs/malta_defconfig             |   1 -
 arch/mips/configs/malta_kvm_defconfig         |   1 -
 arch/mips/configs/malta_qemu_32r6_defconfig   |   1 -
 arch/mips/configs/maltaaprp_defconfig         |   1 -
 arch/mips/configs/maltasmvp_defconfig         |   1 -
 arch/mips/configs/maltasmvp_eva_defconfig     |   1 -
 arch/mips/configs/maltaup_defconfig           |   1 -
 arch/mips/configs/maltaup_xpa_defconfig       |   1 -
 arch/powerpc/configs/pmac32_defconfig         |   1 -
 arch/powerpc/configs/ppc6xx_defconfig         |   1 -
 arch/powerpc/configs/pseries_defconfig        |   1 -
 arch/sh/configs/titan_defconfig               |   1 -
 fs/fscache/object.c                           |   3 -
 fs/fscache/proc.c                             |  12 --
 32 files changed, 6 insertions(+), 209 deletions(-)

-- 
2.32.0

