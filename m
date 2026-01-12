Return-Path: <linuxppc-dev+bounces-15531-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A25F0D10993
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Jan 2026 05:51:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dqKhY1QPDz2yrm;
	Mon, 12 Jan 2026 15:51:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=40.93.201.24 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768193469;
	cv=pass; b=XsfqTHQv5kvnqaTKl8zO7a+rRFD7mBXJJHSoVLDO5BHe4nFzVuZrOy2f0Uw5DIl7F6JvNZDLRSfal7YBw3slBp1+8guZHlpqfP4XLdXZEpeLM/D1AdSCa12GpZJtmf1246Fv/blavnZfNIG+sQrHocLyXXdWIs777cfvoLdWChPmRgbuISDK4KG9fRmuFXVvz1r/dCNNS+63pJmi1RlwBu6XOJwZ6cZuWD2BpE2Z0tmPdHGUBOh/z+VxbsH9T0tZIvgmDGcgydkuYUuZc/PUTpjARPicauaihZ1zP1wpUCD4/ECMGAhG3PJlnwVelyrEIS1PBCqtV8fw2DG1RLlJ9A==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768193469; c=relaxed/relaxed;
	bh=5J2mW+mGII9FKVjFlFjc08EeY9Of0jtDLe8x/G0mFco=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=EQvzYjg0Pkq5ZEXaSu1v9j3XEDsmb/X/ouHHg0ha3LKyadsR/MNjcfm54nFUZ10pWQOV5B4ie8M8kCC6XBi89LYgdrrX6A3ol1UsZsP7OfmLa+kiPuUA6JpAo9iLVZ3VMMpcJU5UBiIMNbzrcUIOGrqIC2aobwQw9T63VcWfOEbldDvdQlM5ZyfRlB/2Y8PHDPVV82y33fO8O8QgoSwPk6AMOaLdBLiUj1y8GUwQLiDVJY3afGP3v4kpQ2Hu4/1ZuotY1TbvnHhq3dRHgjbRLmOfZPILOTE72FVhE29XPTvvUuWvVEfKeacOnosmEMYloGv5tCAt6WeSc57kwHIhoQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=K6COAQvz; dkim-atps=neutral; spf=pass (client-ip=40.93.201.24; helo=cy3pr05cu001.outbound.protection.outlook.com; envelope-from=balbirs@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=K6COAQvz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=40.93.201.24; helo=cy3pr05cu001.outbound.protection.outlook.com; envelope-from=balbirs@nvidia.com; receiver=lists.ozlabs.org)
Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013024.outbound.protection.outlook.com [40.93.201.24])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dqKhS2zMvz2yMv
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Jan 2026 15:51:03 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rq2UX2gnkZUOFsqzEFZniM0ClY3TzL2U7e057qyIx30jOt8/7z43IpNiyN5DtqdUHO/llNMS5XKUqpPO6CkDw7yF0I5c/B7flcNa4Bw3wNx4+BqRD/q+2M1lXIhC0PiZqKTfXwg2GJz44Hxs147veENt2GOSiZSkavhruo71m/lKFGzXWM22DmXkkunKsGJQii/GWROZLfEoPlFxsIOUxV1o1k8JainADReKFangdwJDnCT0SfrB+0TRcc784pLxC8nzezjwbgSY1xcTON0nbjheWQJrN6+Ge5swhrSLc5po8dlK9wjZi8yk+icSV9DnepqsvAuy94aug3V5SBOuhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5J2mW+mGII9FKVjFlFjc08EeY9Of0jtDLe8x/G0mFco=;
 b=I4rx4NJ6K2iwIkluw1OdN7qStooyWMaJpVlJtYx3O0Z4Um6xfjGC/DWQ/Sobujdbd2UksuVPyy35D6QWTiCc/+V3Dbuk6O0mKxaXwYlg0lFMHksD1sVFPTtVT8rWsRsGT3wwU1O1RjCqKG1KZdjLamxrKyXLANItYyvkwWmPcM8ehZRfFlwmRniNX5SVaVw+x7AdFjouQ4PBoZPmMbCd/UpNIIWFUFu+fW72xqPDdAN72Tq0irKIAA/cAnpt7lXSuC8355kxvWBK6dKCZv0/lpq6ombf4ZuYlBwiJrAyrLaiCxDym/ajg0tGudS9vpmd/KMJwVK1HWB6eu5YNvQvkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5J2mW+mGII9FKVjFlFjc08EeY9Of0jtDLe8x/G0mFco=;
 b=K6COAQvzknBfs4Sbvc0+dcfXyu5ssiAF/PhhpdV3DPGxF6NhxjYZv9kRlYW6Ok2eZfIxvJ25QbtsyFDh5+3RkI4wLMrNMg/nD+syvMJSkrOJUcrTV23rblOsYv6INSwhjE2hlZbGMPgiEfpkLh88+D5snRLLS0oRL2T4+rP5tSNkxTl86lT0dYlMuw4TnevIHrPX6A69IYnTvGuiQhcQ81YGa069z3XJLj23gd3SdVbIt6YKTyDnuu5N5gULEAk4kG2jIbuLdyUP34c6/usojeio795hrDMpmieEtu7dZnZtA44+6XjCpaczVkrrrOpKL0MfOwg5FyEO+1ZDrykwjw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13)
 by DM4PR12MB7504.namprd12.prod.outlook.com (2603:10b6:8:110::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Mon, 12 Jan
 2026 04:50:23 +0000
Received: from PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::2920:e6d9:4461:e2b4]) by PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::2920:e6d9:4461:e2b4%5]) with mapi id 15.20.9499.005; Mon, 12 Jan 2026
 04:50:23 +0000
