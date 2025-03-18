Return-Path: <linuxppc-dev+bounces-7171-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 872B9A66ED7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Mar 2025 09:48:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZH58P6fQgz2xDD;
	Tue, 18 Mar 2025 19:48:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c201::7" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742287685;
	cv=pass; b=ea2STe6NLrSQC7vTzyQHFETa55w+OEglE3broz0o6NeIf6R9N5Ib5gUjrftD6EZ1ttpdwv+qql9jZYfMtLReRnZMgj22fMfz2AiJP0g8ctuW9S3W8o/P6/oKCDMVQrZUBB/sef4+/h9g2sUD5Ys4FXlsGGhO+4NAB/Ofx4EwkWFjdNC486fJ/1BK2bAbEUVUUj1AzvtgILFrpbtgzymmuHQEi9sn09677dIajqaZZlqqI7Dz/Qi77DF09LqclMk7ZQIFlhRRBuYb0FZ0Ad13D6yrYVQGpxW36tmu9NvmTQOCFU1jXJhH7vN860wGKMg9VaQz/6CkVh2QsIlyNMP/uw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742287685; c=relaxed/relaxed;
	bh=nHv9nXWjBuoONM7wIXWOwvaYSCEo29qF+Pxs5khUqtk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=QXDWvoZWh8cje3AX2dnHixT7GMNQegTppQAiOd7q9655KbupGAuaXuv5phfI+P0vnOsdggyQ/6OJ3YtO8c3Enur4gQ3AXtBjn0UCfMYBYNhBCIa1iW4hmO+suga7ihEOsckDmVKaX1MN0c+WEIEbE4qKWJj/mHnx37Wow88HKNCB50GTdesmCrVnZI4pVOYCZcEAcPQYfBf6eOz+AdSeandtmHwOARohg5sEp/xKSlos3y5Lhmlelq7e3DDzM7enAlUm5OFfotrFsUvsZPp9L5NAinp6SUtxehuI5iOkdIOSHHIfZyh+GSbtyMwCfLo7fLaJArrdaO9Om4+KWPeZnQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=M0cia/2Z; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:c201::7; helo=am0pr02cu008.outbound.protection.outlook.com; envelope-from=vladimir.oltean@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=M0cia/2Z;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:c201::7; helo=am0pr02cu008.outbound.protection.outlook.com; envelope-from=vladimir.oltean@nxp.com; receiver=lists.ozlabs.org)
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazlp170130007.outbound.protection.outlook.com [IPv6:2a01:111:f403:c201::7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZH58P1jDcz2xBb
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Mar 2025 19:48:05 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vbuA4cnV/hXI5IbTt6BfEtn9cRnpE811kYgibLr95NVBc0LPawtwg5B0a9cyG4Q2W1+RgthVMz/aPtWs9uoPQs8VV5X5QSP3BozMXBJO+FQXl9OqWrJb/nuEQUAI4pi5XjkFSC0MCLV3tc8ZaacMofNJthz6khu3Pvb20/nG/zZ6CfcH0YNuYHEXHudEn3r1wUnQPUoutAc7HY/P53QpdAx/jjl6ioCiOsQGCY0NyMuFtJ2f/gLJvFiJTUNl6Pt2dXXQ1hKWZoSpVlsf3QdZcd7MH8G4Oe3ojrJ76uGwskiFVwRZ/AHBLgB0BTRj80cbjYbbomYRCrQV4jNuo3ectA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nHv9nXWjBuoONM7wIXWOwvaYSCEo29qF+Pxs5khUqtk=;
 b=plBlM6iXyxfFzL9naTRcvlZbBhumNAaSXl3mUB/VulH//hoVDQHKtKnovY0zIdsn24vPFW9kKJDDOMN50gEdDCLQhcF8l0oFp4V4gETrfgaaICYXWzNbho+yNsZvK1h4Gail9sLH1Z71qgpWJENQTzVlSETWUqoUwwPlfDbggz3koy+xGCPnf4i/Ggob9SzTclpNGcmBpq3vYBahicK+w1MgRJmckfe13Pvi4ZEpQbmJE3A47BmGotlVwD4ZC7NwZKfL6r8DloX0PbF842057z6VYuY3qWcdt1p7JbfZXn3awSysFlMVm8oOcT308/BE58yC90eEY89KwRJFpGt6Hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nHv9nXWjBuoONM7wIXWOwvaYSCEo29qF+Pxs5khUqtk=;
 b=M0cia/2ZBU0sH2L00x9vsYL+BBwSIwfy5CQJtoWsfbI7hJj88svqvWqRioFhn89MUhNBS8qfS2jCYZKB11m2yG56oZAajC+0GZY8QgSPZFVtBwIirIui32qi+DZVl2q6tLweS57EIgeeNqSjiSlPiiBbTEQ6Sr309mZkBrwObF9KzoKMfaYt/7lD2pMvTy3oRPly1UaLj5xy9sFU45CyqEHoC6a+Kh/rzwzYh1fi1roSzxAx0/6TbnQog11BzOmBHns1+ejOL50NG/7lpTcwy1tTcWBmmbRS802chlEgGqMiz16nmLfaTp87ATRf8CdKiYApKTomJaPO/dQcMSWHaw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM8PR04MB7779.eurprd04.prod.outlook.com (2603:10a6:20b:24b::14)
 by AS8PR04MB8372.eurprd04.prod.outlook.com (2603:10a6:20b:3b3::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Tue, 18 Mar
 2025 08:47:42 +0000
Received: from AM8PR04MB7779.eurprd04.prod.outlook.com
 ([fe80::7417:d17f:8d97:44d2]) by AM8PR04MB7779.eurprd04.prod.outlook.com
 ([fe80::7417:d17f:8d97:44d2%6]) with mapi id 15.20.8534.031; Tue, 18 Mar 2025
 08:47:42 +0000
Date: Tue, 18 Mar 2025 10:47:37 +0200
From: Vladimir Oltean <vladimir.oltean@nxp.com>
To: Claudiu Manoil <claudiu.manoil@nxp.com>
Cc: Wei Fang <wei.fang@nxp.com>, Clark Wang <xiaoning.wang@nxp.com>,
	"andrew+netdev@lunn.ch" <andrew+netdev@lunn.ch>,
	"davem@davemloft.net" <davem@davemloft.net>,
	"edumazet@google.com" <edumazet@google.com>,
	"kuba@kernel.org" <kuba@kernel.org>,
	"pabeni@redhat.com" <pabeni@redhat.com>,
	"christophe.leroy@csgroup.eu" <christophe.leroy@csgroup.eu>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v4 net-next 04/14] net: enetc: add MAC filter for i.MX95
 ENETC PF
Message-ID: <20250318084737.e27y6x4mrky47ih4@skbuf>
References: <20250311053830.1516523-1-wei.fang@nxp.com>
 <20250311053830.1516523-5-wei.fang@nxp.com>
 <20250317141807.2zobsefxl5vnqdet@skbuf>
 <AS8PR04MB8849FBA73A50F0D553F1AF1B96DE2@AS8PR04MB8849.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AS8PR04MB8849FBA73A50F0D553F1AF1B96DE2@AS8PR04MB8849.eurprd04.prod.outlook.com>
X-ClientProxiedBy: VI1PR09CA0165.eurprd09.prod.outlook.com
 (2603:10a6:800:120::19) To AM8PR04MB7779.eurprd04.prod.outlook.com
 (2603:10a6:20b:24b::14)
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
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7779:EE_|AS8PR04MB8372:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c22514e-7320-4597-320d-08dd65f98b1c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ayB2eciidm25Yv6K2nTR+SRx4CpeIcUDZUcVn+h4EhkXDJTsiCLJXNDZvU/4?=
 =?us-ascii?Q?ZYZ3VgtXRPwsDVIRNH8sfCUVGD5UThPf88C40Zj5zqW2Oir5GKgqHnvbi4K2?=
 =?us-ascii?Q?/s2BuF6fslflxfNSTL69vaNYiVwVk6TM1bQMnT9ZD8EB+z3/YfSWWHJjPOYR?=
 =?us-ascii?Q?lfHWOr+IqWN0q/x9oBKOIti9e1sntyPMc1NsBl5V+H0eiPcmexYcvd8blYL9?=
 =?us-ascii?Q?MkcU6Ln3DwsIQFk5aAF01J2qYzx6FhiWdnTw1ND3XMlzn4HpR320fz9qKEiR?=
 =?us-ascii?Q?b2eoPyaTHM59egnaYMrVpUYJv4LBW/D4hGopjksdOOor5u0GjDqz3EBfQ1Es?=
 =?us-ascii?Q?sbmSe4s/rjYAjRB2bn0yZ8m1sNgiE1RkQluKJiJm1ImtAsf0DQc1hOD80VhV?=
 =?us-ascii?Q?NIHjPzO/FXFp5m1lGlpAtQFbGMDhnFsI23G8JW3p80K1EZVYmiJiWsZR/pA/?=
 =?us-ascii?Q?2HmcMVYBHVH4ygSrKzMrEUiH319Q/mETnh6HtJQVGZXvIEaZhnTDv1fX12xU?=
 =?us-ascii?Q?pD5GFdkaLtPPX8VC+0oAZp1gv0Z1XLZaXwX7IFza70MwKZIdeR7FXckY2jRJ?=
 =?us-ascii?Q?bbWC7oVnhbuLx/QEuJQuYU4olO6DXUFSyjylkxKaChY8ceeEaiavCKY6mauq?=
 =?us-ascii?Q?08tfYdr6Gjq9PY/od3fixXNoaLSQduO1WPmfld580AqUro2+CbTHffuG6Fp7?=
 =?us-ascii?Q?KLyzzYU/SldrDG8QIEtxMJNSTUbxqhmi3uvvDlSmNiMs+XCYNPCM610jsaic?=
 =?us-ascii?Q?3Y72JD55ny1vQbhpHhSAiXZDx9eCiYSQmCO3UsN4H3Q1DPyUqgXX3gohBdfK?=
 =?us-ascii?Q?DOlr5gUNDlczEYrIO3h4H+EiV7JJRsdvDP41uLDsyHRUrarXz6JrAJ0g/zfa?=
 =?us-ascii?Q?7Kw+XD0abBlfxKX8seEXtmCIBJiUQD2FrBg92kkB339ReVCYfwfGamQZiVw4?=
 =?us-ascii?Q?O+O6L9v9EUTw3JS9fIA0caRQiycUPY7HgEy1wIEIW26qXgzsRXxod/F/mr83?=
 =?us-ascii?Q?k8HoEGZ98lEjNnWmBqPd2095H5mkNJIXYU4j3DtecDUabn+4GO/R1I1t+IKl?=
 =?us-ascii?Q?ShBkVtpT9lBNcsIO8vfibDVtnlfocoP6wNAOWgCf7Ri2FA3blFwpKNDX6aQu?=
 =?us-ascii?Q?vVLzXhWs+TwACQtm2V6ftibuabmFdHFuwqAVe3otB69LTO9e1meqDHuc64ml?=
 =?us-ascii?Q?4BwKuT0eiCCbKHXVJpN3Fuu8K84YsHI3q4PFkh/kF2w2DXz7Klg0LYBzWe/3?=
 =?us-ascii?Q?BlGKIqb/nnsd1CJmWymDOQEN1nf0XnR5gkIgdqn7NS+Jw4fvO2MGEntUnzfo?=
 =?us-ascii?Q?prV5q++YZxLCGCzwDkEmBd4fS5cdJwiTg+Q/AmY4M3Oj8eK2CObizmucTyqu?=
 =?us-ascii?Q?7ot46XII02sxAuoyZLvmCtfcMnNk?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7779.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?UDWXOYDSaxWrRghIpSNllvDMY1c5KXfakuQ0iX5s5mA1jChq9mJmPFHoalBM?=
 =?us-ascii?Q?V/0aK9UvY67GmDiaBfnrxOrb4/XGhUg9AC8vRO8ky8ioyz3AOZ5splSbNomJ?=
 =?us-ascii?Q?NeN3O13eG+31yQNaCjIA0WU4HLnNzfTyT9Av0bn451z8I3P9pws4OcFfXyT6?=
 =?us-ascii?Q?b35L9MxPo3pIM80R0WU2Eom7HJM4ipotMrBDFNpP6/aRNRRT5dJw7KFy3WI0?=
 =?us-ascii?Q?0lGO9oMAe4ay/fTEncwGPZDWbfNkJQYvjXNYlRtaYnRwSTYoCz1jEjUIlfH/?=
 =?us-ascii?Q?dU7bVlew/CV2BjA3fR3PM6fIFMs9zwbKiI3ywOiOy42Ij94eLhCbFIuUjZR+?=
 =?us-ascii?Q?UqmM5fko4DqPx1G6zASX6gvW0x5yPgoRcWMFISo6I5K6dHTeDFbAc8mfExJI?=
 =?us-ascii?Q?jzNNHSXuyTDhLdLkXrzP1RQc82hYuG7entn1MoV/F5jC5hTdl0SnhkCCZ36Y?=
 =?us-ascii?Q?B4w71M35EesNmtbVzyC7gQ3dl2fEYyXLjWtIRw67ZWlBILD9QqsN5UWvqlDL?=
 =?us-ascii?Q?ttg7Qr/QBcXgG8zR9+w5/A+FH9c4RMKNsChDzfx9zyFgBxGmfvKrb4fUb9To?=
 =?us-ascii?Q?HhAcL0GQx99jUoGeiowN+V6o27PgcYxxvA0BvgpcwPMPNuFcmgTqkKdNYWsi?=
 =?us-ascii?Q?CKtIRcYDh2jO3wAqxXWqzUoETbNYq7hDG6clUlmkD/l4zbLpmj6fPhcnwfij?=
 =?us-ascii?Q?L/1+mZEMGaDVoVPyeHvULoTEtFJxRxTlkk+vj+rsL1NWnUh+XZct5xzaHGG6?=
 =?us-ascii?Q?p9VNDltixOA72w9CBCb0LZft4bCHGqMfXdKT1otpRMgEklany93pI9JIfHxc?=
 =?us-ascii?Q?i8uYXnHxoG1OcDnUDywJ0qQePyDkZ46gsCrwN3J3ITJFaTWfl8YXXJZRe2wo?=
 =?us-ascii?Q?QFJZKxNfZa9iuIjzUwtoYKSDT0zxHatPCRbnr4Y54LJj1O9YqpmVY9dHRkmB?=
 =?us-ascii?Q?lpKwLDslOmTVAOGO/hIpnjyg1TEYjDqRDWeTQpjGtO2Es2zUVbVlb7H07qu5?=
 =?us-ascii?Q?pg5iDcDcVPMzvuCkPOM9yRRS2xAyo9Sqj/5McdcRUWfFfj2V8F0lO1lMxwf+?=
 =?us-ascii?Q?FpyVl/Dw/90sR1Bymsa0hAu2NDinJw/hBSelcFoCGSVa1pO//bY7hwFnv6dw?=
 =?us-ascii?Q?3uSVWY5o0eLWqVW+eg3ht33lZyD13BimU30Q8njJqqdo1a1kYp98R7PsCgUI?=
 =?us-ascii?Q?ODSG6kJa92i9h+r0OhQmBdqSI/NHr37jUMDGPRypmK+CnD5n1IyrfwYQz+XC?=
 =?us-ascii?Q?X0j0KvE/v2QIwPndM0TP7NXPCbmWAW3co2w0JmTvd1lMvqw+v3ta/XDJWAgz?=
 =?us-ascii?Q?1xDauZiJL5rIxON9RSFJ7Sbh19+22G2zaUIZPRVsKVeqkKEKAQSUExJ1aqiR?=
 =?us-ascii?Q?StAihbMGMZUo/nWHGQTv+opdiK84AMoeav+Dxw/fGzKA0rHIChnwqFaK5yCG?=
 =?us-ascii?Q?SYPqS8tNxkZsG48dOMFCK+KUdCVuUk9jwZ7l88JpoFM7zw8neDUS7dRQV/vu?=
 =?us-ascii?Q?/Qy8cHepBsGAp8tp71N9qAgPJYe7eH6Gb+LHmBFZUjHrc3oFM0Q0wPFNxcDx?=
 =?us-ascii?Q?gZTintuB0Yqj88AmhkSHI/qDa1yLELKo4zA7tVf+6j8DMlGxWAeIOC2TNYKN?=
 =?us-ascii?Q?xg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c22514e-7320-4597-320d-08dd65f98b1c
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7779.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2025 08:47:42.0973
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 53Ju+X9ZfKI2/DgPolhuWRL/0NOJWffPpUfifDQ73jjqniNl8eVlli0u55YlP4XCx3dIKtGqIi80Ox/nTyo0+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8372
X-Spam-Status: No, score=0.7 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Claudiu,

On Tue, Mar 18, 2025 at 10:08:24AM +0200, Claudiu Manoil wrote:
> 
> > -----Original Message-----
> > From: Vladimir Oltean <vladimir.oltean@nxp.com>
> > Sent: Monday, March 17, 2025 4:18 PM
> [...]
> > Subject: Re: [PATCH v4 net-next 04/14] net: enetc: add MAC filter for i.MX95
> > ENETC PF
> > 
> > On Tue, Mar 11, 2025 at 01:38:20PM +0800, Wei Fang wrote:
> [...]
> > > +static void enetc4_pf_destroy_mac_list(struct enetc_pf *pf)
> > > +{
> > > +	struct enetc_mac_list_entry *entry;
> > > +	struct hlist_node *tmp;
> > > +
> > > +	mutex_lock(&pf->mac_list_lock);
> > 
> > The mutex_lock() usage here should raise serious questions. This is
> > running right before mutex_destroy(). So if there were any concurrent
> > attempt to acquire this lock, that concurrent code would have been broken
> > any time it would have lost arbitration, by the fact that it would
> > attempt to acquire a destroyed mutex.
> > 
> > But there's no such concurrent thread, because we run after destroy_workqueue()
> > which flushes those concurrent calls and prevents new ones. So the mutex
> > usage here is not necessary.
> > 
> > [ same thing with mutex_init() immediately followed by mutex_lock().
> >   It is an incorrect pattern most of the time. ]
> > 
> 
> This is not as bad as it seems. In the final version of the code, mutex 'mac_list_lock'
> serializes the access btw the thread programming the filter for the PF instance,
> and the threads programming the filter on behalf of underlying VFs (triggered by async
> request from VF). But since VF support is not included in this patch set (as Wei
> already mentioned) the lock can/should be added later, with the VF patches.

We all agree that the lock is unnecessary as far as the logic presented
in this patch set is concerned, and thus should not be added.

When Wei will present new code that will make explicit serialization
necessary, we can comment more. But, I don't see how any extra logic
can change the basic fact I was pointing out in the portion that you've
quoted. Before you destroy the mutex, you need to do something that
ensures concurrent threads can no longer execute. Then, there's no point
in locking in enetc4_pf_destroy_mac_list(). I expect not to see such
locking there in future patch sets.

