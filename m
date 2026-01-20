Return-Path: <linuxppc-dev+bounces-16085-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sGKvLiQRcGlyUwAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16085-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Jan 2026 00:35:00 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CBCFA4DE16
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Jan 2026 00:34:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dwkFY0RTnz2xrL;
	Wed, 21 Jan 2026 10:34:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c10d::1" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768952096;
	cv=pass; b=L0lm3IVLUEOy+0vECag6ukV5mqLmSliTuiW4kauDxHEPlnWDeGqmMa1WEQSoeCt17b6o0QbVvwb7wGgseWSKPBXYT8c2Kd7TmKYaMr5EKJneAeQl5cWVASm+qmgUTlmK6RAFlY/k2WccJrZRtzPKeBP8c3iwMOvg2CkI0+d/Cyo5ZCXGo9qDADKKsWA00zwYwSHkZ+7fyrvwB+SyVLtiyIEOA5/1Wv8WIVyWnHquMnH5nyvjn/RK2sc2cYMVsg6WVMBMqsLPcf8W77guc+tDccCPNvfi34zPoSqBvub26kAO7D3sf6VRu2pSsnSlEHOcBSXtEsdt4yABrrqa+VcMZg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768952096; c=relaxed/relaxed;
	bh=Vk7aGO8KS68mEJDMr8TfVp9YtnjBYzgSIUFqG35xXq4=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=IvGfBGczyeSukVWkuTgAoNxpDlh2y24h93GJIF7iP5ALefBeym6QicrukuxtCXyLMw6/rvmxQpfB5Wn68D55qkYaTeJ6mgAkGCqbd0bJy4THl6Aja64K/21YgowThp9SD+EJPzaaci6GzeF3s0Nf+eAPy7B8dNcB2N0rdwU3c+MFSK5/05eX8RggJYoLcb3+BIqxZEBPfEiH11aARuEgZ1ffAVcgKdfGaPB9rPmo59VDpUyJrwQspnuh2DNiSU9dZFMWKkhf/TrEwo0lVpcHqbSLOy30//03e/c3NwWCISf9fQS3/3TyE5L0TUvn+DNCUp9FTdufVRGNDqh19MDYSw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=C/oSPSjH; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c10d::1; helo=sn4pr2101cu001.outbound.protection.outlook.com; envelope-from=jniethe@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=C/oSPSjH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:c10d::1; helo=sn4pr2101cu001.outbound.protection.outlook.com; envelope-from=jniethe@nvidia.com; receiver=lists.ozlabs.org)
Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazlp170120001.outbound.protection.outlook.com [IPv6:2a01:111:f403:c10d::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dwkFW4Mx5z2xjK
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Jan 2026 10:34:54 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n50Lob+YiAF5R1j47EIYd2dkrmG2fLUUo68M7HPXJacTsc6hothqHQRPytu6DWTBlD1OXXj7EBcLhDuQQtKo2NRDlSmK+AEo7sVGnb57lOfIJ6W/R8btELTbRLG6gCsbxfUDk3LYFxC3fImE3RVUo0G4iDx2saAq/cL88URD6X562y2mcL6dWumJGXTG6zZGrBa+mDsJg7EgNsPgSqB5cc7P87XwXUZWREWgQG0oLL9OLY+xDKFVCsSbji76pOr7e9Jt7TJzf24c/dzJXVIFJwsMy+paTyu638w43RJMwT6ogY91GGnvee3530IMSr+KbWQW/ScIjG+JUsAJl9M4jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vk7aGO8KS68mEJDMr8TfVp9YtnjBYzgSIUFqG35xXq4=;
 b=Bh3iQtOrv8pTMeqf2yBPRP+e4wsyJlrbHsum48KpHoZt5wiZhg/UACdgFZqMYR2xoFW6xFxm6iHa8/HgOmAPfyQiEyY3u7Im7+0PK1HHRVHn4Sv7ycAhrBxG1MOI23l9uN2mvsXAV9lhJ6PbU94Zk2qWZ5YPXN5kFIQDJGlgpHNFww6/RfzO+A6msZAHaY6WTRs45aLB5VkY4yvoJjvH1O6a5s9vGZAf4uD/7+Ntm4Wb8xCcxtWDAr3VudtrDvQBL1JzHTqu6sxI1utnxByK4SNTe71nTIi1hewjxkL3LUizXTad1FZGBZpaKjzYdzItoIMOmTopFXGtnTlOjk32mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vk7aGO8KS68mEJDMr8TfVp9YtnjBYzgSIUFqG35xXq4=;
 b=C/oSPSjHd3bMFmurf1o4GnM2lRx9j22raMiTl53WcH1wbcV24IS94voJW47EZi/iphTjqFXK7hXPd9CpoCs4viSbLvVqwSZqUaH9g27Vr8VT8DSngInLKVHnfOeTy/S9Zz5CjUVkafqkLEaUVgQfo2HU1uRzmK1oy4JsCoqGtFK7ww69/+xP2Hn9WRw2PFUm7rMSGOFin8eni2rkVC8I4lOLzOHY16WbRzpZmDQATo7cLJZ2JH0hzfLOuzF/e+jq50ao9H/CKjDTBXrbbWVXi9v2tfr01IEsbNague+UOpXnZdzso6jgvJ8IQ5g9tSZ+1Jt9Je2izNjbBKMtOsa4Lw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB9072.namprd12.prod.outlook.com (2603:10b6:8:be::6) by
 DM4PR12MB6037.namprd12.prod.outlook.com (2603:10b6:8:b0::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.9; Tue, 20 Jan 2026 23:34:29 +0000
Received: from DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1]) by DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1%5]) with mapi id 15.20.9520.011; Tue, 20 Jan 2026
 23:34:29 +0000
