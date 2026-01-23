Return-Path: <linuxppc-dev+bounces-16241-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0N0cJq6Dc2kDxAAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16241-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Jan 2026 15:20:30 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EF60B76EE3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Jan 2026 15:20:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dyKpL1Drhz2xdY;
	Sat, 24 Jan 2026 01:20:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c10c::1" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769178026;
	cv=pass; b=GgT4paGcXGXrPpovkVI4Waztww9u+dY3zigRsVnB4PlzxjRDUE1xYtRPFC7MF7sWZKhnz7BixRMCZypeiRwcbHt9hbNiHSZuSYT1k3lYG380T6H3vga+hnMEH18K1aXJbQPId5tNtXvav0s57Vk9bnzWyUOP42hcN8rNYJ1KCKWqgcRYEvILbA8v136WGKbw1zJqCtHld34aSnIP6Ba5Pz4gSEV+u3ZYUMdgnhzrQHWfCk9Ijatzl8am0zHg5YpB98KRDEXDNiI++sSSc76Vxl+9G3BMdkeEchEufIY3i5eu+lkUY5dIPcAMtmtCEVeJSh2cm3DQM7BKAyKuuy0tCw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769178026; c=relaxed/relaxed;
	bh=8JTaNeQL/J3Ep2HYkEXMoLwLL3wNRp+4crnhYhLek/Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=iy1Mj6HsXiDTybSCF3z/inzf/1HECZVnR25EIDiS1lI3CJOqZvtopQ5C6lSR1yU0lcuQpRtvYu/LeTT6tdQOtilNFEfPvkWSO4HnoUnc/Lhh1oMlp1Q1ASRaEiM9ZOiEdAPoT8tP1LunHmDlNVdYD8inrIXIJRhfS2+24wrKbA3uD7fqXSAjcUtI7hdhYsKgYYwNrG7Hf8d9al4i84zY+AKEN0KAXLJgUB28cYPAEU9p5Ec/HIWx2GszCdoxyHEWAasH2MRFJ+iT+VFQ02kILGdNQngP/6hzODxeD4QtmM5059MjgaSBdIF2fFpRbAdPe7J9EwyXP3or9Ka2Vfmruw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=el7vGzH0; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c10c::1; helo=sa9pr02cu001.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=el7vGzH0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:c10c::1; helo=sa9pr02cu001.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazlp170130001.outbound.protection.outlook.com [IPv6:2a01:111:f403:c10c::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dyKpJ3m1hz2xHt
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 24 Jan 2026 01:20:23 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p8SO+JMQwEqTjgmDXJFNi5nW4kAIjY8jCG5P2YqmLgqJtGPSwmQ97KEhq1smDrxbnfkytcqAumb7fet+uzf0bLzymVRudDYNILai0Oo21EDpXjWjcUGNMHTBxrcx0cdC8abjmHvfItou0wn+IuuOvqFnrmQ8CqaefbzzIWazYIZRHgcgBS1s/KtbvXeb+/jIbBPGdpBF7vWoYe0J1g+XZi7RDztgEy0hsE6BnI3jNXKJV4CJlAx3ntAPp2Ufw+dUA3ZfXZ7o/Z8CjVpTfXI9jiJcY2GFu6H8YYg0NMQaMXNSbSnyqCAZdxd+Y139M0MuM+NAvzNtQcSVZzAkqfcJnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8JTaNeQL/J3Ep2HYkEXMoLwLL3wNRp+4crnhYhLek/Y=;
 b=WWI9TKBqw+QuSVFM6cFcAeat8S9kEBp8qIwozYnVCf3x8MuVBfvN+QcSPwxXLAX0B0HgXEZKj1wYWRfOCCJus+6xNZq3I0jzt13TeD4B2GxBxUtkA7KC1TijfJHlJ8HGYj9iG0lLC1aNcPQOCZwHU2iFfvo36ezvb4Zr8X8ih2CwcIxWuPKWhn5wxsiYjJDWO0sML3QiSrS2ndE7gZQXVviT6lEXKcukCdVgqVoHkTVhBjS2XfddnRxGYMoFJJAVCq7lU94aa4tsC+LNgAiDTM8IRLhuNw3p38Ba2Q9YfoopU8PZOL+hgl5vtKAcbhNO5porG2ZPD08VeQLkEr3VQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8JTaNeQL/J3Ep2HYkEXMoLwLL3wNRp+4crnhYhLek/Y=;
 b=el7vGzH0seoDPX5Tseb3Y+Y5unxv8q9f7dXRrgQhQw/B4IPvWeX102ztEeH6hBk7/Nk2ULkUVW40DjMCnBaLYq6iBZPQemb8MbDHPnh4dLQkNSLAMCBRFk4ZOQYvH9wZqteBvYFHurH7z9Q2GX5ZGZbZ3BYgBmeaI+7czXnUr3f2xnyTd1wDAWeNqO1ZxUI+p37Qt2hQzmFUUyKqyjcEGCyEGgqIQYJ+PiDDw12M6ZNd7lW1I5toQuckiSySBNFBEhIZ0g8GKp9EbX1cb4NhcQwzq00acVO8Y1R4/mo8olflCqQaJSvWtHtP1tZbCHhZQmKRylxM+dBFjWmadu0Cbw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by BL4PR12MB9481.namprd12.prod.outlook.com (2603:10b6:208:591::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Fri, 23 Jan
 2026 14:19:57 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::1b59:c8a2:4c00:8a2c]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::1b59:c8a2:4c00:8a2c%3]) with mapi id 15.20.9542.010; Fri, 23 Jan 2026
 14:19:57 +0000