Message-ID: <1610f592-e383-42bb-a1c8-ec81b9e08037@nvidia.com>
Date: Mon, 12 Jan 2026 15:50:13 +1100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/7] mm/zone_device: Add order argument to folio_free
 callback
To: Zi Yan <ziy@nvidia.com>, Matthew Wilcox <willy@infradead.org>
Cc: Francois Dugast <francois.dugast@intel.com>,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Matthew Brost <matthew.brost@intel.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>,
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
 Felix Kuehling <Felix.Kuehling@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Logan Gunthorpe <logang@deltatee.com>,
 David Hildenbrand <david@kernel.org>, Oscar Salvador <osalvador@suse.de>,
 Andrew Morton <akpm@linux-foundation.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Leon Romanovsky <leon@kernel.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R . Howlett" <Liam.Howlett@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Alistair Popple <apopple@nvidia.com>, linuxppc-dev@lists.ozlabs.org,
 kvm@vger.kernel.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-pci@vger.kernel.org, linux-mm@kvack.org, linux-cxl@vger.kernel.org
References: <20260111205820.830410-1-francois.dugast@intel.com>
 <20260111205820.830410-2-francois.dugast@intel.com>
 <aWQlsyIVVGpCvB3y@casper.infradead.org>
 <874d29da-2008-47e6-9c27-6c00abbf404a@nvidia.com>
 <0D532F80-6C4D-4800-9473-485B828B55EC@nvidia.com>
Content-Language: en-US
From: Balbir Singh <balbirs@nvidia.com>
In-Reply-To: <0D532F80-6C4D-4800-9473-485B828B55EC@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0070.namprd03.prod.outlook.com
 (2603:10b6:a03:331::15) To PH8PR12MB7277.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: PH8PR12MB7277:EE_|DM4PR12MB7504:EE_
