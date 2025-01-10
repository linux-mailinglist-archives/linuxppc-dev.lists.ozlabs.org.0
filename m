Return-Path: <linuxppc-dev+bounces-4983-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 14C67A09461
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jan 2025 15:55:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YV4T7479kz3cXw;
	Sat, 11 Jan 2025 01:55:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=fail smtp.remote-ip="2a01:111:f403:2417::61a"
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736520923;
	cv=fail; b=SHAQErX4bRUxYhwqaKto5wT0/k0QyIz6fRbzkcZZqtm8cnDCpF1gnHPQtOR3mQAsyRm9X4Nk8CJ/Ma+8UDqk9tKxMWuVNFZoQMETGD1HWyr7imtJOgCWWuVAaD4hB5mZNwxVOxaMnbRgomt/PsWnI6hoIYcLbw/fbnXvtX97q/V0SSUru7ENN4leLLumHHAKFq9wLgDUSlHIkeYjecNn2DuUR322DlPVaAApY182mAeXNWAa47wEjww/+Lty9HobG3n6SDkbhRLjhYNnLSgrjxWe95rPqOb2FzI6Jz6nYT9BgB8ebx2xdX5tnbl1srVbABxU3Yg22246RYXkCjx3Fw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736520923; c=relaxed/relaxed;
	bh=74Oj+C3B04kyNuU4IRpo2HB/nh2h90EPer+rXZvpsIU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Fx/SmFpIFjCVv0jkChWyl85qaIDrYvXrGpVqgmAiSBiTOWlzjPtYIJYiXqM3cSJ9uxVJ0E7u2oDn49soHrEYscTt9kzigZhcjmoiXs0ifPsjn8dq6TA4QMeaOLU+OiYb8S1VUz8gLLixXOIwixoqsXOsk4OQHY7zJ9HwP/vhv0PBKeTRULDCWpc1y9hfIMyCZmC82JG+32YP8UW4yNBJvXkTggTsk+E0vU4IHljXxDp1weaTJGYOvFxiti58BOOBcBs/y3d5a6AMO8KzkzhoRCiy/IqdP/8AgLh2IBhewVh7ixKNaY3EtQ5QjsGeZKS/YhxYN4W5GwVQa9YDnSbYAg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; dkim=fail (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=dDAGFcLt reason="signature verification failed"; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:2417::61a; helo=nam12-dm6-obe.outbound.protection.outlook.com; envelope-from=yazen.ghannam@amd.com; receiver=lists.ozlabs.org) smtp.mailfrom=amd.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=dDAGFcLt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=amd.com (client-ip=2a01:111:f403:2417::61a; helo=nam12-dm6-obe.outbound.protection.outlook.com; envelope-from=yazen.ghannam@amd.com; receiver=lists.ozlabs.org)
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2061a.outbound.protection.outlook.com [IPv6:2a01:111:f403:2417::61a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YV4T52tsTz3cXv
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Jan 2025 01:55:18 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GU7aSp/0BSONj2cKEtss5QCeBvT59R6eJdkEf0nnXBdJ4ieJ+s0Je4mkT2BciKbHd9qu+mO5/hcZBFFWQpGCkYlWk+MEICuPrltxjnRRFzKADDwLWYVEBW8hVK6Pg+PPoa3XpIcZmqZiaUtv2DMQo/QhIMNSAAjCxUkKDnUBVjFscx47/ZyG8wygX+eW3Sq4mqL0xB2MZAaUr55Dv/zV+omEtwFf9MxdfhSwhLZwdfFqSWS5+c2BeXGxDQI3uS0MfOHzMfVGG4am9HnuaXfglxUxsCuDtF7MxlC/lGWUP0wdcEyEtTOs6R5Hb4uxwMMmU5mtHRk2BJ941+ShwZ0zWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sse+MQ+xWp8189NueQOl5KfL7D1Oubq+2VGsc4k6ook=;
 b=VoBiO+BJ7PB5QRSbODnoQ45gvC4Y2yInWVtr6nU1bWTs4ZghRhXRdI5pvi6he4PpKAPA9fWl8D1Row5D7QO8ghzU47SnNe/FU5k7mDk8K8nMTkGmAiCtfkyiJo8Ohw+vwCRKjBVaCVXir2y8cfsmTuTthonIfoqhjzN26KAgtW9VHZEidxeriQXD62jNXmXleL6QzznAB4XW2Vb2OWI+GOmVMGQ+V03zkEGodBKKXVgPmj3r3vDD6NvvYGmB1DYLGoNhy+LOSIfELOsvKFN1oeF9+XXOFP+C5rfmbbRW3LovH/2sijYZa2nlA7OofVJGMGRENtfbfVpDbMYSdGnFgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sse+MQ+xWp8189NueQOl5KfL7D1Oubq+2VGsc4k6ook=;
 b=dDAGFcLtMksThFQ+tiRllPWG38vomZ8dHZQ1TIG+uj+E37ngN+/NQ3H1GCTVazcVAWMPb6KSjYFLc9XbcvUJTdK2cWmuUWIJYIPrskalnQ7NJW0fpI6WvxYbnhf9z/NUfARaTEI9LDOhOg1ZO5UaqEbjNtQKi7y0WpD66G6+5YI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6373.namprd12.prod.outlook.com (2603:10b6:8:a4::7) by
 DS0PR12MB8444.namprd12.prod.outlook.com (2603:10b6:8:128::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8335.11; Fri, 10 Jan 2025 14:54:53 +0000
Received: from DM4PR12MB6373.namprd12.prod.outlook.com
 ([fe80::12f7:eff:380b:589f]) by DM4PR12MB6373.namprd12.prod.outlook.com
 ([fe80::12f7:eff:380b:589f%6]) with mapi id 15.20.8335.010; Fri, 10 Jan 2025
 14:54:53 +0000
Date: Fri, 10 Jan 2025 09:54:49 -0500
From: Yazen Ghannam <yazen.ghannam@amd.com>
To: Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Lukas Wunner <lukas@wunner.de>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
	Oliver O'Halloran <oohall@gmail.com>,
	LKML <linux-kernel@vger.kernel.org>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v8 6/7] PCI: Add TLP Prefix reading into
 pcie_read_tlp_log()
Message-ID: <20250110145449.GB1641025@yaz-khff2.amd.com>
References: <20241218143747.3159-1-ilpo.jarvinen@linux.intel.com>
 <20241218143747.3159-7-ilpo.jarvinen@linux.intel.com>
 <20250108213359.GC1342186@yaz-khff2.amd.com>
 <a7a769c6-0a4d-0e50-f2d7-6556db0fa7bf@linux.intel.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a7a769c6-0a4d-0e50-f2d7-6556db0fa7bf@linux.intel.com>
X-ClientProxiedBy: BN0PR02CA0023.namprd02.prod.outlook.com
 (2603:10b6:408:e4::28) To DM4PR12MB6373.namprd12.prod.outlook.com
 (2603:10b6:8:a4::7)
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
X-MS-TrafficTypeDiagnostic: DM4PR12MB6373:EE_|DS0PR12MB8444:EE_
X-MS-Office365-Filtering-Correlation-Id: be965d05-aa98-4a03-3783-08dd3186bdaa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?8t0g3MqpIXc1/f5zuK3M53ef+y0pIhb4hEYyPFvWHTnEIVJt07bfZLxHGa?=
 =?iso-8859-1?Q?i+3E26W5UMf81RLYxtAAwt6lHq4mzanrQWap07NuIxbIR5gCNagIx7nkR9?=
 =?iso-8859-1?Q?M/2zEwEsJi7A/qepZPXvaRlObvw8Nfxnx5cKvAObtSII/UegYMbgqwL5Pf?=
 =?iso-8859-1?Q?z42OS3ud+VR0SyOHwtsp3iNo1LBNWB0qYDShHVDwSlCTI7kQr+rdR72mH0?=
 =?iso-8859-1?Q?d5NBaDFJlHXHNym9SHkqtZ1WvS0jRrL9jL1/xGTEObE0G4Uyh7B8bCf2eK?=
 =?iso-8859-1?Q?MHGK+rUcpCTJhSRj/BKyOVW4lp6XeLEE3uMkOMp8pwNa/yuYG0j4rWmXmY?=
 =?iso-8859-1?Q?S4Pmrmj9RiV5DsMG+hMui1xXzp0Kixu7YM+jTXeenTAxiZLTdkwUGAzX7/?=
 =?iso-8859-1?Q?ILlB8+MNLw2QJE7zhyjYeXuJ9v2lxlA48XzliZ4uRKaE2GnquBtiVOC3yu?=
 =?iso-8859-1?Q?Nhck1FnY1qxwOB97Yw8ds9coYmRjK4ahNK5wwNd5/R2Uqn3kcDHqCVR/le?=
 =?iso-8859-1?Q?w+SYpkjp1AVJv+qdM1lP3b/nhZCL6g1q49eVEPnmibg3mpE8iaZhZBlsZl?=
 =?iso-8859-1?Q?5RrSM3XBLixwlZEYZrYamZH2beUy7tCInOGmTt20QYXVc55nOo6s0fAqRE?=
 =?iso-8859-1?Q?y8S5HHQoMDY0AZS1tk2F0ioeUgjFt6na6vOV85rq/i0FKYczJK24toQnu8?=
 =?iso-8859-1?Q?r5uAICOviO1cuSMDEoc2KrGDx/aamgiXtYxZyj2to0PudYFlCtzH7UxOpA?=
 =?iso-8859-1?Q?/0n1N6e6RcUgYUbTbVfwRIRpYASPbVfflsOGTcCLPeFkm75OgSoYok1u7Z?=
 =?iso-8859-1?Q?b7Qc7Zu5FusT53BjCqqiwYOlbtfAFfRUXRby+wgOc7oHTnGy/Sz9ioQiCu?=
 =?iso-8859-1?Q?IzYGYFlAPKZY6aOP+snmVLwJMje84eH6TDrA/qLjwcQh6Ml5Nw+rvdG+KN?=
 =?iso-8859-1?Q?MuyAaV7GCJYp6oZYTSnQrZWMwA1T5DPlVAj17F7fo73J3WCcnN5W2n1qL5?=
 =?iso-8859-1?Q?rXsyI42CqEosdJfK3RXxrJmk/rlbV8OtcxHpdOUy7bOMqbaLgaPdSk8qpz?=
 =?iso-8859-1?Q?jDOs4NSIsNLtCXbe5U86PgsrhgBNPluGGI/zVIWpAfbkGQG675WY5aSxsN?=
 =?iso-8859-1?Q?jezR1ztngM2YRqin99o+jK24nOc/tizt1SjvE8Sj5NGIHJemlQ+UIxbHc2?=
 =?iso-8859-1?Q?zN74Wtcx32bqfPV7X4dagospDWQLocExjtWyNUnBdJ7tm8ij7Lrg65ov6M?=
 =?iso-8859-1?Q?8JeHbOjAd5JeMHzIiyvaxe8COnW8SQsuCpFZu+VtqjLbd4tXHtreVnSDMB?=
 =?iso-8859-1?Q?5wJ1Pl+RFwLkydFuhHlOcG1r1BN46HIIf+W1NqfhZTiCW6JQ3rx8CJsRAC?=
 =?iso-8859-1?Q?TI39ju1RHGv2YZR64ywbgM7neeESZgwmgIGCRc4jtADScknRl2JsRTLgzf?=
 =?iso-8859-1?Q?zsJLdLFfp+fI+i/i?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB6373.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?bC/yaBdKjG5DWB5qNpEoBG4M2pRee905Dy5DxXwLPkMLsVs/BGKM3jZvYF?=
 =?iso-8859-1?Q?FKUVR4oFs6xH9ge3nGmGxD2BIOqn2D3TM0GlA4vHkKXyF1w+/FHr1ZTWmq?=
 =?iso-8859-1?Q?5mFICXqt3XxM2FkYpcxE90RD6/VxL+IkiqNOj8l16akqmzxE3gyKSd06GI?=
 =?iso-8859-1?Q?60F2SLXP4n7UxmLx/I2+OzXYyF+vZBtZXanU4Rmm694gw8bvV00aEnmE20?=
 =?iso-8859-1?Q?AOosLuIF8gZnhnFYSHvvi/4JPeaQlAMvJ9YJGu/7vhbHd3nC2RyEmIKius?=
 =?iso-8859-1?Q?1lit01YeEhc0grzZbWICl2VnYPDkqUAS8eFzEA8dT/um2QLcQMe0jP1YHD?=
 =?iso-8859-1?Q?mPODkhom/bDMUKw4pggniZLTWistwbFTDEVtMhgRmGSOSuppGU2Lkqcgv0?=
 =?iso-8859-1?Q?3Wzo6vEsGqkSCVOLfmd6cFWaESEEg8TJ6o11v9rbJOAZZ3JffpGXRYIuM4?=
 =?iso-8859-1?Q?zcI0glCyKopiulRH6kxuBUbwYFXPin+zfAOcaJwIqFL03GeD8MeWacWFS4?=
 =?iso-8859-1?Q?ZcLSiduqYWErkGCNDdVix8Y6LLHZDi7Y0g1QHotvbQ538xww4GZVIv3FmM?=
 =?iso-8859-1?Q?j9Xd8aflVeIJa+q2rzZoFGCBv4SpiihnDd6BvjiKIGoC+Fv4fUxE3VZUqJ?=
 =?iso-8859-1?Q?JmfqHVCy42Jo/ek0jHp0kTgBKnryF3EkSPEeeoelztomVCpJPxim6VE8et?=
 =?iso-8859-1?Q?shVPHVINlo8hvFUHiEsC8WcnKhv9p+xmK80JL7CN4cqx0hmhrCNz+K1hZV?=
 =?iso-8859-1?Q?t5/CUgIbtV0LX6hZ2YtEeWS/3Pu6ho8ES1P9YrzIFkK3rtw4Q1UIQ5beQm?=
 =?iso-8859-1?Q?eUQq5iz3SVYZD1VE+juSjYsVm3JtgH0FSXNVrSZ1GTAC9GxXTprT85Co3n?=
 =?iso-8859-1?Q?VlABDJLCMfhFuOwjTR1gWHXAFNuLFTkUbKeostDxLofxdSWC+qdxWLih1s?=
 =?iso-8859-1?Q?LaCamXIIUlFy60Gg+V41z5nxmRrVG5Ud+DQRIJN6pcB1cVEVpNMmjI0Kmh?=
 =?iso-8859-1?Q?u8l+lTo7rA/pBpl3BUe8mr9asAacaF5VxNusDGqHZPKzbFVG7dAhA1g/FR?=
 =?iso-8859-1?Q?4guVG5onZE2gvrbSSyrtD3o6aR5JCHW4M4SYLLRa+CI+MbT1lWbch4OK3U?=
 =?iso-8859-1?Q?zHrSlGqksp/qOFIVeyvnD19SpT2MZeEBRFNHSCcCRolajJJbdUAyI7aTvT?=
 =?iso-8859-1?Q?Rgv3WT1Tcwr1qeNeTzqYfdpdN3imoWAwRdmRk7XqJZMbKUiNJc489gh0GM?=
 =?iso-8859-1?Q?g4FfMdixMxnZ5B7FbDRwYnnOY/2/jDwplOabgT+y0SVzgZ0Wh+VTmbnbkt?=
 =?iso-8859-1?Q?6WN0Rkwpzzce1y9xZWoRSzIrKyENGrm+JK7hDx0lDA8ist4FhtvHPBafyw?=
 =?iso-8859-1?Q?sxOtYcNcOuhdTdORxepgULQqt6vmEgXf6hmB1Qc3BohuLR1JLyYYdVaHV9?=
 =?iso-8859-1?Q?cd55DTeD+B0c/GmhdD24IQ3PHUHZYoEeELTXVyc8Gy74kHGG6rUWhcdTEk?=
 =?iso-8859-1?Q?cfcYlJuF91tHFWlIkAiPhs8OkjYV3OS+ziyL3Z2MgbXWnF+4Z3mAW3As3E?=
 =?iso-8859-1?Q?cXYKEYuMddkGPtyKYot01Cyybc62sYUUhHsawG3/+nV1fgpmCcc1/XdIAr?=
 =?iso-8859-1?Q?HCiTsiRt5mBaklkXZk+SM+8aF8DuXIBGZ6?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be965d05-aa98-4a03-3783-08dd3186bdaa
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6373.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2025 14:54:53.5647
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ttXiTYbXYbDMfMQ7/gPWOvfFJ0foBpi31ury4dZzSZzB15n5OtrtS5aJwbCvL8vPvTtwHdBCFuK7DQnpx7EHKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8444
X-Spam-Status: No, score=0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_INVALID,DKIM_SIGNED,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Thu, Jan 09, 2025 at 11:36:17AM +0200, Ilpo Järvinen wrote:

[...]

> > > -int pcie_read_tlp_log(struct pci_dev *dev, int where,
> > > -		      struct pcie_tlp_log *log)
> > > +int pcie_read_tlp_log(struct pci_dev *dev, int where, int where2,
> > > +		      unsigned int tlp_len, struct pcie_tlp_log *log)
> > >  {
> > >  	unsigned int i;
> > > -	int ret;
> > > +	int off, ret;
> > > +	u32 *to;
> > >  
> > >  	memset(log, 0, sizeof(*log));
> > >  
> > > -	for (i = 0; i < 4; i++) {
> > > -		ret = pci_read_config_dword(dev, where + i * 4, &log->dw[i]);
> > > +	for (i = 0; i < tlp_len; i++) {
> > > +		if (i < 4) {
> > > +			off = where + i * 4;
> > > +			to = &log->dw[i];
> > > +		} else {
> > > +			off = where2 + (i - 4) * 4;
> > > +			to = &log->prefix[i - 4];
> > > +		}
> > > +
> > > +		ret = pci_read_config_dword(dev, off, to);
> > >  		if (ret)
> > >  			return pcibios_err_to_errno(ret);
> > 
> > Could we do two loops? Sorry if this was already discussed.
> > 
> > 	for (i = 0; i < min(tlp_len, BASE_NR_TLP); i++, where += 4, tlp_len--) {
> > 		ret = pci_read_config_dword(dev, where, &log->dw[i]);
> > 		if (ret)
> > 			return pcibios_err_to_errno(ret);
> > 	}
> > 
> > 	for (i = 0; i < tlp_len; i++, where2 += 4) {
> > 		ret = pci_read_config_dword(dev, where2, &log->prefix[i]);
> > 		if (ret)
> > 			return pcibios_err_to_errno(ret);
> > 	}
> 
> I'm not convinced splitting it would be clearly better. After the flit 
> mode patch, only variation that will remain is the offset calculation 
> (extended ->dw[] entires will be overlapping with ->prefix[] using union 
> trickery so I can just use ->dw[i] in the loop).
>

Ah okay, no problem.

> > >  	}
> > > diff --git a/include/linux/aer.h b/include/linux/aer.h
> > > index 190a0a2061cd..dc498adaa1c8 100644
> > > --- a/include/linux/aer.h
> > > +++ b/include/linux/aer.h
> > > @@ -20,6 +20,7 @@ struct pci_dev;
> > >  
> > >  struct pcie_tlp_log {
> > >  	u32 dw[4];
> > > +	u32 prefix[4];
> > 
> > Another place for "BASE_NR_*".
> > 
> > >  };
> > >  
> > >  struct aer_capability_regs {
> > > diff --git a/include/uapi/linux/pci_regs.h b/include/uapi/linux/pci_regs.h
> > > index 14a6306c4ce1..82866ac0bda7 100644
> > > --- a/include/uapi/linux/pci_regs.h
> > > +++ b/include/uapi/linux/pci_regs.h
> > > @@ -790,10 +790,11 @@
> > >  	/* Same bits as above */
> > >  #define PCI_ERR_CAP		0x18	/* Advanced Error Capabilities & Ctrl*/
> > >  #define  PCI_ERR_CAP_FEP(x)	((x) & 0x1f)	/* First Error Pointer */
> > > -#define  PCI_ERR_CAP_ECRC_GENC	0x00000020	/* ECRC Generation Capable */
> > > -#define  PCI_ERR_CAP_ECRC_GENE	0x00000040	/* ECRC Generation Enable */
> > > -#define  PCI_ERR_CAP_ECRC_CHKC	0x00000080	/* ECRC Check Capable */
> > > -#define  PCI_ERR_CAP_ECRC_CHKE	0x00000100	/* ECRC Check Enable */
> > > +#define  PCI_ERR_CAP_ECRC_GENC		0x00000020 /* ECRC Generation Capable */
> > > +#define  PCI_ERR_CAP_ECRC_GENE		0x00000040 /* ECRC Generation Enable */
> > > +#define  PCI_ERR_CAP_ECRC_CHKC		0x00000080 /* ECRC Check Capable */
> > > +#define  PCI_ERR_CAP_ECRC_CHKE		0x00000100 /* ECRC Check Enable */
> > > +#define  PCI_ERR_CAP_PREFIX_LOG_PRESENT	0x00000800 /* TLP Prefix Log Present */
> > 
> > I didn't think to mention this in a previous patch, but could/should we
> > use GENMASK() for bitmasks updates? I know it's a break from the current
> > style though.
> 
> Bjorn called himself "a dinosaur" when it comes to GENMASK() :-):
> 
> https://lore.kernel.org/linux-pci/20231031200312.GA25127@bhelgaas/
> 

I'll try to remember. :)

Thanks,
Yazen

