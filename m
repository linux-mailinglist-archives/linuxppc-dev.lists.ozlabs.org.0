Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E6C5E90B379
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Jun 2024 17:09:01 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=selector1 header.b=d48h1cDf;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=selector1 header.b=d48h1cDf;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W2tZL4qjDz3g9M
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jun 2024 01:08:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=selector1 header.b=d48h1cDf;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=selector1 header.b=d48h1cDf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=2a01:111:f403:260c::61e; helo=eur03-vi1-obe.outbound.protection.outlook.com; envelope-from=szabolcs.nagy@arm.com; receiver=lists.ozlabs.org)
Received: from EUR03-VI1-obe.outbound.protection.outlook.com (mail-vi1eur03on2061e.outbound.protection.outlook.com [IPv6:2a01:111:f403:260c::61e])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W2tYY2PLvz3dL2
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jun 2024 01:08:14 +1000 (AEST)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=Fls1h7gxckqXgwS+KE88HOkekfZhtPD0B3QTbO8R2e4FbpEqnNM/oCoxBW1CcxpIsy/GCmo/eJcOh8cCgRqjOjIrb+9VNTekuSr6nLDzgPm3ydYcx/+G/YXVNkqO8bmRFAkZlVbRVwmujTotuMCyDgm9sVFonm77ycWnDckOSzJ7NAIzRZ6Bf5fXLAjef3r/sQ3s5QenNgQ7l41y5K0Qq/Mndpi5OrwZ4rg4TFpc0T3Gt6zDjK4M8W2yE9OSaDaZGRdYYgDugTfSDqSoq1Mn8CnliP5j80C1Xtoe3NzPdKTXSlpmEIrRLxy2qG6LaRBzbX4dqgWHXo9mFLhKB62Opw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3fneA06B+c6m57sZjcFjdKPhgm0kBE1zed7nx9xPdFc=;
 b=kdmvbRnns+GbOu5PhmuG7onXvxWnBq18sAK1waSJy15o7geG7tHO4qgbOamEkIUJ5g55IeY96BV9EfpzobKM33LVNKlUtU9whUz0gZ9FvEBzWe0OXCcAVNVGGZCGuiWWYBtefSPFTgoly3uLaHNkgDXKvDzWhM+W7/usZOOAE4LPWb3IYD5fKkERY0ucWybMGdCtoLdhcaPCkf/RVcXvyU8QPnkEp0SFPJgzByT6mvGsEbV0QKME1UUjP5qE5Y1srjbDJnMmWPrdLUz6Z6t3iPJUZDI4qmcJX8HdCSMRnKJTM6VsjMDI/77aixZA3lWNmZBiui3G0updTXGMxndorg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.ozlabs.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3fneA06B+c6m57sZjcFjdKPhgm0kBE1zed7nx9xPdFc=;
 b=d48h1cDfztLIzGtU8x2M9xrT0PoYiJCsDXfXCjVOFxxr0NljAhHgFSc6gy+xHfvlgFOYZhJmBJmwmHtEIeZMgpayDb2P8mj9qEoCJ3V6VvifOVEhMYEiBxaJztczmg1Ny3LKv23Er/1uRF0k4Pz+5b2io81rj7s7mIs4rhxFt48=
