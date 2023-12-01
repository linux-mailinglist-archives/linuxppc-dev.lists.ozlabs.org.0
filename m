Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F83380109F
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Dec 2023 17:57:00 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=Kq/65qzp;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ShfNp0KgTz3dBs
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 Dec 2023 03:56:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=Kq/65qzp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f400:7eaf::621; helo=eur03-am7-obe.outbound.protection.outlook.com; envelope-from=roy.zang@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on20621.outbound.protection.outlook.com [IPv6:2a01:111:f400:7eaf::621])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ShfMw2h52z3cbQ
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  2 Dec 2023 03:56:10 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bmZRqHhji0Zbhxk5ICMmqhHPUajlnp3+f3nV2rHuahTOdludKWtw5MoROcWIMh6uC+RS4/BFrfZJlOcZKPrqghMQFdAVo8elSeYL3GwLkvBKYsWQytWbyWOl6ApDSUQFrghlmVBqlTerAsuo/5O0JoHmneAFu4M/1mCf3t9rvD5m85pHuO3dQHKhivDeQ/0bCDOsgzJvUeng4jq+HoKVAQljtQL2wEXv7dv7OrXK7+BZXF1VIcir3owt14EPSYYIsS/jV1msO+RNG7Ok7tyZ+DR0dJBl6O1V5NcxwrURDQDsE0AtESrLClfURKx7q26vU2QVhiCBltKwRfD+MM+FUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EyWejAaGPKKwfuGLK/n+t1gTo7sLVxM+kIkl4p+ycG4=;
 b=Nfff+9RsWKM91KVqMm3WeKIkRPh1b7xh52F/vJRdEHpKNaa3UfXN4to7asIQVA0Gn9g9sT912z5AbPp5EWAHAqrDiSQQjT+koPvDP3GEqFJig4jFyU1rJ3N5nr04I6BrmvOjMrmoqWbregSxb4RRVFmQVsCjHY7TRsCjiZFcBjC/BttThHmfE9XHS4h9Kixankf6AqMIw9xv8jUrPG2Rz5CLOmoB9hfkQcDTGINnoJw8Zf7TNGljKuCBLdEAMgF8B4T7Z6NDKR0EwUDMGXe8jbfDVRm62JpackRPprBvmHLRYvCc/hXLafDORcf43ZDkJmK/XHtFkcYYigszyLMrbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EyWejAaGPKKwfuGLK/n+t1gTo7sLVxM+kIkl4p+ycG4=;
 b=Kq/65qzpNJtmWQB7bun5kwkR/UnkbewrGkA9Qs1C7IwWiI1J9CHaIknIKpa96+d4wNQTIPBgsx4brjfma1aXkmJ4quYwas0FRa1S8sveyJiBwVn72u6bkd+auYVjkp2DsVuHgXx9YXpfmC/7ujuwWxJdcUiw/wL2H9mVWWEXmiU=
