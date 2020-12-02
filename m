Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8563F2CBD05
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Dec 2020 13:30:21 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CmJG25fYMzDqTR
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Dec 2020 23:30:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=metux.net
 (client-ip=212.227.126.134; helo=mout.kundenserver.de;
 envelope-from=info@metux.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=metux.net
X-Greylist: delayed 429 seconds by postgrey-1.36 at bilbo;
 Wed, 02 Dec 2020 23:26:03 AEDT
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.134])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CmJ972lKgzDr0w
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Dec 2020 23:25:59 +1100 (AEDT)
Received: from orion.localdomain ([77.7.48.174]) by mrelayeu.kundenserver.de
 (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MJV9M-1kV75Q0XNo-00JsFP; Wed, 02 Dec 2020 13:15:56 +0100
From: "Enrico Weigelt, metux IT consult" <info@metux.net>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] drivers: char: tpm: remove unneeded MODULE_VERSION() usage
Date: Wed,  2 Dec 2020 13:15:53 +0100
Message-Id: <20201202121553.9383-1-info@metux.net>
X-Mailer: git-send-email 2.11.0
X-Provags-ID: V03:K1:S6jGKntch7TnNIvjw5HeYSwa3cdu9ChH6KIdjiN8Aw6I10nMGVT
 TfxVfBy1k7mv46B8Dyrm80CAJCZqiQzdUJlFmeCNabr0Yole0YWL1/NssfqGPj25DwI+gDj
 axY/uaskxTMUnwAA/4I8jGIBD5qbYDx2YnkpBrrX7YVWCj1EqbEgOxsztP6dEwhqkIaNs9W
 dv4rRCeBj25UrBA2tthTA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:jHGHfK87aFI=:X/MYA4YK7cdsoZr0R47vJr
 qcline2vdYAAPNDo/SL1/omfPiYBh8D+jeDKKe48mzjyaNxLDUC+kWKSBw82e3ZyXBb4jU5en
 p21SgqBYyuM5xVw1+30mtb4UNrK3keVF7qPuBI/MeWEzk7NEgj3kkD4bYgs1QHr6CXAZZL+ky
 L91pLWthv3DqhXRr4L9OruFGVEvy0h8hKIHbZTkBbcA6k2JP/IWa0wEecwGoF5tSHU8Vkn7nQ
 UgAZIkjrk3ziV6w5o+bxibe5BIawRlw4NqSwBttKnXGOECadRNSmaKILFgG1YlW9mkwkup5Fw
 JD/WDEwXCKdKjrJD/aFEBrFUrVjzx0TwdRt9SrZk/ZT+LRd+t100ZYb4XHnDtihnGgSXWFsDQ
 eSbprJ7rtnfBV1PdtETxO4QbcTXTSwLx5X/K7apCjqKXAEUE3CNkYFmyCALwT
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
Cc: jgg@ziepe.ca, jarkko@kernel.org, paulus@samba.org,
 linux-integrity@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 peterhuewe@gmx.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Remove MODULE_VERSION(), as it isn't needed at all: the only version
making sense is the kernel version.

Link: https://lkml.org/lkml/2017/11/22/480

Signed-off-by: Enrico Weigelt <info@metux.net>
---
 drivers/char/tpm/st33zp24/i2c.c      | 1 -
 drivers/char/tpm/st33zp24/spi.c      | 1 -
 drivers/char/tpm/st33zp24/st33zp24.c | 1 -
 drivers/char/tpm/tpm-interface.c     | 1 -
 drivers/char/tpm/tpm_atmel.c         | 1 -
 drivers/char/tpm/tpm_crb.c           | 1 -
 drivers/char/tpm/tpm_i2c_infineon.c  | 1 -
 drivers/char/tpm/tpm_ibmvtpm.c       | 1 -
 drivers/char/tpm/tpm_infineon.c      | 1 -
 drivers/char/tpm/tpm_nsc.c           | 1 -
 drivers/char/tpm/tpm_tis.c           | 1 -
 drivers/char/tpm/tpm_tis_core.c      | 1 -
 drivers/char/tpm/tpm_vtpm_proxy.c    | 1 -
 13 files changed, 13 deletions(-)