Message-ID: <649cc20c-161c-4343-8263-3712a4f6dccb@nvidia.com>
Date: Wed, 21 Jan 2026 10:34:21 +1100
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
 <fd4b6553-3e9e-4829-a12f-51d29a5d7571@nvidia.com>
 <16770FCE-A248-4184-ABFC-94C02C0B30F3@nvidia.com>
Content-Language: en-US
From: Jordan Niethe <jniethe@nvidia.com>
In-Reply-To: <16770FCE-A248-4184-ABFC-94C02C0B30F3@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0077.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::22) To DM4PR12MB9072.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: DM4PR12MB9072:EE_|DM4PR12MB6037:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f2027f0-bf2a-4f0a-5537-08de587c7494
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QmgzY3ZCcnFXWldoZE85K2lPWFhIZjhDbS85RStOaHFMaW5qUEFlZnFPN1hC?=
 =?utf-8?B?dGs5YVVGRGwyVzhqaElaTFUzZ3J2S0lGMVFwY3IwY01Va1RMR3dSdzFxYmpV?=
 =?utf-8?B?V01hcGxiMVo3Vk8rb3J3OERjeFM0NHVHOE9HT29WQkN5dFp0N3lRU09ZR0E4?=
 =?utf-8?B?TmpVZmI5c2ZQU0JGOUphcXJNTFVwWi9YRW5PR0VDbVpBQVZnWEVKeGJrNUtG?=
 =?utf-8?B?MWRtSnBmQlV1SGk3cFVieEdVbzZEa1BRendXMXZkUklIZFFHUml4K2JpL0lL?=
 =?utf-8?B?ZERpMTdxUTNJckg3MG9aZXQ5YzdyTmI3N2RzSEdDWFJ4SHpxMWgxYkJmQXNQ?=
 =?utf-8?B?OE9salZWMGZXZnNScDJzcUNnbGJvd1M1Y2h0akZaZkJJbG0zZ1FNUG50WnVp?=
 =?utf-8?B?UFJJS1Zla05ySjNkT1A5NU9sN0Exb1NXcGdZN2JYOXJ5N0YzUFZ3V1pkMi94?=
 =?utf-8?B?eHlpVDhXY0d2SEVjZFlmZmtTMm8rU1F5RmdQRmx6d1NWamhTS2Y2WlRQOVNU?=
 =?utf-8?B?Tzk2ZUlZRCs0VjgrUi90M0FtVG83N2ZrdUVkdkRFVlVYd250aUQvTlZGQmU5?=
 =?utf-8?B?RkRUSWpNU2Fhc2tyeDR2UEE1bEtTSWdUZFAvZjVHeGR3d25qaXk1UlFKeXRy?=
 =?utf-8?B?c095ZzBSU1diYnc1d2pEVmR5UVMrNzFhUS8rSnVOSTdOaHJ1QzJ0eG9jWGNx?=
 =?utf-8?B?bldaOEN3clh1aFNMNEVyeEJrRktDZkFJdmx0ZnJaejVhc01EazdkL3c4aCtS?=
 =?utf-8?B?MDE1YmJaYWFJQTF5ZjFyOUtlcDZLNlpRelFMU21aM2RFcDhEcGRYcEtJeEc0?=
 =?utf-8?B?a2hHZ0hXbzRSTW1KOGVBc3BRSmMvZlhPY1U5YkhYUVpNQ3BqNDFFQS9Sdjdi?=
 =?utf-8?B?MTRoRTVvTXhrbk9sRHYzeEh1d3poenlqU3EwUk5UeGRBVXB4VGd6SU1mSVRv?=
 =?utf-8?B?NzhSUTFGcmdHOHdkTUpXY0xMZkdmVUx4dUFoYVpNU0VWVmR2NmxBeWxYNXRL?=
 =?utf-8?B?U1pEckNRU0p0bjZ1bUpZTGwxNWp3RnRmZGU4UnlxZUUrMmJLc2UzZFFudUV1?=
 =?utf-8?B?V05VUkdTVTg3UStJMFloczJ6QXlLRmpCbUJldEJ6M0lPeEVJWjgveTN6bmx1?=
 =?utf-8?B?NHlzSTd2TEdUalcyMHUyeWtlRnpKYkJoNkk2R3MzeUNwRldBRENRZGpDU1lu?=
 =?utf-8?B?b3NxREN5NEt4ak5wanJrYXhzdDlJT25adXlCaTN6dlJRVk9JcFA5eUUxZnNM?=
 =?utf-8?B?a3lzNXpJbnZUZk0yZkRjYVB3RkYzUDhlR1BIYmJtZTZPVkp0UkdIVnJpYlpH?=
 =?utf-8?B?ellpa3MvV2tlNXVSbmZnVTlrUSt3eEdZcGxtWHl2ajhON1JGVzZMaDRySnRD?=
 =?utf-8?B?QlBneHJTOXgzTk5rZFJoMFdpY1RJNjFmYzRRUEJTdzRxajBFRXNWczEzNVpG?=
 =?utf-8?B?UUF1Y2lxckRyZDhmek9DNEMyT0l0MzFJMTQybHIvQzlidVJCVXV3Q0o3dXBV?=
 =?utf-8?B?a2paRktvOGxsaDhGVzlIRk1pb1VzcHA5VUhMUURmNk9mL3E3YkdHYkUyYXI3?=
 =?utf-8?B?Tlh1dFJhRXRhYmZFVTU1YmZGN0dib2NFWnU0elVCczZZaTZ1UU95YlFySnFa?=
 =?utf-8?B?UGlHTnJYbGtvUTNzMHdUM1pZVHdQaXRhRU5oTzNPRTR1MEowbHpSZ2d6WWxx?=
 =?utf-8?B?WUl6UmdtR2RneTNVVkw1M3RpUjZiNW9JL3Z3Q0dGWG4yQTlpMTEzbFpxMnU3?=
 =?utf-8?B?VXBXaGk4dWI5UC9oSGRTYjRndUxjL0F3ZmpWc2VLVGE5ZTRJUmxIUzlJbExp?=
 =?utf-8?B?b01VTDllNnlueVdtanRRZlpIbWtxNW8vTGFlbGNSMUpJZnA3L1BTOERoMnFZ?=
 =?utf-8?B?MkVwL2RSREp2NVlTY29jMGhkclEzc1MveW5wSGJaTjJ0b3ZWeDd6YTQxeWl2?=
 =?utf-8?B?YWtRNnE4VXUvVTRMSEovUGRQdENlWlBUM2RRM3k4azc4cVdxdk02TG9KeHJE?=
 =?utf-8?B?TXFBNGRXbmE4a2VNR1d2M0lxdGU3Q2hvNnRoM3NSazhpYzNUaFgyKzB2VitV?=
 =?utf-8?B?M3lPNUd2ckFGWGU4aklRNGtmY2NWMEk1eTNsZE5uelFEUUZVTnAxaDNVT3Zy?=
 =?utf-8?Q?OW1k=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB9072.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M2U5OGorYmQzbzNKT01seCtVbXd6YnVEQ1FiUU5kWlUxaVdDOUp6WHJvOWhQ?=
 =?utf-8?B?OVdzcEdKcWt4bWRSNzROU2dPOFkweC9IYmwyUkFFVDllZ21jR0JoV001RTBP?=
 =?utf-8?B?ZnNWMGFpSzR2K0VFcXV1cERGOEM1VzZLcm1BNG1rdHE3dkFmWVpBQkgwOThH?=
 =?utf-8?B?cW01N1EwbWhCWld6LzBteVRXeDBZR08zTlhKTVJWNEFMV0g3RGpWTllGV3ZM?=
 =?utf-8?B?diswK2MwRHhjSHRLSkpvZ0J0TVdXZ1ZoSE5WUExUNkVaY0pmSVY5WDJ3T0h6?=
 =?utf-8?B?UW4rclgwT0dWSWFEdnR1alpBYmxNRzRZMFFHNDZXdWFNQUphNXNSSGx5bHl3?=
 =?utf-8?B?TjMwVUJNdUExaGQ5ZHpUWXFMeG9EdFFzU3NNR2FrZk82VWd5c0NNS24ybm1y?=
 =?utf-8?B?WFFUYUlaWGl5ODJLUDNVWU16ZGdRd09xc2xwd0tralhaTTF5RFZNZUtPNVUy?=
 =?utf-8?B?WDhtMml1VWEvRFlZMytHTVNVNlNQWjZNVU0rb0Rmb2gyWCt4RnRiNnhpdzVK?=
 =?utf-8?B?bnhaNjEyZ1RBOUQ1NEZSQVdXWCtvYTJQM2EzKzVvZTZ5V2FEMEp0aE9EMTVN?=
 =?utf-8?B?cTVabEhOU2FMM0JTOExmQzJUajZDaWlLQUdOdzBBRXZPNWdhRzJ6S0hKUTVB?=
 =?utf-8?B?bjJnZmorNjVjekdWSU9zNTNrUEtiSVBnZnpoUG5XVzVlbkswWENRRU0vUkdM?=
 =?utf-8?B?SUxUaTNqbXpkU1BVU1Frb0loUExsUnJLSUhWSVRPMUxiWU84bXdZdEZBdGFB?=
 =?utf-8?B?c0tCb1N0bDRQbHA5NDFUN3pRTHFLN0tvWDFGQWV5dGxsRi81Tk5UUCtvdnRh?=
 =?utf-8?B?Wkt1c3l6bit2MHlFbk5DU3ZpK2R1cFlJajF2RWVraVlWU0hMcEo2eUpJMjZR?=
 =?utf-8?B?dTNkY0YxTldTWHVBVTRiTXlMYm5Gc2N2OWVjeTRYbWRRbXZIaHBGTDcrSjdi?=
 =?utf-8?B?VmVxY1VWYXlibVNRTVBiajJsTFlhYytWN2dmZ1dDbTFRWmhZK1d3OWt5cDk3?=
 =?utf-8?B?Nmp2a2Fxc0VCWXcwc2pwRWlNWm8vV3FrQ042N3NLSTdxa2h2ejdpMURVeVl2?=
 =?utf-8?B?L20yNHNOdituNWVvSXJ4dmdEbHA4QkZ2N3ptNmVJSGVOMUIxRTRvWFRWcU9z?=
 =?utf-8?B?b1ZGQno3TDgxLy9UNzJpRmFLdlVDZUhMdk04b29sSTI2ajFKcUp1MTFNcnVv?=
 =?utf-8?B?QkRqOURuNjhtNTNndFNCUFpSdXFtZUgvZnVYdzVqNTFDUmFOSGNrWjhPYXpr?=
 =?utf-8?B?bEljbHRpcUlLdzJ4TWxaVTl0aW1NQlJUT2JyQnFWQUU1UlZGdTRoVzIvcHor?=
 =?utf-8?B?VTM2MitDbmlhK3FmT1JwYXdsWUMrNjI2SEdhL1dYZ1l1NzNMZkx1NkxUYWlY?=
 =?utf-8?B?bDZudkRZbVNRZVhYN2M2TGszTnBZZ3MrRVR4NkZSWHk5M2QrQUEzWStaVUto?=
 =?utf-8?B?anVqcGtMRlVGOUhlQzZ0aEcrYWdMV01YZTYzMkM4Ym0yRDFyNVBRdGxyUG9E?=
 =?utf-8?B?TUFBbVQ3WUFhbVlJcldHOUR6cTVweE5pSTA1a2RVSU9IWFYxd25xTUFNYTFK?=
 =?utf-8?B?Q0REVE1ldmJocG9Ha3VWK3FnOVlLWlVNYXI3bzdPWGg2NnV2SnA5VUZWQml2?=
 =?utf-8?B?dkJJWW1FSGxJeXRUaWVJSGtWdHp4a2RtR3JGdTdOVzZ1R1phOXBHYVpkUDZy?=
 =?utf-8?B?S1ZnMW4yMnZHU1YraVNnTFhubWt6cnBibUNVMHIrbTB3RVpwV1lrR250NFZW?=
 =?utf-8?B?TG94RS9TUzdBc2t4dG40NWNmUUp3YldJVTVXb2p5WmZSa3JrK0NXMWl4K1Fs?=
 =?utf-8?B?U2VhMXllaEpuY1pzMEsrZXk1Yk1nQ3UraEFLTlFXZGxWNG1CZHZIVlorTW1i?=
 =?utf-8?B?S0hSZDhuYUpYL1VycmdkSWpPaHBTS0EyelNwei9taUxjNE5MYzAyYWNnUUlL?=
 =?utf-8?B?ZGRWaGllQmxJM1ZtcHVzWnBXZ0dqTTlQZDJxNGdYcHVldGw5YjVjbWwrODh2?=
 =?utf-8?B?R0xoNFlxWjNpTk8vZ1dZeHN1dDc1UWlhUHBVOVNra200VmJQOTB5bk1lUlhv?=
 =?utf-8?B?R1FZUm9Oc1Q2NmdNR2lWUm42NFRUMmFacWdRK3VINmNLQ2pkMWw5ckUwK1Bo?=
 =?utf-8?B?Vlc2czFxYzJFZmdIa2lTUExjbllpb2lCdGF4Z2w0VzlPOUx2ZlpycTE4TWlW?=
 =?utf-8?B?R0lKaVlYN0ozNU9GTk9oNENRMmhQajRHYVRxZ1AyWEQzUDVhNStlVWRxOEhD?=
 =?utf-8?B?RVc3RFZHSzJ3aUZTcWNqOVFmb3NwR2Zienl4MnJ5ZmdFQmRyT0ZNOEh2R3dX?=
 =?utf-8?B?dXBFNVg2ZWJjNFFlN2NscmdXK2MxTXRoZUFVWFg1UkIzKzlxbUM0dz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f2027f0-bf2a-4f0a-5537-08de587c7494
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB9072.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 23:34:29.0335
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xwkD99ugmWOIhZFyh0XAIheCkb7qq/NBEnEAPLCnR4nxcyUevU6TA4qzKqkE6RzODOfysORVXQ20a+80qFatQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6037
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Spamd-Result: default: False [-2.21 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[jniethe@nvidia.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	FORGED_RECIPIENTS(0.00)[m:ziy@nvidia.com,m:linux-mm@kvack.org,m:balbirs@nvidia.com,m:matthew.brost@intel.com,m:akpm@linux-foundation.org,m:linux-kernel@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:david@redhat.com,m:apopple@nvidia.com,m:lorenzo.stoakes@oracle.com,m:lyude@redhat.com,m:dakr@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:rcampbell@nvidia.com,m:mpenttil@redhat.com,m:jgg@nvidia.com,m:willy@infradead.org,m:linuxppc-dev@lists.ozlabs.org,m:intel-xe@lists.freedesktop.org,m:jgg@ziepe.ca,m:Felix.Kuehling@amd.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	TAGGED_FROM(0.00)[bounces-16085-lists,linuxppc-dev=lfdr.de];
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
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:email,nvidia.com:mid,lists.ozlabs.org:rdns,lists.ozlabs.org:helo,Nvidia.com:dkim]
X-Rspamd-Queue-Id: CBCFA4DE16
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

On 21/1/26 10:06, Zi Yan wrote:
> On 20 Jan 2026, at 18:02, Jordan Niethe wrote:
> 
>> Hi,
>>
>> On 21/1/26 09:53, Zi Yan wrote:
>>> On 20 Jan 2026, at 17:33, Jordan Niethe wrote:
>>>
>>>> On 14/1/26 07:04, Zi Yan wrote:
>>>>> On 7 Jan 2026, at 4:18, Jordan Niethe wrote:
>>>>>
>>>>>> Currently when creating these device private struct pages, the first
>>>>>> step is to use request_free_mem_region() to get a range of physical
>>>>>> address space large enough to represent the devices memory. This
>>>>>> allocated physical address range is then remapped as device private
>>>>>> memory using memremap_pages().
>>>>>>
>>>>>> Needing allocation of physical address space has some problems:
>>>>>>
>>>>>>      1) There may be insufficient physical address space to represent the
>>>>>>         device memory. KASLR reducing the physical address space and VM
>>>>>>         configurations with limited physical address space increase the
>>>>>>         likelihood of hitting this especially as device memory increases. This
>>>>>>         has been observed to prevent device private from being initialized.
>>>>>>
>>>>>>      2) Attempting to add the device private pages to the linear map at
>>>>>>         addresses beyond the actual physical memory causes issues on
>>>>>>         architectures like aarch64 meaning the feature does not work there.
>>>>>>
>>>>>> Instead of using the physical address space, introduce a device private
>>>>>> address space and allocate devices regions from there to represent the
>>>>>> device private pages.
>>>>>>
>>>>>> Introduce a new interface memremap_device_private_pagemap() that
>>>>>> allocates a requested amount of device private address space and creates
>>>>>> the necessary device private pages.
>>>>>>
>>>>>> To support this new interface, struct dev_pagemap needs some changes:
>>>>>>
>>>>>>      - Add a new dev_pagemap::nr_pages field as an input parameter.
>>>>>>      - Add a new dev_pagemap::pages array to store the device
>>>>>>        private pages.
>>>>>>
>>>>>> When using memremap_device_private_pagemap(), rather then passing in
>>>>>> dev_pagemap::ranges[dev_pagemap::nr_ranges] of physical address space to
>>>>>> be remapped, dev_pagemap::nr_ranges will always be 1, and the device
>>>>>> private range that is reserved is returned in dev_pagemap::range.
>>>>>>
>>>>>> Forbid calling memremap_pages() with dev_pagemap::ranges::type =
>>>>>> MEMORY_DEVICE_PRIVATE.
>>>>>>
>>>>>> Represent this device private address space using a new
>>>>>> device_private_pgmap_tree maple tree. This tree maps a given device
>>>>>> private address to a struct dev_pagemap, where a specific device private
>>>>>> page may then be looked up in that dev_pagemap::pages array.
>>>>>>
>>>>>> Device private address space can be reclaimed and the assoicated device
>>>>>> private pages freed using the corresponding new
>>>>>> memunmap_device_private_pagemap() interface.
>>>>>>
>>>>>> Because the device private pages now live outside the physical address
>>>>>> space, they no longer have a normal PFN. This means that page_to_pfn(),
>>>>>> et al. are no longer meaningful.
>>>>>>
>>>>>> Introduce helpers:
>>>>>>
>>>>>>      - device_private_page_to_offset()
>>>>>>      - device_private_folio_to_offset()
>>>>>>
>>>>>> to take a given device private page / folio and return its offset within
>>>>>> the device private address space.
>>>>>>
>>>>>> Update the places where we previously converted a device private page to
>>>>>> a PFN to use these new helpers. When we encounter a device private
>>>>>> offset, instead of looking up its page within the pagemap use
>>>>>> device_private_offset_to_page() instead.
>>>>>>
>>>>>> Update the existing users:
>>>>>>
>>>>>>     - lib/test_hmm.c
>>>>>>     - ppc ultravisor
>>>>>>     - drm/amd/amdkfd
>>>>>>     - gpu/drm/xe
>>>>>>     - gpu/drm/nouveau
>>>>>>
>>>>>> to use the new memremap_device_private_pagemap() interface.
>>>>>>
>>>>>> Signed-off-by: Jordan Niethe <jniethe@nvidia.com>
>>>>>> Signed-off-by: Alistair Popple <apopple@nvidia.com>
>>>>>>
>>>>>> ---
>>>>>>
>>>>>> NOTE: The updates to the existing drivers have only been compile tested.
>>>>>> I'll need some help in testing these drivers.
>>>>>>
>>>>>> v1:
>>>>>> - Include NUMA node paramater for memremap_device_private_pagemap()
>>>>>> - Add devm_memremap_device_private_pagemap() and friends
>>>>>> - Update existing users of memremap_pages():
>>>>>>        - ppc ultravisor
>>>>>>        - drm/amd/amdkfd
>>>>>>        - gpu/drm/xe
>>>>>>        - gpu/drm/nouveau
>>>>>> - Update for HMM huge page support
>>>>>> - Guard device_private_offset_to_page and friends with CONFIG_ZONE_DEVICE
>>>>>>
>>>>>> v2:
>>>>>> - Make sure last member of struct dev_pagemap remains DECLARE_FLEX_ARRAY(struct range, ranges);
>>>>>> ---
>>>>>>     Documentation/mm/hmm.rst                 |  11 +-
>>>>>>     arch/powerpc/kvm/book3s_hv_uvmem.c       |  41 ++---
>>>>>>     drivers/gpu/drm/amd/amdkfd/kfd_migrate.c |  23 +--
>>>>>>     drivers/gpu/drm/nouveau/nouveau_dmem.c   |  35 ++--
>>>>>>     drivers/gpu/drm/xe/xe_svm.c              |  28 +---
>>>>>>     include/linux/hmm.h                      |   3 +
>>>>>>     include/linux/leafops.h                  |  16 +-
>>>>>>     include/linux/memremap.h                 |  64 +++++++-
>>>>>>     include/linux/migrate.h                  |   6 +-
>>>>>>     include/linux/mm.h                       |   2 +
>>>>>>     include/linux/rmap.h                     |   5 +-
>>>>>>     include/linux/swapops.h                  |  10 +-
>>>>>>     lib/test_hmm.c                           |  69 ++++----
>>>>>>     mm/debug.c                               |   9 +-
>>>>>>     mm/memremap.c                            | 193 ++++++++++++++++++-----
>>>>>>     mm/mm_init.c                             |   8 +-
>>>>>>     mm/page_vma_mapped.c                     |  19 ++-
>>>>>>     mm/rmap.c                                |  43 +++--
>>>>>>     mm/util.c                                |   5 +-
>>>>>>     19 files changed, 391 insertions(+), 199 deletions(-)
>>>>>>
>>>>> <snip>
>>>>>
>>>>>> diff --git a/include/linux/mm.h b/include/linux/mm.h
>>>>>> index e65329e1969f..b36599ab41ba 100644
>>>>>> --- a/include/linux/mm.h
>>>>>> +++ b/include/linux/mm.h
>>>>>> @@ -2038,6 +2038,8 @@ static inline unsigned long memdesc_section(memdesc_flags_t mdf)
>>>>>>      */
>>>>>>     static inline unsigned long folio_pfn(const struct folio *folio)
>>>>>>     {
>>>>>> +	VM_BUG_ON(folio_is_device_private(folio));
>>>>>
>>>>> Please use VM_WARN_ON instead.
>>>>
>>>> ack.
>>>>
>>>>>
>>>>>> +
>>>>>>     	return page_to_pfn(&folio->page);
>>>>>>     }
>>>>>>
>>>>>> diff --git a/include/linux/rmap.h b/include/linux/rmap.h
>>>>>> index 57c63b6a8f65..c1561a92864f 100644
>>>>>> --- a/include/linux/rmap.h
>>>>>> +++ b/include/linux/rmap.h
>>>>>> @@ -951,7 +951,7 @@ static inline unsigned long page_vma_walk_pfn(unsigned long pfn)
>>>>>>     static inline unsigned long folio_page_vma_walk_pfn(const struct folio *folio)
>>>>>>     {
>>>>>>     	if (folio_is_device_private(folio))
>>>>>> -		return page_vma_walk_pfn(folio_pfn(folio)) |
>>>>>> +		return page_vma_walk_pfn(device_private_folio_to_offset(folio)) |
>>>>>>     		       PVMW_PFN_DEVICE_PRIVATE;
>>>>>>
>>>>>>     	return page_vma_walk_pfn(folio_pfn(folio));
>>>>>> @@ -959,6 +959,9 @@ static inline unsigned long folio_page_vma_walk_pfn(const struct folio *folio)
>>>>>>
>>>>>>     static inline struct page *page_vma_walk_pfn_to_page(unsigned long pvmw_pfn)
>>>>>>     {
>>>>>> +	if (pvmw_pfn & PVMW_PFN_DEVICE_PRIVATE)
>>>>>> +		return device_private_offset_to_page(pvmw_pfn >> PVMW_PFN_SHIFT);
>>>>>> +
>>>>>>     	return pfn_to_page(pvmw_pfn >> PVMW_PFN_SHIFT);
>>>>>>     }
>>>>>
>>>>> <snip>
>>>>>
>>>>>> diff --git a/mm/page_vma_mapped.c b/mm/page_vma_mapped.c
>>>>>> index 96c525785d78..141fe5abd33f 100644
>>>>>> --- a/mm/page_vma_mapped.c
>>>>>> +++ b/mm/page_vma_mapped.c
>>>>>> @@ -107,6 +107,7 @@ static bool map_pte(struct page_vma_mapped_walk *pvmw, pmd_t *pmdvalp,
>>>>>>     static bool check_pte(struct page_vma_mapped_walk *pvmw, unsigned long pte_nr)
>>>>>>     {
>>>>>>     	unsigned long pfn;
>>>>>> +	bool device_private = false;
>>>>>>     	pte_t ptent = ptep_get(pvmw->pte);
>>>>>>
>>>>>>     	if (pvmw->flags & PVMW_MIGRATION) {
>>>>>> @@ -115,6 +116,9 @@ static bool check_pte(struct page_vma_mapped_walk *pvmw, unsigned long pte_nr)
>>>>>>     		if (!softleaf_is_migration(entry))
>>>>>>     			return false;
>>>>>>
>>>>>> +		if (softleaf_is_migration_device_private(entry))
>>>>>> +			device_private = true;
>>>>>> +
>>>>>>     		pfn = softleaf_to_pfn(entry);
>>>>>>     	} else if (pte_present(ptent)) {
>>>>>>     		pfn = pte_pfn(ptent);
>>>>>> @@ -127,8 +131,14 @@ static bool check_pte(struct page_vma_mapped_walk *pvmw, unsigned long pte_nr)
>>>>>>     			return false;
>>>>>>
>>>>>>     		pfn = softleaf_to_pfn(entry);
>>>>>> +
>>>>>> +		if (softleaf_is_device_private(entry))
>>>>>> +			device_private = true;
>>>>>>     	}
>>>>>>
>>>>>> +	if ((device_private) ^ !!(pvmw->pfn & PVMW_PFN_DEVICE_PRIVATE))
>>>>>> +		return false;
>>>>>> +
>>>>>>     	if ((pfn + pte_nr - 1) < (pvmw->pfn >> PVMW_PFN_SHIFT))
>>>>>>     		return false;
>>>>>>     	if (pfn > ((pvmw->pfn >> PVMW_PFN_SHIFT) + pvmw->nr_pages - 1))
>>>>>> @@ -137,8 +147,11 @@ static bool check_pte(struct page_vma_mapped_walk *pvmw, unsigned long pte_nr)
>>>>>>     }
>>>>>>
>>>>>>     /* Returns true if the two ranges overlap.  Careful to not overflow. */
>>>>>> -static bool check_pmd(unsigned long pfn, struct page_vma_mapped_walk *pvmw)
>>>>>> +static bool check_pmd(unsigned long pfn, bool device_private, struct page_vma_mapped_walk *pvmw)
>>>>>>     {
>>>>>> +	if ((device_private) ^ !!(pvmw->pfn & PVMW_PFN_DEVICE_PRIVATE))
>>>>>> +		return false;
>>>>>> +
>>>>>>     	if ((pfn + HPAGE_PMD_NR - 1) < (pvmw->pfn >> PVMW_PFN_SHIFT))
>>>>>>     		return false;
>>>>>>     	if (pfn > (pvmw->pfn >> PVMW_PFN_SHIFT) + pvmw->nr_pages - 1)
>>>>>> @@ -255,6 +268,8 @@ bool page_vma_mapped_walk(struct page_vma_mapped_walk *pvmw)
>>>>>>
>>>>>>     				if (!softleaf_is_migration(entry) ||
>>>>>>     				    !check_pmd(softleaf_to_pfn(entry),
>>>>>> +					       softleaf_is_device_private(entry) ||
>>>>>> +					       softleaf_is_migration_device_private(entry),
>>>>>>     					       pvmw))
>>>>>>     					return not_found(pvmw);
>>>>>>     				return true;
>>>>>> @@ -262,7 +277,7 @@ bool page_vma_mapped_walk(struct page_vma_mapped_walk *pvmw)
>>>>>>     			if (likely(pmd_trans_huge(pmde))) {
>>>>>>     				if (pvmw->flags & PVMW_MIGRATION)
>>>>>>     					return not_found(pvmw);
>>>>>> -				if (!check_pmd(pmd_pfn(pmde), pvmw))
>>>>>> +				if (!check_pmd(pmd_pfn(pmde), false, pvmw))
>>>>>>     					return not_found(pvmw);
>>>>>>     				return true;
>>>>>>     			}
>>>>>
>>>>> It seems to me that you can add a new flag like “bool is_device_private” to
>>>>> indicate whether pfn is a device private index instead of pfn without
>>>>> manipulating pvmw->pfn itself.
>>>>
>>>> We could do it like that, however my concern with using a new param was that
>>>> storing this info seperately might make it easier to misuse a device private
>>>> index as a regular pfn.
>>>>
>>>> It seemed like it could be easy to overlook both when creating the pvmw and
>>>> then when accessing the pfn.
>>>
>>> That is why I asked for a helper function like page_vma_walk_pfn(pvmw) to
>>> return the converted pfn instead of pvmw->pfn directly. You can add a comment
>>> to ask people to use helper function and even mark pvmw->pfn /* do not use
>>> directly */.
>>
>> Yeah I agree that is a good idea.
>>
>>>
>>> In addition, your patch manipulates pfn by left shifting it by 1. Are you sure
>>> there is no weird arch having pfns with bit 63 being 1? Your change could
>>> break it, right?
>>
>> Currently for migrate pfns we left shift by pfns by MIGRATE_PFN_SHIFT (6), so I
>> thought doing something similiar here should be safe.
> 
> Yeah, but that limits to archs supporting HMM. page_vma_mapped_walk is used
> by almost every arch, so it has a broader impact.

That is a good point.

I see a few options:

- On every arch we can assume SWP_PFN_BITS? I could add a sanity check that we
   have an extra bit on top of SWP_PFN_BITS within an unsigned long.
- We could define PVMW_PFN_SHIFT as 0 if !CONFIG_MIGRATION as the flag is not
   required.
- Instead of modifying pvmw->pfn we could use pvmw->flags but that has the
   issues of separating the offset type and offset.

Thanks,
Jordan.


> 
> Best Regards,
> Yan, Zi


