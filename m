Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 739BF8222CF
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Jan 2024 22:00:18 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=oxZ0dGtZ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4T4QGm1974z3cNC
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jan 2024 08:00:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=oxZ0dGtZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=dtsen@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4T4QFt52SXz30gL
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Jan 2024 07:59:29 +1100 (AEDT)
Received: from pps.filterd (m0353723.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 402JvXZO031843;
	Tue, 2 Jan 2024 20:59:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=1Ho8tYxC5qoeJNaR+Dnc7A+WT0m8bg9zwngaPCRulbQ=;
 b=oxZ0dGtZUvuOe20i/UWWV3vGIfA0t0Y1ZNXA5NE/1fWDYdnPKFCw/W/+yN6NAk4QhmXA
 Xfhb+qJ+XW7lARFkwx3joP6JGT4F4rFRF87sI1oIRik3p97A04G5WI2nGLBeWaX7NXG3
 30fB2Yu0U6SZ3LecWnwOvkMtpLP2+bt4Za05jtyM3afQpHdDEvHsRh5TEZJ1z0wkFmVA
 a6pbVlBf5svo2ZCc9lG24mXKEuw/33VMm51oVdMyxYETH+F6KsmWp6JHPNO91vC0K5oq
 0kf+mwhugXpJbdFLsqfGAuP2KR2zSgOoGqmXwSRajOnLYsPuj7G7nB1GI3mG9xisOBeZ Ew== 
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3vcm4khck3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 02 Jan 2024 20:59:10 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 402Hws2M018005;
	Tue, 2 Jan 2024 20:59:10 GMT
Received: from smtprelay07.wdc07v.mail.ibm.com ([172.16.1.74])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3vayrkew6s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 02 Jan 2024 20:59:10 +0000
Received: from smtpav03.wdc07v.mail.ibm.com (smtpav03.wdc07v.mail.ibm.com [10.39.53.230])
	by smtprelay07.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 402Kx8tR17170958
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 2 Jan 2024 20:59:09 GMT
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DCDFE5805C;
	Tue,  2 Jan 2024 20:59:08 +0000 (GMT)
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4251B5805F;
	Tue,  2 Jan 2024 20:59:08 +0000 (GMT)
Received: from ltcden12-lp3.aus.stglabs.ibm.com (unknown [9.40.195.53])
	by smtpav03.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  2 Jan 2024 20:59:08 +0000 (GMT)
From: Danny Tsen <dtsen@linux.ibm.com>
To: linux-crypto@vger.kernel.org
Subject: [PATCH] crypto:vmx: Move ppc vmx diirectory to arch/powerpc/crypto.
Date: Tue,  2 Jan 2024 15:58:56 -0500
Message-Id: <20240102205856.370103-1-dtsen@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: ScLqGB02F8BPCXrJLGePprqeUbKmO1ui
X-Proofpoint-ORIG-GUID: ScLqGB02F8BPCXrJLGePprqeUbKmO1ui
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-02_08,2024-01-02_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1011
 mlxlogscore=999 bulkscore=0 phishscore=0 adultscore=0 priorityscore=1501
 mlxscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2401020155
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
Cc: herbert@gondor.apana.org.au, dtsen@us.ibm.com, nayna@linux.ibm.com, linux-kernel@vger.kernel.org, Danny Tsen <dtsen@linux.ibm.com>, appro@cryptogams.org, ltcgcw@linux.vnet.ibm.com, leitao@debian.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Relocate all crypto files in vmx driver to arch/powerpc/crypto directory
and remove vmx directory.

drivers/crypto/vmx/aes.c rename to arch/powerpc/crypto/aes.c
drivers/crypto/vmx/aes_cbc.c rename to arch/powerpc/crypto/aes_cbc.c
drivers/crypto/vmx/aes_ctr.c rename to arch/powerpc/crypto/aes_ctr.c
drivers/crypto/vmx/aes_xts.c rename to arch/powerpc/crypto/aes_xts.c
drivers/crypto/vmx/aesp8-ppc.h rename to arch/powerpc/crypto/aesp8-ppc.h
drivers/crypto/vmx/aesp8-ppc.pl rename to arch/powerpc/crypto/aesp8-ppc.pl
drivers/crypto/vmx/ghash.c rename to arch/powerpc/crypto/ghash.c
drivers/crypto/vmx/ghashp8-ppc.pl rename to arch/powerpc/crypto/ghashp8-ppc.pl
drivers/crypto/vmx/vmx.c rename to arch/powerpc/crypto/vmx.c

deleted files:
drivers/crypto/vmx/Makefile
drivers/crypto/vmx/Kconfig
drivers/crypto/vmx/ppc-xlate.pl

This patch has been tested has passed the selftest.  The patch is also tested with
CONFIG_CRYPTO_MANAGER_EXTRA_TESTS enabled.

Signed-off-by: Danny Tsen <dtsen@linux.ibm.com>
---
 arch/powerpc/crypto/Kconfig                   |  20 ++
 arch/powerpc/crypto/Makefile                  |  20 +-
 .../crypto/vmx => arch/powerpc/crypto}/aes.c  |   0
 .../vmx => arch/powerpc/crypto}/aes_cbc.c     |   0
 .../vmx => arch/powerpc/crypto}/aes_ctr.c     |   0
 .../vmx => arch/powerpc/crypto}/aes_xts.c     |   0
 .../vmx => arch/powerpc/crypto}/aesp8-ppc.h   |   0
 .../vmx => arch/powerpc/crypto}/aesp8-ppc.pl  |   0
 .../vmx => arch/powerpc/crypto}/ghash.c       |   0
 .../powerpc/crypto}/ghashp8-ppc.pl            |   0
 .../crypto/vmx => arch/powerpc/crypto}/vmx.c  |   0
 drivers/crypto/Kconfig                        |  14 +-
 drivers/crypto/Makefile                       |   2 +-
 drivers/crypto/vmx/.gitignore                 |   3 -
 drivers/crypto/vmx/Kconfig                    |  14 --
 drivers/crypto/vmx/Makefile                   |  23 --
 drivers/crypto/vmx/ppc-xlate.pl               | 231 ------------------
 17 files changed, 46 insertions(+), 281 deletions(-)
 rename {drivers/crypto/vmx => arch/powerpc/crypto}/aes.c (100%)
 rename {drivers/crypto/vmx => arch/powerpc/crypto}/aes_cbc.c (100%)
 rename {drivers/crypto/vmx => arch/powerpc/crypto}/aes_ctr.c (100%)
 rename {drivers/crypto/vmx => arch/powerpc/crypto}/aes_xts.c (100%)
 rename {drivers/crypto/vmx => arch/powerpc/crypto}/aesp8-ppc.h (100%)
 rename {drivers/crypto/vmx => arch/powerpc/crypto}/aesp8-ppc.pl (100%)
 rename {drivers/crypto/vmx => arch/powerpc/crypto}/ghash.c (100%)
 rename {drivers/crypto/vmx => arch/powerpc/crypto}/ghashp8-ppc.pl (100%)
 rename {drivers/crypto/vmx => arch/powerpc/crypto}/vmx.c (100%)
 delete mode 100644 drivers/crypto/vmx/.gitignore
 delete mode 100644 drivers/crypto/vmx/Kconfig
 delete mode 100644 drivers/crypto/vmx/Makefile
 delete mode 100644 drivers/crypto/vmx/ppc-xlate.pl

