Return-Path: <linuxppc-dev+bounces-5217-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D79FFA10407
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jan 2025 11:28:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YXQMM0lk1z3013;
	Tue, 14 Jan 2025 21:28:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2608::61b" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736850511;
	cv=pass; b=KGZelZiVqVzEZYhqom+6p4G0CLzviCJz3HdgEGdx8apyKbtIJsTqBK7fL/r+JnSVjW1T6ABwixUkORmoKni/InfYiAbT9Sz3mMoMovZ3cHGOF8Z1Jfj9bLQDzrKdroguaFXFzWhk9JE4vk1YxpAfpTUjHT4bMrhc336CTN4UC+RufZRtmsj9/WfyaXH7gHwpH0Zn2LAVayWt9jON9HYm+COmDICzNpTl5FGnoAGD0TZJHICAGh8pXhM3vsggK27qFspEvpPlGxMCMZPvTbX7i/EFdwf8mdq8vdAQpVWGP3/MI/KIrfjRMBLAl0A3Ps8XoYao0bvPAQ5alyAypBadpQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736850511; c=relaxed/relaxed;
	bh=m7cL5AL8f7oK8vyasAK+iO0ScwK6p5FncwNN4uEMCGs=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=iCZ5wa1A8PbxjWwUBC6xxcO7lG3Vz3qRl5D05RH+rrZzUER1eiMQfKoJeyg/ZYnS/WWtZD2UBYgg6OhykqkN/8A6bC966kXtuiCOYhOj2OyN1zuetMgcY9paP/kmDTBz94psSlh/BoC945E4fhZBIiyxQh3Q1gT7zfqBrTc1bJwm+XE3IXLW4LXZ7YUxOZIQlHpTQmCowsCoAKYpDgudQt1tv1UentHDAqm5ccGomvPN8oNLlJLfxJFEEsjM3qYrQbRisq9N0v7xrfxTn0m9AwP8iuhv1w+dIrQ9Yiv2BxsRU0qXmnm1IVhkeDLiORq2Myhk8PYcZ6Y8xj1Z+yjM2A==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=cg1sQLLY; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:2608::61b; helo=eur02-db5-obe.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=cg1sQLLY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:2608::61b; helo=eur02-db5-obe.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on2061b.outbound.protection.outlook.com [IPv6:2a01:111:f403:2608::61b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YXQMJ6mTqz2yys
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jan 2025 21:28:28 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PByh9HBSI18f2hThFuBO+iDmplatyqj5qzb5PPbJt6mQYctpl7ceYlcynNVZ+ncMWZBipgGzqPCCtM+DBI+IQw4QrezdqdW3WXojwexacNgFNFw/GWC+m6R0gZV0xMW6apiqbO+ngvHmawQP1SoechB5Lv4dDCt8GJtcRlenesUFhGMg8j8i/qAhjiCh/Hk1frar9pKXv+yxbmXsmXV75Vgrd9+xEyR7h+bFH16A7RnJBIoZ2j+OAdB1T+Zcxnp823rxRl8rF/4Qf3hgGSTv+K5iMAI93Fsk5xqKArKwwe9BbKIaa3ub+0t3dUlvn8llVjCJbUkX+7NNoRwT4WI7vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m7cL5AL8f7oK8vyasAK+iO0ScwK6p5FncwNN4uEMCGs=;
 b=yZEzU64SGv9FhQWeDwUytbtnZhpjPdw3Okxxm896I4+1GONWhDHE4jsVTCm80VwsBzE1xv4gADw3D+tyJGdyR1p91nHVRxFmMPiqHIqnbTUCfPMvF/fmtW2DYNs+Fh6ZCeHVq07SXP7Jx4iB/iXtxcE+gqSSXqhGV1jX9LrqL6OVAnLUOt1rZJlolcy1Ab8Zo5NNXbqfbuCAvXRzFo2Uo3+JNMnAEodChKMZvisYtjZzBsLaW7ZLL4cjC0dKRhVqR0rS1fLGicPpMlN/MqUcxZ48LaO3yzLqhnidi2SUxvkaJ1oBDPm+ZR3MpC59MZhO+s2V2Y6/FnkI6hNU0jtWOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m7cL5AL8f7oK8vyasAK+iO0ScwK6p5FncwNN4uEMCGs=;
 b=cg1sQLLY2Lr2E93qtVxAQW1G+JF19hP3ac3AEFpgJfk/r3QNww6NJKaWZLl7b4971bGxfx2/2IoYBE6n6JTzCbTzoD749n8OkKrhl4sc14M+Bl5UF4gsxL07+n+VZv/cnIl/9H60347sXNrGkzSDAoYiecoM3rWvXHe2pqoV1OvCqisQlITOMaJcAlmq3mnqoTSUupkEvupUEJh4TE/Owf6TysHGYY5COfFhoEYq1/9ijujBWmqYty9TDlUg0x3/bFvrKdUSpDzPrR7B61siaOLI4ozzlEkeLD16hndvxV4Ben+df6OZ3U5Qbf7FYmwz11p7E2GCOQ8b+owt4dRbVQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by AM9PR04MB8082.eurprd04.prod.outlook.com (2603:10a6:20b:3e8::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Tue, 14 Jan
 2025 10:28:08 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891%3]) with mapi id 15.20.8335.017; Tue, 14 Jan 2025
 10:28:07 +0000
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
	devicetree@vger.kernel.org
