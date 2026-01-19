Return-Path: <linuxppc-dev+bounces-15948-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D97ED39E2E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Jan 2026 07:00:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dvfvH6ZZYz2yDk;
	Mon, 19 Jan 2026 17:00:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c110::1" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768802427;
	cv=pass; b=XFHLvYmuiJo4X+liDykoa5MHbNnu1BLApv/GuLqUD0yXtLxmDy+dI9azltzJL+R2MjZmGNXnarXEDWz3OEDg51y1wfkV8gaV5fYbM6giGCHQBiJVqSIBNn4b422qny15JyylytDoxwWMjLqFNxI/qWN/AJOFf83MaPxQL8dK/hk/LNz2rtgZ6+I1CV8CMIfk+d+d0i9qjMNgKxJewbiZrhhhg34AZbp8iMaZHDzP6W1cYigAirOAkYTrAMVMiSfRGMVIsmyb/RDHLN567s/Bu/5ZbcHJtrTkX9azcQ6fJzjpMs+dKqIByi+4IXag4KeG9+dbANt79tIU3yhleerYUA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768802427; c=relaxed/relaxed;
	bh=SL0qdjIUBAF5xVraJZO3JMf1t8JjsoGuDnfY6ynkw9E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Nu3L05bAfvcm5IClrjvig+NaI9Y99mmPnHuAAgEUCH1QExsKWjZiyh5KNhOA26nw4UGgbk1A29NTUE9kEts7fsudGN++dHBOCAlZtxUU9S7QMjO3kVou1VJp0hY4XnhiFqgnsNi4+G+tjGgKBnfIxuZ6+fAa7tc9b2vYznV9iXJ7RxDPeePuFeQvxr7BogjUx0NzRb7FPqHuybD/eAtAHeDQbAZlDoQRLm4XQKbR/hFTnjUGvNY52HkwkB47RUTTiYhIV1oBP4lpwJ2d8+C6IwWj5yCeOrKymw3DCiotq1HYRGjmZ9vbJFKqcN4HBJFDFkxxgopnGtWDMY6tk0dJwg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=KfM47ANo; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c110::1; helo=bn1pr04cu002.outbound.protection.outlook.com; envelope-from=apopple@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=KfM47ANo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:c110::1; helo=bn1pr04cu002.outbound.protection.outlook.com; envelope-from=apopple@nvidia.com; receiver=lists.ozlabs.org)
Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azlp170100001.outbound.protection.outlook.com [IPv6:2a01:111:f403:c110::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dvfvG3mwWz2xSZ
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Jan 2026 17:00:26 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PH6m8Lccs2JHj3taQfk8nqtllyo9BExuDI9Dbi8fMU+L3RjocgyQH9fcMiMrCmtOfmG2A2o26Jt/0ObnfO1sY84kC46SojtbxzLGPj+VO7SimkcOWxHGsm3JrJ4M2kSCuGj4VMzhVvOHZlS8FwidjfKb0rUGQQTs8aXcFDdGmOMlcn/6PD2lC/kutEwNXJU+lldQyEFRosysQxMD9WvH+pkB6HlhuOue/9MC/DBsllmKkr086jXSBn0S6C9X/gXImgcniQxWDPiAki7e2BZtKUWkGsXl6gP6sCTUe/inmN/7Y+Lk0foRKQMs1i1pwn9kzlBiI3aKUC+qSzG6AS1Dzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SL0qdjIUBAF5xVraJZO3JMf1t8JjsoGuDnfY6ynkw9E=;
 b=idiOGOGfYaiSDac82RydfVZfm78LoS5w8ab1s4OjFapPrtpzlV2v2/RgTTtCxjy4bE3S77PTM+BFFkU8tvmwRIKwUy8DaNWBRdhhYjvGLD5XuXgI6h7zDnuILiVoiTVNFeACpilMmNLihjPK761yDUdstIBnixeuQqPAj0FmVzcKjcsfYTihu9lWeBB6U19oXPDfQyN4slzJiJ7ZJhpNKI6dwGt1NrfOKgDila5GfrzJrZypuGoRNxQMaV9+cUddouy6ZIEgCp4W5CFi12Y0YdRu7KDa+jAwWY8s8esrUEQc4A1oE/+x3JFCxoyRY11NWl/KyB54s2WVFgHI/IGn+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SL0qdjIUBAF5xVraJZO3JMf1t8JjsoGuDnfY6ynkw9E=;
 b=KfM47ANoLCP6YR3e4Es54Emkabu9n3a/re78WCZHzBQTgBFBCezBrHIfSWVDKShOhFevVLXwARbKOtCgIxm/axLq5nFkNT7/mTUtkbBxzUyieRFI3LvNB+9TkvwZ1LBa3JgFNSj/5dUqS4V7BN7FUdmqfsPddTdk8Bx3uZrJNQSUjODO+yS+nu7CCGWOrbi8Ne7ORFe1x4ptqhvjC8bzpLFxb7zSNZOZ/SjWSja0F0bivqpXnZ/eKstWUg0PoVLhXm/Bw/cPXa5Gi2OE0cp4y2xoGES4xCehA0Z/+uaDJnQWFESK8uOuEhsrGykNJf1/CnXnqJqIeZ7qO/cyGRZkNA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 CY8PR12MB7316.namprd12.prod.outlook.com (2603:10b6:930:50::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.10; Mon, 19 Jan 2026 06:00:02 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%4]) with mapi id 15.20.9520.011; Mon, 19 Jan 2026
 06:00:02 +0000
