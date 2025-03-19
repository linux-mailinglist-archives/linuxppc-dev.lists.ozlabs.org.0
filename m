Return-Path: <linuxppc-dev+bounces-7215-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 38D63A68B91
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Mar 2025 12:29:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZHmh04CCfz2yrZ;
	Wed, 19 Mar 2025 22:29:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2613::606" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742383760;
	cv=pass; b=if5IemmUsg4d2QeSCDoZW2FljjAGATvMbOOufzT8pOyWJQZh4MlQr+YHNdAIFWuChGXPm8bg6FXvFLXv22ra2g6Ra4cJHIGO4HI9jcOqZQVEg8P64tALDnV9FHHe3EEOf7Bk6f0r2AQ8cuWnYs+xX7OpdS3nwcEOs7HNRbtFbCX+0CkPx+VLQfhNDkP4U3N7I4MzwuRPAmqOezWXarVpQc7NAaHsTxGpT21EByTcdqDgoDey1FrhC4Vh1WHhogVuh/hWkxa/4TygmDooy2NSo+OmRuHTAxNw132ohIGEqofI7gY4O1NbFqz5d8/uO0bdxSNl0R84uqlMDYQcBkkt5Q==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742383760; c=relaxed/relaxed;
	bh=7sdkZghpbBIMTieie8VW3ux22BV3CC+lSqDnjnuzXuQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=SXry7niOf2h2Pn4PdaTOZzCdbGh5SOEzBHyzz179c72CHZXaN4NmA+yq1lvR8Y/BsymIKkVFUsPUZ0Dp1AZT0i3wfrEiTpnxUT2wJLGl1fCyM8Tkim6ga7vRpV8/MrOZd72y8wlDuqXIYjANQEdJ2mtgW643CmxRpx/pVp9VrHDK3WsqU6msH3PJUzpf3VDzyuZi7vd9IdJyAtOS5I7x1OnBJuX4hqUvlsoVkyocOA6do9zAXxftv7fPtYE8DkzjNv1y0G872CwcJiLvSDF46YkdNUlTHyH4CfW/Ze2Y6Mb5Y9nu9VsSAjleCMUMw+1VdriozKfrQDRjPu155s+kSw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=N4kIUJeU; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:2613::606; helo=eur05-vi1-obe.outbound.protection.outlook.com; envelope-from=ioana.ciornei@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=N4kIUJeU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:2613::606; helo=eur05-vi1-obe.outbound.protection.outlook.com; envelope-from=ioana.ciornei@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on20606.outbound.protection.outlook.com [IPv6:2a01:111:f403:2613::606])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZHmgz2xhVz2yf3
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Mar 2025 22:29:18 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wQ5XW8GNAguzltFY6KhfhSYbnyfPwWwBRJYvmArI3sDtbYLaB3aiec/gOnmji8XlQaeXylZyNlF0arzmUSEWG79PaLqgdw8E2CXn8SEEpgiNzmG/tj/M0tBHxXe75m42fdYsfgXpYtR/dPN24wJ8iWtdNLyKoMy0KW4N/1GGOT1wv3GohS36NLhhse+Y5pJFg9Rl9mQDT5Y6gB79gfsr85nrENt06V6OUOoxb+RsQ+wwjg5vBtggFZXxjUd9eUklCm8rg/dRrEokSVOnLs4K4sSR1nkjnDwzosf1oxKQPuaeujsDmE2zeqnqLlyM2hB8OXInxr1gxNVE7n9FD3dwsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7sdkZghpbBIMTieie8VW3ux22BV3CC+lSqDnjnuzXuQ=;
 b=xpJHbrftEciECJ2L45s4Z5R+/j/JE42MgkiSclTSm0ApT5yqGVhWMDA+/F3kVhSX7B6Li9ghvmqXJUcNnwUeouWXLpsdv0sq6EdUtKMLnutRALsTUIP6JoJntJmSjSU/EBYJzkX/dlKkqWLkyAKkW2gvPMchKNw44H3KD3KN2D323knCgxmQpY2RGAT2PYPUU572g57JbLncmAy5TJVKLu+QHjyZ18042yTVycMFgbZhoLchSB8fFLFz0waigaL5ilpVelAH4zY45SC48ZMqgQ7ur+hUnOrPHgsxr2Xr0Z9Epa6fC7oBEB3vAiPj/KCHPrVc0gkOIYrH2TkmVJl8Cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7sdkZghpbBIMTieie8VW3ux22BV3CC+lSqDnjnuzXuQ=;
 b=N4kIUJeUBN0S1dk4r/hI3jmjj2P3NuXO5FzgnrJHQV5BoydaZbhGePn0cMi8CMYcHvB3pxbRC9Rd+fI59L8LD0ySJUENCxVtnisqi3u9QJn7huqlNM2hyEPmlT39cRsGTScNZuvlJaHdP1Zm3utOcfMqE75ERGKE5i6qkVIwzMGZGi/ux1bDF43iuzGo47iSgFCnFigm+SgK8LYcicNSy9SLBjmQQljsoTb1dJu+mtmTytnnCIrMeSkhzYdthDprQephHnB06KfoXJ45z+vW4fJqAxaiToSahQrbIok3hp4rb+RGRi5GwQ8ddo6ITvuUkD/BdbYTQHJf40ISE0qMHA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com (2603:10a6:20b:42f::6)
 by DBAPR04MB7448.eurprd04.prod.outlook.com (2603:10a6:10:1a6::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Wed, 19 Mar
 2025 11:29:00 +0000
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b317:9c26:147f:c06e]) by AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b317:9c26:147f:c06e%5]) with mapi id 15.20.8534.034; Wed, 19 Mar 2025
 11:29:00 +0000
