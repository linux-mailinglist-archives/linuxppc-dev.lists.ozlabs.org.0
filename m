Return-Path: <linuxppc-dev+bounces-15930-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A011D38AEA
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Jan 2026 01:51:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dtJ7w4vc4z2yFb;
	Sat, 17 Jan 2026 11:51:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c107::1" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768611100;
	cv=pass; b=n2tVM4CjGDRzxuquNP9SLWhfD9Nla1vjJeAztUlMCL89vrY0NVOW/6XdQyHDfBts6woK7UVhja/PFCFBPy/7e9LQEftXTmfnjun9otHs/iHgfiAAbPlg0bmVOHGVqsu0cPOmAwvYh/JMuXKHXqqIiocQZLGePwWmbmuAJendLeVkvYqrVhgVqa3FofUtg8HqJwH8ti+ZjsQWAVwb9Cp5dKg82o0jOg7eSPnRsD0HGJ7VPy6JijZr1UANgtuxyr9pMqK8fCRIY1H4bSdfvFSv3rsZkmu452lN09Bhi+eMiGJTssaww281KE2ErWP6ycHKKB32DG95B5mqKvM0MuYROQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768611100; c=relaxed/relaxed;
	bh=W66yaejAh397j3QqYwp6iUJsV7DwDgrHlCmvpcDTGos=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=R6jsNYdKTL3otaNyp0FisL/mHpilcFBXHh993x3Zr6H2gMzATfPwYQEzz3wsvdaKrkzgZ5xKgMCVjROB1xt9riWnIRF6XXm0aqKt1p19slztVsbH5vXtqnUz0p/yWYZCxfuQAIm5Gh7H1R3KoDLE0tJjCH5xNH8qf8/g2EZ+qo2w/VrUSBa47j5T4WpghRXeyZCKjoLjuNWH2aWmbw3XSvl0gc4hKylCn7nqRHDS2vEAmJR3H3GCGp4h2g7P5wAyd5ZIRqOqJiBvEumQY1+ZBVOd/zdL7hnMfi4cI7W8HSxTKMdataY2Gago41aCnLv4Yh9+5Npn5NyqcEDUie/s6Q==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=OqE6D9JZ; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c107::1; helo=ph8pr06cu001.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=OqE6D9JZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:c107::1; helo=ph8pr06cu001.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azlp170120001.outbound.protection.outlook.com [IPv6:2a01:111:f403:c107::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dtJ7v2Qsbz2xqG
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Jan 2026 11:51:38 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bc+F7ELt/H8geqRYBwDdzdzKkIs6Q5BSbNCDcX0WYbbAO3rQAsHs2QzqUoy8H877HmJdqiq1kFLeGJEYZPpg1mXMaK6iz5lTmCWQYZpTDdJZ8RyN7mYuK+LOlAcOz+5XFwcopR6dn3EoCcoaRLNrpb+r+XyL3M8T1s1DapfOckiwQ57YfJtCgruXv6PSQomEtuz3hRm6l2bCbE2jsoF9k+67hGhoYn1o2hn3wsv1RS94VD2ZpD0R+U1oYdyMo9iHH6CnoGQ66y704HaCRbDFEGTxC0vVQgF8RTgsf/WENRKrk4iIZEFYvf/SEC2CgejTieqNZTN1JJiSDlm5FIS9dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W66yaejAh397j3QqYwp6iUJsV7DwDgrHlCmvpcDTGos=;
 b=WMjt9nXEE4zqgaHwn3+Ff4uUcJQO7EiEP1mk/VguEUEC0O2zpyQhcZSttz9/0uesrzM1yfwR+aMtdcgsMRO1KTv2db+80hYFe9ouaalHwPZx5PLGt+ua4MNl7KWdhyHeDImACGhGoAx7PXUlK/GqypmVLuPUH5E5Y116DDbpUgdZpBq8t5L7Gx9GTmCGWD4T4A4MYESKUTrS35NcyOj1JFGJVrbh2hKWg+r03RFv84+UJsYYJEsQzFuOmQwc0ZuUhP0S5LvH7VusfJEDhDI4qtTKf/Uu9/Y8WcdBErT4qg//tASa5Zgix2mCouaYhU7kea/KbR7let4rNKcySq7N1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W66yaejAh397j3QqYwp6iUJsV7DwDgrHlCmvpcDTGos=;
 b=OqE6D9JZEhvamRV6HmqKDvlWkCW/fads+90lPp+p98lkLotDzfbflBZiHgnQ13htYuXuVHNtpUXwG8bBJ6mwsSCWGH4Bv1t4u6OdBV00mqmNuWfiopANmHf3HTCYPB/PqtH66fD454H1q8qE7nVULg1XHLdZ7F5ZwuiqZ2pD8UI5s3QSrAco39ioXsHNzz38ApaIqk8cO5Q7Voe2it766x7tE+AkpZ0IMMIXuHF7PW6b3O3x8qKaaBqtdRFTUWctGTbyBzwbs2Jxi4Y6CiHpSsxdWGhX0OBL3eAKrbfspps1oG9zzZGEtSa+1voBFUdFHtAmBEOqhUTkfKAZtd4Bcg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by CH2PR12MB9496.namprd12.prod.outlook.com (2603:10b6:610:27e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.6; Sat, 17 Jan
 2026 00:51:15 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::1b59:c8a2:4c00:8a2c]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::1b59:c8a2:4c00:8a2c%3]) with mapi id 15.20.9520.005; Sat, 17 Jan 2026
 00:51:15 +0000
