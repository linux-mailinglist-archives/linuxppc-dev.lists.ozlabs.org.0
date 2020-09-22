Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 33BDC27386F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Sep 2020 04:20:21 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BwQ4y3W9PzDqxZ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Sep 2020 12:20:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com
 (client-ip=40.107.15.81; helo=eur01-db5-obe.outbound.protection.outlook.com;
 envelope-from=ran.wang_1@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256
 header.s=selector2 header.b=K2EGS3eB; 
 dkim-atps=neutral
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr150081.outbound.protection.outlook.com [40.107.15.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BwQ2R4nyFzDqyS
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Sep 2020 12:18:07 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hfdon337qN1LzdJzJ6icHcDa4d8nnghr7SB53Bkizsohm4gBcjeTeD9g422vnYRwKxiYFKuGFtvGFbaSIEtq3P5B4EJTSMmNoKln7XjUspG6Tz+rocBE3dWcNW6ATKhM9pMEG3sQqQ3Xiu/kRb69+TySTmffqDlYuZzDgTI/Q1OK1YyJqB3nyM2Srk1Lcdu/2MhQUVDjvrU/4TobMGCfSA5dkd9nyrP2Ys9OQK4BhnYOKOw6DlNEttZXCFB6XCkolFVHix3ecKWFMeuIZy3sD0UV4lPYStAqgCP3xvlLf3UjdqF0l4brz/4MeDGB5oM8/uqocI/RrLFAqFeaQW0Wkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=//U7to1qxkUlfCEHmcGT5KDOeCzvunGLk1hWG8iG+gA=;
 b=SFaZhQFtvr4/KIiSIFtlkl+jkwHY85iGr9F/3aYBBf5JF1E77omtQTeF8MjhJK+AxmSSotpaRuhVOmc2zMRucYtgJ4XsOnacsNGWwWy7RupwihviIiJQ8XsBX6Z/GV1vFloPZypp+GRF677wo1YetllgD7LnFd3rtmYNSOhuOZAwYWiRIUjtAGp1o+tdPb8rfzu0h/QBjox4dT+KeCCVr9yaXutoCgFlkrZ+ZFUVFyo43uIR5QkZl4cm13TSF3Y3Em5IpQwgtBs525XRgNfLDlbNohBmpuJ+DA4tID0LIsVPzBYSlo0qghwA9IYkb0XAGOmPhGMH+eDbywdf8iL3cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=//U7to1qxkUlfCEHmcGT5KDOeCzvunGLk1hWG8iG+gA=;
 b=K2EGS3eBvaDA+M2yVFGsE8nLHlF86oy9ocxYCAUhT3dIXWnbzhqNtBF5ofD7imjzO7+M/noA3orj4gMgwAUfj8tZfxFSH/biVv2OCMwBik9L6Do1eJxp3rxNHjealracK/o4oEDJubf2Ps88yrqrjKwN4QPD58yVRQ6KjBCpJcE=
Received: from AM6PR04MB5413.eurprd04.prod.outlook.com (2603:10a6:20b:96::28)
 by AM6PR04MB4741.eurprd04.prod.outlook.com (2603:10a6:20b:3::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.15; Tue, 22 Sep
 2020 02:18:02 +0000
Received: from AM6PR04MB5413.eurprd04.prod.outlook.com
 ([fe80::1953:c81a:cca2:60ec]) by AM6PR04MB5413.eurprd04.prod.outlook.com
 ([fe80::1953:c81a:cca2:60ec%7]) with mapi id 15.20.3391.024; Tue, 22 Sep 2020
 02:18:02 +0000
From: Ran Wang <ran.wang_1@nxp.com>
To: Leo Li <leoyang.li@nxp.com>, Rob Herring <robh+dt@kernel.org>, Shawn Guo
 <shawnguo@kernel.org>
Subject: RE: [PATCH 3/5] arm: dts: ls1021a: fix that FlexTimer cannot wakeup
 system in deep sleep
Thread-Topic: [PATCH 3/5] arm: dts: ls1021a: fix that FlexTimer cannot wakeup
 system in deep sleep
Thread-Index: AQHWjAMij6l6UNKqG0ia1O6hSU1myalzvXwAgAA3ZsA=
Date: Tue, 22 Sep 2020 02:18:02 +0000
Message-ID: <AM6PR04MB5413910DCE903CF974573E93F13B0@AM6PR04MB5413.eurprd04.prod.outlook.com>
References: <20200916081831.24747-1-ran.wang_1@nxp.com>
 <20200916081831.24747-3-ran.wang_1@nxp.com>
 <VE1PR04MB6687F86E5F609DC77E050CEA8F3A0@VE1PR04MB6687.eurprd04.prod.outlook.com>
In-Reply-To: <VE1PR04MB6687F86E5F609DC77E050CEA8F3A0@VE1PR04MB6687.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: nxp.com; dkim=none (message not signed)
 header.d=none;nxp.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.73]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 92b9930d-3aea-4319-9a45-08d85e9dbb8e
x-ms-traffictypediagnostic: AM6PR04MB4741:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM6PR04MB4741C6B781ED77E39938F2D4F13B0@AM6PR04MB4741.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: J0Z5PyLSRtHQDYStqFtCmlF12frZwBclGkapeikEqXZRrmSqbjrmz+83XiWZ24CKZGrcd2CIkprjRcaOWAdS+8Py4LHtRGeYa2LeGQ0tl7kBBaZF3t7/la8XNusUvcanFTDX0fX0JCovxPCJaYTPzeKz3nvkIgRaTYzA9riWZ/t7KiFwZUbxskxuqL5M9JbjdDCEHbDFCiGvFGqo7v6NztAOIQzTSAea5EmbFBqOvkDa4xk4GWJ2jNvmyTXwt9odAOpBaWRFzrnGjPcnZUs8Q6qohiwzTBBXV0bAh0gLuuWNEkt6P21GtZxuTwbAkCcvUQKW2NU3do32S9ZfwGChtw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM6PR04MB5413.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(376002)(346002)(396003)(136003)(39850400004)(64756008)(316002)(66946007)(83380400001)(76116006)(66446008)(53546011)(6506007)(54906003)(66476007)(66556008)(33656002)(86362001)(8676002)(478600001)(2906002)(71200400001)(7696005)(4326008)(8936002)(52536014)(9686003)(186003)(26005)(55016002)(110136005)(5660300002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: LFo4jsUuYqma/WLy7FP3mBEkHnpZFBhAvHUgMPwAkbUJPN0y+AfSsK60YCb2vLyGCVvLIml65fqL6jWrrqD+8lSmzEZsSMEcxCIGr8J8M/9YPpKssiUJklypcpk8ftG5EVh0jvfljJDhUsRuaz6ZJZF9QphR2KGqX+G8BDpoOmP2taV9K1JqyRIjN3bnmBDALaNl293zbPz0O94fqvPjCZtKfFInO8wzhYlqADu8I609L+/DqnCSHd0yNXq7HN10gd8mSB1U4+nM7ua4UZ/HJbPsfoREAjKJbL0hxUraniujMAWeZKHuMDMS5ne9RlZYfezONI5Hm8Hdk7dsIzbzr0ZtFruHQbUcGHuocryWY9dFsh26YlK7pSOjg6XNjFKf6fFQgn8o/p0GW2995oHMGjfJi4o5EFvGcwUTSzsTt4UGbUH3aWi9RFDEY1sv3PBBGHW1AnReA9phWaS2JvMPTLKl0DJoa+3yDnmSEEqD3sgfZUiW7g0vCowxGnuPmRwpRo5nrgzXRvkGA+m98gosOooimDYBI7LKsYDsoKNYZbJPmOPii9szM5/OJWOsBsQMfKyTszVBHfPRCIQ1NU/dUFQBqydHR38X1VG1qZfc/0jMOvF8dwBEGEGgfphZkcDudJn+FFMUZSzoYvm+YPwd0g==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB5413.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92b9930d-3aea-4319-9a45-08d85e9dbb8e
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Sep 2020 02:18:02.1407 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZZYvP1xnV/J47uf4VHyNJCMR7oN2v8icIbkkB/P7nl5I/KlrsqVC0A/yF64LKe7L4WNMdNAZhmmHyuJOYvTYwQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4741
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Biwen Li <biwen.li@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Leo,

On Tuesday, September 22, 2020 6:59 AM, Leo Li wrote:
>=20
> > -----Original Message-----
> > From: Ran Wang <ran.wang_1@nxp.com>
> > Sent: Wednesday, September 16, 2020 3:18 AM
> > To: Leo Li <leoyang.li@nxp.com>; Rob Herring <robh+dt@kernel.org>;
> > Shawn Guo <shawnguo@kernel.org>
> > Cc: linuxppc-dev@lists.ozlabs.org;
> > linux-arm-kernel@lists.infradead.org;
> > devicetree@vger.kernel.org; linux-kernel@vger.kernel.org; Biwen Li
> > <biwen.li@nxp.com>; Ran Wang <ran.wang_1@nxp.com>
> > Subject: [PATCH 3/5] arm: dts: ls1021a: fix that FlexTimer cannot
> > wakeup system in deep sleep
>=20
> A better description should be enabling the A-008646 workaround to be
> consistent with other patches.

OK, will update this.

Regards,
Ran
> >
> > From: Biwen Li <biwen.li@nxp.com>
> >
> > The patch fixes a bug that FlexTimer cannot wakeup system in deep sleep=
.
> >
> > Signed-off-by: Biwen Li <biwen.li@nxp.com>
> > Signed-off-by: Ran Wang <ran.wang_1@nxp.com>
> > ---
> >  arch/arm/boot/dts/ls1021a.dtsi | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/arch/arm/boot/dts/ls1021a.dtsi
> > b/arch/arm/boot/dts/ls1021a.dtsi index 827373e..089fe86 100644
> > --- a/arch/arm/boot/dts/ls1021a.dtsi
> > +++ b/arch/arm/boot/dts/ls1021a.dtsi
> > @@ -1007,6 +1007,7 @@
> >  			compatible =3D "fsl,ls1021a-rcpm", "fsl,qoriq-rcpm- 2.1+";
> >  			reg =3D <0x0 0x1ee2140 0x0 0x8>;
> >  			#fsl,rcpm-wakeup-cells =3D <2>;
> > +			fsl,ippdexpcr1-alt-addr =3D <&scfg 0x51c>;
> >  		};
> >
> >  		ftm_alarm0: timer0@29d0000 {
> > --
> > 2.7.4

