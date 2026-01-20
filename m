Return-Path: <linuxppc-dev+bounces-16083-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CLnkJ7UJcGlyUwAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16083-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Jan 2026 00:03:17 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B4F864D709
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Jan 2026 00:03:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dwjXy15rZz2xrL;
	Wed, 21 Jan 2026 10:03:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c111::5" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768950194;
	cv=pass; b=ILSnPSJoWWVVFICwJ3ZlTPiwujyzKiKCcCwxFBJS9bcSb2s9qdNhEY4F6uR/7EPLK3UhsDLTbU660JjWNeVE6ycvfNpQS8YHfVKR/S98ePedN/iFpiYdSvGbLqT5+Tpl6GtpVHRb0X8Y1CzvZM8vLbiS4n8zhpHv+cv5hcHDUmd0abuSMbt+B73BfsAqEevYgNzXBr3iB3U3wcicteu+1DxN+WvTYjPZV8C7nkZJNp0NLr+2jUKpeKbyQwgF4ulWfefRZalRCyvvJO/jAO9bT6mdyf70PhOTkcdJwm/5VFDBIT69TxIv2F+m1wNf3bE/Henk3IQvE4TsZ5pCpCUCyA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768950194; c=relaxed/relaxed;
	bh=qfI4ksFsqdaJEwVOlr/HZSFYGEua3NQnn/TaEy/Jueg=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=kB8R5cw2+8fcO8N7F6lwJms008LsYEGopvVSsNc3EcNlibR+9rwo4gC1huTw97LZMWLPm0RSF3wLzCE6Paryi9LMz5Ief2l0fAtSGzMnV5FYlN/CKZOkY46CTy63tDpDO7Nlq1gdAdQNxJSM8LLpxx6HrfppBzNpFHA/4oRLxJuE40Gb2+R7vE4EUm9QbP+0DQBasqhjsKqckcztcWABuSaCAMKBIQ0BMNQ22NiStKLPwtexpEkj++sJ08u0+wFurVdxDATWqodBALFfS9VVHre86QevZGULI1+jQK5pW6yf+CZzukdX50fHJqbmbVx06F/scXGR/BK09fbBEbNyeg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=ei5PoZf0; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c111::5; helo=dm1pr04cu001.outbound.protection.outlook.com; envelope-from=jniethe@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=ei5PoZf0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:c111::5; helo=dm1pr04cu001.outbound.protection.outlook.com; envelope-from=jniethe@nvidia.com; receiver=lists.ozlabs.org)
Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazlp170100005.outbound.protection.outlook.com [IPv6:2a01:111:f403:c111::5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dwjXw3xtWz2xjK
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Jan 2026 10:03:12 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b7V7nDWGu6U1t/b6MtiirGTH056gRfTEA3ouiIBdTReAcwFIZ+geFLW7bBSzbHZXthjELuQueIpE8qDbh84nBaI/VfFHGBia2Ijw4yFwE00sOYjVpYSFSYbhoCdyKgmg47NlyXP6U7Rc5vsSHkgjS+KwJH2WTTU/WOVYRwqgIx5AiafPHLqe5oraO/w2WnKXFbgMNzfaGMNa4u1wUpXSQJh/Kir7I6A8ANRj0IyWGmDqyalgqag1RRAsnmqnMVoD7rxZTSEtCjPFo8OiVVV1suji1A10whiWsv2ZCOzCKqPgyv1u6UoAUcDTbvIxKoGkWNeJzyFH9Mv4fFHyD/Ni9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qfI4ksFsqdaJEwVOlr/HZSFYGEua3NQnn/TaEy/Jueg=;
 b=wpnnwzFUt8lHNA/Ht8PchZ1WpMy870xQF9AwUqbv/fFUAgbU57Jc1LqXCxUJWCmCJjGPyUihiFu1qwasUW2eNpzV6gAtV2MfV3+tPlPucdqF61elLdvZtGxe/SPKH/02YAin1PhHpJgTF/v/yV52nlsfU36Jpe4rQtQHrOWA6IwR/WephLm32bRMy5xdU3wXyruZk7tWl6ok8akfcF9jxhg/CVsva4fLvltQW8u9sHHOMANVwQEpKRzpDpd748wXhKWl5yamLBjqSMX+UwmHFEZqlzPQRiaD6oq+4OwRhnGRbhkR3L5x6qXfW8btm7MH8se4/IDIWPmx++mNCS7bfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qfI4ksFsqdaJEwVOlr/HZSFYGEua3NQnn/TaEy/Jueg=;
 b=ei5PoZf0RJtURSmJxEg8WsSsC6jaKAa8C9UWe+yczKo8PIIE7vBysQWq+S7ByMILEnEoZWg4K6hhk5j+P3eAhbtscoLwUOJQiYp9IpAm6NKrJAMAINA9diRNwZZ90xQbo1yl7AdhDz2fLaLGX6tLW9Mln3uEnE25eB6208x1EW5LC3K9uP9fhzHuzKyIEOxwQMWYVCqHqozoMIYJCSlccezO7M93jwCHhWIF+FGCsautbnfmPMPMGwVyPG0F/y6iUj84oLBybkiUGUmWCSXLPlMGLD4AVDU1D6GsnK0gPmLMGsVipagx3VLR5bTrQJ2Z0uD/Bwnz3j2zrZAEfOv0nQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB9072.namprd12.prod.outlook.com (2603:10b6:8:be::6) by
 MN0PR12MB6366.namprd12.prod.outlook.com (2603:10b6:208:3c1::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Tue, 20 Jan
 2026 23:02:48 +0000
Received: from DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1]) by DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1%5]) with mapi id 15.20.9520.011; Tue, 20 Jan 2026
 23:02:48 +0000
