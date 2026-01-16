Return-Path: <linuxppc-dev+bounces-15924-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E5D82D383EF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Jan 2026 19:08:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dt7BW26cfz2xnj;
	Sat, 17 Jan 2026 05:08:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c112::5" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768586899;
	cv=pass; b=oYACwbWgN+/e5zYAG2qf4Uj3juq889MKRTgysB6K83ghw/eXc5JxdVXnvJszZZwdrMsFIV2ZNY2F9VxYKwFd/c5KVyIG2oeXkJc5T0gPjmdzl+Vyt3EVx5ivMgkb9qXuM4mZKdMksxdL1w//7/F7oHNgnfrjOwW2CE+YW2eh2rDskrXI93Mk/DWEEmMv6qENr/5rbXXvGPZXCxHLDfaP8mWKT59p7vIo/0mkL94RIB10Fpqb9dsEIU6rvrwaS8BL1t1EAzhoHnmQOt8JzcUcxEoUZv2KKqclgyy4JsvpJdhRQpq6zj10cEgN4L5k17yZXn0mpy32LsGHqKHVAsGCPw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768586899; c=relaxed/relaxed;
	bh=QzsrSRk7NUcRK0Gjmik6FZDY2UHNB0pvh3knM0HGWrE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=eUoQH6aYaNfYBfNkq72PKDycVCfpzyb+4vrZQ+kyUd8fCmjh1NvcL5vzLUymBwDOOt9ZaR5Sj/pPoyXIObOzN2kOYU9rjeJm8UmOfqMJYByFz7qDhon8Z9KDcVfPzipWdJAX9eZTNt+9+KbZ/hMblp0lWbwcQ2rRr+FQPxhsn+6fAlgB8KRZIQhnv/FUGTJPgz0DZiNvCm7qT8F/jhsYH1MFBSI5r1sZVsTOnRSvWy8u2x7e2gJvtvXodTMKAG8M/rQf0psw+KzWrx5yZi0PR8MZnYVWcieAarv6gIyrcKhZtgWfgo4H0HZBq4PkXa5glLpHF1hBVgVdxmufpSNquQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=l0l8UlLO; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c112::5; helo=cy7pr03cu001.outbound.protection.outlook.com; envelope-from=felix.kuehling@amd.com; receiver=lists.ozlabs.org) smtp.mailfrom=amd.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=l0l8UlLO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=amd.com (client-ip=2a01:111:f403:c112::5; helo=cy7pr03cu001.outbound.protection.outlook.com; envelope-from=felix.kuehling@amd.com; receiver=lists.ozlabs.org)
Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazlp170100005.outbound.protection.outlook.com [IPv6:2a01:111:f403:c112::5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dt7BS5pFpz2xS2
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Jan 2026 05:08:15 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QL9kZtmYatqakMyzQItnuvp3liDbJ6dDKVjEDzxrJ8eBa8r6rVroMRZ1OuhT00h4o/sj2VSCiZw54Y5A4d00jTPxmFEHvljwcrZbwm1v5wt7imjrSi7xtTpxKuG/h2Lj+DNgKaZ0Nq47n417wk1/rFDcU1tDq6wuQVQbv87LXUTQt1RnREvKTXyf4q+06R1XU/gWayxKn8vJOhHAO7gPhWH5gLkSfwr1KTaNlIWhwfJmZNnboKvJQ1JMQkz3FhXnLEHq8DPPp/H7Vn3gJf5phtQBpyha1pAWDZl+csMf5pnzHTYTiuElU8mYMDdMBsiO1VYvvnDAgSRS6hDnRD3Cew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QzsrSRk7NUcRK0Gjmik6FZDY2UHNB0pvh3knM0HGWrE=;
 b=wx+Dt0hkQVvBIFAFMxFc0KdvXt21RsXhLuFAT2STCKfWUOWqSAHaP/UlKowF7HPzSzS3rFHNlA3MztY9+qpIsEVr5AmvpCrBnEtWy4mh2oJw2n7eoBrKXICTANSGqOkuLI7FultFxLIVDjb1+m5O8ewzPeUBt9XW1OtoalA5bAsMu6nCn1p8taVD5yItzt3qKlyiPvYLVPVJOhl52bsj3r2tE9Io7mBcAP0t0THSNilZPquZBagP5/AW2bx1Yhtx4u+SUk8Zcmzvnn89tqo1VV/Mqz4OOnW7fUbebR1ZXrYDvaoIw/qu6UsIqoNmvxUmMLHJtG+VWAE0+wSsiSkbXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QzsrSRk7NUcRK0Gjmik6FZDY2UHNB0pvh3knM0HGWrE=;
 b=l0l8UlLOMawncM5cE3W1UYb8FLuA2W+dZbgNBj/1owWDKcpUDZNTgrD+t+fBzHgfv3gTAqwJIBcMros6Ddr9LXocKl64Zr1x0VlVDWNanqZyKnKZwUclwYckcG05W0M/h9ZUjSdpoCgErbkiyPDgXqKqb8L0fRVJt1GirIxKYb4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by MN0PR12MB6367.namprd12.prod.outlook.com (2603:10b6:208:3d3::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.6; Fri, 16 Jan
 2026 18:07:51 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::230d:c588:d858:9977]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::230d:c588:d858:9977%6]) with mapi id 15.20.9520.005; Fri, 16 Jan 2026
 18:07:51 +0000
