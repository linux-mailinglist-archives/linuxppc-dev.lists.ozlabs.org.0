Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B41DB8010A7
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Dec 2023 17:59:50 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=P3J8HBtf;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ShfS41bh8z3dVl
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 Dec 2023 03:59:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=P3J8HBtf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f400:fe0e::605; helo=eur04-vi1-obe.outbound.protection.outlook.com; envelope-from=roy.zang@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-vi1eur04on0605.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe0e::605])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ShfR20JW8z3dFw
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  2 Dec 2023 03:58:53 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X93isfgIzjqWVo5PwZ0A/OGNAUo898azrF5+fQQzvKo2r6X5b27Z/ck4UIVxhkFYt5HILzYSK/dgZs1t50n/mMMjU+/qitFJcVyYOLPrhFkWPYNrYV+DHmAuO9j6UF7vBEkixuUxnhAlqG12h1Ia0empoJdIL1mlcPvCC4MKf3MP46rYC7dY3BpdpY5wTZ4J5aMTWTUP87TXk4B1PW/cBjI/nqn0HGgPcWT/KJJkUDDGJMfsEavBB61BpKDUICLQOol1HMb41zUCrXO7oHI9CQHDeQ2Desmnlh0sptCclb4dKlCpcn/WBYGawe3fNnteRIbWKGr/gKgmXoYp5PaDxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O/1dzKAEEsgGncbJDaoyzJQTECHfD/iDh2etW57YOd0=;
 b=npP320JCQt72OOhYy00ceIxnXi5BILjff6/yG4f8G8tTw15MsClnd1YpLk6YHHEYcTtVqq4v/9jAa5TghgqQYRh2lfdPXrFaG0AR5AMJSWyoXqMGjb2yDj5e6uxrW1cxHRP7nzR9O5iKFJ28jZGanDQqh1M5T1L6S9M9KG1oza2aO4eJrhWc5T6VgcktEpJ3PZWEn9Jc2qQ/d4PgnKD4YAm02gXTXZ5OQsbL7cRMBTabyHcHiuiUJvrWoXVV+d/yiOjBEiEmeUJtFgUY/RnmiAj636pSlxhi/rnfBBeLefb19d2XK3uOQe4w+5+kTR6xdhQ+5PIzUVMHXH6ZWJBKMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O/1dzKAEEsgGncbJDaoyzJQTECHfD/iDh2etW57YOd0=;
 b=P3J8HBtfm9u+Rufy5PIc6+/SWrMTO+AHzKAmhlWXMfp81BX1it8ShqJdBVaOlQB12SHIH+QaK6BZdZe9aQXqEnuLy/frUKxNCHfdBAAL3fWyy6Az13isO6twqQpPwU6cRdYBRD2J6TXbq+74Z9jsWoPMhr7Btxz+Wf/mMvNwYXo=