Date: Wed, 19 Mar 2025 13:28:57 +0200
From: Ioana Ciornei <ioana.ciornei@nxp.com>
To: Stuart Yoder <stuyoder@gmail.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>, 
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Arnd Bergmann <arnd@arndb.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 1/3] MAINTAINERS: add myself as maintainer for the fsl-mc
 bus
Message-ID: <3b5hwovhn22npstnssawg3lxsgc7xq5je3zajjxp5xdwdrtz27@wv7qcj6kl2na>
References: <20250319094311.2966519-1-ioana.ciornei@nxp.com>
 <20250319094311.2966519-2-ioana.ciornei@nxp.com>
 <CAEac7tYQE76z4pYminhvMJR6GZ66RPRv4PxM-U9VpGJjvn6APg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAEac7tYQE76z4pYminhvMJR6GZ66RPRv4PxM-U9VpGJjvn6APg@mail.gmail.com>
X-ClientProxiedBy: AM0PR04CA0084.eurprd04.prod.outlook.com
 (2603:10a6:208:be::25) To AS8PR04MB8868.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::6)
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
X-MS-TrafficTypeDiagnostic: AS8PR04MB8868:EE_|DBAPR04MB7448:EE_
X-MS-Office365-Filtering-Correlation-Id: a78177d8-c224-44b4-f8c8-08dd66d93ead
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TVlKS1RwNzdIYW45WjZrM3FpN0k4Y1AwQytZbkVKYjFQQS9uVFhWS2tjN2da?=
 =?utf-8?B?SlpPQkFMMXhTbXorTEtwM3Vwc3hwKzB3UW5nOGZnc1NPK0pYMndaT1dZeDBR?=
 =?utf-8?B?RzZSVWUzNXd3V3loY0xwTVBMYmgwY0o2TzdBWEp5cDZGR24vRkNUYzA5bTJt?=
 =?utf-8?B?TlFiSW1lV1N5Zzh2ZjRicEtxRkZHeDJPVFA2aEhjTUZtODRrb0NhRzVlK3VP?=
 =?utf-8?B?UnBtOC9UR3BuOXk3c1VJTWUwSWhseGxyQTNCaVptSDVhOHpDRTh0bXpvcldy?=
 =?utf-8?B?dnBMNTBEWDYya0hkbi9PeTBTY3FOdEZnNTR3QjFBd2JQTklETUxGcTVPVVhh?=
 =?utf-8?B?RTc4YWo0VkIvYTBCUm1nOUR0U1J2MnYwdllLTmo1SVJlU0Q0TXh5RWkrdmtL?=
 =?utf-8?B?aU04Mk5YcnpwY2Y4d1YyZ1ZjTUJzN2N3WWVnb251UnVES3Q3cUdtRElPVmkw?=
 =?utf-8?B?Y25UL3hyYlpPQlZ0U3R2bytMQlVLbXo2blkydzRWY0c5YWRiV3MvN0Zhdm5Z?=
 =?utf-8?B?cDlYMzBSUmJwOVNkMU1vY3lLVEowRG4rWG1MbXd0OU1sT25HdFlkUzh3bnpJ?=
 =?utf-8?B?a2ZqUVNTTGpSSHRuY3U0REJHd2gxMEhvVnhNazZtOHlRWXhDMHFXejdqNk5K?=
 =?utf-8?B?ZzNKNXhTU0NGUGlZbnZtM3IxTHJwaVhuSTZaRmNPeGJMUDhERzFBSWRxVUlF?=
 =?utf-8?B?T1NIdEJScllSN2RSSmFQNnJHVitsM3VCYWU1aEhKcmREczBZNU1BNEpuUi9a?=
 =?utf-8?B?Mk5odWtxVGxOemlJTlF0Wjg5OVhMazB6ZmZmbnBkNEtOOGpHaVh0bHNPQnpN?=
 =?utf-8?B?dkZsbWdUYmZpR0xDQTJTaGxDeHRjMlMyWGpwVVI1RHo1bmRjRGl6TVRKNnpw?=
 =?utf-8?B?SXJYaDg2NFhyNHJ2SDVLRmljTjh3VEI1dS9UUDBnRFZZbERGaEIwZHJVM2RF?=
 =?utf-8?B?SXlRcFdDYnZzMk9KaHAvbmdOMnI2WkV3UStmQU5MWVp3bDJsajRwQVdpU0ts?=
 =?utf-8?B?Tmhncmc4UFdTNWpRdmtWTThJVW1hWXNISnF4cmIrRHBydGNFalVvdExEOXQ1?=
 =?utf-8?B?b1AybG1oZCtYNVB6VUd0a2o3NGRDTERIamM5OW5FYjBlZ2VrQ29oOFBLYWFD?=
 =?utf-8?B?anh4eERjaytwbUQ0YzBJeHYyODNYTzJFcEJsMDh5V2hCYjRSMmZhNlNwd2Y0?=
 =?utf-8?B?VzV6a042Wm12K25ySWRYUzRzRzlnbnZ1T0x5bmtzZVlXOVowL3dYYStmNGxt?=
 =?utf-8?B?ajNBTXRwbWNPVGZFRktHNlYzbXpmR1VEWG4rN1dnSEdOL29nZzhXNWthOTFw?=
 =?utf-8?B?bzk2K1lQUlhJalNUQUR1Yyt1aUFuREExR0NRK1VlSnpkR1ErRXM2cjVYZFU5?=
 =?utf-8?B?TFA2dytZdWpyckpZeVpTN3hKMTVnQzFHTEc3eXpMVUlvclhVVDNTQTUrbGg0?=
 =?utf-8?B?UVh6Q3VFb0YrcWFVNlp6NERaQ0Fwd1VTZGtQdUZoVWxkYXdPaldNbm1uSFlL?=
 =?utf-8?B?Y3ZMVW5VWTFNcjkwRWZ0aEozMXdQbFlPTGgvM0JCd0FDcktqazZmWS9Cb0Nq?=
 =?utf-8?B?blkvb0RNR2dBTGlJSlcxVng0dFNGem5pMDVmSW5YS0Z2Zy9zblJVZEwzZktJ?=
 =?utf-8?B?Ykptc2psVUhTY3BxMEZ5VjhWbjhZTXNHNHptV3AwS0FodlRSRzU5T3k2UHdo?=
 =?utf-8?B?bEpKWkNpcGN4dG9qSVVHTFdwRGVwelNRZGV4UkwxU2ZiTGxTUWszaElCckVH?=
 =?utf-8?B?U2hMRUUzUHRTS3diMFRXLzFBcitKRTVsWi82R2hRYjJOb1JBcEZEUjg1NGlD?=
 =?utf-8?B?eitWcVRkOGd1UTNLKzZHRWtTYjU0dzJSL3NMM2l3cnVySlI2M0duRVlvdTNu?=
 =?utf-8?Q?Y5cmHvG1TKDoG?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8868.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cEp1b09pSUFma01jcU5WT1B4b3BXU3R4YTkzUWtWejErak9TL1ZoRXB2bEtj?=
 =?utf-8?B?dE5CWDh0ZUk0QnY2TnpOWjVaT0RoOVEwQW9kVzRRVmtEa2NuOG9KU1NpcHlF?=
 =?utf-8?B?SjR4RDlUalVLR0g1V2Z3dVVtNlgzNCt0UHIrQTU5SDI4ZHBMRFZibzYzejJn?=
 =?utf-8?B?WWp5a1VwR1RmaTl5VW1TUFAya09oaklHMzExaGVydEVDNkRGTUx1RGhYK3pG?=
 =?utf-8?B?bm1ab0Y0cE5ZVk5hMy9lSU55ZlIyTUFFUW05NVVQK0Z2aU1wd3BrdU8zZWov?=
 =?utf-8?B?OHFDU2ZLdTJvZy9RVWJlbE9pdnNmRVJ1dkRJQzNScHhpOTNsU2gxQ3MyU3Zu?=
 =?utf-8?B?QXFJeURwS1AvUnd1TkhXWHZGcCs4VVlFTm5neDA5cXFIaTV5Qi9tZFppamlL?=
 =?utf-8?B?SFVUZzRuRkZiSWwxK29aL0p0Vnd5MkJiQlg3T1hLNzZjRmxPTHRqdHZrVTU2?=
 =?utf-8?B?eVZzalh0aHQwQWZobEdBcEM4QnNPaHhFTWxCSjl2cHJETjNMWHpYdGNvMThj?=
 =?utf-8?B?aHVKS2hxQjZOek9ybGVyK1dHZ3Z4NnczeEJGamJCMUVmSEtFVmYzM3pEWGJ3?=
 =?utf-8?B?NjFxV0hiTmNmUlhUOStOaGtpUnNEYklIK2JGc0drUTQ0M1Erdnh1SndBR3NN?=
 =?utf-8?B?cmpJZFh2cVJVa1FObkFISEZ3RWtYS3hWYnZYd2NKczZwUVFPbnlmeUpRWUx6?=
 =?utf-8?B?MHNZclNoRkNpOWY4ci9HQmxuUXBpcU11ckIvWDJBS2REVFIrMU94WFZvNnd1?=
 =?utf-8?B?ZDFjOUdOWTkwVEpUZlF4aTJsamdZK1JvSFZDemFLaUl1RzZ4QVVTZGVCTW1I?=
 =?utf-8?B?R2xVL1VwdWlhU0JiVE9WYmZETUZzSlBHemVidVd2ZXc3c3ltVmVJdEtKVk96?=
 =?utf-8?B?T3hqd3VHdWU3b2lwdXBKcHdCTmtoa3VvNGN5ck1HR1lIaUZFTldrTTRNVFhJ?=
 =?utf-8?B?WURzSENlYy9uOFpNQzdmaE05Mlp5WHR6VDE2aGRocXlhNU13RXRWUUoxSWhv?=
 =?utf-8?B?K2liUTViZ3lNbkI2ekpEcG1TQ3F0eWZDVXl3RUdjZXhqWUpuNGxsdUVDZWwy?=
 =?utf-8?B?aDVtWndRUXpvakxjeEV5a0lmR3dQSHpkcCtwUklGYkJ5TzhHenRGTUpaMTRC?=
 =?utf-8?B?STZxbEdMTEU0dUZycjNLMFI3bUUzOERpWkdjeWg4SG9TMGNVa0ZEZ2x5VlJZ?=
 =?utf-8?B?eGNvUFNTWGxoZlZlK2dMcW51KzlzQ1FVS0RoeVg5NnNVaGxNWWVrYnozTVJn?=
 =?utf-8?B?OG8wYUZDd3gzMjRORzgxM1pxK2x2Y1RqdG9iem9SbjdoSUp3c1lJYjZBUFdl?=
 =?utf-8?B?L3JGcVFkekZpejdqZlJsd3RxcVB0Z1RrN0ZmdTBwd3lUdkhvWHVVOGFYdnhX?=
 =?utf-8?B?YVIvcDFZajZJK2t5dGNIMUgvUmQ2NkhZcGNlbkQ4MXZLQ1ZDSEtlYUxVOFlW?=
 =?utf-8?B?QjhsUko3bW94cWxYYmJmWXkyZWlnRFlZbklPbU1Ia2E0UjdMdVM1dTdhNlJD?=
 =?utf-8?B?T2NSNnVjSVJPamU1VTNWc0hleVZIS1V3QmFUR1dYZTR0WUpYZ1NvUU9tTFd4?=
 =?utf-8?B?ejJEK2lsR0tjOU9melcvUUw5bVdHMzBGMDY5L2FYTTRLUzZOTENERDRUNldI?=
 =?utf-8?B?d3lFSEVYNEZHNVo2NzZ2Vm5JYWpMdGx5enJRY0I1aEdNaHQ5dlQ5aldqdVlW?=
 =?utf-8?B?Y0dVTE5vbjBldndFNTI3RzBCejhzTWNGRnVDMzJjekdqV09xYUc5alBNK09F?=
 =?utf-8?B?VC9oRFhmcDZsK0l5TmdiVFlxaTVIWlZOVSsrVjYvRjBTVUpqVjZMQlpMWkFo?=
 =?utf-8?B?bkJ6WVNGOWcyMC9qZHR5U1I2c0pUWTd4SlJoeURzQkdtbzhxcG9XaDJHQm9P?=
 =?utf-8?B?bmUwencrK1pZU2F1K1dLR2lLSmt5U3RON0VnRXZHcUl0SWR0Um84WFUzT1Bl?=
 =?utf-8?B?RS9rTmJyRVpOaGhBQis4MmpjcFp3WnNabjE4aWhSYkFYTnoySGJ0aXRjOUpv?=
 =?utf-8?B?S0hiQURobjA0eCtZTmJNL0ZPTDFyVk1RZVAySFFnUUkzdFMwNjV0ekc1dkwx?=
 =?utf-8?B?V2duWjNKWENjRCtod20xT3Z5c0FnOXYzaW5wVUJMaFVHNzZBbHpSTzRhVzA1?=
 =?utf-8?Q?urQPWdeNpLP/ClR1S6Fgxkx2m?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a78177d8-c224-44b4-f8c8-08dd66d93ead
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8868.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2025 11:29:00.3822
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6xSTZlkmmcA2nAQUD7xz93FAuWOnDQIQpi3PDAw7tYISYZbvUiprrrnfdwWRKdpAObqv3gvL3ZoJxLd7iq8Wzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7448
X-Spam-Status: No, score=0.7 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Mar 19, 2025 at 05:45:19AM -0500, Stuart Yoder wrote:
> On Wed, Mar 19, 2025 at 4:43 AM Ioana Ciornei <ioana.ciornei@nxp.com> wrote:
> 
> > Laurentiu left the company and is no longer involved with the fsl-mc
> > bus. Remove him and add myself as maintainer.
> >
> > Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
> > ---
> >  MAINTAINERS | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index ebf7fa9a814d..76b6db4074ce 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -19633,7 +19633,7 @@ F:      include/linux/qnx6_fs.h
> >
> >  QORIQ DPAA2 FSL-MC BUS DRIVER
> >  M:     Stuart Yoder <stuyoder@gmail.com>
> > -M:     Laurentiu Tudor <laurentiu.tudor@nxp.com>
> > +M:     Ioana Ciornei <ioana.ciornei@nxp.com>
> >  L:     linux-kernel@vger.kernel.org
> >  S:     Maintained
> >  F:     Documentation/ABI/stable/sysfs-bus-fsl-mc
> >
> 
> Please remove me as well.

Ok, sure. I will update the patch in v2.


