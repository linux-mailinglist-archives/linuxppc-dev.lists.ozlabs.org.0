Return-Path: <linuxppc-dev+bounces-16221-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2N0FOrQwc2mTswAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16221-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Jan 2026 09:26:28 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D54772732
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Jan 2026 09:26:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dy9xP0R8mz3cCh;
	Fri, 23 Jan 2026 19:26:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c200::5" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769156760;
	cv=pass; b=YdUNkBTIN/sAHXCTkvUMOYePXQjI0aNRhNpxaknl5bSkua0jju1igkRVdxlX8BzBK6urtdRhXrpNy1ti97oH2fLSxPvxbic4WeuAi05rBOfKmREqGua+En5wZHnS0Tkk76mSjeLqBg8vIb/l9QwEPNF35XPmmUr2J6K+/8CAufCesSbhptfHwl1RNzbM39s4BwycCzm5YI2Cz6Tk4TIOtLogDgrkK2im9Sp7NFHUhLMudirc1V5SgpuRDx3BHltdMS2GOO4PBCalBzn7UhRCAwm8a9E3576cVuxaIgPV2ZJALsHcDSb48EHSZLz0reHRuG2lm1wadqRoF2ck06OVBw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769156760; c=relaxed/relaxed;
	bh=sejhjkVY2p/rcZMQX+CYFiumQa/B/pqzUSgU503ADPc=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=m6j2wD57zxhjHrmyd3OtLx4PUSidio9M2QDljIyw2rJlAzqpl9m8lwAAup4ne7tca+OxXbcQbUKt/sYY1D5SFEsF51ALweM+rYh1CnxxrbBn/SYuHB5s6Ot4PYVYc3OmrbbbJCHuaaxrNFQdKF+/apftGXSVdZoIoOY2F+r2GSGoyBrh5Mz7X5X/2v7u7t2N5YvFgjJAJdjbn1XfosnhAoLf6gYd5vm8T/0CTrDnLp7AHXYM7utGvglvZgxFp0IrlX/jDA8GVJc1y5XH9XzqnQG6Vzk5de4lW9h3oK756tupzuYAk3jDOj33ILTybschrhNCr9JYZdvCg0zvp/ddXQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=GId+iDBs; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:c200::5; helo=duzpr83cu001.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=GId+iDBs;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:c200::5; helo=duzpr83cu001.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org)
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazlp170120005.outbound.protection.outlook.com [IPv6:2a01:111:f403:c200::5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dy9xN17rcz3cB0
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Jan 2026 19:26:00 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T/KquuEdIINZk4NIG84v1oXdS9K+WtYFwvgm+kqA9qkZXQcqpofIS2OTMs2/Wlv4c8oP6lvnroVKPuBP2B8t1aYQRz/OnYYzxNg0+z/C6tVIr/V8JY+IucYg6dq7Y1EE7zaZWYUkQslmOVWSsQuL6B4qWplR2oY0J6opI3aJ/rX8cbyMODZOxuigbuvC15/axNzCNKuw6pN7rzlTdx49rzODv4RcoOHPEf76ajYVfDc8g42vbavrbj6ajOyiUfPmPI+ZHnoYZSLhexqRFsSdGJjbOu7NaHhggUK8PwngXRB/ZmhLlLqBwLmOxta7GbRtAmQH9qtX/wGXXqDG5KOTiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sejhjkVY2p/rcZMQX+CYFiumQa/B/pqzUSgU503ADPc=;
 b=RPhP4ycXD4EdFe9IAfmCjXIauZEcLh1WysZXhc+LLxBk5DfUGH4IDYtYwv0wf/AVr6q0MK2hGHwCseV+KBLg0Poel7DHoIGZwq9ph4SE/4VYpn3nCu1Q2hqsolhncqKhUQvq72hiepcc2e1D0P6ix2bLA+0C5e3LYJCy3APnDelaqdiNjAltLybbyEWZSalsFMkbI31AKLN1vH9vQDWea2mKd+XIFlXaWNllxWI51e9iw7M4ISE+M2exCJuIVYyD7u8JGSgggZ0c1+qr/EHslPOKyNYDEKQ+2SHx2vHwQxhoLkAGu+Nzz+qmgUs9xO76V9MegiS3ug57VTbnLDBbUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sejhjkVY2p/rcZMQX+CYFiumQa/B/pqzUSgU503ADPc=;
 b=GId+iDBs4Q4t/01O1Flw/CfdyvMHvmSk4Bx5Hmjb94dxo73ol23bXwZzAh/V60AtquFDV/GFL3irwZfqeUX8qjknfdlu7OIHDrmkNk5bjd2KHOokhlWOEHCyu7Hkx3sn8mmgLgoTXTzULRz44S0a8/cO22Qwo5Nn+/1GzhUIMPm4vKi4HT1memykdEwMIplBlAc1RJqEEu90ivTorI14uJa4nRQUEi0hcHo/GjRBG5IZnouABc1htSOAyYIF75Y+1XG7kvrqIjJjtLDSMWIN5AE0r2TismxjYuPyK87T14ExoVtqTGKq9Hs7FySc7IsRtXiVO9n+ArpXl0/78L2uUg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by AS5PR04MB9730.eurprd04.prod.outlook.com (2603:10a6:20b:677::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Fri, 23 Jan
 2026 08:25:50 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b%7]) with mapi id 15.20.9542.010; Fri, 23 Jan 2026
 08:25:50 +0000
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
	linux-kernel@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 4/4] ASoC: fsl_sai: Add AUDMIX mode support on i.MX952
