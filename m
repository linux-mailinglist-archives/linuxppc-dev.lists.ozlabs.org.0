Return-Path: <linuxppc-dev+bounces-16467-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EHOTFpYjfWnPQQIAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16467-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Jan 2026 22:33:10 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DCD63BECFF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Jan 2026 22:33:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f2q4L0tySz2xJF;
	Sat, 31 Jan 2026 08:33:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c005::5" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769808785;
	cv=pass; b=G8tP0qjaiwcIDKu0xj2nfMaKpMl1qFhfkmOe3jy5RBgsKcTASj//copSEssHSAJjB7VL34DnCw+KNdsPQ6tjv+DXoax6JEwKCOYtnKLPRpFULTc0VwGaSjdv7HC6KTc/v6qgUBrbrG7spPt1sD5c1Cwg15wQoM87/84UHf+X0lIJq4F8Ivqf3UKJgIvlleaGOegYPz0sqsIqbnmv437AjFlQGHx5zcL/laNwTSxKhnyUaCWy5Tuv3U3bFnyuqcm6M7GnOzGSgIjbhXd05KA+K2fplYT5nfVmohlg2OnGjjkTvTlnLrfT6YnfIOfaX6cuDDM9ot6hgzmZhsD5Oy0q6w==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769808785; c=relaxed/relaxed;
	bh=n/aV/7HBoj4g19Y2R3DKUij5lYl9D7Ted6hVeQWZkXw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ChaPiSnOIK3hTtq7A7IqUWirBR5Alyo9UxZCPud4sSlKzeFFkpK7FSysF1p7g0QupTgL4d4xPmwWLZuQ71Z9oalODW0KKG6O/jAl1+/+6LRXij6YMPw6tx+Qs40mDze+6c7qvXZ6FFEYeW4UcV62mS95Ik3n66y08xsS/JGDUZyfnx+v0PbbO+62aQyhhK8sUOUXZ78qEHnuCYA0Rh2OAjiGQychx4pA6rIrd4LJegbL+gz7V7rJj8jZvdL054ZQZVT28qEEO4OFBlGnjf4xZ3Teyy0N+7UjgwYpqaEnNDEvNwBs17HL3TIGmbBWc9rqXCI3HIaLzKweHuDlzXkd7A==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=WkeuEN2E; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c005::5; helo=co1pr03cu002.outbound.protection.outlook.com; envelope-from=jniethe@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=WkeuEN2E;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:c005::5; helo=co1pr03cu002.outbound.protection.outlook.com; envelope-from=jniethe@nvidia.com; receiver=lists.ozlabs.org)
Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azlp170100005.outbound.protection.outlook.com [IPv6:2a01:111:f403:c005::5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f2q4J1grqz2xGY
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 31 Jan 2026 08:33:03 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JvSH0uV4hG+NRWtEX+r5Uyt4PnOMf0k9GHqCFcoifRRpbJzuM5zt7pYgBizyj/Jlt+KC2x30tRU+OUSHK5ROlK/I2nS6gaQj+wXvaRtn4Fd8y5lrbwarsKMs57QuTVxQ/fJbRAW2e+9ZE3buUz0OG/JC2mWNnGz06v/SVpJsmnvBGi2cJZw/FVRC7HUpV9I1/zxH9pBgDlo1K9/V4xT34EKIn8h0PTTZXb2DgA1L/jfBxzpKjl0J72ksb7Ptl/As0EOtbxxWacZdfQBG3iW0/52LXoos+6o97FNPEHpLgECZxMkK0K+tG8PxGvbyGI3Po5YYCGfQ1C/rM2VEW799Tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n/aV/7HBoj4g19Y2R3DKUij5lYl9D7Ted6hVeQWZkXw=;
 b=dBoCnYc7VXlN/UDIt4ySwMk580bSlHMCat88y/TCwW4OSxAH5K6fTcf/YcyaTPT1JPLaOjmKKtkS1CQt9JWucl55y1gSvyEkPSKcyIZVtaZrcZC5UQBPLgX/M9oMIMwqmVHW2GQDZJhpckWkSfZi3WD7ha7bU6QOyFi+gmHcIlScwsdNuH7P5bKN+s1nGLfp02JJfu7B8b4zGYypwO/yNllV8ofuXFsxRHrsvCS2c9FBw/SYfoAA1/7Fd3nkVG43dABP2QRhyKHbIpB9PCC6t4poIZyiu6+nR8au5A9bRjQNcGKbb+EZ6G7KIDV84Dm54Z51PI3JKBJoTt47Xml0hQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n/aV/7HBoj4g19Y2R3DKUij5lYl9D7Ted6hVeQWZkXw=;
 b=WkeuEN2EujdUqso+Xu4PUK7Wxgy291NNvNQpHjm5PGUHP+U6XH5G2+IuRUkbKDhrgWjXCqshCX+77HK+cCP1/7yq6Vlyci61Se/jKOizQooC59O65FQmU5iH78AbnpqOJk1T8UFvvKoEvqaMZXOavIU9DxxYBlpCD73+Mtnz8lSkyxghT3MsNTV970Dq1s93yUFRlWcM7W74kK2IpJOngwOY+/AahxqePHnKmMDrdv/kb0vphmRPpjE59Pt/KfLsEq6U5j97z1SW3Gn/RrB8QONGrAJDVfKVLKvw5ls+zd/L1gZVKRgb2/SCtBTak2ITS3TuLRJ4uY9d6uL8junMyQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB9072.namprd12.prod.outlook.com (2603:10b6:8:be::6) by
 SJ2PR12MB8955.namprd12.prod.outlook.com (2603:10b6:a03:542::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.11; Fri, 30 Jan
 2026 21:32:36 +0000
Received: from DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1]) by DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1%5]) with mapi id 15.20.9564.013; Fri, 30 Jan 2026
 21:32:36 +0000
