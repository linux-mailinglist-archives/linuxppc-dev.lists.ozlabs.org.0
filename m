Return-Path: <linuxppc-dev+bounces-16175-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aLUkHX+qcmkGogAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16175-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Jan 2026 23:53:51 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F8636E559
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Jan 2026 23:53:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dxxF75LBQz2xlM;
	Fri, 23 Jan 2026 09:53:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c007::2" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769122427;
	cv=pass; b=QZnHcWYw3Ei0/D3M63pHInGOI2BmWEL51BwyevvQwvuI+CkBrUlHAgSSK7OpyQzFVm5P+dO9sZvP9Tz6QIHeNFoJhaZ5dwPgE2NKkFhRMJ6ShZgGTqSk5niploNJ9g+CfQp8/56tWvdpTxWjt9WR5ZUjIP95/Sw2hoA2H+eNYBIWgv5C3kGm0B5LnXtX+nX6sLVQSGmxjK7WqgtD1DmySGTW8sqn80osUwB90rAGUAFoHQ3DcXi0u9vQnheF5oxZ6kRLTZ74qe9gXHy0IHc3471hGaphhh5t9oq45q3Nf/aXx21Ud3GbNATW6i9gy0IHFx5iGJc7xYpfU5W0Tc/oVA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769122427; c=relaxed/relaxed;
	bh=UQ/B5chrXQRSVDl8N1B3xzK9dWTnqFStA60oy2WXxpg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=h5QFzi6mbBVBhzhn1tsHujhjH5O2QdXsWbwDVE25D2fxojU8fNVacIbZtLwLtEACclOU04BrFC9zmC/6bwrystSureVdZgZNzIG9kYgtJWQVgrSWXbK+Ya/I/wxld8FllLIhckiYWLy5VhKb+KPTloOGIZj2r5+eqrrIF2At1aPwmFmRnHLbp1+vpifEBxVE7jbWsxOJyBWLTiaawhDwz8jCku3eTNQAR8ozXAiT86vIV2Ha5P01hq8inS4aBcoP4vfH5d2e3bvtTvluzdbAue5P9/a19H6kZ+u/Xe6m0t6tESB8TeymUmM2Qx3Ud1wukiyWa1r3KvkjB3ZaxakneA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=samZ9UDc; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c007::2; helo=mw6pr02cu001.outbound.protection.outlook.com; envelope-from=apopple@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=samZ9UDc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:c007::2; helo=mw6pr02cu001.outbound.protection.outlook.com; envelope-from=apopple@nvidia.com; receiver=lists.ozlabs.org)
Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azlp170120002.outbound.protection.outlook.com [IPv6:2a01:111:f403:c007::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dxxF62vDBz2xXB
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Jan 2026 09:53:45 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xVHhEMQLOhFUwVjWzrXUNbpI1JRjNJG8ev+1vr18cUAtUtmObjOn9ifLi52CTNG2bsH7uWhxwOJlhxuUIiTcXpTDEhkXpc27sGthsPq3FVkZ/+GGECKgyrtpO3vQGwfpgM8I45sTPdW75Q3iW+31BszBcGCyyvDKGjbPkIQjTJMPot4M47uNvEZ/G+tjOYjwx4UVXGVFDaVm4GU2f7L5PzNbuPSuJKyQe3EKjFbTNyoJqRdnEOeWufdxq4AYW4cgb0LhD8Wg33SGrK1muSzy91BhfnEDimn2wtDgYL61KGyCjb6L4OOXcRCGNACVGqvB8ohCNk0zlxeqBzt92klbqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UQ/B5chrXQRSVDl8N1B3xzK9dWTnqFStA60oy2WXxpg=;
 b=TT1Vj7qPkPplQVZjJgZ8yuC3NsAPOmAftYG/V7ZTMBp/HrQCUSPnunj9zLjlmNMc5x3Zu699eyOGmyNp+sQ1jFufNAe+ZiK/LjO1IeQTjV9zz7DW+5KyfTaESN9vdYPg/s+ST0RKa40Y+kDzWHGFvedRPSTdEZnwd+MmxBI2GwPx7PVSKFguJx28BfbmVN/fNvjYv3nV1HbQ/E11NNfTUwoPV5J8y2DW6lged4xiPy2edz51Ou/MzRvyYYfzCWT7k3/ucMSDEne0+IIw4cj/HJua7zFfENdTu84Q4ChCXUayqMDUp7xnysu01/rnSmGy7U5GNqi4Qj9GIQ7tocjtOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UQ/B5chrXQRSVDl8N1B3xzK9dWTnqFStA60oy2WXxpg=;
 b=samZ9UDcNqsSHv3/gce0iNP6dmiwEUu8cSGYS3wbGyNrT0cYF6paVkmWljEDn47ymGUQHYX4FMwqNMq0NJbYzaGr6gWcEkns4yn+KAMzk3B9yRR5NliKl2xMWx0lR4ItdjUl7FaZFe0c/DQ05h6yGyGk14aZQL/SSB0FinUWuFrnG3FKOS4WZYOrjCXaVkVoaUSRsz59KgCVHF2hRotqMD0bPdhn7AnkXQsEZY9/ndpVSmgavP67uzvwNTU2Un6g/ed46q8idwOPsqlAIk6Pr+AtPvg9jVadehdc+aeD7ElNlhthgtYhuvVs7hfWByG9h470SeIqz8yaFG66ABbBog==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 PH0PR12MB5647.namprd12.prod.outlook.com (2603:10b6:510:144::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.10; Thu, 22 Jan 2026 22:53:14 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%4]) with mapi id 15.20.9542.009; Thu, 22 Jan 2026
 22:53:14 +0000
