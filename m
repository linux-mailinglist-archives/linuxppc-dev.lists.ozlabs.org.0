Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 544A36A2399
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Feb 2023 22:17:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PNjQX0sJNz3f3M
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Feb 2023 08:17:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=CxhVLKSB;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f400:7eaf::62d; helo=eur03-am7-obe.outbound.protection.outlook.com; envelope-from=leoyang.li@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=CxhVLKSB;
	dkim-atps=neutral
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2062d.outbound.protection.outlook.com [IPv6:2a01:111:f400:7eaf::62d])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PNjPW4N5Kz3bh2
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Feb 2023 08:16:29 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DnsnnC2c1KjttEGWeJB3bzXzN3AU8JLfbzNW8VyKCOT4v62wwW4Un9FKrQtb5s6EqJJ+b1lzDed/EH+A2Qy3+Hc3KQFsr7A6gr5wdUUUkSP1NzYIrC44IEn3L4Bebbmu7iNvWleDk3LBc+cGNDr3zTTMA9yXCmnB/9XK4g3OjT0qPlSTKy8xIoqLgP281enOVHJ9AUhywzEYBFH5y+JR+wpiNdzRZAxW6v9RL1dIln3Gh/jC2h0qx76Zjf4bGMoDPxZYUbnwE1nyKKCZXPlTt7MaqrvvTg6MKdLKkiBGXT0Y/cSAvKI719HEgU8SQ42sj/u++WDTzGM67x7bUgAVVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J0DyuhIyKbVNhGvDVVmfWzlYWQZs7CiCwKvZaTR5kEw=;
 b=mZCHfmspArakrIbVvuL5Shtc9RyHX3MXHWPEFlczz0heR6peb7e5k2k6GvDu+RGtzGbQpRoJWzNmc/4RreU2RYgslBddrERZotFsaGMV+CuqFx5qBzAV7xicr5PqbYnLf+3Qb3HPrRPGI3dxCMUDJf4WZWKiIHSLW3We9wNtStCO2wiYW+68WxfDXEE3Tz9BuwHbYNCt5/MFP8PzgcMFTKjWIxeuEMG5Krqfhs2BrIaqp0JNniTIwfiWHWtC0birT8d7EGUxNhY9kt4cKhacBXzKmUs1jGSsH+GL48h/DQ32zxDV0/3zpjjzORcfgwWNojEcPooGkM7HCC02v7ZIcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J0DyuhIyKbVNhGvDVVmfWzlYWQZs7CiCwKvZaTR5kEw=;
 b=CxhVLKSBo7HmcrquM2EeApuTSuhpfsDnJxOVE9+LF99GT6tnFd0ZLtFLhy117IaixyHLiaW7Jp5r5//hLS1Kp7uHfvPX68ivnnoUn1yIsVU5oaPRasMMTu5eERK5Ir7xxv9U4bSP+yKzAJKH1GuuA4oMf7kui+owjDjFSh3R7Qw=
