Return-Path: <linuxppc-dev+bounces-6817-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 26A48A57798
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Mar 2025 03:06:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z8mjB20W1z3c78;
	Sat,  8 Mar 2025 13:06:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c20a::7" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741399566;
	cv=pass; b=EQ6v0CjulUHuYaCPcxD1BPursLYqF3m7KzHXJHbMs/NNZU5X9eJbfncrpxUl9hFPlFqsw+/ZrYfz5DKb16BvQwOhlmke9Wg1HgqnbEMBH9w5GedwVaId6hmJhHEB4bsfLzh+Jon1ITZlYhQGwclB1tusvrc5bjxFNcL310rqWkfUcxn3Yp8mpUsEcoDBIWV3KBGoBsLQFDfYtSTi72vRua2WCffOMRdAIBV1Gs5438LVz04/P+vGV4lhDBjQ3E2F81pWgrAAC9vw1TMTNvnkwML5jVXvIn2XD1yDJ0S21UOG9tMY9aArzHk4YdYzKPBXqc7tTWt2hh1qfgDgvBGDqA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741399566; c=relaxed/relaxed;
	bh=e2PtgFb6B6Nsje0z6HDmc1vvWNo0dV1VutTqdYOm1NE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=LFkkTxgG9erSbj0vo/2l7Y8VwCZbOm1trixIyLSdeqfkb2rBU6wrXyblQsnV7w+QOENS4TAXin1qoWenFPJ4hMW9+auLzRZKbJ9AppC4NPgBvoTbUkaoZnNWa7/dCuKPdHSj38kNQfV8oPmvbWQ11+aN/j6fMg1Z0B9d8A1c08UegLEJMpzT6F6ojo2fazLd047LaPXD0VbvuyCHfGyeJUgBFKESwccpWw8WpIVd3znjiDTDXKxF4AZ9gNMxmnHJs+mzMFb/8fmDj/0VHlaMEBDx9DmeVun6TiBEZshfBElO0ikdgx17VvYNY+G/igXlOBS10700x0nT4q93dDwQ2Q==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=FVrXrqgu; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:c20a::7; helo=pa4pr04cu001.outbound.protection.outlook.com; envelope-from=wei.fang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=FVrXrqgu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:c20a::7; helo=pa4pr04cu001.outbound.protection.outlook.com; envelope-from=wei.fang@nxp.com; receiver=lists.ozlabs.org)
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazlp170130007.outbound.protection.outlook.com [IPv6:2a01:111:f403:c20a::7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z8mj503DSz304x
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 Mar 2025 13:06:00 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VodN8Y76iZyL8wzqlYvXBLHDiV9SKplWRvaO+ds6cOz1ZmctDZvSH5LAgM+EoLcUiTN9qwdGd7QHyWm7Tf+lr2BhNr+8gVcFqr632UcoNg09A+mqaM0XxpgAY36P+dAm1/vJ944qEUqcGRabq7nTBo/xPanvkS26nMfR+2/0V3WZBIxef1mbXrUNq6lNCCxqzYq1Fr5zHyrbhr09EtSgZlCnb3L3UNRdvYFURMCL29Cktk4EuFSeGhCjtjjSWXuPuyLhhaDushjA8nk3+Txtrow+xeQi+iW8c+FbhFcHV5BpOidpSEW8Mf1UvGw2PXzdBu0jcsU8tJ8t5eNpByC/TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e2PtgFb6B6Nsje0z6HDmc1vvWNo0dV1VutTqdYOm1NE=;
 b=BU2IiRdfzMmyfSN6+aLw7Xv+6Qd1adJwMy8XkodN3CbdjHZzfTbWPeD7yXKADrh9a2uh5fWhd3iBClZT7sx82FXBdDtr32vnD29TQp3fGyg8QjPDuysGZsN5YeNhnIjI/W9Lycq4WXHsIv5pMRk1wCkdmE7h6Xzm/qNrVO2KYX/7YeEBE2kjxfgI4pphdfDa8zVPUhUWue/hgpSU8fqKgDtqwvLdgX8cR3hR3llhsHsFk6Clfm/NyImktf18DOuqOxmALklyVu0gv1dHYtQLLmaWQCQvQF1Q3kwH0KQTbW/k924RTjoYJeOP6r16JomxPcnltvyprWhp4BcUIIJkXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e2PtgFb6B6Nsje0z6HDmc1vvWNo0dV1VutTqdYOm1NE=;
 b=FVrXrqgu64l0DByk0AVVLgmPJWFD/azs6SNJWOZad8pu+l9guOXhE6tqGdLAoaZFgQL63zM0l5dyJNVIObYws6PblBG/HViPOt3CIEXfs1Iicot6ZPlge7zb3Rh2QM4aTKkrQTJe5RZkWkvXumi0MHotAJnSzOJcpL5Etf4r2vnQA67qRDEYiVIPtQ5v4RcHeMEjaEnamV7xYKQ2LQCdTzsJTZVEfD+YdtKS0qhad8Vwtj9DGSrUYS08oN/TrWrpKH9rqGsB6M0gA/J+z0fRFmHLbL3Se48PQtCC7rdNuEMvg4ffhazSNosGZCTnBTJnp5gtDcwUqjbqchRnci/mKA==
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com (2603:10a6:102:211::7)
 by AM9PR04MB7668.eurprd04.prod.outlook.com (2603:10a6:20b:2dd::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.20; Sat, 8 Mar
 2025 02:05:36 +0000
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db]) by PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db%5]) with mapi id 15.20.8511.017; Sat, 8 Mar 2025
 02:05:36 +0000