Date: Fri, 23 Jan 2026 09:53:09 +1100
From: Alistair Popple <apopple@nvidia.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Balbir Singh <balbirs@nvidia.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Matthew Brost <matthew.brost@intel.com>, Zi Yan <ziy@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>, 
	Matthew Wilcox <willy@infradead.org>, Francois Dugast <francois.dugast@intel.com>, 
	intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	adhavan Srinivasan <maddy@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
	Felix Kuehling <Felix.Kuehling@amd.com>, Alex Deucher <alexander.deucher@amd.com>, 
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>, 
	David Hildenbrand <david@kernel.org>, Oscar Salvador <osalvador@suse.de>, 
	Leon Romanovsky <leon@kernel.org>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	"Liam R . Howlett" <Liam.Howlett@oracle.com>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, linuxppc-dev@lists.ozlabs.org, 
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org, 
	nouveau@lists.freedesktop.org, linux-mm@kvack.org, linux-cxl@vger.kernel.org
Subject: Re: [PATCH v6 1/5] mm/zone_device: Reinitialize large zone device
 private folios
Message-ID: <w37swembg3m2ruxrlbm4xpx4eccvp3fsd7e4shfdxcpmpisk3x@dqsxzkyabjc6>
References: <96926697-070C-45DE-AD26-559652625859@nvidia.com>
 <20260119203551.GQ1134360@nvidia.com>
 <ef6ef1e2-25f1-4f1b-a8d4-98c0d7b4ad0c@nvidia.com>
 <EE2956E3-CCEA-4EF9-A1A4-A483245091FC@nvidia.com>
 <20260120135340.GA1134360@nvidia.com>
 <F7E3DF24-A37B-40A0-A507-CEF4AB76C44D@nvidia.com>
 <aXHPkQfwhMHU/oP6@lstrano-desk.jf.intel.com>
 <9077ab5b-f2c8-4c8d-8441-631e7c2cf384@suse.cz>
 <626c34fc-34df-4629-baf3-fbebc9abafbb@nvidia.com>
 <20260122134114.a04ddf4c34a4b926d057032f@linux-foundation.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260122134114.a04ddf4c34a4b926d057032f@linux-foundation.org>
X-ClientProxiedBy: SY6PR01CA0159.ausprd01.prod.outlook.com
 (2603:10c6:10:1ba::17) To DS0PR12MB7726.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|PH0PR12MB5647:EE_