Received: from AM0PR04MB6289.eurprd04.prod.outlook.com (2603:10a6:208:145::23)
 by AM8PR04MB7363.eurprd04.prod.outlook.com (2603:10a6:20b:1c7::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.25; Fri, 24 Feb
 2023 21:16:06 +0000
Received: from AM0PR04MB6289.eurprd04.prod.outlook.com
 ([fe80::509:96a2:4382:6b51]) by AM0PR04MB6289.eurprd04.prod.outlook.com
 ([fe80::509:96a2:4382:6b51%4]) with mapi id 15.20.6134.024; Fri, 24 Feb 2023
 21:16:05 +0000
From: Leo Li <leoyang.li@nxp.com>
To: Paul Gortmaker <paul.gortmaker@windriver.com>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Subject: RE: [RFC PATCH 0/4] Remove some e300/MPC83xx evaluation platforms
Thread-Topic: [RFC PATCH 0/4] Remove some e300/MPC83xx evaluation platforms
Thread-Index: AQHZRSLd3/nvLydEnkiHOk+Mz5gE667em6tw
Date: Fri, 24 Feb 2023 21:16:05 +0000
Message-ID:  <AM0PR04MB6289FA528F76DDADB2BB0F958FA89@AM0PR04MB6289.eurprd04.prod.outlook.com>
References: <20230220115913.25811-1-paul.gortmaker@windriver.com>
In-Reply-To: <20230220115913.25811-1-paul.gortmaker@windriver.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM0PR04MB6289:EE_|AM8PR04MB7363:EE_
x-ms-office365-filtering-correlation-id: d15b9fe1-baa7-47d8-ef9a-08db16ac572a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  82McTiJQkhWYZSd2ndU8fa/PN2nDQjwDbpc2kEOxoa+JQTFQDE0lsfL+d7P5+IXh6Ve3lPrqHIWm5AVc9NXPWvB8u5naMhwWZgPWz8FVqXAehi16+e1Ihislfc+0KXLErJIpWVeGNUD2MgAmDaENBRj4lTxmGKXixA1vjPuRwG0vXNkHUxTZ7voGVNUvhpfWDw8QRGJYuRKhrEnO26fhXM5BKtjp4k3rJeCKr7DIIkKwgsJo0xqzvk2s4ZfgvXCfKLT92ZhPiGldRNeC/6Pvzt2GeEoc5m2zBZs/xhmLRMZdACP3m6aq9Qbj8IQ/gTSkjvZyf5J53HNgwcgb2LozQXQByfn/1YdlerFlaTef4cltisTDda24NSCeM2TJBMFw2T/fRdxcwggHs+eAa8Lppjxej3QfzuEvfsR0mlTxAK3GwseDyMaL6MHUb93YnF4hWUlg1lK+KCqiFuvaV3DT8qlfJpHP59yDzKREskyAlgcJSDh8rJcF6wGrovCjRfuQ3QZy5RR1vetMgHMHnpYY59/ZbkrFZpnLEDEfaxFzECvWkboxtmLNoldVK2hgB5GufC7L25+9SXS+sZlSIQwFYM7/LnAT+9T6Fpd0f52jMvDxLtwEPfsRKzVG/Y05WMnhaU695KekfYYLFzvWsl1oyjCv6sVmCIHpPrm21zyadBhuyhpACC/feo0Sgn1KsfBM3soIgXIKNB8VFtVMZyPonQ==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB6289.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(346002)(136003)(39860400002)(376002)(396003)(366004)(451199018)(316002)(38070700005)(55236004)(53546011)(41300700001)(9686003)(186003)(26005)(33656002)(8936002)(52536014)(122000001)(5660300002)(966005)(54906003)(55016003)(6506007)(110136005)(66946007)(4326008)(8676002)(64756008)(76116006)(66446008)(66476007)(66556008)(71200400001)(7696005)(83380400001)(38100700002)(45080400002)(86362001)(478600001)(2906002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?us-ascii?Q?GoZwj1sc1e2Essp9/VJCl/Y4BhYG4RFSNljm960N9e+RBF/oZpApJqiFlAJy?=
 =?us-ascii?Q?IL5vzxUoZQGKpFs4bE4wiX4A6TCtr++2OI5sD0jNdX1hVXj4IlaiN+GT02Km?=
 =?us-ascii?Q?TsDR14nMBTLg7VwvaWz23yNK8OwACgIsnT6oA7E5u7gLzrZdUXB5iXpAQhYH?=
 =?us-ascii?Q?pjRPk9lizlOCpAJTDEtVgQrTwDR2yOUPevEt47e8/S3T4vu6pu1PEAx9B4KA?=
 =?us-ascii?Q?owsGi3Q5z6TbXm47cyZm/cIRJ7y6Swfpr6b3ij7o/sbkSAJOlkUkXXhShAf7?=
 =?us-ascii?Q?j44CsQfs95lVK+xeQmfNpZFttCZB5M3dm57EIdSlfi9zr4XeXX/1E0LgIhcI?=
 =?us-ascii?Q?TsxhnFyrY288vX8vwnauYmU4FlBqrEPMwxRlrwdUMsro8ol2X7VMcJSbOH/t?=
 =?us-ascii?Q?UmzuEfwCTNYCjAFA2xBGv7MYwzbvJs4vQJfQZyv6ksfmuR61jogWpviC4vat?=
 =?us-ascii?Q?KUZK5BkVe5rQswjVuiUjR99fEQUEFnP1HQrysFp0ZUT4c6l/HmIpaiWXD7cr?=
 =?us-ascii?Q?BpM+tfYPGuaHE2AWnmULWZTKBD40mcI/62dMpzv0YMKjDGguBKH9ynwnRjyx?=
 =?us-ascii?Q?QhLF37l+yNIUhlB4CaLizTpjGgwHKf9eFUCWKMAwwyrF8iy2oP0VSjreDLDT?=
 =?us-ascii?Q?tByQOdfpIE9hRlDqnBu4DFj9BvzZ8KkopLwTKuec5ZfLGSvBeS4Gekm19iYK?=
 =?us-ascii?Q?m0XVhn5I19RiEt0GTaO+NBLslKgCn7v/sUvgsI3ud44MMnsVAxYrRVbzOR8e?=
 =?us-ascii?Q?2S36fo/zV2O+gWWBUxs+BgegZkDuzWVIvaXiPyxPW4WJ9r1cbp6JVYgUZeaZ?=
 =?us-ascii?Q?UAAV6tP1dd7uMyiBKcbI3JLj9/GPG9MglJyAxlGUz6cxYOg7wCnQSxm1zNvt?=
 =?us-ascii?Q?Xj4FPfqOzGdDqlMi0645e+bTJfZiAnY6FSr+xMcYiSuR5g+HzG1tUScy/B7a?=
 =?us-ascii?Q?89uywybrhlBcEgDIBSv3z248I0bh4wOV+Sl9413e1TYBGHPvIJmZ20MbWdU1?=
 =?us-ascii?Q?oGGKghRNRI+6sZ0/FWQq5xDwZwHNQrVzO29WbWbcjEIhk0NImYm83tUhHF8x?=
 =?us-ascii?Q?lvMn4h8p7f5AP2WdiiI8SBak4jykpOYpgSytwIyOO02APYs8jEzOUABHQten?=
 =?us-ascii?Q?fZhU074tyjXJLnlv0ueom/qL7kzgJXtsK7tsoFKlCbbMcH6WIBOCfINVq+7E?=
 =?us-ascii?Q?rmKHmctRM6nV0hJshKV9bIDs058XbCkgC0ensQEw7X1lqoXIEL6iH31ZXffU?=
 =?us-ascii?Q?aIsxOiuYhwwWMjqFySfMC6yTGjKnr/OyDj59dhcw3zi2Es10VKzySmLVULB6?=
 =?us-ascii?Q?tLBeilOJg/uLF7dXpyprx7FiBwoiUaogPDrda3Jhrh1L3UUP1v5Px6t8m+hl?=
 =?us-ascii?Q?W63anbGiYbGvNT7axUsPW6ChbSKVc8EdmqfuKk8x2AJ9izuBx9w+iXrKuUz7?=
 =?us-ascii?Q?L+xK/K8JVQQegLwODp9+LuA115H46kZcRAJ9p5fNwTDptOUIWS3TZ4cyu3gn?=
 =?us-ascii?Q?nJeAINbdr3/r3L+RZcQ/8hYughJ1JSw+D5OVpEKD43peBNHrhQ+TrVRDKFKY?=
 =?us-ascii?Q?Ackwgu//1oZym9yvLCruVBhmFOn0NGhUKVzi1jMI?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB6289.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d15b9fe1-baa7-47d8-ef9a-08db16ac572a
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Feb 2023 21:16:05.5362
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: n+RfmVgq8wCzokMcl8koj8qUtPZEPY6oHpGIpqR7FrpaAz9UfB5VVH5+GyJHOEnzqjQf8mEjiezgHvqlZgwmuQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7363
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
Cc: Scott Wood <oss@buserror.net>, Claudiu Manoil <claudiu.manoil@nxp.com>, Paul Mackerras <paulus@samba.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> -----Original Message-----
> From: Paul Gortmaker <paul.gortmaker@windriver.com>
> Sent: Monday, February 20, 2023 5:59 AM
> To: linuxppc-dev@lists.ozlabs.org
> Cc: Leo Li <leoyang.li@nxp.com>; Claudiu Manoil <claudiu.manoil@nxp.com>;
> Paul Gortmaker <paul.gortmaker@windriver.com>; Scott Wood
> <oss@buserror.net>; Michael Ellerman <mpe@ellerman.id.au>; Benjamin
> Herrenschmidt <benh@kernel.crashing.org>; Paul Mackerras
> <paulus@samba.org>
> Subject: [RFC PATCH 0/4] Remove some e300/MPC83xx evaluation platforms
>=20
> [This RFC is proposed for v6.4 and hence is based off linux-next.]
>=20
> This series removes support for four e300 (MPC83xx) Freescale processor
> family evaluation boards that were added to the kernel in the 2006 era.

Hi Paul,

I talked with our marketing team on this.  Although we do not recommend any=
 new design with these SoCs, they are still being shipped in large amount t=
o customers now.  Plus it is possible for the bigger amount of existing dev=
ices to be updating their software that includes a new kernel.  So we shoul=
d definitely keep all the common SoC code that might be needed to support t=
heir own design.

>=20
> These boards were all of a very similar form factor, a largish PCI or PCI=
-X card
> that could also be used standalone with an external power brick, and all
> shared the Modular Development System (MDS) designation.
>=20
> These platforms were made in limited quantity and were generally designed
> to get early silicon into the hands of OEMs who would later develop their
> own boards/platforms.  As such, availability was limited to those who wou=
ld
> be working on boards and/or BSP support.
>=20
> Many early revision MDS platforms used a mechanical clamping system to
> hold the BGA CPU in place to facilitate CPU updates -- something not
> normally possible for a soldered down BGA in a COTS system.
>=20
> The point of these details is to give context that reflects that these fo=
ur
> boards were made in limited quantities, were not in a form factor that is
> really "hobbyist" friendly and hence make sense for removal 17 years late=
r.

We would agree with you that the MDS platforms are only used by a limited n=
umber of customers for evaluation purpose, so it should be fine to be remov=
ed.  So for this series:

Acked-by: Li Yang <leoyang.li@nxp.com>

>=20
> Here, we remove the MPC8548E-MDS[1], the MPC8360E-MDS[2], the
> MPC837xE-MDS[3], and the MPC832x-MDS[4] board support from the kernel.
>=20
> There will still exist several e300 Freescale Reference Design System (RD=
S)
> boards[5] and mini-ITX boards[6] with support in the kernel.  While these
> were more of a COTS "ready to deploy" design more suited to hobbyists, it
> probably makes sense to consider removing these as well, based on age.

These boards are mass market boards that sold in larger amount and are much=
 more likely to still be used.  We would suggest we keep them for now.

>=20
> But before we get to that, lets see how this goes -- and then we should l=
ook
> at similar early e500 evaluation platforms [MPC8540-ADS, etc] next, as th=
e
> oldest there date back to 2002[7] -- before considering RDB/mITX.
>=20
> I intentionally didn't put any links in the commits, since as we all know=
, they
> tend not to be stable long term, so keep them here in the merge data.
> Credit to NXP for keeping around these old legacy docs this long!
>=20
> Paul.
>=20
> --
>=20
> [1]
> https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fwww
> .nxp.com%2Fdesign%2Fqoriq-developer-resources%2Fmpc8349e-modular-
> development-
> system%3AMPC8349EMDS&data=3D05%7C01%7Cleoyang.li%40nxp.com%7Ca2
> 820c1e442640c5a39108db1339fd9f%7C686ea1d3bc2b4c6fa92cd99c5c301635%
> 7C0%7C1%7C638124912025220501%7CUnknown%7CTWFpbGZsb3d8eyJWIjoi
> MC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C300
> 0%7C%7C%7C&sdata=3DQ4COgwpjsE4mHXvl9HdGo3otPCYML3z%2FR6IoCEYRE
> wg%3D&reserved=3D0
> [2]
> https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fwww
> .nxp.com%2Fdocs%2Fen%2Fuser-
> guide%2FMPC8360EMDSUM.pdf&data=3D05%7C01%7Cleoyang.li%40nxp.com
> %7Ca2820c1e442640c5a39108db1339fd9f%7C686ea1d3bc2b4c6fa92cd99c5c30
> 1635%7C0%7C1%7C638124912025220501%7CUnknown%7CTWFpbGZsb3d8ey
> JWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%
> 7C3000%7C%7C%7C&sdata=3DJyLT0MfGAHQ8a%2FNgpLdVFtyACkwPR%2FOkB
> yN1aW0wySs%3D&reserved=3D0
> [3]
> https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fwww
> .nxp.com%2Fproducts%2Fprocessors-and-microcontrollers%2Flegacy-mpu-
> mcus%2Fpowerquicc-processors%2Fpowerquicc-iii-mpc85xx%2Fmpc837xe-
> modular-development-
> system%3AMPC837XEMDS&data=3D05%7C01%7Cleoyang.li%40nxp.com%7Ca2
> 820c1e442640c5a39108db1339fd9f%7C686ea1d3bc2b4c6fa92cd99c5c301635%
> 7C0%7C1%7C638124912025220501%7CUnknown%7CTWFpbGZsb3d8eyJWIjoi
> MC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C300
> 0%7C%7C%7C&sdata=3D052dpEEcGmbuhRLnMDCNoOkTeguF%2BPA0oJGNvV1
> jSjI%3D&reserved=3D0
> [4]
> https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fwww
> .nxp.com%2Fproducts%2Fprocessors-and-microcontrollers%2Flegacy-mpu-
> mcus%2Fpowerquicc-processors%2Fpowerquicc-ii-pro-mpc83xx%2Flow-
> power-powerquicc-ii-pro-processor-with-ddr2-tdm-pci-security-usb-quicc-
> engine-with-
> utopia%3AMPC8323E&data=3D05%7C01%7Cleoyang.li%40nxp.com%7Ca2820c1
> e442640c5a39108db1339fd9f%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%
> 7C1%7C638124912025220501%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4
> wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7
> C%7C%7C&sdata=3DmZQh%2FogNgNUb0wNJV972kYIDvn61gx0TWNd1u1d7PZ
> Q%3D&reserved=3D0
> [5]
> https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fwww
> .nxp.com%2Fdocs%2Fen%2Ffact-
> sheet%2FMPC8379ERDBFS.pdf&data=3D05%7C01%7Cleoyang.li%40nxp.com%7
> Ca2820c1e442640c5a39108db1339fd9f%7C686ea1d3bc2b4c6fa92cd99c5c3016
> 35%7C0%7C1%7C638124912025220501%7CUnknown%7CTWFpbGZsb3d8eyJ
> WIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%
> 7C3000%7C%7C%7C&sdata=3DEJmP6Regr7zpvYvHUmX64h3LZSaBT3Mb1h%2BN
> KQT%2FUls%3D&reserved=3D0
> [6]
> https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fwww
> .digikey.ca%2Fen%2Fproducts%2Fdetail%2Fnxp-usa-inc%2FMPC8349E-MITX-
> GP%2F1204733&data=3D05%7C01%7Cleoyang.li%40nxp.com%7Ca2820c1e44264
> 0c5a39108db1339fd9f%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C1%7
> C638124912025220501%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAw
> MDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%
> 7C&sdata=3Dhw6IQDUaXH6huQFCnCkFIbNfj1xMrq%2FanDMUU%2FXZYQg%3
> D&reserved=3D0
> [7]
> https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fwww
> .nxp.com%2Fdocs%2Fen%2Freference-
> manual%2FMPC8560ADSUG.pdf&data=3D05%7C01%7Cleoyang.li%40nxp.com%
> 7Ca2820c1e442640c5a39108db1339fd9f%7C686ea1d3bc2b4c6fa92cd99c5c301
> 635%7C0%7C1%7C638124912025220501%7CUnknown%7CTWFpbGZsb3d8eyJ
> WIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%
> 7C3000%7C%7C%7C&sdata=3DEd%2BZR07y9Sp8xx5H47SAXzk9ET73creygxk%2B
> emmbfuA%3D&reserved=3D0
>=20
> Cc: Scott Wood <oss@buserror.net>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> Cc: Paul Mackerras <paulus@samba.org>
> Cc: Li Yang <leoyang.li@nxp.com>
> Cc: Claudiu Manoil <claudiu.manoil@nxp.com>
>=20
> ---
>=20
> Paul Gortmaker (4):
>   powerpc: drop MPC834x_MDS platform support
>   powerpc: drop MPC836x_MDS platform support
>   powerpc: drop MPC837x_MDS platform support
>   powerpc: drop MPC832x_MDS platform support
>=20
>  arch/powerpc/boot/Makefile                    |   1 -
>  arch/powerpc/boot/dts/mpc832x_mds.dts         | 436 ---------------
>  arch/powerpc/boot/dts/mpc834x_mds.dts         | 403 --------------
>  arch/powerpc/boot/dts/mpc836x_mds.dts         | 481 -----------------
>  arch/powerpc/boot/dts/mpc8377_mds.dts         | 505 ------------------
>  arch/powerpc/boot/dts/mpc8378_mds.dts         | 489 -----------------
>  arch/powerpc/boot/dts/mpc8379_mds.dts         | 455 ----------------
>  .../configs/83xx/mpc832x_mds_defconfig        |  59 --
>  .../configs/83xx/mpc834x_mds_defconfig        |  58 --
>  .../configs/83xx/mpc836x_mds_defconfig        |  64 ---
>  .../configs/83xx/mpc837x_mds_defconfig        |  58 --
>  arch/powerpc/configs/mpc83xx_defconfig        |   4 -
>  arch/powerpc/configs/ppc6xx_defconfig         |   4 -
>  arch/powerpc/platforms/83xx/Kconfig           |  32 --
>  arch/powerpc/platforms/83xx/Makefile          |   4 -
>  arch/powerpc/platforms/83xx/mpc832x_mds.c     | 110 ----
>  arch/powerpc/platforms/83xx/mpc834x_mds.c     | 101 ----
>  arch/powerpc/platforms/83xx/mpc836x_mds.c     | 210 --------
>  arch/powerpc/platforms/83xx/mpc837x_mds.c     | 103 ----
>  19 files changed, 3577 deletions(-)
>  delete mode 100644 arch/powerpc/boot/dts/mpc832x_mds.dts
>  delete mode 100644 arch/powerpc/boot/dts/mpc834x_mds.dts
>  delete mode 100644 arch/powerpc/boot/dts/mpc836x_mds.dts
>  delete mode 100644 arch/powerpc/boot/dts/mpc8377_mds.dts
>  delete mode 100644 arch/powerpc/boot/dts/mpc8378_mds.dts
>  delete mode 100644 arch/powerpc/boot/dts/mpc8379_mds.dts
>  delete mode 100644 arch/powerpc/configs/83xx/mpc832x_mds_defconfig
>  delete mode 100644 arch/powerpc/configs/83xx/mpc834x_mds_defconfig
>  delete mode 100644 arch/powerpc/configs/83xx/mpc836x_mds_defconfig
>  delete mode 100644 arch/powerpc/configs/83xx/mpc837x_mds_defconfig
>  delete mode 100644 arch/powerpc/platforms/83xx/mpc832x_mds.c
>  delete mode 100644 arch/powerpc/platforms/83xx/mpc834x_mds.c
>  delete mode 100644 arch/powerpc/platforms/83xx/mpc836x_mds.c
>  delete mode 100644 arch/powerpc/platforms/83xx/mpc837x_mds.c
>=20
> --
> 2.17.1

