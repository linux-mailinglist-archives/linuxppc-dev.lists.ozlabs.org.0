Return-Path: <linuxppc-dev+bounces-15681-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B3EF4D1C9A1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Jan 2026 06:42:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4drZl11bHkz2yFq;
	Wed, 14 Jan 2026 16:42:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=52.101.53.68 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768369357;
	cv=pass; b=NaggEWHc+0dmmNkuWB+cEb5ET6kDTDaoVM3TZ5u4ixQezuIc6N+EAD2J5HzzaocmJvFBhkkLQiGYBZ9qEnnq2X7G5BmFGDew1N86ne/hkewwk3rLSjEBWyDEL/40wswkWCrjd97CvkLNM6eff2eiNEdv5IhsCWkzBwBLbZZXZHTTNybutZUrllIGk/FcZo3kdcV3EcQDqvbcSffJSKC21DQYa7KATkMs4XuAl/IDFAq1OdiZ7pb1zZMfgRaW5ZqzVbT+0rJGOC9rFYUDK9HmaVhsZrCWuODXMwdIki6OAXLO0sRM581c9OqYD1t40u/ntBs9M+Lu3S0lDrhYNPE0xQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768369357; c=relaxed/relaxed;
	bh=jJ1Iflaft7AKeivMSXQ1oFCeul9o8MoIoXesTnONkXo=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=V1T+EiLOtFPlZCqxrrWJI9beuLbsaG7rUOkI4lpHu/tw8d5dxXhKjJhG2eNLV7EwXUn0oU2lcCuh5nYPT0Ud7DqUWpGSkzIHvPM39fNnCN8TQenwaQ4oLxBU2yUifjtEsdPTqtg1tg5j0rkpQmGRw1M+bs5yxa4WYJ62dzuUQFfangQ+hOIGo1E+MekfJ4khjSGsxQCrPCDQhnIK814B8gqoHC9i5gsDN3myIiiKC+ktypq5YV+gANZzmR3ikKKSbYcBVZaakBdXemyGwm4O2znndK+0RTNtw2IxD0qZrhliw+FWnWtsS2052TZDbQoaO5hnWLBBgMe20MZ7dk0ykg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=ce0DkyTl; dkim-atps=neutral; spf=pass (client-ip=52.101.53.68; helo=bl0pr03cu003.outbound.protection.outlook.com; envelope-from=jniethe@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=ce0DkyTl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=52.101.53.68; helo=bl0pr03cu003.outbound.protection.outlook.com; envelope-from=jniethe@nvidia.com; receiver=lists.ozlabs.org)
Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012068.outbound.protection.outlook.com [52.101.53.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4drZkz2Dflz2xpm
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Jan 2026 16:42:34 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k9MI9+sxgz4UvBuNcsfmWMbvsonndnk2SDXnIaXhozsFvsqd+d7pTS58Ij8yb9/BDLQcVkFuAnk4xyMg0b3lq/QhxBOCKyH9S8srrv4ejnu1q3AF4a8ND8ZwzdjAb9c2fldkLerXx8bX15nF9xxzf3ix0PLXKNphDP2beLHj45gzwdZ9cX8Vivvq2lp6UU7uCt9WrUw05k2XClKvG5m/F6mdJ2vfLO3Q3U4kdA+CH58cZniX42TigFUVg8NsRd3Py+s3EBf0k1RwNGvqfs5QBQsRiOhragWcuwp6QukD8hp/8Z12hlb4stVi6SuPFnydszsu86YA+zLeY1Y/Rew6vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jJ1Iflaft7AKeivMSXQ1oFCeul9o8MoIoXesTnONkXo=;
 b=EDbdkTuhugpQwjUV1NM/WvzA5flG4JpI72LbcKe4u21Fl5l1BkdqeunQi8xmuEIsMiBuT9u/NpoRMs42+QtpAsF3uT17HRHnQOpfGvZ0LRuyXHxM2c5u3Vq/R2CM53X3IZ5fVkW5pinHX8seaDFVAR3tq5QIAyojl32J66rSAOPcZpucnwh8rAfRRn0uFoNYBtuveeNlxj1VV0O8rT15NZI8w9PEitkoHHatWbjQwQvupHeTW1xCOWKiCdVjqQv+rqm5jWLRkiX+D0eSOhn70V4z57fD+95BZMxP7Enb2Ul7UWvcyJQFObOUgVVeU6vWCK1M6h2XG4+ugmy/Ij1NzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jJ1Iflaft7AKeivMSXQ1oFCeul9o8MoIoXesTnONkXo=;
 b=ce0DkyTlwkXGgXKPE7l1/hTjAHs74i0Nu4hULzS7ZvL232kU46cJisnGFUSxCQFSiq43WR8sxY+nTCbYgnAGvOjFm64p4T3XCCf8ZoMK7jNi1T34qOGz8AqPKF22fDj0LDvCVezle7GKQbXuqIYQfOqn+0vqTq6f+vNdRs367hPgy+sR+2gI9Aqdu0xgl2R2J4wgTGeyAQK6yVd1icb86YOwK8j1Uwb9n85jGaEEY/rRb309oPlB3EGqas31BT07DfPhgKkZD2dyUT8b6R9mj7aah6qqjMJbmhR84h3whOxGEtTJUxG3mrmL9hoDcd3bpBFiMH23Daz4GkfAA5tyow==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB9072.namprd12.prod.outlook.com (2603:10b6:8:be::6) by
 MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Wed, 14 Jan
 2026 05:41:53 +0000
Received: from DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1]) by DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1%5]) with mapi id 15.20.9520.005; Wed, 14 Jan 2026
 05:41:53 +0000
