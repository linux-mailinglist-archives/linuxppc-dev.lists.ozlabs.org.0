Return-Path: <linuxppc-dev+bounces-16182-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sG6jBpnmcmmErAAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16182-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Jan 2026 04:10:17 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 167E56FEAE
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Jan 2026 04:10:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dy2x13Bqxz2xJ5;
	Fri, 23 Jan 2026 14:10:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c107::9" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769137813;
	cv=pass; b=hJRp2pFgsROyb1ftnHP/J0aL0v3R/wQo/PzZ5cTSrcTECbkrdU2NkjB4pBhyx9jyCBb6uOrgu1ZSO1S5hDG7mfKG8QP//dsvOmOy3MyoUngHRau7/bxuUxzcmGy3SM1WgWh38mteBRkTePHy3H565xUavE2EY5MsVpB3zLRW47uGOzfGeho/BqE2ez2GVwQ+A4WUwyeh8CtyRrQuDNTS066jn040+JJdJiSmqLyhTiUVSyjjMuppG56nGixJ0ItF5Ksy4zwjElQrY5GekDNfR8w7wyyzF0J3/8REu6H3bPdZvh5+N1vTi4LHnaDyd1FK0bGiloInZ3B448mmf0981A==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769137813; c=relaxed/relaxed;
	bh=dMRaaueU64RXWPtbDxqf25Qe0llFU9MlwPcIheP9gZE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=nNRmZJ2ZyjYZjwdfuucJWZ3P69afen8idKlsIgPxqhxXE2oqbBE0j3LOUDIzv10mY4VTQf0bjfTkm2Jm6194qgN+cxyMCVSV4JTNiIKAcpG6XCFZ54eECFlA/j8gmEVFzA/u0OKS8wusHKu+W6Mh7YkRD0F7ZwWOys/b4LSC7Bu1MBNSinObwwcuT6gf2Xyhy5ILh+LCS2TVE12Cb3Y6oTByb6UBQv5k7LdUaPAV57OkAwUNJOBH20LUvFbSrL5GCoEHZL9AQPgkoHjouUBj3sjbg9UbJo4gDgpui3OclV/O84gapwVyJdZMibUV/7nkX+gpH0N+vJfTNZGa6R50aw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Pmk7QDmu; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c107::9; helo=ph7pr06cu001.outbound.protection.outlook.com; envelope-from=ziy@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Pmk7QDmu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:c107::9; helo=ph7pr06cu001.outbound.protection.outlook.com; envelope-from=ziy@nvidia.com; receiver=lists.ozlabs.org)
Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azlp170100009.outbound.protection.outlook.com [IPv6:2a01:111:f403:c107::9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dy2x03tFZz2x9M
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Jan 2026 14:10:12 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HeOPbkstp28HMzqaMAKmOlPVdnzWhOSF4OvW+v2usS7kelSsAIKu3V9l32l1qXbTuKyn7zLXVD7xQbFKqie+R8sNYd1ukkZN8yc34rVOYn0MiycaPGah5wY18lfh3/AW2m3BhC0X0J+t9L2Hz5J77A2kohHWCs171K7b11YWftb/Qxgz0ZhYrG7AS7vmZvbSgZ/IVjiZUlQ0/cs5uu03uClguutV2onsiRbI77XvgGIutM/PM2X9LIHD1EmaAT91Z7lrIfdO+geVw4b7UYcbHUdOyUZCCHTIdp7/Vk/zOm8JByzu4vqSYDMjGsOXc7QBzEM/WZJKvERLD1yXRGLEow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dMRaaueU64RXWPtbDxqf25Qe0llFU9MlwPcIheP9gZE=;
 b=PB95TuxhSYJNnSenlMovbmWZ5HwwznjlbB1SeNp3Sqr388siAzGJvHQniKh3Se3tF674hXDOInbTHbEQhxYi/QvP70WUtvxhi45mUYbQTkTuGj7YPjE9RGqgRAUcRv177Y9PD+iKvsceLrp6iUTewGCbgT1wSnKK0iGaPsNt92lHWRkHgd7dCqkIR/awjJXJX9KK8Q2FvBeRO5FY7Q0eNtr76nd1oB82N/0ECce6zNo9XpYvuAMgFtteDurY90R72auFwVJWHA+67uqTN0kY+yghraC1rsaplsvbTADHZEMlIbo87rsYL0mjxNUoWbcjqRJiwjNwmDL4wVPlVZwZYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dMRaaueU64RXWPtbDxqf25Qe0llFU9MlwPcIheP9gZE=;
 b=Pmk7QDmuKxMP+o7czJfqyJXRt2OGQJirT68uuThzgD84mgXra4dYz8HJe/Gl1nSuK0llrIiOeegSjaCPCf9NgqU9xbiMeiKGG/Nh38JalgklnF62GlR42aZqTE1Gcw3cpjXajPfvOTTLKA36+wodWPPfUWgym/+w2lU21IrV6Kc2bTcT6K2RJrD9Xp4DbkZWCvLvwn/JvJO2ZRnrnw7plJm6f7BZ87km0X+HT+ZYWbROQEXUBLokZWlHzErrAVNYaXrDj4fxsxkQpDGEJy5rd/aeRSCfSXJHmLpHV3hWp5BBJMsiNVk3UK98w4fJunrH1sVE1ocGsHTuHC9TZhyhKQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 CH3PR12MB7665.namprd12.prod.outlook.com (2603:10b6:610:14a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Fri, 23 Jan
 2026 03:09:48 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::f01d:73d2:2dda:c7b2]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::f01d:73d2:2dda:c7b2%4]) with mapi id 15.20.9542.010; Fri, 23 Jan 2026
 03:09:48 +0000