Date: Fri, 23 Jan 2026 10:19:56 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Zi Yan <ziy@nvidia.com>
Cc: Balbir Singh <balbirs@nvidia.com>, Matthew Wilcox <willy@infradead.org>,
	Alistair Popple <apopple@nvidia.com>,
	Matthew Brost <matthew.brost@intel.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Francois Dugast <francois.dugast@intel.com>,
	intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	adhavan Srinivasan <maddy@linux.ibm.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Felix Kuehling <Felix.Kuehling@amd.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
	David Hildenbrand <david@kernel.org>,
	Oscar Salvador <osalvador@suse.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Leon Romanovsky <leon@kernel.org>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R . Howlett" <Liam.Howlett@oracle.com>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, linuxppc-dev@lists.ozlabs.org,
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org,
	amd-gfx@lists.freedesktop.org, nouveau@lists.freedesktop.org,
	linux-mm@kvack.org, linux-cxl@vger.kernel.org
Subject: Re: [PATCH v6 1/5] mm/zone_device: Reinitialize large zone device
 private folios
Message-ID: <20260123141956.GZ1134360@nvidia.com>
References: <4k72r4n5poss2glrof5fsapczkpcrnpokposeikw5wjvtodbto@wpqsxoxzpvy6>
 <20260119142019.GG1134360@nvidia.com>
 <96926697-070C-45DE-AD26-559652625859@nvidia.com>
 <20260119203551.GQ1134360@nvidia.com>
 <ef6ef1e2-25f1-4f1b-a8d4-98c0d7b4ad0c@nvidia.com>
 <EE2956E3-CCEA-4EF9-A1A4-A483245091FC@nvidia.com>
 <20260120135340.GA1134360@nvidia.com>
 <F7E3DF24-A37B-40A0-A507-CEF4AB76C44D@nvidia.com>
 <20260122154646.GQ1134360@nvidia.com>
 <1EA077E1-DDF1-4356-B8F8-CB13F0D6D8B5@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1EA077E1-DDF1-4356-B8F8-CB13F0D6D8B5@nvidia.com>
