Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 19A885527B0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Jun 2022 01:08:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LRlh574bsz3cGf
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Jun 2022 09:08:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=variscite.com header.i=@variscite.com header.a=rsa-sha256 header.s=selector2 header.b=dzb1owEq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=variscite.com (client-ip=2a01:111:f400:7e1a::625; helo=eur05-db8-obe.outbound.protection.outlook.com; envelope-from=pierluigi.p@variscite.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=variscite.com header.i=@variscite.com header.a=rsa-sha256 header.s=selector2 header.b=dzb1owEq;
	dkim-atps=neutral
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on20625.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e1a::625])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LRXPF5czTz3bms
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Jun 2022 00:40:17 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VEVAqSRe1d6m/6Rjt/4pRnY7A/kwpPdfNXgWZTxaljjh28NeUsdnsSIP5krNI3jGbQgq7RsKfHUoCa0pKMRu26FcGDcS3QCNosESwcKwvqxCk0Axv8/P07ChPcnc+AM17a7ON6uB5/wpVmE/swGrf5TchPxBRdbajrD5b/VBnAEgdJujC+Dygp26P89FQH9uqhv0ldqg3A+xBvEG0gPPr2RSMAeyrKlmsmJw9/l/oyt3H15BMVBeAx1yDNc2gdz4nDs0zC5bLfTG3gH44HR0BcBXYCEW6kfl/wpnZD+RfP6idimNuaAMmzp2EC0vQWANmj9PrvrFDGMJyhMv++iD4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HCgcRPidodHYTnAV6xkCFddIgDIvHBJsymjUhY7oPSQ=;
 b=XU1N1G8V14mCxYDfsRs0zr/fuS6ta3Bc3EHhskOXY2KI3GPHrXiGvmyZhMJsr0eZKWSiZeLru+vM0osMITAYBgDe03iQ2VzLVoWjbQSqVBRWJ0xD+/7+mCbTyhMNeotJSXY/8Pb+6ZgWhfnq7lut4rQQJeI0oiDh/pIoOv54NfUFnNvSr6y4wGi3tFIHWGthcAZI3I0dgHKd6aJL/KRHK4JdHncvWmnuaPeklpkL1VRn60ni0ciFSVuM7MdiEDGl2pnqqsj7eoudDkxcJ7E1bT/f21Y7rnu7uGnLmZqgVfs6QuuYVGZvlPN3QaDKAbtwDpF7VmOzw43UqAmiSG+tWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=variscite.com; dmarc=pass action=none
 header.from=variscite.com; dkim=pass header.d=variscite.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=variscite.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HCgcRPidodHYTnAV6xkCFddIgDIvHBJsymjUhY7oPSQ=;
 b=dzb1owEqwnI2qT2XE1T40EO2/04tpcEAWURrj8NGvqqFONeQzvX3eAPsaZH/pru/Fv6Fsys5lJeJnTQfNER0UUGW5ovM3NTEn7PX/ZygfMna1FD67p10sw65awdRzvyBqkXqaCNodct6nDj0+rDXtFynDqC5E66toc98EcbGt12SzfC1MtsryBej6thfgFxh8RFuyL2HEtnf0EC8QjRUtpphnpjAl1I1XIRFEsrLcgRQlR11KwjQmK+uSzv+KpWK5lGDfsuyPxa16QDG4MltrwK4OiYybxyZPaqP4kbl/k9aYii5jAEPrAbSWb+KggFx/Ycz93dfGkTJGmXqQeeKqA==
