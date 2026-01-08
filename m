Return-Path: <linuxppc-dev+bounces-15426-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E1DCD05F89
	for <lists+linuxppc-dev@lfdr.de>; Thu, 08 Jan 2026 21:04:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dnG7z5x9jz2yFn;
	Fri, 09 Jan 2026 07:04:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=40.107.201.39 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767902655;
	cv=pass; b=dbZqgwddooWxFxUB6G86cokSNRCS4q6ePnPH3m/1ILPoFwvnMG5uAcO2qY5wvqUZj6vmHe77bAYvpDG23I4GONfJVZbB2w5owBXS0q+TSQksBNbq4iRImVuumB2lK+3vN8AeLMZE0rNTs4mfuTzEtmXcAChf0H9zgJxQr4P7WvkfkHywjYXuU2eTTWgOuQtl6ef0+fRSvG6E0uT+0iz4kcgiTHXl2xTSOkdH1Sh1hYBs0nXJCUTGcmW2RzsObsTn21gn0EtvcR20MmWhCPYIB+EczBJVG2yuyMg+thdFiRLH34kEJhauNf2qVgIJE7wP9tQl97Yc8+gILmSayfxDsA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767902655; c=relaxed/relaxed;
	bh=3LZUFWLwBui+1fvJ5LFIOPM3cn/aPYtbj1KClKPdtx0=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=NYfzQy7h9nXsM6jJ2ppj5Ptd+cEsDNuoQ1Vgnuni5Ka3JqD9OSBKIX5BE2DOwvYezOczgX7a9y4egG1/ZJjGanUOntH5JkKePxwPJ8j7BazUCxW1C34iiueHi/zWQF6KXtyX2nAm7lGiUg5rD0bOW2y8PLL/acgoM+QTT0V4ZCePHdfZKXT3QuFneN7mam8RWHALd64xLBaiLMglCsMhax1f0MmLKXMOKe4HRc4yoON2ia/dr7bzFSt/zV4LWQ2q630XYS1H/L1uT1Y6/hddG1nGRL1OQyPXgdspiXzdk/Tr4FnFq8FOCDswq4DozLinT7x3ngy5k87l+COz0+aeOg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=p/MWjL2p; dkim-atps=neutral; spf=pass (client-ip=40.107.201.39; helo=ch4pr04cu002.outbound.protection.outlook.com; envelope-from=felix.kuehling@amd.com; receiver=lists.ozlabs.org) smtp.mailfrom=amd.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=p/MWjL2p;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=amd.com (client-ip=40.107.201.39; helo=ch4pr04cu002.outbound.protection.outlook.com; envelope-from=felix.kuehling@amd.com; receiver=lists.ozlabs.org)
Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013039.outbound.protection.outlook.com [40.107.201.39])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dnG7y57xTz2xpt
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 09 Jan 2026 07:04:14 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XA9lTcfS8WFwCpKNfJPQ4ZK0F3K/WSW8Ld7cbdMKlGOz6OFsjkVO9IvK1z9jywFo4F5KYgDh8zVtpl256jUOyId/4MIHhdTk2Z/tqCma4r28BA5HWoAy2qDbTlnKhJRcOy8d6v/ODWNuIklk9ydbQGy7odcg90cxkHb4UdlT+cY1C8wiXePakSLEqNCFew71rh4+TldkwqdfN8zgdfX6efZD/HE5T9aekNkXOC3xEPJ5cpCMx9M3y9Ew65fVH9RwpF8kqanqZ1Dz/qZ0pdljKo+Q+UzzWmrUVIkmNBfdxM7b8/SHrUIwGBh1p7UknDWSJs1aw76DPya2JWyaSBddkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3LZUFWLwBui+1fvJ5LFIOPM3cn/aPYtbj1KClKPdtx0=;
 b=ilu70kuPE8FJQWzHyIV1qdFsDaJKYWxDcSNNaol51d+NKNZp5gsCmjLf6qZElAKovReKxUMWKnztMX8PXYwRm1GDPsxtGlZ6Ygw7ounGoRV9YxTM6vYrm/umoeBSkrGP9G4o5+RLVUtpWLQxkAmK9lIxYH4L77RXYY+teFnF7pZqwcXZn5D5Q3bQZT3l53bZW6d38HErAds4IfO4WPGA7q/KXtt7AF7QYX5cuPxLOn/CfSUe3rDzHRcvoW3nbjP+xochuFaxvRo9yoKIcTa4atcu/BzYIPhqCd5eqg53cFNqjPs28tREQ8YWd1LV1ADLxH1FoH5WsLgYg42gYNuTWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3LZUFWLwBui+1fvJ5LFIOPM3cn/aPYtbj1KClKPdtx0=;
 b=p/MWjL2p2lTp2CLWB5ejo0dC+0nLagN2x3Xi3ZSqUzoYI9NB1l/cTVcT1zAAJYogg/+T0oNGAZAtKhSo+XjtIAMcFHU52Oyo1WDCNdA0mIhh2nOlF75oFsNtum7whuVSsfPGj8AX2ypAFxNVXDvbYKx5LXDdU58Fk0Yf5+nw4vE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by SN7PR12MB7204.namprd12.prod.outlook.com (2603:10b6:806:2ab::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Thu, 8 Jan
 2026 20:03:33 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::9269:317f:e85:cf81]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::9269:317f:e85:cf81%7]) with mapi id 15.20.9499.003; Thu, 8 Jan 2026
 20:03:33 +0000
