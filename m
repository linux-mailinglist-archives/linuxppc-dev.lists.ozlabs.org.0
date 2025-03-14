Return-Path: <linuxppc-dev+bounces-7069-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DCB1CA6132B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Mar 2025 14:56:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZDmB66n8Gz3cZ9;
	Sat, 15 Mar 2025 00:56:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c201::3" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741960590;
	cv=pass; b=UadEsip4vpu28lVuxtwyn3CbFzQWojBQDC9sjhM361WF5mvVThEM2ko4bqN5zyuFONRLB4YJnrsjNRQLMXgXX9I+71OFW4yQdmBGpMHpob4a4ZbKP5PB712d3ZOKvfbQvtbojbRDGwqCd9GYRzbtgFQeWGajbZmKbrS0HmXRbSIInzArKUG9wQeGZkp2H/sWMD053ME0mwXl+TApITLCQk5hTcwOF+ffXtB883qJb+GgPBP1JuIkTkgVXDT09UhDWvYFnTPQjkCbKvwQnFANR63XL1bfMSP4BnOL6hDoAwSnWiPSdSrmf3VWbjMxEMKf5vNiWPQhN0P+hE+Kci3xgg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741960590; c=relaxed/relaxed;
	bh=NcFbcaBYan/q1ZnXoFexG82u67AdrKOMOR7LyvAPJUA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=b07K5++uFkSo2J9II0xXvhRcY5VLDpVuuKzMhWiRryN24ydsGWKdx37D5dkYsDUR1TcvqDYTXDk8APPViQIuu2BcSOjmsjOr/PNrC9e35JccHbfhdByg8iqhIKz2wVbhtqwt0f3bZ4NpEh26DgoZO+FXsn+qIhUgiBI01C8U/xiqb4XjW+bwSF9AXVnR68IjeyWeaodUkAYybn8BgPTDtOhXXZbd25ybICA4763TZ7IBNVni+sYr3K/vLzL3z0HNz9xKIK0Br6gBXYia7EOF0xHSbdyJLMxP2xjkXJybBvlBKPMp9SK4rzmVp+0zGFygypyCXeBn0f1mrfpBmuM6GA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=WI4vHW/e; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:c201::3; helo=as8pr04cu009.outbound.protection.outlook.com; envelope-from=wei.fang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=WI4vHW/e;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:c201::3; helo=as8pr04cu009.outbound.protection.outlook.com; envelope-from=wei.fang@nxp.com; receiver=lists.ozlabs.org)
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazlp170110003.outbound.protection.outlook.com [IPv6:2a01:111:f403:c201::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZDmB56jycz3cZt
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Mar 2025 00:56:29 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I5sxaHQFZu55r8LxUFb+OKt9OAWgLn3KeFw3hP6TsNWAjZEAGUCfsSOl0O5OETQb+eMBCg0s7IWhzFhcIsYOTkv9uizUCmzwz/jzNIEwiStRw4/EoJsccl0FkzLJfDhnYxwKlYkqPiL5ZsWaeE7GllTRzgQkOAigRrAqn+9GCq0tUlgTqgk8KCy8xTYSaAfpV+sEFF4mGwOywAgLH4t4DHXypPThCe64aBf9CH6OO82ECDaH7TSWZB4ymeWwGigelDzPWBmushs/tfDvp3kd8D3U7GMtOIYF+nmECPW3/cofmee3mHKfRoFc20PXrP27zQU8MUCrl+Q2K13Wt/tr+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NcFbcaBYan/q1ZnXoFexG82u67AdrKOMOR7LyvAPJUA=;
 b=AM0wVL2dHhG87+erfyEffsOdCBpnxJhudFQBFtVtXoRXwbpl2MWQawf5+hlkQD7WF2UKkMriVP+BY/2nNdCqFu2sDXbMLOC2WIDg+ZzmNuoX1yu9aZRMNJ/nJkTZazs9Hd9ybvAPdlrSIzFmsMhx32KY63EY6zM09Kf9vwz7tlur+WFAS0ODMBK2+AAXRG5CDUSUxJnSm4Xh5/4ZOPZBi95yBI90MsKRUbz7QNgD0XJNnLs4SR6Z/6NttlJJsXaohUPH7lfcfH8+fzuCq7yMSNQuCh0h5f/M/p8SVkcYdEEWwLSVpQqfsiWCWs50qs4eY1Q1TzSP4EUxi8VE44OahA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NcFbcaBYan/q1ZnXoFexG82u67AdrKOMOR7LyvAPJUA=;
 b=WI4vHW/e+IwGRI1E44wnQp4QdbhkGASc5UEraXd74px/NK6P89OLlmIDiWFo5fMfWws4cl8Fm0qhWmX7sxM5oBoyXFUCiGvrQRilKnwisRCOG91Ch3xS4VaENaE4H2edZflqG3ZzDgXBweXF9fWvcwZfOEVx6SPevOZ2Q2OxmwQ5cf+pHGy273EWZ3aOSFMhdCvFT/R5Vq5MNOt/hWG+e3tU68AwR5m8Fn/AXNqzHrnzQ177c0rmx/yAO2wTSautqmmZACpgOaARqUgTlmJbxGbnAq8VilCLyF8F1A8dlvif+PcIbVdufkzlLM/5cVWhWAA/DIzGnCydl7vdlVHndg==
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com (2603:10a6:102:211::7)
 by GV1PR04MB10557.eurprd04.prod.outlook.com (2603:10a6:150:209::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.28; Fri, 14 Mar
 2025 13:56:07 +0000
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db]) by PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db%5]) with mapi id 15.20.8534.027; Fri, 14 Mar 2025
 13:56:07 +0000
