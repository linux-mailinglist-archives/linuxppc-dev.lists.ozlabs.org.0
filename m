Return-Path: <linuxppc-dev+bounces-5853-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 76BBFA282C6
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Feb 2025 04:20:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YnlqW1C3Pz300g;
	Wed,  5 Feb 2025 14:20:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2416::603" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738725343;
	cv=pass; b=Onn3AsALTqenK2hgO2sWurKm9umYK0mz1/6YgwccimPO9y/DdyalF9WZMbmGHZPm6EfBKyIUB2qTRop+Kt7I0G7Ngrd6zwRMSGnZqVm3pbnta3+h5s3JFD0+j5WATDWkTBdOWi7s4Lfn8enVw6F03m7SFmzATuyh5PZYdRQNMtSilbk873hAEqkyYRj5RkBVj3pdEVH9jWov4FTW3DP0wRZq641RE4s1q9mMi4FEUxBVJhmSNstrM2lYHmQ0Ekxo+uM43teFPTttpc0oKJS5rVKKFtLSy86y2jRbErCFApLoS43XNHTIA6O2U2JdXkKRkeHoeQMmGKfye162mTrBJg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738725343; c=relaxed/relaxed;
	bh=+XQPjqiXJppbtW8hBGh+rQjDNDnhYxDnte7JvurJ7t0=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Kibf/zAXH72ylw9QCg3uwCnIAysbip1IJYvUHGj7zeXqz6s08A5VDAfYpsI/Lo9fgIY+cE/NfDf8LOYzVa/BaN35GPTFQWM+W0cabdq7vHo3IvMwR+vT7of7zT7nZtf89w6uWo7A62J05AVNg25Ar1nmUzO15tpHt10GCCNAUHAzrJmanU5iYVhB7T+sMtTN4dFJak35XiqQoL1QrLdikkI1w2ufCedQB6wYGxnskISR8gVb3I0Unpi7vyguEls3WjQUiLI68RFixHvcO1kXlgDMZBqo195LDRgFYI4j2bMI9xOMbJRFhvmqGb2212KZ76xv4C7b+oexjvDNRq/dmQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=ebdonI7f; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:2416::603; helo=nam11-co1-obe.outbound.protection.outlook.com; envelope-from=balbirs@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=ebdonI7f;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:2416::603; helo=nam11-co1-obe.outbound.protection.outlook.com; envelope-from=balbirs@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on20603.outbound.protection.outlook.com [IPv6:2a01:111:f403:2416::603])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ynljp2w8vz2xKN
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Feb 2025 14:15:42 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vQNqwOkJdOdFIteq8LQVakqQZhlOiUXuXZ1AbFIkvuXmDmYkXm+TF5Dgijgx9GU0AdSZz241gT3E67mNmDi0IXkYz+vP4M+D9wd4cF2NGvP5I4UNFcGaRiC4pqVMYQaSTATqdDhAZIkUppWF7hW2AmwK0b0zSyLJki9PohK8rJaMO9TLMve1WJmVkvK/hHLgDxUmbkF8UBu3Sj49URavRC4tDjGXKLiq4B9JxP/+JRyo9/MXnq6W2gcOmXE9LvDcb3Lap8ePMnGwhSXvs2CjIRK+9189tXydRzMNCG6VA8wgi03SBuuYuxbrFEdPLQuUXRzcOe7JRfGh3nW+aMM29Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+XQPjqiXJppbtW8hBGh+rQjDNDnhYxDnte7JvurJ7t0=;
 b=Kk6X30ioIwhq+RsOnbRbQywxNVm8p8N8v/bdfpq3Xqee+n2Nx7ZoAL0lQN1cWmEeod3TnkusRA21uCR3+za4uuvDm7W5y08K/hLlE0FcKO1LExdbazzMAIq2W/mqrB/jFvxylnUQIeRfWWvucnGh/o97fxzjQlRv88Mvods66wMhycvJS2hm/+Io09dJ7ODPBHZfWtYN2armxMPV0awZn/00PH/XArN/avzh7vrIA9VhLGaCLDdlRjjDM7FMgd/eLWqpG6J563LyLTRFC6UGYVE3I8lMPlbmHcz9Tu1wP11K+LwukT97GYj/jAFZZd/PPuEdXIwOBxSMfzTrUCdjdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+XQPjqiXJppbtW8hBGh+rQjDNDnhYxDnte7JvurJ7t0=;
 b=ebdonI7flGzlG/zAVaIK+bBEjdqWAbIlFRci0VWzQJV3TvYNbbmUv0qFxjCVVAQsfqOusbks1sf9WnEmxBV0bobkpA8w2FBsfyOKcwVqv+6M8054dltxUVvh082u9ENYuSCjiwbpXn5ibR7tKMqq88yz5dBQdOG34FuR0+lIMIkhUo5VzsaIToNCf6LW2GQxabzv24Z1TN7JLUT7tBplQugTuBlfNPhH55oG9uLjOUcMtLTXiivWPUo9VBfPi4aT0wYJkveaG93g7sORYZbkY2xVcZF1BVGqIMMl5OQws/Yy2V63AgqpwsKDql8aSo/1st+frfPd1+EPUwUD44i94g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SA1PR12MB7272.namprd12.prod.outlook.com (2603:10b6:806:2b6::7)
 by CYYPR12MB8869.namprd12.prod.outlook.com (2603:10b6:930:bf::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.25; Wed, 5 Feb
 2025 03:15:23 +0000
Received: from SA1PR12MB7272.namprd12.prod.outlook.com
 ([fe80::a970:b87e:819a:1868]) by SA1PR12MB7272.namprd12.prod.outlook.com
 ([fe80::a970:b87e:819a:1868%7]) with mapi id 15.20.8398.018; Wed, 5 Feb 2025
 03:15:23 +0000
Message-ID: <d998abb2-e825-4f2b-9bd6-6a0465abf123@nvidia.com>
Date: Wed, 5 Feb 2025 14:15:13 +1100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 02/20] fs/dax: Return unmapped busy pages from
 dax_layout_busy_page_range()