Date: Mon, 19 Jan 2026 16:59:56 +1100
From: Alistair Popple <apopple@nvidia.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: Balbir Singh <balbirs@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>, 
	Vlastimil Babka <vbabka@suse.cz>, Francois Dugast <francois.dugast@intel.com>, 
	intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org, Zi Yan <ziy@nvidia.com>, 
	adhavan Srinivasan <maddy@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
	Felix Kuehling <Felix.Kuehling@amd.com>, Alex Deucher <alexander.deucher@amd.com>, 
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>, 
	David Hildenbrand <david@kernel.org>, Oscar Salvador <osalvador@suse.de>, 
	Andrew Morton <akpm@linux-foundation.org>, Leon Romanovsky <leon@kernel.org>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, "Liam R . Howlett" <Liam.Howlett@oracle.com>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Michal Hocko <mhocko@suse.com>, linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org, nouveau@lists.freedesktop.org, 
	linux-mm@kvack.org, linux-cxl@vger.kernel.org
Subject: Re: [PATCH v6 1/5] mm/zone_device: Reinitialize large zone device
 private folios
Message-ID: <4k72r4n5poss2glrof5fsapczkpcrnpokposeikw5wjvtodbto@wpqsxoxzpvy6>
References: <20260116111325.1736137-1-francois.dugast@intel.com>
 <20260116111325.1736137-2-francois.dugast@intel.com>
 <20260116174947.GA1134434@nvidia.com>
 <8006ea5f-8845-436a-a2d7-125399428762@suse.cz>
 <aWqgHTZ5hjlRvlKU@lstrano-desk.jf.intel.com>
 <20260117005114.GC1134360@nvidia.com>
 <aWsIT8A2dLciFvhj@lstrano-desk.jf.intel.com>
 <eb94d115-18a6-455b-b020-f18f372e283a@nvidia.com>
 <aWsdv6dX2RgqajFQ@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aWsdv6dX2RgqajFQ@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: SY6PR01CA0127.ausprd01.prod.outlook.com
 (2603:10c6:10:1b9::16) To CY8PR12MB7705.namprd12.prod.outlook.com
 (2603:10b6:930:84::9)
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
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|CY8PR12MB7316:EE_
X-MS-Office365-Filtering-Correlation-Id: 794d44dd-53f0-438b-d063-08de571ffbd8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SnlzS3UyeWNQa2NCUTYxUlVSbklvbjdTbDM0RWU4OGJxNjN5amswcEhsUW5t?=
 =?utf-8?B?dmM5RTUwNGRhWElMT0tMeTlrdEhvNy9vNndCMXJDbTQzNXdiUW9QUDI1bndm?=
 =?utf-8?B?elJMWU43ZTREYm55emlJaGlIS0pjYWxBVEFCdkc2Ti9xdzZsMk9ORzZRejdW?=
 =?utf-8?B?bmdLVVZCam9hRnNMK0tRY0QzZnYwL2N6SUtMYXpVZW9jQ3p6UHhIYkc2QmJS?=
 =?utf-8?B?cERobDhUVzRodE96NURRdEl3MzdDNVdXVkZCUmFLMHQ0Z2FIMzFVWXhBVGIv?=
 =?utf-8?B?dHlVc3NNNXJxUjVhc0FnTllJaXZLY2JzQWpNUFpMUDh0M202RW9Ja3FNOFNS?=
 =?utf-8?B?QURGbnFIZlU2QWc4dXUzL1BTK3JxelBzSG42ZDNGWVlGaU1DeHZiQTlQVGE3?=
 =?utf-8?B?M1lWbnNERTQremRRMENwMS9qcm1qNWdIK0pEb1ZkZndudjV5VTdVWWp3dUFX?=
 =?utf-8?B?ZWRteHVTNStaejVrWUJjWXplM1JibXh4VStEOFlQVnFPYXdkKytKVkw1RUpJ?=
 =?utf-8?B?UTlEVWhBNXpLa3p2TVEzQzcyZzFURnFPTjNYbUpDQ2s1ZzZLbFRqY2REZlpt?=
 =?utf-8?B?Uk5JMWJCUi93TXRzZUdWRGxZOFlGOTk2MWpQa215aWgyRk12VTZ2clN3Q2da?=
 =?utf-8?B?a0xiME9xUzAzMk41L1N1VURqUUFaK3k4WGhxYWh1SWROR1RmbXp0RXhkK3JW?=
 =?utf-8?B?R09DeTV3bHJQOHNoekRZaC9jRGlSUXlXK1h0TXVDSE42cmkxaG1FeHh2V1g5?=
 =?utf-8?B?QTRBWHg4TC9XNjhzVUtzRW96UHpqTFgyMTN2c2puU1Babks5UTU0cCtjanVN?=
 =?utf-8?B?OXFXeXJaKzlTampPUnQyc1dHTGIvNUg0SDBkZ2pQMVNxQ2ZXZ25iRTI1OFlQ?=
 =?utf-8?B?QXlYNHZGVkRUY2YxdEprbGlaVTNrT3AzZ2pDZytlYWxuTlhkeUNpR1EweXRE?=
 =?utf-8?B?QzhpemdvZXdjVU01anlCVExESTJpNC93bUJMTEt4anBDZXZjb2hST0ZTdFFP?=
 =?utf-8?B?NTNFQ3g1QkNiZXZ6aFpuWnoraW15UmYrNml0K2NCb0RnNjFHa052UjErTDhY?=
 =?utf-8?B?QXRKSGpjWnoxVTVsZ3B5T2M3M3p4eEo0VkhIUWNJWjRTVkJ0b1hyKzYwbGtW?=
 =?utf-8?B?SDB6dDVkUDlRRWlQbTF1Y0tReHVpSFNzMGRGRnQ3bFhUZU5tZjF4cWNNR2VG?=
 =?utf-8?B?UjhDTDRDbzFJTDFSSUY2dTFhWnVPZmc5SXRLaXBieWxXNmQ3SVlpbFl6c3l3?=
 =?utf-8?B?eDVZaWRMSnNPSjlIbmt1dlhua3BtNFg1TnlEWG5JRHVJWC90b0RQalpEdU9r?=
 =?utf-8?B?dVQ0MGJxVFpqWlo4azhFemdKQUZkQ3dKdGh6TnB5K1hodzBrM0d4dU1KYk5H?=
 =?utf-8?B?KzRuTjREVnFxM1RiSG5ZOFM1a25hUERBVnFYeTQzMXZ4akxLNnREZVhxNGdu?=
 =?utf-8?B?RlBBZTY4UHJMMGUrMDNjcml1enlrbDgxNTdyT3lsdnA0clltSHRCNWdYMll3?=
 =?utf-8?B?eE9vN2s1RmtsTFV4MXBWVVBIdmVwR1pya243Z3dRc2ZKWkZsVVFyRmMyb0FZ?=
 =?utf-8?B?ayt4Sm1jalpKdCtlSGRBM29wcThNMjlqZmVnd2lya3lYbmRWamxtQlFjYStI?=
 =?utf-8?B?ME0vN1NaaDJyWXc1UXQvTzNzdGRzdEtzMnJMbEY4VGZJaXVhY2YvK1lLZ3FI?=
 =?utf-8?B?bEpVYUU4NnFDcGVkd1F6eSswY2NrdkZlcEhCa0xqdWh1dHpON1U4b2szRkJx?=
 =?utf-8?B?Z2VJVFl0Vld0SkZyVXJjL3B0ZUVwTnFmeUFFck5oQ2RrUU5ydzcrV2c0aWpS?=
 =?utf-8?B?RExEVkNvVDdNZHpjVFI5K0RXVTFSeGpDaXF1ajBXR1ZZa0xZb2JYVFdqMDdL?=
 =?utf-8?B?R3Y1TlR0UEZxeno5Z2FNbHp1UWZLMmZha3VpejZVTXdXU0dtZFlZTDZtbUtz?=
 =?utf-8?B?bDhucFJKOVVvL3F1RHBpaEpqN2k2K3JVWlhLSE82OUVqNWRSTlNHSC9nYVZs?=
 =?utf-8?B?NnZFdWRwbnF5bFdDNkEzdlhjRTBPSUVNZDc0QzdVZURORmFKMWtKV0taU0V6?=
 =?utf-8?B?QzhPOTQ2eVc0TjkxMkFmbThtM0llOFhwTjMxOENEb2FJTFhHb0dFT1ZMZTdw?=
 =?utf-8?Q?3TJQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB7726.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cnhvL2l2U0pGdHYzTU5wU0EydU1HYW5tNXpHaFp0L3JlRkdEdThZZXJoZ2xx?=
 =?utf-8?B?bGFzSm90VFcwRVp2T0E4azNHTEN1ZzZNajBMenovTTEzY25oYnpOSXVjNTN2?=
 =?utf-8?B?YWw0OHg1V0xxNG96N0dFMEp1dFpXQmpqdDMwSkdQUkVKY2xVZldMRzhmUjRF?=
 =?utf-8?B?OVErMlFKbUI5QW4vRG1wUWM1ODVUdFl5OHF2V1pnbkE3U1BiTEJvRFhWN2Mw?=
 =?utf-8?B?NzFxcWNld0kvL3ZzczQyTEhwNWZqeEtBVG1HYUkwSmEwdkF5b2FhMDlyVnVx?=
 =?utf-8?B?TFZLcWVWMks1MTZJMXNMaDVzRUpqSDZNT2Y0d09FYVlYVTlXVUxmcHJ0VkNu?=
 =?utf-8?B?b09xV0p4ZEl5VTR1aUhuOTF3Y0lNQlVGRFlmZjBjZW8yTk9lLzNnSlFycE1K?=
 =?utf-8?B?VnJuN0h4T0FBQWhHR1phT0dtTWl3V1dHTTVZenRETHY3cWhGN0MyK3dOanQ3?=
 =?utf-8?B?OEl0TGdNTCt3QkpXbDJNQ3BVOHlFbjY3OWlaUHhNSWdQa2hQQ3dIOXRzNFIy?=
 =?utf-8?B?NVVaYXF5NExBNGp4VkxlRnpnZy92ZHc3Q2dCRVRndXg5Z29vVmQrK2NORGE3?=
 =?utf-8?B?ZjV3bDJHMWt6NXhyWUd6YmJxa3hsdDlic2kyRWJhMC82Y2FBLzBCdy8rY3Iv?=
 =?utf-8?B?Mk5LSkgwbXlBQk5Qa1A5SFRUMTRxMXJ3YTAzcUhEd3lMUGhEZ1pwcW1yaW8x?=
 =?utf-8?B?SFlhOGl6eG53TkRhbkhuUnhkclp6OE1DRklQSUp5UWpDYTJ6dU9QN2t4L2NQ?=
 =?utf-8?B?dTlPSC9mZU5DUGc5YnRWb1ZRT0Q0S291NlA3RkNpczV4eHpqN3FMeTY2TnB0?=
 =?utf-8?B?a0J2bTdxMlhnTUcyUGR4aWx1RHo1WlNkclFYWE9TNHBqZWFQdVVjM0Vlb2VC?=
 =?utf-8?B?Z2Qyd0VHT1BpQTB1dVdZZFJIQnpGRkRXRC9jTkQ2L1FlZXFTUTZ6SmdmdFNK?=
 =?utf-8?B?SUVOQjFzd0pIUDdQcHdUTFRWYmdQUGx0NWMwN0I5MHgxU2trK000OEdKeWU2?=
 =?utf-8?B?YTlFeWMycnVLWFBnSTFiWGFScURrQkprUTdqLzhOS2dwMmtOQjUyQWJ0SkVw?=
 =?utf-8?B?WDFQcFg2SFd4dWxvM3ZqSTA2clZmVytEZDFUK0lIeWdYdEZXcTIxdHh2d2Vn?=
 =?utf-8?B?d2ZBS1dtNTdPakhXd3JDZXFJMTZPaENLVXVuZHk3UzRhRUpTQ01peXp1SmJ5?=
 =?utf-8?B?WVNhZ0FNUzF5S1NqTk93WnB3UTZYVnhqRkZaNHFWU2FQalN2bmFGeEYxdGEy?=
 =?utf-8?B?RFFLTFlUKy9FakZNZkZXTzNmYkJReFM4MGovZjU0ZkFZNTY0QnJYWGZ6ZFhH?=
 =?utf-8?B?dHc4YUJReFJSRENqWnNsY0IwbG5KSWZzWDdjWW1uOEwzYW9DcXo0SFIyYk5G?=
 =?utf-8?B?bGdReEgwWmUwbmZxTVBoaHlaRzFNeldEOUFFSzUyamI1KzRDdktuQU1rNTdQ?=
 =?utf-8?B?S1pnTnZCbjRYVTdwc2dRcTJZNFJySXRTb1JTU0kzeDVXRURxeC9GQ3JtZkU3?=
 =?utf-8?B?WmpWTzNUNlhVVU9sOEZxTmtOUzVCQU5ZTTlMWm00VDBNTkFHalhNUWk4VmdS?=
 =?utf-8?B?N091anZNckplL2ZDOXB1bVNUS3o0T2ZRdThNblhEeE5tZ2k5Y1hQaGZITGZq?=
 =?utf-8?B?Qzc2ZUJXV09pTjZMcVVmeVROQ1p4d0JPNys4SHo1L01DUHFKTWJXVUlEaEha?=
 =?utf-8?B?QjdHbElrMnVhZUI2d1N1RzVmYVBZb0NTV3p6UmpNUjQwdW9qd2xLdmp3WVVI?=
 =?utf-8?B?NENxQjBtUmo2OXk4MDZsU0ZhckRxYUI0aFdsdDF6bE90SXhOWDZxdGVCNTlx?=
 =?utf-8?B?ZzVBd1NqbUpWdllCTWF2RktNRmtJWURlUmw1clkxRTNMT3lSZzlPQ3ZQWTNN?=
 =?utf-8?B?UXl2MlZVbVAyb0tDUEpwOEpxUnVkVTM1eUVQRjh4aUR2RE9iZk5BaTErMVJU?=
 =?utf-8?B?NGc1YTBwK1VRQkRSNndKV24xTURhcEllZHkzR3ExL1NZc2lGN093a0YxVDVo?=
 =?utf-8?B?MlY1a3FHcWZzdVhTSzl4OGdhakpndFNWNXRXMElYK2lrbU1UNmxuQ1kwTTg3?=
 =?utf-8?B?M2ljWVA1akdSdDczby9EZ3dTOWhyaTlBbHZqL1lRSm0xVVRzMGVHelNONGVI?=
 =?utf-8?B?VzlyUFJqRVdDU0YwL1JhVXB3RFd6QWo3UTJnemJlS2ZhektJWVN4WWZNa2t5?=
 =?utf-8?B?Y2lqT1ZlUWdIQlcxZyttd0R5QXkxMzJSVTBlcnFQR01DVkpoL2ZRcHViUjRF?=
 =?utf-8?B?enNXZkxKLzVWbk95bnY1V1I3WlE0bHptUWdUcTdHQmxNQWVBQU5wZDlBeGw0?=
 =?utf-8?B?MmJWR0dwK0FoajdJTEI0MzY2OTRyeUdhekF3NzIvRUk5ekhxU253dz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 794d44dd-53f0-438b-d063-08de571ffbd8