From: Wei Fang <wei.fang@nxp.com>
To: Vladimir Oltean <vladimir.oltean@nxp.com>
CC: Claudiu Manoil <claudiu.manoil@nxp.com>, Clark Wang
	<xiaoning.wang@nxp.com>, "andrew+netdev@lunn.ch" <andrew+netdev@lunn.ch>,
	"davem@davemloft.net" <davem@davemloft.net>, "edumazet@google.com"
	<edumazet@google.com>, "kuba@kernel.org" <kuba@kernel.org>,
	"pabeni@redhat.com" <pabeni@redhat.com>, "christophe.leroy@csgroup.eu"
	<christophe.leroy@csgroup.eu>, "netdev@vger.kernel.org"
	<netdev@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: RE: [PATCH v4 net-next 02/14] net: enetc: add command BD ring support
 for i.MX95 ENETC
Thread-Topic: [PATCH v4 net-next 02/14] net: enetc: add command BD ring
 support for i.MX95 ENETC
Thread-Index: AQHbkkpLRYKdL7a04kCsKfHEkw9g2bNxSx9ggADF3gCAAG/sgIAAKgsQ
Date: Fri, 14 Mar 2025 13:56:06 +0000
Message-ID:
 <PAXPR04MB8510E0C6A4EE36B2155D813B88D22@PAXPR04MB8510.eurprd04.prod.outlook.com>
References: <20250311053830.1516523-1-wei.fang@nxp.com>
 <20250311053830.1516523-1-wei.fang@nxp.com>
 <20250311053830.1516523-3-wei.fang@nxp.com>
 <20250311053830.1516523-3-wei.fang@nxp.com>
 <20250313164908.rdy3y77xno3fza3l@skbuf>
 <PAXPR04MB8510D3A2F2A792A89941A7FD88D22@PAXPR04MB8510.eurprd04.prod.outlook.com>
 <20250314111801.2oela3qoi5qrl6el@skbuf>