diff --git a/arch/powerpc/crypto/Kconfig b/arch/powerpc/crypto/Kconfig
index 6fc2248ca561..1e201b7ae2fc 100644
--- a/arch/powerpc/crypto/Kconfig
+++ b/arch/powerpc/crypto/Kconfig
@@ -137,4 +137,24 @@ config CRYPTO_POLY1305_P10
 	  - Power10 or later
 	  - Little-endian
 
+config CRYPTO_DEV_VMX
+        bool "Support for VMX cryptographic acceleration instructions"
+        depends on PPC64 && VSX
+        help
+          Support for VMX cryptographic acceleration instructions.
+
+config CRYPTO_DEV_VMX_ENCRYPT
+	tristate "Encryption acceleration support on P8 CPU"
+	depends on CRYPTO_DEV_VMX
+	select CRYPTO_AES
+	select CRYPTO_CBC
+	select CRYPTO_CTR
+	select CRYPTO_GHASH
+	select CRYPTO_XTS
+	default m
+	help
+	  Support for VMX cryptographic acceleration instructions on Power8 CPU.
+	  This module supports acceleration for AES and GHASH in hardware. If you
+	  choose 'M' here, this module will be called vmx-crypto.
+
 endmenu
diff --git a/arch/powerpc/crypto/Makefile b/arch/powerpc/crypto/Makefile
index ebdac1b9eb9a..fca0e9739869 100644
--- a/arch/powerpc/crypto/Makefile
+++ b/arch/powerpc/crypto/Makefile
@@ -16,6 +16,7 @@ obj-$(CONFIG_CRYPTO_VPMSUM_TESTER) += crc-vpmsum_test.o
 obj-$(CONFIG_CRYPTO_AES_GCM_P10) += aes-gcm-p10-crypto.o
 obj-$(CONFIG_CRYPTO_CHACHA20_P10) += chacha-p10-crypto.o
 obj-$(CONFIG_CRYPTO_POLY1305_P10) += poly1305-p10-crypto.o