Received: from DB3PR06CA0016.eurprd06.prod.outlook.com (2603:10a6:8:1::29) by
 AS8PR08MB9147.eurprd08.prod.outlook.com (2603:10a6:20b:57e::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7677.30; Mon, 17 Jun 2024 14:52:04 +0000
Received: from DB5PEPF00014B9A.eurprd02.prod.outlook.com
 (2603:10a6:8:1:cafe::45) by DB3PR06CA0016.outlook.office365.com
 (2603:10a6:8:1::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.30 via Frontend
 Transport; Mon, 17 Jun 2024 14:52:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5PEPF00014B9A.mail.protection.outlook.com (10.167.8.167) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7677.15
 via Frontend Transport; Mon, 17 Jun 2024 14:52:03 +0000
Received: ("Tessian outbound f73a80402c83:v339"); Mon, 17 Jun 2024 14:52:02 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: d418c34d31778aca
X-CR-MTA-TID: 64aa7808
Received: from caff7b950603.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 1CC8B1DF-C890-4039-9B5B-65E99A14EB8D.1;
	Mon, 17 Jun 2024 14:51:52 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id caff7b950603.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 17 Jun 2024 14:51:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vvj4AwIiu79WehRpoK1NIQjP7krJkxZlHQ3X3suzOOGIieecQ8cM5ovBXYPw47AN8zcoZ5eheEURg0ZeB8RKdqTRHFrLGakkp7jHWYSdiq3mVb9uFV20SGykN/AsHmu+Pihh4DHW+YPnvcfLTxlTnzsB6XbKUNi3xOQ7YdZkKQ1jhCbOc5sqnbcYzaFVTNy06iMufNOxaHiwNVg9iSnRsycsgt/KXLsSfVDMZkHT/n84AWr7DWdPxHCVqolSth7KcWViAdpwArdaTQIF0f2voYr52uE3W62dDmFqaMy8WFbbPcivmmYUwgeVbrIuBJwWfBPGGielTOHHbfJb2SMMfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3fneA06B+c6m57sZjcFjdKPhgm0kBE1zed7nx9xPdFc=;
 b=UkDoc/mkKnB/orVzvPU1qv2bpaMgS2khDKELMNdrXj62DkniBDnbK/WAYFSUrN+AgzVyWgZGH/Vxxo/rMkT8uNyuVg0RN8rufyJk8MUTTMLzc03l/RVvD46xPtf+SRTZoAKeb+PLdGhegjlhXpi8V06RaBKURNbZ6tjmHITKnyyPyTtei64rsXK8E19NAF6cQN8LSY/3TCYALl3YriL900nnhGsdKSOxO82YrgRHvE4XQYIYdhxvPbB8A/Ox8nwMgNHvWjToNEnUEsvPEOFKMSnY3DrcC3BLN1GOFQVZ+yuqWZkzdUt/gl6mXAJmZx3NadkS84++iX5sAtO7Ayg64A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3fneA06B+c6m57sZjcFjdKPhgm0kBE1zed7nx9xPdFc=;
 b=d48h1cDfztLIzGtU8x2M9xrT0PoYiJCsDXfXCjVOFxxr0NljAhHgFSc6gy+xHfvlgFOYZhJmBJmwmHtEIeZMgpayDb2P8mj9qEoCJ3V6VvifOVEhMYEiBxaJztczmg1Ny3LKv23Er/1uRF0k4Pz+5b2io81rj7s7mIs4rhxFt48=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from DB9PR08MB7179.eurprd08.prod.outlook.com (2603:10a6:10:2cc::19)
 by DB9PR08MB9516.eurprd08.prod.outlook.com (2603:10a6:10:451::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.30; Mon, 17 Jun
 2024 14:51:50 +0000
Received: from DB9PR08MB7179.eurprd08.prod.outlook.com
 ([fe80::7d7e:3788:b094:b809]) by DB9PR08MB7179.eurprd08.prod.outlook.com
 ([fe80::7d7e:3788:b094:b809%6]) with mapi id 15.20.7677.030; Mon, 17 Jun 2024
 14:51:49 +0000
Date: Mon, 17 Jun 2024 15:51:35 +0100
From: Szabolcs Nagy <szabolcs.nagy@arm.com>
To: Florian Weimer <fweimer@redhat.com>
Subject: Re: [PATCH v4 17/29] arm64: implement PKEYS support
Message-ID: <ZnBNd51hVlaPTvn8@arm.com>
References: <20240503130147.1154804-1-joey.gouly@arm.com>
 <20240503130147.1154804-18-joey.gouly@arm.com>
 <ZlnlQ/avUAuSum5R@arm.com>
 <20240531152138.GA1805682@e124191.cambridge.arm.com>
 <Zln6ckvyktar8r0n@arm.com>
 <87a5jj4rhw.fsf@oldenburg.str.redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87a5jj4rhw.fsf@oldenburg.str.redhat.com>
X-ClientProxiedBy: LO4P123CA0670.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:351::16) To DB9PR08MB7179.eurprd08.prod.outlook.com
 (2603:10a6:10:2cc::19)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: 	DB9PR08MB7179:EE_|DB9PR08MB9516:EE_|DB5PEPF00014B9A:EE_|AS8PR08MB9147:EE_
X-MS-Office365-Filtering-Correlation-Id: e6bd9875-12ae-4102-05d8-08dc8edd0cf6
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:  BCL:0;ARA:13230037|7416011|376011|1800799021|366013;
X-Microsoft-Antispam-Message-Info-Original:  =?utf-8?B?aFRmaTJUaEplZjIxcFdMam1JUU55cmdUVzdvMlBob05mc1BsNGVRVHUvYnNH?=
 =?utf-8?B?WWtGck4va0kxKzhqNzltb3ZtakNUVVAxWUE5czZIN0J5eHN2ek5lUGExUTd4?=
 =?utf-8?B?U096VlRJdS9nTGlXdmFYQlhXVVRRMnNlTVE4S1RwUlFlTnkzS0crMVpKbjg1?=
 =?utf-8?B?SENEQmFoODdYcW5pVjNlemRJNmtycU5KeEpET2NHSUxwc1IycFJCbk1oZGZr?=
 =?utf-8?B?RWUrRWlYYTI3eGlqTEdFeDl3Y2NRSlp0ZVp1ZlZ1QmpyODdYakE0ZzRCTnZE?=
 =?utf-8?B?cHBnVktXZGZFSzVJeFdqbEhkaE5ZNm12OU1ib0NDdFdNU3M0NTFqQnhTWWRk?=
 =?utf-8?B?TG5OeWhXcDl4YTZkSFJ0TzFNTXV2TjVPdHdaaEtubStQNlkzeStNREVZYUVG?=
 =?utf-8?B?NXBxUU1NYlJxdExrU0VsMVl4RDQ3eDN0MlRhMFRYNGtoVlJLVHlpU0tMdXRY?=
 =?utf-8?B?WithUTZyU0Z4TnB3MG1RTStPVEY0UE1vTzNlM2U2aXVlKzQ2WGFQbEVZdVBj?=
 =?utf-8?B?VUduZDJiVnVndk84NGpPVDFlODRYRzB6dWU5clFnWFcwMFoxaDVMWmpiTDhS?=
 =?utf-8?B?QlhGYXNZTDVORklHR2Y2bGozeXliQkR5WXd4d0ZXa3o5aTUwWE12U1BQRHVB?=
 =?utf-8?B?b1h3cFZ5SE0vT1dvV3pMdFF4RlpVT2VtekM2dUszUFBReGtWeGZJVjR2eGRQ?=
 =?utf-8?B?b3hZK1M2amh1UHMwN2liQk1PMFVMcHhEa09NVk0yWkRTdDFsR0Jtam9tVHdn?=
 =?utf-8?B?VDE2MzRpaGlXbzI2SGJQNEt5R1BPRitSTUVZTWQ1dGRKeFgrbzhFRWZOWkRq?=
 =?utf-8?B?amRqcHJtbVpFT1ZKUVFBcUJxbndhczU2elFDY1M2L2RDVTdkZU96M09TUjJQ?=
 =?utf-8?B?YXc3WmE0RGJ4Tm90bmtrbFBJU3cxckZRL3pSbCtPU0swa2pFR0dNdXFBb3k2?=
 =?utf-8?B?UlNhaHIyMnlNVm9CQUw4MzlRM2YxdnQ4WjJvaVVqYXozRkNxOXlOWWM5RWJX?=
 =?utf-8?B?K2d5cXhhWlovRWZnWVoyMXJYSzJFWU1jZFZLTGs4c0wwcGhLZHJtWTAzQUNP?=
 =?utf-8?B?T1N6ZHZCZFQrU3FxMFRoOWVNeW0wNXhpZGErMzZseHJLNUxuY011bHhENFFR?=
 =?utf-8?B?KzZMUHJZeVVhd2ZNZzVTVStLQzcvTHNyeXRxWGlTdERyQW5Nd25KaGNHRy9Q?=
 =?utf-8?B?ZjhwYUZHK1hmY0s3ekxQMmV3eGExeWR2aVI2VkR6Z3o2T0liUE1qOW9sNlpa?=
 =?utf-8?B?WStidE44QnIzOTFZcXgvbmd1RkRYWkJVVTZIc2ErcmdCMnNnSkhNc2RvdmJo?=
 =?utf-8?B?aFMyNTJuQzZLVSt6ZkZSNkQ3VTY2NHhkVG5JNXVoY2hEby9zcVl0QUwySS9i?=
 =?utf-8?B?Skg0MG5KNVdrNFJkNExiVEI4NHkralFhYzdFRWFVUVNIeGgwSmp1VHpGUXR5?=
 =?utf-8?B?a0xNWnMwRytQZjdMa0lWRE1NMnJIWHNhT1BENW1wbWtCT0hjK09Jd1k1QUo5?=
 =?utf-8?B?azNlV3hKT2RFQnZFNHVyeDlGVXhENFdFMDlKclFhRzhWYmFaeDcwMkdxQW5t?=
 =?utf-8?B?T1pLQXptSlF0RjNmOVlCUFBCNHRFZG1Qckw1Qjcvd0QxeU40YVVBVENaN3Az?=
 =?utf-8?B?cFBpK0ltM1lBOE9LSVdPMWd5eURpQiswVENKaFFEMmluWUF6dDFnb2RKTWRG?=
 =?utf-8?B?SEkvenNWbU5CYk13YzNMOU1IeCsxVDR3MkkrbThZRWIwVC9BSG0xcjRLaXNh?=
 =?utf-8?Q?Vder6hzHj5VCHYs4sh7nyEzdOSSCF+Z6HsOvLRQ?=
X-Forefront-Antispam-Report-Untrusted:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB7179.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(7416011)(376011)(1800799021)(366013);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB9516
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:  DB5PEPF00014B9A.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 	1225ba1d-eae0-438c-5019-08dc8edd04b1
X-Microsoft-Antispam: 	BCL:0;ARA:13230037|36860700010|376011|82310400023|1800799021|34020700013|35042699019;
X-Microsoft-Antispam-Message-Info: 	=?utf-8?B?SStkR0pIYWR0bXV2UytzQzgyWFpNTlpEUkRaQmZTN3JkWGMxejhYUTUxNkFq?=
 =?utf-8?B?c0Y4cGY3d3hsNkJzNUY4eW4ydGkvbDg0R0JrREt2K3RjUTNScnRMRzFBcXFm?=
 =?utf-8?B?a2x6QWxPRndvWVVtVkFVcElPVEk5MW42NFpsWkJwV3ZBM1dTK09oV0lxUlhR?=
 =?utf-8?B?L0l4SHVVZG10UmFncTBzcFBzM2djeXd0dWMzaURacVhOcTdpNG9mOFhFWlpE?=
 =?utf-8?B?aU1JVWtTZ2VnQjVQTzF5KzZSekVrcXluTlNldFVvWDZxc3gzK255M3YxSm54?=
 =?utf-8?B?dVBJRjFKdVpqT3ZGRFh1RHlpeEZZY2VubHR1VEJxdzNwcXJMWWZqMmFEeXN2?=
 =?utf-8?B?N2tlc2U3WEdWSXFoWHhqTUU2U2Q1UHBTc3d5MFZHeHJ4VzBuZzEyOGJBaDE1?=
 =?utf-8?B?aTlITXlvVkowRk9QUWJYVE5OajZhVll2ai9KZVhhYlJPclZvdXE4Q1FTalJ6?=
 =?utf-8?B?SlI3ZUkvMGk1cFNkbS9rQlFPbWJtaXIrVzYxQmxDTm40dWNWa0d3aXdlMHFP?=
 =?utf-8?B?ek9ueTFlQmNoL3l5V2V2dDV1WEdSTUhLWkZPNm5qUFl4a2RKQVZLNWJtZHFV?=
 =?utf-8?B?VVdkZUcwRHRRT2JXS1diYkFSR1FSVDdtMi85bU1zTkRpZVJUeFJvbVRKeVc2?=
 =?utf-8?B?YWRRNGxYNjVsTHBoUXhnTW5XMGc2VTZEVzk2cWpVSTFVWUtVZytmdkZDYXRm?=
 =?utf-8?B?bTUvcDdZbk5VTVE3S0txdU5XOXc1VWtNZUcyak9yUEg5bW80MElBUDdIRm1K?=
 =?utf-8?B?WXdpKzhnaUFiQWZSTmowQ1RMYTZUalJmV2s3bTlXSzlwcVp2VDREVUVyOFBw?=
 =?utf-8?B?ZTdSL3FOeHkvalBYdmVQV0MzVnFLam43SVJIQmZDdDd5bHUxcjU2Q0FnVW9w?=
 =?utf-8?B?UExzN1hCbTMrSnNSZFRYZXJSdTUvT0crNVhscUYxMzJ6ZHFxcWE3YmFzMVJI?=
 =?utf-8?B?QnRhTWVjZm1SOE8wRmQ1ekZOOWtZdyt2QnJGdnN5NU1ZRzkwMy9OazJCR2k0?=
 =?utf-8?B?VzhERW55bXBUOWVGT1Nwb3pXemdmK3lFSGZ4dXh1YllKNUlacTJYK0FBaFV1?=
 =?utf-8?B?RmNYSWxnT1VaTmxMVHUzT2RxM0t0akhuYUliSlJ5T3BUMEtxQTR3aTkyRFBn?=
 =?utf-8?B?OW9CRzBpVTdFQ0U3R1l3RFBKc3lLZUtEbGdyOUkzNlhJMlRvRWg4T1ZDdFNW?=
 =?utf-8?B?cXBTSXprei8zellYQTJMMG83a0lrNkxyRFJnNkR3N3BiNi83RWVZeFZ0eUJY?=
 =?utf-8?B?UVVKNEF3enhSK2FRcExXL2dTV2c2dExYTnFwSGtiWjZuZGZ4eHIxUElPSGJa?=
 =?utf-8?B?TzFLLzAyWmdTN245Y3dQR0l6eG5wTnpQamJOMzN3Z25vbTA2ODB6UDAyMW5u?=
 =?utf-8?B?USs5dnJHelRYK3RWTHoycDRqMlVrU0hid2RsbW04SnF0SmliYzFPcDlOY3lo?=
 =?utf-8?B?Qlh6ZW85QWNQa25OM2txZ1JEYkt0Ti9hT0lOajFqbm44QWd5WVNSVDdhaGZP?=
 =?utf-8?B?Z2l0VFI1VVZvc0VFbGJFYlZya0lISUlCRmVxNVRFbDV6UVVWcDd0d1ZFaGEr?=
 =?utf-8?B?Y0g0RVBvVVR5Wjg4M2RleWppQU9vQmtHcmR2TFN6K1BVb0F2VHp3UW5MZXh1?=
 =?utf-8?B?b2dNSHIreTJGTU1WaE5DT1pldWpnejRqUGlqaW5jUERYNmFNd3pobVdwQ3h3?=
 =?utf-8?B?ZVVaUHQvOVNjVGU0NDRTSlhVZkNWYTZ0ZzBGM3hsRGdoZ1pBbFhBdmQ0WUpt?=
 =?utf-8?B?T01VcUZXRnFsdkd6MmZkaWI1d0Zka3JXMDhnR0dHYzJpSlppYmREYU44L091?=
 =?utf-8?B?Tm9oUlZmdDBoWmJ5TlNnV2lJY2xTcGZZMWhPeEE1b2c2ME5YUWZZeit4a2FZ?=
 =?utf-8?B?MHQ5MUFUOU11dHcraHY4V05hMVMraEROUVgyZGtBQmhEZVE9PQ==?=
X-Forefront-Antispam-Report: 	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230037)(36860700010)(376011)(82310400023)(1800799021)(34020700013)(35042699019);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2024 14:52:03.3478
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e6bd9875-12ae-4102-05d8-08dc8edd0cf6
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 	DB5PEPF00014B9A.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9147
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: catalin.marinas@arm.com, dave.hansen@linux.intel.com, Joey Gouly <joey.gouly@arm.com>, linux-mm@kvack.org, hpa@zytor.com, shuah@kernel.org, maz@kernel.org, x86@kernel.org, christophe.leroy@csgroup.eu, aneesh.kumar@kernel.org, mingo@redhat.com, aneesh.kumar@linux.ibm.com, naveen.n.rao@linux.ibm.com, will@kernel.org, npiggin@gmail.com, broonie@kernel.org, bp@alien8.de, kvmarm@lists.linux.dev, tglx@linutronix.de, linux-arm-kernel@lists.infradead.org, oliver.upton@linux.dev, linux-fsdevel@vger.kernel.org, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The 06/17/2024 15:40, Florian Weimer wrote:
> >> A user can still set it by interacting with the register directly, but I guess
> >> we want something for the glibc interface..
> >> 
> >> Dave, any thoughts here?
> >
> > adding Florian too, since i found an old thread of his that tried
> > to add separate PKEY_DISABLE_READ and PKEY_DISABLE_EXECUTE, but
> > it did not seem to end up upstream. (this makes more sense to me
> > as libc api than the weird disable access semantics)
> 
> I still think it makes sense to have a full complenent of PKEY_* flags
> complementing the PROT_* flags, in a somewhat abstract fashion for
> pkey_alloc only.  The internal protection mask register encoding will
> differ from architecture to architecture, but the abstract glibc
> functions pkey_set and pkey_get could use them (if we are a bit
> careful).

to me it makes sense to have abstract

PKEY_DISABLE_READ
PKEY_DISABLE_WRITE
PKEY_DISABLE_EXECUTE
PKEY_DISABLE_ACCESS

where access is handled like

if (flags&PKEY_DISABLE_ACCESS)
	flags |= PKEY_DISABLE_READ|PKEY_DISABLE_WRITE;
disable_read = flags&PKEY_DISABLE_READ;
disable_write = flags&PKEY_DISABLE_WRITE;
disable_exec = flags&PKEY_DISABLE_EXECUTE;

if there are unsupported combinations like
disable_read&&!disable_write then those are rejected
by pkey_alloc and pkey_set.

this allows portable use of pkey apis.
(the flags could be target specific, but don't have to be)
