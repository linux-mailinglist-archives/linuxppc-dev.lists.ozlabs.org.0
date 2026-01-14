Return-Path: <linuxppc-dev+bounces-15724-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F37BD1E8E8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Jan 2026 12:53:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4drkyc735fz2xPB;
	Wed, 14 Jan 2026 22:53:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=52.101.69.90 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768388250;
	cv=pass; b=MvQ9MOFFD2MmPBHwjMJZodY3GneyGlZJ3y5bNU6imp1LiIxttvMwI8lMvqm7W9Yn5j74IBlzo8WM7fka/xk4pzOt8oKwIE+NK9AVWBl4smlh65FrzTDY4Jhm4QUFdgMb4xnWsFIGAyy4Bvq8JghlSNy7VzvyKwigAqjHfdlghd459dc7HnjmNmDTZDptXk9rVhCGh2osRr5mkGOpMqyxoL0WFV7a1ItGWHyREgUb1naUePPkne3/4jusm/Gh0BAYzbFjHRDHpTW4nruOkn63E8m7dfLyi73p8EAAtoo1G+3e0T8AH0bokPFNgrPKEfH6j8+4k/9ffO7yONCa/m81ZQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768388250; c=relaxed/relaxed;
	bh=6oaV8ExszNqMbWYlmWzJTDDeiNRvxWVWf1eKKcmfO5U=;
	h=Message-ID:Date:To:Cc:References:Subject:From:In-Reply-To:
	 Content-Type:MIME-Version; b=mxTeJRsKzm9C79NKmB/zrTs35Q+uL3XahE6PEFfc/M3SDQann9s3rdW4SeDHdZDHwtbwXUgJ4sKdLN2IaHIh9fkWZ4qsRYc+4sWddnwCRU3gUmLAKaWnRMp2zraTD6qevbnj3RO4osNke+fNfDeWhNiM06+J55gmHXK0RmoICUBTvJKMh1a+ZtCgRcOHSA8lXgvIoeOXjTJv3TZkvUrvfoFqWZBJW7AxkQSKWQiiFKMYtuA5777YhOMa3+p9LGUEB1keKL59SkjGg7MEEYK4QK5mlZK/VUoDt1j98BKKuyRX5Logqtq0thTvYLIeopMwwidSM19wjCHR4Hv8B5toHg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gocontroll.com; dkim=pass (2048-bit key; unprotected) header.d=gocontrollcom.onmicrosoft.com header.i=@gocontrollcom.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-gocontrollcom-onmicrosoft-com header.b=cWnsvmuA; dkim-atps=neutral; spf=pass (client-ip=52.101.69.90; helo=am0pr83cu005.outbound.protection.outlook.com; envelope-from=maudspierings@gocontroll.com; receiver=lists.ozlabs.org) smtp.mailfrom=gocontroll.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gocontroll.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gocontrollcom.onmicrosoft.com header.i=@gocontrollcom.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-gocontrollcom-onmicrosoft-com header.b=cWnsvmuA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gocontroll.com (client-ip=52.101.69.90; helo=am0pr83cu005.outbound.protection.outlook.com; envelope-from=maudspierings@gocontroll.com; receiver=lists.ozlabs.org)
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11020090.outbound.protection.outlook.com [52.101.69.90])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4drjkK3GvZz2xFn
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Jan 2026 21:57:28 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qSxn+dcGi9Og6pRvlIgOuYr75WfXtat0i2QXsCCzXSpvrY2ChunI7WgJM8x2oXXvvVAjfdH5fuH6QRsKG7ub+OqmZ85xP3C5i+wKcchTBt2KxuwuOon7BG4s276DoV0veqmDoK3h+awVCoEC8xTITkWRovEBiKDo6AUHpzcFK8IbXT4BZNgJLYdVcWpRQMfWE5XGJYktK+KQAuhPB7o03aEncmXBpl4L21RRg5KHy+lAZkOwrwBtTAg81ez5OatMSKhnvCHuiogdw2I0RS1ttslbhhh8jeBx52Hm41Ld2sni/b/ABBsTb8sXd4aOiLOud9mP/TzKadJvCIev3oVcWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6oaV8ExszNqMbWYlmWzJTDDeiNRvxWVWf1eKKcmfO5U=;
 b=WObn2pVOlb566a1Euge9uwtIo5nXfC2B1BFDXdM/uAUXrp43Tbstex4O4v0iy+KCgMUmborl8Asx8RS/vWF+4c3V4zxsIbd/Y2QYOoPrGU8GGFaLO3ZDtxm7DHKUzuCEV27XPFd5Gp/NInDVp5YOupNHWMtiZ8ffOofKAhSD4ks+LIjk1UZhOShr8T3k6ILzq4v1t7CKP8iRSNL2eDPDgMuOXnub1RZ3kTu1uSz1VkUmjpLzdVUMFy8+T4Ea31KKJasHbr4Q7bv5blVgdPI4rjz/fZlwjHKPnMJ+XVkj+9lp3dNv7vENHVvBQdO63SVu9hQuuTH9huz7ZiuUSJ2ctQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=gocontroll.com; dmarc=pass action=none
 header.from=gocontroll.com; dkim=pass header.d=gocontroll.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gocontrollcom.onmicrosoft.com; s=selector1-gocontrollcom-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6oaV8ExszNqMbWYlmWzJTDDeiNRvxWVWf1eKKcmfO5U=;
 b=cWnsvmuA9XstQ20nbbdHyDzk33wBCTnVcwKvPkzOkuSIh3EpIspXsQFS7kRW+aEK4FtsUwleFy3pVKzwWttNzNPNLPQZi7cmQAdy50ZNqw6y84tI5SNVJ1+OMTGKjSm9O4RwH1M1dkxRrC5op28gB/dV2EHPTpPjX/2O3rRCsUEg/gNm1YONYM5T4kA87aPRC79VreIK8fgZManE5twBk4kY+xFr3ufYWdo2llvo73N91eMhikwK8mzOY923PTywIkmlZOZRyZHw8Lkv6CkwsISNp9UU5Hv7xw0k2fAODhFo7uO8k/qhep4i+j46+BpA/vCzRVjxcfvtlku+6QynnQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=gocontroll.com;
