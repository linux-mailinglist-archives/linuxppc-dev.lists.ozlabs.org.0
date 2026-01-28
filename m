Return-Path: <linuxppc-dev+bounces-16342-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UG0eLtCZeWkNxwEAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16342-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Jan 2026 06:08:32 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B8E509D268
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Jan 2026 06:08:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f19K91bZDz30M0;
	Wed, 28 Jan 2026 16:08:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c112::5" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769576909;
	cv=pass; b=m/vHePJlEVu6vJhHuQ+4CGWT4Z6MQK3uOJ+FXrbOWludsIibPM3tEnIU0VKorOSsSHPdNRQETRAQjerOjX6vqQUf6un+LCrkfsErU7X7qp7QyKyDUTbfTbLDSz5IRHxaJz5jnYPxeS60sM3spJWRcPyw1Lzz+69cxna+hKJxLkN9zHASH57X+h7QyJu/ZI/nlXpB7nyk5Ue//yqvOhNWRgrm5dPOipiDRRRB5TH3b+VxBILzA8svzhLyueAOAeNeKfUQVV9KDcKUxDhMo6uLY8vLdV3wLk8NIQfr6CwaxCqn0IYAdzn3mnbPRPEKwM/9b3egKR8rMD9mSbLNgfRSFA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769576909; c=relaxed/relaxed;
	bh=IM83VrZvc7mv2fjhweJRuV6Fe8jEP0ZVg/W4iVegIhg=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=YLmn5EMmF0iIHIvhZt5DdaqCdR1Sh0UbfIzlYid/TKU2NQtdLImgfboeH62fYyQZ3D7pVQtABv/FcIOorYnuPuYG3tMbiSrfTdPv/srI2ImimLUeulA+OxUNEfFTwoAvu2GjXqeqsMCDsRHsUHIMo2+TBhKp7Pp9zXlrD1AV24qdPeNdLfX4aknprUguG1R8NJUS/5yrQxATsvzdqtMABCDukg/CCLIk56yYvWPOh9k+5zE8GJAaOSxsW4KdrobA0+Rd38xHdhaJpY/apPFTb0+OGqFT5rZ7da/9XRf29D6NSXBMsj4arFljoPi6ji//fiqMwfm8B9LWPzf2pd260w==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=XoigNfrz; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c112::5; helo=cy7pr03cu001.outbound.protection.outlook.com; envelope-from=felix.kuehling@amd.com; receiver=lists.ozlabs.org) smtp.mailfrom=amd.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=XoigNfrz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=amd.com (client-ip=2a01:111:f403:c112::5; helo=cy7pr03cu001.outbound.protection.outlook.com; envelope-from=felix.kuehling@amd.com; receiver=lists.ozlabs.org)
Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazlp170100005.outbound.protection.outlook.com [IPv6:2a01:111:f403:c112::5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f19K64yZhz30Lv
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Jan 2026 16:08:25 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PsmBLs+oHz+8rPdjvEV5TlGRO0aH7Za0zCWw2Q2Cf/V/mQL2veRu+/3ywHvT+woy0jmNivdT/04I/I/dS2u+yu5tH7zhDM7j21uCFzGDWw3VbDCovyiT5G0kfSO5Zzr+NtTuZbUHmDa7hnWN6+wOwS75HDv3ugJlW/DbthNQrIuHFzS8inTVY0UY5rHs6BjvrKiGuP2LZ2lsNGFL91l3Qm5W9X4BDlhgyy43Nq0W7E5BExYma6tTf+v9TcP6wt+YhuFPpzrl40FTX2w3kgHc1GAKdvSuNpc2ZNdXRIJBk0fyKy3hGoC+HcZh8Ai/xaQGMtvibQE03ivsKry66Udrqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IM83VrZvc7mv2fjhweJRuV6Fe8jEP0ZVg/W4iVegIhg=;
 b=H4pRw57UlDW2RYZTxY6S7WTD7ojcAa7SZ7a6n5zmXPjPowgCcyeu7faPXxm4xevq82k0vU1BL4R50mMXduBuqwMnAyqvjkcSb91HjvoKPtuYbn+xMLoQo1nmD0luUyR+KFaK9evzqF+Ej/HT1YgeJewHye88khS6tKzglSZBThpMVs7tV1aYKDUT3F2fIfpxVW8ET3SEuS9dyKMeMUacmn1Em4DZpvbidydwq7yJrHo5b+5PYJBln20+OebRBeteMhqXAYbtAjReltIdjdVHj8+7nt7UKcOGRi4A4rf6aNJqvaSLDoIMXNrWg75WZs+SJID4ZcFCSTPXVFxpL1x6sA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IM83VrZvc7mv2fjhweJRuV6Fe8jEP0ZVg/W4iVegIhg=;
 b=XoigNfrz50jzH8L2lO4Ru1Z02LN97jmTuM2Y1wM9r4/b2SWaClOGVdpL4LvNcpWU4tMZHo+ChX+qguVc23pRAHCrXTw8fOf+jyQUKyJlQJx2G/GDe1yXdhhLAmMYs/lg3VnNmj3WGDbWA4ASfVrJYGP1IUXQ/mU3v1+bkPYA7GQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by MN2PR12MB4255.namprd12.prod.outlook.com (2603:10b6:208:198::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Wed, 28 Jan
 2026 05:08:02 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::230d:c588:d858:9977]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::230d:c588:d858:9977%6]) with mapi id 15.20.9542.010; Wed, 28 Jan 2026
 05:08:02 +0000
