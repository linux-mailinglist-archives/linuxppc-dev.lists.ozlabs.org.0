Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B31E39862B
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Jun 2021 12:18:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fw4jY3vhZz306c
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Jun 2021 20:18:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=keQ0Czhj;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::333;
 helo=mail-wm1-x333.google.com; envelope-from=lee.jones@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=keQ0Czhj; dkim-atps=neutral
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fw4j31Lk3z2xZJ
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Jun 2021 20:17:40 +1000 (AEST)
Received: by mail-wm1-x333.google.com with SMTP id
 o2-20020a05600c4fc2b029019a0a8f959dso1355531wmq.1
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 02 Jun 2021 03:17:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xPDD51qpMRPuv9Fk8qUYAfWOGjtsRuaqysDYxI5Q/mI=;
 b=keQ0CzhjrxmKEuq4uYSZoRrwSn6RtvmaGeh9jNo3hvZLRsVHdsTM2erFYYaThZAWs1
 hNhbwAo3PWnzyxxcSOnuDVbRq6fV7a718bo/zFgk6OVzhHy0r2Jrzku/+jVUkeNW0klc
 qLCEvCekHPxx2HYoHMTmdTPo1dc6V7303f6xuRXAhQPBf4LxxpkkHSJORsZpZG6koC6g
 9xwBi4zelbNLoIN8/KyMI4+eLlVVP856HRaiO4oXxx3h1CcAV0qSjbyrArw8kilHeE+k
 NFTGGOEyjXaI02QcUAGrlLu62lU6Lhi9G0kkfqQ0v1HHVvFHiLSGgLp5KJ94yD+YjNjg
 H03g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xPDD51qpMRPuv9Fk8qUYAfWOGjtsRuaqysDYxI5Q/mI=;
 b=iydCX+z3KtlpJqMg39GVHT4lRoPlohpt3pDQ+U1/fx9m9IQGANZPDn+vgNkOxJg6ft
 ohVjUJqQY5KXX8TX9cpdrvgJVOYLN9jPMl1HXoHXxZhtmRB6w//P+VOjDVpDF6dKudHu
 KolF82uhtHNN+DLoiij2sTWNJBFpOcE/w/1GKJavuK1mTa9Ja/TXlewVZFkpP1HHfDdq
 g4hoAQhtqZulOPT/RV0FzIEvHaPP2OWzm0HgXVClA/D2LcPcFCzKlzQ1c999UkLaEDqJ
 Vj7DND4rIhVTw/Fl+8pM3vC9GBcZICNbY0rnq22KfZWEQRZAwla3IXngAZW913mOBOm4
 W4Lw==
X-Gm-Message-State: AOAM531zQ1cL5glkziIqc7BXCLFyns35HmNaiEvq8voTAbQYnw7K2wvq
 dqSleyWjr6Q73j27SqI+R1p1Zw==
X-Google-Smtp-Source: ABdhPJzADrdrNiLpSSBqh+JLm+XosLbtT8oiPSK6y5ZObKbLSuSjoZ+bLBl1gBM7fEy9Urb25f5LFQ==
X-Received: by 2002:a05:600c:4ece:: with SMTP id
 g14mr2061219wmq.45.1622629054376; 
 Wed, 02 Jun 2021 03:17:34 -0700 (PDT)
Received: from dell.default ([91.110.221.214])
 by smtp.gmail.com with ESMTPSA id q11sm1593265wmq.1.2021.06.02.03.17.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jun 2021 03:17:33 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 00/21] Rid W=1 warnings from IDE
Date: Wed,  2 Jun 2021 11:17:01 +0100
Message-Id: <20210602101722.2276638-1-lee.jones@linaro.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: linux-ide@vger.kernel.org, Mike Waychison <crlf@sun.com>,
 Paul Mackerras <paulus@samba.org>,
 "Christopher J. Reimer" <reimer@doe.carleton.ca>, Tim Hockin <thockin@sun.com>,
 Erik Andersen <andersee@debian.org>, Alan Cox <alan@lxorguk.ukuu.org.uk>,
 CJ <cjtsai@ali.com.tw>, Sergei Shtylyov <sshtylyov@ru.mvista.com>,
 Duncan Laurie <void@sun.com>, Scott Snyder <snyder@fnald0.fnal.gov>,
 Gadi Oxman <gadio@netvision.net.il>, Andre Hedrick <andre@linux-ide.org>,
 Christian Brunner <chb@muc.de>, Jens Axboe <axboe@suse.de>,
 or <source@mvista.com>, Benoit Poulot-Cazajous <poulot@chorus.fr>,
 Robert Bringman <rob@mars.trion.com>, linux-kernel@vger.kernel.org,
 Clear Zhang <Clear.Zhang@ali.com.tw>, Mark Lord <mlord@pobox.com>,
 Adrian Sun <a.sun@sun.com>, Frank Tiernan <frankt@promise.com>,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This set is part of a larger effort attempting to clean-up W=1
