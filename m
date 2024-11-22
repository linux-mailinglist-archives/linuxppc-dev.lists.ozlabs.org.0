Return-Path: <linuxppc-dev+bounces-3491-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A95B9D57A8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Nov 2024 02:50:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XvdN41H0cz2xt7;
	Fri, 22 Nov 2024 12:50:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2614::60d" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1732240228;
	cv=pass; b=QrIDce+XZSfaHKB6vM7P08OHH6FhRCXyuoaHiSWkTMc1ulBqcyuzNGuXmxBxP2XszCDn+fivrghfypvrp2BNtd+FS9RFBFzxXZtqW5jm/DnTpm0+o9KQ0UtLMewtlt4Nrd6nKe4DAOcRqakIWB7Wo8vRYrtqnXkL4B9bF3erJyyDWQuSXuvF/ih4qErsI+rHH/Kl6bIiRgUkhNd5Ege37qSMm0HFPrC1gXOuMmuv0GhONecDZCDE6AiK0Vy72NfV7TNPLOCaLkX/WJl7VMsKKu7xYix9elHKqTs/NCUNGNCxbKhcSvgcz5gVaU7d+SiNihkW4xiYw5QGi8xvEdyTKg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1732240228; c=relaxed/relaxed;
	bh=kOCJVXrJR2zvdnDnohpgI61TSnVIk60R51/wFNMkTgQ=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=LeLe4vGjhVMoyimxgZlIIqSdm/QZnlM8Gz74RFFG/3DzXyD+gIlhwAYeLhAVrJxqpv+OjsoMJQjtwPi3O5URgkEHWFVBGHj7ykCrmjLaYlXSCJoIS1GTovhbE/5fpk2EWsKS1YkAA2X0FAuJCk1M/ZB+ZqmV65EL8fnhZAmmDU6UqpHY4eVwEdultcFd9Tl3GxehaWVkBo3FRKM5OVPAZyM0Vdaj7KdRtD7Cv8dz1eNA8qXSk2In+mKvtFbYGPw2igrdX2Ox/32NKJH7N+jefFl2OhbuSQ7iQCkqFYHey/k/g3h5nOldoCmDkPL9p94RVvPRoyBTnuxHHHLz9WYphQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=oM2EbgIY; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:2614::60d; helo=eur05-db8-obe.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=oM2EbgIY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:2614::60d; helo=eur05-db8-obe.outbound.protection.outlook.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2060d.outbound.protection.outlook.com [IPv6:2a01:111:f403:2614::60d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XvdN33FXgz30DL
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Nov 2024 12:50:27 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xhYNg7LN+cWIptwPn0B7Z3y0sQh+mc26K8aEQLCY+honGWGye0nX45f/kokX9A4llE1OgdBFN0FYwDxRQ7pyCArXVKsRuxFwxP1m+wU0vgEsxMvjYxivjdDI54VYeXEt5jUue+dhQhgSgF6l0uk1qzlk18mR2c43T9V0oHtmAttCd9luq6TdgxA1ftLbsbHbuScQEi+Ss1xdo4uuwvF2w6agMlkT6CijHHHZ8usTBgGzFqd6CukHJImiPYV+siVBgKTb/DJDrGsf/PDu/v8VU3YANhWe2AIiizT5wndZkt15tr9bLoxqYWhKUa0otWVnCxpyNo/IC49gj3VvMLZJ3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kOCJVXrJR2zvdnDnohpgI61TSnVIk60R51/wFNMkTgQ=;
 b=lQXxQJzAaQX7ciVRthw6gnO0NeRv55hIwGbnJHteDrnoWgUpWYMiLHFp6GUMHBOWhGKTFUxXMgKzatqGV6a5YXgSkEwotKeakPQFCTD1lNKk1V+f3oFFHgD27TfeS0OwsgKCUtba+hb5rad63vwyMey9ncogFDUWanl6WTZIn5p8wT4vZY0JfbemZKhcCxMPklp6tkuDE3S39zbwps7So/EXNbG/cODlgFI7UOmGbrl0zVRSLYKD8KEhq0ttGmZMAMgvmgoDznxbL+huDXIMABlpukjG80yF8EfuSnoQzaHm2M4XNe30g243X7mAku0e2LL/LmRZZiprVFu3nA0GHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kOCJVXrJR2zvdnDnohpgI61TSnVIk60R51/wFNMkTgQ=;
 b=oM2EbgIYbtUfci5Wj1RMuLrH6b2WKLcIlTlN0MdLaOyn124MTMfo6GNTWBxf4Bm7FWvXlukJlV6IvcwfhLPbtmwS+MjHj2XgQsHdvwPBs4uOVrRLXq9SZYEMSvwyJ3pDINsujYUG0tmIg+8bstxk0UIiQq6trw0Zdq6eT8zIqbN853D3QKmaBqNCyJntOesz4R5LW+00k0awXSUaxszlCjgnkmhqi3iWts7+HN4ktkwIGNjJHkFdwrY6oZ9cvATHdBt9s0NP1t2rJmukMwvAB4xwU4yDcgVJBJB4FpkUdy1E5KJSPav3UMB/7nUn2Lidv3AkKhMlcbFNSyXNzNjo2w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by AS8PR04MB8929.eurprd04.prod.outlook.com (2603:10a6:20b:42c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.27; Fri, 22 Nov
 2024 01:50:09 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891%6]) with mapi id 15.20.8158.013; Fri, 22 Nov 2024
 01:50:09 +0000
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
Subject: [PATCH 1/2] ASoC: fsl_xcvr: change IFACE_PCM to IFACE_MIXER
Date: Fri, 22 Nov 2024 09:49:40 +0800
Message-Id: <20241122014941.503789-2-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20241122014941.503789-1-shengjiu.wang@nxp.com>
References: <20241122014941.503789-1-shengjiu.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0013.apcprd02.prod.outlook.com
 (2603:1096:4:194::21) To AM0PR04MB7044.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|AS8PR04MB8929:EE_
