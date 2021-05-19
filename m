Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9514D388D72
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 May 2021 14:04:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FlWkh4MHJz3c1m
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 May 2021 22:04:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linkmauve.fr (client-ip=82.65.109.163; helo=luna.linkmauve.fr;
 envelope-from=linkmauve@linkmauve.fr; receiver=<UNKNOWN>)
Received: from luna.linkmauve.fr (82-65-109-163.subs.proxad.net
 [82.65.109.163])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with UTF8SMTPS id 4FlRt11R0Yz2xvF
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 May 2021 19:10:32 +1000 (AEST)
Received: by luna.linkmauve.fr (Postfix, from userid 1000)
 id 40109F40644; Wed, 19 May 2021 11:05:34 +0200 (CEST)
From: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 linuxppc-dev@lists.ozlabs.org, devicetree@vger.kernel.org
Subject: [PATCH 0/4] nvmem: nintendo-otp: Add new driver for the Wii and Wii U OTP
Date: Wed, 19 May 2021 11:05:21 +0200
Message-Id: <20210519090525.1788-1-linkmauve@linkmauve.fr>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 19 May 2021 22:03:54 +1000
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
Cc: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Paul Mackerras <paulus@samba.org>,
 Ash Logan <ash@heyquark.com>,
 =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.ne@posteo.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The OTP is a read-only memory area which contains various keys and
signatures used to decrypt, encrypt or verify various pieces of storage.

Its size depends on the console, it is 128 bytes on the Wii and
1024 bytes on the Wii U (split into eight 128 bytes banks).

It can be used directly by writing into one register and reading from
the other one, without any additional synchronisation.

This series has only been tested on the Wii U so far, using the
downstream 4.19 branch from linux-wiiu[1], but it should also work on
the Wii on mainline.

[1] https://gitlab.com/linux-wiiu/linux-wiiu

Emmanuel Gil Peyrot (4):
  nvmem: nintendo-otp: Add new driver for the Wii and Wii U OTP
  dt-bindings: nintendo-otp: Document the Wii and Wii U OTP support
  powerpc: wii.dts: Expose the OTP on this platform
  powerpc: wii_defconfig: Enable OTP by default

 .../bindings/nvmem/nintendo-otp.txt           |  14 +++
 arch/powerpc/boot/dts/wii.dts                 |   5 +
 arch/powerpc/configs/wii_defconfig            |   1 +
 drivers/nvmem/Kconfig                         |  11 ++
 drivers/nvmem/Makefile                        |   2 +
 drivers/nvmem/nintendo-otp.c                  | 115 ++++++++++++++++++
 6 files changed, 148 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/nvmem/nintendo-otp.txt
 create mode 100644 drivers/nvmem/nintendo-otp.c

-- 
2.31.1

