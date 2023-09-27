Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 90F127B0558
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Sep 2023 15:27:00 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=Jq6fL9Va;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RwcpV3STVz3cCT
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Sep 2023 23:26:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=Jq6fL9Va;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f400:fe0d::624; helo=eur04-he1-obe.outbound.protection.outlook.com; envelope-from=roy.zang@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-he1eur04on0624.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe0d::624])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rwcnb11trz30MQ
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Sep 2023 23:26:08 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l9UN8+cW5bRCRCoNY0dz9aWwLmC6PPPTyPStZnA59VFt6q4gaz0q8lD4R8EFyJHEjyA7hT85lnKvxYCGfanva0t35WGVMyetJ9lyyL4Ggm71FsK0j5DZNIZGwlgkVa1EZMrrzDvpn5I/GX2hNSRhjFuISFObpWj7r6FQ5KEvWUpH4hAK0sdsnv5sB/5BVcMquSvcPiJymElDf/TLti71jk6wpwN6bsF7tnmbnyKUkHwHkwTUy2OWh3zOxTy0Q0xDU40nnvPuvQ2nGlJlvbaz9zz5d05GJgJTsQxcviq1zBfe3ohSc6X66lQ44tz6Axkcx8TK5qSgjL8YO1lMtwhxrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e7nRVFgQq5yVaVKmfQgl2sHM/yMIi2WtoLerzCAcfZU=;
 b=Yr2GbLYDW0bUUadLTd0mf5uGdK1z+2hR0LPk8OVcOoatKk/Ruf8nMTU8RgNPBptHFz2EwB8G1lmv9jOclvsJSaEEt6f67LslKQSIJsr4w/2h0ib4gLv9eF+qxKeBzznJSv1GGB7abVnWbEsTsTMF6u8OnU3gxdhQVxyczbZxWadzIT1/v28Q3DxmF1kfUmAaCZ4VhAH4rGCFBxVXdNK+H2Mf0IMmYwnF7BeQLJo3gOyOUv906GWMdc50F+OCK3gqSQVlLNT9n/6lkzaO8OP2oY3+4jICL5PvAiY3RgVLHRxIaAHpm5AIqpx3lKmwpTrrZE536Pi+ayIygifWgvDGKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e7nRVFgQq5yVaVKmfQgl2sHM/yMIi2WtoLerzCAcfZU=;
 b=Jq6fL9VaqBD8+jvXAtsLH2XJwekvy4eYChDQiuF2oIJ7sW+8pRzHhoNe9SDlq1Z8zKezuWTMVvMMKqqXgs9yZH9d2+4RspY1diiSgbeg3gEWR4ruvBG7CFsJwEnEVhtRrQ16utvPenWnc8QHMt734ZrfqL1KdVNLL/B/r5cDix0=