Message-ID: <2485868d-2755-4984-842b-430b78f6f9be@amd.com>
Date: Fri, 16 Jan 2026 13:07:43 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/5] mm/zone_device: Reinitialize large zone device
 private folios
To: Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Francois Dugast <francois.dugast@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 nouveau@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Matthew Brost <matthew.brost@intel.com>, Zi Yan <ziy@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>,
 adhavan Srinivasan <maddy@linux.ibm.com>, Nicholas Piggin
 <npiggin@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>,
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Hildenbrand <david@kernel.org>, Oscar Salvador <osalvador@suse.de>,
 Andrew Morton <akpm@linux-foundation.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Leon Romanovsky <leon@kernel.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R . Howlett" <Liam.Howlett@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Balbir Singh <balbirs@nvidia.com>, linuxppc-dev@lists.ozlabs.org,
 kvm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-cxl@vger.kernel.org
References: <20260114192111.1267147-1-francois.dugast@intel.com>
 <20260114192111.1267147-2-francois.dugast@intel.com>
 <aWpqxS7FrV0KffLr@intel.com>
Content-Language: en-US
From: "Kuehling, Felix" <felix.kuehling@amd.com>
In-Reply-To: <aWpqxS7FrV0KffLr@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR01CA0084.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:3::20) To BN9PR12MB5115.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|MN0PR12MB6367:EE_
X-MS-Office365-Filtering-Correlation-Id: 9598ca31-996e-4e5a-0a30-08de552a297b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VDdTakNQUzhPTVJYcmpIL2FmZ09Hb1dDS1VJdi9DS212dVpXYm9NVFg1TVAr?=
 =?utf-8?B?T2ZkRlpUcW5MZkNKbWd6Nk96YzVaRVpxNk1nUVRjd0t4a2lyakxpNnVoYnhL?=
 =?utf-8?B?LytlYjE3TFI0aVJpZ284R29LZk15cWJQdm1iTE92RS9vV2lvaXIvVHhYdXd4?=
 =?utf-8?B?azR2MXdsVjdZYVJJSjZ4ZjFsQm40dnR3WXV5SllCaExySWo2OUlOV0tybmY3?=
 =?utf-8?B?WHFHOXJ1WFYrSlBtbzVNU0o3Y1VMSkx1Ujh0eHErcjRoditRcGRwRCsycVQv?=
 =?utf-8?B?OEZNUnVSbjJkWGt3VTFVMW5YUHNHUVltaTdVcFJ2dTJGWGs4SVMyMVdSek4w?=
 =?utf-8?B?NkZxaFk4ajh5ajNBMGI3Tmo0aVpDUkFFMU93Z3IxOFdDZ3RsaWcyenQ0VkNi?=
 =?utf-8?B?VWJoMkt3SGdVcEpoamc3N3ZweFBZajhucWtwVEEwWlAvVm8rU2wwaDRoaGFV?=
 =?utf-8?B?S0dPOHdtVW9pcHlUVHpYdGpyemVUaUR1Rk5rQTc0N0tVazV2b0x3MmJSR2h2?=
 =?utf-8?B?T3B0bzVabytvT2ZVS1RvK0JKa2xwRjI3a2xSeEEyRUZXNFpxUFpUR2k5RHZ3?=
 =?utf-8?B?RjVtNHBWc0lvZGJ5Y0RndDNtamRpanRYNGZma2M5RWU5Nk0rSi9oYm5heE9n?=
 =?utf-8?B?bDhGQzQzVnpEcVZhTUtGR2RIT1YwUHVsNnVLWVdiZkpzWnlXT0FwOENEajA0?=
 =?utf-8?B?K3IyU1RpU2lhNE52NmM5TFNaOUVLN2lSMm1QdTFiNUh6WDJXcGZMd0FEMkR0?=
 =?utf-8?B?NWsyRTArQTYrZjZvZS92K1BkZlBTQ0JBenR6VVNEVEVLZkxVZVdxV0hlYTMy?=
 =?utf-8?B?dUVHSmYrMTlxdktTendwandrUzJvV1F1YXpUUnAxTXhzRzJWRUdacTVIdXV3?=
 =?utf-8?B?SFJPTUdMUkpPTTVhRWQ2SWcxVVVYOXdnazlSUHBMZDNrZWE2VFloMFRuV2Zn?=
 =?utf-8?B?dUtQOCtzUXVoakltVThnSEZjSHhYRHE2WmYzREZGTVVwd1k1WlBXM0w2R1NH?=
 =?utf-8?B?dmNwWTRFQ01PK3ArdTJCMGNYKzkrS3Z1R0gxdU5iZjFTK25id0VOcUJjVWJo?=
 =?utf-8?B?Ly9EREpBZkcvRm56NEFnckY2R2VBdU9wa1BaT1Voak9HeWtSL2NybW9WY2My?=
 =?utf-8?B?V0dFOHBKdi9xYnNPczhEU0tGTDNjRnlGajlZcW5WZHFubXFmQ0MvTkRpVXFS?=
 =?utf-8?B?VFZ2RnZreGJmd0gyNG5ZZU9kMnN6bGRkdEhRN0h3bWZKVmtHdFpCMFJjaXAv?=
 =?utf-8?B?S1hnckIyL0lLUW4rVjh4NTFsU1k3d1pqWE52djI2MVhhNjBjUDIybHNmQ3ZV?=
 =?utf-8?B?U0RuYUlBVndhTEdqLytpdWQ3TEF1M2ZmMnJlbStRWVYydUN2cXR0VjgwS1Zk?=
 =?utf-8?B?eEZ4amJYMFlzbUg3UUV1Z1llRnBUYlcwNDdxOCtaYlJpb3VUN2pVWEhiQUVT?=
 =?utf-8?B?ejhGdmRmWVB1aXozZ0kwRGFtaktCcDZhSDhZeldGdmZBM0FJa21nN1ZoaGs0?=
 =?utf-8?B?UWcxUkViTXJpb2J2em5xd0tjSkNsZFkwOU1qR1hTNXduWHV6bnNSRVgwd09o?=
 =?utf-8?B?UE1pUEh5dmgzdldzRlA2endmcEJ0RU1BaHo5YXhPcTZxQitpbkpwZEcrM2dw?=
 =?utf-8?B?bFp6NTZuLzRPczFOOVd5WmxkdFEraWhyeTRqWkhWYXN2UHpoUWJuWGMrTXA3?=
 =?utf-8?B?aGFSaUdTZzA0YlBuS0pIbm9zNm9ySGxDdXQraGJhUzlBVUNFcE5qdzdHSVFa?=
 =?utf-8?B?d1dwczlUSHphb1V4K3cvNHd1aUNtK0MzV0l5NmZ6ZGl0a1k0YlVYYVR1elFO?=
 =?utf-8?B?ZjlGampmVkgzV3NlQ0FIaGJNUkFjOTA4MmNTejVnUEVxeXFxalFlN0VUVFNB?=
 =?utf-8?B?WnFIUWNiVFZjWGF1U1kvbFFQQ3lueS9KVmZZelBhY2RwdWJ6S0RNVlNid0xm?=
 =?utf-8?B?SzU0Y3dzeUowbWpYWTlzWWNMTE1vVmowRnNhWHNuNlJTMXphRzI2cFRtSmlZ?=
 =?utf-8?B?Q2NRdHQ4OUVOL05BV3hoVGhEazljTENtZGliZ0ZtbkpGV1pIak1QUlRBZldK?=
 =?utf-8?B?d2FrUW9IRjRkelRkZTM2bjd6VnQ4TjhueVRsMk9PUUZMeWRXcHMxRmpPN2Nh?=
 =?utf-8?Q?6T6s=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5115.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Uk9zU1Y1bWpqc2RQYzBaMm5wejV0Q3FMcUc1SVJYcndWVkVuTzdJN21XN21v?=
 =?utf-8?B?Rms1dmlWZkVxNUNDMnpTclNERU1uMWRFQjUrTWhnekJ3eVVHVUFCUjR3YUFE?=
 =?utf-8?B?MHg3UDU0eFcyYm9DRXlkZDE3a3k1SnBKUDlMVzlWY0t4dmhmc3VGbjQyUTNQ?=
 =?utf-8?B?b0RZOUhNUGNoNWx6NEhZU0tHam5GNDNGbG9HUGpuWlNaaXVncU40N01sc3Zj?=
 =?utf-8?B?cm5OaGZQVm8rOXVhZGkzcGJ3ODRwc3ArOXZ5cnJWd1pSZXVUNklrRCtFZ3ZV?=
 =?utf-8?B?b1hUQXZCbzVmOFJtamEycnVET3JodlZ2MEFwaWduRFcwbkE3OEk1eTlGOFM1?=
 =?utf-8?B?NlZtTDFZdHUwMEwycWhQa0ZhREFHZS92Rjh5blhjSFNTWVo2eHpoNnRzMk90?=
 =?utf-8?B?WTZ5eVlDZFExT3ozWlBXUUJKMWhnRUJuNkVKNUMyVEVTZUk0b1RBWUNZdWJv?=
 =?utf-8?B?R1ZCUjdpN0xXenNCQnh0K3ovbUgxOFpSOXVyd29YWXJmTTFTakhpZ2I5bHh0?=
 =?utf-8?B?SzR1S3p1eDJxU24ycWJXa1hSTkNQdFJqM1h6TzVYNTVob1dnb01EbzFKL2NO?=
 =?utf-8?B?V0szTjVxZW9BY2xreHlIcmtEdUJBbUV4R20wVWM0aWFSWTBJUzU1SDVmc0RC?=
 =?utf-8?B?cU05dDFuN3F3d1JzeWlENnY5UVJPRlBra09FTFA2RGcwbms3Y3p4MTlRLy9y?=
 =?utf-8?B?czVpNDNkTXN2SVM0MDNHUnlFMmZVM3E0cXlFdnVER0g3eGI5WDVESllXcTZ3?=
 =?utf-8?B?NzRZU3drNURRK0lXRWlzenpNNmZuSEpuYkRpSlJHVkpyb3YwbmwvUk5SMHBN?=
 =?utf-8?B?TEVPNTk0eHoybFNxVE5qNXF2Q0ZpMjZJem0rcm1PTFVBZEMxOGpINnhqTVdU?=
 =?utf-8?B?NnpoR1FtMzdHUDBaY080dm1USnpwODJLaXpyeDljTUl6Q1YycWozd1hCZmJJ?=
 =?utf-8?B?aDZoV09waWVLbCs3K3NOTVYvb0xLcGFWWloyS0xiTVZRVTRLYmsxN2p1QjQ3?=
 =?utf-8?B?N2F6R1ZJbzFQcGNBU1h2bEdpOFczL3U5a2d3NWNCMFFIT0pVRUZsMlpydTFT?=
 =?utf-8?B?Z1JVT084QVZvdzI2QWhKbDlCcy8zR1JrdnFNclB3TzNuQjlhbkRON1E1eFhX?=
 =?utf-8?B?Q1NlRTliRFVYamMzS2FRdkdIMERJRlJiaEhhS3hoNVpuNFZRblhUdk9ab2NT?=
 =?utf-8?B?M0J1NXZ2dTBuYkRZbUtFNXRmMHZGQ25Eamh6NUV6eXFwZE9jaS9YZnZnSS8r?=
 =?utf-8?B?M0NwTFhqQ29DVHF6SnEvV2JjVkQzQVFhVzY3bFRvcldqckwrUnY2QWYveEZS?=
 =?utf-8?B?SFRlYWVyQmdWZ0dPTmRFMDFta0xHK0NGMnNQaHpZWGRiY3BNSGNlaTNQNmpG?=
 =?utf-8?B?MU5lVGNoVklOTEZ5cHBURlRuc0pJRjVGeWtEbHdJSFhvcjNVYlZLTXdFL3k3?=
 =?utf-8?B?bElHbGwrU2piMjgxeVFsSWNtZ0JHTHFVWkNrckxrZHF2dHlmK0tiRnpoZmxT?=
 =?utf-8?B?OUN3K0REdzlkdDVMVVhNVWJuMVNQRWlBYmRJRUZFNG9VbklycUdkZmlCSnNn?=
 =?utf-8?B?bEZMS2I5a0hNRjFUMVdKMjA4dUFFdjhuWFQ5bGxtbTRMRlI4MnVJcWgvVEJH?=
 =?utf-8?B?aW5DOHpNOTVhT3BTV1RVVDN6d3lGd0F3SWEvZGhhMDBSZ2c0WDZXN1dxTjFO?=
 =?utf-8?B?ZzhBdDZzVGJoRGpIb3E4cG9aSGV1TGdteXRxSU9EMFhuV2pwTVFiNk9hK3p1?=
 =?utf-8?B?L0NHc1VjV0RtMjlNRlZTaU9QUU1TK0FER2NFaVZUNTlIeVZ6OWNuNUJZbHpo?=
 =?utf-8?B?MVVTM1g5MldkdmNCQVlZSEs3MlBSVEZxeHhWd0o1Qy9Ua1RycGdwY25QVnd0?=
 =?utf-8?B?c0k2WDN6cnYrc0ZqbWV3SjVNbjZ3WXh3K1BiUUsraEtWOUtwSWpjTE0xVG1h?=
 =?utf-8?B?aXBTNWtjZ1oycG1xbURJa0JVRFVnMmN2c1VrWUh6SDZlZE92TTRHWFI0T2Mw?=
 =?utf-8?B?TXRhUVNheHk5VEN5MFBQRnQrYk5GQW1nNjF1Vzd3dUtidEhKZ2l0QXFmK0tZ?=
 =?utf-8?B?WU1rQStvL1BtS1l6dHNqaFJoQ2lQd1B5c2V2RUw1YVRGZkdpbUZ1YjhuQnNQ?=
 =?utf-8?B?UE9tY1FSVVlIdE9DTURVdS9OMVFja1owRkZScWVDTUdHWjUxdjRpeGFkSE9v?=
 =?utf-8?B?cS92amRQMUczYmZjUDBBYWRucU00Q1kxY1J5L3JMV0NDRHVBQncrQS9OcDh0?=
 =?utf-8?B?NTRURElsVWJXK1ZNWU9BdjFhekZPeVppcldhdlgwNjdWOHNXK2pFdmhiS0sz?=
 =?utf-8?B?WjY3WWI5Q2hiTjkrNVlBNHdRdXNjOUxqVFVPdFhNcGowM1Y0eElVUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9598ca31-996e-4e5a-0a30-08de552a297b
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 18:07:50.7618
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: faBXACrvD5oYYYMsDRa7ohGXi1E1ID8U4NioIvbLFPGbB9lkFRBAkOzQbmzOiOy+04WX3ZtkZuuleUNlDv0SVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6367
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_NONE,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


