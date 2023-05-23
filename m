Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E1F2A70D88D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 May 2023 11:13:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QQTBK4mtTz3cdD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 May 2023 19:13:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.cz header.i=@suse.cz header.a=rsa-sha256 header.s=susede2_rsa header.b=VCUWRhAj;
	dkim=fail reason="signature verification failed" header.d=suse.cz header.i=@suse.cz header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=e+x8Zwpe;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.cz (client-ip=195.135.220.28; helo=smtp-out1.suse.de; envelope-from=vbabka@suse.cz; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.cz header.i=@suse.cz header.a=rsa-sha256 header.s=susede2_rsa header.b=VCUWRhAj;
	dkim=pass header.d=suse.cz header.i=@suse.cz header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=e+x8Zwpe;
	dkim-atps=neutral
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QQT9Q4mjZz3bkD
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 May 2023 19:12:26 +1000 (AEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 668E422859;
	Tue, 23 May 2023 09:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1684833133; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=72DPmo90EH4OqNIjDFcnyujcPKZuVA2whlMDuHrpMVc=;
	b=VCUWRhAjM4A4blPR+G1ylyUzwO+Byt+3fC/HZ6Y9zc5DzAZDpEB0OJGy6ZTh2PyCYwyKQU
	I5ePWp1ClaVuaG/qj6GoSul2Iiy7Iq4LW4GANyCZzx9GJ1Rtdq8F44Lgu2qhYto8YVneNO
	+un3BjjO+nhPuZB0rSGV7FXG7qWoIUY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1684833133;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=72DPmo90EH4OqNIjDFcnyujcPKZuVA2whlMDuHrpMVc=;
	b=e+x8Zwpe0rfNTU8qyv/fP8BnK8zTgVv2CjSj5z0r/u1y6iwYgZP6e0XQaZqXZT0Zr9jaZj
	THYgNxvtO38v3VBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id DE4C413A10;
	Tue, 23 May 2023 09:12:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id ocOmNWyDbGTmTgAAMHmgww
	(envelope-from <vbabka@suse.cz>); Tue, 23 May 2023 09:12:12 +0000
From: Vlastimil Babka <vbabka@suse.cz>
To: Christoph Lameter <cl@linux.com>,
	Pekka Enberg <penberg@kernel.org>,
	David Rientjes <rientjes@google.com>,
	Joonsoo Kim <iamjoonsoo.kim@lge.com>
Subject: [PATCH] mm/slab: rename CONFIG_SLAB to CONFIG_SLAB_DEPRECATED
Date: Tue, 23 May 2023 11:11:39 +0200
Message-Id: <20230523091139.21449-1-vbabka@suse.cz>
X-Mailer: git-send-email 2.40.1
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
Cc: Andrew Lunn <andrew@lunn.ch>, Rich Felker <dalias@libc.org>, linux-sh@vger.kernel.org, Tony Lindgren <tony@atomide.com>, Roman Gushchin <roman.gushchin@linux.dev>, "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>, linux-mm@kvack.org, sparclinux@vger.kernel.org, Hyeonggon Yoo <42.hyeyoo@gmail.com>, Anton Ivanov <anton.ivanov@cambridgegreys.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, Richard Weinberger <richard@nod.at>, Helge Deller <deller@gmx.de>, Vlastimil Babka <vbabka@suse.cz>, linux-snps-arc@lists.infradead.org, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Gregory Clement <gregory.clement@bootlin.com>, Sascha Hauer <s.hauer@pengutronix.de>, linux-um@lists.infradead.org, Vladimir Zapolskiy <vz@mleia.com>, linux-m68k@lists.linux-m68k.org, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, linux-tegra@vger.kernel.org, linux-omap@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>, linux-arm-kernel@lists.infradead.org, Qin Jian <q
 injian@cqplus1.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-mips@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Shawn Guo <shawnguo@kernel.org>, "David S . Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

As discussed at LSF/MM [1] [2] and with no objections raised there,
deprecate the SLAB allocator. Rename the user-visible option so that
users with CONFIG_SLAB=y get a new prompt with explanation during make
oldconfig, while make olddefconfig will just switch to SLUB.

In all defconfigs with CONFIG_SLAB=y remove the line so those also
switch to SLUB. Regressions due to the switch should be reported to
linux-mm and slab maintainers.

[1] https://lore.kernel.org/all/4b9fc9c6-b48c-198f-5f80-811a44737e5f@suse.cz/
[2] https://lwn.net/Articles/932201/

Signed-off-by: Vlastimil Babka <vbabka@suse.cz>
---
 arch/arc/configs/axs103_smp_defconfig           |  1 -
 arch/arc/configs/haps_hs_defconfig              |  1 -
 arch/arc/configs/haps_hs_smp_defconfig          |  1 -
 arch/arc/configs/hsdk_defconfig                 |  1 -
 arch/arc/configs/tb10x_defconfig                |  1 -
 arch/arm/configs/am200epdkit_defconfig          |  1 -
 arch/arm/configs/at91_dt_defconfig              |  1 -
 arch/arm/configs/dove_defconfig                 |  1 -
 arch/arm/configs/ep93xx_defconfig               |  1 -
 arch/arm/configs/imx_v4_v5_defconfig            |  1 -
 arch/arm/configs/lpc32xx_defconfig              |  1 -
 arch/arm/configs/mmp2_defconfig                 |  1 -
 arch/arm/configs/mvebu_v7_defconfig             |  1 -
 arch/arm/configs/nhk8815_defconfig              |  1 -
 arch/arm/configs/omap2plus_defconfig            |  1 -
 arch/arm/configs/pxa168_defconfig               |  1 -
 arch/arm/configs/pxa3xx_defconfig               |  1 -
 arch/arm/configs/pxa910_defconfig               |  1 -
 arch/arm/configs/realview_defconfig             |  1 -
 arch/arm/configs/rpc_defconfig                  |  1 -
 arch/arm/configs/sama5_defconfig                |  1 -
 arch/arm/configs/sama7_defconfig                |  1 -
 arch/arm/configs/shmobile_defconfig             |  1 -
 arch/arm/configs/sp7021_defconfig               |  1 -
 arch/arm/configs/tegra_defconfig                |  1 -
 arch/arm/configs/versatile_defconfig            |  1 -
 arch/m68k/configs/amiga_defconfig               |  1 -
 arch/m68k/configs/apollo_defconfig              |  1 -
 arch/m68k/configs/atari_defconfig               |  1 -
 arch/m68k/configs/bvme6000_defconfig            |  1 -
 arch/m68k/configs/hp300_defconfig               |  1 -
 arch/m68k/configs/mac_defconfig                 |  1 -
 arch/m68k/configs/multi_defconfig               |  1 -
 arch/m68k/configs/mvme147_defconfig             |  1 -
 arch/m68k/configs/mvme16x_defconfig             |  1 -
 arch/m68k/configs/q40_defconfig                 |  1 -
 arch/m68k/configs/sun3_defconfig                |  1 -
 arch/m68k/configs/sun3x_defconfig               |  1 -
 arch/microblaze/configs/mmu_defconfig           |  1 -
 arch/mips/configs/ar7_defconfig                 |  1 -
 arch/mips/configs/bcm47xx_defconfig             |  1 -
 arch/mips/configs/bigsur_defconfig              |  1 -
 arch/mips/configs/cavium_octeon_defconfig       |  1 -
 arch/mips/configs/ci20_defconfig                |  1 -
 arch/mips/configs/cu1000-neo_defconfig          |  1 -
 arch/mips/configs/cu1830-neo_defconfig          |  1 -
 arch/mips/configs/db1xxx_defconfig              |  1 -
 arch/mips/configs/decstation_64_defconfig       |  1 -
 arch/mips/configs/decstation_defconfig          |  1 -
 arch/mips/configs/decstation_r4k_defconfig      |  1 -
 arch/mips/configs/fuloong2e_defconfig           |  1 -
 arch/mips/configs/gpr_defconfig                 |  1 -
 arch/mips/configs/ip22_defconfig                |  1 -
 arch/mips/configs/ip27_defconfig                |  1 -
 arch/mips/configs/ip28_defconfig                |  1 -
 arch/mips/configs/ip32_defconfig                |  1 -
 arch/mips/configs/jazz_defconfig                |  1 -
 arch/mips/configs/malta_defconfig               |  1 -
 arch/mips/configs/malta_kvm_defconfig           |  1 -
 arch/mips/configs/malta_qemu_32r6_defconfig     |  1 -
 arch/mips/configs/maltaaprp_defconfig           |  1 -
 arch/mips/configs/maltasmvp_defconfig           |  1 -
 arch/mips/configs/maltasmvp_eva_defconfig       |  1 -
 arch/mips/configs/maltaup_defconfig             |  1 -
 arch/mips/configs/maltaup_xpa_defconfig         |  1 -
 arch/mips/configs/mtx1_defconfig                |  1 -
 arch/mips/configs/pic32mzda_defconfig           |  1 -
 arch/mips/configs/qi_lb60_defconfig             |  1 -
 arch/mips/configs/rb532_defconfig               |  1 -
 arch/mips/configs/rbtx49xx_defconfig            |  1 -
 arch/mips/configs/rm200_defconfig               |  1 -
 arch/mips/configs/rs90_defconfig                |  1 -
 arch/mips/configs/sb1250_swarm_defconfig        |  1 -
 arch/nios2/configs/10m50_defconfig              |  1 -
 arch/nios2/configs/3c120_defconfig              |  1 -
 arch/parisc/configs/generic-32bit_defconfig     |  1 -
 arch/powerpc/configs/40x/klondike_defconfig     |  1 -
 arch/powerpc/configs/52xx/pcm030_defconfig      |  1 -
 arch/powerpc/configs/83xx/kmeter1_defconfig     |  1 -
 arch/powerpc/configs/83xx/mpc837x_rdb_defconfig |  1 -
 arch/powerpc/configs/85xx/ge_imp3a_defconfig    |  1 -
 arch/powerpc/configs/ep8248e_defconfig          |  1 -
 arch/powerpc/configs/gamecube_defconfig         |  1 -
 arch/powerpc/configs/mgcoge_defconfig           |  1 -
 arch/powerpc/configs/mpc512x_defconfig          |  1 -
 arch/powerpc/configs/mpc83xx_defconfig          |  1 -
 arch/powerpc/configs/ps3_defconfig              |  1 -
 arch/powerpc/configs/wii_defconfig              |  1 -
 arch/sh/configs/ap325rxa_defconfig              |  1 -
 arch/sh/configs/apsh4a3a_defconfig              |  1 -
 arch/sh/configs/apsh4ad0a_defconfig             |  1 -
 arch/sh/configs/dreamcast_defconfig             |  1 -
 arch/sh/configs/ecovec24-romimage_defconfig     |  1 -
 arch/sh/configs/ecovec24_defconfig              |  1 -
 arch/sh/configs/espt_defconfig                  |  1 -
 arch/sh/configs/hp6xx_defconfig                 |  1 -
 arch/sh/configs/kfr2r09-romimage_defconfig      |  1 -
 arch/sh/configs/kfr2r09_defconfig               |  1 -
 arch/sh/configs/landisk_defconfig               |  1 -
 arch/sh/configs/lboxre2_defconfig               |  1 -
 arch/sh/configs/magicpanelr2_defconfig          |  1 -
 arch/sh/configs/microdev_defconfig              |  1 -
 arch/sh/configs/migor_defconfig                 |  1 -
 arch/sh/configs/polaris_defconfig               |  1 -
 arch/sh/configs/r7780mp_defconfig               |  1 -
 arch/sh/configs/r7785rp_defconfig               |  1 -
 arch/sh/configs/rsk7264_defconfig               |  1 -
 arch/sh/configs/rsk7269_defconfig               |  1 -
 arch/sh/configs/rts7751r2d1_defconfig           |  1 -
 arch/sh/configs/rts7751r2dplus_defconfig        |  1 -
 arch/sh/configs/sdk7786_defconfig               |  1 -
 arch/sh/configs/se7343_defconfig                |  1 -
 arch/sh/configs/se7619_defconfig                |  1 -
 arch/sh/configs/se7705_defconfig                |  1 -
 arch/sh/configs/se7712_defconfig                |  1 -
 arch/sh/configs/se7721_defconfig                |  1 -
 arch/sh/configs/se7724_defconfig                |  1 -
 arch/sh/configs/se7750_defconfig                |  1 -
 arch/sh/configs/se7751_defconfig                |  1 -
 arch/sh/configs/se7780_defconfig                |  1 -
 arch/sh/configs/secureedge5410_defconfig        |  1 -
 arch/sh/configs/sh03_defconfig                  |  1 -
 arch/sh/configs/sh2007_defconfig                |  1 -
 arch/sh/configs/sh7710voipgw_defconfig          |  1 -
 arch/sh/configs/sh7757lcr_defconfig             |  1 -
 arch/sh/configs/sh7763rdp_defconfig             |  1 -
 arch/sh/configs/sh7785lcr_32bit_defconfig       |  1 -
 arch/sh/configs/sh7785lcr_defconfig             |  1 -
 arch/sh/configs/titan_defconfig                 |  1 -
 arch/sh/configs/urquell_defconfig               |  1 -
 arch/sparc/configs/sparc32_defconfig            |  1 -
 arch/sparc/configs/sparc64_defconfig            |  1 -
 arch/um/configs/i386_defconfig                  |  1 -
 arch/um/configs/x86_64_defconfig                |  1 -
 kernel/configs/tiny.config                      |  1 -
 mm/Kconfig                                      | 16 ++++++++++++++--
 136 files changed, 14 insertions(+), 137 deletions(-)

diff --git a/arch/arc/configs/axs103_smp_defconfig b/arch/arc/configs/axs103_smp_defconfig
index 2f336d99a8cf..07c89281c2e3 100644
--- a/arch/arc/configs/axs103_smp_defconfig
+++ b/arch/arc/configs/axs103_smp_defconfig
@@ -13,7 +13,6 @@ CONFIG_EMBEDDED=y
 CONFIG_PERF_EVENTS=y
 # CONFIG_VM_EVENT_COUNTERS is not set
 # CONFIG_COMPAT_BRK is not set
-CONFIG_SLAB=y
 CONFIG_MODULES=y
 CONFIG_MODULE_FORCE_LOAD=y
 CONFIG_MODULE_UNLOAD=y
diff --git a/arch/arc/configs/haps_hs_defconfig b/arch/arc/configs/haps_hs_defconfig
index 899b2fd5c71d..8c3ed5d6e6c3 100644
--- a/arch/arc/configs/haps_hs_defconfig
+++ b/arch/arc/configs/haps_hs_defconfig
@@ -14,7 +14,6 @@ CONFIG_BLK_DEV_INITRD=y
 CONFIG_EXPERT=y
 CONFIG_PERF_EVENTS=y
 # CONFIG_COMPAT_BRK is not set
-CONFIG_SLAB=y
 CONFIG_ARC_BUILTIN_DTB_NAME="haps_hs"
 CONFIG_MODULES=y
 # CONFIG_BLK_DEV_BSG is not set
diff --git a/arch/arc/configs/haps_hs_smp_defconfig b/arch/arc/configs/haps_hs_smp_defconfig
index 0d32aac8069f..61107e8bac33 100644
--- a/arch/arc/configs/haps_hs_smp_defconfig
+++ b/arch/arc/configs/haps_hs_smp_defconfig
@@ -15,7 +15,6 @@ CONFIG_EMBEDDED=y
 CONFIG_PERF_EVENTS=y
 # CONFIG_VM_EVENT_COUNTERS is not set
 # CONFIG_COMPAT_BRK is not set
-CONFIG_SLAB=y
 CONFIG_SMP=y
 CONFIG_ARC_BUILTIN_DTB_NAME="haps_hs_idu"
 CONFIG_KPROBES=y
diff --git a/arch/arc/configs/hsdk_defconfig b/arch/arc/configs/hsdk_defconfig
index d18378d2c2a6..4ee2a1507b57 100644
--- a/arch/arc/configs/hsdk_defconfig
+++ b/arch/arc/configs/hsdk_defconfig
@@ -13,7 +13,6 @@ CONFIG_EMBEDDED=y
 CONFIG_PERF_EVENTS=y
 # CONFIG_VM_EVENT_COUNTERS is not set
 # CONFIG_COMPAT_BRK is not set
-CONFIG_SLAB=y
 CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
 CONFIG_ARC_SOC_HSDK=y
diff --git a/arch/arc/configs/tb10x_defconfig b/arch/arc/configs/tb10x_defconfig
index 6f0d2be9d926..941bbadd6bf2 100644
--- a/arch/arc/configs/tb10x_defconfig
+++ b/arch/arc/configs/tb10x_defconfig
@@ -19,7 +19,6 @@ CONFIG_KALLSYMS_ALL=y
 CONFIG_EMBEDDED=y
 # CONFIG_COMPAT_BRK is not set
 CONFIG_ISA_ARCOMPACT=y
-CONFIG_SLAB=y
 CONFIG_MODULES=y
 CONFIG_MODULE_FORCE_LOAD=y
 CONFIG_MODULE_UNLOAD=y
diff --git a/arch/arm/configs/am200epdkit_defconfig b/arch/arm/configs/am200epdkit_defconfig
index 3f633eaf9770..a25834e4c901 100644
--- a/arch/arm/configs/am200epdkit_defconfig
+++ b/arch/arm/configs/am200epdkit_defconfig
@@ -15,7 +15,6 @@ CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
 CONFIG_PARTITION_ADVANCED=y
 # CONFIG_SWAP is not set
-CONFIG_SLAB=y
 # CONFIG_VM_EVENT_COUNTERS is not set
 CONFIG_NET=y
 CONFIG_PACKET=m
diff --git a/arch/arm/configs/at91_dt_defconfig b/arch/arm/configs/at91_dt_defconfig
index 82bcf4dc7f54..8cc602853cc5 100644
--- a/arch/arm/configs/at91_dt_defconfig
+++ b/arch/arm/configs/at91_dt_defconfig
@@ -27,7 +27,6 @@ CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
 # CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS is not set
 # CONFIG_SWAP is not set
-CONFIG_SLAB=y
 CONFIG_NET=y
 CONFIG_PACKET=y
 CONFIG_UNIX=y
diff --git a/arch/arm/configs/dove_defconfig b/arch/arm/configs/dove_defconfig
index c8d559f38f48..46859e6fee5b 100644
--- a/arch/arm/configs/dove_defconfig
+++ b/arch/arm/configs/dove_defconfig
@@ -17,7 +17,6 @@ CONFIG_VFP=y
 CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
 CONFIG_PARTITION_ADVANCED=y
-CONFIG_SLAB=y
 CONFIG_NET=y
 CONFIG_PACKET=y
 CONFIG_UNIX=y
diff --git a/arch/arm/configs/ep93xx_defconfig b/arch/arm/configs/ep93xx_defconfig
index 3154125321c5..44e89a980d29 100644
--- a/arch/arm/configs/ep93xx_defconfig
+++ b/arch/arm/configs/ep93xx_defconfig
@@ -24,7 +24,6 @@ CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
 CONFIG_MODULE_FORCE_UNLOAD=y
 CONFIG_PARTITION_ADVANCED=y
-CONFIG_SLAB=y
 CONFIG_NET=y
 CONFIG_PACKET=y
 CONFIG_UNIX=y
diff --git a/arch/arm/configs/imx_v4_v5_defconfig b/arch/arm/configs/imx_v4_v5_defconfig
index c9a602aee715..ec45e6225225 100644
--- a/arch/arm/configs/imx_v4_v5_defconfig
+++ b/arch/arm/configs/imx_v4_v5_defconfig
@@ -26,7 +26,6 @@ CONFIG_KPROBES=y
 CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
 # CONFIG_SWAP is not set
-CONFIG_SLAB=y
 # CONFIG_COMPAT_BRK is not set
 CONFIG_NET=y
 CONFIG_PACKET=y
diff --git a/arch/arm/configs/lpc32xx_defconfig b/arch/arm/configs/lpc32xx_defconfig
index fabb66a53350..d7df0486850f 100644
--- a/arch/arm/configs/lpc32xx_defconfig
+++ b/arch/arm/configs/lpc32xx_defconfig
@@ -23,7 +23,6 @@ CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
 CONFIG_PARTITION_ADVANCED=y
 # CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS is not set
-CONFIG_SLAB=y
 CONFIG_NET=y
 CONFIG_PACKET=y
 CONFIG_UNIX=y
diff --git a/arch/arm/configs/mmp2_defconfig b/arch/arm/configs/mmp2_defconfig
index 7984640e994e..3d1d6f3b592a 100644
--- a/arch/arm/configs/mmp2_defconfig
+++ b/arch/arm/configs/mmp2_defconfig
@@ -12,7 +12,6 @@ CONFIG_VFP=y
 CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
 CONFIG_MODULE_FORCE_UNLOAD=y
-CONFIG_SLAB=y
 CONFIG_NET=y
 CONFIG_PACKET=y
 CONFIG_UNIX=y
diff --git a/arch/arm/configs/mvebu_v7_defconfig b/arch/arm/configs/mvebu_v7_defconfig
index 68a18264f31b..2d2a4dc8f379 100644
--- a/arch/arm/configs/mvebu_v7_defconfig
+++ b/arch/arm/configs/mvebu_v7_defconfig
@@ -23,7 +23,6 @@ CONFIG_VFP=y
 CONFIG_NEON=y
 CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
-CONFIG_SLAB=y
 # CONFIG_COMPACTION is not set
 CONFIG_NET=y
 CONFIG_PACKET=y
diff --git a/arch/arm/configs/nhk8815_defconfig b/arch/arm/configs/nhk8815_defconfig
index 4171dafddc0a..ea28ed8991b4 100644
--- a/arch/arm/configs/nhk8815_defconfig
+++ b/arch/arm/configs/nhk8815_defconfig
@@ -16,7 +16,6 @@ CONFIG_AEABI=y
 CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
 # CONFIG_SWAP is not set
-CONFIG_SLAB=y
 CONFIG_CMA=y
 CONFIG_NET=y
 CONFIG_PACKET=y
diff --git a/arch/arm/configs/omap2plus_defconfig b/arch/arm/configs/omap2plus_defconfig
index c4216c552100..9bd36dd39bd0 100644
--- a/arch/arm/configs/omap2plus_defconfig
+++ b/arch/arm/configs/omap2plus_defconfig
@@ -62,7 +62,6 @@ CONFIG_MODVERSIONS=y
 CONFIG_MODULE_SRCVERSION_ALL=y
 CONFIG_PARTITION_ADVANCED=y
 CONFIG_BINFMT_MISC=y
-CONFIG_SLAB=y
 CONFIG_CMA=y
 CONFIG_ZSMALLOC=m
 CONFIG_NET=y
diff --git a/arch/arm/configs/pxa168_defconfig b/arch/arm/configs/pxa168_defconfig
index 8422ddc9bab2..ec3a43f9c85e 100644
--- a/arch/arm/configs/pxa168_defconfig
+++ b/arch/arm/configs/pxa168_defconfig
@@ -12,7 +12,6 @@ CONFIG_FPE_NWFPE=y
 CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
 CONFIG_MODULE_FORCE_UNLOAD=y
-CONFIG_SLAB=y
 CONFIG_NET=y
 CONFIG_PACKET=y
 CONFIG_UNIX=y
diff --git a/arch/arm/configs/pxa3xx_defconfig b/arch/arm/configs/pxa3xx_defconfig
index d1e83b52e03a..7f95fa273a7d 100644
--- a/arch/arm/configs/pxa3xx_defconfig
+++ b/arch/arm/configs/pxa3xx_defconfig
@@ -12,7 +12,6 @@ CONFIG_AEABI=y
 CONFIG_CMDLINE="root=/dev/nfs rootfstype=nfs nfsroot=192.168.1.100:/nfsroot/ ip=192.168.1.101:192.168.1.100::255.255.255.0::eth0:on console=ttyS0,115200 mem=64M debug"
 CONFIG_FPE_NWFPE=y
 CONFIG_MODULES=y
-CONFIG_SLAB=y
 CONFIG_NET=y
 CONFIG_PACKET=y
 CONFIG_UNIX=y
diff --git a/arch/arm/configs/pxa910_defconfig b/arch/arm/configs/pxa910_defconfig
index 48e41ca582af..958d958377dc 100644
--- a/arch/arm/configs/pxa910_defconfig
+++ b/arch/arm/configs/pxa910_defconfig
@@ -13,7 +13,6 @@ CONFIG_MODULE_FORCE_UNLOAD=y
 # CONFIG_BLK_DEV_BSG is not set
 CONFIG_AEABI=y
 CONFIG_FPE_NWFPE=y
-CONFIG_SLAB=y
 CONFIG_NET=y
 CONFIG_PACKET=y
 CONFIG_UNIX=y
diff --git a/arch/arm/configs/realview_defconfig b/arch/arm/configs/realview_defconfig
index 92f803c2805c..a221a99f6472 100644
--- a/arch/arm/configs/realview_defconfig
+++ b/arch/arm/configs/realview_defconfig
@@ -20,7 +20,6 @@ CONFIG_VFP=y
 CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
 # CONFIG_SWAP is not set
-CONFIG_SLAB=y
 CONFIG_CMA=y
 CONFIG_NET=y
 CONFIG_PACKET=y
diff --git a/arch/arm/configs/rpc_defconfig b/arch/arm/configs/rpc_defconfig
index 210974364d61..65a3fded55be 100644
--- a/arch/arm/configs/rpc_defconfig
+++ b/arch/arm/configs/rpc_defconfig
@@ -11,7 +11,6 @@ CONFIG_CPU_SA110=y
 CONFIG_FPE_NWFPE=y
 CONFIG_PARTITION_ADVANCED=y
 CONFIG_BSD_DISKLABEL=y
-CONFIG_SLAB=y
 CONFIG_NET=y
 CONFIG_PACKET=y
 CONFIG_UNIX=y
diff --git a/arch/arm/configs/sama5_defconfig b/arch/arm/configs/sama5_defconfig
index c6aff6fb084d..56ee511210de 100644
--- a/arch/arm/configs/sama5_defconfig
+++ b/arch/arm/configs/sama5_defconfig
@@ -26,7 +26,6 @@ CONFIG_MODULE_UNLOAD=y
 CONFIG_MODULE_FORCE_UNLOAD=y
 # CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS is not set
 # CONFIG_SWAP is not set
-CONFIG_SLAB=y
 CONFIG_NET=y
 CONFIG_PACKET=y
 CONFIG_UNIX=y
diff --git a/arch/arm/configs/sama7_defconfig b/arch/arm/configs/sama7_defconfig
index 954112041403..a89767c89d17 100644
--- a/arch/arm/configs/sama7_defconfig
+++ b/arch/arm/configs/sama7_defconfig
@@ -41,7 +41,6 @@ CONFIG_PARTITION_ADVANCED=y
 # CONFIG_EFI_PARTITION is not set
 # CONFIG_COREDUMP is not set
 # CONFIG_SWAP is not set
-CONFIG_SLAB=y
 # CONFIG_COMPACTION is not set
 CONFIG_CMA=y
 # CONFIG_VM_EVENT_COUNTERS is not set
diff --git a/arch/arm/configs/shmobile_defconfig b/arch/arm/configs/shmobile_defconfig
index 0b21c0a47582..1b08c94e541d 100644
--- a/arch/arm/configs/shmobile_defconfig
+++ b/arch/arm/configs/shmobile_defconfig
@@ -24,7 +24,6 @@ CONFIG_CPUFREQ_DT=y
 CONFIG_VFP=y
 CONFIG_NEON=y
 # CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS is not set
-CONFIG_SLAB=y
 CONFIG_CMA=y
 CONFIG_NET=y
 CONFIG_PACKET=y
diff --git a/arch/arm/configs/sp7021_defconfig b/arch/arm/configs/sp7021_defconfig
index c6448ac860b6..ec723401b440 100644
--- a/arch/arm/configs/sp7021_defconfig
+++ b/arch/arm/configs/sp7021_defconfig
@@ -24,7 +24,6 @@ CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
 CONFIG_MODVERSIONS=y
 # CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS is not set
-CONFIG_SLAB=y
 CONFIG_UEVENT_HELPER=y
 CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
 CONFIG_DEVTMPFS=y
diff --git a/arch/arm/configs/tegra_defconfig b/arch/arm/configs/tegra_defconfig
index f32047e24b63..3c6af935e932 100644
--- a/arch/arm/configs/tegra_defconfig
+++ b/arch/arm/configs/tegra_defconfig
@@ -32,7 +32,6 @@ CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
 CONFIG_MODULE_FORCE_UNLOAD=y
 CONFIG_PARTITION_ADVANCED=y
-CONFIG_SLAB=y
 CONFIG_CMA=y
 CONFIG_NET=y
 CONFIG_PACKET=y
diff --git a/arch/arm/configs/versatile_defconfig b/arch/arm/configs/versatile_defconfig
index 67e3f9138306..849118cbbb44 100644
--- a/arch/arm/configs/versatile_defconfig
+++ b/arch/arm/configs/versatile_defconfig
@@ -14,7 +14,6 @@ CONFIG_VFP=y
 CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
 CONFIG_PARTITION_ADVANCED=y
-CONFIG_SLAB=y
 CONFIG_CMA=y
 CONFIG_NET=y
 CONFIG_PACKET=y
diff --git a/arch/m68k/configs/amiga_defconfig b/arch/m68k/configs/amiga_defconfig
index b26469a65bc1..e9f364b7f743 100644
--- a/arch/m68k/configs/amiga_defconfig
+++ b/arch/m68k/configs/amiga_defconfig
@@ -41,7 +41,6 @@ CONFIG_MQ_IOSCHED_KYBER=m
 CONFIG_IOSCHED_BFQ=m
 # CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS is not set
 CONFIG_BINFMT_MISC=m
-CONFIG_SLAB=y
 # CONFIG_COMPACTION is not set
 CONFIG_USERFAULTFD=y
 CONFIG_NET=y
diff --git a/arch/m68k/configs/apollo_defconfig b/arch/m68k/configs/apollo_defconfig
index 944a49a129be..fc1d2e5e35d7 100644
--- a/arch/m68k/configs/apollo_defconfig
+++ b/arch/m68k/configs/apollo_defconfig
@@ -37,7 +37,6 @@ CONFIG_MQ_IOSCHED_KYBER=m
 CONFIG_IOSCHED_BFQ=m
 # CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS is not set
 CONFIG_BINFMT_MISC=m
-CONFIG_SLAB=y
 # CONFIG_COMPACTION is not set
 CONFIG_USERFAULTFD=y
 CONFIG_NET=y
diff --git a/arch/m68k/configs/atari_defconfig b/arch/m68k/configs/atari_defconfig
index a32dd884fcce..c8d87c450804 100644
--- a/arch/m68k/configs/atari_defconfig
+++ b/arch/m68k/configs/atari_defconfig
@@ -44,7 +44,6 @@ CONFIG_MQ_IOSCHED_KYBER=m
 CONFIG_IOSCHED_BFQ=m
 # CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS is not set
 CONFIG_BINFMT_MISC=m
-CONFIG_SLAB=y
 # CONFIG_COMPACTION is not set
 CONFIG_USERFAULTFD=y
 CONFIG_NET=y
diff --git a/arch/m68k/configs/bvme6000_defconfig b/arch/m68k/configs/bvme6000_defconfig
index 23b7805309bd..df174677145d 100644
--- a/arch/m68k/configs/bvme6000_defconfig
+++ b/arch/m68k/configs/bvme6000_defconfig
@@ -34,7 +34,6 @@ CONFIG_MQ_IOSCHED_KYBER=m
 CONFIG_IOSCHED_BFQ=m
 # CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS is not set
 CONFIG_BINFMT_MISC=m
-CONFIG_SLAB=y
 # CONFIG_COMPACTION is not set
 CONFIG_USERFAULTFD=y
 CONFIG_NET=y
diff --git a/arch/m68k/configs/hp300_defconfig b/arch/m68k/configs/hp300_defconfig
index 5605ab5c3dcf..c944c3e2697a 100644
--- a/arch/m68k/configs/hp300_defconfig
+++ b/arch/m68k/configs/hp300_defconfig
@@ -36,7 +36,6 @@ CONFIG_MQ_IOSCHED_KYBER=m
 CONFIG_IOSCHED_BFQ=m
 # CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS is not set
 CONFIG_BINFMT_MISC=m
-CONFIG_SLAB=y
 # CONFIG_COMPACTION is not set
 CONFIG_USERFAULTFD=y
 CONFIG_NET=y
diff --git a/arch/m68k/configs/mac_defconfig b/arch/m68k/configs/mac_defconfig
index d0d1f9c33756..8a3ef860d30d 100644
--- a/arch/m68k/configs/mac_defconfig
+++ b/arch/m68k/configs/mac_defconfig
@@ -35,7 +35,6 @@ CONFIG_MQ_IOSCHED_KYBER=m
 CONFIG_IOSCHED_BFQ=m
 # CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS is not set
 CONFIG_BINFMT_MISC=m
-CONFIG_SLAB=y
 # CONFIG_COMPACTION is not set
 CONFIG_USERFAULTFD=y
 CONFIG_NET=y
diff --git a/arch/m68k/configs/multi_defconfig b/arch/m68k/configs/multi_defconfig
index 6d04314ce7ea..4cb49c77b66d 100644
--- a/arch/m68k/configs/multi_defconfig
+++ b/arch/m68k/configs/multi_defconfig
@@ -55,7 +55,6 @@ CONFIG_MQ_IOSCHED_KYBER=m
 CONFIG_IOSCHED_BFQ=m
 # CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS is not set
 CONFIG_BINFMT_MISC=m
-CONFIG_SLAB=y
 # CONFIG_COMPACTION is not set
 CONFIG_USERFAULTFD=y
 CONFIG_NET=y
diff --git a/arch/m68k/configs/mvme147_defconfig b/arch/m68k/configs/mvme147_defconfig
index e6f5ae526d08..59ee60ec1911 100644
--- a/arch/m68k/configs/mvme147_defconfig
+++ b/arch/m68k/configs/mvme147_defconfig
@@ -33,7 +33,6 @@ CONFIG_MQ_IOSCHED_KYBER=m
 CONFIG_IOSCHED_BFQ=m
 # CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS is not set
 CONFIG_BINFMT_MISC=m
-CONFIG_SLAB=y
 # CONFIG_COMPACTION is not set
 CONFIG_USERFAULTFD=y
 CONFIG_NET=y
diff --git a/arch/m68k/configs/mvme16x_defconfig b/arch/m68k/configs/mvme16x_defconfig
index f2d4dff4787a..cf6aff2cfbe6 100644
--- a/arch/m68k/configs/mvme16x_defconfig
+++ b/arch/m68k/configs/mvme16x_defconfig
@@ -34,7 +34,6 @@ CONFIG_MQ_IOSCHED_KYBER=m
 CONFIG_IOSCHED_BFQ=m
 # CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS is not set
 CONFIG_BINFMT_MISC=m
-CONFIG_SLAB=y
 # CONFIG_COMPACTION is not set
 CONFIG_USERFAULTFD=y
 CONFIG_NET=y
diff --git a/arch/m68k/configs/q40_defconfig b/arch/m68k/configs/q40_defconfig
index 907eedecd040..b04de348ebb1 100644
--- a/arch/m68k/configs/q40_defconfig
+++ b/arch/m68k/configs/q40_defconfig
@@ -35,7 +35,6 @@ CONFIG_MQ_IOSCHED_KYBER=m
 CONFIG_IOSCHED_BFQ=m
 # CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS is not set
 CONFIG_BINFMT_MISC=m
-CONFIG_SLAB=y
 # CONFIG_COMPACTION is not set
 CONFIG_USERFAULTFD=y
 CONFIG_NET=y
diff --git a/arch/m68k/configs/sun3_defconfig b/arch/m68k/configs/sun3_defconfig
index 9e3d47008f21..1a5532598ee6 100644
--- a/arch/m68k/configs/sun3_defconfig
+++ b/arch/m68k/configs/sun3_defconfig
@@ -31,7 +31,6 @@ CONFIG_MQ_IOSCHED_KYBER=m
 CONFIG_IOSCHED_BFQ=m
 # CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS is not set
 CONFIG_BINFMT_MISC=m
-CONFIG_SLAB=y
 # CONFIG_COMPACTION is not set
 CONFIG_USERFAULTFD=y
 CONFIG_NET=y
diff --git a/arch/m68k/configs/sun3x_defconfig b/arch/m68k/configs/sun3x_defconfig
index f6540078cb4b..4e606dc8ec17 100644
--- a/arch/m68k/configs/sun3x_defconfig
+++ b/arch/m68k/configs/sun3x_defconfig
@@ -31,7 +31,6 @@ CONFIG_MQ_IOSCHED_KYBER=m
 CONFIG_IOSCHED_BFQ=m
 # CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS is not set
 CONFIG_BINFMT_MISC=m
-CONFIG_SLAB=y
 # CONFIG_COMPACTION is not set
 CONFIG_USERFAULTFD=y
 CONFIG_NET=y
diff --git a/arch/microblaze/configs/mmu_defconfig b/arch/microblaze/configs/mmu_defconfig
index 756feb9369a6..38dcdce367ec 100644
--- a/arch/microblaze/configs/mmu_defconfig
+++ b/arch/microblaze/configs/mmu_defconfig
@@ -8,7 +8,6 @@ CONFIG_SYSFS_DEPRECATED_V2=y
 # CONFIG_BASE_FULL is not set
 CONFIG_KALLSYMS_ALL=y
 CONFIG_EMBEDDED=y
-CONFIG_SLAB=y
 CONFIG_XILINX_MICROBLAZE0_USE_MSR_INSTR=1
 CONFIG_XILINX_MICROBLAZE0_USE_PCMP_INSTR=1
 CONFIG_XILINX_MICROBLAZE0_USE_BARREL=1
diff --git a/arch/mips/configs/ar7_defconfig b/arch/mips/configs/ar7_defconfig
index ed4a6388791e..329c60aa570a 100644
--- a/arch/mips/configs/ar7_defconfig
+++ b/arch/mips/configs/ar7_defconfig
@@ -11,7 +11,6 @@ CONFIG_EXPERT=y
 # CONFIG_KALLSYMS is not set
 # CONFIG_VM_EVENT_COUNTERS is not set
 # CONFIG_COMPAT_BRK is not set
-CONFIG_SLAB=y
 CONFIG_AR7=y
 CONFIG_HZ_100=y
 CONFIG_KEXEC=y
diff --git a/arch/mips/configs/bcm47xx_defconfig b/arch/mips/configs/bcm47xx_defconfig
index 22ffde722bb9..62c462a23edc 100644
--- a/arch/mips/configs/bcm47xx_defconfig
+++ b/arch/mips/configs/bcm47xx_defconfig
@@ -3,7 +3,6 @@ CONFIG_HIGH_RES_TIMERS=y
 CONFIG_BLK_DEV_INITRD=y
 CONFIG_CC_OPTIMIZE_FOR_SIZE=y
 CONFIG_EMBEDDED=y
-CONFIG_SLAB=y
 CONFIG_BCM47XX=y
 CONFIG_PCI=y
 # CONFIG_SUSPEND is not set
diff --git a/arch/mips/configs/bigsur_defconfig b/arch/mips/configs/bigsur_defconfig
index d15961f00ece..b0cbfa781ffc 100644
--- a/arch/mips/configs/bigsur_defconfig
+++ b/arch/mips/configs/bigsur_defconfig
@@ -17,7 +17,6 @@ CONFIG_USER_NS=y
 CONFIG_RELAY=y
 CONFIG_BLK_DEV_INITRD=y
 CONFIG_EXPERT=y
-CONFIG_SLAB=y
 CONFIG_SIBYTE_BIGSUR=y
 CONFIG_64BIT=y
 CONFIG_SMP=y
diff --git a/arch/mips/configs/cavium_octeon_defconfig b/arch/mips/configs/cavium_octeon_defconfig
index 0bc2e3cc573b..f523ee6f25bf 100644
--- a/arch/mips/configs/cavium_octeon_defconfig
+++ b/arch/mips/configs/cavium_octeon_defconfig
@@ -9,7 +9,6 @@ CONFIG_LOG_BUF_SHIFT=14
 CONFIG_RELAY=y
 CONFIG_BLK_DEV_INITRD=y
 CONFIG_EXPERT=y
-CONFIG_SLAB=y
 CONFIG_CAVIUM_OCTEON_SOC=y
 CONFIG_CAVIUM_CN63XXP1=y
 CONFIG_CAVIUM_OCTEON_CVMSEG_SIZE=2
diff --git a/arch/mips/configs/ci20_defconfig b/arch/mips/configs/ci20_defconfig
index 11f08b6a3013..28eb15a1ffc4 100644
--- a/arch/mips/configs/ci20_defconfig
+++ b/arch/mips/configs/ci20_defconfig
@@ -21,7 +21,6 @@ CONFIG_KALLSYMS_ALL=y
 CONFIG_EMBEDDED=y
 # CONFIG_VM_EVENT_COUNTERS is not set
 # CONFIG_COMPAT_BRK is not set
-CONFIG_SLAB=y
 CONFIG_MACH_INGENIC_SOC=y
 CONFIG_JZ4780_CI20=y
 CONFIG_HIGHMEM=y
diff --git a/arch/mips/configs/cu1000-neo_defconfig b/arch/mips/configs/cu1000-neo_defconfig
index 1cbc9302e1d1..afe39ce7568e 100644
--- a/arch/mips/configs/cu1000-neo_defconfig
+++ b/arch/mips/configs/cu1000-neo_defconfig
@@ -18,7 +18,6 @@ CONFIG_KALLSYMS_ALL=y
 CONFIG_EMBEDDED=y
 # CONFIG_VM_EVENT_COUNTERS is not set
 # CONFIG_COMPAT_BRK is not set
-CONFIG_SLAB=y
 CONFIG_MACH_INGENIC_SOC=y
 CONFIG_X1000_CU1000_NEO=y
 CONFIG_HIGHMEM=y
diff --git a/arch/mips/configs/cu1830-neo_defconfig b/arch/mips/configs/cu1830-neo_defconfig
index a0f73f3cd6ce..347c9fd1c21d 100644
--- a/arch/mips/configs/cu1830-neo_defconfig
+++ b/arch/mips/configs/cu1830-neo_defconfig
@@ -18,7 +18,6 @@ CONFIG_KALLSYMS_ALL=y
 CONFIG_EMBEDDED=y
 # CONFIG_VM_EVENT_COUNTERS is not set
 # CONFIG_COMPAT_BRK is not set
-CONFIG_SLAB=y
 CONFIG_MACH_INGENIC_SOC=y
 CONFIG_X1830_CU1830_NEO=y
 CONFIG_HIGHMEM=y
diff --git a/arch/mips/configs/db1xxx_defconfig b/arch/mips/configs/db1xxx_defconfig
index af070be1b583..08d29b56e175 100644
--- a/arch/mips/configs/db1xxx_defconfig
+++ b/arch/mips/configs/db1xxx_defconfig
@@ -18,7 +18,6 @@ CONFIG_CGROUP_DEVICE=y
 CONFIG_CGROUP_CPUACCT=y
 CONFIG_KALLSYMS_ALL=y
 CONFIG_EMBEDDED=y
-CONFIG_SLAB=y
 CONFIG_MIPS_ALCHEMY=y
 CONFIG_HZ_100=y
 CONFIG_PCI=y
diff --git a/arch/mips/configs/decstation_64_defconfig b/arch/mips/configs/decstation_64_defconfig
index 49ec1575234e..92a1d0aea38c 100644
--- a/arch/mips/configs/decstation_64_defconfig
+++ b/arch/mips/configs/decstation_64_defconfig
@@ -9,7 +9,6 @@ CONFIG_EXPERT=y
 # CONFIG_SYSFS_SYSCALL is not set
 CONFIG_BPF_SYSCALL=y
 # CONFIG_COMPAT_BRK is not set
-CONFIG_SLAB=y
 CONFIG_MACH_DECSTATION=y
 CONFIG_64BIT=y
 CONFIG_PAGE_SIZE_16KB=y
diff --git a/arch/mips/configs/decstation_defconfig b/arch/mips/configs/decstation_defconfig
index 5cec4c096e2c..db214fcebcbe 100644
--- a/arch/mips/configs/decstation_defconfig
+++ b/arch/mips/configs/decstation_defconfig
@@ -9,7 +9,6 @@ CONFIG_EXPERT=y
 # CONFIG_SYSFS_SYSCALL is not set
 CONFIG_BPF_SYSCALL=y
 # CONFIG_COMPAT_BRK is not set
-CONFIG_SLAB=y
 CONFIG_MACH_DECSTATION=y
 CONFIG_CPU_R3000=y
 CONFIG_TC=y
diff --git a/arch/mips/configs/decstation_r4k_defconfig b/arch/mips/configs/decstation_r4k_defconfig
index af37e26d9b5b..15b769e96d5b 100644
--- a/arch/mips/configs/decstation_r4k_defconfig
+++ b/arch/mips/configs/decstation_r4k_defconfig
@@ -9,7 +9,6 @@ CONFIG_EXPERT=y
 # CONFIG_SYSFS_SYSCALL is not set
 CONFIG_BPF_SYSCALL=y
 # CONFIG_COMPAT_BRK is not set
-CONFIG_SLAB=y
 CONFIG_MACH_DECSTATION=y
 CONFIG_TC=y
 # CONFIG_SUSPEND is not set
diff --git a/arch/mips/configs/fuloong2e_defconfig b/arch/mips/configs/fuloong2e_defconfig
index 843d6a5a4f61..5458573286a2 100644
--- a/arch/mips/configs/fuloong2e_defconfig
+++ b/arch/mips/configs/fuloong2e_defconfig
@@ -13,7 +13,6 @@ CONFIG_NAMESPACES=y
 CONFIG_USER_NS=y
 CONFIG_EXPERT=y
 # CONFIG_COMPAT_BRK is not set
-CONFIG_SLAB=y
 CONFIG_PROFILING=y
 CONFIG_MACH_LOONGSON2EF=y
 CONFIG_PCI=y
diff --git a/arch/mips/configs/gpr_defconfig b/arch/mips/configs/gpr_defconfig
index eb755650f821..92fc0edbac47 100644
--- a/arch/mips/configs/gpr_defconfig
+++ b/arch/mips/configs/gpr_defconfig
@@ -8,7 +8,6 @@ CONFIG_BSD_PROCESS_ACCT_V3=y
 CONFIG_RELAY=y
 CONFIG_BLK_DEV_INITRD=y
 CONFIG_EXPERT=y
-CONFIG_SLAB=y
 CONFIG_PROFILING=y
 CONFIG_MIPS_ALCHEMY=y
 CONFIG_MIPS_GPR=y
diff --git a/arch/mips/configs/ip22_defconfig b/arch/mips/configs/ip22_defconfig
index 13df29901237..897e55579af0 100644
--- a/arch/mips/configs/ip22_defconfig
+++ b/arch/mips/configs/ip22_defconfig
@@ -10,7 +10,6 @@ CONFIG_USER_NS=y
 CONFIG_RELAY=y
 CONFIG_EXPERT=y
 # CONFIG_COMPAT_BRK is not set
-CONFIG_SLAB=y
 CONFIG_SGI_IP22=y
 CONFIG_ARC_CONSOLE=y
 CONFIG_CPU_R5000=y
diff --git a/arch/mips/configs/ip27_defconfig b/arch/mips/configs/ip27_defconfig
index 3e86f8106ba0..b51f738a39a0 100644
--- a/arch/mips/configs/ip27_defconfig
+++ b/arch/mips/configs/ip27_defconfig
@@ -9,7 +9,6 @@ CONFIG_CGROUPS=y
 CONFIG_CPUSETS=y
 CONFIG_RELAY=y
 CONFIG_EXPERT=y
-CONFIG_SLAB=y
 CONFIG_SGI_IP27=y
 CONFIG_NUMA=y
 CONFIG_SMP=y
diff --git a/arch/mips/configs/ip28_defconfig b/arch/mips/configs/ip28_defconfig
index ba13eea0509f..e0040110a3ee 100644
--- a/arch/mips/configs/ip28_defconfig
+++ b/arch/mips/configs/ip28_defconfig
@@ -5,7 +5,6 @@ CONFIG_IKCONFIG_PROC=y
 CONFIG_LOG_BUF_SHIFT=14
 CONFIG_RELAY=y
 CONFIG_EXPERT=y
-CONFIG_SLAB=y
 CONFIG_SGI_IP28=y
 CONFIG_ARC_CONSOLE=y
 CONFIG_EISA=y
diff --git a/arch/mips/configs/ip32_defconfig b/arch/mips/configs/ip32_defconfig
index 8ced2224c328..418a4181e2fe 100644
--- a/arch/mips/configs/ip32_defconfig
+++ b/arch/mips/configs/ip32_defconfig
@@ -7,7 +7,6 @@ CONFIG_IKCONFIG_PROC=y
 CONFIG_LOG_BUF_SHIFT=14
 CONFIG_RELAY=y
 CONFIG_EXPERT=y
-CONFIG_SLAB=y
 CONFIG_PROFILING=y
 CONFIG_SGI_IP32=y
 # CONFIG_SECCOMP is not set
diff --git a/arch/mips/configs/jazz_defconfig b/arch/mips/configs/jazz_defconfig
index 106b21cb677f..6b5d7e963ed9 100644
--- a/arch/mips/configs/jazz_defconfig
+++ b/arch/mips/configs/jazz_defconfig
@@ -7,7 +7,6 @@ CONFIG_BSD_PROCESS_ACCT=y
 CONFIG_LOG_BUF_SHIFT=14
 CONFIG_RELAY=y
 CONFIG_EXPERT=y
-CONFIG_SLAB=y
 CONFIG_MACH_JAZZ=y
 CONFIG_OLIVETTI_M700=y
 CONFIG_MIPS_MAGNUM_4000=y
diff --git a/arch/mips/configs/malta_defconfig b/arch/mips/configs/malta_defconfig
index 265d38dffbf6..743209047792 100644
--- a/arch/mips/configs/malta_defconfig
+++ b/arch/mips/configs/malta_defconfig
@@ -7,7 +7,6 @@ CONFIG_RELAY=y
 CONFIG_BLK_DEV_INITRD=y
 CONFIG_EXPERT=y
 # CONFIG_COMPAT_BRK is not set
-CONFIG_SLAB=y
 CONFIG_MIPS_MALTA=y
 CONFIG_CPU_LITTLE_ENDIAN=y
 CONFIG_CPU_MIPS32_R2=y
diff --git a/arch/mips/configs/malta_kvm_defconfig b/arch/mips/configs/malta_kvm_defconfig
index 1d2b248c7cd3..dd2b9c181f32 100644
--- a/arch/mips/configs/malta_kvm_defconfig
+++ b/arch/mips/configs/malta_kvm_defconfig
@@ -7,7 +7,6 @@ CONFIG_RELAY=y
 CONFIG_EXPERT=y
 CONFIG_PERF_EVENTS=y
 # CONFIG_COMPAT_BRK is not set
-CONFIG_SLAB=y
 CONFIG_MIPS_MALTA=y
 CONFIG_CPU_LITTLE_ENDIAN=y
 CONFIG_CPU_MIPS32_R2=y
diff --git a/arch/mips/configs/malta_qemu_32r6_defconfig b/arch/mips/configs/malta_qemu_32r6_defconfig
index fd63a2b152f6..82183ec6bc31 100644
--- a/arch/mips/configs/malta_qemu_32r6_defconfig
+++ b/arch/mips/configs/malta_qemu_32r6_defconfig
@@ -6,7 +6,6 @@ CONFIG_IKCONFIG=y
 CONFIG_IKCONFIG_PROC=y
 CONFIG_LOG_BUF_SHIFT=15
 CONFIG_EMBEDDED=y
-CONFIG_SLAB=y
 CONFIG_MIPS_MALTA=y
 CONFIG_CPU_LITTLE_ENDIAN=y
 CONFIG_CPU_MIPS32_R6=y
diff --git a/arch/mips/configs/maltaaprp_defconfig b/arch/mips/configs/maltaaprp_defconfig
index 1f07e354c954..9a199867a5e7 100644
--- a/arch/mips/configs/maltaaprp_defconfig
+++ b/arch/mips/configs/maltaaprp_defconfig
@@ -6,7 +6,6 @@ CONFIG_IKCONFIG=y
 CONFIG_IKCONFIG_PROC=y
 CONFIG_LOG_BUF_SHIFT=15
 CONFIG_EMBEDDED=y
-CONFIG_SLAB=y
 CONFIG_MIPS_MALTA=y
 CONFIG_CPU_LITTLE_ENDIAN=y
 CONFIG_CPU_MIPS32_R2=y
diff --git a/arch/mips/configs/maltasmvp_defconfig b/arch/mips/configs/maltasmvp_defconfig
index 5cd3eca236de..e5502d66a474 100644
--- a/arch/mips/configs/maltasmvp_defconfig
+++ b/arch/mips/configs/maltasmvp_defconfig
@@ -6,7 +6,6 @@ CONFIG_IKCONFIG=y
 CONFIG_IKCONFIG_PROC=y
 CONFIG_LOG_BUF_SHIFT=15
 CONFIG_EMBEDDED=y
-CONFIG_SLAB=y
 CONFIG_MIPS_MALTA=y
 CONFIG_CPU_LITTLE_ENDIAN=y
 CONFIG_CPU_MIPS32_R2=y
diff --git a/arch/mips/configs/maltasmvp_eva_defconfig b/arch/mips/configs/maltasmvp_eva_defconfig
index 45688e742a15..a378aad97138 100644
--- a/arch/mips/configs/maltasmvp_eva_defconfig
+++ b/arch/mips/configs/maltasmvp_eva_defconfig
@@ -6,7 +6,6 @@ CONFIG_IKCONFIG=y
 CONFIG_IKCONFIG_PROC=y
 CONFIG_LOG_BUF_SHIFT=15
 CONFIG_EMBEDDED=y
-CONFIG_SLAB=y
 CONFIG_MIPS_MALTA=y
 CONFIG_CPU_LITTLE_ENDIAN=y
 CONFIG_CPU_MIPS32_R2=y
diff --git a/arch/mips/configs/maltaup_defconfig b/arch/mips/configs/maltaup_defconfig
index 136f965784db..fc6f88cae7be 100644
--- a/arch/mips/configs/maltaup_defconfig
+++ b/arch/mips/configs/maltaup_defconfig
@@ -7,7 +7,6 @@ CONFIG_IKCONFIG=y
 CONFIG_IKCONFIG_PROC=y
 CONFIG_LOG_BUF_SHIFT=15
 CONFIG_EMBEDDED=y
-CONFIG_SLAB=y
 CONFIG_MIPS_MALTA=y
 CONFIG_CPU_LITTLE_ENDIAN=y
 CONFIG_CPU_MIPS32_R2=y
diff --git a/arch/mips/configs/maltaup_xpa_defconfig b/arch/mips/configs/maltaup_xpa_defconfig
index 75b8da8d9927..97c2d7f530b3 100644
--- a/arch/mips/configs/maltaup_xpa_defconfig
+++ b/arch/mips/configs/maltaup_xpa_defconfig
@@ -8,7 +8,6 @@ CONFIG_NAMESPACES=y
 CONFIG_RELAY=y
 CONFIG_EXPERT=y
 # CONFIG_COMPAT_BRK is not set
-CONFIG_SLAB=y
 CONFIG_MIPS_MALTA=y
 CONFIG_CPU_LITTLE_ENDIAN=y
 CONFIG_CPU_MIPS32_R2=y
diff --git a/arch/mips/configs/mtx1_defconfig b/arch/mips/configs/mtx1_defconfig
index a5c68e9b0482..b64172179160 100644
--- a/arch/mips/configs/mtx1_defconfig
+++ b/arch/mips/configs/mtx1_defconfig
@@ -8,7 +8,6 @@ CONFIG_BSD_PROCESS_ACCT_V3=y
 CONFIG_RELAY=y
 CONFIG_BLK_DEV_INITRD=y
 CONFIG_EXPERT=y
-CONFIG_SLAB=y
 CONFIG_PROFILING=y
 CONFIG_MIPS_ALCHEMY=y
 CONFIG_MIPS_MTX1=y
diff --git a/arch/mips/configs/pic32mzda_defconfig b/arch/mips/configs/pic32mzda_defconfig
index 48dd02d01ac1..8397f28355d5 100644
--- a/arch/mips/configs/pic32mzda_defconfig
+++ b/arch/mips/configs/pic32mzda_defconfig
@@ -9,7 +9,6 @@ CONFIG_RELAY=y
 CONFIG_CC_OPTIMIZE_FOR_SIZE=y
 CONFIG_EMBEDDED=y
 # CONFIG_COMPAT_BRK is not set
-CONFIG_SLAB=y
 CONFIG_MACH_PIC32=y
 CONFIG_DTB_PIC32_MZDA_SK=y
 CONFIG_HZ_100=y
diff --git a/arch/mips/configs/qi_lb60_defconfig b/arch/mips/configs/qi_lb60_defconfig
index 7e5d9741bd5d..c27c8c7151a1 100644
--- a/arch/mips/configs/qi_lb60_defconfig
+++ b/arch/mips/configs/qi_lb60_defconfig
@@ -6,7 +6,6 @@ CONFIG_KALLSYMS_ALL=y
 CONFIG_EMBEDDED=y
 # CONFIG_VM_EVENT_COUNTERS is not set
 # CONFIG_COMPAT_BRK is not set
-CONFIG_SLAB=y
 CONFIG_MACH_INGENIC_SOC=y
 CONFIG_JZ4740_QI_LB60=y
 CONFIG_HZ_100=y
diff --git a/arch/mips/configs/rb532_defconfig b/arch/mips/configs/rb532_defconfig
index 93306f5e045b..02ec6c1a5116 100644
--- a/arch/mips/configs/rb532_defconfig
+++ b/arch/mips/configs/rb532_defconfig
@@ -11,7 +11,6 @@ CONFIG_EXPERT=y
 # CONFIG_ELF_CORE is not set
 # CONFIG_KALLSYMS is not set
 # CONFIG_VM_EVENT_COUNTERS is not set
-CONFIG_SLAB=y
 CONFIG_MIKROTIK_RB532=y
 CONFIG_HZ_100=y
 # CONFIG_SECCOMP is not set
diff --git a/arch/mips/configs/rbtx49xx_defconfig b/arch/mips/configs/rbtx49xx_defconfig
index 30c195f28278..03a7bbe28a53 100644
--- a/arch/mips/configs/rbtx49xx_defconfig
+++ b/arch/mips/configs/rbtx49xx_defconfig
@@ -7,7 +7,6 @@ CONFIG_LOG_BUF_SHIFT=14
 CONFIG_BLK_DEV_INITRD=y
 CONFIG_EXPERT=y
 # CONFIG_EPOLL is not set
-CONFIG_SLAB=y
 CONFIG_MACH_TX49XX=y
 CONFIG_TOSHIBA_RBTX4927=y
 # CONFIG_SECCOMP is not set
diff --git a/arch/mips/configs/rm200_defconfig b/arch/mips/configs/rm200_defconfig
index 9932a593e3c3..7475c2cbea89 100644
--- a/arch/mips/configs/rm200_defconfig
+++ b/arch/mips/configs/rm200_defconfig
@@ -7,7 +7,6 @@ CONFIG_IKCONFIG_PROC=y
 CONFIG_LOG_BUF_SHIFT=14
 CONFIG_RELAY=y
 CONFIG_EXPERT=y
-CONFIG_SLAB=y
 CONFIG_SNI_RM=y
 CONFIG_CPU_LITTLE_ENDIAN=y
 CONFIG_ARC_CONSOLE=y
diff --git a/arch/mips/configs/rs90_defconfig b/arch/mips/configs/rs90_defconfig
index 7ce3b814fdc8..85ea2a6775f5 100644
--- a/arch/mips/configs/rs90_defconfig
+++ b/arch/mips/configs/rs90_defconfig
@@ -17,7 +17,6 @@ CONFIG_LD_DEAD_CODE_DATA_ELIMINATION=y
 # CONFIG_KALLSYMS is not set
 CONFIG_EMBEDDED=y
 # CONFIG_PERF_EVENTS is not set
-CONFIG_SLAB=y
 CONFIG_PROFILING=y
 CONFIG_MACH_INGENIC_SOC=y
 CONFIG_JZ4740_RS90=y
diff --git a/arch/mips/configs/sb1250_swarm_defconfig b/arch/mips/configs/sb1250_swarm_defconfig
index 030186f89501..ce855b644bb0 100644
--- a/arch/mips/configs/sb1250_swarm_defconfig
+++ b/arch/mips/configs/sb1250_swarm_defconfig
@@ -10,7 +10,6 @@ CONFIG_RELAY=y
 CONFIG_BLK_DEV_INITRD=y
 CONFIG_EXPERT=y
 # CONFIG_COMPAT_BRK is not set
-CONFIG_SLAB=y
 CONFIG_SIBYTE_SWARM=y
 CONFIG_CPU_SB1_PASS_2_2=y
 CONFIG_64BIT=y
diff --git a/arch/nios2/configs/10m50_defconfig b/arch/nios2/configs/10m50_defconfig
index 91c3fce4dc7f..63151ebf1470 100644
--- a/arch/nios2/configs/10m50_defconfig
+++ b/arch/nios2/configs/10m50_defconfig
@@ -10,7 +10,6 @@ CONFIG_LOG_BUF_SHIFT=14
 # CONFIG_SHMEM is not set
 # CONFIG_AIO is not set
 CONFIG_EMBEDDED=y
-CONFIG_SLAB=y
 CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
 CONFIG_NIOS2_MEM_BASE=0x8000000
diff --git a/arch/nios2/configs/3c120_defconfig b/arch/nios2/configs/3c120_defconfig
index c42ad7e162a3..0daf3038d7aa 100644
--- a/arch/nios2/configs/3c120_defconfig
+++ b/arch/nios2/configs/3c120_defconfig
@@ -10,7 +10,6 @@ CONFIG_LOG_BUF_SHIFT=14
 # CONFIG_SHMEM is not set
 # CONFIG_AIO is not set
 CONFIG_EMBEDDED=y
-CONFIG_SLAB=y
 CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
 CONFIG_NIOS2_MEM_BASE=0x10000000
diff --git a/arch/parisc/configs/generic-32bit_defconfig b/arch/parisc/configs/generic-32bit_defconfig
index 8ce0ae370680..8c4d4844321f 100644
--- a/arch/parisc/configs/generic-32bit_defconfig
+++ b/arch/parisc/configs/generic-32bit_defconfig
@@ -12,7 +12,6 @@ CONFIG_USER_NS=y
 CONFIG_BLK_DEV_INITRD=y
 CONFIG_EXPERT=y
 CONFIG_PERF_EVENTS=y
-CONFIG_SLAB=y
 CONFIG_PA7100LC=y
 CONFIG_SMP=y
 CONFIG_HZ_100=y
diff --git a/arch/powerpc/configs/40x/klondike_defconfig b/arch/powerpc/configs/40x/klondike_defconfig
index 6a735ee75715..acafbb8f6808 100644
--- a/arch/powerpc/configs/40x/klondike_defconfig
+++ b/arch/powerpc/configs/40x/klondike_defconfig
@@ -5,7 +5,6 @@ CONFIG_SYSFS_DEPRECATED=y
 CONFIG_SYSFS_DEPRECATED_V2=y
 CONFIG_BLK_DEV_INITRD=y
 CONFIG_EMBEDDED=y
-CONFIG_SLAB=y
 CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
 CONFIG_APM8018X=y
diff --git a/arch/powerpc/configs/52xx/pcm030_defconfig b/arch/powerpc/configs/52xx/pcm030_defconfig
index 789622ffd844..88fbe0d42e11 100644
--- a/arch/powerpc/configs/52xx/pcm030_defconfig
+++ b/arch/powerpc/configs/52xx/pcm030_defconfig
@@ -10,7 +10,6 @@ CONFIG_IKCONFIG_PROC=y
 CONFIG_LOG_BUF_SHIFT=14
 CONFIG_EXPERT=y
 # CONFIG_VM_EVENT_COUNTERS is not set
-CONFIG_SLAB=y
 CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
 # CONFIG_BLK_DEV_BSG is not set
diff --git a/arch/powerpc/configs/83xx/kmeter1_defconfig b/arch/powerpc/configs/83xx/kmeter1_defconfig
index 24bf1bde1bb4..487e5e1bbf4c 100644
--- a/arch/powerpc/configs/83xx/kmeter1_defconfig
+++ b/arch/powerpc/configs/83xx/kmeter1_defconfig
@@ -5,7 +5,6 @@ CONFIG_NO_HZ=y
 CONFIG_HIGH_RES_TIMERS=y
 CONFIG_LOG_BUF_SHIFT=14
 CONFIG_EXPERT=y
-CONFIG_SLAB=y
 CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
 # CONFIG_BLK_DEV_BSG is not set
diff --git a/arch/powerpc/configs/83xx/mpc837x_rdb_defconfig b/arch/powerpc/configs/83xx/mpc837x_rdb_defconfig
index 4e3373381ab6..58fae5131fa7 100644
--- a/arch/powerpc/configs/83xx/mpc837x_rdb_defconfig
+++ b/arch/powerpc/configs/83xx/mpc837x_rdb_defconfig
@@ -2,7 +2,6 @@ CONFIG_SYSVIPC=y
 CONFIG_LOG_BUF_SHIFT=14
 CONFIG_BLK_DEV_INITRD=y
 CONFIG_EXPERT=y
-CONFIG_SLAB=y
 CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
 # CONFIG_BLK_DEV_BSG is not set
diff --git a/arch/powerpc/configs/85xx/ge_imp3a_defconfig b/arch/powerpc/configs/85xx/ge_imp3a_defconfig
index 6cb7e90d52c1..da6fc203e2dc 100644
--- a/arch/powerpc/configs/85xx/ge_imp3a_defconfig
+++ b/arch/powerpc/configs/85xx/ge_imp3a_defconfig
@@ -17,7 +17,6 @@ CONFIG_SYSFS_DEPRECATED_V2=y
 CONFIG_RELAY=y
 CONFIG_BLK_DEV_INITRD=y
 CONFIG_PERF_EVENTS=y
-CONFIG_SLAB=y
 CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
 # CONFIG_BLK_DEV_BSG is not set
diff --git a/arch/powerpc/configs/ep8248e_defconfig b/arch/powerpc/configs/ep8248e_defconfig
index 8df6d3a293e3..b9dfa3a0713b 100644
--- a/arch/powerpc/configs/ep8248e_defconfig
+++ b/arch/powerpc/configs/ep8248e_defconfig
@@ -4,7 +4,6 @@ CONFIG_IKCONFIG_PROC=y
 CONFIG_LOG_BUF_SHIFT=14
 CONFIG_EXPERT=y
 CONFIG_KALLSYMS_ALL=y
-CONFIG_SLAB=y
 CONFIG_PARTITION_ADVANCED=y
 # CONFIG_PPC_CHRP is not set
 # CONFIG_PPC_PMAC is not set
diff --git a/arch/powerpc/configs/gamecube_defconfig b/arch/powerpc/configs/gamecube_defconfig
index 91a1b99f4e8f..d77eeb525366 100644
--- a/arch/powerpc/configs/gamecube_defconfig
+++ b/arch/powerpc/configs/gamecube_defconfig
@@ -8,7 +8,6 @@ CONFIG_EXPERT=y
 # CONFIG_ELF_CORE is not set
 CONFIG_PERF_EVENTS=y
 # CONFIG_VM_EVENT_COUNTERS is not set
-CONFIG_SLAB=y
 CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
 # CONFIG_BLK_DEV_BSG is not set
diff --git a/arch/powerpc/configs/mgcoge_defconfig b/arch/powerpc/configs/mgcoge_defconfig
index 498d35db7833..ce220ceeb91c 100644
--- a/arch/powerpc/configs/mgcoge_defconfig
+++ b/arch/powerpc/configs/mgcoge_defconfig
@@ -10,7 +10,6 @@ CONFIG_BLK_DEV_INITRD=y
 CONFIG_KALLSYMS_ALL=y
 # CONFIG_PCSPKR_PLATFORM is not set
 CONFIG_EMBEDDED=y
-CONFIG_SLAB=y
 CONFIG_PARTITION_ADVANCED=y
 # CONFIG_PPC_PMAC is not set
 CONFIG_PPC_82xx=y
diff --git a/arch/powerpc/configs/mpc512x_defconfig b/arch/powerpc/configs/mpc512x_defconfig
index 10fe061c5e6d..d24457bc5791 100644
--- a/arch/powerpc/configs/mpc512x_defconfig
+++ b/arch/powerpc/configs/mpc512x_defconfig
@@ -4,7 +4,6 @@ CONFIG_NO_HZ=y
 CONFIG_LOG_BUF_SHIFT=16
 CONFIG_BLK_DEV_INITRD=y
 # CONFIG_COMPAT_BRK is not set
-CONFIG_SLAB=y
 CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
 # CONFIG_BLK_DEV_BSG is not set
diff --git a/arch/powerpc/configs/mpc83xx_defconfig b/arch/powerpc/configs/mpc83xx_defconfig
index 8779f03bced1..83c4710017e9 100644
--- a/arch/powerpc/configs/mpc83xx_defconfig
+++ b/arch/powerpc/configs/mpc83xx_defconfig
@@ -2,7 +2,6 @@ CONFIG_SYSVIPC=y
 CONFIG_LOG_BUF_SHIFT=14
 CONFIG_BLK_DEV_INITRD=y
 CONFIG_EXPERT=y
-CONFIG_SLAB=y
 CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
 # CONFIG_BLK_DEV_BSG is not set
diff --git a/arch/powerpc/configs/ps3_defconfig b/arch/powerpc/configs/ps3_defconfig
index 52a8c5450ecb..ea3ee0719bb2 100644
--- a/arch/powerpc/configs/ps3_defconfig
+++ b/arch/powerpc/configs/ps3_defconfig
@@ -33,7 +33,6 @@ CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
 # CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS is not set
 CONFIG_BINFMT_MISC=y
-CONFIG_SLAB=y
 # CONFIG_COMPAT_BRK is not set
 # CONFIG_SPARSEMEM_VMEMMAP is not set
 # CONFIG_COMPACTION is not set
diff --git a/arch/powerpc/configs/wii_defconfig b/arch/powerpc/configs/wii_defconfig
index 0ab78c51455d..5017a697b67b 100644
--- a/arch/powerpc/configs/wii_defconfig
+++ b/arch/powerpc/configs/wii_defconfig
@@ -9,7 +9,6 @@ CONFIG_EXPERT=y
 # CONFIG_ELF_CORE is not set
 CONFIG_PERF_EVENTS=y
 # CONFIG_VM_EVENT_COUNTERS is not set
-CONFIG_SLAB=y
 CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
 # CONFIG_PPC_CHRP is not set
diff --git a/arch/sh/configs/ap325rxa_defconfig b/arch/sh/configs/ap325rxa_defconfig
index 4d83576b89c6..4464a2ad42ed 100644
--- a/arch/sh/configs/ap325rxa_defconfig
+++ b/arch/sh/configs/ap325rxa_defconfig
@@ -3,7 +3,6 @@ CONFIG_SYSVIPC=y
 CONFIG_BSD_PROCESS_ACCT=y
 CONFIG_LOG_BUF_SHIFT=14
 # CONFIG_KALLSYMS is not set
-CONFIG_SLAB=y
 CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
 # CONFIG_BLK_DEV_BSG is not set
diff --git a/arch/sh/configs/apsh4a3a_defconfig b/arch/sh/configs/apsh4a3a_defconfig
index 99931a13a74d..cc909f347877 100644
--- a/arch/sh/configs/apsh4a3a_defconfig
+++ b/arch/sh/configs/apsh4a3a_defconfig
@@ -6,7 +6,6 @@ CONFIG_LOG_BUF_SHIFT=14
 CONFIG_SYSFS_DEPRECATED=y
 CONFIG_SYSFS_DEPRECATED_V2=y
 CONFIG_BLK_DEV_INITRD=y
-CONFIG_SLAB=y
 CONFIG_PROFILING=y
 CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
diff --git a/arch/sh/configs/apsh4ad0a_defconfig b/arch/sh/configs/apsh4ad0a_defconfig
index d9fb124bf015..64558bf60e10 100644
--- a/arch/sh/configs/apsh4ad0a_defconfig
+++ b/arch/sh/configs/apsh4ad0a_defconfig
@@ -15,7 +15,6 @@ CONFIG_NAMESPACES=y
 CONFIG_BLK_DEV_INITRD=y
 CONFIG_KALLSYMS_ALL=y
 # CONFIG_COMPAT_BRK is not set
-CONFIG_SLAB=y
 CONFIG_PROFILING=y
 CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
diff --git a/arch/sh/configs/dreamcast_defconfig b/arch/sh/configs/dreamcast_defconfig
index 6a82c7b8ff32..0c9f2030bb7c 100644
--- a/arch/sh/configs/dreamcast_defconfig
+++ b/arch/sh/configs/dreamcast_defconfig
@@ -1,7 +1,6 @@
 CONFIG_SYSVIPC=y
 CONFIG_BSD_PROCESS_ACCT=y
 CONFIG_LOG_BUF_SHIFT=14
-CONFIG_SLAB=y
 CONFIG_PROFILING=y
 CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
diff --git a/arch/sh/configs/ecovec24-romimage_defconfig b/arch/sh/configs/ecovec24-romimage_defconfig
index 5c60e71d839e..13fec4338416 100644
--- a/arch/sh/configs/ecovec24-romimage_defconfig
+++ b/arch/sh/configs/ecovec24-romimage_defconfig
@@ -6,7 +6,6 @@ CONFIG_IKCONFIG_PROC=y
 CONFIG_LOG_BUF_SHIFT=14
 CONFIG_BLK_DEV_INITRD=y
 # CONFIG_KALLSYMS is not set
-CONFIG_SLAB=y
 # CONFIG_BLK_DEV_BSG is not set
 CONFIG_CPU_SUBTYPE_SH7724=y
 CONFIG_MEMORY_SIZE=0x10000000
diff --git a/arch/sh/configs/ecovec24_defconfig b/arch/sh/configs/ecovec24_defconfig
index 4d655e8d4d74..ee1b36682155 100644
--- a/arch/sh/configs/ecovec24_defconfig
+++ b/arch/sh/configs/ecovec24_defconfig
@@ -3,7 +3,6 @@ CONFIG_SYSVIPC=y
 CONFIG_BSD_PROCESS_ACCT=y
 CONFIG_LOG_BUF_SHIFT=14
 # CONFIG_KALLSYMS is not set
-CONFIG_SLAB=y
 CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
 # CONFIG_BLK_DEV_BSG is not set
diff --git a/arch/sh/configs/espt_defconfig b/arch/sh/configs/espt_defconfig
index 2804cb760a76..623012d9af9d 100644
--- a/arch/sh/configs/espt_defconfig
+++ b/arch/sh/configs/espt_defconfig
@@ -5,7 +5,6 @@ CONFIG_LOG_BUF_SHIFT=14
 CONFIG_NAMESPACES=y
 CONFIG_UTS_NS=y
 CONFIG_IPC_NS=y
-CONFIG_SLAB=y
 CONFIG_PROFILING=y
 CONFIG_MODULES=y
 # CONFIG_BLK_DEV_BSG is not set
diff --git a/arch/sh/configs/hp6xx_defconfig b/arch/sh/configs/hp6xx_defconfig
index 70e6605d7f7e..0c45f2a0f9bd 100644
--- a/arch/sh/configs/hp6xx_defconfig
+++ b/arch/sh/configs/hp6xx_defconfig
@@ -3,7 +3,6 @@ CONFIG_IKCONFIG=y
 CONFIG_IKCONFIG_PROC=y
 CONFIG_LOG_BUF_SHIFT=14
 # CONFIG_CC_OPTIMIZE_FOR_SIZE is not set
-CONFIG_SLAB=y
 # CONFIG_BLK_DEV_BSG is not set
 CONFIG_CPU_SUBTYPE_SH7709=y
 CONFIG_MEMORY_START=0x0d000000
diff --git a/arch/sh/configs/kfr2r09-romimage_defconfig b/arch/sh/configs/kfr2r09-romimage_defconfig
index 04436b4fbd76..42bf34181a3e 100644
--- a/arch/sh/configs/kfr2r09-romimage_defconfig
+++ b/arch/sh/configs/kfr2r09-romimage_defconfig
@@ -6,7 +6,6 @@ CONFIG_IKCONFIG_PROC=y
 CONFIG_LOG_BUF_SHIFT=14
 CONFIG_BLK_DEV_INITRD=y
 # CONFIG_KALLSYMS is not set
-CONFIG_SLAB=y
 # CONFIG_BLOCK is not set
 CONFIG_CPU_SUBTYPE_SH7724=y
 CONFIG_MEMORY_SIZE=0x08000000
diff --git a/arch/sh/configs/kfr2r09_defconfig b/arch/sh/configs/kfr2r09_defconfig
index 833404490cfe..d80e83e7ec38 100644
--- a/arch/sh/configs/kfr2r09_defconfig
+++ b/arch/sh/configs/kfr2r09_defconfig
@@ -6,7 +6,6 @@ CONFIG_IKCONFIG_PROC=y
 CONFIG_LOG_BUF_SHIFT=14
 CONFIG_BLK_DEV_INITRD=y
 # CONFIG_KALLSYMS is not set
-CONFIG_SLAB=y
 CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
 # CONFIG_BLK_DEV_BSG is not set
diff --git a/arch/sh/configs/landisk_defconfig b/arch/sh/configs/landisk_defconfig
index 7037320b654a..541082090918 100644
--- a/arch/sh/configs/landisk_defconfig
+++ b/arch/sh/configs/landisk_defconfig
@@ -1,7 +1,6 @@
 CONFIG_SYSVIPC=y
 CONFIG_LOG_BUF_SHIFT=14
 CONFIG_KALLSYMS_EXTRA_PASS=y
-CONFIG_SLAB=y
 CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
 CONFIG_MODULE_FORCE_UNLOAD=y
diff --git a/arch/sh/configs/lboxre2_defconfig b/arch/sh/configs/lboxre2_defconfig
index 05e4ac6fed5f..6a234761bfd7 100644
--- a/arch/sh/configs/lboxre2_defconfig
+++ b/arch/sh/configs/lboxre2_defconfig
@@ -1,7 +1,6 @@
 CONFIG_SYSVIPC=y
 CONFIG_LOG_BUF_SHIFT=14
 CONFIG_KALLSYMS_EXTRA_PASS=y
-CONFIG_SLAB=y
 CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
 CONFIG_MODULE_FORCE_UNLOAD=y
diff --git a/arch/sh/configs/magicpanelr2_defconfig b/arch/sh/configs/magicpanelr2_defconfig
index ef1d98e35c91..52937f9cc2ab 100644
--- a/arch/sh/configs/magicpanelr2_defconfig
+++ b/arch/sh/configs/magicpanelr2_defconfig
@@ -8,7 +8,6 @@ CONFIG_RELAY=y
 CONFIG_BLK_DEV_INITRD=y
 # CONFIG_CC_OPTIMIZE_FOR_SIZE is not set
 CONFIG_KALLSYMS_ALL=y
-CONFIG_SLAB=y
 CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
 CONFIG_MODVERSIONS=y
diff --git a/arch/sh/configs/microdev_defconfig b/arch/sh/configs/microdev_defconfig
index e9825196dd66..39a83d832cac 100644
--- a/arch/sh/configs/microdev_defconfig
+++ b/arch/sh/configs/microdev_defconfig
@@ -2,7 +2,6 @@ CONFIG_BSD_PROCESS_ACCT=y
 CONFIG_LOG_BUF_SHIFT=14
 CONFIG_BLK_DEV_INITRD=y
 # CONFIG_CC_OPTIMIZE_FOR_SIZE is not set
-CONFIG_SLAB=y
 # CONFIG_BLK_DEV_BSG is not set
 CONFIG_CPU_SUBTYPE_SH4_202=y
 CONFIG_FLATMEM_MANUAL=y
diff --git a/arch/sh/configs/migor_defconfig b/arch/sh/configs/migor_defconfig
index 4859cd30cfc4..2d1e65cad239 100644
--- a/arch/sh/configs/migor_defconfig
+++ b/arch/sh/configs/migor_defconfig
@@ -4,7 +4,6 @@ CONFIG_IKCONFIG_PROC=y
 CONFIG_LOG_BUF_SHIFT=14
 CONFIG_BLK_DEV_INITRD=y
 # CONFIG_CC_OPTIMIZE_FOR_SIZE is not set
-CONFIG_SLAB=y
 CONFIG_PROFILING=y
 CONFIG_MODULES=y
 # CONFIG_BLK_DEV_BSG is not set
diff --git a/arch/sh/configs/polaris_defconfig b/arch/sh/configs/polaris_defconfig
index f42e4867ddc1..4f0396c2ac79 100644
--- a/arch/sh/configs/polaris_defconfig
+++ b/arch/sh/configs/polaris_defconfig
@@ -7,7 +7,6 @@ CONFIG_BSD_PROCESS_ACCT_V3=y
 CONFIG_AUDIT=y
 CONFIG_LOG_BUF_SHIFT=14
 # CONFIG_CC_OPTIMIZE_FOR_SIZE is not set
-CONFIG_SLAB=y
 CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
 CONFIG_MODVERSIONS=y
diff --git a/arch/sh/configs/r7780mp_defconfig b/arch/sh/configs/r7780mp_defconfig
index e527cd60a191..6bd6c0ae85d7 100644
--- a/arch/sh/configs/r7780mp_defconfig
+++ b/arch/sh/configs/r7780mp_defconfig
@@ -5,7 +5,6 @@ CONFIG_IKCONFIG_PROC=y
 CONFIG_LOG_BUF_SHIFT=14
 # CONFIG_FUTEX is not set
 # CONFIG_EPOLL is not set
-CONFIG_SLAB=y
 CONFIG_PROFILING=y
 CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
diff --git a/arch/sh/configs/r7785rp_defconfig b/arch/sh/configs/r7785rp_defconfig
index a3f952a83d97..cde668569cc1 100644
--- a/arch/sh/configs/r7785rp_defconfig
+++ b/arch/sh/configs/r7785rp_defconfig
@@ -7,7 +7,6 @@ CONFIG_RCU_TRACE=y
 CONFIG_IKCONFIG=y
 CONFIG_IKCONFIG_PROC=y
 CONFIG_LOG_BUF_SHIFT=14
-CONFIG_SLAB=y
 CONFIG_PROFILING=y
 CONFIG_KPROBES=y
 CONFIG_MODULES=y
diff --git a/arch/sh/configs/rsk7264_defconfig b/arch/sh/configs/rsk7264_defconfig
index f7b9c528c6df..de9e350cdf28 100644
--- a/arch/sh/configs/rsk7264_defconfig
+++ b/arch/sh/configs/rsk7264_defconfig
@@ -12,7 +12,6 @@ CONFIG_KALLSYMS_ALL=y
 CONFIG_EMBEDDED=y
 CONFIG_PERF_COUNTERS=y
 # CONFIG_VM_EVENT_COUNTERS is not set
-CONFIG_SLAB=y
 CONFIG_MMAP_ALLOW_UNINITIALIZED=y
 CONFIG_PROFILING=y
 # CONFIG_BLK_DEV_BSG is not set
diff --git a/arch/sh/configs/rsk7269_defconfig b/arch/sh/configs/rsk7269_defconfig
index 4bff14fb185d..7ca6a5c25a9f 100644
--- a/arch/sh/configs/rsk7269_defconfig
+++ b/arch/sh/configs/rsk7269_defconfig
@@ -2,7 +2,6 @@ CONFIG_LOG_BUF_SHIFT=14
 CONFIG_CC_OPTIMIZE_FOR_SIZE=y
 CONFIG_EMBEDDED=y
 # CONFIG_VM_EVENT_COUNTERS is not set
-CONFIG_SLAB=y
 # CONFIG_BLK_DEV_BSG is not set
 CONFIG_SWAP_IO_SPACE=y
 CONFIG_CPU_SUBTYPE_SH7269=y
diff --git a/arch/sh/configs/rts7751r2d1_defconfig b/arch/sh/configs/rts7751r2d1_defconfig
index 96263a4912b7..c863a11c7592 100644
--- a/arch/sh/configs/rts7751r2d1_defconfig
+++ b/arch/sh/configs/rts7751r2d1_defconfig
@@ -1,7 +1,6 @@
 CONFIG_SYSVIPC=y
 CONFIG_LOG_BUF_SHIFT=14
 # CONFIG_CC_OPTIMIZE_FOR_SIZE is not set
-CONFIG_SLAB=y
 CONFIG_PROFILING=y
 CONFIG_MODULES=y
 # CONFIG_BLK_DEV_BSG is not set
diff --git a/arch/sh/configs/rts7751r2dplus_defconfig b/arch/sh/configs/rts7751r2dplus_defconfig
index 92e586e6c974..7e4f710d46c7 100644
--- a/arch/sh/configs/rts7751r2dplus_defconfig
+++ b/arch/sh/configs/rts7751r2dplus_defconfig
@@ -1,7 +1,6 @@
 CONFIG_SYSVIPC=y
 CONFIG_LOG_BUF_SHIFT=14
 # CONFIG_CC_OPTIMIZE_FOR_SIZE is not set
-CONFIG_SLAB=y
 CONFIG_PROFILING=y
 CONFIG_MODULES=y
 # CONFIG_BLK_DEV_BSG is not set
diff --git a/arch/sh/configs/sdk7786_defconfig b/arch/sh/configs/sdk7786_defconfig
index 97b7356639ed..a080c5d05a7b 100644
--- a/arch/sh/configs/sdk7786_defconfig
+++ b/arch/sh/configs/sdk7786_defconfig
@@ -31,7 +31,6 @@ CONFIG_RD_BZIP2=y
 CONFIG_RD_LZMA=y
 CONFIG_RD_LZO=y
 # CONFIG_COMPAT_BRK is not set
-CONFIG_SLAB=y
 CONFIG_PROFILING=y
 CONFIG_KPROBES=y
 CONFIG_MODULES=y
diff --git a/arch/sh/configs/se7343_defconfig b/arch/sh/configs/se7343_defconfig
index 5d6c19338ebf..75db12fb9ad1 100644
--- a/arch/sh/configs/se7343_defconfig
+++ b/arch/sh/configs/se7343_defconfig
@@ -5,7 +5,6 @@ CONFIG_LOG_BUF_SHIFT=14
 # CONFIG_FUTEX is not set
 # CONFIG_EPOLL is not set
 # CONFIG_SHMEM is not set
-CONFIG_SLAB=y
 CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
 CONFIG_MODULE_FORCE_UNLOAD=y
diff --git a/arch/sh/configs/se7619_defconfig b/arch/sh/configs/se7619_defconfig
index 71a672c30716..14d0f5ead502 100644
--- a/arch/sh/configs/se7619_defconfig
+++ b/arch/sh/configs/se7619_defconfig
@@ -8,7 +8,6 @@ CONFIG_LOG_BUF_SHIFT=14
 # CONFIG_FUTEX is not set
 # CONFIG_EPOLL is not set
 # CONFIG_VM_EVENT_COUNTERS is not set
-CONFIG_SLAB=y
 # CONFIG_BLK_DEV_BSG is not set
 CONFIG_MEMORY_START=0x0c000000
 CONFIG_FLATMEM_MANUAL=y
diff --git a/arch/sh/configs/se7705_defconfig b/arch/sh/configs/se7705_defconfig
index ed00a6eeadf5..16a0f72f0822 100644
--- a/arch/sh/configs/se7705_defconfig
+++ b/arch/sh/configs/se7705_defconfig
@@ -4,7 +4,6 @@ CONFIG_BLK_DEV_INITRD=y
 # CONFIG_CC_OPTIMIZE_FOR_SIZE is not set
 # CONFIG_KALLSYMS is not set
 # CONFIG_HOTPLUG is not set
-CONFIG_SLAB=y
 CONFIG_MODULES=y
 # CONFIG_BLK_DEV_BSG is not set
 CONFIG_CPU_SUBTYPE_SH7705=y
diff --git a/arch/sh/configs/se7712_defconfig b/arch/sh/configs/se7712_defconfig
index 36356223d51c..dc854293da43 100644
--- a/arch/sh/configs/se7712_defconfig
+++ b/arch/sh/configs/se7712_defconfig
@@ -9,7 +9,6 @@ CONFIG_KALLSYMS_ALL=y
 # CONFIG_BUG is not set
 # CONFIG_BASE_FULL is not set
 # CONFIG_SHMEM is not set
-CONFIG_SLAB=y
 CONFIG_MODULES=y
 # CONFIG_BLK_DEV_BSG is not set
 CONFIG_CPU_SUBTYPE_SH7712=y
diff --git a/arch/sh/configs/se7721_defconfig b/arch/sh/configs/se7721_defconfig
index 46c5a263a239..c891945b8a90 100644
--- a/arch/sh/configs/se7721_defconfig
+++ b/arch/sh/configs/se7721_defconfig
@@ -9,7 +9,6 @@ CONFIG_KALLSYMS_ALL=y
 # CONFIG_BUG is not set
 # CONFIG_BASE_FULL is not set
 # CONFIG_SHMEM is not set
-CONFIG_SLAB=y
 CONFIG_MODULES=y
 # CONFIG_BLK_DEV_BSG is not set
 CONFIG_CPU_SUBTYPE_SH7721=y
diff --git a/arch/sh/configs/se7724_defconfig b/arch/sh/configs/se7724_defconfig
index d817df7cc4a7..96521271758c 100644
--- a/arch/sh/configs/se7724_defconfig
+++ b/arch/sh/configs/se7724_defconfig
@@ -3,7 +3,6 @@ CONFIG_SYSVIPC=y
 CONFIG_BSD_PROCESS_ACCT=y
 CONFIG_LOG_BUF_SHIFT=14
 # CONFIG_KALLSYMS is not set
-CONFIG_SLAB=y
 CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
 # CONFIG_BLK_DEV_BSG is not set
diff --git a/arch/sh/configs/se7750_defconfig b/arch/sh/configs/se7750_defconfig
index 4defc7628a49..5fa6239ae4ea 100644
--- a/arch/sh/configs/se7750_defconfig
+++ b/arch/sh/configs/se7750_defconfig
@@ -6,7 +6,6 @@ CONFIG_IKCONFIG_PROC=y
 CONFIG_LOG_BUF_SHIFT=14
 # CONFIG_CC_OPTIMIZE_FOR_SIZE is not set
 # CONFIG_HOTPLUG is not set
-CONFIG_SLAB=y
 CONFIG_MODULES=y
 # CONFIG_BLK_DEV_BSG is not set
 CONFIG_CPU_SUBTYPE_SH7750=y
diff --git a/arch/sh/configs/se7751_defconfig b/arch/sh/configs/se7751_defconfig
index 4a024065bb75..8b5fe4ec16bc 100644
--- a/arch/sh/configs/se7751_defconfig
+++ b/arch/sh/configs/se7751_defconfig
@@ -4,7 +4,6 @@ CONFIG_LOG_BUF_SHIFT=14
 CONFIG_BLK_DEV_INITRD=y
 # CONFIG_CC_OPTIMIZE_FOR_SIZE is not set
 # CONFIG_HOTPLUG is not set
-CONFIG_SLAB=y
 CONFIG_MODULES=y
 # CONFIG_BLK_DEV_BSG is not set
 CONFIG_CPU_SUBTYPE_SH7751=y
diff --git a/arch/sh/configs/se7780_defconfig b/arch/sh/configs/se7780_defconfig
index dcd85b858ac8..21303304eda2 100644
--- a/arch/sh/configs/se7780_defconfig
+++ b/arch/sh/configs/se7780_defconfig
@@ -6,7 +6,6 @@ CONFIG_LOG_BUF_SHIFT=14
 # CONFIG_KALLSYMS is not set
 # CONFIG_HOTPLUG is not set
 # CONFIG_EPOLL is not set
-CONFIG_SLAB=y
 CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
 CONFIG_CPU_SUBTYPE_SH7780=y
diff --git a/arch/sh/configs/secureedge5410_defconfig b/arch/sh/configs/secureedge5410_defconfig
index 8422599cfb04..120176afe3f6 100644
--- a/arch/sh/configs/secureedge5410_defconfig
+++ b/arch/sh/configs/secureedge5410_defconfig
@@ -2,7 +2,6 @@
 CONFIG_LOG_BUF_SHIFT=14
 CONFIG_BLK_DEV_INITRD=y
 # CONFIG_HOTPLUG is not set
-CONFIG_SLAB=y
 # CONFIG_BLK_DEV_BSG is not set
 CONFIG_CPU_SUBTYPE_SH7751R=y
 CONFIG_MEMORY_SIZE=0x01000000
diff --git a/arch/sh/configs/sh03_defconfig b/arch/sh/configs/sh03_defconfig
index 9fcf68b22dba..f661ef816f09 100644
--- a/arch/sh/configs/sh03_defconfig
+++ b/arch/sh/configs/sh03_defconfig
@@ -3,7 +3,6 @@ CONFIG_POSIX_MQUEUE=y
 CONFIG_BSD_PROCESS_ACCT=y
 CONFIG_LOG_BUF_SHIFT=14
 CONFIG_BLK_DEV_INITRD=y
-CONFIG_SLAB=y
 CONFIG_PROFILING=y
 CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
diff --git a/arch/sh/configs/sh2007_defconfig b/arch/sh/configs/sh2007_defconfig
index 259c69e3fa22..977ae405a75e 100644
--- a/arch/sh/configs/sh2007_defconfig
+++ b/arch/sh/configs/sh2007_defconfig
@@ -8,7 +8,6 @@ CONFIG_IKCONFIG=y
 CONFIG_LOG_BUF_SHIFT=14
 # CONFIG_CC_OPTIMIZE_FOR_SIZE is not set
 CONFIG_KALLSYMS_ALL=y
-CONFIG_SLAB=y
 # CONFIG_BLK_DEV_BSG is not set
 CONFIG_CPU_SUBTYPE_SH7780=y
 CONFIG_MEMORY_SIZE=0x08000000
diff --git a/arch/sh/configs/sh7710voipgw_defconfig b/arch/sh/configs/sh7710voipgw_defconfig
index 0d814770b07f..7f742729df69 100644
--- a/arch/sh/configs/sh7710voipgw_defconfig
+++ b/arch/sh/configs/sh7710voipgw_defconfig
@@ -5,7 +5,6 @@ CONFIG_LOG_BUF_SHIFT=14
 # CONFIG_FUTEX is not set
 # CONFIG_EPOLL is not set
 # CONFIG_SHMEM is not set
-CONFIG_SLAB=y
 CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
 CONFIG_MODULE_FORCE_UNLOAD=y
diff --git a/arch/sh/configs/sh7757lcr_defconfig b/arch/sh/configs/sh7757lcr_defconfig
index 2579dc4bc0c8..48a0f9beb116 100644
--- a/arch/sh/configs/sh7757lcr_defconfig
+++ b/arch/sh/configs/sh7757lcr_defconfig
@@ -9,7 +9,6 @@ CONFIG_TASK_IO_ACCOUNTING=y
 CONFIG_LOG_BUF_SHIFT=14
 CONFIG_BLK_DEV_INITRD=y
 CONFIG_KALLSYMS_ALL=y
-CONFIG_SLAB=y
 CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
 # CONFIG_BLK_DEV_BSG is not set
diff --git a/arch/sh/configs/sh7763rdp_defconfig b/arch/sh/configs/sh7763rdp_defconfig
index 8a6a446f9eb8..ae726745d9a0 100644
--- a/arch/sh/configs/sh7763rdp_defconfig
+++ b/arch/sh/configs/sh7763rdp_defconfig
@@ -5,7 +5,6 @@ CONFIG_LOG_BUF_SHIFT=14
 CONFIG_NAMESPACES=y
 CONFIG_UTS_NS=y
 CONFIG_IPC_NS=y
-CONFIG_SLAB=y
 CONFIG_PROFILING=y
 CONFIG_MODULES=y
 # CONFIG_BLK_DEV_BSG is not set
diff --git a/arch/sh/configs/sh7785lcr_32bit_defconfig b/arch/sh/configs/sh7785lcr_32bit_defconfig
index 781ff13227fc..59262f42abe6 100644
--- a/arch/sh/configs/sh7785lcr_32bit_defconfig
+++ b/arch/sh/configs/sh7785lcr_32bit_defconfig
@@ -6,7 +6,6 @@ CONFIG_IKCONFIG_PROC=y
 CONFIG_LOG_BUF_SHIFT=16
 CONFIG_PERF_EVENTS=y
 # CONFIG_COMPAT_BRK is not set
-CONFIG_SLAB=y
 CONFIG_PROFILING=y
 CONFIG_GCOV_KERNEL=y
 CONFIG_MODULES=y
diff --git a/arch/sh/configs/sh7785lcr_defconfig b/arch/sh/configs/sh7785lcr_defconfig
index 1b88929083f7..94381f8268ff 100644
--- a/arch/sh/configs/sh7785lcr_defconfig
+++ b/arch/sh/configs/sh7785lcr_defconfig
@@ -3,7 +3,6 @@ CONFIG_BSD_PROCESS_ACCT=y
 CONFIG_IKCONFIG=y
 CONFIG_IKCONFIG_PROC=y
 CONFIG_LOG_BUF_SHIFT=14
-CONFIG_SLAB=y
 CONFIG_PROFILING=y
 CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
diff --git a/arch/sh/configs/titan_defconfig b/arch/sh/configs/titan_defconfig
index 73a0d68b0de6..871092753591 100644
--- a/arch/sh/configs/titan_defconfig
+++ b/arch/sh/configs/titan_defconfig
@@ -6,7 +6,6 @@ CONFIG_IKCONFIG_PROC=y
 CONFIG_LOG_BUF_SHIFT=16
 CONFIG_BLK_DEV_INITRD=y
 # CONFIG_CC_OPTIMIZE_FOR_SIZE is not set
-CONFIG_SLAB=y
 CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
 CONFIG_MODULE_FORCE_UNLOAD=y
diff --git a/arch/sh/configs/urquell_defconfig b/arch/sh/configs/urquell_defconfig
index 8fc687c98fd1..445bb451a5ec 100644
--- a/arch/sh/configs/urquell_defconfig
+++ b/arch/sh/configs/urquell_defconfig
@@ -17,7 +17,6 @@ CONFIG_CGROUP_MEMCG=y
 CONFIG_CGROUP_SCHED=y
 CONFIG_RT_GROUP_SCHED=y
 CONFIG_BLK_DEV_INITRD=y
-CONFIG_SLAB=y
 CONFIG_PROFILING=y
 CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
diff --git a/arch/sparc/configs/sparc32_defconfig b/arch/sparc/configs/sparc32_defconfig
index 7b3efe5edc1a..7c489e7f19b7 100644
--- a/arch/sparc/configs/sparc32_defconfig
+++ b/arch/sparc/configs/sparc32_defconfig
@@ -4,7 +4,6 @@ CONFIG_LOG_BUF_SHIFT=14
 CONFIG_SYSFS_DEPRECATED_V2=y
 CONFIG_BLK_DEV_INITRD=y
 # CONFIG_CC_OPTIMIZE_FOR_SIZE is not set
-CONFIG_SLAB=y
 CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
 # CONFIG_BLK_DEV_BSG is not set
diff --git a/arch/sparc/configs/sparc64_defconfig b/arch/sparc/configs/sparc64_defconfig
index 18099099583e..0bb0d4da5227 100644
--- a/arch/sparc/configs/sparc64_defconfig
+++ b/arch/sparc/configs/sparc64_defconfig
@@ -6,7 +6,6 @@ CONFIG_LOG_BUF_SHIFT=18
 CONFIG_BLK_DEV_INITRD=y
 CONFIG_PERF_EVENTS=y
 # CONFIG_COMPAT_BRK is not set
-CONFIG_SLAB=y
 CONFIG_PROFILING=y
 CONFIG_KPROBES=y
 CONFIG_MODULES=y
diff --git a/arch/um/configs/i386_defconfig b/arch/um/configs/i386_defconfig
index c0162286d68b..05ae535ba0dc 100644
--- a/arch/um/configs/i386_defconfig
+++ b/arch/um/configs/i386_defconfig
@@ -22,7 +22,6 @@ CONFIG_BLK_CGROUP=y
 # CONFIG_PID_NS is not set
 CONFIG_SYSFS_DEPRECATED=y
 CONFIG_CC_OPTIMIZE_FOR_SIZE=y
-CONFIG_SLAB=y
 CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
 # CONFIG_BLK_DEV_BSG is not set
diff --git a/arch/um/configs/x86_64_defconfig b/arch/um/configs/x86_64_defconfig
index bec6e5d95687..1c757238be7f 100644
--- a/arch/um/configs/x86_64_defconfig
+++ b/arch/um/configs/x86_64_defconfig
@@ -20,7 +20,6 @@ CONFIG_BLK_CGROUP=y
 # CONFIG_PID_NS is not set
 CONFIG_SYSFS_DEPRECATED=y
 CONFIG_CC_OPTIMIZE_FOR_SIZE=y
-CONFIG_SLAB=y
 CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
 # CONFIG_BLK_DEV_BSG is not set
diff --git a/kernel/configs/tiny.config b/kernel/configs/tiny.config
index 144b2bd86b14..00009f7d0835 100644
--- a/kernel/configs/tiny.config
+++ b/kernel/configs/tiny.config
@@ -6,6 +6,5 @@ CONFIG_CC_OPTIMIZE_FOR_SIZE=y
 CONFIG_KERNEL_XZ=y
 # CONFIG_KERNEL_LZO is not set
 # CONFIG_KERNEL_LZ4 is not set
-# CONFIG_SLAB is not set
 CONFIG_SLUB=y
 CONFIG_SLUB_TINY=y
diff --git a/mm/Kconfig b/mm/Kconfig
index 7672a22647b4..b537c4436d18 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -218,11 +218,18 @@ choice
 	help
 	   This option allows to select a slab allocator.
 
-config SLAB
-	bool "SLAB"
+config SLAB_DEPRECATED
+	bool "SLAB (DEPRECATED)"
 	depends on !PREEMPT_RT
 	select HAVE_HARDENED_USERCOPY_ALLOCATOR
 	help
+	  Deprecated and scheduled for removal in a few cycles. Replaced by
+	  SLUB.
+
+	  If you cannot migrate to SLUB, please contact linux-mm@kvack.org
+	  and the people listed in the SLAB ALLOCATOR section of MAINTAINERS
+	  file, explaining why.
+
 	  The regular slab allocator that is established and known to work
 	  well in all environments. It organizes cache hot objects in
 	  per cpu and per node queues.
@@ -240,6 +247,11 @@ config SLUB
 
 endchoice
 
+config SLAB
+	bool
+	default y
+	depends on SLAB_DEPRECATED
+
 config SLUB_TINY
 	bool "Configure SLUB for minimal memory footprint"
 	depends on SLUB && EXPERT
-- 
2.40.1