diff --git a/drivers/char/tpm/st33zp24/i2c.c b/drivers/char/tpm/st33zp24/i2c.c
index 7c617edff4ca..7ed9829cacc4 100644
--- a/drivers/char/tpm/st33zp24/i2c.c
+++ b/drivers/char/tpm/st33zp24/i2c.c
@@ -313,5 +313,4 @@ module_i2c_driver(st33zp24_i2c_driver);
 
 MODULE_AUTHOR("TPM support (TPMsupport@list.st.com)");
 MODULE_DESCRIPTION("STM TPM 1.2 I2C ST33 Driver");
-MODULE_VERSION("1.3.0");
 MODULE_LICENSE("GPL");
diff --git a/drivers/char/tpm/st33zp24/spi.c b/drivers/char/tpm/st33zp24/spi.c
index a75dafd39445..147efea4eb05 100644
--- a/drivers/char/tpm/st33zp24/spi.c
+++ b/drivers/char/tpm/st33zp24/spi.c
@@ -430,5 +430,4 @@ module_spi_driver(st33zp24_spi_driver);
 
 MODULE_AUTHOR("TPM support (TPMsupport@list.st.com)");
 MODULE_DESCRIPTION("STM TPM 1.2 SPI ST33 Driver");
-MODULE_VERSION("1.3.0");
 MODULE_LICENSE("GPL");
diff --git a/drivers/char/tpm/st33zp24/st33zp24.c b/drivers/char/tpm/st33zp24/st33zp24.c
index 4ec10ab5e576..e0f1a5828993 100644
--- a/drivers/char/tpm/st33zp24/st33zp24.c
+++ b/drivers/char/tpm/st33zp24/st33zp24.c
@@ -646,5 +646,4 @@ EXPORT_SYMBOL(st33zp24_pm_resume);
 
 MODULE_AUTHOR("TPM support (TPMsupport@list.st.com)");
 MODULE_DESCRIPTION("ST33ZP24 TPM 1.2 driver");
-MODULE_VERSION("1.3.0");
 MODULE_LICENSE("GPL");
diff --git a/drivers/char/tpm/tpm-interface.c b/drivers/char/tpm/tpm-interface.c
index 1621ce818705..dfdc68b8bf88 100644
--- a/drivers/char/tpm/tpm-interface.c
+++ b/drivers/char/tpm/tpm-interface.c
@@ -514,5 +514,4 @@ module_exit(tpm_exit);
 
 MODULE_AUTHOR("Leendert van Doorn (leendert@watson.ibm.com)");
 MODULE_DESCRIPTION("TPM Driver");
-MODULE_VERSION("2.0");
 MODULE_LICENSE("GPL");
diff --git a/drivers/char/tpm/tpm_atmel.c b/drivers/char/tpm/tpm_atmel.c
index 54a6750a6757..35bf249cc95a 100644
--- a/drivers/char/tpm/tpm_atmel.c
+++ b/drivers/char/tpm/tpm_atmel.c
@@ -231,5 +231,4 @@ module_exit(cleanup_atmel);
 
 MODULE_AUTHOR("Leendert van Doorn (leendert@watson.ibm.com)");
 MODULE_DESCRIPTION("TPM Driver");
-MODULE_VERSION("2.0");
 MODULE_LICENSE("GPL");
