Return-Path: <linuxppc-dev+bounces-15768-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D1D6D22E4F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Jan 2026 08:40:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dsFJT2Qvkz2yFm;
	Thu, 15 Jan 2026 18:40:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c001::2" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768462825;
	cv=pass; b=Cnq7a7r52SVoHT9CJ5g6r0X7hZbpWecwCLuhSpmorO0WR4qMtTcmaa9FR9EdSx5uRhl4BRefo7IysU2Y7KwkC9RmNf4Rx3/JJYHoxBWJzW5qbShM6nw7LP+n1Stbds3ljz69zBwP47z2aaD0823m/N2xHrmm9DirXcL28rmoMxs0ZXUdPGyFgS5iHb624t8DZNkL0tRxfsJNTVb7A/jXzPJ1xOxjW/sUlkhdv1WKTnBD7v9cNrqsoeNIqaZnN6K77aKn+wTvSxJxUGxxJ6+VumLeRARSKIRnepuHdccT+wxZ0Fxv73r+a/2rPv01CVbDKa9BsxpSTi+6ANxT/0Uauw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768462825; c=relaxed/relaxed;
	bh=Ztm6oGqeLLzq3wFvvT+1iYa1ZTLWcF+XYHxGR6XFrZ0=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=fkmbKkr0ApHppSRAC0Lu/Zt9FsgiMNqb6bc9GGPriMTDnaVBEDMS1HZMKYCuq7je3P6hruFmRobZfna+pX2vuDqdKhVsPpBF2omvVOj7eFrXFsWawavPXIom+Nl5tHGsM+FyDCc8+7y4YNe1qwFVjcDuKCjpH//blupM4ywmaf7wEEFdioaQBiDCHlwwahm6VstNrHeXhoihgg+2M/Yf0kvehdi6/s474IfsFBuDGPXAi86+8m1BoSKB0+XUtpOepxooQC7yQ5VFRT/9sD9tAcM59UaXJB8NN0+Hju13xYP/P3vmCvAE2GlK2IWacL3jsr1N3B0XXQX7vQaNOESk3A==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=mZcVvQ0l; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c001::2; helo=sj2pr03cu001.outbound.protection.outlook.com; envelope-from=balbirs@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=mZcVvQ0l;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:c001::2; helo=sj2pr03cu001.outbound.protection.outlook.com; envelope-from=balbirs@nvidia.com; receiver=lists.ozlabs.org)
Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazlp170120002.outbound.protection.outlook.com [IPv6:2a01:111:f403:c001::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dsFJR6RFWz2xqj
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Jan 2026 18:40:23 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GT0BcSUyx5efkaieEPJfmE5JEYSfNuDNTyTDyVs76F+Oi3UhRRNAkcdDCFp+4ofwkH16JbK4YxUe0OU7i1g4xL9m/ccY1kRUw1jmwRxy4uGk70waSlGrYqZsEDScyO2Q31hRUmsNZ33OxxIDPG+mXU7spOuzmEkfeOMIxG7wzkTH4XYqAy+iIUkORByfPqP5xcqyl0NN0GW2MMd5c7i8fbvH4RSgiTVccBwnK7IDUD7utIVqUzkKXoAKXDzONfrBDQKh1Z7WuCJavwKbUIHTvyE/op0tAz8FOWKVYk+pmeAc9smlMS/s/zk52y4c1UfU+qZxyqxwAcFreGL2eHlP/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ztm6oGqeLLzq3wFvvT+1iYa1ZTLWcF+XYHxGR6XFrZ0=;
 b=S1dGxam5jt3M95TutK/Ce6gibbt4sV711NAalMpHJEfufH3dS4QZwOtmD/Ycgxnq6IJlVr6WEJvqtVFxuxrNAqVqciWix2MfyXBJNhBxuRsWXJ15btdBBN3aS/DSsdACtvESDJchEvSLmsZw/xmXrZ/kaEK5u6S2TbEj8YH+82Ju0uzHgBJI2fMuFr6vupOxo6mWvrwGKEWQXvN+Y7Yh2AcnJnvkNr4fmkpOSssn252/Bdq1zWs5mvucOmRlhhHMP0MQwm0wvYUR+hHPxjPgBnYLmu6vuJFUJ+Fb0YmCX+NofPtTfzLFopl1O36OdD2Ok83yjZCUB/m38NxpsbqFFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ztm6oGqeLLzq3wFvvT+1iYa1ZTLWcF+XYHxGR6XFrZ0=;
 b=mZcVvQ0lv/bZzdUKw+xEJO0LdB7xISgK0tVpyPT8M3/RDtRwLC6cYw+U/EWCnlv6Bb9JeTkaMwIGs6ETBLdDb+zk1fJB9Ar3Jv5TnvSPVZl68UJZ2oesp46QgmbkRgej3ry3YNAEzd74IINw57qWJR/Fd7Y42p91sI9/gjz1aWZBPbIW4LF/pfRKeSvuBxcMJoFJ1ioGX8fza/JJqyMxuzYvxqMXiUGMRGkUvNy84poLU5qq9wTTQUoFn3Fpg79BFGteVy3dA/bbdXoqIAZdbm13oNgWBVQbs6W3/XC4yEV6kM1nP4mHH/ofwcG4crC5u2OAbQ1nPnS28jQHbiRjPA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13)
 by SJ2PR12MB8928.namprd12.prod.outlook.com (2603:10b6:a03:53e::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Thu, 15 Jan
 2026 07:39:59 +0000
Received: from PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::2920:e6d9:4461:e2b4]) by PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::2920:e6d9:4461:e2b4%5]) with mapi id 15.20.9499.005; Thu, 15 Jan 2026
 07:39:58 +0000
