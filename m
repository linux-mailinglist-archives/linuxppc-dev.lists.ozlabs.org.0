Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ED1124311C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Aug 2020 00:47:36 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BRlFx4GdvzDqd9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Aug 2020 08:47:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::644;
 helo=mail-ej1-x644.google.com; envelope-from=chunkeey@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=H0ohq0JG; dkim-atps=neutral
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com
 [IPv6:2a00:1450:4864:20::644])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BRl7Z2npYzDqcP
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Aug 2020 08:41:59 +1000 (AEST)
Received: by mail-ej1-x644.google.com with SMTP id a26so4065930ejc.2
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Aug 2020 15:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IxVRjUiTs3nNJYC+q69G6u/88+5n3rbFDRYnY/zq97o=;
 b=H0ohq0JGTzqcqaklLMl2pEv/9wkZ8rXqSEg5T4pQV0FzG5ub5/y7mtpmMdwdH4VwH1
 pyuQmYqp/PSh0i0Ypv6/xSFp2ZWqehrKUmyBWCEwX2Q0P+cANKDHsHGoeFPdQ0LbMqUn
 7tvkOPsv+UtR+6hYYOatXTVXj1SnoUObAtXfSGPYgLZg/31xUF7g3zoH4ocfmj1i6bcO
 /jj+B67eL6kdLV5IzhjvPlugkrATrrr5+qtBb+CByIn3/ZkrhF4sfSEm9XagxhSJw/zU
 5shufL+pm2lhBJPv7gDUTe5nF4SM99VYwmuJvtC/Vxo8sHdgAxouec75pWEKtOLFEwM7
 p4Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IxVRjUiTs3nNJYC+q69G6u/88+5n3rbFDRYnY/zq97o=;
 b=qTKDBmvOFMikyZxj+F5HsC78obggU0uPKKaY9NqZjTYv4kjC/LmuipTwQZ4y6PBZwx
 9u0CTqjq+Rc+hz9RnGNZl19bivdsn7P2RokmFcf7GnL1fNuyJOj8ks14yahgRmdqbcLN
 BFRt3cSxYgNKT0Uwq9a0AxFtiKj5bajPiP4ZTgTL6+Zy0C36DNU7XpgvpV/9kSf02q+O
 3MpCKNTgjoK39haR0aQw+ZmL2CECdac/oAkV7swVS81l22DraWBvLI8AwoIZ9G0/p/FQ
 33w0bImVy2iyt1CumoALhvJVG6H8uuPM/nhJBGSTpBnn7dqVGz2YgkjBkDoLsUyJXpmi
 Z+nA==
X-Gm-Message-State: AOAM530t13bMbs/dMeSPIuRaE6yUatZWXfo3EmdBQ/32JguTiVqWfo/e
 JFKCW8Rgg2yYkkWLieZX/qA80ajc
X-Google-Smtp-Source: ABdhPJy10mWBadiF0bkqmhEe8WwO2/XoAa+J0VGawvCQ+WieFtPO8vVBxjFZueeK325mYmdRiYYwSA==
X-Received: by 2002:a17:907:11d0:: with SMTP id
 va16mr2136113ejb.426.1597272116232; 
 Wed, 12 Aug 2020 15:41:56 -0700 (PDT)
Received: from debian64.daheim (pd9e293b6.dip0.t-ipconnect.de.
 [217.226.147.182])
 by smtp.gmail.com with ESMTPSA id g19sm2492418ejz.5.2020.08.12.15.41.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Aug 2020 15:41:54 -0700 (PDT)
Received: from chuck by debian64.daheim with local (Exim 4.94)
 (envelope-from <chunkeey@gmail.com>)
 id 1k5zRR-005oDQ-Pq; Thu, 13 Aug 2020 00:41:53 +0200
From: Christian Lamparter <chunkeey@gmail.com>
To: linuxppc-dev@lists.ozlabs.org,
	devicetree@vger.kernel.org
Subject: [RFC PATCH v1 0/4] powerpc: apm82181: adding customer devices
Date: Thu, 13 Aug 2020 00:41:49 +0200
Message-Id: <cover.1597271958.git.chunkeey@gmail.com>
X-Mailer: git-send-email 2.28.0
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
Cc: Paul Mackerras <paulus@samba.org>, Rob Herring <robh+dt@kernel.org>,
 Chris Blake <chrisrblake93@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello,

I've been holding on to these devices dts' for a while now.
But ever since the recent purge of the PPC405, I'm feeling
the urge to move forward.

The devices in question have been running with OpenWrt since
around 2016/2017. Back then it was linux v4.4 and required
many out-of-tree patches (for WIFI, SATA, CRYPTO...), that
since have been integrated. So, there's nothing else in the
way I think.

Now, I've looked around in the arch/powerpc for recent .dts
and device submissions to get an understanding of what is
required.
From the looks of it, it seems like every device gets a
skeleton defconfig and a CONFIG_$DEVICE symbol (Like:
CONFIG_MERAKI_MR24, CONFIG_WD_MYBOOKLIVE).

Will this be the case? Or would it make sense to further
unite the Bluestone, MR24 and MBL under a common CONFIG_APM82181
and integrate the BLUESTONE device's defconfig into it as well?
(I've stumbled accross the special machine compatible
handling of ppc in the Documentation/devicetree/usage-model.rst
already.)

Cheers,
Christian

Note:
If someone has a WD MyBook Live (DUO) and is interested in
giving it a spin with 5.8. I've made a:
"build your own Debian System" sort of script that can be
found on github: <https://github.com/chunkeey/mbl-debian>
(the only remaining patch hack is for debian's make-kpkg crossbuild)

Furthermore, the OpenWrt project currently has images for the
following apm82181 devices:
 Cisco Meraki MX60(W) - Needs DSA for the AR8327
 Netgear WNDAP620/WNDAP660 - (Could be next)
 Netgear WNDR4700 - Needs DSA for the AR8327

Note2: I do have a stash of extensive APM82181 related documentation.

Christian Lamparter (4):
  powerpc: apm82181: create shared dtsi for APM bluestone
  powerpc: apm82181: add WD MyBook Live NAS
  powerpc: apm82181: add Meraki MR24 AP
  powerpc: apm82181: integrate bluestone.dts

 arch/powerpc/boot/dts/apm82181.dtsi        | 485 +++++++++++++++++++++
 arch/powerpc/boot/dts/bluestone.dts        | 456 +++++--------------
 arch/powerpc/boot/dts/meraki-mr24.dts      | 237 ++++++++++
 arch/powerpc/boot/dts/wd-mybooklive.dts    | 199 +++++++++
 arch/powerpc/platforms/44x/ppc44x_simple.c |   4 +-
 5 files changed, 1033 insertions(+), 348 deletions(-)
 create mode 100644 arch/powerpc/boot/dts/apm82181.dtsi
 create mode 100644 arch/powerpc/boot/dts/meraki-mr24.dts
 create mode 100644 arch/powerpc/boot/dts/wd-mybooklive.dts

-- 
2.28.0

