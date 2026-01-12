Return-Path: <linuxppc-dev+bounces-15598-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DA09D15D39
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Jan 2026 00:34:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dqpdD329rz2yFw;
	Tue, 13 Jan 2026 10:34:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=40.93.195.37 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768260896;
	cv=pass; b=F57Ld3qKzWrtbE0/j+HqQadstjESig+Mrdkddw1ZsTqNAStgKeK3xdwOyC7XedravKTJyg8fT5w8OAYRVuYJXDWy+D9vxoG9TyGhQeNf1OnCgvySDukm9McXiWJJpCB9RxYs88UPVeRVjHHpekLvcCFvIa5QlfNcG6juDL5bI7KyCJFJAma+efl42tkNnfCw0LlJqq9AFkAe6p0kWg8qwijSfDZMHj3RoLjcfxFwnvz+8LztyV3+yyGUhqL8E3Tg4fUjwjvFSOKKM+1R3WaT2MX4LXi9WQKT/r+YCHc1vvWfgGQyhaQ+QuztNER0DzkTSqnq3VTHK/NDavLRIeTyzg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768260896; c=relaxed/relaxed;
	bh=KKtub57i+BRsgv3qgLU/1L9of+bxJ1Ybeb/l0yBEbzs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=mhUcW0WqMlNqxxyA1AyAzdgqwHMQ2WtvjrMs40I90mSOgoipNESGVINMh27wiq+uWr4wwpekwP1OYSJZvWuxtGUnHcB4SKYe3ZkTZdM85ag/14rvVrvujaRYyTinNuvZJTeMsNnJRiz1gyvpblDseGh6BSD1c8kMwXwS8C9QzwH74WaXUth0Px4FA1JGOXQjSq0eSVvIvgs/e2w24obZbG32wqAA/tnEDuBVoJF0hTdPZ9l//HTP6CsuaVt27zRhevvsjhZsLP6snNOUgTkKqVnbxUPtdJboyMoRzxa26ax5skMv2OfmEK5orPj5atUGimPOgCK6lVpPp3db3QI6LQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=gBojPNwU; dkim-atps=neutral; spf=pass (client-ip=40.93.195.37; helo=sn4pr2101cu001.outbound.protection.outlook.com; envelope-from=ziy@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=gBojPNwU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=40.93.195.37; helo=sn4pr2101cu001.outbound.protection.outlook.com; envelope-from=ziy@nvidia.com; receiver=lists.ozlabs.org)
Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012037.outbound.protection.outlook.com [40.93.195.37])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dqpdC3zpwz2yFj
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Jan 2026 10:34:55 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=efBSABKygeOQ+I0vet+jPIt26Tm0DS7JMlltR3Cx2rz0jCNS7U6D4zv9zgq6FNhyMOqL6kxMwlwkouE4BmIL8FUz7yY4a793Z9a9M7B+xQn5ewzhwbt+veUaM/f9gsi+GSnHtDNP7dQ/GbmdKRzS8UZMoajlc9CdM9g8RE4b7pCZ88eCvub3Gd4wOz8I9B2ANlyVzfaG8tKRvZNmRj7wQN6r77XwXT4P9+gb5JU+sCYuGyH03P06Dm4zk8qNAskFiuKCSQKAs/CosPFQLUE8Lm2p/f6FxbkQ6YIgMYE+cn1HNehWVL3SXzwLJwdYNs7zmWEoHPiILBeviBoO8zfElQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KKtub57i+BRsgv3qgLU/1L9of+bxJ1Ybeb/l0yBEbzs=;
 b=J88han8seYTg2/vsz34mOLLfBwEhKn2kLuykXWrDY0MOwM9+SihppRl+LiK4SHKeiMX513DQwEkrEA3kgsb2/hJ0/oemGdXvAqPQrLSRZVFbK0wnt3ithXpLjroQtgSjnLfLKg2x9nShISKNS4hWj0Xe47c0aschCKRIGHDXxd5am0FVasmnRsewWYyYXcrYcUJjYMTZ7TtAr1gEOybINjNzeaYXymE9p1cq/L9Zpij36dbRApl/QmAoZ1MrhwFeQYoERDNWdNbu8vOTFCS6OFsa8+XxEW8URPRkvrbPWj8WoQpcJQBj6rKzfYtqRPVaihH467URvYxDMJ2xIZGijA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KKtub57i+BRsgv3qgLU/1L9of+bxJ1Ybeb/l0yBEbzs=;
 b=gBojPNwURQDGCRKn6iI7OKK+M/it+qoLZo73lbK18gH5+kX35tU41IYOVrVN/AUpCNasuJI5KS1ZpO18xKoMwQjIYk30ke+X2vGUgeIMsD+TSTNGyjHwMa9KzjFzpqBVWsFGXtOmw06Md9B2vfDIP33Re+NWnIATu9pWO2kX31KyjlNdYPeMt2MELLymG/Z84w2n4Ztm2612lVoEiA8qYmYgQ7cWymXfDMqltryCiWCrCJs2TcBakOTK0cmxUY5a49LOprFsAHtX3CBs7x69j43K33ofA/7ZOgopXIaMfW93tfj8hZXXkv18So8e0D0KpLETHhyoW5WVz1yV165H0A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 CH0PR12MB8531.namprd12.prod.outlook.com (2603:10b6:610:181::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.7; Mon, 12 Jan 2026 23:34:14 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%5]) with mapi id 15.20.9499.005; Mon, 12 Jan 2026
 23:34:14 +0000
