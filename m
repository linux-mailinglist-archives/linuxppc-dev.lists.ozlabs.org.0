Return-Path: <linuxppc-dev+bounces-15201-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FB76CF1854
	for <lists+linuxppc-dev@lfdr.de>; Mon, 05 Jan 2026 01:43:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dkwWW5Jx3z2yG3;
	Mon, 05 Jan 2026 11:43:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=52.101.48.11 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767573783;
	cv=pass; b=E4wfaOz4+y92mXbVQ1pGS2LAs0U7uCrlE9ZpMnR2n5g5PYgtbibSNwj+ybjSUnkKjvQ/JRKu42KGbxEMul2DmDTPqFB7dY/SElT73xsZNITVKqHKunpA+yfctKmJd9RyUnRjPzqjdANUMBSIpOuvcaV3qKKY68VSPtlRSZMQUOCVCDIP3PweUcXB7y6l6UcHnqE+lGAuGP0K2o6Jthi1FaQ6zGbJ1Mirss6Vn88LqnBczxjv11mIvEQYR3dfOxXwBp4OHkmyHM+r1H7QgwcPnOM0YDtW2QUVX2JAANKxt1jnZpKQw+/m6NRvcaTSOshLCABb3NHlXK7uSWKq3cawYQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767573783; c=relaxed/relaxed;
	bh=lgzkQ1jHU1VLRBFcs1F3hGCXaOBXH2akQAg6AGOiqSM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=RmA7jH47sDc9vxoQg4FStC8SPNVkavfDxjuQkmZe35FVUmhkOlxMspzFHM1uSHFoCdL4DxkpbYY+WpFRbveBL1XqxZoljP+FKap4r5lgfHH1FU4WeHdLdkbpBrEaOM37Dnu+Ort5vGGVpc2RQvnNQw9N4W0Du0933YvXp8LEbROHI4fOpL5V5wZ5nQL0E9cvof3vlpsoUCwiTCrIr7Jvyfvr5K5mSg6p5mnO/nn8teWU2//M7XVbChyIeDh+AkaPpc54oiyTpINcU9vxADI+U1Xso6G+eOFI/84XNvFOQf4pqmpOZSwQc/ax+h9HmLsInZtxmTuVi9eJ9Ao59/zGdg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=B3jQkZb0; dkim-atps=neutral; spf=pass (client-ip=52.101.48.11; helo=mw6pr02cu001.outbound.protection.outlook.com; envelope-from=jniethe@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=B3jQkZb0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=52.101.48.11; helo=mw6pr02cu001.outbound.protection.outlook.com; envelope-from=jniethe@nvidia.com; receiver=lists.ozlabs.org)
Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012011.outbound.protection.outlook.com [52.101.48.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dkwWV4SKSz2xdL
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 05 Jan 2026 11:43:02 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VD+rMUTH+nXWY0vn8xUaISI/74Fz81STG+GSLoe5IFXpHdVLMNPo8sLtPFxy7j4b50ZStlm+/xuxVgFOvvvvddA+++5Y6psXFQXisD7Fqdpz+iGgOLUrKBub2Yh+zgaJcMBAg30pm0MjH0gesQoWIHDSJN7ABOp4GsiDhE/kws6tsVzPIJRInRjQUoVv0NySjctj0yIVATl7ALjpu2JfEsuVlC7I+Duey2PwXxmaGoYSisEdFCZ+bEfjjo4a7P1aeyFHcOrIdh4/uWni/cAJWH6OMKBMu9b25BIhtBORYC6+9uwa7n83eG+MvwD19W4JE5CyQ7X+uPKYpXFsx60teQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lgzkQ1jHU1VLRBFcs1F3hGCXaOBXH2akQAg6AGOiqSM=;
 b=BDZL7PBRE0xQToK8PftGWjH/XiVvBhBdwfpAKNGEPF4OVXJH8chLXS4Y1dzqmIEhUCIfX724KfiS6YGhXFpXjnSivyBVMWZNOjft49WOC413P3njm0ON3YIVrhYxJFwTImgM74IvQP+RKWFsyMBzf+RuZvtjN8eQoPkDcWW+Zislx+u93aNjE9KMEKo8PI5Eo+oZ37lCJyL85NbdRxdpPiSU+5OXlDI9Go+n0gPPOUkoH4FsPHQeA+dB7J2hPBiGQhJheTNBId8FC7Y/SxMt1InTYKn8By6Z33BTF5wENgfidgrEF4FKndHREg3SPunVPsHWPY78Es2BPJKqcjDKiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lgzkQ1jHU1VLRBFcs1F3hGCXaOBXH2akQAg6AGOiqSM=;
 b=B3jQkZb0I62H1drZpgxPwHWzZiGRbL5fj+Ka815IKRxLFRJWoNjFPY/KcB25R2b9vI5tqvihoguyOziR4j1v0+IYukeGCFAhEpDCMuRV9XdEZVTWZVdA5+eX0svSS1OeTnOV/AG9Ig+Y/nwMe8Ld7Rmz+L9fwmWBgmxfZVv1XvewErPI9orJdsDkvyGgiuLsCGIPudFe2/vsoT4TKYGM456oR9iyWV5NE1+csCTuXDVDDzkymVIVR+zMYTe0qa92z8bIuioLgnvaFPnoajdzrYXT8BEUWIzSPyeJWvZnzcHoGj2xk4CO0T62DlYoolyj4oVVMe78DY3C1Zv+yUyteQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB9072.namprd12.prod.outlook.com (2603:10b6:8:be::6) by
 DM4PR12MB6638.namprd12.prod.outlook.com (2603:10b6:8:b5::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9478.4; Mon, 5 Jan 2026 00:42:21 +0000
Received: from DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1]) by DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1%5]) with mapi id 15.20.9478.004; Mon, 5 Jan 2026
 00:42:21 +0000
