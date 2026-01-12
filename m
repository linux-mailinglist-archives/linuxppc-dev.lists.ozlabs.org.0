Return-Path: <linuxppc-dev+bounces-15524-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F0FED102D3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Jan 2026 01:20:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dqCh25FLpz2yk6;
	Mon, 12 Jan 2026 11:20:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=40.93.195.31 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768177218;
	cv=pass; b=e33365yO/BzRlINUA9Bmkq2AsiqmDu7fIjwdQd6iIKiILwWaZ8H6qPqIUDlZgJ8ONK7X+S0UeFO7HzlT6z6wkmu996XwB8F9X7ITn+jhkl84H6H+jZyxtzxAPRDdef+1a2if3durDDVI6KKL7mS0r+sGHdqn958o3exxYHHSzdT8p2/b4WF9KPiPBJNn7oCEydm5V2ZR7tbbVKuWi7xYmrXE0fclscFeqRsr9E9pxfkmkucStTDvLQPvOgfhvbcp9O3w5x2dBYNhyH8Po8U2QkEgzWJ95kgbw0mRXEAKu5kO4X+KmpVbEc0XBuK31/bOgMdjHc+2xZBq+SK6otuM6A==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768177218; c=relaxed/relaxed;
	bh=VdrRkLOMm+ozwUganZNKIj4ayijPT9fY73joHbu3uxA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=dwTjXwj3uAjzq3Jn1sUw0uSacka/QU2DGc01AT8h7Aolb8ZE8wL54Kaho1md1KtNEf6Vevo13kV4wA4vMH4708d2S3q4urJMXWPkr7f5h/IPApE7peRM+VfS1rSzDnoK5Qe8dZYDABgt4DmOPS4l2igPstIv39GD4IiAxpjtN30r/gG5QHMc2nVxeGsg5SfJlSDfoygLCwfs0nCYQolBXkhw4mfqaF3KC4UngkNaHo5tab1xfKwIwt3MOY7wl9FqlB/7mrWHluWbOBILMaa9Z0GB9bYRpjXAN7O848YS59uHRShxcrQIAnjbVVq7RpA0Q1K84AEnSgRZ6kup1crN0Q==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=MYTFZo2Q; dkim-atps=neutral; spf=pass (client-ip=40.93.195.31; helo=sn4pr2101cu001.outbound.protection.outlook.com; envelope-from=balbirs@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=MYTFZo2Q;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=40.93.195.31; helo=sn4pr2101cu001.outbound.protection.outlook.com; envelope-from=balbirs@nvidia.com; receiver=lists.ozlabs.org)
Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012031.outbound.protection.outlook.com [40.93.195.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dqCh06j0zz2yjn
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Jan 2026 11:20:15 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R7nYMm5Rf0TV1vuZIELBwsG9/3Dmp2D1xn/cjvuGAGMn1bIIq/RF1Yl/Kobp5ga1SHhxgrWhFrboYWbZETFJ9CrFws3v8WS05MBehUrTnzdPGHSQQ9Mmdn/7dqMkaqQ63ah9s76EOzHLC5n0rhJfIgSTE/XaESCn0NZ7FR3FwpNQ0+78xCsrGe4Dmeg10Eo42z9e2z71BYL41cZOwT39p8tdrq2bWKdqV0CLwnQTeO8OkRTS+fsO0Z7mpWTZOxRSYCj2bY1u+fawR7IqF6GYwi4VwwBkHrrJO1BbcP8rO56NlbNpotzrVcKLJlRRpP9RvzZ5lGC06Hz54d0GO8eMwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VdrRkLOMm+ozwUganZNKIj4ayijPT9fY73joHbu3uxA=;
 b=rQoGZPlcwDTQ2Y23znudvjHYxDyE+IrFIj8ha68Yt3Rxt7Dfu1zFfNeTZxlKjSFgDWetn8bmyr0pT9HAD6gSZInwoSomjuxqh72bNkhrT2XRqESyDCkEoop3LCE7V6ZRB3ITUiQz5e3tIbVHm/yI9Yt2BdvEvlZZAZoXKhAYuPJqbJRy8+z/dkzuj0FyxkC2cLBg6mTptr3vZzIkrk0VqW1EsSlakhM7AkwWGuGSjKAD9ox8at33h65we2a/oSBrIulc+fAL8vpB9BHOVhm0qUC25C9D2C5dgNl7e097rCLinTv9VVznurJJ0Fde+MYE7STixEijaAP/NwQZ6yflSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VdrRkLOMm+ozwUganZNKIj4ayijPT9fY73joHbu3uxA=;
 b=MYTFZo2QjeMNYUGZga9AYJlivnC8WkNjAJAcdElXBSaOCzjBYHpyzxthjsk6a2+8mb7IGbNz3T9JcKfA3JW0TMN+En5Vs+JPbZlH3eEn47AUpRkGpJYw4UwqRINAywwCzp+mufMFFXaBr9L3YVKiGfbkMG9tcfjPyKVhhUOgBANU46oZM6zI46a9RINn8qGoGsUMHHdhFP57bTv8HMyQdxK3qMGhQuQbpwg1BhDJFyXMd4UIeMORH4T9U6wPS0JNwqy5kh/h20Ga8qec0CeLUq60arTb5D1YSnm/Zol1v03z1EkgnEv/lbUgACg0Cud6yeTtp98HMVJqSKBi2lnPBA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13)
 by DS0PR12MB999106.namprd12.prod.outlook.com (2603:10b6:8:301::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Mon, 12 Jan
 2026 00:19:33 +0000
Received: from PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::2920:e6d9:4461:e2b4]) by PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::2920:e6d9:4461:e2b4%5]) with mapi id 15.20.9499.005; Mon, 12 Jan 2026
 00:19:33 +0000