Received: from AMBPR04MB11741.eurprd04.prod.outlook.com (2603:10a6:20b:6f3::7)
 by GVXPR04MB10084.eurprd04.prod.outlook.com (2603:10a6:150:1b3::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Wed, 14 Jan
 2026 10:56:45 +0000
Received: from AMBPR04MB11741.eurprd04.prod.outlook.com
 ([fe80::ee70:7a62:e9f:12b7]) by AMBPR04MB11741.eurprd04.prod.outlook.com
 ([fe80::ee70:7a62:e9f:12b7%7]) with mapi id 15.20.9499.005; Wed, 14 Jan 2026
 10:56:45 +0000
Message-ID: <1f4391af-7b2a-41ff-b626-418df01c15be@gocontroll.com>
Date: Wed, 14 Jan 2026 11:56:40 +0100
User-Agent: Mozilla Thunderbird
To: shengjiu.wang@nxp.com
Cc: Xiubo.Lee@gmail.com, broonie@kernel.org, conor+dt@kernel.org,
 devicetree@vger.kernel.org, festevam@gmail.com, krzk+dt@kernel.org,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org,
 linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 nicoleotsuka@gmail.com, perex@perex.cz, robh@kernel.org,
 shengjiu.wang@gmail.com, tiwai@suse.com
References: <20260114100655.3885926-2-shengjiu.wang@nxp.com>
Subject: Re: [PATCH 1/2] ASoC: dt-bindings: fsl,sai: Add support for i.MX952
 platform
Content-Language: en-US
From: Maud Spierings <maudspierings@gocontroll.com>
In-Reply-To: <20260114100655.3885926-2-shengjiu.wang@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS4P192CA0028.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:5e1::13) To AMBPR04MB11741.eurprd04.prod.outlook.com
 (2603:10a6:20b:6f3::7)
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
X-MS-TrafficTypeDiagnostic: AMBPR04MB11741:EE_|GVXPR04MB10084:EE_
X-MS-Office365-Filtering-Correlation-Id: a70fc1ac-2309-44dd-3c95-08de535b9b9d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|1800799024|7416014|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MURPaE1zRU1YRE1uUHROT2Q4c2hDNnRMZDdzRzg4MGdZcHJXT0pGMXgwSXFX?=
 =?utf-8?B?WkUxWUFPYzMrMnY3VjYzRk4wemVkdEIvWFFPK2p3QkFqVTIwY3RQQzBZV25S?=
 =?utf-8?B?N2N2U3oxNmwrZUJFWU5nek5PbEVuYVlmaFhvWDdkOXNlQ0pPM09NZnd1RFps?=
 =?utf-8?B?MTc3RGJiZUhiNG94L1o4UEtDdEh5TmNJVElUYTBsenJYNmptUnc1MFlza2ht?=
 =?utf-8?B?ZWRhNks0SjBNVkw5MmlmQnZIandobnA3Sk9qSmdZTE5yMVMxd2tQOXBJdS9C?=
 =?utf-8?B?NFExOEMyUEgveFd1REY4THFjZXZ1NG04T0FPRENiUTNBaTFpdnlOcWpMTTZX?=
 =?utf-8?B?VHEzZ0JPZmk5VWxCWE9tVFRFZGczV1E5Q0dTeC90VkJXUytGZ082eWgzeUxj?=
 =?utf-8?B?WVhIdElIV011Mjc1d3N2UklXbFA1UndTYWx5WktCUkdnTHVLMEdwVldOMldR?=
 =?utf-8?B?K1hnSXYxd2kyYmdoZCtacW5kaDVOY2lDamlhUmJrdVhRVXV2anlJM0NrVEVX?=
 =?utf-8?B?S1FqeFNSVGtWYzQrMGo4S1F4RTBFejBjYnk3WHFOeWJLRE83RFJzamJ4VDhr?=
 =?utf-8?B?bUUrUEluc1FwUGtqQVYxTlVBNGRScFpCS1pzTmRJb1lhQnNTQUlxdU03QS8y?=
 =?utf-8?B?Y0l2ZHNsbWtwT2h2MmxRZFc4ZkNnbnA5VmtQNTIraUprZVBpNDlvU2N1YXB5?=
 =?utf-8?B?anV3eGwrcnFlWERVYnZFV0NaVE5lRDdRL0JMVm9DQndYcWtPV1BHczFNWk02?=
 =?utf-8?B?UGdQZGxwNkYxRHdCTkFHcEpHdEJPaUpxeXhVTGoyc0FlOGZKbytTYzNXQ2dU?=
 =?utf-8?B?UWlYMzZWRXF2Z2lKWlBIaFdjck1RT2VtakZwempIOENDQ0FVbDVEdk1Hc2hL?=
 =?utf-8?B?Rjc1TGtwL2lpNUg5N3NQZTMrQ3R0RU9FekdFV1hPT1lRM2MrL05DanZ5ck5Q?=
 =?utf-8?B?WExPQ1JXcUtUWWpSQnFaclhmOStHdlNML1p0aTc5c0MwY2toa28xVlA0Yy8y?=
 =?utf-8?B?cUhMa0RGSnp1Ykp2S3A4WGs4QXRnekwyQWJOUmFBcDQ4QkJNeHQ1cjljNHl5?=
 =?utf-8?B?ZEFqQ1RoQ0g2UWcvazZUUXhHOUlBNzFvc2FCZGxMRkEyMXZMU2lhcE1heGor?=
 =?utf-8?B?NFVLKy83VEgxelkwRTJBQm9GeFlqbm9tWTJhYThEL1piZUkvQnl3azVyWit2?=
 =?utf-8?B?eW5aM0FqMXZlaWFMN1BuMDVzeitnR09uUnNsWis3RlpIQlMzbkVEYTdhRWZ5?=
 =?utf-8?B?ZGlBRnhUQlpDVjlNSThYeXRYNkUwazdDd3p2czYyMWQ0NFdITmJOb1hsTUFF?=
 =?utf-8?B?OE5XU085WmYxdVc4VTJXbTlYKzVKb3lySzNjZVhnWjR0b3dHSGNEVVBEbWpn?=
 =?utf-8?B?T2p2RzBybFYvSlVRZjJTWk9wZlRHa2JjMkZ4dll0cUgwaC9YVnZyeFgxSzVt?=
 =?utf-8?B?ZnMrUzB1WTFRaDBSekxBNWJ0TFh2R1JOZXNIbktMaklsUGp0VlcvakYrWmtF?=
 =?utf-8?B?ajI0UHJJV2wxL1B3d1gxTmdjeFc4MkJkLzRnNVZybC9tZTVIaGp6VUVqT2dk?=
 =?utf-8?B?YzZlQ0VDK0FGTTVVb0psNnExVENRaDdHMzRNMm9zN2wrUFZMZ1dtQ1FxVXd4?=
 =?utf-8?B?VGEvZ0hvM3ZwUEduSnROOTc3ZzlDeHlJUm1tV0x1YlpRNS9jL1VoazRyRjZL?=
 =?utf-8?B?eEh1TGFMdko4NjVvS1pmVXlCQ2E3Q2VncWVqKy80NDkrdFNYVEJzbGEvSVcy?=
 =?utf-8?B?V1FJQVk0WWFNWWoxd2toSk9hVWtTNGdzdVJFWUk1NWhZbnlVSjhYN0JxaEtl?=
 =?utf-8?B?VXdxZGRnYlNzc3lwd3RJUy9yT3BnZkVENTYzb2J6dHRTa2JjM3FVeE1EYXhs?=
 =?utf-8?B?bXMwRERqQ1ZqM0t1ZEprQitBdGZqWHZoWVczUElDZVpvTTllM3B0QW0yd1VN?=
 =?utf-8?B?Z2xhdCt3VzJVd3phenRBUjFFRGlxaE9Nb3EwL1V1aEdtQi9GL1hYa0VvQ2gv?=
 =?utf-8?B?VVRCTGhCNEl2V0xFdVpFRHY0RElNSFBsNHZxbUl0RXQwcitzcHlyOFlrdDU0?=
 =?utf-8?B?OE5oOGdNR1B2NXRhM1VneGFjSEdRVzhyaEplQnA4bFVwaitUaFFBbjdKRUFM?=
 =?utf-8?Q?lqyM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AMBPR04MB11741.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(7416014)(376014)(366016)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZnNCN25NbnliZU1Famc4RFNXeHplZG1LY2hxVElSa1FwZ2JOSmVyNk90cldW?=
 =?utf-8?B?ay9vRHZJWXlEYkxwVU9tNHNoUnNUWlNMQUxhYWZHUmlJd2VVTE1XV3RlRDhN?=
 =?utf-8?B?aGduVGk4VDRuS0pJWGJkSHlBbDdIQUNuWG44TndKZ0V6VUdmT3llK0VvK01N?=
 =?utf-8?B?b01kdWtZSExoQzZVQkhudTRqeXhOZzRuNWlyTFkzaHAzWVhQSUV3Mk95cmdU?=
 =?utf-8?B?TDI0WWQ1MVZKSTVFaXhWMmpEWWhYeGRVaEE2WkxhVFByanIvYjllSEVkRGtH?=
 =?utf-8?B?Nm10RS9INXlsczJYalErekw1K3Rad2h3ajM1Z3gxU1RsMFFFTVl0dGw1aVZT?=
 =?utf-8?B?Qk9mSHBGZytKZUV4bFVmMEFLT210WkMyeWNKM3ZQOStSdytmSWZwSXV0Qzcw?=
 =?utf-8?B?V0RtQ253TFgxNXpBMFdZUGEwbDYrQktzVkJ5ZmVMdXpMSmVwcTQwOHgydytx?=
 =?utf-8?B?YjA4ekc2R1FmTTFTa1N1cFFGR2pRdkZabm5WMTB0U0lMdWlRc00zQ1R3K2E5?=
 =?utf-8?B?QnpwN2gvdC9RSWZxVzZKMmVQTmJvZUF1c2EyN3d3akZsWkdHWWNxWndxc0pa?=
 =?utf-8?B?RERNUGpXUlJFTHV1T00rdkpsR2pWc0lWWG5YWmVGaXNhaU1YZ3AybUxsUzYz?=
 =?utf-8?B?WGVTM1FXL0Z0R243d0crN0ErYmZlR25yUXMrdFF6NENUV2RPUjFGdkttMCtx?=
 =?utf-8?B?SkFxTnNhMzc2Nnhub0NKdDZyWUtiSjhjc1VsVXRhRVRvNWZXcFU4TFFhS1Ft?=
 =?utf-8?B?NDg5aEdVZ2FtQjk1dVM3V0U4WnlVSWRMVHJ1OCs4eTRUT0NDN3QyMlV3YkE2?=
 =?utf-8?B?ajRYeXFja3c3NTFOSzV5ZnozRURhSFdVNXdybElpRWo2K1dXQUdBTXRFYjRk?=
 =?utf-8?B?bk5yLytXSlpocEJycjdMeUQ5eHhtVGpRRWpWOGZkUXVyLyt3S2RFV1d5ZFYx?=
 =?utf-8?B?cTlMNWlISkV4THVnbTFOdERvRHNqckkxVnFqT2NFNGpWQit4OWdSa054L0lx?=
 =?utf-8?B?a3lTZ0FVWmtHdi84NjR6aVBnWDVGeFFweVM4OHFQejdaTU9SM3JCWlZiTThi?=
 =?utf-8?B?RlNrYWZmZ3o1Yldyd1U0L25RSUJJMmUzS3AzUnl2QkVieFNnZHpKQXJ4dEY3?=
 =?utf-8?B?d1EveDFkVVZlcFp3ZFk2dWVJUGI4NGJURDN3U3B3NkFBVFNsaWl6c0hDQlhD?=
 =?utf-8?B?U2h2RWtwb0pZVFZNTjh3SFErV2I0ZGt5WTJudzM1MFUydnh3aXBsUEVRQ1hi?=
 =?utf-8?B?dEtUUVlLeFRZTi9WREJEOVBtNnFrTWw1N3VBcFVmclkvL1p1SDB5NituczZX?=
 =?utf-8?B?VTUrR3dxMmFWZHBkd0ZxMUtwR2hUOThsOFVicUdDZmZSS2dLVnJuVURka1RN?=
 =?utf-8?B?V2tkbXRvQnY1VzFYQk9TdFhTS005QlJyRjMyZFp6R1kyb2kwUXpMWUwzcnFS?=
 =?utf-8?B?VXg2ZG1BQk1qMk5GaFJBL0RIVE5pWE81NlZmTzlvVjh4MTloUFhUWDFvY01F?=
 =?utf-8?B?cll2a25xMmJvM0YvaG9LeUl0QXpRMTRyR09NbStZMnBuSkttWTNwZkJNcnkx?=
 =?utf-8?B?SmFzOEJoMTQ4ZHVZcm5ka3lkMDNDMzFydEFYMHk2TGRXcDNkUVFUY1pvbGZM?=
 =?utf-8?B?VlkxMVdrRWVnWE52UEx3UzB3YnlqQ2Q4RnJDZWxnUUhCZi8yTEdTZzJaZ2pL?=
 =?utf-8?B?OW5OWmQwSzFXbk5tenM0USt5ZjFNRis5SGhSamN0Z3BibGZrM1VNNngrUzhZ?=
 =?utf-8?B?c0dhYmhET2dWNVY1anFDQW15eUhhU28rbmZmUFptL05uYlhmak1IMDA4SFA5?=
 =?utf-8?B?c1VZL0xMVnRCdjUrdE1qcmgzSXltZ1NlcDc4ajFWM2VBL1hjT3Z6SlN3WURh?=
 =?utf-8?B?VEhxdkljdGFJUlpaZEt5eWFqcVhSYzZ6UXBTUkZ1YkZVak5GZVgyVXNPdVdR?=
 =?utf-8?B?L0VxWHA3bEFNamVWeG9FdEhiYW8xMFVRK0ZneW9jdGFBSjFlSmJBc1Rrbncw?=
 =?utf-8?B?RmZYM3lzQmF2bVY2bElHVGRnZjRWamo0SHlLNHdDTCtFOUdTb3J1N1YvNkRH?=
 =?utf-8?B?V3hsdzdnWnB5SkI4dWtLUHVSRER2RGRQM2hFYXBqSERJV3IvVys5alZ1ZkZn?=
 =?utf-8?B?QTNCOVI5dEhqRkVrU0Fkbko0WlE3OVZwOUF6M3FkYUorbEtNSVZtWEt5d2p5?=
 =?utf-8?B?R082Y3RjU0ZLYmYyck9WMWprS2NET1NPZldjTmpad3VZbjRvQ3kzbThsemNp?=
 =?utf-8?B?RFI0YW9BaE14ajJzT3RvVFFXcTR2WllHQUFmbVp0WjNzYWl1YkdGeENud1dR?=
 =?utf-8?B?Nmpac2ZXMlIvTXA5QVoraHMwU3RMUVZmNTZsR2lmeVNqVC9FbzhYRHkrTU8v?=
 =?utf-8?Q?lZe2GgZnrDhYL9Q755/wNN0T36xD6TfxGL9JfhaP3ZyCJ?=