X-MS-Office365-Filtering-Correlation-Id: 19a05124-19f1-42b0-cfe6-08dd0a97fefc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|366016|376014|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?k5Cxxtrzp40WhkzgGDH3udNTpKldORX9X4mxoZjWsLaQYyHz/MPeW5uBKm36?=
 =?us-ascii?Q?ofp7RTdHH8rtptOWXJlMzjzS2hZKJlWCj2G+bK+sH32DQA7uOT7gfYviNthw?=
 =?us-ascii?Q?JvUMisH8rL/Xq/PMMtCKf4bgqdhnrrIa7ep3xPZ7MFlZjODAxKUChhoYpMsL?=
 =?us-ascii?Q?d1QMVFyC7W/0NG9/RdO6y/KZLarG41xsMV83OEHULepVpl34nd8sSwPgjRYb?=
 =?us-ascii?Q?/6dr9TkdUjDBRoce4QD3uy2hTLbfvpe1Njkg8pDYrcubuWFvGLMYEyUeQ3f5?=
 =?us-ascii?Q?1m4rqtxgv6mvdVKG1cuazTFJ1IGND7ax4oyyeNFhGQK9L5t7b7Ksrxjhr0Qk?=
 =?us-ascii?Q?rmKZ3/aUmd3pSxCFPg1z2lo8kr1kcuWfAepD9jUm23/cmBoID53JXgOSsQgo?=
 =?us-ascii?Q?9APCeXYGUjSHc99PJ5DSFCCg7GnK8VXPnjqb7btgKVV0h2KrXgCR1aysEn0W?=
 =?us-ascii?Q?td5PLalLcueHkHABiBbPgf+XFn/+I9ILtbV74Q28qGDjwsTMVlDUGxHV3BAn?=
 =?us-ascii?Q?H/TPUeEzRddXFAgxzyFX1RJ3fdqh6ELGmhRdrzjQU9k06Vx7+XxZq47hsRiJ?=
 =?us-ascii?Q?YewqfRGpFRgP8m0EMvQmv41xRj4u+1aHwrOPZIttkIkwy0WSMWUcOpOa8gkN?=
 =?us-ascii?Q?RndXwYI2fraIEIGKCyU6eAssvsLC2O8Iidb/fvOlRNmKRtGqb9xeUpNs0IXI?=
 =?us-ascii?Q?Yx/orQnROc5OlVh7oHrgFwAIAF4jw5OKUUGDOpiVzvYETFgqloz8XUG0e35n?=
 =?us-ascii?Q?Xrg4jNWHTDQ43WNPtKJl0EMe9oPkB+9KlG33ECeTkiE47ySE6C6Z/nDVIKxK?=
 =?us-ascii?Q?OHnqUVAWZm7nx2gdU4wvERScLHHv34jLiUIdO+h+LnlWB5YIb5XxpEatw+74?=
 =?us-ascii?Q?YrznD00/YWS0pCJPBKhL4SXScb+IA+m/1DC0JGjG9z/4Mf+7cb2qvULNByuY?=
 =?us-ascii?Q?hZe8lZkgUnKvErurfl/WVoRouNUscOlBz/XRVRL2pBKtmPF9aKviqqYcjSJX?=
 =?us-ascii?Q?gQX/We47ALrwRH4HLA+AIFPCDwFbywZ6agiu63sM1D33B5ULPugISaeVhPks?=
 =?us-ascii?Q?V1r52SaEekKHjoPtfzjLtKjmVucNNERBTKM5JyLaHaYedHP4xu5sLS9sJryR?=
 =?us-ascii?Q?YNUBd5Sqz1clmTYMxxRcswsWUFuK+dQsHyRUJ/PQEGUNkJjTcMc80eXJA07u?=
 =?us-ascii?Q?+2W8d1fvLcbujtzfh83ppxisQIVo5E3qmodtJB9JynMhj5wRbrn3pudA/KAV?=
 =?us-ascii?Q?Y54pr1Gq/0a9jInBjwo2LTF/XdNL8bd0M5aPKggCMAn5iyBoLiLF4Z7bgtkg?=
 =?us-ascii?Q?Z0F4ZuL/g/6tTMfB4FK8MMA4E0bSwo0E0i82nEYaAccCHEFNszNC1BS8F9VJ?=
 =?us-ascii?Q?b+wzLxpws59EEjOuDz2slCavAn+P?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB7044.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(366016)(376014)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?J+4njcGY4Xa8wML5AUh4bHSfyZfmwFXtq/vIa6B6f0sFjo+LLfQv4Ro7gmCC?=
 =?us-ascii?Q?F/OhCIeViXSD21NqKZYkAjO+5STMwxqxhE94VfMVbDjbMsT1uIqAYYuGQO2y?=
 =?us-ascii?Q?OFEs8jS/JSgiIiqE8ySHi7r1RY/7h+dwSqiyyMB//u91K6xW4OFRTzE7R1XX?=
 =?us-ascii?Q?u414AddfiL8RHeV1iqbed4hceDVC7L/ENYVsQNcVXHW06MBMlutT6SyYG7sE?=
 =?us-ascii?Q?8uG01fXu7/RZQJtruriVvx9/kSiorysBieb3K3d0yAMXmFNZZQb/Ib5WwwGu?=
 =?us-ascii?Q?A2lB+dYrU6VQIkeLa/mD/zHdH3Hswat7xO9k5tB6nfZt/ywo/pe7EeRQmFoA?=
 =?us-ascii?Q?Memm9TIIbTx9KrUyRxRwyHBb/Uqt4X+irmDwjRzrjiXXmSJV4mQ3EpqNzesH?=
 =?us-ascii?Q?9Xj59hLsrfkAu8jmd9KwR+oKns+c4etn5aF36B4W6xjHg2mR6n+sPSfKCXxb?=
 =?us-ascii?Q?WPIus+638Z2R0oZHD9BNnTTFjtexkXaLaj4rgFZYfNjnwxhjilSDHRb/oOOA?=
 =?us-ascii?Q?Xdd6cLM7w+uhqKug6NYYyrEygDkGTLJwhjysCO9TwsLlTCkMSgUuCM7Y9zdx?=
 =?us-ascii?Q?gCOpxViy4Vrf0N5xmEHFVzibKcsgpT5hFrTNTNzyzYml2EGEZ4FFE1SixGPA?=
 =?us-ascii?Q?o7aD9Wnqs5KPgwMrt3IBKE1zKEnka/o5BdlAXhsBZh7Ji0Vl1OO/4Ghu81pW?=
 =?us-ascii?Q?IOTEVlb/uGthFdM7wPqEkByHa+N+slnOcihU8kW0GOO5GgzHsIyZo5jESpNX?=
 =?us-ascii?Q?NG44hbjioUXRRYEISxk76exkg+87lPg2SqQPGOkyQG8r23FvMM4BOprQIKWU?=
 =?us-ascii?Q?5MS6ALAuE5E954jz6gkz4RtHHpuS7YfHJAOJ/B9aD2+dgEDfelhnIdbwL7ME?=
 =?us-ascii?Q?n7WIX7pPkUcWakG4KAfDfZz3WwGAfuFE6xj5TE/VCuKDVcZy9GDCPwdnEio6?=
 =?us-ascii?Q?ighS8WKe7or5kOhgsPuvwrxdYPhcDyUTYjW7fElbnYNORG1hh90TYFqd2u2M?=
 =?us-ascii?Q?h/sHiUNEtSzf50uPm1IloIH4GsIFeLioYlvqZzkFzAl0tS5g1VV/X8xKv5Vr?=
 =?us-ascii?Q?ACHDxmikWkIr1o9ymDnmx4Mz2blqJJhxC8pSbaE+3bVx7pwoEglTWcZLYB5Y?=
 =?us-ascii?Q?lsEfZt3MzOiAVQv/LK/xUBHgQtoyO7WD7K1hOixbaoNUIqWovxRhvGBuaFzY?=
 =?us-ascii?Q?W8Idt7vknRoEA6aOAZf9BHEDbuYNgjZNFsHndlE+oxSCM6sL4WW+yVc2xKYC?=
 =?us-ascii?Q?OBqR+Jd88hyX8YEOHdC7y2kAiCgp+r38rIqI9J14bSnMB/Pni3LxMzAXhb5O?=
 =?us-ascii?Q?q/UlJX6z3UsDtV/JgDy7wEZ0j47iqlbBzurm/GMibhtAtQSp/R+D0qXIFitF?=
 =?us-ascii?Q?udcqA52YIHz+P8sQoWa3ZaHPxcBc1Ytatf40Si5dYnqPTB4jF1BnfFR3z4ig?=
 =?us-ascii?Q?qgQzDn7EEIO4HBjrc5orfJSnORX8HkCherAd95wOjqxHRp0/AzWxja1mN4NV?=
 =?us-ascii?Q?16m6CR+UKFxX87kzu83XEalP6TcULEPwnBK7E2TYX4CDhg89lR8Alno0ULUB?=
 =?us-ascii?Q?wl10ETAgT1uJLJNeRZpQsf+ZT3FjecLTD2CHxA8a?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19a05124-19f1-42b0-cfe6-08dd0a97fefc
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2024 01:50:09.5052
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: POhVGRwo6C8WynPMEhuTPafwytct5stTQal3xdZD0dSDcjM1iGESy6zodKr/PqmKljeiQzKset5w68etCA2pKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8929
X-Spam-Status: No, score=0.8 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	RCVD_IN_DNSWL_NONE,SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

As the snd_soc_card_get_kcontrol() is updated to use
snd_ctl_find_id_mixer() in
commit 897cc72b0837 ("ASoC: soc-card: Use
snd_ctl_find_id_mixer() instead of open-coding")
which make the iface fix to be IFACE_MIXER.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/fsl_xcvr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/fsl/fsl_xcvr.c b/sound/soc/fsl/fsl_xcvr.c
index 1e0bfd59d511..9c184ab73468 100644
--- a/sound/soc/fsl/fsl_xcvr.c
+++ b/sound/soc/fsl/fsl_xcvr.c
@@ -171,7 +171,7 @@ static int fsl_xcvr_capds_put(struct snd_kcontrol *kcontrol,
 }
 
 static struct snd_kcontrol_new fsl_xcvr_earc_capds_kctl = {
-	.iface = SNDRV_CTL_ELEM_IFACE_PCM,
+	.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
 	.name = "Capabilities Data Structure",
 	.access = SNDRV_CTL_ELEM_ACCESS_READWRITE,
 	.info = fsl_xcvr_type_capds_bytes_info,
-- 
2.34.1