Message-ID: <9c84d496-9520-4bd1-b190-73d6e050cb09@nvidia.com>
Date: Mon, 5 Jan 2026 11:42:13 +1100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/8] mm/migrate_device: Add migrate PFN flag to track
 device private pages
To: "Kuehling, Felix" <felix.kuehling@amd.com>, linux-mm@kvack.org
Cc: balbirs@nvidia.com, matthew.brost@intel.com, akpm@linux-foundation.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 david@redhat.com, ziy@nvidia.com, apopple@nvidia.com,
 lorenzo.stoakes@oracle.com, lyude@redhat.com, dakr@kernel.org,
 airlied@gmail.com, simona@ffwll.ch, rcampbell@nvidia.com,
 mpenttil@redhat.com, jgg@nvidia.com, willy@infradead.org,
 linuxppc-dev@lists.ozlabs.org, intel-xe@lists.freedesktop.org, jgg@ziepe.ca
References: <20251231043154.42931-1-jniethe@nvidia.com>
 <20251231043154.42931-2-jniethe@nvidia.com>
 <d489ebb2-89c7-44e7-80eb-53b5fde8cd39@amd.com>
Content-Language: en-US
From: Jordan Niethe <jniethe@nvidia.com>
In-Reply-To: <d489ebb2-89c7-44e7-80eb-53b5fde8cd39@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SY5P282CA0072.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:10:203::15) To DM4PR12MB9072.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: DM4PR12MB9072:EE_|DM4PR12MB6638:EE_
X-MS-Office365-Filtering-Correlation-Id: c88b4277-d2b9-4faa-dbde-08de4bf3494b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eDFqT1VtQWZXUlFhYThzeGJEMEpxK3hEcU9CbWZxY1o1ZXBDbXRHeElpYmJK?=
 =?utf-8?B?NEwvQVZOOE94bG9lSkN1UlJxdlBQNG42WWlnV00wSDF5d0pvQkJhZENDeDZx?=
 =?utf-8?B?WnljK3ZySDhncVdHeHlRZzgrc0lkRWthV0I0ZDVPUi9IRHQzTDV0MUg1TTBX?=
 =?utf-8?B?amg0OVRjWFNpbFRMdlB1akRwZFpjdXA0R0pTa0dpZmpiRG02Zmtlc05SWVdr?=
 =?utf-8?B?Z1MvQ2krM1h3ODNDV1l1UTlBZy9IWXZDeFBQUHZKMEwva0cwT24rek02TzZt?=
 =?utf-8?B?QXN4SFFPL1A2cEx2ajI3emlDdHJ2cmNIaWRDUlFvV2N2Nk41a2dUenZUQWtx?=
 =?utf-8?B?MkZMNmhHZm1Ma2EvK0JxZVdPU29zRWxLZlZsc3N4Rzk3UGRvai9pV0EvaDZV?=
 =?utf-8?B?L1h3eDF6ZzhZc2huaVJyV0VNS0Fab1ZHemtlaG5PSUh5UFlhcG5oSDI0RElY?=
 =?utf-8?B?ZkFDWmRJNlFoQmRZbFpEZEYwUVVXNW94NGMzQS9FWm5tVk5iQmRWSzJWekZu?=
 =?utf-8?B?emlzUVZtRElsWDRKSUFFbVhxYWRuYTZENStrUmtpN0dKYVpsbDRzYW01bUdH?=
 =?utf-8?B?a3JvaStSeUp3Uk83Z1pLRHVDZjNKYmNUaEYzSXpWUW1uNTdPeUlpbjRWckxo?=
 =?utf-8?B?OGJQaUJTc1hkY3dpamQvM3IyWS9ycnduSHNzcDN4UnRhWlRXYitDaDQ5bTVn?=
 =?utf-8?B?MFN4RCt1aDRvUXdaRGNDRTJ4bzhhK3BFMk9sMVBaUGlNK2JmVi9SZ0I0VzdT?=
 =?utf-8?B?NVIrK3ErRFNXWVlkdkFROWxFOVZjWGZJVHEvWnVia2NZVSs4eDBkcVJGNjdI?=
 =?utf-8?B?NFJreWgvM3FiYmZKVzN5aDUxNUlwd2kwY1pxV1RKVzgvZS90L2FMYzZvQm4x?=
 =?utf-8?B?NEw5TGN6S1Q2T3ZwcSs3eWcvTks2Q2ZYLzNKTnF2ck5MZkhCSklYOSswcnJ4?=
 =?utf-8?B?d05nSm5DYnpod2pOV0t0dVhrbTdzZnJXRFdPczdSMnY3UXgycE5Bc3dsSkdI?=
 =?utf-8?B?TWJia3RvTERLVVM4d3dyemg0alprczFNTlE2MVo3NkdaK0lxdjJ5dkY1SXBx?=
 =?utf-8?B?eDByMGFiR3djejZnZXMyZkhnN1U3RTRIbVpjZ3NuaUtBQUxiWmU5UUREc0kz?=
 =?utf-8?B?dmpQaDN0YzhoODRkWVpwT3BPczFKTWw1bFhrbkQyOGhhWlhtdWovT2hFKy9R?=
 =?utf-8?B?NGx6TTVmUTdqNDRrbEpWRnBCRXZpYlo3OWxSQzcxRTdrem5QZEozeFg0MUs1?=
 =?utf-8?B?TTRkcmRBemRQckQyeWN4Y3BON1VTajFmZE95QndKTGNBNWtWYzhOeFBtRVND?=
 =?utf-8?B?cE1ka0JreERPWW1tcFNiU2FtU0pwRTdNYS80bkpTZ01yeDZuNnRHTHhBRlNY?=
 =?utf-8?B?aFY4eTNxa0lOcXRwQTR3SkViTHpwcnYxaHJWamxmcTJKQzFscWN5ZnZEbUNC?=
 =?utf-8?B?anB0VjIrWXM5V1R3NjVkLzhTYWJTb0kxSEJVRG80WUFzTHo1OUZTc0ZZS09a?=
 =?utf-8?B?cGprM0FZOWU1RHVET0VxYU9ncnBDNmE3VFVkRDJ0R1hmSjFvYmQ3Q0VGRFQv?=
 =?utf-8?B?azk2UkNaT3crVW9JYk52Rmt1ak1WL282cDFNQ3BzbGZ4NnpKYnVMSjN4ZTly?=
 =?utf-8?B?blpWWDc3blJrRWFQOWZTSTJERjBiMUFUcHJrREg0OWNWdUE4Q0tNZXBYb0xY?=
 =?utf-8?B?RGkxOXlVMDNLeE01Wkt6d3hac3p6L2F4R3ROUC80cEg2dkttSHgvNGdOaXpV?=
 =?utf-8?B?U2lBT0wxcWR6NTYraHJ5N2RpSVVyeVBFTFFtTDVZazNIa2pTQUNZekRkUHBn?=
 =?utf-8?B?YzBXUSt6Njhjc2RYbWpJL2hDWlpmUDRvY0o4ME9JV0VlaXZ2TnMyckRRaXRp?=
 =?utf-8?B?YUNERzN3NjUwUnJlVUNYK3BDTWRuYXZOTUtSY2ZTNDJZWUtUL1NpZDBwVTZZ?=
 =?utf-8?Q?Cx7uDfK2VCLPULXNMZzES8YGq85gI/ek?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB9072.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UzdNemptNVZYMk9BK05GditkbWN0V21ZazRYNDNzQzNVbisrYUV6aWJQdWVo?=
 =?utf-8?B?VUxOSTd2YmN1YkFicGpPQmVXRS9mZGtxbDN4L0pRV3FvVS9QY2NpNzkyU1NP?=
 =?utf-8?B?YTVDUUNSNUZUeGlYYTd0Wld1YVp0QnU2T3RpT0NlYlRSVHB0VFVqVXk0c0xx?=
 =?utf-8?B?MXV2UnJXVXQ5SjRneXlqQ2NhNXpWVHhCaWFTMEZ3aE1Dak90azFpNWU2WkR2?=
 =?utf-8?B?dU0zbmIwdytMU1lsdnl2M0dwa1lLaGtzTUwrRGl6R3BueW42Wk42NzhvU1J2?=
 =?utf-8?B?UHl4cnNvVkUvY001SUFFNk5XK1YzUVBzOWExWFZabmdwWDE2OGtvSHFaNS8v?=
 =?utf-8?B?eHZJdjlUQVFveEZJK0RPb2xaVHVLVzJCUlVHcWZCc2VsdnJBOWpSOVlrbkl2?=
 =?utf-8?B?dXZWSVo3akR5ekRpdDRpUDlEd1g2Rk02SWR4WE0yVGxHbm5Od01sbFVpL3hy?=
 =?utf-8?B?UXZ0cUVpSFErbFZ2UFNDRmJNYjkvdHBSbHdlTU9XVE9VR3plU1huRTlHRk9q?=
 =?utf-8?B?dGs4aVVtK0pJWC9hZUlJdThwSmQ5eURxcnViNkprcXhVaUZoaE9HYk8wU2lt?=
 =?utf-8?B?cVhXRCtIenhKVEF6SXB6UUNZcUVEb1hYVVQ1bExkU2VBNzFCMWhtSlRiSVJP?=
 =?utf-8?B?RUlLZm8yeDJIdUxXVmtoRjNSTUpieWJnUzNDN1c2MTdWWGdrTXgzQTJ5Nmtl?=
 =?utf-8?B?ZXpUS2N5WG1TZVRreXJweGdjRnNObmdGTWNLdThxZTVaWDl6LzJYNFFNQk9I?=
 =?utf-8?B?TGZ3SEo2VDdiOWhIdHhQV3BPbmtUeHlYUFQwUUV2L2pVazRVaW1QWFE2d281?=
 =?utf-8?B?bWxJRTNBdHc0eHJ5OVhkbVVsb0V1Szl5MXcyWVZLS2daRnpHSWltUTdaN1Qz?=
 =?utf-8?B?ZXN1bVRiZ1BTUWsxWTQvTWlXK1E1QWF6OUxVekFRMDFLRWc4ODRzcWNWRndD?=
 =?utf-8?B?N1F6bytTVC9oc2pWdmhxRjZzYk9TVjdoeGh3d0lBcy9WNnVvWlZiVEU0UkVC?=
 =?utf-8?B?ZlgxV2pjVkxxYWMyKzFlSVFTZWF5UlNMRVB4cVNkZmxDZXp6dlJ6QXl0Q3J1?=
 =?utf-8?B?T0ZIc2UvVThLZ09teENrL0l3NS9KaGxwTkZkVjVqODcyY1VvQytkRzFXRGZr?=
 =?utf-8?B?bzBKQ1RvcjF0cEpJME1PUkxSRnhlYWNoMlR5Y09DdVI0YmRUZEtiZHJZWGVx?=
 =?utf-8?B?cDBXSjVMRVdKd0NaNDRhUFJEVm9malVrU09sRnNFWmFwZTVKYjc4TVVrUDZ5?=
 =?utf-8?B?eDNvcmVxRU1mMjJ5VExqcnUrOE1QdkRiSHBxaERUOWNJS1gzNUFabC9ZM3M5?=
 =?utf-8?B?LzYxQ2NFNHV1OE54aVhPRmIwelVtcDFIUXBZaW5MM0puejFRT2Y2QUIrSUw2?=
 =?utf-8?B?K2JreXE1SlRzOEZVanRMdTU1cDBNRXZhNHlPZ200UGxFNGl2b2dFenNYSGZ2?=
 =?utf-8?B?MjVvR3VaOE9GaStMYzgxMzduN0RoQ0U2WmdQQTIrT1hKUUVVSUNsS1I5QlA5?=
 =?utf-8?B?L0Q3amxQWkVWZWswTDJvdk1Ub0pWcExaYTZnSTR0Sml2VStQZEtGMFduMVdD?=
 =?utf-8?B?WnRlN3dUZEFGSDNPOUgvUWY3cjBWengzTjQyTGRmcGFBNkhNOXhOWmJ6T0xM?=
 =?utf-8?B?Z1JjbzFWcDVTZWZsZ2E1R3d5MzZBTVlyUWM1TFJvcGljd3lmcVVjVXNZTVVN?=
 =?utf-8?B?OVRIdkI0c2hXZ20wa1N5UUVqM3ZTTW92bVdzeW1jeDBteHl0azkrdGFFS1pS?=
 =?utf-8?B?MXFyRFNyOWdmbzdUZ0tDUGxBRmF4TE5HemJqTWRWZlN0aEVuS2RPQXorSUhr?=
 =?utf-8?B?MGMydWVXd1daYllBQWJ0M3MzZWVZMklubGJqTDBLZE1MS2xzN2dLb0dqZVJz?=
 =?utf-8?B?RVg2cSttTWYvRnhvQUExQ1RtUk5VUks5ZlBHaXdBdTBySkJWTzFKellIb0da?=
 =?utf-8?B?UHF1eWJCak1sSkJ5WEpPUXBwUHowc01vVk1HMVRDY2ZKeGsvMzdJU092MWFW?=
 =?utf-8?B?Q25jUFNhcHVqZTdRc1hKT0dFbnpWU1RxSVV5TGJCK3NwVW1LdGF1b2dMWXhi?=
 =?utf-8?B?V0JrVGtKSUVpYkF2RXVFSGVQNTdSVUZtcFZpdVZxVXFkNVRjWlNWei8vZXFE?=
 =?utf-8?B?SmtzTmJ0OUZDdkFOZ2NrUXY4ZW1qY1NSSmhFdklIa0xRZDNrVGhpaHlyKzFT?=
 =?utf-8?B?bDBYYVEyak55ZklCRDlZNGZwNUVZSVhhS2VwUExpWExPaXV6Znk5UkNBTnFz?=
 =?utf-8?B?dC9BOWEyb1pnUDR1ZGswRHh2V3BWS2xYUzRLQWd2N005UHBuUFc3b1FoYUZG?=
 =?utf-8?B?d0FyUDNOUmpBY1BpcHpqNWFDYXV6akNjWkxFUFZMUVgwWnFMYmtYZz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c88b4277-d2b9-4faa-dbde-08de4bf3494b
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB9072.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2026 00:42:21.4763
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: heazYO2ExI5tF8tKdhxrToffG9aRy1f5sIjA8W/x98Yx1Hz6JatN5NfA489JA1R/jimay2Fa3cG5CGYC1/t7Rw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6638
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi,


