Return-Path: <linuxppc-dev+bounces-7789-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BBCEA93819
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Apr 2025 15:49:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZfGNB66hqz3bqQ;
	Fri, 18 Apr 2025 23:49:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2614::60d" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744984186;
	cv=pass; b=D9QrbxMJ57WPacgrbnnuB/NC+hH08cQVLaf1zOrRyEy4RTy5xdF+RqB188pIo4MCHqrzqHw6zG5Ek7P/NzyLLXgJv+7zfXbLzf4edLgYc5dOHNOZCqI8C5ZJdC4bTyLR/raYWmFBpmh7MyiP7cWQFqM6u1WdHHM+WuMZ02+tvFifG8h/0G52QhwhGgZyWgU8RtzfNPKqVeAJXbD9u3b6mjatHnB4yD8GnsjTFsrhpgn+KNYyAfNNfJQBbWYRxfin+XFRSmeWESpwcTr071e9/6WbEkbxXxn24S/IbsjaJFZVOlUR5hFuIIdhuCBX18RMzcj10lGxIF+ViXgdIPKMpg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744984186; c=relaxed/relaxed;
	bh=MX+eDZzwTgzCZ8EROYI+CuSp1gOf1rJ2PWsWR95NdKE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=f5thak8BpzxV1ZhyFxJhEup+sT3EDaG2FuyPG8B+XFSZQA5uYSpApvYygsfH2vaQdcyVOpXYNvLxkYTteUgrK+O+9OTzTbU+kih9EBj9GnbDp+ms6j0dNY38EeuzNAc7/ge1DRhjbOmtJ33hiYF3qdTaWrgV+Jc13VFTJRnEKc4XetU5vr0q9aMyceFvJW1Yvg9qLj7iyXV6gsLbJ40wA1+E0jnide1/9gVWkNQ3xFymKh37WNUobyGaICBc65ShUXYs5+oNLfBR/cSk2/v3rKKWH67fF2zoa4P1+JvJMa3kKySNmaA4Or/Znztm2QZHYTisnCjrDC/2K6H8mCQpVw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=TPfHw7Se; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:2614::60d; helo=eur05-db8-obe.outbound.protection.outlook.com; envelope-from=wei.fang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=TPfHw7Se;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:2614::60d; helo=eur05-db8-obe.outbound.protection.outlook.com; envelope-from=wei.fang@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2060d.outbound.protection.outlook.com [IPv6:2a01:111:f403:2614::60d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZfGN93n3Dz3bZs
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Apr 2025 23:49:45 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YKjs0yQk0Obd/j6yQWupEjeXeltb/IckHcmp4h9+OyXfsXCwVuyOqf3NJUS1T2tcrnTE2NlNzyA3BDIfbBt36H+VFCWWDhUaYLBZopcznrMWVBbsKZORWF+Vd6aayt5i+eAjqh2FUszPlArnnX1waJC+m1DAxY0gfgridj7w19Jez7npGSX/zA2TIk7kuOSIcYw3xEUtGiI7UEdpXbVLdZL8qHGXMUDfGAKhufb9ILJz7ds6Ty2e8uZkMos+dVDjgnhN2DB3/ae3mfrViRQELBsmgoZrsCW2bDgLg/i9W2HKLmAwk8m+NlO3mIYGt5+owiz70abl+YGupv/JCWsfhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MX+eDZzwTgzCZ8EROYI+CuSp1gOf1rJ2PWsWR95NdKE=;
 b=ZqiWkshla0pHuNcVJqvvGsbLX3t6B/FATjcFVfF4Vo7Wn8PhSKPdJnx9rgEDp5A2Mqn6k/y4NUj78OeT6wQkjgwU5VK2UYzihXUhriOmcT4c/FOVl3PV8amP6tV3yJJORJd80VpartUvjtjByxQn7IGGMNGtdlHBSpSsVvmrlYBMmpoeFrSf8/+n1RzFJE+ia/UL0IYxUq2AC6u6LH0pFI5ZZKBvoicUBrJjXnXJVjVDigHgm/YL7HVNKS0Xw4UA4AZEGnQ8jU72eZO8PscW/UqJV7ifVemtk1ikFNDDv5UGOn87g0sdYbNlau5mL+RClM5x2nUDMpRGyFXd+iF+EQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MX+eDZzwTgzCZ8EROYI+CuSp1gOf1rJ2PWsWR95NdKE=;
 b=TPfHw7Se2iWB2ndNjsmlaTeAs4NmB2qfXebLON7ZPCj89oYz9scuXPoFtrOpTq9wQCULjxI323AhgzOzpGbBN4mX6cndRG6kpcbZ8wcI6unWmTdFXx9RELVM8JbmqhDucz522jO39EiTGyMMhpwNBLpKhe/bEI/wBWFM9AgLlgodmWMPm0f6cK1MOWtHGZgko65mwlOp5pIJRp1z4Q5WcrbpVXiceVLsd6rR57x69uEwui1lsNpZVTIlGKvy7QQMcwFP/Yau5VMTkW4GTE7RIDhC9fCQNVjAlofjgMbEQD1DOHGNxcLSvcYO42mBxgpGBOyJIoHrHXdaHn2A4JH4zw==
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com (2603:10a6:102:211::7)
 by DB9PR04MB8380.eurprd04.prod.outlook.com (2603:10a6:10:243::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.36; Fri, 18 Apr
 2025 13:49:25 +0000
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db]) by PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db%4]) with mapi id 15.20.8632.030; Fri, 18 Apr 2025
 13:49:25 +0000