From: Wei Fang <wei.fang@nxp.com>
To: Jakub Kicinski <kuba@kernel.org>
CC: Claudiu Manoil <claudiu.manoil@nxp.com>, Vladimir Oltean
	<vladimir.oltean@nxp.com>, Clark Wang <xiaoning.wang@nxp.com>,
	"andrew+netdev@lunn.ch" <andrew+netdev@lunn.ch>, "davem@davemloft.net"
	<davem@davemloft.net>, "edumazet@google.com" <edumazet@google.com>,
	"pabeni@redhat.com" <pabeni@redhat.com>, "christophe.leroy@csgroup.eu"
	<christophe.leroy@csgroup.eu>, "netdev@vger.kernel.org"
	<netdev@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: RE: [PATCH v3 net-next 01/13] net: enetc: add initial netc-lib driver
 to support NTMP
Thread-Topic: [PATCH v3 net-next 01/13] net: enetc: add initial netc-lib
 driver to support NTMP
Thread-Index: AQHbjNiMrmwkTzPG206zUiHxDe17mbNmtIkAgAAxcACAAZzhYA==
Date: Sat, 8 Mar 2025 02:05:35 +0000
Message-ID:
 <PAXPR04MB8510771650890E8B7395B2DA88D42@PAXPR04MB8510.eurprd04.prod.outlook.com>
References: <20250304072201.1332603-1-wei.fang@nxp.com>
	<20250304072201.1332603-2-wei.fang@nxp.com>
 <20250306142842.476db52c@kernel.org>
 <PAXPR04MB85107A1E5990FBB63F12C3B888D52@PAXPR04MB8510.eurprd04.prod.outlook.com>
In-Reply-To:
 <PAXPR04MB85107A1E5990FBB63F12C3B888D52@PAXPR04MB8510.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8510:EE_|AM9PR04MB7668:EE_