Message-ID: <58830b3f-3626-4d6e-9f00-9dc3034202ad@nvidia.com>
Date: Thu, 15 Jan 2026 18:39:48 +1100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/5] mm/zone_device: Reinitialize large zone device
 private folios
To: Alistair Popple <apopple@nvidia.com>,
 Matthew Brost <matthew.brost@intel.com>
Cc: Francois Dugast <francois.dugast@intel.com>,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Zi Yan <ziy@nvidia.com>, adhavan Srinivasan <maddy@linux.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>,
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
 Felix Kuehling <Felix.Kuehling@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 David Hildenbrand <david@kernel.org>, Oscar Salvador <osalvador@suse.de>,
 Andrew Morton <akpm@linux-foundation.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Leon Romanovsky <leon@kernel.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R . Howlett" <Liam.Howlett@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-mm@kvack.org, linux-cxl@vger.kernel.org
References: <20260114192111.1267147-1-francois.dugast@intel.com>
 <20260114192111.1267147-2-francois.dugast@intel.com>
 <6spceodgfobizdaziju4yvvfydwvvik2wjyoyfuglozq533rgl@vmkotau3m3kw>
 <aWiBy3nZ4FrPYURF@lstrano-desk.jf.intel.com>
 <aWiGtlKI3LOtjUl6@lstrano-desk.jf.intel.com>
 <pgz2mhy4si2tu4iwusabjxxi4nctz3lamnpbg7773a2mp7srph@bz3ovwxuyakq>