To: Alistair Popple <apopple@nvidia.com>, akpm@linux-foundation.org,
 dan.j.williams@intel.com, linux-mm@kvack.org
Cc: Alison Schofield <alison.schofield@intel.com>, lina@asahilina.net,
 zhang.lyra@gmail.com, gerald.schaefer@linux.ibm.com,
 vishal.l.verma@intel.com, dave.jiang@intel.com, logang@deltatee.com,
 bhelgaas@google.com, jack@suse.cz, jgg@ziepe.ca, catalin.marinas@arm.com,
 will@kernel.org, mpe@ellerman.id.au, npiggin@gmail.com,
 dave.hansen@linux.intel.com, ira.weiny@intel.com, willy@infradead.org,
 djwong@kernel.org, tytso@mit.edu, linmiaohe@huawei.com, david@redhat.com,
 peterx@redhat.com, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 nvdimm@lists.linux.dev, linux-cxl@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-xfs@vger.kernel.org, jhubbard@nvidia.com, hch@lst.de,
 david@fromorbit.com, chenhuacai@kernel.org, kernel@xen0n.name,
 loongarch@lists.linux.dev
References: <cover.472dfc700f28c65ecad7591096a1dc7878ff6172.1738709036.git-series.apopple@nvidia.com>
 <23432568750f099d32b473f64b7e35f0671d429e.1738709036.git-series.apopple@nvidia.com>