x-ms-office365-filtering-correlation-id: 4b63c16b-4bf4-4eb6-e821-08dd5de5b744
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|7416014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?rvb23W07Mos5lUeDZstJUfiTns7O5ZqVmq+HwOcztePtunzfoXOKxV0oTe9h?=
 =?us-ascii?Q?Hanrh4TRAbkM5+uqgQI35+8ai4CQ892EyFfQCYiaeIy6CkLsl4p8F07kiXok?=
 =?us-ascii?Q?1ojT93fwU2uRX457EmpE14jd5xalCG64LIdkQKkwP6Jn209Ahb2rm8947wSN?=
 =?us-ascii?Q?QUxqnrYk3OYhNSFkehIYukOCmtzUd5rBIIxUMX65YdZzY2ijtDbtdlmHrSmu?=
 =?us-ascii?Q?9HwDMD4P/50HzY77RCMnQQBTyqovQwakuoOrvntg67XfekM1XVWuFmNQkXF/?=
 =?us-ascii?Q?+WIO0Q2eqcXwsRnN4u2uhb0lrLjcmgpJs4uXEbuQIZWYlqKdjDaFt/C/BFoL?=
 =?us-ascii?Q?XVW5ARvgepSxvfygJ2HGI0z6lDI1QBgFOeiffXbjutHL7PMZHVRuPjSojy8h?=
 =?us-ascii?Q?om4RpmA7GbowHWEbhSiWFKj5fJRdZ02G/34aaAHIKiw0qG+LDyhVgLdx0vRJ?=
 =?us-ascii?Q?wd9DkLFjHl2Z6RMVT6DwgQ+1Ua9k9Pe10VOgihiyvsBt9Fh1pyf8AoS/cEII?=
 =?us-ascii?Q?uAlo2qaS/fm6kuTvV6l43rEIB5yqFhPsqkC2RFhYGz1q8L1w1tVM6ensvMhr?=
 =?us-ascii?Q?4IxMQMZpgUmg6W7yycv8LgF4aGtJ25BowmdZc103lMfNUkeYTIxLmkuNF3R/?=
 =?us-ascii?Q?fRxaE+XEx0ZEAayCREAnXLs5uyBgnL5xFkOu9OPVt4EGaWSQKdaR3Xb7uhzy?=
 =?us-ascii?Q?IY5xz0g1HOyuWAF18bCeikf8MgAML4LTuKZA3vtYYDTIqgl+WhAMJGzCOQVX?=
 =?us-ascii?Q?WUf6ziShDDmS0BKI35jg3cJXh38DtdJ2ov2T96lyKrqg2Xkoq2YA5YfAcE6C?=
 =?us-ascii?Q?CLAvz4sNsVgXgVYnOOwVkh4AtW2VhHtxjJzAS/4iB23KLlRL8Hf5LxeHMt2B?=
 =?us-ascii?Q?zwOxIiHvNlEbTFwV2aWuapU9fh1aU87MYwym8960BuDuVdu6eL9zcq1KkRob?=
 =?us-ascii?Q?cZeMB7amFTEjfGGRzbYsh+bJGuO5gEzAXLmBU1x98+lOB0HgUYd9ROUOQ4cn?=
 =?us-ascii?Q?Ip3jXj6Qoy9Kr2gz3JUtzA1bBPPn5CbYcz6XMyxf7LJgn/ZUrbKduKxajBt2?=
 =?us-ascii?Q?U5DvL+SguzbZ6uq1EzzOyZtDf8w2DC8oqOQPBXSvSMp8yOWI24unUK6Yz2Gw?=
 =?us-ascii?Q?q89Tzc45qlHPwu7hhgpl+YFzNHXNSgmTnHtDcTGfqw83VTrbSjisIc0F+Tf3?=
 =?us-ascii?Q?paxYq50R5PKMD6+U48xleb6cS0eNTZw7UCDXha5sPmFcetCLsjRt+FAsaTJf?=
 =?us-ascii?Q?79lq6/5xBXbIMFHn/QZd/GWFsmxSl1MNbJtmZi5lQVlp01BEQiEoEFWQEbcx?=
 =?us-ascii?Q?7wY2mfL4Bhc9Hsesdb/vfeOXgF8D4A1y+6XkJ76xmRsS3ya7gmXw1syc1fPG?=
 =?us-ascii?Q?37yO2gjsW7DhEf1VP4irIHqfKxMTpXIGxz6OnPaO6hna1OWHX92o9SUCf+YW?=
 =?us-ascii?Q?mxOOHEd77ZlPa9MQoTgpHJBzjCzj952o?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8510.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?uLJ596OwPwJQJADAct7Q+a5yd4gpilvyj0RjzEW5d6xI3MZ1aLgrLAnYLFY+?=
 =?us-ascii?Q?/sX7cvRFBZUbPYQ2OeI29BQv7CB4j+SBpegOHwKaeAoafLeIJAOBkfrTVu1T?=
 =?us-ascii?Q?wYLojGcjfun/cuxrUrET2GdaJAKMBS9Iqbg3QZUJzn7cS6Ymr/PQjJpqk5Us?=
 =?us-ascii?Q?J0MRXwPZLOrJV3i/BZ0ZJNxj/6ANdhEpAIYRaf6nyL4EMzFO+2MWGAyVrCQi?=
 =?us-ascii?Q?eZCQSIP0r02BbI29QUrY0g8A4IF3fCfcj+c4Sy4RYmTEw0Jl6LWrcuob7xmh?=
 =?us-ascii?Q?Qb/x3X1v/N97YG9RzV8YlcRSP9bLG+wxyMovimDZGKkis6LxQ0ZLJVJRGzSN?=
 =?us-ascii?Q?PqXL7vO9XA9UYhaPHRNoKJ+c03Fatt30oWxMcy+CMHdFfIRnQ9Y4iSlNXWlj?=
 =?us-ascii?Q?CZLRnOAmyhzr3qI3+8qGIcTDmowLedH5yNy54+DxsP0Z5F5EjdLRGriV3esY?=
 =?us-ascii?Q?ZyT5eXtLLbunNm396WymX3NaMzkP0bLG3lIg9tkl9U4yu0Y/5v2vWnSn6GWr?=
 =?us-ascii?Q?AGHyBqH65DIpaJu9RgkicgEXfBzxjnbZewCuNJvcGjoIbSXPVjpJVD0XkzTx?=
 =?us-ascii?Q?/CHPfnhXyp7iYYzrRynE8YrJy9TX3YNjjdTAw9M+ncvi4bQKxF3mmaX/avXz?=
 =?us-ascii?Q?6gxSbNCS6odnkYDtkHx++ZUc0OUSgpXn6QJCN6hIa1gwZeowpJYoSEwgg6NJ?=
 =?us-ascii?Q?toV00TZ3VUT1b0Bw+xTf4wWHnZczmZBUYrHrafQUDtQV+XX8DYoSeYDb/C9E?=
 =?us-ascii?Q?p2kHbEZmhFNRZ4pxMpbou8V6D9oErubEWBLnSs6AxQdbcyExxTy/5rVKrE0B?=
 =?us-ascii?Q?Cl6IRmuhZGWD2kvhS6llvASvXGEvDgg7bsdRDEAPos2rmRzkp7CtdxAZMK6f?=
 =?us-ascii?Q?dVmQ9UwxO5Fjtgflx6Pq9cml74xRHpfAgBRxJ1/vXv/gRcOq3lmW8XOV03lG?=
 =?us-ascii?Q?oAofRot7HzYtowHVK7+WpIbsBNHp034siNqpxw4ALaRbGeMVjzZoSjMNQn/H?=
 =?us-ascii?Q?cDkxA5OACXUAatOra4HG9yyi7gtvJEV435BM9z/TEGiHUuhbQaDy6wvvEKMy?=
 =?us-ascii?Q?V8C7JbcRCMo0zCP/wN5cbNiC+/jB7fJmWNbP6/9KUY7FA3mliAKiwOrHL6Ng?=
 =?us-ascii?Q?WNegSNthSlwlch2//wDgB8noLgQMskicZMX93/urqGNKqEcyJQmaFwtEK1+9?=
 =?us-ascii?Q?cqs7+PnJ1sPa+l6ElN6NeDDf9vWaJgnB9qsIs6G6bwM8vBkOJnOazGlFfqFF?=
 =?us-ascii?Q?D14qR461N8YBwtDS9WMjTpzSLfbS1UcWQ6BavceZrrS6Cj4F3EbhYcZBe9ml?=
 =?us-ascii?Q?vVreVZAYi/hyAwWeLGi0K8XDNMnkoBdbF2oe/IiK72J6wVuIOZycu19b6I3f?=
 =?us-ascii?Q?17bXgorLMVMh6OthIf65AD8G//6Bh6aR8Mpi+GiBnPSo8BE1vp6ZrtCgFtsA?=
 =?us-ascii?Q?IJ5/DgztE0dcWceAVCLq2PjIT7/syeOp9hLpyviL6zz9qz/2ff870LL4W5EC?=
 =?us-ascii?Q?/TfFu57rApDZSeU90+VoOjSMqJd2i0LOrGoxAuvB+xikTZX2wYdoEIV9eg4m?=
 =?us-ascii?Q?j+lbAa8CeL4WVNTsiUY=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b63c16b-4bf4-4eb6-e821-08dd5de5b744
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Mar 2025 02:05:35.9994
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TFems3hoJLgJ3d0gZJxEgaHsiPVl3NcXLJqLyjU3HncN9QGnuv2YU5pr5t77EmKUp++F+aRkc7DYAcPGUUz16A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7668
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
	T_SPF_PERMERROR autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