Message-ID: <443f2a0f-b9be-45aa-b977-d9a32196f122@nvidia.com>
Date: Sat, 31 Jan 2026 08:32:26 +1100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 13/13] mm: Remove device private pages from the
 physical address space
To: linux-mm@kvack.org, Matthew Brost <matthew.brost@intel.com>
Cc: balbirs@nvidia.com, matthew.brost@intel.com, akpm@linux-foundation.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 david@redhat.com, ziy@nvidia.com, apopple@nvidia.com,
 lorenzo.stoakes@oracle.com, lyude@redhat.com, dakr@kernel.org,
 airlied@gmail.com, simona@ffwll.ch, rcampbell@nvidia.com,
 mpenttil@redhat.com, jgg@nvidia.com, willy@infradead.org,
 linuxppc-dev@lists.ozlabs.org, intel-xe@lists.freedesktop.org, jgg@ziepe.ca,
 Felix.Kuehling@amd.com, jhubbard@nvidia.com, maddy@linux.ibm.com,
 mpe@ellerman.id.au
References: <20260130111050.53670-1-jniethe@nvidia.com>
 <20260130111050.53670-14-jniethe@nvidia.com>
Content-Language: en-US
From: Jordan Niethe <jniethe@nvidia.com>
In-Reply-To: <20260130111050.53670-14-jniethe@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SY8P300CA0019.AUSP300.PROD.OUTLOOK.COM
 (2603:10c6:10:29d::27) To DM4PR12MB9072.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: DM4PR12MB9072:EE_|SJ2PR12MB8955:EE_