Content-Language: en-US
From: Balbir Singh <balbirs@nvidia.com>
In-Reply-To: <23432568750f099d32b473f64b7e35f0671d429e.1738709036.git-series.apopple@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY3PR05CA0047.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::22) To SA1PR12MB7272.namprd12.prod.outlook.com
 (2603:10b6:806:2b6::7)
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
X-MS-TrafficTypeDiagnostic: SA1PR12MB7272:EE_|CYYPR12MB8869:EE_
X-MS-Office365-Filtering-Correlation-Id: 33aed631-0189-46b0-8b35-08dd45935472
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SlRxWm9iakpaY2FvcHE0M21BRjBRWk5pcmdUR3ZLci85YlBOWURNNmVkQjds?=
 =?utf-8?B?VDU1YlBwdWJaN3daUnZjc3pDTmxpblYyZ2pOY2dBM0xPTERvL1BwU2x0aHZt?=
 =?utf-8?B?VHFaOGd0RS8yZmd0RjlaQXlJdkoxcGxSSjcrRGNUQzJuekV2U1J0STFDZFhl?=
 =?utf-8?B?QjhNdENGUnNWZy9RcFdob1hxelRWQmJMVVVGcGdPUVN1c3FOMDh2citqaFdF?=
 =?utf-8?B?RGt3TFhwRy9ZTC9HbmZoZlZpNTVKZENCUGE4S0JnNUZCNlZYdDVEK0xJZFV3?=
 =?utf-8?B?U3Flais3TjdlOGRSN1ZVTkVpbkRtQ3JldU9tN3RDK0pNWDRSczl6RUl4cDVJ?=
 =?utf-8?B?dHdhdDlYS2hEUnRnSDFSdnFwZnVjZmxYTUFkcy9Jb2MrZGF4TlR2RHdwKy91?=
 =?utf-8?B?elcwb2FURm42K0ovTjhBcFdsd2I3b0JsTTlscVVRWXpOaEVFeHYyMkJlZktB?=
 =?utf-8?B?Ykk2RWlHN05lRW9YZFgwdm1vd1ZJQVNmSGRpNnhhWC9NWXRSVnBHRXFHNWJq?=
 =?utf-8?B?UU9OUGFRVzNUMlVFeFBxNndpQkdna0E3V3NPLzBoeVg4RytjOHY5SW9ta2hL?=
 =?utf-8?B?TEE5NTVvdE9uakJXRTZOVFlsM25oUkRtOWpIYWRyUTFCNmNnYU5pOEdhRFd2?=
 =?utf-8?B?eGdhOFcwK2dWK1lTZlFIeVl0TU1OWXNlcDliNTk0THByQi9mV1hveFJOcDU0?=
 =?utf-8?B?TGVlKzJwSExOTkNlZ3ExbXR5MTNZS2xWOXgvSi9NSzd5L1pMaEZxaXZmTlEr?=
 =?utf-8?B?Q2RpcEJsOGU5eWppZ0p4ajU2azhhdUcrQitFcGJRN1FaV3M5WTNRRTNMdkpW?=
 =?utf-8?B?bS94UWZBZnROVlgrQmhKMFdYcFhvc25XUURrQ2R2TU5zM1ZWV09nTWZBdHFN?=
 =?utf-8?B?eFZxTlZlc096RVhhZHp0TG9KYUhoZCtmWmpPa1U0aVhpMHlxc2VwUWpLdC9w?=
 =?utf-8?B?ZGo2Q1BleFJOVHRWNXgyTHVWNmdUTGFTaHlUVDlGYjVyZ3FESWNHQlUwYUNI?=
 =?utf-8?B?VmV2b29LS3JyNFVIVS82MWZnbDdoekp4UDB4V0MxVWpEdk5rSW0zSENueGda?=
 =?utf-8?B?WFZheUpQb2l6SWFiQWNraGJmVzNJK1pGU0RhSmxYeTkvSTBYUXdzejZyeGV3?=
 =?utf-8?B?QnR3TVBhRGRGNmZETGo3U0RZN2s2UHRZcmIyU0FUd0lIVG5rQzgreWZPUm9t?=
 =?utf-8?B?VE1LTjdzaUV0MEJ4aisxQ1FwM1hIWDlXR24yWnFuZFpEcktrVW0zRWo3VTVB?=
 =?utf-8?B?VmI1cnRXUm8xaXA4ekpqUlN6V0czelVYSkdsSmVySitZajNzYjNzVDJCeHhz?=
 =?utf-8?B?ZEpwdU5ISHA0UTNwZHFieFZudHBSTnlINTk3Tzg4MmdpbGg0Wi96SjUwYitv?=
 =?utf-8?B?RTJLRkYyUTR4NVk0N0JIeXBESEh1b1l6ODUyRUpVdkw3Tzl6cDZzWUpwOGxR?=
 =?utf-8?B?SkxnNnR5Z1pJMFRMREExNjJUaE55QVBxdDlsN2E0UTVrWk8xckxNcCtrU3Fs?=
 =?utf-8?B?Njl4VTFZTFpUcXVGa3czZHVKR0Z1U2pvREpnTWtuNFNPaGdHbjErSkNxOHpJ?=
 =?utf-8?B?ZVArS3h6S3UzVTRlQm9JOUdRems4UWpKZkRUdFBFS05KTkM5cHRwWDBUbisw?=
 =?utf-8?B?SjVsQlYxdGZWdHRkaTdTZmQvYk9GUDJBRExUSlJxNzJFeThIQnRYdXgrVGdF?=
 =?utf-8?B?Tk9jSXRtNEVXUkRwd0wwNURFcjg0L3ZFaEpxOGw5UVBqVXM5V3BhdFF2Mis2?=
 =?utf-8?B?ZHc1RUJScmtNUjBCN2NVZFJwNFNWWDIxV3hUUVhZSUF5UjZRWmpoV3c2N3FE?=
 =?utf-8?B?Q21YS1RnSy9FV0VvTGpTQjFYbW0xdmNtaFo0T2Joa3BndHdRcWRpOHdyS3Bq?=
 =?utf-8?Q?/NxUwHAF0fs9I?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR12MB7272.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TERFZmVZY0UrcGU3RU5xcyt2S2pNMWJBUC9kZFphZDVYakdSTmFxVkpBa1Nq?=
 =?utf-8?B?Y2p5NHo3d1QyTUpnYWF2UlR2Y0hvL2FVWTZkSkNhdWhvUk9GQlQ1SEJGUFpW?=
 =?utf-8?B?ZitkVUhHN28zQTdDd3ZvY0NCU3h4R1BFRklSS3plU3dVTkhNYyt3Uk5uNHpu?=
 =?utf-8?B?WC80ZFNuNng4cWpyT0JaWHhzdFdFMXFYRnNtM0lSWHFhR1V2MzVINEo5R0Nq?=
 =?utf-8?B?bTlWK0tMNk42dWFQQ0l1ckhmcEkxUVNoVzNOWElHczhsWmJQR3lDQ1BOOWMv?=
 =?utf-8?B?VnN4SFFLOGxZNW5DTmFMNm5wMEhqYmVCK2oyTmJ2ZGFnQTd6dHZmT1VLL2VR?=
 =?utf-8?B?UUJMS05jd1ZBWmtUbWNHazdNNDVPUy85SDBOUEo4RS9pL09PUjNNbmJ3OGhC?=
 =?utf-8?B?V3NHYUVSUVdzbFZPTUdLalo4OXJCWUdYdFFxbkNhL2FJSGVsaVFUSFlkc2lm?=
 =?utf-8?B?ZEtwUTh1MmhteUhBVFp1cGYvRG5KZ2FGY2tVc0dkV09tNDMxZEh2RE9aenhs?=
 =?utf-8?B?Y3NpTkdvS0hWTHNkeEJXR2dLK3hHcFpic3JCNE9PaFJkei9jSjc3KzhCNzhU?=
 =?utf-8?B?TmxZV2JmUzkzblphbnMybldVSTBieTVOSGJ1Q1VXWEpjWU9xRmZzektoaWtr?=
 =?utf-8?B?TWk3M1NMWTUwckpFa1ljOERtUUJHNkVOdkFLUWlLTThPa0JUVm9SM3VHOWRB?=
 =?utf-8?B?YkZVQll5Q2dqV0FoM1JyVEYyZ1dwVXdBdStucjAvblRpZUtkYzhVT2RhVkxF?=
 =?utf-8?B?ZEJCUFYzZFBaTkRjRTRtK2taSmxJbUd1UC9RVWN3VVhkMTFrbnhFMGVIVlNL?=
 =?utf-8?B?aW9ScWRlVW1mRVZ1WEg1NVRQNFY0TExHcTl6d0tYTlByQTR6bzVBb2xzUjlX?=
 =?utf-8?B?YUlwZy9jNXlJWUFrbTNOWjZVOXBNS0l6T2szMTJrZU00RGlTekpUS3VvU1dP?=
 =?utf-8?B?aGVSSHJ1OGZZK0RkTFlFUCtWZmNKMW40SEZqeWhieTFrMUtlSmJwRVlKRFFE?=
 =?utf-8?B?ZGNnbmwyN2JBbXJiYlQrMjBBYjI3ZTE5TnJKNTljdzF6UFdxK2JMQTRqcVZh?=
 =?utf-8?B?a3pEdHllYlhWbEdKL2RpNGpkRHdWdGJsTGVHMVFzVGpjVi9mb3lEaWM5MnVp?=
 =?utf-8?B?TmQydXZWRWs5d2pZTkkvd3BWMDJpZFpyRXp0bzV3SEptbkMxek5EOHhVcHRp?=
 =?utf-8?B?STQ4djBuOUd1M1Q3MlBFYkFlcUlYMCs5YUZMSWpsSjR4ei82eC9BR2xveWJW?=
 =?utf-8?B?K0pxbEZBWFlseWV5V0MzdnZIOXA4bWVRNllFK3krblN4dVVVMmoralh1TjJO?=
 =?utf-8?B?TzFNWEhibGZtSTRNNzFTZElGTFJVbkRsOGRrUlQ4Ukl2QU93d1BhUzNQUmt5?=
 =?utf-8?B?cVVvS0JsbjdFNnl6ZGFOR29UUkRKWEJFYXNONWRwUEQ0YmxwaFNpaG1tTm45?=
 =?utf-8?B?dXFENUZJQ0diZWtGTkhiby9ZaytUQ0ZwMnhiOXJwWEtiaDArT2tlRFFZTEIy?=
 =?utf-8?B?Z0pYTnZzbFYxWk9zOHN4OVZpbHJQdGtmVWllQmM1S3NGeHNkcWdqekNaUE0v?=
 =?utf-8?B?RFUyb2IyK3dBeEZaQXk4TWJyaklGcW5jd3FPT2tGTUFobjlDaHltZnRNVVNM?=
 =?utf-8?B?dVBvWWszbGJOMnJabFlPZFZXaVYwbld6eFZ5eS9EWFByQ3lRVW5RTEZkWWcz?=
 =?utf-8?B?YXlzakdYdVgyYm5TZ2haQXJJcUJzNW00NnRudkFjMTluRVpDS1U3bUszVkNs?=
 =?utf-8?B?OTloYnY3NWhHVElrM2srbElKU1UvSUdJOTg2Z0NjcTBYQnZVMkhTNlBoZ2pn?=
 =?utf-8?B?ZDNiTG9iZWhhR3lOaUZHelRselVnQWdKN2hTdXJudVlhV05aTmJRbGtGU2Fo?=
 =?utf-8?B?M25yTzlVT0ZBWmRhQkllZmdpV0tIWDlVRUgyV1RNczd5R1pBd1NWbm40OW9r?=
 =?utf-8?B?c3BvN3JwRWEzRVd4THRXNWtNTFVSMGFaSGZOK1RoaEFDcHlWcVJNVHY0UE9s?=
 =?utf-8?B?UDMxZVMxMEZyVTZjSDA5aHdMRGRWTjNvRzVFRnRtaUlJb0lwMGlaUEhSVW5Z?=
 =?utf-8?B?dUlGNFJzY294M0h0NjNKN040bTBlR0xNaS84YXNXSXp6SmdSRFp2NzBLQWJi?=
 =?utf-8?Q?zFo1AQ55q5WssgJvJFxJH9ObZ?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33aed631-0189-46b0-8b35-08dd45935472
