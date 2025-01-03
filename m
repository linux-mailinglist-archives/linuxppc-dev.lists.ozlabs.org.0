Return-Path: <linuxppc-dev+bounces-4612-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 552E4A00448
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Jan 2025 07:25:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YPYSc0YM7z30TZ;
	Fri,  3 Jan 2025 17:24:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:260e::613" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1735885456;
	cv=pass; b=fr9GYRiOYYdyZ3fMKUZOHCKbusjDqfBnYXtegiu46lOhao+EC6RoCbzarVNklsYdjsY8qmN+VEuwTjPVp3DyBFSH8eL88W0TAw6eSt7rGc4u2ydCFLKstI1bWhHu30PfY3AW4w8ooBMVY4iv4JCpSBQ3/rOKKBsdzOBvdaH1AAbiBiZR8jPcReBZAlSpHrePJCWiT8jMSyrHIyY92otp+oBsrJXqsuibhw3znR1MNGVsFbs0HMzOA9SWHL5fI90JdSZpVY83SOGsiS5E+FRDZSdzgwBBb2jRmMOFcLzRmPZXvp8S1Btm6Nu9I24o4DevYvCXwOx87sZAqqT97FIGBw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1735885456; c=relaxed/relaxed;
	bh=awuFpiNnGnu8PB/g+d5F5dMPKyhjVA8lFpOWRmvZ6yU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=GiQW1NATV78LSOtjnKc28kB2JdyUjGRiiOlEKvra64Ntxg1yH4moXkByzkNIeJtjYQ2sMCJQ20o81N9dHv1LmcMGbImzed1nnmIroTmJl90Wom/Mqbgiy14t+JtpzVBx+kEHmAolnWctZbLeVb68xFCHikcLcaKlog3WTSvfu6idcWc6THro6JeW7Cad7K7XCVha04qbF7IWJV/3Vdjmxq0/fD14ZDzWwAmg+OPCvKdmSZzwKzc9ye/EDKlLfbiV3FZDGR+Kh9ilTT1Ba7dLlI7pIUUMOMBr3HD7jbJcjoxPArIM1aq7U25BspeYVyepYukkZvPB6ARqGe19dX5KiQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=bmIqEecy; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:260e::613; helo=eur03-am7-obe.outbound.protection.outlook.com; envelope-from=wei.fang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=bmIqEecy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:260e::613; helo=eur03-am7-obe.outbound.protection.outlook.com; envelope-from=wei.fang@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on20613.outbound.protection.outlook.com [IPv6:2a01:111:f403:260e::613])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YPYSb36g9z30VM
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Jan 2025 17:24:15 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yX7JlO6rDZ8BgPtDS9n+yLOnIYa09EDU8DQT08t72P4oyahITtMpMnbZKfEQGlaBlEgMkK3led1sK2nvpSu4T42E5nIgDfgwt61KF6IFVaUbIHC3y3Ah3luS8A3XD1q+PfxKhHMwD6ubQXvnGPIMa9qFMnJbtdeVNUakjYJ19PAjG2oVeRS6Nqwe74Gf6Ouhjz4qxuMAr6PBUiNavjJW2Ek+62V1b9GM1SnmKq9gjkzDmIBSuYxc85RMAInEfz/svV3woeahPv9XSARSLHtzkKCjWq69MdEjSX+iy2eqBjBnhi+dhTUIBXqRR1dEukaOdqksT0bsvDGTP+NcMMuEmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=awuFpiNnGnu8PB/g+d5F5dMPKyhjVA8lFpOWRmvZ6yU=;
 b=xwzwF2MD7Cd6tJp0O6fotOV3mU1f3hcAFpJM0aWnA/vVLjCHlCKUxVnN19BGguB6n9khLBx7GlIw0qqNndubHNuPSunyQoa1tRGsSc0zawLZ+pu/EXgWFuk3pTo3DRJ9OReTwmA6mhjf6GGmxrkJyhNje81Rm/9WAVfOunK2rL0fWblWVCF6DDB+13E/apPCP9ZJZ+Ug4eKw44Ha8UczYw+oNh3dJRlCRvg3+YXTU3NFfDy7LZ/gipQKxaPQHHY9ijP8dT3bz0A0Sok9AUItiFsdV2Rv6xaSOUYP7WjZvIntev936XvQKhqmza4XNX4UGaljAgukTydM9fLaymzsnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=awuFpiNnGnu8PB/g+d5F5dMPKyhjVA8lFpOWRmvZ6yU=;
 b=bmIqEecyf2i5PFWidAGWMT5e5gFi3tJeDCMhKvXXT21B5MmQyGOE4ijz8QUPny1+IS+dEoWKOzHVPYTE+e91T0XZ2dyFsI7kVNFnyXkWfVq63Q+B5EwTfPC+jJTpZCpX+s2KuB6Kniti9VHbnVyLHZNVFD89pR6AYhDXcZ1FjFvSwIvv+Y0SWd0xTJCcSRrJj+bNkXnxxcERAYv09giOlbnYzi4Tg0oP/OpLa5/fQ05Jug3KRnutW5zmHHi+M47tFf26eFFz/jtrVHINuQkssr6teZz+MspnMHeMr8ivFniKiMoBuSAZPsXw0auVQxVtb/yQNFLIF4CT+JHBOmHs5A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com (2603:10a6:102:211::7)
 by DB9PR04MB9331.eurprd04.prod.outlook.com (2603:10a6:10:36d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.12; Fri, 3 Jan
 2025 06:23:56 +0000
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db]) by PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db%6]) with mapi id 15.20.8314.013; Fri, 3 Jan 2025
 06:23:56 +0000