X-MS-Exchange-CrossTenant-AuthSource: CY8PR12MB7705.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2026 06:00:02.1806
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S4GGAiHMKQuJGRciRm2bxHrdXXsV7V25rS11qnnRbApXSE+5k2YrQiWPWuQT/hRAGyIVJJ+glxkQwKMXFeP+Sg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7316
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_NONE,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 2026-01-17 at 16:27 +1100, Matthew Brost <matthew.brost@intel.com> wrote...
> On Sat, Jan 17, 2026 at 03:42:16PM +1100, Balbir Singh wrote:
> > On 1/17/26 14:55, Matthew Brost wrote:
> > > On Fri, Jan 16, 2026 at 08:51:14PM -0400, Jason Gunthorpe wrote:
> > >> On Fri, Jan 16, 2026 at 12:31:25PM -0800, Matthew Brost wrote:
> > >>>> I suppose we could be getting say an order-9 folio that was previously used
> > >>>> as two order-8 folios? And each of them had their _nr_pages in their head
> > >>>
> > >>> Yes, this is a good example. At this point we have idea what previous
> > >>> allocation(s) order(s) were - we could have multiple places in the loop
> > >>> where _nr_pages is populated, thus we have to clear this everywhere. 
> > >>
> > >> Why? The fact you have to use such a crazy expression to even access
> > >> _nr_pages strongly says nothing will read it as _nr_pages.
> > >>
> > >> Explain each thing:
> > >>
> > >> 		new_page->flags.f &= ~0xffUL;	/* Clear possible order, page head */
> > >>
> > >> OK, the tail page flags need to be set right, and prep_compound_page()
> > >> called later depends on them being zero.
> > >>
> > >> 		((struct folio *)(new_page - 1))->_nr_pages = 0;
> > >>
> > >> Can't see a reason, nothing reads _nr_pages from a random tail
> > >> page. _nr_pages is the last 8 bytes of struct page so it overlaps
> > >> memcg_data, which is also not supposed to be read from a tail page?

