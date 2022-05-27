Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 85A55535AC9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 May 2022 09:57:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L8cbz1qJlz3blS
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 May 2022 17:57:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.a=rsa-sha256 header.s=selector1 header.b=Dlcy0y3v;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bp.renesas.com (client-ip=2a01:111:f403:700c::726; helo=jpn01-os0-obe.outbound.protection.outlook.com; envelope-from=prabhakar.mahadev-lad.rj@bp.renesas.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.a=rsa-sha256 header.s=selector1 header.b=Dlcy0y3v;
	dkim-atps=neutral
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on20726.outbound.protection.outlook.com [IPv6:2a01:111:f403:700c::726])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4L8cbB0lMKz2x9p
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 May 2022 17:57:06 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ixqvk7FhB4vQUu7RIgbcJ/Qab23Q4HsBknF6m3r0q4bZVrMc4tpDFDJYE7Zyq7a74PpP2fdrPfdfqUi94uVIuV7OT63rUvaa922GtJEfQPm0aYgKk+cZpZVR/EAmWkdJGqIm+Yb58M4QfCRjQ+pRjAdP3uLivSdvTyMZmhPYtEZcRhhY4iJFC48VmKV2ttpUFjaFlr4E2mKY3Rz+qG20erL7p7ivebCXwnI2wesn2fWbXMXvEdd4A4EvOZroKMP7DyagN7X+oEKpnTAbp0bBmzpU4pUHCGoUjZ8CUcIUmV7LncEPOTfG4qLcX7HZO/YDehAkdNkJl1tWerKaq8I0+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZJLOdtARl2//J2Vq+PVQlmL9MPRZhkIg+WNUV7i7Gug=;
 b=OBkoEJDJrbLftxOvQar6Vx8Zmfq6vU6zZzlg27pRqJQcZ1owppnd4NjXxLTtb/VKlv0Fphb8d/TcH9GfgQHNbJ8PjS8ZcMEuT4+2wSJxnoB2xI6w8CvVzASQFOU/D/vUHcqvyD1JZtbYkIXXsvp+WuTuM1tyzlE76Bf65puNxY5NdUH4BkK3Kw71SfDvtRriYyI7jZXr1O0vDRqS8IqQZ3dnJSxGkFE++BvbFaZkFZTKsSW+ThU/7bSeIJ6fA3T6YlcO+STKs4dKKL0SvnKtfO0uiF8TNtfCrvnbrybs0fcxPsKtcllcHvy6FPGvMPoRmkDNrQ+7VBXPfbmpqvlmig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZJLOdtARl2//J2Vq+PVQlmL9MPRZhkIg+WNUV7i7Gug=;
 b=Dlcy0y3vzAWdhUA19oPMW8ZqIX9af0pRmerBbFkz40LA7zu7E/Q6vfMWajaP0K6F5/sgAk9d3VVBHclw35DAXWTd1q+gG/B0Dr8+ZLsrbqQu4kbq3YjF1Ij53FsLGscblqHmRRgzt4f2CkyXMkRER6w5NgG/PhUl+LZvh4SymJI=