From: Wei Fang <wei.fang@nxp.com>
To: Vladimir Oltean <olteanv@gmail.com>
CC: Claudiu Manoil <claudiu.manoil@nxp.com>, Vladimir Oltean
	<vladimir.oltean@nxp.com>, Clark Wang <xiaoning.wang@nxp.com>,
	"andrew+netdev@lunn.ch" <andrew+netdev@lunn.ch>, "davem@davemloft.net"
	<davem@davemloft.net>, "edumazet@google.com" <edumazet@google.com>,
	"kuba@kernel.org" <kuba@kernel.org>, "pabeni@redhat.com" <pabeni@redhat.com>,
	"christophe.leroy@csgroup.eu" <christophe.leroy@csgroup.eu>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>
Subject: RE: [PATCH v5 net-next 02/14] net: enetc: add command BD ring support
 for i.MX95 ENETC
Thread-Topic: [PATCH v5 net-next 02/14] net: enetc: add command BD ring
 support for i.MX95 ENETC
Thread-Index: AQHbqsrhh0oHrRVC6EmJSGO3tHhombOpdRKjgAAFYZA=
Date: Fri, 18 Apr 2025 13:49:25 +0000
Message-ID:
 <PAXPR04MB85105C88656FA179985C8F0D88BF2@PAXPR04MB8510.eurprd04.prod.outlook.com>
References: <20250411095752.3072696-1-wei.fang@nxp.com>
 <20250411095752.3072696-1-wei.fang@nxp.com>
 <20250411095752.3072696-3-wei.fang@nxp.com>
 <20250411095752.3072696-3-wei.fang@nxp.com>
 <20250418132511.azibvntwzh6odqvx@skbuf>