Message-ID: <68aa8c23-f216-4a25-af3c-b32a7c0f30c6@amd.com>
Date: Wed, 28 Jan 2026 00:07:58 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/13] mm/migrate_device: Introduce
 migrate_pfn_from_page() helper
To: Jordan Niethe <jniethe@nvidia.com>, linux-mm@kvack.org
Cc: balbirs@nvidia.com, matthew.brost@intel.com, akpm@linux-foundation.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 david@redhat.com, ziy@nvidia.com, apopple@nvidia.com,
 lorenzo.stoakes@oracle.com, lyude@redhat.com, dakr@kernel.org,
 airlied@gmail.com, simona@ffwll.ch, rcampbell@nvidia.com,
 mpenttil@redhat.com, jgg@nvidia.com, willy@infradead.org,
 linuxppc-dev@lists.ozlabs.org, intel-xe@lists.freedesktop.org, jgg@ziepe.ca,
 jhubbard@nvidia.com
References: <20260123062309.23090-1-jniethe@nvidia.com>
 <20260123062309.23090-2-jniethe@nvidia.com>
Content-Language: en-US
From: "Kuehling, Felix" <felix.kuehling@amd.com>
In-Reply-To: <20260123062309.23090-2-jniethe@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT3PR01CA0139.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:83::31) To BN9PR12MB5115.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|MN2PR12MB4255:EE_
X-MS-Office365-Filtering-Correlation-Id: f1c29dae-ce4e-43a8-1db3-08de5e2b36aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bjR6TTdMUTdJWDJneEh4bDNJR1pvUWJMcnNYTkdXN0taSmFoeG1sSTJyRUp5?=
 =?utf-8?B?SFRHQjd3OHZxMDZjT3VhbHdJcVlDNkYxQXNoSjZISmZKeTI4bHM3ZE5xSUww?=
 =?utf-8?B?UjZZTTAwaXJhak1wMFRYWHl6Yi9Gem9Gb0hHaFpXVTgrM2t3UHBldUlMQzdq?=
 =?utf-8?B?MU81SUMrWGZIZjhrSHNZRG9vd0crMU9GbUpPOExsV2NqTXZEdGQ2S2RidkJK?=
 =?utf-8?B?eHBjU0pHV1Z1MmdNRHcwV3NUMTh5R3ZJNW9XdElyQ1RVYXlIdkJKOEloYW4z?=
 =?utf-8?B?RHpzemNhUVdiWGNGdktnblNySzZ4bXZSNFFQRyt3T1pwUVUwbHBrNFQzbnM3?=
 =?utf-8?B?M1NhUGRxYzREMlZXT1FoSGNaMUxCYXNkQVB5Y2h5Zk90ckV0K1NvRXAyazFK?=
 =?utf-8?B?WWl4cVV2SGloZ2xPRk5DRXYzVGtiS0JJY3pkZEVrLzVMVGZEak9MRkZjc3gy?=
 =?utf-8?B?dW9SWCtGejFnRW01N1pDVjQ4dlJpVjNmYkJERmVsbFZyK1ZDN2FZMU5nc3pI?=
 =?utf-8?B?dUtjYVVrbEMvN1RoWUg5UkJBTG9NSHF3dE5MVlN3cFhVZTNMSjRBaVBzYXVS?=
 =?utf-8?B?TGswcThVUDgwYXh2Q2hFZEo3THc1N2x6enVkOXYzNzBDbGVvbm05enZEY3h5?=
 =?utf-8?B?SzRrWGJlTUxsdW9kK2lId2owSFBEZFlxUG9jK2ZQVm5WV1ZKZnJ5SXJMUG5O?=
 =?utf-8?B?T3FkUmo0dGpxUHFaSmhOTUNpQm9JVHUzVmU1VlAxVDE2YU9zYnVheWFKcWpP?=
 =?utf-8?B?UFJzMzZnek1uUFhaS2ZoTkNEcmZ0b2hkblFwY0kyLzV0TmUvOG1Pd01qL1E5?=
 =?utf-8?B?YVFPNnpJOTdVamJ4NjJXWUJaczQvWXk5UmJ5Z3FucThHZ1E3endkUy80U1ZU?=
 =?utf-8?B?WUR5NjJRaHdTa2x0YkJqQ0NsQ2FZR0FkakIxUUU0THJ6b3JlVjVNcExGbkQ1?=
 =?utf-8?B?V0lJRXpDdVpvbE1DQW5jWTVUZ1VNT0N0VnJXTlhlcmR0TWJkUGlhOE4ycUQx?=
 =?utf-8?B?YzB4SGdlZlo2YmFtRjVvYkVmR0tCclVRcTE5L2FLZjkxMHRpOUFiZGl0dndu?=
 =?utf-8?B?eDA4R2tJMXp6VVZHM0lOYVFNZk1yVFMxSVN5WThlOE41YWp3K2I2c21sRGJm?=
 =?utf-8?B?YjhibEFadDdVS1JaMzhxOEhaay9NVnFPOEVwYWcxZTVaSVNnWVFPOC9meVJT?=
 =?utf-8?B?dlFNelZCZHY5c0xyeDhBdmMvR3dHZ1hKM252N2JITVUvVjM4a0RRTDIzY3FL?=
 =?utf-8?B?aCs2ZWdSSndJQUtqdElHKzZOT2ZlazFMKzFFb2dtL0tON1ZNZ2N6Zm5YWHpw?=
 =?utf-8?B?VVNERlFyaUlseGpISUF4RlVuM2h1YklWZUY2NjVaL1lqNER5UXJtNUhVL2Zo?=
 =?utf-8?B?dVpNUzg2czNPeWhXcFBDSWdXTUV5U2gwR1I1b3c1djRDRnRBRGZ4T1M5em5X?=
 =?utf-8?B?Nk9EY0ZPZzllOEt6ME94NU1VbVdyMTRRVWNpTkdqMjhUamJuTTMzODRNdjZu?=
 =?utf-8?B?ODRlVnZISGJiUWgvSTU0ZGlKdWpCaFpFbFlHRjdoYkMyZEFReDRpZ04vVXhG?=
 =?utf-8?B?aHJMMWMxZVdvWmhqNWRFdW1HTWNLNXRzeldudDdOUVBVelRFMFp0SGk0Vlhy?=
 =?utf-8?B?U0RCdEJjQi9zOThnNDNtVi9aaHRwMWwveVhZRUJyVFhqV1JwMDdOVjFIRVhu?=
 =?utf-8?B?bk9YUXF0TWdtd2tnZ1Vvd2VDZXpndFBvV0VKbWlFTWlkZjM1ODFxaFJENXBi?=
 =?utf-8?B?MENGN3owWmF0UjRld2p5dDZmZzRVaFlGSUkvMERjMms1R0xTYnJkR1Jockpa?=
 =?utf-8?B?SjNTSEcwaG5PZnFxQ2tSazdrZ1Qrb0ZWaU51OXhwVTE0R0JIWitnZmJUbVV3?=
 =?utf-8?B?MWpGTVBtTDh4SG1VY3JCWG5GR016bXJVZmUvN1RnRkUwRTNoSUNmV1ZrUGRp?=
 =?utf-8?B?bmRSSGt5MWRuMThKQU16RXlWMDV6Z2RNUmpxbzgrdko1dzRRa3RpNzBrR1Za?=
 =?utf-8?B?SjM0T0VqMWJBYXBtMnRSOUpQL3haa2Ztemh2MUNieERCY2ZpdlN4UjQvZngr?=
 =?utf-8?B?bTZyNkZacnZsdmFQVUxkYkloMkxkcjJLeUdlcDFGWXJsVGtpdjBxWjhtemIx?=
 =?utf-8?Q?3XK8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5115.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZGpYTnEyS2JrZWtpRXJZZE5IakxpMkpWMHVkRkk1Qk5ab3d0V3FJVk50bkln?=
 =?utf-8?B?L1ZvTkdLa0E3M3hHa2VqTXBTNUEzckxaSnQ1a0NIbTgvUnhOWDlaWlVqR0VC?=
 =?utf-8?B?SlRmWFl5THQrczltMUZIWmgxcWhnVVY1OCtGTVg3NlFqVVdwWTNkKzNwQktW?=
 =?utf-8?B?amtBbjQ4T1NRamx2TkcyV3FpU0I5Rk9CeVkxUWFVTGVXZ0IweURFQVJPRlow?=
 =?utf-8?B?akRvVk9vRFhPYUp5YnJLQzYwV2NOUjhiamNUV3dsNEhzN01lNXZzZm9DNlQw?=
 =?utf-8?B?cmt0ak9PbTdZcCs5YWx4YUsxTU9mRitLdzJBSjk0TU9keFo2VlBkcjhzWW1u?=
 =?utf-8?B?ZmZWT2Y5YWtaUHFacHpsd3lNWFdnT2hLdW85a1pTWXc5T3dhNlJhN2ZNSmo1?=
 =?utf-8?B?MDl3d1V2bWZxUzZjL3NTTFkyakovK01hOXpZZUtGOUlMVVZoT25vanNzUGE5?=
 =?utf-8?B?enUyNFVPNUNIb3ZTQzNaWVBGb1dMb2F3VTQwdUlVMUpuTXBLVzE4MzViQjlN?=
 =?utf-8?B?Y1VaKzJtSndZcXl5VGxXa052ek8vL25JV1NVZkZUN0NQZzBXRjVBbmlHWk9w?=
 =?utf-8?B?NWkzZVZLRXBwNmZQbVNCMVJRem45UE53cjJ6S1hSSWx6TVgyNUQzVFZXcE5i?=
 =?utf-8?B?dmphVjhNaklyNGZ1NGk2OVFRSUFOeEozbXVtNzFvS0xjNHExcWZ5aWNjM2M4?=
 =?utf-8?B?TjV2Tkh2UFZOZnNFUXAzTWZxS1ozcVFRK0dIY1NFL2NsanFvRUFaTFhmdVZl?=
 =?utf-8?B?NWc1OGVOUDN4SEY3L2o1YktuZTNXbkpZVGpWR2pqZE9aaTV6Qmc0Q0IwcVBn?=
 =?utf-8?B?bWhudUVET1VGNklSMlFzUUJQVjlEai9GUC9uRDQvWmRyaDFGSHBJTCtqRTR6?=
 =?utf-8?B?VUkvc3FJV2dnRFNCL3BvSGc2enpnZ2Z6N1p6MEYrTnlxamtaSDZmMnI1Vnlv?=
 =?utf-8?B?WW9kdlcrWGNRYVV0QXhCUVNTTnpFY3J3eTJJdjdLUlJZZkJnZmszbzJKZmNh?=
 =?utf-8?B?dmthY3NtcEp5dVVZY0hhZmdOVVVzRE5mZklWaVdQWVFwWURyRko2eWhIY0ox?=
 =?utf-8?B?aDNXVWYrcWhyalBKSW5lU1ZXWFlqM0lDa3BZWlc4c20zRkcxOW5JU0Jaeis2?=
 =?utf-8?B?WktHUGhtb0VCcWNmVFEyVmdraE5PaDUwbjM5b2FmRzMvWXBaOUl3NzEreVBM?=
 =?utf-8?B?OEFHYmVQMDJaYjk5MlBKMWoveUxOVkh1Vk4wbHpRY1poZHlPZk9VMXNKT2Zv?=
 =?utf-8?B?eHUvSlVkN2o0YlJ4NGVrQ2lRWkp5U2hEWWhHdEdYRWh4eUd1YTJZWS84K1pV?=
 =?utf-8?B?aXNkNlo3N3hnRGJONTZYVmM5T1FaVFc0TGsyczZuOVNoVEdueTE0dmtiQkFM?=
 =?utf-8?B?bHNNR21ZSVlqdTZLVXM0NTBFRDJUOGFjTWFQMDEveFVKOG9tOUw2SWE1UHhW?=
 =?utf-8?B?ck0rSlBYNCtmY0pMUUdaYU51eUlJOTRkUk5QK3R4V0plUCtZek9vSVhZYUlS?=
 =?utf-8?B?ZVRFS3ZYeVdKaXF3cG9zc3BINGMyREhPdzNpTWdRUmdFK0NSaU5oZU5pQ0p3?=
 =?utf-8?B?TGJBeVlBRjNOU0U5Y05ERjh1TVFiZXQrcE80a2FqeU1sZFJHZEZrSVRiNHVw?=
 =?utf-8?B?elpRUUk3YWZwaGFUbVRqNW5DMlJ4ZjRNc1RQeVNIQjdoUDdtOS9yeC9JMlhi?=
 =?utf-8?B?WC9JNjdmZ0QvTk1ZMEI0dExURWkvNitWRWs0QUlTWUJ0T0ErM2FQZXZ2SDlI?=
 =?utf-8?B?Uy8wKzlDdWlZWnhLSEtOK2FML292SkhweVlTSkpuRkJQN2NuZTFKV1JmT2dB?=
 =?utf-8?B?ZG5OUEt5Mko3Ukt5M3VQMTFaMHlhTHBOUVlrUE0vdnVzRWowdEE0MitHdDNG?=
 =?utf-8?B?YjU5eTNRaWIrQXpRMDRyVmxJN1ZUdUdKbGdBS2tvdDltNUlMVzd6dkhOR1NK?=
 =?utf-8?B?QW5kZmRzR2lvZGRWR1NqSjBwNyt6Ylg1a1pjMTNhTklmTytSRFNFbkRRQXJT?=
 =?utf-8?B?Y3lSNjhEWUhSb3B0bWtkR0Q3R2xyUVpVVDF2UUo3NXB5Rnp0OU4zcXJiNE44?=
 =?utf-8?B?ZlBYWlYvS1dsa1lTdDRtSWpCb2thK0phanNvOVZqWVhpdWRTdFNRNEUxZ0xz?=
 =?utf-8?B?cTNDYTBPbDgwL0U4K21NQXRRK25RVExWVjlTV2ovUytaWjV4cHNnbmtZNjdE?=
 =?utf-8?B?OFZoNkJmTzNCU1VSbG5kL1lOT1l6dkRmNmt2cXpwWTZWc1l3VFplZG0yZVVp?=
 =?utf-8?B?ZFA3QisrdU5zVHJlaUlEa2lCc09tQWM0cTdNbUZ5SmUzdWJpcHh4NFIxb3dU?=
 =?utf-8?B?QkZxLzRLZS95VmFZYlpCTFh5VzQ0bnFzcXJwbWM4QUd4L2sxRnZJUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1c29dae-ce4e-43a8-1db3-08de5e2b36aa
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2026 05:08:02.8305
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4wZpCb0a1v11Z7aGzVjlTWLUT1wxxuOueRLGiBGue7e/CFMskqXStfph+enYsK+LM+Y8nm6voLbwcA277U1uig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4255
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_NONE,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.21 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[felix.kuehling@amd.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	FORGED_RECIPIENTS(0.00)[m:jniethe@nvidia.com,m:linux-mm@kvack.org,m:balbirs@nvidia.com,m:matthew.brost@intel.com,m:akpm@linux-foundation.org,m:linux-kernel@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:david@redhat.com,m:ziy@nvidia.com,m:apopple@nvidia.com,m:lorenzo.stoakes@oracle.com,m:lyude@redhat.com,m:dakr@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:rcampbell@nvidia.com,m:mpenttil@redhat.com,m:jgg@nvidia.com,m:willy@infradead.org,m:linuxppc-dev@lists.ozlabs.org,m:intel-xe@lists.freedesktop.org,m:jgg@ziepe.ca,m:jhubbard@nvidia.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	TAGGED_FROM(0.00)[bounces-16342-lists,linuxppc-dev=lfdr.de];
	DKIM_TRACE(0.00)[amd.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[felix.kuehling@amd.com,linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[nvidia.com,intel.com,linux-foundation.org,vger.kernel.org,lists.freedesktop.org,redhat.com,oracle.com,kernel.org,gmail.com,ffwll.ch,infradead.org,lists.ozlabs.org,ziepe.ca];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:email,lists.ozlabs.org:helo,lists.ozlabs.org:rdns,amd.com:email,amd.com:dkim,amd.com:mid]
X-Rspamd-Queue-Id: B8E509D268
X-Rspamd-Action: no action

On 2026-01-23 01:22, Jordan Niethe wrote:
> To create a migrate entry from a given struct page, that page is first
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
> Reviewed-by: Balbir Singh <balbirs@nvidia.com>
> Signed-off-by: Jordan Niethe <jniethe@nvidia.com>

Acked-by: Felix Kuehling <felix.kuehling@amd.com>


> ---
> v2: New to series
> v3: No change
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
> index 7a8990b30fa0..1f03cf7342a5 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
> @@ -652,7 +652,7 @@ svm_migrate_copy_to_ram(struct amdgpu_device *adev, struct svm_range *prange,
>   		pr_debug_ratelimited("dma mapping dst to 0x%llx, pfn 0x%lx\n",
>   				     dst[i] >> PAGE_SHIFT, page_to_pfn(dpage));
>   
> -		migrate->dst[i] = migrate_pfn(page_to_pfn(dpage));
> +		migrate->dst[i] = migrate_pfn_from_page(dpage);
>   		j++;
>   	}
>   
> diff --git a/drivers/gpu/drm/drm_pagemap.c b/drivers/gpu/drm/drm_pagemap.c
> index 03ee39a761a4..526105aa4b05 100644
> --- a/drivers/gpu/drm/drm_pagemap.c
> +++ b/drivers/gpu/drm/drm_pagemap.c
> @@ -742,7 +742,7 @@ static int drm_pagemap_migrate_populate_ram_pfn(struct vm_area_struct *vas,
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