On 2026-01-16 11:43, Rodrigo Vivi wrote:
> On Wed, Jan 14, 2026 at 08:19:52PM +0100, Francois Dugast wrote:
>> From: Matthew Brost <matthew.brost@intel.com>
>>
>> Reinitialize metadata for large zone device private folios in
>> zone_device_page_init prior to creating a higher-order zone device
>> private folio. This step is necessary when the folio’s order changes
>> dynamically between zone_device_page_init calls to avoid building a
>> corrupt folio. As part of the metadata reinitialization, the dev_pagemap
>> must be passed in from the caller because the pgmap stored in the folio
>> page may have been overwritten with a compound head.
>>
>> Cc: Zi Yan <ziy@nvidia.com>
>> Cc: Alistair Popple <apopple@nvidia.com>
>> Cc: adhavan Srinivasan <maddy@linux.ibm.com>
>> Cc: Nicholas Piggin <npiggin@gmail.com>
>> Cc: Michael Ellerman <mpe@ellerman.id.au>
>> Cc: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
>> Cc: Felix Kuehling <Felix.Kuehling@amd.com>
>> Cc: Alex Deucher <alexander.deucher@amd.com>
>> Cc: "Christian König" <christian.koenig@amd.com>
>> Cc: David Airlie <airlied@gmail.com>
>> Cc: Simona Vetter <simona@ffwll.ch>
>> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>> Cc: Maxime Ripard <mripard@kernel.org>
>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
>> Cc: Lyude Paul <lyude@redhat.com>
>> Cc: Danilo Krummrich <dakr@kernel.org>
>> Cc: David Hildenbrand <david@kernel.org>
>> Cc: Oscar Salvador <osalvador@suse.de>
>> Cc: Andrew Morton <akpm@linux-foundation.org>
>> Cc: Jason Gunthorpe <jgg@ziepe.ca>
>> Cc: Leon Romanovsky <leon@kernel.org>
>> Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
>> Cc: Liam R. Howlett <Liam.Howlett@oracle.com>
>> Cc: Vlastimil Babka <vbabka@suse.cz>
>> Cc: Mike Rapoport <rppt@kernel.org>
>> Cc: Suren Baghdasaryan <surenb@google.com>
>> Cc: Michal Hocko <mhocko@suse.com>
>> Cc: Balbir Singh <balbirs@nvidia.com>
>> Cc: linuxppc-dev@lists.ozlabs.org
>> Cc: kvm@vger.kernel.org
>> Cc: linux-kernel@vger.kernel.org
>> Cc: amd-gfx@lists.freedesktop.org
>> Cc: dri-devel@lists.freedesktop.org
>> Cc: nouveau@lists.freedesktop.org
>> Cc: linux-mm@kvack.org
>> Cc: linux-cxl@vger.kernel.org
>> Fixes: d245f9b4ab80 ("mm/zone_device: support large zone device private folios")
>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
>> ---
>>   arch/powerpc/kvm/book3s_hv_uvmem.c       |  2 +-
>>   drivers/gpu/drm/amd/amdkfd/kfd_migrate.c |  2 +-
> AMD folks, ack to get this patch through drm-misc-next or even perhaps some mm
> related tree?

