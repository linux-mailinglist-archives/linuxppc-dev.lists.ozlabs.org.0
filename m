Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A03CE475FF0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Dec 2021 18:55:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JDjZr48Wqz3cDC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Dec 2021 04:55:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linkmauve.fr (client-ip=82.65.109.163; helo=luna.linkmauve.fr;
 envelope-from=linkmauve@linkmauve.fr; receiver=<UNKNOWN>)
X-Greylist: delayed 163 seconds by postgrey-1.36 at boromir;
 Thu, 16 Dec 2021 04:55:11 AEDT
Received: from luna.linkmauve.fr (82-65-109-163.subs.proxad.net
 [82.65.109.163])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JDjZR2Ytfz2yJM
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Dec 2021 04:55:11 +1100 (AEDT)
Received: by luna.linkmauve.fr (Postfix, from userid 1000)
 id CE3E4F40EA4; Wed, 15 Dec 2021 18:55:04 +0100 (CET)
From: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Alessandro Zummo <a.zummo@towertech.it>
Subject: [PATCH v3 0/5] rtc: nintendo: Add a RTC driver for the GameCube,
 Wii and Wii U
Date: Wed, 15 Dec 2021 18:54:56 +0100
Message-Id: <20211215175501.6761-1-linkmauve@linkmauve.fr>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211027223516.2031-1-linkmauve@linkmauve.fr>
References: <20211027223516.2031-1-linkmauve@linkmauve.fr>
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
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
 Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>, linux-kernel@vger.kernel.org,
 rw-r-r-0644 <r.r.qwertyuiop.r.r@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Paul Mackerras <paulus@samba.org>, Ash Logan <ash@heyquark.com>,
 linuxppc-dev@lists.ozlabs.org,
 =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.ne@posteo.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

These three consoles share a device, the MX23L4005, which contains a
clock and 64 bytes of SRAM storage, and is exposed on the EXI bus
(similar to SPI) on channel 0, device 1.  This driver allows it to be
used as a Linux RTC device, where time can be read and set.

The hardware also exposes two timers, one which shuts down the console
and one which powers it on, but these aren’t supported currently.

On the Wii U, the counter bias is stored in a XML file, /config/rtc.xml,
encrypted in the SLC (eMMC storage), using a proprietary filesystem.  In
order to avoid having to implement all that, this driver assumes a
bootloader will parse this XML file and write the bias into the SRAM, at
the same location the other two consoles have it.

Changes since v1:
- Rename the driver to rtc-gamecube.
- Switch to the regmap API for debugfs support.
- Report low battery and unstable power as invalid data.
- Remove Wii U support in Kconfig, nothing specific to this console
  needs to be changed in the code.
- Don’t attempt to change HW_SRNPROT on the GameCube, this register
  doesn’t exist so we can use SRAM just fine without doing anything.
- Add needed changes to the wii device tree.
- Enable this driver on the gamecube and wii platforms.

Changes since v2:
- Report low battery correctly.

Emmanuel Gil Peyrot (5):
  rtc: gamecube: Add a RTC driver for the GameCube, Wii and Wii U
  rtc: gamecube: Report low battery as invalid data
  powerpc: wii.dts: Expose HW_SRNPROT on this platform
  powerpc: gamecube_defconfig: Enable the RTC driver
  powerpc: wii_defconfig: Enable the RTC driver

 arch/powerpc/boot/dts/wii.dts           |   5 +
 arch/powerpc/configs/gamecube_defconfig |   2 +-
 arch/powerpc/configs/wii_defconfig      |   2 +-
 drivers/rtc/Kconfig                     |  11 +
 drivers/rtc/Makefile                    |   1 +
 drivers/rtc/rtc-gamecube.c              | 377 ++++++++++++++++++++++++
 6 files changed, 396 insertions(+), 2 deletions(-)
 create mode 100644 drivers/rtc/rtc-gamecube.c

-- 
2.34.1