In-Reply-To: <20250418132511.azibvntwzh6odqvx@skbuf>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8510:EE_|DB9PR04MB8380:EE_
x-ms-office365-filtering-correlation-id: bdc133f8-725e-45cf-87b7-08dd7e7fd4e4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|7416014|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?gb2312?B?cWRUVFFhTzltbzBPbFV2Njd1Wll1NlNLd1dIaWJweTdKUlAwR3dicVFtRVN1?=
 =?gb2312?B?djRaNVVHQmY2UFcxU3AwbHgrNmNwdlQxMjN2eEtTdm5yQURseXVTYmw3Y2hl?=
 =?gb2312?B?elJueXlJb0dkTGlYRTVROG44bW5odEcvZTBLcXZCbTFocFhkdTRub01Ja0Zj?=
 =?gb2312?B?aWNRUkF6OFFLNDRKOHUzRnZkaFlndmpRRitFTjJJMGxhRlpLV0VtOTVtL1Bx?=
 =?gb2312?B?R05vSzlySm9aQytpNHRuSW9vcFVnMzQrdmV3UlB3Q29WYzRzdnZIa3pHdVE1?=
 =?gb2312?B?T0ROajF4cGpuUlhGdmttRnNxd0hvUjZDeFloV2NBWEFmVCs1enpFTld3cFJo?=
 =?gb2312?B?SDI4TExVU0UxV1Zhb3pkWXIwVG9tZmRmVkZkaUVQNk9haklGQW9TZGNRZ3Zk?=
 =?gb2312?B?YVphWnpPb1lTeDVwV1pFMDZ0YklxRXNRQ0U0RXN2VFQzZHgwanVFTEwzOTNm?=
 =?gb2312?B?elQ2aVg4eWdsd3FpZnlVUWgrZkRVOEczMUpKZnNUbHFEcWJnWmRvZ24vem9I?=
 =?gb2312?B?N2ZtcW5CT2ZlWTJjS2xJZHBtZ1EvV3VNa28wNitEYU5GREhOWmliYnpGVklW?=
 =?gb2312?B?cXVpanIyRzFPaStZL0FJWUFSTWYzTXJDQUJ2Qk1XWk1WZFgzUVIyMjhMUjZB?=
 =?gb2312?B?QjNGdHdFUkQrQVVqbWIyaGVudFdrSzdZY2NDOXNXRlZkV0xpbExpODN4QmJq?=
 =?gb2312?B?RCtuMDRBT1poVWF0Y1MrTksvZllYZWs2QUMrU0tMbkFnbGVsUWZ6cTdhZGdm?=
 =?gb2312?B?aVZKOWtFUGRBakcwdjBqckhoQjR1VHU2STdCZGhnT1JtZTJrY3Y0U2ZBcWJx?=
 =?gb2312?B?THVvUVZjWE9yZSs2ZXFSUCt0WjZ2cTE1WHVHclFvVng2NmExcDBLczFFTW5l?=
 =?gb2312?B?WUJEajZZQWpqQXJ4LytIa29TVVBYYURNSXUwcmkyVEhhbHJ2OHNiZDVFUVZu?=
 =?gb2312?B?b3FYUG1ybHoxNWJsMHplU1lQUmthZ294ZitYMlkxMmkrVTVKTEtpYXRUL3dY?=
 =?gb2312?B?anZPeE1QOW5nOWUzVnlNbXB0THBLNlptNFRGUEdQSDlBVmJ3aHhpSVduNXVo?=
 =?gb2312?B?eUxOZUpiS2ozMnhHVEM2L0NPYzh0cGsxR3g5TEhxRWgrdERMRDRub2lXaGds?=
 =?gb2312?B?UzhocEV1b1JaRWlVMjFoUSt1bUhtNHVacWJORGxNYXRKS1ZPTG5hZ3RKcUhU?=
 =?gb2312?B?aEJXNlZYTExsQjlIR09JempkTy85Q3JadEMzVjNTN3JnQmRRaWdoMkkvRWs4?=
 =?gb2312?B?TW1Sd0U5TGZ2Y2F2cFFtbVAwQUVtaEF4Rlh0SVFkL2UrQWhzemtQdHhSSzhH?=
 =?gb2312?B?bnFkR0p2Ynk1OGxjUmZ6bEw1S3NmNU13WmFFdHgzclhXUE5Qd3dkME1qNGRU?=
 =?gb2312?B?WVR5NGZndDVTQU1RTXg2ekhCYURIYWk0czU2b3Y2OWlJaTVxTk1aSVY0QkZa?=
 =?gb2312?B?UTJiWTREdER4TnJsclY4MkJTemdOM0lvaURtR3hVZVR3NVJtWVZnL0pxTS92?=
 =?gb2312?B?TDBjTVRrZTI5Z1VxOWd5NnBWRGdoQXV0d0ZXcUZlLzg3K3VQZnRrZEszMTFK?=
 =?gb2312?B?QWNUQjNabDNUcGlseVVLcXB5d084b05QZFBObVM1K2F1ZnNhU0piNmhsZjc0?=
 =?gb2312?B?RzJ6ZGRqNWZ3d2JLcy9ZRkpRZ2pjRHBCOFdFVFduVG1qVkpOd2Z3eEhha1o5?=
 =?gb2312?B?S1E5ZXFzTnEvY2w3Lyt6TlhTekF3VWpMTHNxTm12VTN4cldhNFA3YzdQbEZL?=
 =?gb2312?B?QUdibGZlck0vYTgvdHBHTjZMT1BwbVU3RFJrUk1memVGV1c5ZVBXM2hqcGNJ?=
 =?gb2312?B?UlR0SStISTdaOEJXNDJrRkZjWmJjN2lWTkxGYjhKYzJNWWFmNzNOZmVUSVlm?=
 =?gb2312?B?bTZmRWdMZkpQNmFyU0pHbi9ndjF4WWZEMXIxeWlBcXduMSticFZGZUhMY29m?=
 =?gb2312?B?OWVQOXgvNjA3NFF5d2FxOTEyRjBNZktkaGc0SFk1M1E0TER3L1pGQWtUdTh4?=
 =?gb2312?Q?33B2keXthGCMx0+xP4XRtzPjvhUPyo=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8510.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?gb2312?B?SDROM2FaaGNLOHNTNzg5cWJMY0NxU0MvNDZDUktVMVh0NWF5cldSdkVkeFFS?=
 =?gb2312?B?cDU5bFoweTFTcFRXblA4VkE2WmkvbWl2MytKbE53YlI4OER3enlOTFBpNGdw?=
 =?gb2312?B?SHkyZ1JvYkE3MTB0RjRVYzJoVzFZVm9pNUl1K2gvQmoxY3hTR2JabUJVWXFq?=
 =?gb2312?B?VUcxbmNlbEQvOWExdDlCbjFqdm1IVmplby91eFBZZjB3VzRUTFlQK2Q1RWhv?=
 =?gb2312?B?U1U0WDIydlRlc3RkR0g2TUFnNkxwemNOeGwzU0lCUVZvZTFMNWVRemJDME45?=
 =?gb2312?B?QkdpRGtEOGc3WEx2bnpxeEFLdk42T3lIZzRkSHFQRjlEV0szWE01NkZuVVMw?=
 =?gb2312?B?c1piMzk3NHZlKzN1TWVjY2N1VUdMd3pYUDIxcTVNYklaYVZJNHgxMUNDNUF5?=
 =?gb2312?B?cFdnRXU4Q3FkUEkvbDVQOVdBcFJ0QlJBeG5EWEQ1NXQxOVVJNERGNG1ZNmZi?=
 =?gb2312?B?aEZaYzdGVjZtcVpOVVZXS0JydUNNS3hHOG8wbEEwRW1EcElWanl5NnkvSkNt?=
 =?gb2312?B?UEsyN0MvQTJHclVDd0FxNE5FS3Rob1pNbHdnU0VaS0srNk5qM2d3SHZQcEdQ?=
 =?gb2312?B?dmxPM1RrbmdOays0T28wejh4c1oxbUNiS0YyWHg1TEloK3hPeVFIVTJVWGJP?=
 =?gb2312?B?L3Y2LzhpckY2dW10Sy9OSFFuOElIajBhcDV1REptelNUMjc4VFBiQjliR05r?=
 =?gb2312?B?UDhxak5xb1BGWVNuKzhCYzhLdlgwMERwZ3VVN3Ixa0QySVlSUVhjZXlhUUE2?=
 =?gb2312?B?cmxEZVFaNDJhNWdWcW45a0ZGUFFEZ3NuNmFpajNZNEhScFRDMmNLaC8wOE0y?=
 =?gb2312?B?dCs3S2pjemxVVXRucFl2Tkk5S3orY3Q2ZkE0Nk9ZRWdyT0MrSmlWMFpPWllI?=
 =?gb2312?B?K3lVUGZxcVRrSHFpYlZ5WWdNSnBWR1pMU2pmbzhEUHY2TS9SQmlQcTV2L2I3?=
 =?gb2312?B?NHJYRE5pMThwTzZlalZUUUtDK0FRUDBpb1UyZHdHOU1tZ0dKZHpwN1JwVlJw?=
 =?gb2312?B?eGdJa241aElNWUdLSCsxREZkTWJ6dzJvY3pqS09Zazg0MGdpVUNYZXJIYkJi?=
 =?gb2312?B?YUVodUNmV1VXT0ZOdmNvZ1ByZWtzZFBzRmk5VVd2dGpIWi9IM2pZOER5KzAr?=
 =?gb2312?B?TGpIQXJSTVdjV2lBUmxlTDZYVmhveWhvcUJoWkJnc0RlUmVoT0RMUlliNXYr?=
 =?gb2312?B?amJTL05rNTRZdEZjNnIxcnJjMTNHU0FzSkhCVnJMb0lNR01jYThESlFIam41?=
 =?gb2312?B?RGc3RHR1L0xLUHJSSTF1YXg2ZTZKaDk0T0liSjhqN3BjamJXbzc5TDlieG52?=
 =?gb2312?B?R2xoL1pUcmZYMy9CS1VSemhHMll2WEwvNGNUNHdvUSs0Qy9MZjA5OURqRlZ1?=
 =?gb2312?B?UVJFa0NZYXd6cmFhWFZUTWIwaWRrTks4M2orRk50dGRYR1llL0g3cWlTZXZ1?=
 =?gb2312?B?aDBVOU9XS29JZzNtLzZIcUVmSFdxMTd5RDdDalF0a1Joa2diVGxMNXovU3RD?=
 =?gb2312?B?MXVGSFczSzVwMFMwem5EQmZzMnNxdTFlR0RjYi82TFBTZUVIVkkyanJkdU1T?=
 =?gb2312?B?eXBDVEUzcVJWN09HdURXOGJaWWV6L2tJeWFWay9ZRU1UOWJWajJVbEdMaFZO?=
 =?gb2312?B?WVZ0dm5XdlhaY1RKdElneVRSVXdyOHcrNU1veU5ML3UzckdVS1Joc0NvUktt?=
 =?gb2312?B?S3dlWVFCSHVlbWlPREMwajNiT0kxTnY4OTZUdDhKTGRYR2taeXZWbUdabVMz?=
 =?gb2312?B?d1ZpbWxwWU5vVzd4UCtXS3RNS3V4RFg1Y1ExKzExYXA0UnYzSFAzUklYb0gx?=
 =?gb2312?B?WktxV1RybWZ0ck5DNkVkUERYZEV2SFRtSXlUM01NejV1ZjVXOHc2V1hjTHpo?=
 =?gb2312?B?bDc1a1ZISE41emtnRWtORzRRQjRFbzg1N3FVdWpSZVBhVWFZc0p2aXJNYVhM?=
 =?gb2312?B?QWhFamtYREZhbnMrRTdtVU1xekVTaExtNVN0VE82cHd4VU5RclI0TkQyeHJk?=
 =?gb2312?B?RWNzNDZOeWFmVTVtMkxRS0lrdCtkUUZqdHNLanBCSWtrVnh0UjluOGlBdWVY?=
 =?gb2312?B?QlBFNGVZQVJxU3o4Z2Mvck9rSERnK0NlOWYvKzJIVEJzL29aS3h5M0xaWmd6?=
 =?gb2312?Q?PA6Q=3D?=
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
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
X-MS-Exchange-CrossTenant-Network-Message-Id: bdc133f8-725e-45cf-87b7-08dd7e7fd4e4
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Apr 2025 13:49:25.3843
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KBTaaWq2DHmXkCBa+LDUURaQCgJLtS4cJEH4HvR8871cs1GfH97nNJyRMOkJNsHB8gjgMI6iS2T/GVItBVS1lQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8380
X-Spam-Status: No, score=0.7 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	RCVD_IN_DNSWL_NONE,SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBWbGFkaW1pciBPbHRlYW4gPG9s
dGVhbnZAZ21haWwuY29tPg0KPiBTZW50OiAyMDI1xOo01MIxOMjVIDIxOjI1DQo+IFRvOiBXZWkg
RmFuZyA8d2VpLmZhbmdAbnhwLmNvbT4NCj4gQ2M6IENsYXVkaXUgTWFub2lsIDxjbGF1ZGl1Lm1h
bm9pbEBueHAuY29tPjsgVmxhZGltaXIgT2x0ZWFuDQo+IDx2bGFkaW1pci5vbHRlYW5AbnhwLmNv
bT47IENsYXJrIFdhbmcgPHhpYW9uaW5nLndhbmdAbnhwLmNvbT47DQo+IGFuZHJldytuZXRkZXZA
bHVubi5jaDsgZGF2ZW1AZGF2ZW1sb2Z0Lm5ldDsgZWR1bWF6ZXRAZ29vZ2xlLmNvbTsNCj4ga3Vi
YUBrZXJuZWwub3JnOyBwYWJlbmlAcmVkaGF0LmNvbTsgY2hyaXN0b3BoZS5sZXJveUBjc2dyb3Vw
LmV1Ow0KPiBuZXRkZXZAdmdlci5rZXJuZWwub3JnOyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwu
b3JnOyBpbXhAbGlzdHMubGludXguZGV2Ow0KPiBsaW51eHBwYy1kZXZAbGlzdHMub3psYWJzLm9y
ZzsgbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnDQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0ggdjUgbmV0LW5leHQgMDIvMTRdIG5ldDogZW5ldGM6IGFkZCBjb21tYW5kIEJEIHJpbmcN
Cj4gc3VwcG9ydCBmb3IgaS5NWDk1IEVORVRDDQo+IA0KPiBPbiBGcmksIEFwciAxMSwgMjAyNSBh
dCAwNTo1Nzo0MFBNICswODAwLCBXZWkgRmFuZyB3cm90ZToNCj4gPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9uZXQvZXRoZXJuZXQvZnJlZXNjYWxlL2VuZXRjL2VuZXRjX2NiZHIuYw0KPiBiL2RyaXZl
cnMvbmV0L2V0aGVybmV0L2ZyZWVzY2FsZS9lbmV0Yy9lbmV0Y19jYmRyLmMNCj4gPiBpbmRleCAy
MGJmZGY3ZmI0YjQuLmVjYjU3MWU1ZWE1MCAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL25ldC9l
dGhlcm5ldC9mcmVlc2NhbGUvZW5ldGMvZW5ldGNfY2Jkci5jDQo+ID4gKysrIGIvZHJpdmVycy9u
ZXQvZXRoZXJuZXQvZnJlZXNjYWxlL2VuZXRjL2VuZXRjX2NiZHIuYw0KPiA+IEBAIC02MCw2ICs2
MCw0NSBAQCB2b2lkIGVuZXRjX3RlYXJkb3duX2NiZHIoc3RydWN0IGVuZXRjX2NiZHIgKmNiZHIp
DQo+ID4gIH0NCj4gPiAgRVhQT1JUX1NZTUJPTF9HUEwoZW5ldGNfdGVhcmRvd25fY2Jkcik7DQo+
ID4NCj4gPiAraW50IGVuZXRjNF9zZXR1cF9jYmRyKHN0cnVjdCBlbmV0Y19zaSAqc2kpDQo+ID4g
K3sNCj4gPiArCXN0cnVjdCBudG1wX3VzZXIgKnVzZXIgPSAmc2ktPm50bXBfdXNlcjsNCj4gPiAr
CXN0cnVjdCBkZXZpY2UgKmRldiA9ICZzaS0+cGRldi0+ZGV2Ow0KPiA+ICsJc3RydWN0IGVuZXRj
X2h3ICpodyA9ICZzaS0+aHc7DQo+ID4gKwlzdHJ1Y3QgbmV0Y19jYmRyX3JlZ3MgcmVnczsNCj4g
PiArDQo+ID4gKwl1c2VyLT5jYmRyX251bSA9IDE7DQo+ID4gKwl1c2VyLT5jYmRyX3NpemUgPSBO
RVRDX0NCRFJfQkRfTlVNOw0KPiA+ICsJdXNlci0+ZGV2ID0gZGV2Ow0KPiA+ICsJdXNlci0+cmlu
ZyA9IGRldm1fa2NhbGxvYyhkZXYsIHVzZXItPmNiZHJfbnVtLA0KPiA+ICsJCQkJICBzaXplb2Yo
c3RydWN0IG5ldGNfY2JkciksIEdGUF9LRVJORUwpOw0KPiA+ICsJaWYgKCF1c2VyLT5yaW5nKQ0K
PiA+ICsJCXJldHVybiAtRU5PTUVNOw0KPiA+ICsNCj4gPiArCS8qIHNldCBDQkRSIGNhY2hlIGF0
dHJpYnV0ZXMgKi8NCj4gPiArCWVuZXRjX3dyKGh3LCBFTkVUQ19TSUNBUjIsDQo+ID4gKwkJIEVO
RVRDX1NJQ0FSX1JEX0NPSEVSRU5UIHwgRU5FVENfU0lDQVJfV1JfQ09IRVJFTlQpOw0KPiA+ICsN
Cj4gPiArCXJlZ3MucGlyID0gaHctPnJlZyArIEVORVRDX1NJQ0JEUlBJUjsNCj4gPiArCXJlZ3Mu
Y2lyID0gaHctPnJlZyArIEVORVRDX1NJQ0JEUkNJUjsNCj4gPiArCXJlZ3MubXIgPSBody0+cmVn
ICsgRU5FVENfU0lDQkRSTVI7DQo+ID4gKwlyZWdzLmJhcjAgPSBody0+cmVnICsgRU5FVENfU0lD
QkRSQkFSMDsNCj4gPiArCXJlZ3MuYmFyMSA9IGh3LT5yZWcgKyBFTkVUQ19TSUNCRFJCQVIxOw0K
PiA+ICsJcmVncy5sZW5yID0gaHctPnJlZyArIEVORVRDX1NJQ0JEUkxFTlI7DQo+ID4gKw0KPiA+
ICsJcmV0dXJuIG5ldGNfc2V0dXBfY2JkcihkZXYsIHVzZXItPmNiZHJfc2l6ZSwgJnJlZ3MsIHVz
ZXItPnJpbmcpOw0KPiA+ICt9DQo+ID4gK0VYUE9SVF9TWU1CT0xfR1BMKGVuZXRjNF9zZXR1cF9j
YmRyKTsNCj4gPiArDQo+ID4gK3ZvaWQgZW5ldGM0X3RlYXJkb3duX2NiZHIoc3RydWN0IGVuZXRj
X3NpICpzaSkNCj4gPiArew0KPiA+ICsJc3RydWN0IG50bXBfdXNlciAqdXNlciA9ICZzaS0+bnRt
cF91c2VyOw0KPiA+ICsNCj4gPiArCW5ldGNfdGVhcmRvd25fY2Jkcih1c2VyLT5kZXYsIHVzZXIt
PnJpbmcpOw0KPiA+ICsJdXNlci0+ZGV2ID0gTlVMTDsNCj4gPiArfQ0KPiA+ICtFWFBPUlRfU1lN
Qk9MX0dQTChlbmV0YzRfdGVhcmRvd25fY2Jkcik7DQo+IA0KPiBJIHdhbnRlZCB0byBhc2sgd2h5
IGlzbid0IG5ldGNfc2V0dXBfY2JkcigpIG1lcmdlZCBpbnRvIGVuZXRjNF9zZXR1cF9jYmRyKCkN
Cj4gKGFuZCBsaWtld2lzZSBmb3IgdGVhcmRvd25fY2JkciksIGJlY2F1c2UgdGhleSBzb3VuZCB2
ZXJ5IHNpbWlsYXIsIGFuZA0KPiB0aGV5IG9wZXJhdGUgb24gdGhlIHNhbWUgZGF0YSAtIG9uZSBp
cyBsaXRlcmFsbHkgYSBjb250aW51YXRpb24gb2YgdGhlDQo+IG90aGVyLiBUaGVuIEkgbG9va2Vk
IGRvd25zdHJlYW0gd2hlcmUgdGhlIG5ldGNfc3dpdGNoIGlzIGFub3RoZXIgQVBJDQo+IHVzZXIg
b2YgbmV0Y19zZXR1cF9jYmRyKCkgYW5kIG5ldGNfdGVhcmRvd25fY2JkcigpLg0KPiANCj4gRG8g
eW91IHRoaW5rIHlvdSBjb3VsZCByZW5hbWUgbmV0Y19zZXR1cF9jYmRyKCkgaW50byBzb21ldGhp
bmcgbGlrZSBiZWxvdzoNCg0KU3VyZSwgSSB3aWxsIHJlbmFtZSB0aGVtLg0KDQo+IA0KPiBzdHJ1
Y3QgbnRtcF91c2VyICpudG1wX3VzZXJfY3JlYXRlKHN0cnVjdCBkZXZpY2UgKmRldiwgc2l6ZV90
IG51bV9jYmRyLA0KPiAJCQkJICAgY29uc3Qgc3RydWN0IG5ldGNfY2Jkcl9yZWdzICpyZWdzKTsN
Cj4gdm9pZCBudG1wX3VzZXJfZGVzdHJveShzdHJ1Y3QgbnRtcF91c2VyICp1c2VyKTsNCj4gDQo+
IEZyb20gYSBkYXRhIGVuY2Fwc3VsYXRpb24gcGVyc3BlY3RpdmUsIGl0IHdvdWxkIGJlIGdyZWF0
IGlmIHRoZSBvdXRzaWRlDQo+IHdvcmxkIG9ubHkgd29ya2VkIHdpdGggYW4gb3BhcXVlIHN0cnVj
dCBudG1wX3VzZXIgKiBwb2ludGVyLg0KPiANCj4gSGlkZSBORVRDX0NCRFJfQkRfTlVNIGZyb20g
aW5jbHVkZS9saW51eC9mc2wvbnRtcC5oIGlmIEFQSSB1c2VycyBkb24ndA0KPiBuZWVkIHRvIGN1
c3RvbWl6ZSBpdCwgYW5kIGxldCBudG1wX3VzZXJfY3JlYXRlKCkgc2V0IGl0Lg0KPiANCg0KRG8g
d2UgbmVlZCB0byByZXRhaW4gY2Jkcl9zaXplIGluIHN0cnVjdCBudG1wX3VzZXI/IE9yIGp1c3Qg
cmVtb3ZlIGl0IGluDQpuZXh0IHZlcnNpb24/DQoNCg==

