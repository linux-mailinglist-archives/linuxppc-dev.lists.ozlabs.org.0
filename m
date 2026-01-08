Return-Path: <linuxppc-dev+bounces-15439-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 432ABD06924
	for <lists+linuxppc-dev@lfdr.de>; Fri, 09 Jan 2026 00:50:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dnM8v3gc9z2yFg;
	Fri, 09 Jan 2026 10:50:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=52.101.43.6 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767916223;
	cv=pass; b=H8gWwzqPJESYJDrADJuktEU5vjKaszqGJPtb08xT0yXelZ8MA+2lcU3a9rlt9aL+JIIMzwfo6KI6O9q1DDxQw0PhWpGkvmOPPIg0/h9iRTu8Uh+UAD/KvfqXAIe5s1zdVWJx6rXLaG3plz+seGYZ0vX3j8qlEiNlEBzKOuzW+IG/xo5TDlGFhgOV1yvWsvN89tbnsVZ2ctO2ANnCcPXSA0BpxqqR0Ckv18xt9NGoSp0JH8hvVgXt6BKT4kf+f/P+0dbcRbw0cBMmUcDdlvGIR8XIRZaWgGYTKoTDcg2JDb6fIO7O0unR+ubTV1rnnO3cTgZ5KQCsU5iH4Mfj7sYYtg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767916223; c=relaxed/relaxed;
	bh=xMY4fbuyYWH5PKtdaDlF1Z2O4id+OapRDb/JDmXLU/s=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=WIjHq+gAJQ2zEDmzmS7668aZtjdf2lD7koGg4az5K7q7MBBHDITc3KTvaD9WxGHHXU96gDyxhFMFl8XFXjwKiMiZ9hAeB/YV70GXbm+B1pXFRkQ8A9hKv86M/nHrbqxn9qBW4ODfDEqv1Uu2Y1PrI1CS6S3XRHDhEzGKDemWlY360ZX7jozpuPSXMJZ13l6bLTZr+qp4MYBr6iiv2tF1iiltso5r4UhywaK/V5WM+5aRfOGVxACicr4JlWykgWv5+/7wTIsQyuB4+7ndcASX0Dje4t3uiHCbr55flkaFtlSruY9X74UNOnSbUbKQKdv5L1OcurmButaU1Iu/Tp+DYw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=JNTaFpqZ; dkim-atps=neutral; spf=pass (client-ip=52.101.43.6; helo=sj2pr03cu001.outbound.protection.outlook.com; envelope-from=jniethe@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=JNTaFpqZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=52.101.43.6; helo=sj2pr03cu001.outbound.protection.outlook.com; envelope-from=jniethe@nvidia.com; receiver=lists.ozlabs.org)
Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012006.outbound.protection.outlook.com [52.101.43.6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dnM8t58Qbz2y6G
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 09 Jan 2026 10:50:22 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IARncsd7hxd591d6QKVP8mdf4EKjOnesw51WK2DzXSccZwK+R65I5TUFocYxcuaxd5kodyR7lkoREo3t6VW15rhLTKuHGLaFbTHiGLUM9/xBlH1N3haiHDJ6Awr7ZmvAq2h7un06h5FgIg8SUpUO1w8vaWNrLzuUuBAkSLWs7YzgVlWR/IxnTl1BzfxjzDPDqNXF4q3RN1vjOtEmTqE9zjIA+IAxMQKxYvKgDBuo/wZSjwQv9WZsaIfdzc5O+uPsV76bAMpiCbtj7b4mnmZoDLZtp+ZeKy5c4lhTSA1Xec2RXn4idR3uK0N7LKtp8NBCElii4yR8e/pKJTYaNbCWmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xMY4fbuyYWH5PKtdaDlF1Z2O4id+OapRDb/JDmXLU/s=;
 b=vqcHMw8ZmEu5u1Mp6AV1/T8T53Xc2SN+YJt7jF/NdndXUnk2BB6Z+vGMYBeEJ75esSqDxgELc28qy24Xe2KCn4z+Ve70GkGNq34ZpWfBCt1cQyyKm9DuxHeZl17dhSMWa2QPPS0k32q/j/8gUzDQODoeE18F9L5BmfTzGTon/NWaEwvRsh/i6aZf8pKpATD5whgAKh2WpqiJ85ApX0FKOsM0S218bkrDUzEWGG7f9vlJuAd/NSaR8D0+kiwDMfUWYHFkZ3Vn2bii3hwoCkibll5XrggwWBDgM3NyvpgIwvsqvytGZolNuVSVIxvcqSqXg6YbNtJShX/NwQkiiBOk/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xMY4fbuyYWH5PKtdaDlF1Z2O4id+OapRDb/JDmXLU/s=;
 b=JNTaFpqZl0JiXa7IsdaMLtFfucukQorvlDcmCpqje/UR+LLgO+mgSjIoiUgyySZMRtMs/iGdW50ux7So6S4/88gTua2yonZociVhJPNAE4pzGU8Bx6Hksjga7QZEib2ys3JL3a9rY0/Uift3aQV0x1NS8SgMY/4i08Wm512kC5hAxEp0g2ZmYRZHQ5zctK3SFV3UUhUileiEXGnu2y2uCRhDSwIq9zX9sM/yOy5ovyNF3e4gVTbBBTJcrF/gGZk2ZV/J/OQdQEusGgnuphZWGARgoiCptTetjtQkap4OEUOiaLWB+NBClV6CRFsCGpHT8Tq74Y6+/SCWHEIEXvWU4g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB9072.namprd12.prod.outlook.com (2603:10b6:8:be::6) by
 MW4PR12MB6803.namprd12.prod.outlook.com (2603:10b6:303:20e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Thu, 8 Jan
 2026 23:49:41 +0000
Received: from DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1]) by DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1%5]) with mapi id 15.20.9499.002; Thu, 8 Jan 2026
 23:49:41 +0000
