Return-Path: <linuxppc-dev+bounces-11754-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A97DEB44B9B
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Sep 2025 04:26:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cJ0Zw6YHrz30QJ;
	Fri,  5 Sep 2025 12:26:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c20f::7" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757039176;
	cv=pass; b=WDI45SJt8b5/3Jq68NS2ayRnspaR5s0gRjXk0qY26jsFlUyeHChEOpwiqqwAQmHKFj5wR7purTtYSHf0eut+7j/gZE6XDrBQ5Iij0alYa+pLO3FvunafwBMliaV6BG9iM+N43om475es31FA0erwqpNn/fsJavAyfv22tHimKRw7kq11JhlJGw2LtmSuH9KzW6u2xetfpKqXJiocBvfRQffhbCu/BSjsN1xCwgSPoqHbVRwJvupBwbK1+gKP95IqyEfrxH0a952QtlZkzi79o0kT06S4XviO5UlxKcr1O+ThLt7iH04y7FzH/Yjdlqzg8WL3fQ/5SVq1wgwK0w5y5A==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757039176; c=relaxed/relaxed;
	bh=FZfNIOHdU1maA9yt0Oh1UlSOE4FsDJhs94bEPM0WFzM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=M+FzvUm0ALNFYCptTHNVoIYxd2aG4xyhqRgv3+rDWdSzKAi73qLmrr1paSSP45LHfmiB+XANR+2EhCGp9biW1utOBfieJ1R+Ypa0iFReFpAq8HXbci+7fJxajhZpEfOh5I1xJ3cMn1OvtRKqjhe1jcnUQb7E1RkynmSQm8O+vGmYYFq5mbr+V8of8eZMtGLfAgdpqqW1iH6XVFCyDc5lPpjjRAvlxh89pS3ApBiDy0V3elMaM3/v8diTJJNnRmCCPoXyStC46gIQkAJPa/SVAuLLv4gz/biU7E0WGc5XjN78DZeXj0TI3R0gG/dE4IwKPGayWWAJEGeXPeWV3wOBCw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=lQ2Uc9NR; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:c20f::7; helo=osppr02cu001.outbound.protection.outlook.com; envelope-from=wei.fang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=lQ2Uc9NR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:c20f::7; helo=osppr02cu001.outbound.protection.outlook.com; envelope-from=wei.fang@nxp.com; receiver=lists.ozlabs.org)
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazlp170130007.outbound.protection.outlook.com [IPv6:2a01:111:f403:c20f::7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cJ0Zt1d2Bz2yrP
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Sep 2025 12:26:14 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=diCTfzCUYPOPDGTeDy/0UUpcEngoXjnySJfTBdCIchUC6AVdZD5jJ/TQH/aCK5fSnNkvqNytWYd4NiTyWfav7Bt2mGIyXTMYwmdbzrE+HgYOI5uUh90N35UrY+qdLSAXPCG7uE52zOTjLX7VvX7v79aB2p5bdZbFvqSXOr2A/QX71UXBmvplcisQ418n33aNEwDaxgjIWN8jbfRN5n8ire6u/aeNYtJ5J98bPjIQhVo8EOzt3rMkNQ9cj9kajqIKeECvPW0zgaBl8tIHRf25+CUof7X/o8n6tdNiY4obEzxaxYMVAs2PLO+sFj1RWJrOx8jYEzghk1oWNYiSUCiQgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FZfNIOHdU1maA9yt0Oh1UlSOE4FsDJhs94bEPM0WFzM=;
 b=t80tAEN7V9WAnjUSfNVeY1sNkwcLfCDUOVg02fS8wjNHmDuryZR8Zp6PavfqeUU53TfheUgtpvbJtjNKZItnBcRngS1PKue1vcqxJlBLMHX+oby4jx5HaPg6VpClz504cm4N2qbn4trvlivXKZ+fJuBWGel8ZnASTxWFHogCleEQ/aAUZjUpmvp2ogS6fiY16xNp+24rq4s1d7aQL5BfJmvN9+ISlNNmFw/eb2W7EmuWi8g6buDmR0N1/bp+2L82PlyS2dv2EqPUqULZeBX1enCYBc/vSB6va7+jWVZY+uUmw1doaM3c0B9hrXvj1HUnGBjT11d+Fvs7PEc1EFG3kA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FZfNIOHdU1maA9yt0Oh1UlSOE4FsDJhs94bEPM0WFzM=;
 b=lQ2Uc9NR5EiypJUs5CEJMTSI6P5xvTPiUYU7aXe/xWHDZPvuKFw5tq9Dr79tRUKKPvZaflFqSmgVf/AgCHRhrQ79I8dBVzGqxgbEJN25AxHkPjmi/u3n9lcssRi3yY+dsW7cA620OJaiGzV6RS92Wle9iUO+uulwONjeIXzHBsMSI4EYC2t/3SlBIj3qlHEbiSI+CWloveVzsYDqhBL31W5oGQRSPdh1/CaEdRUZAoyNMNCW2DY5mo3XN11HUNZJFdDb8f4LNFg53b8QmACvOxXiJR6p2yX83TPvxQpN1EmZWGcT5f7J+DAVGe0VZWrXIATEL5ciHvKSuDzRrlyICQ==
Received: from AM9PR04MB8505.eurprd04.prod.outlook.com (2603:10a6:20b:40a::14)
 by GV1PR04MB10584.eurprd04.prod.outlook.com (2603:10a6:150:210::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.16; Fri, 5 Sep
 2025 02:25:51 +0000
Received: from AM9PR04MB8505.eurprd04.prod.outlook.com
 ([fe80::bb21:d7c8:f7f7:7868]) by AM9PR04MB8505.eurprd04.prod.outlook.com
 ([fe80::bb21:d7c8:f7f7:7868%7]) with mapi id 15.20.9094.015; Fri, 5 Sep 2025
 02:25:51 +0000
From: Wei Fang <wei.fang@nxp.com>
To: Vladimir Oltean <vladimir.oltean@nxp.com>
CC: "richardcochran@gmail.com" <richardcochran@gmail.com>,
	"andrew+netdev@lunn.ch" <andrew+netdev@lunn.ch>, "davem@davemloft.net"
	<davem@davemloft.net>, "edumazet@google.com" <edumazet@google.com>,
	"kuba@kernel.org" <kuba@kernel.org>, "pabeni@redhat.com" <pabeni@redhat.com>,
	Clark Wang <xiaoning.wang@nxp.com>, Frank Li <frank.li@nxp.com>, "Y.B. Lu"
	<yangbo.lu@nxp.com>, "christophe.leroy@csgroup.eu"
	<christophe.leroy@csgroup.eu>, "netdev@vger.kernel.org"
	<netdev@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "imx@lists.linux.dev"
	<imx@lists.linux.dev>
Subject: RE: [PATCH net-next 1/3] ptp: add debugfs interfaces to loop back the
 periodic output signal
Thread-Topic: [PATCH net-next 1/3] ptp: add debugfs interfaces to loop back
 the periodic output signal
Thread-Index: AQHcHLD8ewvtanB8Y0eGvBgSbKKSlrSDBrdKgADW9QA=
Date: Fri, 5 Sep 2025 02:25:50 +0000
Message-ID:
 <AM9PR04MB850521C7E01BF30E5BDEB2E88803A@AM9PR04MB8505.eurprd04.prod.outlook.com>
References: <20250903083749.1388583-1-wei.fang@nxp.com>
 <20250903083749.1388583-1-wei.fang@nxp.com>
 <20250903083749.1388583-2-wei.fang@nxp.com>
 <20250903083749.1388583-2-wei.fang@nxp.com>
 <20250904133011.asqvsucdmuktazc4@skbuf>
In-Reply-To: <20250904133011.asqvsucdmuktazc4@skbuf>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM9PR04MB8505:EE_|GV1PR04MB10584:EE_
x-ms-office365-filtering-correlation-id: f60be124-64eb-4a43-2396-08ddec238838
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|1800799024|366016|19092799006|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?P+SfE6QJLySBighYKF4y9wtkCQT6rHAtCNKJXWSGAqB5h2CnhpvrB63aaJ7+?=
 =?us-ascii?Q?H+SGNv5NVCazmDA6tbp+NHzrJcpxBg4VZ62JK8vxXrVM1Fg8QFvh6P97AIDu?=
 =?us-ascii?Q?9+foNdWUZPfsfPJtRrbMa/2YR34llu8G8kbfJRqqEEAPCisHbZI1EmWJ5jbM?=
 =?us-ascii?Q?bKtxu7pT6fimEyVDg+nZzh7lU2kiWOaPHcpl9SlIWORYE8MsNnDiLAwEOUf1?=
 =?us-ascii?Q?RFh1HOpHoaFLZj9BwTl2HlKkk+JO07X8FICFiu6EUWMN1+dPLcT4Oc+9sclN?=
 =?us-ascii?Q?QmzqXrNYTDI/LHoj+1Pgbhj7WG1iFy/ROCoS68N0z+45ezku3BkBgrLVh3nT?=
 =?us-ascii?Q?TNtj/qw+0WEH31iybc92ghjyt8JSb8AvlJ8bjtOSDEESoSax+qNlfDhJDpS1?=
 =?us-ascii?Q?T9i+icZmekP9gsYsoWHxXwrAKrke+6190vwMAkNkA92sPllADp5BMG+lEBAm?=
 =?us-ascii?Q?ig7glxF4fNxNIAVbMzoIa6UXv3Yh+2eMBkkCMh83zCGmDd33yiCfXPByjYNi?=
 =?us-ascii?Q?gzbH3q2Vo7v5ngCDbGSFnMB0lsJag6R7jOpgStAg+uiCDmRrIZM536fO5UXW?=
 =?us-ascii?Q?HnnCaSwjpaf23ktJOyHLzBXCTeTu57cGQncyJz3WYwSDLfgjo49f6qhL49l7?=
 =?us-ascii?Q?JWe/d88ykrRrwrdAi3ijSv4xcjZgL1M3VERk9hw1fCR62UWHh/60cVdjQuyZ?=
 =?us-ascii?Q?G0e8hElQUTLJDnL1wXJiy4P8v4vuRCcdfis8WnH2ugzMkgmGNiEhp4WlXMsV?=
 =?us-ascii?Q?G1c7c67J7HmJZz0NSzqZEzpPycL5UvYIOMZPQc1WYE3BnDgFlztaqfwAixby?=
 =?us-ascii?Q?yRBTfiuvIWdSHUqHDLtsvcQR3t5M1WcYYrIivPt8SMdn8HA+TcIdKuf9sFf7?=
 =?us-ascii?Q?4nYhXNRqYT8pJ8KufyyGc/KVAxX7Rt4Te92l55eqyvVpMA1lS8ZGdzLWOSWp?=
 =?us-ascii?Q?zsG2zHISc1gvBjltV+0EIR2YM9MZN2h1hSxlYbK5v1oUgGZS2Rq3D9d2KoEb?=
 =?us-ascii?Q?DaefFhcDrCz3ISgk+tPSdtXtcMyuAQiv1Nl8hdH19SFYSDfCF2OYrQsO/0v3?=
 =?us-ascii?Q?22cLuTHpnf8bYb3M4KxMTtWkM0+UM4BVAbnwxPEXhPSMqLsC2Oy69Jz/9TqU?=
 =?us-ascii?Q?35yexuvaG8o+AV7YqKcMZQQAmHENR0EsAGRturfrN+ON2l4dwGlS1m149W1c?=
 =?us-ascii?Q?9uUjrWp/xhKaveZ9NQsbXmVRnV8XZzYhnZwmxtAJGnmzDofv2D3fWbi2DbOw?=
 =?us-ascii?Q?tK1lyjBVCC6w524M6+miFIKXC4LW4GazK/QI5F5jCOM8CY2HfkQuDLVM3rS7?=
 =?us-ascii?Q?F2J3upnRKF5dNzARoFaPy/VVEx5eFoFnVPp6TVDRPfhCiMB4f8t3HNeIUxie?=
 =?us-ascii?Q?UDfYz3wT58LYYOkQ1sLe/EDWVzXNPummsGzyeFh1zRP2qsjKb3ZxYki/YwWT?=
 =?us-ascii?Q?kE8Lfbr6SqwPkQCuFbeRedSaMWukTHDRppkB+Hxjv1F06LqyEC751w=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8505.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(19092799006)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?qmaCrB+f8VkbDOtTxW0W9E/SeWwfobsEkHyhAcShXtGXnAa71ihc0Tl1DeS7?=
 =?us-ascii?Q?E45Tu4LhydcffYDMEn49qOaoy1beJCh66Spz0cl5DQHGXpdHdJJyRNBgQn3E?=
 =?us-ascii?Q?p7qsswMntk6tSJU2EgAzkKJzXPT8yAvP7seiXPp4QXAFCkXpHRcN3ofAMK4H?=
 =?us-ascii?Q?cL7O41NYY6XiDvXbc/7N4g4SWCbRIJdYwrXJFDy02AVxKipJqS5jFSq1tvME?=
 =?us-ascii?Q?BLDN9g/LgJe3MgAnBFmH79PxWXLmn1cTfObpQy44av22ZaDFIEduABS/oX2D?=
 =?us-ascii?Q?+uWf+OBrprKIXRjG7JdcHfvCBGjdVb8mOnmee+97ZbTcOrVgB5ZtT41WQhIq?=
 =?us-ascii?Q?Ch0ll1Gz03U7MxdizzwbRSsFj9uJlhFdRUZDvtOabpel+IxlWMK0Km2hAHku?=
 =?us-ascii?Q?kg4xbjBC4hgHxIx+8ctc0tNKhtO3PEMepDK9mTfF9hPoo7bshkUIvcaw/Mvw?=
 =?us-ascii?Q?CByeBU4Emare20wJk5C7P+BecC/0G1RN3y3B25u4RvN1eC7DfqGH2wtevv8s?=
 =?us-ascii?Q?jaJP6PWZMTb4pr0bApohHi4i1Hg6+2UXk630Tu0iU+xYSn9OQFdt9J3Tg9E0?=
 =?us-ascii?Q?SAHcvPSPusnMISIBRRf/Lprkhr2ONvSRWAimQG8WzXBIejLozGhrD6C+yqj4?=
 =?us-ascii?Q?rDvxRudyJOc7657HRydaRKpKOYvvcgPLPUTrFqpw+EUtMrTZkkuPOPJh/v1d?=
 =?us-ascii?Q?MCJW3s5YpNil38wnvZHzbMZjrU7f03WUF2cxkab6YpzIlQ3oqTbuwMm+LEGn?=
 =?us-ascii?Q?Sw3bmBdWRQnHye7ZFCxeGeZToFejBm6rT0DL7oASsgWp6hMSLY1VzAjJA5Mb?=
 =?us-ascii?Q?v1EIfgA3flFGSXi2yGUuTlMdeoTlN5rQkuCTjbI8X8JI0n/X3UrpHHVwqPWF?=
 =?us-ascii?Q?i+vVbMwg87hPziulWsFNeCG2s4Lzbos9a7NdzMBoiBtRV1XRf0FDuRtglEaa?=
 =?us-ascii?Q?mpRCSW/4wmH9XSUmx3poyK7KefjnsQwwi00cKAeZdbjWy1BMGddJHyNAxQBM?=
 =?us-ascii?Q?jjYtTCbmI+Dxne4xEZRPPaN4DHl6oaw3nwn03YwBMJ2zN7T3XXygwEpuEyL5?=
 =?us-ascii?Q?QrIOIzLLVbPTmr1JkfcRco0I+NVVwFAS21WsKuNNUPhLvdZhwQr23knc2tuv?=
 =?us-ascii?Q?iz6aqHdMHX4nvugb9LlgWkrzimJSaZnhABkhffgv7dYvwvLAwCPtPTK50/gH?=
 =?us-ascii?Q?bJYx9TkXCu4Ct4Wi1PlbLz8V9g82TV5+YbJpisYnuceRVTjkFEurUiA5Bjg3?=
 =?us-ascii?Q?2Fu7e9EDkAhVS9bXNV1+nWSUxbJe2lFGCCs2F0iojQqhqvNOcZ+89j1VylRD?=
 =?us-ascii?Q?ZHc2S9KU3MZIItLJp3rrSMZ+Y9bxjSMldIDXL8R+OkQyqwY225wIeOv6O/ZI?=
 =?us-ascii?Q?74RVJ4VMBYatDBkkxcgRMTpSI7iR9xV0npmx9M8kB0luN8VFdTMoQh/WzFeg?=
 =?us-ascii?Q?27t/epA4AaDKVSTDsbLlGklxJhFUmR14DLBoYb3/1BOxg9M/wSyZKFRx+7BB?=
 =?us-ascii?Q?rXcjQ1IetPvVIk3lGIbXRROv1S2PB2kddWSRSCrIV/l8pQe4cZuV+qCSvURV?=
 =?us-ascii?Q?rTYR0ZIU5lfbPgsQOT0=3D?=
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
Precedence: list
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8505.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f60be124-64eb-4a43-2396-08ddec238838
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Sep 2025 02:25:50.9537
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Cv8ywDPUpWPTzSeuot0QbdkvY3m8n1dXliM5KgIYdNntpnGDttl4P75lvok1SlkPafImUjPssHUjRkqpTkI0Lw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10584
X-Spam-Status: No, score=0.8 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

> On Wed, Sep 03, 2025 at 04:37:47PM +0800, Wei Fang wrote:
> > +	buf[len] =3D '\0';
> > +	cnt =3D sscanf(buf, "%u %d", &index, &enable);
> > +	if (cnt !=3D 2)
> > +		return -EINVAL;
> > +
> > +	if (index >=3D ops->n_per_lp)
> > +		return -EINVAL;
> > +
> > +	err =3D ops->perout_loopback(ops, index, enable ? 1 : 0);
>=20
> Why not just reject other 'enable' values than 1 or 0? You make it
> impossible for other values like '2' to be used in the future, if they
> are currently treated the same as '1'.
>=20
> Also, signed 'enable' doesn't make much sense.

Okay, I will add strict check to the enable values.