From: Wei Fang <wei.fang@nxp.com>
To: claudiu.manoil@nxp.com,
	vladimir.oltean@nxp.com,
	xiaoning.wang@nxp.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	christophe.leroy@csgroup.eu
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev
Subject: [PATCH net-next 13/13] MAINTAINERS: add new file ntmp.h to ENETC driver
Date: Fri,  3 Jan 2025 14:06:09 +0800
Message-Id: <20250103060610.2233908-14-wei.fang@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250103060610.2233908-1-wei.fang@nxp.com>
References: <20250103060610.2233908-1-wei.fang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR03CA0127.apcprd03.prod.outlook.com
 (2603:1096:4:91::31) To PAXPR04MB8510.eurprd04.prod.outlook.com
 (2603:10a6:102:211::7)
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
X-MS-TrafficTypeDiagnostic: PAXPR04MB8510:EE_|DB9PR04MB9331:EE_
X-MS-Office365-Filtering-Correlation-Id: a7eceb04-a176-4565-faf1-08dd2bbf33b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|7416014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?MHGPrw6IGJyF2MGNTAyQi7c+1Jt24cp8K6+JjF6S0MNR2KKBeP6W6oAphCzq?=
 =?us-ascii?Q?62Ob+Gc6g8kC9nzqW2BZnK96g4kEhSiTUpIk4sDaxgr725deavsY/L7M3yHA?=
 =?us-ascii?Q?tS6J6gFYtVIDM9e7HmLtS8foLnz9bdXaKtVy5Fv5epgGIZGCVW3tG20NmbkC?=
 =?us-ascii?Q?C+LAryl4E9WH5DQ7vnSJzh8t8kcUGBHM+KBnzazem0IdaXnFAXlF5iN8O9IK?=
 =?us-ascii?Q?jJgUImlvIy8BvxA+DPO5moNwK293Lgh/ZmzTXOFkAQ5f7HB4OFcAN4R+SwLm?=
 =?us-ascii?Q?yxaY07XnPJQZP6telJOhgSzJFmls3z+b3rIFEuZuxTpWqchsBHbOuWMEqlZh?=
 =?us-ascii?Q?GeUD3WHl0lKqLU18D+Uq7kJh61ypi8nHGsO1aqZE6GB2/0/wntTJNP5rcRKw?=
 =?us-ascii?Q?R/3N/VonmSOneFnoppJ+cWYO0I3YZ8tB22VKNRRs1NiwWinc4uFxYL6cf1/a?=
 =?us-ascii?Q?IRhO6FmWx4ofIfPQuPidtQm0TKdPZ1+D7rTIn7yqtjw8JhtH9PGO3pS/q/od?=
 =?us-ascii?Q?xdlX2FuBx6FOYOBY7V71mCA8mJOGgXuqvVqyCF8GXmm9uDrvTEaFKMuGMc1s?=
 =?us-ascii?Q?25Sp0IkgtMrYNAE41cj++IwhHCzL5+Kn3ckHMRqJrIc/pWwKDkGc59KSgE76?=
 =?us-ascii?Q?W6h7jvf/HxFnr6tWTSY4rLR9BJEm3dwC6lRZFG8hMPa5WL7UsasasNpvQva2?=
 =?us-ascii?Q?yooIjRe/dlV+fRS8D0Pt9G1DGFzqcwUbkduSQ6laTplN5aIR110scLqNyp9k?=
 =?us-ascii?Q?UnTlFrwF67mgcg/Kh83LTJph094FHOXHrUkhaQ3IR5moNrj28c316/0UPima?=
 =?us-ascii?Q?b/ojNxeyDEkesfdb1IBDkZKUtfSDsCbw9MD35Ba5l4OOYMEa6ycbnDGGPL84?=
 =?us-ascii?Q?ZfIbQHI/BeRwLBKOw2wi0QMmtbJ3My6nM0XA6sbQnCbjkP/lNYrnVUwDUvGY?=
 =?us-ascii?Q?g5BSspt735mQMwDblMXtBjkntVvOw0a7iqX5ExVj686k4hgtRCAE0uHqclpj?=
 =?us-ascii?Q?QpikulLXtqafmBWcPTq9n/Kka4PqIYmRNI1PmFQg8KVzg8O5I2kfoMqv6AOp?=
 =?us-ascii?Q?aOOwUG5m/BeS0sQ2+hywcpnDDBZoneDEmm3jzyjBxwtlIzwi0bhwZ/+B61F2?=
 =?us-ascii?Q?SbOHJfYxJxuFo/6DsGaLgc3nJFXvxahmOWTIrBOCvk36jYaVvaJosyyw2v1l?=
 =?us-ascii?Q?f73wObp3Es2ETWl+pCGuV3hcxbBVj/4vxiCzC0jdmCTgPJL/QXaQ/N5xh06F?=
 =?us-ascii?Q?nF9xomWqePkPp2T9der2JztopeHBZ/l3LSGkUNRAxNafg+oieD/cfOvvcEbN?=
 =?us-ascii?Q?O13PZX+ccmWApvw670v9lvjQ/UAtKLpIGPJL3/JPUxhwqRuRfjTGq++SNGbB?=
 =?us-ascii?Q?t+SHG7tqFcAPiU7ppVdF8fX0VFDriuWXkPD+LzdDaVjMcaOEBRLpFrOI9Zq9?=
 =?us-ascii?Q?Db8pvEB7FJJVAruQno+k/l3g76s4/irT?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8510.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(7416014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1BA1dQyZjLNcOAMV4dByXH2H6E00ULUr/UtPfe9XqyfthS1vL0nHjvEoOxPp?=
 =?us-ascii?Q?cbHXVFMZ1ReUr+gzo/RIcw/OYcLXO30p+vKypGowiWfDPaeQvatmfLPKIWYk?=
 =?us-ascii?Q?xSL2nnX+I/kEdq/sRVHEk+pLzJku81GcODtLd5MEvk7PdncPlGmuAhGLb4KD?=
 =?us-ascii?Q?N5VOmTCied91dMv08DyKoPfCqeBGUZEZPdQi9MZnbkSztMX23L9Dj6rUHk9Z?=
 =?us-ascii?Q?q3674qr9eJyCD1ot5vbfd9cODqM7MYZd80BQPCbojSSbY9LAxu8Yq6USw1VQ?=
 =?us-ascii?Q?MX8r27BMrTqy9GWArZrv1YdEYBLk/Ou/rUiWaBtCUPHP82709A8cF/5/HJX4?=
 =?us-ascii?Q?e2mJ3vjPrxz1srbEC36TKaEvZNbuRy4CrR+TLEcpqTn+G6QV5+l0x+AjcKkl?=
 =?us-ascii?Q?miM1c7ABcdGF5e5dhmjUmeyU/JRPYBcuin/Lv4pYpSyf4a2UCR6T8XDn821T?=
 =?us-ascii?Q?grZTHyVsbPFm28hBit1rnCck/LjiSkYpT+38Esty3+J5sSnTJ+nc/fliZw8b?=
 =?us-ascii?Q?PfnUqPl/nyTIHH8ItaxaObgFtbya5/OO3V09RxY6uxp3B/eBY1wO84JWU8gR?=
 =?us-ascii?Q?SYIs/S5484R/ATVnZyph4qb66G6/SuqWZ/3Zxhcuy/9/DcE1yUqNip8tVFjM?=
 =?us-ascii?Q?GJgvStgnO69XfLaWIwJlOEhlg1TgWGigFTjuEreJXRW9f4Tl6FAZlUEpWLBc?=
 =?us-ascii?Q?0eDvgphrpHtkmskPi4ooJBaJqPIFlYm5+UHEe1qzP39PspXnuJI9tlDBjYjR?=
 =?us-ascii?Q?UKx9IpSfjd5Zp7IDJ0Xin0exgrH2s5ZtZpH2iHrB4Jq4Ubx+vhN3rbjPl+WQ?=
 =?us-ascii?Q?SGL99AikC9hXGE8pd8xTIv6sceI25giaGwUqKPG0UZ1KiSsfkIB9458UyBiK?=
 =?us-ascii?Q?Sr+IbDyylgsRyGA3eBvsfZVjku0UE37iCj242Srj5j1V1kzjllfOLyF1PF76?=
 =?us-ascii?Q?yB0jxbBfK7BK2rbxydBYOMhOx234xpgv5G1Bj9YnIUzzfEEJsqBPkj+jlE5e?=
 =?us-ascii?Q?/bdrqhwRv7O7m2IIIilxxvZxcYsZ5ip0/WNERAlL6iXtqKYYwm6h1Q9BM8gE?=
 =?us-ascii?Q?hPzcc+5OSbTUF6Oldui43aqyUVyLdUFYPVOF4ttH5pQ0aXGQvyZk2uJrTjK8?=
 =?us-ascii?Q?NhbuxYPVNxLwlGTC/rVLXVVpn0zyhPVlow+RYGK5gMPMJpziADkMVAu4gqxG?=
 =?us-ascii?Q?jq/7gzopwdP0EQ7mSXY5qAp9H+MH7GAcBRmYGa/b9ulFVlrpTZsr6k6uL9Ig?=
 =?us-ascii?Q?bX9kbdiVaVNC0ukA7+zLA/sFxUBVBMZxk7ZbfxFzZJRpbLKBLiSI7xs6pWOh?=
 =?us-ascii?Q?/vusm45Mz0cGPF+3n1JjyDg4QvN375hATg59Z3wxHbN+nIgnshKgsu6X/O8e?=
 =?us-ascii?Q?/kBtlRdCIx7o6z1fPhQzLio8ntqSxR3lk/PSUMkg6eqGVe9apcWagk2CZwFe?=
 =?us-ascii?Q?npzBCMW+QNtmr6SJ9YcVEai0vqyQfGP1+XqvOlDVn4vG27vH36UJpR34Wt34?=
 =?us-ascii?Q?iJOFUAJAfkzazn6hEsaMH/PXfSoKRcTv2by0ypQvcp27LI8g6XOk8+F/tZze?=
 =?us-ascii?Q?6OeOZSC7y2BNFcceVZOeHJwt1txaH4s5hXIqwNNq?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7eceb04-a176-4565-faf1-08dd2bbf33b8
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8510.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jan 2025 06:23:56.5958
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B5VnC3AFJptb+l/OTt+5PnO3Bu86IJvsflKUY/4VvY4yyISpbwGv9+RTer5Rj9ixW60IWRkIrnL05tVw4hi0FA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9331
X-Spam-Status: No, score=0.8 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Add new file ntmp.h. to ENETC driver.

Signed-off-by: Wei Fang <wei.fang@nxp.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 1579124ef426..ac28154f7eb5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9099,6 +9099,7 @@ F:	Documentation/devicetree/bindings/net/nxp,netc-blk-ctrl.yaml
 F:	drivers/net/ethernet/freescale/enetc/
 F:	include/linux/fsl/enetc_mdio.h
 F:	include/linux/fsl/netc_global.h
+F:	include/linux/fsl/ntmp.h
 
 FREESCALE eTSEC ETHERNET DRIVER (GIANFAR)
 M:	Claudiu Manoil <claudiu.manoil@nxp.com>
-- 
2.34.1


