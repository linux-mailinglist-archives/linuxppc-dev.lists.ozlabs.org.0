Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E1FC446616
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Nov 2021 16:44:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hm4ZD2TLbz305d
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Nov 2021 02:44:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20210705 header.b=QrjogWzz;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=canonical.com (client-ip=185.125.188.123;
 helo=smtp-relay-internal-1.canonical.com;
 envelope-from=alexandre.ghiti@canonical.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=canonical.com header.i=@canonical.com
 header.a=rsa-sha256 header.s=20210705 header.b=QrjogWzz; 
 dkim-atps=neutral
Received: from smtp-relay-internal-1.canonical.com
 (smtp-relay-internal-1.canonical.com [185.125.188.123])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hm4YT2GNrz2xXW
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  6 Nov 2021 02:43:56 +1100 (AEDT)
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id CD5273F1D6
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Nov 2021 15:43:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1636127029;
 bh=Kma2r6Cjt1RWiEDiySihOnGrp1HFvlTplV2HdiifHKA=;
 h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
 b=QrjogWzzw7loZ7NuLv4gE/HhRybot4VDj2nk9QLYWjEiz2eXXXl3sctfKvDExFpHW
 soD5UDMBwRkMw99AJCOSR9shTdaowUTG6pWjjIYX11bS46zifI9Ke2qF+k+J5qcHNX
 x36ux0B1GbqrXlIxhSnDWwY02D4sZ+oiqjGkhU8OYxAGKqLrLIGBWWgt8Q5lOpQhvs
 rR1OqRVUBYpF0uwPjYiZIoMqYkTZocDdpGNRT/GuvvnMMQMBIwVOpG4NO/xoE5ST0e
 dAyLxRWftoU+ouBTw/WoprWmcr4m4/Jjxsd9/YwvzmJ6ujx+XeAVPew416sEzuR+7o
 X3RRDKlTKmHLg==
Received: by mail-wr1-f69.google.com with SMTP id
 v18-20020a5d5912000000b001815910d2c0so2452357wrd.1
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 05 Nov 2021 08:43:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Kma2r6Cjt1RWiEDiySihOnGrp1HFvlTplV2HdiifHKA=;
 b=uejjCA/E+EX4GLJ1q1bJWLj/Xqv0i0Fp4gfR6AvhUnhBX0JwtnRd9XwAPBlmjDCMJU
 UNc5klNTd+PADpYZhVSEJzh7LxWLyv9cqP3OyFqsOUtigPRQWkJzrAlU0q4dzhbSppSO
 YuINang5Pq5DWNkgzMidirkfcARVUGKOWxGDwlOXZfRU+Pq1GFwCncA4JFQTu/5A1873
 O957/l0tlhQokVTw6LHF2wXRbIJczcVsaDsu2efEgg5ieNndPdablxMp5wvT8uP15rYB
 SuelCePki/Nwmw3vEcin0cKc/J36qarv4uyP5aHGjNt8D0vi+On5LxY6lAj09Nignblz
 nCrw==
X-Gm-Message-State: AOAM532HOYTnV6aOA81L+WIT1IZt6M24Zxpvb3duzgkAVmcIfBi+8jc7
 HkjzwBXefmZ9Y3T81LgibfJwhsIhMGxUT6L7U7EUIeVOA071kHrhknWg+nbJWCa/rth7P+RJIKj
 cnKM/jzAd64YTH2Hyc84r5gUw0rB3ALWdJqD/awIECgQ=
X-Received: by 2002:a1c:f601:: with SMTP id w1mr30738296wmc.112.1636127019053; 
 Fri, 05 Nov 2021 08:43:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyoyh8Lr4yX65exQreiyo/watjC1Mfw4IA67+fs0m2xRDqQJ5/nM+wMDOQKHo1Bn9rMO/Br/w==
X-Received: by 2002:a1c:f601:: with SMTP id w1mr30738272wmc.112.1636127018901; 
 Fri, 05 Nov 2021 08:43:38 -0700 (PDT)
Received: from localhost.localdomain (lfbn-lyo-1-470-249.w2-7.abo.wanadoo.fr.
 [2.7.60.249])
 by smtp.gmail.com with ESMTPSA id m2sm11245691wml.15.2021.11.05.08.43.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Nov 2021 08:43:38 -0700 (PDT)
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
Subject: [PATCH 0/7] Cleanup after removal of configs
Date: Fri,  5 Nov 2021 16:43:27 +0100
Message-Id: <20211105154334.1841927-1-alexandre.ghiti@canonical.com>
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

Alexandre Ghiti (7):
  Documentation, arch: Remove leftovers from fscache/cachefiles
    histograms
  Documentation, arch: Remove leftovers from raw device
  Documentation, arch: Remove leftovers from CIFS_WEAK_PW_HASH
  arch: Remove leftovers from mandatory file locking
  Documentation, arch, fs: Remove leftovers from fscache object list
  include: mfd: Remove leftovers from bd70528 watchdog
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
 arch/mips/configs/nlm_xlp_defconfig           |   2 -
 arch/mips/configs/nlm_xlr_defconfig           |   2 -
 arch/powerpc/configs/pmac32_defconfig         |   1 -
 arch/powerpc/configs/ppc6xx_defconfig         |   1 -
 arch/powerpc/configs/pseries_defconfig        |   1 -
 arch/sh/configs/titan_defconfig               |   1 -
 fs/fscache/object.c                           |   3 -
 fs/fscache/proc.c                             |  12 --
 include/linux/mfd/rohm-bd70528.h              |  24 ----
 35 files changed, 6 insertions(+), 237 deletions(-)

-- 
2.32.0