In-Reply-To: <20250314111801.2oela3qoi5qrl6el@skbuf>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8510:EE_|GV1PR04MB10557:EE_
x-ms-office365-filtering-correlation-id: 5d4b8dba-07f5-4cc9-2965-08dd62fff7d1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?SFjCRoA87StEe+rELC4mMbbsp8/LctKjPJikUHPrtkMDt3ukCVQM4R0imyg/?=
 =?us-ascii?Q?/r5VvlOSxA8O90nSEh/tHTR0T5xst5+Wni2esFpCtUtYkIiooMqDI6yj5wFO?=
 =?us-ascii?Q?9ZEGDHWDU0pa4KOKHsIy4UZKZQhY7Hl5wu6YweOE76XPFDZoGv6fcP7vrv6/?=
 =?us-ascii?Q?je3bG0Y654ITDiE6OPIYDYBX0AUHI/cbH1L65qg8kfI5kdP0Nx+Fptml+Dps?=
 =?us-ascii?Q?rl+RV9aiidOgkN++HwGSYDx/F//ig4XF9YcG/INGjamVl2/m72L6Pgh2KUHA?=
 =?us-ascii?Q?PV1AxAsxTqH3W6RbgHnr3U58WYqs8YQJPH6dZt48arHIvYwLHPQ28Lm1bn3X?=
 =?us-ascii?Q?ojT8KxI4BQceZLGgMxOlZ0cHX9C3EouER5TPUKco1DNPIUN73avZCDG/HSGI?=
 =?us-ascii?Q?1CFj+J8Pz+A2Vwa93z/8eIqZU2Cp0hM0efr2OwFodPMEDi81cdZmVQaBqFNP?=
 =?us-ascii?Q?9VJDmiLsWcH/UzcmEn8MGnDjQ0zym1O3N240Jws/Q/HvDPINqQbsVPbPOZId?=
 =?us-ascii?Q?FE9oAGPVyKmXwCnSqI9zwZbCD4m07rfmgXggmgWHFFA4RJzhRUfqfcP37rC5?=
 =?us-ascii?Q?EceviTJpo0FqaANzeJT+vTkJ+uWqx/EWT0OBy8Y791m00nNRvj2Iao62qdul?=
 =?us-ascii?Q?BBKV9m0bhNMZ5BG+xa/BWWe9s/XP+MnfbgpQBjtzw8g33G3ug0jMrX2lI9Ky?=
 =?us-ascii?Q?7AlNUWNunsKC6nHnmXTdv6zJ9SPPbg4wSmXba3ZtgsHoAC76h+zqCKHcyYqT?=
 =?us-ascii?Q?MSkFjWn9z9pj/TZByMMTTKemLTWE3PYCXTdDsYNYIbILAIhIqx+6t1Zh7VML?=
 =?us-ascii?Q?SdClAGCF9LU5I2RwsGgy57zwKnVlCtPTeXlJtNfbrL2aJ2HQHcdkEtPwwOus?=
 =?us-ascii?Q?r1vDEJCKNP//cJo/h6fxSHU+c7WxbdiDQZ+S9fdpuknjlLe7OjZSLSmg3VMr?=
 =?us-ascii?Q?5q23BRoGIBVP3uCCeKF1p5XCMkX6BSZtuHrcmEBzqmHJpjNlfImeVqcW4g59?=
 =?us-ascii?Q?1vnhWLmqinJRTMG791vbkCmZfBy8e/oEZcnKLnFXVuFRISpZ26K02MOVy49y?=
 =?us-ascii?Q?xxBSlr3Qywql82O3L72FtMBH9Rvxw8QihjD/q+GkbQ+mOqTzCB5tHwAVJk3I?=
 =?us-ascii?Q?+7g1t5dtCj8j1CEo/hl/LI54/MXF98YSb+Ji/6mEUZYuR4RVgIYNMsSO1pQ0?=
 =?us-ascii?Q?JcC4fGNXhdRHFe54TbSPR3CEi9J7jS6Dw6UlKKR0CunQ25kQ0gi19tKnhR4o?=
 =?us-ascii?Q?Qr8oAYjSxMVI+tmbw/UMaSEukW68Bf3eOixROVkccUO74ceV0PXaaBHJYZcU?=
 =?us-ascii?Q?LRR+/N/jKze7pvqcz4Z2+rTKRZThWbMfew+rr7jcBOqTCX6AcRnKaC9ZYl9N?=
 =?us-ascii?Q?4EpCL5H92QMI7JglEvptNWXnS8eznA0V49MXobyc2WewK0JUXnOCde6wqRXY?=
 =?us-ascii?Q?ZEuHLft7OzodbUmmEVbyfBWXaNHnBWV2?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8510.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?LwSAdcqY5/XKOujWI+PiiNna3vS6zYKkeGBAmMlb8L4EDdbaRp9B0V86bU/8?=
 =?us-ascii?Q?Kr60po6NeLKz+4n4XT/LPXFnbIiZpbZgZbaFh4kD0VNhA8vibTQfUR+Vy0Qc?=
 =?us-ascii?Q?GHzDNVSxY03jHZSDR3IkbyUqz9yJHprWe6kXLh1xfl4chLo9fy4o8r4dfsAq?=
 =?us-ascii?Q?oD11LL3WXF+xJZPVj2HuvH8IAQ0AUflogsHI+OnjT9phebPR/ULXVZZzI3W4?=
 =?us-ascii?Q?3EMe7cFo9UYd2FWuRjCD333Euu82/XmHe12vlDzuHdjEi3nOQVD5itpQEhzC?=
 =?us-ascii?Q?G02XpYkM7qFJJOGDKpg41f8O6Dwl8lxOQcE/in/WgzEPMqSVmyT+JHsRCU6e?=
 =?us-ascii?Q?5DWq4rH5YuJjcrPiACjOoi0lOKDsD+p799wp0+BXOXzBN1dES9g/2iIEn1o1?=
 =?us-ascii?Q?KzlMzAqg6hhShnb9K4GPS+uH+BMGR9LwmrpIDneI92NWkR2DbWTa84jAXTvM?=
 =?us-ascii?Q?FyMdjYs/G9/SRLh9yeiayGaKdBDRR7erfpsj9wtPmUPDTGdf90tNGucy2kFR?=
 =?us-ascii?Q?mfFu6T5N3pjMI6xKzHnWe/JV18Z+MerfR2QNNhNBGhdchDuiI1siJyfhgnbz?=
 =?us-ascii?Q?g3uzAZENOPIZIfqXojq29g81Yl94+g/iTyHfo44G0SQyUJ0qj4fonzXZ0UOp?=
 =?us-ascii?Q?m6EYXdLtz67y8lDT0B/jVtyOcIIHzs8Dm+LExdriBqwL3q+NuP6EHgo1Tp/s?=
 =?us-ascii?Q?z8uAfIAPJ1VMgR6t1p2Q0BAf2zEcNilUMHWdwBYRXElyTs28X0sCkw68bCp7?=
 =?us-ascii?Q?v8Gq7uXzqEfullpxoxlm0knYpFPjlz/N0UTQukGBZhT6M+je0kNzMoHqt8NK?=
 =?us-ascii?Q?NFvzbsI1KVR7E2KARmcC7G5fZyYWcgCjAJrONuhzbrcoksxfRlI3U5Ogo0FS?=
 =?us-ascii?Q?nagSA6gNE/CxQvLLoKVxzpvmNOxp2JxGtJx3dYPX9ahkym6wl6CGwyuEHX+/?=
 =?us-ascii?Q?TsgvKhrshY9ZIn0rsK7MDzxTtTs1fN75KqO7z5sMJ3yGaPHpsXNde0rcq4oE?=
 =?us-ascii?Q?5joNHhqa1eYRP/1guC7FmnwiFjm4hBD1pcQkU+H0kTsIEbSKQMMFZ39FgSJ8?=
 =?us-ascii?Q?pBDBnsjxbsbEktcYU6JMztajp3Fl6pZgySxuFXuYh46qbQ9xnpYtiUTGDSf4?=
 =?us-ascii?Q?r5tdloEjlEsubJh4+x7ptXpl2Oj4wpcr4DrtuVgKmGHN4Y8EupnHgi1PGnss?=
 =?us-ascii?Q?wz39jI5VajY3t3mtKMTHqI2X/La+RZQ2ljOPj/xfLKiQq1X3G6LU5mkPjMbj?=
 =?us-ascii?Q?Q3r9D2E1Zma767eD508+2GC19FN23dQKtnqE3DCtUjgUu1DH8E/BpVIv70Uh?=
 =?us-ascii?Q?3CRV8DGo/rcrfDPPOxAFKjw3rN08TqffojvAcrC99gl26Y4tpltHUCBxeNgD?=
 =?us-ascii?Q?GO4MRzV20td3c7MCHEuDRWZsAfetwPKKz1AQuvfFLO4YV6X3H61tRS7Gje+t?=
 =?us-ascii?Q?YkUwxdA3surZEuvoOuy2bOlXFXoh632QSw07gpixSFfkSMIxymuBSQ796J04?=
 =?us-ascii?Q?8Zwmbs/gkfE7EhrgseDrVClmy+z86N2g1oYBBO1d1D2lZH8PnOB6a7LcXD1u?=
 =?us-ascii?Q?+uNj7ggw4lRa4gcDEW0=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8510.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d4b8dba-07f5-4cc9-2965-08dd62fff7d1
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Mar 2025 13:56:06.9981
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5rYt8SBBiKP1yg9L9aywO44GIFxW0ccBBkjHwk32Yn0Je6QZORpNT4tV3B8ihZAnRo2IEWQcau1c2KbGv+XDjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10557
X-Spam-Status: No, score=0.8 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