X-MS-Office365-Filtering-Correlation-Id: ffbf7dc5-7205-442c-8715-08de604715ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZktFMDIxWkVyZ2Rxc2xVTkRCZ3NPNkdiOTB3ZTNTZjhJNnUxa3FPMC9JMVBS?=
 =?utf-8?B?cXdPNjVsQ1gySWtnLzgxaDdpWWt3RVl3Z1RZZmxlQkxBZXMzbHV1TmlVRkxw?=
 =?utf-8?B?ZDRuVitUQklQSnY3NFU1TmRkVlhjWk15MlJKK3hUeEcxNmJ3SE9zTUtFencx?=
 =?utf-8?B?cTNIZjNEckdXdnh0c0dIS3BqTlpUVDJreXFDVE82ZG9RU2kzTllLcU9rS2lk?=
 =?utf-8?B?eGl3K2lidU5sTXpFS1c2TDdsZlNoTU5taHFOTGNTTTQ2TGFCUWxJTVBPUHND?=
 =?utf-8?B?d0hlMTRIb3A4K0xaMkloQ3h1bDJrMDV0MlRraDFSbGVsOHA5bHNWVEcyV2pB?=
 =?utf-8?B?VU1jSEhNdnk3S3NlaGhVY1VvMVgyanJTVStJcW1hWEFvTnNFQzJBWmtHeEI2?=
 =?utf-8?B?ZHNnUDV5VzhjU1k4ZzVJa29YTUtLV2FoNExXNWZGbGJGS1NMUGozQ2laNTIr?=
 =?utf-8?B?dFVPQnBPYS82eXJsd05mUzFkaTdXK2x5eStqK1p5WEtKYmFZaXAvcWFFY3k4?=
 =?utf-8?B?ZFB4U01WSnZLNk9ZNVJ3TjVPOXJkckFqQ2Rxa21aMWRkTjlSZXVZOFZ1aCtZ?=
 =?utf-8?B?eCtPV0lFVnQ2bkxlMmtDL2NVRzY0UFkvVXpIenJZU2RLZGhOWGVPYitvSU1Y?=
 =?utf-8?B?dGtKWFJSd3pxSWYrbDNuOWx1RE43L1oxNWVkQ0xWMS9JVDNUTDZ2eGppMlZG?=
 =?utf-8?B?NkFnbzFHSTNydDN4N01objRrZzNBaVZzOGRSSStaMVd2R1dneDQwelZpZkU5?=
 =?utf-8?B?YkFSa1FEVVg2NWVidjdVM1VyQXdISnFYYkhXeXFiR0Z6V2QwYnUyYlR5aWJk?=
 =?utf-8?B?RkVGVGRrSVEzK3NtbngyVGFPNnh4emJZbW5Na2dFMmZpT3k2VDdTK2Mvckdo?=
 =?utf-8?B?NU9jenVtelJjeEhpUEpHTlFNUDhKN0cxU3hqaTZERHFISHA1WlhOT3FGeW1I?=
 =?utf-8?B?YnRMTW82V1NZWFl5NjJ3Z25tTkhMTEZET2ZUTCt3MUFLTlVBYWRVZC8wTk1J?=
 =?utf-8?B?emJKL3dLdGtTOVAyV2hrcDRDeWxqRi91NVVoVThKL0NGSmdJUG1RTmkxTXVt?=
 =?utf-8?B?UVpQblVDcWgyMk1DYW5YdmpIaU13ZTBLblgzZ0hMbzBGRTQwZGFnbEJES29p?=
 =?utf-8?B?ZXJ6N3RCUUovMXQ0dCswa0dGaS94cDdtdFF0U25JL0RMTkY3TTIzSHljNjMv?=
 =?utf-8?B?eVFkbFhpVWxsbm55QVpYczNvYXZ6UFFaajNUU3VUYjRTLzJ3Z2RJQU13bkUz?=
 =?utf-8?B?aUlaN1FKRkRaK2M0N1hXbXIweWZvSUxaUjRJTnN6Mm5xc3I0VndSL3p0OHg5?=
 =?utf-8?B?cERWams0OS9MSFBTWFd0V3d1UVhHbWVqNU8yNFBOOWIySnczY2FOcG9Ea2ZE?=
 =?utf-8?B?Q3cya1hEN0YrWUFkdTlOWGRKZDdVaVlpNVhGaUpMOTRYWU1Bb2ZzMndFa2Ru?=
 =?utf-8?B?bERBekVkc2xBTjZrUmdxZFk4QmcxckhQTTFNdmVsNHZaTUNHaEd4cjJPZCt1?=
 =?utf-8?B?VUpSZG9JZmVMZ0kzQWhuM2NhYkRqbkxZY0R2OVdxZzhDQVR4V0dNbm00V2lr?=
 =?utf-8?B?cXBMNWxidHFjRWkrMzl5R2NqQVA3a1BGMzAwWWhRUmZCS1lGcmpib2ZyQnhP?=
 =?utf-8?B?TDNQS2R1eGRPUjd3RTJRK1dudE5nUEFBdUNob3lEL1FHUjd6bkdBU0ZzN2hs?=
 =?utf-8?B?L0x1ais5MENmL2dZMGpla0l5eFJqWUpaRHdub0pxcjJvUzZHZVBDTGJYb2w2?=
 =?utf-8?B?SnJITG9vRHIzNXBaU3NHbzNaUVlZUWVCaUpaU0pOWlVEbEVpdUxIOXgvdDI4?=
 =?utf-8?B?dWVTclp3b1FqZ1hmU203NlRrbUdTTWJucjN2aU0yTjhtcGJsT3MyZ0libVZH?=
 =?utf-8?B?MnByT2FHemY1K1NsWGhzNzRLVGhjR1VBVzZHeHpxZFBTZ3BIcHNMZG15ODBF?=
 =?utf-8?B?ZStDZHV3OGhuTTBpcTJsbkxURTFrKzZZOUJuR0prY01oSnN6REFLdy9sOWVO?=
 =?utf-8?B?RHZuNmhUQ3BLai9pSjE4eUg3L3NFd0tFekdqWERDclcwdnFSWDcyWUhoUmM1?=
 =?utf-8?B?OWJTTnVBMGY3NFRRcUFPS25nVUFvdlNuUVNDYlNzMkRFQ3JWM09udXFUcjdi?=
 =?utf-8?Q?NEwQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB9072.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NHBCUFdJNm85bExSbk9adklUYXNKN0RWWkxqQjU1ZSt5VU5IZUVvZEY3cmEr?=
 =?utf-8?B?Smc2a3diUkdwUytNc1FxQml2Qktabmx4V2VoNklQSEprdFlwQmYwRnVjVXNn?=
 =?utf-8?B?ZHZIOE9JQU00Q0lWd2p1M1VHMStXN2ZVRnJHUmk5UHdKVmo0Y28rTVBNNUNC?=
 =?utf-8?B?akZVTUIweFBsQzRuaVB5aSsvOUVROG4yUXJGRGdBdXNLeENINW9DdG9VNWc5?=
 =?utf-8?B?eHVTZ0gxTkR1TTRFUVA1UGwrR0JOUnpPWk54cGJzQTFLSXBzLytaS0NtM3pQ?=
 =?utf-8?B?S1RPN1ZRWFhPTy9IY0Rhdkx6WkhIcGFmRW1pYktTT1JLQkpHQVdQdnpSbzN2?=
 =?utf-8?B?djh3V2pTRm1RZmtyc1NSSXFEOXNraFJoWEtkZUNrWE51b2xpNnNvTit6c1lt?=
 =?utf-8?B?TEo1b1lycWp0S3NTbkdnK3ZtUmpnMW5HU2lmZXFhTUxMMFdaZXQvcXhNTGtU?=
 =?utf-8?B?NWNGcjRjdUVyejVYeHNJQjI3TUhvejN2YWlzbjdyaHk4Umg0K0JrVjRuWGdR?=
 =?utf-8?B?UnZyTGREMzhVOGc5ZWx2VFpzNk9BcnlWelZ5LzMyRWZPdlNFWC9xZlpiNGR5?=
 =?utf-8?B?NWJocFlQOWdjT1dVb1ZyNmtoWHpRa0tjYWhHUm9PNG9kVzRmV0tHaktpSFpR?=
 =?utf-8?B?TWMwZWxkRzl0MXJvbG9kMzhyZmVDRzVFZzlsRXBXZk55QTlnZ2NxeTdIcUZu?=
 =?utf-8?B?eEJoSEVXT1dSMUJqTUJScUswcjFtRk9rcDJ0WXprUms4NEMxSTVHbFFBRzZ3?=
 =?utf-8?B?OWNvbXlFM0JTcTFGa1ZINTB4NU1Cc296b0hiVDRrbEk0d2loaEpsVUc1UVpy?=
 =?utf-8?B?cWduTzdVSTJ1V29oWTRrNlhtUE9Pckx1UUczTUtUQ0UvZEwvMXNkTll2b05x?=
 =?utf-8?B?RlhaUEhpTGxLZ09aS053emZaamx1TDUvaDVNdW1NM0pLaVVQZG11WkVEVkp3?=
 =?utf-8?B?ZVE3RDdXdG1EUzVMSnVoa2x6VDkzMDBsSDdicnkrWlZDei9oNVM4UE1LbXJG?=
 =?utf-8?B?TnUyOGIxWkRDRTFTMWdmNkZTR1g1WlJ4cStrYm9kQmJhb1p0YSszMWc0bWJn?=
 =?utf-8?B?c0Z0NUljelp4aVdFazZ1TDRuSEErWW5hNzhKTjFLVDFrSFBrbXlNbmVBNHRh?=
 =?utf-8?B?ME45VWlQWWJkRU80M00venJrRlR4NDdXMnJtelZBV2hYTUNabGFWNFkwaUlk?=
 =?utf-8?B?c2JqbGh6bkxZSVM0UFZBODU4aHJCeTlQYzJ3dS9YNkdhaXF6T0V6bHM2OWVx?=
 =?utf-8?B?UUROQW11TTIwRmZKT21XaitWdEE2Vm14SW1NcHZKOTJXMUJnK0cyUW0weVlu?=
 =?utf-8?B?U2ZTb0dCT1JCQ1pZT1lGL3FnV0JERTB0R21vc25aMlpIN1JaZTFqTGVReWtB?=
 =?utf-8?B?dVZhaFY0aC9nc0xES2tCeUdWeHdiQW15bllFVzBBUnlPc1lvbE9HR0k5bGhG?=
 =?utf-8?B?SVRHSUFybDRPU2I5SlNmaUhOYThxY0VQSlRYTk1xcStDeFZETmwxZFp4N3Nu?=
 =?utf-8?B?NWpFUlY1Mk5KQ2IzblAxK05iU0cxQ1FmQ1dRUGRvWENuVjJPaUJLKzlJZGJo?=
 =?utf-8?B?bXl2Q1hnamd5WVdBZ29FYlBvN0tYSnM1SG8yZjVGanowSUwxNmFseFF2d3kz?=
 =?utf-8?B?YVF4dk1uL0svMEx6dGowUFJKeWxNVHU4dkNvTHRKZFJBVE5lOFM1Y1pZTmUy?=
 =?utf-8?B?U1lWQ1ROOWRSNi9KQ05mdzZWTlNWSnc0U0M1TU4zSk9nZGFZNnlQWmM3RFQ1?=
 =?utf-8?B?YVpSUjNVUFV5VGtnTCtZb3ExL3FWTDZxZlpSVUphek11QjNQOFpiSm1ubHQ5?=
 =?utf-8?B?RGFJSGxrQStPajF4WVhqeGEwRHdpZG9zNFVlcm9XQlFRS0tEWTh1YW9YNzUx?=
 =?utf-8?B?dkpLN3I0cERGYkQ1MnJtUXNIbSs4VlF0YmtIaHU2NDhXM1hrU0Q1K3ozemNR?=
 =?utf-8?B?M2dCMGxlR0VJc3hrS1RtalZTNUpCaFgrbVZhTCtNQlpVeitscGt5WWhlSHRs?=
 =?utf-8?B?NFlGazFSSGNjd0JUKzc2SEVibDBmYitVTW1oaDJWU2lmNTkzOVE3TFZuR3hy?=
 =?utf-8?B?eGE5SG9FQXZlT0l4bkdGMU5YVTE4WlVGRTR2VXZKWjlrLzlqWHcvTi9tcU9m?=
 =?utf-8?B?dUlGdHZ6SHhYbkNrcTRlZzJUTnlrRk51V2hlc0FpNVNpS3NpVXlFSEtLaGU5?=
 =?utf-8?B?OXpFbjdkcTRQVEN4ZURRYTNhV1BibDc3VW5qSk00aWNTWWEyamkyY2hnaC9i?=
 =?utf-8?B?OFR4WWNUTlpHcHpseFR3UjNoSFJpaS82VjBqQlNsVXU0U3ZZbEhrMlF2dFhT?=
 =?utf-8?B?eUJrNklFVVlqT09Ld1hTdEJaakU5Q2pGN2NDQ1ptc3ZJOFNlWWZqZz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ffbf7dc5-7205-442c-8715-08de604715ec
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB9072.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 21:32:36.2742
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J+6cdXI/N9AhDRy2zo1G4pdUxStumAa4r3Crc02bMKkqQ04Su5GDQGLoI8FH/zyuJ+8O7wLlXCFPLKKmu5DJ5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8955
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.21 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-16467-lists,linuxppc-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[jniethe@nvidia.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	FORGED_RECIPIENTS(0.00)[m:linux-mm@kvack.org,m:matthew.brost@intel.com,m:balbirs@nvidia.com,m:akpm@linux-foundation.org,m:linux-kernel@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:david@redhat.com,m:ziy@nvidia.com,m:apopple@nvidia.com,m:lorenzo.stoakes@oracle.com,m:lyude@redhat.com,m:dakr@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:rcampbell@nvidia.com,m:mpenttil@redhat.com,m:jgg@nvidia.com,m:willy@infradead.org,m:linuxppc-dev@lists.ozlabs.org,m:intel-xe@lists.freedesktop.org,m:jgg@ziepe.ca,m:Felix.Kuehling@amd.com,m:jhubbard@nvidia.com,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[nvidia.com,intel.com,linux-foundation.org,vger.kernel.org,lists.freedesktop.org,redhat.com,oracle.com,kernel.org,gmail.com,ffwll.ch,infradead.org,lists.ozlabs.org,ziepe.ca,amd.com,linux.ibm.com,ellerman.id.au];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jniethe@nvidia.com,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,patchwork.freedesktop.org:url]
X-Rspamd-Queue-Id: DCD63BECFF
X-Rspamd-Action: no action

Hi,

On 30/1/26 22:10, Jordan Niethe wrote:
> The existing design of device private memory imposes limitations which
> render it non functional for certain systems and configurations where
> the physical address space is limited.
> 
> Device private memory is implemented by first reserving a region of the
> physical address space. This is a problem. The physical address space is
> not a resource that is directly under the kernel's control. Availability
> of suitable physical address space is constrained by the underlying
> hardware and firmware and may not always be available.
> 
> Device private memory assumes that it will be able to reserve a device
> memory sized chunk of physical address space. However, there is nothing
> guaranteeing that this will succeed, and there a number of factors that
> increase the likelihood of failure. We need to consider what else may
> exist in the physical address space. It is observed that certain VM
> configurations place very large PCI windows immediately after RAM. Large
> enough that there is no physical address space available at all for
> device private memory. This is more likely to occur on 43 bit physical
> width systems which have less physical address space.
> 
> Instead of using the physical address space, introduce a device private
> address space and allocate devices regions from there to represent the
> device private pages.
> 
> Introduce a new interface memremap_device_private_pagemap() that
> allocates a requested amount of device private address space and creates
> the necessary device private pages.
> 
> To support this new interface, struct dev_pagemap needs some changes:
> 
>    - Add a new dev_pagemap::nr_pages field as an input parameter.
>    - Add a new dev_pagemap::pages array to store the device
>      private pages.
> 
> When using memremap_device_private_pagemap(), rather then passing in
> dev_pagemap::ranges[dev_pagemap::nr_ranges] of physical address space to
> be remapped, dev_pagemap::nr_ranges will always be 1, and the device
> private range that is reserved is returned in dev_pagemap::range.
> 
> Forbid calling memremap_pages() with dev_pagemap::ranges::type =
> MEMORY_DEVICE_PRIVATE.
> 
> Represent this device private address space using a new
> device_private_pgmap_tree maple tree. This tree maps a given device
> private address to a struct dev_pagemap, where a specific device private
> page may then be looked up in that dev_pagemap::pages array.
> 
> Device private address space can be reclaimed and the assoicated device
> private pages freed using the corresponding new
> memunmap_device_private_pagemap() interface.
> 
> Because the device private pages now live outside the physical address
> space, they no longer have a normal PFN. This means that page_to_pfn(),
> et al. are no longer meaningful.
> 
> Introduce helpers:
> 
>    - device_private_page_to_offset()
>    - device_private_folio_to_offset()
> 
> to take a given device private page / folio and return its offset within
> the device private address space.
> 
> Update the places where we previously converted a device private page to
> a PFN to use these new helpers. When we encounter a device private
> offset, instead of looking up its page within the pagemap use
> device_private_offset_to_page() instead.
> 
> Update the existing users:
> 
>   - lib/test_hmm.c
>   - ppc ultravisor
>   - drm/amd/amdkfd
>   - gpu/drm/xe
>   - gpu/drm/nouveau
> 
> to use the new memremap_device_private_pagemap() interface.
> 
> Acked-by: Felix Kuehling <felix.kuehling@amd.com>
> Reviewed-by: Zi Yan <ziy@nvidia.com> # for MM changes
> Signed-off-by: Jordan Niethe <jniethe@nvidia.com>
> Signed-off-by: Alistair Popple <apopple@nvidia.com>
> 
> ---

Hi Matthew - the latest intel-xe CI run is passing: https://patchwork.freedesktop.org/series/159738/#rev8

Would you mind reviewing the gpu/drm/xe changes here and in:
- [PATCH v5 01/13] mm/migrate_device: Introduce migrate_pfn_from_page() helper
- [PATCH v5 03/13] mm/migrate_device: Make migrate_device_{pfns,range}() take mpfns	
- [PATCH v5 04/13] mm/migrate_device: Add migrate PFN flag to track device private pages

Thanks very much,
Jordan.