X-MS-Office365-Filtering-Correlation-Id: 0539c5d3-3a10-41ad-039c-08de5a09066b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dk94VXZGWU5TSXQ3cG96dkhld2drTzRXWmV4RDNrYTBFemE2Rys5RWQ3dzVw?=
 =?utf-8?B?SHhQS3R4QUUzbjBLZGg5aTFCSysvSDNPSjBWNHRjTE1CYWpPZys4UUs2UUtR?=
 =?utf-8?B?b2l4amc5SklRTTJxV0ZJaHJZTmFsd0k0dHpXQzNsUXpLOGxlZ3dnRUJ0YkRK?=
 =?utf-8?B?Q3VjYk1wSzlJU2VpSkVFV2E1Vy9SSnJQNVdQRHhrcDNtOU5EZnZYc0FFakdh?=
 =?utf-8?B?QXNSbFBGZVIwMVhUQWVNREZYc2RsZDRzWnlsSy93Rmxzd29JR1VJQ0xSVFFj?=
 =?utf-8?B?Ymp2QkREVU83Y2IyQzQvRHR5OU5sTmhaUDlWQW05dzU2RjBZVTBNTjhpK1Vu?=
 =?utf-8?B?TmtKSktPUDM4eXQ0RWtEUjJEYjRwU2JhWElsTkQwQUdFNmZCQXl2Ly90SXhj?=
 =?utf-8?B?NU1IWDhacStnbm9VUXhGaENjQWZXSXNZUngzcmtkb0pmOHJHZGluc1F1WE95?=
 =?utf-8?B?c05ZMi81aEZzY3FNamkrSTRCdnBGMnErbWdXTUJjVWNLVWpGOGRGT2hkT0Vq?=
 =?utf-8?B?NXk2TDMyM05uckZBOHNHTEtCM3REOTdxYXBsVDh5LzNZSm1VdENuN2ZIWGxh?=
 =?utf-8?B?WmJhbXFZMlpzWTFXSUxaeHphdDM5NUxGWGhTa0tTUlVxdGtpaFdXME9IQ1c2?=
 =?utf-8?B?N2hRbEswbHhGUWVEWWdmS0M1UUppa051eldCcnhYY2dqT1Rta3UxNVg0dWdT?=
 =?utf-8?B?MFNpemR3RnJ4YVhWVHFFcU9PTlF2SHhBMkVpUk1Id1RDQjJNUk5VMWJ1dTBE?=
 =?utf-8?B?L29CZVVyQTNVUnVQOUpKL2xhNEJ0UFYwaVYwZTJKSldNbUhPQlRMMGgxdWVz?=
 =?utf-8?B?aCsvZk1RMlJEc3cwMVhQeUNuRW92VHAzcG9NVHRSYnFITGtoc0p4NDdmTWsx?=
 =?utf-8?B?NTdsVUY2V1dISTJxbDViWVd5QUR1eXl6VFh3djBEL1IwUVpWbHk3eTcrTjRE?=
 =?utf-8?B?VElyTUFrM0N2SnhidXpVY3J6N2tPaTY0ZnFaeW43c0ZLUUJ3ZG9ENmsxRGxT?=
 =?utf-8?B?MGVHVnZzU1RuTmpweDJIVnZuWk1JMThqTlRHOStKcnFwdHpaQ2xQODdIZnUy?=
 =?utf-8?B?R05Zd24yV2JyeHpsYkIyVFJqemVQRHBjNXYySHdlcStWaWlUdHhZNjVYS2JV?=
 =?utf-8?B?aXljb2IvcFRZT2crRnlaLzJnQ0RzbTZwZ0Ura0hoWERXeERhZC91UE1MVDRS?=
 =?utf-8?B?UzhEamNJbUp2Wkl2TDVYdEFSUkdncWNUV291NWxUdXkxeGpjMUUxY2RtelJ4?=
 =?utf-8?B?SU1kSTMvTU5DN0didFNPdUJRQStPQ3RyTENRR3VMRTlzeDRCSHlQZnVDc1Jk?=
 =?utf-8?B?Z0RUcXdNZFFRdmlLYmlKL2xmUkhGUkNTQ1pxZGhEeHlHSEptclpUTlArd2NV?=
 =?utf-8?B?djhhTUdWRXNkRUJwb0hheXZJMWlBZmxMVEVDSDBJZ21wMEJNUjFTRmcxZDZN?=
 =?utf-8?B?a2hWcTlFeXhJVm1CL1pIZ0o2akFqeDRzRkZqQlQrY041YVZVMC9VVHJiRDJh?=
 =?utf-8?B?TFliRjF2NDE4Tk9hRTFGbzB3dFh6eWVFcGpwVGFVZW5qWGlGNUplZTFXVHdP?=
 =?utf-8?B?dzZMa0dZRXlhaGI5QnkzVVhCZHYyUXB1MVdrWGdRcnE5YUs4azJObUFiV2lV?=
 =?utf-8?B?RnRhNFpnb3BYa1VUd2lETDlvemgxeUdUb1hnM0pRVHJzazFmVXpJQVZoSFhi?=
 =?utf-8?B?L1hRZ0gxVGI3U2EvSnN5TzRZZEQ3SGNockMrVkw0dWlzcGxOalFjQjg0bS9t?=
 =?utf-8?B?c3dycUNqSnRqNmJOd25jUytFR0tXT3JzVndxS2lVa25iaGtWTTIvZGpWNHRt?=
 =?utf-8?B?UksweCtCWG9jcVFBVWxYbVg5ekdsVGhsaWlrWlQ3QVd2N2xGT2U1QUxUYzI2?=
 =?utf-8?B?NGhET2psVFNpQmxDRGkwU2F2ckxuL1BhN0FaYlg4eXZzTVlSSWJPMnFCN1cy?=
 =?utf-8?B?UmdXczl3QXN0Q0RTTlFoVEg1UHlyNS9vd1dmU3hxZ3diV3NmL0pBSWRRd0tS?=
 =?utf-8?B?Y3llaWoxOVBrRXE2c2dhZm9Xb1plblFNWFVjaFdzaFM0emwwVkdEOHBFdkto?=
 =?utf-8?B?N3RIQyt5QTQrT1ROUUdoNHZHbnVlcXEzaGY4NUdITEtsbEhBSks2R29zMXJn?=
 =?utf-8?Q?7IzE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB7726.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RDlhN1hYZ2E4Y0xjMGZqc3pKUm9lK05uUy9QUWZYcDRxTG50WlpjUTdmbXlT?=
 =?utf-8?B?dVl4OE1zM1o0c0piQkt4aVlZbXZWcEhsK1Q4bjg5RmlRNTlHUzlMOFNONzdq?=
 =?utf-8?B?OUpZV3BianVUMko3S3F3VmJrMi9VZC9aYVZnSEZ4VHRTM2hOb1pTcHJFTDlP?=
 =?utf-8?B?RytRQTBoLzVZcmxYK2YrWFZqc091KzRIVHpYb2UrVzhYOGY1WEs0cDFBeElR?=
 =?utf-8?B?SHZmc045eWRWMnJIWnV4R3BSQ085NnlLMFg1Z3lyemNmZngvRVNCa3Bjd3My?=
 =?utf-8?B?eElNZ0Rvb0VZcEtXcU5CQjliL0htNllHSUVORUR5M2xkZGN1ZFFuOXg5dzRW?=
 =?utf-8?B?L3VpRC9BVG96ZGIzZkUvNFhrN0Vtd01kK3RBSG92Q0dOczBydTdhNHoyYjBD?=
 =?utf-8?B?a09zYnI2WnJHcXp1ZGtIWnoxVXQ1N1BrQXdidWxJV0VSN2gvdlJWWjdENVVw?=
 =?utf-8?B?VGorNElnelhrVnpNVHM1YWZJZk1ONFhEL0FVRThGanNaV0J5QnpNYUNkZzM4?=
 =?utf-8?B?TC8yT0hlS3JnTStuRUY2QkxRLzc1WkxXQVJ2VUlRRTk1SHkvMDg0LzdXMzk4?=
 =?utf-8?B?QWF1dUNkVFNJRmRuUlQrQ090UHJWTStYN090MmNaSStlSkpFZ3J4dFZuM0Vu?=
 =?utf-8?B?clVDbTFSeG5EbUhBS3JiQm02NVRnSnl1eTNORHhPUStjOER6UHhmVmxZV0Jh?=
 =?utf-8?B?ekpKTURuWG5RVFlTRTdsTTZuWHU0ZlRqdHpqVE5nRWxyK1ZKTzRDUE4vR3JX?=
 =?utf-8?B?bXphS1JDNmxtMHFOb3E4N3Y5MFd0bFVyZlROd1cvRFpQeXErQ1VkM3hXUDJz?=
 =?utf-8?B?S1B2MWtRSHJNeDhpdFpUclNoVzRuSkhsd3ZHYWJTNTlvYnhHaDZwY3B1K3E4?=
 =?utf-8?B?V084c3V1dThQbEdrdUprL2F2RTZ4MHZ0Uk5wdTVPSnNlcDZUN0EvQ095emsz?=
 =?utf-8?B?UWpJZnZEVkVjWW42MVpjODE2RzllTno1cDBLNG1NZWI1MDF1ODUvd3dQQ1N0?=
 =?utf-8?B?bW5GcWJTempsY00vaENPRDNsRURrdGFpd3BNNVNZMm4xTlBuZ005QXc5T1FR?=
 =?utf-8?B?U0RpcFFVaGxMZGdncUdYb3dwL0g1ZnFKMzF0Q2VDS1l5RmZuQXk1ZDhwQVJI?=
 =?utf-8?B?NWhPdXBrVHMrcXdCalJRWDV5TXpJZTR3VGU1NXRlUDUrTDJmc2dHMkNLclJG?=
 =?utf-8?B?UTZwQ3hIb3JMdWZKZ2FMNm5SeG1haGMxRkFCSUhBNElKWEEvOWlqaUM4Tm5w?=
 =?utf-8?B?TVR2cVFRRkRiL3lXM2xtSmpwb1FKZ2pyYWtFWXNNTk5VdFBjbWJrTE9pN1pm?=
 =?utf-8?B?eFFSNGEyZWVyeFF1aExya2xyUStVTnI1VkpHeVRaOFo2M1dOVWJjOGFTb2FP?=
 =?utf-8?B?WkVRaWxoKzFiNE1Yd2MzQjJOaHIzdlZWckNaRUY5cTBxTk05NktURVFhZk8x?=
 =?utf-8?B?TEFYb3FxbzlmYzhqMFhUTFc4ZVBwc2dSUjhPeDMvZFpqTnd2bStyODlibjlJ?=
 =?utf-8?B?Zll6R2dvM0RUQitaQmozZ3hGMXZqOGg2V0VPZVhBcXJ6WGU2b0pLNVp6SFIz?=
 =?utf-8?B?T1QyaVNWOCtFTWNuSElsY1poazNvZkp3Y250dFVqNCtuT1B5cUV0clBzczNX?=
 =?utf-8?B?RFJwRWlZNXZtN1k1b2FrTUIrV0ZkeWowUGRDKy82dVg4SlY0OHVNRk8xNWZx?=
 =?utf-8?B?KzJxV1VtL3NWUHY5VWZBUGRxWXZHTWtGQWhzNG9mdUR6MWNZdlFKTW81QXkz?=
 =?utf-8?B?Tk9XNVM1NHVzd2JSSHd6UVQ3WnFBSnFaNHdIazc4RGh6dXhZYTUrY1IwNFoy?=
 =?utf-8?B?eDNWenVTZFp0SGNMSFlabXlmQmdRZkxSOVdEY2dqbGpjWWZyZFpTaEczdUJh?=
 =?utf-8?B?QkovQ2tWWnRYcGhoSm5oOFJGNTQvTUxHT3JVUVJvYUpNaVlGYnVycUZiQkFn?=
 =?utf-8?B?c1BJZFZPdU1uYk9ibXY5cjJMVDFEMnhsRE0xZjZMUjNMK1RlVW9nOWNVcHlL?=
 =?utf-8?B?Uk01SzI1V1RBOWhaaXcvMWh5eGxJRVBCOGtKY2MvMEUyeUlZaVVoZVN4N2RM?=
 =?utf-8?B?dG1zNDJJVlFLT2hvRzY5czNUaDJQVUdhZFh2SDJLbWJlUWIwdDlDMVpucnpW?=
 =?utf-8?B?aHczTGZRbmtoRzBxQzRtVDh5RHhmRVA1ZWRqSEZXSC9rL0JpWXkwejA4YkpM?=
 =?utf-8?B?cWxydUFZSXk4SjFQMm5oT0xQaWM3UTlqdFFaQU00YUZUbUs5WGRIbHpubUly?=
 =?utf-8?B?cFZxNWFpcHVhMUdSSjdmTjVJYXhqdjJSZ0R2VndOa2U5YUhuMy9HVDRLdTNz?=
 =?utf-8?B?V21aV1dubGRxUkZGQ1JiV1lRM3kycFYxclNwYzhNTWFNUS82a3J3UT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0539c5d3-3a10-41ad-039c-08de5a09066b
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 22:53:14.3973
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZHeEW4HH0f9kDMOX+mBI7IlQW8rQqvNRvgbQrS3N5MbQ3yLy1eE8iBzSg/WbfwOjO4cMC3Kjh5QUhT0mglaeoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5647
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.71 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:akpm@linux-foundation.org,m:balbirs@nvidia.com,m:vbabka@suse.cz,m:matthew.brost@intel.com,m:ziy@nvidia.com,m:jgg@nvidia.com,m:willy@infradead.org,m:francois.dugast@intel.com,m:intel-xe@lists.freedesktop.org,m:dri-devel@lists.freedesktop.org,m:maddy@linux.ibm.com,m:npiggin@gmail.com,m:mpe@ellerman.id.au,m:chleroy@kernel.org,m:Felix.Kuehling@amd.com,m:alexander.deucher@amd.com,m:christian.koenig@amd.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:lyude@redhat.com,m:dakr@kernel.org,m:david@kernel.org,m:osalvador@suse.de,m:leon@kernel.org,m:lorenzo.stoakes@oracle.com,m:Liam.Howlett@oracle.com,m:rppt@kernel.org,m:surenb@google.com,m:mhocko@suse.com,m:linuxppc-dev@lists.ozlabs.org,m:kvm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:amd-gfx@lists.freedesktop.org,m:nouveau@lists.freedesktop.org,m:linux-mm@kvack.org,m:linux-cxl@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[apopple@nvidia.com,linuxppc-dev@lists.ozlabs.org];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[39];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-16175-lists,linuxppc-dev=lfdr.de];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[apopple@nvidia.com,linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[nvidia.com,suse.cz,intel.com,infradead.org,lists.freedesktop.org,linux.ibm.com,gmail.com,ellerman.id.au,kernel.org,amd.com,ffwll.ch,linux.intel.com,suse.de,redhat.com,oracle.com,google.com,suse.com,lists.ozlabs.org,vger.kernel.org,kvack.org];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_SPAM(0.00)[0.454];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,Nvidia.com:dkim,amd.com:email,linux-foundation.org:email,nvidia.com:email,lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 7F8636E559
X-Rspamd-Action: no action

On 2026-01-23 at 08:41 +1100, Andrew Morton <akpm@linux-foundation.org> wrote...
> On Thu, 22 Jan 2026 20:10:44 +1100 Balbir Singh <balbirs@nvidia.com> wrote:
> 
> > >> - Intel has demonstrated that this works and is still getting blocked.
> > >>
> > >> - This entire thread is about a fixes patch for large device pages.
> > >>   Changing prep_compound_page is completely out of scope for a fixes
> > >>   patch, and honestly so is most of the rest of what’s being proposed.
> > > 
> > > FWIW I'm ok if this lands as a fix patch, and perceived the discussion to be
> > > about how refactor things more properly afterwards, going forward.
> > > 
> > 
> > I've said the same thing and I concur, we can use the patch as-is and
> > change this to set the relevant identified fields after 6.19
> 
> So the plan is to add this patch to 6.19-rc and take another look at
> patches [2-5] during next -rc cycle?

I'm ok with this as a a quick fix, and happy to take a look at cleaning this up
in the next cycle or two as it's been on my TODO list for a while anyway.

> I think the plan is to take Matthew's work via the DRM tree?  But if people
> want me to patchbunny this fix then please lmk.
> 
> I presently have
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> Acked-by: Felix Kuehling <felix.kuehling@amd.com>
> Reviewed-by: Balbir Singh <balbirs@nvidia.com>
> 
> If people wish to add to this then please do so.
> 
> I'll restore this patch into mm.git's hotfix branch (and hence
> linux-next) because testing.