This is (or was) either a order-0 page, a head page or a tail page, who
knows. So it doesn't really matter whether or not _nr_pages or memcg_data are
supposed to be read from a tail page or not. What really matters is does any of
vm_insert_page(), migrate_vma_*() or prep_compound_page() expect this to be a
particular value when called on this page?

AFAIK memcg_data is at least expected to be NULL for migrate_vma_*() when called
on an order-0 page, which means it has to be cleared.

Although I think it would be far less confusing if it was just written like that
rather than the folio math but it achieves the same thing and is technically
correct.

> > >> 		new_folio->mapping = NULL;
> > >>
> > >> Pointless, prep_compound_page() -> prep_compound_tail() -> p->mapping = TAIL_MAPPING;

Not pointless - vm_insert_page() for example expects folio_test_anon() which
which won't be the case if p->mapping was previously set to TAIL_MAPPING so it
needs to be cleared. migrate_vma_setup() has a similar issue.

> > >>
> > >> 		new_folio->pgmap = pgmap;	/* Also clear compound head */
> > >>
> > >> Pointless, compound_head is set in prep_compound_tail(): set_compound_head(p, head);

No it isn't - we're not clearing tail pages here, we're initialising ZONE_DEVICE
struct pages ready for use by the core-mm which means the pgmap needs to be
correct.