X-MS-Office365-Filtering-Correlation-Id: 67fb2cdf-1361-4318-674b-08de51961881
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|7416014|10070799003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VUZVeU5ZNFB0V2dMYWY4d1IvMTF4THlvTmJjcGdqdFI3T3pDT0licEJwRHJL?=
 =?utf-8?B?YjRYbVo3NUtDcFpvMzJYdEQ2M3hvQVd4YWZkcjRYdTYyVTZvWTFLZzh5UUpp?=
 =?utf-8?B?eUdLNXBWQWt5aHN5NjZRTitpR1hKTElPb2kvMnVqRUFvWkVLaHRTOUE2WE5q?=
 =?utf-8?B?MzdnSm1DN00wdnZlUG0rTm9rcnBlUGxhcDNuaHlMZmVkbVEwamx5d1B2YTRa?=
 =?utf-8?B?R1picXhDRkpzQVd1SGtOTU9ndDJmSTBkMm8zWnMwTlJSSDJLbUN1NEI5MVlz?=
 =?utf-8?B?RytRU3hqZWMxVGM4K0YwL1ZnYnpOcXArN1MyZVlEZ2l1cXdkTG5jWjJGMERk?=
 =?utf-8?B?WnU1Z2RuVXhGSlFaZ1BTTXNMZUFpQXBrMldXWktTdU1jNS90Lzl5Q1IvbFg5?=
 =?utf-8?B?RHVraDNKRWFGYUMvbFptUG0rY3dDSTB5NGZyUklCV0NhUXBUTldqZjJwTDZS?=
 =?utf-8?B?QTkydmNoK20yblhjemZSVGZmdTNIdnZqUjV3WXRoaXVVc3lwbnBLa2lZbktx?=
 =?utf-8?B?RXRqbWJXZ3VYTjdPQTNPcFBEMFV2ZjZiUHRTbWlhL1FqTE4xUFVoc3BhY3VR?=
 =?utf-8?B?cU0xenNlY2VwRnM0VTdvc2xGUzBZcy8xM25yMTRxZy9sVzFxdE80UGlMRTA3?=
 =?utf-8?B?MDJabDk5VmI4K1lyMStkM01qbC9RTEZheWZXR0EwUENuZTBMQnU0UVdYQkJ0?=
 =?utf-8?B?aGl1MzMxZ243UmhsLzBxY0h1NkdvUHdMZ3RrR2h5UUMxeXR1b2piWXJuV1JB?=
 =?utf-8?B?Z083amFiQjFPMlhRNXh3NU4zcVhoL3hsWkxLeE5PVjZ0SUs4KzhaRUc2RUk4?=
 =?utf-8?B?YUJGRWpHMFA1Q3A1YllXZG1tdndRQ1d6MjBZNk0xMmFPN21ld2hUaU4zUFY4?=
 =?utf-8?B?SXYrV2h4YzZzQlNXTFE1dUwzSHlISE1NTW5nWkR1MklvVjJhcWR5UkdaVUdJ?=
 =?utf-8?B?d2l3MlRqOFhTOEdUK1ZLQlZSY3MzMnVLc2daMCtjT3poN0dpUnMzWkNORzFo?=
 =?utf-8?B?Nnh2N2dIU09RRk8vS0Q0WkJjYTdrbHhDZUVvUXpmVVA2RCtodmFJQlVyTW4x?=
 =?utf-8?B?ajl2WksrajNhNXNLYnRWTW9kODEwZDRMRE9nenVFMis1amhuZ01QT3N6VmZk?=
 =?utf-8?B?NnhYVWptdTZyRmVlQlFUc1AyQkR5RnFXY0grRkRJbWI0Kzl0Z0NKcENRSE1v?=
 =?utf-8?B?cVpCUTlRRGhFdm1WeEVkZWNLVUd5UGNVL3kxRUcwNk1hQkF6cXNWejBaamw3?=
 =?utf-8?B?emUwVkpXUUFoUEluenFWS3haL3IvdmpaWHpZM3ZFa0piQlhaSjJjdDBKVWww?=
 =?utf-8?B?MUN1T1g5UFVqUmdMbnlzaHBySHQycU5wbE1NSXBYNU1mcHhIU2lXaU8wVHpa?=
 =?utf-8?B?MjIxUmFQZ2wxQmxiZWh6MkNuTVgwYml1UUQ2VGFpNVd1WU85RnFFcnZjdHpR?=
 =?utf-8?B?ZUYxSEZNN3BPNldYL1lJVHAyUXJGbWNPUjdMQ0tSWGlvaGxnSUNDZ2hCTGdW?=
 =?utf-8?B?TUI3c1ZGM2pQd1h6Tjh6aVFNaFpyUmtjbGNCZG1IWDhRbHZGM1NpYjBBckIw?=
 =?utf-8?B?bW94cXZwclZycEsyNm10amx1ZTl2ejRYb1Y5MHZCVTVLUXhiK01nTmxqeVBh?=
 =?utf-8?B?SDFOa1BZdy9JZEtVUk5Ea0dnd1V2WTlTTHpQYXZNSGVvdHh1bmhmWHEvQlNL?=
 =?utf-8?B?cUF1L1ZJNkFRQnA0R1F6VFlxRThBdzBUY0NGRnlldUtYYXlTUEFmVmZqMmdG?=
 =?utf-8?B?UldvZFk4TmZkWnp3cnNlWGIwYWRrTkViS1FFRnVwYXhNSDZEcmdEd3kwNjNE?=
 =?utf-8?B?bVgzcEw1VkFBT0pTakN1Q3ZyRFUyUkJYOEswakNOaVlRV1pvWklDblV5aUJt?=
 =?utf-8?B?bEpwdTc4Z2dPV3BLSmcxOWdhVXJVT2todFp5TjcrM1EwejlqcGtGMWE5anA2?=
 =?utf-8?Q?6MHIPw+kmnfam1E8nVOn4pwl+eBAGsxD?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7277.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7416014)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cVE3dlQ5all4NHdQTXo1dnBSWnBrSWxsQ29nQTROTjhYcktKM0U1amdTQUxU?=
 =?utf-8?B?QzYwQnB4Ny91ZVhzMUUxSmFaK1FQK0x5cExBZ0k4ak9KUm9zTGh6NVVDYlZn?=
 =?utf-8?B?anJuYmpJY1VuTEplUkgzak1EUzdqcE1XUm1xWkRtbnZJMkZLRFY1bFJhQ2Fr?=
 =?utf-8?B?czdydXhLUGt6WDMvakY2NFpXMXFEMXl3bHVOQ0hjWDNZNXk2R0lrSjFQQURQ?=
 =?utf-8?B?ZkQ2NnhXSXFHNHNGVW83UjZWeEllemJ1SEhxMi83azV1bFhicjZYYWVIZXIv?=
 =?utf-8?B?VUR5ZzdycnI3aGVRU0VUYkdDU1NRZG1jYmRTSzdRNXVwUmVBOFFMbXFaNXBl?=
 =?utf-8?B?OTNwL3hBNzRPNTBjNnZodEc0bStQKzZQQmljcVA0cGJ4dVRPQmIwTWhQYUU1?=
 =?utf-8?B?RDliRURGQVdiUCtKTFZqTDRZYTlQUEN1NWZobjM0STluN0V5VTREMkVFUWwr?=
 =?utf-8?B?czU4eE5WdTRIRzBFdlRzbG15ZmtDbFdVSzZ2OENGRlQwakFQZFF1RXVMdDVn?=
 =?utf-8?B?QXdCNklvRERtMlN3U214SWlBUXBVLzVYWWdSSnVRSk8xR2pmS25SY2lQekVK?=
 =?utf-8?B?WVJXdk1NM3NUc2NZM2V1SEJLWWJmRVZjdWhnaFM0UVlmQWZlSGRDMlF4WFJj?=
 =?utf-8?B?MFJIY3RZVlF1MGZaWlhjbzdDMUh1YWtjNnJUVzBONGd0bEJzM3pGOHo1bzQ4?=
 =?utf-8?B?UWRzWHBHOXZpNVkzVm5UcUVHbCs2MWsvdlJ5NTNreWhMNmxua09JQXA2RHA5?=
 =?utf-8?B?YTNvM3JqQWtzaEVtQndPZEc3QlgyNVYxbjNGblcwbzlJSnRkL09rSWo2MHBs?=
 =?utf-8?B?a05pSEx6TTIwOGRxSEZReDFHSU1SQTdYVUgwYW9KUW9vcHlIaktTM09iK3dx?=
 =?utf-8?B?K2NHNnUxUHlWNjBMODhhNlNwdmhCc2VQRUxHbHRIOGpFc2J2U0UrZDdxc0VL?=
 =?utf-8?B?VUdBdG1yTnhzZFJBbWFjcGpvM2hzQkxqNXUxQnU3Ynd6NTd3dFBrUEd3OTFz?=
 =?utf-8?B?K29ObXJTcHYxZlcrMVFEdmpFTThSaC90Tjg1SDRKTmllTkJMTENJS3A4TkVP?=
 =?utf-8?B?QkpVRzhKOGsvcVdXeEdpUUVxWHdIZzZuQTJiY3E0OVN2NHlqWnpiWkU4YmRK?=
 =?utf-8?B?b3NmZnhybjAwVVZQQUxrakIrRjRlTk42ZE5xa25iM3FyYmovL1F2cUx6QXoz?=
 =?utf-8?B?Si9kckR1d3VGd20xR2JHdzMwSldaYmVlQ0ZTWUdIZnpqWkltczZCVFdkb0E3?=
 =?utf-8?B?VmJoK045djVNK3o2UnJ2MDBqenpVOFo0NmRMeGxvWXNVQWdxSzRNZnZlL1pE?=
 =?utf-8?B?QWg5NXFUaS9ZUlU2UXFPVW1xaXo2ZEhpVEpSZXIxaS8vdzVUb0hZOFpUM29F?=
 =?utf-8?B?LzhWUVZLdVd1TUdkS2xoc28zMmFrMzE2Lyt4STExVFVDYWF3UnVYYm56aUFO?=
 =?utf-8?B?U1p3M05jTWVBQlE4RVRvbGdwQjUyOXhXdmljQkZYR1JjZ09rZHpBRFpyZk5a?=
 =?utf-8?B?L3htR2dTK2V2U3doRWJrNzdtT2d0Vlp0cVQrODZEL0ZNY0Njd3JIdGJ2Q0wy?=
 =?utf-8?B?S1Bld3hXbEVXbTZzdWkwR2pWSTJwVTBvWDFKUHZZejE5N2drSUxENURXMmNE?=
 =?utf-8?B?QStJMTRpNENqM1NvcHgyTi9BcmVybDJoc3loVmczNDUxeXFQbWN4NXc5RFdJ?=
 =?utf-8?B?UUpRWktjYTlZMTlJZENUSWhHMzFUaDBCYnk2by9tZCs5NUUvV1lsVTU0bGdT?=
 =?utf-8?B?NjhvOVgzYVZLcmtRQ21iRXRrT3gweERBNSt5Q3pPSkl3anZ0TzRuNnZwVzhO?=
 =?utf-8?B?eFl0cTEwdVJXRzNYZ3JzcVZBRnNENFFRL0hvdzZCRnhaeTJyUE03aGpLdWtz?=
 =?utf-8?B?ZldDRUEvL1NtY0hra2E5NUZKYmlLREw4d092aGJEb0o1YnhjamduVVBYampI?=
 =?utf-8?B?ajRBbU52UWwvMzlHc3RqM0lWRVVucEJ3cE0zSFpWa1BVVDFLK1MzVmFDMFJT?=
 =?utf-8?B?bG16bnZGN1hXTUZMbWhETFZoY2FRanVrdTlVOUp3MFF6OHpyajd6eFZZWmtK?=
 =?utf-8?B?dEN1UUI5Z3NjRkFtSW40dW9MSE04blcyS0RhNUpvQlVialBWVUN1aXR5aTRl?=
 =?utf-8?B?RzFEYVpSVGsxL1VDSENuUHp3ZkJ5RkF6V0RFd3Y5L1REMEhub2hVL0tuWENW?=
 =?utf-8?B?SDdwTjRRaHVabEFCNzRtbmQ5UXVkUG5pQmF6YWc5THNUNkNIRFdqa3BWNmNH?=
 =?utf-8?B?SE5rWkU3T3J3MHBHdHl1L3VrU3NlZ1JLQ2UrYXVnRitSY25nNURnRWYyMllQ?=
 =?utf-8?B?WnpqWnNoeUYvQUpobW5mVEFkNnZSd1pNUGZzaWo5RzFLbnhZTmpzTzMvaTFy?=
 =?utf-8?Q?ZEvwYJZSWwPPcxb8cDGNiWzPD8ZFDHc8tkY2J8/3SUG0J?=
