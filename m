Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EFC9A150FF8
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Feb 2020 19:51:59 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48BH4F0BBjzDqPj
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Feb 2020 05:51:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.de
 (client-ip=195.135.220.15; helo=mx2.suse.de;
 envelope-from=nsaenzjulienne@suse.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=suse.de
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48BH0Z42WpzDqKl
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Feb 2020 05:48:43 +1100 (AEDT)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 14DE3ABB3;
 Mon,  3 Feb 2020 18:48:38 +0000 (UTC)
From: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
To: linux@armlinux.org.uk, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-kbuild@vger.kernel.org
Subject: [PATCH 0/2] ARM: Introduce multi_v7_lpae_defconfig
Date: Mon,  3 Feb 2020 19:48:17 +0100
Message-Id: <20200203184820.4433-1-nsaenzjulienne@suse.de>
X-Mailer: git-send-email 2.25.0
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
Cc: f.fainelli@gmail.com, linux-kernel@vger.kernel.org,
 yamada.masahiro@socionext.com, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This series introduces a new configuration target,
multi_v7_lpae_defconfig, built by merging the config fragment
lpae.config with mult_v7_defconfig. Ultimately needed in order for
Raspberry Pi 4's PCIe bus to work on arm builds, but which may benefit
other boards out there.

---

Changes since RFC:
 - Move merge function into the scripts directory.

Nicolas Saenz Julienne (2):
  kbuild: Add config fragment merge functionality
  ARM: add multi_v7_lpae_defconfig

 arch/arm/Makefile            |  4 ++++
 arch/arm/configs/lpae.config |  1 +
 arch/powerpc/Makefile        | 12 +-----------
 scripts/Makefile.defconf     | 15 +++++++++++++++
 4 files changed, 21 insertions(+), 11 deletions(-)
 create mode 100644 arch/arm/configs/lpae.config
 create mode 100644 scripts/Makefile.defconf

-- 
2.25.0

