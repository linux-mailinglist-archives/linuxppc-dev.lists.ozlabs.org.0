Return-Path: <linuxppc-dev+bounces-10168-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 76F56AFF753
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Jul 2025 05:06:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bd09l1K3Vz30Vf;
	Thu, 10 Jul 2025 13:06:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c201::5" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1752116795;
	cv=pass; b=R/X9Z8nglFP+uZlYLxj8WYmvFFnrsKryVUxEDtJLac2e/PLQXAJUn3TikJ9byXj3VY5eVArSNrGjptCTsBo5yNYPd+JC7+EHs6quDpVfchYytiRb9WEr1zeZbsWO6Gqf7OPCa51XPOA4ke0dwTcbbWohyPoCTRJUEgnTR02DefjzcFDgyONW/SQZR7pEtEI7tM1Oto/ZJKvRoRunbynyKTPC0sSB75/osShLQHjimg0L2MOg40Rc91hZ6T53pZ3ul7SRrKqM68jaHTc2QCy2KDRKiFeguyElPFS+tTuiHGDU/GyY0tCTyRIUpTGqN3BsZYlPDOsblHVteOf4x4Fgaw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1752116795; c=relaxed/relaxed;
	bh=s1/qcsHIn2eLfk7N1PDEEkiqCouDzkFNaPqPs9X+QSc=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Iqgy49wwjivbvgE2s1FPvRPBC2hGClNLtAwv7CE7xUXDBgNhHil2oPWx836Hws6QS+gEUzrfkYexLZEAjpmzv78vd4MBXLhqCXhR4nXREKgzvm7GWk3Bnukj+tfoc3e8bZNjEGfTcuPhwYXvynhIyWEknxzFqPWYVs+sNYXh6216vTJOOqB4jKNnkpUVkmDDzNGfQlrHBHnfvkTFbHOp/4J1+2KeFPNTalUN5sIhm7iK18z9+L+b6LhMVoeCPRJ8+Ca427W6bmmzkEsVB+uyoS26qHsUmDjAUQmUqA/PJvZEVMHoKASq3SAEpAQwcvyGYwjjgdX6GVjVNKhrmb6M4A==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=lR9BN1u2; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:c201::5; helo=as8pr03cu001.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=lR9BN1u2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:c201::5; helo=as8pr03cu001.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org)
