Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B840D22C50
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 May 2019 08:49:39 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 456qJK264XzDqDY
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 May 2019 16:49:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=nxp.com
 (client-ip=40.107.6.80; helo=eur04-db3-obe.outbound.protection.outlook.com;
 envelope-from=ran.wang_1@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nxp.com header.i=@nxp.com header.b="MmgHf+Ka"; 
 dkim-atps=neutral
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60080.outbound.protection.outlook.com [40.107.6.80])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 456qGv0t8dzDqCc
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 May 2019 16:48:19 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=33YX5R8PmkzdWm+eur9703rXCTwKjIvAQ3tNLBN8u/4=;
 b=MmgHf+Kaqd89N/aQ6IBnsC6tiI03CZ1Le1UtCRiNngxVaPXyOLphIK4O8rn56XDBx1weH2LOR2INPD6rG0z7woLOP/gswxphwskq61TIWn3mStDH87UYPsNit8j6iVTDVx5uFvYzhphT4Q6tfrLPCaAngNissvbpEQvD4UeYEas=
Received: from AM5PR0402MB2865.eurprd04.prod.outlook.com (10.175.44.16) by
 AM5PR0402MB2689.eurprd04.prod.outlook.com (10.175.46.18) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1900.16; Mon, 20 May 2019 06:48:13 +0000
Received: from AM5PR0402MB2865.eurprd04.prod.outlook.com
 ([fe80::d8ed:b418:4ee9:a51]) by AM5PR0402MB2865.eurprd04.prod.outlook.com
 ([fe80::d8ed:b418:4ee9:a51%9]) with mapi id 15.20.1900.020; Mon, 20 May 2019
 06:48:13 +0000
From: Ran Wang <ran.wang_1@nxp.com>
To: Pavel Machek <pavel@denx.de>
Subject: RE: [PATCH V2 3/3] soc: fsl: add RCPM driver
Thread-Topic: [PATCH V2 3/3] soc: fsl: add RCPM driver
Thread-Index: AQHVDGHzIQrvIPzRX0ytn5pxhdLuLqZy/bMAgACX+4A=
Date: Mon, 20 May 2019 06:48:13 +0000
Message-ID: <AM5PR0402MB2865EC5E1EF12C6C1D3C5566F1060@AM5PR0402MB2865.eurprd04.prod.outlook.com>
References: <20190517033946.30763-1-ran.wang_1@nxp.com>
 <20190517033946.30763-3-ran.wang_1@nxp.com> <20190519213844.GH31403@amd>
In-Reply-To: <20190519213844.GH31403@amd>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=ran.wang_1@nxp.com; 
x-originating-ip: [92.121.36.198]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5d0f9db8-930c-42dc-005c-08d6dcef215a
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:AM5PR0402MB2689; 
x-ms-traffictypediagnostic: AM5PR0402MB2689:
x-microsoft-antispam-prvs: <AM5PR0402MB26891593F97955049CBE6E5AF1060@AM5PR0402MB2689.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4125;
x-forefront-prvs: 004395A01C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(376002)(39860400002)(136003)(396003)(346002)(366004)(189003)(199004)(26005)(186003)(305945005)(9686003)(7736002)(55016002)(2906002)(3846002)(99286004)(7416002)(6116002)(76176011)(33656002)(316002)(25786009)(5660300002)(53546011)(6506007)(74316002)(68736007)(7696005)(52536014)(446003)(11346002)(476003)(486006)(4326008)(6916009)(6436002)(14444005)(256004)(102836004)(229853002)(53936002)(86362001)(64756008)(66946007)(66556008)(66476007)(73956011)(76116006)(66446008)(8936002)(71200400001)(71190400001)(54906003)(81156014)(6246003)(8676002)(66066001)(478600001)(14454004)(81166006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM5PR0402MB2689;
 H:AM5PR0402MB2865.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: GPFJe1rRXtwMD0DZ7BXyf/zcy3pI4o6DSiAVXZwVRIaHUfSDmfyJ50ibcznwpXuQmiY6vshHb+xb4IRfKSuoxgu9NQghvNA9dFQIK1mzUKz+MG+q5QEKvKPJRLY29FqHIPdh4n+0ajP6Y+G8YMwJOZGeHfTQ/gN4f6OSAqTb7VurEZVH16m+Pg76+zXNyXp77SRPpdfcvPU82nsR6WeislODehwvMnM2I5QJwpTynQFKohDYsqu66FO57Dxzs9a1guHAMuFB7oJP0HUJesiYO0J4yP6EQDLIzY/yyO81B0gGFlNwaMNMsiDblrSqRSQgZwgtZDhlZovVI+X3rsphlFHG5UElZHmk4J83zH2LCOD/UINnXlSGsHjXPymWc+YyeTlfjF2B3h1iqfn0wjB2PrhIO3bJiJb002x7X7dTE54=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d0f9db8-930c-42dc-005c-08d6dcef215a
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 May 2019 06:48:13.3584 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0402MB2689
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
Cc: Mark Rutland <mark.rutland@arm.com>, Len Brown <len.brown@intel.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
 "Rafael J . Wysocki" <rjw@rjwysocki.net>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Leo Li <leoyang.li@nxp.com>, Rob Herring <robh+dt@kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Pavel,

On Monday, May 20, 2019 05:39, Pavel Machek wrote:
>=20
> Hi!
>=20
>=20
> > +
> > +struct rcpm {
> > +	unsigned int wakeup_cells;
> > +	void __iomem *ippdexpcr_base;
> > +	bool	little_endian;
> > +};
>=20
> Inconsistent whitespace

OK, will make them aligned.

>=20
> > +static int rcpm_pm_prepare(struct device *dev) {
> > +	struct device_node *np =3D dev->of_node;
> > +	struct wakeup_source *ws;
> > +	struct rcpm *rcpm;
> > +	u32 value[RCPM_WAKEUP_CELL_MAX_SIZE + 1], tmp;
> > +	int i, ret;
> > +
> > +	rcpm =3D dev_get_drvdata(dev);
> > +	if (!rcpm)
> > +		return -EINVAL;
> > +
> > +	/* Begin with first registered wakeup source */
> > +	ws =3D wakeup_source_get_next(NULL);
> > +	while (ws) {
>=20
> while (ws =3D wakeup_source_get_next(NULL)) ?

Actually, we only pass NULL to wakeup_source_get_next() at very first
call to get 1st wakeup source. Then in the while loop, we will fetch
next source but not 1st, that's different. I am afraid your suggestion
is not quite correct.

>=20
> > +static int rcpm_probe(struct platform_device *pdev) {
> > +	struct device	*dev =3D &pdev->dev;
> > +	struct resource *r;
> > +	struct rcpm		*rcpm;
> > +	int ret;
>=20
> Whitespace.

OK, will update, thanks for your review.

Regards,
Ran