Received: from OSZPR01MB7019.jpnprd01.prod.outlook.com (2603:1096:604:13c::8)
 by OSZPR01MB6551.jpnprd01.prod.outlook.com (2603:1096:604:fb::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13; Fri, 27 May
 2022 07:56:46 +0000
Received: from OSZPR01MB7019.jpnprd01.prod.outlook.com
 ([fe80::d40b:1321:7bd3:34b0]) by OSZPR01MB7019.jpnprd01.prod.outlook.com
 ([fe80::d40b:1321:7bd3:34b0%7]) with mapi id 15.20.5293.013; Fri, 27 May 2022
 07:56:46 +0000
From: Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Christian Zigotzky
	<chzigotzky@xenosoft.de>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>
Subject: RE: [FSL P50x0] Keyboard and mouse don't work anymore after the
 devicetree updates for 5.19
Thread-Topic: [FSL P50x0] Keyboard and mouse don't work anymore after the
 devicetree updates for 5.19
Thread-Index: AQHYcSj+9qLJZNI0xk+8W6rmCSktpq0yUuSAgAAIiQA=
Date: Fri, 27 May 2022 07:56:46 +0000
Message-ID:  <OSZPR01MB7019C5EC6E5CF5230600B283AAD89@OSZPR01MB7019.jpnprd01.prod.outlook.com>
References: <283c811b-27f7-64a8-8a67-11cf6c3a79cf@xenosoft.de>
 <2e1b72bd-ae44-19d1-5981-09f5c69759dc@csgroup.eu>
In-Reply-To: <2e1b72bd-ae44-19d1-5981-09f5c69759dc@csgroup.eu>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f337b5d6-9c9a-4017-1249-08da3fb67290
x-ms-traffictypediagnostic: OSZPR01MB6551:EE_
x-microsoft-antispam-prvs:  <OSZPR01MB65513BC8CA72BDDD4DD418E5AAD89@OSZPR01MB6551.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  OVUSvHQE37wUbtoh8yACyQt8Jx94exQ+qMBEM93X0eO1rFfi+60rQr69APAAsPpceN6mOsXYxqeuW1h4ldbq+XsH0VQ7taE8Hb09k0sTFg7ff8trEo/HJhQaFYg//Nfkzbvl7AGRjZTpRiZG+CP/5kSBeFK9bG61N1WaTxFe+AqjJN2WRnGsu378t4natMFIkRegiU0zmo1IQRGp95srIHUZ+Gd4h++RLrOVcNMoMSdCr3ZdXzj2/kx+P/kFS86jT5T2+Y4VrMr4vsaEcdiBLa+ROE8ZQ+ghRLepYOqsyAqnvbav1pTtXuTiZ3ZOOIsn5Y5Tn7AfCsii4f97c0N0sRBHh9LEOhsYhoqvAquSBTF4tb4P41qNZr736MusjaT4e6K5tSn4wFyzsf13rkK+NBkVBK5bIUnOLKTdnZTilhyoOVwoCTlkWojFCmqsQU+zmMePCqit2FLkoD96hB/tXQ63UNiYH/4zIrK1xtBR0HeKKnGxsB+FMuGgsnTvF3lOrLrjWKjMpHbbWaeC8WtRZeYulphEYHMPzGGcBiqN/1Tn/OJ33Hl2V1avaDR9j+lQHOrAmG1FqVENeth6MnKZNvCwgijhdnEgs77+xV+T2XyjbsulbQ5PkGGS24BCSbPsWy1OMl7jvOBP+lLyaYLMzjX3+PwAssHOe6W8bD9H6JfnC4h+Eq34EYRrC92p0gjWfHGd4eW1/fuTN/TF2RKoUPpOd3o3Oje1h4oyxu5xGf45d88268vcpVMmlGRgxLXzXRACZIBGDhpZyXsdWWIZ6d1f1OCghsuIomJ2ZHBM5VG/U+jWuqvxcAYGGwt08KBpMSyo7AAnZrgwegRzR8N/Fg==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSZPR01MB7019.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(52536014)(5660300002)(16799955002)(45080400002)(86362001)(508600001)(7696005)(4326008)(6506007)(2906002)(38100700002)(55016003)(15650500001)(71200400001)(8936002)(110136005)(33656002)(8676002)(54906003)(53546011)(64756008)(66476007)(186003)(38070700005)(76116006)(66946007)(316002)(66446008)(66556008)(966005)(83380400001)(122000001)(9686003)(26005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?iso-8859-1?Q?nWtA6vKCJdC76zjXdiLipI2ISqlAj32yIlvqnI2mZLOji6t3xERRXIgxLe?=
 =?iso-8859-1?Q?e3bnEmPxv3F4zVsT0lXcUZNR/hsvIZCO/JKcDu9MWOMFjT+JhH25sBe7d6?=
 =?iso-8859-1?Q?EMaMjmkLrCGQsdF9FlMilJhi9jtIxoYiI/e0CIAm8n9e2AAoXKGXoJpgFd?=
 =?iso-8859-1?Q?RjpcekJi7H1rsqtO19qgQWXZoEbaPdF7KsbrC+AMlY22afSoN+k5qAMxzB?=
 =?iso-8859-1?Q?RDEarhTOb8Fy18Z7ciq2xCJoAooLjBSMVLM/V1jlUzUW8yeugNGPwJ20Ma?=
 =?iso-8859-1?Q?mJADb4sSQGhppHPwRqZgWjl6HdiW7LCtxJ31nnWJmAuRp92Z14TFBa1yHD?=
 =?iso-8859-1?Q?7Uuyl8gcN487cjz3vfeAMb0u9Zj75a/a4MnweHciXhpPdxGN2Ct0le5HjV?=
 =?iso-8859-1?Q?Cs9JHLzmxN3NLhSGMCHjVfNfv/YeYmILaCjdRMlGN1wJDBW+gnuqHSPOk2?=
 =?iso-8859-1?Q?N/h6X7Oi0HNSZ9FEHfJb+22F1bjZp6LjqbjhaB8WN9Kdpq6X8cU2hciW5F?=
 =?iso-8859-1?Q?YlnBRb6qQCqUMLs7oxXlZp/fQZmncb38J87/6mlKOYZzryHs0xVbBpbT13?=
 =?iso-8859-1?Q?Bt2MPK/s+zwwYdCY6jleS57AQyV2Ns8wZe9po8hk74jWfhrkLcxkg81Bic?=
 =?iso-8859-1?Q?RR01tcBuTF1fN2W9kZ7W7Zm6/yxLgMNPLUAauE5Ux3uRqp/ydHJFYMrt9S?=
 =?iso-8859-1?Q?kv5px8TYOlricyXUy4KblT9BzWS6sTcuxqIy4Vi3btKJvvOPdJrieKQSPm?=
 =?iso-8859-1?Q?deQIFDW66ZCGpXIRT6d1qt2A26OYKXjtqhvRNpjTbQ6LJ9HMZtLUw3Yqru?=
 =?iso-8859-1?Q?hZrLS2PzHLAuMDAZ2Cfqc0vWcv6BrOqdc++q9xOtuO5FPLpT06YK1d6gMG?=
 =?iso-8859-1?Q?t/Z5pQ+CEhsmzKx1fDRRxuz+ZGqrqa/kajx/beFP3NN10jkTD6j619ktLr?=
 =?iso-8859-1?Q?w0D6VTN6zpag/gDV460/YOtm2jxYRdzaZRvDH7uWPPkhpvGnp4tDXCv29h?=
 =?iso-8859-1?Q?wN5AOMXLkt2PxHZ5hT1yl7tRNwFqM0GnY8uxTZNrHTEw0fkKFYPxQ5pxOI?=
 =?iso-8859-1?Q?4NprsdX6FS+6NbSTZbkEP8fL+8+xLRs68rJgDXcxBdnyfFP1qSs3iI8znJ?=
 =?iso-8859-1?Q?ovwuMzCwNcj8/EjEe88sVUzO6aZtsAS7zamLs/SujwuVOMDsUiIlf+388r?=
 =?iso-8859-1?Q?eEePFmcS4TL6PuAcsSH8sat8weRIGRKtRF8bPRaFU9U3pPpN//qQbVj8Nl?=
 =?iso-8859-1?Q?6xogvVRkpWd4SmSUs/Tnpme6Hs0SykMUhCODxmrj3vSEVR/EuV8EP6pLWJ?=
 =?iso-8859-1?Q?nvLX/CXrLQe2PCM4/e4/TDESHLtSuxrkg7/41Uxt7Aq4voaoDRDBn4g5KG?=
 =?iso-8859-1?Q?ve04tQCJ4LYsA5Rb5DtF5JauP7F1YiQKt7mK80+qqvNRkOgtFpV75nzIu5?=
 =?iso-8859-1?Q?132MrbaiYBgNJ1rHqYWtwu9qqap4Rgtt8185KPI2GT3DBvS6kUthWqGJaF?=
 =?iso-8859-1?Q?ByJEDI7hgjqp/xULrVYwbDADRMfEWAnOh+PHOC4eg4KhJnTLlJKkIh1RWU?=
 =?iso-8859-1?Q?074vGsUOyECDl9i4UrwSOpT//KdxP7CL7HTtCZ5h0it+vEMDAPeuRl1fL5?=
 =?iso-8859-1?Q?VlhlJ4Lm3nq66+LZzvgnYG7q9lWvcdjfbdstcdsl4vbWpfxdgMIZI5ELGC?=
 =?iso-8859-1?Q?EWanwl7hOZsqInZjkaQiVzlrBD5iA6f6zg/aQEu54asMiB5CJwzyESS/Oy?=
 =?iso-8859-1?Q?gFnk2Fyy/9YqqIIDTBPE0DXm4QTBes+B0VIZHBt13ZsHlCUM4WnC9+7o6o?=
 =?iso-8859-1?Q?mMUYCfW3WfXpUxes8j5nLBuj4xmce/ruMF70K003ig6kAb1u/c9a?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSZPR01MB7019.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f337b5d6-9c9a-4017-1249-08da3fb67290
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 May 2022 07:56:46.4363
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9G+QK4slh38ceRhVzV0ILIS3uYvmAdDlwotWLohOkBj5rJnYupz3VR5tAUCoMFoPELn92oBJmJtjeoEhdD+kXmVyehnVn7op5E69A+DYpywPBn5+6KL6pbCwW0RPmTpG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB6551
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
Cc: Darren Stevens <darren@stevens-zone.net>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, "R.T.Dickinson" <rtd2@xtra.co.nz>, mad skateman <madskateman@gmail.com>, Christian Zigotzky <info@xenosoft.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

> -----Original Message-----
> From: Christophe Leroy <christophe.leroy@csgroup.eu>
> Sent: 27 May 2022 08:23
> To: Christian Zigotzky <chzigotzky@xenosoft.de>; rob.herring@calxeda.com;
> Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Cc: Darren Stevens <darren@stevens-zone.net>; linuxppc-dev <linuxppc-
> dev@lists.ozlabs.org>; mad skateman <madskateman@gmail.com>; R.T.Dickinso=
n
> <rtd2@xtra.co.nz>; Christian Zigotzky <info@xenosoft.de>
> Subject: Re: [FSL P50x0] Keyboard and mouse don't work anymore after the
> devicetree updates for 5.19
>=20
> Hi
>=20
> Le 26/05/2022 =E0 19:42, Christian Zigotzky a =E9crit=A0:
> > Hello,
> >
> > My keyboard and mouse don't work anymore with my Cyrus+ board with a
> > FSL
> > P50x0 PowerPC SoC [1] after the devicetree updates for 5.19 [2].
> > After reverting the devicetree updates, my keyboard and mouse work
> > without any problems.
> > I figured out that the issue is in the patch for the file platform.c
> > [3].=A0 I created a patch for reverting the problematic code. (see
> > attachment)
> > After reverting the changes with the attached patch, the keyboard and
> > mouse work again.
> > Please check your changes in the file platform.c [3].
> >
> > Thanks,
> > Christian
> >
> > [1]
> > https://jpn01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fwiki=
.
> > amiga.org%2Findex.php%3Ftitle%3DX5000&amp;data=3D05%7C01%7Cprabhakar.ma=
h
> > adev-lad.rj%40bp.renesas.com%7C4e9c08d1e3874a34bd4208da3fb1c007%7C53d8
> > 2571da1947e49cb4625a166a4a2a%7C0%7C0%7C637892329912063922%7CUnknown%7C
> > TWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVC
> > I6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=3DfSABvBDi%2FYlqU1eydQB6%2F4BzxXkqRM=
0
> > Ln9hdInyTp6w%3D&amp;reserved=3D0
> > [2]
> > https://jpn01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgit=
.
> > kernel.org%2Fpub%2Fscm%2Flinux%2Fkernel%2Fgit%2Ftorvalds%2Flinux.git%2
> > Fcommit%2F%3Fid%3D86c87bea6b42100c67418af690919c44de6ede6e&amp;data=3D0=
5
> > %7C01%7Cprabhakar.mahadev-lad.rj%40bp.renesas.com%7C4e9c08d1e3874a34bd
> > 4208da3fb1c007%7C53d82571da1947e49cb4625a166a4a2a%7C0%7C0%7C6378923299
> > 12063922%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiL
> > CJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=3DENkjlza0J7xFi=
I
> > aPUwMBxHBIkXJNkT%2BLTZ3xuPz%2B10Q%3D&amp;reserved=3D0
> >
> > [3]
> > https://jpn01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgit=
.
> > kernel.org%2Fpub%2Fscm%2Flinux%2Fkernel%2Fgit%2Ftorvalds%2Flinux.git%2
> > Fdiff%2Fdrivers%2Fof%2Fplatform.c%3Fid%3D86c87bea6b42100c67418af690919
> > c44de6ede6e&amp;data=3D05%7C01%7Cprabhakar.mahadev-lad.rj%40bp.renesas.=
c
> > om%7C4e9c08d1e3874a34bd4208da3fb1c007%7C53d82571da1947e49cb4625a166a4a
> > 2a%7C0%7C0%7C637892329912063922%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLj
> > AwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&a
> > mp;sdata=3DyEJUK%2BGK2dzWARC5rfhsSSFSwD%2BLZm8aNNHqQhPYP7Y%3D&amp;reser=
v
> > ed=3D0
>=20
>=20
> Based on your patch I would say the culprit commit is
> https://jpn01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgithu=
b.c
> om%2Ftorvalds%2Flinux%2Fcommit%2Fa1a2b7125e1079cfcc13a116aa3af3df2f9e002b=
&
> amp;data=3D05%7C01%7Cprabhakar.mahadev-
> lad.rj%40bp.renesas.com%7C4e9c08d1e3874a34bd4208da3fb1c007%7C53d82571da19=
4
> 7e49cb4625a166a4a2a%7C0%7C0%7C637892329912063922%7CUnknown%7CTWFpbGZsb3d8=
e
> yJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%=
7
> C%7C%7C&amp;sdata=3DONR1CiaSID6q4%2Fo%2BI6MlPA4ij89BJphQRpEu5tQxvYQ%3D&am=
p;r
> eserved=3D0
>=20
> commit a1a2b7125e1079cfcc13a116aa3af3df2f9e002b
> Author: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Date:   Wed Mar 16 20:06:33 2022 +0000
>=20
>      of/platform: Drop static setup of IRQ resource from DT core
>=20
>      Now that all the DT drivers have switched to platform_get_irq() we
> can now
>      safely drop the static setup of IRQ resource from DT core code.
>=20
>      With the above change hierarchical setup of irq domains is no longer
>      bypassed and thus allowing hierarchical interrupt domains to describ=
e
>      interrupts using "interrupts" DT property.
>=20
>      Signed-off-by: Lad Prabhakar <prabhakar.mahadev-
> lad.rj@bp.renesas.com>
>      Acked-by: Marc Zyngier <maz@kernel.org>
>      Tested-by: Marc Zyngier <maz@kernel.org>
>      Signed-off-by: Rob Herring <robh@kernel.org>
>      Link:
> https://jpn01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flore.=
ker
> nel.org%2Fr%2F20220316200633.28974-1-prabhakar.mahadev-
> lad.rj%40bp.renesas.com&amp;data=3D05%7C01%7Cprabhakar.mahadev-
> lad.rj%40bp.renesas.com%7C4e9c08d1e3874a34bd4208da3fb1c007%7C53d82571da19=
4
> 7e49cb4625a166a4a2a%7C0%7C0%7C637892329912063922%7CUnknown%7CTWFpbGZsb3d8=
e
> yJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%=
7
> C%7C%7C&amp;sdata=3Dri76vfLpmxe7vFDAlsBjyrSSkuTMz0ydftu3XObLGLA%3D&amp;re=
ser
> ved=3D0
>=20
Looks like the driver which you are using has not been converted to use pla=
tform_get_irq(), could you please check that.=20

Cheers,
Prabhakar
