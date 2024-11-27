Return-Path: <linuxppc-dev+bounces-3581-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D22869DA103
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Nov 2024 04:01:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xykjv1G25z2xG6;
	Wed, 27 Nov 2024 14:01:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2607::62b" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1732676499;
	cv=pass; b=XywWK+MHmg1Myabxgc18udE9SoY8QtjV00DfIXUWl7ce13/+p/+0XxjH4fCywr8KUU+JmRokPHJm+/gGTMkhoCPd+B0/nLZcVuY37/F33nVp3HID0vmGElUG3y7lWYTKif23GJ7P/n3/ZATWJfdU8Cl91jL65sKYagkb+6ToBI6VOsKIalVmvsf8RSO7u1mOgujFou9+qd3gJrQwHCZt6Kdh37X7NWL+moVNvABPPiejwggArnQm9z4JgBZJpmrQ6ZRBWCrdcAC1xcqVTUba9cvzKyTmDdJWgrPjV921g5AYXPgtb5Vo8FOqwbeEpC/tox8Jf+yORhLf4rSdco45Zg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1732676499; c=relaxed/relaxed;
	bh=3te39e0q+q/rVjtlUmF1UNs0TIiJR68WZXzMyKU1tFw=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=AQYb4IG5wSjsmlRPbaVIV6OgQlPh0Xfyqh2U93xWWFzTSD5OO3FF2UVZlgzk30FEeDufjgyV8M8Db7VeF3dTMQZkIcZIfFxmz9W2Uvj/Mu+jjccDHdNVKdYNtja5T4ZDk/7Ea6Cl/1dgKX5UHckEWcPmlBm+Q239wE82Xo51U/HUBDdrKNxRhe3zVZuXCT1W0KnLv+FYwIkJgHahrGpwgMtKKRbEcZZgqv08Rf6F4XS8rZlTzrSBH8CJvz3GB7nVRie01aaFaTl8FWYqsYMjcDPxwUZ02faJX/C2A12uXmHYbYQd6W2o6kD/OzBYRrjsvjJPhGEYpjeXfg1ZOPmB/g==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=X3y4VkQL; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:2607::62b; helo=eur02-vi1-obe.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=X3y4VkQL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:2607::62b; helo=eur02-vi1-obe.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (mail-vi1eur02on2062b.outbound.protection.outlook.com [IPv6:2a01:111:f403:2607::62b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xykjt3ZQWz2xtp
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Nov 2024 14:01:38 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jfDrx3AB5sVYcIdeZPNW0GIt3x2F0y0LIUIFVm0qvPMukQp/0vLe5yhIFI+Zerqd3sbhRfBDRqCWAV67DnGem28dAuep2flQo98JUMkS1Y7tHKBR3iW2KJGLdiljVYnQyCMRXtDHSlRgHeO8shs6yavKa+oSy3IeRgRDTy8ta3+GhHwZ3Yyyav86tXMV4CiQet7SlhwsEThulRloVmTxfaGOJjuIAHP0ovsFKYxOJ4xgsSMBZxNqJIi8p4kj3BdcmCE+YaFFv7Tggb/eqR+sTcwQyzxga+9Y+7iowz7jgEFdwo2n0zE8RwtqUSkW7c572jOVJ3CfiTZkIX6G0uY8JQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3te39e0q+q/rVjtlUmF1UNs0TIiJR68WZXzMyKU1tFw=;
 b=guoG59oP3qP91t31lXGXT6m5UbFqSCvxJddaY/Jl3EqVHGyPgxN9hyOWeYKvYNrjfvRrP9Idpym9Ui19VFhzUhgdt7t9uOiAhdBwl6/0p/Efsjr2piTOoCGjDOH2ZtWilnusp2nWSYBrii8dwFicJS6jpW8DwRBpVAPrAKl3LV2gze1CVKfvDlUzJBIJ9cTJIiPRIS4CDMj3nvHSwhdu4v6Z7f7bQn4MqbiqBmIb632o2IawHzenzQZd3NrdrFdXvjm1uo8SCAEczV10HvfVUrZIuuHCGL/9h7Q/Cf8tI991ZimOy5kT83Pb6j1zjl8AvnmobcmY/0Xs094lcKb2eA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3te39e0q+q/rVjtlUmF1UNs0TIiJR68WZXzMyKU1tFw=;
 b=X3y4VkQLFT6yNCpZS8pIG5iJxPk+RkCOokZIKejucdkxPpBI8JqPXqtDmuRAltbOxdERVQySumyrpVvPObKW2v9TkuyrXNMQBw2ppVdc2EAv9XqDZGflwvOorw9QxyTxR551n8NsvCm54k1NXQ+hyRvyPTjZ2ZvpZyw+Nd8H9cBc7BdLKgjM8dDv95rEyLPAOgge4/aWjbqDsm/ssOeURNaUE/900yIzFonqXxHfkLqjDl78YwHXqsWqZmGPxADd//TWhvZrTfQX7fu1/9w0tzqCXG04USrSZrJLldFvuUamN/dAV/fZ4MDRiYVIYmPMAbpwQO4CW+uwyFysKgacsw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by DBBPR04MB7771.eurprd04.prod.outlook.com (2603:10a6:10:1e6::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.13; Wed, 27 Nov
 2024 03:01:19 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891%6]) with mapi id 15.20.8182.019; Wed, 27 Nov 2024
 03:01:19 +0000
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	nicoleotsuka@gmail.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	linuxppc-dev@lists.ozlabs.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] ASoC: fsl_xcvr: Add suspend and resume support
Date: Wed, 27 Nov 2024 11:00:35 +0800
Message-Id: <20241127030035.649219-3-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20241127030035.649219-1-shengjiu.wang@nxp.com>
References: <20241127030035.649219-1-shengjiu.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0012.apcprd02.prod.outlook.com
 (2603:1096:3:17::24) To AM0PR04MB7044.eurprd04.prod.outlook.com
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
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|DBBPR04MB7771:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c6c566a-45be-45f2-3afe-08dd0e8fc40b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|7416014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?rSyczTXAT303/ltJu9o8gMvyWdtAYltNSTc1AoKd2dmiQxSesHzqjWPM1rEn?=
 =?us-ascii?Q?HRJVKTARX0HQliPlH9NCI6xy7nA+xZyybCPm0RW/cRmivsuOmkkreqD64l0K?=
 =?us-ascii?Q?/15ONfLpPUqw4PQZAWm0azlMA1FhaMypyHaosNkHReGAAin816cR2880eRjd?=
 =?us-ascii?Q?DgMMDmauw2UvxGtIVO7bH5GwJWSNXhMC3pn0MemZGVu8N49pZbcIknCV0WTv?=
 =?us-ascii?Q?FES4JYR+doi+SrYEcTcr4/c2kpIqId6dk3VYpU6t5Gsnfnc9b3GAH3QEDYvC?=
 =?us-ascii?Q?soMzIe4MvXR7ZSu9oRNufwKHgqpHp9MD1kx9sr2z0UWfSInDqeQMFa2/8/Rt?=
 =?us-ascii?Q?nH9y5oqJxVOvcAy4Ebx0ne5v7Nj5ukCtpeGjHm1CCWKKzlx4t9jk8o6m0dcw?=
 =?us-ascii?Q?fchnxCAGZFGzvDIzNtD72H79nKZzDDsGvv0YjCSwkRPDuPxyBfzLGie4yeVC?=
 =?us-ascii?Q?aKRXt72jYnGl3XtdQ3eqCMqn1yc4QMnlGJBiTjft0zWdNHBWX9BeSPJcdGAY?=
 =?us-ascii?Q?FgTFFRkD65EdzweTZ6vbHO6IC8Fz3v/MzTlUlRZudQlzAYy718oePGXrZdEs?=
 =?us-ascii?Q?KiyK5EP94RUBaMsImTxK6vne7z0Kn6YxdG5vJzJ8XCPHgW/CUZi2Gb5vl42q?=
 =?us-ascii?Q?TGE/wH40zG/4q+ITNoEvmez/tO9zNhR8PeFnvoSAKS6dSbrRSVX5fFuP7eFd?=
 =?us-ascii?Q?JgJLucMdWrhg6Zk2U+QyxSeSDKIy38m8omBuVLWmVpT0RxzSwHVROqGlPcxm?=
 =?us-ascii?Q?kw6e5zezGJLRi6a8YehQp9NGFbstLd1OrgPV0qvclMf6WkNL7WYwX1NmjhKC?=
 =?us-ascii?Q?LH+KXcMNzvPPFL1uXcyqTpCbVVfiykOHnqYTU3im03VqeYxwQd05hm/HO+IZ?=
 =?us-ascii?Q?8FwaOnceA3fzkzuUSCD0gUcaqVajt2Cv7JPK3zjRdKdawzVpCGZFkg5KLTFU?=
 =?us-ascii?Q?65E0totpQA6papa57Au7Gz9R9VZRMgAWJDStnZqcHklZg37huRSJwwLq7SXH?=
 =?us-ascii?Q?Ae9UIDzHqLUdpCei1BnYYa9sjsGMNkcWd0VRtcWe5xsbaQjLk8w5RnPJ9wIi?=
 =?us-ascii?Q?De8q88UCWdI25TUN1wlJLgJkfmMUAFlRTO3pd43c0FoW5vhiQypR+AgH24G5?=
 =?us-ascii?Q?JrO0R6cPMC49HGXFa6lRUz3QExo0mFYpSS8hzAU08pQrP+EiuiA2eXPbpt2n?=
 =?us-ascii?Q?De+FI0mi7xzKgsK42xwv6UFJTzXlSdMkd6QO/q2+DheMw73RiEtl3DM5reO1?=
 =?us-ascii?Q?knpblURFmP8Yu18kqsvsQJlO/Rm4DgwYGAzwSKQieHfzmujV4xJbt2pQ5IYK?=
 =?us-ascii?Q?RfbFwitYFsallBjaMGvUrfdartadONgC0FkCvJQD4CLuQuvmRpPMeFOSpe6W?=
 =?us-ascii?Q?CGoTNHrCRGRiOPLakl1U25CH7dswSgLCwmrUbBTnmbNOafJxzRpezxjCVuno?=
 =?us-ascii?Q?gT17hqnk0ak=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB7044.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(7416014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Dn0/57H+1NMYL0hF6r4QP9ASTbtZOyWZqGE6U2pAWr3W6xtpKJdGsf955TRf?=
 =?us-ascii?Q?Z/ajxn3fhcaPX+WDDt1klWy9wI7882XLWyNDmfDeKKr3mdIIirRTzafa1Gqp?=
 =?us-ascii?Q?0VyJLYdpphYz5IpfyKIrOBp+5ym9C6+Wt4cyUujsNZcXdoR+ctLfi573TZeW?=
 =?us-ascii?Q?c1uZ/JPetke75E7TShquxA9XGIp4KLYku2HjOLOYRo6V9KuNOJHXixIJgANe?=
 =?us-ascii?Q?S8lNpea2Y29kAPz8TsBvO6r6G2Mw6DtyYCnmTKxkwmXX0xBrw5RrNWWswp6P?=
 =?us-ascii?Q?6jjxg0M8/0xE5w8tW6PweuLaHvKm7e6fwmtlWxOIHSXGG7C9GZzy2ULjLV0e?=
 =?us-ascii?Q?M8YpXaW5Oh97PGo27NibJXkCXCuhlfB5NXS14Y/gik/iNT5M48WFDxVDslLm?=
 =?us-ascii?Q?CgoJNJ1Ga+LixwAuy/ETMJ4FViqRsG/B3yizbnaNHRoCHNFxj3Yck9gckEKK?=
 =?us-ascii?Q?dLn+JhhvczHxu2Yjb9rmvwCZ3gZkUbxja2OqFOkJ9MARW0oafDYvnQsMeIUR?=
 =?us-ascii?Q?zdTFkeaMCbV/ehWSZMODyKKymbytfXGwCj6yqe+dmvSaYKuLcv4mx1seCunH?=
 =?us-ascii?Q?uH+mSvGL5rAIzfILmzfrG7iMnZu+xF562Y4eb6Z8EUb61JY0A1AnGsjlhQSB?=
 =?us-ascii?Q?JpmK8s/uQRdcTucoNnxJle9+grMOQ0yVxyX+u8QNg1uQmDzGYDYr1Qi20fUq?=
 =?us-ascii?Q?MWXB8kP7lQSuQHe8y9oFBwppdDawOXIh4MHoVWGRLzms4ct3Z/lip0z9aNM+?=
 =?us-ascii?Q?9uUeGKveGa5NLx03ZjkUmLarR/TNthx6GefRtS/3TGztiCFVqvpN/D/GFEYx?=
 =?us-ascii?Q?nXePaNTtXV/w4Jo3gQyYTpbDccwqqzIb3Usd+K08doiXdftCNbefeD1GT+xO?=
 =?us-ascii?Q?G4hGGlNuqoHurGLPe62AJ9TByporyjYlUpuIt0yjSoD6RnIwPL7DEUC7pshO?=
 =?us-ascii?Q?kJbBjB+K9RXBsn4pIYXUOCv0RCYlLsWBDxvD9Ufy+S8TCC0J0mUT0mpOdi8s?=
 =?us-ascii?Q?rZqvgMeqBvzNHmyjxF8pr0uwOYRVhk6WV3lvT0r3Kv/iB1aniV47pLuz0wBl?=
 =?us-ascii?Q?e2hSy9ZQ2sMW7GZOEwxsBs7n83aDVf8zbmkonMQ35PbrbPCXahEtgFFupyQX?=
 =?us-ascii?Q?bJOeJeU26Onm32lyFG71kLEaF0w57eYCm+Ce09AQ7zp1XoLzO9L6bdc9IvAD?=
 =?us-ascii?Q?0nr0pm/TObuK70jlDxRCDWqFiBtSJ5L5hFxOjCHmT3zXDwvoxOfGiRhac4SF?=
 =?us-ascii?Q?Tozy9EIfOXXF9I87XZxu7c9Z0cpaUMkiUFX8uAgnVZLKfU5y17MlGp8CfUyW?=
 =?us-ascii?Q?rQitW5Q5QM1NRpcfbo8+baygSyd60m5JNPTN4a5qqtbZyjbQVe5SVQqcSuDz?=
 =?us-ascii?Q?49ESXqwjwzDScr5qAlL2mbZuyYbd5adNLZGNsKc3ipegt+FV4TGJMh/PzLTY?=
 =?us-ascii?Q?980ih+LSVXVVw6xVhw++CDPdHUm1q0oykVKxvPLPuM86H0NdYvd24tnBymE1?=
 =?us-ascii?Q?P5aHMytBwQey/0rELIuuoLEvOnceo6ptF8VgniJlXalt9fAc/sYj7ZfE5oEF?=
 =?us-ascii?Q?3OYB+sbgZAt1wVJ88AvXncB6+p5K3+KbWtGPwURB?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c6c566a-45be-45f2-3afe-08dd0e8fc40b
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2024 03:01:19.1702
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zjdUTbDzBTOQGBfsrfcnv/UXlyOLRxek8S1sj2/af6wSHMS2iubvASjnyuKhXwTOZaZsEHAXruYsItRWJt+rjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7771
X-Spam-Status: No, score=0.8 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Use regcache_sync() to recover the registers of controller,
PHY and PLL after suspend and resume.
In order to recover the registers need to avoid use the
*_SET, *_CLR and *_TOG registers.

Recovery of the registers should be done before loading
XCVR firmware otherwise some registers set by firmware
are overwritten. Besides only in eARC mode is it necessary
to load XCVR firmware.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 sound/soc/fsl/fsl_xcvr.c | 160 +++++++++++++++++++++++++++++----------
 1 file changed, 118 insertions(+), 42 deletions(-)

diff --git a/sound/soc/fsl/fsl_xcvr.c b/sound/soc/fsl/fsl_xcvr.c
index b77953cfaa31..4524cb7ada2e 100644
--- a/sound/soc/fsl/fsl_xcvr.c
+++ b/sound/soc/fsl/fsl_xcvr.c
@@ -503,7 +503,7 @@ static int fsl_xcvr_prepare(struct snd_pcm_substream *substream,
 	switch (xcvr->mode) {
 	case FSL_XCVR_MODE_SPDIF:
 		if (xcvr->soc_data->spdif_only && tx) {
-			ret = regmap_update_bits(xcvr->regmap, FSL_XCVR_TX_DPTH_CTRL_SET,
+			ret = regmap_update_bits(xcvr->regmap, FSL_XCVR_TX_DPTH_CTRL,
 						 FSL_XCVR_TX_DPTH_CTRL_BYPASS_FEM,
 						 FSL_XCVR_TX_DPTH_CTRL_BYPASS_FEM);
 			if (ret < 0) {
@@ -521,8 +521,8 @@ static int fsl_xcvr_prepare(struct snd_pcm_substream *substream,
 				return ret;
 			}
 
-			ret = regmap_write(xcvr->regmap, FSL_XCVR_TX_DPTH_CTRL_SET,
-					   FSL_XCVR_TX_DPTH_CTRL_FRM_FMT);
+			ret = regmap_set_bits(xcvr->regmap, FSL_XCVR_TX_DPTH_CTRL,
+					      FSL_XCVR_TX_DPTH_CTRL_FRM_FMT);
 			if (ret < 0) {
 				dev_err(dai->dev, "Failed to set TX_DPTH: %d\n", ret);
 				return ret;
@@ -539,11 +539,11 @@ static int fsl_xcvr_prepare(struct snd_pcm_substream *substream,
 			 * Clear RX FIFO, flip RX FIFO bits,
 			 * disable eARC related HW mode detects
 			 */
-			ret = regmap_write(xcvr->regmap, FSL_XCVR_RX_DPTH_CTRL_SET,
-					   FSL_XCVR_RX_DPTH_CTRL_STORE_FMT |
-					   FSL_XCVR_RX_DPTH_CTRL_CLR_RX_FIFO |
-					   FSL_XCVR_RX_DPTH_CTRL_COMP |
-					   FSL_XCVR_RX_DPTH_CTRL_LAYB_CTRL);
+			ret = regmap_set_bits(xcvr->regmap, FSL_XCVR_RX_DPTH_CTRL,
+					      FSL_XCVR_RX_DPTH_CTRL_STORE_FMT |
+					      FSL_XCVR_RX_DPTH_CTRL_CLR_RX_FIFO |
+					      FSL_XCVR_RX_DPTH_CTRL_COMP |
+					      FSL_XCVR_RX_DPTH_CTRL_LAYB_CTRL);
 			if (ret < 0) {
 				dev_err(dai->dev, "Failed to set RX_DPTH: %d\n", ret);
 				return ret;
@@ -560,18 +560,18 @@ static int fsl_xcvr_prepare(struct snd_pcm_substream *substream,
 	case FSL_XCVR_MODE_EARC:
 		if (!tx) {
 			/** Clear RX FIFO, flip RX FIFO bits */
-			ret = regmap_write(xcvr->regmap, FSL_XCVR_RX_DPTH_CTRL_SET,
-					   FSL_XCVR_RX_DPTH_CTRL_STORE_FMT |
-					   FSL_XCVR_RX_DPTH_CTRL_CLR_RX_FIFO);
+			ret = regmap_set_bits(xcvr->regmap, FSL_XCVR_RX_DPTH_CTRL,
+					      FSL_XCVR_RX_DPTH_CTRL_STORE_FMT |
+					      FSL_XCVR_RX_DPTH_CTRL_CLR_RX_FIFO);
 			if (ret < 0) {
 				dev_err(dai->dev, "Failed to set RX_DPTH: %d\n", ret);
 				return ret;
 			}
 
 			/** Enable eARC related HW mode detects */
-			ret = regmap_write(xcvr->regmap, FSL_XCVR_RX_DPTH_CTRL_CLR,
-					   FSL_XCVR_RX_DPTH_CTRL_COMP |
-					   FSL_XCVR_RX_DPTH_CTRL_LAYB_CTRL);
+			ret = regmap_clear_bits(xcvr->regmap, FSL_XCVR_RX_DPTH_CTRL,
+						FSL_XCVR_RX_DPTH_CTRL_COMP |
+						FSL_XCVR_RX_DPTH_CTRL_LAYB_CTRL);
 			if (ret < 0) {
 				dev_err(dai->dev, "Failed to clr TX_DPTH: %d\n", ret);
 				return ret;
@@ -751,9 +751,9 @@ static int fsl_xcvr_trigger(struct snd_pcm_substream *substream, int cmd,
 				}
 				fallthrough;
 			case FSL_XCVR_MODE_SPDIF:
-				ret = regmap_write(xcvr->regmap,
-					 FSL_XCVR_TX_DPTH_CTRL_SET,
-					 FSL_XCVR_TX_DPTH_CTRL_STRT_DATA_TX);
+				ret = regmap_set_bits(xcvr->regmap,
+						      FSL_XCVR_TX_DPTH_CTRL,
+						      FSL_XCVR_TX_DPTH_CTRL_STRT_DATA_TX);
 				if (ret < 0) {
 					dev_err(dai->dev, "Failed to start DATA_TX: %d\n", ret);
 					goto release_lock;
@@ -809,9 +809,9 @@ static int fsl_xcvr_trigger(struct snd_pcm_substream *substream, int cmd,
 		if (tx) {
 			switch (xcvr->mode) {
 			case FSL_XCVR_MODE_SPDIF:
-				ret = regmap_write(xcvr->regmap,
-					 FSL_XCVR_TX_DPTH_CTRL_CLR,
-					 FSL_XCVR_TX_DPTH_CTRL_STRT_DATA_TX);
+				ret = regmap_clear_bits(xcvr->regmap,
+							FSL_XCVR_TX_DPTH_CTRL,
+							FSL_XCVR_TX_DPTH_CTRL_STRT_DATA_TX);
 				if (ret < 0) {
 					dev_err(dai->dev, "Failed to stop DATA_TX: %d\n", ret);
 					goto release_lock;
@@ -1224,6 +1224,7 @@ static bool fsl_xcvr_writeable_reg(struct device *dev, unsigned int reg)
 	case FSL_XCVR_RX_DPTH_CNTR_CTRL_SET:
 	case FSL_XCVR_RX_DPTH_CNTR_CTRL_CLR:
 	case FSL_XCVR_RX_DPTH_CNTR_CTRL_TOG:
+	case FSL_XCVR_TX_DPTH_CTRL:
 	case FSL_XCVR_TX_DPTH_CTRL_SET:
 	case FSL_XCVR_TX_DPTH_CTRL_CLR:
 	case FSL_XCVR_TX_DPTH_CTRL_TOG:
@@ -1245,7 +1246,49 @@ static bool fsl_xcvr_writeable_reg(struct device *dev, unsigned int reg)
 
 static bool fsl_xcvr_volatile_reg(struct device *dev, unsigned int reg)
 {
-	return fsl_xcvr_readable_reg(dev, reg);
+	switch (reg) {
+	case FSL_XCVR_EXT_STATUS:
+	case FSL_XCVR_EXT_ISR:
+	case FSL_XCVR_EXT_ISR_SET:
+	case FSL_XCVR_EXT_ISR_CLR:
+	case FSL_XCVR_EXT_ISR_TOG:
+	case FSL_XCVR_ISR:
+	case FSL_XCVR_ISR_SET:
+	case FSL_XCVR_ISR_CLR:
+	case FSL_XCVR_ISR_TOG:
+	case FSL_XCVR_PHY_AI_CTRL:
+	case FSL_XCVR_PHY_AI_CTRL_SET:
+	case FSL_XCVR_PHY_AI_CTRL_CLR:
+	case FSL_XCVR_PHY_AI_CTRL_TOG:
+	case FSL_XCVR_PHY_AI_RDATA:
+	case FSL_XCVR_RX_CS_DATA_0:
+	case FSL_XCVR_RX_CS_DATA_1:
+	case FSL_XCVR_RX_CS_DATA_2:
+	case FSL_XCVR_RX_CS_DATA_3:
+	case FSL_XCVR_RX_CS_DATA_4:
+	case FSL_XCVR_RX_CS_DATA_5:
+	case FSL_XCVR_RX_DPTH_CNTR_CTRL:
+	case FSL_XCVR_RX_DPTH_CNTR_CTRL_SET:
+	case FSL_XCVR_RX_DPTH_CNTR_CTRL_CLR:
+	case FSL_XCVR_RX_DPTH_CNTR_CTRL_TOG:
+	case FSL_XCVR_RX_DPTH_TSCR:
+	case FSL_XCVR_RX_DPTH_BCR:
+	case FSL_XCVR_RX_DPTH_BCTR:
+	case FSL_XCVR_RX_DPTH_BCRR:
+	case FSL_XCVR_TX_DPTH_CNTR_CTRL:
+	case FSL_XCVR_TX_DPTH_CNTR_CTRL_SET:
+	case FSL_XCVR_TX_DPTH_CNTR_CTRL_CLR:
+	case FSL_XCVR_TX_DPTH_CNTR_CTRL_TOG:
+	case FSL_XCVR_TX_DPTH_TSCR:
+	case FSL_XCVR_TX_DPTH_BCR:
+	case FSL_XCVR_TX_DPTH_BCTR:
+	case FSL_XCVR_TX_DPTH_BCRR:
+	case FSL_XCVR_DEBUG_REG_0:
+	case FSL_XCVR_DEBUG_REG_1:
+		return true;
+	default:
+		return false;
+	}
 }
 
 static const struct regmap_config fsl_xcvr_regmap_cfg = {
@@ -1586,6 +1629,10 @@ static int fsl_xcvr_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, xcvr);
 	pm_runtime_enable(dev);
 	regcache_cache_only(xcvr->regmap, true);
+	if (xcvr->soc_data->use_phy) {
+		regcache_cache_only(xcvr->regmap_phy, true);
+		regcache_cache_only(xcvr->regmap_pll, true);
+	}
 
 	/*
 	 * Register platform component before registering cpu dai for there
@@ -1624,7 +1671,8 @@ static int fsl_xcvr_runtime_suspend(struct device *dev)
 	struct fsl_xcvr *xcvr = dev_get_drvdata(dev);
 	int ret;
 
-	if (!xcvr->soc_data->spdif_only) {
+	if (!xcvr->soc_data->spdif_only &&
+	    xcvr->mode == FSL_XCVR_MODE_EARC) {
 		/* Assert M0+ reset */
 		ret = regmap_update_bits(xcvr->regmap, FSL_XCVR_EXT_CTRL,
 					FSL_XCVR_EXT_CTRL_CORE_RESET,
@@ -1634,6 +1682,10 @@ static int fsl_xcvr_runtime_suspend(struct device *dev)
 	}
 
 	regcache_cache_only(xcvr->regmap, true);
+	if (xcvr->soc_data->use_phy) {
+		regcache_cache_only(xcvr->regmap_phy, true);
+		regcache_cache_only(xcvr->regmap_pll, true);
+	}
 
 	clk_disable_unprepare(xcvr->spba_clk);
 	clk_disable_unprepare(xcvr->phy_clk);
@@ -1678,6 +1730,12 @@ static int fsl_xcvr_runtime_resume(struct device *dev)
 		goto stop_phy_clk;
 	}
 
+	ret = reset_control_deassert(xcvr->reset);
+	if (ret) {
+		dev_err(dev, "failed to deassert M0+ reset.\n");
+		goto stop_spba_clk;
+	}
+
 	regcache_cache_only(xcvr->regmap, false);
 	regcache_mark_dirty(xcvr->regmap);
 	ret = regcache_sync(xcvr->regmap);
@@ -1687,31 +1745,49 @@ static int fsl_xcvr_runtime_resume(struct device *dev)
 		goto stop_spba_clk;
 	}
 
-	if (xcvr->soc_data->spdif_only)
-		return 0;
+	if (xcvr->soc_data->use_phy) {
+		ret = regmap_write(xcvr->regmap, FSL_XCVR_PHY_AI_CTRL_SET,
+				   FSL_XCVR_PHY_AI_CTRL_AI_RESETN);
+		if (ret < 0) {
+			dev_err(dev, "Error while release PHY reset: %d\n", ret);
+			goto stop_spba_clk;
+		}
 
-	ret = reset_control_deassert(xcvr->reset);
-	if (ret) {
-		dev_err(dev, "failed to deassert M0+ reset.\n");
-		goto stop_spba_clk;
-	}
+		regcache_cache_only(xcvr->regmap_phy, false);
+		regcache_mark_dirty(xcvr->regmap_phy);
+		ret = regcache_sync(xcvr->regmap_phy);
+		if (ret) {
+			dev_err(dev, "failed to sync phy regcache.\n");
+			goto stop_spba_clk;
+		}
 
-	ret = fsl_xcvr_load_firmware(xcvr);
-	if (ret) {
-		dev_err(dev, "failed to load firmware.\n");
-		goto stop_spba_clk;
+		regcache_cache_only(xcvr->regmap_pll, false);
+		regcache_mark_dirty(xcvr->regmap_pll);
+		ret = regcache_sync(xcvr->regmap_pll);
+		if (ret) {
+			dev_err(dev, "failed to sync pll regcache.\n");
+			goto stop_spba_clk;
+		}
 	}
 
-	/* Release M0+ reset */
-	ret = regmap_update_bits(xcvr->regmap, FSL_XCVR_EXT_CTRL,
-				 FSL_XCVR_EXT_CTRL_CORE_RESET, 0);
-	if (ret < 0) {
-		dev_err(dev, "M0+ core release failed: %d\n", ret);
-		goto stop_spba_clk;
-	}
+	if (xcvr->mode == FSL_XCVR_MODE_EARC) {
+		ret = fsl_xcvr_load_firmware(xcvr);
+		if (ret) {
+			dev_err(dev, "failed to load firmware.\n");
+			goto stop_spba_clk;
+		}
 
-	/* Let M0+ core complete firmware initialization */
-	msleep(50);
+		/* Release M0+ reset */
+		ret = regmap_update_bits(xcvr->regmap, FSL_XCVR_EXT_CTRL,
+					 FSL_XCVR_EXT_CTRL_CORE_RESET, 0);
+		if (ret < 0) {
+			dev_err(dev, "M0+ core release failed: %d\n", ret);
+			goto stop_spba_clk;
+		}
+
+		/* Let M0+ core complete firmware initialization */
+		msleep(50);
+	}
 
 	return 0;
 
-- 
2.34.1


