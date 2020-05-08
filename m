Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 975A71CAA3A
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 May 2020 14:04:36 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49JTXK1Y1TzDr0y
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 May 2020 22:04:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=oss.nxp.com (client-ip=40.107.4.57;
 helo=eur03-db5-obe.outbound.protection.outlook.com;
 envelope-from=biwen.li@oss.nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-NXP1-onmicrosoft-com header.b=DYpOCoHZ;
 dkim-atps=neutral
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr40057.outbound.protection.outlook.com [40.107.4.57])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49JTQs4XxLzDqsM
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 May 2020 21:59:49 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hjYPb0anFLwpofFGOKO6YJCNsBdSlRehxPRcse7OK6Rhu83KcrMdF3UPDJVp+F6W2RGTQlx1dssqh4O4+CXyioTKrnYMOjEBcmftR0DCIv6PjfTZedefl/Xty/BnqlY5kRKBlso1XnB/SXalM4G/HDSHnlHzO/NXjNWNNTQLHzBFRCxJm6/KLsnYFYM8StwH7ywLuZThh98cPcVbySj8ALvGFQmDIy9Us69jLe3KrAToFEbjw6Oyh2S2GTg0nD8YcXWPDvThNVdpGtwUHn3MYAwsWOW9PTVWoefbVk31UTRPXzav0X0umoWtqau/6lfZQ+LaLkNVxmEFiosIAOtoFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+UBV7XO3/IvXxF4gjbUYi6wqHF6vtOJ2AG/54gtWA3Y=;
 b=dDbohGc3+i4X+XZt9IitjGjpH0QC7kbBQEIjvRiqim5/EEQjj2wuTZc1U2gelKUsDB+MSbxHOEU4SSkry7V8lbUsTNolP9b/MmKAkt+Y+ijDjdi6EqNz9EjPNQ8ksI5RHQQgWYFn2D4V0YjDHygTWXQZ+isYehd5AUTQBc5h3i2AQVLouiNNt7ndZVu1gEKBIfqyimHzqwIwJSenK3G+kFub15F6BJ//3V11X5HXQgzeuOqljZs/ZNT3UII6zBlmG3klA62EU7hxdomTnhOmcM/xEpg07jESMhxMRjG3BHPO1e/s0tKsYtLJYgGe1YvkP+4HKlUco+q4dK26Z7lh0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+UBV7XO3/IvXxF4gjbUYi6wqHF6vtOJ2AG/54gtWA3Y=;
 b=DYpOCoHZhXbz2ilPubpV6vYpGc5vUxl6gLdek5nxXHSE9lEWCwPyglaR8XjAaxszNE3k6+jI5M7KVyjUNohesYxiZbmCgcZJ383o1mVbiTyQr9/74sN1nDm6TXnWAfp8yhuI9EYoA6vT6qno1cTw2U9liBsZrRqKOfx/h/6G1lU=
