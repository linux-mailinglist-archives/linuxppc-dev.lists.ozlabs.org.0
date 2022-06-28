Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B6FA355E0AC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jun 2022 15:32:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LXQWP2kGnz3dQt
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jun 2022 23:32:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=heyquark.com (client-ip=2001:4b98:dc4:8::232; helo=relay12.mail.gandi.net; envelope-from=ash@heyquark.com; receiver=<UNKNOWN>)
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [IPv6:2001:4b98:dc4:8::232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LXQW15x0lz2y8F
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Jun 2022 23:32:13 +1000 (AEST)
Received: (Authenticated sender: ash@heyquark.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 2AAE5200010;
	Tue, 28 Jun 2022 13:31:48 +0000 (UTC)
From: Ash Logan <ash@heyquark.com>
To: krzysztof.kozlowski+dt@linaro.org,
	paulus@samba.org,
	mpe@ellerman.id.au,
	christophe.leroy@csgroup.eu,
	robh+dt@kernel.org,
	benh@kernel.crashing.org
Subject: [PATCH v3 00/12] powerpc: Nintendo Wii U support
Date: Tue, 28 Jun 2022 23:31:32 +1000
Message-Id: <20220628133144.142185-1-ash@heyquark.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220622131037.57604-1-ash@heyquark.com>
References: <20220622131037.57604-1-ash@heyquark.com>
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
Cc: devicetree@vger.kernel.org, linkmauve@linkmauve.fr, linux-kernel@vger.kernel.org, rw-r-r-0644@protonmail.com, joel@jms.id.au, linuxppc-dev@lists.ozlabs.org, j.ne@posteo.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The following patches add basic support for the Nintendo Wii U video
game console, a PowerPC system somewhat similar to the GameCube and
Wii.

This includes:
- devicetree source
- bootwrapper support
- udbg console to bootloader
- early udbg console
- interrupt controllers
- platform support
- recognition of the Espresso processor
- workaround for the discontiguous RAM blocks

This is enough to boot on hardware. dmesg pics (with a small hack to
udbg-immortal, not included):
Link: https://wiki.linux-wiiu.org/images/7/7e/Mainline-initial-dmesg1.png
Link: https://wiki.linux-wiiu.org/images/9/91/Mainline-initial-dmesg2.png

For those who have hardware and would like to try these patches, some
modification is required to the stock OS to allow Linux. For info:
https://wiki.linux-wiiu.org/wiki/AdvancedSetup

Some of the design choices (new platform > embedded6xx) were discussed
previously:
Link: https://lore.kernel.org/lkml/0020d47c-0e23-822c-33f5-ccb7ea4c1072@heyquark.com/T/

Turns out even less changes were needed than previously anticipated for
discontiguous memory, and KUAP is yet to give trouble. Thanks to those
who helped and discussed this.

Changes since v2:
 - Fixed some overzealous deleting in the devicetree, oops.
 - Fixed missing declarations for some functions (thanks robots)
 - Fixed some checkpatch warnings.
 - Mark latte as a simple-bus and use of_platform_default_populate.
Changes since v1:
 - Style and formatting tweaks to the devicetree, thanks Rob Herring for
   the review.

Ash Logan (12):
  dt-bindings: wiiu: Document the Nintendo Wii U devicetree
  powerpc: wiiu: device tree
  powerpc: wiiu: bootwrapper support
  powerpc: wiiu: introduce wiiu platform
  powerpc: wiiu: declare as non-coherent
  powerpc: wiiu: udbg support for latteipc
  powerpc: wiiu: espresso interrupt controller support
  powerpc: wiiu: latte interrupt controller support
  powerpc: espresso processor support
  powerpc: wiiu: platform support
  powerpc: wiiu: don't enforce flat memory
  powerpc: wiiu: add minimal default config

 .../bindings/powerpc/nintendo/wiiu.yaml       |  28 ++
 .../powerpc/nintendo/wiiu/espresso-pic.yaml   |  42 +++
 .../bindings/powerpc/nintendo/wiiu/gpu7.yaml  |  41 +++
 .../powerpc/nintendo/wiiu/latte-ahci.yaml     |  43 +++
 .../powerpc/nintendo/wiiu/latte-dsp.yaml      |  35 ++
 .../powerpc/nintendo/wiiu/latte-pic.yaml      |  46 +++
 .../powerpc/nintendo/wiiu/latte-sdhci.yaml    |  40 +++
 .../bindings/powerpc/nintendo/wiiu/latte.yaml |  25 ++
 arch/powerpc/Kconfig.debug                    |   9 +
 arch/powerpc/boot/Makefile                    |   4 +
 arch/powerpc/boot/dts/wiiu.dts                | 326 ++++++++++++++++++
 arch/powerpc/boot/wiiu-head.S                 | 103 ++++++
 arch/powerpc/boot/wiiu.c                      |  73 ++++
 arch/powerpc/boot/wrapper                     |   4 +
 arch/powerpc/configs/wiiu_defconfig           |   7 +
 arch/powerpc/include/asm/udbg.h               |   1 +
 arch/powerpc/kernel/cputable.c                |  16 +
 arch/powerpc/kernel/head_book3s_32.S          |  20 ++
 arch/powerpc/kernel/udbg.c                    |   3 +
 arch/powerpc/mm/init_32.c                     |   4 +-
 arch/powerpc/platforms/Kconfig                |   1 +
 arch/powerpc/platforms/Kconfig.cputype        |   2 +-
 arch/powerpc/platforms/Makefile               |   1 +
 arch/powerpc/platforms/wiiu/Kconfig           |  22 ++
 arch/powerpc/platforms/wiiu/Makefile          |   4 +
 arch/powerpc/platforms/wiiu/espresso-pic.c    | 183 ++++++++++
 arch/powerpc/platforms/wiiu/espresso-pic.h    |  59 ++++
 arch/powerpc/platforms/wiiu/latte-pic.c       | 259 ++++++++++++++
 arch/powerpc/platforms/wiiu/latte-pic.h       |  23 ++
 arch/powerpc/platforms/wiiu/setup.c           |  60 ++++
 arch/powerpc/platforms/wiiu/udbg_latteipc.c   | 124 +++++++
 arch/powerpc/platforms/wiiu/udbg_latteipc.h   |  27 ++
 32 files changed, 1632 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/powerpc/nintendo/wiiu.yaml
 create mode 100644 Documentation/devicetree/bindings/powerpc/nintendo/wiiu/espresso-pic.yaml
 create mode 100644 Documentation/devicetree/bindings/powerpc/nintendo/wiiu/gpu7.yaml
 create mode 100644 Documentation/devicetree/bindings/powerpc/nintendo/wiiu/latte-ahci.yaml
 create mode 100644 Documentation/devicetree/bindings/powerpc/nintendo/wiiu/latte-dsp.yaml
 create mode 100644 Documentation/devicetree/bindings/powerpc/nintendo/wiiu/latte-pic.yaml
 create mode 100644 Documentation/devicetree/bindings/powerpc/nintendo/wiiu/latte-sdhci.yaml
 create mode 100644 Documentation/devicetree/bindings/powerpc/nintendo/wiiu/latte.yaml
 create mode 100644 arch/powerpc/boot/dts/wiiu.dts
 create mode 100644 arch/powerpc/boot/wiiu-head.S
 create mode 100644 arch/powerpc/boot/wiiu.c
 create mode 100644 arch/powerpc/configs/wiiu_defconfig
 create mode 100644 arch/powerpc/platforms/wiiu/Kconfig
 create mode 100644 arch/powerpc/platforms/wiiu/Makefile
 create mode 100644 arch/powerpc/platforms/wiiu/espresso-pic.c
 create mode 100644 arch/powerpc/platforms/wiiu/espresso-pic.h
 create mode 100644 arch/powerpc/platforms/wiiu/latte-pic.c
 create mode 100644 arch/powerpc/platforms/wiiu/latte-pic.h
 create mode 100644 arch/powerpc/platforms/wiiu/setup.c
 create mode 100644 arch/powerpc/platforms/wiiu/udbg_latteipc.c
 create mode 100644 arch/powerpc/platforms/wiiu/udbg_latteipc.h


base-commit: 03c765b0e3b4cb5063276b086c76f7a612856a9a
-- 
2.36.1