From: Zi Yan <ziy@nvidia.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Matthew Wilcox <willy@infradead.org>, Balbir Singh <balbirs@nvidia.com>,
 Francois Dugast <francois.dugast@intel.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Matthew Brost <matthew.brost@intel.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>,
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
 Felix Kuehling <Felix.Kuehling@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Logan Gunthorpe <logang@deltatee.com>,
 David Hildenbrand <david@kernel.org>, Oscar Salvador <osalvador@suse.de>,
 Andrew Morton <akpm@linux-foundation.org>, Leon Romanovsky <leon@kernel.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R . Howlett" <Liam.Howlett@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Alistair Popple <apopple@nvidia.com>, linuxppc-dev@lists.ozlabs.org,
 kvm@vger.kernel.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-pci@vger.kernel.org, linux-mm@kvack.org, linux-cxl@vger.kernel.org
Subject: Re: [PATCH v4 1/7] mm/zone_device: Add order argument to folio_free
 callback
Date: Mon, 12 Jan 2026 18:34:06 -0500
X-Mailer: MailMate (2.0r6290)
Message-ID: <8DB7DC41-FDBD-4739-AABC-D363A1572ADD@nvidia.com>
In-Reply-To: <20260112192816.GL745888@ziepe.ca>
References: <20260111205820.830410-2-francois.dugast@intel.com>
 <aWQlsyIVVGpCvB3y@casper.infradead.org>
 <874d29da-2008-47e6-9c27-6c00abbf404a@nvidia.com>
 <0D532F80-6C4D-4800-9473-485B828B55EC@nvidia.com>
 <20260112134510.GC745888@ziepe.ca>
 <218D42B0-3E08-4ABC-9FB4-1203BB31E547@nvidia.com>
 <20260112165001.GG745888@ziepe.ca>
 <86D91C8B-C3EA-4836-8DC2-829499477618@nvidia.com>
 <20260112182500.GI745888@ziepe.ca>
 <6AFCEB51-8EE1-4AC9-8F39-FCA561BE8CB5@nvidia.com>
 <20260112192816.GL745888@ziepe.ca>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR05CA0145.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::30) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
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
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|CH0PR12MB8531:EE_
X-MS-Office365-Filtering-Correlation-Id: fb17651c-2ede-4372-52ce-08de52331859
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?alZmNVA0eDhCMDlSS09GOGdZNnNxbnU1ckQ0aXJvbTNKSHZiTzlpeW0zak1V?=
 =?utf-8?B?QmlkbXpxcjJxZG0yaHU1L1NQNlpMZm9LemNOaUpCaTAxR3pWSGg5cUJEQ3Vw?=
 =?utf-8?B?OWhNYTQ1VGZwbEtEcEIwWjJHempVdG4ySlV3cGJ2bUdya0tEODBXRjhvMDlE?=
 =?utf-8?B?MmRqZTQ2TjMwL0RqRDlUL2RuS0k5LzZjVWlXWk9EWnUvaEpWQUg1UU4zdDUr?=
 =?utf-8?B?R0RuMXZOMmZrQU5admpHRlZrYWxabFRyQ21pa2ZLbDN1endBKzNQZHROUkNm?=
 =?utf-8?B?THRJK24vYldUK2VLcEFHbEw1bUl1Sk1Qc2ovMURkNVV1ZERCNTdlQW5UWW4z?=
 =?utf-8?B?UThVVGtOT0NkWm1GdVBsVGNQZm4vQ0J2QWUrcXIyWUZ3SURXRHU1U1NaVmZL?=
 =?utf-8?B?QTR0WGh3RGdTRHJvVER3RThISm02TWVFRTl4UU15RnBKODF1aFlDdzVLYU8z?=
 =?utf-8?B?UkZ1alR2L0ZGck5ieCtJQzJFZ3RqV3pOcjRKL1F4dGxNUXhqdjViRDR3aEVR?=
 =?utf-8?B?UEtMMVVqaldYS2JtNU9pM3FOV1l4ZTB5L0tyV3FKTHZKVGRTZGsvZ25NbDdK?=
 =?utf-8?B?MW9la3k2ZW5FLy9pbjZnTi90OFJVSnBuemJHZlFHdlBIeEhLVW9MQzE2T3oy?=
 =?utf-8?B?TGV1WmwzSFZaRmdKbjlKa1ppNXVuWFQ2ZXZXMWU4NFpUN2hOdzhXQjE5djRG?=
 =?utf-8?B?dkJLV01NY2VDS1hLN2M3Qkl4WkdpVytkVjVhV1A0SmdBZlNOQ3NDMGVaL2Za?=
 =?utf-8?B?UTZsYTlPSGloeWlqNjRRTnBuUmwzN1JKTm1CRm83VTgrUnJkYU9iOExtdW9O?=
 =?utf-8?B?MGJ6SmN0bzE2M2ZtcHNTaHRRTWxLZFRrR0Q1dnZYRHlHc2wrelJiQWVOc2N1?=
 =?utf-8?B?MWV6KzR0RHVRMUZBeVFkTkxUYjFiU2hlRDZzcHkyTVdpQnVPQUQ3Rk1JTEhj?=
 =?utf-8?B?ZnJydU9tQUQzUDROanZLRzZqRXVwU3lFaTVHVHZvOE5HNnFEdnl3UyszZjI1?=
 =?utf-8?B?Rk5YS01RMHZOdzU3Wk1TRmJFVUV2NS9ZR0VsdlhsbUMzU0hGQnJ6UmVZSFhR?=
 =?utf-8?B?UHF4WFVORGJIU2RSSDU1a1VUQU84SmJla3FMZk52TFBNemdPQ0xxbTBtK3Nl?=
 =?utf-8?B?eEFpREI0RGdDS1BjNE16MzlNOWhaYUdWM3NlR2U2bGtxQUxhRVBGT3llQUlX?=
 =?utf-8?B?cXc5QkxDQitBUDdTOWpPd21xT2VibWdDRUMrVFFNQktFQUNrL1N1QmIvQUJk?=
 =?utf-8?B?cXgvRk1tTGM5OHQ5QWswZnhGRDV6WjN4MWFwUGJlWExxTjRpU05RcmtGYnZK?=
 =?utf-8?B?VmtDbzM0bUFOYUpNZ2l4VmlnZ2R6amRYM1Q1TzZlVXJIM1o3RXVwMnEyMDk5?=
 =?utf-8?B?SldsUmlaVFByYXdKcnNSUlBzSXRCODU2SU9EUWZiWXNhajFuVHQrRjRLTFho?=
 =?utf-8?B?ZVJLWGVHNjRYNUd2a3RNR0NZSisyVFBaVnY4cDNINStnaGNvR05yUzNoRndl?=
 =?utf-8?B?WHREelRJOVRMOHZKc0ovM3BMKzY4ZDVIMUpDeWJPUjZxem95d0ZjK2MxOWZW?=
 =?utf-8?B?Vlk4cUZieTdqNHdBZi90RUJ3OGhtTHNjM1NYMEFDbFhPMFFPUzRCZEFURDF5?=
 =?utf-8?B?U2lNdm1HdjNrS09qc1JXOUlRNUw2TFRvZ0gxbXY5RE8zQWMrVzhYUG4ySXVw?=
 =?utf-8?B?TkJINWR3d0l0dE1hYUNLaE5UNDZMZTVCa0pIZUd0NkNmUHFyM3Ntd1lxSWJy?=
 =?utf-8?B?MGFzYmlaYmNtTjA5ckhOanhGRXVTazBiamxSRzJPRUpoaDZ2b2tNZ3dlak1Q?=
 =?utf-8?B?RDgyVUpnVUttWDVZNGRoUHo1ejg5RjhDaDVaQ3NUbUdncktaRHBUVjN2NVhy?=
 =?utf-8?B?M3RwbVJrcXlWc0dzWFRYMzY1OThyWTVJQ011cHJ5SkJaSDZCd1IrQ0JoWExs?=
 =?utf-8?Q?p9dCT6T9+VXEhh7QFkg9kpg5XWF54UOU?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WGhhK0hxekV6UTA0bXR2alhpVFcvYTJoSllqVW5vUWdHRVNLZFdkckg3ZTZY?=
 =?utf-8?B?MUlSWGhlUlU3RnYxa0sxTFNnYnM1TzZkQ2o5dG9sOGNDbGQvSXFiUWNPbmkv?=
 =?utf-8?B?aDJwcXVLaVVtSHptUHBEQ3JYU05QcUtXUjJRVE1NTVJBK2EzR0t0WnVlZkJq?=
 =?utf-8?B?V3gxVWxkb294RXpPT2lSWFZsMHVTRUxTbXQ5anVYOUlTbDlEZlBlU3BuVUF2?=
 =?utf-8?B?U2kxWXM4MGh5MytJK1VQbFJyOUVnbXFJbmxSNWtvMHlPZ3JBUDQreWd2eGgz?=
 =?utf-8?B?UlVWNzhFSU5SZmJ5OUE0cXFqcVJKSDBabmZoc3dPSWpGbGNYNmErZFRPT080?=
 =?utf-8?B?dFlKWklkdUpzelVSQzFUUHg2VjlwakE2amhpSitQSnMyMUNiamZKTGdhaGxI?=
 =?utf-8?B?MTBVaDRvM2pVMGZBWHhCbEtKTC9BZkFtSWw0WTJEV0trSm1LQzltZXNtc3g1?=
 =?utf-8?B?ZVJkUHhMVVFTbTNKMDdReEZnYjdKK2oyQTBPTms3N2xyU3F5aEpnL0lrZFNF?=
 =?utf-8?B?ejFycUdDUjlHc0swM25mVmN6MTEzdTNudkcvNzN2bTZuRXRIRk9ZMmpiRjJN?=
 =?utf-8?B?ZGp0V2JtcnI1S0hidjhtMzJJcWNSb0QrMW1jRjVDWFQ1T2J1N2dJV1dBd3la?=
 =?utf-8?B?K0wzMXBqS2N4bCtTN3ZqRkdpNlRib1h6bkd5czRqOVlmWHdpbmdFUTJLNlll?=
 =?utf-8?B?ZTZ5NGVBU0ZHTjRxcDc1cFozTFg1UXZJZm54alhCWU9OYnU4NmxaNXNmVDBQ?=
 =?utf-8?B?am5DUTVwV0xWelkwby8ydnRsbEE4Um5sanZramNLNlBIVGZoQ1R3YTQ0cWlq?=
 =?utf-8?B?RFdmdE5FejRIVjQyc2RCRGxNMDUwRTJCTmtyeHZSVzZtY0tJazk0eHlUNmxM?=
 =?utf-8?B?aGp6ZWRSVFZwUTFZenpSRTBQeTkzbk5RSUdQTTZmVzdQYWY0NjFSRzlNaFpK?=
 =?utf-8?B?Zi8xeHovTllXYzZRVEhCaWYweDVDMkRhWlo4aDFrT3JYd2xNQUQ3cHRmMVRs?=
 =?utf-8?B?RWNKcnRWQzgxQ2d3UTA0RjJXNloycUE5MHYwa1J2Q1EzM3JMVjAvR0k0ZktJ?=
 =?utf-8?B?dXpONTVVc0Z6M0NmZE1SYWVHOHRFMXBvRGhWMm9UaExMN3dVaklCNjh3bHhL?=
 =?utf-8?B?Q014aFNRbmMyeHhyY0ZFT3M2Z3RCaHVjNnpYRHFXa2NGTTVEWDdRNzNFMmZP?=
 =?utf-8?B?R045OS9NM0x5ZW9CRFpUWmlzUGF4NUFwTTF1dDlIL3Bia2x2aXpEN1pBc0x6?=
 =?utf-8?B?amNvbGJwd2lRZUVES2hXeVV3QU5KeDJNbnkrY3FUM0lyeVZLTnpscnQzZnFm?=
 =?utf-8?B?SXNWbzBRTEpSYS9mVk52TytWdktJMXR0ZmV5K2dHWk01YW56WGFHMXVZV05W?=
 =?utf-8?B?ZWlRS0IrUVlaTUw3TVhqaXhNOUlnRnFVL0MwMFNaT1E2UGwrYzZON2xvbnkw?=
 =?utf-8?B?WkN5RklqZTNXc3VSOWtRdUUrTDFxMWVtSGZkTUpJYkJJVk1OaVd3MHIwaHFT?=
 =?utf-8?B?SG1sSFh4d2JHcXIvQUx0ZzNMZmJ4RFQ0Q0JVdGRJZFJHekdpQkxNUG1mdm5U?=
 =?utf-8?B?MWxPcmpmeW1XQ2NNUy9zenA5ZHdtQkwrOXBMN2FVeDVYMWxxb1VuVCt4N2hq?=
 =?utf-8?B?dFFUNkdVaTB4d2IxeTdDQnhxb2RWS3ZZRGJ0SndlT3paTC9tRUo2SnE5RDhD?=
 =?utf-8?B?WGsyN0E2NHRGSTc2bXVXbE5HUFZ5aitaZk9pSTBVZEdGYS85NHFhdS9iUnNq?=
 =?utf-8?B?NUtQZXFxMjRlcmZRK2kxZGI0WUx5cGtuTkcwcmt2em8vZnNzRTBmTEZsemg0?=
 =?utf-8?B?bW05SnVZbGp4bnMrTzlqZnB3K0NiR2dWaEhobWNGR1IzcHBxNW02azFwRjgz?=
 =?utf-8?B?QjNoNDVwWUNNRjRxWW03U1U1ZlNJdUJWK0p6V3poa0VHNWRPMGhncFZVZUVW?=
 =?utf-8?B?Z1BqajB4dksrVmdJK1hkVkNNVmZ2V0t1K0pLd21HS0NFLzhTbUhwS0tvR2JS?=
 =?utf-8?B?VlJWZE81ZVJHSUpuQk91ZDBtVS81TXVKQnpDVmFIODAwTEgzR2xUdnpMazVx?=
 =?utf-8?B?dXp0bktWekQwVHR6Y2YxM09IVVA1KzM1SFppQW14Ry84WlJMRGswSGRQN2VE?=
 =?utf-8?B?NTc2R1pkREtiWFd0N0tEOHowK01XYTY5cUhxdEp6S1RQcUxLMElPaEsxQXpa?=
 =?utf-8?B?NUpGd2U2NDJUTThhSnU0dEg5LzF3ek5PdDdjbzh5RDlSdXRsV002QUVLbjhV?=
 =?utf-8?B?dEJoZ2xBdVpOMlFkcG5JV0t0V08yR3BTQ29lZ21SOW42WTZKT3R0Y1Z6MUk4?=
 =?utf-8?B?K1JUR1NZK2QvcDJ0NnBkYVBkWXF1T1VzRU8rWDRQdVV4VlpKZGpOdz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb17651c-2ede-4372-52ce-08de52331859
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2026 23:34:13.9952
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tmOfqo46R0+4f8Lsm6TWLSCQe/ALeWSeK2Vr/nnjrbWukxXmWusXjhHp626HyIBP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB8531
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 12 Jan 2026, at 14:28, Jason Gunthorpe wrote:

> On Mon, Jan 12, 2026 at 01:55:18PM -0500, Zi Yan wrote:
>>> That's different, I am talking about reaching 0 because it has been
>>> freed, meaning there are no external pointers to it.
>>>
>>> Further, when a page is frozen page_ref_freeze() takes in the number
>>> of references the caller has ownership over and it doesn't succeed if
>>> there are stray references elsewhere.
>>>
>>> This is very important because the entire operating model of split
>>> only works if it has exclusive locks over all the valid pointers into
>>> that page.
>>>
>>> Spurious refcount failures concurrent with split cannot be allowed.
>>>
>>> I don't see how pointing at __folio_freeze_and_split_unmapped() can
>>> justify this series.
>>>
>>
>> But from anyone looking at the folio state, refcount == 0, compound_head
>> is set, they cannot tell the difference.
>
> This isn't reliable, nothing correct can be doing it :\
>
>> If what you said is true, why is free_pages_prepare() needed? No one
>> should touch these free pages. Why bother resetting these states.
>
> ? that function does alot of stuff, thinks like uncharging the cgroup
> should obviously happen at free time.
>
> What part of it are you looking at?

page[1].flags.f &= ~PAGE_FLAGS_SECOND. It clears folio->order.

free_tail_page_prepare() clears ->mapping, which is TAIL_MAPPING, and
compound_head at the end.

page->flags.f &= ~PAGE_FLAGS_CHECK_AT_PREP. It clears PG_head for compound
pages.

These three parts undo prep_compound_page().

>
>>> You can't refcount a folio out of nothing. It has to come from a
>>> memory location that already is holding a refcount, and then you can
>>> incr it.
>>
>> Right. There is also no guarantee that all code is correct and follows
>> this.
>
> Let's concretely point at things that have a problem please.
>
>> My point here is that calling prep_compound_page() on a compound page
>> does not follow core MM’s conventions.
>
> Maybe, but that doesn't mean it isn't the right solution..

In current nouveau code, ->free_folios is used holding the freed folio.
In nouveau_dmem_page_alloc_locked(), the freed folio is passed to
zone_device_folio_init(). If the allocated folio order is different
from the freed folio order, I do not know how you are going to keep
track of the rest of the freed folio. Of course you can implement a
buddy allocator there.

If this still does not convince you that overwriting an existing compound
page with a different order configuration is a bad idea, feel free to
do whatever you think it is right.

Best Regards,
Yan, Zi