X-ClientProxiedBy: MN2PR15CA0064.namprd15.prod.outlook.com
 (2603:10b6:208:237::33) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
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
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|BL4PR12MB9481:EE_
X-MS-Office365-Filtering-Correlation-Id: 6790f142-049b-4a0b-522c-08de5a8a7c95
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?XfBziRKFhuczKRhhH1F43GrarGdbnQ8CbriBGShPP3aaqfOFTq86iS/kqfmk?=
 =?us-ascii?Q?dU77II+Q7PPlwQdir7YxXwlNSVQeSMJFcsKuyUUiDi251J3btSOubaqIP01N?=
 =?us-ascii?Q?nr0FZwOWq7+TUOyxvX3CyLJr/jF4oCMLuRNKkjBzT1zKr+g3vKs7nHbrbARe?=
 =?us-ascii?Q?VyWyg/w+h5fea4fgwg0ReNn3/cqVEitlAgBcUJfZo/Aubhy0OCPXYZkbd7Ln?=
 =?us-ascii?Q?km0mMbTxA/agzIuVEjWWtxusUzGdgmxg575Sa93ZxaTSKPIRDf+XsYy3cssy?=
 =?us-ascii?Q?ynSfAHdt76Wa9T26ZRCtbl4/kcLRvYmHRYDg9YZB8V63K0cjWJBchX8IOYtB?=
 =?us-ascii?Q?gG2APC0B4lKJrvmi8v/AnHoiRgZvgL/NBwBL+DcDfFtL0fJAD4qoLI4tQNX+?=
 =?us-ascii?Q?GNYdaOiABCG8kkShjIaKg90rED5KGeEgFymzqBGmuyUoemwcIoDPo420a1Fv?=
 =?us-ascii?Q?WvCyhMxk0Am5w18G6KBdg2t5iIrP5U/ilKBhXOSpGtm/ljBZ2mW6uq8z4baI?=
 =?us-ascii?Q?JgNba3Ig1Lck2fea1iib83mUaXlIc5Djc0FUCJa5m9GfhdZFywLOdxj0uIHY?=
 =?us-ascii?Q?wt+bKvRiMgs3UD/P3HoFw6Rs2Kd7WtFR4GR2tGdl8H/EfkhMfe5BrEsRGPuu?=
 =?us-ascii?Q?9g+ky4S3Ghz+lnz9edIPao10It3CfnC/SI/ScXhDuIf33F8b7aLGKZCHQJxH?=
 =?us-ascii?Q?6R2a+MqR7RFgMDzeqKuaV7KbfLlpomVXIhTo4YYLgMwlbQuiBJ2Lt2WNWZsg?=
 =?us-ascii?Q?7CYBrGGbJ20+r7FM4vLCr3cMjQ3msOYmrTub7AOjqurKBFRcpEZT1BKiZ9kP?=
 =?us-ascii?Q?XK6vxoHoxkrrmfdj5gXASOQdx5OyEKShLYsqsUoPq4Ha6YJmob01hgnZgO5k?=
 =?us-ascii?Q?yQeLodpOIghNI3q4BfphZqgKKKwmNj6bnJr310LEmNaPrjE64bZsD9WAx6pK?=
 =?us-ascii?Q?QBVLGeDYdj3KDV3JXBHZz2Mf1t9J+M+iSl3KCEsG1KDyIahPXNcqW47XgoP7?=
 =?us-ascii?Q?mGlIWUagkpJ+VHUdWSFBEIQXxfSYIuBHdAh7JO3sQH5oo2kJmjW79TSP0H5e?=
 =?us-ascii?Q?GvvZn3JvrfkAkWOu0weSljQfUyflvmpCj3uW2JwBYBo8AwrbdJXShBuOIaIU?=
 =?us-ascii?Q?RanVes5lUXk8qM+998/vsi/Hub2YVt5blAyw3AHPzZzDXHsSWveHj5wZzZWA?=
 =?us-ascii?Q?3BHDhIMrH8U3cEcpe1coArAf0/WVX/qkTmr3HUsEEsNYaL7oZoCYikdSzik+?=
 =?us-ascii?Q?l3EzjqMScWwQIB/ZJQnRKej+uQo12tQ3LmivopnPKSXj3j06l+ff6AHv/UZM?=
 =?us-ascii?Q?I6xu9B8rBDyPq31VSC2tGLmQQ/GvvXZYFVhq1mFhQT0qa8Rit9qnNGEJrR9g?=
 =?us-ascii?Q?f2yYvp0jJWoFX1j9AGz9IkncYf6NDfhmYndmOB8po22N5rlU4ms/CPIfD/H/?=
 =?us-ascii?Q?duNe0wR7R+Zw9j2irsNDpMJ67e9JFohLPkVeA8P66F/1EL1WktwdAxi8duf/?=
 =?us-ascii?Q?dgfuL3wkm2JSiAXg2LptzsTJa2SQTI4hAG1SjwptdmpGyF3/4NaAn3amBUBo?=
 =?us-ascii?Q?uBnhl46UVJFgb7kdAnE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/ECCzDQIfPEf/trEg2ai9Iy+ukyqfClFGgWoTJJmVq8s/pawJsDpT0H3MQns?=
 =?us-ascii?Q?D2sccYTbhBrEFPvvNpNno8YzvO5uKrRkJBytKZKT+5RQ8mjGz2j2jlAlpsJ+?=
 =?us-ascii?Q?mt5uL91tzKDnNSWClx0lO0UXSRFY9SiTomzRnY3Tdub6numocR9Dbsgy4SNi?=
 =?us-ascii?Q?OMzQw+cC2lC+31/JO6d5sV+Y1VyAoqjStxfxnr35P0+v9csImst3H6Oq+e+j?=
 =?us-ascii?Q?OuCyjwO8+wD8TK9fRYjbc4tYy4P17Mhz0fL/2bQq57KX8CAcP2VezN/rVE4U?=
 =?us-ascii?Q?e0gDxktG4lEnO1fjoKRsL3GKQc8eCXlAZB6H+bBdtXl4cFbJEkXPRKPn+XeW?=
 =?us-ascii?Q?2UOjsK7iQwrJ0fAb1hcCxVDMC1OfsF4lLtqlYn86vIZ/Uoc5RF5YxCC0MqW1?=
 =?us-ascii?Q?6c+VN8ps6fHK1bkhHl4NP9orjIUYf8S7hiajtAmUwSPNqAzt5CxZCk5cJsYN?=
 =?us-ascii?Q?3MHZe4RqmbvW13AXsl2Ip4618W83hgOFcgTieRgBC/JM+wiAPUxHcP1ZwwoI?=
 =?us-ascii?Q?19YT1p3MGRJsZf5o1Nkbs2GSF+FG9vQQVaoSCHZPD+wBChZ3qyxaAY70YE8r?=
 =?us-ascii?Q?uOAVu2DJ3pPbABRHrKXmGPX6DIYoLP5ZBnSn+A3D3ilugvUtZOtHCzYNUHz5?=
 =?us-ascii?Q?2BEhh5vcdW6scd69X27CyeDWar8pCD3fy8WqQRQFmzM1ClFPJiauJdsRbIYz?=
 =?us-ascii?Q?cnAIuYvtvToQjuCyOPDPrOaE89ZHMkFw1FFLAgQepCMENuEJnfxezYZ7CQhp?=
 =?us-ascii?Q?o9YXfHvp5LWKK1xKBSXFEgEj6DKyfoHf4575UByNVwlzB8dVGXDQpH7iBvf3?=
 =?us-ascii?Q?KZ22l7M7M2zQOTJFwhrp+FUIvlOVpx5z/4vJTm70U3yTegFsIkt+DJX1A4sC?=
 =?us-ascii?Q?aXa9yNnkBETDZwhcWcd8pxUXwsA2aUQVFUDAHA2JtBTxqO2OHm4ZOjZUWKiW?=
 =?us-ascii?Q?2/XicguuG2HD/DORs1XY2Jl4KoaY/UuZCWWgCrYsL8lM7rjRaMYtgcYHPPKd?=
 =?us-ascii?Q?p5+Z6QD0pmHbzqlZdV9GgS8WNf1fsR20t+YR9GGr90rFC9ZohtSlMXyirvcb?=
 =?us-ascii?Q?2If4IeNU9aFUCszZYEA7yKflIeHrAnPCIEhiZB9WWCzpR+enPOYRNldeOaXp?=
 =?us-ascii?Q?4UGi/mfRTRTuKAAOEc/CXRuR1ljWNXiDeRgIUpUbpz0rOoLNLrJ6DnUm5MtP?=
 =?us-ascii?Q?TSWmdM850XS9FfNu13HUi/uPQCtcIoty8z5noOI6Aj58y+PSXVLf0OwNmART?=
 =?us-ascii?Q?ZiNCce6fePR7WGuAAgvlMZjTBCxQOtQ2gUypfrqIKqhWfjVhZTo1q5D/ZjjB?=
 =?us-ascii?Q?lhBVnAghj4pZRxRi/VGw8FTr271/n3nZc+OmozCOa/Fh2H84VNUt3901ZH2C?=
 =?us-ascii?Q?ZY6vLuwwXNTHwzCL1YgYWr+WEC1qhaEKrSLErQWZOhhkvWEmvHAC1aZIyZNj?=
 =?us-ascii?Q?H7NHMfq9g8RJ8oQeF84Xv5Du6Z/J9ueJmoIQWkGLqk/laRoHankHQNjj64fO?=
 =?us-ascii?Q?3gXhodTx5q1XzweWqjnbuyAYWvXsb5lEqeo6sTnLnNZXlIvO1dIbA4Unh3WR?=
 =?us-ascii?Q?Wq4LSpez09xiWUNbyLt8dfKKUe/F/XZBdQkLZ99Mp76dBZPccPY/6aYaNDGx?=
 =?us-ascii?Q?caDAKxXAnULgVC5sVBRLdq7lc6kJfTIOU7iXLqVKiwPB87oawCIypEO7fMmn?=
 =?us-ascii?Q?8OTQC27vo0IBVraZAc7Z9UGpMeRB9bAEwFPY4rXK1U7bgKmOHzX1bECF1ZGM?=
 =?us-ascii?Q?AP3FubL0tg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6790f142-049b-4a0b-522c-08de5a8a7c95
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 14:19:57.6850
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ytA8cwVr6uqEbBQxOXFHPRG6mHdoLzdJt57p1SQNj8L17g9G6amd5O6EYhkKe2pe
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR12MB9481
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.21 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-16241-lists,linuxppc-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[jgg@nvidia.com,linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[nvidia.com,infradead.org,intel.com,suse.cz,lists.freedesktop.org,linux.ibm.com,gmail.com,ellerman.id.au,kernel.org,amd.com,ffwll.ch,linux.intel.com,suse.de,redhat.com,linux-foundation.org,oracle.com,google.com,suse.com,lists.ozlabs.org,vger.kernel.org,kvack.org];
	RCPT_COUNT_TWELVE(0.00)[39];
	FORGED_RECIPIENTS(0.00)[m:ziy@nvidia.com,m:balbirs@nvidia.com,m:willy@infradead.org,m:apopple@nvidia.com,m:matthew.brost@intel.com,m:vbabka@suse.cz,m:francois.dugast@intel.com,m:intel-xe@lists.freedesktop.org,m:dri-devel@lists.freedesktop.org,m:maddy@linux.ibm.com,m:npiggin@gmail.com,m:mpe@ellerman.id.au,m:chleroy@kernel.org,m:Felix.Kuehling@amd.com,m:alexander.deucher@amd.com,m:christian.koenig@amd.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:lyude@redhat.com,m:dakr@kernel.org,m:david@kernel.org,m:osalvador@suse.de,m:akpm@linux-foundation.org,m:leon@kernel.org,m:lorenzo.stoakes@oracle.com,m:Liam.Howlett@oracle.com,m:rppt@kernel.org,m:surenb@google.com,m:mhocko@suse.com,m:linuxppc-dev@lists.ozlabs.org,m:kvm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:amd-gfx@lists.freedesktop.org,m:nouveau@lists.freedesktop.org,m:linux-mm@kvack.org,m:linux-cxl@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jgg@nvidia.com,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	NEURAL_SPAM(0.00)[0.471];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:mid,Nvidia.com:dkim,lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: EF60B76EE3
X-Rspamd-Action: no action

On Thu, Jan 22, 2026 at 09:41:03PM -0500, Zi Yan wrote:
> > Now that we have frozen pages where the frozen owner can use some of
> > the struct page memory however it likes that memory needs to be reset
> > before the page is thawed and converted back to a folio.
> 
> Based on my understanding, a frozen folio cannot be changed however the
> owner wants, since the modification needs to prevent parallel scanner
> from misusing the folio. For example, PFN scanners like memory compaction
> needs to know this is a frozen folio with a certain order, so that it
> will skip it as a whole. But if you change the frozen folio in a way
> that a parallel scanner cannot recognize the right order (e.g., the frozen
> folio order becomes lower) and finds some of the subpages have non-zero
> refcount, it can cause issues.

Yes, and this is part of the rules of what bits in the struct page
memory you can use for frozen pages. I've never seen it clearly
written unfortunately.

> But I assume device private pages do not have such a parallel scanner
> looking at each struct page one by one and examining their state.

I hope not!
 
> BTW, it seems that you treat frozen folio and free folio interchangeable
> in this device private folio discussion. To me, they are different,
> since frozen folio is transient to prevent others from touching the folio,

Yes, but really it is the same issue. Once the folio is frozen either
for free or any other use case it must follow a certain set of rules
to be compatible with the parallel scanners and things that may still
inspect the page without taking any refcounts.

The scanner can't tell if the refcount is 0 because it is frozen or
because it is free.

> >>>>>> I don't think so. It should do the above job efficiently and iterate
> >>>>>> over the page list exactly once.
> >>>>
> >>>> folio initialization should not iterate over any page list, since folio is
> >>>> supposed to be treated as a whole instead of individual pages.
> >>>
> >>> The tail pages need to have the right data in them or compound_head
> >>> won't work.
> >>
> >> That is done by set_compound_head() in prep_compound_tail().
> >
> > Inside a page loop :)
> >
> > 	__SetPageHead(page);
> > 	for (i = 1; i < nr_pages; i++)
> > 		prep_compound_tail(page, i);
> 
> Yes, but to a folio, the fields of tail page 1 and 2 are used because
> we do not want to inflate struct folio for high order folios. In this
> loop, all tail pages are processed in the same way. To follow your method,
> there will be some ifs for tail page 1 to clear _nr_pages and tail page 2
> to clear other fields. It feels to me that we are clearly mixing
> struct page and struct folio.

I'm not saying mixing, I'm just pointing out we have to clean up the
tail pages by writing to every one. This can also adjust the flags and
order if required on tail pages. Initing the folio is a seperate step,
and you already showed the right way to code that.

Jason

