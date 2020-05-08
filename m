Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CDD361CAA2E
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 May 2020 14:01:21 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49JTSZ3kH1zDqwm
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 May 2020 22:01:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=oss.nxp.com (client-ip=40.107.4.87;
 helo=eur03-db5-obe.outbound.protection.outlook.com;
 envelope-from=biwen.li@oss.nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-NXP1-onmicrosoft-com header.b=fLVJDEOX;
 dkim-atps=neutral
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr40087.outbound.protection.outlook.com [40.107.4.87])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49JTQ56WdlzDqsG
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 May 2020 21:59:06 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EbHVKA7rYBut1TAeMLZ8BNT9cm6xURyyaP4VA+AAHTRxqU8pQQS4Xz+xgMhg2dVG1PK0uKYsE6FLvHspILJ6ocRUoc6nEbeYTAW5+4oUHcSm/sAw4HyFh4vDKqY+8SqzRz1AjQ1yJQZMvspueAG79PurXmMmpjuUaktYcdN96HgN72VgdWxDQ4ScQ7nYQHDrmOpJjgSc9UuR48cHMxFCa9j5kHAQWD37kgupgHSpazKREMpNbtsRJg6wdz20NZpbFN6K49poRanu8QJHB8uIuhfruVe559dgUZYojAwe7A+mUFWgbWa2Trrh3YJK5bVtft2rqOjCmN7Llv6O8bC1Tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KpZZcXSxxrm4Sf9wNtz01CSA1UVcl9bVwIucZVROdr8=;
 b=ZlmHEcSycOsTQW6I7ngDRDnbf7Tgoboh27xOM9v6NO5G2dQA42p58R2BEWeHFpUnxlvo2X9Aa6nxbiXeBSsMlhO0A4bCpIrtdwZlP/IMHKftvJsZpkMGN3O6rYzGRjPDx6aWPIrL/wfKn1jDi4PNHil/bpRWJWcaMsgSp72US97e9nfz5muCfJRkLuUTXny7VV+h1t9I28etrIkNsA9XamBz23GODlREdxnFjwf0Qp1vjHFmB7xrTQDWAmdNKYOuviuGI4IldVzuJM5v6Kr0hk2+Ivs19fOnp6LkPgEEAIHl9kTrsIwYJbrvXhCVH+bXchHrmMKopND56mxtE3fc1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KpZZcXSxxrm4Sf9wNtz01CSA1UVcl9bVwIucZVROdr8=;
 b=fLVJDEOXQJTaFodme2aSl08+ZH/uCvGIRF2n9kO2Td8WNAgahe0zM1O4ik2kz1vj4BAbOiyT/QOXVF9lgDxaw26fNwNnwaIa7toV5DjFF+gFEWzXLmfPC3KPR6fnU1C2FqvvLfM+uPwst+bpR1fxefObT6rLWNvuJ0BhPHlnWkA=