> > >> 		new_folio->share = 0;   /* fsdax only, unused for device private */
> > >>
> > >> Not sure, certainly share isn't read from a tail page..

Yeah, not useful for now because FS DAX isn't using this function. Arguably it
should though.

> > >>>>> Why can't this use the normal helpers, like memmap_init_compound()?

Because that's not what this function is trying to do - eg. we might not be
trying to create a compound page. Although something like
memmap_init_zone_device() looks like it would be a good starting point, with the
page order being a parameter instead of read from the pgmap.

> > >>>>>
> > >>>>>  struct folio *new_folio = page
> > >>>>>
> > >>>>>  /* First 4 tail pages are part of struct folio */
> > >>>>>  for (i = 4; i < (1UL << order); i++) {
> > >>>>>      prep_compound_tail(..)
> > >>>>>  }
> > >>>>>
> > >>>>>  prep_comound_head(page, order)
> > >>>>>  new_folio->_nr_pages = 0
> > >>>>>
> > >>>>> ??
> > >>>
> > >>> I've beat this to death with Alistair, normal helpers do not work here.
> > >> What do you mean? It already calls prep_compound_page()! The issue
> > >> seems to be that prep_compound_page() makes assumptions about what
> > >> values are in flags already?
> > >>
> > >> So how about move that page flags mask logic into
> > >> prep_compound_tail()? I think that would help Vlastimil's
> > >> concern. That function is already touching most of the cache line so
> > >> an extra word shouldn't make a performance difference.
> > >>
> > >>> An order zero allocation could have _nr_pages set in its page,
> > >>> new_folio->_nr_pages is page + 1 memory.
> > >>
> > >> An order zero allocation does not have _nr_pages because it is in page
> > >> +1 memory that doesn't exist.
> > >>
> > >> An order zero allocation might have memcg_data in the same slot, does
> > >> it need zeroing? If so why not add that to prep_compound_head() ?
> > >>
> > >> Also, prep_compound_head() handles order 0 too:
> > >>
> > >> 	if (IS_ENABLED(CONFIG_64BIT) || order > 1) {
> > >> 		atomic_set(&folio->_pincount, 0);
> > >> 		atomic_set(&folio->_entire_mapcount, -1);
> > >> 	}
> > >> 	if (order > 1)
> > >> 		INIT_LIST_HEAD(&folio->_deferred_list);
> > >>
> > >> So some of the problem here looks to be not calling it:
> > >>
> > >> 	if (order)
> > >> 		prep_compound_page(page, order);
> > >>
> > >> So, remove that if ? Also shouldn't it be moved above the
> > >> set_page_count/lock_page ?
> > >>
> > > 
> > > I'm not addressing each comment, some might be valid, others are not.