+obj-$(CONFIG_CRYPTO_DEV_VMX_ENCRYPT) += vmx-crypto.o
 
 aes-ppc-spe-y := aes-spe-core.o aes-spe-keys.o aes-tab-4k.o aes-spe-modes.o aes-spe-glue.o
 md5-ppc-y := md5-asm.o md5-glue.o
@@ -27,14 +28,29 @@ crct10dif-vpmsum-y := crct10dif-vpmsum_asm.o crct10dif-vpmsum_glue.o
 aes-gcm-p10-crypto-y := aes-gcm-p10-glue.o aes-gcm-p10.o ghashp10-ppc.o aesp10-ppc.o
 chacha-p10-crypto-y := chacha-p10-glue.o chacha-p10le-8x.o
 poly1305-p10-crypto-y := poly1305-p10-glue.o poly1305-p10le_64.o
+vmx-crypto-objs := vmx.o aesp8-ppc.o ghashp8-ppc.o aes.o aes_cbc.o aes_ctr.o aes_xts.o ghash.o
+
+ifeq ($(CONFIG_CPU_LITTLE_ENDIAN),y)
+override flavour := linux-ppc64le
+else
+ifdef CONFIG_PPC64_ELF_ABI_V2
+override flavour := linux-ppc64-elfv2
+else
+override flavour := linux-ppc64
+endif
+endif
 
 quiet_cmd_perl = PERL    $@
-      cmd_perl = $(PERL) $< $(if $(CONFIG_CPU_LITTLE_ENDIAN), linux-ppc64le, linux-ppc64) > $@
+      cmd_perl = $(PERL) $< $(flavour) > $@
 
-targets += aesp10-ppc.S ghashp10-ppc.S
+targets += aesp10-ppc.S ghashp10-ppc.S aesp8-ppc.S ghashp8-ppc.S
 
 $(obj)/aesp10-ppc.S $(obj)/ghashp10-ppc.S: $(obj)/%.S: $(src)/%.pl FORCE
 	$(call if_changed,perl)
 
+$(obj)/aesp8-ppc.S $(obj)/ghashp8-ppc.S: $(obj)/%.S: $(src)/%.pl FORCE
+	$(call if_changed,perl)
+
 OBJECT_FILES_NON_STANDARD_aesp10-ppc.o := y
 OBJECT_FILES_NON_STANDARD_ghashp10-ppc.o := y
