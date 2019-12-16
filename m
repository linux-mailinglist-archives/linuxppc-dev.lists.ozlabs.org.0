Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DB55120044
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Dec 2019 09:51:17 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47bw3k4xY3zDqTq
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Dec 2019 19:51:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=metux.net
 (client-ip=212.227.126.131; helo=mout.kundenserver.de;
 envelope-from=info@metux.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=metux.net
X-Greylist: delayed 335 seconds by postgrey-1.36 at bilbo;
 Mon, 16 Dec 2019 19:49:16 AEDT
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47bw1S6rndzDqDx
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Dec 2019 19:49:16 +1100 (AEDT)
Received: from orion.localdomain ([77.2.44.177]) by mrelayeu.kundenserver.de
 (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1N2jO8-1hiOOQ3fYa-0137DZ; Mon, 16 Dec 2019 09:43:02 +0100
From: "Enrico Weigelt, metux IT consult" <info@metux.net>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] drivers: char: tpm: remove unneeded MODULE_VERSION() usage
Date: Mon, 16 Dec 2019 09:42:30 +0100
Message-Id: <20191216084230.31412-1-info@metux.net>
X-Mailer: git-send-email 2.11.0
X-Provags-ID: V03:K1:ZRMRCvGtq21lbtgskvbS5prFUgst+5RwJZEQW66QiN+qjkuMlBc
 uGZLISeYLgQ9heOIGqmejXQW6EJ1Yj9dlSn4uQwVBS1GCATDsnRMdpuN2L0Y/QUQihyF0/5
 Py17FBwzilsZjijPn/vtG8iHe13gTG4QALNK+LcHtpbLNoRNZbWECYtzyjqi0Lcjg6loX+I
 NHKQcxcT7bFsh1zJN5JKA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:FTjVl9iVLCM=:615AOCvORb17ezdjDykKOa
 O65kTBYdxeRpP2UcBRbdt/C8uo4vx87/d3Vb41S2dShrkVVh40iJ2bTaAJM2oHVeBvhfyuD6W
 QDBs0LzAGtBysIYE1UUfabwtcIt1rofZa7BYqrP5jD1MVsqc04SPPrrf1WEkWYt2eYZHSKhRn
 XASaNscbdfGfOkeAUdZzd3xLZsmmtVdGiFu90vr7Mg/lZ7d0/fyyRSh2cThnKSk9+h3VCBN1a
 iYN+ASXYxOyukOgL4O+wPGBHW3xdLJ8w5b/DqfWJjeTMwY+PFrYIzJFURWgdR6qNLJKSakyJV
 twypeKvJ4bjNb7V9RJUWk5H8pJgET0yx3SU78IgbU5QaPFd939py6poL1e5nCid3zo48j6EBh
 LXFnOuS2qX/NNtZuz69HxqZH8CUomiZB1967R9oIIaMRhLQb0+Ro/gNy6HSwnu5g6xRBLBABA
 8I/QGC24CKiI61YOvsZaHo9+MfN2EplvzgpiiUd98axAgBHYU6j9YBlHsgZn6Pn0ICckaTJxe
 KiJsJ25Qve1EgRbPHT7zvqN9B4jNlHDd5PucAMPYOqrvUlPxDLwTxJb+JctYseJYZBMxiE0PQ
 Y1jb5msIbptX6EbveYpS5gw+fCVJgU4CiTgz21PvuAbOQx7Mz7UXTm8hqChTWJUJjg7kmO8Yq
 ojoquAHjlDxIewPs7/pJN5B1s83RtYo9liVp9tIcpSAQKsDPUAoVHrtDIYyUrNoskUt7YUoMj
 iqIUpW14qox/6MI0klQWG8PhLDDPz0UOL68YW4GUDVPj7E2H5FooiIhveKbcwtk5AgSBNLgsv
 nkfNgdX6X+wAm9HVcV92GWnPOQbNx9/p67KNJdGfHgP2gmm22xENihQUbiLkStumnISdAMkHi
 xWsOc63CvCwOwaE9jM4A==
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
Cc: jgg@ziepe.ca, peterhuewe@gmx.de, linuxppc-dev@lists.ozlabs.org,
 linux-integrity@vger.kernel.org, jarkko.sakkinen@linux.intel.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Remove MODULE_VERSION(), as it isn't needed at all: the only version
making sense is the kernel version.

See also: https://lkml.org/lkml/2017/11/22/480

Signed-off-by: Enrico Weigelt, metux IT consult <info@metux.net>
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
index 35333b65acd1..71df056f14c9 100644
--- a/drivers/char/tpm/st33zp24/i2c.c
+++ b/drivers/char/tpm/st33zp24/i2c.c
@@ -313,5 +313,4 @@ module_i2c_driver(st33zp24_i2c_driver);
 
 MODULE_AUTHOR("TPM support (TPMsupport@list.st.com)");
 MODULE_DESCRIPTION("STM TPM 1.2 I2C ST33 Driver");
-MODULE_VERSION("1.3.0");
 MODULE_LICENSE("GPL");
diff --git a/drivers/char/tpm/st33zp24/spi.c b/drivers/char/tpm/st33zp24/spi.c
index 26e09de50f1e..94ceced4d57d 100644
--- a/drivers/char/tpm/st33zp24/spi.c
+++ b/drivers/char/tpm/st33zp24/spi.c
@@ -430,5 +430,4 @@ module_spi_driver(st33zp24_spi_driver);
 
 MODULE_AUTHOR("TPM support (TPMsupport@list.st.com)");
 MODULE_DESCRIPTION("STM TPM 1.2 SPI ST33 Driver");
-MODULE_VERSION("1.3.0");
 MODULE_LICENSE("GPL");
diff --git a/drivers/char/tpm/st33zp24/st33zp24.c b/drivers/char/tpm/st33zp24/st33zp24.c
index 37bb13f516be..60269b6ac470 100644
--- a/drivers/char/tpm/st33zp24/st33zp24.c
+++ b/drivers/char/tpm/st33zp24/st33zp24.c
@@ -646,5 +646,4 @@ EXPORT_SYMBOL(st33zp24_pm_resume);
 
 MODULE_AUTHOR("TPM support (TPMsupport@list.st.com)");
 MODULE_DESCRIPTION("ST33ZP24 TPM 1.2 driver");
-MODULE_VERSION("1.3.0");
 MODULE_LICENSE("GPL");
diff --git a/drivers/char/tpm/tpm-interface.c b/drivers/char/tpm/tpm-interface.c
index a438b1206fcb..91d4584f399d 100644
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
index 78cc52690177..034d24758915 100644
--- a/drivers/char/tpm/tpm_ibmvtpm.c
+++ b/drivers/char/tpm/tpm_ibmvtpm.c
@@ -723,5 +723,4 @@ module_exit(ibmvtpm_module_exit);
 
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
index e7df342a317d..713773ebff81 100644
--- a/drivers/char/tpm/tpm_tis.c
+++ b/drivers/char/tpm/tpm_tis.c
@@ -397,5 +397,4 @@ module_init(init_tis);
 module_exit(cleanup_tis);
 MODULE_AUTHOR("Leendert van Doorn (leendert@watson.ibm.com)");
 MODULE_DESCRIPTION("TPM Driver");
-MODULE_VERSION("2.0");
 MODULE_LICENSE("GPL");
diff --git a/drivers/char/tpm/tpm_tis_core.c b/drivers/char/tpm/tpm_tis_core.c
index 8af2cee1a762..1aeb11e5fd5b 100644
--- a/drivers/char/tpm/tpm_tis_core.c
+++ b/drivers/char/tpm/tpm_tis_core.c
@@ -1150,5 +1150,4 @@ EXPORT_SYMBOL_GPL(tpm_tis_resume);
 
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