Message-ID: <874d29da-2008-47e6-9c27-6c00abbf404a@nvidia.com>
Date: Mon, 12 Jan 2026 11:19:23 +1100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/7] mm/zone_device: Add order argument to folio_free
 callback
To: Matthew Wilcox <willy@infradead.org>,
 Francois Dugast <francois.dugast@intel.com>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Matthew Brost <matthew.brost@intel.com>, Zi Yan <ziy@nvidia.com>,
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
Content-Language: en-US
From: Balbir Singh <balbirs@nvidia.com>
In-Reply-To: <aWQlsyIVVGpCvB3y@casper.infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR05CA0073.namprd05.prod.outlook.com
 (2603:10b6:a03:332::18) To PH8PR12MB7277.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: PH8PR12MB7277:EE_|DS0PR12MB999106:EE_
X-MS-Office365-Filtering-Correlation-Id: c21cb57b-1351-43b5-4998-08de517042bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|10070799003|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cWF5aStUQ0J4WlRseS8weDJINEhRMk1UN3BRNWNOcVh0WUliZzZOTGVtZ3l2?=
 =?utf-8?B?RGkrTW9DTUVSVHlXbGVuVXU4TzRVSysvNEVtcmFERXV3eUQwRWg1eGF1NGpG?=
 =?utf-8?B?cm5wTlpkODJ3THJLUUdvTTI1VlZYa044cGErVHppQWdaeS85TmxaMkYzUkh2?=
 =?utf-8?B?cUFyOXVRSVhmenR1SmlhemV5Zml1N1lUSXd5RmtmRGE5UkJ0Q0Y5S3NPdFhF?=
 =?utf-8?B?WjdDNTFGYTQ3WWlOWmtCQTV6SUhPOWVDV28remZ5cTJMOVVoaFZKU3FwcUZW?=
 =?utf-8?B?Wk1xUGhndWRvNVBDRy9uQnVUaW93eDA0Z0kxUjkrVUc5b3czdXJNN050cmdl?=
 =?utf-8?B?dFNrbFZmZyt6Zm5ucFl6djQ0OWpJZEEzRXdrdDFMT1Vvdnh6V3MwaXhEMmxy?=
 =?utf-8?B?YW9ZT1lFNUhKQnRKMm5EdTZ5TlR2aWVIZkNTbGljSTl0RlhjMVdJREdxWllH?=
 =?utf-8?B?aU5DNWM0cHB0QUhvWGVvVzRPRklQZWxiNFNHSlhMcGw2S1g5ZCtBSktheXVm?=
 =?utf-8?B?MEo3VHcvd3dZT003Uk00NzdmMXIybUtVTHg2Q0ROWkpKVlVOTG8xUk5UWVZq?=
 =?utf-8?B?N0I0Q1NHaE15Q0Q5aW8rMEpqZHovdjB5b1JiR0J6eXZuSWFmbCtTZVpWaE5G?=
 =?utf-8?B?NUhEREJscjBreDV3L2tjSnBzMDdOT09EZ1JhM09mek5OMGl0SFBHN2J6dzVq?=
 =?utf-8?B?SjlyL0FHVlFCZ2hwcndIQTNZc01rWmVKaEg0TEdqYStkZjhKVTNEekxEWGI1?=
 =?utf-8?B?Y3dZcWsyaHlWanlZVTBKYjBmNGxRdjhLWkJveDBhK1c0MDV2ODNsaXBRV00r?=
 =?utf-8?B?cHNLeWR4SzBEendCelhoeDk4T3pMQWtEZXZKb01oU0haVUUzbHVuVmpRTzd1?=
 =?utf-8?B?WWNzVnRERnBRZDFWMEtzQ29VL3A5c2ZzTEdPQS9NNWEwN3lnS2RyRUhndE1L?=
 =?utf-8?B?dFFHTlR4ZHNQeG9tbGhaRjZoM05KczhqVXFTT2w2eSt1blJxQkZpMjF2d3Qz?=
 =?utf-8?B?ZlNoR3pMMDJVSC9YdzZvTEZ1TWNMOWFwR2RoT2hwYUVCTEpWdW1FejVhcFlz?=
 =?utf-8?B?WGEyUTJpVDIybUhRQnZmK1dxMEM2NVlnNkh4UVZRZ2VPa1NFWVhndGpSVi9Q?=
 =?utf-8?B?TmQvYzZ1WUM2L0NBbW9IUWtZa0cyaUtHT2xBZXp2Q2pDM21TOGFVYTErRitW?=
 =?utf-8?B?aWNZaDZqaDNhdTNDODJUWDZzcGdFTW1oOEJjemRzdDZkeExPM1J6bzhvdVBw?=
 =?utf-8?B?OWU5SmsvRUpraFpoN01OTDFzQXhOOVRSWjYyenJjZWhXcFpMWHAyU0dxTTJO?=
 =?utf-8?B?MkpoOTQ0MklPdk9DMjB6Z2xtUUszdWF3RE1EOXlkMjNVZU53a2pUeS9GOHU1?=
 =?utf-8?B?RCt1a3dJWmg3cEYxMUwyZGJTZkc3K24rVk5QT1lRajRmTFkyVTdBMDh6UFJt?=
 =?utf-8?B?SC9jOGZ0YkIwNVpOSUI3eFo3L1hWQW1IYTFvcFpSLzIrVVhlSjQwYTJyRTcr?=
 =?utf-8?B?YVYrVWtNdklxSitnNm9YalZlT1k1c0JleHBiTW5tSU95OUhJdktuRElxQkh0?=
 =?utf-8?B?Y2tIaTF6ZFZ6UFBUdmRheGNWUDVKVEFjNjAxSG9xRHlhOVBNOWtQSWhYMU43?=
 =?utf-8?B?czAvNDdSSlVNaHpQbE8vZWtnL3J0TDFTWTFYMHlyeVZhNEp0aHFrS2RaRHdX?=
 =?utf-8?B?OXVaZjlESmxsY1FWUjlZN1ozajVsaFZBbzl5SWxBWWFaak9rQ3dwaGJmblBM?=
 =?utf-8?B?WU9xdHFUTExBVUtQbkYxUHBOcWpwNWY4ZmFsRUkrT2JHNnIvZXBScGpjSDZr?=
 =?utf-8?B?SjJQT05HUlZEL0l5bUlwcGc4Yk01S1ZWVmI0RmxiK2w1NEVXQm1OTzFPQlkw?=
 =?utf-8?B?eUxTVVlBR3RGNS90ZEI0MUVNaGQ3MW9QK2ZOU1NKS2hmUUpKWk9sV3U1UGNi?=
 =?utf-8?Q?RPJqjUf1cHNwT1RcX7gj3NfyczvSSwTd?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7277.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(10070799003)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b3R1RldiS1AyUC9JQjNncnFORmJjQ1F5dWIrcXdaUnJIdVNVYmdFaUtnL2pX?=
 =?utf-8?B?Um5xRXB6WCtGbWFMZkZOVVE1T0ViYVRoTUMvYk96cG5KdXY5YjVTYmIxTFNo?=
 =?utf-8?B?VW9Gaml2c0xLWVJ6aXlZK2luZjQ2WENkaTArOVg5VFUyUXdlTE9qUGxqYXFL?=
 =?utf-8?B?QkRUbjhqWEljTnZ2MUJvTDZUaFdTUXlZL1hSbUpmL2pUTCtFK1dmSGpHQmdP?=
 =?utf-8?B?b1JEa3J4VEFwN1l5YlpmbjcxM0ZqRHhoRVQ4Y3RuZWxCRXFpdVF6ZjRhK3Uz?=
 =?utf-8?B?K3B0Vzg4Q05qdGN0REZsUVBQR28zVkxsbjk1Rmt0R0w2OEVyU1hyVEE4MktP?=
 =?utf-8?B?azFaVXRJMkMxUkVSeFVTblZKYncrLzQxUWpXSFRCVHNCK1NYSW1GQVZCNHJD?=
 =?utf-8?B?YjRISllyZzFyYklsUUdKZ3pJakZNQXF0aDEyb2dTdUpGUGxJODdaZHBrOXZi?=
 =?utf-8?B?d0lHcW93YzBaSWU0VDB3SnpUdmhqWUFXZjJaYTBQbm9IUDdQOXBkL0o4cVdD?=
 =?utf-8?B?V1Q4VWt1Ynl6NmpuamkxT0dBOGptUHd0bHdlWEpkd0htbDlnZFYrbTB1by9W?=
 =?utf-8?B?dzlHTEg4V2picS9ldGdydXhMV00yWEFCelM0L0NGN0pYbkVXTVBHZG5GM3hl?=
 =?utf-8?B?VzhrNzl1TnM4aWZLOXlOcExqNXhNa3VmVEs4UEdmbXdvTFFoMlB0Vm1URklS?=
 =?utf-8?B?UllkUzVEdmJLeTU1RE9Xa1Q1MzNCcXIxQ1N1Vk05TnJEeHRkVjAyZS9kdkJq?=
 =?utf-8?B?VlpWeGpBS0hGZ2g0cHZPN3dnWCtkTDdDc0ZUQ2YxWUx2NlExbWhRMG9aQXBH?=
 =?utf-8?B?QXY3L1IzVDFhV29jV2NhTUFDRXFrVlVSQTBMZGd5QXBLUm9peDRVK1hUT2tU?=
 =?utf-8?B?SUxjSy9PaG1xc0J2cVZZSlFKQzdUMUtBRzdrcElQU29yUU4xdkV0bU9WSGo2?=
 =?utf-8?B?N3NOZ0lMSVBCOHhpS0dySkxsd01qcDgyQjhwZUxSNVNvczZETHRzbzBjWEFF?=
 =?utf-8?B?RWwxL3E0ai83eERIUnk5My9jc0Z1cVhuUk9xQXVERWxyWDZtRUs4N2NsblND?=
 =?utf-8?B?clI2cHQ1U0hiNTJiQjFKWXNrT2w4YWs5a29sd2JGSlVFakZFSGxlUU9GOGlE?=
 =?utf-8?B?cG1ucENrRHAwYTdBSzl1ZU9nZFdqdnVjSzJBRUIyWHJ4TzdsZngzQ244c1Ew?=
 =?utf-8?B?RHBBSSswaXF0VjZWWjlnZUZjV3hKbGJmbmk3akl0L0JycUdEZHVwbisxVHVw?=
 =?utf-8?B?WnpZQVpuZ0lVWUJkdUhEQVVMVDdZdzFxa01CMkJDQkIvaG1yUDdMdW1Lb25X?=
 =?utf-8?B?MzQzOFZ1R3Q5eTA2dHFTWE5DbGx5YkRPYjdkSnQ5TjRIODlkR3l1N0N2SEl3?=
 =?utf-8?B?NGdvT3hqeHJ1eXRWTU9GS0ZxZmVRbzRKQVdGMmtBL1BjcUZZdmxJN1Rhcm15?=
 =?utf-8?B?OW5JY3BRZHpHQW9ta2s2ZzJSNUhSdnkzMmI2VmR6bTYwVk92MWFETWd1dTB4?=
 =?utf-8?B?UFZnQkpZRlJuZHhnWmFRVWVCdmEyQW8yTk5paWtXQWtrVDRFVEljREJUbElM?=
 =?utf-8?B?d3FnQUJsdHc3MmVOOThMOFZKOU5mRlVMakhKWWs1TjB0OUFoRnk4dnBVUkFp?=
 =?utf-8?B?dFRhWjRmZExIZHRVTzZ5bHRTSTlQWjBSaXJJc2N1TFJPcjR5R2J2QlhrUHZa?=
 =?utf-8?B?YUZkam1KT2tYNHdGeG9MK3JJVzNIZ1l6ZkdWdDJpeUg1QlVuYVBjeXhuRFhF?=
 =?utf-8?B?VDgzQUdRWGRuY2toQUpkSmdSTUVNUXkyTmMxamtFdmMxUVdzSnc2ZzBIVk1G?=
 =?utf-8?B?cHg3aFI4cy8wa3FKKzB3VXVzdmNlNkdHTmhvRURXbndobmhoaUNFMEEzQ0JO?=
 =?utf-8?B?NDFZV3lKS1pvbkNLbUkxNFpKenNTSnpmdHovZnBxcWVwUjI5bGV6MW1DRlNu?=
 =?utf-8?B?RzYyV0d5M3l4L0grMDk1YVRkTHd5dlJJazZUaEYyVDdhTkpuOVpTQnk5aFRU?=
 =?utf-8?B?MEVGOTY5bjhOS0JKN2dDcHZnOE84YlhGQnFsbWFDaGpIZ3kwKzc5QzIvUU92?=
 =?utf-8?B?RE5vcHJCR2pqdGh0a3g3Znc3YlJRc0NUVW5FVnVSMklRR29mV3FzQnh4MWlU?=
 =?utf-8?B?K3MydFV4Q1RKelJScXdFT29GemZVcnBSUytuMDRzc29TN1ZsV0RpWXk2aThI?=
 =?utf-8?B?MzNjUUlEOFlaQ3Bjd3RkZlo4R3J0TkN2WGRldkU4bkNyQWJHOXlMeGZsaXd6?=
 =?utf-8?B?ZGVma2tPL3p5S0s0YmJLSjB6OUJqUWNmWFJCZEpURXdPVUtwWjJrZ21OTXJF?=
 =?utf-8?B?TWlXSm54OUNxWm9BTjFQaE05QUJlYlQwelE3QmF3ZVdLSkhKbmtGbzJ5NXl4?=
 =?utf-8?Q?WGMQpnrNqfWfC+SqLFSjCd7xSOMVUlcmT4VY2U+aV5L7S?=