Date: Fri, 23 Jan 2026 16:25:01 +0800
Message-Id: <20260123082501.4050296-5-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20260123082501.4050296-1-shengjiu.wang@nxp.com>
References: <20260123082501.4050296-1-shengjiu.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0006.apcprd02.prod.outlook.com
 (2603:1096:4:194::8) To AM0PR04MB7044.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|AS5PR04MB9730:EE_
X-MS-Office365-Filtering-Correlation-Id: 80e60e31-f6bd-4254-1abb-08de5a590429
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|19092799006|52116014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?vfzLWawikXWpY2Vab2ahZMQSjtXxOXHrYzejUqmeu6GWQLprjZ3uhWPpLIHZ?=
 =?us-ascii?Q?R55jG250o2DRlNSGgkhtrAB8m/rg6/BGM4v3r5oj7UWH3vtJ7cNjkzLLIeEd?=
 =?us-ascii?Q?nwITTV1foLL9/1UaHEMsOh59k9yea77Q3Y4a7FQHVfUfBgDWAnRcA7fCgt3l?=
 =?us-ascii?Q?EcWlJgUhUYyxcxDECteD7LDPU/I01M8mdc+fVEPcVBfMMXh2my4kyevPGvAs?=
 =?us-ascii?Q?BRcNkza1y9T8YXZZtlhH5sB7LXqnQ+A88ACCPyOQXNM3ZaKE3hf/vkEQ8+3X?=
 =?us-ascii?Q?YhkTmHw45GlR2RTAE7fm+4OpVTM/JrVaiKb/EazB82ffn6rbsKMFnC8d0aM5?=
 =?us-ascii?Q?EX/o3T21jw0k+9IF6fL6AeVotjBlqhmd2C9uEmdtttT4PfMrrGyHa/aMueJ5?=
 =?us-ascii?Q?nHuWqnj5Tl6h7N2agt6K1ftBVyzVKZ6A2t72HgmIdWDEP5Iqn/MbQVwXho7D?=
 =?us-ascii?Q?cmtsbmV8c+lOpXkOdVONM1ouoJKqs/r7/YCUZLXmXUnnSb/sOd6+IaBlkEB2?=
 =?us-ascii?Q?K4qGNVzDLan7GPk3P2Wec6Mq32vqDOQ1Wv770Tp4m4QVvbmhLZoneiPcvr1t?=
 =?us-ascii?Q?ZfHtOpXvl87Rqp2rDeOu/BHRJDenuF4/ulsZMCjmx06PmjRu/8i9LnTkfV7n?=
 =?us-ascii?Q?foLmC2PULwjd2ksaeCwIjcdQ8EK2MDR/uDqMn0A6CcoQM4bEaIP9YHeG5kMT?=
 =?us-ascii?Q?4snEnfzSOvFaorK7/ycCrxMAqk3znrLpRH5G5caQ5tGySiSPcGDL3mxqTfAN?=
 =?us-ascii?Q?+bE87XxN+/WTnfnLbD4sZiHptwiCz0WWtrKToBNaDi1fMYYJNqB74yQ7XKN+?=
 =?us-ascii?Q?6ACk9FP4hXRwln+BsNNI7EMIB3Q9wD81ABgiYO0a4/bmG7j59P/dbcUteveo?=
 =?us-ascii?Q?ML9SoyDJAAFt+EX6bkF/n0niYMRsvs/ob+KnFXYt9tZDGji86G64FeCCSJKQ?=
 =?us-ascii?Q?TJCFY1Tm1ToR8JJKD/qcNyHgiwgSCJwcRTzFQGdxaN7Qf9M9Pz+4lfkRQNWW?=
 =?us-ascii?Q?QLac8qAx+byrHBiyOOGVJxgc9ZALaf0LCPRXOixFHD3tjydiSrOVL/UxSdiU?=
 =?us-ascii?Q?MM8lk5SpQGpgzsVWM5vVGJlin4bhWsHPw+DTw0AnruR7oO/Xvy1jZiqmretK?=
 =?us-ascii?Q?N4cnFeDyVU+JQubj1CFaknfJhtGNbpAkJT9BbPGxdvjF55OnzMY3LyVRJJJP?=
 =?us-ascii?Q?w+ru7AqhWLbDPkC1wZtUu6DDzG1qFPAGQfBNasWmB7ZXdFgSfls1aNqqWgDJ?=
 =?us-ascii?Q?krOyVhf+vWhip6N/BWVhWrnfU9HCXbRboMn4h77hzsQLztPu7z8lrqWR5gtt?=
 =?us-ascii?Q?fJYMs557mB5NOCPCRX1iyLnA90ALWo7PLFtuyQ5CSeYmGEhItoUKS5yMmNgs?=
 =?us-ascii?Q?AuDBq79MxniVa6/AxaJGWjh1S63iUguADyLiqjjK587tWS26nUWRaVbFfQPa?=
 =?us-ascii?Q?/9Fl/S1gAGKCKPErpDZ7mlbDo9UsNyCfw5ytQu5s3LI/I4e1yrlts/knl+za?=
 =?us-ascii?Q?oKs3Ml+tG3LDc4ZdZlFfv5yC9UAZVD8Iu+l1U70TeOVl7kUXuyag8kPMHct9?=
 =?us-ascii?Q?Z4L2k/2Aoj6I0EJL0T0c0sFyOGZD+RslUwSk94kCCGCYHGkswo8XJgnpkG9D?=
 =?us-ascii?Q?OLaHuQd/ejZyf/YdahV9qZX52eXsEl4qWzeNXWVFFbG0?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB7044.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(19092799006)(52116014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ncrqxCtAreMdtViZKuevMBtzBpzDligtW+1BbX8Rb0tjss/buG5nUqqCLD01?=
 =?us-ascii?Q?h93x21bgTlSGtJqTvlZdQIINvusVshj67hivN6WC38gCSZDk3EKXjbBimcBZ?=
 =?us-ascii?Q?3EPg6Xf2BMNlD8YqgxE36J0Nr3KVK+YxRXbAbqAV9KvmoxLMtoWn6AFS91Qn?=
 =?us-ascii?Q?szRhOxzqy//9m8c8q7nJf2rxJ1Gl4Qh+ABiNvJnb9++M4DkGeiXo8S9vwXnP?=
 =?us-ascii?Q?DBPZtJJZrg+mukFlsbWPB54NYyidn+F33Lq4ZqLmpzq6nzIdFSjdlvqR5xcS?=
 =?us-ascii?Q?AhQXDkE7GDrqKr9kQZUhOfUfRCsNnR07aZywHcDCAAuCKzvD+zGxxwIBSc43?=
 =?us-ascii?Q?CwaLGaeUIxENP0fSteBek5Eft1jTM3gwvjRuSr6W1yS7QU8B9cLX51HGpn/0?=
 =?us-ascii?Q?yQfdGlqn4+wd1Fz0uNBEQgBrHgXpS6XgepZn8c8vtO/5xdvfV0mdhiwilm4c?=
 =?us-ascii?Q?PRAqjjXHSoSWcnqE0SrkXUjabMHRVMVYPrL7p+4XUcUJQN8qCDK/etuPPcBG?=
 =?us-ascii?Q?GAzqj4H8IPN7DBIKncn2f26m+b0a3KSKwQc654IGR3Py0k9lGyCvcgHqG280?=
 =?us-ascii?Q?57LqRDKQKCDJ7TGQCtJG3xqNgOiiay1D6eHbD5lihgLFFl9nddE/RiHLSthB?=
 =?us-ascii?Q?do+jlaZlr30weOv+72PTMBc+txoDDW3uXgFrJKDCXzX/WXu/rdHEBzuDS9n9?=
 =?us-ascii?Q?QdunAagOprs+g+w/AuBSPxa/97Qwou6fkU5RHaPuN4Tj9ypZckWaPjd7fb1s?=
 =?us-ascii?Q?8LLvjy8hl9FCejVxQMktjK2qR9Ugz3T5UeWhFpLIuX3H6yuUK7Li/45VlfDH?=
 =?us-ascii?Q?Gg/OEYFXD2EU/5bW6Br37WqXTbrFYFTAWlcqsJTf6xrCHjs4IPfNAMGy85t0?=
 =?us-ascii?Q?MfAsKIyIyk/kfca3+TQlD9u0VUOlCZOY/9hn7aWaVLpPPzY9m69IyltC5yxa?=
 =?us-ascii?Q?o/lCBslru2EpiC5/TIQSNrXzwDi15Nb/SBztQQDB3zHSHba86ECrt/oWJE2O?=
 =?us-ascii?Q?xIfTh0a7NF8ujP+4B4HRObyVxjsEfgM91Bave/GXPVtlsqNwN7V9O/oF2pUu?=
 =?us-ascii?Q?Kydw4Tb/aK15HJygVlsJLH6Q+UTysjavtOCHO6saVcqzHJap4u3OOEIB2ov8?=
 =?us-ascii?Q?CCh7brkUdLQQ6WQGxFWlu1Pjn7uFAKuXmHIFlyHWryHCCHXZAu25jl6a9rvR?=
 =?us-ascii?Q?l2P3YEH4jzasAbwzknwelc9xYBOg2ooqwOcD/JTUizQUJ4FYajEXAWGaTFcn?=
 =?us-ascii?Q?Bjz0fjIPdxIbZzPYIcYZ9Uxf9xjS1IbB55p7UfNZF3psln+oSWbhiDjlo2w+?=
 =?us-ascii?Q?MN2Z3+U3wnITLcsIn6g10cZDij/5ez3O7tQ0Lg5L4Kgz23XPq4EZ4hqqGgxe?=
 =?us-ascii?Q?S4kQIuuC71dLzoAyuoxGWweoScOciCCuTPhzsmeaMQvhu/JMz0FmvKWUdA6O?=
 =?us-ascii?Q?9SmQ5OTMIKE9Th4wyEtl2ldiDcyyKVOCU2buLk0/btlE/BfnceZK+kkhu5jL?=
 =?us-ascii?Q?xlMl6OZtFIaKEN0lgKJurclNT+5iRhX4R1HqYqMvRHtxY3+2Yp9Ta35IfX7A?=
 =?us-ascii?Q?UlMHzWKI4wjXtUQOLkpGO/zdPizG1JoLopVmTW+6nq34T5jnCgIJ971ons3O?=
 =?us-ascii?Q?X9RQuOQqBLTATRqFi5IWnM5hj3hhk582r5sVtgT1Z+nYJ7RMSedai6m6H0L+?=
 =?us-ascii?Q?bYQ5DbNo7xb4uLQmpCXuLfe4DXE8uKx6t6cynzu7iJn2M2T6Afal1zyi/WxL?=
 =?us-ascii?Q?l1boEmXWmw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80e60e31-f6bd-4254-1abb-08de5a590429
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 08:25:50.4699
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pyYhbexbhDf3M9vEOp2U3wxQElZrAwBuBLubvhaAcZlKcJK1b/Wss2eyp1YMBs+voOS/v4+6M0fejZn2MvoGKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB9730
X-Spam-Status: No, score=0.8 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.79 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-16221-lists,linuxppc-dev=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,perex.cz,suse.com,vger.kernel.org,lists.ozlabs.org,pengutronix.de,lists.linux.dev,lists.infradead.org];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER(0.00)[shengjiu.wang@nxp.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS(0.00)[m:shengjiu.wang@gmail.com,m:Xiubo.Lee@gmail.com,m:festevam@gmail.com,m:nicoleotsuka@gmail.com,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:linux-sound@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:devicetree@vger.kernel.org,m:shawnguo@kernel.org,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:shengjiuwang@gmail.com,m:XiuboLee@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shengjiu.wang@nxp.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[nxp.com:+];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.824];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	TAGGED_RCPT(0.00)[linuxppc-dev,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns,nxp.com:email,nxp.com:dkim,nxp.com:mid]
X-Rspamd-Queue-Id: 2D54772732
X-Rspamd-Action: no action

One of SAI interfaces is connected to AUDMIX in the i.MX952 chip, but
AUDMIX can be bypassed or not bypassed on the i.MX952 platform.

There are three use cases:
1) SAI -> Codec (No AUDMIX between SAI and Codec)
2) SAI -> Codec (Has AUDMIX, but AUDMIX is bypassed)
3) SAI -> AUDMIX -> Codec (Has AUDMIX and used)