Message-ID: <f295d9ba-bbef-4a11-95b5-c468f08f992c@nvidia.com>
Date: Wed, 14 Jan 2026 16:41:46 +1100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/11] Remove device private pages from physical
 address space
To: Matthew Brost <matthew.brost@intel.com>
Cc: linux-mm@kvack.org, balbirs@nvidia.com, akpm@linux-foundation.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 david@redhat.com, ziy@nvidia.com, apopple@nvidia.com,
 lorenzo.stoakes@oracle.com, lyude@redhat.com, dakr@kernel.org,
 airlied@gmail.com, simona@ffwll.ch, rcampbell@nvidia.com,
 mpenttil@redhat.com, jgg@nvidia.com, willy@infradead.org,
 linuxppc-dev@lists.ozlabs.org, intel-xe@lists.freedesktop.org, jgg@ziepe.ca,
 Felix.Kuehling@amd.com
References: <20260107091823.68974-1-jniethe@nvidia.com>
 <aV6nvCw2ugAbSpFL@lstrano-desk.jf.intel.com>
 <3586d8f1-a25f-4087-a987-162ccd97c25f@nvidia.com>
 <6a911224-05e5-45ee-8008-e36ef35cbc7b@nvidia.com>
 <eb45fb36-4f0b-4a83-8852-abac3205a988@nvidia.com>
 <aWBMbGQApg81Kxba@lstrano-desk.jf.intel.com>
 <ad2a0fe8-6d00-46a8-8f4c-fd7fb6aac8b1@nvidia.com>
 <aWCerW4QP0t7CrC8@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: Jordan Niethe <jniethe@nvidia.com>