X-MS-Exchange-AntiSpam-MessageData-1: WVS8jmt7PNxYfw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c21cb57b-1351-43b5-4998-08de517042bd
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7277.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2026 00:19:33.2215
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yb4GfrrQH3xS7MIOM3dKh2zCLVCduAeJN3AMqebBFqepQobMbmUILz07to+siA0cNG5xwXk2/bG8iSBFRyvKVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB999106
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 1/12/26 08:35, Matthew Wilcox wrote:
> On Sun, Jan 11, 2026 at 09:55:40PM +0100, Francois Dugast wrote:
>> The core MM splits the folio before calling folio_free, restoring the
>> zone pages associated with the folio to an initialized state (e.g.,
>> non-compound, pgmap valid, etc...). The order argument represents the
>> folio’s order prior to the split which can be used driver side to know
>> how many pages are being freed.
> 
> This really feels like the wrong way to fix this problem.
> 

This stems from a special requirement, freeing is done in two phases

1. Free the folio -> inform the driver (which implies freeing the backing device memory)
2. Return the folio back, split it back to single order folios

The current code does not do 2. 1 followed by 2 does not work for
Francois since the backing memory can get reused before we reach step 2.
The proposed patch does 2 followed 1, but doing 2 means we've lost the 
folio order and thus the old order is passed in. Although, I wonder if the
backing folio's zone_device_data can be used to encode any order information
about the device side allocation.

@Francois, I hope I did not miss anything in the explanation above.

> I think someone from the graphics side really needs to take the lead on
> understanding what the MM is doing (both currently and in the future).
> I'm happy to work with you, but it feels like there's a lot of churn right
> now because there's a lot of people working on this without understanding
> the MM side of things (and conversely, I don't think (m)any people on the
> MM side really understand what graphics cards are trying to accomplish).
> 

I suspect you are referring to folio specialization and/or downsizing?

> Who is that going to be?  I'm happy to get on the phone with someone.

Happy to work with you, but I am not the authority on graphics, I can speak
to zone device folios. I suspect we'd need to speak to more than one person.

Balbir