Date: Fri, 16 Jan 2026 20:51:14 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: Vlastimil Babka <vbabka@suse.cz>,
	Francois Dugast <francois.dugast@intel.com>,
	intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	Zi Yan <ziy@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
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
	Michal Hocko <mhocko@suse.com>, Balbir Singh <balbirs@nvidia.com>,
	linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
	nouveau@lists.freedesktop.org, linux-mm@kvack.org,
	linux-cxl@vger.kernel.org
Subject: Re: [PATCH v6 1/5] mm/zone_device: Reinitialize large zone device
 private folios
Message-ID: <20260117005114.GC1134360@nvidia.com>
References: <20260116111325.1736137-1-francois.dugast@intel.com>
 <20260116111325.1736137-2-francois.dugast@intel.com>
 <20260116174947.GA1134434@nvidia.com>
 <8006ea5f-8845-436a-a2d7-125399428762@suse.cz>
 <aWqgHTZ5hjlRvlKU@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aWqgHTZ5hjlRvlKU@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: MN2PR05CA0002.namprd05.prod.outlook.com
 (2603:10b6:208:c0::15) To LV8PR12MB9620.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|CH2PR12MB9496:EE_
X-MS-Office365-Filtering-Correlation-Id: e706ca1e-c71f-4368-6c72-08de55628451
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?knZlbIOdpFig7Vxzg6uMXuk4x3Ya5wp8MA0uqq0It8GludRA0O0NRM9hzFwf?=
 =?us-ascii?Q?Uj5Sww3zt1yhCsWZWWduvUy0rd33vf8mhvKRPDohmT21IqCgmdUGSZqiCtj1?=
 =?us-ascii?Q?0s+k86lBoXCcdkrTWU3ezcR9L8cOMcWfAHT5QmbAeWfce+1HJPu4GGPwjWxt?=
 =?us-ascii?Q?gCTVJXTGj88WmppBBqaZs11wnsE7tWDAEoiZp+CD9vhuwnyHxt5uoXIyYRfm?=
 =?us-ascii?Q?MoplwusNudkgoDi5aGYz53jKaDGnZW2zBx1dX8W8/jKJpDJJLvjwJ6kMB37L?=
 =?us-ascii?Q?zqbpkdhT/KSA7eJD9bnhr/ehCLBb0/K5OHu+IIZ0rNWGZ5CIZa0svAMiRHxz?=
 =?us-ascii?Q?rmTfcsbTK8rDyWGdK4Azp0l2fKNsqwFSXnPTC8a8n+xNMDcwAXHmAE1MEcr7?=
 =?us-ascii?Q?9Ug9zTH1EACewRsr6WD/YKOutHsNF+nm1/o+2aK59+mJFAurivzhSLSdU7hk?=
 =?us-ascii?Q?nRLyk5KOOpA+1xctRsSOGavfs9Hh1RnXjPg5RRGYp6dZvTgwwWZLpezKwe+J?=
 =?us-ascii?Q?gifeM7AiagyZRbOvo/xHduNvjGRhobew4Fbzj9xsbA68OP8QgEk96xTyvZYM?=
 =?us-ascii?Q?952J2aOmqMkwoMAAqiWeOH0+MK7iCS9EJ0nuYV5JOYgAY93YFMrLiVFkd0IS?=
 =?us-ascii?Q?KNHwJjXTt3tUAx/LMiwhxyVnC+j5vqchPEqyJdZ6whT7h2OOJLIXRPOiLGUf?=
 =?us-ascii?Q?mT7HHQO5VR0r9NLpcw5eJIYFoq7+od7I/ugi/2Jxn6kfOxoTUbZV3WEkfrsX?=
 =?us-ascii?Q?wu+/j0TzJLdUEIYfI8H4eTlh3l9gkIxcHGucz0ALH1JNce53xB1ISkL+T0Pz?=
 =?us-ascii?Q?oSp39Yo8JCIuGZdSwbX47SE1A0Kb8BAJBooi2IKc9NPJUcUdxZ3dUe2+Lc6O?=
 =?us-ascii?Q?aFS14NE2jB1Vm5T8RqZcHeaOHDNB8RZomGq8hEZ7GGvYXMgfhzEm6GjQvyMg?=
 =?us-ascii?Q?CGoUnsRs8WHyXfoJ107W9z3axn7myj5F8RJ/J7QndC6s1nxfCFtLcHEXHOGY?=
 =?us-ascii?Q?eVr1eCgqMEDyVT5K8hetFFIKo1jiyPkkLN4jCezEgd7E9s5NJwYRgRoWYMjy?=
 =?us-ascii?Q?ewrBJv/CGUrK4gnXGpC3Djs8zX6IpjZiEtnke/c2FeYejjICbnAnDwFKJ4p1?=
 =?us-ascii?Q?ZG7NNvjloNEZcDA3EZJ+0r3kgEuuLBZwXH8dAqzJzjW7YfUA9dJQ2DCKHn+2?=
 =?us-ascii?Q?XiFJANCMvNfUtF87f/2IrV6urZLMIaUH1z1V1S13xQGasEfXPpzJcNLYgfuG?=
 =?us-ascii?Q?FLxTmMinONsRbWpH0InWIoYod9adyIyjdccwtbpOZrdqH9FMDLGKhSnRNDO0?=
 =?us-ascii?Q?KgRJowTMRbWZ7EyS59k4/QYZ/r8/XyH4WRsS0P4f+YbLfty0dEvB5JFXSABs?=
 =?us-ascii?Q?mf4lnRMwUM33Lk7+65wBgVirGokrR/yBMzKosPWniAT310qHR4ld91vq+pvX?=
 =?us-ascii?Q?FJ8q4r12jRSeEwYTSYlkWscXYxb/S+0+YD9KX04doH9+hcEKeF8+O1z9m89j?=
 =?us-ascii?Q?FRZr6NGsoEp+ZF5WwPCX/A7eaxpVJ8fyEGcRoycPGyWxFJOmEKo9ATJjj1Nb?=
 =?us-ascii?Q?ZyBMPXGhDohpLY4XGgU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?wgVJoP8omj1bB6pBwLBQqI+Wv8qHMoMJspuj9UXrKatsrwTSodNk3f/HBg2E?=
 =?us-ascii?Q?N61nHiCTej5dgchW5+xPPNtskYg0IebrViO4hxO29xIsZPgbm8AFKh0rbcWu?=
 =?us-ascii?Q?T+QKmiPGM19r1iNbPhBex+Xlg4B7oIgDqTlNc6hF7US42QCBXB0HPJ2iItLe?=
 =?us-ascii?Q?LJFTgJfivC7i+D6trtixvQldbqSAmt/R+VIw5q2uDaFbIwqOf2RCmSDHzELs?=
 =?us-ascii?Q?1IWhd4+bQDTmsor05w7bYiocAJQI4d9LghT7qsFYjEVaVoEHz841djMC21xH?=
 =?us-ascii?Q?cJ0bVWu23DnYR59WOIpz1GvKoBVBZGwGjOIo/nEj4YQWaWrBktHpRDUekZrL?=
 =?us-ascii?Q?kCSXUDthUfnte5A41ghIA8iqjrwXWJufhKhwMMmwmryTf/VyANcdFjXMldE+?=
 =?us-ascii?Q?JkAJMdWatoI1tJlye+3sQgTBnqFG9x/xUvvj6fr00z42PHrOndA/BO4pi4Eu?=
 =?us-ascii?Q?xvgxiZk2SkSOAwxHgkIE0xuilW5qqVvwdmzvb0gG7iWIIy+3FOgwOPmfIijH?=
 =?us-ascii?Q?glq9xHIFgSabGkHpik1Yaah/lrshP5EqCYNdj2hUSpZ4wqpShpVBTthrXHH1?=
 =?us-ascii?Q?fTikiWBGJ0Y1bK2+QqNUBXp+xBOqWP2Q+K60oAF5gNL0YS3qbQaWwcYJqlV6?=
 =?us-ascii?Q?cXaBbAWsI+5rR1PviQuX+9I0fXRNswXB4U3X9HwaBaPizhaSXKyqDsKr8Ho1?=
 =?us-ascii?Q?3LBnkA2I5nzpwYD3wcbd+4P54GN5SkP+DCRc9rIJbh3TdBwP4yN0VN2zR763?=
 =?us-ascii?Q?iUMAKoLqPIdC5sh5xFtAzNKpIi8yIcMh8v3anoO71Mrz4vP+kYvNc+wG8WSx?=
 =?us-ascii?Q?1QXBp5e72dxXOXQ1BFD7ldvWfZbQ9K7rhCBZmU3am2KGDeRUdVsoqlVmATn2?=
 =?us-ascii?Q?veDIy900I17Wg0mIRfdYW8f26aKn7dI4nIJ6YcNo1uCkIxpaVJM+fsUpM1OA?=
 =?us-ascii?Q?TaruCWRcZdW+G3wICqQHoifs7ukA6llyXl3lsByRPstwrTWuwgjZgouZUZgt?=
 =?us-ascii?Q?H4Lt7asH4cscWkiFjfvGSbifmqbCMJdqBoUgOClFZVL/tpy5Vw5rGwyc995P?=
 =?us-ascii?Q?zU4U0IpoIEVUbDkJHz+F0919SgCqBbCPzsdKkCHDRplSu59ubGIA6SNILoZF?=
 =?us-ascii?Q?egeHUoCZUiXvdN1GQ3AUMqddz+Y0oR+7nczRSloQjytJHOHrjJKWGZ899ovU?=
 =?us-ascii?Q?v1yEo7dQEImtlfJk3SB2EVWXmt5NmxH287IHW2NNle9ARvwDMb2TC9Wo42jj?=
 =?us-ascii?Q?IvnU9LhftgsJqcAn3cSevrYAfpk19PVeZNkh98AGbJ8aMAKlGxbCwmVTIMNA?=
 =?us-ascii?Q?vH2ngAbVQf+alGMQiPWt+1Ix7JFo6BI9fuVMKOBnWLMyl1EBQEilyA6YCaNu?=
 =?us-ascii?Q?QpeBnXL5xWFxQ2FqTP5LO09tuadY2ZYVULtHWoC4/NgHvg3XedxHqN1yZU7d?=
 =?us-ascii?Q?VulRKs0bD8w4xwP6zRCNRTtsts9a28fRA/v01cFD4MQ/ixMxqzOarEWlGCv1?=
 =?us-ascii?Q?WpPx7V7afwBFqEYVe73EKtNPJhkKQq1hHaKeUpOSEw3u75lzUU7OKOi6ahwK?=
 =?us-ascii?Q?u1QA0gF9zVi8uVm0cBT+RnILCWZ0jXrSA3Cc8FvbkXRJrA7bA6VCmMZgkIwr?=
 =?us-ascii?Q?vVjuOtX4lT/8x63oqZVnmi1ftPt3beCspGftxWXUks7JP2+6MNsUQc0pegq7?=
 =?us-ascii?Q?ZY4vFJntnHU81wCmA16GTuYy+vePbROdAHL1nTo10r3qPcMg5rIA6Yo9QGdG?=
 =?us-ascii?Q?csBMxk5B/Q=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e706ca1e-c71f-4368-6c72-08de55628451
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2026 00:51:14.9770
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0eDPkh/xbnpLiapdmW47YfEiVLCP8dYmYI7jBhY44q8vYgFBJpz/QbInFNYl0FSy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB9496
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, Jan 16, 2026 at 12:31:25PM -0800, Matthew Brost wrote:
> > I suppose we could be getting say an order-9 folio that was previously used
> > as two order-8 folios? And each of them had their _nr_pages in their head
> 
> Yes, this is a good example. At this point we have idea what previous
> allocation(s) order(s) were - we could have multiple places in the loop
> where _nr_pages is populated, thus we have to clear this everywhere. 