In-Reply-To: <aWCerW4QP0t7CrC8@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR02CA0071.namprd02.prod.outlook.com
 (2603:10b6:a03:54::48) To DM4PR12MB9072.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: DM4PR12MB9072:EE_|MN0PR12MB6101:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f0df25a-35ec-4a31-4b6b-08de532f9f2a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|366016|376014|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UmpkY2daMmV4TkFXdW11dktsL3pQbjdkTVV6ZWE1VmJ3YlpGRHlCV2N0WFU3?=
 =?utf-8?B?eGFRV0VJSDN5NUM3N2xZYkFpVWhZc0FzV1Z5ZnpNU0svdXdSY2M0WXp4cGRq?=
 =?utf-8?B?K0lLOUxFODFZb3FkWUh0VjA4emEzbHpiMTRiOVRvZjVxTjNONnBiWW9GajVs?=
 =?utf-8?B?Q21Ea0gyRCtXRGRicFlwYmZQVVhNeEplbkJCOGtIamlSQk9KZUVYUjdFVkFs?=
 =?utf-8?B?ek9aNmhSRTBvNU1WL29WU3gvNDcvL0pWdW82Wk9WKytZamdVSHVGWUdXSzJF?=
 =?utf-8?B?RmhwbVEzQWR5d0RaNTNRN2hyek9TTm9aWnJwcXF6MGlnV2ZrL3pJaTR2eDJz?=
 =?utf-8?B?WFpMNFhLRUN4cTN2clZhRlpZOXVueWpIYllrYTIzMUw0VSs2SW4vekFNMWFX?=
 =?utf-8?B?bUFUTFNhNUJ4RkVwcjQxbGRIWVc4MGt4WWVRSVIwcXRLdnhTRmtzKzlvVTJV?=
 =?utf-8?B?dUpKK0FEelVMT0I2bmFrMU1SV1U4UGNkcUd0RGlWSElNYXRIUjJxbE16VVNz?=
 =?utf-8?B?Qk03YUpYeXU4U1h1ZjlORkhXU1pwdytidk9OUGl0NWo0ejBjYlhtUG45eDBT?=
 =?utf-8?B?a1hwbDVncU1jRlQ3WS9FOVpLVE80M3lHUHlYbVNRWFRpeXJkWDVWTmJ0NHEx?=
 =?utf-8?B?ejBBa1lJUUl6UUp0ZXJRb2Z1UURtYjRCaHg0aTZDWlBuSmZ5WWdDWi8rK3VL?=
 =?utf-8?B?M1Y4TDVjeHg4T25LZWY0UnN4ajlqQmFLVWc0UStoNjU3MzJtRWt1NXBwOHZs?=
 =?utf-8?B?eCtFOXZnV0dXU3FBRTk0aXRXU2ZxczFDbWh5V3VpNkVjdkVXVElndGxSbkFa?=
 =?utf-8?B?VVhZMnY2MVNSNlZEcElNeXVmMXRTZDE3dkZCNnJLeXNaL2xBYmFlRHJ1Sk9x?=
 =?utf-8?B?Y0lEMmFVaHVweXBuS2txQkJIUGVPMlJnOGxYaDdYa3JTQzZXdXdmVHY3VDlr?=
 =?utf-8?B?VEV4dnlFaThPbnZlbzU5YTNZZXBuWHZUT0RLZWQ0RE8vSWxtRUg3OExPcnR5?=
 =?utf-8?B?WUdSdVQ2eHh2TERXeFpzMEdjV2pnK0Z4aTRMeVNGZmhGMkhiQVpGeGhzaEJU?=
 =?utf-8?B?UW16azFOVmNTWkdReVV5Z3ErV2QxUHBSYUVlNnFhbU0wVTAzeVdIVTRVa0hJ?=
 =?utf-8?B?Z2NjNHZiWENVZ3pMNUtUc0hlTDd3cXlsbmFEMjV3VlA5cEV6UXZpWG1ITk0y?=
 =?utf-8?B?M3libjFOYzMzcmkyMkpNaUh6b254QVNFK3p4WEd3Z211R2wwbTJFSXZKTVpT?=
 =?utf-8?B?dkMrTklvejJpZ3B4VVdYZ3dzYStRYnBac0ZMOElON0taVjBOcFAyUXUwdnFV?=
 =?utf-8?B?MGVCanp6OEVnejFhUU94UUswUGg2N0lXRGZ1QzRNRFFzRFB3Y0luZXlDcDFX?=
 =?utf-8?B?SmV1NHp1OFozWVVuN0RPZGUra0hlZ2kraTNiMXU5MVVDNTg3cXUyUWJtRHhU?=
 =?utf-8?B?OWJyakFVSVNxaWtNaThnWVJnakZIaXZYRFIxM0Q1VklXNThBV2Z4UEVQVitM?=
 =?utf-8?B?Q2I3T1pXRW5OMjRGaFJCWW9sbjgyOHZha0JPUnl1NUlyem5hVHJpTVFPZ3ZV?=
 =?utf-8?B?Y0d6MGVhVW8rcTkvbEZlcDladmxVeGQ0WElCQW4waGJTNG4ydngvdmhWWDNy?=
 =?utf-8?B?cEszOVNTYWpiRndITFV0cHpYd2d1aUpmeHNtaGNUSmQ2YnVQb3FkY1Jnd28z?=
 =?utf-8?B?T1RGSWpYTjBvUVVGSlEzRU1sY1dRRGtxRlM1OVR0NnpmcG15NFV0RUtCVlRT?=
 =?utf-8?B?ZTBCVkUxUTMzNTRlNFlSMGQvK3FyaXpOUEdTbFN4RjZTSzF4RXlxMkxGcUxT?=
 =?utf-8?B?MTRZdVB5Q0wyYmxtaGx5azgrM1hPZ3hvcU1QRGVPQnJ5TEZYb2tEb2Z0QnpK?=
 =?utf-8?B?eklPUU5Ha0x0bS81UVlJcS9uekl6dWFNeGtIZk5hTlN1bDhPT2RzOUVDdm52?=
 =?utf-8?Q?bRISvudV/dSdvdiXdQoywyDBThF14oJu?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB9072.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(376014)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aFd5STZYcE93SW1MYmZCRzMxekRGWW9iUEtTK1hEMzk1T1d5TVU3dVIrSnU5?=
 =?utf-8?B?am5Fb3FpcW9vOHVsNFp4cURLUS9sVWFWbGxEbGVza3FBWFcrTzBQWnYzNmtT?=
 =?utf-8?B?dXJZZGJMWGJmWmZremJPVVlxbWZmbHZzTWFPQkptd0JqbENmK2dOdHYvcW1y?=
 =?utf-8?B?SHo2cS9GRkRPNldKNU9LWXd4Qlp3MXZYRXR5OG5vOEU5Z1d0eStPRFVmZElY?=
 =?utf-8?B?ODBnY0Z4WWxYcVdtYWRhMzBIL1hqb1p1SG9hcGVhRVd6d2lZdkJkQ2F3RVNM?=
 =?utf-8?B?bmFySjNEQzNOY2ZQd0RGOHVaVkFkWms0cHVkaUxCd0JiWGNPRFI4VlV3SXow?=
 =?utf-8?B?dmtJSHk4VGJ5RkQyMHF5M3ZZWlNjamtoaW5oanJ4NVhsRkJrUVhIR0w3NFR4?=
 =?utf-8?B?a0FTSGR3dVBjeERuOW9wZ0FPbEcrUENZTEVDaXF6SzMrU3RCdHNNdW9YTWRo?=
 =?utf-8?B?MEZ0SlZhcy81dWdMU3h2eHBVOWEvcmFCbzF5OVQzeGlHb2N6dXA3MDlxUFFK?=
 =?utf-8?B?V1Q2ZC96c3RmVXhkT05MYThVa05EdG9IQkhHNzRvTXNpOGdTVUtQb05sYTI3?=
 =?utf-8?B?blhxZDNaM2hrSDlwUzd1UkVGMzExTTlGZmN2S2c1M2xtL0w4NFhFRDVKbEh2?=
 =?utf-8?B?WldGaU5xT25xUGJwc0VWbjNmR1RKM2twYkxibGg4R0ZZZk5ibnFJakRIcll0?=
 =?utf-8?B?SmF3WTZCMDRpZVA2RWpsaFFDaU1walNCUkxicDBqWm84UUk0WnExVVZBOWkr?=
 =?utf-8?B?Mmt5NUxHVHdkQWx6bkUvdGxFNE8vNk4zVDgzamMzOFRZaktmN3BlTGpyQndM?=
 =?utf-8?B?ZmlxNmNLMnF2aGtkYk5QTmZkTE04cGdPRm5BUkJZTVV2QmZPZ1JRYXU5NWNi?=
 =?utf-8?B?WVhQVjBMSlhtNHAyanNyRVRiUG1pdnZOSmFsL2l5MGh3MHVob1orMHJESW9t?=
 =?utf-8?B?ZHNoMURmOStOZTlad0ZDUSs4dVlzSnBabnRZUVVnS28vQjU3ZURKMjlteGlW?=
 =?utf-8?B?ZFRYK3YwcVdEaWIyQjJLcTcrY3VvWlB2MWVZY2xjeExxaEFtbDhFTnZRMnFN?=
 =?utf-8?B?R3ZOU1pZTG9uSnpadGVHV2prWUdNZGRFVFR3YUdxUTd0R3dWNXRheFVhNktM?=
 =?utf-8?B?clI1TFoyVzlCNVNCaHFWblJDNThBcXhINW9kV2xxZE9vVHAwcUIxTHpJdWR1?=
 =?utf-8?B?eG02djNIRTlHRVc4WHBHSE1LUUlPT0tHWlBZUURJb3RNNEhBUGtCZ210ZnNl?=
 =?utf-8?B?M21VcmxkWEJ1Z0pWL3BCYTJlcFlhU3lZSVZtUy9yYlVoMnlkM0tUWDdqWUpU?=
 =?utf-8?B?bG1KUHhOZmRMYmhyRkY1S1J2NWlxTjFneVlZdEJQY0prSnA5dVJjSTdURldn?=
 =?utf-8?B?UXdrYW0rRVViZE0yaVRXQUhCOW1weTVDTWtyNi8vd2hQcktua1Y2alM2MTI1?=
 =?utf-8?B?b2wrSlJLODcwZlpBVEMzbFBlbVhTQlgzQ1BZazU2V0RnZ253S202K1RlTDNE?=
 =?utf-8?B?Qkdibm9LUkx0S1FBQzhqNUtLSk9TRzRJdllsRXl4ajJXREpuT25talRuV25Q?=
 =?utf-8?B?d0FQOFRoejdYalNrT3JUT0xxdGZXUS9NczhjQkZTUXJIcVVsbzZBMTFuZkFS?=
 =?utf-8?B?WDZEZExiRnZkMWZlT2ZjUlRvMGsyL21iMHhKWGRGVlp5dXFJeUxxQ2lIRSta?=
 =?utf-8?B?ZW11VmxjQ2tmSEtlRCtlR2Y0UmJrUnRjK1BJbmQrRXM4ODVHVFErUHpKWGV1?=
 =?utf-8?B?NytEVW50RTVyTEhPd2RvTzFkbXU4SGJ3dDU0RGc3cStsckpUdGZITStwTll5?=
 =?utf-8?B?TEFrVmlxQ0FQRTdqVStNV2NIMWYxcXcrNnJPNlQwNHlFTEJNOWdQSnBoLy9O?=
 =?utf-8?B?d1FPR0VkK1o3d3ZIMEpUU1FBT1hyaXE5V1Z6c1A4QXc5TVM5eGtROUFHaVJE?=
 =?utf-8?B?Zjc2WFhCZDZYWFIwZWM5bDdwRXQ1REhQbWNhejM4T0xiSHNtenBTZmhPdjdR?=
 =?utf-8?B?SGUyRGp0eXJqZms4Z1UyNFE2V20rQ0VKQXg4M1pta0ZWeHRsUW5HWU5YZk41?=
 =?utf-8?B?ZTFJY2IrY1lRRVVNdW9EMlZiNkluOHV6SmI1cW91TGdQaFVpQUl3cEI2ZEdp?=
 =?utf-8?B?SzY1MmJwcXpaMXJ4QTluMjhDa1FKbnBJMlVhdll3dVQ5NTZLdG1tVDh2SnZu?=
 =?utf-8?B?TTNqb2YxTi9sQkZRVGE2UEhGQUczSzVYV0N1S2VlNTFWS29tTG9YZnNXTFds?=
 =?utf-8?B?THpJYWIzTXQwZzNnaUpiT29oUTIySWl6QlhDS0Z3aDJLWkp4VmlwTmdkYS90?=
 =?utf-8?B?bS9ZTFBmNTR2TFJQcFdyM010aVF0dDdvTUdxL3RPcHhqNDFhRDlrZz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f0df25a-35ec-4a31-4b6b-08de532f9f2a
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB9072.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2026 05:41:53.4453
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lS1RPa7qdr0Gm/InqJfITuwDy1ZLJ+eZAw7ewIVSQ+SG1fV1h150WDh/2CWT/C3jB/AyL/SJ4UMK961jAbCrCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6101
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi,

