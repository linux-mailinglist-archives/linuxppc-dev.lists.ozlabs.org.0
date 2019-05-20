Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E4FA322FA9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 May 2019 11:05:16 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 456tJp0wR1zDqKM
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 May 2019 19:05:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=nxp.com
 (client-ip=40.107.1.46; helo=eur02-he1-obe.outbound.protection.outlook.com;
 envelope-from=ran.wang_1@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nxp.com header.i=@nxp.com header.b="UDWHQ7jK"; 
 dkim-atps=neutral
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr10046.outbound.protection.outlook.com [40.107.1.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 456tHN0BZBzDqHS
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 May 2019 19:03:56 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ffq7QLSqt8lxuzqwE0DYmijQZyj5qCKC1WuCIEKbV2k=;
 b=UDWHQ7jK2dmByIy71dxq2ikbrefNntFq8djUIr+0icqTQxATtn1kvGlT6IuiX/yegsi5qkNDWWK/nYIeo68hlqP6P6i7IEhbpYb2bSh6KuTvSIWuqMyBex9mImpPL7upTzNuYsx1uRjRxHm/O0nwLgS8YuffSEcMY3UJCh+kVBo=
Received: from AM5PR0402MB2865.eurprd04.prod.outlook.com (10.175.44.16) by
 AM5PR0402MB2930.eurprd04.prod.outlook.com (10.175.42.20) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1900.16; Mon, 20 May 2019 09:03:50 +0000
Received: from AM5PR0402MB2865.eurprd04.prod.outlook.com
 ([fe80::d8ed:b418:4ee9:a51]) by AM5PR0402MB2865.eurprd04.prod.outlook.com
 ([fe80::d8ed:b418:4ee9:a51%9]) with mapi id 15.20.1900.020; Mon, 20 May 2019
 09:03:50 +0000
From: Ran Wang <ran.wang_1@nxp.com>
To: Pavel Machek <pavel@denx.de>
Subject: RE: [PATCH V2 3/3] soc: fsl: add RCPM driver
Thread-Topic: [PATCH V2 3/3] soc: fsl: add RCPM driver
Thread-Index: AQHVDGHzIQrvIPzRX0ytn5pxhdLuLqZy/bMAgACX+4CAACV3gIAAANBw
Date: Mon, 20 May 2019 09:03:50 +0000
Message-ID: <AM5PR0402MB2865F4574B19761848B001F9F1060@AM5PR0402MB2865.eurprd04.prod.outlook.com>
References: <20190517033946.30763-1-ran.wang_1@nxp.com>
 <20190517033946.30763-3-ran.wang_1@nxp.com> <20190519213844.GH31403@amd>
 <AM5PR0402MB2865EC5E1EF12C6C1D3C5566F1060@AM5PR0402MB2865.eurprd04.prod.outlook.com>
 <20190520085647.GA9748@amd>
In-Reply-To: <20190520085647.GA9748@amd>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=ran.wang_1@nxp.com; 
x-originating-ip: [92.121.36.198]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: edb87af5-1522-4d53-33f2-08d6dd02135e
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:AM5PR0402MB2930; 
x-ms-traffictypediagnostic: AM5PR0402MB2930:
x-microsoft-antispam-prvs: <AM5PR0402MB2930F1B68172EE05A90881A1F1060@AM5PR0402MB2930.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2150;
x-forefront-prvs: 004395A01C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(376002)(346002)(366004)(136003)(39860400002)(396003)(199004)(189003)(73956011)(74316002)(256004)(76176011)(8936002)(76116006)(99286004)(7416002)(86362001)(81166006)(81156014)(7696005)(52536014)(6916009)(14454004)(68736007)(7736002)(66946007)(305945005)(25786009)(8676002)(5660300002)(66066001)(4326008)(2906002)(54906003)(486006)(66476007)(476003)(6246003)(71200400001)(66556008)(316002)(102836004)(71190400001)(11346002)(446003)(6506007)(229853002)(3846002)(55016002)(66446008)(53546011)(64756008)(26005)(478600001)(186003)(6436002)(9686003)(6116002)(33656002)(53936002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM5PR0402MB2930;
 H:AM5PR0402MB2865.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: pT+n75gNk2YCuYp3VQS4NBU/k5rwSjP6ksb/K2FlSi97J2NuCBvQ+MuHrPrYVzHlP3r90ZqLlrVBZ/ULTLEwvdSMYIFJKVbhm+4IiVrH0x3WLcWC1/okWb3C+/m3orau9bkLA/OOu5Nu5luzxid8dvgScWF6mX7PwydhWK1P7lFR5ScyHx3V/sj5v1/qbg9XvytuKeM1ni6WNpUexFdygQ+640HNDq8qT4bjhW3FIXmb94Pye4KCOOp6W8v5y4f3DVDhK5BwSZUjqggu9ioUXarDRjAm55w+/UaOnHzVsHolwWjOGqNN7I10jGEG6URZV0Sr50M3iH+7WLm+rjtLCjvVsZo6jztUgNsRGeor+AcTd4p9dDQs/0kMoGhzvgpK8OU2xR24xXirfgBEmga4SKLWygYOSnWW+Oe2cEnNtfY=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: edb87af5-1522-4d53-33f2-08d6dd02135e
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 May 2019 09:03:50.3076 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0402MB2930
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

On Monday, May 20, 2019 16:57, Pavel Machek wrote:
>=20
> Hi!
>=20
> > > > +static int rcpm_pm_prepare(struct device *dev) {
> > > > +	struct device_node *np =3D dev->of_node;
> > > > +	struct wakeup_source *ws;
> > > > +	struct rcpm *rcpm;
> > > > +	u32 value[RCPM_WAKEUP_CELL_MAX_SIZE + 1], tmp;
> > > > +	int i, ret;
> > > > +
> > > > +	rcpm =3D dev_get_drvdata(dev);
> > > > +	if (!rcpm)
> > > > +		return -EINVAL;
> > > > +
> > > > +	/* Begin with first registered wakeup source */
> > > > +	ws =3D wakeup_source_get_next(NULL);
> > > > +	while (ws) {
> > >
> > > while (ws =3D wakeup_source_get_next(NULL)) ?
> >
> > Actually, we only pass NULL to wakeup_source_get_next() at very first
> > call to get 1st wakeup source. Then in the while loop, we will fetch
> > next source but not 1st, that's different. I am afraid your suggestion
> > is not quite correct.
>=20
> Sorry, I seen your next version before seeing this explanation.
>=20
> You are right, but the current code is "interesting". What about
>=20
>     ws =3D NULL;
>     while (ws =3D wakeup_source_get_next(NULL)) ...
>=20
> then?

Did you mean:
     ws =3D NULL;
     while (ws =3D wakeup_source_get_next(ws)) ...

   Yes, that will be the same to my original logic, do you recommend to cha=
nge
to this? :)

Regards,
Ran