On 1/1/26 04:03, Kuehling, Felix wrote:
> On 2025-12-30 23:31, Jordan Niethe wrote:
>> A future change will remove device private pages from the physical
>> address space. This will mean that device private pages no longer have
>> normal PFN and must be handled separately.
>>
>> Prepare for this by adding a MIGRATE_PFN_DEVICE flag to indicate
>> that a migrate pfn contains a PFN for a device private page.
> 
> Thanks for doing this. Some comments inline regarding DEVICE_COHERENT 
> pages. I suspect this will have ripple effects on the rest of the patch 
> series, at least in patch 8, but I haven't looked at that in detail yet.


Ah thanks - I missed that MEMORY_DEVICE_COHERENT and 
MEMORY_DEVICE_PRIVATE were
sharing some code paths.


> 
> 
>>
>> Signed-off-by: Jordan Niethe <jniethe@nvidia.com>
>> Signed-off-by: Alistair Popple <apopple@nvidia.com>
>>
>> ---
>> v1:
>> - Update for HMM huge page support
>> - Update existing drivers to use MIGRATE_PFN_DEVICE
>> ---
>>   arch/powerpc/kvm/book3s_hv_uvmem.c       |  2 +-
>>   drivers/gpu/drm/amd/amdkfd/kfd_migrate.c |  3 ++-
>>   drivers/gpu/drm/drm_pagemap.c            |  2 +-
>>   drivers/gpu/drm/nouveau/nouveau_dmem.c   |  2 +-
>>   include/linux/migrate.h                  |  1 +
>>   lib/test_hmm.c                           |  4 ++--
>>   mm/migrate_device.c                      | 11 ++++++++---
>>   7 files changed, 16 insertions(+), 9 deletions(-)
>>
>> diff --git a/arch/powerpc/kvm/book3s_hv_uvmem.c b/arch/powerpc/kvm/ 
>> book3s_hv_uvmem.c
>> index e5000bef90f2..dac5d6454920 100644
>> --- a/arch/powerpc/kvm/book3s_hv_uvmem.c
>> +++ b/arch/powerpc/kvm/book3s_hv_uvmem.c
>> @@ -784,7 +784,7 @@ static int kvmppc_svm_page_in(struct 
>> vm_area_struct *vma,
>>           }
>>       }
>> -    *mig.dst = migrate_pfn(page_to_pfn(dpage));
>> +    *mig.dst = migrate_pfn(page_to_pfn(dpage)) | MIGRATE_PFN_DEVICE;
>>       migrate_vma_pages(&mig);
>>   out_finalize:
>>       migrate_vma_finalize(&mig);
>> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c b/drivers/gpu/ 
>> drm/amd/amdkfd/kfd_migrate.c
>> index af53e796ea1b..0257c6e7f680 100644
>> --- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
>> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
>> @@ -303,7 +303,8 @@ svm_migrate_copy_to_vram(struct kfd_node *node, 
>> struct svm_range *prange,
>>               dst[i] = cursor.start + (j << PAGE_SHIFT);
>>               migrate->dst[i] = svm_migrate_addr_to_pfn(adev, dst[i]);
>>               svm_migrate_get_vram_page(prange, migrate->dst[i]);
>> -            migrate->dst[i] = migrate_pfn(migrate->dst[i]);
>> +            migrate->dst[i] = migrate_pfn(migrate->dst[i]) |
>> +                      MIGRATE_PFN_DEVICE;
> 
> On some of our GPUs we use DEVICE_COHERENT pages. These are pages that 
> are coherently accessible by the CPU and peer devices in the system 
> physical address space. Therefore, this needs to be conditional. Maybe 
> add something like adev->kfd.migrate_pfn_flag that gets initialized 
> conditionally in kgd2kfd_init_zone_device. Then add ... | adev- 
>  >kfd.migrate_pfn_flag here.
> 
> 
>>               mpages++;
>>           }
>>           spage = migrate_pfn_to_page(migrate->src[i]);
>> diff --git a/drivers/gpu/drm/drm_pagemap.c b/drivers/gpu/drm/ 
>> drm_pagemap.c
>> index 37d7cfbbb3e8..0c756d73419f 100644
>> --- a/drivers/gpu/drm/drm_pagemap.c
>> +++ b/drivers/gpu/drm/drm_pagemap.c
>> @@ -404,7 +404,7 @@ int drm_pagemap_migrate_to_devmem(struct 
>> drm_pagemap_devmem *devmem_allocation,
>>           struct page *page = pfn_to_page(migrate.dst[i]);
>>           pages[i] = page;
>> -        migrate.dst[i] = migrate_pfn(migrate.dst[i]);
>> +        migrate.dst[i] = migrate_pfn(migrate.dst[i]) | 
>> MIGRATE_PFN_DEVICE;
>>           drm_pagemap_get_devmem_page(page, zdd);
>>       }
>> diff --git a/drivers/gpu/drm/nouveau/nouveau_dmem.c b/drivers/gpu/drm/ 
>> nouveau/nouveau_dmem.c
>> index 58071652679d..2bd80c6f5bcd 100644
>> --- a/drivers/gpu/drm/nouveau/nouveau_dmem.c
>> +++ b/drivers/gpu/drm/nouveau/nouveau_dmem.c
>> @@ -766,7 +766,7 @@ static unsigned long 
>> nouveau_dmem_migrate_copy_one(struct nouveau_drm *drm,
>>           ((paddr >> PAGE_SHIFT) << NVIF_VMM_PFNMAP_V0_ADDR_SHIFT);
>>       if (src & MIGRATE_PFN_WRITE)
>>           *pfn |= NVIF_VMM_PFNMAP_V0_W;
>> -    mpfn = migrate_pfn(page_to_pfn(dpage));
>> +    mpfn = migrate_pfn(page_to_pfn(dpage)) | MIGRATE_PFN_DEVICE;
>>       if (folio_order(page_folio(dpage)))
>>           mpfn |= MIGRATE_PFN_COMPOUND;
>>       return mpfn;
>> diff --git a/include/linux/migrate.h b/include/linux/migrate.h
>> index 26ca00c325d9..52f65cd5c932 100644
>> --- a/include/linux/migrate.h
>> +++ b/include/linux/migrate.h
>> @@ -126,6 +126,7 @@ static inline int migrate_misplaced_folio(struct 
>> folio *folio, int node)
>>   #define MIGRATE_PFN_MIGRATE    (1UL << 1)
>>   #define MIGRATE_PFN_WRITE    (1UL << 3)
>>   #define MIGRATE_PFN_COMPOUND    (1UL << 4)
>> +#define MIGRATE_PFN_DEVICE    (1UL << 5)
>>   #define MIGRATE_PFN_SHIFT    6
>>   static inline struct page *migrate_pfn_to_page(unsigned long mpfn)
>> diff --git a/lib/test_hmm.c b/lib/test_hmm.c
>> index 8af169d3873a..19681904a666 100644
>> --- a/lib/test_hmm.c
>> +++ b/lib/test_hmm.c
>> @@ -727,7 +727,7 @@ static void dmirror_migrate_alloc_and_copy(struct 
>> migrate_vma *args,
>>                   rpage = BACKING_PAGE(dpage);
>>                   rpage->zone_device_data = dmirror;
>> -                *dst = migrate_pfn(page_to_pfn(dpage)) | write;
>> +                *dst = migrate_pfn(page_to_pfn(dpage)) | 
>> MIGRATE_PFN_DEVICE | write;
> 
> This needs to be conditional on dmirror->mdevice->zone_device_type.

Good catch.

> 
> 
>>                   src_page = pfn_to_page(spfn + i);
>>                   if (spage)
>> @@ -754,7 +754,7 @@ static void dmirror_migrate_alloc_and_copy(struct 
>> migrate_vma *args,
>>           pr_debug("migrating from sys to dev pfn src: 0x%lx pfn dst: 
>> 0x%lx\n",
>>                page_to_pfn(spage), page_to_pfn(dpage));
>> -        *dst = migrate_pfn(page_to_pfn(dpage)) | write;
>> +        *dst = migrate_pfn(page_to_pfn(dpage)) | MIGRATE_PFN_DEVICE | 
>> write;
> 
> Same here.

Agree.

> 
> 
>>           if (is_large) {
>>               int i;
>> diff --git a/mm/migrate_device.c b/mm/migrate_device.c
>> index 23379663b1e1..5d108ddf1a97 100644
>> --- a/mm/migrate_device.c
>> +++ b/mm/migrate_device.c
>> @@ -199,6 +199,7 @@ static int migrate_vma_collect_huge_pmd(pmd_t 
>> *pmdp, unsigned long start,
>>           (migrate->flags & MIGRATE_VMA_SELECT_COMPOUND) &&
>>           (IS_ALIGNED(start, HPAGE_PMD_SIZE) &&
>>            IS_ALIGNED(end, HPAGE_PMD_SIZE))) {
>> +        unsigned long device_private = 0;
>>           struct page_vma_mapped_walk pvmw = {
>>               .ptl = ptl,
>> @@ -208,10 +209,13 @@ static int migrate_vma_collect_huge_pmd(pmd_t 
>> *pmdp, unsigned long start,
>>           };
>>           unsigned long pfn = page_to_pfn(folio_page(folio, 0));
>> +        if (folio_is_device_private(folio))
>> +            device_private = MIGRATE_PFN_DEVICE;
>>           migrate->src[migrate->npages] = migrate_pfn(pfn) | write
>>                           | MIGRATE_PFN_MIGRATE
>> -                        | MIGRATE_PFN_COMPOUND;
>> +                        | MIGRATE_PFN_COMPOUND
>> +                        | device_private;
>>           migrate->dst[migrate->npages++] = 0;
>>           migrate->cpages++;
>>           ret = set_pmd_migration_entry(&pvmw, folio_page(folio, 0));
>> @@ -329,7 +333,8 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
>>               }
>>               mpfn = migrate_pfn(page_to_pfn(page)) |
>> -                    MIGRATE_PFN_MIGRATE;
>> +                    MIGRATE_PFN_MIGRATE |
>> +                    MIGRATE_PFN_DEVICE;
> 
> I think this also needs to be conditional to distinguish DEVICE_COHERENT 
> pages.

Agree

> 
> 
>>               if (softleaf_is_device_private_write(entry))
>>                   mpfn |= MIGRATE_PFN_WRITE;
>>           } else {
>> @@ -1368,7 +1373,7 @@ static unsigned long 
>> migrate_device_pfn_lock(unsigned long pfn)
>>           return 0;
>>       }
>> -    return migrate_pfn(pfn) | MIGRATE_PFN_MIGRATE;
>> +    return migrate_pfn(pfn) | MIGRATE_PFN_MIGRATE | MIGRATE_PFN_DEVICE;
> 
> Same here.

Maybe a page to migrate pfn helper function will be useful.

Thanks,
Jordan.

> 
> Regards,
>    Felix
> 
> 
>>   }
>>   /**