Received: from AS8PR03CU001.outbound.protection.outlook.com (mail-westeuropeazlp170120005.outbound.protection.outlook.com [IPv6:2a01:111:f403:c201::5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bd09k478Jz30Vs
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Jul 2025 13:06:34 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DtABC/t+0r9AT+0Kys8eGMBw98MOG9fO5/RP1uKyPx/i0TQbezrXyfGaB1LCWFcq5ITEt3B84K6QxNfay1wpfpKsbBTaNNNJUH5vw9nCGc8t5MXKPOp35NCX3BBP4P8DqQBEdYVUBv5dCDHrJ52+i+qowxCAzynL9oY96m1moFjjFcEe59c1szV64wvxfScytdTnBgUhlglmgfXA4zm2RbwhtdvAnFCgcQImrzbib30YTaUGw5fS7QtlSuuz0JIlztamlX96kUx49Vmau69SNYt+bTSIIKzzoOfuhM1tMnEFUxLyHpkO3oC9v00S0s2hw+uH7le5FcMcPxZVfelMPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s1/qcsHIn2eLfk7N1PDEEkiqCouDzkFNaPqPs9X+QSc=;
 b=uH2Q665GMGQcbR8uElToO7IuVtt90CdMRNn1HZc27OW41+N03qbPgiyPn8ax8HfbP9CxHX62uBUoJ7N06R+vDyatNZDu40mb9SlkgAL+np0NSxxZPajUZ6JJo0ZmBKoNkfa/aXsqG7d1+iY3gEuA3/bnER0/cUqDLGHj61nkXUDxmG81wCT/ETi8CY6kIuvQowZhHhSaAe40W+1GhH6v1A94D3xNWJ3Z/z0oFPI95ySg8poZgUj6TxxMewJv/c+j9TWsl7WxDWYJLz/+p332pHoM0UxsM55c5zvsE9g1Aq8vwJXty//uGe2boh6i8BslV5xgx9IFGiKJ9W0ih8s23A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s1/qcsHIn2eLfk7N1PDEEkiqCouDzkFNaPqPs9X+QSc=;
 b=lR9BN1u21ZdlUFJKI5VYlUGilmV+d5f0BYNiSx4FTIKMPXXqklNyUT0MGEr+tL/DV/3vDvOktwbe1E+v0Y+GXELCRSODxZVLB01KSzBXhDS29Y0UPKC3Rp85JOPdzWeo/kt41632iuDWlkJe3sqAg4qxlXXyCLyiSfOmh9NiAiEJzH28u4ky8fvA9wGNYdLFQmCwM5TekO/1xBIZAU77MQQOzjTfVsStIjkGBvCXytL6LgmMVfvh/7VSUbzyGJ0W1dDaWsXrS/uaRVF16Ed2Zkk2ifdCD1071mgo+Nu4LJ49HKdak1UxPWepkKT6788PYiPAp5+l3s7sUALQSE1LIA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by FRWPR04MB11221.eurprd04.prod.outlook.com (2603:10a6:d10:171::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.25; Thu, 10 Jul
 2025 03:06:14 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891%5]) with mapi id 15.20.8901.024; Thu, 10 Jul 2025
 03:06:14 +0000
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	nicoleotsuka@gmail.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] ASoC: fsl_xcvr: get channel status data with firmware exists
Date: Thu, 10 Jul 2025 11:04:05 +0800
Message-Id: <20250710030405.3370671-3-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20250710030405.3370671-1-shengjiu.wang@nxp.com>
References: <20250710030405.3370671-1-shengjiu.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA0PR01CA0052.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ac::13) To AM0PR04MB7044.eurprd04.prod.outlook.com
 (2603:10a6:208:191::20)
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
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|FRWPR04MB11221:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a330c64-0187-440b-e19c-08ddbf5ebacf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|7416014|366016|19092799006|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?woRGKuYbGml0zOyQxLmD2gCJSRZbqpaW6n8+vBYkFcdZIJ72kDdgbY9JKJAL?=
 =?us-ascii?Q?8somsGfAgJSpbC2HAODt+0PWKZYJQsmuFXfDN/VLpRz3/JKLvoApoHsNmgrn?=
 =?us-ascii?Q?Z3HHTV/wbG8EgS/eh3wCl9PdCTNEpRyuqfpRIbgdqGKYAyflS8dwxVJcAM+3?=
 =?us-ascii?Q?Ua75Ao2xieiypCLEoU6SylUeXhv30xG+F8P3mgnk7wYRYFAS/hkd92T6y2g7?=
 =?us-ascii?Q?+fi7VgXktIWzOjmW4PldrHEc7rLdcwqhCd1BSr2/ypzyNiAjSe31qJss9LhZ?=
 =?us-ascii?Q?oSzXsyaHpIIHVodGQuNuDTP1zX35wCvedt7yIYMuTz93p9bokFKobcZdU62Q?=
 =?us-ascii?Q?cv0jUnbntu4+FJhAQWUDseYq3IzuQkKv55qV0OVD/LKNeFs9imNhXFcKG9mL?=
 =?us-ascii?Q?iUI4H7HfEDrUFA/YIJ2P5ocASGRaI9PxGLR2l/cEx1tC6C4YblDubHC5RflN?=
 =?us-ascii?Q?g/hh8H7sGEtBbqJM/uMBrs/au51s3p8xJgfyVYXH3VDcY1i7fZMpaSd3/Pwv?=
 =?us-ascii?Q?5HGTnEFxNj7Qop5uyjY7GBLfbqTTvmIs6YJBUXLQ0cv2EwOJa+IwHR9pzHAT?=
 =?us-ascii?Q?4rdHffU1hIT34liZDXedN/6h9SH3Kbh4EIKx/aMqi1c5IF9to9jpiaZXDZxV?=
 =?us-ascii?Q?Tbkrif6afnik91UL5rczJt17WUf15lRJV3lJMiWcRxW6qKdUN/3xkDD/Y1dm?=
 =?us-ascii?Q?lcNj2LSrQIvD01Kx2hAY3FILrIrI3Ch4Uc39VswXmrlNdSVu4AEnRrSYPDbL?=
 =?us-ascii?Q?iPiHeG6OrECxJ7ytzB7KAjX1c2/PdqG3MVQ28XVSI0wCa80cZF9KKoh+//G3?=
 =?us-ascii?Q?HHrxxQD7rOC1R+Bo7qa1VKXNxEgEOFbxv7GzE09uGG9444KH7pfyaj/hjfhK?=
 =?us-ascii?Q?T71k3tAXsI6szPv4dYPNFAEKLBslez4R/8BsUmDrz6qMGSxUiZjITVtX2c1B?=
 =?us-ascii?Q?8WzMhumGI809vpHN8XIhy9gSwQ46YDjBicEmxDAxL9fFa5d0PS0T140H/Mi9?=
 =?us-ascii?Q?wlCzVf7seihzXWxTYnH9jB/S2h3ZjZt9xvqmpJc8gjtqTeUxdOmBxTYLOCcU?=
 =?us-ascii?Q?FVZmA4gEH/dknVay9UUG9hbrpRuQ0cy2FwCU5VcqSi7OjOu3wxcei84cLpd6?=
 =?us-ascii?Q?ZFKvPty9no4RQMGP3/TdP8AyQAOCuX/PZdZ5wkTw3AtXEI8cQXXbDIJtEg9y?=
 =?us-ascii?Q?SLGYN94cKVoSEt0fgdhnEVFI+zE4nSljiBx54nvkcUqU3/71cVcenJ3h2xlX?=
 =?us-ascii?Q?qU9UfTSLXUhEWRE3fzmH5ctN6EGCmfFKvwkzoEIe/OAMUGFvB2VZ+vt1NNDK?=
 =?us-ascii?Q?iS0tBOfyZBS398tILhqbQljlJuYez74cLtsmskRZkbksb4YES0MFKdo1ADqm?=
 =?us-ascii?Q?kKkRdXYV9USW6kLDHLcH9+xWsXjmpCKeSpJEHLmdyXKkXepNTJxGd5BKQtnZ?=
 =?us-ascii?Q?pi8WvW43LLNwPPeIxfE5Xs0bVNzBlByANmzBjWixX2/7oIc/PE+4EofKiSq1?=
 =?us-ascii?Q?naAo8GQQiu+LoUw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB7044.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(7416014)(366016)(19092799006)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?XHqLTOrL47/1adIdQpRum89lp5lFpSEgM4/sK5QRV6UiywQU6sRST2lPeWTR?=
 =?us-ascii?Q?9wlmEW8vTmnC6qhEu1yaHuZMoOGXX86Jq0GYJ0GaUsRYScNrXVgxE9VZuhvk?=
 =?us-ascii?Q?22k2E1EnhuFa7blQQHcj+C0Dnu9/0wkKRAycWq18aAD+xoeNRBMVppCJ0mDH?=
 =?us-ascii?Q?WZsSsq16ehusm96DhHlSeL7AVCOBOLVB9SyuWIOrJGdef2b+a1ocNDTx5xhk?=
 =?us-ascii?Q?74PQv6uxZ+s6KNbTC6jaF1lG71LhAIXZ7QufHsOH7QJLHxJ5nhnum3fV6T/Z?=
 =?us-ascii?Q?42dtc/p/LYYe6a41CFBs9ubh4AS/xqnEBtvY6eHbBRqBvlj3Cnd1jfLqz7WB?=
 =?us-ascii?Q?Y1jyHs46IR8dK1ldeg5eZ5KJE6J9u73Rvuzy/h0r7rsNXqKDHGNY4I9gkWPY?=
 =?us-ascii?Q?UhY47OTtNGZFc4dCTRmFDOqfSLnHXqLTDO4Mh/jDkvR99A4JrFqfl7lP8SQt?=
 =?us-ascii?Q?/NPlSK1R23eNN4kAeGfXaAJXr8uKCcroIVjltLJYIC45lHGE+LTpcw5pftTq?=
 =?us-ascii?Q?vor247jJZ5GgvSpjPhSPJPFhLRdWarTp9l/lTS6g/eFwxqhG4PF7LTVmqtvs?=
 =?us-ascii?Q?N+sXsZv5Midkj8dLl9hwTQ4dN6nQtI6vvr5oaarAwhSWy8LG64eqiCSByQ2B?=
 =?us-ascii?Q?iSflHiTDozBaE3EdMQBIVXiF/20CqhKvHMJCFKdosn/UakBoS7iFVHke0tDC?=
 =?us-ascii?Q?ubzBqmQ5gnPXZkmj856qwXMuhQXuH/tVrYqtBmIn8XpWUyHI9hawGdWIDts9?=
 =?us-ascii?Q?ZO9bO4JkUYgc3X0HIwAuTkECkffW+eGHZVkaEkY4K/D8x6l+yOAl6nQhO3UK?=
 =?us-ascii?Q?EIeqkI8IGqeezLa7bOh0JRwP9poVcb4z1y+D5ZLQM10QA37eT+YQKnWSz2sg?=
 =?us-ascii?Q?yUJKLKDD9ObiYWYjkz85fdp72JFag7gywEsMHh4fJ4N2K8vn+PUPSMWJ2UF+?=
 =?us-ascii?Q?UxKoyfj374sRV5bzM7W2S7zASG00YfxE+F5emjy+d39ruHn6wffZWG/OyaiT?=
 =?us-ascii?Q?ePhSjp3TSrXvd+tkTVhcuN/LvFlrbqSsjoyuqV6fa0gGuDJPHHD/xBswW1jO?=
 =?us-ascii?Q?cVqW1dNHhsVQ2jr88bgCoP5e3z14WIHwUNLmtUAyZ1jDijR/iIK2Hv9uEBT+?=
 =?us-ascii?Q?UMUwJJvi09oB5cOm6cZu6dUuFmzphOLEGhc9+sYFOCHaaGsOm06qRCe4h1hw?=
 =?us-ascii?Q?6utw7VCyQ4GVLhhy2VBzI19nwZ/bWhRkBUplmbfkrw8SXI5gwgrtzvGA+HuO?=
 =?us-ascii?Q?KM8pH2N93RO/ICrhzTCS4aLI7RXlm2oRemM5NhfFQQtoymYaHCWaM3RrauE2?=
 =?us-ascii?Q?texxELZAdEDWFWqAE/LbX727+OOTngk+FlWOaOWwwM8mas0p7amdRNRUaLs2?=
 =?us-ascii?Q?nSzEQGqcHno15lT2cCpUsYdc0TIcWrQGH+IzW8j1V000oLyoSb5Xp5S2Ut/a?=
 =?us-ascii?Q?EhDY77iHYHKbggJvQWRL0j+OqEPHwEEvp8Q8UiR2eYBJZdKC3ZJ/EH7liuZK?=
 =?us-ascii?Q?KXi/rqpogk0whCjJBgCzuYYn/LMz385XMwwDDwZPpi8srx8R92hPJ/pLRf8U?=
 =?us-ascii?Q?wYD0W/504XFVxUdYYNv8X2AWHCxuTKsxWzWggqIw?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a330c64-0187-440b-e19c-08ddbf5ebacf
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2025 03:06:14.0720
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: onw9q3A5wmH6cSQmDrsFsx8Hh26kqcb8V861gcwrYwrJuVGSzFdjlpvDyzgBTKm8uCLgLYPWIMJDSmNBIKXBtw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRWPR04MB11221
X-Spam-Status: No, score=0.8 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

