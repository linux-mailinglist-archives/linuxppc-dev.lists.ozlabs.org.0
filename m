Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F0615EE2D
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jul 2019 23:13:54 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45fDPC5vHrzDqb9
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Jul 2019 07:13:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=nxp.com
 (client-ip=40.107.8.45; helo=eur04-vi1-obe.outbound.protection.outlook.com;
 envelope-from=roy.pledge@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nxp.com header.i=@nxp.com header.b="oV0CsNCG"; 
 dkim-atps=neutral
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80045.outbound.protection.outlook.com [40.107.8.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45fD4w3r5vzDqT6
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Jul 2019 06:59:44 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8l34xPK1ENwFo+vU3ZrImWB+9FvYzYicyTDcI7YCSPQ=;
 b=oV0CsNCG/xhovuKXgCc6V3/QJIECYTuhZ/mI3cIoDw+9hda5z0nsYswoX1zT/XSVMtavq0mV4W1JFFWiW+QkG5PRsp+fjiDrxvf4Ep6/sVPFWgr6OM1vNCpaOS6v35V7suH6rYJD+bYS5urz+UEDBk+UUhHchG2j4W9N9ztPwAI=
Received: from VE1PR04MB6463.eurprd04.prod.outlook.com (20.179.233.20) by
 VE1PR04MB6464.eurprd04.prod.outlook.com (20.179.233.21) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2032.20; Wed, 3 Jul 2019 20:59:37 +0000
Received: from VE1PR04MB6463.eurprd04.prod.outlook.com
 ([fe80::a5ca:7c9c:6b18:eb0a]) by VE1PR04MB6463.eurprd04.prod.outlook.com
 ([fe80::a5ca:7c9c:6b18:eb0a%6]) with mapi id 15.20.2032.019; Wed, 3 Jul 2019
 20:59:37 +0000
From: Roy Pledge <roy.pledge@nxp.com>
To: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, Leo Li <leoyang.li@nxp.com>
Subject: [PATCH v2 7/7] soc/fsl/qbman: Update device tree with reserved memory
Thread-Topic: [PATCH v2 7/7] soc/fsl/qbman: Update device tree with reserved
 memory
Thread-Index: AQHVMeI56zAwyfNlCka3bcuWCdBEJA==
Date: Wed, 3 Jul 2019 20:59:37 +0000
Message-ID: <1562187548-32261-8-git-send-email-roy.pledge@nxp.com>
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
x-ms-office365-filtering-correlation-id: 1974ab8d-a9dd-4a7e-6d1b-08d6fff95bf7
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VE1PR04MB6464; 
x-ms-traffictypediagnostic: VE1PR04MB6464:
x-microsoft-antispam-prvs: <VE1PR04MB646465C46DEC0A8EA8BEF97886FB0@VE1PR04MB6464.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 00872B689F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(376002)(39860400002)(346002)(366004)(136003)(189003)(199004)(14454004)(2501003)(81156014)(81166006)(4326008)(478600001)(305945005)(8676002)(2906002)(7736002)(50226002)(476003)(486006)(2616005)(446003)(25786009)(11346002)(3450700001)(86362001)(2201001)(68736007)(44832011)(36756003)(66946007)(26005)(66476007)(66556008)(64756008)(73956011)(71200400001)(71190400001)(66066001)(53936002)(6116002)(52116002)(386003)(6506007)(66446008)(8936002)(256004)(102836004)(186003)(99286004)(6486002)(5660300002)(110136005)(316002)(3846002)(6436002)(43066004)(6512007)(6636002)(76176011);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR04MB6464;
 H:VE1PR04MB6463.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: bmfwSjLg0I0SAXb5GVXJr7E4v6/Nx12AEwcS9uKBjaKuO/foqlEdfzLkt3IQUGd7Xogkp83N4N8qHZnQ9BfzRISwlQkUtTnCn44NWGf2pT8AEQoixmC+6pOLMKix45oaWNBcTsMAJIZcHDyA/lEiMrsDc6LIeS5buwgScjeThccDfMm9UNRKCak+HpnasfD/vnVLAX/6GRoCYvRoYaX7d3XSJmqNOBiLzgaxSZplZsqnf6cjxs4TpyKkxNmu88LuXLdigyjFrR0IcLnDBYlY+1zfGKGKQRINd/Z7bBlviDAoGtfNMo87qeGaNPFvlp51qGmmWzOtTSKvizarE3iTbA6Hc4ZvWjo47aJ70MJidqNsvAcvH2vpK5tbubY2eVS2NVYLfWMjrrhbaAltO5mKRcFinZFU4eHXchIk4rkSw9g=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1974ab8d-a9dd-4a7e-6d1b-08d6fff95bf7
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jul 2019 20:59:37.8153 (UTC)
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

When using the reserved memory node in the device tree there are
two options - dynamic or static. If a dynamic allocation was
selected (where the kernel selects the address for the allocation)
convert it to a static allocation by inserting the reg property.
This will ensure the same memory is reused after a kexec()

Signed-off-by: Roy Pledge <roy.pledge@nxp.com>
---
 drivers/soc/fsl/qbman/dpaa_sys.c | 60 ++++++++++++++++++++++++------------=
----
 1 file changed, 36 insertions(+), 24 deletions(-)

diff --git a/drivers/soc/fsl/qbman/dpaa_sys.c b/drivers/soc/fsl/qbman/dpaa_=
sys.c
index 3e0a7f3..9dd8bb5 100644
--- a/drivers/soc/fsl/qbman/dpaa_sys.c
+++ b/drivers/soc/fsl/qbman/dpaa_sys.c
@@ -37,41 +37,53 @@
 int qbman_init_private_mem(struct device *dev, int idx, dma_addr_t *addr,
 				size_t *size)
 {
-	int ret;
 	struct device_node *mem_node;
-	u64 size64;
 	struct reserved_mem *rmem;
+	struct property *prop;
+	int len, err;
+	__be32 *res_array;
=20
-	ret =3D of_reserved_mem_device_init_by_idx(dev, dev->of_node, idx);
-	if (ret) {
-		dev_err(dev,
-			"of_reserved_mem_device_init_by_idx(%d) failed 0x%x\n",
-			idx, ret);
-		return -ENODEV;
-	}
-	mem_node =3D of_parse_phandle(dev->of_node, "memory-region", 0);
-	if (mem_node) {
-		ret =3D of_property_read_u64(mem_node, "size", &size64);
-		if (ret) {
-			dev_err(dev, "of_address_to_resource fails 0x%x\n",
-			        ret);
-			return -ENODEV;
-		}
-		*size =3D size64;
-	} else {
+	mem_node =3D of_parse_phandle(dev->of_node, "memory-region", idx);
+	if (!mem_node) {
 		dev_err(dev, "No memory-region found for index %d\n", idx);
 		return -ENODEV;
 	}
=20
 	rmem =3D of_reserved_mem_lookup(mem_node);
+	if (!rmem) {
+		dev_err(dev, "of_reserved_mem_lookup() returned NULL\n");
+		return -ENODEV;
+	}
 	*addr =3D rmem->base;
+	*size =3D rmem->size;
=20
 	/*
-	 * Disassociate the reserved memory area from the device
-	 * because a device can only have one DMA memory area. This
-	 * should be fine since the memory is allocated and initialized
-	 * and only ever accessed by the QBMan device from now on
+	 * Check if the reg property exists - if not insert the node
+	 * so upon kexec() the same memory region address will be preserved.
+	 * This is needed because QBMan HW does not allow the base address/
+	 * size to be modified once set.
 	 */
-	of_reserved_mem_device_release(dev);
+	prop =3D of_find_property(mem_node, "reg", &len);
+	if (!prop) {
+		prop =3D devm_kzalloc(dev, sizeof(*prop), GFP_KERNEL);
+		if (!prop)
+			return -ENOMEM;
+		prop->value =3D res_array =3D devm_kzalloc(dev, sizeof(__be32) * 4,
+						       GFP_KERNEL);
+		if (!prop->value)
+			return -ENOMEM;
+		res_array[0] =3D cpu_to_be32(upper_32_bits(*addr));
+		res_array[1] =3D cpu_to_be32(lower_32_bits(*addr));
+		res_array[2] =3D cpu_to_be32(upper_32_bits(*size));
+		res_array[3] =3D cpu_to_be32(lower_32_bits(*size));
+		prop->length =3D sizeof(__be32) * 4;
+		prop->name =3D devm_kstrdup(dev, "reg", GFP_KERNEL);
+		if (!prop->name)
+			return -ENOMEM;
+		err =3D of_add_property(mem_node, prop);
+		if (err)
+			return err;
+	}
+
 	return 0;
 }
--=20
2.7.4