Received: from AM6PR08MB4376.eurprd08.prod.outlook.com (2603:10a6:20b:bb::21)
 by DB9PR08MB7097.eurprd08.prod.outlook.com (2603:10a6:10:2c2::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.14; Mon, 20 Jun
 2022 14:39:55 +0000
Received: from AM6PR08MB4376.eurprd08.prod.outlook.com
 ([fe80::3d45:c206:59e3:6539]) by AM6PR08MB4376.eurprd08.prod.outlook.com
 ([fe80::3d45:c206:59e3:6539%5]) with mapi id 15.20.5353.022; Mon, 20 Jun 2022
 14:39:55 +0000
From: Pierluigi Passaro <pierluigi.p@variscite.com>
To: Rob Herring <robh@kernel.org>, Alifer Willians de Moraes
	<alifer.m@variscite.com>
Subject: Re: [PATCH 3/4] ASoC: wm8904: extend device tree support
Thread-Topic: [PATCH 3/4] ASoC: wm8904: extend device tree support
Thread-Index: AQHYMi1Ro66fcHUK2UeA5XXtHB3uxay5HM2AgJ/kWJ8=
Date: Mon, 20 Jun 2022 14:39:55 +0000
Message-ID:  <AM6PR08MB43761F7E94081064E8FA478FFFB09@AM6PR08MB4376.eurprd08.prod.outlook.com>
References: <20220307141041.27538-1-alifer.m@variscite.com>
 <20220307141041.27538-3-alifer.m@variscite.com>
 <YipkwW6rUbWweXn7@robh.at.kernel.org>
In-Reply-To: <YipkwW6rUbWweXn7@robh.at.kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
suggested_attachment_session_id: 64df9736-a286-0e01-cb19-1139a6207977
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=variscite.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: aaa87902-54ee-445d-aa03-08da52cabe11
x-ms-traffictypediagnostic: DB9PR08MB7097:EE_
x-microsoft-antispam-prvs:  <DB9PR08MB709718514CD7C1411B9AB235FFB09@DB9PR08MB7097.eurprd08.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  IlrJncr5LiFDarYRN/uWoZ3GHmU9dxaJTlqgpkjsnqi0MKJL3r/WtoucHOiCLGkuEuVKUT+fOiUf3rXkfjyEt0tsBqOaM1HLm7RwcJSGxGwlmoeGFcPc5wiy7gS7HLGyKCOY8bh/4pvU0pvWRtQkLFeELCwQ1Yx+Pb/a/uRJROOpOrT1o+tmlRzdzP2pJNEOFh2IR3/piz8/u+8FYZ7ShZkxYis/qj0c8GfcD0nVfZ/zNjRAAbqtRShXm+cMB0DKHYp25XPf1+VVtKPJrLhvRFRAZfYq//qxdW+8BXvQLzugo4k1unjKjcGWumT3VunGLvaLNx/4CNicxyKVAYPDTpzzmRZHpBmVHtwSrCE3T9wpHLAGYiBPYaIdhEmgsBHQ1wa96sXSdV7CeGv+7BO9z1j9Hyuk6s0EQ9wuhBIm5hVPyTUE8Sc1try9n6eEdRAE/BkgaRT5WtlwUofX4nP0/n6Vi04mNftu189XRkF7TYgu3wqNA/v7f3EuwRYVg7Y11tDphp8FPZKxupVK7R/443eTKyB0aaTCbiTQn8/WPnM9bHi/BaBiGKWiBHCs4sCb4HuxGFwuQzfCHu913HVK7ABLDzF0Lw2ntfW+q9NIcbau30GW8CgL457edvPBb23T5qORxqYf8lpbaTUqUMdpeecGfC9Cl8j7yOM++EWVWKZ/v7rF3OLDBji8BWJxL3k5vSqIYH3gpArTpO6tLXKz/w==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB4376.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39850400004)(376002)(396003)(366004)(136003)(346002)(6506007)(66556008)(54906003)(7696005)(6636002)(110136005)(71200400001)(26005)(7416002)(66476007)(316002)(5660300002)(478600001)(91956017)(86362001)(9686003)(2906002)(4744005)(8936002)(8676002)(122000001)(66946007)(52536014)(4326008)(76116006)(38070700005)(64756008)(66446008)(186003)(55016003)(38100700002)(41300700001)(33656002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?iso-8859-1?Q?LmO7cMfRiAx3fcBD4dlVeaoH4hveWs0Kqy4Nsf3sW+5WTJcGaqDSDN8cb7?=
 =?iso-8859-1?Q?+j5ebci2uXjB5YkxT+YzoE0roDuHVnFlsFQ9VBOYpPRuw4oG340Dp14QZ/?=
 =?iso-8859-1?Q?AVAnUv4XTDuonHukvj/KdXCiJsKJpdnG7U5Ja27nRcqpZ2jNIKozoe8Abv?=
 =?iso-8859-1?Q?OIN+K9wICaeKF0GWeTM/658K6Iwm/YSrADrLBqGc34fIe72p8WielEzw3h?=
 =?iso-8859-1?Q?bavlltsZP8r+2pW8VF0VXi2lqYR/oSYjtR1nvJUQqnPIIPw3xp/Csiez0D?=
 =?iso-8859-1?Q?HWlH8ILBsXwUDo/vQrSpjhev4YkA686EKPn6AwMZ9O1AKp1EWtTe/Fzhpy?=
 =?iso-8859-1?Q?j/MAKhFmVj0avr71zFqcYMzwubESUKQ1iL97TrMk4fBd5AOUwFgMlwkJuM?=
 =?iso-8859-1?Q?itWRBluzjh1FRLy9dSnvlsYJcWuOWsQ71e1WihlOCDXbKwo+XHGziFR/rW?=
 =?iso-8859-1?Q?fcdDBr2CD/v+M7T5cWU2jX/5uixa4ZCu/oMmx6oHkdTGlxWD6i+118n9E+?=
 =?iso-8859-1?Q?onXgN1dsAB4GVSgEHJ61EwtycB5OmWPZZ8JxledoajtaP9zSKGfrDw6YfH?=
 =?iso-8859-1?Q?TUDoNk2y5RhveF5las2lOIRfpZlwhxSoqFSh7DrirlEt15Aeh6LQqb0YAm?=
 =?iso-8859-1?Q?DRKqgdcskBJZ/FtI39jAc0DfyxYyJHdWz7gH4RKrXLZxymF4X6Rlqj0f9k?=
 =?iso-8859-1?Q?uX+mdNOm8RhkKkfkCGA7p5IWl299v9b/RaWddVlcQta2AVk0/p5bweriHn?=
 =?iso-8859-1?Q?Vv9DR4ndKkkr8uKFanoaBN1Lo5gazeOXpfXAio1vbo9Ge4HMlVdcO2PD17?=
 =?iso-8859-1?Q?BnNZeW5cvyXrMkkRN6u+beLIV8hE8+gO4RUnO+CPNKVN7DMGE+OrBWiXfp?=
 =?iso-8859-1?Q?eZSyqqHdGKiGpBPDfa/d9yBvoZkfS0pFGPe5MGAsNgqqlqxeLL5uxNbFd4?=
 =?iso-8859-1?Q?eCnxlDmQElKuCVXLMtMOySJVFUYJ76pGyyFmPOId++sT8FP1+OK9gYjepR?=
 =?iso-8859-1?Q?28w0LVu4LSLf/tHH4BxA1hkXflj/8xMEr4RjM2dlAFY6AnYuc2GsqONKZY?=
 =?iso-8859-1?Q?aywE0wr4DMpW2szVL7AzgFBfmaEJ3AU4pfQMXhSrjpUvcfG7SuRs0cCha+?=
 =?iso-8859-1?Q?6dRehEbGEXRbMuF/AgNThK6X3EL0o6GtAQ/4BsYLaZInnZe1lREgNKX4TG?=
 =?iso-8859-1?Q?Qe4dCQYHs/JqCOYzvoBpaX6KoiedTGNIdWqL2d5enIpuy8qqGAb9Jijkqt?=
 =?iso-8859-1?Q?yRofdM+W0MLCFSh1L9kbHdPiArTKiK6MwN9ifwPHPHvaOgAv1Ttqt2g2Le?=
 =?iso-8859-1?Q?FjcYL7RrDxPBPIwNf4h/pa13LNXV8nCVD0TG/Qtz7ocFB1gztzEmkSO2Gi?=
 =?iso-8859-1?Q?3QFIwzSykkgTWvUdHGGh0MOo4yTGet8k4GcdW4hxME4RJRLBS7Ht9oVmJQ?=
 =?iso-8859-1?Q?ps6hP0WC6NEVfrnqYAqB2HX4uZOYG2HIg0Pi1IAiQe7WvCoideyibWHzdp?=
 =?iso-8859-1?Q?ld63EkMVl4AMwGiY4NLbm3vN6L9hC5iClcR1wZtMDB17dgt1VTpL1nBIWi?=
 =?iso-8859-1?Q?Z3BGRGNMKI08HC2s7o2LWxxnI7bcVdqFGKhlGKG77GNPprSAotNvn1e53k?=
 =?iso-8859-1?Q?DOR3eYEjcbQl9emMfY6iiu+X/E5zkCYCuY8fi32ZjYnkITqpa/qaA+Q+xg?=
 =?iso-8859-1?Q?8K0CdVED9xB4BNugjrj8uOHS3qsTvB5GTlejSObxOFcTLvAokorEAx0WS2?=
 =?iso-8859-1?Q?ZaFtUwNUqD+pgxO+8hwKJeg2s5mDaVorwNOgoq8p5KP2XUMVGJJA6OOyRQ?=
 =?iso-8859-1?Q?LX2nHOWBfg=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: variscite.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR08MB4376.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aaa87902-54ee-445d-aa03-08da52cabe11
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jun 2022 14:39:55.1421
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 399ae6ac-38f4-4ef0-94a8-440b0ad581de
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: W6lU+jBHNJNBxpUU1Kp7U6BehChqbJDjKcV6JGRIVZVW90E2thjYKi6hGLSIkHjOzeJvZk4G/+KoJBVrC+fz+q6Wp9CK93nIzMTpBa3FHQY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7097
X-Mailman-Approved-At: Tue, 21 Jun 2022 09:07:35 +1000
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, "nicoleotsuka@gmail.com" <nicoleotsuka@gmail.com>, "Xiubo.Lee@gmail.com" <Xiubo.Lee@gmail.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "shengjiu.wang@gmail.com" <shengjiu.wang@gmail.com>, "tiwai@suse.com" <tiwai@suse.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>, Eran Matityahu <eran.m@variscite.com>, "broonie@kernel.org" <broonie@kernel.org>, "patches@opensource.cirrus.com" <patches@opensource.cirrus.com>, "perex@perex.cz" <perex@perex.cz>, "festevam@gmail.com" <festevam@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

> > The platform_data structure is not populated when using device trees.=
=0A=
> > This patch adds optional dts properties to allow populating it:=0A=
> > - gpio-cfg=0A=
> > - mic-cfg=0A=
> > - num-drc-cfgs=0A=
> > - drc-cfg-regs=0A=
> > - drc-cfg-names=0A=
> > - num-retune-mobile-cfgs=0A=
> > - retune-mobile-cfg-regs=0A=
> > - retune-mobile-cfg-names=0A=
> > - retune-mobile-cfg-rates=0A=
> =0A=
> If you want to add all this, convert to DT schema first. =0A=
> They all need vendor prefixes for starters.=0A=
=0A=
Beyond adding the vendor prefix, can you please add details or provide any =
reference about "convert to DT schema" ?=0A=
=0A=
> > =0A=
> > Signed-off-by: Pierluigi Passaro <pierluigi.p@variscite.com>=0A=
> > Signed-off-by: Alifer Moraes <alifer.m@variscite.com>=0A=
> > ---=0A=
> >=A0 .../devicetree/bindings/sound/wm8904.txt=A0=A0=A0=A0=A0 |=A0 53 ++++=
++++=0A=
> >=A0 sound/soc/codecs/wm8904.c=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0 | 113 +++++++++++++++++-=0A=
> =0A=
> Binding changes go in their own patches.=0A=
=0A=
Do you mean that C code and TXT documentation should be provided as separat=
ed patches ?=0A=
=0A=
Thanks=0A=
Best Regards=0A=
Pier=