X-MS-Exchange-AntiSpam-MessageData-1: bv5Y55Qz9pEZkw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67fb2cdf-1361-4318-674b-08de51961881
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7277.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2026 04:50:23.2780
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dXHrR9Wia0l2g3pYkg8M7dM99Xj0xDHFftr+IuYjYg0guQjkzoQ1zCEOxIa7ly5YrGQ/qYF01o4/jV6Whu15vA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7504
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 1/12/26 10:51, Zi Yan wrote:
> On 11 Jan 2026, at 19:19, Balbir Singh wrote:
> 
>> On 1/12/26 08:35, Matthew Wilcox wrote:
>>> On Sun, Jan 11, 2026 at 09:55:40PM +0100, Francois Dugast wrote:
>>>> The core MM splits the folio before calling folio_free, restoring the
>>>> zone pages associated with the folio to an initialized state (e.g.,
>>>> non-compound, pgmap valid, etc...). The order argument represents the
>>>> folio’s order prior to the split which can be used driver side to know
>>>> how many pages are being freed.
>>>
>>> This really feels like the wrong way to fix this problem.
>>>
> 
> Hi Matthew,
> 
> I think the wording is confusing, since the actual issue is that:
> 
> 1. zone_device_page_init() calls prep_compound_page() to form a large folio,
> 2. but free_zone_device_folio() never reverse the course,
> 3. the undo of prep_compound_page() in free_zone_device_folio() needs to
>    be done before driver callback ->folio_free(), since once ->folio_free()
>    is called, the folio can be reallocated immediately,
> 4. after the undo of prep_compound_page(), folio_order() can no longer provide
>    the original order information, thus, folio_free() needs that for proper
>    device side ref manipulation.
> 
> So this is not used for "split" but undo of prep_compound_page(). It might
> look like a split to non core MM people, since it changes a large folio
> to a bunch of base pages. BTW, core MM has no compound_page_dctor() but
> open codes it in free_pages_prepare() by resetting page flags, page->mapping,
> and so on. So it might be why the undo prep_compound_page() is missed
> by non core MM people.
> 
>>
>> This stems from a special requirement, freeing is done in two phases
>>
>> 1. Free the folio -> inform the driver (which implies freeing the backing device memory)
>> 2. Return the folio back, split it back to single order folios
> 
> Hi Balbir,
> 
> Please refrain from using "split" here, since it confuses MM people. A folio
> is split when it is still in use, but in this case, the folio has been freed
> and needs to be restored to "free page" state.
> 