For the XCVR module on i.MX95, even though it only supports SPDIF, the
channel status needs to be obtained from RAM space, which is processed
by firmware. Firmware is necessary to trigger the FSL_XCVR_IRQ_NEW_CS
interrupt.

This change also applies for the SPDIF & ARC function on i.MX8MP which
has the firmware.

Fixes: e6a9750a346b ("ASoC: fsl_xcvr: Add suspend and resume support")
Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/fsl_xcvr.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/sound/soc/fsl/fsl_xcvr.c b/sound/soc/fsl/fsl_xcvr.c
index 405433144515..5d804860f7d8 100644
--- a/sound/soc/fsl/fsl_xcvr.c
+++ b/sound/soc/fsl/fsl_xcvr.c
@@ -1395,7 +1395,7 @@ static irqreturn_t irq0_isr(int irq, void *devid)
 	if (isr & FSL_XCVR_IRQ_NEW_CS) {
 		dev_dbg(dev, "Received new CS block\n");
 		isr_clr |= FSL_XCVR_IRQ_NEW_CS;
-		if (!xcvr->soc_data->spdif_only) {
+		if (xcvr->soc_data->fw_name) {
 			/* Data RAM is 4KiB, last two pages: 8 and 9. Select page 8. */
 			regmap_update_bits(xcvr->regmap, FSL_XCVR_EXT_CTRL,
 					   FSL_XCVR_EXT_CTRL_PAGE_MASK,
@@ -1517,6 +1517,7 @@ static const struct fsl_xcvr_soc_data fsl_xcvr_imx93_data = {
 };
 
 static const struct fsl_xcvr_soc_data fsl_xcvr_imx95_data = {
+	.fw_name = "imx/xcvr/xcvr-imx95.bin",
 	.spdif_only = true,
 	.use_phy = true,
 	.use_edma = true,
@@ -1806,7 +1807,7 @@ static int fsl_xcvr_runtime_resume(struct device *dev)
 		}
 	}
 
-	if (xcvr->mode == FSL_XCVR_MODE_EARC) {
+	if (xcvr->soc_data->fw_name) {
 		ret = fsl_xcvr_load_firmware(xcvr);
 		if (ret) {
 			dev_err(dev, "failed to load firmware.\n");
-- 
2.34.1