Received: from AM0PR04MB5956.eurprd04.prod.outlook.com (2603:10a6:208:114::23)
 by VI1PR04MB10002.eurprd04.prod.outlook.com (2603:10a6:800:1d7::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.22; Fri, 1 Dec
 2023 16:55:46 +0000
Received: from AM0PR04MB5956.eurprd04.prod.outlook.com
 ([fe80::611a:53a9:3185:c548]) by AM0PR04MB5956.eurprd04.prod.outlook.com
 ([fe80::611a:53a9:3185:c548%3]) with mapi id 15.20.7068.012; Fri, 1 Dec 2023
 16:55:46 +0000
From: Roy Zang <roy.zang@nxp.com>
To: Frank Li <frank.li@nxp.com>, "manivannan.sadhasivam@linaro.org"
	<manivannan.sadhasivam@linaro.org>
Subject: RE: [PATCH v5 1/4] PCI: layerscape: Add function pointer for
 exit_from_l2()
Thread-Topic: [PATCH v5 1/4] PCI: layerscape: Add function pointer for
 exit_from_l2()
Thread-Index: AQHaJHHl8qXN4QHKMUKMMe8ziEIho7CUpVJg
Date: Fri, 1 Dec 2023 16:55:46 +0000
Message-ID:  <AM0PR04MB595614CA6B295B42D4FDE7BE8B81A@AM0PR04MB5956.eurprd04.prod.outlook.com>
References: <20231201161712.1645987-1-Frank.Li@nxp.com>
 <20231201161712.1645987-2-Frank.Li@nxp.com>
In-Reply-To: <20231201161712.1645987-2-Frank.Li@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM0PR04MB5956:EE_|VI1PR04MB10002:EE_
x-ms-office365-filtering-correlation-id: 9940bcf4-54e2-4bc5-fd6e-08dbf28e5d51
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  08+SueAQXmuWL1yevEyNwgUOKSRm/h4jPwUocgzLRAzc+9KMAnob2GHnQuSpv4/eej0vsgUpT8kc69k3MMwu9jnPYlSjJzoNAgwZBJLryCO3WQEOHbIVkq3GfTqjbK13qlchMgDPDUURbizsjDhvEfvDxV/gkRaqzgGQlHN96xbZ6E33WLSR/nJ8tRnNhYakMVEum9zHhUNvlY2DJ7UOFLaiEoTfKgxdKs6HWym7pumytAjxcSEU2zimoEaVGOYMTk6Lht4pX0d5AY/rEBMLyAMlOeNE3BT6OspOJoOtfom4wHUJoJ4ENukVx4sDkwtG65VCw6QcaIJmWWNTpH60WILc18YJLWVJSAW11j2g4pnmdbbtJ/123ji8UVBmw9B99rCGpHevwuM1IxaEZ0RrbD6Ix9/bng2pLUsz+ZJsLwS7xa6nKse9RPDRySoLjP2y8OJC3RTqxepzEmy7lQLl22KocZBUXyNje2Z0HHDt/HMTkm8fgp7UXBhcOjtUlqiS9D65iaUIUdVf7CHoTe3FAGbs+zuQ8PI5Oy7u3RlLnK2wZPY45E8bP0pcQyP9QjAGhOZeIzL5/ediqvJVdrYpRSzr5oLG37rWoJZpUHfMcW4cVjD8/vTzuopLvOch6v5W
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5956.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(396003)(376002)(346002)(366004)(39860400002)(230922051799003)(1800799012)(64100799003)(451199024)(186009)(41300700001)(38070700009)(55016003)(6506007)(122000001)(33656002)(7416002)(5660300002)(38100700002)(86362001)(9686003)(2906002)(83380400001)(71200400001)(4744005)(26005)(7696005)(55236004)(110136005)(44832011)(52536014)(76116006)(478600001)(66476007)(54906003)(8936002)(66946007)(8676002)(316002)(66446008)(64756008)(4326008)(66556008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?us-ascii?Q?m67En089Gr+FaMP4y+tKFkrU0v7w7+XW3PLJ67hfu6TSYq8zCkLVxVG1VI06?=
 =?us-ascii?Q?R5NDLJj0jZ0fnbbMX13RqSb1tstaz/VK9AvG7n7M2Iceo2P97v8XEU2UwHUs?=
 =?us-ascii?Q?4NlGp511eeH7IaG+uoEYqkJyCHPF6Iln87HhEX6Pdx84ra0/HSb2fWOqCVrR?=
 =?us-ascii?Q?x78izBCw1yIoxixvzAm2kZunvXXV5nlTjl88L7hFt0Ltl/dqLeWhd5JdbcAz?=
 =?us-ascii?Q?yKxYNVy17mkDFB8dz8/HHSios47ZjrgiI2hWhLnfB1WBM6xHAsjuQPKTKHqg?=
 =?us-ascii?Q?XEY/V5WEmExnjyiiPyiUpCws75hgf0QB0FhssQsSDxD58yI5iXYZIz61M+n3?=
 =?us-ascii?Q?spikWpDul0j+1bpHXkZjA2pMZmPpvSDEXW8cy9//2+XIfBSurSlUvtaHqXe+?=
 =?us-ascii?Q?wlNbAz3H83u24AVDFGawEOTy08G/+6pTOZbfGxeTPYrvYTU+lfiGnce1Zi06?=
 =?us-ascii?Q?EWEHwUxfu4EntS9oZX/gC7q0WwR8GEeX4h1ddD6PnnNDZBjb1UK07Gr1a9WK?=
 =?us-ascii?Q?52OewWLAczYf88NpDKj0jUByEn9vtBNxrBV3a1AUJ5XwZYOnFZcIzAlYBf//?=
 =?us-ascii?Q?pU/6ML2qru0IyhhQULX6SjXr2G8H5Ull8L/KGJBr3Mwby6MvSKwW3e0jJuUu?=
 =?us-ascii?Q?oOlniRexYU6cOpfoYp9QkPTFt0RoxvuDQVXOoqWubD5yJ6/B4kBWDJ6RYk2G?=
 =?us-ascii?Q?mqbeMAjdDqRDW/B7tdIzyxIyczESP9dcGXWr1afZFbCsAqdOSe2W+z2pkvFz?=
 =?us-ascii?Q?uNDYGKpjee5EpzAPd83/+vLcUUBwaIN5qCq2z/tuOQqTWv86wZ6tAAD5bhDa?=
 =?us-ascii?Q?+0LXx32E8Jxhpb39iwBQCcl0ULIzfkAJBbaxvIALrzkxmQMRQ2Z09SC36P7h?=
 =?us-ascii?Q?6IO5cUTMRml6IRLTHVS2oWcBsThOs6xOZvFyLmWYWa7/tWjIbNguHeil7ZYH?=
 =?us-ascii?Q?C0noAusR5sbZUpqV7O0zyEHNLZeVFmzOFFluqF9a71ptplGr5GD9bPgvA2a6?=
 =?us-ascii?Q?Hdv2wCC7IqGTkvdlTz0Pkev3ekG+vDQcsAALI9eR0HZdqYVTkjfNkEiPQIqb?=
 =?us-ascii?Q?7//0fSdcjcHapcKyrdogSjBk8r09vyZdJrvbRkdavfBvfBKHYrW9eQ6pW4HJ?=
 =?us-ascii?Q?dZatUOeEjxHRWnUqjaQUdjQkiEc/JFH8lUfN6mvwkUDTJ/WDppnINsdKKm1s?=
 =?us-ascii?Q?xWgOYBYeIhblvW+OnUU+ysLlnSV5d7AhLWuIRXCK6VX8BsJ78jfw3VPvML7M?=
 =?us-ascii?Q?mXe37JRMhZ23Y9+M4osqJ5+89TI7B+YFnkcJ06aZqJKNUaZHxw0pPWVBzzYr?=
 =?us-ascii?Q?oYGEdBJzz7P2nUv1wMYPy9XtH3t/Qymsxq8oTTzhmQrN2Fd//ud13VY6+FXc?=
 =?us-ascii?Q?5O0/o0qOXB7NhryiPIrAmFfs5ItcZXSM2gQe/5zftlceZwB4p9DUxvO//xdZ?=
 =?us-ascii?Q?D85FLwSPlMk5muRbaJpWTb716iVkwBtFhu0yDc/uut3Sfg4ZtRlmy+cCjUwL?=
 =?us-ascii?Q?K1Ewy4safidsfVkGXXOUYFBgFpVdRyAhKTOFG8JvA2SlRolNQqa7Rs3RD8Ex?=
 =?us-ascii?Q?Q443a5HjWzOSDFZe9+Q=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5956.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9940bcf4-54e2-4bc5-fd6e-08dbf28e5d51
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Dec 2023 16:55:46.7579
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: viMTA3NYM2AHakJEoQGsHpq3dDDneH9I+xdLm9VF5DncT13Aomfdj7Trj43CeY6pBfzucc0kbtN8Bzzmt8nAuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB10002
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
> Subject: [PATCH v5 1/4] PCI: layerscape: Add function pointer for exit_fr=
om_l2()
>=20
> Since difference SoCs require different sequence for exiting L2, let's ad=
d a
> separate "exit_from_l2()" callback. This callback can be used to execute =
SoC
> specific sequence.
>=20
> Change ls_pcie_exit_from_l2() return value from void to int. Return error=
 if
> exit_from_l2() failure at exit resume flow.
>=20
> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
Acked-by:  Roy Zang <Roy.Zang@nxp.com>
Roy
