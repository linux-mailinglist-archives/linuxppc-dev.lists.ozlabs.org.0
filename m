Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CE81413CE1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Sep 2021 23:47:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HDZlJ2JQCz3f8b
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Sep 2021 07:47:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linkmauve.fr (client-ip=2a01:e0a:828:c7c0:49:5ff:fe41:d261;
 helo=luna.linkmauve.fr; envelope-from=linkmauve@linkmauve.fr;
 receiver=<UNKNOWN>)
Received: from luna.linkmauve.fr (unknown
 [IPv6:2a01:e0a:828:c7c0:49:5ff:fe41:d261])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HDZZz0NHxz3cBH
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Sep 2021 07:39:50 +1000 (AEST)
Received: by luna.linkmauve.fr (Postfix, from userid 1000)
 id 88C64F40B68; Tue, 21 Sep 2021 23:39:43 +0200 (CEST)
From: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
To: linux-crypto@vger.kernel.org
Subject: [PATCH 0/4] crypto: nintendo-aes - add a new AES driver
Date: Tue, 21 Sep 2021 23:39:26 +0200
Message-Id: <20210921213930.10366-1-linkmauve@linkmauve.fr>
X-Mailer: git-send-email 2.33.0
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
Cc: devicetree@vger.kernel.org, Herbert Xu <herbert@gondor.apana.org.au>,
 Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Paul Mackerras <paulus@samba.org>,
 Ash Logan <ash@heyquark.com>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>,
 =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.ne@posteo.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This engine implements AES in CBC mode, using 128-bit keys only.  It is
present on both the Wii and the Wii U, and is apparently identical in
both consoles.

The hardware is capable of firing an interrupt when the operation is
done, but this driver currently uses a busy loop, I’m not too sure
whether it would be preferable to switch, nor how to achieve that.

It also supports a mode where no operation is done, and thus could be
used as a DMA copy engine, but I don’t know how to expose that to the
kernel or whether it would even be useful.

In my testing, on a Wii U, this driver reaches 80.7 MiB/s, while the
aes-generic driver only reaches 30.9 MiB/s, so it is a quite welcome
speedup.

This driver was written based on reversed documentation, see:
https://wiibrew.org/wiki/Hardware/AES

Emmanuel Gil Peyrot (4):
  crypto: nintendo-aes - add a new AES driver
  dt-bindings: nintendo-aes: Document the Wii and Wii U AES support
  powerpc: wii.dts: Expose the AES engine on this platform
  powerpc: wii_defconfig: Enable AES by default

 .../bindings/crypto/nintendo-aes.yaml         |  34 +++
 arch/powerpc/boot/dts/wii.dts                 |   7 +
 arch/powerpc/configs/wii_defconfig            |   4 +-
 drivers/crypto/Kconfig                        |  11 +
 drivers/crypto/Makefile                       |   1 +
 drivers/crypto/nintendo-aes.c                 | 273 ++++++++++++++++++
 6 files changed, 329 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/crypto/nintendo-aes.yaml
 create mode 100644 drivers/crypto/nintendo-aes.c

-- 
2.33.0

