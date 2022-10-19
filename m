Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D4D6060514B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Oct 2022 22:28:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mt2PF4gBZz3drc
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Oct 2022 07:28:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=ODjIs5U5;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com (client-ip=40.107.8.89; helo=eur04-vi1-obe.outbound.protection.outlook.com; envelope-from=roy.zang@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=ODjIs5U5;
	dkim-atps=neutral
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-eopbgr80089.outbound.protection.outlook.com [40.107.8.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mt2NJ0P5tz3br0
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Oct 2022 07:27:41 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aMlgZuWAInP1eYszaPNznXuwq3PdzS+TWKXS3SutU+9SDxAW1ABD1ojdvrqErLEYZCkCxpnNd6pIlJkd5xekIVmRNGFrD5vG3qX1deNfRbRXh3cYuP+2IaTjXsS3H/vPf9us1LCCxunu8Dq26kvE04+JKuNDRA91u5hxy4tfNMzOO8JXHx5ByxCoJcGTOG1XYtN6/m1Pa7MSlZV0eA5AOTqZwVwrjerdlDrYfWbQ8SZg+gDBhwssdiTyfr07c0aPOKnYA37zSGihGvnlI9BnaPQQ0nDqzt3s8+FwYXHFTisHHIIgklPLUHlfcHvtHpKTjrc8XnkHXRqqVzbOkTz1tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z/0GShhTzRFbp7hApO03BA3OE11D8F29EATFdo8N9Q0=;
 b=dCndPOUlCIaW5nw8/zLcFqGcBcDO9cP9nr2P3u0Y+3P+1k1bYlSYJ/J1W7JnYyP0mSshYCfU9G2wdgI0yHY7xjntf7f9J3+/Z8V89hlxZmG1mC92i8egfiZaJerTdcMyfQcmZyd0xnvDsoOdy+b1hovJdcN+iF/K7gju3s9HYM8O+GZC/thjV4jFBtQkpXyEFXg+nxmNTs8aJjg2GmaNoTOdPGXqmwV5gio45BM9UjdC9iE6JWxwyiPQFeHOfZ9TNYQwdNtzSgvPgSMDaOaGpy1+DwOy7HTAyshleuxzrcA0jv7cBjavU119m6gzgPc6aNZoSJICUCA0QJGqgzcEsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z/0GShhTzRFbp7hApO03BA3OE11D8F29EATFdo8N9Q0=;
 b=ODjIs5U5xsQGZc3FbLiyz7LXRSPm9IqzXlZV8liJbixD7PKbf+mK1/C/Y6kAE5mKhVj8U/WbprWfoe9aj+Y9e+OB8bXwJX1llv34i5FI1muZZzL0J4timR/DCUgaMKKAJr+wqXrLWlgoopLqbbM2RI7tNsqTuHbnlxpqKoOLYW8=
Received: from VI1PR04MB5967.eurprd04.prod.outlook.com (2603:10a6:803:cc::27)
 by AS8PR04MB7878.eurprd04.prod.outlook.com (2603:10a6:20b:2af::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.26; Wed, 19 Oct
 2022 20:27:22 +0000
Received: from VI1PR04MB5967.eurprd04.prod.outlook.com
 ([fe80::dc5:6898:8bbe:6c96]) by VI1PR04MB5967.eurprd04.prod.outlook.com
 ([fe80::dc5:6898:8bbe:6c96%7]) with mapi id 15.20.5723.034; Wed, 19 Oct 2022
 20:27:22 +0000
From: Roy Zang <roy.zang@nxp.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Lorenzo Pieralisi
	<lpieralisi@kernel.org>
Subject: RE: [PATCH] PCI: Remove unnecessary of_irq.h includes
Thread-Topic: [PATCH] PCI: Remove unnecessary of_irq.h includes
Thread-Index: AQHY4/SvM0jo3Ln+e0ejWxU6QJYCNK4WKf5g
Date: Wed, 19 Oct 2022 20:27:21 +0000
Message-ID:  <VI1PR04MB5967D09FD70531A221F1BAF48B2B9@VI1PR04MB5967.eurprd04.prod.outlook.com>
References: <20221019195452.37606-1-helgaas@kernel.org>
In-Reply-To: <20221019195452.37606-1-helgaas@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR04MB5967:EE_|AS8PR04MB7878:EE_
x-ms-office365-filtering-correlation-id: 7cec4a4c-29b1-4e0b-5d9f-08dab21053b2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  M3LTZcwiMCgrALPtNwoJ5ZCIGnQLs+Y9sfvrg9dDfmhIQVJ27eE/Lm7Swie2ug4PgpPoUW3C4Ry+BVzIZadxCqo037sHcQzGEWl+bJTrr7xu+3XnitO5IMsoeEZZdG+IDvZCCh/pyMgysU4xAsP/+hKlIswATnhBsCO5hb6SO3A60gfwnLUKgX0pZ33TesV90W1NEZxsIDxSoJd7Q2mGmSm37++y/fXxKxAtUMoZgxCTBeJ83sGBL8zVS904rdPfv9CioowfAvb+f1w7AjDsZLuj+eJ69fKH/wb9UkFTV4IZW8cjm/lddVb4a+dRhq3SkOSy20Pp+NO+CUTx0qtKhimpTb2otuvAmBQla3ByY0FAT9m7QWQSCD7qZfErshfN1MBf0umEIzbodsj5Iw/7Q6vqtjiIsVoMbx+BfEmAxwHSWipNYfvdpt95++VpE5TiuBlZg3Ed5oxyYnbJ368eOUrYkn5tq/F8QO+Hiac3jhuf5JBLqQlDlRPAYjqAr2PRJiQEfidr4PN7zsP42eXw1VDziIvfwbZKypX4OH05DHOLtype8Omlp+cyaGZgMZpyjZTTSdvD+9m3Y4pVbF+cD95hHAU93rxNtpGulKERNIqGdP737MQxBZbRPToXsucrFVcQ4oWZ+lpRf1fN7mJByGI+gogjH76S7U5BxD9EAAwACN1LCF0VfnMLapVZ5m+uQLZ8z03FvaSKhnMUadwQ9jNY0mIk5SJtMeWSJufId2sUNIyZxGyrTAuR7C/S4KHI+tiYRV7MweLFkDlzwb760Q==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5967.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(396003)(136003)(346002)(366004)(376002)(451199015)(33656002)(7416002)(86362001)(44832011)(122000001)(2906002)(4744005)(5660300002)(38100700002)(7406005)(71200400001)(54906003)(186003)(83380400001)(38070700005)(316002)(7696005)(66946007)(66556008)(66476007)(478600001)(9686003)(6506007)(8676002)(26005)(66446008)(76116006)(110136005)(55016003)(4326008)(52536014)(55236004)(8936002)(41300700001)(64756008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?iso-8859-2?Q?QwU2HjGWpIbdL9ehOIwHWbxbGXDlaXnjTTg6ziq7KvthBo8s9n/fvmW9xo?=
 =?iso-8859-2?Q?oAijN9ydD1JLqXwbQeYYqmEKYNgJzrLO7wJu57bGpuk5XvOer5YLMl5sUF?=
 =?iso-8859-2?Q?Ey0fojX5AfLFP+ZxxZCGLDvnoMZg9YkbJHqGiVmS6VSSFxy6XpkJ4f8y+c?=
 =?iso-8859-2?Q?mAkNqGnjD/LgBa7ehZdr3jNybLqVamVUrniXwDVizThoFD3u1m3oFM/pJY?=
 =?iso-8859-2?Q?woGZX3zww08EQK/hzXLE0FKgAc3lFumQ6niS+qzKDnGLorKRq8btC8G5gw?=
 =?iso-8859-2?Q?hVE5p/UFYHbz9u7Rw5TuTF5+QkdDyepbJ8I3jmGu04Ete9Pq6ERegpNVh1?=
 =?iso-8859-2?Q?vjC4oiq9vz9ByQd1yhB7ehgjyiSBVhqsEomlBZp2GDaTI5gHnOPAIXOxv/?=
 =?iso-8859-2?Q?SmTvdRl2GQ6MDP43ZoDSqdtYmvpVLKXCpT8tcExBpE1Mt019JfRZ3wkJE9?=
 =?iso-8859-2?Q?z3+Hs+Xmqf9dWaSa8jt2ttfUZ7gLeBge7FblNltfEmTGMIN1iNrEL2NQ4r?=
 =?iso-8859-2?Q?pKNQP6CymSh7AX5JjH3fJGByDLtnvYjapwdVA6MiwqyW9Y/8VztzRphe/q?=
 =?iso-8859-2?Q?d/Cl/cF3OzdGn342JzrjhtzE6Igtn4UZtGkPIopKlkg5PW96AB6ZWvgF1Q?=
 =?iso-8859-2?Q?xt5Rt52liLdKHUb7pYyyJJ7YB6/fRXTwJva6js0z4JW2OdbasXZkYW/uSh?=
 =?iso-8859-2?Q?wUa3l7mseCPQwdS7z5IOH9QoBBVWBIJv4E/Qry9Wd1B7va+o/wBynjNro+?=
 =?iso-8859-2?Q?DgOraOH1vEbq/NoH644CgrevZ2OOxcZfk8sw0Om3YqueH4EyX6wO/Nhap3?=
 =?iso-8859-2?Q?thV1MZHsv/ZpRQqcV8z1lvczxckmy6zVNK8f4Pj9AE25u8eTbi9QIMCLND?=
 =?iso-8859-2?Q?Cg7gVWCDSE5rPhI871H5w1enbofGimakMAnvQ4O7BPdSfM+gWgPURI6TNb?=
 =?iso-8859-2?Q?2xe2eoX90vWtjPBsut+HgeAuoLxAQRcQQR4IeAhIEiC8VXnQDWp0BTY5Gn?=
 =?iso-8859-2?Q?ICK9SGRcptdt9sIPePHF7R7bf6N8zxvmZWIl0UNLGw06gcqQcW6LTdtXNH?=
 =?iso-8859-2?Q?SaOQEviOMCiTIwmF3ZEdXj4/GgPe1tYNDJvA0tCPAmiZpnTVJru+QDJOxb?=
 =?iso-8859-2?Q?9Lh/G4xz+9Goqg/uD+/0PQI5MlmSZfk8XiSX+I3LjqA53FWhV7KP0N2D2D?=
 =?iso-8859-2?Q?3XKYegiLExinIGSjR7dFhRWjmCRYAvh88M5nEq/KW9BmY664wqSew6RoDu?=
 =?iso-8859-2?Q?2NLA5JyV+j3XH4MWoIQzLLQh3wJysTzjlfnEdkcjZXU7FHB+Odcc/2WRH0?=
 =?iso-8859-2?Q?yfBSf2JfgeD3S9HnXRJydIcdWVKt/FucFvna0NFMtyvg+PiZS4cWb164Bz?=
 =?iso-8859-2?Q?ymqbpDkUGeYnqbGlaTOm331Lj45sMirerdH9ihX7WV9rNOXRfBxkzpN57B?=
 =?iso-8859-2?Q?/AMDQJXc/48YGossX+xDwLkcIKXCpPsfvjWlSfrSL05P8S7EVQUtumUzYR?=
 =?iso-8859-2?Q?pHf2GAkkXw6N9/fYzma6muSb7ppYAfNxVl+1DbPZEhdkI6X1L3/5blwYDq?=
 =?iso-8859-2?Q?Gx6ZxzThCR7fcYsFX9P54OwDUlWfebkC+5FUetfZwaUcnLgj89FcD/TNeY?=
 =?iso-8859-2?Q?Fy9myxH9jrHzzj1e2uxyx4u39Wm3EGrVfC?=
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5967.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7cec4a4c-29b1-4e0b-5d9f-08dab21053b2
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Oct 2022 20:27:21.9453
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EqKTVUT6wYTagIaCgGfEu2KS4vbvdS7FMmJx0UetgNcogEPqw4PdSYj5XKWLOHNtqbpox8/kZqu1XdNEVRhKog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7878
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
Cc: =?iso-8859-2?Q?Krzysztof_Wilczy=F1ski?= <kw@linux.com>, Heiko Stuebner <heiko@sntech.de>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, "M.H. Lian" <minghuan.lian@nxp.com>, Conor Dooley <conor.dooley@microchip.com>, Thierry Reding <thierry.reding@gmail.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Bharat Kumar Gogada <bharat.kumar.gogada@amd.com>, Toan Le <toan@os.amperecomputing.com>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, Joyce Ooi <joyce.ooi@intel.com>, Jonathan Hunter <jonathanh@nvidia.com>, "linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>, "bcm-kernel-feedback-list@broadcom.com" <bcm-kernel-feedback-list@broadcom.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Shawn Lin <shawn.lin@rock-chips.com>, Ray Jui <rjui@broadcom.com>, "linux-tegra@vger.kernel
 .org" <linux-tegra@vger.kernel.org>, "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>, Michal Simek <michal.simek@amd.com>, Mingkai Hu <mingkai.hu@nxp.com>, Bjorn Helgaas <bhelgaas@google.com>, Scott Branden <sbranden@broadcom.com>, Daire McNamara <daire.mcnamara@microchip.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Tom Joseph <tjoseph@cadence.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


> -----Original Message-----
> From: Bjorn Helgaas <helgaas@kernel.org>
>=20
> From: Bjorn Helgaas <bhelgaas@google.com>
>=20
> Many host controller drivers #include <linux/of_irq.h> even though they
> don't need it.  Remove the unnecessary #includes.
>=20
> Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
> ---
>  drivers/pci/controller/cadence/pci-j721e.c   | 1 -
>  drivers/pci/controller/dwc/pci-layerscape.c  | 1 -
>  drivers/pci/controller/dwc/pcie-armada8k.c   | 1 -
>  drivers/pci/controller/dwc/pcie-tegra194.c   | 1 -
>  drivers/pci/controller/pci-v3-semi.c         | 1 -
>  drivers/pci/controller/pci-xgene-msi.c       | 1 -
>  drivers/pci/controller/pci-xgene.c           | 1 -
>  drivers/pci/controller/pcie-altera-msi.c     | 1 -
>  drivers/pci/controller/pcie-iproc-platform.c | 1 -
>  drivers/pci/controller/pcie-iproc.c          | 1 -
>  drivers/pci/controller/pcie-microchip-host.c | 1 -  drivers/pci/controll=
er/pcie-
> rockchip-host.c  | 1 -
>  drivers/pci/controller/pcie-xilinx-cpm.c     | 1 -
>  drivers/pci/controller/pcie-xilinx-nwl.c     | 1 -
>  14 files changed, 14 deletions(-)

Acked-by: Roy Zang <roy.zang@nxp.com>
Roy
