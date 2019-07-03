Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B86CD5EE12
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jul 2019 23:05:18 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45fDCJ1p4ZzDqCh
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Jul 2019 07:05:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=nxp.com
 (client-ip=40.107.8.45; helo=eur04-vi1-obe.outbound.protection.outlook.com;
 envelope-from=roy.pledge@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nxp.com header.i=@nxp.com header.b="pij2suAo"; 
 dkim-atps=neutral
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80045.outbound.protection.outlook.com [40.107.8.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45fD4q02txzDqQc
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Jul 2019 06:59:38 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4XzH04VyMkU/5vIBzhhhxcuTfHUI0O8GFlI+grC5liA=;
 b=pij2suAomTXo9a2Fpv/kWne/ughN1BbYIMcOOgiitqCaJ69u/rUBXH0xeasMYgQrG4Qj45ugY2aKo/oCxH2l3ZjzRtSWsdn7JwNdxUhzTGkmTvai6n8bNR+3V5rKA9HsRDuy9NYThiOW3Z+UAUKwNUUieyQcH6yyCYGLFRW6tl0=
Received: from VE1PR04MB6463.eurprd04.prod.outlook.com (20.179.233.20) by
 VE1PR04MB6464.eurprd04.prod.outlook.com (20.179.233.21) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2032.20; Wed, 3 Jul 2019 20:59:26 +0000
Received: from VE1PR04MB6463.eurprd04.prod.outlook.com
 ([fe80::a5ca:7c9c:6b18:eb0a]) by VE1PR04MB6463.eurprd04.prod.outlook.com
 ([fe80::a5ca:7c9c:6b18:eb0a%6]) with mapi id 15.20.2032.019; Wed, 3 Jul 2019
 20:59:26 +0000
From: Roy Pledge <roy.pledge@nxp.com>
To: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, Leo Li <leoyang.li@nxp.com>
Subject: [PATCH v2 1/7] soc/fsl/qbman: Rework QBMan private memory setup
Thread-Topic: [PATCH v2 1/7] soc/fsl/qbman: Rework QBMan private memory setup
Thread-Index: AQHVMeIzPLFPuVfPjE2P/r3d1RtleA==
Date: Wed, 3 Jul 2019 20:59:26 +0000
Message-ID: <1562187548-32261-2-git-send-email-roy.pledge@nxp.com>
References: <1562187548-32261-1-git-send-email-roy.pledge@nxp.com>
In-Reply-To: <1562187548-32261-1-git-send-email-roy.pledge@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.7.4
x-clientproxiedby: SN6PR15CA0005.namprd15.prod.outlook.com
 (2603:10b6:805:16::18) To VE1PR04MB6463.eurprd04.prod.outlook.com
 (2603:10a6:803:11d::20)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=roy.pledge@nxp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [72.142.119.78]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1b0a1e33-fb2f-401a-68fe-08d6fff95517
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VE1PR04MB6464; 
x-ms-traffictypediagnostic: VE1PR04MB6464:
x-microsoft-antispam-prvs: <VE1PR04MB64646761413A117D8564C2F386FB0@VE1PR04MB6464.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 00872B689F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(376002)(39860400002)(346002)(366004)(136003)(189003)(199004)(14454004)(2501003)(81156014)(81166006)(4326008)(478600001)(305945005)(8676002)(14444005)(2906002)(7736002)(50226002)(476003)(486006)(2616005)(446003)(25786009)(11346002)(3450700001)(86362001)(2201001)(68736007)(44832011)(36756003)(66946007)(26005)(66476007)(66556008)(64756008)(73956011)(71200400001)(71190400001)(66066001)(53936002)(6116002)(52116002)(386003)(6506007)(66446008)(8936002)(256004)(102836004)(186003)(99286004)(6486002)(5660300002)(110136005)(316002)(3846002)(6436002)(43066004)(6512007)(6636002)(76176011);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR04MB6464;
 H:VE1PR04MB6463.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: M7QeasEi1Z5CR75593E19ofn71mq7Rj630ZW35mXGxgToMfkJtW7C4T7kbNV2ZQzOcbUnyKaoZl13lj/87U4mP0MZG8EGGEvCt9Eh49ppKdO1uQohvH4MeJrIlLh+yRgp6X/Ud9OD5jZR7dUiaaeBHazaOwZHNBh3HzrB+D17IiZgyxIWOuz45YiF9qVRyrMegBJFtKlyRhRl/VDHL+JDvzBeXkopoiKNhfT607kOEUGcU2L+SlLkKrABbojwK+oyPkVcUBNM7xnlRQ0LQOrDo6U0MQ4etpU1D0phbBNHckGrg9zHs7ehYC4j7XluMX9QJsTSRB74Curv0kt8O4eOksIh7TyskTyOf2Q9VUlY1wXDbAhOc+SNZnI20XpMMjqz1bj16+cQwJ2LasNz2TbKtY3PyuAETdQrZcc0Lxbue4=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b0a1e33-fb2f-401a-68fe-08d6fff95517
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jul 2019 20:59:26.6926 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: roy.pledge@nxp.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6464
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
Reply-To: Roy Pledge <roy.pledge@nxp.com>
Cc: Roy Pledge <roy.pledge@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Rework QBMan private memory setup so that the areas are not
zeroed if the device was previously initialized

If the QMan private memory was already initialized skip the PFDR
initialization.

Signed-off-by: Roy Pledge <roy.pledge@nxp.com>
---
 drivers/soc/fsl/qbman/bman_ccsr.c | 26 ++++++++++++++++++++--
 drivers/soc/fsl/qbman/dpaa_sys.c  |  7 +++---
 drivers/soc/fsl/qbman/qman_ccsr.c | 45 ++++++++++++++++++++++++++++++++++-=
----
 3 files changed, 67 insertions(+), 11 deletions(-)

diff --git a/drivers/soc/fsl/qbman/bman_ccsr.c b/drivers/soc/fsl/qbman/bman=
_ccsr.c
index 7c3cc96..dc6d7e5 100644
--- a/drivers/soc/fsl/qbman/bman_ccsr.c
+++ b/drivers/soc/fsl/qbman/bman_ccsr.c
@@ -97,17 +97,40 @@ static void bm_get_version(u16 *id, u8 *major, u8 *mino=
r)
 /* signal transactions for FBPRs with higher priority */
 #define FBPR_AR_RPRIO_HI BIT(30)
=20
-static void bm_set_memory(u64 ba, u32 size)
+/* Track if probe has occurred and if cleanup is required */
+static int __bman_probed;
+static int __bman_requires_cleanup;
+
+
+static int bm_set_memory(u64 ba, u32 size)
 {
+	u32 bar, bare;
 	u32 exp =3D ilog2(size);
 	/* choke if size isn't within range */
 	DPAA_ASSERT(size >=3D 4096 && size <=3D 1024*1024*1024 &&
 		   is_power_of_2(size));
 	/* choke if '[e]ba' has lower-alignment than 'size' */
 	DPAA_ASSERT(!(ba & (size - 1)));
+
+	/* Check to see if BMan has already been initialized */
+	bar =3D bm_ccsr_in(REG_FBPR_BAR);
+	if (bar) {
+		/* Maker sure ba =3D=3D what was programmed) */
+		bare =3D bm_ccsr_in(REG_FBPR_BARE);
+		if (bare !=3D upper_32_bits(ba) || bar !=3D lower_32_bits(ba)) {
+			pr_err("Attempted to reinitialize BMan with different BAR, got 0x%llx r=
ead BARE=3D0x%x BAR=3D0x%x\n",
+			       ba, bare, bar);
+			return -ENOMEM;
+		}
+		pr_info("BMan BAR already configured\n");
+		__bman_requires_cleanup =3D 1;
+		return 1;
+	}
+
 	bm_ccsr_out(REG_FBPR_BARE, upper_32_bits(ba));
 	bm_ccsr_out(REG_FBPR_BAR, lower_32_bits(ba));
 	bm_ccsr_out(REG_FBPR_AR, exp - 1);
+	return 0;
 }
=20
 /*
@@ -120,7 +143,6 @@ static void bm_set_memory(u64 ba, u32 size)
  */
 static dma_addr_t fbpr_a;
 static size_t fbpr_sz;
-static int __bman_probed;
=20
 static int bman_fbpr(struct reserved_mem *rmem)
 {
diff --git a/drivers/soc/fsl/qbman/dpaa_sys.c b/drivers/soc/fsl/qbman/dpaa_=
sys.c
index e6d48dc..3e0a7f3 100644
--- a/drivers/soc/fsl/qbman/dpaa_sys.c
+++ b/drivers/soc/fsl/qbman/dpaa_sys.c
@@ -40,6 +40,7 @@ int qbman_init_private_mem(struct device *dev, int idx, d=
ma_addr_t *addr,
 	int ret;
 	struct device_node *mem_node;
 	u64 size64;
+	struct reserved_mem *rmem;
=20
 	ret =3D of_reserved_mem_device_init_by_idx(dev, dev->of_node, idx);
 	if (ret) {
@@ -62,10 +63,8 @@ int qbman_init_private_mem(struct device *dev, int idx, =
dma_addr_t *addr,
 		return -ENODEV;
 	}
=20
-	if (!dma_alloc_coherent(dev, *size, addr, 0)) {
-		dev_err(dev, "DMA Alloc memory failed\n");
-		return -ENODEV;
-	}
+	rmem =3D of_reserved_mem_lookup(mem_node);
+	*addr =3D rmem->base;
=20
 	/*
 	 * Disassociate the reserved memory area from the device
diff --git a/drivers/soc/fsl/qbman/qman_ccsr.c b/drivers/soc/fsl/qbman/qman=
_ccsr.c
index a6bb430..39f6fc1 100644
--- a/drivers/soc/fsl/qbman/qman_ccsr.c
+++ b/drivers/soc/fsl/qbman/qman_ccsr.c
@@ -274,6 +274,7 @@ static u32 __iomem *qm_ccsr_start;
 /* A SDQCR mask comprising all the available/visible pool channels */
 static u32 qm_pools_sdqcr;
 static int __qman_probed;
+static int  __qman_requires_cleanup;
=20
 static inline u32 qm_ccsr_in(u32 offset)
 {
@@ -340,19 +341,46 @@ static void qm_get_version(u16 *id, u8 *major, u8 *mi=
nor)
 }
=20
 #define PFDR_AR_EN		BIT(31)
-static void qm_set_memory(enum qm_memory memory, u64 ba, u32 size)
+static int qm_set_memory(enum qm_memory memory, u64 ba, u32 size)
 {
+	void *ptr;
 	u32 offset =3D (memory =3D=3D qm_memory_fqd) ? REG_FQD_BARE : REG_PFDR_BA=
RE;
 	u32 exp =3D ilog2(size);
+	u32 bar, bare;
=20
 	/* choke if size isn't within range */
 	DPAA_ASSERT((size >=3D 4096) && (size <=3D 1024*1024*1024) &&
 		    is_power_of_2(size));
 	/* choke if 'ba' has lower-alignment than 'size' */
 	DPAA_ASSERT(!(ba & (size - 1)));
+
+	/* Check to see if QMan has already been initialized */
+	bar =3D qm_ccsr_in(offset + REG_offset_BAR);
+	if (bar) {
+		/* Maker sure ba =3D=3D what was programmed) */
+		bare =3D qm_ccsr_in(offset);
+		if (bare !=3D upper_32_bits(ba) || bar !=3D lower_32_bits(ba)) {
+			pr_err("Attempted to reinitialize QMan with different BAR, got 0x%llx r=
ead BARE=3D0x%x BAR=3D0x%x\n",
+			       ba, bare, bar);
+			return -ENOMEM;
+		}
+		__qman_requires_cleanup =3D 1;
+		/* Return 1 to indicate memory was previously programmed */
+		return 1;
+	}
+	/* Need to temporarily map the area to make sure it is zeroed */
+	ptr =3D memremap(ba, size, MEMREMAP_WB);
+	if (!ptr) {
+		pr_crit("memremap() of QMan private memory failed\n");
+		return -ENOMEM;
+	}
+	memset(ptr, 0, size);
+	memunmap(ptr);
+
 	qm_ccsr_out(offset, upper_32_bits(ba));
 	qm_ccsr_out(offset + REG_offset_BAR, lower_32_bits(ba));
 	qm_ccsr_out(offset + REG_offset_AR, PFDR_AR_EN | (exp - 1));
+	return 0;
 }
=20
 static void qm_set_pfdr_threshold(u32 th, u8 k)
@@ -571,12 +599,19 @@ static int qman_init_ccsr(struct device *dev)
 	int i, err;
=20
 	/* FQD memory */
-	qm_set_memory(qm_memory_fqd, fqd_a, fqd_sz);
+	err =3D qm_set_memory(qm_memory_fqd, fqd_a, fqd_sz);
+	if (err < 0)
+		return err;
 	/* PFDR memory */
-	qm_set_memory(qm_memory_pfdr, pfdr_a, pfdr_sz);
-	err =3D qm_init_pfdr(dev, 8, pfdr_sz / 64 - 8);
-	if (err)
+	err =3D qm_set_memory(qm_memory_pfdr, pfdr_a, pfdr_sz);
+	if (err < 0)
 		return err;
+	/* Only initialize PFDRs if the QMan was not initialized before */
+	if (err =3D=3D 0) {
+		err =3D qm_init_pfdr(dev, 8, pfdr_sz / 64 - 8);
+		if (err)
+			return err;
+	}
 	/* thresholds */
 	qm_set_pfdr_threshold(512, 64);
 	qm_set_sfdr_threshold(128);
--=20
2.7.4