Yeah, the word split came from the initial version that called it folio_split_unref()
and I was also thinking of the split callback for zone device folios, but I agree
(re)initialization is a better term.

>>
>> The current code does not do 2. 1 followed by 2 does not work for
>> Francois since the backing memory can get reused before we reach step 2.
>> The proposed patch does 2 followed 1, but doing 2 means we've lost the
>> folio order and thus the old order is passed in. Although, I wonder if the
>> backing folio's zone_device_data can be used to encode any order information
>> about the device side allocation.
>>
>> @Francois, I hope I did not miss anything in the explanation above.
>>
>>> I think someone from the graphics side really needs to take the lead on
>>> understanding what the MM is doing (both currently and in the future).
>>> I'm happy to work with you, but it feels like there's a lot of churn right
>>> now because there's a lot of people working on this without understanding
>>> the MM side of things (and conversely, I don't think (m)any people on the
>>> MM side really understand what graphics cards are trying to accomplish).
>>>
>>
>> I suspect you are referring to folio specialization and/or downsizing?
>>
>>> Who is that going to be?  I'm happy to get on the phone with someone.
>>
>> Happy to work with you, but I am not the authority on graphics, I can speak
>> to zone device folios. I suspect we'd need to speak to more than one person.
>>
> 
> --
> Best Regards,
> Yan, Zi


