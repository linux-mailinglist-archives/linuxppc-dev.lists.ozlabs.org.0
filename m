Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A75C43DCA98
	for <lists+linuxppc-dev@lfdr.de>; Sun,  1 Aug 2021 09:39:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GctLp4VNLz3dGR
	for <lists+linuxppc-dev@lfdr.de>; Sun,  1 Aug 2021 17:39:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linkmauve.fr (client-ip=82.65.109.163; helo=luna.linkmauve.fr;
 envelope-from=linkmauve@linkmauve.fr; receiver=<UNKNOWN>)
Received: from luna.linkmauve.fr (82-65-109-163.subs.proxad.net
 [82.65.109.163])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GctKl6ykMz2ymF
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  1 Aug 2021 17:38:32 +1000 (AEST)
Received: by luna.linkmauve.fr (Postfix, from userid 1000)
 id 29841F40868; Sun,  1 Aug 2021 09:38:25 +0200 (CEST)
From: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
To: Rob Herring <robh+dt@kernel.org>, linuxppc-dev@lists.ozlabs.org,
 devicetree@vger.kernel.org
Subject: [PATCH v4 0/5] nvmem: nintendo-otp: Add new driver for the Wii and
 Wii U OTP
Date: Sun,  1 Aug 2021 09:38:17 +0200
Message-Id: <20210801073822.12452-1-linkmauve@linkmauve.fr>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210701225743.14631-1-linkmauve@linkmauve.fr>
References: <20210701225743.14631-1-linkmauve@linkmauve.fr>
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
Cc: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>, linux-kernel@vger.kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Ash Logan <ash@heyquark.com>, Paul Mackerras <paulus@samba.org>,
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

This series has been tested on both the Wii U (using my downstream
master-wiiu branch[1]), as well as on the Wii on mainline.

[1] https://gitlab.com/linkmauve/linux-wiiu/-/commits/master-wiiu

Changes since v1:
- Fixed the commit messages so they can be accepted by other email
  servers, sorry about that.

Changes since v2:
- Switched the dt binding documentation to YAML.
- Used more obvious register arithmetic, and tested that gcc (at -O1 and
  above) outputs the exact same rlwinm instructions for them.
- Use more #defines to make the code easier to read.
- Include some links to the reversed documentation.
- Avoid overlapping dt regions by changing the existing control@d800100
  node to end before the OTP registers, with some bigger dt refactoring
  left for a future series.

Changes since v3:
- Relicense the dt-binding documentation under GPLv2-only or
  BSD-2-clauses.

Emmanuel Gil Peyrot (5):
  nvmem: nintendo-otp: Add new driver for the Wii and Wii U OTP
  dt-bindings: nintendo-otp: Document the Wii and Wii U OTP support
  powerpc: wii.dts: Reduce the size of the control area
  powerpc: wii.dts: Expose the OTP on this platform
  powerpc: wii_defconfig: Enable OTP by default

 .../bindings/nvmem/nintendo-otp.yaml          |  44 +++++++
 arch/powerpc/boot/dts/wii.dts                 |  13 +-
 arch/powerpc/configs/wii_defconfig            |   1 +
 drivers/nvmem/Kconfig                         |  11 ++
 drivers/nvmem/Makefile                        |   2 +
 drivers/nvmem/nintendo-otp.c                  | 124 ++++++++++++++++++
 6 files changed, 194 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/nvmem/nintendo-otp.yaml
 create mode 100644 drivers/nvmem/nintendo-otp.c

-- 
2.32.0

