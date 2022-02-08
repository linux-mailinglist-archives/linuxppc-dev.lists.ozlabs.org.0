Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 849AE4AD1C1
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Feb 2022 07:47:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JtD971z4Lz3bZw
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Feb 2022 17:47:55 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=wdc.com header.i=@wdc.com header.a=rsa-sha256 header.s=dkim.wdc.com header.b=obLHJo+3;
	dkim=pass (2048-bit key; unprotected) header.d=opensource.wdc.com header.i=@opensource.wdc.com header.a=rsa-sha256 header.s=dkim header.b=FHuq79vD;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=opensource.wdc.com (client-ip=68.232.141.245;
 helo=esa1.hgst.iphmx.com;
 envelope-from=prvs=031d9b7bb=damien.lemoal@opensource.wdc.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=wdc.com header.i=@wdc.com header.a=rsa-sha256
 header.s=dkim.wdc.com header.b=obLHJo+3; 
 dkim=pass (2048-bit key;
 unprotected) header.d=opensource.wdc.com header.i=@opensource.wdc.com
 header.a=rsa-sha256 header.s=dkim header.b=FHuq79vD; 
 dkim-atps=neutral
X-Greylist: delayed 63 seconds by postgrey-1.36 at boromir;
 Tue, 08 Feb 2022 17:47:16 AEDT
Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JtD8N61HVz2yMy
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Feb 2022 17:47:16 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1644302837; x=1675838837;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=rJGVm7SxByO0hYyrFlA5OoRBekUIz5jTYQl12AVf8Bg=;
 b=obLHJo+3BPM6iOHlfsyjF8BVY7o4D5otCMKa56kqXbuPcJRCRIrxewmN
 0K9jhGDxjQAcwXnv/rciTEu07IV6XRTSyxlgizdaQzqKJOjpiYkvp7xCv
 cD4fc7bOiw08SDGWkrxkMBtCHQVQJiIyAQgZVSLbnJ1CR3RJFDhu2TFUD
 yCmcMUNA/BuFROArNJ+4fq3sosCXugyZTOI0OW0kQEhYHGHfYEwfKyRoC
 LVOj0aV0biHkNzDH9zra0IZtF1WfwHwMjQaSRie5NKbnY95CrDKO/zzZN
 yUuMikCCZbLtKI6KxqcGi45ciAk7P7qr1doiPRnU/NiGaVi/xvlQFvMiJ A==;
X-IronPort-AV: E=Sophos;i="5.88,352,1635177600"; d="scan'208";a="304297026"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 08 Feb 2022 14:46:06 +0800
IronPort-SDR: Ptuxei8huYI8Vbb68xzurTCxAR2GMX2KSYU+A9TSYBj6D+1WWlPPgF0+Vh3CiykOMXDoIh2GAe
 0nj3aoiog0EgHa5XDcmHtV4eHkEKn6IDUGjUgYU1SItso/ZRkoWgDqOBgwZpjliecsSz1kixG9
 YgHfRtMCeYmljxyozNnAbI4TRSIfV4iU1J24VJajpxWhniOhtw+gKp/9aDdCea+KT0g19eDiyY
 rruYh4IwNpKUXTn0ULbQ39sd3TGMRBOcfFHilQS9gYc2aq+MZlv1AGf4RxEiR41Lf0RNg2z22n
 kGVmKsjv7bNyaJ9ewdaJPifZ
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2022 22:17:56 -0800
IronPort-SDR: v4USyfhX6tkQJQDQ7ZC4JroDs9u3jUiJvbwUlasymEsDJgGl8ZBlOcem8bmzM41f374oNDcSfE
 5HG+lYLJzKymIOuXMUUDoRum6n9KvlUumkltRZCQTI/oEUAY/pX+FZ8A+m5NtTezCBjuH5COMl
 WSz90SOC9wNffsmaUxQPx80xDxxiSm+rXme5ahYpHHEb6JDRFZ7dIiXjREu+99ovyetSWvpvik
 aR+2ZgCahzOv6ktjJJkaVu1S8dlWroJ65sgqsWeAXE54A392rOU6Rb/HIIphbvIBpGNKj4qVn9
 zXE=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2022 22:46:07 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4JtD721KmZz1SVp2
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  7 Feb 2022 22:46:06 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :x-mailer:message-id:date:subject:to:from; s=dkim; t=1644302765;
 x=1646894766; bh=rJGVm7SxByO0hYyrFlA5OoRBekUIz5jTYQl12AVf8Bg=; b=
 FHuq79vD0/KFd0II3hNIIdtv08XjWDkeVikRoCgSjKrLEPyx26Cy0Yccqezd9MNC
 RujSCBsYpfW9aBHXhMk79mVxfhh0bUd6kbIsJQUWOMLL1RLt98QYitNrDJ8Bwa5J
 0MvYd1MPYDxdU1I6JPSCcJfALf+otgxMbisbDETew6ZFqooUTlfXCua+iaadPQKp
 +lqiWiC2PgNYuKZyu+HH0uR7whgmRZnAyEB4ERhmXtYKU1CwRqaOOZvxDVdhNOV+
 i/7DPDtgZEIwyZZPFaI6rhaRsno7RUNTF3ysbq4xVTBu4DxCHp7FeNuFadx0mjaG
 WOEHIa5b9TnMI55l+77B+w==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026)
 with ESMTP id lCjvx4wBjZmt for <linuxppc-dev@lists.ozlabs.org>;
 Mon,  7 Feb 2022 22:46:05 -0800 (PST)