> > On Tue,  4 Mar 2025 15:21:49 +0800 Wei Fang wrote:
> > > +config NXP_NETC_LIB
> > > +	tristate "NETC Library"
> >
> > Remove the string after "tristate", the user should not be prompted
> > to make a choice for this, since the consumers "select" this config
> > directly.
> >
>=20
> Okay, I will remove it.
>=20
> > > +	help
> > > +	  This module provides common functionalities for both ENETC and NE=
TC
> > > +	  Switch, such as NETC Table Management Protocol (NTMP) 2.0,
> common
> > tc
> > > +	  flower and debugfs interfaces and so on.
> > > +
> > > +	  If compiled as module (M), the module name is nxp-netc-lib.
> >
> > Not sure if the help makes sense for an invisible symbol either.
>=20
> Yes, I think it can also be removed. Thanks.
> >
> > >  config FSL_ENETC
> > >  	tristate "ENETC PF driver"
> > >  	depends on PCI_MSI
> > > @@ -40,6 +50,7 @@ config NXP_ENETC4
> > >  	select FSL_ENETC_CORE
> > >  	select FSL_ENETC_MDIO
> > >  	select NXP_ENETC_PF_COMMON
> > > +	select NXP_NETC_LIB
> > >  	select PHYLINK
> > >  	select DIMLIB
> > >  	help
> >
> > > +#pragma pack(1)
> >
> > please don't blindly pack all structs, only if they are misaligned
> > or will otherwise have holes.
>=20
> Because these structures are in hardware buffer format and need
> to be aligned, so for convenience, I simply used pack(1). You are right,
> I should use pack() for structures with holes. Thanks.
> >
> > > +#if IS_ENABLED(CONFIG_NXP_NETC_LIB)
> >
> > why the ifdef, all callers select the config option
>=20
> hm..., there are some interfaces of netc-lib are used in common .c files
> in downstream, so I used "ifdef" in downstream. Now for the upstream,
> I'm going to separate them from the common .c files. So yes, we can
> remove it now.

Sorry, I misread the header file. The ifdef in ntmp.h is needed because
the interfaces in this header file will be used by the enetc-core and
enetc-vf drivers. For the ENETC v1 (LS1028A platform), it will not select
NXP_NETC_LIB.