The kfd_migrate change looks straight-forward enough for me. We don't 
use large device pages yet, so I guess the changes in 
zone_device_page_init should be safe for us. Feel free to add  my

Acked-by: Felix Kuehling <felix.kuehling@amd.com>

I have no objections to merging this through drm-misc-next. @Alex, how 
will this flow back into our amd-staging-drm-next branch? I guess we'll 
get it on the next branch rebase. There should be no rush as I don't 
think we're affected by the bug being fixed here.

Thanks,
   Felix


>
>>   drivers/gpu/drm/drm_pagemap.c            |  2 +-
>>   drivers/gpu/drm/nouveau/nouveau_dmem.c   |  2 +-
> Nouveau folks, ack as well?
>
>>   include/linux/memremap.h                 |  9 ++++++---
>>   lib/test_hmm.c                           |  4 +++-
>>   mm/memremap.c                            | 20 +++++++++++++++++++-
>>   7 files changed, 32 insertions(+), 9 deletions(-)
>>
>> diff --git a/arch/powerpc/kvm/book3s_hv_uvmem.c b/arch/powerpc/kvm/book3s_hv_uvmem.c
>> index e5000bef90f2..7cf9310de0ec 100644
>> --- a/arch/powerpc/kvm/book3s_hv_uvmem.c
>> +++ b/arch/powerpc/kvm/book3s_hv_uvmem.c
>> @@ -723,7 +723,7 @@ static struct page *kvmppc_uvmem_get_page(unsigned long gpa, struct kvm *kvm)
>>   
>>   	dpage = pfn_to_page(uvmem_pfn);
>>   	dpage->zone_device_data = pvt;
>> -	zone_device_page_init(dpage, 0);
>> +	zone_device_page_init(dpage, &kvmppc_uvmem_pgmap, 0);
>>   	return dpage;
>>   out_clear:
>>   	spin_lock(&kvmppc_uvmem_bitmap_lock);
>> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
>> index af53e796ea1b..6ada7b4af7c6 100644
>> --- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
>> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
>> @@ -217,7 +217,7 @@ svm_migrate_get_vram_page(struct svm_range *prange, unsigned long pfn)
>>   	page = pfn_to_page(pfn);
>>   	svm_range_bo_ref(prange->svm_bo);
>>   	page->zone_device_data = prange->svm_bo;
>> -	zone_device_page_init(page, 0);
>> +	zone_device_page_init(page, page_pgmap(page), 0);
>>   }
>>   
>>   static void
>> diff --git a/drivers/gpu/drm/drm_pagemap.c b/drivers/gpu/drm/drm_pagemap.c
>> index 03ee39a761a4..c497726b0147 100644
>> --- a/drivers/gpu/drm/drm_pagemap.c
>> +++ b/drivers/gpu/drm/drm_pagemap.c
>> @@ -201,7 +201,7 @@ static void drm_pagemap_get_devmem_page(struct page *page,
>>   					struct drm_pagemap_zdd *zdd)
>>   {
>>   	page->zone_device_data = drm_pagemap_zdd_get(zdd);
>> -	zone_device_page_init(page, 0);
>> +	zone_device_page_init(page, zdd->dpagemap->pagemap, 0);
>>   }
>>   
>>   /**
>> diff --git a/drivers/gpu/drm/nouveau/nouveau_dmem.c b/drivers/gpu/drm/nouveau/nouveau_dmem.c
>> index 58071652679d..3d8031296eed 100644
>> --- a/drivers/gpu/drm/nouveau/nouveau_dmem.c
>> +++ b/drivers/gpu/drm/nouveau/nouveau_dmem.c
>> @@ -425,7 +425,7 @@ nouveau_dmem_page_alloc_locked(struct nouveau_drm *drm, bool is_large)
>>   			order = ilog2(DMEM_CHUNK_NPAGES);
>>   	}
>>   
>> -	zone_device_folio_init(folio, order);
>> +	zone_device_folio_init(folio, page_pgmap(folio_page(folio, 0)), order);
>>   	return page;
>>   }
>>   
>> diff --git a/include/linux/memremap.h b/include/linux/memremap.h
>> index 713ec0435b48..e3c2ccf872a8 100644
>> --- a/include/linux/memremap.h
>> +++ b/include/linux/memremap.h
>> @@ -224,7 +224,8 @@ static inline bool is_fsdax_page(const struct page *page)
>>   }
>>   
>>   #ifdef CONFIG_ZONE_DEVICE
>> -void zone_device_page_init(struct page *page, unsigned int order);
>> +void zone_device_page_init(struct page *page, struct dev_pagemap *pgmap,
>> +			   unsigned int order);
>>   void *memremap_pages(struct dev_pagemap *pgmap, int nid);
>>   void memunmap_pages(struct dev_pagemap *pgmap);
>>   void *devm_memremap_pages(struct device *dev, struct dev_pagemap *pgmap);
>> @@ -234,9 +235,11 @@ bool pgmap_pfn_valid(struct dev_pagemap *pgmap, unsigned long pfn);
>>   
>>   unsigned long memremap_compat_align(void);
>>   
>> -static inline void zone_device_folio_init(struct folio *folio, unsigned int order)
>> +static inline void zone_device_folio_init(struct folio *folio,
>> +					  struct dev_pagemap *pgmap,
>> +					  unsigned int order)
>>   {
>> -	zone_device_page_init(&folio->page, order);
>> +	zone_device_page_init(&folio->page, pgmap, order);
>>   	if (order)
>>   		folio_set_large_rmappable(folio);
>>   }
>> diff --git a/lib/test_hmm.c b/lib/test_hmm.c
>> index 8af169d3873a..455a6862ae50 100644
>> --- a/lib/test_hmm.c
>> +++ b/lib/test_hmm.c
>> @@ -662,7 +662,9 @@ static struct page *dmirror_devmem_alloc_page(struct dmirror *dmirror,
>>   			goto error;
>>   	}
>>   
>> -	zone_device_folio_init(page_folio(dpage), order);
>> +	zone_device_folio_init(page_folio(dpage),
>> +			       page_pgmap(folio_page(page_folio(dpage), 0)),
>> +			       order);
>>   	dpage->zone_device_data = rpage;
>>   	return dpage;
>>   
>> diff --git a/mm/memremap.c b/mm/memremap.c
>> index 63c6ab4fdf08..6f46ab14662b 100644
>> --- a/mm/memremap.c
>> +++ b/mm/memremap.c
>> @@ -477,10 +477,28 @@ void free_zone_device_folio(struct folio *folio)
>>   	}
>>   }
>>   
>> -void zone_device_page_init(struct page *page, unsigned int order)
>> +void zone_device_page_init(struct page *page, struct dev_pagemap *pgmap,
>> +			   unsigned int order)
>>   {
>> +	struct page *new_page = page;
>> +	unsigned int i;
>> +
>>   	VM_WARN_ON_ONCE(order > MAX_ORDER_NR_PAGES);
>>   
>> +	for (i = 0; i < (1UL << order); ++i, ++new_page) {
>> +		struct folio *new_folio = (struct folio *)new_page;
>> +
>> +		new_page->flags.f &= ~0xffUL;	/* Clear possible order, page head */
>> +#ifdef NR_PAGES_IN_LARGE_FOLIO
>> +		((struct folio *)(new_page - 1))->_nr_pages = 0;
>> +#endif
>> +		new_folio->mapping = NULL;
>> +		new_folio->pgmap = pgmap;	/* Also clear compound head */
>> +		new_folio->share = 0;   /* fsdax only, unused for device private */
>> +		VM_WARN_ON_FOLIO(folio_ref_count(new_folio), new_folio);
>> +		VM_WARN_ON_FOLIO(!folio_is_zone_device(new_folio), new_folio);
>> +	}
>> +
>>   	/*
>>   	 * Drivers shouldn't be allocating pages after calling
>>   	 * memunmap_pages().
>> -- 
>> 2.43.0
>>

