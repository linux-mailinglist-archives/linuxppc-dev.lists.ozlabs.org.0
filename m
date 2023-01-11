Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EE18666701
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Jan 2023 00:12:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Nsk3X2ddTz3cKm
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Jan 2023 10:12:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=UGykka3a;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com (client-ip=40.107.104.79; helo=eur03-dba-obe.outbound.protection.outlook.com; envelope-from=leoyang.li@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=UGykka3a;
	dkim-atps=neutral
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on2079.outbound.protection.outlook.com [40.107.104.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Nsk2T1ZDmz3fB9
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Jan 2023 10:11:27 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N3x8+ZRD/dj2Zxtfg8adkUymXAm+hVJ16ZvzPob6bzPifGDSNP1o9tKllQTFjjxs3NdAMwXhEC75fK0M996SuSq0k6eg5aZqXrGXY+eb1Nz69/yqzcSUMPxu49Gj3t+r/BMgBe8QpThUb57Ade/IVYV8YKxcbWJgfm8/RFdcnQw1LffAKPTWSL4GJQdVcbFnXnWVyUygMe/NZFx/r0xva7SX3yy57eodxc5kjhVqHtIMeASVxM0iKvx2SkMzZeCea8AMKiJNhQrrMd0GXSoxEPUyCmk6qBV8UugpX6ptf4KlkWwXtOyerL0SKDYdeUlCQqQXYeAsiEEM7o/gBTG0Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TQPITWpGfUQbxkcR4qtdoEaklY4vsCNvdFrrkr7s47s=;
 b=PaxwAk4YZo8VB2E7x7kKvQ2JYFrtjo+JR97F3WGxMzawOD4zgzaextVc8Pkg26iNWrDC8RhaDa2ZEavY/IllKvlTfjGK6paiWJpaQbv1r58z+ZoeXLcOHCKRs2o4QKx+cgpGAfBX8E+gawXGCJ85RIHQ6mLYZZUGvebDbaOzXqD8C2mNV4ULM+Eb15CUGrJ/lJ9O5VaaKFItstKNa83xZSNiF7LubjHxaMkGpjHm6LwNYZbX46RjenvvYExnorX+mbCnz9pxhD0j8B7/WjG1ncdmC4MWmirWeVYrfreEDrD5h3YCyHx1JIk4Pw1C02cyfjhf1dE+xWQYaBo7Cl8+Xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TQPITWpGfUQbxkcR4qtdoEaklY4vsCNvdFrrkr7s47s=;
 b=UGykka3azYxPRyCvC46c4Y4I25DKN/mqAuFXzjcfkYhTihzGycsvpv53OsgLvGwTi4mLObCiGTh3YdshFqObUIhkqtF/ARH9hHOA66NawJLd31DOSwoNh0La/NLhxlCKpAVzotJFvP4BTfzMwn5Oc/DjREL7mhWPKkeRZ+VxnJo=
Received: from AM0PR04MB6289.eurprd04.prod.outlook.com (2603:10a6:208:145::23)
 by DBAPR04MB7208.eurprd04.prod.outlook.com (2603:10a6:10:1a8::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Wed, 11 Jan
 2023 23:11:07 +0000
Received: from AM0PR04MB6289.eurprd04.prod.outlook.com
 ([fe80::398d:fc7c:d42c:643d]) by AM0PR04MB6289.eurprd04.prod.outlook.com
 ([fe80::398d:fc7c:d42c:643d%3]) with mapi id 15.20.6002.012; Wed, 11 Jan 2023
 23:11:07 +0000
From: Leo Li <leoyang.li@nxp.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Randy Dunlap
	<rdunlap@infradead.org>, Michael Ellerman <mpe@ellerman.id.au>, kernel test
 robot <lkp@intel.com>, Masahiro Yamada <masahiroy@kernel.org>
Subject: RE: usb.c:undefined reference to `qe_immr'
Thread-Topic: usb.c:undefined reference to `qe_immr'
Thread-Index: AQHZJNs3buVsdQuYikmMf6e4p0UXXK6Y1fcAgACMVoCAAD26gIAANZ7Q
Date: Wed, 11 Jan 2023 23:11:07 +0000
Message-ID:  <AM0PR04MB628964BC4188D6CD4DCF51688FFC9@AM0PR04MB6289.eurprd04.prod.outlook.com>
References: <202301101500.pillNv6R-lkp@intel.com>
 <a0e325d2-a9c5-ffca-b2d6-5eea60f9ad3b@infradead.org>
 <87lem9h64t.fsf@mpe.ellerman.id.au>
 <5d8e3316-54bb-40c4-a8a4-dd1b10d1e1a6@infradead.org>
 <1f3c83a3-95f3-771b-3d45-3e632e2116da@csgroup.eu>
In-Reply-To: <1f3c83a3-95f3-771b-3d45-3e632e2116da@csgroup.eu>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM0PR04MB6289:EE_|DBAPR04MB7208:EE_
x-ms-office365-filtering-correlation-id: eb8cef2d-dc66-4b9c-af0c-08daf4291ea8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  /HiOcQCavMUFEP/dAIyX57Vmdiewq3mCXx2z9pkm6BjLRABr5mA9eC7Fm9p33Fukan/QTvw5l2kGrVyZ0d+rCErR9605wKXUpG0dvoBw99rN0Z+gJQrbfl8pX1Ojbf4mD2KMD/6Sq4KtQWtUWR+jebRfflc13Tb/Ig2XM9gHT5tQnINTsXQncTnbA5/y7slUEFQJGCASvOsXCU5Z+5+No3IsUcJ53qk30Gyman+yqo+ozUEMR8HJALbd29DFVJxXzjhUVP/CQWO8v/tYSQnp2dLqA3cq3np54b+KNkBI/vMHN9dI8Vg5TvwjPEettdXXka7LSLnrPChur1Upov02LAP31LlmjkbhhUrtw/rl72kIh8/TfY7gtHzQXrNiz+3AODySWtz5lNg1KdYw6QPNy8UUfoFYPPJFHHkfRBw/M0rw+cz+qf1LCYMEbPRGu3tgUH3syJmv7CdzTnUzUZ/rihulAb0e6pzGC4Qe6+JvggAKqpU3ew40/ySta/Bzb0zaxHIPpcqayjtpYBk7zKZW8WH8RtrvKujCN8a8mI0OoxFgjPZuU+6ge8LfFGU+OEbJiuVlJHsX+qyhk7dlGI3sWh/WzBHRVPCY+fw+RT15+P5ReLYRanODR2JTYnxHAwB7qMh5ADjbIVKoPg1PxJixcHaWqgiUD6VIuKDnBcc+iRmMhEuaSOgIrE8qu1yrPkpcFAEY3mWZKO5alPz31pTxBLTrxroXO5ER7HR/IS3f35hDCVfLhG0uu2YFcYXBx30o
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB6289.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(396003)(39860400002)(136003)(346002)(366004)(451199015)(2906002)(66574015)(83380400001)(66446008)(66556008)(66476007)(64756008)(55016003)(66946007)(33656002)(5660300002)(9686003)(52536014)(8936002)(53546011)(122000001)(55236004)(26005)(186003)(6506007)(7696005)(478600001)(41300700001)(38100700002)(110136005)(8676002)(86362001)(54906003)(76116006)(966005)(38070700005)(316002)(4326008)(71200400001)(45080400002)(81973001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?iso-8859-1?Q?tphYneZg05s8o6Euc6NHXoTi/KXoqhDR6WlEZaowtpKCXxdOgwq3F4j8Pj?=
 =?iso-8859-1?Q?6KF1QugXXh7H2Zxih5180lg47HK6rpJM0Ia6TfkPR7JiiULUD7hTabZ1Ii?=
 =?iso-8859-1?Q?BHqk07vRfwS0kCITIbCuFmANYHhDnu2qDuPzjm8BXrF3cmiI5flrLq4QxL?=
 =?iso-8859-1?Q?bEqLV4GmrzdcqJsQIv0a5/MV7bEMgo2OEz1/t+77pOIsEQLfcIfRSF7w8A?=
 =?iso-8859-1?Q?TucxaLvdpBKJSVrDP/Mt9QQLXnMLi/L/5Xmemt4WGfZ6ODZTjggB9atQ68?=
 =?iso-8859-1?Q?IoHYDjBq92z1syDlK6IYHkE8bVezHTmFoKLz4njtJXoBde6K71n96Bo/V/?=
 =?iso-8859-1?Q?c30V2H+5dQrvFH7k60X1Da3NbfgNdw4WbNQmEF/XbPoSnVb/ZeHftUfHPY?=
 =?iso-8859-1?Q?l3EqWV79inruzSatBX+gGt2WQVIX8703lSdDStyF08qPcbAMbySJBITKL/?=
 =?iso-8859-1?Q?8DlanKOA2A3SS1ZY/45rA7SzgSl4CVDtKmi0Cq7OAKE7i7qaFiBJHqYG8B?=
 =?iso-8859-1?Q?82hukMX+S+wKKBYeaCP+zyymcK2vjZQeej2VKiJPENGZAnTsaLU9bPIAz5?=
 =?iso-8859-1?Q?6KSuNJK1uxy9o/OTiBe5mMmjfdOodP39rgkKVfabKDXmuc3Dpxl1OsRD1V?=
 =?iso-8859-1?Q?OyPtpm3Y8LuP6RytKxyUxo3c9Eb31Y3+Cd1EmjjyjPWIt+FRSLohwBnOKm?=
 =?iso-8859-1?Q?2CcyFpqoqry+VvFBpziJxRQREfYuvBObciaIbb7aYwGsfjexod/vLQrmOr?=
 =?iso-8859-1?Q?HKnHcJh74GQ2Y6GOYJEqnH27KEtBukaF7zzkBpqyMm3Zml2gO4/Z4/KJ6w?=
 =?iso-8859-1?Q?IRNwv0ADvwxTmnAMyhSLMgVh0B/RhkPmjXIf26J4wqSL/jQrxfgmjy4aFZ?=
 =?iso-8859-1?Q?ZO1s8i9Neh/iMg5zPZYgzsWaM6d/x8weO6HRIoDSaJ5L2uXEcjSjevDXU6?=
 =?iso-8859-1?Q?KGeKmDfPe8yxDAUIMNwqd91ibuUyGcA9+UwQTXr2YplzEewkfcyAB74Dd8?=
 =?iso-8859-1?Q?iEdFfcehDEm61BpkR05zXJWXHkz9Q91sCaDYyuG6uUd8DPwgpQzTf7XkCC?=
 =?iso-8859-1?Q?ePHd0XXNNOQ1jXcLP+vzZpB0IpzcloTaZ5oqGyUA6Qg2KrBpNh2kKv7yJe?=
 =?iso-8859-1?Q?xEwadGKI3gpSEauJqN4O/ddjF7glEXIuKwnOmBbKBnXKR7a+bWo6jdwdVw?=
 =?iso-8859-1?Q?a+Q76yq3TyEz+sbWtim6JiIZSydw93MWQdcxfs6zd14Oa031X+jDen2kPi?=
 =?iso-8859-1?Q?OT50XkVD1INIDzYZ3KyH8LOTvsRMP3EuDIcjZcUaKqNoZldXkf9pQ6Iydq?=
 =?iso-8859-1?Q?GGS5DkYvBAKe7ZOI3cZFfR+0YvmFlx3QEm6YPVSymsOKtAnhCs4cUW0me2?=
 =?iso-8859-1?Q?U+63NGRuTCvnQrdYc6U1rfNFsfb28TxpBberxchzdVnWd4UDyfo7Rrhjbz?=
 =?iso-8859-1?Q?hLxKINdUbNb8uOYVhxaMqBlkxW8lSDm/PsokW5nt7RTWU5kLSDnDrMXaI7?=
 =?iso-8859-1?Q?YviFhsGVAwTuBFSvVkuN7NfEIP1I418Pw3ln8/G1aR92GoSuqMkC/oRdqE?=
 =?iso-8859-1?Q?ZEDNWaDP4bm/ZAj8sscDPnFV8KbIlNiSAG8e7YRoDNp22fUifAEDP7n0c+?=
 =?iso-8859-1?Q?BzjAlC2oJeM1ufcOzv9pj67gHFcIWPSFKn?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB6289.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb8cef2d-dc66-4b9c-af0c-08daf4291ea8
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jan 2023 23:11:07.1398
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bZwKTrGAN5T2mcRudgXviW/GfwL88zblHPhkZUxG1ZS30SKDFAh4AwrPidkX2WyzLSAy+SzDtvBSxNqDa7ox8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7208
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
Cc: Qiang Zhao <qiang.zhao@nxp.com>, "oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Nicolas Schier <nicolas@fjasle.eu>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> -----Original Message-----
> From: Christophe Leroy <christophe.leroy@csgroup.eu>
> Sent: Wednesday, January 11, 2023 1:43 PM
> To: Randy Dunlap <rdunlap@infradead.org>; Michael Ellerman
> <mpe@ellerman.id.au>; kernel test robot <lkp@intel.com>; Masahiro
> Yamada <masahiroy@kernel.org>
> Cc: Nicolas Schier <nicolas@fjasle.eu>; linux-kernel@vger.kernel.org; Leo=
 Li
> <leoyang.li@nxp.com>; oe-kbuild-all@lists.linux.dev; linuxppc-dev
> <linuxppc-dev@lists.ozlabs.org>; Qiang Zhao <qiang.zhao@nxp.com>
> Subject: Re: usb.c:undefined reference to `qe_immr'
>=20
>=20
>=20
> Le 11/01/2023 =E0 17:01, Randy Dunlap a =E9crit=A0:
> >
> >
> > On 1/10/23 23:39, Michael Ellerman wrote:
> >> Randy Dunlap <rdunlap@infradead.org> writes:
> >>> [adding Cc's]
> >>>
> >>>
> >>> On 1/9/23 23:59, kernel test robot wrote:
> >>>> Hi Masahiro,
> >>>>
> >>>> FYI, the error/warning still remains.
> >>>>
> >>>> tree:
> https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgit.k=
e
> rnel.org%2Fpub%2Fscm%2Flinux%2Fkernel%2Fgit%2Ftorvalds%2Flinux.git&d
> ata=3D05%7C01%7Cleoyang.li%40nxp.com%7Cd7f37490b9ad42174b0408daf40c
> 0376%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C63809062972159
> 7124%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2lu
> MzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3Duv8%2
> BzM6uKMc9VPSXwH60Hi4V27pIKvv7BPzAFA3GOK8%3D&reserved=3D0 master
> >>>> head:   5a41237ad1d4b62008f93163af1d9b1da90729d8
> >>>> commit: 7b4537199a4a8480b8c3ba37a2d44765ce76cd9b kbuild: link
> symbol CRCs at final link, removing CONFIG_MODULE_REL_CRCS
> >>>> date:   8 months ago
> >>>> config: powerpc-randconfig-r026-20230110
> >>>> compiler: powerpc-linux-gcc (GCC) 12.1.0 reproduce (this is a W=3D1
> >>>> build):
> >>>>          wget
> https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fraw.g
> ithubusercontent.com%2Fintel%2Flkp-
> tests%2Fmaster%2Fsbin%2Fmake.cross&data=3D05%7C01%7Cleoyang.li%40nx
> p.com%7Cd7f37490b9ad42174b0408daf40c0376%7C686ea1d3bc2b4c6fa92cd9
> 9c5c301635%7C0%7C0%7C638090629721753373%7CUnknown%7CTWFpbGZs
> b3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn
> 0%3D%7C3000%7C%7C%7C&sdata=3DbZocY77aLRAMjD3F1ttgzm%2F2tW8JfhYf
> xq%2B6vxJh9Mc%3D&reserved=3D0 -O ~/bin/make.cross
> >>>>          chmod +x ~/bin/make.cross
> >>>>          #
> https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgit.k=
e
> rnel.org%2Fpub%2Fscm%2Flinux%2Fkernel%2Fgit%2Ftorvalds%2Flinux.git%2
> Fcommit%2F%3Fid%3D7b4537199a4a8480b8c3ba37a2d44765ce76cd9b&data=3D
> 05%7C01%7Cleoyang.li%40nxp.com%7Cd7f37490b9ad42174b0408daf40c0376
> %7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C638090629721753373
> %7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiL
> CJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3D%2F%2BX1fl
> KB1kjgv3wNK18Cu9uq6%2FUOr%2FCTjIsudBfiGho%3D&reserved=3D0
> >>>>          git remote add linus
> https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgit.k=
e
> rnel.org%2Fpub%2Fscm%2Flinux%2Fkernel%2Fgit%2Ftorvalds%2Flinux.git&d
> ata=3D05%7C01%7Cleoyang.li%40nxp.com%7Cd7f37490b9ad42174b0408daf40c
> 0376%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C63809062972175
> 3373%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2lu
> MzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3D%2BvI
> %2BGkvbol1aWLlg%2FAF12%2F44xZeN8U1c%2B0Y%2BvGCadt0%3D&reserve
> d=3D0
> >>>>          git fetch --no-tags linus master
> >>>>          git checkout 7b4537199a4a8480b8c3ba37a2d44765ce76cd9b
> >>>>          # save the config file
> >>>>          mkdir build_dir && cp config build_dir/.config
> >>>>          COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0
> make.cross W=3D1 O=3Dbuild_dir ARCH=3Dpowerpc olddefconfig
> >>>>          COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0
> >>>> make.cross W=3D1 O=3Dbuild_dir ARCH=3Dpowerpc SHELL=3D/bin/bash
> >>>>
> >>>> If you fix the issue, kindly add following tag where applicable
> >>>> | Reported-by: kernel test robot <lkp@intel.com>
> >>>>
> >>>> All errors (new ones prefixed by >>):
> >>>>
> >>>>     powerpc-linux-ld: powerpc-linux-ld: DWARF error: could not find
> abbrev number 74
> >>>>     drivers/soc/fsl/qe/usb.o: in function `qe_usb_clock_set':
> >>>>>> usb.c:(.text+0x1e): undefined reference to `qe_immr'
> >>>>>> powerpc-linux-ld: usb.c:(.text+0x2a): undefined reference to
> `qe_immr'
> >>>>>> powerpc-linux-ld: usb.c:(.text+0xbc): undefined reference to
> `qe_setbrg'
> >>>>>> powerpc-linux-ld: usb.c:(.text+0xca): undefined reference to
> `cmxgcr_lock'
> >>>>     powerpc-linux-ld: usb.c:(.text+0xce): undefined reference to
> `cmxgcr_lock'
> >>>>
> >>>
> >>> .config extract:
> >>>
> >>> #
> >>> # NXP/Freescale QorIQ SoC drivers
> >>> #
> >>> # CONFIG_QUICC_ENGINE is not set
> >>> CONFIG_QE_USB=3Dy
> >>>
> >>>
> >>> This is caused by (drivers/soc/fsl/qe/Kconfig):
> >>>
> >>> config QE_USB
> >>> 	bool
> >>> 	default y if USB_FSL_QE
> >>> 	help
> >>> 	  QE USB Controller support
> >>>
> >>> which does not depend on QUICC_ENGINE, where the latter build
> >>> provides the missing symbols.
> >>
> >> So QE_USB should depend on QUICC_ENGINE no?
> >
> > Yes, that would make sense, but I don't know enough about the
> > hardware. I.e., could CONFIG_PPC_EP88XC have QE_USB without having a
> > full QUICC_ENGINE?
> >
>=20
> Kconfig says:
>=20
> config PPC_EP88XC
> 	bool "Embedded Planet EP88xC (a.k.a. CWH-PPC-885XN-VE)"
> 	select CPM1
> 	help
> 	  This enables support for the Embedded Planet EP88xC board.
>=20
> 	  This board is also resold by Freescale as the QUICCStart
> 	  MPC885 Evaluation System and/or the CWH-PPC-885XN-VE.
>=20
>=20
> MPC885 has an USB controller, but I was not aware Linux had any USB drive=
r
> for the 885. Need to dig into history. Was initialy added by commit
> 3948f0e0c999 ("usb: add Freescale QE/CPM USB peripheral controller driver=
"),
> it explicitely says it should work on CPM.

The udc driver should work with CPM.  But that driver doesn't use the qe_us=
b_clock_set() defined in drivers/soc/fsl/qe/usb.c which seems only be neede=
d for QE as the clock setting for legacy platforms with CPM is normally don=
e in platform code.

I think it should be safe to make QE_USB depends on QUICC_ENGINE.

Regards,
Leo