Message-ID: <fd4b6553-3e9e-4829-a12f-51d29a5d7571@nvidia.com>
Date: Wed, 21 Jan 2026 10:02:40 +1100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/11] mm: Remove device private pages from the
 physical address space
To: Zi Yan <ziy@nvidia.com>
Cc: linux-mm@kvack.org, balbirs@nvidia.com, matthew.brost@intel.com,
 akpm@linux-foundation.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, david@redhat.com, apopple@nvidia.com,
 lorenzo.stoakes@oracle.com, lyude@redhat.com, dakr@kernel.org,
 airlied@gmail.com, simona@ffwll.ch, rcampbell@nvidia.com,
 mpenttil@redhat.com, jgg@nvidia.com, willy@infradead.org,
 linuxppc-dev@lists.ozlabs.org, intel-xe@lists.freedesktop.org, jgg@ziepe.ca,
 Felix.Kuehling@amd.com
References: <20260107091823.68974-1-jniethe@nvidia.com>
 <20260107091823.68974-12-jniethe@nvidia.com>
 <36F96303-8FBB-4350-9472-52CC50BAB956@nvidia.com>
 <c9afedc6-f763-410f-b78b-522b98122f06@nvidia.com>
 <6C5F185E-BB12-4B01-8283-F2C956E84AA3@nvidia.com>