From: Zi Yan <ziy@nvidia.com>
To: Alistair Popple <apopple@nvidia.com>
Cc: Jordan Niethe <jniethe@nvidia.com>, <linux-mm@kvack.org>,
 <balbirs@nvidia.com>, <matthew.brost@intel.com>, <akpm@linux-foundation.org>,
 <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <david@redhat.com>, <lorenzo.stoakes@oracle.com>, <lyude@redhat.com>,
 <dakr@kernel.org>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <rcampbell@nvidia.com>, <mpenttil@redhat.com>, <jgg@nvidia.com>,
 <willy@infradead.org>, <linuxppc-dev@lists.ozlabs.org>,
 <intel-xe@lists.freedesktop.org>, <jgg@ziepe.ca>, <Felix.Kuehling@amd.com>
Subject: Re: [PATCH v2 11/11] mm: Remove device private pages from the
 physical address space
Date: Thu, 22 Jan 2026 22:09:41 -0500
X-Mailer: MailMate (2.0r6290)
Message-ID: <0C16A79F-5A7B-4358-9806-7F78E7EA8EE6@nvidia.com>
In-Reply-To: <DBBD65CA-A8F2-40AC-AFA0-FC95CBDB3DF5@nvidia.com>
References: <20260107091823.68974-1-jniethe@nvidia.com>
 <20260107091823.68974-12-jniethe@nvidia.com>
 <36F96303-8FBB-4350-9472-52CC50BAB956@nvidia.com>
 <c9afedc6-f763-410f-b78b-522b98122f06@nvidia.com>
 <6C5F185E-BB12-4B01-8283-F2C956E84AA3@nvidia.com>
 <fd4b6553-3e9e-4829-a12f-51d29a5d7571@nvidia.com>
 <16770FCE-A248-4184-ABFC-94C02C0B30F3@nvidia.com>
 <sezye7d27h7pioazf4k3wfrdbradxovmdqyyp5slhljkmcnxf5@ckj3ujikhsnj>
 <DBBD65CA-A8F2-40AC-AFA0-FC95CBDB3DF5@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: SJ0PR13CA0048.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::23) To DS7PR12MB9473.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|CH3PR12MB7665:EE_