Received: from VI1PR04MB5967.eurprd04.prod.outlook.com (2603:10a6:803:cc::27)
 by DU2PR04MB8869.eurprd04.prod.outlook.com (2603:10a6:10:2e0::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Wed, 27 Sep
 2023 13:25:48 +0000
Received: from VI1PR04MB5967.eurprd04.prod.outlook.com
 ([fe80::c863:fc11:de43:4e0a]) by VI1PR04MB5967.eurprd04.prod.outlook.com
 ([fe80::c863:fc11:de43:4e0a%3]) with mapi id 15.20.6813.027; Wed, 27 Sep 2023
 13:25:48 +0000
From: Roy Zang <roy.zang@nxp.com>
To: Frank Li <frank.li@nxp.com>, "hch@infradead.org" <hch@infradead.org>
Subject: RE: [PATCH v3 1/1] PCI: layerscape-ep: set 64-bit DMA mask
Thread-Topic: [PATCH v3 1/1] PCI: layerscape-ep: set 64-bit DMA mask
Thread-Index: AQHZ8IJxif3O1XpeLUCSGuMJWyHCXbAuqr3A
Date: Wed, 27 Sep 2023 13:25:47 +0000
Message-ID:  <VI1PR04MB5967E43A9EF62DCDD939552C8BC2A@VI1PR04MB5967.eurprd04.prod.outlook.com>
References: <20230926140445.3855365-1-Frank.Li@nxp.com>
In-Reply-To: <20230926140445.3855365-1-Frank.Li@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR04MB5967:EE_|DU2PR04MB8869:EE_
x-ms-office365-filtering-correlation-id: 62b45402-dbd8-4ef8-db76-08dbbf5d42fa
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  P5OLILx6cKo8d6NbyYVazMW9ORGHSyiK32q9mA/aFFLBmMTct+HHSzZUUOvBXOA8hEkR2RvzaDn5mzej0WU9eSJAMelMQPU1bSJ7Pc73SR4ywwgHWzM0Ir+GT1M1ea/UkmyX9iPIuAgy0BxgjiXrXKCqxx4/ip4YoIjf679zVXd5H+1mq/bCHxoSUEQlFK6WhWDyfSANKF1PA9JHWIOneJALhfea3ivBJB8+mPsced1YjGzayeJFgbYtw95QXyejRbO7YPdM0+mr7oSwFV4aJbU+cUdfCwU2Lru5H4cpKSdn1OZWC7WyiemckynFhLaeszUDDSLf7YT5DsG7FsjWCY7vIychJoa0gHlk4eVCwaKFdLOlV5Jd+pqEjgxF0KXK0uha1YoTSWMl0+REUnx1XHEvE73MV9F2r9f9hD5YgDOppqC3SzmI8pXVoTsSFb6uVxAm1zHOtcK32yTju3vl9pEz2PAXxnN/eJnlr+FSBR8YcNopOTajohPV1Jn4dpKDi3Unig6OaWqzBt5fUo/cHQgF4OoFCME4G14CZXuv0FyBQULFrTQKVCF9Bfu+fwGnpiC86c1+HkoOFah03UgV41lYM5+P9Y12uxH4fW/YZsdbR5QnaifWr18cCJKH39hL
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5967.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(366004)(136003)(396003)(376002)(39860400002)(230922051799003)(1800799009)(451199024)(186009)(55236004)(7696005)(6506007)(9686003)(66446008)(83380400001)(26005)(478600001)(8936002)(2906002)(7416002)(76116006)(4326008)(66476007)(66556008)(66946007)(110136005)(64756008)(316002)(41300700001)(52536014)(44832011)(5660300002)(54906003)(8676002)(122000001)(33656002)(55016003)(38070700005)(38100700002)(86362001)(71200400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?us-ascii?Q?t4lFcQIIv+JX08fr8Ln0M0HrNLKkCsc1lKRivMBiZSt/BjbTAocqvx9BgAgQ?=
 =?us-ascii?Q?qunMmv3WrmH+Pm32YVKOWXjtPcFPRPETMx+T3l6QX1jttD7UReZLeyN43ZBy?=
 =?us-ascii?Q?gRK3dQnLpqnAWYuVvqIgYtvPdt1gw5Q3QPM+NL4jxC/N6Jv5DeGNYc4ScaJ2?=
 =?us-ascii?Q?C9Me3K+W1KKODmXWSkogZI+SqnClHeYrCjM/XYnhWrv0TahDT08iv9O8t8N9?=
 =?us-ascii?Q?s0nVw1Yc0AGZCLqoyMFhtzvw+C9qkMKD2htmmo3dKHHHeSOq3cYZRGqaEO6J?=
 =?us-ascii?Q?BCVk6hxpX0C0oSE1ABg82DqV4WjIIVyxFbqu1YRNyproFqLvYcJTAGDTWqAp?=
 =?us-ascii?Q?I2UbQhmFZCAT7I8mHp1wqFM1A9fEFO+NKMiIIZM73lmq6XY/2Sj7pThNz4VM?=
 =?us-ascii?Q?7hS+Y1bfLkr+XQlcdH83ffNgFhkDvreOK72cU1hG9uh699hKXLXqD+AONHtC?=
 =?us-ascii?Q?PhEnnn/rt2hmiM9ZyMVSUi/q+QFLXzCWF87j4gEMRxLDwk3EwY+au8PH1mEW?=
 =?us-ascii?Q?K32tdIFKYcW+oYXeG7B3lE/ijLBZjK08d5XpFLo9r+kzBxMOy29yHi58TK+V?=
 =?us-ascii?Q?yTUDXRCiRmqngO4Fgo4ZK9EN1wJawqq3QBodGa6FzkHYWyzPR9qolY9xp2Ji?=
 =?us-ascii?Q?aFrzl2zqunrnYXETZnNoPnVY3ioFI9DSWAIdT2Wslw6bzwAyFtItj7HaJWaV?=
 =?us-ascii?Q?Ajc+k+VDcF8XXqVBqnvotC+manQLSPu4aMT3UxsWkfjpysoYQuH7Ztp8TRI6?=
 =?us-ascii?Q?DPOB94lnca0Cr/efe+ILpogTH6k8WOawIUbCOB3okJezOrExsb99CvAp3SYc?=
 =?us-ascii?Q?GI4iT54kiQ0mZ45DbihVkrFG0udV+yDqSRUSDEs+95EuV+GlN8jgvfTMYqKL?=
 =?us-ascii?Q?gatrTldPfdoBlxTTAY2yGmZBhdkFjpLi4kEZzqer996QLUs4oKCGM5YJe8Rz?=
 =?us-ascii?Q?hCnhR5Uj+sinmTf+BaOo+JOuWn9VCpz/S8Qw4NPDbEWW4t0YNM936pJlHwyv?=
 =?us-ascii?Q?MCOlTsCOw80eIMRzSE9Jf+kSpkDiwJckkSJNbBTQMreCwCS/NzdhcD6Y+5+x?=
 =?us-ascii?Q?pWQM4AuYHl3ae/Qj+LPzzNjBaunxYjmz3m14OyGShFz448q55f5ZRGNS/mvu?=
 =?us-ascii?Q?Y5E2HsfulMKSqiDpFs3jPvQPlbsXOqQCjFfty8qQ9ayVKXcWPxIZG6zvN6r+?=
 =?us-ascii?Q?2RNlcq5IlOAOO/flFzJ6b8WKxFRDezKlpvevTXYy1SOKduQJ+x19SCXp6tvp?=
 =?us-ascii?Q?qMlSoT+SA6HcKihpJb2KJaGasBJ8Rhf9ZyIATx+e6PDWlUDTpPHFi30dBOej?=
 =?us-ascii?Q?T2xbBdtAEyLlcZ/X1YryhPw5o6pqpvt83ccVlj/UD/+EG0Xk37APXZi+DWUB?=
 =?us-ascii?Q?+7k5mONvzIuPg9NwH0Hly08AOajQW/pVeaB0RCgTtNPgQEEMkYIupJezzMR0?=
 =?us-ascii?Q?ry6f4xAphGjMrRQ/GLpfIa6whgwbKhA/JFZNyZO+dR0owq40yf0JaLgdZs8I?=
 =?us-ascii?Q?OIu91ibajQV6Q+tueIMF1n/6mXu6wzALmeFuk2p42syjcZ/4mkIC5bYFIodu?=
 =?us-ascii?Q?cYm0u1ei2+HC2C+WaHs=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5967.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62b45402-dbd8-4ef8-db76-08dbbf5d42fa
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Sep 2023 13:25:47.9597
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qVkcObtRKwwIrsiEzXpEQPwkUt1zv3911Cfi1/B13W/afRQgHOB34MMycYgLn4OXeU2GgtL5SeCCT8ry/OvL6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8869
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
Cc: "imx@lists.linux.dev" <imx@lists.linux.dev>, "kw@linux.com" <kw@linux.com>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, "lpieralisi@kernel.org" <lpieralisi@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "M.H. Lian" <minghuan.lian@nxp.com>, "christophe.jaillet@wanadoo.fr" <christophe.jaillet@wanadoo.fr>, Mingkai Hu <mingkai.hu@nxp.com>, "bhelgaas@google.com" <bhelgaas@google.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "robh@kernel.org" <robh@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

> -----Original Message-----
> From: Frank Li <frank.li@nxp.com>
> Sent: Tuesday, September 26, 2023 9:05 AM
> From: Guanhua Gao <guanhua.gao@nxp.com>
>=20
> Set DMA mask and coherent DMA mask to enable 64-bit addressing.
>=20
> Signed-off-by: Guanhua Gao <guanhua.gao@nxp.com>
> Signed-off-by: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>=20
> Notes:
>     change from v2 to v3
>     - remove check return value of dma_set_mask_and_coherent. 64bit mask
> always
>     return success.
>     - remove redundate comments
>     change from v1 to v2
>     - Remove 32bit DMA mask set.
>=20
>  drivers/pci/controller/dwc/pci-layerscape-ep.c | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/drivers/pci/controller/dwc/pci-layerscape-ep.c
> b/drivers/pci/controller/dwc/pci-layerscape-ep.c
> index de4c1758a6c3..2c2c9aaa8700 100644
> --- a/drivers/pci/controller/dwc/pci-layerscape-ep.c
> +++ b/drivers/pci/controller/dwc/pci-layerscape-ep.c
> @@ -249,6 +249,8 @@ static int __init ls_pcie_ep_probe(struct
> platform_device *pdev)
>=20
>  	pcie->big_endian =3D of_property_read_bool(dev->of_node, "big-
> endian");
>=20
> +	dma_set_mask_and_coherent(dev, DMA_BIT_MASK(64));
> +
Acked-by:  Roy Zang <Roy.Zang@nxp.com>

-R