X-MS-Exchange-AntiSpam-MessageData-1: Sb0tKIJ7YYbDTTv0RVuwGHbSVGtTFkNonGg=
X-OriginatorOrg: gocontroll.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a70fc1ac-2309-44dd-3c95-08de535b9b9d
X-MS-Exchange-CrossTenant-AuthSource: AMBPR04MB11741.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2026 10:56:45.3212
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4c8512ff-bac0-4d26-919a-ee6a4cecfc9d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0k2ADAXyIQ1rke+lO0/N0EN2xeWgLnYCK+CMol1Yuvp2vDX8ja+7uHXnZ2dS0Qm5aJ9aKbfaL5DycBqQDNNzS4VXU81bsZh8jPLGNikPJUQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10084
X-Spam-Status: No, score=0.0 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

> Add new compatible string 'fsl,imx952-sai' for i.MX952 platform
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  Documentation/devicetree/bindings/sound/fsl,sai.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/sound/fsl,sai.yaml b/Documentation/devicetree/bindings/sound/fsl,sai.yaml
> index 0d733e5b08a4..d838ee0b61cb 100644
> --- a/Documentation/devicetree/bindings/sound/fsl,sai.yaml
> +++ b/Documentation/devicetree/bindings/sound/fsl,sai.yaml
> @@ -44,6 +44,7 @@ properties:
>        - items:
>            - enum:
>                - fsl,imx94-sai
> +              - fsl,imx952-sai
>            - const: fsl,imx95-sai

I don't think this new one should have the fallback on imx95, given that 
you are adding a new match compatible in the driver, so it is not 
compatible with the "fsl,imx95-sai" data.

It should be a new separate entry.

Kind regards,
Maud

>    reg:
> -- 
> 2.34.1