Content-Language: en-US
From: Balbir Singh <balbirs@nvidia.com>
In-Reply-To: <pgz2mhy4si2tu4iwusabjxxi4nctz3lamnpbg7773a2mp7srph@bz3ovwxuyakq>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY3PR03CA0022.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::27) To PH8PR12MB7277.namprd12.prod.outlook.com
 (2603:10b6:510:223::13)
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
X-MS-TrafficTypeDiagnostic: PH8PR12MB7277:EE_|SJ2PR12MB8928:EE_
X-MS-Office365-Filtering-Correlation-Id: 381b4c31-9d46-47f4-5f82-08de540948e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|10070799003|376014|7416014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QjlkOTRSMnRXa1UzNXhqWmpHVWtlOElsa0tLRlhBRDlnYTlySXdCd1NiTGRT?=
 =?utf-8?B?TFp2MkVuYW5BbURJbWkzZjlvMVl0ZEt1MUgwSUZpSmdtS3cvb0lHTTVxVzZt?=
 =?utf-8?B?RTRxZUJmTHBJU1hoWTJLTHI1OWRObDJOYmZsM25oKzhYbkVlS0xvVUVzc0Fv?=
 =?utf-8?B?eFVXa2dIVHJYMHQyNHhrMDI1dmViL3FoVTBITG1tZkJodjN2dFlIWlhTTWty?=
 =?utf-8?B?YTlIckROME5FYm1NTmNxNHVieU0xdWd5ZFZhREU0cTlkbjZ2K2FSRVB6dUh0?=
 =?utf-8?B?UHErMmk4NStRMzlocHdOY05RckZmVXNyVHNoS1lReDRtTGc3bnpJaDNPcnhi?=
 =?utf-8?B?c1plWGJHaWlmc05OdExUazFKbmFqc1NDRTRwVzIrajdOeEZxajh4dWtoTnFj?=
 =?utf-8?B?QzBwRXFqZXpWdTBBUWFGR0wweEF6UWRxdStyeEZ3TEQrNmt4NlM3VFpQVzNG?=
 =?utf-8?B?SFpCSHZINVU1a1JtRjNTWi9IODBjL29zMExIRHdCUXB4eGJ0c2RQdWpLQ3Zw?=
 =?utf-8?B?T0RUbVZWNG02VlhZSExaTEZGa3ZKelRabUM3M2QxZUdJQmdqeW9tNTluSERR?=
 =?utf-8?B?MVNVMThTd042SzN6empGZzU3ZFpXYVp2R1U3YVVaWDhaVHVKb3FWbkNrUVJS?=
 =?utf-8?B?eHNBNmd6dFZ2bHJrS0JuRXFyV1FObjh6c1JXSnh2elhLZmV6VDl5MUsrZC9M?=
 =?utf-8?B?VGFmNWRYU1FXNGVRTks2SXRqaGVacHRoSHBuOU5MVzVNbmIrVElwWGxJcHJV?=
 =?utf-8?B?cE92VDU5SVJGalFrWWt4Z1Q3U2o1a0FjaXIvN0N4c0JXa3pRcGNtcjNRMGN2?=
 =?utf-8?B?TVBpZjRhcEQrNzBESkhaVklRNkZnS1JzRHJuR3U0ZUppZHBqZGJsSVhjdWNs?=
 =?utf-8?B?bXgyenZtU0JveHZEKytXdUdjSlBUN2RWemoxdGhzbzFsRFduL2NrRXIyNDRq?=
 =?utf-8?B?bC9XYW1uN1ptcDdqek53NjZMVHUvUDEwT09MSlg4YXNVZWlmU1NtdUdVaGl2?=
 =?utf-8?B?TU50K0dpcUt4NXkrLzNJY0psVUpNV2kvbXNmSWdteHVWdlFCV0puVnlUZjZj?=
 =?utf-8?B?QzcwOW1TRUtNZGRkMHlZRjhKVzlKNVd4OE16SWg3OHNvY1JyQjVtV0FxWHpy?=
 =?utf-8?B?ZzFLdVVWSy8yRWIzZWx1bEdjYmVZUzZzVWxOKzVINEZqTm1mOHg3M2JRRGRo?=
 =?utf-8?B?bitINE93aDZSU1JxUnkzQm5WYlhmUDlsWi9qaXE0a3kzRTNwN0hOM21NU3Av?=
 =?utf-8?B?b3NMaWFEUjNkNzhhU2s2YSs1M1FkVDYyaTZubGRPUHRBanZtOUYrV3FKQlNH?=
 =?utf-8?B?eXpWWG1ic05IYURCZFNTK1RLNnpMQzlWMUNET0ZJTk0rRlM0b2pkZG40YUk0?=
 =?utf-8?B?MHY0S0QrUXN5WHlzZEV0S1JERFJxZ3BKWTlCSCtpcFptMDVtM1NKbDFTNkpQ?=
 =?utf-8?B?bmZ3ak5LeWdSSFBnV1p0Rjh2YnFFbGIraUJYSldKUjFqS1JlYzdpWlZpT1kv?=
 =?utf-8?B?YzdBcHFtbG14aW9EUUNpNmdxREJrOEVXbGw5RDRoT1k5d2Y2cEN5aTh1TnY4?=
 =?utf-8?B?ZkE1TXBtalNlRG5EZFZGK2puK3ByS0gxdUxUYzkvVUFnV1J0SlNubzVDRkN6?=
 =?utf-8?B?TDlqWmlJaXk1NHQ1Wkd0bXhZZy9ZampoWjBJdXkvZmUwa1RjcFFySkI1a25F?=
 =?utf-8?B?bGxzS2cxUXM1bEJoZVhUSnhVRitrNkM5R1A3U1p2YzR1Q09Fb0Vxa0lOR3Rp?=
 =?utf-8?B?MDdsUWtGbHVYT1RLWU8zUXpXNWZGRW1NRHVGcHhZTCtZd2pRYUhTYjhqV2g0?=
 =?utf-8?B?MXlWWEFiRExrakRJSzVyUGY3S3RPR2xHNXc0eUpUVFFmZG5RYjIrdW4zRzAx?=
 =?utf-8?B?YVRTRXNIQXFsWGVWWFM5dFNwdDRlLy9nSVRsUVdHdnZhaHFXUzBCV2dEWWJl?=
 =?utf-8?B?d2xWZVBHMTg0ZE02S2laMm1XVGcvcnpmQUVjRnJxSVR1RkovVVUyMW1UOEpE?=
 =?utf-8?B?VURTYTFFTHRxSnBBRVRTL2ZIRHVUQ2UyU25COXlqdEZPb256bGdOMTh6bnZU?=
 =?utf-8?B?NHFkZjZlWHpxQUx5d0RJMjg0ZHFVaVNrbmpza2NydFFVejlCdTNPNTBWcVds?=
 =?utf-8?Q?YJjg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7277.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(376014)(7416014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dXZ4TTlZUGlqNHp1QmFWYXhhbXZUNVlwYlp1MHhSQXdYdjZ3N2htQk91emYx?=
 =?utf-8?B?RjV2bFVPcWd2STlTa3JheWpiNFBKUlZjQ2Y2N01iMnovdi9mZzl6RXl6TTZm?=
 =?utf-8?B?SWd6YVNocGQxeEY5Ni8zSVF0TGlvNVJjY2t4T2JjRTZFL2s3QVNEZDBqU0dC?=
 =?utf-8?B?b3FZWHU2dmRoM28xNC9pNlRTdi9wcG9iSHVVQWtmUnRGOFdWSGQvenpMTU5m?=
 =?utf-8?B?VjhTa0l5VlMwdGkyRGNNM0ZnVUtra2V4cG0zdnZURENiTzFBRHBqbHViSlNZ?=
 =?utf-8?B?TlNhQWEyTjJ1anFsam9RNVRnRnA0cG9IVnhLclRMOENlbDIvWUlScjRDUFNn?=
 =?utf-8?B?ZUlKYXVBZXVWVmR1dFR1QUptN1JIY0xQTEJVV0twTG1sbWpzWFo2ZG81RVJT?=
 =?utf-8?B?NEpkTUsxNkVEcHp6ZEhZemdlVGk3T1V3VjZuZjJIcHdmbFhXcXMxbUxubFhU?=
 =?utf-8?B?ZXNHbSs4WXI1bWppYWRnV0RoQS9lckZtcm5yQ3gvTlNrSFY0d3BBWndmRUR5?=
 =?utf-8?B?eHFJaldCMWJyRmpHYUViVnBjN05LR3ZmVk1kMjdXUDA3NnpSODJ1VHBXNWEw?=
 =?utf-8?B?T0VpNm5aamxTK1hWdEVid21uRlcwMWtXc1oyVURjcVU3WXZoa2ZMaURYQXN6?=
 =?utf-8?B?Si93Q05BK3ZyV2w0Uy96T0dFU25FS1IydFJBbWFwNGgwVHFGcUpsZ0lmKzZv?=
 =?utf-8?B?WENKM01aNjh3TjBLU3NVNll2bGw0ZFBrVkkySmdDdldrR09FK0tQTXovYmhr?=
 =?utf-8?B?L29LRkFKQ1dYMW44enlocHl1QUZ3N2xZR01LQ2tsNFptV1R3QmpITUl1OEhz?=
 =?utf-8?B?VkUrSlFIOGsrZENDVUZoVnlnMjhlOFE5Y25uWVJWRWRNZkNjcXBNd3Q0aTJD?=
 =?utf-8?B?RGpNZmxmcHZVNlg3ZzdaR1RKRmQ3cTVQcVEzeHl4TnNvdXROQ1RpKzJMelBp?=
 =?utf-8?B?blJUL0lWbDhSOVVWVUU3N1JhL3QrVER0UlhxNHRrVHhjWlpkWEJZbjdab2N4?=
 =?utf-8?B?QzJSWE1MWDAvOEs0SmFpcW5xWHlUaWd0emF1T2dabHJoTVFETnQ4WkIyUU8v?=
 =?utf-8?B?K1hJWGdRTDErM1h6QmRhMEpyUFpTTlpuVmlPbEdOZTFZK24ycUlNTExxY0tD?=
 =?utf-8?B?NVlHZ2NpN1lhUlh4TkR6MEVPRlVFVE1UczNtMXlHVXEzRndjZ0dDcDJYNWM0?=
 =?utf-8?B?VVhtdEVuWnpUTy9RN0VUaUt3ZG9Ia2hXeHBMc3JxdWtrZmVQWG5ES3RBNmtM?=
 =?utf-8?B?R28ycmVkU01nT2ZuL3lwdUxldVhxWUlYZDFhaDMwakdSU0N1UUs0SEZycVZV?=
 =?utf-8?B?S0locm5jd1lDOFQ1blhYMmJDeGR3ZVJIVVFoTzJIU1hHUUFxVlFJREVycHBV?=
 =?utf-8?B?WTdzVDJjdUtSTlpCUEhyOWFVZjU2Mklkc0ZZdnNLTGlMeGdwWGRESUlmcXRW?=
 =?utf-8?B?RHF0REEzK0xhcHVlek1oMDN4WllDT0ZjR2taaExLdTVOaFZXdlBYaGZRSklF?=
 =?utf-8?B?Y1J3Tm4wNUlTWG8yS01tS2hGd2dLV3p6Y0E4L1FuT3hJeHVDWXlZWDBvNG5D?=
 =?utf-8?B?TEVJZWIyS3d1ajhMczJ3WEhUZjVEcXdwd0dvazlRcHhXNGwzZ0VZUVQrK0dN?=
 =?utf-8?B?VXlzWHNUZThLd2RYTUVQMGYrVCs0Y253UFM0dkoyalBzUGMwTHRjYXdiWmVw?=
 =?utf-8?B?eDdMRWc2WTZFcmZSWlZKRHhRVDhsQ3FBTVpSVzNCY1ZMRzZZR0QrSkpvbGFF?=
 =?utf-8?B?dGNPME9xM0pCMFdHV2R5VnI0S2czRk1NNHZxMm9xSVpyY1REUkdUQm1Uelpt?=
 =?utf-8?B?K0pnKzJ1YU56QzNndEp5aDJMM0dzYnNxdzFtNmFJYWkzWHJXS2YvNXFtZUpn?=
 =?utf-8?B?K3MyL2FrUTVWa0E0bjBBZFlKaGcrRUVJcEZYODR4enBGckVQbFJpdlhmeDVG?=
 =?utf-8?B?Y1psR0VWdEt5LzJJd0VZdW9zN3YxRVo5N3lQN1RZWkpSeE1EL2xlb2FPemhZ?=
 =?utf-8?B?a2EwWlY3UENuM2RBWlZpU1ptMlNJRXV6bzZ6OFZMU2VoZkRiNy9kV0JLaUkz?=
 =?utf-8?B?YkdKL1AzQTllK1RaWUR6bEVZcmpPclk0c0lXU3lYeCtZTWpSOS8wWjhEbmU5?=
 =?utf-8?B?TW9KbHJwYXJCNEZLdko0NU9yRGlyNkF4UlFkMnYwemw4M2JLUXovZGRWMFZB?=
 =?utf-8?B?QXRaZjZvQWFLOXhldDQzUURHVTV5SGxSN3AvSnIzdFE2MHhuL0F1ZjNRS2hn?=
 =?utf-8?B?VDFBcm9VeVkxd2kzaTJ0WDdEcWlKSjBEYVY2ZVVvT2VIMmVpK3RrUC85ZWZ2?=
 =?utf-8?B?ek90VHV1bkNhMU50c0F2OG5tSkNOSExGaUFtMnltM2JXQXE4b1Zmb0c3eGdq?=
 =?utf-8?Q?dbOLWoRQIZEtsD5gwPrLZLF8qFYFtHVVEseX7Tw6bQ0ZR?=
X-MS-Exchange-AntiSpam-MessageData-1: L+AaEehBLuYyyQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 381b4c31-9d46-47f4-5f82-08de540948e1
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7277.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 07:39:58.8829
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c+sjHTo0pSmlT3Uacqsyrnt4yW5Wa090vGGLyPTgWHH3ljJwLtSrpGr8jnHY2L5WV5IF5IftOLagzLLf8ezzRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8928
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_NONE,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 1/15/26 18:07, Alistair Popple wrote:
> On 2026-01-15 at 17:18 +1100, Matthew Brost <matthew.brost@intel.com> wrote...
>> On Wed, Jan 14, 2026 at 09:57:31PM -0800, Matthew Brost wrote:
>>> On Thu, Jan 15, 2026 at 04:27:26PM +1100, Alistair Popple wrote:
>>>> On 2026-01-15 at 06:19 +1100, Francois Dugast <francois.dugast@intel.com> wrote...
>>>>> From: Matthew Brost <matthew.brost@intel.com>
>>>>>
>>>>> Reinitialize metadata for large zone device private folios in
>>>>> zone_device_page_init prior to creating a higher-order zone device
>>>>> private folio. This step is necessary when the folio’s order changes
>>>>> dynamically between zone_device_page_init calls to avoid building a
>>>>> corrupt folio. As part of the metadata reinitialization, the dev_pagemap
>>>>> must be passed in from the caller because the pgmap stored in the folio
>>>>> page may have been overwritten with a compound head.
>>>>
>>>> Thanks for fixing, a couple of minor comments below.
>>>>
>>>>> Cc: Zi Yan <ziy@nvidia.com>
>>>>> Cc: Alistair Popple <apopple@nvidia.com>
>>>>> Cc: adhavan Srinivasan <maddy@linux.ibm.com>
>>>>> Cc: Nicholas Piggin <npiggin@gmail.com>
>>>>> Cc: Michael Ellerman <mpe@ellerman.id.au>
>>>>> Cc: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
>>>>> Cc: Felix Kuehling <Felix.Kuehling@amd.com>
>>>>> Cc: Alex Deucher <alexander.deucher@amd.com>
>>>>> Cc: "Christian König" <christian.koenig@amd.com>
>>>>> Cc: David Airlie <airlied@gmail.com>
>>>>> Cc: Simona Vetter <simona@ffwll.ch>
>>>>> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>>>>> Cc: Maxime Ripard <mripard@kernel.org>
>>>>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
>>>>> Cc: Lyude Paul <lyude@redhat.com>
>>>>> Cc: Danilo Krummrich <dakr@kernel.org>
>>>>> Cc: David Hildenbrand <david@kernel.org>
>>>>> Cc: Oscar Salvador <osalvador@suse.de>
>>>>> Cc: Andrew Morton <akpm@linux-foundation.org>
>>>>> Cc: Jason Gunthorpe <jgg@ziepe.ca>
>>>>> Cc: Leon Romanovsky <leon@kernel.org>
>>>>> Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
>>>>> Cc: Liam R. Howlett <Liam.Howlett@oracle.com>
>>>>> Cc: Vlastimil Babka <vbabka@suse.cz>
>>>>> Cc: Mike Rapoport <rppt@kernel.org>
>>>>> Cc: Suren Baghdasaryan <surenb@google.com>
>>>>> Cc: Michal Hocko <mhocko@suse.com>
>>>>> Cc: Balbir Singh <balbirs@nvidia.com>
>>>>> Cc: linuxppc-dev@lists.ozlabs.org
>>>>> Cc: kvm@vger.kernel.org
>>>>> Cc: linux-kernel@vger.kernel.org
>>>>> Cc: amd-gfx@lists.freedesktop.org
>>>>> Cc: dri-devel@lists.freedesktop.org
>>>>> Cc: nouveau@lists.freedesktop.org
>>>>> Cc: linux-mm@kvack.org
>>>>> Cc: linux-cxl@vger.kernel.org
>>>>> Fixes: d245f9b4ab80 ("mm/zone_device: support large zone device private folios")
>>>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>>>>> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
>>>>> ---
>>>>>  arch/powerpc/kvm/book3s_hv_uvmem.c       |  2 +-
>>>>>  drivers/gpu/drm/amd/amdkfd/kfd_migrate.c |  2 +-
>>>>>  drivers/gpu/drm/drm_pagemap.c            |  2 +-
>>>>>  drivers/gpu/drm/nouveau/nouveau_dmem.c   |  2 +-
>>>>>  include/linux/memremap.h                 |  9 ++++++---
>>>>>  lib/test_hmm.c                           |  4 +++-
>>>>>  mm/memremap.c                            | 20 +++++++++++++++++++-
>>>>>  7 files changed, 32 insertions(+), 9 deletions(-)
>>>>>
>>>>> diff --git a/arch/powerpc/kvm/book3s_hv_uvmem.c b/arch/powerpc/kvm/book3s_hv_uvmem.c
>>>>> index e5000bef90f2..7cf9310de0ec 100644
>>>>> --- a/arch/powerpc/kvm/book3s_hv_uvmem.c
>>>>> +++ b/arch/powerpc/kvm/book3s_hv_uvmem.c
>>>>> @@ -723,7 +723,7 @@ static struct page *kvmppc_uvmem_get_page(unsigned long gpa, struct kvm *kvm)
>>>>>  
>>>>>  	dpage = pfn_to_page(uvmem_pfn);
>>>>>  	dpage->zone_device_data = pvt;
>>>>> -	zone_device_page_init(dpage, 0);
>>>>> +	zone_device_page_init(dpage, &kvmppc_uvmem_pgmap, 0);
>>>>>  	return dpage;
>>>>>  out_clear:
>>>>>  	spin_lock(&kvmppc_uvmem_bitmap_lock);
>>>>> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
>>>>> index af53e796ea1b..6ada7b4af7c6 100644
>>>>> --- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
>>>>> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
>>>>> @@ -217,7 +217,7 @@ svm_migrate_get_vram_page(struct svm_range *prange, unsigned long pfn)
>>>>>  	page = pfn_to_page(pfn);
>>>>>  	svm_range_bo_ref(prange->svm_bo);
>>>>>  	page->zone_device_data = prange->svm_bo;
>>>>> -	zone_device_page_init(page, 0);
>>>>> +	zone_device_page_init(page, page_pgmap(page), 0);
>>>>>  }
>>>>>  
>>>>>  static void
>>>>> diff --git a/drivers/gpu/drm/drm_pagemap.c b/drivers/gpu/drm/drm_pagemap.c
>>>>> index 03ee39a761a4..c497726b0147 100644
>>>>> --- a/drivers/gpu/drm/drm_pagemap.c
>>>>> +++ b/drivers/gpu/drm/drm_pagemap.c
>>>>> @@ -201,7 +201,7 @@ static void drm_pagemap_get_devmem_page(struct page *page,
>>>>>  					struct drm_pagemap_zdd *zdd)
>>>>>  {
>>>>>  	page->zone_device_data = drm_pagemap_zdd_get(zdd);
>>>>> -	zone_device_page_init(page, 0);
>>>>> +	zone_device_page_init(page, zdd->dpagemap->pagemap, 0);
>>>>>  }
>>>>>  
>>>>>  /**
>>>>> diff --git a/drivers/gpu/drm/nouveau/nouveau_dmem.c b/drivers/gpu/drm/nouveau/nouveau_dmem.c
>>>>> index 58071652679d..3d8031296eed 100644
>>>>> --- a/drivers/gpu/drm/nouveau/nouveau_dmem.c
>>>>> +++ b/drivers/gpu/drm/nouveau/nouveau_dmem.c
>>>>> @@ -425,7 +425,7 @@ nouveau_dmem_page_alloc_locked(struct nouveau_drm *drm, bool is_large)
>>>>>  			order = ilog2(DMEM_CHUNK_NPAGES);
>>>>>  	}
>>>>>  
>>>>> -	zone_device_folio_init(folio, order);
>>>>> +	zone_device_folio_init(folio, page_pgmap(folio_page(folio, 0)), order);
>>>>>  	return page;
>>>>>  }
>>>>>  
>>>>> diff --git a/include/linux/memremap.h b/include/linux/memremap.h
>>>>> index 713ec0435b48..e3c2ccf872a8 100644
>>>>> --- a/include/linux/memremap.h
>>>>> +++ b/include/linux/memremap.h
>>>>> @@ -224,7 +224,8 @@ static inline bool is_fsdax_page(const struct page *page)
>>>>>  }
>>>>>  
>>>>>  #ifdef CONFIG_ZONE_DEVICE
>>>>> -void zone_device_page_init(struct page *page, unsigned int order);
>>>>> +void zone_device_page_init(struct page *page, struct dev_pagemap *pgmap,
>>>>> +			   unsigned int order);
>>>>>  void *memremap_pages(struct dev_pagemap *pgmap, int nid);
>>>>>  void memunmap_pages(struct dev_pagemap *pgmap);
>>>>>  void *devm_memremap_pages(struct device *dev, struct dev_pagemap *pgmap);
>>>>> @@ -234,9 +235,11 @@ bool pgmap_pfn_valid(struct dev_pagemap *pgmap, unsigned long pfn);
>>>>>  
>>>>>  unsigned long memremap_compat_align(void);
>>>>>  
>>>>> -static inline void zone_device_folio_init(struct folio *folio, unsigned int order)
>>>>> +static inline void zone_device_folio_init(struct folio *folio,
>>>>> +					  struct dev_pagemap *pgmap,
>>>>> +					  unsigned int order)
>>>>>  {
>>>>> -	zone_device_page_init(&folio->page, order);
>>>>> +	zone_device_page_init(&folio->page, pgmap, order);
>>>>>  	if (order)
>>>>>  		folio_set_large_rmappable(folio);
>>>>>  }
>>>>> diff --git a/lib/test_hmm.c b/lib/test_hmm.c
>>>>> index 8af169d3873a..455a6862ae50 100644
>>>>> --- a/lib/test_hmm.c
>>>>> +++ b/lib/test_hmm.c
>>>>> @@ -662,7 +662,9 @@ static struct page *dmirror_devmem_alloc_page(struct dmirror *dmirror,
>>>>>  			goto error;
>>>>>  	}
>>>>>  
>>>>> -	zone_device_folio_init(page_folio(dpage), order);
>>>>> +	zone_device_folio_init(page_folio(dpage),
>>>>> +			       page_pgmap(folio_page(page_folio(dpage), 0)),
>>>>> +			       order);
>>>>>  	dpage->zone_device_data = rpage;
>>>>>  	return dpage;
>>>>>  
>>>>> diff --git a/mm/memremap.c b/mm/memremap.c
>>>>> index 63c6ab4fdf08..6f46ab14662b 100644
>>>>> --- a/mm/memremap.c
>>>>> +++ b/mm/memremap.c
>>>>> @@ -477,10 +477,28 @@ void free_zone_device_folio(struct folio *folio)
>>>>>  	}
>>>>>  }
>>>>>  
>>>>> -void zone_device_page_init(struct page *page, unsigned int order)
>>>>> +void zone_device_page_init(struct page *page, struct dev_pagemap *pgmap,
>>>>> +			   unsigned int order)
>>>>>  {
>>>>> +	struct page *new_page = page;
>>>>> +	unsigned int i;
>>>>> +
>>>>>  	VM_WARN_ON_ONCE(order > MAX_ORDER_NR_PAGES);
>>>>>  
>>>>> +	for (i = 0; i < (1UL << order); ++i, ++new_page) {
>>>>> +		struct folio *new_folio = (struct folio *)new_page;
>>>>> +
>>>>> +		new_page->flags.f &= ~0xffUL;	/* Clear possible order, page head */
>>>>
>>>> This seems odd to me, mainly due to the "magic" number. Why not just clear
>>>> the flags entirely? Or at least explicitly just clear the flags you care about
>>>> which would remove the need for the comment and  should let you use the proper
>>>> PageFlag functions.
>>>>
>>>
>>> I'm copying this from folio_reset_order [1]. My paranoia about touching
>>> anything related to struct page is high, so I did the same thing
>>> folio_reset_order does here.
> 
> So why not just use folio_reset_order() below?
> 
>>>
>>> [1] https://elixir.bootlin.com/linux/v6.18.5/source/include/linux/mm.h#L1075
>>>
>>
>> This immediately hangs my first SVM test...
>>
>> diff --git a/mm/memremap.c b/mm/memremap.c
>> index 6f46ab14662b..ef8c56876cf5 100644
>> --- a/mm/memremap.c
>> +++ b/mm/memremap.c
>> @@ -488,7 +488,7 @@ void zone_device_page_init(struct page *page, struct dev_pagemap *pgmap,
>>         for (i = 0; i < (1UL << order); ++i, ++new_page) {
>>                 struct folio *new_folio = (struct folio *)new_page;
>>
>> -               new_page->flags.f &= ~0xffUL;   /* Clear possible order, page head */
>> +               new_page->flags.f = 0;
>>  #ifdef NR_PAGES_IN_LARGE_FOLIO
>>                 ((struct folio *)(new_page - 1))->_nr_pages = 0;
> 
> This seems wrong to me - I saw your reply to Balbir but for an order-0 page
> isn't this going to access a completely different, possibly already allocated,
> page?
> 
>>  #endif
>>
>> I can walk through exactly which flags need to be cleared, but my
>> feeling is that likely any flag that the order field overloads and can
>> possibly encode should be cleared—so bits 0–7 based on the existing
>> code.
>>
>> How about in a follow-up we normalize setting / clearing the order flag
>> field with a #define and an inline helper?
> 
> Ie: Would something like the following work:
> 
> 		ClearPageHead(new_page);
> 		clear_compound_head(new_page);
> 		folio_reset_order(new_folio);
> 
> Which would also deal with setting _nr_pages.
> 

I thought about this, but folio_reset_order works only for larger folios otherwise
there is a VM_WARN_ON.

>> Matt
>>
>>>>> +#ifdef NR_PAGES_IN_LARGE_FOLIO
>>>>> +		((struct folio *)(new_page - 1))->_nr_pages = 0;
>>>>> +#endif
>>>>> +		new_folio->mapping = NULL;
>>>>> +		new_folio->pgmap = pgmap;	/* Also clear compound head */
>>>>> +		new_folio->share = 0;   /* fsdax only, unused for device private */
>>>>
>>>> It would be nice if the FS DAX code actually used this as well. Is there a
>>>> reason that change was dropped from the series?
>>>>
>>>
>>> I don't have a test platform for FS DAX. In prior revisions, I was just
>>> moving existing FS DAX code to a helper, which I felt confident about.
>>>
>>> This revision is slightly different, and I don't feel comfortable
>>> modifying FS DAX code without a test platform. I agree we should update
>>> FS DAX, but that should be done in a follow-up with coordinated testing.
> 
> Fair enough, I figured something like this might be your answer :-) You
> could update it and ask people with access to such a system to test it though
> (unfortunately my setup has bit-rotted beyond repair).
> 
> But I'm ok leaving to for a future change.
> 
>>>
>>> Matt 
>>>
>>>>> +		VM_WARN_ON_FOLIO(folio_ref_count(new_folio), new_folio);
>>>>> +		VM_WARN_ON_FOLIO(!folio_is_zone_device(new_folio), new_folio);
>>>>> +	}
>>>>> +
>>>>>  	/*
>>>>>  	 * Drivers shouldn't be allocating pages after calling
>>>>>  	 * memunmap_pages().
>>>>> -- 
>>>>> 2.43.0
>>>>>