diff --git a/drivers/char/tpm/tpm_crb.c b/drivers/char/tpm/tpm_crb.c
index a9dcf31eadd2..3e72b7b99cce 100644
--- a/drivers/char/tpm/tpm_crb.c
+++ b/drivers/char/tpm/tpm_crb.c
@@ -748,5 +748,4 @@ static struct acpi_driver crb_acpi_driver = {
 module_acpi_driver(crb_acpi_driver);
 MODULE_AUTHOR("Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>");
 MODULE_DESCRIPTION("TPM2 Driver");
-MODULE_VERSION("0.1");
 MODULE_LICENSE("GPL");
diff --git a/drivers/char/tpm/tpm_i2c_infineon.c b/drivers/char/tpm/tpm_i2c_infineon.c
index a19d32cb4e94..8920b7c19fcb 100644
--- a/drivers/char/tpm/tpm_i2c_infineon.c
+++ b/drivers/char/tpm/tpm_i2c_infineon.c
@@ -731,5 +731,4 @@ static struct i2c_driver tpm_tis_i2c_driver = {
 module_i2c_driver(tpm_tis_i2c_driver);
 MODULE_AUTHOR("Peter Huewe <peter.huewe@infineon.com>");
 MODULE_DESCRIPTION("TPM TIS I2C Infineon Driver");
-MODULE_VERSION("2.2.0");
 MODULE_LICENSE("GPL");
diff --git a/drivers/char/tpm/tpm_ibmvtpm.c b/drivers/char/tpm/tpm_ibmvtpm.c
index 994385bf37c0..5b04d113f634 100644
--- a/drivers/char/tpm/tpm_ibmvtpm.c
+++ b/drivers/char/tpm/tpm_ibmvtpm.c
@@ -750,5 +750,4 @@ module_exit(ibmvtpm_module_exit);
 
 MODULE_AUTHOR("adlai@us.ibm.com");
 MODULE_DESCRIPTION("IBM vTPM Driver");
-MODULE_VERSION("1.0");
 MODULE_LICENSE("GPL");
diff --git a/drivers/char/tpm/tpm_infineon.c b/drivers/char/tpm/tpm_infineon.c
index 9c924a1440a9..8a58966c5c9b 100644
--- a/drivers/char/tpm/tpm_infineon.c
+++ b/drivers/char/tpm/tpm_infineon.c
@@ -621,5 +621,4 @@ module_pnp_driver(tpm_inf_pnp_driver);
 
 MODULE_AUTHOR("Marcel Selhorst <tpmdd@sirrix.com>");
 MODULE_DESCRIPTION("Driver for Infineon TPM SLD 9630 TT 1.1 / SLB 9635 TT 1.2");
-MODULE_VERSION("1.9.2");
 MODULE_LICENSE("GPL");
diff --git a/drivers/char/tpm/tpm_nsc.c b/drivers/char/tpm/tpm_nsc.c
index 038701d48351..6ab2fe7e8782 100644
--- a/drivers/char/tpm/tpm_nsc.c
+++ b/drivers/char/tpm/tpm_nsc.c
@@ -412,5 +412,4 @@ module_exit(cleanup_nsc);
 
 MODULE_AUTHOR("Leendert van Doorn (leendert@watson.ibm.com)");
 MODULE_DESCRIPTION("TPM Driver");
-MODULE_VERSION("2.0");
 MODULE_LICENSE("GPL");
diff --git a/drivers/char/tpm/tpm_tis.c b/drivers/char/tpm/tpm_tis.c
index 4ed6e660273a..3074235b405d 100644
--- a/drivers/char/tpm/tpm_tis.c
+++ b/drivers/char/tpm/tpm_tis.c
@@ -429,5 +429,4 @@ module_init(init_tis);
 module_exit(cleanup_tis);
 MODULE_AUTHOR("Leendert van Doorn (leendert@watson.ibm.com)");
 MODULE_DESCRIPTION("TPM Driver");
-MODULE_VERSION("2.0");
 MODULE_LICENSE("GPL");
diff --git a/drivers/char/tpm/tpm_tis_core.c b/drivers/char/tpm/tpm_tis_core.c
index 92c51c6cfd1b..20f4b2c7ea52 100644
--- a/drivers/char/tpm/tpm_tis_core.c
+++ b/drivers/char/tpm/tpm_tis_core.c
@@ -1164,5 +1164,4 @@ EXPORT_SYMBOL_GPL(tpm_tis_resume);
 
 MODULE_AUTHOR("Leendert van Doorn (leendert@watson.ibm.com)");
 MODULE_DESCRIPTION("TPM Driver");
-MODULE_VERSION("2.0");
 MODULE_LICENSE("GPL");
diff --git a/drivers/char/tpm/tpm_vtpm_proxy.c b/drivers/char/tpm/tpm_vtpm_proxy.c
index 91c772e38bb5..18f14162d1c1 100644
--- a/drivers/char/tpm/tpm_vtpm_proxy.c
+++ b/drivers/char/tpm/tpm_vtpm_proxy.c
@@ -729,5 +729,4 @@ module_exit(vtpm_module_exit);
 
 MODULE_AUTHOR("Stefan Berger (stefanb@us.ibm.com)");
 MODULE_DESCRIPTION("vTPM Driver");
-MODULE_VERSION("0.1");
 MODULE_LICENSE("GPL");
-- 
2.11.0

