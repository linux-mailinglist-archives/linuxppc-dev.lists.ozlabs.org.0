Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 071382DB436
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Dec 2020 20:05:17 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CwSPk2fk8zDqML
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Dec 2020 06:05:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yahoo.ca (client-ip=98.137.64.31;
 helo=sonic307-55.consmr.mail.gq1.yahoo.com; envelope-from=alex_y_xu@yahoo.ca;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=yahoo.ca
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=yahoo.ca header.i=@yahoo.ca header.a=rsa-sha256
 header.s=s2048 header.b=J0wbwaYZ; dkim-atps=neutral
Received: from sonic307-55.consmr.mail.gq1.yahoo.com
 (sonic307-55.consmr.mail.gq1.yahoo.com [98.137.64.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CwSMq4YfWzDqKJ
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Dec 2020 06:03:31 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.ca; s=s2048;
 t=1608059005; bh=I0jiLyDxoZo0QxzWxtT/EtBWSiZrP2Uzfod/at7Yz3g=;
 h=From:To:Cc:Subject:Date:References:From:Subject;
 b=J0wbwaYZMjrnssZNGP078N0+Lr4dhteZof8Zw34SoL+K4EdAZ2bZmyBL8A86HwxfRyS7KXRgEGEQ9Sg2Fq/zWoR92wcsHNUa5X6alxvoIwgGWZDr7Rkt/tuePECbEfqAGR7y/YWiBDiUtr+mx+ejAvcqtwl6O4gHogyh43iyUf+9r7+gZvPqZRNisMflF651hF7vr0hasI6jWjk6owQYnXjKVQakTtgEEvEE17GEi4pm4Exxah4mwoxxFfZEcrXRuFpv6GpwHKTty7Gmm9BWWksb75auMUrkpRr6/M3LlXg0nlnIux5YfTHYt3i81cxb+QNulclzSQFCtAs0nrRWbw==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1608059005; bh=vOZ2Tk2oiyR6yYpPOq5y828Y04sMCKNx9W/8QFPOUgD=;
 h=From:To:Subject:Date:From:Subject;
 b=WqY1MhiXgAZTllG8SW659NPh7RB3HzcTu9JqZqLvHcYP1WT9jS9cc3rnZEZ8udFGvwLwwJPRUvf0LdK48zSEQrk3lRAPjBd8F8J7tK2N5nSrSgakaXuB56hNqRU2mwyCPX9Mhbnh+PT4axcN1DhuohDdCRFGmds62TTJfS8pfzYtFhDqHXZ2gOkhJTjHqPFhCX+v3yzrmOmWD9x5vWft1g4b9+F6Vwhnwlh3iB6lreCKwwYgBPAmU8uYn1ZD+xZExMugdRpW9YbPJ1EtDKQ68jPbvB4L7VUGjAZXgTg0vizoVUVamJiGeSx/bt2G4QbJ+++t3Nr+7dz5CRcRUovTCA==
X-YMail-OSG: At6taGEVM1kAYztlq.dPKJyzydz.v6iXrtUwI0bMAzqv8tmX48gI7IIREGZj4SN
 TOMyvRNuv3Dzl_UgiAa1BlFWlq9HVpQlrKyVctfzB8fExAkFffY7eCV92dMUXg7WaXzjOvPfEpWP
 zx_oziJ47MXvZOtEO33Vi3wsd7uRDETOSi7TB7wbXOUmTGypCHeSflqEaNOp9yyUpbyk9lY7se7G
 Dsu7EkxQbBhYs0m1SExbEJvaStsmx7S7ARPNwAyRaca83Rd4k1ev1eviRWoQWIS7oMu7QI8qrV5B
 n2BbG11O2I5qb7AaVi9BsK5xNNyO2RB5uaZ39M7R11K4prt7SimMR3B3oayepCWBW2ypqr3ffvME
 8eBK_asdHis8u4A2mnCjI1TgJrlZr4L.uZbeSux8nroOT6NDoSmGQGabI86_vUhUU9TdJCas6ykH
 KVaShlHHYodMDq1ZPSgqEOQ35Qata8Q2htHSzaopm2DUnu.PmxkXsMNwGUGGGLWq36ei0dECPU9B
 13ogNBakBi5ko4p7bYdRF.aM96_zuy.VsCnKzSOPjGgZsMYCpGjzj3u4.jEkcKwaJR0CFPNAXduI
 P6NrgKTeWQ6oBG6Z36rMWNnbt8uU4Y0T2ZhaEpkG84MX.vbGmb84e6QUJmKPqSCc.S6jb0PlF1QZ
 _PdIduJooR_wJ_w.MBNAT7pM5TSVSSiwXsN3bcT_glUPVPtHpspzs180hJksgaV3VkeokhMN96cw
 _PhfXMT8ZVXyQt8qqjCYG_X9Cu1CrGMu0LmbNsZsKGAOp1dXM6gdgTQHa0I0reU5jIE7zyAqJzrr
 TV_A42vLKxVegGMeRLvA7UQwEUFXr3n2FZ6k70SJ23SmpQv_2rGNDHD6h1S5DT0rYawAzyz7DDso
 9Wjhn4qnVVtRSbLPnEYkkd3WYMros15.t7PxHhD8H8kajjotc0bZLKg7pUSARsodkdgzsCPQ6CFB
 e5eLec30SGnv1KimQ.2DcbVPFfBW8aq3jLSd8bJ53ZVxhJJd3lswtx6_ewQ8_5be2CGygSyeOxJS
 NLcly.nWkdTuO2Gu7XM1XKqyXXxjc0DDiQ.UlvGMSi0vKx0PDbn8CRs1ANQ64B3kKL38oRRb6FNk
 KL9k83Jf26Nbgf6_czkPQ7e9liohISHR7qTXMt2yqmgTtxe7P8h06KPEB8pqHONk30QUZn1IgwHP
 56ifP8hSC60FHOjGrKKQDhL.9MznqmNlPQNUbVckuyskWHdweg.cHAVM4mQQDKaj0FQUf_UavXSm
 xrQrvo4UNztwASwEspq216ErzZru__IIeUk3UvuKo9fPTd3m6jEqk1TgKkmch_QL23.XrECs8nQa
 Jo9gg2epuEI.9ChH._uSVS5bNHTlz8inQNaNKMoVM0KeG9kDNLZOrIiVrnqVnbuJMqz4aLXOeyzP
 M6ivm2Ry0mGOvP1CpkA4avrGJd.9Qe3DXCnCaCRxb.32FQiczGZvjpgNRjMqhSYoQnhEGiYefQLl
 OFpiRZKHDOKUgzL_oR9mUuS7uBLxeZZq.xN2E3MIN8iPra2tLCGth0NEX8XelrLH.DwHoe4b0T5F
 dpL1bNnmG4SCaFQm9.ZI2sYomqv_vnWKizFUD_0kongSUCDMB_axeKxM.9o.uroAWJL.hQEK3fEz
 LJoqMRRbPHSobwdZiySs4EHqPQasltrPG7OYH.uHzVBri483QH0Cdh2uZFgxGbtBc5yxq2tW0WG5
 DwPMtuelSLLX_5QkhBvnqTultyFY1VWO03eRJS6aFrs9.YJnzKIebbPAds4Tu2NySStmt9AUwHv_
 my_nnY6n8cSN3Hv_P0m.6hHwCkBFUxs9FbdggMsYnyd5lVWu_VOQsOZVBDos2HWS3ifDYoYwFAAd
 Btj6oINFIfIP.C_L0NXgH5DEj_h.H1b4vh.3LW3zmSwyAV8mVIgYAA2g4pgp_IkRA8JtyNVMhOLk
 m0vQVwtzNii8nwTZeXIT9EUkPAAQEXVIRdagRwCmbRrOhftzl1PAXQej6VNgJrDNsCI4Veg67ZRN
 gki3aa3f8JK1hejDSNTfVzPtVUsLPjQuOEVv.jJCvhpbZ97hgIPLGdQOOcm7LmXb9wk0Xgi__lI.
 KaMHjQRdnHV4BH07Jtez7u1IcMWnPOUld60ElnB4WKu9_ohnTwobdKMBOXLHWbFsyKyhr0apnhV0
 AYTWg_sr2.Z8aAFpDneuAXOx5hFsPPOBvjaUmnMh1JKR2F8Dd08KItE.Rh6XRCk6bPCMQ8p3G.8c
 r4Xj4PKdEHp6SHs4uQmdW_JeTL009OPSkHv8SGpKJBSuNlnY80RsYKzxU1E1_gH_2CJ7LXgAr83.
 K9nPB4WWtQTdFIpj2JazqcnLpMRU6v2J1eTLtwzCH029PTeWRJ1st0pcRucOikxK1ZFOWYg2DQEw
 JWf8egM7JL2F0g0iTZhLsye.AxO6MSkwnw8mI49gsShfAOU562jToe5W5mCC5iZlgwwPKVWEuhGa
 yRnPBYYJ06w.oM02HNwjHNfOba62kvLYkKNgv5LkFC4Xq.bMyBOyQ3meFG1i9jKxwhWq_IVG4ID1
 3lHDUUbIUlF1uzPBh01h2GQCwQOO2drOFPWTgaSuzNc3Ctsvdb6Mi0ns.VY04Jb8xokHcdVQCUUL
 PDggI9N5E90upspEpMBmfg7VPubPm4e4BCVVijrwhGYYdB9LEjf61JMonuKYbgxxXrEZqKENYi0O
 SPwNoniVCoIx9pBhHZA6iaYoFd7uBTAFGz0yLgLeuZKbDA7w6wW4D0RQQ_LUBBsXJ4dsrRHBgo5V
 XxbqyPU._swoj4bTA9UVV5rkUAsWmw5HBT6a.zKWryhW6XTuPfnTiASZYIQs0doUKFrpt_wb7hmY
 5EJRwS5L_66.EHu_VGNj4K62mdhiKZU3El6DUSpa8wiO3qzz4Y6jn7XFifmH4OIPiYBY02KaaRD3
 1p0BobBYSqQS98SjnccPApehZml.Eb1hriEiWynRolqdq.9ymfXGedcszKcyM915BeOgdeZyESJZ
 VciyFQALySaztZUSyUD__eklqelYKYWtM_g8LQ_gV1dKagn4fu3BCr7OI.X_NigOaMB3v
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic307.consmr.mail.gq1.yahoo.com with HTTP; Tue, 15 Dec 2020 19:03:25 +0000
Received: by smtp408.mail.ne1.yahoo.com (VZM Hermes SMTP Server) with ESMTPA
 ID ad7f36f89702fca63575808912db3f47; 
 Tue, 15 Dec 2020 19:03:18 +0000 (UTC)
From: "Alex Xu (Hello71)" <alex_y_xu@yahoo.ca>
To: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-mips@vger.kernel.org, openrisc@lists.librecores.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-sh@vger.kernel.org, linux-xtensa@linux-xtensa.org
Subject: [RFC PATCH] treewide: remove bzip2 compression support
Date: Tue, 15 Dec 2020 14:03:15 -0500
Message-Id: <20201215190315.8681-1-alex_y_xu@yahoo.ca>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
References: <20201215190315.8681-1-alex_y_xu.ref@yahoo.ca>
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
Cc: torvalds@linux-foundation.org, "Alex Xu \(Hello71\)" <alex_y_xu@yahoo.ca>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

bzip2 is either slower or larger than every other supported algorithm,
according to benchmarks at [0]. It is far slower to decompress than any
other algorithm, and still larger than lzma, xz, and zstd.

[0] https://lore.kernel.org/lkml/1588791882.08g1378g67.none@localhost/

Signed-off-by: Alex Xu (Hello71) <alex_y_xu@yahoo.ca>
---
 Documentation/x86/boot.rst                 |   8 +-
 arch/arm/configs/aspeed_g4_defconfig       |   1 -
 arch/arm/configs/aspeed_g5_defconfig       |   1 -
 arch/arm/configs/ezx_defconfig             |   1 -
 arch/arm/configs/imote2_defconfig          |   1 -
 arch/arm/configs/lpc18xx_defconfig         |   1 -
 arch/arm/configs/vf610m4_defconfig         |   1 -
 arch/arm64/boot/Makefile                   |   5 +-
 arch/mips/Kconfig                          |   1 -
 arch/mips/Makefile                         |   3 -
 arch/mips/boot/Makefile                    |  14 -
 arch/mips/boot/compressed/Makefile         |   1 -
 arch/mips/boot/compressed/decompress.c     |   4 -
 arch/mips/configs/ath25_defconfig          |   1 -
 arch/mips/configs/pistachio_defconfig      |   1 -
 arch/openrisc/configs/simple_smp_defconfig |   1 -
 arch/parisc/Kconfig                        |   1 -
 arch/parisc/boot/compressed/Makefile       |   5 +-
 arch/parisc/boot/compressed/misc.c         |   4 -
 arch/powerpc/configs/skiroot_defconfig     |   1 -
 arch/riscv/boot/Makefile                   |   3 -
 arch/riscv/configs/nommu_k210_defconfig    |   1 -
 arch/riscv/configs/nommu_virt_defconfig    |   1 -
 arch/s390/Kconfig                          |   1 -
 arch/s390/boot/compressed/Makefile         |   5 +-
 arch/s390/boot/compressed/decompressor.c   |   8 -
 arch/sh/Kconfig                            |   1 -
 arch/sh/Makefile                           |   3 +-
 arch/sh/boot/Makefile                      |  11 +-
 arch/sh/boot/compressed/Makefile           |   5 +-
 arch/sh/boot/compressed/misc.c             |   8 -
 arch/sh/configs/sdk7786_defconfig          |   1 -
 arch/x86/Kconfig                           |   1 -
 arch/x86/boot/compressed/Makefile          |   9 +-
 arch/x86/boot/compressed/misc.c            |   4 -
 arch/x86/include/asm/boot.h                |   4 +-
 arch/xtensa/configs/cadence_csp_defconfig  |   1 -
 arch/xtensa/configs/nommu_kc705_defconfig  |   1 -
 include/linux/decompress/bunzip2.h         |  11 -
 init/Kconfig                               |  22 +-
 init/do_mounts_rd.c                        |   1 -
 kernel/configs/tiny.config                 |   1 -
 lib/Kconfig                                |   3 -
 lib/Makefile                               |   1 -
 lib/decompress.c                           |   5 -
 lib/decompress_bunzip2.c                   | 756 ---------------------
 scripts/Makefile.lib                       |   8 +-
 scripts/Makefile.package                   |   1 -
 scripts/package/buildtar                   |   2 +-
 usr/Kconfig                                |  26 +-
 usr/Makefile                               |   3 +-
 51 files changed, 22 insertions(+), 942 deletions(-)
 delete mode 100644 include/linux/decompress/bunzip2.h
 delete mode 100644 lib/decompress_bunzip2.c

diff --git a/Documentation/x86/boot.rst b/Documentation/x86/boot.rst
index abb9fc164657..741eebc10140 100644
--- a/Documentation/x86/boot.rst
+++ b/Documentation/x86/boot.rst
@@ -781,10 +781,10 @@ Protocol:	2.08+
   The payload may be compressed. The format of both the compressed and
   uncompressed data should be determined using the standard magic
   numbers.  The currently supported compression formats are gzip
-  (magic numbers 1F 8B or 1F 9E), bzip2 (magic number 42 5A), LZMA
-  (magic number 5D 00), XZ (magic number FD 37), LZ4 (magic number
-  02 21) and ZSTD (magic number 28 B5). The uncompressed payload is
-  currently always ELF (magic number 7F 45 4C 46).
+  (magic numbers 1F 8B or 1F 9E), LZMA (magic number 5D 00), XZ (magic
+  number FD 37), LZ4 (magic number 02 21) and ZSTD (magic number 28 B5).
+  Formerly supported was bzip2 (magic number 42 5A). The uncompressed
+  payload is currently always ELF (magic number 7F 45 4C 46).
 
 ============	==============
 Field name:	payload_length
diff --git a/arch/arm/configs/aspeed_g4_defconfig b/arch/arm/configs/aspeed_g4_defconfig
index 58d293b63581..f2f5dcd0e59c 100644
--- a/arch/arm/configs/aspeed_g4_defconfig
+++ b/arch/arm/configs/aspeed_g4_defconfig
@@ -8,7 +8,6 @@ CONFIG_IKCONFIG_PROC=y
 CONFIG_LOG_BUF_SHIFT=16
 CONFIG_CGROUPS=y
 CONFIG_BLK_DEV_INITRD=y
-# CONFIG_RD_BZIP2 is not set
 # CONFIG_RD_LZO is not set
 # CONFIG_RD_LZ4 is not set
 # CONFIG_UID16 is not set
diff --git a/arch/arm/configs/aspeed_g5_defconfig b/arch/arm/configs/aspeed_g5_defconfig
index 047975eccefb..5d045b2902d6 100644
--- a/arch/arm/configs/aspeed_g5_defconfig
+++ b/arch/arm/configs/aspeed_g5_defconfig
@@ -8,7 +8,6 @@ CONFIG_IKCONFIG_PROC=y
 CONFIG_LOG_BUF_SHIFT=16
 CONFIG_CGROUPS=y
 CONFIG_BLK_DEV_INITRD=y
-# CONFIG_RD_BZIP2 is not set
 # CONFIG_RD_LZO is not set
 # CONFIG_RD_LZ4 is not set
 # CONFIG_UID16 is not set
diff --git a/arch/arm/configs/ezx_defconfig b/arch/arm/configs/ezx_defconfig
index 81665b7abf83..422592786e01 100644
--- a/arch/arm/configs/ezx_defconfig
+++ b/arch/arm/configs/ezx_defconfig
@@ -4,7 +4,6 @@ CONFIG_SYSVIPC=y
 CONFIG_LOG_BUF_SHIFT=14
 CONFIG_SYSFS_DEPRECATED_V2=y
 CONFIG_BLK_DEV_INITRD=y
-CONFIG_RD_BZIP2=y
 CONFIG_RD_LZMA=y
 CONFIG_EXPERT=y
 # CONFIG_COMPAT_BRK is not set
diff --git a/arch/arm/configs/imote2_defconfig b/arch/arm/configs/imote2_defconfig
index ae15a2a33802..04e23ec01af6 100644
--- a/arch/arm/configs/imote2_defconfig
+++ b/arch/arm/configs/imote2_defconfig
@@ -3,7 +3,6 @@ CONFIG_SYSVIPC=y
 CONFIG_LOG_BUF_SHIFT=14
 CONFIG_SYSFS_DEPRECATED_V2=y
 CONFIG_BLK_DEV_INITRD=y
-CONFIG_RD_BZIP2=y
 CONFIG_RD_LZMA=y
 CONFIG_EXPERT=y
 # CONFIG_COMPAT_BRK is not set
diff --git a/arch/arm/configs/lpc18xx_defconfig b/arch/arm/configs/lpc18xx_defconfig
index be882ea0eee4..12e69dfa18dc 100644
--- a/arch/arm/configs/lpc18xx_defconfig
+++ b/arch/arm/configs/lpc18xx_defconfig
@@ -1,7 +1,6 @@
 CONFIG_HIGH_RES_TIMERS=y
 CONFIG_PREEMPT=y
 CONFIG_BLK_DEV_INITRD=y
-# CONFIG_RD_BZIP2 is not set
 # CONFIG_RD_LZMA is not set
 # CONFIG_RD_XZ is not set
 # CONFIG_RD_LZO is not set
diff --git a/arch/arm/configs/vf610m4_defconfig b/arch/arm/configs/vf610m4_defconfig
index a89f035c3b01..02c7acc7cd09 100644
--- a/arch/arm/configs/vf610m4_defconfig
+++ b/arch/arm/configs/vf610m4_defconfig
@@ -1,6 +1,5 @@
 CONFIG_NAMESPACES=y
 CONFIG_BLK_DEV_INITRD=y
-# CONFIG_RD_BZIP2 is not set
 # CONFIG_RD_LZMA is not set
 # CONFIG_RD_XZ is not set
 # CONFIG_RD_LZ4 is not set
diff --git a/arch/arm64/boot/Makefile b/arch/arm64/boot/Makefile
index cd3414898d10..d3207561c078 100644
--- a/arch/arm64/boot/Makefile
+++ b/arch/arm64/boot/Makefile
@@ -16,14 +16,11 @@
 
 OBJCOPYFLAGS_Image :=-O binary -R .note -R .note.gnu.build-id -R .comment -S
 
-targets := Image Image.bz2 Image.gz Image.lz4 Image.lzma Image.lzo
+targets := Image Image.gz Image.lz4 Image.lzma Image.lzo
 
 $(obj)/Image: vmlinux FORCE
 	$(call if_changed,objcopy)
 
-$(obj)/Image.bz2: $(obj)/Image FORCE
-	$(call if_changed,bzip2)
-
 $(obj)/Image.gz: $(obj)/Image FORCE
 	$(call if_changed,gzip)
 
diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 6b762bebff33..d25d900294bb 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -1880,7 +1880,6 @@ endif # CPU_LOONGSON2F
 config SYS_SUPPORTS_ZBOOT
 	bool
 	select HAVE_KERNEL_GZIP
-	select HAVE_KERNEL_BZIP2
 	select HAVE_KERNEL_LZ4
 	select HAVE_KERNEL_LZMA
 	select HAVE_KERNEL_LZO
diff --git a/arch/mips/Makefile b/arch/mips/Makefile
index 0d0f29d662c9..2dd53daf6fbb 100644
--- a/arch/mips/Makefile
+++ b/arch/mips/Makefile
@@ -328,14 +328,12 @@ boot-y			+= vmlinux.srec
 ifeq ($(shell expr $(load-y) \< 0xffffffff80000000 2> /dev/null), 0)
 boot-y			+= uImage
 boot-y			+= uImage.bin
-boot-y			+= uImage.bz2
 boot-y			+= uImage.gz
 boot-y			+= uImage.lzma
 boot-y			+= uImage.lzo
 endif
 boot-y			+= vmlinux.itb
 boot-y			+= vmlinux.gz.itb
-boot-y			+= vmlinux.bz2.itb
 boot-y			+= vmlinux.lzma.itb
 boot-y			+= vmlinux.lzo.itb
 
@@ -429,7 +427,6 @@ define archhelp
 	echo '  vmlinuz.srec         - SREC zboot image'
 	echo '  uImage               - U-Boot image'
 	echo '  uImage.bin           - U-Boot image (uncompressed)'
-	echo '  uImage.bz2           - U-Boot image (bz2)'
 	echo '  uImage.gz            - U-Boot image (gzip)'
 	echo '  uImage.lzma          - U-Boot image (lzma)'
 	echo '  uImage.lzo           - U-Boot image (lzo)'
diff --git a/arch/mips/boot/Makefile b/arch/mips/boot/Makefile
index a3da2c5d63c2..78f70e3576cd 100644
--- a/arch/mips/boot/Makefile
+++ b/arch/mips/boot/Makefile
@@ -24,7 +24,6 @@ strip-flags   := $(addprefix --remove-section=,$(drop-sections))
 hostprogs := elf2ecoff
 
 suffix-y			:= bin
-suffix-$(CONFIG_KERNEL_BZIP2)	:= bz2
 suffix-$(CONFIG_KERNEL_GZIP)	:= gz
 suffix-$(CONFIG_KERNEL_LZMA)	:= lzma
 suffix-$(CONFIG_KERNEL_LZO)	:= lzo
@@ -54,14 +53,10 @@ UIMAGE_ENTRYADDR = $(VMLINUX_ENTRY_ADDRESS)
 # Compressed vmlinux images
 #
 
-extra-y += vmlinux.bin.bz2
 extra-y += vmlinux.bin.gz
 extra-y += vmlinux.bin.lzma
 extra-y += vmlinux.bin.lzo
 
-$(obj)/vmlinux.bin.bz2: $(obj)/vmlinux.bin FORCE
-	$(call if_changed,bzip2)
-
 $(obj)/vmlinux.bin.gz: $(obj)/vmlinux.bin FORCE
 	$(call if_changed,gzip)
 
@@ -77,7 +72,6 @@ $(obj)/vmlinux.bin.lzo: $(obj)/vmlinux.bin FORCE
 
 targets += uImage
 targets += uImage.bin
-targets += uImage.bz2
 targets += uImage.gz
 targets += uImage.lzma
 targets += uImage.lzo
@@ -85,9 +79,6 @@ targets += uImage.lzo
 $(obj)/uImage.bin: $(obj)/vmlinux.bin FORCE
 	$(call if_changed,uimage,none)
 
-$(obj)/uImage.bz2: $(obj)/vmlinux.bin.bz2 FORCE
-	$(call if_changed,uimage,bzip2)
-
 $(obj)/uImage.gz: $(obj)/vmlinux.bin.gz FORCE
 	$(call if_changed,uimage,gzip)
 
@@ -122,7 +113,6 @@ $(obj)/vmlinux.its.S: $(addprefix $(srctree)/arch/mips/$(PLATFORM)/,$(ITS_INPUTS
 
 targets += vmlinux.its
 targets += vmlinux.gz.its
-targets += vmlinux.bz2.its
 targets += vmlinux.lzma.its
 targets += vmlinux.lzo.its
 
@@ -142,9 +132,6 @@ $(obj)/vmlinux.its: $(obj)/vmlinux.its.S $(VMLINUX) FORCE
 $(obj)/vmlinux.gz.its: $(obj)/vmlinux.its.S $(VMLINUX) FORCE
 	$(call if_changed,cpp_its_S,gzip,vmlinux.bin.gz)
 
-$(obj)/vmlinux.bz2.its: $(obj)/vmlinux.its.S $(VMLINUX)  FORCE
-	$(call if_changed,cpp_its_S,bzip2,vmlinux.bin.bz2)
-
 $(obj)/vmlinux.lzma.its: $(obj)/vmlinux.its.S $(VMLINUX) FORCE
 	$(call if_changed,cpp_its_S,lzma,vmlinux.bin.lzma)
 
@@ -153,7 +140,6 @@ $(obj)/vmlinux.lzo.its: $(obj)/vmlinux.its.S $(VMLINUX) FORCE
 
 targets += vmlinux.itb
 targets += vmlinux.gz.itb
-targets += vmlinux.bz2.itb
 targets += vmlinux.lzma.itb
 targets += vmlinux.lzo.itb
 
diff --git a/arch/mips/boot/compressed/Makefile b/arch/mips/boot/compressed/Makefile
index d66511825fe1..8fbd72b466e6 100644
--- a/arch/mips/boot/compressed/Makefile
+++ b/arch/mips/boot/compressed/Makefile
@@ -70,7 +70,6 @@ $(obj)/vmlinux.bin: $(KBUILD_IMAGE) FORCE
 	$(call if_changed,objcopy)
 
 tool_$(CONFIG_KERNEL_GZIP)    = gzip
-tool_$(CONFIG_KERNEL_BZIP2)   = bzip2
 tool_$(CONFIG_KERNEL_LZ4)     = lz4
 tool_$(CONFIG_KERNEL_LZMA)    = lzma
 tool_$(CONFIG_KERNEL_LZO)     = lzo
diff --git a/arch/mips/boot/compressed/decompress.c b/arch/mips/boot/compressed/decompress.c
index c61c641674e6..ac7ccab2bb52 100644
--- a/arch/mips/boot/compressed/decompress.c
+++ b/arch/mips/boot/compressed/decompress.c
@@ -52,10 +52,6 @@ void error(char *x)
 #include "../../../../lib/decompress_inflate.c"
 #endif
 
-#ifdef CONFIG_KERNEL_BZIP2
-#include "../../../../lib/decompress_bunzip2.c"
-#endif
-
 #ifdef CONFIG_KERNEL_LZ4
 #include "../../../../lib/decompress_unlz4.c"
 #endif
diff --git a/arch/mips/configs/ath25_defconfig b/arch/mips/configs/ath25_defconfig
index 7143441f5476..1e12d3018c15 100644
--- a/arch/mips/configs/ath25_defconfig
+++ b/arch/mips/configs/ath25_defconfig
@@ -4,7 +4,6 @@ CONFIG_SYSVIPC=y
 CONFIG_HIGH_RES_TIMERS=y
 CONFIG_BLK_DEV_INITRD=y
 # CONFIG_RD_GZIP is not set
-# CONFIG_RD_BZIP2 is not set
 # CONFIG_RD_XZ is not set
 # CONFIG_RD_LZO is not set
 # CONFIG_RD_LZ4 is not set
diff --git a/arch/mips/configs/pistachio_defconfig b/arch/mips/configs/pistachio_defconfig
index b9adf15ebbec..ad31439400c6 100644
--- a/arch/mips/configs/pistachio_defconfig
+++ b/arch/mips/configs/pistachio_defconfig
@@ -14,7 +14,6 @@ CONFIG_CGROUP_FREEZER=y
 CONFIG_NAMESPACES=y
 CONFIG_USER_NS=y
 CONFIG_BLK_DEV_INITRD=y
-# CONFIG_RD_BZIP2 is not set
 # CONFIG_RD_LZMA is not set
 # CONFIG_RD_LZO is not set
 # CONFIG_RD_LZ4 is not set
diff --git a/arch/openrisc/configs/simple_smp_defconfig b/arch/openrisc/configs/simple_smp_defconfig
index ff49d868e040..74a5fe83aa17 100644
--- a/arch/openrisc/configs/simple_smp_defconfig
+++ b/arch/openrisc/configs/simple_smp_defconfig
@@ -3,7 +3,6 @@ CONFIG_NO_HZ=y
 CONFIG_LOG_BUF_SHIFT=14
 CONFIG_BLK_DEV_INITRD=y
 # CONFIG_RD_GZIP is not set
-# CONFIG_RD_BZIP2 is not set
 # CONFIG_RD_LZMA is not set
 # CONFIG_RD_XZ is not set
 # CONFIG_RD_LZO is not set
diff --git a/arch/parisc/Kconfig b/arch/parisc/Kconfig
index b234e8154cbd..4eee43c1e7d9 100644
--- a/arch/parisc/Kconfig
+++ b/arch/parisc/Kconfig
@@ -22,7 +22,6 @@ config PARISC
 	select BUILDTIME_TABLE_SORT
 	select HAVE_PCI
 	select HAVE_PERF_EVENTS
-	select HAVE_KERNEL_BZIP2
 	select HAVE_KERNEL_GZIP
 	select HAVE_KERNEL_LZ4
 	select HAVE_KERNEL_LZMA
diff --git a/arch/parisc/boot/compressed/Makefile b/arch/parisc/boot/compressed/Makefile
index dff453687530..2c9403ebb96a 100644
--- a/arch/parisc/boot/compressed/Makefile
+++ b/arch/parisc/boot/compressed/Makefile
@@ -9,7 +9,7 @@ KCOV_INSTRUMENT := n
 GCOV_PROFILE := n
 UBSAN_SANITIZE := n
 
-targets := vmlinux.lds vmlinux vmlinux.bin vmlinux.bin.gz vmlinux.bin.bz2
+targets := vmlinux.lds vmlinux vmlinux.bin vmlinux.bin.gz
 targets += vmlinux.bin.xz vmlinux.bin.lzma vmlinux.bin.lzo vmlinux.bin.lz4
 targets += misc.o piggy.o sizes.h head.o real2.o firmware.o
 targets += real2.S firmware.c
@@ -64,7 +64,6 @@ $(obj)/vmlinux.bin: vmlinux FORCE
 vmlinux.bin.all-y := $(obj)/vmlinux.bin
 
 suffix-$(CONFIG_KERNEL_GZIP)  := gz
-suffix-$(CONFIG_KERNEL_BZIP2) := bz2
 suffix-$(CONFIG_KERNEL_LZ4)  := lz4
 suffix-$(CONFIG_KERNEL_LZMA)  := lzma
 suffix-$(CONFIG_KERNEL_LZO)  := lzo
@@ -72,8 +71,6 @@ suffix-$(CONFIG_KERNEL_XZ)  := xz
 
 $(obj)/vmlinux.bin.gz: $(vmlinux.bin.all-y)
 	$(call if_changed,gzip)
-$(obj)/vmlinux.bin.bz2: $(vmlinux.bin.all-y)
-	$(call if_changed,bzip2)
 $(obj)/vmlinux.bin.lz4: $(vmlinux.bin.all-y)
 	$(call if_changed,lz4)
 $(obj)/vmlinux.bin.lzma: $(vmlinux.bin.all-y)
diff --git a/arch/parisc/boot/compressed/misc.c b/arch/parisc/boot/compressed/misc.c
index 2d395998f524..247a0b138cb1 100644
--- a/arch/parisc/boot/compressed/misc.c
+++ b/arch/parisc/boot/compressed/misc.c
@@ -42,10 +42,6 @@ static unsigned long free_mem_end_ptr;
 #include "../../../../lib/decompress_inflate.c"
 #endif
 
-#ifdef CONFIG_KERNEL_BZIP2
-#include "../../../../lib/decompress_bunzip2.c"
-#endif
-
 #ifdef CONFIG_KERNEL_LZ4
 #include "../../../../lib/decompress_unlz4.c"
 #endif
diff --git a/arch/powerpc/configs/skiroot_defconfig b/arch/powerpc/configs/skiroot_defconfig
index b806a5d3a695..28139c0294e9 100644
--- a/arch/powerpc/configs/skiroot_defconfig
+++ b/arch/powerpc/configs/skiroot_defconfig
@@ -11,7 +11,6 @@ CONFIG_IKCONFIG_PROC=y
 CONFIG_LOG_BUF_SHIFT=20
 CONFIG_BLK_DEV_INITRD=y
 # CONFIG_RD_GZIP is not set
-# CONFIG_RD_BZIP2 is not set
 # CONFIG_RD_LZMA is not set
 # CONFIG_RD_LZO is not set
 # CONFIG_RD_LZ4 is not set
diff --git a/arch/riscv/boot/Makefile b/arch/riscv/boot/Makefile
index c59fca695f9d..944ea5165225 100644
--- a/arch/riscv/boot/Makefile
+++ b/arch/riscv/boot/Makefile
@@ -31,9 +31,6 @@ $(obj)/loader.o: $(src)/loader.S $(obj)/Image
 $(obj)/loader: $(obj)/loader.o $(obj)/Image $(obj)/loader.lds FORCE
 	$(Q)$(LD) -T $(obj)/loader.lds -o $@ $(obj)/loader.o
 
-$(obj)/Image.bz2: $(obj)/Image FORCE
-	$(call if_changed,bzip2)
-
 $(obj)/Image.lz4: $(obj)/Image FORCE
 	$(call if_changed,lz4)
 
diff --git a/arch/riscv/configs/nommu_k210_defconfig b/arch/riscv/configs/nommu_k210_defconfig
index cd1df62b13c7..a71b615fa1b1 100644
--- a/arch/riscv/configs/nommu_k210_defconfig
+++ b/arch/riscv/configs/nommu_k210_defconfig
@@ -3,7 +3,6 @@ CONFIG_LOG_BUF_SHIFT=15
 CONFIG_PRINTK_SAFE_LOG_BUF_SHIFT=12
 CONFIG_BLK_DEV_INITRD=y
 CONFIG_INITRAMFS_FORCE=y
-# CONFIG_RD_BZIP2 is not set
 # CONFIG_RD_LZMA is not set
 # CONFIG_RD_XZ is not set
 # CONFIG_RD_LZO is not set
diff --git a/arch/riscv/configs/nommu_virt_defconfig b/arch/riscv/configs/nommu_virt_defconfig
index e046a0babde4..fb72b5d6c0ec 100644
--- a/arch/riscv/configs/nommu_virt_defconfig
+++ b/arch/riscv/configs/nommu_virt_defconfig
@@ -2,7 +2,6 @@
 CONFIG_LOG_BUF_SHIFT=16
 CONFIG_PRINTK_SAFE_LOG_BUF_SHIFT=12
 CONFIG_BLK_DEV_INITRD=y
-# CONFIG_RD_BZIP2 is not set
 # CONFIG_RD_LZMA is not set
 # CONFIG_RD_XZ is not set
 # CONFIG_RD_LZO is not set
diff --git a/arch/s390/Kconfig b/arch/s390/Kconfig
index a60cc523d810..4bdfe1d64836 100644
--- a/arch/s390/Kconfig
+++ b/arch/s390/Kconfig
@@ -153,7 +153,6 @@ config S390
 	select HAVE_FUTEX_CMPXCHG if FUTEX
 	select HAVE_GCC_PLUGINS
 	select HAVE_GENERIC_VDSO
-	select HAVE_KERNEL_BZIP2
 	select HAVE_KERNEL_GZIP
 	select HAVE_KERNEL_LZ4
 	select HAVE_KERNEL_LZMA
diff --git a/arch/s390/boot/compressed/Makefile b/arch/s390/boot/compressed/Makefile
index de18dab518bb..db11dc6264aa 100644
--- a/arch/s390/boot/compressed/Makefile
+++ b/arch/s390/boot/compressed/Makefile
@@ -12,7 +12,7 @@ KASAN_SANITIZE := n
 
 obj-y	:= $(if $(CONFIG_KERNEL_UNCOMPRESSED),,decompressor.o) info.o
 obj-all := $(obj-y) piggy.o syms.o
-targets	:= vmlinux.lds vmlinux vmlinux.bin vmlinux.bin.gz vmlinux.bin.bz2
+targets	:= vmlinux.lds vmlinux vmlinux.bin vmlinux.bin.gz
 targets += vmlinux.bin.xz vmlinux.bin.lzma vmlinux.bin.lzo vmlinux.bin.lz4
 targets += info.bin syms.bin vmlinux.syms $(obj-all)
 
@@ -58,7 +58,6 @@ $(obj)/vmlinux.bin: vmlinux FORCE
 vmlinux.bin.all-y := $(obj)/vmlinux.bin
 
 suffix-$(CONFIG_KERNEL_GZIP)  := .gz
-suffix-$(CONFIG_KERNEL_BZIP2) := .bz2
 suffix-$(CONFIG_KERNEL_LZ4)  := .lz4
 suffix-$(CONFIG_KERNEL_LZMA)  := .lzma
 suffix-$(CONFIG_KERNEL_LZO)  := .lzo
@@ -66,8 +65,6 @@ suffix-$(CONFIG_KERNEL_XZ)  := .xz
 
 $(obj)/vmlinux.bin.gz: $(vmlinux.bin.all-y) FORCE
 	$(call if_changed,gzip)
-$(obj)/vmlinux.bin.bz2: $(vmlinux.bin.all-y) FORCE
-	$(call if_changed,bzip2)
 $(obj)/vmlinux.bin.lz4: $(vmlinux.bin.all-y) FORCE
 	$(call if_changed,lz4)
 $(obj)/vmlinux.bin.lzma: $(vmlinux.bin.all-y) FORCE
diff --git a/arch/s390/boot/compressed/decompressor.c b/arch/s390/boot/compressed/decompressor.c
index 3061b11c4d27..87395950cc69 100644
--- a/arch/s390/boot/compressed/decompressor.c
+++ b/arch/s390/boot/compressed/decompressor.c
@@ -28,11 +28,7 @@ extern char _end[];
 extern unsigned char _compressed_start[];
 extern unsigned char _compressed_end[];
 
-#ifdef CONFIG_HAVE_KERNEL_BZIP2
-#define BOOT_HEAP_SIZE	0x400000
-#else
 #define BOOT_HEAP_SIZE	0x10000
-#endif
 
 static unsigned long free_mem_ptr = (unsigned long) _end;
 static unsigned long free_mem_end_ptr = (unsigned long) _end + BOOT_HEAP_SIZE;
@@ -41,10 +37,6 @@ static unsigned long free_mem_end_ptr = (unsigned long) _end + BOOT_HEAP_SIZE;
 #include "../../../../lib/decompress_inflate.c"
 #endif
 
-#ifdef CONFIG_KERNEL_BZIP2
-#include "../../../../lib/decompress_bunzip2.c"
-#endif
-
 #ifdef CONFIG_KERNEL_LZ4
 #include "../../../../lib/decompress_unlz4.c"
 #endif
diff --git a/arch/sh/Kconfig b/arch/sh/Kconfig
index 159da4ed578f..df4113457afd 100644
--- a/arch/sh/Kconfig
+++ b/arch/sh/Kconfig
@@ -42,7 +42,6 @@ config SUPERH
 	select HAVE_HW_BREAKPOINT
 	select HAVE_IDE if HAS_IOPORT_MAP
 	select HAVE_IOREMAP_PROT if MMU && !X2TLB
-	select HAVE_KERNEL_BZIP2
 	select HAVE_KERNEL_GZIP
 	select HAVE_KERNEL_LZMA
 	select HAVE_KERNEL_LZO
diff --git a/arch/sh/Makefile b/arch/sh/Makefile
index 2faebfd72eca..6fdaa8d2d835 100644
--- a/arch/sh/Makefile
+++ b/arch/sh/Makefile
@@ -189,7 +189,7 @@ endif
 
 libs-y			:= arch/sh/lib/	$(libs-y)
 
-BOOT_TARGETS = uImage uImage.bz2 uImage.gz uImage.lzma uImage.xz uImage.lzo \
+BOOT_TARGETS = uImage uImage.gz uImage.lzma uImage.xz uImage.lzo \
 	       uImage.srec uImage.bin zImage vmlinux.bin vmlinux.srec \
 	       romImage
 PHONY += $(BOOT_TARGETS)
@@ -220,7 +220,6 @@ define archhelp
 	@echo '  uImage.srec	           - Create an S-record for U-Boot'
 	@echo '  uImage.bin	           - Kernel-only image for U-Boot (bin)'
 	@echo '* uImage.gz	           - Kernel-only image for U-Boot (gzip)'
-	@echo '  uImage.bz2	           - Kernel-only image for U-Boot (bzip2)'
 	@echo '  uImage.lzma	           - Kernel-only image for U-Boot (lzma)'
 	@echo '  uImage.xz	           - Kernel-only image for U-Boot (xz)'
 	@echo '  uImage.lzo	           - Kernel-only image for U-Boot (lzo)'
diff --git a/arch/sh/boot/Makefile b/arch/sh/boot/Makefile
index 58592dfa5cb6..8f742b8285a5 100644
--- a/arch/sh/boot/Makefile
+++ b/arch/sh/boot/Makefile
@@ -21,14 +21,13 @@ CONFIG_PHYSICAL_START	?= $(CONFIG_MEMORY_START)
 
 suffix-y := bin
 suffix-$(CONFIG_KERNEL_GZIP)	:= gz
-suffix-$(CONFIG_KERNEL_BZIP2)	:= bz2
 suffix-$(CONFIG_KERNEL_LZMA)	:= lzma
 suffix-$(CONFIG_KERNEL_XZ)	:= xz
 suffix-$(CONFIG_KERNEL_LZO)	:= lzo
 
 targets := zImage vmlinux.srec romImage uImage uImage.srec uImage.gz \
-	   uImage.bz2 uImage.lzma uImage.xz uImage.lzo uImage.bin
-extra-y += vmlinux.bin vmlinux.bin.gz vmlinux.bin.bz2 vmlinux.bin.lzma \
+	   uImage.lzma uImage.xz uImage.lzo uImage.bin
+extra-y += vmlinux.bin vmlinux.bin.gz vmlinux.bin.lzma \
 	   vmlinux.bin.xz vmlinux.bin.lzo
 subdir- := compressed romimage
 
@@ -68,9 +67,6 @@ $(obj)/vmlinux.bin: vmlinux FORCE
 $(obj)/vmlinux.bin.gz: $(obj)/vmlinux.bin FORCE
 	$(call if_changed,gzip)
 
-$(obj)/vmlinux.bin.bz2: $(obj)/vmlinux.bin FORCE
-	$(call if_changed,bzip2)
-
 $(obj)/vmlinux.bin.lzma: $(obj)/vmlinux.bin FORCE
 	$(call if_changed,lzma)
 
@@ -80,9 +76,6 @@ $(obj)/vmlinux.bin.xz: $(obj)/vmlinux.bin FORCE
 $(obj)/vmlinux.bin.lzo: $(obj)/vmlinux.bin FORCE
 	$(call if_changed,lzo)
 
-$(obj)/uImage.bz2: $(obj)/vmlinux.bin.bz2
-	$(call if_changed,uimage,bzip2)
-
 $(obj)/uImage.gz: $(obj)/vmlinux.bin.gz
 	$(call if_changed,uimage,gzip)
 
diff --git a/arch/sh/boot/compressed/Makefile b/arch/sh/boot/compressed/Makefile
index 589d2d8a573d..641b16826383 100644
--- a/arch/sh/boot/compressed/Makefile
+++ b/arch/sh/boot/compressed/Makefile
@@ -6,8 +6,7 @@
 #
 
 targets		:= vmlinux vmlinux.bin vmlinux.bin.gz \
-		   vmlinux.bin.bz2 vmlinux.bin.lzma \
-		   vmlinux.bin.xz vmlinux.bin.lzo \
+		   vmlinux.bin.lzma vmlinux.bin.xz vmlinux.bin.lzo \
 		   head_32.o misc.o piggy.o
 
 OBJECTS = $(obj)/head_32.o $(obj)/misc.o $(obj)/cache.o
@@ -57,8 +56,6 @@ vmlinux.bin.all-y := $(obj)/vmlinux.bin
 
 $(obj)/vmlinux.bin.gz: $(vmlinux.bin.all-y) FORCE
 	$(call if_changed,gzip)
-$(obj)/vmlinux.bin.bz2: $(vmlinux.bin.all-y) FORCE
-	$(call if_changed,bzip2)
 $(obj)/vmlinux.bin.lzma: $(vmlinux.bin.all-y) FORCE
 	$(call if_changed,lzma)
 $(obj)/vmlinux.bin.xz: $(vmlinux.bin.all-y) FORCE
diff --git a/arch/sh/boot/compressed/misc.c b/arch/sh/boot/compressed/misc.c
index a03b6680a9d9..bf0d4446f7a6 100644
--- a/arch/sh/boot/compressed/misc.c
+++ b/arch/sh/boot/compressed/misc.c
@@ -44,20 +44,12 @@ extern int _end;
 static unsigned long free_mem_ptr;
 static unsigned long free_mem_end_ptr;
 
-#ifdef CONFIG_HAVE_KERNEL_BZIP2
-#define HEAP_SIZE	0x400000
-#else
 #define HEAP_SIZE	0x10000
-#endif
 
 #ifdef CONFIG_KERNEL_GZIP
 #include "../../../../lib/decompress_inflate.c"
 #endif
 
-#ifdef CONFIG_KERNEL_BZIP2
-#include "../../../../lib/decompress_bunzip2.c"
-#endif
-
 #ifdef CONFIG_KERNEL_LZMA
 #include "../../../../lib/decompress_unlzma.c"
 #endif
diff --git a/arch/sh/configs/sdk7786_defconfig b/arch/sh/configs/sdk7786_defconfig
index 61bec46ebd66..486e8762cc44 100644
--- a/arch/sh/configs/sdk7786_defconfig
+++ b/arch/sh/configs/sdk7786_defconfig
@@ -29,7 +29,6 @@ CONFIG_USER_NS=y
 CONFIG_PID_NS=y
 CONFIG_NET_NS=y
 CONFIG_BLK_DEV_INITRD=y
-CONFIG_RD_BZIP2=y
 CONFIG_RD_LZMA=y
 CONFIG_RD_LZO=y
 # CONFIG_COMPAT_BRK is not set
diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index eeb87fce9c6f..177a84c2f822 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -186,7 +186,6 @@ config X86
 	select HAVE_IDE
 	select HAVE_IOREMAP_PROT
 	select HAVE_IRQ_TIME_ACCOUNTING
-	select HAVE_KERNEL_BZIP2
 	select HAVE_KERNEL_GZIP
 	select HAVE_KERNEL_LZ4
 	select HAVE_KERNEL_LZMA
diff --git a/arch/x86/boot/compressed/Makefile b/arch/x86/boot/compressed/Makefile
index 40b8fd375d52..868c61b6d692 100644
--- a/arch/x86/boot/compressed/Makefile
+++ b/arch/x86/boot/compressed/Makefile
@@ -7,13 +7,13 @@
 # vmlinuz is:
 #	decompression code (*.o)
 #	asm globals (piggy.S), including:
-#		vmlinux.bin.(gz|bz2|lzma|...)
+#		vmlinux.bin.(gz|lzma|...)
 #
 # vmlinux.bin is:
 #	vmlinux stripped of debugging and comments
 # vmlinux.bin.all is:
 #	vmlinux.bin + vmlinux.relocs
-# vmlinux.bin.(gz|bz2|lzma|...) is:
+# vmlinux.bin.(gz|lzma|...) is:
 #	(see scripts/Makefile.lib size_append)
 #	compressed vmlinux.bin.all + u32 size of vmlinux.bin.all
 
@@ -25,7 +25,7 @@ OBJECT_FILES_NON_STANDARD	:= y
 # Prevents link failures: __sanitizer_cov_trace_pc() is not linked in.
 KCOV_INSTRUMENT		:= n
 
-targets := vmlinux vmlinux.bin vmlinux.bin.gz vmlinux.bin.bz2 vmlinux.bin.lzma \
+targets := vmlinux vmlinux.bin vmlinux.bin.gz vmlinux.bin.lzma \
 	vmlinux.bin.xz vmlinux.bin.lzo vmlinux.bin.lz4 vmlinux.bin.zst
 
 KBUILD_CFLAGS := -m$(BITS) -O2
@@ -120,8 +120,6 @@ vmlinux.bin.all-$(CONFIG_X86_NEED_RELOCS) += $(obj)/vmlinux.relocs
 
 $(obj)/vmlinux.bin.gz: $(vmlinux.bin.all-y) FORCE
 	$(call if_changed,gzip)
-$(obj)/vmlinux.bin.bz2: $(vmlinux.bin.all-y) FORCE
-	$(call if_changed,bzip2)
 $(obj)/vmlinux.bin.lzma: $(vmlinux.bin.all-y) FORCE
 	$(call if_changed,lzma)
 $(obj)/vmlinux.bin.xz: $(vmlinux.bin.all-y) FORCE
@@ -134,7 +132,6 @@ $(obj)/vmlinux.bin.zst: $(vmlinux.bin.all-y) FORCE
 	$(call if_changed,zstd22)
 
 suffix-$(CONFIG_KERNEL_GZIP)	:= gz
-suffix-$(CONFIG_KERNEL_BZIP2)	:= bz2
 suffix-$(CONFIG_KERNEL_LZMA)	:= lzma
 suffix-$(CONFIG_KERNEL_XZ)	:= xz
 suffix-$(CONFIG_KERNEL_LZO) 	:= lzo
diff --git a/arch/x86/boot/compressed/misc.c b/arch/x86/boot/compressed/misc.c
index 267e7f93050e..b8ef48b240cd 100644
--- a/arch/x86/boot/compressed/misc.c
+++ b/arch/x86/boot/compressed/misc.c
@@ -55,10 +55,6 @@ static int lines, cols;
 #include "../../../../lib/decompress_inflate.c"
 #endif
 
-#ifdef CONFIG_KERNEL_BZIP2
-#include "../../../../lib/decompress_bunzip2.c"
-#endif
-
 #ifdef CONFIG_KERNEL_LZMA
 #include "../../../../lib/decompress_unlzma.c"
 #endif
diff --git a/arch/x86/include/asm/boot.h b/arch/x86/include/asm/boot.h
index 9191280d9ea3..460243445b13 100644
--- a/arch/x86/include/asm/boot.h
+++ b/arch/x86/include/asm/boot.h
@@ -24,9 +24,7 @@
 # error "Invalid value for CONFIG_PHYSICAL_ALIGN"
 #endif
 
-#if defined(CONFIG_KERNEL_BZIP2)
-# define BOOT_HEAP_SIZE		0x400000
-#elif defined(CONFIG_KERNEL_ZSTD)
+#if defined(CONFIG_KERNEL_ZSTD)
 /*
  * Zstd needs to allocate the ZSTD_DCtx in order to decompress the kernel.
  * The ZSTD_DCtx is ~160KB, so set the heap size to 192KB because it is a
diff --git a/arch/xtensa/configs/cadence_csp_defconfig b/arch/xtensa/configs/cadence_csp_defconfig
index fc240737b14d..fb069d8a7c83 100644
--- a/arch/xtensa/configs/cadence_csp_defconfig
+++ b/arch/xtensa/configs/cadence_csp_defconfig
@@ -15,7 +15,6 @@ CONFIG_SCHED_AUTOGROUP=y
 CONFIG_RELAY=y
 CONFIG_BLK_DEV_INITRD=y
 CONFIG_INITRAMFS_SOURCE="$$KERNEL_INITRAMFS_SOURCE"
-# CONFIG_RD_BZIP2 is not set
 # CONFIG_RD_LZMA is not set
 # CONFIG_RD_XZ is not set
 # CONFIG_RD_LZO is not set
diff --git a/arch/xtensa/configs/nommu_kc705_defconfig b/arch/xtensa/configs/nommu_kc705_defconfig
index 88b2e222d4bf..b78b404f4f8f 100644
--- a/arch/xtensa/configs/nommu_kc705_defconfig
+++ b/arch/xtensa/configs/nommu_kc705_defconfig
@@ -15,7 +15,6 @@ CONFIG_NAMESPACES=y
 CONFIG_SCHED_AUTOGROUP=y
 CONFIG_RELAY=y
 CONFIG_BLK_DEV_INITRD=y
-# CONFIG_RD_BZIP2 is not set
 # CONFIG_RD_LZMA is not set
 # CONFIG_RD_XZ is not set
 # CONFIG_RD_LZO is not set
diff --git a/include/linux/decompress/bunzip2.h b/include/linux/decompress/bunzip2.h
deleted file mode 100644
index 5860163942a4..000000000000
--- a/include/linux/decompress/bunzip2.h
+++ /dev/null
@@ -1,11 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#ifndef DECOMPRESS_BUNZIP2_H
-#define DECOMPRESS_BUNZIP2_H
-
-int bunzip2(unsigned char *inbuf, long len,
-	    long (*fill)(void*, unsigned long),
-	    long (*flush)(void*, unsigned long),
-	    unsigned char *output,
-	    long *pos,
-	    void(*error)(char *x));
-#endif
diff --git a/init/Kconfig b/init/Kconfig
index b77c60f8b963..fdb50763ec50 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -180,9 +180,6 @@ config BUILD_SALT
 config HAVE_KERNEL_GZIP
 	bool
 
-config HAVE_KERNEL_BZIP2
-	bool
-
 config HAVE_KERNEL_LZMA
 	bool
 
@@ -204,7 +201,7 @@ config HAVE_KERNEL_UNCOMPRESSED
 choice
 	prompt "Kernel compression mode"
 	default KERNEL_GZIP
-	depends on HAVE_KERNEL_GZIP || HAVE_KERNEL_BZIP2 || HAVE_KERNEL_LZMA || HAVE_KERNEL_XZ || HAVE_KERNEL_LZO || HAVE_KERNEL_LZ4 || HAVE_KERNEL_ZSTD || HAVE_KERNEL_UNCOMPRESSED
+	depends on HAVE_KERNEL_GZIP || HAVE_KERNEL_LZMA || HAVE_KERNEL_XZ || HAVE_KERNEL_LZO || HAVE_KERNEL_LZ4 || HAVE_KERNEL_ZSTD || HAVE_KERNEL_UNCOMPRESSED
 	help
 	  The linux kernel is a kind of self-extracting executable.
 	  Several compression algorithms are available, which differ
@@ -212,11 +209,6 @@ choice
 	  Compression speed is only relevant when building a kernel.
 	  Decompression speed is relevant at each boot.
 
-	  If you have any problems with bzip2 or lzma compressed
-	  kernels, mail me (Alain Knaff) <alain@knaff.lu>. (An older
-	  version of this functionality (bzip2 only), for 2.4, was
-	  supplied by Christian Ludwig)
-
 	  High compression options are mostly useful for users, who
 	  are low on disk space (embedded systems), but for whom ram
 	  size matters less.
@@ -230,22 +222,12 @@ config KERNEL_GZIP
 	  The old and tried gzip compression. It provides a good balance
 	  between compression ratio and decompression speed.
 
-config KERNEL_BZIP2
-	bool "Bzip2"
-	depends on HAVE_KERNEL_BZIP2
-	help
-	  Its compression ratio and speed is intermediate.
-	  Decompression speed is slowest among the choices.  The kernel
-	  size is about 10% smaller with bzip2, in comparison to gzip.
-	  Bzip2 uses a large amount of memory. For modern kernels you
-	  will need at least 8MB RAM or more for booting.
-
 config KERNEL_LZMA
 	bool "LZMA"
 	depends on HAVE_KERNEL_LZMA
 	help
 	  This compression algorithm's ratio is best.  Decompression speed
-	  is between gzip and bzip2.  Compression is slowest.
+	  is similar to XZ.  Compression is slowest.
 	  The kernel size is about 33% smaller with LZMA in comparison to gzip.
 
 config KERNEL_XZ
diff --git a/init/do_mounts_rd.c b/init/do_mounts_rd.c
index ac021ae6e6fa..5b7114743c9a 100644
--- a/init/do_mounts_rd.c
+++ b/init/do_mounts_rd.c
@@ -48,7 +48,6 @@ static int __init crd_load(decompress_fn deco);
  *	cramfs
  *	squashfs
  *	gzip
- *	bzip2
  *	lzma
  *	xz
  *	lzo
diff --git a/kernel/configs/tiny.config b/kernel/configs/tiny.config
index 8a44b93da0f3..2ca3fb830ca7 100644
--- a/kernel/configs/tiny.config
+++ b/kernel/configs/tiny.config
@@ -1,7 +1,6 @@
 # CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE is not set
 CONFIG_CC_OPTIMIZE_FOR_SIZE=y
 # CONFIG_KERNEL_GZIP is not set
-# CONFIG_KERNEL_BZIP2 is not set
 # CONFIG_KERNEL_LZMA is not set
 CONFIG_KERNEL_XZ=y
 # CONFIG_KERNEL_LZO is not set
diff --git a/lib/Kconfig b/lib/Kconfig
index b46a9fd122c8..1d33e5e70f0e 100644
--- a/lib/Kconfig
+++ b/lib/Kconfig
@@ -324,9 +324,6 @@ config DECOMPRESS_GZIP
 	select ZLIB_INFLATE
 	tristate
 
-config DECOMPRESS_BZIP2
-	tristate
-
 config DECOMPRESS_LZMA
 	tristate
 
diff --git a/lib/Makefile b/lib/Makefile
index d415fc7067c5..c50f3f0111c2 100644
--- a/lib/Makefile
+++ b/lib/Makefile
@@ -193,7 +193,6 @@ obj-$(CONFIG_XZ_DEC) += xz/
 obj-$(CONFIG_RAID6_PQ) += raid6/
 
 lib-$(CONFIG_DECOMPRESS_GZIP) += decompress_inflate.o
-lib-$(CONFIG_DECOMPRESS_BZIP2) += decompress_bunzip2.o
 lib-$(CONFIG_DECOMPRESS_LZMA) += decompress_unlzma.o
 lib-$(CONFIG_DECOMPRESS_XZ) += decompress_unxz.o
 lib-$(CONFIG_DECOMPRESS_LZO) += decompress_unlzo.o
diff --git a/lib/decompress.c b/lib/decompress.c
index ab3fc90ffc64..7e272d7fd27a 100644
--- a/lib/decompress.c
+++ b/lib/decompress.c
@@ -7,7 +7,6 @@
 
 #include <linux/decompress/generic.h>
 
-#include <linux/decompress/bunzip2.h>
 #include <linux/decompress/unlzma.h>
 #include <linux/decompress/unxz.h>
 #include <linux/decompress/inflate.h>
@@ -23,9 +22,6 @@
 #ifndef CONFIG_DECOMPRESS_GZIP
 # define gunzip NULL
 #endif
-#ifndef CONFIG_DECOMPRESS_BZIP2
-# define bunzip2 NULL
-#endif
 #ifndef CONFIG_DECOMPRESS_LZMA
 # define unlzma NULL
 #endif
@@ -51,7 +47,6 @@ struct compress_format {
 static const struct compress_format compressed_formats[] __initconst = {
 	{ {0x1f, 0x8b}, "gzip", gunzip },
 	{ {0x1f, 0x9e}, "gzip", gunzip },
-	{ {0x42, 0x5a}, "bzip2", bunzip2 },
 	{ {0x5d, 0x00}, "lzma", unlzma },
 	{ {0xfd, 0x37}, "xz", unxz },
 	{ {0x89, 0x4c}, "lzo", unlzo },
diff --git a/lib/decompress_bunzip2.c b/lib/decompress_bunzip2.c
deleted file mode 100644
index c72c865032fa..000000000000
--- a/lib/decompress_bunzip2.c
+++ /dev/null
@@ -1,756 +0,0 @@
-/*	Small bzip2 deflate implementation, by Rob Landley (rob@landley.net).
-
-	Based on bzip2 decompression code by Julian R Seward (jseward@acm.org),
-	which also acknowledges contributions by Mike Burrows, David Wheeler,
-	Peter Fenwick, Alistair Moffat, Radford Neal, Ian H. Witten,
-	Robert Sedgewick, and Jon L. Bentley.
-
-	This code is licensed under the LGPLv2:
-		LGPL (http://www.gnu.org/copyleft/lgpl.html
-*/
-
-/*
-	Size and speed optimizations by Manuel Novoa III  (mjn3@codepoet.org).
-
-	More efficient reading of Huffman codes, a streamlined read_bunzip()
-	function, and various other tweaks.  In (limited) tests, approximately
-	20% faster than bzcat on x86 and about 10% faster on arm.
-
-	Note that about 2/3 of the time is spent in read_unzip() reversing
-	the Burrows-Wheeler transformation.  Much of that time is delay
-	resulting from cache misses.
-
-	I would ask that anyone benefiting from this work, especially those
-	using it in commercial products, consider making a donation to my local
-	non-profit hospice organization in the name of the woman I loved, who
-	passed away Feb. 12, 2003.
-
-		In memory of Toni W. Hagan
-
-		Hospice of Acadiana, Inc.
-		2600 Johnston St., Suite 200
-		Lafayette, LA 70503-3240
-
-		Phone (337) 232-1234 or 1-800-738-2226
-		Fax   (337) 232-1297
-
-		https://www.hospiceacadiana.com/
-
-	Manuel
- */
-
-/*
-	Made it fit for running in Linux Kernel by Alain Knaff (alain@knaff.lu)
-*/
-
-
-#ifdef STATIC
-#define PREBOOT
-#else
-#include <linux/decompress/bunzip2.h>
-#endif /* STATIC */
-
-#include <linux/decompress/mm.h>
-#include <linux/crc32poly.h>
-
-#ifndef INT_MAX
-#define INT_MAX 0x7fffffff
-#endif
-
-/* Constants for Huffman coding */
-#define MAX_GROUPS		6
-#define GROUP_SIZE   		50	/* 64 would have been more efficient */
-#define MAX_HUFCODE_BITS 	20	/* Longest Huffman code allowed */
-#define MAX_SYMBOLS 		258	/* 256 literals + RUNA + RUNB */
-#define SYMBOL_RUNA		0
-#define SYMBOL_RUNB		1
-
-/* Status return values */
-#define RETVAL_OK			0
-#define RETVAL_LAST_BLOCK		(-1)
-#define RETVAL_NOT_BZIP_DATA		(-2)
-#define RETVAL_UNEXPECTED_INPUT_EOF	(-3)
-#define RETVAL_UNEXPECTED_OUTPUT_EOF	(-4)
-#define RETVAL_DATA_ERROR		(-5)
-#define RETVAL_OUT_OF_MEMORY		(-6)
-#define RETVAL_OBSOLETE_INPUT		(-7)
-
-/* Other housekeeping constants */
-#define BZIP2_IOBUF_SIZE		4096
-
-/* This is what we know about each Huffman coding group */
-struct group_data {
-	/* We have an extra slot at the end of limit[] for a sentinal value. */
-	int limit[MAX_HUFCODE_BITS+1];
-	int base[MAX_HUFCODE_BITS];
-	int permute[MAX_SYMBOLS];
-	int minLen, maxLen;
-};
-
-/* Structure holding all the housekeeping data, including IO buffers and
-   memory that persists between calls to bunzip */
-struct bunzip_data {
-	/* State for interrupting output loop */
-	int writeCopies, writePos, writeRunCountdown, writeCount, writeCurrent;
-	/* I/O tracking data (file handles, buffers, positions, etc.) */
-	long (*fill)(void*, unsigned long);
-	long inbufCount, inbufPos /*, outbufPos*/;
-	unsigned char *inbuf /*,*outbuf*/;
-	unsigned int inbufBitCount, inbufBits;
-	/* The CRC values stored in the block header and calculated from the
-	data */
-	unsigned int crc32Table[256], headerCRC, totalCRC, writeCRC;
-	/* Intermediate buffer and its size (in bytes) */
-	unsigned int *dbuf, dbufSize;
-	/* These things are a bit too big to go on the stack */
-	unsigned char selectors[32768];		/* nSelectors = 15 bits */
-	struct group_data groups[MAX_GROUPS];	/* Huffman coding tables */
-	int io_error;			/* non-zero if we have IO error */
-	int byteCount[256];
-	unsigned char symToByte[256], mtfSymbol[256];
-};
-
-
-/* Return the next nnn bits of input.  All reads from the compressed input
-   are done through this function.  All reads are big endian */
-static unsigned int INIT get_bits(struct bunzip_data *bd, char bits_wanted)
-{
-	unsigned int bits = 0;
-
-	/* If we need to get more data from the byte buffer, do so.
-	   (Loop getting one byte at a time to enforce endianness and avoid
-	   unaligned access.) */
-	while (bd->inbufBitCount < bits_wanted) {
-		/* If we need to read more data from file into byte buffer, do
-		   so */
-		if (bd->inbufPos == bd->inbufCount) {
-			if (bd->io_error)
-				return 0;
-			bd->inbufCount = bd->fill(bd->inbuf, BZIP2_IOBUF_SIZE);
-			if (bd->inbufCount <= 0) {
-				bd->io_error = RETVAL_UNEXPECTED_INPUT_EOF;
-				return 0;
-			}
-			bd->inbufPos = 0;
-		}
-		/* Avoid 32-bit overflow (dump bit buffer to top of output) */
-		if (bd->inbufBitCount >= 24) {
-			bits = bd->inbufBits&((1 << bd->inbufBitCount)-1);
-			bits_wanted -= bd->inbufBitCount;
-			bits <<= bits_wanted;
-			bd->inbufBitCount = 0;
-		}
-		/* Grab next 8 bits of input from buffer. */
-		bd->inbufBits = (bd->inbufBits << 8)|bd->inbuf[bd->inbufPos++];
-		bd->inbufBitCount += 8;
-	}
-	/* Calculate result */
-	bd->inbufBitCount -= bits_wanted;
-	bits |= (bd->inbufBits >> bd->inbufBitCount)&((1 << bits_wanted)-1);
-
-	return bits;
-}
-
-/* Unpacks the next block and sets up for the inverse burrows-wheeler step. */
-
-static int INIT get_next_block(struct bunzip_data *bd)
-{
-	struct group_data *hufGroup = NULL;
-	int *base = NULL;
-	int *limit = NULL;
-	int dbufCount, nextSym, dbufSize, groupCount, selector,
-		i, j, k, t, runPos, symCount, symTotal, nSelectors, *byteCount;
-	unsigned char uc, *symToByte, *mtfSymbol, *selectors;
-	unsigned int *dbuf, origPtr;
-
-	dbuf = bd->dbuf;
-	dbufSize = bd->dbufSize;
-	selectors = bd->selectors;
-	byteCount = bd->byteCount;
-	symToByte = bd->symToByte;
-	mtfSymbol = bd->mtfSymbol;
-
-	/* Read in header signature and CRC, then validate signature.
-	   (last block signature means CRC is for whole file, return now) */
-	i = get_bits(bd, 24);
-	j = get_bits(bd, 24);
-	bd->headerCRC = get_bits(bd, 32);
-	if ((i == 0x177245) && (j == 0x385090))
-		return RETVAL_LAST_BLOCK;
-	if ((i != 0x314159) || (j != 0x265359))
-		return RETVAL_NOT_BZIP_DATA;
-	/* We can add support for blockRandomised if anybody complains.
-	   There was some code for this in busybox 1.0.0-pre3, but nobody ever
-	   noticed that it didn't actually work. */
-	if (get_bits(bd, 1))
-		return RETVAL_OBSOLETE_INPUT;
-	origPtr = get_bits(bd, 24);
-	if (origPtr >= dbufSize)
-		return RETVAL_DATA_ERROR;
-	/* mapping table: if some byte values are never used (encoding things
-	   like ascii text), the compression code removes the gaps to have fewer
-	   symbols to deal with, and writes a sparse bitfield indicating which
-	   values were present.  We make a translation table to convert the
-	   symbols back to the corresponding bytes. */
-	t = get_bits(bd, 16);
-	symTotal = 0;
-	for (i = 0; i < 16; i++) {
-		if (t&(1 << (15-i))) {
-			k = get_bits(bd, 16);
-			for (j = 0; j < 16; j++)
-				if (k&(1 << (15-j)))
-					symToByte[symTotal++] = (16*i)+j;
-		}
-	}
-	/* How many different Huffman coding groups does this block use? */
-	groupCount = get_bits(bd, 3);
-	if (groupCount < 2 || groupCount > MAX_GROUPS)
-		return RETVAL_DATA_ERROR;
-	/* nSelectors: Every GROUP_SIZE many symbols we select a new
-	   Huffman coding group.  Read in the group selector list,
-	   which is stored as MTF encoded bit runs.  (MTF = Move To
-	   Front, as each value is used it's moved to the start of the
-	   list.) */
-	nSelectors = get_bits(bd, 15);
-	if (!nSelectors)
-		return RETVAL_DATA_ERROR;
-	for (i = 0; i < groupCount; i++)
-		mtfSymbol[i] = i;
-	for (i = 0; i < nSelectors; i++) {
-		/* Get next value */
-		for (j = 0; get_bits(bd, 1); j++)
-			if (j >= groupCount)
-				return RETVAL_DATA_ERROR;
-		/* Decode MTF to get the next selector */
-		uc = mtfSymbol[j];
-		for (; j; j--)
-			mtfSymbol[j] = mtfSymbol[j-1];
-		mtfSymbol[0] = selectors[i] = uc;
-	}
-	/* Read the Huffman coding tables for each group, which code
-	   for symTotal literal symbols, plus two run symbols (RUNA,
-	   RUNB) */
-	symCount = symTotal+2;
-	for (j = 0; j < groupCount; j++) {
-		unsigned char length[MAX_SYMBOLS], temp[MAX_HUFCODE_BITS+1];
-		int	minLen,	maxLen, pp;
-		/* Read Huffman code lengths for each symbol.  They're
-		   stored in a way similar to mtf; record a starting
-		   value for the first symbol, and an offset from the
-		   previous value for everys symbol after that.
-		   (Subtracting 1 before the loop and then adding it
-		   back at the end is an optimization that makes the
-		   test inside the loop simpler: symbol length 0
-		   becomes negative, so an unsigned inequality catches
-		   it.) */
-		t = get_bits(bd, 5)-1;
-		for (i = 0; i < symCount; i++) {
-			for (;;) {
-				if (((unsigned)t) > (MAX_HUFCODE_BITS-1))
-					return RETVAL_DATA_ERROR;
-
-				/* If first bit is 0, stop.  Else
-				   second bit indicates whether to
-				   increment or decrement the value.
-				   Optimization: grab 2 bits and unget
-				   the second if the first was 0. */
-
-				k = get_bits(bd, 2);
-				if (k < 2) {
-					bd->inbufBitCount++;
-					break;
-				}
-				/* Add one if second bit 1, else
-				 * subtract 1.  Avoids if/else */
-				t += (((k+1)&2)-1);
-			}
-			/* Correct for the initial -1, to get the
-			 * final symbol length */
-			length[i] = t+1;
-		}
-		/* Find largest and smallest lengths in this group */
-		minLen = maxLen = length[0];
-
-		for (i = 1; i < symCount; i++) {
-			if (length[i] > maxLen)
-				maxLen = length[i];
-			else if (length[i] < minLen)
-				minLen = length[i];
-		}
-
-		/* Calculate permute[], base[], and limit[] tables from
-		 * length[].
-		 *
-		 * permute[] is the lookup table for converting
-		 * Huffman coded symbols into decoded symbols.  base[]
-		 * is the amount to subtract from the value of a
-		 * Huffman symbol of a given length when using
-		 * permute[].
-		 *
-		 * limit[] indicates the largest numerical value a
-		 * symbol with a given number of bits can have.  This
-		 * is how the Huffman codes can vary in length: each
-		 * code with a value > limit[length] needs another
-		 * bit.
-		 */
-		hufGroup = bd->groups+j;
-		hufGroup->minLen = minLen;
-		hufGroup->maxLen = maxLen;
-		/* Note that minLen can't be smaller than 1, so we
-		   adjust the base and limit array pointers so we're
-		   not always wasting the first entry.  We do this
-		   again when using them (during symbol decoding).*/
-		base = hufGroup->base-1;
-		limit = hufGroup->limit-1;
-		/* Calculate permute[].  Concurrently, initialize
-		 * temp[] and limit[]. */
-		pp = 0;
-		for (i = minLen; i <= maxLen; i++) {
-			temp[i] = limit[i] = 0;
-			for (t = 0; t < symCount; t++)
-				if (length[t] == i)
-					hufGroup->permute[pp++] = t;
-		}
-		/* Count symbols coded for at each bit length */
-		for (i = 0; i < symCount; i++)
-			temp[length[i]]++;
-		/* Calculate limit[] (the largest symbol-coding value
-		 *at each bit length, which is (previous limit <<
-		 *1)+symbols at this level), and base[] (number of
-		 *symbols to ignore at each bit length, which is limit
-		 *minus the cumulative count of symbols coded for
-		 *already). */
-		pp = t = 0;
-		for (i = minLen; i < maxLen; i++) {
-			pp += temp[i];
-			/* We read the largest possible symbol size
-			   and then unget bits after determining how
-			   many we need, and those extra bits could be
-			   set to anything.  (They're noise from
-			   future symbols.)  At each level we're
-			   really only interested in the first few
-			   bits, so here we set all the trailing
-			   to-be-ignored bits to 1 so they don't
-			   affect the value > limit[length]
-			   comparison. */
-			limit[i] = (pp << (maxLen - i)) - 1;
-			pp <<= 1;
-			base[i+1] = pp-(t += temp[i]);
-		}
-		limit[maxLen+1] = INT_MAX; /* Sentinal value for
-					    * reading next sym. */
-		limit[maxLen] = pp+temp[maxLen]-1;
-		base[minLen] = 0;
-	}
-	/* We've finished reading and digesting the block header.  Now
-	   read this block's Huffman coded symbols from the file and
-	   undo the Huffman coding and run length encoding, saving the
-	   result into dbuf[dbufCount++] = uc */
-
-	/* Initialize symbol occurrence counters and symbol Move To
-	 * Front table */
-	for (i = 0; i < 256; i++) {
-		byteCount[i] = 0;
-		mtfSymbol[i] = (unsigned char)i;
-	}
-	/* Loop through compressed symbols. */
-	runPos = dbufCount = symCount = selector = 0;
-	for (;;) {
-		/* Determine which Huffman coding group to use. */
-		if (!(symCount--)) {
-			symCount = GROUP_SIZE-1;
-			if (selector >= nSelectors)
-				return RETVAL_DATA_ERROR;
-			hufGroup = bd->groups+selectors[selector++];
-			base = hufGroup->base-1;
-			limit = hufGroup->limit-1;
-		}
-		/* Read next Huffman-coded symbol. */
-		/* Note: It is far cheaper to read maxLen bits and
-		   back up than it is to read minLen bits and then an
-		   additional bit at a time, testing as we go.
-		   Because there is a trailing last block (with file
-		   CRC), there is no danger of the overread causing an
-		   unexpected EOF for a valid compressed file.  As a
-		   further optimization, we do the read inline
-		   (falling back to a call to get_bits if the buffer
-		   runs dry).  The following (up to got_huff_bits:) is
-		   equivalent to j = get_bits(bd, hufGroup->maxLen);
-		 */
-		while (bd->inbufBitCount < hufGroup->maxLen) {
-			if (bd->inbufPos == bd->inbufCount) {
-				j = get_bits(bd, hufGroup->maxLen);
-				goto got_huff_bits;
-			}
-			bd->inbufBits =
-				(bd->inbufBits << 8)|bd->inbuf[bd->inbufPos++];
-			bd->inbufBitCount += 8;
-		};
-		bd->inbufBitCount -= hufGroup->maxLen;
-		j = (bd->inbufBits >> bd->inbufBitCount)&
-			((1 << hufGroup->maxLen)-1);
-got_huff_bits:
-		/* Figure how many bits are in next symbol and
-		 * unget extras */
-		i = hufGroup->minLen;
-		while (j > limit[i])
-			++i;
-		bd->inbufBitCount += (hufGroup->maxLen - i);
-		/* Huffman decode value to get nextSym (with bounds checking) */
-		if ((i > hufGroup->maxLen)
-			|| (((unsigned)(j = (j>>(hufGroup->maxLen-i))-base[i]))
-				>= MAX_SYMBOLS))
-			return RETVAL_DATA_ERROR;
-		nextSym = hufGroup->permute[j];
-		/* We have now decoded the symbol, which indicates
-		   either a new literal byte, or a repeated run of the
-		   most recent literal byte.  First, check if nextSym
-		   indicates a repeated run, and if so loop collecting
-		   how many times to repeat the last literal. */
-		if (((unsigned)nextSym) <= SYMBOL_RUNB) { /* RUNA or RUNB */
-			/* If this is the start of a new run, zero out
-			 * counter */
-			if (!runPos) {
-				runPos = 1;
-				t = 0;
-			}
-			/* Neat trick that saves 1 symbol: instead of
-			   or-ing 0 or 1 at each bit position, add 1
-			   or 2 instead.  For example, 1011 is 1 << 0
-			   + 1 << 1 + 2 << 2.  1010 is 2 << 0 + 2 << 1
-			   + 1 << 2.  You can make any bit pattern
-			   that way using 1 less symbol than the basic
-			   or 0/1 method (except all bits 0, which
-			   would use no symbols, but a run of length 0
-			   doesn't mean anything in this context).
-			   Thus space is saved. */
-			t += (runPos << nextSym);
-			/* +runPos if RUNA; +2*runPos if RUNB */
-
-			runPos <<= 1;
-			continue;
-		}
-		/* When we hit the first non-run symbol after a run,
-		   we now know how many times to repeat the last
-		   literal, so append that many copies to our buffer
-		   of decoded symbols (dbuf) now.  (The last literal
-		   used is the one at the head of the mtfSymbol
-		   array.) */
-		if (runPos) {
-			runPos = 0;
-			if (dbufCount+t >= dbufSize)
-				return RETVAL_DATA_ERROR;
-
-			uc = symToByte[mtfSymbol[0]];
-			byteCount[uc] += t;
-			while (t--)
-				dbuf[dbufCount++] = uc;
-		}
-		/* Is this the terminating symbol? */
-		if (nextSym > symTotal)
-			break;
-		/* At this point, nextSym indicates a new literal
-		   character.  Subtract one to get the position in the
-		   MTF array at which this literal is currently to be
-		   found.  (Note that the result can't be -1 or 0,
-		   because 0 and 1 are RUNA and RUNB.  But another
-		   instance of the first symbol in the mtf array,
-		   position 0, would have been handled as part of a
-		   run above.  Therefore 1 unused mtf position minus 2
-		   non-literal nextSym values equals -1.) */
-		if (dbufCount >= dbufSize)
-			return RETVAL_DATA_ERROR;
-		i = nextSym - 1;
-		uc = mtfSymbol[i];
-		/* Adjust the MTF array.  Since we typically expect to
-		 *move only a small number of symbols, and are bound
-		 *by 256 in any case, using memmove here would
-		 *typically be bigger and slower due to function call
-		 *overhead and other assorted setup costs. */
-		do {
-			mtfSymbol[i] = mtfSymbol[i-1];
-		} while (--i);
-		mtfSymbol[0] = uc;
-		uc = symToByte[uc];
-		/* We have our literal byte.  Save it into dbuf. */
-		byteCount[uc]++;
-		dbuf[dbufCount++] = (unsigned int)uc;
-	}
-	/* At this point, we've read all the Huffman-coded symbols
-	   (and repeated runs) for this block from the input stream,
-	   and decoded them into the intermediate buffer.  There are
-	   dbufCount many decoded bytes in dbuf[].  Now undo the
-	   Burrows-Wheeler transform on dbuf.  See
-	   http://dogma.net/markn/articles/bwt/bwt.htm
-	 */
-	/* Turn byteCount into cumulative occurrence counts of 0 to n-1. */
-	j = 0;
-	for (i = 0; i < 256; i++) {
-		k = j+byteCount[i];
-		byteCount[i] = j;
-		j = k;
-	}
-	/* Figure out what order dbuf would be in if we sorted it. */
-	for (i = 0; i < dbufCount; i++) {
-		uc = (unsigned char)(dbuf[i] & 0xff);
-		dbuf[byteCount[uc]] |= (i << 8);
-		byteCount[uc]++;
-	}
-	/* Decode first byte by hand to initialize "previous" byte.
-	   Note that it doesn't get output, and if the first three
-	   characters are identical it doesn't qualify as a run (hence
-	   writeRunCountdown = 5). */
-	if (dbufCount) {
-		if (origPtr >= dbufCount)
-			return RETVAL_DATA_ERROR;
-		bd->writePos = dbuf[origPtr];
-		bd->writeCurrent = (unsigned char)(bd->writePos&0xff);
-		bd->writePos >>= 8;
-		bd->writeRunCountdown = 5;
-	}
-	bd->writeCount = dbufCount;
-
-	return RETVAL_OK;
-}
-
-/* Undo burrows-wheeler transform on intermediate buffer to produce output.
-   If start_bunzip was initialized with out_fd =-1, then up to len bytes of
-   data are written to outbuf.  Return value is number of bytes written or
-   error (all errors are negative numbers).  If out_fd!=-1, outbuf and len
-   are ignored, data is written to out_fd and return is RETVAL_OK or error.
-*/
-
-static int INIT read_bunzip(struct bunzip_data *bd, char *outbuf, int len)
-{
-	const unsigned int *dbuf;
-	int pos, xcurrent, previous, gotcount;
-
-	/* If last read was short due to end of file, return last block now */
-	if (bd->writeCount < 0)
-		return bd->writeCount;
-
-	gotcount = 0;
-	dbuf = bd->dbuf;
-	pos = bd->writePos;
-	xcurrent = bd->writeCurrent;
-
-	/* We will always have pending decoded data to write into the output
-	   buffer unless this is the very first call (in which case we haven't
-	   Huffman-decoded a block into the intermediate buffer yet). */
-
-	if (bd->writeCopies) {
-		/* Inside the loop, writeCopies means extra copies (beyond 1) */
-		--bd->writeCopies;
-		/* Loop outputting bytes */
-		for (;;) {
-			/* If the output buffer is full, snapshot
-			 * state and return */
-			if (gotcount >= len) {
-				bd->writePos = pos;
-				bd->writeCurrent = xcurrent;
-				bd->writeCopies++;
-				return len;
-			}
-			/* Write next byte into output buffer, updating CRC */
-			outbuf[gotcount++] = xcurrent;
-			bd->writeCRC = (((bd->writeCRC) << 8)
-				^bd->crc32Table[((bd->writeCRC) >> 24)
-				^xcurrent]);
-			/* Loop now if we're outputting multiple
-			 * copies of this byte */
-			if (bd->writeCopies) {
-				--bd->writeCopies;
-				continue;
-			}
-decode_next_byte:
-			if (!bd->writeCount--)
-				break;
-			/* Follow sequence vector to undo
-			 * Burrows-Wheeler transform */
-			previous = xcurrent;
-			pos = dbuf[pos];
-			xcurrent = pos&0xff;
-			pos >>= 8;
-			/* After 3 consecutive copies of the same
-			   byte, the 4th is a repeat count.  We count
-			   down from 4 instead *of counting up because
-			   testing for non-zero is faster */
-			if (--bd->writeRunCountdown) {
-				if (xcurrent != previous)
-					bd->writeRunCountdown = 4;
-			} else {
-				/* We have a repeated run, this byte
-				 * indicates the count */
-				bd->writeCopies = xcurrent;
-				xcurrent = previous;
-				bd->writeRunCountdown = 5;
-				/* Sometimes there are just 3 bytes
-				 * (run length 0) */
-				if (!bd->writeCopies)
-					goto decode_next_byte;
-				/* Subtract the 1 copy we'd output
-				 * anyway to get extras */
-				--bd->writeCopies;
-			}
-		}
-		/* Decompression of this block completed successfully */
-		bd->writeCRC = ~bd->writeCRC;
-		bd->totalCRC = ((bd->totalCRC << 1) |
-				(bd->totalCRC >> 31)) ^ bd->writeCRC;
-		/* If this block had a CRC error, force file level CRC error. */
-		if (bd->writeCRC != bd->headerCRC) {
-			bd->totalCRC = bd->headerCRC+1;
-			return RETVAL_LAST_BLOCK;
-		}
-	}
-
-	/* Refill the intermediate buffer by Huffman-decoding next
-	 * block of input */
-	/* (previous is just a convenient unused temp variable here) */
-	previous = get_next_block(bd);
-	if (previous) {
-		bd->writeCount = previous;
-		return (previous != RETVAL_LAST_BLOCK) ? previous : gotcount;
-	}
-	bd->writeCRC = 0xffffffffUL;
-	pos = bd->writePos;
-	xcurrent = bd->writeCurrent;
-	goto decode_next_byte;
-}
-
-static long INIT nofill(void *buf, unsigned long len)
-{
-	return -1;
-}
-
-/* Allocate the structure, read file header.  If in_fd ==-1, inbuf must contain
-   a complete bunzip file (len bytes long).  If in_fd!=-1, inbuf and len are
-   ignored, and data is read from file handle into temporary buffer. */
-static int INIT start_bunzip(struct bunzip_data **bdp, void *inbuf, long len,
-			     long (*fill)(void*, unsigned long))
-{
-	struct bunzip_data *bd;
-	unsigned int i, j, c;
-	const unsigned int BZh0 =
-		(((unsigned int)'B') << 24)+(((unsigned int)'Z') << 16)
-		+(((unsigned int)'h') << 8)+(unsigned int)'0';
-
-	/* Figure out how much data to allocate */
-	i = sizeof(struct bunzip_data);
-
-	/* Allocate bunzip_data.  Most fields initialize to zero. */
-	bd = *bdp = malloc(i);
-	if (!bd)
-		return RETVAL_OUT_OF_MEMORY;
-	memset(bd, 0, sizeof(struct bunzip_data));
-	/* Setup input buffer */
-	bd->inbuf = inbuf;
-	bd->inbufCount = len;
-	if (fill != NULL)
-		bd->fill = fill;
-	else
-		bd->fill = nofill;
-
-	/* Init the CRC32 table (big endian) */
-	for (i = 0; i < 256; i++) {
-		c = i << 24;
-		for (j = 8; j; j--)
-			c = c&0x80000000 ? (c << 1)^(CRC32_POLY_BE) : (c << 1);
-		bd->crc32Table[i] = c;
-	}
-
-	/* Ensure that file starts with "BZh['1'-'9']." */
-	i = get_bits(bd, 32);
-	if (((unsigned int)(i-BZh0-1)) >= 9)
-		return RETVAL_NOT_BZIP_DATA;
-
-	/* Fourth byte (ascii '1'-'9'), indicates block size in units of 100k of
-	   uncompressed data.  Allocate intermediate buffer for block. */
-	bd->dbufSize = 100000*(i-BZh0);
-
-	bd->dbuf = large_malloc(bd->dbufSize * sizeof(int));
-	if (!bd->dbuf)
-		return RETVAL_OUT_OF_MEMORY;
-	return RETVAL_OK;
-}
-
-/* Example usage: decompress src_fd to dst_fd.  (Stops at end of bzip2 data,
-   not end of file.) */
-STATIC int INIT bunzip2(unsigned char *buf, long len,
-			long (*fill)(void*, unsigned long),
-			long (*flush)(void*, unsigned long),
-			unsigned char *outbuf,
-			long *pos,
-			void(*error)(char *x))
-{
-	struct bunzip_data *bd;
-	int i = -1;
-	unsigned char *inbuf;
-
-	if (flush)
-		outbuf = malloc(BZIP2_IOBUF_SIZE);
-
-	if (!outbuf) {
-		error("Could not allocate output buffer");
-		return RETVAL_OUT_OF_MEMORY;
-	}
-	if (buf)
-		inbuf = buf;
-	else
-		inbuf = malloc(BZIP2_IOBUF_SIZE);
-	if (!inbuf) {
-		error("Could not allocate input buffer");
-		i = RETVAL_OUT_OF_MEMORY;
-		goto exit_0;
-	}
-	i = start_bunzip(&bd, inbuf, len, fill);
-	if (!i) {
-		for (;;) {
-			i = read_bunzip(bd, outbuf, BZIP2_IOBUF_SIZE);
-			if (i <= 0)
-				break;
-			if (!flush)
-				outbuf += i;
-			else
-				if (i != flush(outbuf, i)) {
-					i = RETVAL_UNEXPECTED_OUTPUT_EOF;
-					break;
-				}
-		}
-	}
-	/* Check CRC and release memory */
-	if (i == RETVAL_LAST_BLOCK) {
-		if (bd->headerCRC != bd->totalCRC)
-			error("Data integrity error when decompressing.");
-		else
-			i = RETVAL_OK;
-	} else if (i == RETVAL_UNEXPECTED_OUTPUT_EOF) {
-		error("Compressed file ends unexpectedly");
-	}
-	if (!bd)
-		goto exit_1;
-	if (bd->dbuf)
-		large_free(bd->dbuf);
-	if (pos)
-		*pos = bd->inbufPos;
-	free(bd);
-exit_1:
-	if (!buf)
-		free(inbuf);
-exit_0:
-	if (flush)
-		free(outbuf);
-	return i;
-}
-
-#ifdef PREBOOT
-STATIC int INIT __decompress(unsigned char *buf, long len,
-			long (*fill)(void*, unsigned long),
-			long (*flush)(void*, unsigned long),
-			unsigned char *outbuf, long olen,
-			long *pos,
-			void (*error)(char *x))
-{
-	return bunzip2(buf, len - 4, fill, flush, outbuf, pos, error);
-}
-#endif
diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 94133708889d..f05111c59a3b 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -343,10 +343,7 @@ $(obj)/%.dt.yaml: $(src)/%.dts $(DTC) $(DT_TMP_SCHEMA) FORCE
 
 dtc-tmp = $(subst $(comma),_,$(dot-target).dts.tmp)
 
-# Bzip2
-# ---------------------------------------------------------------------------
-
-# Bzip2 and LZMA do not include size in file... so we have to fake that;
+# LZMA does not include size in file... so we have to fake that;
 # append the size as a 32-bit littleendian number as gzip does.
 size_append = printf $(shell						\
 dec_size=0;								\
@@ -363,9 +360,6 @@ printf "%08x\n" $$dec_size |						\
 	}								\
 )
 
-quiet_cmd_bzip2 = BZIP2   $@
-      cmd_bzip2 = { cat $(real-prereqs) | $(KBZIP2) -9; $(size_append); } > $@
-
 # Lzma
 # ---------------------------------------------------------------------------
 
diff --git a/scripts/Makefile.package b/scripts/Makefile.package
index f952fb64789d..2c4a9dbc7e6e 100644
--- a/scripts/Makefile.package
+++ b/scripts/Makefile.package
@@ -127,7 +127,6 @@ util/PERF-VERSION-GEN $(CURDIR)/$(perf-tar)/);              \
 tar rf $(perf-tar).tar $(perf-tar)/HEAD $(perf-tar)/PERF-VERSION-FILE; \
 rm -r $(perf-tar);                                                  \
 $(if $(findstring tar-src,$@),,                                     \
-$(if $(findstring bz2,$@),$(KBZIP2),                                 \
 $(if $(findstring gz,$@),$(KGZIP),                                  \
 $(if $(findstring xz,$@),$(XZ),                                     \
 $(error unknown target $@))))                                       \
diff --git a/scripts/package/buildtar b/scripts/package/buildtar
index 936198a90477..91bcb50579c7 100755
--- a/scripts/package/buildtar
+++ b/scripts/package/buildtar
@@ -118,7 +118,7 @@ case "${ARCH}" in
 		fi
 		;;
 	arm64)
-		for i in Image.bz2 Image.gz Image.lz4 Image.lzma Image.lzo ; do
+		for i in Image.gz Image.lz4 Image.lzma Image.lzo ; do
 			if [ -f "${objtree}/arch/arm64/boot/${i}" ] ; then
 				cp -v -- "${objtree}/arch/arm64/boot/${i}" "${tmpdir}/boot/vmlinuz-${KERNELRELEASE}"
 				break
diff --git a/usr/Kconfig b/usr/Kconfig
index 2599bc21c1b2..ba5ecb054df5 100644
--- a/usr/Kconfig
+++ b/usr/Kconfig
@@ -60,14 +60,6 @@ config RD_GZIP
 	  Support loading of a gzip encoded initial ramdisk or cpio buffer.
 	  If unsure, say Y.
 
-config RD_BZIP2
-	bool "Support initial ramdisk/ramfs compressed using bzip2"
-	default y
-	select DECOMPRESS_BZIP2
-	help
-	  Support loading of a bzip2 encoded initial ramdisk or cpio buffer
-	  If unsure, say N.
-
 config RD_LZMA
 	bool "Support initial ramdisk/ramfs compressed using LZMA"
 	default y
@@ -143,19 +135,6 @@ config INITRAMFS_COMPRESSION_GZIP
 	  supported by your build system as the gzip tool is present by default
 	  on most distros.
 
-config INITRAMFS_COMPRESSION_BZIP2
-	bool "Bzip2"
-	depends on RD_BZIP2
-	help
-	  It's compression ratio and speed is intermediate. Decompression speed
-	  is slowest among the choices. The initramfs size is about 10% smaller
-	  with bzip2, in comparison to gzip. Bzip2 uses a large amount of
-	  memory. For modern kernels you will need at least 8MB RAM or more for
-	  booting.
-
-	  If you choose this, keep in mind that you need to have the bzip2 tool
-	  available to be able to compress the initram.
-
 config INITRAMFS_COMPRESSION_LZMA
 	bool "LZMA"
 	depends on RD_LZMA
@@ -175,9 +154,8 @@ config INITRAMFS_COMPRESSION_XZ
 	help
 	  XZ uses the LZMA2 algorithm and has a large dictionary which may cause
 	  problems on memory constrained systems. The initramfs size is about
-	  30% smaller with XZ in comparison to gzip. Decompression speed is
-	  better than that of bzip2 but worse than gzip and LZO. Compression is
-	  slow.
+	  30% smaller with XZ in comparison to gzip. Compression and
+	  decompression are slowest.
 
 	  If you choose this, keep in mind that you may need to install the xz
 	  tool to be able to compress the initram.
diff --git a/usr/Makefile b/usr/Makefile
index b1a81a40eab1..367bc5d4c759 100644
--- a/usr/Makefile
+++ b/usr/Makefile
@@ -3,14 +3,13 @@
 # kbuild file for usr/ - including initramfs image
 #
 
-# cmd_bzip2, cmd_lzma, cmd_lzo, cmd_lz4 from scripts/Makefile.lib appends the
+# cmd_lzma, cmd_lzo, cmd_lz4 from scripts/Makefile.lib appends the
 # size at the end of the compressed file, which unfortunately does not work
 # with unpack_to_rootfs(). Make size_append no-op.
 override size_append := :
 
 compress-y					:= shipped
 compress-$(CONFIG_INITRAMFS_COMPRESSION_GZIP)	:= gzip
-compress-$(CONFIG_INITRAMFS_COMPRESSION_BZIP2)	:= bzip2
 compress-$(CONFIG_INITRAMFS_COMPRESSION_LZMA)	:= lzma
 compress-$(CONFIG_INITRAMFS_COMPRESSION_XZ)	:= xzmisc
 compress-$(CONFIG_INITRAMFS_COMPRESSION_LZO)	:= lzo
-- 
2.29.2