Why? The fact you have to use such a crazy expression to even access
_nr_pages strongly says nothing will read it as _nr_pages.

Explain each thing:

		new_page->flags.f &= ~0xffUL;	/* Clear possible order, page head */

OK, the tail page flags need to be set right, and prep_compound_page()
called later depends on them being zero.

		((struct folio *)(new_page - 1))->_nr_pages = 0;

Can't see a reason, nothing reads _nr_pages from a random tail
page. _nr_pages is the last 8 bytes of struct page so it overlaps
memcg_data, which is also not supposed to be read from a tail page?

		new_folio->mapping = NULL;

Pointless, prep_compound_page() -> prep_compound_tail() -> p->mapping = TAIL_MAPPING;

		new_folio->pgmap = pgmap;	/* Also clear compound head */

Pointless, compound_head is set in prep_compound_tail(): set_compound_head(p, head);

		new_folio->share = 0;   /* fsdax only, unused for device private */

Not sure, certainly share isn't read from a tail page..

> > > Why can't this use the normal helpers, like memmap_init_compound()?
> > > 
> > >  struct folio *new_folio = page
> > > 
> > >  /* First 4 tail pages are part of struct folio */
> > >  for (i = 4; i < (1UL << order); i++) {
> > >      prep_compound_tail(..)
> > >  }
> > > 
> > >  prep_comound_head(page, order)
> > >  new_folio->_nr_pages = 0
> > > 
> > > ??
> 
> I've beat this to death with Alistair, normal helpers do not work here.

What do you mean? It already calls prep_compound_page()! The issue
seems to be that prep_compound_page() makes assumptions about what
values are in flags already?

So how about move that page flags mask logic into
prep_compound_tail()? I think that would help Vlastimil's
concern. That function is already touching most of the cache line so
an extra word shouldn't make a performance difference.

> An order zero allocation could have _nr_pages set in its page,
> new_folio->_nr_pages is page + 1 memory.

An order zero allocation does not have _nr_pages because it is in page
+1 memory that doesn't exist.

An order zero allocation might have memcg_data in the same slot, does
it need zeroing? If so why not add that to prep_compound_head() ?

Also, prep_compound_head() handles order 0 too:

	if (IS_ENABLED(CONFIG_64BIT) || order > 1) {
		atomic_set(&folio->_pincount, 0);
		atomic_set(&folio->_entire_mapcount, -1);
	}
	if (order > 1)
		INIT_LIST_HEAD(&folio->_deferred_list);

So some of the problem here looks to be not calling it:

	if (order)
		prep_compound_page(page, order);

So, remove that if ? Also shouldn't it be moved above the
set_page_count/lock_page ?

Jason