Subject: [PATCH 0/2] ASoC: fsl: Support micfil on i.MX943
Date: Tue, 14 Jan 2025 18:27:18 +0800
Message-Id: <20250114102720.3664667-1-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0023.APCP153.PROD.OUTLOOK.COM (2603:1096:4:190::6)
 To AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
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
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|AM9PR04MB8082:EE_
X-MS-Office365-Filtering-Correlation-Id: d01e82c6-3f55-48cf-3bc0-08dd3486230d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|1800799024|376014|52116014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?OR48MKQiyAh/aK9isFIl1fotCgrR/Z0xsX/IhcjEb3TrU3FuTkfidd2PZr5i?=
 =?us-ascii?Q?94/ka6NFJhA5J4z7z3OTVNReRyOyM+TY0TI8vpFuvt1hcgUYF2DAVVSvYSVc?=
 =?us-ascii?Q?rmBQmGdeZ2roWhYbzG3HbKC8TkRpHOVNuQqVvlkuzRh8/pbjRD8mb/On1rig?=
 =?us-ascii?Q?3ShqoVtEPlo/76VmmQj2b9JMbt3B5+ljOwXk0lF+/WlEjM0VG6NaaRM8TV9g?=
 =?us-ascii?Q?+ER9n/gYuLvV366/8CZJYNZVc/bPZ8HDdBxjT+2z87IldzfFTAOiGEOR2aX6?=
 =?us-ascii?Q?6ieYDGTZC435wkRE7hjqG9SURev+Wpfk7/awhexQGUaSbi4dq2ea8Mj+ss1m?=
 =?us-ascii?Q?1Jm14+INS7e+dO9aewK1ObC4sArlK7HTkXek90ZR57qErsskOCTakqFe4Msw?=
 =?us-ascii?Q?s+P2h4AE3SnDncmgv94nX1GT8BPAWHrmKCUtNjgN24vKVAtzMbKV+0DKvfhs?=
 =?us-ascii?Q?SG1La5hEhKnwSNrmXa7ubn1re8yfbKUa2hLr/Ooczoh03rIGxXTHdbZVOzhN?=
 =?us-ascii?Q?2rsN2NgsWUpykZZ0llvlGP/W0zZ9R/0l5LnZl5PW0gX73krbP3dT5ZXW2iJE?=
 =?us-ascii?Q?nnW+/YNJJ1Hc3Rze0aleZ8bGk5qmF22VV5mLI8CPRXvsTA7xuSXPupUrtNmH?=
 =?us-ascii?Q?YRgqjJlJZMyXd4paXYP3+7oP7LyHdyY6R3frSd9GvG+Agr1cg6CZ3PQZyQJH?=
 =?us-ascii?Q?EokC3AZAdiS+elxqS4Cdt5j2arQ057LVUDfTBUhTfASJ4GbHWgWd1apPF4k+?=
 =?us-ascii?Q?GxgQTBEQmMQL94zBvzWxzeae4QDUWhknbw3ZXPj1VC/ln8rENNI3DnA+UTql?=
 =?us-ascii?Q?RappqLSjmpd4MCMGziFW5aXK7ueNY1HlSQHW5vH1+mPKhGMvMybweXDjAbEx?=
 =?us-ascii?Q?jDOGgIZQdwj2TClDD5Ie5Uxd+WN0lf3y6sJw+bSwbZDruGrGwiZVpUPfWUuT?=
 =?us-ascii?Q?//UDzyLDJsf0FjecFkx9JGqEiRc8mO8AqQMCX4bvO9/rPNMAOr2wXSKQDBve?=
 =?us-ascii?Q?8a1/2CdVnF62T692kvnFw16pZaml8cONZBRE0gY9nhI9aLjl6SdB9pCv3NvO?=
 =?us-ascii?Q?7Ffi7accJ0oTMA4NQjWoCWh+DsJPj7zHFc/oYbn4RHAWogAFx44xXysFkPij?=
 =?us-ascii?Q?K8mq6ndP1nQzCOxPErd6i8YO5NFhY61iBs1lt3O0N2HgHqyAiNDeQPAJD4KY?=
 =?us-ascii?Q?xh0n2dHwIOE3mQBoUMimSmhOu0VlEXJJ/qGefl++rAIOV/K7uwJywbPOj7ZW?=
 =?us-ascii?Q?vzMtWEYUTvbovPDl6ZIb/dR5rj9bBgW0Xzn8LiuUIQcYAj0drJz5Y4dAePfI?=
 =?us-ascii?Q?8BTP4r1cp0+1MAwg/giZwfvpOMpny5VNUlO4rhLXSpiluI1x7j0TDHEPTukE?=
 =?us-ascii?Q?K3v7GPw77XXdYL3g80E+C8PhMgKPUPFNfCOPBwzC74LDwXRyAPVaW4/HFr4I?=
 =?us-ascii?Q?rx2Nx4FXjR9rcaRLMNM6Qnf37sznisKlwZKXSwgoLT1IwZ2oCsWAyw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB7044.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(1800799024)(376014)(52116014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?XSZZxvBai5eB7I3EP//Ip6M/vz9RG1kq0lMX280wtU0ByWyOO+QjoqlEA3O1?=
 =?us-ascii?Q?b4NcR6eoEVd2oCrbP2IoGyw51JxfdktoOnvLNdGOZaXRGjwiQTU5mwoalfAU?=
 =?us-ascii?Q?e3yj1tnm/eI+XHl6c9UdgQiUXJaSL9zYNPvjToxDs1ZEY59bpMOmLyoxlSEb?=
 =?us-ascii?Q?xLxYcW8q6S5nV7sYJ/1DYP/0m8KT8aChlDnRUN0weUe59EGQoccdYY/TuPHc?=
 =?us-ascii?Q?DpK4/mT9VxApzH73u9sDPeMSXloCu34zxfHbfbwka19DSF5XaV+fu8kGPMVZ?=
 =?us-ascii?Q?kcgFDwjLvYXyVxhF3+n3Eu8NMjBl5L/Wq4CYrwN5QB1wZx1NpOQn9OfPPlCF?=
 =?us-ascii?Q?CGWINVa6Vb9q782Iqs47Hdj2NCjUbyKpyyty+KHn+crX5sdL1o5dduU1/o6S?=
 =?us-ascii?Q?KSrs90zm1t2NtVr1bRxSK3cFjzbtfyLG268fY61balqSROBpJnwPXbzzj57s?=
 =?us-ascii?Q?BYHK4qhEqc6/BZX4K4XkhNQgekyMbzTpHWxNzk9gWGjsyjlxjzerJKyCBoa1?=
 =?us-ascii?Q?JAwTUxHB7Nmri7S3NWiFHoNSMORXaHsn1+2ZLWAlrjDssxgNzRRQi1FHDCpE?=
 =?us-ascii?Q?Lg8d2EdQR8oIe/DpiH3ctHP3q67zw8jDx7XC+mKBGTuOAUVPc423Z15y53BL?=
 =?us-ascii?Q?77uIL725Bx4+++E4iLlTdLUMg95c2czudqW1X2majDyuS6LEYKy5wJYnayrx?=
 =?us-ascii?Q?XqnCJP1x7Ycv6YMzViqpI1Ka8SllbVQelQPFZocupm5PX7dlDXSuNI0zP856?=
 =?us-ascii?Q?bnC4dE3976+ae6Q+wLoRrnEFoAde4DkV65bUXD2FKVFZtjqEGi+IcbbKadSb?=
 =?us-ascii?Q?EsEM7ZuJwHkvBK4AXNJADqVNOlGJsyHPU6EDGMXD8LjGKsPQ4gid9aUL2xgP?=
 =?us-ascii?Q?buIkZVwY9wF2HAeAO7SMvwI3qflPjktj4Odvencr182Xx17sW6L3Us9fWHKS?=
 =?us-ascii?Q?IM6jO4C1QnYxLE+5TIsX4izDF6HhrTHTFXrb0qZxUXYuTOEdJTBfEPJNBKTx?=
 =?us-ascii?Q?cel58H00vRcFYXhzm2+lznDkYLe2G1L5Lm1O5CiCsPWWK14Ry/RfTKF/H61W?=
 =?us-ascii?Q?9ncKS9eDk3PpsgPPRXNPHjMqr88sReEMUpDxDYYUTUkKGVd6OfnaulHslsnh?=
 =?us-ascii?Q?wfHZHSpEodjJ8K6IvMoODq56550Bvt4tsf2AMUFDXTNzh+QAwzjEOw17tycg?=
 =?us-ascii?Q?lTAtKU4oN86gKl3J9MTnnkCDnNrCgmiIEz6b/MOY/i4EVfZpjpdtT/iwSWNg?=
 =?us-ascii?Q?Tjun/cmc5FQsj2AZKxg2bhDZgzQs3aElkpPeDwZOloe6kwYKXKGJ8SmTsfOj?=
 =?us-ascii?Q?/KECudSHUyVhoXsN3n7cjPIYH0nlWSHbPcoNXkLMJ62yR/jdP7/jvHC8HMWS?=
 =?us-ascii?Q?hq2sNuoAOnKMjZd7vYOe+JlSP6XSfqwHuXRcrndM6Z+d23Ni2EgggyIrFMcW?=
 =?us-ascii?Q?u+bRYuUt7nnGXEucLzAHmUzI9Fq81/Zy/4ptCp4DsrCN7OnOIL+dYh3A7yE0?=
 =?us-ascii?Q?v0WjUdfHtpvRDq6+JfPeKFP6Q1dQyoIj5xr+7kRvrvTewmy/c8QxBMPNiJzD?=
 =?us-ascii?Q?owTRYIyg4jcHmRQ9DBnuRg5zxfnZ89Y9NbmvHFTo?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d01e82c6-3f55-48cf-3bc0-08dd3486230d
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2025 10:28:07.8303
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 753V5s8mudrRjOKVQ9W5kwA/eU7P7LE8qk5AtaT3b0Vhtrj378wf33tbHh7UVL5KG9idxfEpuLjgcYmYoxwK+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8082
X-Spam-Status: No, score=0.8 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On i.MX943, the FIFO data address is changed and the bit width
of CICOSR is changed.
Add a new compatible string and update driver for these changes.

Shengjiu Wang (2):
  ASoC: fsl_micfil: Add i.MX943 platform support
  ASoC: dt-bindings: fsl,micfil: Add compatible string for i.MX943
    platform

 .../devicetree/bindings/sound/fsl,micfil.yaml |  1 +
 sound/soc/fsl/fsl_micfil.c                    | 98 +++++++++++++++----
 sound/soc/fsl/fsl_micfil.h                    |  2 +-
 3 files changed, 79 insertions(+), 22 deletions(-)

-- 
2.34.1