kernel builds, which are currently overwhelmingly riddled with
niggly little warnings.

Lee Jones (21):
  ide: alim15x3: Document alim15x3_init_one()'s 'id' param
  ide: ide-dma: Document ide_dma_unmap_sg()'s missing 'cmd' param
  ide: ide-dma-sff: Provide some missing 'param' descriptions
  ide: ide-io: Fix a few kernel-doc misdemeanours
  ide: ide-proc: Strip out unused fops structure and accompanying
    call-back
  ide: cs5530: Fix incorrect documentation for function
    init_chipset_cs5530()
  ide: ide-probe: Fix-up incorrectly documented function
    probe_for_drive()
  ide: hpt366: Provide some missing descriptions for 'f_{low,high}'
  ide: piix: Remove unused variable 'sitre'
  ide: pdc202xx_new: Supply missing description for 'set_indexed_reg()'s
    'value' param
  ide: slc90e66: Remove unused variable 'sitre'
  ide: it821x: Fix a couple of incorrectly documented functions
  ide: siimage: Fix some incorrectly documented functions/params
  ide: via82cxxx: Fix misdocumentation of via_set_speed()'s 'hwif' param
  ide: ide-cd_ioctl: Remove unused variable 'stat'
  ide: ide-cd: Demote kernel-doc abuse
  ide: ide-acpi: Mark debugging variable 'bus' as __maybe_unused
  ide: ide-io: Document ide_intr()'s param 'irq'
  ide: piix: Fix incorrectly documented param 'hwif'
  ide: ide-acpi: Provide missing description for param 'obj_loc'
  ide: pmac: Staticise local function 'pmac_ide_probe'

 drivers/ide/alim15x3.c     |  1 +
 drivers/ide/cs5530.c       |  2 +-
 drivers/ide/hpt366.c       |  2 ++
 drivers/ide/ide-acpi.c     |  4 +++-
 drivers/ide/ide-cd.c       |  2 +-
 drivers/ide/ide-cd_ioctl.c |  3 +--
 drivers/ide/ide-dma-sff.c  |  4 ++++
 drivers/ide/ide-dma.c      |  1 +
 drivers/ide/ide-io.c       |  9 +++++----
 drivers/ide/ide-probe.c    |  2 +-
 drivers/ide/ide-proc.c     | 13 -------------
 drivers/ide/it821x.c       |  4 ++--
 drivers/ide/pdc202xx_new.c |  1 +
 drivers/ide/piix.c         |  4 +---
 drivers/ide/pmac.c         |  2 +-
 drivers/ide/siimage.c      |  4 ++--
 drivers/ide/slc90e66.c     |  3 +--
 drivers/ide/via82cxxx.c    |  2 +-
 18 files changed, 29 insertions(+), 34 deletions(-)

Cc: Adrian Sun <a.sun@sun.com>
Cc: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: Andre Hedrick <andre@linux-ide.org>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Benoit Poulot-Cazajous <poulot@chorus.fr>
Cc: Christian Brunner <chb@muc.de>
Cc: "Christopher J. Reimer" <reimer@doe.carleton.ca>
Cc: CJ <cjtsai@ali.com.tw>
Cc: Clear Zhang <Clear.Zhang@ali.com.tw>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Duncan Laurie <void@sun.com>
Cc: Erik Andersen <andersee@debian.org>
Cc: Frank Tiernan <frankt@promise.com>
Cc: Gadi Oxman <gadio@netvision.net.il>
Cc: Jens Axboe <axboe@suse.de>
Cc: linux-ide@vger.kernel.org
Cc: linuxppc-dev@lists.ozlabs.org
Cc: Mark Lord <mlord@pobox.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Mike Waychison <crlf@sun.com>
Cc: or <source@mvista.com>
Cc: Paul Mackerras <paulus@samba.org>
Cc: Robert Bringman <rob@mars.trion.com>
Cc: Scott Snyder <snyder@fnald0.fnal.gov>
Cc: Sergei Shtylyov <sshtylyov@ru.mvista.com>
Cc: "Software, Inc" <source@mvista.com>
Cc: support to <linux-ide@vger.kernel.org>
Cc: Tim Hockin <thockin@sun.com>
-- 
2.31.1

