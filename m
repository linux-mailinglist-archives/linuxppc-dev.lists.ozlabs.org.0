Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 291196885AB
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Feb 2023 18:43:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P75jd0ZgZz3f62
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Feb 2023 04:43:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=daXZdkO9;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f400:7d00::631; helo=eur05-vi1-obe.outbound.protection.outlook.com; envelope-from=frank.li@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=daXZdkO9;
	dkim-atps=neutral
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on20631.outbound.protection.outlook.com [IPv6:2a01:111:f400:7d00::631])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P75hc6Gmyz3bhx
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Feb 2023 04:42:22 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QJTMrJ/SVD1b9p6V5xhFp5VX4oEWn7NSkkn0Jrg5nI1T0t76tPaoOVE3X1jw/RdpLaUt780SKhSctWNkaPPr71Txc5YPSNd4+IOeM/cn2UvYuvmfKo5pZS9J5JFHyq8XafAC9S1eGtCTNdtMMsvAtdTrItjVG0qmxctjXXgxP0ykFBERx3vI9zBcHVvZOg4X/rkX7anuTwgM9sy7Yj11eOTBD5JQBVmRhl3PLYOZEuUSKmFy1bhYQt011SmH7jWFuPBvTyc2MMnYBPLrdGpKPgsS5AzKGfxtNlPHJ9HuSHjVYjSe1aEyX2VTS2h960l2SkOLDk84/WvCMzlNLj0JPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DbOo0Z8RFB0uCmQUjakg5s3cSkg3H47DokYbcoxyLDI=;
 b=mu/azQ1e5I1M1WGEV/JdUG8RWmnzlNYHPWf93iY2jSIqvsZIyXTUUFsVPzF9mqW9erO56mmiK0HghR10z+449ILoPehBtPGM8BE2I4WwEDEJaB+7VHwhKH8RFn52SOelzI8PdodQ4GQxCF5Qe4CLeXKdKXZsAVeeTJ1xxSV37iK2pQ1euxF4NV+TyjP7IXRg1Mp6JdqmjTIfiA4jkqRZ6s6Jz/UOdnQ9Gd9xwcWyj9GVQlZcJAqzED5O9Ivx1w9ljeWYcxFLmyxbwtvMaGd3a1SfbgnouCrZDhwsfZqAGprkwseJ4Zy3yguutWYoawVTYnOa1hSybHKd5wrrED4o9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DbOo0Z8RFB0uCmQUjakg5s3cSkg3H47DokYbcoxyLDI=;
 b=daXZdkO9tQNbUMHQxXBChnJloSieYN4R1qc0kgQBw509UUQ0K6AwI+UR50e8XsTpTy0TciZ4W5FF9eMDAJWTu3KZ33gnT/iNcttzpZJykLXzYMK7cA6OdOoQakK9yH0PdumAZqctEYjyg9MKLePDTU1ArDJ+w5OvcQGXn+ngJck=