Received: from washi.fujisawa.hgst.com (washi.fujisawa.hgst.com
 [10.149.53.254])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4JtD705hWbz1Rwrw;
 Mon,  7 Feb 2022 22:46:04 -0800 (PST)
From: Damien Le Moal <damien.lemoal@opensource.wdc.com>
To: linuxppc-dev@lists.ozlabs.org, Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, linux-ide@vger.kernel.org
Subject: [PATCH] ata: sata_fsl: fix sscanf() and sysfs_emit() format strings
Date: Tue,  8 Feb 2022 15:46:01 +0900
Message-Id: <20220208064601.237582-1-damien.lemoal@opensource.wdc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Use the %u format for unsigned int parameters handling with sscanf() and
sysfs_emit() to avoid compilation warnings. In
fsl_sata_rx_watermark_store(), the call to sscanf() to parse a single
argument is replaced with a call to kstrtouint().

While at it, also replace the printk(KERN_ERR) calls with dev_err()
calls and fix blank lines in fsl_sata_rx_watermark_store().

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>
---
 drivers/ata/sata_fsl.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/drivers/ata/sata_fsl.c b/drivers/ata/sata_fsl.c
index da0152116d9f..556034a15430 100644
--- a/drivers/ata/sata_fsl.c
+++ b/drivers/ata/sata_fsl.c
@@ -322,7 +322,7 @@ static void fsl_sata_set_irq_coalescing(struct ata_ho=
st *host,
 static ssize_t fsl_sata_intr_coalescing_show(struct device *dev,
 		struct device_attribute *attr, char *buf)
 {
-	return sysfs_emit(buf, "%d	%d\n",
+	return sysfs_emit(buf, "%u	%u\n",
 			intr_coalescing_count, intr_coalescing_ticks);
 }
=20
@@ -332,10 +332,8 @@ static ssize_t fsl_sata_intr_coalescing_store(struct=
 device *dev,
 {
 	unsigned int coalescing_count,	coalescing_ticks;
=20
-	if (sscanf(buf, "%d%d",
-				&coalescing_count,
-				&coalescing_ticks) !=3D 2) {
-		printk(KERN_ERR "fsl-sata: wrong parameter format.\n");
+	if (sscanf(buf, "%u%u", &coalescing_count, &coalescing_ticks) !=3D 2) {
+		dev_err(dev, "fsl-sata: wrong parameter format.\n");
 		return -EINVAL;
 	}
=20
@@ -359,7 +357,7 @@ static ssize_t fsl_sata_rx_watermark_show(struct devi=
ce *dev,
 	rx_watermark &=3D 0x1f;
 	spin_unlock_irqrestore(&host->lock, flags);
=20
-	return sysfs_emit(buf, "%d\n", rx_watermark);
+	return sysfs_emit(buf, "%u\n", rx_watermark);
 }
=20
 static ssize_t fsl_sata_rx_watermark_store(struct device *dev,
@@ -373,8 +371,8 @@ static ssize_t fsl_sata_rx_watermark_store(struct dev=
ice *dev,
 	void __iomem *csr_base =3D host_priv->csr_base;
 	u32 temp;
=20
-	if (sscanf(buf, "%d", &rx_watermark) !=3D 1) {
-		printk(KERN_ERR "fsl-sata: wrong parameter format.\n");
+	if (kstrtouint(buf, 10, &rx_watermark) < 0) {
+		dev_err(dev, "fsl-sata: wrong parameter format.\n");
 		return -EINVAL;
 	}
=20
@@ -382,8 +380,8 @@ static ssize_t fsl_sata_rx_watermark_store(struct dev=
ice *dev,
 	temp =3D ioread32(csr_base + TRANSCFG);
 	temp &=3D 0xffffffe0;
 	iowrite32(temp | rx_watermark, csr_base + TRANSCFG);
-
 	spin_unlock_irqrestore(&host->lock, flags);
+
 	return strlen(buf);
 }
=20
--=20
2.34.1

