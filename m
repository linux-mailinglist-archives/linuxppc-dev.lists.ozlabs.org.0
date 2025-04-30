Return-Path: <linuxppc-dev+bounces-8170-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 68C41AA40A4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Apr 2025 03:36:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZnKXr0j9Kz2xqD;
	Wed, 30 Apr 2025 11:36:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c200::4" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745977004;
	cv=pass; b=ZL+nasURbqy6zSALpFVJy50FdPDVZcvz/OAEJbFmHfJjCPbsdj8BGExM8ltdexBme5pHQc0+NSlNoWS6RxebjvFMoeyXkHTYCEKHM2Nwxf0GcSkEbsCA/R8UCGnjNQkGUAZalFs5e4B/v1+UwjV1UqsiOoby3/d+xrUBet63F/l5joekGKHR4gEAij2ZVcc1oFQiA9VZS2+brqWJvZPfymx9RFkSl/3jO2HO/nvP8mg0ihd/K/FoiO5LJLhjcs1zv9jyHZWaul3QuKPCFDqq0QyTbkh0YszjEv6MIoIdASxJj8k0GaeiWkGo6IfEzxKIjDscg2+MGhJPziR/ar0sEQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745977004; c=relaxed/relaxed;
	bh=6TgTaoys4e//PUHds5mYIJfYHEK41wavWMv4QdbBZgM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=KuNIxhijAzYHWYLXSmVybtyzOkqsHL1Qt0RyxsqxZwu3XyW6gKbydK/4NsWcC2P0wX2SnEIXC78cQsWFFqKN7OQk8CkxknYwOY3KcxvzgDIcfwaVzheAcXJZoWY1W1ts2KMtNb6xXpOMoavn0br9WyTCd7KXAN+owaPcnx4TG1JBtD0lUofjrVY0p1+EGL63wrfKd0s0e5lBAOvgTrtPnT0BTLDQO2dYiLxDa4y/cxQA1SQiTZ3CYQkYQXse/azfdJ0OcKRnT0FnDQlnAs1HvuiBbNl+1KQo3PIKCnXpExUvi/GY3cM4yOp4KEsP19BLYbzFUg/NbXTqptHIUBrRzg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=jzIJQciD; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:c200::4; helo=duzpr83cu001.outbound.protection.outlook.com; envelope-from=wei.fang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=jzIJQciD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:c200::4; helo=duzpr83cu001.outbound.protection.outlook.com; envelope-from=wei.fang@nxp.com; receiver=lists.ozlabs.org)
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazlp170130004.outbound.protection.outlook.com [IPv6:2a01:111:f403:c200::4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZnKXp3gW8z2xJT
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Apr 2025 11:36:41 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zm2DRaDPEYvFcbTh0zniMCBifeIgqhmP4y/kTacPf8yZX5eBRjP2zno/0JCC7038EXy/4K+QvySTwshwUS/0XX+3m2bjk2H6A0sTwCIIyvWy9gYcTfZw6voAu3P0AaXvmyGcc7e+JSRg9vih6jzpLoOiJel35beIg19xkGKK7rFkUY62bZBJTVhHb+m8nkJGku6L51vn4ZAFSEcRiYORGlk2wVnOWKJ5/dVXuL1KGtzSgG3rMbjQ8IdvDMnaJ8L1OKiDdVXMVZoWEtQIHQnYiCA+90BjP8uYjQpW/GMJdAg4jGbuc1QWuiQX3UhspgJMO38wDtmFob79Um4ARU+4sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6TgTaoys4e//PUHds5mYIJfYHEK41wavWMv4QdbBZgM=;
 b=cT7iNU/wJyeOnX466bKvnNJwsWQ1IKufy4B4B/isn0zy6NNnzbSrUCtfFZce9Vgk27Fi8Tj+TgoGUdZMP6nsvKxRTaWAlyyovdOlxTxBHj3rLGaEPI95n2XkiD02noFs80+PTQqGo+qiZW3JvGoOK7C7dYrbRRD2CJqvS3n6MV6q9fmomz683zYARq2lwuJRqIapZGJ+h1ujJVzCLbSEV+Na+0j3inWhLeyGfPhPWgkF5Rvi9p+E/yJdJMqjHn2OChA4XqkQMzPx0ev9oWTspvvKp81PQYHQj0bHf7Ra3FyrOrvBnqdRyGnPTEe4NixvDr7CdXiP54m1EX+SyIHbTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6TgTaoys4e//PUHds5mYIJfYHEK41wavWMv4QdbBZgM=;
 b=jzIJQciDOlarj/Zrudsqf0pBc2ycZ7xJSVLSYAc85nyLzQLoecl7v4szvMtS42ZVNbJeH2Fvk+cB3RHx1l4A98I5CZuIHvi9EPgbG7KWzxIdw3Arw1ggWuHOdhXQVjVjhqIRrLvgVjocKis/ec7I0LXT7TPQYnPpn62aZXVoCXMZzW7ymsf9elg7k6jNoHWELzvy9AoMx3nk6znWY26dQe9b1VGp2VDT5ItjsIV/j3D96l6TevI2n/wsj1hcZ3H7X11n0ZEukCbSWN9hk9x4vwOj5LDKv4xpo+/c8Q7K/olMmOypqHt77jykvAp4OUdjdIheASJcYu3n8ABamPhBaA==
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com (2603:10a6:102:211::7)
 by GV1PR04MB10749.eurprd04.prod.outlook.com (2603:10a6:150:204::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Wed, 30 Apr
 2025 01:36:15 +0000
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db]) by PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db%4]) with mapi id 15.20.8678.025; Wed, 30 Apr 2025
 01:36:15 +0000