Message-ID: <10a8c08d-38f8-4d91-8f4e-f6140f5f260d@amd.com>
Date: Thu, 8 Jan 2026 15:03:30 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/11] mm/migrate_device: Introduce
 migrate_pfn_from_page() helper
To: Jordan Niethe <jniethe@nvidia.com>, linux-mm@kvack.org
Cc: balbirs@nvidia.com, matthew.brost@intel.com, akpm@linux-foundation.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 david@redhat.com, ziy@nvidia.com, apopple@nvidia.com,
 lorenzo.stoakes@oracle.com, lyude@redhat.com, dakr@kernel.org,
 airlied@gmail.com, simona@ffwll.ch, rcampbell@nvidia.com,
 mpenttil@redhat.com, jgg@nvidia.com, willy@infradead.org,
 linuxppc-dev@lists.ozlabs.org, intel-xe@lists.freedesktop.org, jgg@ziepe.ca
References: <20260107091823.68974-1-jniethe@nvidia.com>
 <20260107091823.68974-2-jniethe@nvidia.com>
Content-Language: en-US
From: Felix Kuehling <felix.kuehling@amd.com>
Organization: AMD Inc.
In-Reply-To: <20260107091823.68974-2-jniethe@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR01CA0037.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:2::9) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
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
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|SN7PR12MB7204:EE_
X-MS-Office365-Filtering-Correlation-Id: 497b5969-5918-45d1-4602-08de4ef10045
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|7416014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bCtMcm0yN1FhWC9TNFpwVFNTVCs4ZEMwTkpYZUJDdHIzendXeER0UWd0VEFw?=
 =?utf-8?B?U3grdFc3bktEbUZCNVk0UHZqcm9qS3A3RkZBZlp5UlpVaVpsNFdPR1M3Z0hW?=
 =?utf-8?B?dThaOHd1VWlxUit3TEhldGdRWnFsMGtHRnh0T3Z0R2VDNk1CZENyaXkvSUxa?=
 =?utf-8?B?ejN6QnBYWEk5R2VvekNPVjhRU2JoZDBEc2xLQ0c1VnJHTFNCMXA2Y2x2dWJy?=
 =?utf-8?B?N2kyVlRwZ2hCQ3FLZ2NmMEM3UUdTbU1PclU1bk02UkdqTXJHY0VPM1JON0Fw?=
 =?utf-8?B?cEJ1bWNkVWJLZTVtSDU2N0V4U3l5a003VkpteHFvMGFjdEFLUFgwbkdnK3pC?=
 =?utf-8?B?d2w5TTdKeDRLN3JsWk9veE55L0JHWm1rZG8zWEt4VFhLTzlBSDVCKzZoSnN6?=
 =?utf-8?B?YXcvQ05MdkRKbXhRdUQ1VGJSaUJFc25mSy9TRGx5clZ5VWEwZDJmemE2K3p2?=
 =?utf-8?B?czdHTnZpQ2w1MWgxczdvNENEQnJ2Wjd1K0lhaUFoY3FMVXI4RjcxOHM1dUxS?=
 =?utf-8?B?aDZqUUNsQ2ZBTFdVVk9xWkZIb3FXbHNQMFE1WDNCZ2N4M0xTdElNOGZXSk5K?=
 =?utf-8?B?S3VWRGhNc01tZFZ4U05GNXFaK2VrYjZITC9uSndxRVpvRFRWeVVXSnZnVlFS?=
 =?utf-8?B?a3FHMHlWNjhGeTJpYktJeWVTOUpIYUlmOExGRUFYZTR2RnhkWUJnNDRzWnRG?=
 =?utf-8?B?YURKRHMxdUV6SlZ6OWZ6dTJHVUZYdlhvT2dSdG5lME5tY0FxcWsxYjh4QkVQ?=
 =?utf-8?B?V21ibUFDQ3FXMUxGSFJWbm0yb01CYUlQbjRhdFRrWjgvcUMzVERsRGh4bXUr?=
 =?utf-8?B?aEVaMUlOMUlyVW9xWVpBQWcycStQOGtzcEF1RWo4ajFHYlZKVko1UUlhcER4?=
 =?utf-8?B?eklkRnFSeUFqcFZjbkJCNXRKWGVRU21NVUIzU2hOY2JXR2dZV0RhT3Z5djFu?=
 =?utf-8?B?WjZnTXgvY1RFdVJpanc1aUJkNVdOa2sxWkgrN2tBU2JKZkg2TWtqUUJFQlhu?=
 =?utf-8?B?T1FQekNGU1pTbGhWMGZjVExqTVVDSElIZENVZGVUVFFWa3ZnVWdHcHlxUHRp?=
 =?utf-8?B?RmVRV05oTGh5Qm9MaW5qdmg0TVd0TjhJbENPcWR0Tjd0ZGQ5dFpBb2ozZ2Ro?=
 =?utf-8?B?YlRXY3RCMCtKY0xoU29YUndzOXZJV0tIdlFRUU1HOEdSMXg4ZnM2eHJSMDh4?=
 =?utf-8?B?T0IxRHA0bDdMSzAyTmJDL0R1MGZTRkhUc2RxTGFFMTZMZDhIc2JJWG1xWDlo?=
 =?utf-8?B?Zm9pRVBlazltQ29Na091aUJkU1RYaDY4UW1YdFdzL0NEWW5LcFVsS2V3OSt3?=
 =?utf-8?B?aEFiTjFkSkdKM3pTMmZLRElpeDhFczl2Uk8vS2pudUFVV3NCT01ScHZHMk1h?=
 =?utf-8?B?Y3NMa3BqcjIrUGRSM0FSS09OMDlaRlBLdGg0Z1pjdFdHWFUybFFHbERnYUhk?=
 =?utf-8?B?K1Y5enV5dGQ3Z1h5NTAvM2MvNmpOTUFHenRFUWdkTHdGazNNMVp4eDFHV2p4?=
 =?utf-8?B?QUNvUFEzdjFnWDBWbHJxR0RFc1ltd1locWZwY0FlUllEZ3JEajVWMm1seDc1?=
 =?utf-8?B?TFZFS05SUktqbUM5QjBjS1BBN0FXQ1ZQWWlYckQrY3JPNkhOQ2xid2ZTNDdO?=
 =?utf-8?B?TnQ3YmNNQlFxcktvSWExcldJWFFzYVcwamFIaEVFRGZRZ3o3bk9kbDJUMzEy?=
 =?utf-8?B?NkpIU1ZjYlFjUzJRaTltNnFEY0ZmektqNkROaVJtMU80bnA1SDltTDZTZkJj?=
 =?utf-8?B?RmU2S2NmemlQL25YOURlZzd0Yk9YUUxCQUFObGdSZU0wZ21DWWMzbDQ1MEtL?=
 =?utf-8?B?NDRVQktMS1FpNThoUkg3Yy9ISVdaRjZQV3JoN0c4dC96ZlJJeXcvWlNveks2?=
 =?utf-8?B?UWVSdjBoa3hFNUtWY3BxTXZjUFd0cFRkenNSQjlybXR1THRpUFo2WDhTN2Vj?=
 =?utf-8?Q?tWuhEnr+ifvvKrHO8eD+FARpBK2g75+K?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5115.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7416014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dU5BMm9NNjkwVDh4UWYyWFd2RGpjQndoUEVZeXpIb3J1cnE0WUJZb0d1amVC?=
 =?utf-8?B?YXVPa01Gb1VnZ2JrV21GVVlKNzRFbWQ1dS9zKzA3cjFJQ1NXQVB1MVZtTWJI?=
 =?utf-8?B?bmpVMkNKd2tOaFVTejUvdEJVd2dxc2ludDU4eDViR1MzanRYUmtLdjdDSStK?=
 =?utf-8?B?VmtVUC9jcWJrK3RTOUFlcHExSlhDYXdXSGNwZW9sYnBLV1BDaitkTXFPZjJG?=
 =?utf-8?B?TGZSMC9GNExvVzRkcTJ0Z1d1NUNWTjR5SHgzNEJ6Z1FpeXI5VUdzZ3lxT0d2?=
 =?utf-8?B?eHJQS1hBSkR0MUc5bGFkWUwyenBRTThuclhTZVZPOGR2SkxianI3NXlPc3ln?=
 =?utf-8?B?dG90UG1zQk9aditVNWFPVzNVYzNBNzRZUDA1SmhrNDlneWdYYko5S3ZSTUpJ?=
 =?utf-8?B?Y2lRSEl6cE9zYzk3Zi9IWGZ5SzJmenVUSWMzYkR0SUV6RmsyNHhzWXZMYVg3?=
 =?utf-8?B?bEpRbzRxK3NVRS82aVdKL29YRGRZbUl1aDFPV3JiRFAyK3QzbVI3SWlEaHda?=
 =?utf-8?B?anBmclNma3BiWW1lT2pOcXpEdVJJNGJTc2tEWmxxaGVqajk4RlJwQk5MVmNx?=
 =?utf-8?B?RXVaSGMrUDNGVmRJVCsyQnNDNnJuRTE4a0hHSWRidThLL255aXJhSDRjbGRy?=
 =?utf-8?B?T09PRkhKWU1SVER0eDlsZ1gycXozb1NuTDJlUGxWUUVkSFdHYmJKczgvL2pM?=
 =?utf-8?B?L2ZlZjZONEl3SmFYcE5nWERhSVk5UEQzd3NqK0VMSzdKV01wNmhHUmIxbWNY?=
 =?utf-8?B?NTVsSFRxNVI2cjdiNkxVUjdYNG9WVU5GdkxwUWVuYUhxNktiOURKKzlORXIx?=
 =?utf-8?B?YlNmbFhDb1g5ZGthZ0VBZURvMVV4MnpISVFleGNoZjFZb1RnOG9pN1pTdS9j?=
 =?utf-8?B?Wi9zNG1GUUp1M085cEw2VWMrUTlnaS9hZEdVdWdnM3YrUHpGR1JCWEZFZlRJ?=
 =?utf-8?B?SGU1Y2E3aUNQZnFHaVo0TCtCVGlwZzBYa0RrNGFrbUE1QVdYZkliRUdqRU01?=
 =?utf-8?B?OUl4TXdnb09HQW5jb0xtc28wcE4zcGhyRHF1VnRXOHNWRWVvMkovZWVhN1RN?=
 =?utf-8?B?Zm9XYXZjTk9mM1pzKzNJck1RYm5QMGcxU09OTDNhK0htcnFDaFFxa3RmakFH?=
 =?utf-8?B?L1Q0SHpkbGRuWlVXM1M0TG1FcmtCUTREY29oM3RoQjRnOWhreC9oZFg1b2dp?=
 =?utf-8?B?UmhTQmlkZGtnRFF5bFJZYmM1RnczZzZrUERPbE9vcnkyN2hDeTBzaU5EakRB?=
 =?utf-8?B?UEUwSk5rR2tVK053MGM5Rnhzek5uem40NjZRR3lqQUUzSXZyeklGTmZoNVBT?=
 =?utf-8?B?M1dmR00zangwMGgrZU54dWFGOExuOUJheFg0ckh3YlJsMHVka25KVFU2bkVl?=
 =?utf-8?B?V2Z6eVlZNDcxdUVmVmF3TzZnT3YrZmhWRHMvVk96eHhMSkNXcVNVbFJ1M2k5?=
 =?utf-8?B?TDI0RjdtM2wxYk85dmRNWXErbWFTdmVhZk5WVCs3S3BEY2phZWd6RFNNd0Rw?=
 =?utf-8?B?VFFYYmhMbnpsMGRvWmVROHlDUnFMOVltOS9hRzZoZmFqeHZXSWkwWHIrRTNX?=
 =?utf-8?B?Q1dlYzFIR09GOUFJVUtjZmJpLzRnSjBrNU8vK1FROHpnR1prdDRpTkU3WFUv?=
 =?utf-8?B?VWFhWlBQUTRjb0k3ZTFRaEsvT3ZYQ2lsMDk1Q2RKdnlVcnk3bWdPT2RpWXlz?=
 =?utf-8?B?LzFNT2VTRDRwSVdQK1hWZG5tOXRsd1hnREhhZU9KajN5bEl5T2tJelRXTWVa?=
 =?utf-8?B?aVlsck9NNVdwMkxmSUhJMU5HMTNFRC9HM09zVEdHb1FnbHFjTGZlRS9WbUNv?=
 =?utf-8?B?czZ4SlJQZVB5VldNc2RJdXdJTU56bEFjd1hZeUVtdDMxSHN6MTJ5RkhlVmRt?=
 =?utf-8?B?VjRJb2hMby9abTl1VThVdU9DMCs0WEVpbUUzdi9LWXNZQldtTktYZTBJNDZl?=
 =?utf-8?B?OGxBUk1QR0l6NzdoeEovRnhHUHd2YXdqUVNHOFlIRjEraUgyY1ZFRTJGdjNV?=
 =?utf-8?B?bGNjb3F6eTdrMkloWWFqS1ZRNHRyNGplczZwUUluWnBxQ1E2dWFkSE9YVVBU?=
 =?utf-8?B?cVlaZjlDT1FtY21FRkNKRktFczFRbllmb3hPTjE4Vi9VM0NZY05wUTFaTUlv?=
 =?utf-8?B?cWRMNkxFRVpvNHFXY1p0V2l5bFNCRG9weUoxTENOZXRiSnJ5MlJ0OXlEbjVQ?=
 =?utf-8?B?Q0FSNHVHcHRlWWxFOFp6NGRLSkhoNGF1NURsRTM3cjNmekc1eFlmMWpyWUU1?=
 =?utf-8?B?OElmWTNDaTV0VmltdUhhbG11WEVyUEphYWd5U3dBcmZ4bzY5ZTU5c3J2eDJ4?=
 =?utf-8?B?aHM0QXQzQ09PQ0tQT1JhSXdZRHhoYzB4MEU0d0tzb3FhdUNKdXRKQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 497b5969-5918-45d1-4602-08de4ef10045
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 20:03:33.3021
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9S4AYtZMQldzIJPDD7oBzfqfWhBD5c7TBlt6jHcdj4rAixOs08RSZaNlDYlNP+KpwXm/xmiw97T4O41d/E66Ig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7204
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