> On Fri, Mar 14, 2025 at 06:51:06AM +0200, Wei Fang wrote:
> > > I don't understand the need for si->ops->setup_cbdr() and
> > > si->ops->teardown_cbdr()?
> > > Doesn't every call site know which kind of SI it is dealing with, and=
 thus it
> can
> > > appropriately call the direct symbol?
> > > - the v1 PSI and the VSI call enetc_setup_cbdr() and enetc_teardown_c=
bdr()
> > > - the v4 PSI calls enetc4_setup_cbdr() and enetc4_teardown_cbdr()
> >
> > Yes, for PSI we can use directly call these functions because they are =
different
> > drivers, but for VSI, v1 and v4 will use the same driver. I just want t=
he PSI and
> > VSI to be consistent. If you don't like this, I can remove these interf=
aces from
> > the patch set, and add vf_setup_cbdr and vf_teardown_cbdr in the future
> when
> > I add the VF support for ENETC v4.
>=20
> It's not that I don't like them, the point is rather simple: as far as
> this patch set is concerned, converting direct function calls to
> indirect ones is an unfinished idea. It needs to be evaluated in full
> context, which is not present here - as you say, v4 VSIs need to be
> further modified to call a different set of operations - but right now,
> they call a single set of CBDR functions. Changes which require
> subsequent patch sets in order to make any sense at all are discouraged.
>=20
> Given the fact that the PSI code paths still don't benefit from an
> indirect function call in any way, I would in principle recommend to
> keep calling their CBDR methods directly. For VSIs I don't know which is
> preferable (if-else vs function pointer), I need to see that code first.

Okay, let's keep directly calls in v1 and v4 PSI drivers. Regarding to the
VSI, some people don't like if-else because they think we may have v5,
v6, v7 in the future which may use different version of command BD ring,
so they prefer function pointer. But for trivial, like different register o=
ffsets
for different ENETC versions. I think if-else is enough.


