Return-Path: <linuxppc-dev+bounces-15552-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 00871D14D1E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Jan 2026 19:56:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dqhRb2fR4z2xKh;
	Tue, 13 Jan 2026 05:56:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=52.101.201.67 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768244171;
	cv=pass; b=eKqb57ddWN/mkNf65n7sG+usdqiX8aU5H2dJ9FAZjfwiYy7efizYH6+FxkdfYSfiJF8d2VpOYvXpPnpTjndP08ZW2OcRzfNuP3qXIRaucvRQV2F+M4YDgipJWOmNr7b/ueY8mLJHOEvcFE6LpqhT7F2o37VZfIOvQch/EYt9fQaKIbvdTgJXP4UrQitNAMg48jw/Sgd5Te38bgYU8ZcxaPHO5FDgfPeujstAoMtgov9DGO1za3Tl2M673REI5YefntkMdO0aLdsqLmiHnqg0YFaE4cBkvr248lf/JrNzldlNBUNGdVRaQDW+xGZGCZ49yYmG/3X2TWfC5yJWQxAlyQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768244171; c=relaxed/relaxed;
	bh=gK8vzHUnwD+6FB+QwLUb0rC0tZs2DwoXrekFMUNXdV0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=I68TQ6M3k/Oalmg4Lmg8mryfbiZndQpNu2dDOtDmCc5h0eqEoXROOezzUHwgmA1SykgH7gJoXkRiPraSph3HDoVQM9thhiWjRB2C4CZGSyiKPhIePgCVb3yIuUaByplQRIScZxDlc1Oy+05aJzbu8kj1V51TKn4pZm7dzujhp6mAWHhnvEIANW3bZj/3Z7R8FkUU26hqXLF7Kjvbq1i2S5SFLU02YrFVMCH/qqHipHRT6da4T1I6ygCrLJDjUOBYzpWYSjPNUQ33G08eBX/tF73eQRzU/2nkJs8413uHBLwxIUytxSJrtUmVZh8EceZqF+j0QfMtUTrq8DcybwfzhQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=erZJyCR4; dkim-atps=neutral; spf=pass (client-ip=52.101.201.67; helo=ph7pr06cu001.outbound.protection.outlook.com; envelope-from=ziy@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=erZJyCR4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=52.101.201.67; helo=ph7pr06cu001.outbound.protection.outlook.com; envelope-from=ziy@nvidia.com; receiver=lists.ozlabs.org)
Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010067.outbound.protection.outlook.com [52.101.201.67])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dqhRY6Dnyz2xHW
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Jan 2026 05:56:09 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c1kLXLQUg3od2EB7AmyE2jJ9gp7phze9w18ZTQAExTAgPjXGYdaSBkyxUhYJYDmEO2pLD796gQN3GK/CGVix3JZxEgddhjiGF5gysc6E5TLlU7NdgbTBYYv9tTHpzSuf6kYGwP64UtYjzJnp0ClLK+qcTxwoCEJGvkbvYDdAuOFKWyl8WfzYRi/cD5yTUi9ngvA6HEf1aLXXrotLN0B6vC6JOBVvuBeSnHW9ZGAtMLi8aOgn9YP73nKhDkcjFMzoE9G7qKDd3SaJkeSTyEbj+aIfrl9l52oALZqKsuDRREKKcDpibXIKrBhjsy1YPklbWaS1nw/k9sAZ48kdddOdxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gK8vzHUnwD+6FB+QwLUb0rC0tZs2DwoXrekFMUNXdV0=;
 b=aqdHDvL+L4luhnw/lJliDJX0qXLC9zytOCGAE8D7GzF+hJvv+NElKiR0RqZA92si/wyXCBVbTls4r2HpjpxuAUPzVLzCH9FlifPwVbnYbSkP2AA/1p0yEyGniTfEWKSbCOfOOsH7gpVI3wPE8pIToQYUEXT8N7o5v3w8ED9wYVT2/bbEgkPG+VxiC3UD+QzIE7FrnODGsGG9Ma+mY4v2uA5kBBW9G6XAr4AjodsHxiwo2W9ZqqI1yHfESIo7AT6i9QAD0PRuLOxSnHw7yd3blGbvdir78mfFant+xkUnKNSEulvPy9PkABzhjhFOwCUck1dStaoyrQ8Z8UfXJDlC1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gK8vzHUnwD+6FB+QwLUb0rC0tZs2DwoXrekFMUNXdV0=;
 b=erZJyCR4ZF4r0SDhS3ODmX0+vU1hB2zRv6wOna9PsVP33uoKgof06+KQ6lSW6gBvxL/dN+Jep/KI68LFENg07qlSyFU0uMR/JTkHgVZkcQMSDvtoKZSZM+cHtL43CmCXcSCOJz6IAFcGbm+L6XDSnQcTa6dql1nS3pljotME0fWp/h0JgwrGeJ52s+FfgD+Ow0yk36gbP0UDX/s9+cKIlZcffaQvr91RcTLYPHezG5elCsxqyXV/TDWJL0n8jTRxWxA7BXVZcBBHmAm0sZKtb2PDQAxEinw02NpzJmseDl7LD9gj58gUA+Nz+xpsxPHx8azc3Orvoz4soECbTkL4dg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 PH8PR12MB6939.namprd12.prod.outlook.com (2603:10b6:510:1be::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Mon, 12 Jan
 2026 18:55:28 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%5]) with mapi id 15.20.9499.005; Mon, 12 Jan 2026
 18:55:27 +0000
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
Date: Mon, 12 Jan 2026 13:55:18 -0500
X-Mailer: MailMate (2.0r6290)
Message-ID: <6AFCEB51-8EE1-4AC9-8F39-FCA561BE8CB5@nvidia.com>
In-Reply-To: <20260112182500.GI745888@ziepe.ca>
References: <20260111205820.830410-1-francois.dugast@intel.com>
 <20260111205820.830410-2-francois.dugast@intel.com>
 <aWQlsyIVVGpCvB3y@casper.infradead.org>
 <874d29da-2008-47e6-9c27-6c00abbf404a@nvidia.com>
 <0D532F80-6C4D-4800-9473-485B828B55EC@nvidia.com>
 <20260112134510.GC745888@ziepe.ca>
 <218D42B0-3E08-4ABC-9FB4-1203BB31E547@nvidia.com>
 <20260112165001.GG745888@ziepe.ca>
 <86D91C8B-C3EA-4836-8DC2-829499477618@nvidia.com>
 <20260112182500.GI745888@ziepe.ca>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR05CA0004.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::9) To DS7PR12MB9473.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|PH8PR12MB6939:EE_