X-MS-Exchange-CrossTenant-AuthSource: SA1PR12MB7272.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2025 03:15:23.7299
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j9mNCdT3kvaPRxQet1moohg9yeUlozD761HCXxdxaHduego9QnFRFYV7w9PmaxSZtmbXdlP3nhE63z4NPJkGiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8869
X-Spam-Status: No, score=-0.5 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 2/5/25 09:47, Alistair Popple wrote:
> dax_layout_busy_page_range() is used by file systems to scan the DAX
> page-cache to unmap mapping pages from user-space and to determine if
> any pages in the given range are busy, either due to ongoing DMA or
> other get_user_pages() usage.
> 
> Currently it checks to see the file mapping is mapped into user-space
> with mapping_mapped() and returns early if not, skipping the check for
> DMA busy pages. This is wrong as pages may still be undergoing DMA
> access even if they have subsequently been unmapped from
> user-space. Fix this by dropping the check for mapping_mapped().
> 
> Signed-off-by: Alistair Popple <apopple@nvidia.com>
> Suggested-by: Dan Williams <dan.j.williams@intel.com>
> Reviewed-by: Dan Williams <dan.j.williams@intel.com>
> ---
>  fs/dax.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/dax.c b/fs/dax.c
> index 21b4740..5133568 100644
> --- a/fs/dax.c
> +++ b/fs/dax.c
> @@ -690,7 +690,7 @@ struct page *dax_layout_busy_page_range(struct address_space *mapping,
>  	if (IS_ENABLED(CONFIG_FS_DAX_LIMITED))
>  		return NULL;
>  
> -	if (!dax_mapping(mapping) || !mapping_mapped(mapping))
> +	if (!dax_mapping(mapping))
>  		return NULL;
>  
>  	/* If end == LLONG_MAX, all pages from start to till end of file */

I think the patch should probably also add

if (mapping_mapped(mapping))
	unmap_mapping_pages(mapping, start_idx, end_idx - start_idx + 1, 0);
But I don't think it's a blocker unmap_mapping_pages() should do the right thing internally

Acked-by: Balbir Singh <balbirs@nvidia.com>


