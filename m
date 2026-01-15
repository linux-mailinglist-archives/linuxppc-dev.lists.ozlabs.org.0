Return-Path: <linuxppc-dev+bounces-15814-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D5B29D240F1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Jan 2026 12:05:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dsKsF6l77z309H;
	Thu, 15 Jan 2026 22:05:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c111::9" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768475137;
	cv=pass; b=kGRySmjReGJKPK7gw/nmpQsIbFRvSDtNQey4gzfHEGStaNk9ySLelzjeD4O2OZQR+N6MU7wRZuzfrN2TYlfjMAAKej0272FbfAE8XgNdposwrI81udVp86Gzth0rcnSpmS27t6e3++lBD9kRnAndJBFBaftJmDzX27cRBXYwYoPs9M8mxZFTaQTEb3hiXA2Ncxr8R1W5OElQ3yZbJWNX2wgXAVk9hUfQVIdz4WACjyGVDjzKeRMnG5FprEFcQuuNXAOlpaWfcRRo/I3TEPVMUfanRCXUf7vW47wDXqmCGdGENaeJYa5IUw8lHr8If3CP6aFTifxahkweVm72Bz0x9A==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768475137; c=relaxed/relaxed;
	bh=gVV9bHK9EZpE2mxnSfb947mlau3QcBsUbAuA5cbbPM8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=am/emekUEk2UT8IYQBzwu9gsUIYJoGCgW63PExtxCDwL++i2W94B/4rdMsBpRsA6/Yk3J3qcYWFqd/SBdfh0dbt7bNwEhsh03tefwBXHATmgv8byD0aJmmZLCB961jfzGva0Spu6o5Agzxvdf9Hh1+8XEJWjiNc04vw7Ozr/PkfQQZEvWN5TAgE3IXA6JistpYhyywYzoWAdA0QgyzxrXliXz5Gt3O79G+uBacZ6Bn9fJq5oydHmFBj5MbHkyb6mc+nZq2gvC917nZMSRov/BuzKl2PmInKyw1asctFnJUU9k+1O12JCka1z5/jruhFgY3CisnfVaPpu0RdUfOe2/Q==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=RZgrErcc; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c111::9; helo=dm5pr21cu001.outbound.protection.outlook.com; envelope-from=apopple@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=RZgrErcc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:c111::9; helo=dm5pr21cu001.outbound.protection.outlook.com; envelope-from=apopple@nvidia.com; receiver=lists.ozlabs.org)
Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazlp170110009.outbound.protection.outlook.com [IPv6:2a01:111:f403:c111::9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dsKsD0LyVz2xJ6
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Jan 2026 22:05:35 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N0NdQXEDuYExKxWpt2NQQ/Gq+gLGF+n4vZWJQKc4N7l9+1rH0Bo/6df9NXN78NA49gDqkt3etA82PGDr63B8ye+bc/mdi8s/YQ6W0BR0+Iwp6MWp1YL19FzfnR/TIjZyZ90SiKxqznbRng0fcmRHzsO0zGxIGno3Aw2GOBUFywTC0WemD9265czIsgflesD4BPGOZ1oEoKHg836eFb6Td+K3Spjovb7CS6w4iB5LQAZueIc4aQQv6MD2tOqfF8L9U+HiRskNSNlcca7RhliOSjE75Qbng66hszcAbbX5pzqnXyVrI9GFPzH3WrWQYbClhjGvJq9MmaYx6+7qmyPF1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gVV9bHK9EZpE2mxnSfb947mlau3QcBsUbAuA5cbbPM8=;
 b=SLHlSZ6eApOq2YArTKnH0qQL/pkZkBhZ086rpV1MrZrcHrEzK/I9FRYnRjMlcSAWnXXV1+bZfQhPmnv/oT7GPqfT921f2R9p2S1C+SUwJGqS2ZOlBUO2Cid7ZF4gc/rgoqfzK4v17S5bvbr3ID4GbO+Jnp5FfU4fiO/OKEOe8Nhg2o/mbQ257b/IpXmehw1mm7MgY1BBWntPjf4ykyhuL/KG9WpEBiRG6AZKpqz0Uume94TOCrVXWGlk4uP8KbC6o3C4xTMu4f0yftrHsI/DtLwLAGkpZnPyQ2R0p1GJdQXlgjXDFxOkOozKAY6MM3j21uOEJKVgVIvIQf1SiFuXRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gVV9bHK9EZpE2mxnSfb947mlau3QcBsUbAuA5cbbPM8=;
 b=RZgrErccx4fURJ97Q165deH/vmXFs4N5KBoGjR9AQltxiK5UctlSyzwtAM17Wdkl9HkFwe5NREB+LQ7MsugR7dCt41bC7wmRfNz7KF48AFE+dSlztZPcOdh4EHCrYIJMbiPIbe8W6beTjnEGCXY0YaOJI7mw2oA94SZ8oH5e3iP8CmXOiJHW7Fxq5uoWEboxm4mC/pRd90ulu8vSLCX38TA8wX5q/i4Z+dNQ1eLR9T5D2aUg2vM/QN0KX9iod0eGw+McG5fzBHSJw3qeFUnaR3kYdrjc5minX8FlMTbd2gJo5JpanO7556lnqjpVdpeGfig8QN2Do+9Ui+bsViJJzA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 PH0PR12MB7488.namprd12.prod.outlook.com (2603:10b6:510:1e9::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.4; Thu, 15 Jan
 2026 11:05:05 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%4]) with mapi id 15.20.9520.005; Thu, 15 Jan 2026
 11:05:05 +0000
