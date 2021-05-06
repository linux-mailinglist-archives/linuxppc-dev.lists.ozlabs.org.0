Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 96B45374CD1
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 May 2021 03:21:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FbG4s3zLrz3bvl
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 May 2021 11:21:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.a=rsa-sha256 header.s=mail181024 header.b=CJO2vyhY;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=alliedtelesis.co.nz (client-ip=202.36.163.20;
 helo=gate2.alliedtelesis.co.nz; envelope-from=chrisp@alliedtelesis.co.nz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz
 header.a=rsa-sha256 header.s=mail181024 header.b=CJO2vyhY; 
 dkim-atps=neutral
X-Greylist: delayed 589 seconds by postgrey-1.36 at boromir;
 Thu, 06 May 2021 11:20:12 AEST
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz
 [202.36.163.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FbG3J6krDz2yxl
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 May 2021 11:20:12 +1000 (AEST)
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 69F1D891B0;
 Thu,  6 May 2021 13:10:21 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
 s=mail181024; t=1620263421;
 bh=gBEcofK4p1A630R6Q3AHSfqkVuQENtsMTmONpfzCBKk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=CJO2vyhY5WhFQWa9eulWExgthvqn/SFzPyx5lj3yZZS+vH0W9rwZVD+0MWQ3tt/a+
 2H/qPPw+Bt7ITXNTU2p7DzjAVhJn+KCH9Y1IY+tuCVtOnXy5wRiiEBPDDPVmbTuzbE
 YcFjo97n4Eovkyv6OiMdXoFjc/qn/ruCRUzf9e+XHu89rzuikPfb6qeNhTneKAl+HU
 jppaQYsJ2V7IM+mqlkZFGcoY54EA1nlGofza8wRgDtu6nRN5qi4jHru5RhwVM2H5SS
 IZ/BnSG8Ub5x17Jq/KwuXbGkT//KOPzkdO1Qkd2hQB7aD70DZQxkPG0grz8ysNBCCS
 4AWpVgqB7d2hw==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by
 svr-chch-seg1.atlnz.lc with Trustwave SEG (v8, 2, 6, 11305)
 id <B609341fd0000>; Thu, 06 May 2021 13:10:21 +1200
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.20])
 by pat.atlnz.lc (Postfix) with ESMTP id 0986413ECA6;
 Thu,  6 May 2021 13:10:21 +1200 (NZST)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
 id 051E3283A60; Thu,  6 May 2021 13:10:21 +1200 (NZST)
From: Chris Packham <chris.packham@alliedtelesis.co.nz>
To: wsa@kernel.org, andriy.shevchenko@linux.intel.com,
 andy.shevchenko@gmail.com, robh+dt@kernel.org, mpe@ellerman.id.au
Subject: [PATCH 3/3] i2c: mpc: implement erratum A-004447 workaround
Date: Thu,  6 May 2021 13:10:14 +1200
Message-Id: <20210506011015.17347-4-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210506011015.17347-1-chris.packham@alliedtelesis.co.nz>
References: <20210506011015.17347-1-chris.packham@alliedtelesis.co.nz>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.3 cv=B+jHL9lM c=1 sm=1 tr=0
 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=5FLXtPjwQuUA:10 a=w4j1xu5M8ypyE8uBZIYA:9
X-SEG-SpamProfiler-Score: 0
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
Cc: devicetree@vger.kernel.org,
 Chris Packham <chris.packham@alliedtelesis.co.nz>,
 linuxppc-dev@lists.ozlabs.org, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The P2040/P2041 has an erratum where the normal i2c recovery mechanism
does not work. Implement the alternative recovery mechanism documented
in the P2040 Chip Errata Rev Q.

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---
 drivers/i2c/busses/i2c-mpc.c | 88 +++++++++++++++++++++++++++++++++++-
 1 file changed, 86 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-mpc.c b/drivers/i2c/busses/i2c-mpc.c
index 30d9e89a3db2..052e37718771 100644
--- a/drivers/i2c/busses/i2c-mpc.c
+++ b/drivers/i2c/busses/i2c-mpc.c
@@ -45,6 +45,7 @@
 #define CCR_MTX  0x10
 #define CCR_TXAK 0x08
 #define CCR_RSTA 0x04
+#define CCR_RSVD 0x02
=20
 #define CSR_MCF  0x80
 #define CSR_MAAS 0x40
@@ -97,7 +98,7 @@ struct mpc_i2c {
 	u32 block;
 	int rc;
 	int expect_rxack;
-
+	bool has_errata_A004447;
 };
=20
 struct mpc_i2c_divider {
@@ -136,6 +137,83 @@ static void mpc_i2c_fixup(struct mpc_i2c *i2c)
 	}
 }
