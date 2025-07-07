Return-Path: <linuxppc-dev+bounces-10130-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B5D26AFAB11
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Jul 2025 07:34:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bbCbp6wjnz2yMw;
	Mon,  7 Jul 2025 15:34:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2415::62b" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1751866470;
	cv=pass; b=jKjhEnAelHXBxSKtcKyL21bRU0sLcLIQeprgOIKYrKaTqZegN/DWASe+kLcQGVrrNZAlOB61QfWSrO5iod6/RCJUoGlSToostR4RQiK18wybeeoY0AOVxFAKflC8YnZT8ncMa/lWw7jFb/65N8XJODICsX0pw9tOg9sbwFIgHeOahmkxx5919Z51km65FFoK+Y+c9kUd26GksuY3tvRAJN4Q8Z4niJqOnyBB2uwjOzc+JPVforCHlNqP/xayOGW3O16U7EFqmdKvfk3bWXtSZ7esERD87GQdEpLz1LpN9EdhCeKvK/Ny4p0m8hIkqKVfz9kJjZH7ArPgyBk2n2byrg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1751866470; c=relaxed/relaxed;
	bh=rFYs6phsJXYk26yKTPuOm0vvkC9Oc5hbt14qeyXmbtU=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=jOr/OcMZfgtWf9AR5P+AJ1nxuPygoTVCYvvxBKrUZ5/ky3AcFv1zln5mpw7OZkmWIUvlTGXwLtXdS9+UemIo18yjaHuF5pQ4V/QI4FgzmMwHad/IFgjXJjwJdjTq9Ha2Z/GEB3mqttXvrfen1zYlF0+maPlnladtxJ8RdQOFM2zhHoQo1CTZgdP5G4mnsI4jF2GyhEnKE1LWEGf3INx8BZzGuuAe8/dy4mGiVU8s4U6UHH/utr7asA0/XsG7rH+ArToqRkt64i94HNekzK1XbNAyp9cQsiGgUn50CEWmprRP7hwcqFMR69I6mRXT6RX2OLsDTPzRIeeepZlKc0T6Dw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=pi16vUvQ; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:2415::62b; helo=nam11-dm6-obe.outbound.protection.outlook.com; envelope-from=kprateek.nayak@amd.com; receiver=lists.ozlabs.org) smtp.mailfrom=amd.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=pi16vUvQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=amd.com (client-ip=2a01:111:f403:2415::62b; helo=nam11-dm6-obe.outbound.protection.outlook.com; envelope-from=kprateek.nayak@amd.com; receiver=lists.ozlabs.org)
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2062b.outbound.protection.outlook.com [IPv6:2a01:111:f403:2415::62b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bbCbn08Wxz2xCd
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  7 Jul 2025 15:34:28 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mhls1bCCa6qmwfJfP+UCnXlbDMvdevmKohsZ796xlNUZ94wY0oPuxmh/vzU3LnuwptO5TGmf4FOyn9HLjpVft0xtUzsg60Pc8mmR6xHPD+85FKqnPzFzEt7OrL2NE6JxusZxDu7CAoUJIMwOMSjy8LTu0VYRraHdxYa5VbUnYnoCNRZWsGVLxnszy5syXIcbSIusLi4eHIZ7+gzI9jNPtJSOTm+VMMT1HCFXhVbkQIG4fWrUMlpW79vTlOI05a4OAZCgppH6YNHpav9m++uIeNqXddglEMWYxK9/qO0i1cuj5djBSnu8D1HaMtxOCv989A2uIjzH2on1c5OVkA6i1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rFYs6phsJXYk26yKTPuOm0vvkC9Oc5hbt14qeyXmbtU=;
 b=njQp/bySC5TruqjKmIGHPzcmx2El7Wg3N1GwA93+8oCx8sxLgxuih5RRePqOTaSkmzx4G/s+jaRJia37kaFjyCfEqWGD/OQf1UwE7RMgyecvgzHULJ94/nATIfZW/ctpfmt+BDatrY6jhIhnoyr//oDJp8t+XleXSnAbHHUXwvu3LzKhhC5U2tL3SmXx7Y1RJ50g3YAGOzwy4ihkx55aIcD+m3AcdRayZ3ondRd1apAlxZ6WOuiM443Zt2s73QWK8fi4Ol2qwSlQXwwjzHvgf6QSCW+Nb/h8XQUyjuGrEOFdpjZq+jFD3yDf3Vh1oTQGxuyf9kU655CMgKphnov2yA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rFYs6phsJXYk26yKTPuOm0vvkC9Oc5hbt14qeyXmbtU=;
 b=pi16vUvQRwqyHi5QmnYc97kTPAWh+1m8RbK5LAdBEaKuElgyX5oqv+dXgrZh/XCjf6T9pakdYyfN4ynhttIgxpqg5Es8AobXzQBcBMAv7P7dnhaPp4xD770f1mmLp52HdDrYNyViLjWr4Q6jVvIexznUmrYRaZW7L2oCXbdvK5Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH3PR12MB8658.namprd12.prod.outlook.com (2603:10b6:610:175::8)
 by CY1PR12MB9560.namprd12.prod.outlook.com (2603:10b6:930:fd::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.25; Mon, 7 Jul
 2025 05:34:08 +0000
Received: from CH3PR12MB8658.namprd12.prod.outlook.com
 ([fe80::d5cc:cc84:5e00:2f42]) by CH3PR12MB8658.namprd12.prod.outlook.com
 ([fe80::d5cc:cc84:5e00:2f42%4]) with mapi id 15.20.8901.021; Mon, 7 Jul 2025
 05:34:07 +0000
Message-ID: <f391491d-f886-4579-9b40-78a57f2ed1b5@amd.com>
Date: Mon, 7 Jul 2025 11:03:53 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/4] smpboot: introduce SDTL() helper to tidy sched
 topology setup
To: Li Chen <me@linux.beauty>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H . Peter Anvin" <hpa@zytor.com>,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 Peter Zijlstra <peterz@infradead.org>, Sohil Mehta <sohil.mehta@intel.com>,
 Brian Gerst <brgerst@gmail.com>,
 Patryk Wlazlyn <patryk.wlazlyn@linux.intel.com>,
 linux-kernel@vger.kernel.org, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>, Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
 Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
 Bibo Mao <maobibo@loongson.cn>, Li Chen <chenl311@chinatelecom.cn>,
 Huacai Chen <chenhuacai@kernel.org>, Tobias Huschle <huschle@linux.ibm.com>,
 Mete Durlu <meted@linux.ibm.com>, Joel Granados <joel.granados@kernel.org>,
 Guo Weikang <guoweikang.kernel@gmail.com>,
 Swapnil Sapkal <swapnil.sapkal@amd.com>, linuxppc-dev@lists.ozlabs.org,
 linux-s390@vger.kernel.org
References: <20250706030636.397197-1-me@linux.beauty>
 <20250706030636.397197-2-me@linux.beauty>
Content-Language: en-US
From: K Prateek Nayak <kprateek.nayak@amd.com>
In-Reply-To: <20250706030636.397197-2-me@linux.beauty>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0058.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:99::17) To CH3PR12MB8658.namprd12.prod.outlook.com
 (2603:10b6:610:175::8)
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
X-MS-TrafficTypeDiagnostic: CH3PR12MB8658:EE_|CY1PR12MB9560:EE_
X-MS-Office365-Filtering-Correlation-Id: 482da397-a9b0-4c11-bc8a-08ddbd17e482
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bFhIYnJzd2M1ZEdkNExBaEllcEFUUjdRRGdwaXZRWTZMcysrdHQ2RUpPNVF5?=
 =?utf-8?B?MXlVTGVSdEM4eWdrOE5nVFVTOTBzTHRHOTZab0UxWWRNWE5RT3U4Rk9yaERi?=
 =?utf-8?B?MFNDM0g2Z0JCVmpzU1dkR2lNMTBHSzZnSnh6cWthT2diektuYm0yZ0s1VFRM?=
 =?utf-8?B?cHJiRFA3dTM5TzVoN0JpekQ3UjNLeDcraW9VVEs2Um12cVdJcXR3VjI2SnpJ?=
 =?utf-8?B?dWxzKzFLUDl1SVlmZXMvbzFMY2hGM3EvOGF2RldMNUo5dGhrRHlXcGJKUkZ6?=
 =?utf-8?B?aUliVTNJVThleDZ2MVR6VG5nOWhJMHMwT3oySE1pMVluT013eHlwMjk5ZE81?=
 =?utf-8?B?NGp0NVBQMDdONWpxWEVsakxVdmJJZXFVQlhVT0pzTnhNTzBWSXVTOGRSZ3V5?=
 =?utf-8?B?MitUS2k2Tks4T3NmbTQ2d3NNOVJqTDlHelRBR3Znc3Vod2xScnVzMVQxUjNP?=
 =?utf-8?B?SDJmd25RQ2xVa3lHcCtxcDByMDFXV2wrK25zRkZ2TWRoNlM5NEdLbU0xZ2Fm?=
 =?utf-8?B?d1ZMR24xMStGRkpGczg4SkZOUjVSUXFsRlpDM1kyUUFybmNSYTE0QXg3UTA5?=
 =?utf-8?B?N1lwREp0cjJOOTBBdnJQMmtKQVFLZU92L0lXWmxMNWlZTytTbzZKU0NjWlRv?=
 =?utf-8?B?bXBqVFFSbGZoWncyNEUzck9IUEVEcXg4NWFvS0VYUTR6Vm5OcTA3RDUxalpj?=
 =?utf-8?B?WTMrNyt6U1hVNkI0VndYZHkyNjl1NnFBMEIzOWN2NXFwZlF0VDJRSWZxVXQy?=
 =?utf-8?B?aGkwRTRHeUJkeEZtaWxwcUNmaE8xMkR1ejIwVHp4anVsMU1zSlpIVzB0cVdS?=
 =?utf-8?B?Yi9YMXNmT2RWN1lLQ2dDdi9GbzJ1c2xEbXNUZ2ZpazMwam1sTHF1K2hmTGo1?=
 =?utf-8?B?ZzI0R1oyaGxydHBGS2xpZEozTm1qdkRETHUzUUtYYXd2V25JZWpRdFR1elRp?=
 =?utf-8?B?N1VCVzVaZlBtMDBwZHNyMlVOcTA2aEJCeVVxaThqSm8vR3N5VWg0S2FkbFNj?=
 =?utf-8?B?ZFpVYzV0R09GaDlqYmF1UU5CaWk1YWRUNWw1YitGVFVBd1J5bjM0c0NZZ2RR?=
 =?utf-8?B?VmgvaUdmRjN6OWxBNzJsTTBUUVJNZkFTSHNFbktWd0pFaW1jaFZwNjJldWMy?=
 =?utf-8?B?T2pwQlI2QWROU0hKUzJyaGNMZXVPd0pmZ3N3cVVZSmMrNE1ycXZmTERmRXQ0?=
 =?utf-8?B?aEJQTmxtL0hTVm1XR25Zc29naTdkV01QMEpOcFZCVHg0eWxrT0tJWGROakFz?=
 =?utf-8?B?V3ZGTUFLQjY1eHV3YnJaVis2V08vQVZDK3p2TVV0d0ZBZXZ5V1NoU1dvU1ZB?=
 =?utf-8?B?L0NnK3FQNnhYTjQxVkxxOXluTnFIY2p1K010SGk2Q1ljRDVKaUNLUm1qMVNr?=
 =?utf-8?B?Ny9iZHBzMFlrbXo4UW1aQ0FZK2JHOTJkdk5wUGlkdFBHelVLOS8xeDdMSWNQ?=
 =?utf-8?B?Z3g3S2dnWWRZRWJMOWRFazRLOGVsOWxXTE9rLzZTM3J4aW5nRkFHWWh6WjV6?=
 =?utf-8?B?elM0NklDbExCSEl1UzJyejRZVXF6a3pjM0xGb2U1VVVPWUh6QWdWNmI5aUh2?=
 =?utf-8?B?S1IyaGw3RFZ5Z3lyLzRUczVFMDlsNTU0TS90TTg4YW0zanYvMGkzTVlBV29R?=
 =?utf-8?B?R2w3WHJJQlNxaTQ2MUlMT3FmbHFLS1Q4WmIrdmRGcnlFVGg0dnREbXNKMXp4?=
 =?utf-8?B?bEI1b2U4TDRYVlkzK21TZmg4RkxVdUZKMERMN0NBRkd5QjRwQk5YRjMxWmpx?=
 =?utf-8?B?UzFiSVUyZjIyZTdpaStzN3Fwd2FvTHloYlZXbGFSREk3Mm9TSTlTU1pxbEc2?=
 =?utf-8?B?WG1lanpPR1BoSERZUU9WNjBZTDc2VUdseHFpS1BqTk1VUXpveWhmWjlrS0Zt?=
 =?utf-8?B?Zk1QVXNkWHFlNFFPSDkyS0xUMUwvTU9rcmE0ZFNtZ2FMak1qYnVVNUVObTdY?=
 =?utf-8?Q?h688Es4hoTQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8658.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q01wMFA5V05XaUVHaHVhQTg4WXVKSkFrYk41OHNMeE9vN1VBU3U3amcxN3JC?=
 =?utf-8?B?SHp6aHVkRGJaSWxNTjF6OHI4c2l1dDNxMGM0RGFMU0hTakVOR2hwYVhkM1JH?=
 =?utf-8?B?cVFQM0hVRHVjZjlLTERxNndHY1pRR3R2UW9EWDB2bW5zQ3ZKU25kb25FS2c1?=
 =?utf-8?B?Znd1YzBvSWxaRjdZYVZ3QW1kMCt2bVQ2Q0o2K1FhRWRvL1h6V285aTdmOGdk?=
 =?utf-8?B?QTc3ZnE3SDJqQmZIM2orL0tQV3MxMnlRY3dDSWwrYTNYWHNjYURGUkt2UFhX?=
 =?utf-8?B?TUM1eUVVcWRYT3B5T1B6NzVaV3hJbURnb2RteUlHeXJSTjZNWk5iNGE3dmor?=
 =?utf-8?B?Z2xTQTE0S1doUUJSUFc0d3VyanZ1V3JrUEowcldhQS9WQVVkZHNOOVMyWTZZ?=
 =?utf-8?B?U0FNZFpaeUFtMWw1SVNuZjM3b3ZydmVOME1rVlA3MDJhdVNCNTJMNUJobUJi?=
 =?utf-8?B?UVcwSzFaYUs0UTMrdGI2dU5GbmM1dHB6YjAzZUttbkYxeWhnQUhxRnV1US9t?=
 =?utf-8?B?NmtmNDMwVTVoQ1VTczZienB5WGpsY0h3YytpSnBEUUhRaGhFQk9Va3dMb0I0?=
 =?utf-8?B?MGhZcHBpQWI2ZVNSS1N1VUwzN0lsajlud0h6UkFQWGNzd2VIT2lvR2VoTkFU?=
 =?utf-8?B?WFlKMHgrRmkzWmtZMEdSYXVTWkEva0lDbGlvWldYNkdXcG1MS1VER0xKUXk1?=
 =?utf-8?B?WGIwM3VXR1BVNmlLdlk4RUVmR1U1WFgyU3NINVQrQng5MDRVOGdKQmlaS1Rt?=
 =?utf-8?B?V2RxMXV1OUZVd1hneXc2bzlZbTZEdEt3OUU0N3VHaVg5azNSQk8wdlZIN0Qx?=
 =?utf-8?B?dzgvVTV1ZGNobHhLVlI3RS80RHlCMGc1SUNiZ3Mrck5NZ09Rbm5pcHl2WlNs?=
 =?utf-8?B?TWMyN3NxM09KUHdnbnZxQkJzYXFGb3haL3J3TUpXbVdmd1FVOHByRXQ4SDNZ?=
 =?utf-8?B?NDNHV3NBd0FkM1VPTEp0MEF2UzVNRW5sMmMvNHBnU2FCRTNHN1o0RU9sWTBj?=
 =?utf-8?B?Q1RqTm9sOGZrZnpZcm5WVTVDWnhYeWJXZkZwbkZHejZsZ0JrQ0VPZVd5TDl1?=
 =?utf-8?B?MEVqWmxiT1Y5UW05YkJXTHUrR1E3THArME51MjBvMmU5bXovcXp1UlVGb1Zk?=
 =?utf-8?B?Vkc5UmJFeDYwS1hRM0JHTGlpN3FuUXgyMWxXM3BhbUNZT2gydnVuUDQ5VmZL?=
 =?utf-8?B?anpIMUk3NDdJdU9Oam9QSTRpVTV1bWJ6NXB2Y2t2QmliUFYxanVIUDllcWtF?=
 =?utf-8?B?ZVJHdldVZldmM3pqZ2lycXpvUERUV282OWtOWElpK05HZnFJVVNsSTVrNFh2?=
 =?utf-8?B?alBSZ3BKdEFQNFZBYTFLWmhiSmpXMUV6NThVenVWK2VNL2RGSFBjTkhTdGlD?=
 =?utf-8?B?T2c4OHlqaFk4L3RHKzJQay90Yk1XQzhpLzlmSzdNNXlNS282a000dnMzMWMz?=
 =?utf-8?B?dU5aWWpNSjVKR1JEaFk0eXRQa2NDUkFOVGI1R3VwR0dHWi8ybXhUNXo1MDRF?=
 =?utf-8?B?OWM4bnZLZ0Y4QTJHNElOQXlZcVNpTXk0MXJBUzJyRUQvSmxhV0k2MVI1ZnZP?=
 =?utf-8?B?YU5oTDVHQ0Z1VjI1Y2xVSC9TTmVtNm9GcmdoS2ROSVU3WXdnck5zNk9sbG1j?=
 =?utf-8?B?TldHOEc1c2diNUNneHhlY1Z6TS9Fc0VGdEJtbm1UNTdIckFSL3QvdVh1K2RE?=
 =?utf-8?B?V1padVRTK0E1U1ZCQnQ0TjJiN05uRFZlSG1JamdDK1YvaEFKK2pqWGE5R3N0?=
 =?utf-8?B?bGFCa2dyZDRDSExhUEsrTVVsaTlmT0F1cUEwZnpsb2pYaUNwazJzU3p0dzFL?=
 =?utf-8?B?MnVRTEEvYzFqL3ZCa3UwVUVJQW9VWEUrTE5aa0E2aVFXMWFEM3I5THhoVVln?=
 =?utf-8?B?VTJ6dlUrV1VyQUExaWZjd2xRNEtYR2taQ3Ixd2ZUblh3NXB3Q3dISVhrYjdU?=
 =?utf-8?B?NmMwTUZRKzU1N0dva0ptdEgyZlVaempWZmVXZUFIbFlkUkN0dWQwQVBYWU1D?=
 =?utf-8?B?ZWV2S3l3TC8zMUZQVWRVckEraU1yVVZDUUtsVlAzc0lEYmV1THdzYmZycC83?=
 =?utf-8?B?K1lINmF5SlpJYURpNWhRS01QWHg5b3J1amd4M0JOUEpMTEdCYk8zWitEN2NS?=
 =?utf-8?Q?7/VKHI99OEHcZf3Zm09nVvV6W?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 482da397-a9b0-4c11-bc8a-08ddbd17e482
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8658.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2025 05:34:07.7189
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J/97Mv9opq+Ls57ZA4NnMT0xWPrz90t1MWsUrdibDB5VGPilDTMVY3st/nFZllxUMC0T+bnQb8W5jW2rcrpesg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR12MB9560
X-Spam-Status: No, score=-3.1 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hello Li,