X-MS-Office365-Filtering-Correlation-Id: 845717da-657a-4369-39ef-08de5a2cddd9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dUZVZkNha3NMWkxwY3ZDZCt6YmdwalBkMEJaQVliK0pORzhhc2JRK3pITEVh?=
 =?utf-8?B?TnJscExMdlk0VGEvNExRWkFxUlVMYWJ1M0J1K1dlUHBRMEtRQUs2Z0NDL1Yz?=
 =?utf-8?B?eENNVXVUMjM1N3lMRWNWTHRJVW9hOFFGcUZWaDRLNVUvRHQxRVAyYVpTdXVD?=
 =?utf-8?B?UUUwN2k5bytmcFI3VGYySlVIUU15VW9tNVFEZStJOW16cFdtemVOcTE4Q0dm?=
 =?utf-8?B?ZVp0ZjhEQkRWNnA1Qkg0czhFdldqOFloNGt5cFF4cllLUTZEWDRFb2c2anll?=
 =?utf-8?B?RUxwdjRZT2k3VFZBN2k3bmVIdGtXNkYwR0p4ZlFqUWV4U3ZER3d4bEc0VUJt?=
 =?utf-8?B?N2VWcUZOY0tNaTBxNVZrT3N1YXdrRGJNWDhtVkhoa1FIWjlvK0dsZVhTME1P?=
 =?utf-8?B?OU1Ia29mTFFuSW93cFFkUkU2YU1oYzFOSDIrc0R4eEhrOEtwK003NjV0STRx?=
 =?utf-8?B?TW9oWllQWHZ0SmhhU3c0b1NoYlptem95VHd1ZE9rMGlvR0FkQXJOSWNpeUVF?=
 =?utf-8?B?bjNuZGhiK3czUXNDMS9Vbm9NYmNtNWJnWXRjZ1ZzdXBEZFRJZzN0cHB2alNo?=
 =?utf-8?B?TDBEVVNnaDBXQkdsR0NOVk56QkxDTGR3eFBBVEY0cUcxN2R2Sm03d3RWQUE4?=
 =?utf-8?B?b2JEcms3cys5Z3kxdldGMTVjVHpKd29OTGM3cEFKZHJ6eVN5VGV6L2RUQzkr?=
 =?utf-8?B?SFpHVDZ6YmNkOFRXazV6citOT0kyMnE4K3VKRDJGOSs2SWhIMSsyclkyNlNy?=
 =?utf-8?B?cDBVMFB5QjJRcDBFOURwODFNRUIxZGNldjVXM0pNNS8zV2Y3eGV2RlordDNq?=
 =?utf-8?B?WGF5NkRvdWJSWUdnUTMzeFVTM3NueVpBWlBrMlBldmY2MlZDS0RtME1tODY3?=
 =?utf-8?B?Rytrbm9Yb2NleS8wZ0ptU0Z3Sk1tazJGZG15Ry9jUUpETTZvNGNRQzAyMndM?=
 =?utf-8?B?aHhXSzlBdHd3aldoQThXSTVTdm1TNGx4SnVMVEREaktCUkpKdUJxRmRCVm1F?=
 =?utf-8?B?ZGlFK0NGV204blF6K0dLcmZFaFZrSWJqZnp6Wi9zWkI2VWI4Q0lpNmFaT3pz?=
 =?utf-8?B?c0ZnQWE1VC9xYkp4NSt5TVVHbzFBeDBzV2NEc1lMTUFic2REV1ZUS2FyNy9K?=
 =?utf-8?B?bnhnQ3NnQjl0Lzh2N1o5ZXhseHgxSG1jL2lqWXd1MHlNZFlJWThtck5FMG53?=
 =?utf-8?B?SUxER1RRK2tGWGdUOFVXR3JLVU5HRWdQbTFURkRKOThqNURQREtWM3Q0SUJv?=
 =?utf-8?B?SDF4d2VPQzBkbTh5d1RWcWxuWXJoSm5wWXZOWVlOdGVobDVXQkpTQW1IYmJu?=
 =?utf-8?B?ekZaYW94RW85cnVSczZuN0hNY0hiUG5MRkdYbWhydkt1UGdZSzlWYjhMamNu?=
 =?utf-8?B?UE9VNkFvUUFvQzZCWnpzb3ZjN3NvRXhNUzcvNTFOWVA1VU1nSXZ0YkM5RERS?=
 =?utf-8?B?TldFZzlTT3grSytld3RoTTNxaVlZWTVTSkFnbDNXVWFkeTJNaExjbnN1Mkkx?=
 =?utf-8?B?a1dFMldSQUttbEpXbUE1cE1YckdOVHQxOGFtOC90VVdQdDRJTGUxSkRRUUUz?=
 =?utf-8?B?N0REclZUMkpKbTZEbkwrQWxkSlpISUJGSXA3eGJKSkdKRnNyY0pLK2NMTWVI?=
 =?utf-8?B?ZCtSbXg4RmdtbFZZelh1ekVsQVpQTDJEVmUvenJuMUlvaVpheHlmOEpEQ1Mz?=
 =?utf-8?B?eEJsSnQ3MElIVi9ZdUVBNytnVkROMUVXb3NpVkF1eWRxeVlCOUwvTjV2L05R?=
 =?utf-8?B?V21XOXFUOWt3WWZwMUg4NkttVWdJdVlCa2F5R040S0dFclJEc0MyY21lbHVz?=
 =?utf-8?B?bTZITmthc1FvRHB0SVdKUUxtVzVrYmRwNlEyUys1TFBQeU9pQlBaS2p3dEph?=
 =?utf-8?B?bFZjaFdTN3JwVmJGNDk2clJBWmpUOGhoNFcvT2dUa1VmRnRCUUdCdHlEUlNE?=
 =?utf-8?B?WXpzRE53T2RJNlczN2Z0aWxZOGtEbTQvSCtlcy9McURyZ21pUk5qRWJoNndO?=
 =?utf-8?B?U3crUkE0ejVLVGpHditSRW9nNVIyNXBsMVAwTjcvRkFrQ2c4OGlVK25MVzJQ?=
 =?utf-8?B?SUNMZWhHaEFMU29RWGdGcWlrRXJ0dDlWVFM4eHpwSUJCdEM2ejdkMUI0K0tr?=
 =?utf-8?Q?adgc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZVoySHY4a3JsVUFydklHZVE1N3MwU0ZOeERFYmJYMlFNMEJwL1F3M2hyV29D?=
 =?utf-8?B?ZXFYanJKVjZuU2R6dkQyRVFydWREbWJXV24wdmk4b2pLczFNMmVUYU9NNzBp?=
 =?utf-8?B?eExuY3k0QUdlaGx1NmxueWQrd0xLRmo4aGUxSVpGdEorV3pNdVA1ajdVYU1y?=
 =?utf-8?B?czlTN09yck45Q053QjIycjlWc0hEaHZhQkpCd3pYM1BsNktZRkVrR3d3RE81?=
 =?utf-8?B?N0JxdDRmZ0QwMkY0WGFPL1UydFNlWUhIaU9ZYWRFUTFRMHZMeHlYYXdHbnFH?=
 =?utf-8?B?N0d0NDdja1NoMHFZKzFtSGU4ejlGamdsemFjNUhJcXZwMFZXTjlabEdESGd1?=
 =?utf-8?B?RS95cWRETk9uMVBNYU5rblVmUk1pRnFtOUxSZ3N3TmJsZVJWUHd6RER5R0Nw?=
 =?utf-8?B?SUZLbWpLL1hQUVRnYXZXaTcvakFYUlo3M3BNQU1IUG5BM0RncUcrYitaZjNy?=
 =?utf-8?B?akdKUzV5ejhGbWlnLzN5SWxtU3Q0S1RmYTFXc0Zza2ZwaEhiNTUxbW5hMURX?=
 =?utf-8?B?ZU05MlpWbmp4TGJ2VXZjQTFDUTFLY1NZbHRtV0xXV2ZXZUtWRFFkYjBVWFB3?=
 =?utf-8?B?dHZjT0NYZkFNamorN2JIYkNGR2MvWmJQK014NVZiMHZGUUdYdHFTZUVybWp1?=
 =?utf-8?B?aXNlVmFkMUs0NytITVFYZUZaOVZDS3N2bnRSY25tQmpyVW45TDQ2QVFmcUJk?=
 =?utf-8?B?TGZKcmJlZkNjd1Q4aFpFaGZjNE84TW5pR1d6VG5OVG9mNkx3ZUZFajlHa2Y1?=
 =?utf-8?B?ZHN2eXVtUkpGS2hKQlN6V0tjMFZUVW43ZHBCd3k0MmZhU0szQ2QwTVRFY01L?=
 =?utf-8?B?R0NnckFBSDdNWE16dHpkc0EwNmlrNm5VUzMybmN6endjcGRacTFva09Uc1Bp?=
 =?utf-8?B?Wng5TElVNVRPSjZ1Ni9UaGsraHFtMHovWUJiMkt4L2tFY3ZVOGlYZzlCS05k?=
 =?utf-8?B?aGFUREpkZEhCUTUrZFdaV1JEV2JKTkh3YjFtQXJ2MTVFRWd2UmdKOU5ZZW42?=
 =?utf-8?B?UzFKTm11MXRuOGEwWHlKcDhweTl4aHl2Wm1haDh3NjBBN1Z4eTBQQ21IYk1m?=
 =?utf-8?B?bnVMOWhMcU0vbGVYMmp5OGk2Z2I2VG5VdERRZDVEUUN2MzJVeU51L1o3NTRN?=
 =?utf-8?B?SG1ZZlNKSEpnT0p3U0dXbE9JVERYQ0NUZEFtY1dubHJ6Vm9Hc0h1RHcvRDA4?=
 =?utf-8?B?S00wSGo5bzNTOFRtS3pCMWI1SmpWZXVmWlEwVWM0bzM2ZTJseU1leDdoRjBE?=
 =?utf-8?B?ODY1TU1XYVp6K3lzSDM4NC9RVHdHaGEzSjNYNndqTGJncks4Yy9yTS82RHpB?=
 =?utf-8?B?UnFEU2ZQUEI0blYzYVFUck9MeUVueHZxTDZJZDY5RE1qdzFqT0tBQS9yWnpw?=
 =?utf-8?B?YUdVRHA5ZmFCOTRWVjlnRVlCMitaR3ZnV0ozMW1zcEtHQVBzL0tEcXVwTVA1?=
 =?utf-8?B?SW80bmE4cXRSMllZTE9uc3ROT3RreGVTeTR5dnJzQ1h5d1poaXV2OFhWTkxN?=
 =?utf-8?B?NnovK3d5QU9Qem5UUnZySzV6cU5qekp4dzk1eVh4WElETmY5d2o4MnE1QVpU?=
 =?utf-8?B?eWZKTjVVSXZLWGNxUWowSFJJWE02dExGbEg5NU4vQ09sYjhlK1g5SGR6WjRJ?=
 =?utf-8?B?bjZPTzluRE90UGRRblF1TldlTC9MUHE0eEtJanpNd214V2FRdDBuelpFUVph?=
 =?utf-8?B?cUI5WENhSXJ4ZDF3TWNnSi9zdkVxZzhMYjVERkppdlpUZllwRERmckJIVnQz?=
 =?utf-8?B?YnhUR3ZxUUVVT1RMSnE0SjFOT3NEVXZoY3JvdGdZNlluODRNZ0lYRnI4VDNC?=
 =?utf-8?B?UkVYYWZGN2VnNDdja2JrdUppdDJMVTBLN2NIUTQwRkdnU0hDcjdQaVBBZEd3?=
 =?utf-8?B?ejlRbXZmdU9yRy8wRjRVYU9Dd1lJcTh1YW9LR1B6czNSR2NGc0QxQTZ6dEFG?=
 =?utf-8?B?SjJhZUphL3lzSmNhZk5razZMZjdudG9uR1gyenpKazJVRmtOOXhzNG5Rb3Rx?=
 =?utf-8?B?MjRxZmNicUJNamdRTHd0encwdEUydVhhS1U2S3ZiQ3MzRGVra3lUNVhBVXVV?=
 =?utf-8?B?aXBJbU5IK2o2Y3hDOTdRd0p4RlBCbGt4OVdvNCtXTDFpUllaNktQaXhDUTN2?=
 =?utf-8?B?UUZ6MEZIL055NUtlRE9GN1haTEIzeHJvYk84ZFZGaXVOTVc2T3dMdC93WVN6?=
 =?utf-8?B?VXE1U1hJZ1Z1THNBendtZVY3NUZTc2p4bDhOTlNjVWdYeGVVWUxnNlhZbjFN?=
 =?utf-8?B?S3daemxiOVdCVG1pb0xNanEzUWpub2VRSXpDN016MXZWcXBINjV0c2hEYVh5?=
 =?utf-8?Q?bz//xDpnKM9fWPaz7h?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 845717da-657a-4369-39ef-08de5a2cddd9
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 03:09:48.1776
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r7MYBcC2NAcFIWh0RY88Mxum+z9zyc6evITVs1eqBTs2oFTbdpIZ/qdV7WVF1+Fx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7665
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.21 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-16182-lists,linuxppc-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[ziy@nvidia.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	FORGED_RECIPIENTS(0.00)[m:apopple@nvidia.com,m:jniethe@nvidia.com,m:linux-mm@kvack.org,m:balbirs@nvidia.com,m:matthew.brost@intel.com,m:akpm@linux-foundation.org,m:linux-kernel@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:david@redhat.com,m:lorenzo.stoakes@oracle.com,m:lyude@redhat.com,m:dakr@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:rcampbell@nvidia.com,m:mpenttil@redhat.com,m:jgg@nvidia.com,m:willy@infradead.org,m:linuxppc-dev@lists.ozlabs.org,m:intel-xe@lists.freedesktop.org,m:jgg@ziepe.ca,m:Felix.Kuehling@amd.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[nvidia.com,kvack.org,intel.com,linux-foundation.org,vger.kernel.org,lists.freedesktop.org,redhat.com,oracle.com,kernel.org,gmail.com,ffwll.ch,infradead.org,lists.ozlabs.org,ziepe.ca,amd.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ziy@nvidia.com,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	NEURAL_HAM(-0.00)[-0.159];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:mid,nvidia.com:email,lists.ozlabs.org:helo,lists.ozlabs.org:rdns,Nvidia.com:dkim]
X-Rspamd-Queue-Id: 167E56FEAE
X-Rspamd-Action: no action

On 22 Jan 2026, at 22:06, Zi Yan wrote:

> On 22 Jan 2026, at 21:02, Alistair Popple wrote:
>
>> On 2026-01-21 at 10:06 +1100, Zi Yan <ziy@nvidia.com> wrote...
>>> On 20 Jan 2026, at 18:02, Jordan Niethe wrote:
>>>
>>>> Hi,
>>>>
>>>> On 21/1/26 09:53, Zi Yan wrote:
>>>>> On 20 Jan 2026, at 17:33, Jordan Niethe wrote:
>>>>>
>>>>>> On 14/1/26 07:04, Zi Yan wrote:
>>>>>>> On 7 Jan 2026, at 4:18, Jordan Niethe wrote:
>>>>>>>
>>>>>>>> Currently when creating these device private struct pages, the fir=
st
>>>>>>>> step is to use request_free_mem_region() to get a range of physica=
l
>>>>>>>> address space large enough to represent the devices memory. This
>>>>>>>> allocated physical address range is then remapped as device privat=
e
>>>>>>>> memory using memremap_pages().
>>>>>>>>
>>>>>>>> Needing allocation of physical address space has some problems:
>>>>>>>>
>>>>>>>>     1) There may be insufficient physical address space to represe=
nt the
>>>>>>>>        device memory. KASLR reducing the physical address space an=
d VM
>>>>>>>>        configurations with limited physical address space increase=
 the
>>>>>>>>        likelihood of hitting this especially as device memory incr=
eases. This
>>>>>>>>        has been observed to prevent device private from being init=
ialized.
>>>>>>>>
>>>>>>>>     2) Attempting to add the device private pages to the linear ma=
p at
>>>>>>>>        addresses beyond the actual physical memory causes issues o=
n
>>>>>>>>        architectures like aarch64 meaning the feature does not wor=
k there.
>>>>>>>>
>>>>>>>> Instead of using the physical address space, introduce a device pr=
ivate
>>>>>>>> address space and allocate devices regions from there to represent=
 the