Hopefully some of my explainations above help.

> > > 
> > > Ok, can I rework this in a follow-up - I will commit to that? Anything
> > > we touch here is extremely sensitive to failures - Intel is the primary
> > > test vector for any modification to device pages for what I can tell.
> > > 
> > > The fact is that large device pages do not really work without this
> > > patch, or prior revs. I’ve spent a lot of time getting large device
> > > pages stable — both here and in the initial series, commiting to help in
> > > follow on series touch SVM related things.
> > > 
> > 
> > Matthew, I feel your frustration and appreciate your help.
> > For the current state of 6.19, your changes work for me, I added a
> > Reviewed-by to the patch. It affects a small number of drivers and makes
> > them work for zone device folios. I am happy to maintain the changes
> > sent out as a part of zone_device_page_init()

No problem with the above, and FWIW it seems correct. Although I suspect just
setting page->memcg_data = 0 would have been far less controversial ;)

> +1
> 
> > We can rework the details in a follow up series, there are many ideas
> > and ways of doing this (Jason, Alistair, Zi have good ideas as well).
> > 
> 
> I agree we can rework this in a follow-up — the core MM is hard, and for
> valid reasons, but we can all work together on cleaning it up.
> 
> Matt
> 
> > > I’m going to miss my merge window with this (RB’d) patch blocked for
> > > large device pages. Expect my commitment to helping other vendors to
> > > drop if this happens. I’ll maybe just say: that doesn’t work in my CI,
> > > try again.
> > > 
> > > Or perhaps we just revert large device pages in 6.19 if we can't get a
> > > consensus here as we shouldn't ship a non-functional kernel.
> > > 
> > > Matt
> > > 
> > >> Jason
> > 

