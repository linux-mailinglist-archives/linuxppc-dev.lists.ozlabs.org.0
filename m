Return-Path: <linuxppc-dev+bounces-16401-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0MfwJneUe2nOGAIAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16401-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Jan 2026 18:10:15 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 31F17B2A9E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Jan 2026 18:10:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f25HP1tZ8z2ydj;
	Fri, 30 Jan 2026 04:10:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c201::1" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769706609;
	cv=pass; b=mptXHwwy/FWe5fUd+ig/91t7Eh0S48pmqs0F3smBBzQsbTP2a5Q0VLJOVL8qNV1ZPtprOy2csGgJexNIp2MsVHLx2n1nrb0jRYyM3BKoQ/cdJzn4lSxbRd5d9PT4SD7UhaB4kg7akEOq4bMnusG8o8gKNxe93XFduQ4bghAiA4ruopqEmBqCvNqlVJUk0brl+wjnjw5surUMKU+2DWD+VS6LL+QofSBujBqmPoBI6O5SzgWtqwm7DXNdX9rPqvbwvP/UG2mFBwohy5c/f+EU4xT0UE8Lc3CVXYZNf2d9//BdUCrF5c3UmwrYzru6L2vw0TB2112dp/5oToY7894sVw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769706609; c=relaxed/relaxed;
	bh=4JvMIdPRcDojvFkxL5ETLXwHnt/nwzxruRvXsCzbMcY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=nDsEp4uCSEp99e7g32mQYafbuZmTble7H2f7Zrgd7L/QpXWziDIj52b8ntbr+boHPPlwJlzM5iJMqZElLoNhl30fLAMSuN1nO2kac3qAwWUmdT+xAmuGBeqYJ5DQeEBSld4k+Jfi76DzTzr0Jz46JDdGkYIzaVH1VQ0UfM4UJx8sSYI/Wg/UicvOJsMIU8mPHhUH7gdwsoWKvSbe7MXy6CtF8o6nL9wMrIbfTIP1D4eAm9ynRQ8ImOkbM0odQzF9AYp2m/Xfv5HPFxvqGri/0CGrqO19oVZTSobEZKCwGpEPP23EwyJlM9ppFyot+biYgqXXd/cLJjpvWLr5QH/t+g==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=WR050G9z; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:c201::1; helo=am0pr83cu005.outbound.protection.outlook.com; envelope-from=frank.li@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=WR050G9z;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:c201::1; helo=am0pr83cu005.outbound.protection.outlook.com; envelope-from=frank.li@nxp.com; receiver=lists.ozlabs.org)
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazlp170100001.outbound.protection.outlook.com [IPv6:2a01:111:f403:c201::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f25HL5PLPz2xQs
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Jan 2026 04:10:05 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v2vKqB+5QlR0if2cxB9kTgxGs35XmKKxbdY3ExVEJNkeoRZmrRs1J8qAWjx0QBiJO++uWCJJq7VTJEsgRiqlgJaMKY7Tw4sojLvEiO5xvCoEWen2RujaDEJq+e6k96K7Fj/9foeXamLJ+vb/91zxfy2+qN+GcrEPGogQ2UPhpeZ8h5kXkzY/idDoA2eaaCePAdQrE9YMZWPYjy4DaGcuSBgF/ax6R093AUQmTtei8XO2ooTQWx4xHKQjtSGH9Sh128lPH4BavWpAZz+pteLAU2s6aFfWY7aJaCty+ZhxaO6sm+rakpNhlSYCOAsuoSY/1gL6l850RZC/tvhTJL2IwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4JvMIdPRcDojvFkxL5ETLXwHnt/nwzxruRvXsCzbMcY=;
 b=Vp1gkL6FG9KM5vxPcKJXZp8nB/Yc+Ju7GpHmxWUAD/SqVc/mwrCjoeL8G+Q6YNxPQTFzZeo+uhkorbS99DKLKoo4ufJEOP6UjV0yMIQVbUGny0cIA7VyrBqe8/PR65z6QeZ/Mv1TIoyK8ILS0TxSv00rCbv5X5qhN3g78ExZS6THlV/Z301pYEHzsKky0hv31bamYzXZrla6rDPNOYtugdhuGobIwEioxUXsRTJMH4A3qVdoSui69nLSz0HI2ClQLgBcluL5IxktLxnBAHBWoHfU1M4xlTT8vNWIlGkvaxvSGt9EJBJso3+LN6YCHuGrGKG4P63E1bk2m0nMJoHp5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4JvMIdPRcDojvFkxL5ETLXwHnt/nwzxruRvXsCzbMcY=;
 b=WR050G9zsD0mBfZ+j8qo/VCnC+pqJSWunwDTzn2xAXpTYYRahXWAJ9ZcIrilDoKZqE3Qi9AG5sgFisQlwCcZJqBG+dXrxqEj7aqYYvSzu+HG/6+VRDx0khCHEqYvSwPjxwS0ss1pzqiGCHMCMb85DlfsdLw6BGPeGw6cqsynczWXGg4qo+kPv1yeuOp3m80lb+otHgUav6u3CQeqARsl740URGTMiGnhmAo9G0DGSzvED8GwAtUGEXhPnqJVhRzbihEZx24j+q5H7mhVf+8gQzgrVbUrkhfEJOrh/8nFdRzG/Pptu5MarBEWxgd2DCcPeJNu1gmy6cXhJg6ejVJ4Nw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AM8PR04MB8003.eurprd04.prod.outlook.com (2603:10a6:20b:240::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Thu, 29 Jan
 2026 17:09:43 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9520.005; Thu, 29 Jan 2026
 17:09:42 +0000
Date: Thu, 29 Jan 2026 12:09:30 -0500
From: Frank Li <Frank.li@nxp.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: lgirdwood@gmail.com, broonie@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com, nicoleotsuka@gmail.com, perex@perex.cz,
	tiwai@suse.com, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 3/3] ASoC: fsl_asrc_dma: allocate memory from dma device
Message-ID: <aXuUSnPSCa8YYfgd@lizhi-Precision-Tower-5810>
References: <20260128071853.2602784-1-shengjiu.wang@nxp.com>
 <20260128071853.2602784-4-shengjiu.wang@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260128071853.2602784-4-shengjiu.wang@nxp.com>
X-ClientProxiedBy: SJ0PR13CA0170.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::25) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
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
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AM8PR04MB8003:EE_
X-MS-Office365-Filtering-Correlation-Id: 9941babe-8e75-4896-e5fd-08de5f59318b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|376014|1800799024|366016|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?vaAdbh+KY2QYvqpOjTN4Bamg7dB1otZAQf87KR5kicTh2K9W0hbFGmcibUnf?=
 =?us-ascii?Q?zK4IQ224MMnAjjxLI6/rMBNAW3GUwzQ6Co27fOnPbDQBUOtQayZIcw1TUdxZ?=
 =?us-ascii?Q?XjwLXLXv/3l2cIZ922BgpjBZKo7dB7+NlpqKurTrEXWIIxgYY72ksEEb9+u7?=
 =?us-ascii?Q?cSIslpEZRYFOc31N+nOK1oGvdKg048wBG4o/5bVSRPXKiFdixEzomupRRzen?=
 =?us-ascii?Q?08JwUKsRUDKQjaoWsIi0r5S7rQGOZSxl1QKtk1P74FSVpbQvesCAENg8S3D5?=
 =?us-ascii?Q?TO7GnVvZnzFW9VYgmUr8zz9YWktYZQyOTf8L0nTDz3CwX1VI5Lxme6ylTtXl?=
 =?us-ascii?Q?97i1qByX4Yv7I1p3j7mr+k+yOAlpk2FXafW6wCDEQeM6t/erdi3GlnRFMsP9?=
 =?us-ascii?Q?R50C4w3mCy2EU+H/jRwqPwFf9LjePtydXYyVe8C2Qp7vN1iZy/kktDQB2PcJ?=
 =?us-ascii?Q?saTsPnsRUvzolWrEJVhY5Gvo0If8ZYAMB91O8i5KLTKLT+bQVlcHFqe6RTM9?=
 =?us-ascii?Q?k7Ons4CoC7bpCwgy750F/elCxZnRUYLz9Jq5zEQS/yMpF0njRA/bIqrMrxlg?=
 =?us-ascii?Q?DHSYQyMn6kZN0v7CasWvrWXdW+Gw7Vst7VlYgycGLzN1KvdKqjjFTGbNQuVf?=
 =?us-ascii?Q?YApv8ZNDWwpbpk81Rjsev209JODJpTTJaaO8dngu+pIN5KBCZHpK8EEkqVCZ?=
 =?us-ascii?Q?G7qncKNKRrq/lVSdtLnfFdie41LuYztfglBWKgSe4driXri8V+wlM7keiBS7?=
 =?us-ascii?Q?OgB9L1fHH8YlRVVA4Vp3T2Y3X4+3VXuJUAqolVyjktdqo0AddslhjDa4GKfi?=
 =?us-ascii?Q?R7EwYVWLk53GZWgtnadEdc0uG/d45f+2qNhiJ4XxgWCntXdwl1JtYokCELWn?=
 =?us-ascii?Q?JlTJMn46XBI9wYQVzAF2jDd23aTNGGrsKUcTrdz9JczAUwwdG9TTc4Ijikbn?=
 =?us-ascii?Q?53MBABWEMcmOTmMuUtSisNgj1yR3w0RQ9Th8bQOzd63E1GjFJxe7W94lNMFt?=
 =?us-ascii?Q?NFk14hAbA0DLE16bPsAi3P9U1Q6Ytu3hvZe4DYIElV6hrtE3nT3vvlmxZnQT?=
 =?us-ascii?Q?RhmWNtvaSNXKmhq+KtBolJABu04BwO/y+8mhTO4WeVdC5T9Sp9FHQbEuxWW+?=
 =?us-ascii?Q?DCf/1uuxv/S4DHpT9yp0+mqESj4XwqLSt2Ln+t99zeS9Itp4DhYFbW3XFxt8?=
 =?us-ascii?Q?gWXvQ4FFlWlq94hywx8OH2N/RKpGcYSmGKqiv6xQ5E4+kDjG83rRIhNpBuyb?=
 =?us-ascii?Q?kZYtgewoRS6S/s/ZASPATK2k3vwTaYlph1JwFJO2o1LaZIeSlbfkyB6Ibg26?=
 =?us-ascii?Q?kfKxPkl7p9bdoPUTPf1fFqPpXA/kV55i3YonUDYB3CCOZCNcc+tY2OvRk2nR?=
 =?us-ascii?Q?0slAtYDkqoDhlINMgmYVfQkcr3EodcgiV+0Dug1/xhNIdkh4m2ckyu6N/7QM?=
 =?us-ascii?Q?cDvX23W6+HsTuMjM8uyYXX7bu6rWxsoWC4bhcSMQOv5nCFx7TwtbPyR0XGsA?=
 =?us-ascii?Q?jWMjNFEw/VOML2enJFed5kKlM94h5WrVaLwpafpp0LIpfVDa1xIi/IsNhfON?=
 =?us-ascii?Q?VlMF4tb56TtuOUnQTnLUECWHpPUA7D8kGidAwmWNNO1MpbfzwX4FdmiPwXRP?=
 =?us-ascii?Q?P3vrF5VTmNRP6LzG0yASdNg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(1800799024)(366016)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?2PvkbZHE+tJZiljFqGX9HumvfaK9RavVbZDOleVtKVqhGYlLjY32/MxZSWqH?=
 =?us-ascii?Q?CQGfiWypz84xntNuEAwWfqIelrXybnBoYMFcF1TYn0bxyq+0V5zA9nEGvROJ?=
 =?us-ascii?Q?N/AdmhhSnUMj9ZNPWM74ejnQlxR3EqJtMkSxnIPS7VNSil1Qnt+cobF0qaez?=
 =?us-ascii?Q?kCKc2I5m+acLis9FZf/kTGTCBZhao+w9k6f6i6stF9I3S0OLEgvBO7bvhK4f?=
 =?us-ascii?Q?bzm3AOH701zFl/U4DefPws+9bR880uQElPFxx6saN6Aq5HnwSwztk8UlEJp1?=
 =?us-ascii?Q?SqpUgZvH3FoNK+oECbTnaJvLECDOVXE6uxfL6iZlWtclvad0u/qMIWIrpInc?=
 =?us-ascii?Q?Zx80Bzt6lRhPjU6T9J3aCKjFjZKTXPnpszzbsO14RAPnKvP8JT3il5SlZL+N?=
 =?us-ascii?Q?CDRZfKrEkQaYKXFnbACHUsJW6hCuyoXp180jC85WOcWuuM+IfkVdRU5UaFwL?=
 =?us-ascii?Q?bUz6fpEZRCNHJw/RXQsJXjOIG/9QlHWFg70BVP54Zmm2L4pTe7kC60DLBFFc?=
 =?us-ascii?Q?dowxzsvKSgF3CFIWeUXJVlGXuK+5OGQQ3GFVfet5WwOmtbNZJVpHl4nneSmd?=
 =?us-ascii?Q?NBBMX480gmQ0hdTbeW6oNajKG5JvHC6PS/pNHvGkF4o9slG+WA0TnktVeVvJ?=
 =?us-ascii?Q?cCLypsCbQHGBFPOf79vmICcYKpX7icU6TiSx8WxfskhmqWYaVv/uIV0lqArX?=
 =?us-ascii?Q?BclbkMqnkmuMU8k/mThgpsM0ZnfnvGiWeer8g5spOxgKxjuCBW9Kg4QblY49?=
 =?us-ascii?Q?iqT6kJh9gNr1PKmMh7bDN1jrRPJPKTpezIGSz7KiI3ePTaUUL28imFPQNyny?=
 =?us-ascii?Q?0EBCyxTGRo150Q+4TdGl6ABTNr5X+4cCM7skhct6t/Yy+BxnX5OPw8cztbJL?=
 =?us-ascii?Q?QYP0UnsnT0I1+krsDi0OCFe8MXIRqVz0DLn2KdR8YPb6cCOFsh9o3knjJV9x?=
 =?us-ascii?Q?PiubMhBev2uUpWtJdttoxUv9dLhccf7z3W/TGFzHzhB0H1bzcMwqXGbb9JsE?=
 =?us-ascii?Q?45xKeLwXlWymRuxexmuDMqglDiK+Yxey2LpJg5+wLwCr0/rGVoxYVzCsWN7j?=
 =?us-ascii?Q?mxJy+H+lAsdSBoqn/voviUS/QCdNQfu7EgxdmviXcaMIDweOGRn6IyqhAn8e?=
 =?us-ascii?Q?4TijQSn359VEEnwLj3PTnMBO3QtP6hNTJ7igCsDuFh6ZXXt8Lf3Tk4SBXcnx?=
 =?us-ascii?Q?emmyui8vUwTJSQq0YX35c0VDFPXfkgRxM97nKtrUalKqSHwP4/NJNOGE1OQF?=
 =?us-ascii?Q?NlB4GEoA2qh073/0vj4F0ygjTNjwgaixjLu8lwl+K5OEdhfWnUWuIXIRF/+2?=
 =?us-ascii?Q?S2o85f5rxH5YT+dpfkvuoTkN12CVe9y3a8MzG16RFwcCyzcGN5YT7UNcFTJt?=
 =?us-ascii?Q?jXcm4Rd/gEhriC7rVjNW/HTt8D2Lr4X33wJu3VtS60mHFGpMLsJ29jHTjRXV?=
 =?us-ascii?Q?eemM1k1OycEqbPAYDapyW8cyLDd6bOQPddrUhYAfwSprtZeEQfQjPSTGMUV+?=
 =?us-ascii?Q?OmYjcVRriP62zkJ7jxysjtlnRDj+bX9dKArs0jHoe6TJ+HtHt+e9xZFeu8Wr?=
 =?us-ascii?Q?HwUgNfe1s69tm936sbdDLQdJZ+KsSZRqYtL/rUlontovh62Hsxl6rhkHzmqI?=
 =?us-ascii?Q?T/1mDnXwP3pDuI9y/98FoHRcAjOhucfP3k5nAeD8KcDL8/gD6gNfDFQbatvR?=
 =?us-ascii?Q?lFAxasqm4Shz36WHX5QS4/A2meDUJ6eZRjHQ/3p+3zADeT+HoDZM6dDYMHDN?=
 =?us-ascii?Q?uznJckVCgA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9941babe-8e75-4896-e5fd-08de5f59318b
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 17:09:42.6768
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bQZQ9nwvLSFoDhnDaDouB/GKI7fCeQNJXCCWnawxuyTeXTxQ7ea7Jru5dZiYlKZBFPoiSH5XYxTLfJtTuP7F9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB8003
X-Spam-Status: No, score=0.8 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.21 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-16401-lists,linuxppc-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:shengjiu.wang@nxp.com,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:shawnguo@kernel.org,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:linux-sound@vger.kernel.org,m:devicetree@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:shengjiu.wang@gmail.com,m:Xiubo.Lee@gmail.com,m:nicoleotsuka@gmail.com,m:perex@perex.cz,m:tiwai@suse.com,m:linuxppc-dev@lists.ozlabs.org,m:krzk@kernel.org,m:conor@kernel.org,m:shengjiuwang@gmail.com,m:XiuboLee@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[Frank.li@nxp.com,linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[nxp.com:+];
	RCPT_COUNT_TWELVE(0.00)[21];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.li@nxp.com,linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,pengutronix.de,vger.kernel.org,lists.linux.dev,lists.infradead.org,perex.cz,suse.com,lists.ozlabs.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	TAGGED_RCPT(0.00)[linuxppc-dev,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 31F17B2A9E
X-Rspamd-Action: no action

On Wed, Jan 28, 2026 at 03:18:53PM +0800, Shengjiu Wang wrote:
> As the dma device may support dma-coherent property on the i.MX952,
> allocate memory from dma device to make asrc driver to be compatible with
> such a case.
>
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  sound/soc/fsl/fsl_asrc_dma.c | 48 ++++++++++++++++++++++++++++++------
>  1 file changed, 41 insertions(+), 7 deletions(-)
>
> diff --git a/sound/soc/fsl/fsl_asrc_dma.c b/sound/soc/fsl/fsl_asrc_dma.c
> index 7dacc06b2f02..b8fe242d53db 100644
> --- a/sound/soc/fsl/fsl_asrc_dma.c
> +++ b/sound/soc/fsl/fsl_asrc_dma.c
> @@ -449,18 +449,52 @@ fsl_asrc_dma_pcm_pointer(struct snd_soc_component *component,
>  static int fsl_asrc_dma_pcm_new(struct snd_soc_component *component,
>  				struct snd_soc_pcm_runtime *rtd)
>  {
> -	struct snd_card *card = rtd->card->snd_card;
> +	struct device *dev = component->dev;
> +	struct fsl_asrc *asrc = dev_get_drvdata(dev);
> +	struct fsl_asrc_pair *pair;
>  	struct snd_pcm *pcm = rtd->pcm;
> +	struct dma_chan *chan;
>  	int ret;
>
> -	ret = dma_coerce_mask_and_coherent(card->dev, DMA_BIT_MASK(32));
> -	if (ret) {
> -		dev_err(card->dev, "failed to set DMA mask\n");
> -		return ret;
> +	pair = kzalloc(sizeof(*pair) + asrc->pair_priv_size, GFP_KERNEL);

prefer use size_add(sizeof(*pair), asrc->pair_priv_size), which did
overflow check.

> +	if (!pair)
> +		return -ENOMEM;
> +
> +	pair->asrc = asrc;
> +	pair->private = (void *)pair + sizeof(struct fsl_asrc_pair);
> +
> +	/* Request a dummy pair, which will be released later.
> +	 * Request pair function needs channel num as input, for this
> +	 * dummy pair, we just request "1" channel temporarily.
> +	 */
> +	ret = asrc->request_pair(1, pair);
> +	if (ret < 0) {
> +		dev_err(dev, "failed to request asrc pair\n");
> +		goto req_pair_err;
>  	}
>
> -	return snd_pcm_set_fixed_buffer_all(pcm, SNDRV_DMA_TYPE_DEV,
> -					    card->dev, FSL_ASRC_DMABUF_SIZE);
> +	/* Request a dummy dma channel, which will be released later. */
> +	chan = asrc->get_dma_channel(pair, IN);

Is it possible get real dma chan from fsl_asrc?

> +	if (!chan) {
> +		dev_err(dev, "failed to get dma channel\n");
> +		ret = -EINVAL;
> +		goto dma_chan_err;
> +	}
> +
> +	ret = snd_pcm_set_fixed_buffer_all(pcm,
> +					   SNDRV_DMA_TYPE_DEV,
> +					   chan->device->dev,
> +					   FSL_ASRC_DMABUF_SIZE);

Here you assume chan->device->dev never change when it did DMA transfer.

Frank
> +
> +	dma_release_channel(chan);
> +
> +dma_chan_err:
> +	asrc->release_pair(pair);
> +
> +req_pair_err:
> +	kfree(pair);
> +
> +	return ret;
>  }
>
>  struct snd_soc_component_driver fsl_asrc_component = {
> --
> 2.34.1
>