+OBJECT_FILES_NON_STANDARD_aesp8-ppc.o := y
diff --git a/drivers/crypto/vmx/aes.c b/arch/powerpc/crypto/aes.c
similarity index 100%
rename from drivers/crypto/vmx/aes.c
rename to arch/powerpc/crypto/aes.c
diff --git a/drivers/crypto/vmx/aes_cbc.c b/arch/powerpc/crypto/aes_cbc.c
similarity index 100%
rename from drivers/crypto/vmx/aes_cbc.c
rename to arch/powerpc/crypto/aes_cbc.c
diff --git a/drivers/crypto/vmx/aes_ctr.c b/arch/powerpc/crypto/aes_ctr.c
similarity index 100%
rename from drivers/crypto/vmx/aes_ctr.c
rename to arch/powerpc/crypto/aes_ctr.c
diff --git a/drivers/crypto/vmx/aes_xts.c b/arch/powerpc/crypto/aes_xts.c
similarity index 100%
rename from drivers/crypto/vmx/aes_xts.c
rename to arch/powerpc/crypto/aes_xts.c
diff --git a/drivers/crypto/vmx/aesp8-ppc.h b/arch/powerpc/crypto/aesp8-ppc.h
similarity index 100%
rename from drivers/crypto/vmx/aesp8-ppc.h
rename to arch/powerpc/crypto/aesp8-ppc.h
diff --git a/drivers/crypto/vmx/aesp8-ppc.pl b/arch/powerpc/crypto/aesp8-ppc.pl
similarity index 100%
rename from drivers/crypto/vmx/aesp8-ppc.pl
rename to arch/powerpc/crypto/aesp8-ppc.pl
diff --git a/drivers/crypto/vmx/ghash.c b/arch/powerpc/crypto/ghash.c
similarity index 100%
rename from drivers/crypto/vmx/ghash.c
rename to arch/powerpc/crypto/ghash.c
diff --git a/drivers/crypto/vmx/ghashp8-ppc.pl b/arch/powerpc/crypto/ghashp8-ppc.pl
similarity index 100%
rename from drivers/crypto/vmx/ghashp8-ppc.pl
rename to arch/powerpc/crypto/ghashp8-ppc.pl
diff --git a/drivers/crypto/vmx/vmx.c b/arch/powerpc/crypto/vmx.c
similarity index 100%
rename from drivers/crypto/vmx/vmx.c
rename to arch/powerpc/crypto/vmx.c
diff --git a/drivers/crypto/Kconfig b/drivers/crypto/Kconfig
index 79c3bb9c99c3..59644d72c735 100644
--- a/drivers/crypto/Kconfig
+++ b/drivers/crypto/Kconfig
@@ -610,13 +610,13 @@ config CRYPTO_DEV_QCOM_RNG
 	  To compile this driver as a module, choose M here. The
 	  module will be called qcom-rng. If unsure, say N.
 
-config CRYPTO_DEV_VMX
-	bool "Support for VMX cryptographic acceleration instructions"
-	depends on PPC64 && VSX
-	help
-	  Support for VMX cryptographic acceleration instructions.
-
-source "drivers/crypto/vmx/Kconfig"
+#config CRYPTO_DEV_VMX
+#	bool "Support for VMX cryptographic acceleration instructions"
+#	depends on PPC64 && VSX
+#	help
+#	  Support for VMX cryptographic acceleration instructions.
+#
+#source "drivers/crypto/vmx/Kconfig"
 
 config CRYPTO_DEV_IMGTEC_HASH
 	tristate "Imagination Technologies hardware hash accelerator"
diff --git a/drivers/crypto/Makefile b/drivers/crypto/Makefile
index d859d6a5f3a4..95331bc6456b 100644
--- a/drivers/crypto/Makefile
+++ b/drivers/crypto/Makefile
@@ -42,7 +42,7 @@ obj-$(CONFIG_CRYPTO_DEV_SL3516) += gemini/
 obj-y += stm32/
 obj-$(CONFIG_CRYPTO_DEV_TALITOS) += talitos.o
 obj-$(CONFIG_CRYPTO_DEV_VIRTIO) += virtio/
-obj-$(CONFIG_CRYPTO_DEV_VMX) += vmx/
+#obj-$(CONFIG_CRYPTO_DEV_VMX) += vmx/
 obj-$(CONFIG_CRYPTO_DEV_BCM_SPU) += bcm/
 obj-$(CONFIG_CRYPTO_DEV_SAFEXCEL) += inside-secure/
 obj-$(CONFIG_CRYPTO_DEV_ARTPEC6) += axis/