Apart from few comments inline below, feel free to include:

Tested-by: K Prateek Nayak <kprateek.nayak@amd.com>

for the entire series.

On 7/6/2025 8:36 AM, Li Chen wrote:
> diff --git a/include/linux/sched/topology.h b/include/linux/sched/topology.h
> index 198bb5cc1774b..0b53e372c445c 100644
> --- a/include/linux/sched/topology.h
> +++ b/include/linux/sched/topology.h
> @@ -197,9 +197,9 @@ struct sched_domain_topology_level {
>  extern void __init set_sched_topology(struct sched_domain_topology_level *tl);
>  extern void sched_update_asym_prefer_cpu(int cpu, int old_prio, int new_prio);
>  
> -
> -# define SD_INIT_NAME(type)		.name = #type
> -
> +#define SDTL(maskfn, flagsfn, dname) \
> +	((struct sched_domain_topology_level) \
> +	    { .mask = maskfn, .sd_flags = flagsfn, .name = #dname, .numa_level = 0 })

I prefer the following alignment:

#define SDTL(maskfn, flagsfn, dname) ((struct sched_domain_topology_level) \
	{ .mask = maskfn, .sd_flags = flagsfn, .name = #dname })

instead of having 3 lines. "numa_level" is 0 by default so I don't think
we need to explicitly specify it again.

Also perhaps the macro can be named "SDTL_INIT()" to keep consistent
with the naming convention.

>  #else /* CONFIG_SMP */

A bunch of the CONFIG_SMP related ifdeffry is being removed for the
next cycle. You can perhaps rebase the series on top of the tip tree
(git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git)

>  
>  struct sched_domain_attr;

[..snip..]

> diff --git a/kernel/sched/topology.c b/kernel/sched/topology.c
> index b958fe48e0205..e6ec65ae4b75d 100644
> --- a/kernel/sched/topology.c
> +++ b/kernel/sched/topology.c
> @@ -2025,7 +2021,7 @@ void sched_init_numa(int offline_node)
>  			.sd_flags = cpu_numa_flags,
>  			.flags = SDTL_OVERLAP,
>  			.numa_level = j,
> -			SD_INIT_NAME(NUMA)
> +			.name = "NUMA",

This can use SDTL() macro too. Just explicitly set "tl[i].numa_level" to
"j" after.

>  		};
>  	}
>  

-- 
Thanks and Regards,
Prateek