Content-Language: en-US
From: Jordan Niethe <jniethe@nvidia.com>
In-Reply-To: <6C5F185E-BB12-4B01-8283-F2C956E84AA3@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY5PR16CA0027.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::40) To DM4PR12MB9072.namprd12.prod.outlook.com
 (2603:10b6:8:be::6)
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
X-MS-TrafficTypeDiagnostic: DM4PR12MB9072:EE_|MN0PR12MB6366:EE_
X-MS-Office365-Filtering-Correlation-Id: 3244da34-8226-4e5d-5719-08de58780765
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dldGOTIrTzNlaS9ja3lqOW81cEx3WW8yc1BBbkNXd2xJblJLUDlzTnlsQ3FM?=
 =?utf-8?B?WUtWdGlUa28vZFdGd1ppeTBCMlNsSVB1NkZnQjEzR1I5YkF6aWtiaWN5emJH?=
 =?utf-8?B?L2RvbXExcnF2bWE3d0FHd2IwMDR1SHRiNmwyaWc3QzJXTzk1VkRBSEVyWHgy?=
 =?utf-8?B?M1U4MzYzUnZjdElHNUk3Ti9KUjVpTFdmNlZqa3BTVVZCOFNMTnYraCtQYzhn?=
 =?utf-8?B?dUJweURmUDFYcGNTYWFUZHhEUGIvTWs3ck4wL2k0T2h4dlNnOVNlYTJxbXd1?=
 =?utf-8?B?dXlTSnFoNVRVT2dNNnovR3RoVWMrMmEwSVhFcGNaNnhJd3JsWE1lNWJTN1FE?=
 =?utf-8?B?U3lLOUJxaHlWelpNUXdjQTJaNWJWSmtJY1BxeUcyTE94V1g2K2YrVGVnRzlD?=
 =?utf-8?B?QVczckVMNTJ0dDdtV21TSU1nY1lsdVhiWnRZaVVnUVdtMXFNUFNvYWNqTmpC?=
 =?utf-8?B?ZUVrQmRMWW1hcXlaR0ROZzgrNlVWTFJxaHRQTGQ5ZmpsWVpkdnh2SjNrSFBv?=
 =?utf-8?B?Y1djRHgxUjRDSlNoemxxM1VybVlSL0pRYk1tZG12M3lNQWhRWHFIWUhyLy9L?=
 =?utf-8?B?RGlFREJqd3NpczUzRTVKY3BadzJCL1pmcFZrVHUvaFowMHpBOUUwRlNFRGk5?=
 =?utf-8?B?OEpXK2ZhQWEyTENCVXBKK3JpMkV6RzkvWkdQTlJMQnlvTXA4N3VkbnRGa3Jj?=
 =?utf-8?B?ZzIrT04xbEY5ZkhFN1gyT1dSZVlxZWwrRXBMMXhFV3QyWTh4ZlFyRVpDQVVm?=
 =?utf-8?B?SEpwMmJhS2VuV29xbXp1bVdVcVdmZVY2YWkyVzVpOHdUTnNOTlkrMFlMcDUy?=
 =?utf-8?B?S3hyYUFTS1dNaFVMWDJwWmlEMXlGaXdmcUViUFB4Q2RTT0VVSkpwZnFtcmN4?=
 =?utf-8?B?RjZyWW5wbmgreXg2K0czV1c0WG1RN0dDUUlNMWpYT3hRZzArUjBBMWpPRjgr?=
 =?utf-8?B?RUN4R2wvaWhzT0hBY0ZMRW8xVmlocUJoY2NoT0hlck4xS2poSHZGRmZCaUx1?=
 =?utf-8?B?N2w4UVcySDl1clJubmdabC9SNFpDWGU3R1BzRnFldHlSbUFEUWo1d0xKa0xJ?=
 =?utf-8?B?ZUVlNUluQkZhVFk5MUtSQm5naHdlaDg0NHpUTVd2L0x2WTBmbE1HYkhFcVVQ?=
 =?utf-8?B?dnRHTlVqMm1pajFQczN4dnkxb0ZUTmhqeXZCR2xvajBGdFExVnVKQU5QUnZt?=
 =?utf-8?B?TXlGK0tMY0h5UTVRS1BBYzNhUVExaGpPcGpTVWVPcy9WSnRBSGE3eFFtdXYy?=
 =?utf-8?B?a0dZMk1WbDJxV3lLT0NYSnFSTk9jZEJ5NkFOajJDTm9taUphM1l2NW9KQjU0?=
 =?utf-8?B?dDZzd3EyNGl2aGZQYUZrNU1UR0M3eWllVnZzSGhtQ1FCU1BFTjJGOHFjOHU2?=
 =?utf-8?B?TEE3eThPWExsOWZkYzZwbEJNRW13TUh2Wkp6WUcwU2RXVXBPQlB2aG9ISTJa?=
 =?utf-8?B?bkpMd0NTNGRrNjNnb3NmMm9NTk43RGVvelAxckZzMng5QndxeDgrbXFqdHp0?=
 =?utf-8?B?U2RkaFNFNmJtN0JmdHBnZFpkRk8ySlpoTm9vMzRweUpjNFlEZFJlWDNoMHQ2?=
 =?utf-8?B?VHNwc3hMaVZyZW9FRXgycENvWUM3NENhYmZaM1hxR0ZVVjJxcmZkaUR6eHRT?=
 =?utf-8?B?QW8ySlhyVUg2a1RIK0ViaFA0OUFuQnFlRVdwN1ZjMHJPK3g0TlBpWmFtRTRP?=
 =?utf-8?B?V0xZTmZ2L1pWblpkYnUzR2tsWWJRVUlhS1NYQUFHUzdQTXk2ZzQzYlNSb2V2?=
 =?utf-8?B?L2U2OFJCb2daWTRGd0xIcG1pRkZhUlRucXNDQlRJUEVCSkpGbWZwNit1Y0ta?=
 =?utf-8?B?Zmd1dmg3Qzh3RXdlZzZBZnQ1NmFHVnlGbkFzTG1UbmgyS2ZBc2tGejJsanFG?=
 =?utf-8?B?MFY0b2Vhb0s1Tk1DQ0N6VkJGbHdONHNjVVN3dFYrSHNtTGs1WWo2aC9FU2hD?=
 =?utf-8?B?UEQxL1pYUGZ1RENvTnBEUG9IWTdIRnhpZjRsSm9kL0Vka2lTa1JYcEs1dUhk?=
 =?utf-8?B?SnFvRFhLbEFoV3ZQa2tNbjFlbjVKdFljMG1rQ3ZXbENDVzdLM1RuNVpjSVE3?=
 =?utf-8?B?cyttZGdxRHRNWDZIVlQrdERHdUdYcWVlK3FuVS9tT3A4aFVJWGNYTnhRWXAy?=
 =?utf-8?Q?nIyg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB9072.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OFRNai81eWdQN3M0Q1VmZEVOK2pTek82MUE5SytBK2ZHc0MzdmZVZ0lsaVcz?=
 =?utf-8?B?bWtvTnRXd0V3aUUzb1preTV4Y0pqbDJkOHRnQU04VUVHTzVDazdMajFGK3o5?=
 =?utf-8?B?elUxVEJjNHVJOFlocUFyaHZhazlOZWRzTWlPSTlMakVZSTBwMWVxWDZWekRj?=
 =?utf-8?B?ZFRsdnY2aWRiRjRDRm82QjczekFIMnV5S2pCa1owa3d3ODkwdnVqdW1LVnpi?=
 =?utf-8?B?SjJRZU9ZVzY2T3dEQkVUU0V6a2U0U2tpZ3hSeHRkeXg1VGswdms3ZTRobThm?=
 =?utf-8?B?NG5id3YvbmV1U1JBY3J4cW50V1I2Mnp3R2Z1THFDY1d3Z0g4ZS9tVDBLQkpE?=
 =?utf-8?B?QktPZTFsMnpQaHZXNUNHRVUvVjF4c0lsckdvMU5LSkRLci93T2F3MGwyWWMy?=
 =?utf-8?B?S3V3c1g0eWlaUzJXLzFBNjBwV1lQZW1EVkdBUlRPSnJyNWtSazRmUXdvejN2?=
 =?utf-8?B?Ky83eGJ5OUVaRkhGejhwWndzU0k1UWdCNTdWTHh1RzdrWjAzUFYwMmtRckNC?=
 =?utf-8?B?VFkyQVRIRWY5eGk0MWVYVlBVZUJqV2puVk9zRFNNK1U4QXNjWFA4Zi9GK0ZF?=
 =?utf-8?B?eGRPYWJOR0ErK3pVbDZodUN2R2lZWVpTbU5tSmI4L21pS055L2kvWkJadDAw?=
 =?utf-8?B?Ni90S2c5VyswdGV1SlZHdjJYc25uY2ZlaWNtaFRBZ1RiVUVYMmZGaGpFYTRB?=
 =?utf-8?B?TnVTTkdta2w3OTZCdllzRENtUlQ5Yi9lTHpyMkVIYWpWZm14UXQrVWk0N0o0?=
 =?utf-8?B?TmRvUHNza0lUZUt4MHdTWWlkcmJSL1NwaEY2VHByU29Nd0NrdUMwRWdRUmoz?=
 =?utf-8?B?YmhnZmtWVm5Vb1BaZVZQR2hjN0pwWWplNzdVRjlHY1hJdWZlWXg4NStlSHgw?=
 =?utf-8?B?NFB0R1ZGb3M0Z0p3bU9qUVdHSVFGWE0yWEsrbC90ODNoVHNGMkhEWTRucEx2?=
 =?utf-8?B?bHQ5MGxxN0gxNmtXTnhNMmY3UlJiVlJZK0hOT29EOTBTY1pFamhsTnhZb0I5?=
 =?utf-8?B?RmdGR2JHamxYaEJ4WFBWR1BheGtNcUFVN1gxcnpJbTRNb3h0eWliUnRNUTMr?=
 =?utf-8?B?YlFEanhjZVhiOXc0K3RmZElJWWIyTi9BMndjbCtKVGh1L3hhZDVDMy8zRnEz?=
 =?utf-8?B?WE1JZHIvb05Qam5HVGFEYmFnNW9nbDFtYzlSL2RlQ0puNTRhdHNXa2F5QVBF?=
 =?utf-8?B?a0hQMnB4cWZxbjZwR3Z4aDVHOEtlMjRENDVvWE1ZWGdlSm5ta2RPUUI2SGdR?=
 =?utf-8?B?Tk50NWZwbUkxVVp2emtSL2xXeHB5R09zVlJTOWVYV2hSRlRpUnltQ1NqQnQ0?=
 =?utf-8?B?S1BjRGg0MXZOSzJwQkFtc1A0MnJ1S2hMY0M4N2Vwb2hGZjlvMmkxYjhnK2J4?=
 =?utf-8?B?UHVXRU9XN0ovNEFaaTJNazM1R2J0SEdxQzhXcHpBZFk0SUdxaEVOUFl2M25v?=
 =?utf-8?B?cmpwZzJvTUppcDkrQ3RjcEd1dm4vaXdEK1RhczIrYkMrVDFWK0F0bG12YnE3?=
 =?utf-8?B?S0Y1MUJObTRXSnNiaXF5SnNkR1NPN2wyaCtFK2RHNktWMVNFZEQ0VUw3NHVt?=
 =?utf-8?B?aDc4SlpJd3RIbHp5eHJydmpUakhkOGFtcEh5WWk0eXNaVzZRelIxSkZxQU0r?=
 =?utf-8?B?K2JXZHd4NWZlaUtyOVg5REwxMjhCaDBnNVVFUzkwdGY4YWNDOWNiekNDU2lw?=
 =?utf-8?B?K1RzUit6SmN6b3FYYlZLRGlDakhvcXFpSlNHa0tJamEzMW5TSjZRcFJ2NXZR?=
 =?utf-8?B?K3NRRGJXSythOTg1bmthQ2tGWEFuUldiSnk2eTdNeU94bEwrbG43UXFIbUJx?=
 =?utf-8?B?SzV4d0xJZ0Jna2dPa0M3OE5MTXRMMDVCWm5TZ3RkOWJvREErVWpGQkIvKy92?=
 =?utf-8?B?bDE0anR6NDZMbVpORHM5bjZDYU1NaDRiTE9rV1JEdXJIcklrR2ZHVHdWRmpF?=
 =?utf-8?B?RERNUWc1elNmWkYvWnh1OUV1SUlWZ2pTOStKT3BSTyt4STZiSmZ3aDdaVWtF?=
 =?utf-8?B?MmZTQ0JRNzBabzl4TzkzVnVnaklXT1FEQk83aVRMS0w1cnl6TXc3anM4Wjht?=
 =?utf-8?B?azBGOUVyMkhQYVYreEtJOE5BSHFyRHZXTXZ6eGxBTTc4Y0ltbkZhNXpuTVBs?=
 =?utf-8?B?K2x3VnhPYUhGQXBrSkQrNHhLb3pFbCtFTXdHdStobW1LWThxc2hUeEwxbGR4?=
 =?utf-8?B?TGlMZDEwSmZsaEV6UTM1YWo0cmUwSFdaQXJ0WFZwMjFyUEwweU9zb1MxK05N?=
 =?utf-8?B?c2Z0YWJla0ZYM1c0RHpHNTB3Q2Q4c2lTb3IveWhoUTJjdloyZGVPVHZUU3ZL?=
 =?utf-8?B?ZTdpT3cxQW1jNGZ3T2FHSVZzQVhUYzhuaVlTR2loL0RCb2NPV0xqUT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3244da34-8226-4e5d-5719-08de58780765
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB9072.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 23:02:47.9607
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bDhzGVKKnIvBDINodmXaxkRBkfXL/TPFpZRuaUdRrrYkzk7aZlG8lclkjxXN7kIaWSQJql/vvk9EM8Cm6Rda+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6366
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_NONE,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Spamd-Result: default: False [-2.21 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[jniethe@nvidia.com,linuxppc-dev@lists.ozlabs.org];
	TAGGED_FROM(0.00)[bounces-16083-lists,linuxppc-dev=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[22];
	FORGED_RECIPIENTS(0.00)[m:ziy@nvidia.com,m:linux-mm@kvack.org,m:balbirs@nvidia.com,m:matthew.brost@intel.com,m:akpm@linux-foundation.org,m:linux-kernel@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:david@redhat.com,m:apopple@nvidia.com,m:lorenzo.stoakes@oracle.com,m:lyude@redhat.com,m:dakr@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:rcampbell@nvidia.com,m:mpenttil@redhat.com,m:jgg@nvidia.com,m:willy@infradead.org,m:linuxppc-dev@lists.ozlabs.org,m:intel-xe@lists.freedesktop.org,m:jgg@ziepe.ca,m:Felix.Kuehling@amd.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	URIBL_MULTI_FAIL(0.00)[nvidia.com:server fail,Nvidia.com:server fail,lists.ozlabs.org:server fail];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jniethe@nvidia.com,linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[kvack.org,nvidia.com,intel.com,linux-foundation.org,vger.kernel.org,lists.freedesktop.org,redhat.com,oracle.com,kernel.org,gmail.com,ffwll.ch,infradead.org,lists.ozlabs.org,ziepe.ca,amd.com];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:email,nvidia.com:mid,Nvidia.com:dkim]
X-Rspamd-Queue-Id: B4F864D709
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

On 21/1/26 09:53, Zi Yan wrote:
> On 20 Jan 2026, at 17:33, Jordan Niethe wrote:
> 
>> On 14/1/26 07:04, Zi Yan wrote:
>>> On 7 Jan 2026, at 4:18, Jordan Niethe wrote:
>>>
>>>> Currently when creating these device private struct pages, the first
>>>> step is to use request_free_mem_region() to get a range of physical
>>>> address space large enough to represent the devices memory. This
>>>> allocated physical address range is then remapped as device private
>>>> memory using memremap_pages().
>>>>
>>>> Needing allocation of physical address space has some problems:
>>>>
>>>>     1) There may be insufficient physical address space to represent the
>>>>        device memory. KASLR reducing the physical address space and VM
>>>>        configurations with limited physical address space increase the
>>>>        likelihood of hitting this especially as device memory increases. This
>>>>        has been observed to prevent device private from being initialized.
>>>>
>>>>     2) Attempting to add the device private pages to the linear map at
>>>>        addresses beyond the actual physical memory causes issues on
>>>>        architectures like aarch64 meaning the feature does not work there.
>>>>
>>>> Instead of using the physical address space, introduce a device private
>>>> address space and allocate devices regions from there to represent the
>>>> device private pages.
>>>>
>>>> Introduce a new interface memremap_device_private_pagemap() that
>>>> allocates a requested amount of device private address space and creates
>>>> the necessary device private pages.
>>>>
>>>> To support this new interface, struct dev_pagemap needs some changes:
>>>>
>>>>     - Add a new dev_pagemap::nr_pages field as an input parameter.
>>>>     - Add a new dev_pagemap::pages array to store the device
>>>>       private pages.
>>>>
>>>> When using memremap_device_private_pagemap(), rather then passing in
>>>> dev_pagemap::ranges[dev_pagemap::nr_ranges] of physical address space to
>>>> be remapped, dev_pagemap::nr_ranges will always be 1, and the device
>>>> private range that is reserved is returned in dev_pagemap::range.
>>>>
>>>> Forbid calling memremap_pages() with dev_pagemap::ranges::type =
>>>> MEMORY_DEVICE_PRIVATE.
>>>>
>>>> Represent this device private address space using a new
>>>> device_private_pgmap_tree maple tree. This tree maps a given device
>>>> private address to a struct dev_pagemap, where a specific device private
>>>> page may then be looked up in that dev_pagemap::pages array.
>>>>
>>>> Device private address space can be reclaimed and the assoicated device
>>>> private pages freed using the corresponding new
>>>> memunmap_device_private_pagemap() interface.
>>>>
>>>> Because the device private pages now live outside the physical address
>>>> space, they no longer have a normal PFN. This means that page_to_pfn(),
>>>> et al. are no longer meaningful.
>>>>
>>>> Introduce helpers:
>>>>
>>>>     - device_private_page_to_offset()
>>>>     - device_private_folio_to_offset()
>>>>
>>>> to take a given device private page / folio and return its offset within
>>>> the device private address space.
>>>>
>>>> Update the places where we previously converted a device private page to
>>>> a PFN to use these new helpers. When we encounter a device private
>>>> offset, instead of looking up its page within the pagemap use
>>>> device_private_offset_to_page() instead.
>>>>
>>>> Update the existing users:
>>>>
>>>>    - lib/test_hmm.c
>>>>    - ppc ultravisor
>>>>    - drm/amd/amdkfd
>>>>    - gpu/drm/xe
>>>>    - gpu/drm/nouveau
>>>>
>>>> to use the new memremap_device_private_pagemap() interface.
>>>>
>>>> Signed-off-by: Jordan Niethe <jniethe@nvidia.com>
>>>> Signed-off-by: Alistair Popple <apopple@nvidia.com>
>>>>
>>>> ---
>>>>
>>>> NOTE: The updates to the existing drivers have only been compile tested.
>>>> I'll need some help in testing these drivers.
>>>>
>>>> v1:
>>>> - Include NUMA node paramater for memremap_device_private_pagemap()
>>>> - Add devm_memremap_device_private_pagemap() and friends
>>>> - Update existing users of memremap_pages():
>>>>       - ppc ultravisor
>>>>       - drm/amd/amdkfd
>>>>       - gpu/drm/xe
>>>>       - gpu/drm/nouveau
>>>> - Update for HMM huge page support
>>>> - Guard device_private_offset_to_page and friends with CONFIG_ZONE_DEVICE
>>>>
>>>> v2:
>>>> - Make sure last member of struct dev_pagemap remains DECLARE_FLEX_ARRAY(struct range, ranges);
>>>> ---
>>>>    Documentation/mm/hmm.rst                 |  11 +-
>>>>    arch/powerpc/kvm/book3s_hv_uvmem.c       |  41 ++---
>>>>    drivers/gpu/drm/amd/amdkfd/kfd_migrate.c |  23 +--
>>>>    drivers/gpu/drm/nouveau/nouveau_dmem.c   |  35 ++--
>>>>    drivers/gpu/drm/xe/xe_svm.c              |  28 +---
>>>>    include/linux/hmm.h                      |   3 +
>>>>    include/linux/leafops.h                  |  16 +-
>>>>    include/linux/memremap.h                 |  64 +++++++-
>>>>    include/linux/migrate.h                  |   6 +-
>>>>    include/linux/mm.h                       |   2 +
>>>>    include/linux/rmap.h                     |   5 +-
>>>>    include/linux/swapops.h                  |  10 +-
>>>>    lib/test_hmm.c                           |  69 ++++----
>>>>    mm/debug.c                               |   9 +-
>>>>    mm/memremap.c                            | 193 ++++++++++++++++++-----
>>>>    mm/mm_init.c                             |   8 +-
>>>>    mm/page_vma_mapped.c                     |  19 ++-
>>>>    mm/rmap.c                                |  43 +++--
>>>>    mm/util.c                                |   5 +-
>>>>    19 files changed, 391 insertions(+), 199 deletions(-)
>>>>
>>> <snip>
>>>
>>>> diff --git a/include/linux/mm.h b/include/linux/mm.h
>>>> index e65329e1969f..b36599ab41ba 100644
>>>> --- a/include/linux/mm.h
>>>> +++ b/include/linux/mm.h
>>>> @@ -2038,6 +2038,8 @@ static inline unsigned long memdesc_section(memdesc_flags_t mdf)
>>>>     */
>>>>    static inline unsigned long folio_pfn(const struct folio *folio)
>>>>    {
>>>> +	VM_BUG_ON(folio_is_device_private(folio));
>>>
>>> Please use VM_WARN_ON instead.
>>
>> ack.
>>
>>>
>>>> +
>>>>    	return page_to_pfn(&folio->page);
>>>>    }
>>>>
>>>> diff --git a/include/linux/rmap.h b/include/linux/rmap.h
>>>> index 57c63b6a8f65..c1561a92864f 100644
>>>> --- a/include/linux/rmap.h
>>>> +++ b/include/linux/rmap.h
>>>> @@ -951,7 +951,7 @@ static inline unsigned long page_vma_walk_pfn(unsigned long pfn)
>>>>    static inline unsigned long folio_page_vma_walk_pfn(const struct folio *folio)
>>>>    {
>>>>    	if (folio_is_device_private(folio))
>>>> -		return page_vma_walk_pfn(folio_pfn(folio)) |
>>>> +		return page_vma_walk_pfn(device_private_folio_to_offset(folio)) |
>>>>    		       PVMW_PFN_DEVICE_PRIVATE;
>>>>
>>>>    	return page_vma_walk_pfn(folio_pfn(folio));
>>>> @@ -959,6 +959,9 @@ static inline unsigned long folio_page_vma_walk_pfn(const struct folio *folio)
>>>>
>>>>    static inline struct page *page_vma_walk_pfn_to_page(unsigned long pvmw_pfn)
>>>>    {
>>>> +	if (pvmw_pfn & PVMW_PFN_DEVICE_PRIVATE)
>>>> +		return device_private_offset_to_page(pvmw_pfn >> PVMW_PFN_SHIFT);
>>>> +
>>>>    	return pfn_to_page(pvmw_pfn >> PVMW_PFN_SHIFT);
>>>>    }
>>>
>>> <snip>
>>>
>>>> diff --git a/mm/page_vma_mapped.c b/mm/page_vma_mapped.c
>>>> index 96c525785d78..141fe5abd33f 100644
>>>> --- a/mm/page_vma_mapped.c
>>>> +++ b/mm/page_vma_mapped.c
>>>> @@ -107,6 +107,7 @@ static bool map_pte(struct page_vma_mapped_walk *pvmw, pmd_t *pmdvalp,
>>>>    static bool check_pte(struct page_vma_mapped_walk *pvmw, unsigned long pte_nr)
>>>>    {
>>>>    	unsigned long pfn;
>>>> +	bool device_private = false;
>>>>    	pte_t ptent = ptep_get(pvmw->pte);
>>>>
>>>>    	if (pvmw->flags & PVMW_MIGRATION) {
>>>> @@ -115,6 +116,9 @@ static bool check_pte(struct page_vma_mapped_walk *pvmw, unsigned long pte_nr)
>>>>    		if (!softleaf_is_migration(entry))
>>>>    			return false;
>>>>
>>>> +		if (softleaf_is_migration_device_private(entry))
>>>> +			device_private = true;
>>>> +
>>>>    		pfn = softleaf_to_pfn(entry);
>>>>    	} else if (pte_present(ptent)) {
>>>>    		pfn = pte_pfn(ptent);
>>>> @@ -127,8 +131,14 @@ static bool check_pte(struct page_vma_mapped_walk *pvmw, unsigned long pte_nr)
>>>>    			return false;
>>>>
>>>>    		pfn = softleaf_to_pfn(entry);
>>>> +
>>>> +		if (softleaf_is_device_private(entry))
>>>> +			device_private = true;
>>>>    	}
>>>>
>>>> +	if ((device_private) ^ !!(pvmw->pfn & PVMW_PFN_DEVICE_PRIVATE))
>>>> +		return false;
>>>> +
>>>>    	if ((pfn + pte_nr - 1) < (pvmw->pfn >> PVMW_PFN_SHIFT))
>>>>    		return false;
>>>>    	if (pfn > ((pvmw->pfn >> PVMW_PFN_SHIFT) + pvmw->nr_pages - 1))
>>>> @@ -137,8 +147,11 @@ static bool check_pte(struct page_vma_mapped_walk *pvmw, unsigned long pte_nr)
>>>>    }
>>>>
>>>>    /* Returns true if the two ranges overlap.  Careful to not overflow. */
>>>> -static bool check_pmd(unsigned long pfn, struct page_vma_mapped_walk *pvmw)
>>>> +static bool check_pmd(unsigned long pfn, bool device_private, struct page_vma_mapped_walk *pvmw)
>>>>    {
>>>> +	if ((device_private) ^ !!(pvmw->pfn & PVMW_PFN_DEVICE_PRIVATE))
>>>> +		return false;
>>>> +
>>>>    	if ((pfn + HPAGE_PMD_NR - 1) < (pvmw->pfn >> PVMW_PFN_SHIFT))
>>>>    		return false;
>>>>    	if (pfn > (pvmw->pfn >> PVMW_PFN_SHIFT) + pvmw->nr_pages - 1)
>>>> @@ -255,6 +268,8 @@ bool page_vma_mapped_walk(struct page_vma_mapped_walk *pvmw)
>>>>
>>>>    				if (!softleaf_is_migration(entry) ||
>>>>    				    !check_pmd(softleaf_to_pfn(entry),
>>>> +					       softleaf_is_device_private(entry) ||
>>>> +					       softleaf_is_migration_device_private(entry),
>>>>    					       pvmw))
>>>>    					return not_found(pvmw);
>>>>    				return true;
>>>> @@ -262,7 +277,7 @@ bool page_vma_mapped_walk(struct page_vma_mapped_walk *pvmw)
>>>>    			if (likely(pmd_trans_huge(pmde))) {
>>>>    				if (pvmw->flags & PVMW_MIGRATION)
>>>>    					return not_found(pvmw);
>>>> -				if (!check_pmd(pmd_pfn(pmde), pvmw))
>>>> +				if (!check_pmd(pmd_pfn(pmde), false, pvmw))
>>>>    					return not_found(pvmw);
>>>>    				return true;
>>>>    			}
>>>
>>> It seems to me that you can add a new flag like “bool is_device_private” to
>>> indicate whether pfn is a device private index instead of pfn without
>>> manipulating pvmw->pfn itself.
>>
>> We could do it like that, however my concern with using a new param was that
>> storing this info seperately might make it easier to misuse a device private
>> index as a regular pfn.
>>
>> It seemed like it could be easy to overlook both when creating the pvmw and
>> then when accessing the pfn.
> 
> That is why I asked for a helper function like page_vma_walk_pfn(pvmw) to
> return the converted pfn instead of pvmw->pfn directly. You can add a comment
> to ask people to use helper function and even mark pvmw->pfn /* do not use
> directly */.

Yeah I agree that is a good idea.

> 
> In addition, your patch manipulates pfn by left shifting it by 1. Are you sure
> there is no weird arch having pfns with bit 63 being 1? Your change could
> break it, right?

Currently for migrate pfns we left shift by pfns by MIGRATE_PFN_SHIFT (6), so I
thought doing something similiar here should be safe.

Thanks,
Jordan.

> 
> 
> Best Regards,
> Yan, Zi