Received: from HE1PR0401MB2331.eurprd04.prod.outlook.com (2603:10a6:3:24::22)
 by AM8PR04MB7314.eurprd04.prod.outlook.com (2603:10a6:20b:1df::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.28; Thu, 2 Feb
 2023 17:41:58 +0000
Received: from HE1PR0401MB2331.eurprd04.prod.outlook.com
 ([fe80::ca48:3816:f0b6:3fcd]) by HE1PR0401MB2331.eurprd04.prod.outlook.com
 ([fe80::ca48:3816:f0b6:3fcd%6]) with mapi id 15.20.6043.038; Thu, 2 Feb 2023
 17:41:58 +0000
From: Frank Li <frank.li@nxp.com>
To: Frank Li <frank.li@nxp.com>, "M.H. Lian" <minghuan.lian@nxp.com>, Mingkai
 Hu <mingkai.hu@nxp.com>, Roy Zang <roy.zang@nxp.com>, Lorenzo Pieralisi
	<lpieralisi@kernel.org>, Rob Herring <robh@kernel.org>,
	=?iso-8859-2?Q?Krzysztof_Wilczy=F1ski?= <kw@linux.com>, Bjorn Helgaas
	<bhelgaas@google.com>, "open list:PCI DRIVER FOR FREESCALE        LAYERSCAPE"
	<linuxppc-dev@lists.ozlabs.org>, "open list:PCI DRIVER FOR FREESCALE
        LAYERSCAPE" <linux-pci@vger.kernel.org>, "moderated list:PCI DRIVER
 FOR        FREESCALE LAYERSCAPE" <linux-arm-kernel@lists.infradead.org>, open
 list <linux-kernel@vger.kernel.org>
Subject: RE: [EXT] [PATCH v2 1/1] PCI: layerscape: Add EP mode support for
 ls1028a
Thread-Topic: [EXT] [PATCH v2 1/1] PCI: layerscape: Add EP mode support for
 ls1028a
Thread-Index: AQHZJrz7UNBwg0aD+0SFGvc7zfwgFa68DdDQ
Date: Thu, 2 Feb 2023 17:41:58 +0000
Message-ID:  <HE1PR0401MB2331C19D7474E6EAA4DC29C888D69@HE1PR0401MB2331.eurprd04.prod.outlook.com>
References: <20230112193442.1513372-1-Frank.Li@nxp.com>
In-Reply-To: <20230112193442.1513372-1-Frank.Li@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: HE1PR0401MB2331:EE_|AM8PR04MB7314:EE_
x-ms-office365-filtering-correlation-id: ebcde99f-8b4e-4af2-5e32-08db0544c89a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  BOq1JZITNdg6T2Z8Tjc5dDiLKE4bFGeP2/QSGdrAi3+DdQ+QYXkrR4ziLactcau0mQC89aQdbYM66xQHVJf34/WYYOorJKv7TSVd2fJIl2cxN6XtZ7fAWhjX6DsEb2Jb0wjcyAaG9EGeXcCws8/DSf8o8hpgHMOXmVRYHbCcbJQKj6p6H57PHEgocXn+w/Pe3WKv1P38geFMMCoEY9hLXVa28SSWVGRzeXDC9ZOUZo/RJWUzEDu48teUgZInZqtPwPibE8aiC0wP+uRXc9uokyoI8cvOExUPyRucI8z86IFudH5QVHqn8PqNCAq/hsOwaZvorA7UObaGfZg3aiJym0lngDSZHpGB3UqLG2deaw4/CdskwpFYpUTOnMVUq3u9pJ2nurLZlwHJwbOYFr9Pz1JN0B6VX9A0Ejh0tV7qtMuCgiXHK3Q9/KVV4iZiIJQuIVaY9r+Atof/2HIg8jQzDFMHRVQ4nC6Tm8kRcX2VSM+APcKNb5CLGNMCFspRccSzz07FYoLvdaccPNnLPJuDOTCGMwVfMTEu+uyhWObJrJ/Ed0VTcXycRs6QgM1AOgqO6wz14MbxUaRkrgfn4ZrOzFhP1IxHLvWuyKyB4GSQSmXX8BUSal7Gech4PJaqEhHpL/xJQcPK7TFXGg6qG5t/BXWZK19dMN+JAu4peZQEejMmAiQndU63WZCWAQSPb1L9mbiKCO6oE0uaxbwIXtmWcmOSKx4tH0ymaqb+qIEbv4wmXTz38q4dsLnJjCut2wzt
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HE1PR0401MB2331.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(376002)(136003)(366004)(396003)(39860400002)(346002)(451199018)(45080400002)(33656002)(71200400001)(921005)(38070700005)(55016003)(86362001)(38100700002)(26005)(122000001)(186003)(9686003)(966005)(478600001)(55236004)(6506007)(110136005)(7696005)(316002)(66946007)(76116006)(66476007)(66556008)(41300700001)(52536014)(4326008)(44832011)(5660300002)(2906002)(8936002)(66446008)(64756008)(8676002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?iso-8859-2?Q?jdG39mmqqBRbClVNiIxLH9P6mGKDTSfaOslcFzjC5LC/MtLMDOP6HT6+37?=
 =?iso-8859-2?Q?7gO4veRV9GJ0t5JISaT8HYqJnX+Jvum/w0L345VRnOD4V0tSNbgHpgoXah?=
 =?iso-8859-2?Q?OwUkNldQUUmCGN9dbomirctK36+rCz8o2oebL0Yl4cC4/i4f4VV9pgn7aC?=
 =?iso-8859-2?Q?48MRDjIsFObuDQnGvxy5XOzeRy/IGS0zEuzUhf65Lp+L+dl3QdlWrKYiEC?=
 =?iso-8859-2?Q?4w7XebXq1FJ9j2/USAtehp8pgqMfVxR9wfwaaZhS2nZTacaBd1cikjNcYE?=
 =?iso-8859-2?Q?cvuUCDJCZm+OEvaLQ21Wa4vl5w0i90gIk+5hCfQlDCBm2+lqUKytnfG9t6?=
 =?iso-8859-2?Q?rVEbKfz4rd0V1w3YyUF/rRn/zDU3/cjTckqTS81A11hP7a8fyMH16fcmTO?=
 =?iso-8859-2?Q?gmXann5fX82tK2/FxoBO68jleJuudgfKKaatvqaBe1gp+4ZuTMMKnLYgxB?=
 =?iso-8859-2?Q?HvM+wzupkrS+c6CCiuhHg93pC1+iAjWDlsZW41jjD9dGsas9iSRWe959RZ?=
 =?iso-8859-2?Q?zwsl75h80je/0Xi27d1Xa6LQRxUUjXr9OzDF9yFFNxInSWeV9BZixWTiWq?=
 =?iso-8859-2?Q?vrWOcUnO7ULiq54oLE5OIrex9rPWHsce8OsrPxSTIxm/VRcTSsWvMsoBqc?=
 =?iso-8859-2?Q?9Pzhcznx+4O67C/zMONjMo7DLNuGwUiOlWghtNJb8h1LOATR7FjO42aBgS?=
 =?iso-8859-2?Q?ot7kucFi2k6lDXSZ7TmfzV976xWjBUcgslnQ5HrvQbIWaD1mr/JFYM6gfA?=
 =?iso-8859-2?Q?HfAtCoXlljKJwiuRjE1HSoZtbo13wKqgcLLkElwmElLOwZGiXVY4Z9wprx?=
 =?iso-8859-2?Q?zPc4lDgKtKmDJMXW7kIGEQ9F5eetYcdN6DFo5IYhMnQg+RV0uqH89tHpPz?=
 =?iso-8859-2?Q?wR82iPmAFxJ/D1IDjNFY5UhqfTt3BYj0Mwd+bm0wAkqdxK+HjAUZrkWx5A?=
 =?iso-8859-2?Q?BDap78uG03doppPVhFT0nGxp3G31y4Q03DMWzJuIdH5pkG4Xbq9ex/SRQA?=
 =?iso-8859-2?Q?Z+TQsKKvmQcgULZKRdFi27oXrvCOcuagrNTz94v8YjRJEoVdIOhfSwihcj?=
 =?iso-8859-2?Q?SzNy50pSDLFuWQ87xJLhlVgdgHGErwoVAebeOcYH0b7bosTGI18tNW/Aws?=
 =?iso-8859-2?Q?AoB3bOUWN6JFnYLL6sDdVkIcoIml77eT5xWmo0q09oQ0X9SxLmdZTdvsfa?=
 =?iso-8859-2?Q?AXcO7AOhFoE0JLkzROFfxFb7eRm2EU65F5SUkNj+Y1ND1Qz83ObG4JTqur?=
 =?iso-8859-2?Q?3gHhHIWAGRPzUSv1584rJKqfeq5irlkLk3OJ8PqjGnya0AuRtuC+vmBtJQ?=
 =?iso-8859-2?Q?Qgh4bGfF920VfwLrjHjbdYy6hRBguyc9laMHQYLwX/B+kGi7QDfrbAbyBG?=
 =?iso-8859-2?Q?vAcgl6M4MweYSgb5fcIaM1Jp9ddfa/xQBZqX9O6zpsr8WFhLrdxLjWWr7b?=
 =?iso-8859-2?Q?J6kwmiKYzbfy22Rok/gqUOdQFTJ2087i2HJ/YMGrel+Zxi5Aq8OAuiGDik?=
 =?iso-8859-2?Q?MU3nDG/BeMPO4EtlrGyESZCXVP4sg3rHKENluMjxA6E8zNmFI5fTziMCTb?=
 =?iso-8859-2?Q?C/LDunSK8ihLts0L9V6pM0sgZjeghX+8N0wvZjeDjz8SlYKZJh6Mlb7Qql?=
 =?iso-8859-2?Q?jDjstgIgRdGiA=3D?=
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HE1PR0401MB2331.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ebcde99f-8b4e-4af2-5e32-08db0544c89a
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Feb 2023 17:41:58.4219
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: e83VLb3gbMnt7Mx8IgovRi+2N7Mg0KodkVjqAfb3J91ev7LE1wF/bvwgHvVkcy6AUTAe9gqh5J0scoh2WINroQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7314
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
Cc: "imx@lists.linux.dev" <imx@lists.linux.dev>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


> Subject: [EXT] [PATCH v2 1/1] PCI: layerscape: Add EP mode support for
> ls1028a
>=20
> Caution: EXT Email
>=20
> From: Xiaowei Bao <xiaowei.bao@nxp.com>
>=20
> Add PCIe EP mode support for ls1028a.
>=20
> Signed-off-by: Xiaowei Bao <xiaowei.bao@nxp.com>
> Signed-off-by: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
> Signed-off-by: Frank Li <Frank.Li@nxp>
> Acked-by:  Roy Zang <Roy.Zang@nxp.com>
>=20

[Frank Li] ping

> ---
>=20
> Added
> Signed-off-by: Frank Li <Frank.Li@nxp>
> Acked-by:  Roy Zang <Roy.Zang@nxp.com>
>=20
>=20
> All other patches were already accepte by maintainer in
> https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flore.=
k
> ernel.org%2Flkml%2F20211112223457.10599-1-
> leoyang.li%40nxp.com%2F&data=3D05%7C01%7Cfrank.li%40nxp.com%7C29d1
> 5c05d59346e552be08daf4d573e5%7C686ea1d3bc2b4c6fa92cd99c5c301635%
> 7C0%7C0%7C638091494850726163%7CUnknown%7CTWFpbGZsb3d8eyJWIjo
> iMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C30
> 00%7C%7C%7C&sdata=3D0wnHTyuX%2FyLAiioKNvlFbBM83nVyF%2FCdhqsEmV
> f2sI4%3D&reserved=3D0
>=20
> But missed this one.
>=20
> Re-post.
>=20
>  drivers/pci/controller/dwc/pci-layerscape-ep.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/pci/controller/dwc/pci-layerscape-ep.c
> b/drivers/pci/controller/dwc/pci-layerscape-ep.c
> index ad99707b3b99..ed5cfc9408d9 100644
> --- a/drivers/pci/controller/dwc/pci-layerscape-ep.c
> +++ b/drivers/pci/controller/dwc/pci-layerscape-ep.c
> @@ -112,6 +112,7 @@ static const struct ls_pcie_ep_drvdata
> lx2_ep_drvdata =3D {
>  static const struct of_device_id ls_pcie_ep_of_match[] =3D {
>         { .compatible =3D "fsl,ls1046a-pcie-ep", .data =3D &ls1_ep_drvdat=
a },
>         { .compatible =3D "fsl,ls1088a-pcie-ep", .data =3D &ls2_ep_drvdat=
a },
> +       { .compatible =3D "fsl,ls1028a-pcie-ep", .data =3D &ls1_ep_drvdat=
a },
>         { .compatible =3D "fsl,ls2088a-pcie-ep", .data =3D &ls2_ep_drvdat=
a },
>         { .compatible =3D "fsl,lx2160ar2-pcie-ep", .data =3D &lx2_ep_drvd=
ata },
>         { },
> --
> 2.34.1