>>>>>>>> device private pages.
>>>>>>>>
>>>>>>>> Introduce a new interface memremap_device_private_pagemap() that
>>>>>>>> allocates a requested amount of device private address space and c=
reates
>>>>>>>> the necessary device private pages.
>>>>>>>>
>>>>>>>> To support this new interface, struct dev_pagemap needs some chang=
es:
>>>>>>>>
>>>>>>>>     - Add a new dev_pagemap::nr_pages field as an input parameter.
>>>>>>>>     - Add a new dev_pagemap::pages array to store the device
>>>>>>>>       private pages.
>>>>>>>>
>>>>>>>> When using memremap_device_private_pagemap(), rather then passing =
in
>>>>>>>> dev_pagemap::ranges[dev_pagemap::nr_ranges] of physical address sp=
ace to
>>>>>>>> be remapped, dev_pagemap::nr_ranges will always be 1, and the devi=
ce
>>>>>>>> private range that is reserved is returned in dev_pagemap::range.
>>>>>>>>
>>>>>>>> Forbid calling memremap_pages() with dev_pagemap::ranges::type =3D
>>>>>>>> MEMORY_DEVICE_PRIVATE.
>>>>>>>>
>>>>>>>> Represent this device private address space using a new
>>>>>>>> device_private_pgmap_tree maple tree. This tree maps a given devic=
e
>>>>>>>> private address to a struct dev_pagemap, where a specific device p=
rivate
>>>>>>>> page may then be looked up in that dev_pagemap::pages array.
>>>>>>>>
>>>>>>>> Device private address space can be reclaimed and the assoicated d=
evice
>>>>>>>> private pages freed using the corresponding new
>>>>>>>> memunmap_device_private_pagemap() interface.
>>>>>>>>
>>>>>>>> Because the device private pages now live outside the physical add=
ress
>>>>>>>> space, they no longer have a normal PFN. This means that page_to_p=
fn(),
>>>>>>>> et al. are no longer meaningful.
>>>>>>>>
>>>>>>>> Introduce helpers:
>>>>>>>>
>>>>>>>>     - device_private_page_to_offset()
>>>>>>>>     - device_private_folio_to_offset()
>>>>>>>>
>>>>>>>> to take a given device private page / folio and return its offset =
within
>>>>>>>> the device private address space.
>>>>>>>>
>>>>>>>> Update the places where we previously converted a device private p=
age to
>>>>>>>> a PFN to use these new helpers. When we encounter a device private
>>>>>>>> offset, instead of looking up its page within the pagemap use
>>>>>>>> device_private_offset_to_page() instead.
>>>>>>>>
>>>>>>>> Update the existing users:
>>>>>>>>
>>>>>>>>    - lib/test_hmm.c
>>>>>>>>    - ppc ultravisor
>>>>>>>>    - drm/amd/amdkfd
>>>>>>>>    - gpu/drm/xe
>>>>>>>>    - gpu/drm/nouveau
>>>>>>>>
>>>>>>>> to use the new memremap_device_private_pagemap() interface.
>>>>>>>>
>>>>>>>> Signed-off-by: Jordan Niethe <jniethe@nvidia.com>
>>>>>>>> Signed-off-by: Alistair Popple <apopple@nvidia.com>
>>>>>>>>
>>>>>>>> ---
>>>>>>>>
>>>>>>>> NOTE: The updates to the existing drivers have only been compile t=
ested.
>>>>>>>> I'll need some help in testing these drivers.
>>>>>>>>
>>>>>>>> v1:
>>>>>>>> - Include NUMA node paramater for memremap_device_private_pagemap(=
)
>>>>>>>> - Add devm_memremap_device_private_pagemap() and friends
>>>>>>>> - Update existing users of memremap_pages():
>>>>>>>>       - ppc ultravisor
>>>>>>>>       - drm/amd/amdkfd
>>>>>>>>       - gpu/drm/xe
>>>>>>>>       - gpu/drm/nouveau
>>>>>>>> - Update for HMM huge page support
>>>>>>>> - Guard device_private_offset_to_page and friends with CONFIG_ZONE=
_DEVICE
>>>>>>>>
>>>>>>>> v2:
>>>>>>>> - Make sure last member of struct dev_pagemap remains DECLARE_FLEX=
_ARRAY(struct range, ranges);
>>>>>>>> ---
>>>>>>>>    Documentation/mm/hmm.rst                 |  11 +-
>>>>>>>>    arch/powerpc/kvm/book3s_hv_uvmem.c       |  41 ++---
>>>>>>>>    drivers/gpu/drm/amd/amdkfd/kfd_migrate.c |  23 +--
>>>>>>>>    drivers/gpu/drm/nouveau/nouveau_dmem.c   |  35 ++--
>>>>>>>>    drivers/gpu/drm/xe/xe_svm.c              |  28 +---
>>>>>>>>    include/linux/hmm.h                      |   3 +
>>>>>>>>    include/linux/leafops.h                  |  16 +-
>>>>>>>>    include/linux/memremap.h                 |  64 +++++++-
>>>>>>>>    include/linux/migrate.h                  |   6 +-
>>>>>>>>    include/linux/mm.h                       |   2 +
>>>>>>>>    include/linux/rmap.h                     |   5 +-
>>>>>>>>    include/linux/swapops.h                  |  10 +-
>>>>>>>>    lib/test_hmm.c                           |  69 ++++----
>>>>>>>>    mm/debug.c                               |   9 +-
>>>>>>>>    mm/memremap.c                            | 193 ++++++++++++++++=
++-----
>>>>>>>>    mm/mm_init.c                             |   8 +-
>>>>>>>>    mm/page_vma_mapped.c                     |  19 ++-
>>>>>>>>    mm/rmap.c                                |  43 +++--
>>>>>>>>    mm/util.c                                |   5 +-
>>>>>>>>    19 files changed, 391 insertions(+), 199 deletions(-)
>>>>>>>>
>>>>>>> <snip>
>>>>>>>
>>>>>>>> diff --git a/include/linux/mm.h b/include/linux/mm.h
>>>>>>>> index e65329e1969f..b36599ab41ba 100644
>>>>>>>> --- a/include/linux/mm.h
>>>>>>>> +++ b/include/linux/mm.h
>>>>>>>> @@ -2038,6 +2038,8 @@ static inline unsigned long memdesc_section(=
memdesc_flags_t mdf)
>>>>>>>>     */
>>>>>>>>    static inline unsigned long folio_pfn(const struct folio *folio=
)
>>>>>>>>    {
>>>>>>>> +	VM_BUG_ON(folio_is_device_private(folio));
>>>>>>>
>>>>>>> Please use VM_WARN_ON instead.
>>>>>>
>>>>>> ack.
>>>>>>
>>>>>>>
>>>>>>>> +
>>>>>>>>    	return page_to_pfn(&folio->page);
>>>>>>>>    }
>>>>>>>>
>>>>>>>> diff --git a/include/linux/rmap.h b/include/linux/rmap.h
>>>>>>>> index 57c63b6a8f65..c1561a92864f 100644
>>>>>>>> --- a/include/linux/rmap.h
>>>>>>>> +++ b/include/linux/rmap.h
>>>>>>>> @@ -951,7 +951,7 @@ static inline unsigned long page_vma_walk_pfn(=
unsigned long pfn)
>>>>>>>>    static inline unsigned long folio_page_vma_walk_pfn(const struc=
t folio *folio)
>>>>>>>>    {
>>>>>>>>    	if (folio_is_device_private(folio))
>>>>>>>> -		return page_vma_walk_pfn(folio_pfn(folio)) |
>>>>>>>> +		return page_vma_walk_pfn(device_private_folio_to_offset(folio))=
 |
>>>>>>>>    		       PVMW_PFN_DEVICE_PRIVATE;
>>>>>>>>
>>>>>>>>    	return page_vma_walk_pfn(folio_pfn(folio));
>>>>>>>> @@ -959,6 +959,9 @@ static inline unsigned long folio_page_vma_wal=
k_pfn(const struct folio *folio)
>>>>>>>>
>>>>>>>>    static inline struct page *page_vma_walk_pfn_to_page(unsigned l=
ong pvmw_pfn)
>>>>>>>>    {
>>>>>>>> +	if (pvmw_pfn & PVMW_PFN_DEVICE_PRIVATE)
>>>>>>>> +		return device_private_offset_to_page(pvmw_pfn >> PVMW_PFN_SHIFT=
);
>>>>>>>> +
>>>>>>>>    	return pfn_to_page(pvmw_pfn >> PVMW_PFN_SHIFT);
>>>>>>>>    }
>>>>>>>
>>>>>>> <snip>
>>>>>>>
>>>>>>>> diff --git a/mm/page_vma_mapped.c b/mm/page_vma_mapped.c
>>>>>>>> index 96c525785d78..141fe5abd33f 100644
>>>>>>>> --- a/mm/page_vma_mapped.c
>>>>>>>> +++ b/mm/page_vma_mapped.c
>>>>>>>> @@ -107,6 +107,7 @@ static bool map_pte(struct page_vma_mapped_wal=
k *pvmw, pmd_t *pmdvalp,
>>>>>>>>    static bool check_pte(struct page_vma_mapped_walk *pvmw, unsign=
ed long pte_nr)
>>>>>>>>    {
>>>>>>>>    	unsigned long pfn;
>>>>>>>> +	bool device_private =3D false;
>>>>>>>>    	pte_t ptent =3D ptep_get(pvmw->pte);
>>>>>>>>
>>>>>>>>    	if (pvmw->flags & PVMW_MIGRATION) {
>>>>>>>> @@ -115,6 +116,9 @@ static bool check_pte(struct page_vma_mapped_w=
alk *pvmw, unsigned long pte_nr)
>>>>>>>>    		if (!softleaf_is_migration(entry))
>>>>>>>>    			return false;
>>>>>>>>
>>>>>>>> +		if (softleaf_is_migration_device_private(entry))
>>>>>>>> +			device_private =3D true;
>>>>>>>> +
>>>>>>>>    		pfn =3D softleaf_to_pfn(entry);
>>>>>>>>    	} else if (pte_present(ptent)) {
>>>>>>>>    		pfn =3D pte_pfn(ptent);
>>>>>>>> @@ -127,8 +131,14 @@ static bool check_pte(struct page_vma_mapped_=
walk *pvmw, unsigned long pte_nr)
>>>>>>>>    			return false;
>>>>>>>>
>>>>>>>>    		pfn =3D softleaf_to_pfn(entry);
>>>>>>>> +
>>>>>>>> +		if (softleaf_is_device_private(entry))
>>>>>>>> +			device_private =3D true;
>>>>>>>>    	}
>>>>>>>>
>>>>>>>> +	if ((device_private) ^ !!(pvmw->pfn & PVMW_PFN_DEVICE_PRIVATE))
>>>>>>>> +		return false;
>>>>>>>> +
>>>>>>>>    	if ((pfn + pte_nr - 1) < (pvmw->pfn >> PVMW_PFN_SHIFT))
>>>>>>>>    		return false;
>>>>>>>>    	if (pfn > ((pvmw->pfn >> PVMW_PFN_SHIFT) + pvmw->nr_pages - 1)=
)
>>>>>>>> @@ -137,8 +147,11 @@ static bool check_pte(struct page_vma_mapped_=
walk *pvmw, unsigned long pte_nr)
>>>>>>>>    }
>>>>>>>>
>>>>>>>>    /* Returns true if the two ranges overlap.  Careful to not over=
flow. */
>>>>>>>> -static bool check_pmd(unsigned long pfn, struct page_vma_mapped_w=
alk *pvmw)
>>>>>>>> +static bool check_pmd(unsigned long pfn, bool device_private, str=
uct page_vma_mapped_walk *pvmw)
>>>>>>>>    {
>>>>>>>> +	if ((device_private) ^ !!(pvmw->pfn & PVMW_PFN_DEVICE_PRIVATE))
>>>>>>>> +		return false;
>>>>>>>> +
>>>>>>>>    	if ((pfn + HPAGE_PMD_NR - 1) < (pvmw->pfn >> PVMW_PFN_SHIFT))
>>>>>>>>    		return false;
>>>>>>>>    	if (pfn > (pvmw->pfn >> PVMW_PFN_SHIFT) + pvmw->nr_pages - 1)
>>>>>>>> @@ -255,6 +268,8 @@ bool page_vma_mapped_walk(struct page_vma_mapp=
ed_walk *pvmw)
>>>>>>>>
>>>>>>>>    				if (!softleaf_is_migration(entry) ||
>>>>>>>>    				    !check_pmd(softleaf_to_pfn(entry),
>>>>>>>> +					       softleaf_is_device_private(entry) ||
>>>>>>>> +					       softleaf_is_migration_device_private(entry),
>>>>>>>>    					       pvmw))
>>>>>>>>    					return not_found(pvmw);
>>>>>>>>    				return true;
>>>>>>>> @@ -262,7 +277,7 @@ bool page_vma_mapped_walk(struct page_vma_mapp=
ed_walk *pvmw)
>>>>>>>>    			if (likely(pmd_trans_huge(pmde))) {
>>>>>>>>    				if (pvmw->flags & PVMW_MIGRATION)
>>>>>>>>    					return not_found(pvmw);
>>>>>>>> -				if (!check_pmd(pmd_pfn(pmde), pvmw))
>>>>>>>> +				if (!check_pmd(pmd_pfn(pmde), false, pvmw))
>>>>>>>>    					return not_found(pvmw);
>>>>>>>>    				return true;
>>>>>>>>    			}
>>>>>>>
>>>>>>> It seems to me that you can add a new flag like =E2=80=9Cbool is_de=
vice_private=E2=80=9D to
>>>>>>> indicate whether pfn is a device private index instead of pfn witho=
ut
>>>>>>> manipulating pvmw->pfn itself.
>>>>>>
>>>>>> We could do it like that, however my concern with using a new param =
was that
>>>>>> storing this info seperately might make it easier to misuse a device=
 private
>>>>>> index as a regular pfn.
>>>>>>
>>>>>> It seemed like it could be easy to overlook both when creating the p=
vmw and
>>>>>> then when accessing the pfn.
>>>>>
>>>>> That is why I asked for a helper function like page_vma_walk_pfn(pvmw=
) to
>>>>> return the converted pfn instead of pvmw->pfn directly. You can add a=
 comment
>>>>> to ask people to use helper function and even mark pvmw->pfn /* do no=
t use
>>>>> directly */.
>>>>
>>>> Yeah I agree that is a good idea.
>>>>
>>>>>
>>>>> In addition, your patch manipulates pfn by left shifting it by 1. Are=
 you sure
>>>>> there is no weird arch having pfns with bit 63 being 1? Your change c=
ould
>>>>> break it, right?
>>>>
>>>> Currently for migrate pfns we left shift by pfns by MIGRATE_PFN_SHIFT =
(6), so I
>>>> thought doing something similiar here should be safe.
>>>
>>> Yeah, but that limits to archs supporting HMM. page_vma_mapped_walk is =
used
>>> by almost every arch, so it has a broader impact.
>>
>> We need to be a bit careful by what we mean when we say "HMM" in the ker=
nel.
>>
>> Specifically MIGRATE_PFN_SHIFT is used with migrate_vma/migrate_device, =
which
>> is the migration half of "HMM" which does depend on CONFIG_DEVICE_MIGRAT=
ION or
>> really just CONFIG_ZONE_DEVICE making it somewhat arch specific.
>>
>> However hmm_range_fault() does something similar - see the definition of
>> hmm_pfn_flags - it actually steals the top 11 bits of a pfn for flags, a=
nd it is
>> not architecture specific. It only depends on CONFIG_MMU.
>
> Oh, that is hacky. But are HMM PFNs with any flag exposed to code outside=
 HMM?
> Currently, device private needs to reserve PFNs for struct page, so I ass=
ume
> only the reserved PFNs are seen by outsiders. Otherwise, when outsiders s=
ee
> a HMM PFN with a flag, pfn_to_page() on such a PFN will read non exist
> struct page, right?
>
> For this page_vma_mapped_walk code, it is manipulating PFNs used by every=
one,
> not just HMM, and can potentially (might be very rare) alter their values
> after shifts.


> And if an HMM PFN with HMM_PFN_VALID is processed by the code,
> the HMM PFN will lose HMM_PFN_VALID bit. So I guess HMM PFN is not showin=
g
> outside HMM code.

Oops, this code is removing PFN reservation mechanism, so please ignore
the above two sentences.

>
>>
>> Now I'm not saying this implies it actually works on all architectures a=
s I
>> agree the page_vma_mapped_walk code is used much more widely. Rather I'm=
 just
>> pointing out if there are issues with some architectures using high PFN =
bits
>> then we likely have a problem here too :-)
>
>
> Best Regards,
> Yan, Zi


Best Regards,
Yan, Zi