So add 'fsl,sai-amix-mode' property for this feature

fsl,sai-amix-mode = "none": is for case 1)
fsl,sai-amix-mode = "bypass": is for case 2)
fsl,sai-amix-mode = "audmix": is for case 3)

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 include/linux/firmware/imx/sm.h |  2 ++
 sound/soc/fsl/fsl_sai.c         | 21 +++++++++++++++++++++
 sound/soc/fsl/fsl_sai.h         |  4 ++++
 3 files changed, 27 insertions(+)

diff --git a/include/linux/firmware/imx/sm.h b/include/linux/firmware/imx/sm.h
index a33b45027356..ba5d93bd6158 100644
--- a/include/linux/firmware/imx/sm.h
+++ b/include/linux/firmware/imx/sm.h
@@ -26,6 +26,8 @@
 #define SCMI_IMX94_CTRL_SAI3_MCLK	5U	/*!< WAKE SAI3 MCLK */
 #define SCMI_IMX94_CTRL_SAI4_MCLK	6U	/*!< WAKE SAI4 MCLK */
 
+#define SCMI_IMX952_CTRL_BYPASS_AUDMIX	8U      /* WAKE AUDMIX */
+
 #if IS_ENABLED(CONFIG_IMX_SCMI_MISC_DRV)
 int scmi_imx_misc_ctrl_get(u32 id, u32 *num, u32 *val);
 int scmi_imx_misc_ctrl_set(u32 id, u32 val);
diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
index 2fa14fbdfe1a..148e09e58dfa 100644
--- a/sound/soc/fsl/fsl_sai.c
+++ b/sound/soc/fsl/fsl_sai.c
@@ -7,6 +7,7 @@
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/dmaengine.h>
+#include <linux/firmware/imx/sm.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/pinctrl/consumer.h>
@@ -1425,10 +1426,12 @@ static int fsl_sai_probe(struct platform_device *pdev)
 	struct fsl_sai *sai;
 	struct regmap *gpr;
 	void __iomem *base;
+	const char *str = NULL;
 	char tmp[8];
 	int irq, ret, i;
 	int index;
 	u32 dmas[4];
+	u32 val;
 
 	sai = devm_kzalloc(dev, sizeof(*sai), GFP_KERNEL);
 	if (!sai)
@@ -1598,6 +1601,24 @@ static int fsl_sai_probe(struct platform_device *pdev)
 	if (ret < 0 && ret != -ENOSYS)
 		goto err_pm_get_sync;
 
+	if (of_device_is_compatible(np, "fsl,imx952-sai") &&
+	    !of_property_read_string(np, "fsl,sai-amix-mode", &str)) {
+		if (!strcmp(str, "bypass"))
+			val = FSL_SAI_AMIX_BYPASS;
+		else if (!strcmp(str, "audmix"))
+			val = FSL_SAI_AMIX_AUDMIX;
+		else
+			val = FSL_SAI_AMIX_NONE;
+
+		if (val < FSL_SAI_AMIX_NONE) {
+			ret = scmi_imx_misc_ctrl_set(SCMI_IMX952_CTRL_BYPASS_AUDMIX, val);
+			if (ret) {
+				dev_err_probe(dev, ret, "Error setting audmix mode\n");
+				goto err_pm_get_sync;
+			}
+		}
+	}
+
 	/*
 	 * Register platform component before registering cpu dai for there
 	 * is not defer probe for platform component in snd_soc_add_pcm_runtime().
diff --git a/sound/soc/fsl/fsl_sai.h b/sound/soc/fsl/fsl_sai.h
index 6c917f79c6b0..7605cbaca3d8 100644
--- a/sound/soc/fsl/fsl_sai.h
+++ b/sound/soc/fsl/fsl_sai.h
@@ -230,6 +230,10 @@
 #define FSL_SAI_DL_I2S		BIT(0)
 #define FSL_SAI_DL_PDM		BIT(1)
 
+#define FSL_SAI_AMIX_BYPASS	0
+#define FSL_SAI_AMIX_AUDMIX	1
+#define FSL_SAI_AMIX_NONE	2
+
 struct fsl_sai_soc_data {
 	bool use_imx_pcm;
 	bool use_edma;
-- 
2.34.1