On 2026-01-07 04:18, Jordan Niethe wrote:
> To create a migrate from a given struct page, that page is first
> converted to its pfn, before passing the pfn to migrate_pfn().
>
> A future change will remove device private pages from the physical
> address space. This will mean that device private pages no longer have a
> pfn and must be handled separately.
>
> Prepare for this with a new helper:
>
>      - migrate_pfn_from_page()
>
> This helper takes a struct page as parameter instead of a pfn. This will
> allow more flexibility for handling the mpfn differently for device
> private pages.
>
> Signed-off-by: Jordan Niethe <jniethe@nvidia.com>
> ---
> v2: New to series
> ---
>   arch/powerpc/kvm/book3s_hv_uvmem.c       |  2 +-
>   drivers/gpu/drm/amd/amdkfd/kfd_migrate.c |  2 +-
>   drivers/gpu/drm/drm_pagemap.c            |  2 +-
>   drivers/gpu/drm/nouveau/nouveau_dmem.c   |  4 ++--
>   include/linux/migrate.h                  |  5 +++++
>   lib/test_hmm.c                           | 11 ++++++-----
>   mm/migrate_device.c                      |  7 +++----
>   7 files changed, 19 insertions(+), 14 deletions(-)
>
> diff --git a/arch/powerpc/kvm/book3s_hv_uvmem.c b/arch/powerpc/kvm/book3s_hv_uvmem.c
> index e5000bef90f2..67910900af7b 100644
> --- a/arch/powerpc/kvm/book3s_hv_uvmem.c
> +++ b/arch/powerpc/kvm/book3s_hv_uvmem.c
> @@ -784,7 +784,7 @@ static int kvmppc_svm_page_in(struct vm_area_struct *vma,
>   		}
>   	}
>   
> -	*mig.dst = migrate_pfn(page_to_pfn(dpage));
> +	*mig.dst = migrate_pfn_from_page(dpage);
>   	migrate_vma_pages(&mig);
>   out_finalize:
>   	migrate_vma_finalize(&mig);
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
> index af53e796ea1b..ca552c34ece2 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
> @@ -646,7 +646,7 @@ svm_migrate_copy_to_ram(struct amdgpu_device *adev, struct svm_range *prange,
>   		pr_debug_ratelimited("dma mapping dst to 0x%llx, pfn 0x%lx\n",
>   				     dst[i] >> PAGE_SHIFT, page_to_pfn(dpage));
>   
> -		migrate->dst[i] = migrate_pfn(page_to_pfn(dpage));
> +		migrate->dst[i] = migrate_pfn_from_page(dpage);

You missed another instance of this in svm_migrate_copy_to_vram.

Regards,
   Felix


>   		j++;
>   	}
>   
> diff --git a/drivers/gpu/drm/drm_pagemap.c b/drivers/gpu/drm/drm_pagemap.c
> index 37d7cfbbb3e8..5ddf395847ef 100644
> --- a/drivers/gpu/drm/drm_pagemap.c
> +++ b/drivers/gpu/drm/drm_pagemap.c
> @@ -490,7 +490,7 @@ static int drm_pagemap_migrate_populate_ram_pfn(struct vm_area_struct *vas,
>   			goto free_pages;
>   
>   		page = folio_page(folio, 0);
> -		mpfn[i] = migrate_pfn(page_to_pfn(page));
> +		mpfn[i] = migrate_pfn_from_page(page);
>   
>   next:
>   		if (page)
> diff --git a/drivers/gpu/drm/nouveau/nouveau_dmem.c b/drivers/gpu/drm/nouveau/nouveau_dmem.c
> index 58071652679d..a7edcdca9701 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_dmem.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_dmem.c
> @@ -249,7 +249,7 @@ static vm_fault_t nouveau_dmem_migrate_to_ram(struct vm_fault *vmf)
>   		goto done;
>   	}
>   
> -	args.dst[0] = migrate_pfn(page_to_pfn(dpage));
> +	args.dst[0] = migrate_pfn_from_page(dpage);
>   	if (order)
>   		args.dst[0] |= MIGRATE_PFN_COMPOUND;
>   	dfolio = page_folio(dpage);
> @@ -766,7 +766,7 @@ static unsigned long nouveau_dmem_migrate_copy_one(struct nouveau_drm *drm,
>   		((paddr >> PAGE_SHIFT) << NVIF_VMM_PFNMAP_V0_ADDR_SHIFT);
>   	if (src & MIGRATE_PFN_WRITE)
>   		*pfn |= NVIF_VMM_PFNMAP_V0_W;
> -	mpfn = migrate_pfn(page_to_pfn(dpage));
> +	mpfn = migrate_pfn_from_page(dpage);
>   	if (folio_order(page_folio(dpage)))
>   		mpfn |= MIGRATE_PFN_COMPOUND;
>   	return mpfn;
> diff --git a/include/linux/migrate.h b/include/linux/migrate.h
> index 26ca00c325d9..d269ec1400be 100644
> --- a/include/linux/migrate.h
> +++ b/include/linux/migrate.h
> @@ -140,6 +140,11 @@ static inline unsigned long migrate_pfn(unsigned long pfn)
>   	return (pfn << MIGRATE_PFN_SHIFT) | MIGRATE_PFN_VALID;
>   }
>   
> +static inline unsigned long migrate_pfn_from_page(struct page *page)
> +{
> +	return migrate_pfn(page_to_pfn(page));
> +}
> +
>   enum migrate_vma_direction {
>   	MIGRATE_VMA_SELECT_SYSTEM = 1 << 0,
>   	MIGRATE_VMA_SELECT_DEVICE_PRIVATE = 1 << 1,
> diff --git a/lib/test_hmm.c b/lib/test_hmm.c
> index 8af169d3873a..7e5248404d00 100644
> --- a/lib/test_hmm.c
> +++ b/lib/test_hmm.c
> @@ -727,7 +727,8 @@ static void dmirror_migrate_alloc_and_copy(struct migrate_vma *args,
>   				rpage = BACKING_PAGE(dpage);
>   				rpage->zone_device_data = dmirror;
>   
> -				*dst = migrate_pfn(page_to_pfn(dpage)) | write;
> +				*dst = migrate_pfn_from_page(dpage) |
> +				       write;
>   				src_page = pfn_to_page(spfn + i);
>   
>   				if (spage)
> @@ -754,7 +755,7 @@ static void dmirror_migrate_alloc_and_copy(struct migrate_vma *args,
>   		pr_debug("migrating from sys to dev pfn src: 0x%lx pfn dst: 0x%lx\n",
>   			 page_to_pfn(spage), page_to_pfn(dpage));
>   
> -		*dst = migrate_pfn(page_to_pfn(dpage)) | write;
> +		*dst = migrate_pfn_from_page(dpage) | write;
>   
>   		if (is_large) {
>   			int i;
> @@ -989,7 +990,7 @@ static vm_fault_t dmirror_devmem_fault_alloc_and_copy(struct migrate_vma *args,
>   
>   		if (dpage) {
>   			lock_page(dpage);
> -			*dst |= migrate_pfn(page_to_pfn(dpage));
> +			*dst |= migrate_pfn_from_page(dpage);
>   		}
>   
>   		for (i = 0; i < (1 << order); i++) {
> @@ -1000,7 +1001,7 @@ static vm_fault_t dmirror_devmem_fault_alloc_and_copy(struct migrate_vma *args,
>   			if (!dpage && order) {
>   				dpage = alloc_page_vma(GFP_HIGHUSER_MOVABLE, args->vma, addr);
>   				lock_page(dpage);
> -				dst[i] = migrate_pfn(page_to_pfn(dpage));
> +				dst[i] = migrate_pfn_from_page(dpage);
>   				dst_page = pfn_to_page(page_to_pfn(dpage));
>   				dpage = NULL; /* For the next iteration */
>   			} else {
> @@ -1412,7 +1413,7 @@ static void dmirror_device_evict_chunk(struct dmirror_chunk *chunk)
>   
>   		/* TODO Support splitting here */
>   		lock_page(dpage);
> -		dst_pfns[i] = migrate_pfn(page_to_pfn(dpage));
> +		dst_pfns[i] = migrate_pfn_from_page(dpage);
>   		if (src_pfns[i] & MIGRATE_PFN_WRITE)
>   			dst_pfns[i] |= MIGRATE_PFN_WRITE;
>   		if (order)
> diff --git a/mm/migrate_device.c b/mm/migrate_device.c
> index 23379663b1e1..1a2067f830da 100644
> --- a/mm/migrate_device.c
> +++ b/mm/migrate_device.c
> @@ -207,9 +207,8 @@ static int migrate_vma_collect_huge_pmd(pmd_t *pmdp, unsigned long start,
>   			.vma = walk->vma,
>   		};
>   
> -		unsigned long pfn = page_to_pfn(folio_page(folio, 0));
> -
> -		migrate->src[migrate->npages] = migrate_pfn(pfn) | write
> +		migrate->src[migrate->npages] = migrate_pfn_from_page(folio_page(folio, 0))
> +						| write
>   						| MIGRATE_PFN_MIGRATE
>   						| MIGRATE_PFN_COMPOUND;
>   		migrate->dst[migrate->npages++] = 0;
> @@ -328,7 +327,7 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
>   				goto again;
>   			}
>   
> -			mpfn = migrate_pfn(page_to_pfn(page)) |
> +			mpfn = migrate_pfn_from_page(page) |
>   					MIGRATE_PFN_MIGRATE;
>   			if (softleaf_is_device_private_write(entry))
>   				mpfn |= MIGRATE_PFN_WRITE;