X-MS-Office365-Filtering-Correlation-Id: f7b70f56-7404-498e-176a-08de520c26bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?andJVlVYVEkzZkpLRTJIckk3VHcwLzZpZXQvSC9aempEa3BTQ090cjVTWTZ4?=
 =?utf-8?B?ZEZvbUJuV0ovUm5CV2V0YkV4UjBkTzh0TUVhMHdhVkxlZkhXV05yYVUva3hs?=
 =?utf-8?B?eFBwbWtFRzNpZE1ucVdyRy9JYWk4OXBlcE5oYWJyVURlT3dONDV4M0ZqSGFu?=
 =?utf-8?B?NzA2ZjZ1VEJsd2YwQWhBN0d2ckdKc2h3SG9pQ2w2WHdKdGpROGZxNCtZWHll?=
 =?utf-8?B?cVB3VVd2TFhaSkpobm9PODRaY3JmN3dnc1IzQWptTUNuQzBqK2o2UXdMZlJB?=
 =?utf-8?B?SjBzbTVkRzBpNllFa0RMV3Jra1dCWVFPN09FWm1peWk4RlR6blBEcEFJQU5F?=
 =?utf-8?B?eU5OWnVFOXFtZGtCUWJBOHMvSzlSclpaRmJnS2YyV1EvSG9EcHhuVlNkYnZx?=
 =?utf-8?B?bHFmL0FBWmRoQ29JTTZGbTZwUjNlWEI1c2FxckV5Q0hLZVJuS2dxN1dMcU0w?=
 =?utf-8?B?aGZ4VGo4UUNZblVPVnlWK0VJMXFKMkRSblYrbWhnVUZOSjlhZjVtejB0eFVE?=
 =?utf-8?B?Wk14TTFTZXdFaEJMTWpBTXFITXhLcGpEUnVYYzRNR1VVOWVyVWxyTHlabENw?=
 =?utf-8?B?bFBJbWpyc29BeFpUS1RUWllTTUFVSmNUdE4xeUxTWTZ4OFZaRG0xTkdrdmgy?=
 =?utf-8?B?cjZ6bWJkejhsdkhTV2NiMHA4MlpHU3pjVGhuQkw0YXhRUFVoSlJkYkZxbVkw?=
 =?utf-8?B?bkRpVityckMxbU92Uk0wYU5FdHJGY3JqTXEzcDF6LzJLOS91QmxSYURxVUJZ?=
 =?utf-8?B?ZWx5ZTE5Y3RobTlWZkE4ZU01YU9yNWJjalRWSTRXVituN1hiSTVGY2w0Wkww?=
 =?utf-8?B?OGJ6S0JwN0FMYURNcHZTS1FOZmVvQWo0ZjBMODU0OHdQckxwUUhGL1h3ejFN?=
 =?utf-8?B?RFhkT091OUkrTHd1eXNFUVNURFd3SUoyOUVLbFhPUUgyZzZOTVdvYkZqUjMw?=
 =?utf-8?B?aTBTS2s2Wm9wYzZFTVRsN1Q5WmFyVEdGSkpxWVVlMDIrbGF3Zk9vajlzbi9h?=
 =?utf-8?B?cVNtbjJJQ01iM05BMWNsQ3ZlUUVRM05QY3Q4a1g1SUhGRTBYWVd1OHdSc2Y0?=
 =?utf-8?B?Q0lrdWVaM0ZMZzQvaGVkUGdUN1pId3ZoVVdWYjJneXFxdk9NTXdrK2JtN2lF?=
 =?utf-8?B?cjNSZVM5NklXMjJrc01zbk1yWVVaTVdoMW9uMDhjTkdQM09IYTJQKzVkbUE3?=
 =?utf-8?B?VDgrUjgwVEZUaEhENW1xemcybThvcFZld0F6bkF2dTZldnZ3ajlLT0pDWjMv?=
 =?utf-8?B?cENnNmNjcC9mV0EvL21FWVNENDNwL3g2QzZvakRnaEZsQTBmSnRFOVRSTG52?=
 =?utf-8?B?T0pJZ0lOeXplUjY0Vi8wTTZrT1BPVlB6WEdDSmlsV3l2WVhXNG9zTEVrclNu?=
 =?utf-8?B?TTd2eGN0ZGthRDNMU1Z5V0dXOE1pRVVlbDVsSFQ2V0czcjR3UklLVHU5WW9R?=
 =?utf-8?B?TVZPZkxRRnRRK0lIZFVIZjA2a285SEtxYm42NFRlRXh0ZDFyUkhZMU5oalp1?=
 =?utf-8?B?UUordzh2TEd5dWs4eFhEaFY2b29UV2VwWThlZVBuTDNCVUVxZ2lTbnY4aGZB?=
 =?utf-8?B?UTRZQlNERmlnTkxCTkhyMmVpU2V5WUdlbXRwMkVObXdQRnFuWlphT1BqNTUy?=
 =?utf-8?B?S28zcVpGODBIa0U4dDFKTHBzNjEzRVpQYitENkIxemFLaWx0dldkYUtVdXM5?=
 =?utf-8?B?aUNLdFNUK2l4cmNtUC9VVDdPSHZJVnVhTzRXM0NMUTNUWnd0Vmt2VU8vbnRY?=
 =?utf-8?B?Q0JJU2wzTGFydmlGc2hDeTNUUzVma3dVdjJEY2sxUHp2a05rQ3p5cHphK0dC?=
 =?utf-8?B?cUJ1SVVGSFFMTDhEQ3B0VjQ2WkRWRXJrcEQzdFduZE5Nb2kzWnFDZGRJMVBF?=
 =?utf-8?B?WmpWV3A3MTNXSHVxUzRwU2pscUtBN1QzUEoxNG0zZGI4TjMzbmM2OXdQMVY3?=
 =?utf-8?Q?tlbg2fuDCxa7tXvaATu5EfTUVymZuihS?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VzJRMVNiem9DMEU1L2UyTDRHMHFmaGlCUVNFKytSM3NUU3huTXVla05LTXpZ?=
 =?utf-8?B?WWh1ZElNM3pJOFp5eExPYWY3M1Y1ZWIvNWg5UURVZEN4MFFmSExUOEZzalho?=
 =?utf-8?B?VWZLL2VWcnhxd3ZiMmJXcEVyVHNLdjVJYVU0MmhWRjlpNENVeDBnbkgza1VN?=
 =?utf-8?B?RG5CZllRd3d3RDNTZWNRVVVheXA1a2dEQlpONUpxZkRqdnFkY3U4dkZNcE1S?=
 =?utf-8?B?aVVFS2tNQ3p5ZU5BK2daOHhFRHBWQ0ZtUm5WU3ZhSjRWRHZINURKNWlpNGlE?=
 =?utf-8?B?KzdsQzM1UGxUMlV1K1hJK2p3eHllcnBSaVZUUDdub1FSWkFPZFJHOWFEcEht?=
 =?utf-8?B?c1lLSHNhZXFDcjY2a1JUMWR5bkluREVsTERBS2V5dlRFVE85ajF5V0VzTVBt?=
 =?utf-8?B?Q2MyRGVFdmpvOFFvWHFCWjZTR09BOStLT21EYWdEbkg0amgya1Yyek8xL3pp?=
 =?utf-8?B?b01FeFg0dUlISWNZelBzQVFMa3FTUmc5a2U2bGhWNGJHOEw3OXlVQTZGajRo?=
 =?utf-8?B?ZGRTc1JOY00vcktjWVg5L0hGbmxWN0hGREhmR3YwOWdrNHM4Mm96Umhuc0Mv?=
 =?utf-8?B?aUZPRWVvc1c4cWJOU2Q2cFZHZ3RITEdSTC9JQ2F5UEZIRTFDbXpaanNnSnh4?=
 =?utf-8?B?c01BdTlwVmpMYXEwU2NKbGJlTS9RQzUwQVBXVFhUaWJqSWdhbDl1SWpNM0sy?=
 =?utf-8?B?Q2xiUjI2d2t4YjJyeUhIc2gySTIyZFV2K1lzK0poTERTSTQrK2lsd2JvWlRs?=
 =?utf-8?B?cUx5UGxWVHl6MWVIY21yZG1LK2RxSWxWc1pRYVNmSVh5NXVLTXduUmZZMnlH?=
 =?utf-8?B?MUFTZkIxV2VINmd2b1RleHVBb3FHTTlWZHBOc0VuVEsvTWhnb0o4OHFYTDNv?=
 =?utf-8?B?dng4bXdyT3RWbUlMN0M4ajI3NE1OcUFKdFBGUkFpcmswS21nL2FvbzB2S09I?=
 =?utf-8?B?UUczVUlDUGcxY2FQcVlCd0RLcVlmaHRSWWM2azdCMHN2ZXRoT1grS1JrV0RW?=
 =?utf-8?B?QlpSNndtaDJTRzZDOXhCajJ1UlpVd3FxYzRqVXYyaE9Ca3BmellhRjdXY3lE?=
 =?utf-8?B?Y1VQeHVJRzVwSU1hOVRIdkMyL3dzUUg1ODBFNEMzYzRIanZqLzZpZEhaMlR0?=
 =?utf-8?B?TWdNYzg3NXdDVlpMRCtEbDJjSm0vYTJ6V3Z2WmFYTk96MlM3ZHcyZmNkcHZQ?=
 =?utf-8?B?MGVhL1lqdVlvanc0M0FlMWFsa0JiTmJ1VlhjVTAxMVRXaWRvUDNydU83Y1U5?=
 =?utf-8?B?blpmVENOMGZ0bVZ5QkVFNXpLd21rcDl5NDZwMHFFeUMxSFdVU2hqeWp2SGJx?=
 =?utf-8?B?U2RsdXVHQzhKSWFTcDVsUy9zOVRFVm5EcWFqcGZydlJ5Zit3Q2dkc24wUlZa?=
 =?utf-8?B?cHphbkV0blZEUGVUN0d5bXVQS0N0VmtTRTVkZVppdmRqeHcrbVF1ZUYvNldN?=
 =?utf-8?B?cGhtQitiS1J6eVFGZ0ZVL1RqOGF1NnhUZnQ0d0hmcHczNUhObkxNc3Q2M1Zw?=
 =?utf-8?B?NUFvbWlNRi9LcmxNMm15N2pWUFg0dUpEZW1jMC9wNi90ZXVWNlVQZEJMN3Fa?=
 =?utf-8?B?a0p0MXdjcW9kM2M3N1JHa3ZGOVhoRCs5Rzh2MzZnMlgwMCt5eFF5djBBbS92?=
 =?utf-8?B?cnFSNHFzRDU5Rm9lSTlhL0w1bFRtZ05nMzdhcVZBWE5ic1dYZncwQlpKVXpN?=
 =?utf-8?B?cTNEbmVpUlp0ZlRiMkhLdnFHUFhUc1VkMVByR05OclZxYURVKy9kcXFTSXY4?=
 =?utf-8?B?cUxCWjFLcWhXOHhQVWl6NmpIdjhoMUE2RG9LM3psRnM4cFI5M3hXRWs5U3N2?=
 =?utf-8?B?YzV0UWtpN3hYajl3OEZ3QUNIUUk2Ukx4aEUyR01OMHVJb1lYNjdEaEd2UWZs?=
 =?utf-8?B?TFh0YWZPdnU4NEJxM1J1RlNIMER2dDZuVTRRVlRKTEt5Y0h2WVdHSFRxVk9i?=
 =?utf-8?B?eXBaRVRkai83bkozU3VTRU9BWk1QSWN2TFl6QjAyMkIwSGMxYiswS2I4Ym5F?=
 =?utf-8?B?WGpNOTZLbzRIeFU4SUF3SEZEWkp1VmZwM1RJR2RoRm1tOEYyVTVxakZNK1Bv?=
 =?utf-8?B?Zmc3djZhVTNtNExZWm5YYlFJRGdubzdTZUc1Qmx3bS9QRXBnQUVCQW9XNnVD?=
 =?utf-8?B?TmdKUWREb2s2WmEyS1lvcE9ybzlubWhwZTFaRTZHRGRaaDBSV1NKZDNVemJ2?=
 =?utf-8?B?WWEycmRxcWFqUXZBbVhVbTN5QUNSdW5qQjQwd3hKNlNBeEgvdmZhQ0dQeDFY?=
 =?utf-8?B?TEFRUDhuUzI5bktBUXZuNjFYQUxDSWY3dmtMMDhydWcyV3lEbzBadjJNd1B6?=
 =?utf-8?Q?2+SHQQIbzWl8LDlhs1?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7b70f56-7404-498e-176a-08de520c26bc
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2026 18:55:27.7629
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m4b0taNI8rzeWYloiVYohOhjjVqU5nlsn/JuxNjI4yXDT/BNbvQTt4Bxk+yGS75i
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6939
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 12 Jan 2026, at 13:25, Jason Gunthorpe wrote:

> On Mon, Jan 12, 2026 at 12:46:57PM -0500, Zi Yan wrote:
>> On 12 Jan 2026, at 11:50, Jason Gunthorpe wrote:
>>
>>> On Mon, Jan 12, 2026 at 11:31:04AM -0500, Zi Yan wrote:
>>>>> folio_free()
>>>>>
>>>>> 1) Allocator finds free memory
>>>>> 2) zone_device_page_init() allocates the memory and makes refcount=1
>>>>> 3) __folio_put() knows the recount 0.
>>>>> 4) free_zone_device_folio() calls folio_free(), but it doesn't
>>>>>    actually need to undo prep_compound_page() because *NOTHING* can
>>>>>    use the page pointer at this point.
>>>>> 5) Driver puts the memory back into the allocator and now #1 can
>>>>>    happen. It knows how much memory to put back because folio->order
>>>>>    is valid from #2
>>>>> 6) #1 happens again, then #2 happens again and the folio is in the
>>>>>    right state for use. The successor #2 fully undoes the work of the
>>>>>    predecessor #2.
>>>>
>>>> But how can a successor #2 undo the work if the second #1 only allocates
>>>> half of the original folio? For example, an order-9 at PFN 0 is
>>>> allocated and freed, then an order-8 at PFN 0 is allocated and another
>>>> order-8 at PFN 256 is allocated. How can two #2s undo the same order-9
>>>> without corrupting each other’s data?
>>>
>>> What do you mean? The fundamental rule is you can't read the folio or
>>> the order outside folio_free once it's refcount reaches 0.
>>
>> There is no such a rule. In core MM, folio_split(), which splits a high
>> order folio to low order ones, freezes the folio (turning refcount to 0)
>> and manipulates the folio order and all tail pages compound_head to
>> restructure the folio.
>
> That's different, I am talking about reaching 0 because it has been
> freed, meaning there are no external pointers to it.
>
> Further, when a page is frozen page_ref_freeze() takes in the number
> of references the caller has ownership over and it doesn't succeed if
> there are stray references elsewhere.
>
> This is very important because the entire operating model of split
> only works if it has exclusive locks over all the valid pointers into
> that page.
>
> Spurious refcount failures concurrent with split cannot be allowed.
>
> I don't see how pointing at __folio_freeze_and_split_unmapped() can
> justify this series.
>

But from anyone looking at the folio state, refcount == 0, compound_head
is set, they cannot tell the difference.

If what you said is true, why is free_pages_prepare() needed? No one
should touch these free pages. Why bother resetting these states.

>> Your fundamental rule breaks this.  Allowing compound information
>> to stay after a folio is freed means you cannot tell whether a folio
>> is under split or freed.
>
> You can't refcount a folio out of nothing. It has to come from a
> memory location that already is holding a refcount, and then you can
> incr it.

Right. There is also no guarantee that all code is correct and follows
this.

My point here is that calling prep_compound_page() on a compound page
does not follow core MM’s conventions.

Best Regards,
Yan, Zi