diff --git a/drivers/crypto/vmx/.gitignore b/drivers/crypto/vmx/.gitignore
deleted file mode 100644
index 7aa71d83f739..000000000000
--- a/drivers/crypto/vmx/.gitignore
+++ /dev/null
@@ -1,3 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0-only
-aesp8-ppc.S
-ghashp8-ppc.S
diff --git a/drivers/crypto/vmx/Kconfig b/drivers/crypto/vmx/Kconfig
deleted file mode 100644
index b2c28b87f14b..000000000000
--- a/drivers/crypto/vmx/Kconfig
+++ /dev/null
@@ -1,14 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0-only
-config CRYPTO_DEV_VMX_ENCRYPT
-	tristate "Encryption acceleration support on P8 CPU"
-	depends on CRYPTO_DEV_VMX
-	select CRYPTO_AES
-	select CRYPTO_CBC
-	select CRYPTO_CTR
-	select CRYPTO_GHASH
-	select CRYPTO_XTS
-	default m
-	help
-	  Support for VMX cryptographic acceleration instructions on Power8 CPU.
-	  This module supports acceleration for AES and GHASH in hardware. If you
-	  choose 'M' here, this module will be called vmx-crypto.
diff --git a/drivers/crypto/vmx/Makefile b/drivers/crypto/vmx/Makefile
deleted file mode 100644
index 7257b8c44626..000000000000
--- a/drivers/crypto/vmx/Makefile
+++ /dev/null
@@ -1,23 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0
-obj-$(CONFIG_CRYPTO_DEV_VMX_ENCRYPT) += vmx-crypto.o
-vmx-crypto-objs := vmx.o aesp8-ppc.o ghashp8-ppc.o aes.o aes_cbc.o aes_ctr.o aes_xts.o ghash.o
-
-ifeq ($(CONFIG_CPU_LITTLE_ENDIAN),y)
-override flavour := linux-ppc64le
-else
-ifdef CONFIG_PPC64_ELF_ABI_V2
-override flavour := linux-ppc64-elfv2
-else
-override flavour := linux-ppc64
-endif
-endif
-
-quiet_cmd_perl = PERL    $@
-      cmd_perl = $(PERL) $< $(flavour) > $@
-
-targets += aesp8-ppc.S ghashp8-ppc.S
-
-$(obj)/aesp8-ppc.S $(obj)/ghashp8-ppc.S: $(obj)/%.S: $(src)/%.pl FORCE
-	$(call if_changed,perl)
-
-OBJECT_FILES_NON_STANDARD_aesp8-ppc.o := y
diff --git a/drivers/crypto/vmx/ppc-xlate.pl b/drivers/crypto/vmx/ppc-xlate.pl
deleted file mode 100644
index b583898c11ae..000000000000
--- a/drivers/crypto/vmx/ppc-xlate.pl
+++ /dev/null
@@ -1,231 +0,0 @@
-#!/usr/bin/env perl
-# SPDX-License-Identifier: GPL-2.0
-
-# PowerPC assembler distiller by <appro>.
-
-my $flavour = shift;
-my $output = shift;
-open STDOUT,">$output" || die "can't open $output: $!";
-
-my %GLOBALS;
-my $dotinlocallabels=($flavour=~/linux/)?1:0;
-my $elfv2abi=(($flavour =~ /linux-ppc64le/) or ($flavour =~ /linux-ppc64-elfv2/))?1:0;
-my $dotfunctions=($elfv2abi=~1)?0:1;
-
-################################################################
-# directives which need special treatment on different platforms
-################################################################
-my $globl = sub {
-    my $junk = shift;
-    my $name = shift;
-    my $global = \$GLOBALS{$name};
-    my $ret;
-
-    $name =~ s|^[\.\_]||;
- 
-    SWITCH: for ($flavour) {
-	/aix/		&& do { $name = ".$name";
-				last;
-			      };
-	/osx/		&& do { $name = "_$name";
-				last;
-			      };
-	/linux/
-			&& do {	$ret = "_GLOBAL($name)";
-				last;
-			      };
-    }
-
-    $ret = ".globl	$name\nalign 5\n$name:" if (!$ret);
-    $$global = $name;
-    $ret;
-};
-my $text = sub {
-    my $ret = ($flavour =~ /aix/) ? ".csect\t.text[PR],7" : ".text";
-    $ret = ".abiversion	2\n".$ret	if ($elfv2abi);
-    $ret;
-};
-my $machine = sub {
-    my $junk = shift;
-    my $arch = shift;
-    if ($flavour =~ /osx/)
-    {	$arch =~ s/\"//g;
-	$arch = ($flavour=~/64/) ? "ppc970-64" : "ppc970" if ($arch eq "any");
-    }
-    ".machine	$arch";
-};
-my $size = sub {
-    if ($flavour =~ /linux/)
-    {	shift;
-	my $name = shift; $name =~ s|^[\.\_]||;
-	my $ret  = ".size	$name,.-".($dotfunctions?".":"").$name;
-	$ret .= "\n.size	.$name,.-.$name" if ($dotfunctions);
-	$ret;
-    }
-    else
-    {	"";	}
-};
-my $asciz = sub {
-    shift;
-    my $line = join(",",@_);
-    if ($line =~ /^"(.*)"$/)
-    {	".byte	" . join(",",unpack("C*",$1),0) . "\n.align	2";	}
-    else
-    {	"";	}
-};
-my $quad = sub {
-    shift;
-    my @ret;
-    my ($hi,$lo);
-    for (@_) {
-	if (/^0x([0-9a-f]*?)([0-9a-f]{1,8})$/io)
-	{  $hi=$1?"0x$1":"0"; $lo="0x$2";  }
-	elsif (/^([0-9]+)$/o)
-	{  $hi=$1>>32; $lo=$1&0xffffffff;  } # error-prone with 32-bit perl
-	else
-	{  $hi=undef; $lo=$_; }
-
-	if (defined($hi))
-	{  push(@ret,$flavour=~/le$/o?".long\t$lo,$hi":".long\t$hi,$lo");  }
-	else
-	{  push(@ret,".quad	$lo");  }
-    }
-    join("\n",@ret);
-};
-
-################################################################
-# simplified mnemonics not handled by at least one assembler
-################################################################
-my $cmplw = sub {
-    my $f = shift;
-    my $cr = 0; $cr = shift if ($#_>1);
-    # Some out-of-date 32-bit GNU assembler just can't handle cmplw...
-    ($flavour =~ /linux.*32/) ?
-	"	.long	".sprintf "0x%x",31<<26|$cr<<23|$_[0]<<16|$_[1]<<11|64 :
-	"	cmplw	".join(',',$cr,@_);
-};
-my $bdnz = sub {
-    my $f = shift;
-    my $bo = $f=~/[\+\-]/ ? 16+9 : 16;	# optional "to be taken" hint
-    "	bc	$bo,0,".shift;
-} if ($flavour!~/linux/);
-my $bltlr = sub {
-    my $f = shift;
-    my $bo = $f=~/\-/ ? 12+2 : 12;	# optional "not to be taken" hint
-    ($flavour =~ /linux/) ?		# GNU as doesn't allow most recent hints
-	"	.long	".sprintf "0x%x",19<<26|$bo<<21|16<<1 :
-	"	bclr	$bo,0";
-};
-my $bnelr = sub {
-    my $f = shift;
-    my $bo = $f=~/\-/ ? 4+2 : 4;	# optional "not to be taken" hint
-    ($flavour =~ /linux/) ?		# GNU as doesn't allow most recent hints
-	"	.long	".sprintf "0x%x",19<<26|$bo<<21|2<<16|16<<1 :
-	"	bclr	$bo,2";
-};
-my $beqlr = sub {
-    my $f = shift;
-    my $bo = $f=~/-/ ? 12+2 : 12;	# optional "not to be taken" hint
-    ($flavour =~ /linux/) ?		# GNU as doesn't allow most recent hints
-	"	.long	".sprintf "0x%X",19<<26|$bo<<21|2<<16|16<<1 :
-	"	bclr	$bo,2";
-};
-# GNU assembler can't handle extrdi rA,rS,16,48, or when sum of last two
-# arguments is 64, with "operand out of range" error.
-my $extrdi = sub {
-    my ($f,$ra,$rs,$n,$b) = @_;
-    $b = ($b+$n)&63; $n = 64-$n;
-    "	rldicl	$ra,$rs,$b,$n";
-};
-my $vmr = sub {
-    my ($f,$vx,$vy) = @_;
-    "	vor	$vx,$vy,$vy";
-};
-
-# Some ABIs specify vrsave, special-purpose register #256, as reserved
-# for system use.
-my $no_vrsave = ($elfv2abi);
-my $mtspr = sub {
-    my ($f,$idx,$ra) = @_;
-    if ($idx == 256 && $no_vrsave) {
-	"	or	$ra,$ra,$ra";
-    } else {
-	"	mtspr	$idx,$ra";
-    }
-};
-my $mfspr = sub {
-    my ($f,$rd,$idx) = @_;
-    if ($idx == 256 && $no_vrsave) {
-	"	li	$rd,-1";
-    } else {
-	"	mfspr	$rd,$idx";
-    }
-};
-
-# PowerISA 2.06 stuff
-sub vsxmem_op {
-    my ($f, $vrt, $ra, $rb, $op) = @_;
-    "	.long	".sprintf "0x%X",(31<<26)|($vrt<<21)|($ra<<16)|($rb<<11)|($op*2+1);
-}
-# made-up unaligned memory reference AltiVec/VMX instructions
-my $lvx_u	= sub {	vsxmem_op(@_, 844); };	# lxvd2x
-my $stvx_u	= sub {	vsxmem_op(@_, 972); };	# stxvd2x
-my $lvdx_u	= sub {	vsxmem_op(@_, 588); };	# lxsdx
-my $stvdx_u	= sub {	vsxmem_op(@_, 716); };	# stxsdx
-my $lvx_4w	= sub { vsxmem_op(@_, 780); };	# lxvw4x
-my $stvx_4w	= sub { vsxmem_op(@_, 908); };	# stxvw4x
-
-# PowerISA 2.07 stuff
-sub vcrypto_op {
-    my ($f, $vrt, $vra, $vrb, $op) = @_;
-    "	.long	".sprintf "0x%X",(4<<26)|($vrt<<21)|($vra<<16)|($vrb<<11)|$op;
-}
-my $vcipher	= sub { vcrypto_op(@_, 1288); };
-my $vcipherlast	= sub { vcrypto_op(@_, 1289); };
-my $vncipher	= sub { vcrypto_op(@_, 1352); };
-my $vncipherlast= sub { vcrypto_op(@_, 1353); };
-my $vsbox	= sub { vcrypto_op(@_, 0, 1480); };
-my $vshasigmad	= sub { my ($st,$six)=splice(@_,-2); vcrypto_op(@_, $st<<4|$six, 1730); };
-my $vshasigmaw	= sub { my ($st,$six)=splice(@_,-2); vcrypto_op(@_, $st<<4|$six, 1666); };
-my $vpmsumb	= sub { vcrypto_op(@_, 1032); };
-my $vpmsumd	= sub { vcrypto_op(@_, 1224); };
-my $vpmsubh	= sub { vcrypto_op(@_, 1096); };
-my $vpmsumw	= sub { vcrypto_op(@_, 1160); };
-my $vaddudm	= sub { vcrypto_op(@_, 192);  };
-my $vadduqm	= sub { vcrypto_op(@_, 256);  };
-
-my $mtsle	= sub {
-    my ($f, $arg) = @_;
-    "	.long	".sprintf "0x%X",(31<<26)|($arg<<21)|(147*2);
-};
-
-print "#include <asm/ppc_asm.h>\n" if $flavour =~ /linux/;
-
-while($line=<>) {
-
-    $line =~ s|[#!;].*$||;	# get rid of asm-style comments...
-    $line =~ s|/\*.*\*/||;	# ... and C-style comments...
-    $line =~ s|^\s+||;		# ... and skip white spaces in beginning...
-    $line =~ s|\s+$||;		# ... and at the end
-
-    {
-	$line =~ s|\b\.L(\w+)|L$1|g;	# common denominator for Locallabel
-	$line =~ s|\bL(\w+)|\.L$1|g	if ($dotinlocallabels);
-    }
-
-    {
-	$line =~ s|^\s*(\.?)(\w+)([\.\+\-]?)\s*||;
-	my $c = $1; $c = "\t" if ($c eq "");
-	my $mnemonic = $2;
-	my $f = $3;
-	my $opcode = eval("\$$mnemonic");
-	$line =~ s/\b(c?[rf]|v|vs)([0-9]+)\b/$2/g if ($c ne "." and $flavour !~ /osx/);
-	if (ref($opcode) eq 'CODE') { $line = &$opcode($f,split(',',$line)); }
-	elsif ($mnemonic)           { $line = $c.$mnemonic.$f."\t".$line; }
-    }
-
-    print $line if ($line);
-    print "\n";
-}
-
-close STDOUT;
-- 
2.31.1