Received: from DB6PR0401MB2438.eurprd04.prod.outlook.com (2603:10a6:4:33::14)
 by DB6PR0401MB2518.eurprd04.prod.outlook.com (2603:10a6:4:36::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.27; Fri, 8 May
 2020 11:59:00 +0000
Received: from DB6PR0401MB2438.eurprd04.prod.outlook.com
 ([fe80::444:b05a:a5:5710]) by DB6PR0401MB2438.eurprd04.prod.outlook.com
 ([fe80::444:b05a:a5:5710%9]) with mapi id 15.20.2958.035; Fri, 8 May 2020
 11:59:00 +0000
From: "Biwen Li (OSS)" <biwen.li@oss.nxp.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, "Biwen Li (OSS)"
 <biwen.li@oss.nxp.com>
Subject: RE: [PATCH 1/3] rtc: ds1374: add uie_unsupported property to drop
 warning
Thread-Topic: [PATCH 1/3] rtc: ds1374: add uie_unsupported property to drop
 warning
Thread-Index: AQHWJTAP1zCUHqdJKU+S5DjH5/rYUg==
Date: Fri, 8 May 2020 11:59:00 +0000
Message-ID: <DB6PR0401MB2438A00D64C922C44B335E418FA20@DB6PR0401MB2438.eurprd04.prod.outlook.com>
References: <20200508054925.48237-1-biwen.li@oss.nxp.com>
 <20200508114947.GK34497@piout.net>
In-Reply-To: <20200508114947.GK34497@piout.net>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: bootlin.com; dkim=none (message not signed)
 header.d=none;bootlin.com; dmarc=none action=none header.from=oss.nxp.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [119.31.174.73]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 2ad3d512-520c-4649-07dd-08d7f3473203
x-ms-traffictypediagnostic: DB6PR0401MB2518:|DB6PR0401MB2518:
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB6PR0401MB2518B4D62D866320E0DB84DBCEA20@DB6PR0401MB2518.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 039735BC4E
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Dyc9saOGZGmL26N982fCTn040tzd5DtYb3SGFWTFwflV7nzCNqjgiReXpES3uoZd2Ge/sgub7MkOnUbki4r28F0Ttkk7xn15PVg1/Cc8F4TePZ/gJPAuXDVN5v8xJYEUodKaV/hj0p9jTWYxxMzEQgf+CfzvD9qOjOcG7ux9Od2DMEgvWWbwt9iLdWuXDtXuozp/1cZf0WbfHtG1LyUFfSSNMWuFy4vvVpT9+331NC0blj+4hva8njk9aUQK9tD+W+0u0R8GrtrxN8BZcUh04s3G2lgATwTJHPL8ydNHdP0z58SOZYRUgvHDlxjvbEd7wQBaccBU5s6eLrZwzQvmnV5mGzSFGriyBfq/M+0ptmd2JjpA0uRVpNFbWnDzUJbwNY412XmSs+w8OKquAxGuVcHs0Obbfk75kyxrYV+5z8zNjxiPkc2vO2uz4IOf0Vbbq6qmwh3FHklyCmb0M3nUlilpyXehpbwm3/Uy/U98kGaBn/rjOvOUsTl8s68icb9OOGLrvPZ953gNfHBlHgPN32nSrZhgu9lPgJ7yS8Rx7w6c+xIbssfEKctgM6zIo1r9P3VXgWaIFfgShIf3MPoi8r1VsKFXBirN7Hz+BWITd6M=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB6PR0401MB2438.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(396003)(376002)(346002)(366004)(136003)(39860400002)(33430700001)(186003)(52536014)(2906002)(9686003)(55016002)(83280400001)(8676002)(83300400001)(5660300002)(83290400001)(83310400001)(86362001)(83320400001)(33440700001)(8936002)(478600001)(966005)(33656002)(66946007)(6506007)(7696005)(76116006)(66446008)(66476007)(64756008)(26005)(66556008)(110136005)(316002)(54906003)(71200400001)(4326008);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: kEQDNwiMD1eQgISeM7sEMo6Oao3qqqjUYL9GIT/qN/IdgRp/UT8yXyUvnIG7p8r20jG/DhgF1RgzQmPxtqH3NX4vV963V/OfM6uYpaT2teVUU9OBR0LthJ23Us8gNSd719mJ/rwBqeLM47Kg3HNIJi0v1hbKP4iF8xS/b21Mxfo6UfiM/yS5CHaoe4Afqw6IvpEXEyNZcfwUSrFYR0F0ZqWop+5RbOQ7FLPNgZkSzd/1hUwBQbNFRag9vV1wKEtzltXfF8bCikpiYC7wFY95hzQzpivNP2JqX5dN9z+b5Vn0m/kckLEGnMKc+an+oJaybGky8+JmkioKDBJkbcQOkEKxuaT34bU8vkIdgJcD7Qwbu65gw9HGKZ8qV3JgWM56jeo0uGMKeuEQ32/s5sy1lvYZuzmhRltf1+XRJGeN2I1D7HtWBANU5mhXLNOKAI4SNhXEOWvVlpAagi0AFabh1p9Z14ZWocO3PLxTUrFXlHg=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ad3d512-520c-4649-07dd-08d7f3473203
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 May 2020 11:59:00.1932 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mn9reyBq2wD5XE09HRe5ynZtx59+htwl7snSw/UioWumDAeo7OsuoR/VZhmR3OLpkiIn6itcMqwWCjDjUz9TQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0401MB2518
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
Cc: "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
 "a.zummo@towertech.it" <a.zummo@towertech.it>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Leo Li <leoyang.li@nxp.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

>=20
> Hi,
>=20
> On 08/05/2020 13:49:23+0800, Biwen Li wrote:
> > From: Biwen Li <biwen.li@nxp.com>
> >
> > Add uie_unsupported property to drop warning as follows:
> >     - $ hwclock.util-linux
> >       hwclock.util-liux: select() /dev/rtc0
> >       to wait for clock tick timed out
> >
> > My case:
> >     - RTC ds1374's INT pin is connected to VCC on T4240RDB,
> >       then the RTC cannot inform cpu about the alarm
> >       interrupt
> >
> > Signed-off-by: Biwen Li <biwen.li@nxp.com>
> > ---
> >  drivers/rtc/rtc-ds1374.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/drivers/rtc/rtc-ds1374.c b/drivers/rtc/rtc-ds1374.c index
> > 9c51a12cf70f..e530e887a17e 100644
> > --- a/drivers/rtc/rtc-ds1374.c
> > +++ b/drivers/rtc/rtc-ds1374.c
> > @@ -651,6 +651,10 @@ static int ds1374_probe(struct i2c_client *client,
> >  	if (ret)
> >  		return ret;
> >
> > +	if (of_property_read_bool(client->dev.of_node,
> > +						 "uie_unsupported"))
> > +		ds1374->rtc->uie_unsupported =3D true;
> > +
>=20
> This is not how this is supposed to work, either the RTC support uie or d=
on't, it is
> not board dependent and certainly doesn't require an
> (undocumented) DT property.
Okay, got it. Thanks.
>=20
> >  #ifdef CONFIG_RTC_DRV_DS1374_WDT
> >  	save_client =3D client;
> >  	ret =3D misc_register(&ds1374_miscdev);
> > --
> > 2.17.1
> >
>=20
> --
> Alexandre Belloni, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