On 9/1/26 17:22, Matthew Brost wrote:
> On Fri, Jan 09, 2026 at 12:27:50PM +1100, Jordan Niethe wrote:
>> Hi
>> On 9/1/26 11:31, Matthew Brost wrote:
>>> On Fri, Jan 09, 2026 at 11:01:13AM +1100, Jordan Niethe wrote:
>>>> Hi,
>>>>
>>>> On 8/1/26 16:42, Jordan Niethe wrote:
>>>>> Hi,
>>>>>
>>>>> On 8/1/26 13:25, Jordan Niethe wrote:
>>>>>> Hi,
>>>>>>
>>>>>> On 8/1/26 05:36, Matthew Brost wrote:
>>>>>>>
>>>>>>> Thanks for the series. For some reason Intel's CI couldn't apply this
>>>>>>> series to drm-tip to get results [1]. I'll manually apply this
>>>>>>> and run all
>>>>>>> our SVM tests and get back you on results + review the changes here. For
>>>>>>> future reference if you want to use our CI system, the series must apply
>>>>>>> to drm-tip, feel free to rebase this series and just send to intel-xe
>>>>>>> list if you want CI
>>>>>>
>>>>>> Thanks, I'll rebase on drm-tip and send to the intel-xe list.
>>>>>
>>>>> For reference the rebase on drm-tip on the intel-xe list:
>>>>>
>>>>> https://patchwork.freedesktop.org/series/159738/
>>>>>
>>>>> Will watch the CI results.
>>>>
>>>> The series causes some failures in the intel-xe tests:
>>>> https://patchwork.freedesktop.org/series/159738/#rev4
>>>>
>>>> Working through the failures now.
>>>>
>>>
>>> Yea, I saw the failures. I haven't had time look at the patches on my
>>> end quite yet. Scrabling to get a few things in 6.20/7.0 PR, so I may
>>> not have bandwidth to look in depth until mid next week but digging is
>>> on my TODO list.
>>
>> Sure, that's completely fine. The failures seem pretty directly related to
>> the
>> series so I think I'll be able to make good progress.
>>
>> For example https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159738v4/bat-bmg-2/igt@xe_evict@evict-beng-small.html
>>
>> It looks like I missed that xe_pagemap_destroy_work() needs to be updated to
>> remove the call to devm_release_mem_region() now we are no longer reserving
>> a mem
>> region.
> 
> +1
> 
> So this is the one I’d be most concerned about [1].
> xe_exec_system_allocator is our SVM test, which does almost all the
> ridiculous things possible in user space to stress SVM. It’s blowing up
> in the core MM—but the source of the bug could be anywhere (e.g., Xe
> SVM, GPU SVM, migrate device layer, or core MM). I’ll try to help when I
> have bandwidth.
> 
> Matt
> 
> [1] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159738v4/shard-bmg-9/igt@xe_exec_system_allocator@threads-many-large-execqueues-free-nomemset.html