Received: from DB6PR0401MB2438.eurprd04.prod.outlook.com (2603:10a6:4:33::14)
 by DB6PR0401MB2518.eurprd04.prod.outlook.com (2603:10a6:4:36::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.27; Fri, 8 May
 2020 11:59:43 +0000
Received: from DB6PR0401MB2438.eurprd04.prod.outlook.com
 ([fe80::444:b05a:a5:5710]) by DB6PR0401MB2438.eurprd04.prod.outlook.com
 ([fe80::444:b05a:a5:5710%9]) with mapi id 15.20.2958.035; Fri, 8 May 2020
 11:59:43 +0000
From: "Biwen Li (OSS)" <biwen.li@oss.nxp.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, "Biwen Li (OSS)"
 <biwen.li@oss.nxp.com>
Subject: RE: [PATCH 2/3] dts: ppc: t4240rdb: add uie_unsupported property to
 drop warning
Thread-Topic: [PATCH 2/3] dts: ppc: t4240rdb: add uie_unsupported property to
 drop warning
Thread-Index: AQHWJTApGzOZVK/3qUmR8Dfb1zRWHw==
Date: Fri, 8 May 2020 11:59:43 +0000
Message-ID: <DB6PR0401MB2438A53873ABE34EFA0BB9498FA20@DB6PR0401MB2438.eurprd04.prod.outlook.com>
References: <20200508054925.48237-1-biwen.li@oss.nxp.com>
 <20200508054925.48237-2-biwen.li@oss.nxp.com>
 <20200508115052.GL34497@piout.net>
In-Reply-To: <20200508115052.GL34497@piout.net>
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
x-ms-office365-filtering-correlation-id: 355f6f90-954a-4f89-1ca8-08d7f3474bfd
x-ms-traffictypediagnostic: DB6PR0401MB2518:|DB6PR0401MB2518:
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB6PR0401MB251862E78A3D95F49E98E440CEA20@DB6PR0401MB2518.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 039735BC4E
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /fi7rBbWOkuNU2jSZ0y3Ji/4eBnhTOjZJN2A03vj9ebVhfKXH0OFhrmMZHsg/vWGNY9SKum0tMH2whB0K809HrPGJwf9utcVjnktCG3pkCufOOHK8GAygs+RRGUYemLoeT/ONqCFOxBm/nzqInONbY3sWakymIz+RBKbt9g1HK2VyZnzP/oMetBZjmudEQHzYyRxGHMOTr9kT7mTwmCU59Bu/3ieiAMCm+UVmfTi+tPcbQNdQCZUWURWoVAzg26gWQQWFnTMSKHgeGgelHKkesp/yJVXjgwHThWeSULI8mi937ivNpRaiJSkovk8cou53AikNe6qRWzuEGEug1DW7lDrbBkiQxjlBwLr147j0EjOhyHIeAzMfZkW6tZXmditImtoOJQQhEd15k7eE/hJJd9KkKG9wWXre1P0aaKL/qVhUhMJqIBO1Ld+kQsIOfaMDYB/yMlCWORn4kDxT7DMA/u/RdDX6uxNp+/NfMjWNmOHwUx453R9aeC3ShJjmzo8iF0kazZcPa6vX1g2JZpNzi2+DQfXAH35PkEZmdFfYXITeQ0gHngxyrqEQnHnReL/U0KIZu7hz0EYNAjrpQfHkxVdBKuiaygPLePQzsSPi9Y=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB6PR0401MB2438.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(396003)(376002)(346002)(366004)(136003)(39860400002)(33430700001)(186003)(52536014)(2906002)(9686003)(55016002)(83280400001)(8676002)(83300400001)(5660300002)(83290400001)(83310400001)(86362001)(83320400001)(33440700001)(8936002)(478600001)(966005)(33656002)(66946007)(6506007)(7696005)(76116006)(66446008)(66476007)(64756008)(26005)(66556008)(110136005)(316002)(54906003)(71200400001)(4326008);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: IHMX9G0POAMuG+RSCR3mdjkKabPazeqxZxHeuk5fkdxrEE0nYCRV7+zZFsqzdkO36yeTOuLYBJoYm7UJXt9KWyNMDIdFBByH54+7DDMkN884LMI3hVe08I5u1m7vXCmr/dV43qiPwyXlt+RJCvQCAAP/jVm1xKN+kor5vkdtEwv5M+Vg7eQYGr8lUNXpT4kGzowDYvco0tnrWEYIrYravfMDzUal7Q9jvO0jEb45kwLUAgnNYOENNA/5DE36ZR8PmF6TODEERyrdIO9DD1NkjxfgTat5JHKohGdlXydgGNiW+pjvy+FlRW0ddWN4MNPd2Dk38z2WguooxhQKqMCIISsMSdOC4bc4hon2ka5ckuhKS6NHGMXFGUt9diS9Vs3looU/IXHqxiT2SajGpDK003N5BQU2GbQav6dklMHOwv2h4cxhjEc6P4c5RPn9HIaTNxpSRKO0VbzpO9fcK6K6Q+1grlPi1q2p9+rPcnJ9qXc=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 355f6f90-954a-4f89-1ca8-08d7f3474bfd
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 May 2020 11:59:43.8131 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PANhxx5xRj3UYhTzU2IRszibzdlJH8rDmFj8pn8rJW9IFq5YIc+wiP6HEjOt2ufixzAafpHbu8A0x1BWohUQHw==
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
> On 08/05/2020 13:49:24+0800, Biwen Li wrote:
> > From: Biwen Li <biwen.li@nxp.com>
> >
> > This adds uie_unsupported property to drop warning as follows:
> >     - $ hwclock.util-linux
> >       hwclock.util-linux: select() to /dev/rtc0
> >       to wait for clock tick timed out
> >
> > My case:
> >     - RTC ds1374's INT pin is connected to VCC on T4240RDB,
> >       then the RTC cannot inform cpu about the alarm interrupt
> >
> > Signed-off-by: Biwen Li <biwen.li@nxp.com>
> > ---
> >  arch/powerpc/boot/dts/fsl/t4240rdb.dts | 6 +++++-
> >  1 file changed, 5 insertions(+), 1 deletion(-)
> >
> > diff --git a/arch/powerpc/boot/dts/fsl/t4240rdb.dts
> b/arch/powerpc/boot/dts/fsl/t4240rdb.dts
> > index a56a705d41f7..ccdd10202e56 100644
> > --- a/arch/powerpc/boot/dts/fsl/t4240rdb.dts
> > +++ b/arch/powerpc/boot/dts/fsl/t4240rdb.dts
> > @@ -144,7 +144,11 @@
> >  			rtc@68 {
> >  				compatible =3D "dallas,ds1374";
> >  				reg =3D <0x68>;
> > -				interrupts =3D <0x1 0x1 0 0>;
>=20
> removing the interrupt should be enough to solve your issue
Okay, got it. Thanks.
>=20
> > +				// The ds1374's INT pin isn't
> > +				// connected to cpu's INT pin,
> > +				// so the rtc cannot synchronize
> > +				// clock tick per second.
> > +				uie_unsupported;
> >  			};
> >  		};
> >
> > --
> > 2.17.1
> >
>=20
> --
> Alexandre Belloni, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