Date: Thu, 15 Jan 2026 22:05:00 +1100
From: Alistair Popple <apopple@nvidia.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: Francois Dugast <francois.dugast@intel.com>, 
	intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org, Zi Yan <ziy@nvidia.com>, 
	adhavan Srinivasan <maddy@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
	Felix Kuehling <Felix.Kuehling@amd.com>, Alex Deucher <alexander.deucher@amd.com>, 
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>, 
	David Hildenbrand <david@kernel.org>, Oscar Salvador <osalvador@suse.de>, 
	Andrew Morton <akpm@linux-foundation.org>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Leon Romanovsky <leon@kernel.org>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	"Liam R . Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Michal Hocko <mhocko@suse.com>, Balbir Singh <balbirs@nvidia.com>, linuxppc-dev@lists.ozlabs.org, 
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org, 
	nouveau@lists.freedesktop.org, linux-mm@kvack.org, linux-cxl@vger.kernel.org
Subject: Re: [PATCH v5 1/5] mm/zone_device: Reinitialize large zone device
 private folios
Message-ID: <nvhjddzmdf34cbjnxmka6ir6smkokn7dlp2aa36ymvofmbo3qh@lugxvx5xlvud>
References: <20260114192111.1267147-1-francois.dugast@intel.com>
 <20260114192111.1267147-2-francois.dugast@intel.com>
 <6spceodgfobizdaziju4yvvfydwvvik2wjyoyfuglozq533rgl@vmkotau3m3kw>
 <aWiBy3nZ4FrPYURF@lstrano-desk.jf.intel.com>
 <aWiGtlKI3LOtjUl6@lstrano-desk.jf.intel.com>
 <pgz2mhy4si2tu4iwusabjxxi4nctz3lamnpbg7773a2mp7srph@bz3ovwxuyakq>
 <aWiall34yq5Eupkf@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aWiall34yq5Eupkf@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: SY5P300CA0007.AUSP300.PROD.OUTLOOK.COM
 (2603:10c6:10:1fb::9) To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
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
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|PH0PR12MB7488:EE_
X-MS-Office365-Filtering-Correlation-Id: 58907495-9b34-4034-a6d2-08de5425efbc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dFRpWUxmWFppM2xtZDlOcTl6RitqWmpIbUM3Z0l2NGFwNjFEZytycGRCTFJk?=
 =?utf-8?B?eXl0emZlYm8waFJsRGNzbDgyQ2lEc2NlUXYyeVJUUnJsRy80NkdnUWYxdnRS?=
 =?utf-8?B?N0dVUXVRejF5MFpvRUZMQys3MEU2cWExSFUwMGxFNWpkbEI1aW1lckYzdGdP?=
 =?utf-8?B?bHpEWFdaNjVITE8xL2M4WWJBaVVBc2NyNWlCY2o2SWZWMjVrRlJlUkZmVHYy?=
 =?utf-8?B?Sm8rTzcyTWVrZTh1UEVPaEZxaGEvVXFBd245SGtHWmdxYTJha0hUS1ZFVE1r?=
 =?utf-8?B?a09IRHUyRmM0NUtZa0swUXp6UnlSa3pGSGpvcHoxWmRVTVJ1YW1tMnViZmpV?=
 =?utf-8?B?UUx4Tktyajc2dWFMa2RXSVJXdE15QXliL1d0L3E2ZWVuc2l6MmM2MHN6SU1x?=
 =?utf-8?B?amgwZStDcWxpcGIvZVV5OEdjR1pFOFhDbDBhNllZcm4vSnQ0d0xCSkJGdld5?=
 =?utf-8?B?TFNXbmNnQ3pUUFVwc0RtamlHZmhZZDBTUFZaVFAvRXgrK21mZ2VvUGVoUXZv?=
 =?utf-8?B?aG1UeFNlNUc4cmM0eVFLOEdYa2pGODc0WjZ1cWd1SklUUXhrZk9TUTZibENK?=
 =?utf-8?B?YTBOSU5OdC8valNKN2lkYVVQaHVUU1NlNzNNSkZ6bDhlVnJQMk40UU9ORkUy?=
 =?utf-8?B?UWtoVnI4dnVXMmRTT01QRElDSUpWQ29mTXo1QzRMQzhjeTB2NUhyckZ6eVFN?=
 =?utf-8?B?QzJCWFI3SUVyNlBYZnV3RThlU2NmQ3BlTmliaU1IWEo1YzFmcDd4QVd6OWFS?=
 =?utf-8?B?bG1LUUszclJjOW5VKzBnbEJEaklLZ25JbG05MEdyOUhyZUt0aUlGWlYyOE0r?=
 =?utf-8?B?WHQ2OCtVQUtDZEFTcXJDMzlsQmNXdmJkMlNjTTd1Ny8yNFhnTTZHY0U1aWdP?=
 =?utf-8?B?WFY0ZHdnMG1YSTk0WUM0QU9vcW03bHUzNU8wUkRUSlNVTWhtSHNsVTJUQzBE?=
 =?utf-8?B?NW1BeHE5ak5Dc0VQRkExKzZKUkNNWnhDc3RIV0dJVGRFZnY5SnFMWUZaYTZV?=
 =?utf-8?B?UWpOTmovcUZnTjdGNUtsbkErbFlPT1ZjbXVGQjczdkRsK2FIVm5SMzFpM3JO?=
 =?utf-8?B?SmFOWWN5WG11VWgvTTNBanZReWdxRDBSUm5sNmU0TG9GRlY2UWdrWTgxR1pT?=
 =?utf-8?B?bUx0cnlESXZZSU1qYTNHL1ZpYllqdDE2Vis5OVdEaWhIdGY3K2gxbWtaUDg2?=
 =?utf-8?B?bG9FdDJNTSt4Ris4cnROdGRkTDVkd0pkbXFNVnVEd2EwUlYzZzlFWEVTWG5l?=
 =?utf-8?B?WXZqV1BySk1KNjdJQ0lMTUQ4WXk2c1REN25vYnlPMEw0azZ4N0xIOVl6Tkxp?=
 =?utf-8?B?TDR5ZXdPdk1IdUFXOEF4RDFYVTJRVTIxdExtSm5wK0N0WjZmWkxRczR5S3hM?=
 =?utf-8?B?dmxZNEZLUFgzblYwZFNmL3hGRFhLdW5iL2dyMjl2RG5VUlp3MDFLNUo4R0d4?=
 =?utf-8?B?NEhZRVVRdm9kejFkNEh6b2Erb3p0ek16REJ0dVcvcXZZY2NZazA5UGNnUXJL?=
 =?utf-8?B?dEc3TmxGbnNMMUdDaVlnNlRxYjVwSzNBSUVHNDJuQkVDTVE5MmlyWVcyMlFw?=
 =?utf-8?B?Z2pmTURYZWhTVm00ek1uNFZaMnlJTDlmZzFaY1dDMFMraU1NZDZ3YnU1ajNx?=
 =?utf-8?B?NTBaZmFoSUQrc3BvZURRL2hCTzF2bS9tQzcwanM1UGYwSmVPMWZyUUhwZ284?=
 =?utf-8?B?QmVvYUVGTXRQNW1PT2pzeTAvOHczMGFOSWRVSElVRUE0RjJGMElLRk8wZ2JY?=
 =?utf-8?B?N0RmK0lmdkFkN1VaWmZYa1Y5Z1lXU1pkNjlXYXZPYTJ1UEhVaUg0UEMzVE9Z?=
 =?utf-8?B?SWc2eW9KZXEzaUNlK0MvNm04ZkhJc1orc09LWllxRG9sQThEbytrdXpUbUhN?=
 =?utf-8?B?QmhtZHNwRzcrbGdHMGRkSXNYV3ZqOXBnVm9zcFc0TisxWDczZ3V3OU00WDJH?=
 =?utf-8?B?YVJPQ3RYZXNYV3RrRFBBR0VzalVDTnZ4N1hSaHJVNmZ2ait6N1hrbU1DeVFH?=
 =?utf-8?B?eGhpQ3ROdnFsNSthaENVOWlwNzg5ZWNPZDRkZE03ekF2SnovUnkyak1Td25U?=
 =?utf-8?B?OHJGYnRaSTlDaFVqVmlNQThYRSs0ZTZzWXBvK0w1SDJPSlF0ajNGMlUvMDZD?=
 =?utf-8?Q?zvkk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB7726.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VE84UUhLMTdFQTRzTTZtM3R2Y1IvQnc4UXJDQ3ZaSjNablVlUHN2NFl6R0Fr?=
 =?utf-8?B?RzlIcS9KNUxPN1N1NnA5NmhRWkhNZldXMWU1SElQWiswakFvMWRjbVVWV043?=
 =?utf-8?B?YlFrK3RMTk5rMkgvcmkwd2hiUkJuYkEvdElKQ08wU3dYM0NIZisrcHdFQjJR?=
 =?utf-8?B?bXY5bXl3QXhxT2pMblE0YW5TWExWa2t0bUR4blZwMmRWejB1SWhLbFdQbHlV?=
 =?utf-8?B?cnB4RlhCek9HVEoyZSsweFM3YWFSRGx0YXViOVNJeTdrWkVicEVIRGpmWTFL?=
 =?utf-8?B?amZEa0FjbjNTZlJVbkN2aGRLSWdoMHBJcWZlT25ZNmpNVFBmd081RmhRUGZJ?=
 =?utf-8?B?NHhFYW1KVG42ZzFmaVZYbjRmT3Q4MnUwM3lQRG02NURKWXFGeWRmWmFyZDFr?=
 =?utf-8?B?RHhuRFVhNWpZdTErUGh3eWJaeklhdGlyTUU0Qk9rZWp1ZThLYUF6VE1IS0VO?=
 =?utf-8?B?NENKOXhKK3Fya2YwNlQyVERGTUJ5WFlheld2OVVTY3FQYTRBNlcwV0gxc2Vw?=
 =?utf-8?B?NGlVZmljZ1N1ajBHeFBYTzR5a0FmdnBDc2s0eDIvSjB0dEdWZ2x4QlpZNytZ?=
 =?utf-8?B?YlVjaGNURDFONGUzWmYzcnpKRlc1YmlMMkZ3T1RXV25hTmRWUE1MbCtWam95?=
 =?utf-8?B?UWdCSC9Xa2ZuTUZQUDdYanBQOWpIUjhtNlI1L1FxcFdERFAyQ2Q3UTA4d2Jq?=
 =?utf-8?B?SHhobmxHWFcxSm9DVWlNOFVKbjFoVlc0Zk8rVitjUkNTWnVNY293MFoxenR1?=
 =?utf-8?B?Q1lDZ2RhNXFSU29PNFNVNUM1WDh4enQ5VElwbkh6VkxXOGNIa3RmdDVQU2s0?=
 =?utf-8?B?b0FXdHNSQkY4RllqMjdzcnQxSElYMVphcnp2MWdBSDJsdGVtTmFrbVljVjVz?=
 =?utf-8?B?Wk9XcmJLeDhNb0VsYU9uTFc3TXRCekxzbDI2RG95emZhcnhTOW1ZbUU1VENI?=
 =?utf-8?B?bzMzT2cvaUZOMlQwZHVMVjdhem1hKzEva1hDR252c2VIcTJBU3djMlhyUHhy?=
 =?utf-8?B?YWY3L0lGRjFqSllsdmQ1VWVYQnRITk9NcEttT2o3U1hhL2gweklEZzBQQnQ1?=
 =?utf-8?B?UXlxbkF5THJITURkbmVteExLZXk0YmNkUi9GWHJUZXpYZXpKRVM3TVA1WmdZ?=
 =?utf-8?B?ZXRrYzA5bmpyZ2tHQ3BmSXNDRndIUHM2N3hqMzVUWmQ2ZHlFeDArd3ZaZjhz?=
 =?utf-8?B?a0VqamdYeXBESEJ2aHdJSUIzM3ZPcElWYnhOQUF2MmxaOWFvaWVQWlI2eXkz?=
 =?utf-8?B?akNXNE9Eam10dk9Bb1ZyRzF5MTFvcllBRjZqMXpiZW00eWV5ZmVlRkxZZ2dF?=
 =?utf-8?B?dkQ4TWtRbzVsRGdibFc5SGRaNGZxcFo0Q0tjcHpZS1Z2cUxoczVKbSs2K2VX?=
 =?utf-8?B?b2huMFRablRldlI4b0dVTGFWeU8yUllmTlVxdURaNkNTOHF2Q09TK2RBTmxy?=
 =?utf-8?B?UEZmNExEd2hHLzhObERXeGdxSm1lNUdPaTlMb0VET2FqKzRQV09IL0w4T1Fi?=
 =?utf-8?B?clVGQTBZTEx0dHQzdzErVXI5OHIzUTU1ZFBkK1FZYjMweC9vUDFvQXp3MVcy?=
 =?utf-8?B?Q1Bvb2JmVlcycVp1RUJ0L2UvTmhQZ05UR29NSmNIblF2aUVqRkEyMlVRVi8w?=
 =?utf-8?B?dlJTbWhMbFlTUjFKZWw5b29nYXBsNXdkM3hwbkxqVlArRWhueHJod1RXVFA5?=
 =?utf-8?B?U3R0cUIwTElzN2dOQmxYakh2dlhzUEVTM0dBc1hYUWdsVGFjMWZuejZvOVIr?=
 =?utf-8?B?UWNLSlBJMDZpdnMvOGdkRXE1VE05eWVMR0lWOUdWYSs3OGM0QVJYNVVqSEFK?=
 =?utf-8?B?Y0hGNGo3RGxRTG9mQlBFR0l2UWR3OVNQVUdUK1RmaTkvZGtBNWRFNWtNTk5w?=
 =?utf-8?B?dDE5YjJsMC9RdUF4QzVkcGtWZC9qOHdESkE1S1g3dTIzeFZBODQ1MVJ4NHln?=
 =?utf-8?B?Ui9SWmg1UXo3MEVscnZhMG5jYzZicHBrOVBRUHJleE1FbjU3c1grOFdMMzBw?=
 =?utf-8?B?cHhyVDF3K0dzbTlxc095OEFHdVRTVXNOZk53cjNzSk9kM2ZaQUthaDB0RlNC?=
 =?utf-8?B?OWYweFUrNFhIM3JOa29ZYnlPa1pja2NadVhQa3hmc2ZZc2hvM3FicnpXODdQ?=
 =?utf-8?B?VWVWVlV1Y0lTVlp0SHJHUW1FVUdCYnJMaVJ0Y0svL3BsUDFaVk1PMDlOQ0hx?=
 =?utf-8?B?SmNLWXExRmlJME1SUFBwRVk3T0k1amhJK01xRXdqYzJvMVRtNDlzMkRyU0pz?=
 =?utf-8?B?OTYxOVJRU0NzTUpoWXgrTW51T1VDSFFRNVdPdDRuamJsejhTZXBFeWhFeE9X?=
 =?utf-8?B?Yys3b0Z1VGN6WUpnSHNDTm5OakxhSDJEeGJneWRPcnNTYlRxWmREZz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58907495-9b34-4034-a6d2-08de5425efbc
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 11:05:05.0327
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kgIi12k7Pe1Wd0O3in+95As/ROlrQaSsDxFD24JhdPCmvy6+UXrS3tuDX0DEmqmoiAKGCmPEXH8lsmNlTNm0Xg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7488
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_NONE,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 2026-01-15 at 18:43 +1100, Matthew Brost <matthew.brost@intel.com> wrote...
> On Thu, Jan 15, 2026 at 06:07:08PM +1100, Alistair Popple wrote:
> > On 2026-01-15 at 17:18 +1100, Matthew Brost <matthew.brost@intel.com> wrote...
> > > On Wed, Jan 14, 2026 at 09:57:31PM -0800, Matthew Brost wrote:
> > > > On Thu, Jan 15, 2026 at 04:27:26PM +1100, Alistair Popple wrote:
> > > > > On 2026-01-15 at 06:19 +1100, Francois Dugast <francois.dugast@intel.com> wrote...
> > > > > > From: Matthew Brost <matthew.brost@intel.com>
> > > > > > 
> > > > > > Reinitialize metadata for large zone device private folios in
> > > > > > zone_device_page_init prior to creating a higher-order zone device
> > > > > > private folio. This step is necessary when the folio’s order changes
> > > > > > dynamically between zone_device_page_init calls to avoid building a
> > > > > > corrupt folio. As part of the metadata reinitialization, the dev_pagemap
> > > > > > must be passed in from the caller because the pgmap stored in the folio
> > > > > > page may have been overwritten with a compound head.
> > > > > 
> > > > > Thanks for fixing, a couple of minor comments below.
> > > > > 
> > > > > > Cc: Zi Yan <ziy@nvidia.com>
> > > > > > Cc: Alistair Popple <apopple@nvidia.com>
> > > > > > Cc: adhavan Srinivasan <maddy@linux.ibm.com>
> > > > > > Cc: Nicholas Piggin <npiggin@gmail.com>
> > > > > > Cc: Michael Ellerman <mpe@ellerman.id.au>
> > > > > > Cc: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
> > > > > > Cc: Felix Kuehling <Felix.Kuehling@amd.com>
> > > > > > Cc: Alex Deucher <alexander.deucher@amd.com>
> > > > > > Cc: "Christian König" <christian.koenig@amd.com>
> > > > > > Cc: David Airlie <airlied@gmail.com>
> > > > > > Cc: Simona Vetter <simona@ffwll.ch>
> > > > > > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > > > > > Cc: Maxime Ripard <mripard@kernel.org>
> > > > > > Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > > > > > Cc: Lyude Paul <lyude@redhat.com>
> > > > > > Cc: Danilo Krummrich <dakr@kernel.org>
> > > > > > Cc: David Hildenbrand <david@kernel.org>
> > > > > > Cc: Oscar Salvador <osalvador@suse.de>
> > > > > > Cc: Andrew Morton <akpm@linux-foundation.org>
> > > > > > Cc: Jason Gunthorpe <jgg@ziepe.ca>
> > > > > > Cc: Leon Romanovsky <leon@kernel.org>
> > > > > > Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> > > > > > Cc: Liam R. Howlett <Liam.Howlett@oracle.com>
> > > > > > Cc: Vlastimil Babka <vbabka@suse.cz>
> > > > > > Cc: Mike Rapoport <rppt@kernel.org>
> > > > > > Cc: Suren Baghdasaryan <surenb@google.com>
> > > > > > Cc: Michal Hocko <mhocko@suse.com>
> > > > > > Cc: Balbir Singh <balbirs@nvidia.com>
> > > > > > Cc: linuxppc-dev@lists.ozlabs.org
> > > > > > Cc: kvm@vger.kernel.org
> > > > > > Cc: linux-kernel@vger.kernel.org
> > > > > > Cc: amd-gfx@lists.freedesktop.org
> > > > > > Cc: dri-devel@lists.freedesktop.org
> > > > > > Cc: nouveau@lists.freedesktop.org
> > > > > > Cc: linux-mm@kvack.org
> > > > > > Cc: linux-cxl@vger.kernel.org
> > > > > > Fixes: d245f9b4ab80 ("mm/zone_device: support large zone device private folios")
> > > > > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > > > > Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> > > > > > ---
> > > > > >  arch/powerpc/kvm/book3s_hv_uvmem.c       |  2 +-
> > > > > >  drivers/gpu/drm/amd/amdkfd/kfd_migrate.c |  2 +-
> > > > > >  drivers/gpu/drm/drm_pagemap.c            |  2 +-
> > > > > >  drivers/gpu/drm/nouveau/nouveau_dmem.c   |  2 +-
> > > > > >  include/linux/memremap.h                 |  9 ++++++---
> > > > > >  lib/test_hmm.c                           |  4 +++-
> > > > > >  mm/memremap.c                            | 20 +++++++++++++++++++-
> > > > > >  7 files changed, 32 insertions(+), 9 deletions(-)
> > > > > > 
> > > > > > diff --git a/arch/powerpc/kvm/book3s_hv_uvmem.c b/arch/powerpc/kvm/book3s_hv_uvmem.c
> > > > > > index e5000bef90f2..7cf9310de0ec 100644
> > > > > > --- a/arch/powerpc/kvm/book3s_hv_uvmem.c
> > > > > > +++ b/arch/powerpc/kvm/book3s_hv_uvmem.c
> > > > > > @@ -723,7 +723,7 @@ static struct page *kvmppc_uvmem_get_page(unsigned long gpa, struct kvm *kvm)
> > > > > >  
> > > > > >  	dpage = pfn_to_page(uvmem_pfn);
> > > > > >  	dpage->zone_device_data = pvt;
> > > > > > -	zone_device_page_init(dpage, 0);
> > > > > > +	zone_device_page_init(dpage, &kvmppc_uvmem_pgmap, 0);
> > > > > >  	return dpage;
> > > > > >  out_clear:
> > > > > >  	spin_lock(&kvmppc_uvmem_bitmap_lock);
> > > > > > diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
> > > > > > index af53e796ea1b..6ada7b4af7c6 100644
> > > > > > --- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
> > > > > > +++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
> > > > > > @@ -217,7 +217,7 @@ svm_migrate_get_vram_page(struct svm_range *prange, unsigned long pfn)
> > > > > >  	page = pfn_to_page(pfn);
> > > > > >  	svm_range_bo_ref(prange->svm_bo);
> > > > > >  	page->zone_device_data = prange->svm_bo;
> > > > > > -	zone_device_page_init(page, 0);
> > > > > > +	zone_device_page_init(page, page_pgmap(page), 0);
> > > > > >  }
> > > > > >  
> > > > > >  static void
> > > > > > diff --git a/drivers/gpu/drm/drm_pagemap.c b/drivers/gpu/drm/drm_pagemap.c
> > > > > > index 03ee39a761a4..c497726b0147 100644
> > > > > > --- a/drivers/gpu/drm/drm_pagemap.c
> > > > > > +++ b/drivers/gpu/drm/drm_pagemap.c
> > > > > > @@ -201,7 +201,7 @@ static void drm_pagemap_get_devmem_page(struct page *page,
> > > > > >  					struct drm_pagemap_zdd *zdd)
> > > > > >  {
> > > > > >  	page->zone_device_data = drm_pagemap_zdd_get(zdd);
> > > > > > -	zone_device_page_init(page, 0);
> > > > > > +	zone_device_page_init(page, zdd->dpagemap->pagemap, 0);
> > > > > >  }
> > > > > >  
> > > > > >  /**
> > > > > > diff --git a/drivers/gpu/drm/nouveau/nouveau_dmem.c b/drivers/gpu/drm/nouveau/nouveau_dmem.c
> > > > > > index 58071652679d..3d8031296eed 100644
> > > > > > --- a/drivers/gpu/drm/nouveau/nouveau_dmem.c
> > > > > > +++ b/drivers/gpu/drm/nouveau/nouveau_dmem.c
> > > > > > @@ -425,7 +425,7 @@ nouveau_dmem_page_alloc_locked(struct nouveau_drm *drm, bool is_large)
> > > > > >  			order = ilog2(DMEM_CHUNK_NPAGES);
> > > > > >  	}
> > > > > >  
> > > > > > -	zone_device_folio_init(folio, order);
> > > > > > +	zone_device_folio_init(folio, page_pgmap(folio_page(folio, 0)), order);
> > > > > >  	return page;
> > > > > >  }
> > > > > >  
> > > > > > diff --git a/include/linux/memremap.h b/include/linux/memremap.h
> > > > > > index 713ec0435b48..e3c2ccf872a8 100644
> > > > > > --- a/include/linux/memremap.h
> > > > > > +++ b/include/linux/memremap.h
> > > > > > @@ -224,7 +224,8 @@ static inline bool is_fsdax_page(const struct page *page)
> > > > > >  }
> > > > > >  
> > > > > >  #ifdef CONFIG_ZONE_DEVICE
> > > > > > -void zone_device_page_init(struct page *page, unsigned int order);
> > > > > > +void zone_device_page_init(struct page *page, struct dev_pagemap *pgmap,
> > > > > > +			   unsigned int order);
> > > > > >  void *memremap_pages(struct dev_pagemap *pgmap, int nid);
> > > > > >  void memunmap_pages(struct dev_pagemap *pgmap);
> > > > > >  void *devm_memremap_pages(struct device *dev, struct dev_pagemap *pgmap);
> > > > > > @@ -234,9 +235,11 @@ bool pgmap_pfn_valid(struct dev_pagemap *pgmap, unsigned long pfn);
> > > > > >  
> > > > > >  unsigned long memremap_compat_align(void);
> > > > > >  
> > > > > > -static inline void zone_device_folio_init(struct folio *folio, unsigned int order)
> > > > > > +static inline void zone_device_folio_init(struct folio *folio,
> > > > > > +					  struct dev_pagemap *pgmap,
> > > > > > +					  unsigned int order)
> > > > > >  {
> > > > > > -	zone_device_page_init(&folio->page, order);
> > > > > > +	zone_device_page_init(&folio->page, pgmap, order);
> > > > > >  	if (order)
> > > > > >  		folio_set_large_rmappable(folio);
> > > > > >  }
> > > > > > diff --git a/lib/test_hmm.c b/lib/test_hmm.c
> > > > > > index 8af169d3873a..455a6862ae50 100644
> > > > > > --- a/lib/test_hmm.c
> > > > > > +++ b/lib/test_hmm.c
> > > > > > @@ -662,7 +662,9 @@ static struct page *dmirror_devmem_alloc_page(struct dmirror *dmirror,
> > > > > >  			goto error;
> > > > > >  	}
> > > > > >  
> > > > > > -	zone_device_folio_init(page_folio(dpage), order);
> > > > > > +	zone_device_folio_init(page_folio(dpage),
> > > > > > +			       page_pgmap(folio_page(page_folio(dpage), 0)),
> > > > > > +			       order);
> > > > > >  	dpage->zone_device_data = rpage;
> > > > > >  	return dpage;
> > > > > >  
> > > > > > diff --git a/mm/memremap.c b/mm/memremap.c
> > > > > > index 63c6ab4fdf08..6f46ab14662b 100644
> > > > > > --- a/mm/memremap.c
> > > > > > +++ b/mm/memremap.c
> > > > > > @@ -477,10 +477,28 @@ void free_zone_device_folio(struct folio *folio)
> > > > > >  	}
> > > > > >  }
> > > > > >  
> > > > > > -void zone_device_page_init(struct page *page, unsigned int order)
> > > > > > +void zone_device_page_init(struct page *page, struct dev_pagemap *pgmap,
> > > > > > +			   unsigned int order)
> > > > > >  {
> > > > > > +	struct page *new_page = page;
> > > > > > +	unsigned int i;
> > > > > > +
> > > > > >  	VM_WARN_ON_ONCE(order > MAX_ORDER_NR_PAGES);
> > > > > >  
> > > > > > +	for (i = 0; i < (1UL << order); ++i, ++new_page) {
> > > > > > +		struct folio *new_folio = (struct folio *)new_page;
> > > > > > +
> > > > > > +		new_page->flags.f &= ~0xffUL;	/* Clear possible order, page head */
> > > > > 
> > > > > This seems odd to me, mainly due to the "magic" number. Why not just clear
> > > > > the flags entirely? Or at least explicitly just clear the flags you care about
> > > > > which would remove the need for the comment and  should let you use the proper
> > > > > PageFlag functions.
> > > > > 
> > > > 
> > > > I'm copying this from folio_reset_order [1]. My paranoia about touching
> > > > anything related to struct page is high, so I did the same thing
> > > > folio_reset_order does here.
> > 
> > So why not just use folio_reset_order() below?
> > 
> > > > 
> > > > [1] https://elixir.bootlin.com/linux/v6.18.5/source/include/linux/mm.h#L1075
> > > > 
> > > 
> > > This immediately hangs my first SVM test...
> > > 
> > > diff --git a/mm/memremap.c b/mm/memremap.c
> > > index 6f46ab14662b..ef8c56876cf5 100644
> > > --- a/mm/memremap.c
> > > +++ b/mm/memremap.c
> > > @@ -488,7 +488,7 @@ void zone_device_page_init(struct page *page, struct dev_pagemap *pgmap,
> > >         for (i = 0; i < (1UL << order); ++i, ++new_page) {
> > >                 struct folio *new_folio = (struct folio *)new_page;
> > > 
> > > -               new_page->flags.f &= ~0xffUL;   /* Clear possible order, page head */
> > > +               new_page->flags.f = 0;
> > >  #ifdef NR_PAGES_IN_LARGE_FOLIO
> > >                 ((struct folio *)(new_page - 1))->_nr_pages = 0;
> > 
> > This seems wrong to me - I saw your reply to Balbir but for an order-0 page
> > isn't this going to access a completely different, possibly already allocated,
> > page?
> > 
> 
> No — it accesses itself (new_page). It just uses some odd memory tricks
> for this, which I agree isn’t the best thing I’ve ever written, but it
> was the least-worst idea I had. I didn’t design the folio/page field
> aliasing; I understand why it exists, but it still makes my head hurt.

And obviously mine, because I (was) still not getting it and had typed up a
whole response and code walk through to show what was wrong, in the hope it
would help settle the misunderstanding. Which it did, because I discovered
where I was getting things wrong. But I've left the analysis below because it's
probably useful for others following along:

Walking through the code we have:

void zone_device_page_init(struct page *page, struct dev_pagemap *pgmap,
			   unsigned int order)
{

The first argument, page, is the first in a set of 1 << order contiguous
struct page. In the simplest case order == 0, meaning this function should only
initialise (ie. touch) a single struct page pointer which is passed as the first
argument to the function.

	struct page *new_page = page;

So now *new_page points to the single struct page we should touch.
	
	unsigned int i;

	VM_WARN_ON_ONCE(order > MAX_ORDER_NR_PAGES);

	for (i = 0; i < (1UL << order); ++i, ++new_page) {

order == 0, so this loop will only execute once.

		struct folio *new_folio = (struct folio *)new_page;

new_page still points to the single page we're initialising, and new_folio
points to the same page. Ie: &new_folio->page == new_page. There is a hazard
here because new_folio->__page_1, __page_2, etc. all point to pages we shouldn't
touch.

		new_page->flags.f &= ~0xffUL;	/* Clear possible order, page head */

Clears the flags, makes sense.

#ifdef NR_PAGES_IN_LARGE_FOLIO
		((struct folio *)(new_page - 1))->_nr_pages = 0;

If we break this down we have:

struct page *tmp_new_page = new_page - 1;

Which is the page before the one we're initialising and shouldn't be touched.
Then we cast to a folio:

struct folio *tmp_new_folio = (struct folio *) tmp_new_page;

And reset _nr_pages:

tmp_new_folio->_nr_pages = 0

And now I can see where I was confused - &tmp_new_folio->_nr_pages == &tmp_new_folio->__page_1->memcg_data == &new_page->memcg_data

So after both Balbir, probably yourself, and definitely myself scratching our
heads for way too long over this change I think we can conclude that the code as
is is way too confusing to merge without a lot more comments :-)

However why go through all this magic in the first place? Why not just treat
everything here as a page and just do

	new_page->memcg_data = 0

directly? That seems like the more straight forward approach. In fact given
all the confusion I wonder if it wouldn't be better to just do
memset(new_page, 0, sizeof(*new_page)) and reinitialise everything from
scratch.

> folio->_nr_pages is page + 1 for reference (new_page after this math).
> Again, if I touched this memory directly in new_page, it’s most likely
> memcg_data, but that is hidden behind a Kconfig.
> 
> This just blindly implementing part of folio_reset_order which clears
> _nr_pages.

Yeah, I get it now. But I think just clearing memcg_data would be the easiest to
understand approach, especially if it had a comment explaining that it may have
previously been used for _nr_pages.

> > >  #endif
> > > 
> > > I can walk through exactly which flags need to be cleared, but my
> > > feeling is that likely any flag that the order field overloads and can
> > > possibly encode should be cleared—so bits 0–7 based on the existing
> > > code.
> > > 
> > > How about in a follow-up we normalize setting / clearing the order flag
> > > field with a #define and an inline helper?
> > 
> > Ie: Would something like the following work:
> > 
> > 		ClearPageHead(new_page);
> 
> Any of these bit could possibly be set the order field in a folio, which
> modifies page + 1 flags field.
> 
> 	PG_locked,		/* Page is locked. Don't touch. */
> 	PG_writeback,		/* Page is under writeback */
> 	PG_referenced,
> 	PG_uptodate,
> 	PG_dirty,
> 	PG_lru,
> 	PG_head,		/* Must be in bit 6 */
> 	PG_waiters,		/* Page has waiters, check its waitqueue. Must be bit #7 and in the same byte as "PG_locked" */
> 
> So a common order-9 (2MB) folio would have PG_locked | PG_uptodate set.
> Now we get stuck on the next page lock because PG_locked is set.
> Offhand, I don’t know if different orders—which set different bits—cause
> any nasty issues either. So I figured the safest thing was clear any
> bits which folio order can set within subsequent page's memory flags
> like folio_reset_order does.

Oh, I get the above. I was thinking folio_reset_order() below would clear the
flags, but I see the folly there - that resets the flags for the next page.

> 
> > 		clear_compound_head(new_page);
> > 		folio_reset_order(new_folio);
> > 
> > Which would also deal with setting _nr_pages.
> >
> 
> folio_reset_order(new_folio) would set _nr_pages in the memory that is
> new_page + 1. So let's say that page has a ref count + memcg_data, now
> that memory is corrupted and will crash the kernel.

Yep, I just noticed that. Thanks for pointing that out.

> All of the above is why is took me multiple hours to write 6 lines of
> code :).

And to review :) Good thing we don't get paid per SLOC of code right?

 - Alistair

> > > Matt
> > > 
> > > > > > +#ifdef NR_PAGES_IN_LARGE_FOLIO
> > > > > > +		((struct folio *)(new_page - 1))->_nr_pages = 0;
> > > > > > +#endif
> > > > > > +		new_folio->mapping = NULL;
> > > > > > +		new_folio->pgmap = pgmap;	/* Also clear compound head */
> > > > > > +		new_folio->share = 0;   /* fsdax only, unused for device private */
> > > > > 
> > > > > It would be nice if the FS DAX code actually used this as well. Is there a
> > > > > reason that change was dropped from the series?
> > > > > 
> > > > 
> > > > I don't have a test platform for FS DAX. In prior revisions, I was just
> > > > moving existing FS DAX code to a helper, which I felt confident about.
> > > > 
> > > > This revision is slightly different, and I don't feel comfortable
> > > > modifying FS DAX code without a test platform. I agree we should update
> > > > FS DAX, but that should be done in a follow-up with coordinated testing.
> > 
> > Fair enough, I figured something like this might be your answer :-) You
> > could update it and ask people with access to such a system to test it though
> > (unfortunately my setup has bit-rotted beyond repair).
> > 
> > But I'm ok leaving to for a future change.
> >
> 
> I did a quick grep in fs/dax.c and don’t see zone_device_page_init
> called there. It probably could be used if it’s creating compound pages
> and drop the open-coded reinit when shared == 0, but yeah, that’s not
> something I can blindly code without testing.
> 
> I can try to put something together for people to test soonish.
> 
> Matt
> 
> > > > 
> > > > Matt 
> > > > 
> > > > > > +		VM_WARN_ON_FOLIO(folio_ref_count(new_folio), new_folio);
> > > > > > +		VM_WARN_ON_FOLIO(!folio_is_zone_device(new_folio), new_folio);
> > > > > > +	}
> > > > > > +
> > > > > >  	/*
> > > > > >  	 * Drivers shouldn't be allocating pages after calling
> > > > > >  	 * memunmap_pages().
> > > > > > -- 
> > > > > > 2.43.0
> > > > > > 

