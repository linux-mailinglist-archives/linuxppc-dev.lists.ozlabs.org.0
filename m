Return-Path: <linuxppc-dev+bounces-16229-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 38h0JF1Xc2nruwAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16229-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Jan 2026 12:11:25 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B5EB74D69
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Jan 2026 12:11:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dyFc54klFz2xKh;
	Fri, 23 Jan 2026 22:11:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c202::7" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769166677;
	cv=pass; b=UwVTMv76td/lJkSlD/IUX6olJXcJeBk1WTwYeX726Ofr7hYznS9MpXuXeS3J5japU61hVG1HSzsh/Abcb8lXuda2nhRi75+StXCGjlRYwCIj5GBRPw1+4T6HFuGTEmbUY9gXtRil3F0JUwGhKZXiEEZVZX2/9QvJ30hrUyDo07epVDnQfqNeG8262Iu8VrWk8cNJ1ONsmKNoTZZAeaKHKl+Q8YxgsALo8K8Blx07Li0qhrpVAhWTKReEC6g9N7FDZ9B5anmm5KQimBff8fsbLkTy0y9/XcVGrQTy3+aoztCDqmk6nIHvgxJhlmA5zidxlNhtUUIUWbULsHjVr3C60A==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769166677; c=relaxed/relaxed;
	bh=oGmPwEKThl1GOlSysJ7WI6bxqfbTF/uE4x/bPUsRrbY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=SP3pJ2YdXYHC0Jk/iF6auVct+TAHdGGY3xE6Vd5hTgitdtwatG0fYIX2aKt75LZXxxEqZbcwyalM/p7i4pyVjjJqxs/sUoho5ng9NM5fB9MtJNpsSevAk0cDGmdetl1N6RuZU41Xp54uoeABqbZbHIzw+mWHrIpR7YMns+rQryt1d7vW8AfneqpDlHIRwGxU4aTewRR2dqiA5mKhsqqx4g/TzJv2FA8sVPQldUN72JTr2EyxV5Q4LeFNljFoYhHAFU8VPGgKFu4bbtryrR8IDgafCquckokCk5elkUJirlGpUz8IwU2czBJ4tFKX1RAcMMV2E3y6Jbe1Bt14bWyrUw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=By9M+HvC; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:c202::7; helo=gvxpr05cu001.outbound.protection.outlook.com; envelope-from=ioana.ciornei@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=By9M+HvC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:c202::7; helo=gvxpr05cu001.outbound.protection.outlook.com; envelope-from=ioana.ciornei@nxp.com; receiver=lists.ozlabs.org)
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazlp170130007.outbound.protection.outlook.com [IPv6:2a01:111:f403:c202::7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dyFc46lLhz2x9M
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Jan 2026 22:11:16 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GOV5s9VLGKRQruis8V8H1VZ8SSRnEZtdI6b6mBUU2W2rC7b/72VYqHQmYObaqxGmsVWm5MxxHhyr5EI8eYogUeMj1wKFa0KE0/nQqdVXNWoC4sQez+kHre1+w8QzWavpAtibzDZJITJcs01btWEqES7EFrgD98EK+NByh0D8aq+7iT2+WZlYOXxKZ6f/6C+/qhJsEm7wJ/V5oLLPHtjz+KEFvJGSAjwHWPzGF22Htz1X4x0/kFqt0mqoluQiqyGNoOGKZ+OAANZUCSFKvC4yJbqtD4iUALNGP+ycAGxtYplDPNjDE6d/3jHGX0Io1/Rr+W69AU5lbivA7wueZ+YC6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oGmPwEKThl1GOlSysJ7WI6bxqfbTF/uE4x/bPUsRrbY=;
 b=OzyxGGnymIKxUHBjCpGjgdmtE7PLoLsBpJV0lCr8+Mz/EvjphVKuI+3en5XRy34uBI9/Dwn8FmEbydLQkfE0EbUKtQZ6NARsuGokF7rzs+FNB83WxGhOeH7ZTQoMQfohG21JxbFzaCZ/EkuN4jn9Zbc1F81k4c2YAtr2HPFTw1vcF3rxirJeTle3IRd897ssQQxke8IUeQxSAP9Czn74CGELwlYcG8NmlYPVADpP4toXp1cwCHucT7Hc8nAJzIU40K72OoVOPN4XcCr4jwadk/AD7i59oZpQCgfSJlC/kWPAlf8TSRYLXiGXFZbm1YD1J3puqpSx6f+mJMYtdi5RCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oGmPwEKThl1GOlSysJ7WI6bxqfbTF/uE4x/bPUsRrbY=;
 b=By9M+HvCtriUDq9GNZV0o1q5jb8LRD6jGjsgnauO2BQavfEdJVJbFCXSXQbBVC+vYXeNdGLYNDVPhA6XKb/Az0acj4bXWMb/ULTRJdSVrqJDtfHugU+GhKzoFmkl3Vu8ob87Q0T7qBSaupIsKhUEeExrg9xDINK9OIabBBpnLH1NYDjtaf4r2wCn4T4He2PGft7O4h5rBEGmytUcO77wx8ZEVcpVKO+MhoRl0upjdP4fInA71b8Ec2Y6fRWc7XLzxF+EMQBcwQU1W8Fo74sAuYxFY8w3yrlOX8lq5izVlAKPlNVFkhggHK34b3QOZpU1euxeWqDd8ukkdxBiWK+GTA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8253.eurprd04.prod.outlook.com (2603:10a6:102:1bf::7)
 by GV1PR04MB10242.eurprd04.prod.outlook.com (2603:10a6:150:1a8::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Fri, 23 Jan
 2026 11:10:51 +0000
Received: from PAXPR04MB8253.eurprd04.prod.outlook.com
 ([fe80::b853:e05b:c1e5:41b7]) by PAXPR04MB8253.eurprd04.prod.outlook.com
 ([fe80::b853:e05b:c1e5:41b7%5]) with mapi id 15.20.9542.009; Fri, 23 Jan 2026
 11:10:50 +0000
Date: Fri, 23 Jan 2026 13:10:46 +0200
From: Ioana Ciornei <ioana.ciornei@nxp.com>
To: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	chleroy@kernel.org, Dan Carpenter <dan.carpenter@linaro.org>, 
	Su Hui <suhui@nfschina.com>
Subject: Re: [PATCH v2] bus: fsl-mc: fix an error handling in
 fsl_mc_device_add()
Message-ID: <fkoirnlbf6szpvqubamaz77433gc5uvh6fanbaonz3znsjoxxg@7ifmlxegzzwt>
References: <20251224104433.1585576-1-lihaoxiang@isrc.iscas.ac.cn>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251224104433.1585576-1-lihaoxiang@isrc.iscas.ac.cn>
X-ClientProxiedBy: AS4P192CA0002.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:5da::9) To PAXPR04MB8253.eurprd04.prod.outlook.com
 (2603:10a6:102:1bf::7)
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
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8253:EE_|GV1PR04MB10242:EE_
X-MS-Office365-Filtering-Correlation-Id: 3278c74a-bbde-4c0c-3be5-08de5a70113a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|19092799006|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?dqpYX6LXKz1GRyJPlPyZWbucnWwgxqSw1wDCJqTkLicnzmWyD4T9D5Vr5Mmk?=
 =?us-ascii?Q?mBIullXeU5xBm5O2iVYutdqZjFOKzGENGnvmLXMAV3y8VEPm05OyLG+lXYTZ?=
 =?us-ascii?Q?DSPJjthfgv2vUPjFO9W51YbeWIkmqHrJ9VbYG9WoQs/Ga8uqaaw/o3Uwitbk?=
 =?us-ascii?Q?uYqDEofNK9ZuaTCTfTeKpBGWNC/x95BnLFXZ4xSPpi+bQJk2oQGkBC75rcQq?=
 =?us-ascii?Q?0Hs8PzL6vIypOQAbSr8GH9sRNnSprHkyzM24TpfpG4g4OsUKn0Y8tqltI2tE?=
 =?us-ascii?Q?BVoEDTarzsyUAy333jyLQrrwmTgaX+cC6FGoK7fa6SGLosypGDIOmVDyenTZ?=
 =?us-ascii?Q?yH41PQ+kMBPcQ2/VqRyzgElrDHQLxfBjtsCna9K2h2tiqbkihgNVEGfVKSbM?=
 =?us-ascii?Q?PNGelRLYO5Zd0PPsSUF0wdiybHczUcTNJXn4kcjsbOA5gXY7ZxJ/txjtUTsi?=
 =?us-ascii?Q?ntnRmWMh4seycvm+bhSZ2SV7PSns9KMqTqK04tMCcqeOf913P/CnL+Qp1TYu?=
 =?us-ascii?Q?6kgTW6K/+IhVPp6XfkleFKQGFYJOUhfLQDq3JJBn/xQztVygBskEWAIx4wmJ?=
 =?us-ascii?Q?YnagNsRpSemGyd+2t2zy/12TMsqnyzKEU7/IdLnj6P8W0WxPVp/OF2eo2Pnr?=
 =?us-ascii?Q?hBD4Xf03zDkcIguAE9jQcn6yhz7eMIGDPIHpu5mcTTYS/KJ7dZv8ujCWvrrI?=
 =?us-ascii?Q?LvCxaXTGWILZWSQIijU80l78Dymm1DZcB9EclSoDPa+7eZGsGkKBoB3nPa3N?=
 =?us-ascii?Q?5GCSZXORiCgD+51V+38wayk6DHhcqLdtkaXwzwhnVryUe9fJ6WNyDIN6VgI2?=
 =?us-ascii?Q?nFYojiy3HCzbjUD6x+kdWZ1+JV55FUGMMB8SW1Yjzw71H2JKSJl5w8tymtTA?=
 =?us-ascii?Q?rGh57cfjlJUrWu6gcFKnX/QQqeVT238rjzn+lkTM5NGMpIINhxCzUX1GypOq?=
 =?us-ascii?Q?AqLao9wGtmV92o13hPT/QMka7rPqGx73mb2Q1lKXNyq8XK9xvpT5BQB9rnOF?=
 =?us-ascii?Q?C+gxtRRYNPSgyX/82cZPP1rWkoGPmIXKpSZu0oRlXem7i/Q7dYU6jdltS2ju?=
 =?us-ascii?Q?9eIt8FQSjpWNhJbvM1NS1uxZrH/tdCn9MU3lI1cAZmPZqmDz2URsB5u7hlO4?=
 =?us-ascii?Q?ue3wJZXNFJHJcveH6mozJHmdihmjO3X9rd/NMPWwDWVIFj4hwm/pyv+9UtHV?=
 =?us-ascii?Q?7s9B3W/jFqD+t0KLyTUdehfOvR6fL+K8StjFx88s8Pr/UvXAjSi0dSkwyb91?=
 =?us-ascii?Q?A/iFmm7fbaS/Xgbnp202jWfPMrOeMgtiEgheDLyJRJzeYyU3V7IrzYdJUJBi?=
 =?us-ascii?Q?sodPWwlD3rZaOsMNLBqIviacam5R4yFFaEPnQI6aX/xFHG6zsgBI5cJFa/tX?=
 =?us-ascii?Q?HHgL2fHg3h0VY19hpj9tKrXsUUjlo8D+KKXiGxBzOdi6VbYVcfV2dwh8WqFV?=
 =?us-ascii?Q?NrruxqtIy3hmLb2bYEtRD0SwlAG/isK0NxumXDoHUV1KhRKqtSl5ew22SJJr?=
 =?us-ascii?Q?+z6t9dm/qmnanKkReHVgT+pbW33qTp4nj5JRdjuqW6cYpU0LXz+jmIgk5npe?=
 =?us-ascii?Q?5QpxwiWQ+ePp3dBbji4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8253.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(19092799006)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?l90SxGjQdyanqGq95O/kvuLNjPfT/iyJC/FrCR72liY47y9Vh/VWWUeVvO5S?=
 =?us-ascii?Q?+UtUIn8PlylmLNCfi3Ssos59gNdSRlIjkkQf3tp1uDg0FJYd9MQsUJq2veG5?=
 =?us-ascii?Q?yRUMm10qhfJCwo1Xfkd5buq+tPg+UjpCiSeSZQc7BEOW4n8DDVfu1GuwyesA?=
 =?us-ascii?Q?SzBdHTZQ3H7NP2CASrdKvsoETxRvBSc+M6czet0XKz8oqLcTuOsu1UKeR9Dp?=
 =?us-ascii?Q?oXVBoTTehehEftN0/4eHGVLI1gqPVcC6wzueeNQYvShuQoZCQjfdmmqFiDy1?=
 =?us-ascii?Q?EjPjNDMVDhjQsjkoZz8ZM9AqUMm14Hd71TmnJc8vaoyRDUCuIveOIdQZGbAP?=
 =?us-ascii?Q?EosPM+VbfVkD28ItIEm1yOd8ZLyBZHCw620ZnirwF/kOnM6Y54k15f/Ewn3T?=
 =?us-ascii?Q?5lIPbCH5+nTFTV6tFjH+iPtAxB+WBQK3QyP8nEp5bJ+6m4GPDGPqLLlOTttL?=
 =?us-ascii?Q?VFMO0/5eIN40b/Og23AVxD/uvH3bIukN4QyzbTt8r5KMRMhXX8qlCLpKaBmc?=
 =?us-ascii?Q?TwHkdaLIgN9u06zYnyIds7grxpGFVgw3N3kziqT9AE/Cxm5NV+6m0sg/eTNO?=
 =?us-ascii?Q?HttASMeG7XT9g+sseaxtbYud2qjSjCw9ol1gu1IbbTMBJI9XOHGI8bEEK274?=
 =?us-ascii?Q?ru4hJVjn1vd2dOdCYetEuQ0K0muUVlbDW7nAnm4PRhpoRYtzw3VXnr0El3uy?=
 =?us-ascii?Q?KW8AvbVjbQ8XQmJvb6ZBucrUQQDxoTSllRVqJKUgIIWyvweFw5JS+N6XLRJq?=
 =?us-ascii?Q?+zEaUInJs0xWtbAdk2urnZFxNrzOhetAf1mW0+paOOeRZdnoyJZKn7Q7wmUx?=
 =?us-ascii?Q?aqbL+9T8pMviDTvFMrQmL62/7nM7/DIlH7YIyQgAdZnRMeSXQYaYUHCVhWGb?=
 =?us-ascii?Q?u7czvu1kJ2PuoDV5cwZwP1P3aLqiMq0Ihuh6UYPHf7Y9k7rZQny4hJ31jU1g?=
 =?us-ascii?Q?Xxq3kHl3jgOgGQ4ohNqAJujkkRbCLCAdJPQqFMuVvc+yWI5o4xhAz1IGKztW?=
 =?us-ascii?Q?jrz7BQANqT71iL6iemzI0IoazmoxY5DLFyARBCD7oBrPTW2JXpvwjsg0YFAs?=
 =?us-ascii?Q?qiQUoExP8vYi6uiVsT7Vddyys4slYLezbEi1tE1msZpe+pto0L2dKyWen56u?=
 =?us-ascii?Q?3NjoadtGcZKTz8UaWTB/cBLXMXzt3gBaADt0qUqzD7VEiIL1ynJhU+EWnNfQ?=
 =?us-ascii?Q?fyZ8Zy6I98qc+2CIj+0jk6DusSNBkoaHOumRn469vbgUaP7VyJ5qgf/W+V0s?=
 =?us-ascii?Q?exFm0KsMsUKqa30MA2GKXpLsZQLxSdp3QvVNbpmfvikpXk5WUE5VInBmyOL9?=
 =?us-ascii?Q?lbV3qFYnmBI9D3mYc111571BthmIhdUvI5cXB/LgWxPHLlDpSdIrnpqCVCGQ?=
 =?us-ascii?Q?vncb0ENPtTsHUcF8RJ9a8tCrUY+PYVHgLYDK7wBIxPcH1qLoRyT+2gy+lv2r?=
 =?us-ascii?Q?yWvt1j/v9eEnTuQbGWKH5bl3Py4EnspEOB77cQfPxmf6Z8PyjAuxOiCLa3jQ?=
 =?us-ascii?Q?hlBUlkTDVn/aqmu7DlTl/0bYs0BF2V+XkK7+5by9C0RiFRgr5UpOzxDuQvkV?=
 =?us-ascii?Q?3+vSk/QsXwk16mePaOdGEtRWTP+OuqGH61SD6urgWQEa+1xM8fOuo62966bf?=
 =?us-ascii?Q?4k+aL1qfk2odmss3jIqcxEt352rocUN+/fjCl7N/ii++x0nSLDTfqONScLXm?=
 =?us-ascii?Q?0piHVrBkqGZgSHMYLy0LIf4Fg1PtQBGwUYb2tMZBAZBpn6xN0Ad3hb6v66+O?=
 =?us-ascii?Q?X4B52xUtRQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3278c74a-bbde-4c0c-3be5-08de5a70113a
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8253.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 11:10:50.8430
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +I9nVKq/gBBDXQW+4vt3cZwV/gE5wxyjsYAKdjjbUSnvFs5CrbbY9cbHePqBBuElpmG/22fuPREM4JYzr+neQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10242
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
	T_SPF_PERMERROR autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.71 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[ioana.ciornei@nxp.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:lihaoxiang@isrc.iscas.ac.cn,m:linuxppc-dev@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,m:chleroy@kernel.org,m:dan.carpenter@linaro.org,m:suhui@nfschina.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	TAGGED_FROM(0.00)[bounces-16229-lists,linuxppc-dev=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ioana.ciornei@nxp.com,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[nxp.com:+];
	NEURAL_HAM(-0.00)[-0.242];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nfschina.com:email,iscas.ac.cn:email,nxp.com:dkim,linaro.org:email]
X-Rspamd-Queue-Id: 2B5EB74D69
X-Rspamd-Action: no action

On Wed, Dec 24, 2025 at 06:44:33PM +0800, Haoxiang Li wrote:
> If device_add() fails, call put_device() to drop the device
> reference. And put_device() triggers fsl_mc_device_release()
> which does the free. Thus just return after call put_device().
> 
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Closes: https://lore.kernel.org/all/b767348e-d89c-416e-acea-1ebbff3bea20@stanley.mountain/
> Signed-off-by: Su Hui <suhui@nfschina.com>
> Signed-off-by: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>
> ---
> Changes in v2:
> - fix a patch error. Thanks, Christophe.
> - add specific changelog. Thanks, Dan.
> ---
>  drivers/bus/fsl-mc/fsl-mc-bus.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/bus/fsl-mc/fsl-mc-bus.c b/drivers/bus/fsl-mc/fsl-mc-bus.c
> index 25845c04e562..f976c5a24151 100644
> --- a/drivers/bus/fsl-mc/fsl-mc-bus.c
> +++ b/drivers/bus/fsl-mc/fsl-mc-bus.c
> @@ -896,7 +896,8 @@ int fsl_mc_device_add(struct fsl_mc_obj_desc *obj_desc,
>  		dev_err(parent_dev,
>  			"device_add() failed for device %s: %d\n",
>  			dev_name(&mc_dev->dev), error);
> -		goto error_cleanup_dev;
> +		put_device(&mc_dev->dev);
> +		return error;


Is there any reason why you didn't go with Christophe's suggestion from
https://lore.kernel.org/all/b7f7e968-a683-4e1e-8ccc-5dd19f0f15c5@kernel.org/ ?

It's perfectly valid to call put_device() even though device_add() was
not called, meaning from the other code paths.

Ioana

