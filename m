Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D716834492B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Mar 2021 16:25:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F3yxY6V9rz2yxw
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Mar 2021 02:25:37 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=Ii4NN0iW;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com
 (client-ip=40.107.4.75; helo=eur03-db5-obe.outbound.protection.outlook.com;
 envelope-from=roy.zang@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256
 header.s=selector2 header.b=Ii4NN0iW; 
 dkim-atps=neutral
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr40075.outbound.protection.outlook.com [40.107.4.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F3yx422bJz2yxB
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Mar 2021 02:25:10 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AbsfaPvNX8LxY9JH6X1HYrgPzGvHvXee8+YR9fc9xt+2TgnJO5qvHtrixt2I2w+S6NtGju1Bv7OkqnZDhXoSLeqzUH6/lsV/LUqj1R7B9taEDs16/FurL6EcK21iGftgNZXats7kxPVacd4IK55IYH/R2Nte8WRRxv5tmSnN8V7EgRieAMsPgO3NaLCHlIcawJvN8svxyvD0i3GhioEPkIx9t6T3+eO2IYDfichM1Rb6C5AEptGBALIhJfMOzZo2lOHI+6AXlEVGLo+P8NcLLw4gg0VO3kGt3j7PMt5K7qsxZYYg+rtjaxmJ/FUM6kWYSxRBbrewTUIH3/FCU61NgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5Cl7PNctos/HqcZiYP+UZHZP3+KnlGpyNh0PXPdyuKw=;
 b=TomID8zWLKgGgWHNJ/QSyAReJ3ePYUPovHuhe5+J3/DY332ScyTdLOMGALgrEKo+0Kc9/a7Tm4P2bwzrYoFMyqK8Ol/9PRr329y9//GGe0DL3Ne6saaGCBbJgySjj42U4m/qt1EMoAb53XWME73V8oye06FKmcZOhrz1W6n9WHfYdifRMT45yapPk5mIdYjDgQOyIb9tCXraUplk822ZnOmKZM0q8ykya5yhvA9NJaRr6O3Rf4x0L719JBBvBZsRN6uuaHcHP3Yu4kZD8e++H0xwPzB+O+jlEvbfEXc003sbR/kqjaTSpyGMqFHkyu1JcZkCEd6UzKoy60AvwBCZTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5Cl7PNctos/HqcZiYP+UZHZP3+KnlGpyNh0PXPdyuKw=;
 b=Ii4NN0iWHqQkrgGix57Rbz6q4RbHjPbnVz5oBXKk4qm82321gA2+AkJB35rQxaW2RLx0ie9XtDlJhZvwuXvka65K4iuBcOnvGhQxwpdwiNio/K3RdIZEVTman4lx7W7Vsib3j6DwuP3FoswHv2d4r4cSw02QxSfHCNyAN4oU3Yc=
Received: from VI1PR04MB5967.eurprd04.prod.outlook.com (2603:10a6:803:cc::27)
 by VI1PR04MB5678.eurprd04.prod.outlook.com (2603:10a6:803:e1::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Mon, 22 Mar
 2021 15:25:04 +0000
Received: from VI1PR04MB5967.eurprd04.prod.outlook.com
 ([fe80::d1cb:cbf8:2e78:8826]) by VI1PR04MB5967.eurprd04.prod.outlook.com
 ([fe80::d1cb:cbf8:2e78:8826%2]) with mapi id 15.20.3955.025; Mon, 22 Mar 2021
 15:25:04 +0000
From: Roy Zang <roy.zang@nxp.com>
To: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: RE: [PATCH -next] pci/controller/dwc: convert comma to semicolon
Thread-Topic: [PATCH -next] pci/controller/dwc: convert comma to semicolon
Thread-Index: AQHW067swcgbu9wBmkKgbXrNx0haraobFvQAgA2nIACAUJxCgIAXMDMAgAAPvDCAABI4gIAACttA
Date: Mon, 22 Mar 2021 15:25:04 +0000
Message-ID: <VI1PR04MB59675A1B2906DA2A6BAD22648B659@VI1PR04MB5967.eurprd04.prod.outlook.com>
References: <20201216131944.14990-1-zhengyongjun3@huawei.com>
 <20210106190722.GA1327553@bjorn-Precision-5520>
 <20210115113654.GA22508@e121166-lin.cambridge.arm.com>
 <YEUdSZpwzg0k5z2+@rocinante>
 <20210322124326.GD11469@e121166-lin.cambridge.arm.com>
 <VI1PR04MB5967D3FCEE442AF30738939B8B659@VI1PR04MB5967.eurprd04.prod.outlook.com>
 <20210322144457.GA13436@e121166-lin.cambridge.arm.com>
In-Reply-To: <20210322144457.GA13436@e121166-lin.cambridge.arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [72.177.85.142]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 2b3e31e6-2cd5-4c2c-b093-08d8ed46ab35
x-ms-traffictypediagnostic: VI1PR04MB5678:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR04MB5678B2D6BF9A899B3FD69FAB8B659@VI1PR04MB5678.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: eYozCQNgGQc95VZj7UgjuTAoGKhoqzTC2DFBnXWdCqfcMvANxJqfgjQigZcG9Tg8DFwPLM+1euk0Lt8O5yAuThHjoiDJhFBqbl3s7d3WkqRgwcgPHjU6+sKOA0GpicxnDP9opjPtaBLMToYpQK1TFzXDz1t4CYggb2O1Zt1XE/MYKgH6/KGpzLExka49zfNvRlhJ1+8Vg90cMQ4IwFp6rdCs8RtzrlM6IAozZp6FlxhbhPfp3BJCqzgqJerk4t2hNE7ObNNCxz8BkVZz74wjY1JTau1J/dzJh2JXpH8jCWMdeJWMooqk1VSxxkyClXwFA9OSkCNuSpLBcaMEQ2RAQC5tD/90onb+ATkobpkQE5jV9dz0i6hOS3t10mF5pMOlVbi2krKkmabyeDoN50NIQEpvJM6lJoOA0uQDBoofxn/BPWgqn1bNEnC7qZ+1iKt2sXuhK6LLIWP4VrzbEmX83h52NwPjHRbZwmOh5sRrqS7epO1grZTxWbDpMyjm3zFxCzNIQ658FQiNicCl2IKqAep7Q3F8mZ+EycHy3YS2qTRlag8QvTvLWg6ckzlhGDizqU31LXUei5HL7wD2HKTSvJMVu7YgZyF6FUDq23ZogKttmVYX6J1DX63vckvxJs0SJDoPB8eEh4XPA0BlYBONOW5n1lEO25R4WbInR49VjvbL7NrbFFkCFf2/xqqZEhhOGvC9OjGgnalkIL5rDXEDlGFsVxF16ilGprWvimCTVlkDwETe+wVdFsslIjOvZ7iQ
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB5967.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(39850400004)(376002)(136003)(366004)(346002)(71200400001)(26005)(478600001)(316002)(6916009)(33656002)(38100700001)(186003)(52536014)(5660300002)(4744005)(44832011)(8676002)(8936002)(966005)(4326008)(54906003)(86362001)(55016002)(2906002)(9686003)(66556008)(64756008)(66476007)(66946007)(76116006)(45080400002)(66446008)(7696005)(6506007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?iso-8859-2?Q?ABJpVmjHzcuWUWf+0GV0CaRuB8RSwzu3Zg6SeKNSqER4NrYvszvCyXC3c3?=
 =?iso-8859-2?Q?n1iwtPYG9OiokxKnPgtata+qIpcNNMfmf33TC2RTb94gZS9cmmbxrPyvp7?=
 =?iso-8859-2?Q?X4x2+wT5XLXjLP2K7REnbv7WykL1Ey+s4tXJa5mmbxPuUlDYIeqFgYeEu/?=
 =?iso-8859-2?Q?9uSt8P19MhlG7YL2Eo1LN7R4IasDkP8enL8E8SkzxHdjyfkyBqk3e3GRDN?=
 =?iso-8859-2?Q?1n5FoGucGjctSl8HrjnG+j+RttVSctHkgv2qDvMKMMY0gRB1fN9oE3PjxG?=
 =?iso-8859-2?Q?UlCO5NWBMFPtymG/i/9PBer8P8NtaliDFRIDaVI1oH95YdA1CY44jrUUOD?=
 =?iso-8859-2?Q?FQLyaFZHrkE05vXVBpP+U+QA0CcKgmkpgg5EFpbphFQ8bgDsmcWeV1sKMm?=
 =?iso-8859-2?Q?kmha+GrbYKeNpLh2uTjBvswnrViBG7mdyMPnHpeIRUk9pvpNtF8bv2bapp?=
 =?iso-8859-2?Q?lr15ARZnzZujKhQJ9WgTxQyUas3vhyBKI7B6uoe8VXOPFdT0ATCBsQnMYI?=
 =?iso-8859-2?Q?0UUReJ6VPf/fWIBGGyhPHBAvRatkc9v77CVUcaXNh8wqXeMKg2KQnWTmg8?=
 =?iso-8859-2?Q?6TqkTD6GgfOYwdF81Ek7e4RRG+dyeveDBfV3gCikAy9h1tmUJUghCl5+es?=
 =?iso-8859-2?Q?LuqH+5ncsGAEA9eRiLMtWDvaR1gSn2YgRJdvcDSzJ9BEr5+Ohc4pXBXhnZ?=
 =?iso-8859-2?Q?6CjGf/bE1vQus2VAkuEQMKfF9XZhMEmbrBwm/9qDo3qx9v5MPXflegfx1v?=
 =?iso-8859-2?Q?DdBSjQ9cKW7EibZzcx5Eornv5tXQ8BfzJUyhqEGWddgHmkVV2tDQFVOL7R?=
 =?iso-8859-2?Q?svvsmB6kKyGfk+xIU+RywSzHbASwbBN2YMVf0gxHLdng7iIhH+UcFoNzr/?=
 =?iso-8859-2?Q?BipVvtlOUJLFUKhcmKfgSOG56CZ4YBq+fQfPXdHW4MSveTFx/vfLxnaI17?=
 =?iso-8859-2?Q?fZb8lIu4mkZzNoFz4S+9AEW7kDyA91afwYPJ5S9Cs9086tElLH8JqKwD2c?=
 =?iso-8859-2?Q?XlqygHyJuaEL1tsRk0QFXHSOJqw7Y9R5ccx2SwtDLNuKqmU3+J71eL4s9r?=
 =?iso-8859-2?Q?NiG3eEJvvzR78tno/2hSfMi7r5LdrngmP2FJXWrxz3wSb2rvHw7cTqGIsv?=
 =?iso-8859-2?Q?Dunl/X2e5XSkbDpWsDq9ukZfHTirUkLxhblHthazET7+TsUg69f4uvJPDV?=
 =?iso-8859-2?Q?p3mrWs+5kwqk8gij0u698PkUZFTUj7D4QFAyPBeZQeA4dwe4BH6vpx1Yb+?=
 =?iso-8859-2?Q?W3D4a0tQnxS9bEy3CWPpRFM4raeDd1yvSAuo/PsI0+83mq0Y+x4P7pjUeC?=
 =?iso-8859-2?Q?uf8kcy/V/h3KiVN2/PcEqahiUz7bky6QPTkYNxbYPr+zryuHzUt1xLWqC9?=
 =?iso-8859-2?Q?2WzYVd8B9Y?=
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5967.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b3e31e6-2cd5-4c2c-b093-08d8ed46ab35
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Mar 2021 15:25:04.7622 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sqpx4svcSxcwFqyNm22UaRXUPTf8tf1lzPzXsEGjDcy83KDeXm14rPWlLvhdlpO1JzfezKe2REOldUucsHg/cg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5678
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
Cc: =?iso-8859-2?Q?Krzysztof_Wilczy=F1ski?= <kw@linux.com>,
 "robh@kernel.org" <robh@kernel.org>, "M.h. Lian" <minghuan.lian@nxp.com>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Zheng Yongjun <zhengyongjun3@huawei.com>, Bjorn Helgaas <helgaas@kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 Mingkai Hu <mingkai.hu@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

> From: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
> On Mon, Mar 22, 2021 at 01:40:16PM +0000, Roy Zang wrote:
> > Yes.  It is maintained.
>=20
> To be maintained you should review its code please.
Sure.=20
>=20
> > I will send out a patch.
>=20
> Krzysztof already posted one for you, you just need to ack it:
>=20
> https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fpatch=
w
> ork.kernel.org%2Fproject%2Flinux-
> pci%2Fpatch%2F20210311033745.1547044-1-
> kw%40linux.com&amp;data=3D04%7C01%7Croy.zang%40nxp.com%7Ced683ff5
> 093443cb9c1608d8ed41150e%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0
> %7C1%7C637520211070640953%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiM
> C4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C2000
> &amp;sdata=3DIWTcj7Xs0AdVVIf%2BSFzge6is9D8o0h6SSi7MpibIYcY%3D&amp;r
> eserved=3D0
>=20
> For the future email exchanges: don't top-post please.
Acked.
Roy