A similar fault in lruvec_stat_mod_folio can be repro'd if
memremap_device_private_pagemap() is called with NUMA_NO_NODE instead of 
(say)
numa_node_id() for the nid parameter.

The xe_svm driver uses devm_memremap_device_private_pagemap() which uses
dev_to_node() for the nid parameter. Suspect this is causing something 
similar
to happen.

When memremap_pages() calls pagemap_range() we have the following logic:

         if (nid < 0)
                 nid = numa_mem_id();

I think we might need to add this to memremap_device_private_pagemap() 
to handle
the NUMA_NO_NODE case. Still confirming.

Thanks,
Jordan.

> 
>>
>>
>> Thanks,
>> Jordan.
>>
>>>
>>> Matt
>>>
>>>> Thanks,
>>>> Jordan.
>>>>
>>>>>
>>>>> Thanks,
>>>>> Jordan.
>>>>>
>>>>>>
>>>>>> Jordan.
>>>>>>
>>>>>>>
>>>>>>> I was also wondering if Nvidia could help review one our core MM patches
>>>>>>> [2] which is gating enabling 2M device pages too?
>>>>>>>
>>>>>>> Matt
>>>>>>>
>>>>>>> [1] https://patchwork.freedesktop.org/series/159738/
>>>>>>> [2] https://patchwork.freedesktop.org/patch/694775/?series=159119&rev=1
>>>>>>
>>>>>>
>>>>>
>>>>
>>


