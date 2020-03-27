Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C8FA195FDE
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Mar 2020 21:34:28 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48ptr14lQ4zDrMX
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Mar 2020 07:34:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2001:8b0:10b:1231::1; helo=merlin.infradead.org;
 envelope-from=geoff@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=infradead.org header.i=@infradead.org
 header.a=rsa-sha256 header.s=merlin.20170209 header.b=dTeQ9pJP; 
 dkim-atps=neutral
Received: from merlin.infradead.org (merlin.infradead.org
 [IPv6:2001:8b0:10b:1231::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48ptg92pl5zDrJs
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Mar 2020 07:26:45 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Date:Cc:To:Subject:From:Message-Id:
 Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=mb4/CnjtkqxhL2spEoE0sB/T3Z74XU2BI+FWqYLtmzc=; b=dTeQ9pJP1nv2AGPW+Oxu+4lHO5
 fqoct0NFQBTZU2b2TEEsFi4gKN3n15gcnoxVL38j3YfriQiqhKlITj1k3oD5Pxo1iVBSYUOjnFqi8
 sL0JdpNJ59uPm2HZgIPKIolizghEBOMuwXP5s7aLpyhlzIv6FYDto7kEy5P4gvL5YM87w8wuGy51U
 gjaDEsJH4baUaoA9rnP+dpzWIF0eI56vIr50MuPevF8O7XqvZLQmqdHPY/JLErWBr2XHWKSYGID64
 N2uO1gE6UaFoGhm1UvPsxVaH9XVMEqWBwTt2CxAeegaH9s9M1089AtwkTv8NeX6eDKN5IcLp41oKX
 kJyQp9+w==;
Received: from geoff by merlin.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1jHvYd-0003IS-3I; Fri, 27 Mar 2020 20:26:23 +0000
Message-Id: <cover.1585340156.git.geoff@infradead.org>
From: Geoff Levand <geoff@infradead.org>
Patch-Date: Fri, 27 Mar 2020 13:15:56 -0700
Subject: [PATCH 0/9] PS3 patches for v5.7
To: Michael Ellerman <mpe@ellerman.id.au>
Date: Fri, 27 Mar 2020 20:26:23 +0000
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
Cc: linuxppc-dev@lists.ozlabs.org, Geert Uytterhoeven <geert@linux-m68k.org>,
 Markus Elfring <elfring@users.sourceforge.net>,
 Dan Carpenter <dan.carpenter@oracle.com>,
 Emmanuel Nicolet <emmanuel.nicolet@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Michael,

Here are a few PS3 specific patches.  A few remove some reduntant messages,
a few add some minor debugging support, and a few fix some problems during
system boot.

Please consider for v5.7.

-Geoff

The following changes since commit 16fbf79b0f83bc752cee8589279f1ebfe57b3b6e:

  Linux 5.6-rc7 (2020-03-22 18:31:56 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geoff/ps3-linux.git for-merge-ps3

for you to fetch changes up to 1333a8985c4190763c9c0312bcefad8b1ea863c7:

  powerpc/ps3: Add udbg_panic (2020-03-27 13:07:31 -0700)

----------------------------------------------------------------
Dan Carpenter (1):
      powerpc/ps3: remove an unneeded NULL check

Emmanuel Nicolet (1):
      ps3disk: use the default segment boundary

Geoff Levand (4):
      powerpc/ps3: Set CONFIG_UEVENT_HELPER=y in ps3_defconfig
      powerpc/ps3: Add check for otheros image size
      powerpc/ps3: Add lv1_panic
      powerpc/ps3: Add udbg_panic

Markus Elfring (3):
      powerpc/ps3: Remove duplicate error messages
      drivers/ps3: Remove duplicate error messages
      net/ps3_gelic_net: Remove duplicate error message

 arch/powerpc/boot/ppc_asm.h                  |  6 ++++++
 arch/powerpc/boot/wrapper                    | 13 +++++++++++--
 arch/powerpc/configs/ps3_defconfig           |  2 ++
 arch/powerpc/include/asm/ppc_asm.h           |  6 ++++++
 arch/powerpc/platforms/ps3/mm.c              |  9 ++++++++-
 arch/powerpc/platforms/ps3/os-area.c         |  4 +---
 drivers/block/ps3disk.c                      |  1 -
 drivers/net/ethernet/toshiba/ps3_gelic_net.c |  2 --
 drivers/ps3/ps3-lpm.c                        |  2 --
 drivers/ps3/ps3-vuart.c                      |  1 -
 drivers/ps3/sys-manager-core.c               |  2 +-
 11 files changed, 35 insertions(+), 13 deletions(-)

-- 
2.20.1