Message-ID: <ebc909f1-ab70-4659-b037-bb82806fa159@nvidia.com>
Date: Fri, 9 Jan 2026 10:49:32 +1100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/11] mm/migrate_device: Introduce
 migrate_pfn_from_page() helper
To: Felix Kuehling <felix.kuehling@amd.com>, linux-mm@kvack.org
Cc: balbirs@nvidia.com, matthew.brost@intel.com, akpm@linux-foundation.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 david@redhat.com, ziy@nvidia.com, apopple@nvidia.com,
 lorenzo.stoakes@oracle.com, lyude@redhat.com, dakr@kernel.org,
 airlied@gmail.com, simona@ffwll.ch, rcampbell@nvidia.com,
 mpenttil@redhat.com, jgg@nvidia.com, willy@infradead.org,
 linuxppc-dev@lists.ozlabs.org, intel-xe@lists.freedesktop.org, jgg@ziepe.ca
References: <20260107091823.68974-1-jniethe@nvidia.com>
 <20260107091823.68974-2-jniethe@nvidia.com>
 <10a8c08d-38f8-4d91-8f4e-f6140f5f260d@amd.com>
Content-Language: en-US
From: Jordan Niethe <jniethe@nvidia.com>
In-Reply-To: <10a8c08d-38f8-4d91-8f4e-f6140f5f260d@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SY5P282CA0039.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:10:206::17) To DM4PR12MB9072.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: DM4PR12MB9072:EE_|MW4PR12MB6803:EE_
X-MS-Office365-Filtering-Correlation-Id: 443d0c54-ad85-430d-ecca-08de4f109766
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?R0M2bUY5MXRsZEp2d3V2TVBXOW5ka1BYcnlGTEo3NU9JWkpxWk1Sd3crOTJE?=
 =?utf-8?B?MUkxOE11ZWJHOStXU3RTOTYvQ2RoWHdCcC85SWZYdEJHb3BaYjgvMDFDMGdp?=
 =?utf-8?B?STF5UFFuclpiS2gwU2NXdVJzZWRGSE1mRHZsdmN1SjQyK05VaFZWbDROcDVy?=
 =?utf-8?B?Y3BzK1pMcTllYmFaenVacVExTUNOQlBMb1lCWno0bkN4bmdSZCtQbStGd09O?=
 =?utf-8?B?Wmd4MDhwU0IxR1lxOStTb0pLK1FTRzYyR1ZpaWowWXRUK2NaZ3lHRkplTVFU?=
 =?utf-8?B?UXRtYWdKM20rSFRBTzI3eEk5b3ZaVEdkMFpyM2Z3WGJRUUFtaEV2aTNCblVX?=
 =?utf-8?B?SlBVTk16K21zN3RRY0JHczNjRTlyaVNJMm1pY1BkZjNQeWNlTi8zT25JREZa?=
 =?utf-8?B?ejVIbW4wOUp5S0taNVFaYTBUMXBhc2ZhZCtha1NsM3M5azZMbnh6aHNoby9E?=
 =?utf-8?B?cUFaQThjc0lpeklaM2hORzF4ZjkyRXUxZEhtNFZlSGptM3ZZbFE1L3RHb0FQ?=
 =?utf-8?B?L3d5T2JLVE1KSW1IanZEOUZWYjA1ekhxQnNSbDVNbkJtSDhBczc2OEdPTGRn?=
 =?utf-8?B?Rlo5ajRvWUJNaHVxZ1hMTm10Ym9ydXFjZ01waHRFckY1Z3NkcmFOd3hBL3BB?=
 =?utf-8?B?N2tMS0ltRE0xSUZpZmNHVEhsbm9aMGtmSVY4RjA3cUhMSTFJdnZQUTVnVWJJ?=
 =?utf-8?B?YjRhZnBYMEw5L0lIc1dxRmk2RU5xSytQR1NlUzVWUXlrNW5xTGZEUEE4emRJ?=
 =?utf-8?B?TVQ2L0FzZXVDUE5HVjIzc0VQem84ZFFDcU11NDhWaDlBSDlabGZPMXBBSU00?=
 =?utf-8?B?Yy8vc1FBNVNUTzB4TG9ENGZlQks0a3cwL3VJd095NGovQ1I5dUFZdFk5aHdk?=
 =?utf-8?B?dHY5RkZ0QWUrVWhEN1FWdXpBbm84UGl1clBhN3Ivc1QwZDU2OGZhbGtBTVFB?=
 =?utf-8?B?OFhNN2NURFBLbldSWHh1Rm4xbmlPWkMvNzUvVitjNTBFanpEc0k3TVZENDR3?=
 =?utf-8?B?R3RnTDBjR3hxSHI5SHZHVGJrYlRmeXd0SVR5STF2ekpkYWhvZ1BPTWZlbm5Q?=
 =?utf-8?B?c2FWcTJXNTdEczJuZnEyQ1pLV05XRkNJNDQvbWwyZnJ1azlBTGxDNnVUQjRj?=
 =?utf-8?B?WHZJYXBqd2YrUVZqNkJseE1tK09mOTI1akVxczJNRFNWS09jWmdaM1g5dHEy?=
 =?utf-8?B?RFJNNzl4c0I0WXVkY2hQWHdTeEdQR09RbzR1cFlucUJqdVZlVnBkTWplcXRv?=
 =?utf-8?B?YXB0UzNWTXVCcXBWdU03NWJnNUxFSFgrN00yRzM1UW5IcU1aYjZ2YTYxNjZs?=
 =?utf-8?B?eGFCT3JHQ3Z1bzhGeHM2UE91d2RNcWZNdDI3d2RuM0FaazNId1BJS25YRFBk?=
 =?utf-8?B?c25QcTdKcjdVZnAvL0paTDFjNzIyelRwUzhqOG5MVHU5ei9CU09yTzIwOGQ3?=
 =?utf-8?B?clVUalBqNHdiQmVlK0RNd3FVZjBCYmtMbHNiaUcxSlNVampmR2hSWVJLS1dS?=
 =?utf-8?B?N3ZFeTR5SnNXKzEwd2xOdjNDeFpQRkgvS3YyeUpHaUdITS9wN0FiOWFQbjdI?=
 =?utf-8?B?MjNrRFB4RjRYTi8vSlo3aXJnbEZLUkVDelFnOWpRT3lMaE9oMWh6Yk9ZZC9n?=
 =?utf-8?B?eHNMTUd2eHdrUXJyTDVtdGRjbWhodEFDbzNLZWl0alFEakhsV1Z0RnRacWRL?=
 =?utf-8?B?d2IrVTJkVWtiazJSamFDMzZRTWRLc2ZhVm1WdmNmZzZCZVhMd25hOWhXdC80?=
 =?utf-8?B?NXpOYzJGQmhsTmJKckN0eExiNE1vMjYvWXNyY0hyV1h5dUdQZ2VUcm9hMTFZ?=
 =?utf-8?B?cHNHcGUvL3pnWDVCTFhGV1VTRWhTYUN4K29KazBwN3NpYmozRnlyeXZIcEpJ?=
 =?utf-8?B?UU0ya0JNc0Z0VmVJaVpwc2xQa29sOEhnS3ZjSGwyZGtXN3JnYVBOZ3RGOXk3?=
 =?utf-8?Q?I3EpE69f1q1mFONDYP7A5KRYC5XKFp4O?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB9072.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eit5U0dkYWFiNzdwQlZ1ME5rOVdybXdRN3U5VW5ZUnpaVVhhaGozRDRvazZP?=
 =?utf-8?B?am5vZHhkOHRUVjdWR1VhR2lVY25PdDBab3VnbXZ0ZVB4ZGRKamlyNDZLOS9D?=
 =?utf-8?B?NnJXUUV4MGxEZXh3REZ1RVFjSFowaXk4YXdkSkgvYmhVMXU4VGlweWx1ZGkv?=
 =?utf-8?B?enFZdVM3aUZYSmNVTHVFNFkwN1pxaHB0OXNDQ0NYditHK0pFQi9NZ2oyMW5D?=
 =?utf-8?B?MS9qV01YN2JJYWJhZ3R6aVhvUjQ0MWFZT0tVb3ZRWWxXSkU5L0hpT25rNDZu?=
 =?utf-8?B?cXltd2pTajU3eUZHT0xZTnYyK21YWkNMdDJHMEI2VVZBVU5SalE2Rnh0N2Rx?=
 =?utf-8?B?UnlBNkpKZUtWVXg2Y0FCUDlxUzJJWlpnUHJDRjBtVWRmZ1Jma0lpZUVaNlVI?=
 =?utf-8?B?dlhLTHNVRjdodTE0TmtkMlZ4UXpLK2lJbGh5NVRFSDcxUm5DRVBaU1V6ZE9E?=
 =?utf-8?B?QTExKzQ2VGU3VkJKTm1lMnhhSkZCQlNwc2VxZUJFemtLU2VQOUlJQ0lWdVZV?=
 =?utf-8?B?ZFptaWFRVzA4MWMxS01uUGhBYnNKR3A0VWw0K2lpd3VZcGh4ek4vL1l3UUs5?=
 =?utf-8?B?bTAvRjFnc0RHd1FaUWdDbllFTTlYSUdIZVBjR2U4blJtM2kxUmdNdm9zQjI4?=
 =?utf-8?B?N1F3RHVlb3JOeG44OHh5c1h5VEIwQUp6SGVVTG9NNTNaTmJJK1hVU1A3ZHBv?=
 =?utf-8?B?UUNTUTZHV2ZEZldPdUNSamZIYjh1N3NjejhQQ2lxakEweGRnbU9rYXV6WFFm?=
 =?utf-8?B?R0U5VVFrTGYzZXRlWXlWazljUXJmNHdNK0VhSnVYU2w1dXdpa1dOOVBCMyt1?=
 =?utf-8?B?Ulc4bmJjWjRuRjZXYlBWeHk0Yit2MytFRHFaK3Q4WnFnUm1JcFJ3eS82WDFF?=
 =?utf-8?B?K01TQWNPNksxcjVidEN4UzhyS1JXWW9EeHRpQUptaDlXU2pPNk1iV2xlODZ2?=
 =?utf-8?B?OUxKYXA2aHozNkZyWFNNRlZtSFY4cHJ6VGtCN25hT2xaSUJrZ1VabzliNVRY?=
 =?utf-8?B?WUdPVXErbG1FNlQ5NHBzZkplWDY5U2Q5N0NEZ1ZBMEVBTVdjMDdIUkJSTGc0?=
 =?utf-8?B?M3ppUEJtSWhuYTlGR01FdHptbmh5ODJtY1Nid3o3eHNsdGRSRGdTZlFLeFJK?=
 =?utf-8?B?VWdKcmM4Ny9IMFFERXpXYXV3eGxFVUl0cVBXUEhxWTNaM082RU45ckhOVkZQ?=
 =?utf-8?B?Y1lGdEhSVW1VNWZYa3VTcWJYdUdtalJJQWpvdHVZQ0VOMWF5bXVneTZvZ3Bu?=
 =?utf-8?B?MzhablBlSTNKeWZiSHlPNnVWY29KdWs5NElsZkF3cllVdWo5S1NBOTE0dEpk?=
 =?utf-8?B?cFJETm55dzV2am9pZlBldnZHV0RURUVCOU1wVDM3MExNeEpGbE4zZ2hocXFl?=
 =?utf-8?B?cit5SjRCTmJ0emp5U1JKcVNLS1BBbE83Y3lCWjhobVdUb0tDd3hkRFUyaTY4?=
 =?utf-8?B?VmZXdGd5eXgvSThLQUdrZjE5ajFsVXZ4K0NCWTZXYXZHSFM1ZUdKcHptVWRm?=
 =?utf-8?B?WTNLOUV3Rjh3Z0xUbE5ZbW1rcmxZbXo0WmFIandSRE9Yd2V1VEtBcUFRanYz?=
 =?utf-8?B?VjZ5T0FRMHJPTDhtZitDVEVQaDlPZmQyM256c2FCMUl6eFE2cnh1bTZPSU4y?=
 =?utf-8?B?Q2dZV0Q3V3ZvcURHUS9ZODNJd1k4T21xUjYreC9qY1VvZ1Z6SG5TcGU3d1dV?=
 =?utf-8?B?VlRuMXo4K1BqdXhWRUZDa0Y0TTJVL3Z3S0NDN1dDbUllZWQ0OW96ai9LMUwz?=
 =?utf-8?B?YnhIVTdLNkluUDkxUm1aQmVzU2RlN0M2all2RjhoUmNZaHhMZ2NkV1BBcllW?=
 =?utf-8?B?ZmVYWCtOUjN2WHZhZUNGd1V3T3VacGdWWUNyb29aS1BhSGhrTkhHN0lGa3BT?=
 =?utf-8?B?b3JjOE9EY2ptdGhZNUxEcStRNGlUY0NIN3l6VWtvbjRNOGJtaTFxVmFRVjhi?=
 =?utf-8?B?OEhpK2NyTTRvR1dOQmVGbHhZMlAxU1FUVCtFc0ljVVUxME5Ra2cvTW9nM2E5?=
 =?utf-8?B?TFR3cVgrWDVxM05TSXpaV0liVStDb1BWYzk1bGtTOXdXcWtQTEpaeGIvOG9l?=
 =?utf-8?B?TFp0eElvM2RxUG9tMk1EQldZOTVVYUFpampONFJXNUFOWG4wbGsvcFg5OWl4?=
 =?utf-8?B?SERpekdNeXRoaGZNb2ROQjFuaTN5MUhDbkY5MVYrdHFRMGMwZzJ3QlBSV01U?=
 =?utf-8?B?SHpQNys4K1ZDZ1NsKzNKSkdtVTNRWmpsQW96eFRWbktkc1BvMUpIL1VWKzVv?=
 =?utf-8?B?NFFUM1lQbzdtZFNnVHA1QW5MdmZsd1V3NHRhbWd3NFRtTE1PcWpwZDFkejAx?=
 =?utf-8?B?LzN5OGNyd29ZWHRlMldldStiQUI0dGF1eEx1ZklPTTZiSHQyaVBZQT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 443d0c54-ad85-430d-ecca-08de4f109766
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB9072.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 23:49:41.4226
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YqnR12TqYCoUToscxP6+RYeeB+Yush/9el8Jzbp+CXTkrxpjAwEhiqkiWNIJaN7VgtdlmaVs88ij4ImyYasB6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6803
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi,

On 9/1/26 07:03, Felix Kuehling wrote:
> 
>> @@ -646,7 +646,7 @@ svm_migrate_copy_to_ram(struct amdgpu_device 
>> *adev, struct svm_range *prange,
>>           pr_debug_ratelimited("dma mapping dst to 0x%llx, pfn 0x%lx\n",
>>                        dst[i] >> PAGE_SHIFT, page_to_pfn(dpage));
>> -        migrate->dst[i] = migrate_pfn(page_to_pfn(dpage));
>> +        migrate->dst[i] = migrate_pfn_from_page(dpage);
> 
> You missed another instance of this in svm_migrate_copy_to_vram.

I might be missing something, but is there call to migrate_pfn() in
svm_migrate_copy_to_vram()?  I'm seeing svm_migrate_copy_to_vram() calls
svm_migrate_addr_to_mpfn() - that should be handled already.

Thanks for reviewing,
Jordan.

> 
> Regards,
>    Felix
> 
> 