Received: from AM0PR04MB5956.eurprd04.prod.outlook.com (2603:10a6:208:114::23)
 by AS5PR04MB9800.eurprd04.prod.outlook.com (2603:10a6:20b:677::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.11; Fri, 1 Dec
 2023 16:58:32 +0000
Received: from AM0PR04MB5956.eurprd04.prod.outlook.com
 ([fe80::611a:53a9:3185:c548]) by AM0PR04MB5956.eurprd04.prod.outlook.com
 ([fe80::611a:53a9:3185:c548%3]) with mapi id 15.20.7068.012; Fri, 1 Dec 2023
 16:58:32 +0000
From: Roy Zang <roy.zang@nxp.com>
To: Frank Li <frank.li@nxp.com>, "manivannan.sadhasivam@linaro.org"
	<manivannan.sadhasivam@linaro.org>
Subject: RE: [PATCH v5 3/4] PCI: layerscape(ep): Rename pf_* as pf_lut_*
Thread-Topic: [PATCH v5 3/4] PCI: layerscape(ep): Rename pf_* as pf_lut_*
Thread-Index: AQHaJHHpb4n5KwIwz0+qhnT7q9yLzLCUpj3g
Date: Fri, 1 Dec 2023 16:58:32 +0000
Message-ID:  <AM0PR04MB595652FB78FC4E6ED103B1B38B81A@AM0PR04MB5956.eurprd04.prod.outlook.com>
References: <20231201161712.1645987-1-Frank.Li@nxp.com>
 <20231201161712.1645987-4-Frank.Li@nxp.com>
In-Reply-To: <20231201161712.1645987-4-Frank.Li@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM0PR04MB5956:EE_|AS5PR04MB9800:EE_
x-ms-office365-filtering-correlation-id: 0d11686c-e049-44b8-99cf-08dbf28ec039
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  L6bwJbZAD/xbCNI1pEruegAVfj0F99G6PezsX5avjqj19VaQ0fbNmvSoPJt1IefC1pfF5RcNpX7/UNaEi4707q+A07fJXsbyD4sKoSS9jon9F0mcW2xldEe32G88wTP8gXyhOt2/iIg5l+2bjQaAjP31a5ux/zsswGwcjxD4CLV8wcaKIEBTQhjIB0nDhoU2U4t2ezvFfGdhkSNmBgjONUk2FFdr1z+rEaAS7BHD0fUCgTKrRhzFhaf6pfA1HwfvtTpBN6xifVirlGtsWl6lngjFBTZ3kn6SsjIbZ6ka8RtS9TBzLIO/3pVLM7am83/o9XGBAyRrXoQYiZNo/YCzh80vAM+Z7AANzk1RWu1Jt+1wUKyvlsHaIhHeP1Y6xuj7PErn91cIU97IL5ei0wYnTquITAk2vzpUZIWaLbheudMexOBAHGWh9GA8+/j3SJpoHV0CCA3srznXiKEH2KXTP+sPlfWwEuQDl6LtZMCbWOOQFy2w7dAZIOraxRpK4ZXuZ7eHtUuQBL2Jc8Aigv01BJR0CBW+jdAv4hq7k+WtIYR/D6KnTwHnvOjGX4HJjV+sW9R6hsogE4M+iHvQSwffgfrsWyNEV1VVMwKMaIt5WmWL0iQw4PRyy9H67xBPk05T
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5956.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(376002)(39860400002)(136003)(366004)(396003)(230922051799003)(451199024)(1800799012)(64100799003)(186009)(8676002)(26005)(38070700009)(8936002)(6506007)(9686003)(66446008)(7696005)(66946007)(5660300002)(7416002)(55236004)(52536014)(71200400001)(2906002)(478600001)(41300700001)(316002)(4326008)(110136005)(44832011)(76116006)(66476007)(66556008)(64756008)(4744005)(54906003)(122000001)(86362001)(38100700002)(33656002)(55016003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?us-ascii?Q?EtkFWYZNdk2oQstac0SF2Zjkln/fLjHIJ8eZZYBLxC/zx4pTReDtXJ808AFM?=
 =?us-ascii?Q?eNS3AkPU4vZQDETzmBvKLxZPjLcYCiWLgxda5mXVl7Lv+D5GMy/DUA5bbaIZ?=
 =?us-ascii?Q?7+szD9yWLQR4nNgypAu4wFwIoXgRNDUaMpdQdsbSB/3WJVdP00BtQOQ9nXaT?=
 =?us-ascii?Q?E+iWzdVS05eg25W8i55PS+pafkRmZq83nig1EI39HCHTn7QclA/WiRSnx5pk?=
 =?us-ascii?Q?tJIJC+notmUh7eITzTl2JOh3isM/bzHC5CCBHN0ApkS3LyGiluGhW2vSsxrz?=
 =?us-ascii?Q?40wtIcow/BcOBd3FwhNw2gqr4ZJbh078LYGKLTOxQOpZ2QLkrZrvzs4jbotp?=
 =?us-ascii?Q?ZpoXhMgomMiemY6VfSH7iUm7lOWFdliikPDdcnTTV6fSSt8Ynr9eXZvmrBGR?=
 =?us-ascii?Q?e3wRDvuXFe/dwuiSWi0vzHeIeH17Uen9lmzXyo513+ZHuGWECAmc+amcqQrn?=
 =?us-ascii?Q?TbHY7gWKFYcwXtYNvGtWFfj/rIflOqH8xgUe+/+qwhaSCg3+2FfdIng/o5wN?=
 =?us-ascii?Q?VAcadR9g7DrrOycWdVbXkDYGeVJXwd3zSr89Nm3/sN5P/Isabqebfm/YByh/?=
 =?us-ascii?Q?YCkNmDlQmiweer1e8w1InLkwy4uB9l9z5K/BtSPLvuWbFQ22jbaSKNIbc10b?=
 =?us-ascii?Q?gY8UGdpCB6bjGTVmNz2QrPUcn8dMZXUwU29L9WOG0qilf9mm04WGoXzaN5N9?=
 =?us-ascii?Q?Rnhpp3rXk8BybytXW0uyndeuybe5Vgnc/ByC0knpdNkzDB6pTGNkpap44LPp?=
 =?us-ascii?Q?rTERky9gju2HVqmVRN7Nl1hnDMzv8HuGQtI+NW53we5eHOQ4Tak9sZXYXkxQ?=
 =?us-ascii?Q?YYo4GEmSzBE1PM6DoRSUzlVNuo2w3KTxSK2QpovgoNG4bfmxHP8QG1Nz01fu?=
 =?us-ascii?Q?jrFudltBPkMXZfiMx8s7WeIRGBi853kxRTk+z2ZgAD4tQaP88WHcZYzqQbDf?=
 =?us-ascii?Q?970vIucAzH5xpQj+aoEyPIDPWGjYgzotw2VwW4vElYpMKtpn1+gZXOSTdGne?=
 =?us-ascii?Q?LRkmb1kdYIb82BwNJwe+RyLNhyRJl6ydfRwBS8R6NEVoqWbD5tB2X7mZgnQ7?=
 =?us-ascii?Q?h3wS1eMV7G7LE+lL7ByMy84jf21gcTgLMNNnb1wpKI65QVkEVImdNEaqOPX7?=
 =?us-ascii?Q?PMKAVQfgha/Ls1yYESQbU9R1QPIVfozpFCnY47d2kjgEpIT7UxrQ9eg6o72T?=
 =?us-ascii?Q?u85a51T2kdF26lwSRnkUk8O89QY/vCgDvLa8i3i5z56vQSEo+9NJTXVJm3ay?=
 =?us-ascii?Q?xvEQnJpIVZgPYA/VEXySInP6DXnyOokdQER0Ys2Gu5kITYv1EiZ0YBOFRd5w?=
 =?us-ascii?Q?sVUWpdNAr+U+/sSG8nI64Qqvi8OF95Ju+s0JA2DnEeXt/TkZaNcE7DxwcJ18?=
 =?us-ascii?Q?Ydjgi6WSLz2xODD8xpCzUjOSPapb0IYityGtT7gPezOTsCWfrUcakKx5ogOu?=
 =?us-ascii?Q?+3CdpUE8lV1oE17ApOGLqsMQ8iDslcybZDl4fZT70a+R300YtoGrSoP5liP1?=
 =?us-ascii?Q?o++YONqpbfVnC/2m7EZ2sfR97C1tgGZWkgdoJx2skmNcw7+JeoDk7XjcWsJZ?=
 =?us-ascii?Q?kHETmyi3kPMoOs/MiQw=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5956.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d11686c-e049-44b8-99cf-08dbf28ec039
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Dec 2023 16:58:32.6815
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: N06OkMYqzfUXQQmPe0y6uJlLcJYD+kHRzApMacjMn0iKuPxK3+Fm1zH/X5sBt0rD4cOZT+LMqwpllz4+6RhCwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB9800
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
Cc: "imx@lists.linux.dev" <imx@lists.linux.dev>, "kw@linux.com" <kw@linux.com>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, "lpieralisi@kernel.org" <lpieralisi@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "M.H. Lian" <minghuan.lian@nxp.com>, Mingkai Hu <mingkai.hu@nxp.com>, "bhelgaas@google.com" <bhelgaas@google.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "robh@kernel.org" <robh@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

> From: Frank Li <frank.li@nxp.com>
> Subject: [PATCH v5 3/4] PCI: layerscape(ep): Rename pf_* as pf_lut_*
>=20
> 'pf' and 'lut' is just difference name in difference chips, but basic it =
is a MMIO
> base address plus an offset.
>=20
> Rename it to avoid duplicate pf_* and lut_* in driver.
>=20
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
Acked-by:  Roy Zang <Roy.Zang@nxp.com>
Roy