=20
+static int i2c_mpc_wait_sr(struct mpc_i2c *i2c, int mask)
+{
+	unsigned long timeout =3D jiffies + usecs_to_jiffies(100);
+	int ret =3D 0;
+
+	while ((readb(i2c->base + MPC_I2C_SR) & mask) =3D=3D 0) {
+		if (time_after(jiffies, timeout)) {
+			ret =3D -ETIMEDOUT;
+			break;
+		}
+		cond_resched();
+	}
+
+	return ret;
+}
+
+/*
+ * Workaround for Erratum A004447. From the P2040CE Rev Q
+ *
+ * 1.  Set up the frequency divider and sampling rate.
+ * 2.  I2CCR - a0h
+ * 3.  Poll for I2CSR[MBB] to get set.
+ * 4.  If I2CSR[MAL] is set (an indication that SDA is stuck low), then =
go to
+ *     step 5. If MAL is not set, then go to step 13.
+ * 5.  I2CCR - 00h
+ * 6.  I2CCR - 22h
+ * 7.  I2CCR - a2h
+ * 8.  Poll for I2CSR[MBB] to get set.
+ * 9.  Issue read to I2CDR.
+ * 10. Poll for I2CSR[MIF] to be set.
+ * 11. I2CCR - 82h
+ * 12. Workaround complete. Skip the next steps.
+ * 13. Issue read to I2CDR.
+ * 14. Poll for I2CSR[MIF] to be set.
+ * 15. I2CCR - 80h
+ */
+static void mpc_i2c_fixup_A004447(struct mpc_i2c *i2c)
+{
+	int ret;
+	u32 val;
+
+	writeccr(i2c, CCR_MEN | CCR_MSTA);
+	ret =3D i2c_mpc_wait_sr(i2c, CSR_MBB);
+	if (ret) {
+		dev_err(i2c->dev, "timeout waiting for CSR_MBB\n");
+		return;
+	}
+
+	val =3D readb(i2c->base + MPC_I2C_SR);
+
+	if (val & CSR_MAL) {
+		writeccr(i2c, 0x00);
+		writeccr(i2c, CCR_MSTA | CCR_RSVD);
+		writeccr(i2c, CCR_MEN | CCR_MSTA | CCR_RSVD);
+		ret =3D i2c_mpc_wait_sr(i2c, CSR_MBB);
+		if (ret) {
+			dev_err(i2c->dev, "timeout waiting for CSR_MBB\n");
+			return;
+		}
+		val =3D readb(i2c->base + MPC_I2C_DR);
+		ret =3D i2c_mpc_wait_sr(i2c, CSR_MIF);
+		if (ret) {
+			dev_err(i2c->dev, "timeout waiting for CSR_MIF\n");
+			return;
+		}
+		writeccr(i2c, CCR_MEN | CCR_RSVD);
+	} else {
+		val =3D readb(i2c->base + MPC_I2C_DR);
+		ret =3D i2c_mpc_wait_sr(i2c, CSR_MIF);
+		if (ret) {
+			dev_err(i2c->dev, "timeout waiting for CSR_MIF\n");
+			return;
+		}
+		writeccr(i2c, CCR_MEN);
+	}
+}
+
 #if defined(CONFIG_PPC_MPC52xx) || defined(CONFIG_PPC_MPC512x)
 static const struct mpc_i2c_divider mpc_i2c_dividers_52xx[] =3D {
 	{20, 0x20}, {22, 0x21}, {24, 0x22}, {26, 0x23},
@@ -670,7 +748,10 @@ static int fsl_i2c_bus_recovery(struct i2c_adapter *=
adap)
 {
 	struct mpc_i2c *i2c =3D i2c_get_adapdata(adap);
=20
-	mpc_i2c_fixup(i2c);
+	if (i2c->has_errata_A004447)
+		mpc_i2c_fixup_A004447(i2c);
+	else
+		mpc_i2c_fixup(i2c);
=20
 	return 0;
 }
@@ -767,6 +848,9 @@ static int fsl_i2c_probe(struct platform_device *op)
 	}
 	dev_info(i2c->dev, "timeout %u us\n", mpc_ops.timeout * 1000000 / HZ);
=20
+	if (of_property_read_bool(op->dev.of_node, "fsl,i2c-erratum-a004447"))
+		i2c->has_errata_A004447 =3D true;
+
 	i2c->adap =3D mpc_ops;
 	scnprintf(i2c->adap.name, sizeof(i2c->adap.name),
 		  "MPC adapter (%s)", of_node_full_name(op->dev.of_node));
--=20
2.31.1