From: Wei Fang <wei.fang@nxp.com>
To: Timur Tabi <timur@kernel.org>
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
Subject: RE: [PATCH v6 net-next 05/14] net: enetc: add debugfs interface to
 dump MAC filter
Thread-Topic: [PATCH v6 net-next 05/14] net: enetc: add debugfs interface to
 dump MAC filter
Thread-Index: AQHbuC73pHRUZNdlukqvRmRqu3S9hbO63i6AgACR1IA=
Date: Wed, 30 Apr 2025 01:36:15 +0000
Message-ID:
 <PAXPR04MB85104FB93BCC89CB5F58F5DA88832@PAXPR04MB8510.eurprd04.prod.outlook.com>
References: <20250428105657.3283130-1-wei.fang@nxp.com>
 <20250428105657.3283130-6-wei.fang@nxp.com>
 <CAOZdJXWxX6BKqt8=z-dWNO15AunjbhNBkSi5Cpfx6Dn3Yw4BaQ@mail.gmail.com>
In-Reply-To:
 <CAOZdJXWxX6BKqt8=z-dWNO15AunjbhNBkSi5Cpfx6Dn3Yw4BaQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8510:EE_|GV1PR04MB10749:EE_
x-ms-office365-filtering-correlation-id: 18559786-35a1-40c0-b0cf-08dd878765a7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|7416014|1800799024|38070700018|7053199007;
x-microsoft-antispam-message-info:
 =?utf-8?B?emZRVG1pUVNGSzErQnBuR2FleGc5NnhDMUR4QTM1OHY0WHVNcGpsZHh5N0dh?=
 =?utf-8?B?bngxTHF4eDVQSFI3clpQYjZybE9jRm0vbng1RmdFMk5VNmxTcU0zdlJ5bjg1?=
 =?utf-8?B?Q2J4VElWWWROM2dwbTIyK2pxOVlmd3luMEZnR2ZraU0zMDhGTm1COEVIbWgr?=
 =?utf-8?B?UkRuVW1tNGVhS2pTTlpvclR0VDY4MjZJME9SUTh1dFlQM3NuN0FLZDZXQWhW?=
 =?utf-8?B?b0JSbkxIMFF4eGN5TndlQWxINDlmK1I2amwwWDFFVzlxUlVXalJFalljRjRn?=
 =?utf-8?B?elJ3cjc5UytCQzhhdm9FZzlCSGt3alhGNU52c3VCcVd3SVdTMmpsVlpUbEN3?=
 =?utf-8?B?WDZ4UDVxM2lvTXc4aGQydEFZQUNDbXltbzJPRFVlUS9vQTFOVFE5Z1J4TGs3?=
 =?utf-8?B?S0ptTTFLOTQ1VTk3T1NIVUw2VzBCN21QWjFScEtWUDRoNDhwRVRRRG80eDZK?=
 =?utf-8?B?c2Ftcy9ZOVRXSlBXRTFlbVdSNFcyamNmTGFLM1c4OXEwdi9mMzdIZFFhck9E?=
 =?utf-8?B?cWJxOFFGSWxDMnk0TzhiNVFNU0x0QlQwMytYbUJqL3VIbHhvL0JJdzJ1ajRv?=
 =?utf-8?B?MStQL3VtQlIyYnV2ZXZtUDhRYmx1bERXUllTZkdOVGVMYU05YjJTOFRmNzM2?=
 =?utf-8?B?bFZQTUxaNll1MkloWSt4Mk5BaThMb0pKZlFWaktFcUtvV1pJTHRwbnhRWE9t?=
 =?utf-8?B?bFo4Ujg4L1hkQzYzandMdXZYMG1oRzZhMHhYRnlnemswYUdhQ3VaNDZ2MlFw?=
 =?utf-8?B?VzVBanZIdW92MnBCK0tkc1hWdXpXKzY1bkpPdnZadzl1WkFwWHBRbmJMYmUw?=
 =?utf-8?B?ZHhYM29aUkkzM0tzUm5EVzB3MkRuZGZnNlI4VEU2R2phSXVCYVA3Z1FLZlIz?=
 =?utf-8?B?YlhWejNpMnZKbndia0RRQmZlWUs0RUhtUFRWWXNMbVl0eFJZbE40K0llVE5r?=
 =?utf-8?B?NlVZNGV6ZWtybWpMYXhoT0RlVnBmeDlQT21zU0JxbFgxS2x5dlVYVnEzUXRn?=
 =?utf-8?B?a0dwM21RYklDKzBLeDJUbmFQakhMWWZwUE1aWUVRTTRKNExSOTRNQ09UeVFH?=
 =?utf-8?B?RFVVN05TZU11S2ZNUVN6eElSeE5uRDUzeXE3REVJUFhUdUJHRWpnSGRjd0sy?=
 =?utf-8?B?TCtTQk8yM1hWaGFXbWlpZG02dmlhVWtLUnlESEhJcGZ6ZEdIK0FLUEd1c0tz?=
 =?utf-8?B?SFk5TUdoRk1tSERqOEhwQXVLTjBrTHlhTFdQaHNZUEIwYXVWeTFsUGtXcFNR?=
 =?utf-8?B?SS9MNko2V1ZSaWtFdi96TEtEeDRNcXVKSHdaYzAzTDhCUGx4Y3ZwY09mZjRC?=
 =?utf-8?B?MHlJTXZVQjh1U29qdzhxRXlNeEJlV2x3V1RoTWNFNTA4M1VYdVpiVkRTbkZG?=
 =?utf-8?B?REZSaldWZVZxMUVIemdocVAvMnRQdXoxN2N3OGR5ZUtPd3RHSXBSM2d0Vnl5?=
 =?utf-8?B?alp5VWFNQUZhUXZIZkJ1V3MxY1MrMjJPVEpnU2lFd1ExQ3NJbXYrQTJybndP?=
 =?utf-8?B?eVZ5VFNqbEJTMFovVlJpeDNYRGcvZ044T1NNTW90K083VzZxUDIvcDlXMGJC?=
 =?utf-8?B?MGhGamxzVXh3S1NqazRySVpzWGNadWdxemliRGtVY3c1NHh1bzlHT21BT215?=
 =?utf-8?B?dTNyS2tmcUNVNnhTcERDVjF6NWJqYU5JMWJaaExRTW5OcW9uZWIzS2dlQUI1?=
 =?utf-8?B?cFJNL2NBNTdoVkRwb3I2TEo0aW11ZE01TmxGZ0JmTDY2WWVaT1lvTEZrZ0lw?=
 =?utf-8?B?SFRMaHZUNzEra1NkOGNreGRTaEhDaWRpam9OeFl4MTBRODY1UTVwKzBoM2tv?=
 =?utf-8?B?ZWZUSG1mSFR1aFBhclI4Vitvb3hDM2xtWVl6ODNjcndhUHNaQUpuc051d2Qv?=
 =?utf-8?B?cHhCTGZrbDFvdUFpVm9IeFZUT25zTjgvWXVFSXJKZy9qdlB4UUpJMGp3OGxV?=
 =?utf-8?B?cUJ0VG5rUUY5ampEeGxqTnFlNjRIM1RQa2hRSWVXcE5LNzBYbDhkWlNtZFhz?=
 =?utf-8?B?eTNpVVBRa0VnPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8510.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(7416014)(1800799024)(38070700018)(7053199007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dUdhUlJuS25GbVRaSUJkY29VN3lvUEZJZFNxV3FBZ3hnb3ZaMmdyV3ZzS2Vq?=
 =?utf-8?B?dHRnTU9ic2ZacG1wRFlqTXM3V3NaeWZXazdjbU1QdHRaeTJNbnJsRTlsRzl2?=
 =?utf-8?B?NDdqb2N1NHRWcXppZW4vT0dWdzk5S3dJdGdSWWc0MDB1b0ZnYU5BQ0tZM1Jo?=
 =?utf-8?B?bXNZaHR4NlpIZHM2T1NRcWxTa3FlVVZQcVdhTDhxQUNzMUVFclV1VFZ3bHNX?=
 =?utf-8?B?SE5VM3ZHYVczd3B1T2RYSHRiY1RlNVhyQWZBREVnWjBmY2F2S2ZLNzRJSzNU?=
 =?utf-8?B?OHhIWGM4clBsbmJmeVJCVTJzMVJXOVVEYmxNU1FnVDRSb2VJcktTeWxBdjdQ?=
 =?utf-8?B?TEZkMUxFMkRaek9QcGVBY0N4MU1mTkhKSnNMajZFbGhrQ2h0SWtGampRZmV0?=
 =?utf-8?B?TGRmQ0lyQndvRnhXZGd1WDE5ZVZDQ3dJbXZYa2tuMXRTa2hQcENzZXhFeXRH?=
 =?utf-8?B?RFprMmlsbEpkZlFxV1libGI3T21UeEQxVjkzWlVTa1pDNzVWY0c0bW0yOWUw?=
 =?utf-8?B?NHAvQVNvWEFNaGtVRjNXdFMxZ2QzU2I4ZVR1Ry9ucU8ySEg4ZkovbUMvcXBF?=
 =?utf-8?B?bitBUjE5U0dsaTFuNFI2LzVtRXZKUVd6WVhRU2dhc0t5bkwzUUM1NWFJalZN?=
 =?utf-8?B?Yk5jSE51RUxwTFZNRHJsTE1aSFYrTDdHc0ZndXQydkd2NktqMmJhbFlBSldG?=
 =?utf-8?B?K2FKUlZNU3RLM0pwNXE5V1VnMjRTV1ZYa3BWeE1QbTJ3OGovYTRzOSsyQzQ1?=
 =?utf-8?B?Q25LRXM5UFQ5VzZ4dUVVQVFxYjkvdTVwaVBBMVJjdzhZd21aVDBVbEdrKzFG?=
 =?utf-8?B?RUNxM3pqaEJib3daWDdnTk5aTnZKV0U0WXd4NjVqT3NVMnBVVGsvQXhVWmZa?=
 =?utf-8?B?SmZUTHo5cnBRT2ZNTStHTCtUSUdTYVVtd21YS1JsdXJWTXNraXE5Rm1aTlF3?=
 =?utf-8?B?QkFKWHdaUkNvMEFJQ3JFbWZRdlZWQkxEUGJPUldOMllHNW5QZDc1Uk93dFp3?=
 =?utf-8?B?OHdQTHdiTm5iSU54SlVMT2lFNElOa3IvL0hSUHl1Uzc0RktuaE5BWXkvanJD?=
 =?utf-8?B?bzlFUXdnS0w2V3dZNEt5ZDA5cEFwdlZMQXV1NUdQNXRURENDSFRJUTk2NTNU?=
 =?utf-8?B?T0ZNanVaMm5RZ2M2R3VacDFXTjZWYjBqYUpINW5Tc0dXbzlhYUtzT2ZVUHB3?=
 =?utf-8?B?TlZFOUYzVitPS1U1allxbTE1SGpWNmpZNGhWRy90UmJwaHVuak9WM0c5UjB5?=
 =?utf-8?B?eUJ0cS9BZS94WEJiZ2xqSGsxcFc2T0l3eEJFdHRPSllFeDlNMXNIMTFJZENG?=
 =?utf-8?B?YWdPK0hXM2dTMVdPUW83STNZTEthZ1JvS2RIS3BYVzJkQm5oVUpzaXZlL2RU?=
 =?utf-8?B?Zk1QZ1JLU01SbVhMdGgzNEthYzFOUlEwWmw1QjFDTktaWXFqdUxsZklQdk1l?=
 =?utf-8?B?VFA1Y3JuUFVKaUNielBaMHltUlpJckdGaTg5cEJKRUNDT04yS0dhRTB1LzVM?=
 =?utf-8?B?YldUemdhU2hGNE5DbC96SVgySytIUC84d2Z2aWhweWFFd2pqd1N1eUZlUk9u?=
 =?utf-8?B?V1RKVDRXblJFSDJ0MlhXSGlzTVZSSWFhOFBkQ0NaTFR4V250Um9GendaSldK?=
 =?utf-8?B?TWRGWkMrUk8rVXFiY1hZMHpUaXRZc1dZbmo4N1dNRVJoYWJGSVJUQlJ0MmVM?=
 =?utf-8?B?TUJWQjIzRmtpbDFaalZ6UUR3ZjRMQ1BjMEx2VUFpaTBsZHdjUnljTDI3Qi9l?=
 =?utf-8?B?V3JFamJ4cEgrcXN0b2htb3lTMkdGdU95dnVRR3dwaWZxSUtQU2pGT0xkU1RX?=
 =?utf-8?B?b1h2c0ZTR1JsZjBlMXZYbnhzZEozcVlRMkliZUJQYTR3czlQVlYwV0VRYTl2?=
 =?utf-8?B?c1V2dElyajBYRmdicjVDczdzbjl3NEZJci80RlNqNnl6VXdPV0Y0K25LRXlB?=
 =?utf-8?B?Mzd6N21BRG5CYzFmb2tlL0dTZzdNeHF6MWxacDFtVjhmbFhHZmRFYjZuREFL?=
 =?utf-8?B?Uk1DUEdQZURJT0diUmMwWDNkRXBNRzMvVHNEQzFGZG52STNuTUNrc016cC9R?=
 =?utf-8?B?OFNxQXp1MVdKVTRVb3lOQTFndEovZDZhN1hXdS9ja01qRzNGQm11WXVqd1hw?=
 =?utf-8?Q?1j68=3D?=
Content-Type: text/plain; charset="utf-8"
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
Precedence: list
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8510.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18559786-35a1-40c0-b0cf-08dd878765a7
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Apr 2025 01:36:15.2051
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vQ2rlg+gNYSri9qzR7q9kNyeK1wXHKMEVAYbRDk1AXDqjrOVmPywxFyvIFhfgkV5aFFl113akSdNTfr63QGIkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10749
X-Spam-Status: No, score=-0.3 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	RCVD_IN_DNSWL_NONE,SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

PiBbU29tZSBwZW9wbGUgd2hvIHJlY2VpdmVkIHRoaXMgbWVzc2FnZSBkb24ndCBvZnRlbiBnZXQg
ZW1haWwgZnJvbQ0KPiB0aW11ckBrZXJuZWwub3JnLiBMZWFybiB3aHkgdGhpcyBpcyBpbXBvcnRh
bnQgYXQNCj4gaHR0cHM6Ly9ha2EubXMvTGVhcm5BYm91dFNlbmRlcklkZW50aWZpY2F0aW9uIF0N
Cj4gDQo+IE9uIE1vbiwgQXByIDI4LCAyMDI1IGF0IDY6MTnigK9BTSBXZWkgRmFuZyA8d2VpLmZh
bmdAbnhwLmNvbT4gd3JvdGU6DQo+ID4gK3ZvaWQgZW5ldGNfcmVtb3ZlX2RlYnVnZnMoc3RydWN0
IGVuZXRjX3NpICpzaSkNCj4gPiArew0KPiA+ICsgICAgICAgZGVidWdmc19yZW1vdmVfcmVjdXJz
aXZlKHNpLT5kZWJ1Z2ZzX3Jvb3QpOw0KPiANCj4gWW91IGNhbiBqdXN0IGNhbGwgZGVidWdmc19y
ZW1vdmUoKSBoZXJlLiAgZGVidWdmc19yZW1vdmVfcmVjdXJzaXZlKCkNCj4gaXMgZGVwcmVjYXRl
ZDoNCj4gDQo+IHZvaWQgZGVidWdmc19yZW1vdmUoc3RydWN0IGRlbnRyeSAqZGVudHJ5KTsNCj4g
I2RlZmluZSBkZWJ1Z2ZzX3JlbW92ZV9yZWN1cnNpdmUgZGVidWdmc19yZW1vdmUNCg0KT2theSwg
SSB3aWxsIHJlcGxhY2UgaXQgd2l0aCBkZWJ1Z2ZzX3JlbW92ZSgpLCB0aGFua3MNCg0K

