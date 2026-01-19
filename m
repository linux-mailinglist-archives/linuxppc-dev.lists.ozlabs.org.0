Return-Path: <linuxppc-dev+bounces-16014-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 59DF8D3B889
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Jan 2026 21:36:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dw2Kx3hPrz2xSZ;
	Tue, 20 Jan 2026 07:36:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c105::7" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768854981;
	cv=pass; b=mRvcOld1iSDznUR34iV4Q6mQF6WEnt6yMbYO8kmYFJDugKDYkqOIMQsaubXEkXkzBF98lVrV9LN13g1uVvKfO2QKAENTuDktLh71M3ss7Rerkv+ML86rAKwCggjIUm0icgXNqB7fHICOQ1VZSZm6d5ZJEVo0vhm5/DodofEcvEyrz71DhjjUyQBzNHeWQbCxTFbbtG/3UV6mcFsgFtgVX1oeVR8433jne1bZPTeOiCtJvRdDiniGQhVCAro+YdN3hcXh7G1u19ifHZG8ujFcP8lZiPisI8geyOqpwEJ1wv1t48t46yIvZhqt7LRR9rPy+07fh0Q0pwdkcFKJQuVrUg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768854981; c=relaxed/relaxed;
	bh=cqwJ99sB+WpZdLOpX/iQS2fCclcGYl4Gg1nFeN38+t4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ftoVtzMx6ifaptJL9bj+etbPo2uiSVOI/PvIVWAuMos4QKmnLaL5BwW7TN5ZW62DzE71Aqxw8zEWrv5bFOpV26Xzm8vY972KkgLRrHUB8K4giRey5PaJURKOir5X6I7TEXFJI4dYzISFNKDwfr69CJkkNeACmoVVCCoH6I+h0mFUauTRrOr/TyRedPl3S0qP3sQrvsjom/G1+sF/AjihGavQLnUk9Mblp6JDvOuak40fNIDsrVoMLMNRxxuMRsPBAoxEDLPz+Cqb4MK6GujiFOVqHfBfUOAq4vi3KYSvbfi/Q3ckklIqqnRKAlMu0ULR50VngplMqF/GZGZyR5XNQw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=PBC6/iEI; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c105::7; helo=ch4pr04cu002.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=PBC6/iEI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:c105::7; helo=ch4pr04cu002.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazlp170130007.outbound.protection.outlook.com [IPv6:2a01:111:f403:c105::7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dw2Ks2sMDz2xJ6
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Jan 2026 07:36:16 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JqAnRwwlPlR6LfWAZLlLrdlHiPD8IEkYIhJq3PKnyulYeNyUuJq+EAdp5GLMl4MpOIPl06/qKjyuq67gw+UmhfCE6+VzBvlY1LhcN+KZoJQlOStc96vifbUw7y7JDtWL72fzkseKZ6inblgQPMyGTyTxC5aAsIVnEa6tqiSjdsJtTLeSc9gF+/rse/vwvgrdrXVh1bTSk8dN1+G0Yp4MVKN07vtJrLyw4s7p+wz59cDNSbeTBdUCiDkEpOQRQ3hYktwP8GQD0V7PZoFGX9WCzb35CxpNG4k8oJidQGKtY5IjxgmEj54K3halyb4tCp5BNzNIz7LUo0OJPN18AKyc/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cqwJ99sB+WpZdLOpX/iQS2fCclcGYl4Gg1nFeN38+t4=;
 b=MhgRhw0qLLFooaS0rzird99wQ6DDRZlmSBmXjV4znMCB7wzx7EEOZSq4PwuDD/Bvl5w7I79B+kB55Rx7PxCWKnEMj4ViAvvqttVGhwsPPFvYiw67r45jwNi9buC5hCkQEmQQAB4/Wbbik7BbtJPQ7J6NDUK/TS2K/msPSuakJhPIZGvSj/zcyXct/ALMlynlt74f0rllLMxTgMpCJt3D22tEp4WP0hZ6lNj6/BUlXLkbsZJaPG/wNmWi9jv5SPMRh6/BwsnZhv3dHngmfYbUNfPSz23WX5gGjqug10JLTya8x/a3lm9ZS/56GR2MFGhhimnTV14AJZD3+pUEx2ISnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cqwJ99sB+WpZdLOpX/iQS2fCclcGYl4Gg1nFeN38+t4=;
 b=PBC6/iEIbPioprU1kWGkAlvltAvUds33uBCHMYzJ25gGSWv8sQewafR3NvEZPvdGzfC7IZIAdZQARmwql6Hkc22q3YSn7o3gamUM1xMhUW0TOoUgsBt0Ve9PU1YNK54gnuo6Uoc2Rltdz32xTCz8qU5oRYtIyv/0PhdaIZ/jQA3Pk5Xuo8pzqS3LWyZEvkXqCjfo/4WpAqp/T0DkfUs7DzdTDH396eA/2lbMYW1jywXt+PIvzVRLVgwTB/J3P1mNAI90yZij8hYNIWOio21374pl+zD6wRwHipBjSqspDqIZoDWXqKQX87qcGh4VpB80bYDr63rJ5EO5bBODi1rUbQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by DS7PR12MB6237.namprd12.prod.outlook.com (2603:10b6:8:97::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.11; Mon, 19 Jan
 2026 20:35:52 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::1b59:c8a2:4c00:8a2c]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::1b59:c8a2:4c00:8a2c%3]) with mapi id 15.20.9520.011; Mon, 19 Jan 2026
 20:35:52 +0000
Date: Mon, 19 Jan 2026 16:35:51 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Zi Yan <ziy@nvidia.com>
Cc: Matthew Wilcox <willy@infradead.org>,
	Alistair Popple <apopple@nvidia.com>,
	Matthew Brost <matthew.brost@intel.com>,
	Balbir Singh <balbirs@nvidia.com>, Vlastimil Babka <vbabka@suse.cz>,
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
Message-ID: <20260119203551.GQ1134360@nvidia.com>
References: <20260116174947.GA1134434@nvidia.com>
 <8006ea5f-8845-436a-a2d7-125399428762@suse.cz>
 <aWqgHTZ5hjlRvlKU@lstrano-desk.jf.intel.com>
 <20260117005114.GC1134360@nvidia.com>
 <aWsIT8A2dLciFvhj@lstrano-desk.jf.intel.com>
 <eb94d115-18a6-455b-b020-f18f372e283a@nvidia.com>
 <aWsdv6dX2RgqajFQ@lstrano-desk.jf.intel.com>
 <4k72r4n5poss2glrof5fsapczkpcrnpokposeikw5wjvtodbto@wpqsxoxzpvy6>
 <20260119142019.GG1134360@nvidia.com>
 <96926697-070C-45DE-AD26-559652625859@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <96926697-070C-45DE-AD26-559652625859@nvidia.com>
X-ClientProxiedBy: BL1P223CA0006.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:208:2c4::11) To LV8PR12MB9620.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|DS7PR12MB6237:EE_
X-MS-Office365-Filtering-Correlation-Id: 87cdaeca-8dda-4a4a-1279-08de579a56bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?kVD4Dcy9QupInUGAAjIrkIrkPzR3/cZmf07pMy2RrIFMq88dNzZTxvDShrZd?=
 =?us-ascii?Q?m5GXfTesdt4FQjXyGI24ykxvn1DIp7x+TNcbpQvjai19kJwtGFcPLZq3rtEq?=
 =?us-ascii?Q?z/4iXYuM/4jM4npEtUtyGYFzPKe5IWV7HDRWI6tkEfN90CM4wPukApPoebV0?=
 =?us-ascii?Q?KQUDJB6GXooDNcdEd8RpGmuE0IVz9f4TjrASHyA1Au5uo20QQ8ExnLFF9dPU?=
 =?us-ascii?Q?kCQ0assIjNllkLJoWuDyQR67lG1Byo4zdD8zZLHf6oHSDNnBAnROy6ulGePH?=
 =?us-ascii?Q?ZYPRY3bu31/hQHuK3QnrIyW8W3LFGiKHlVt8KQ3HzdLwBex08PnbuyEzDRfn?=
 =?us-ascii?Q?WiqKgPT85v090zWn9MM9Op5myaM7YPWza0XJQGhB8FTLzJsUjOt6qnw8jl4T?=
 =?us-ascii?Q?1aVkQWS6sl8kXSSO4/+S6TOhSBRcNfLbpHH0u8AES6LWHV0bXTHtL1AxnUWZ?=
 =?us-ascii?Q?/PrGixsL+SEhhMZSJwny7/YF0sG6GwmqwLe+so5K39spGd4b0Sh6OGrzWOAJ?=
 =?us-ascii?Q?FgxFnXAhCoUge+9flTUbHtIP8aKCUpHhYUhD5Vmqm4BIlDKetpdrRaaYKcCw?=
 =?us-ascii?Q?gDl6sdMlOIpsL5e9CVZE4U+FT50DKzpUXFCUCAZZEcA3tIpJUMrYuH8bNLR9?=
 =?us-ascii?Q?dD+AEtKb3Az+ngPAZLldr0me1jYujH2nhe338+wqB0Wdp5ByRu4yjpcDs61t?=
 =?us-ascii?Q?njUJ32og1aw1JGVozk6b+FkA5xwsvKWop9I1yMlTHN/rJEFCRO0zpXhsGeGH?=
 =?us-ascii?Q?qNSI3zmooxy9Lwt5przGmp336bSfbaFH7r48S6QSZoHArsD+maAfx1QpVYd0?=
 =?us-ascii?Q?f0vwsw1+eJ1frHOHOZM+9SFr/pjt0tdnHHTcKrxYuDVOCkSVDkNybZFjJbpY?=
 =?us-ascii?Q?8BlyEW6dzBzZcv/+MqLx8Byp2/it8+ou8V2van23Ywmv+oyJRQvA5W28SooM?=
 =?us-ascii?Q?gu0wMg/kLjBCc61N17JU8b1tV7C2s5bMNUvpmZ9Vf2A7vEXsqf5HaATg5V96?=
 =?us-ascii?Q?5qNAzRd8NBv018KO8EQtW/qmg1zVR1vsrl6DBeDl6hj0wDLwcGmhQ4Fd5zUe?=
 =?us-ascii?Q?D4jjOoEBKBYn+XsBdwV75vTMfkDVMeyA57uOajdbJs2twADTibfoB0KW3OIn?=
 =?us-ascii?Q?bDgoi5bAz/ahGT6so8UWlZs3cwFhEZ3pYLpDysDdxfqlbRgnVJ8eaAZmao+f?=
 =?us-ascii?Q?N2ui/z0lq5bjE1nL9ZVcAvdaELD48nBsrUhXBMWZSmrMS9qzdOH8biFO5q5n?=
 =?us-ascii?Q?75oaQ/8t8+eWfykc9M3VE/5cvnvQo267ECDqdouqauckbV2ERfhFm+IVydPs?=
 =?us-ascii?Q?UC2IlOQ+LJmHDkpjrRapS1Y+7h1F4w4MF4v+T+tsnXdVX4ZHnrZcVxJU59rF?=
 =?us-ascii?Q?XEz/m+zDnAAW3Wj3v79tWq0rZpnrKONwERG9GOzECDMgONO3bNnyswp85y3t?=
 =?us-ascii?Q?8xjjmYOUyHeGWASa13Ilhjqxy9529UpRIwnKKp+ii1b/dOVqR8/RnAmPKZLO?=
 =?us-ascii?Q?2YeneQI6DKIWwIlezhyYZZ5DYwBCwHxK7UEKZZUsS1+V15ikoagSoDLU2moS?=
 =?us-ascii?Q?NAez/LQTnK3OeTNiLdg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?j4NkJjRrDbLbuEszWwylX/7Jo2vdmxNsww1Fb/QVHrIhqzqnBWlSSzjYJSYq?=
 =?us-ascii?Q?HNiKx6ffOQ3Jx33AnZjucaEfzZMukBu+JiVjnEZcuTvMtapW1rrlsprqBfU8?=
 =?us-ascii?Q?qCuD1ckHZpynYZlZjGJn/5zGjI/+BPZNcrrABA/57S9N0YXblRNlShdWa7/e?=
 =?us-ascii?Q?w9zA7yKvMeFJFDylvo2WM0y6kL2xD4lOOp9rFPQklIHFdxclEWu6qGjczQwl?=
 =?us-ascii?Q?OrCl+6KpKU4CI6udGP/0inrbeFCdUeDji1aNrrk2sfwJqHdUjdOa5oj6+FpE?=
 =?us-ascii?Q?xHXYOS4iAwPznP65owVkIx8WlQw5hFV+ntL2EXypX+Wqg0FDZaYXUEniNU6H?=
 =?us-ascii?Q?rwHUvakFLU0iG7brgmAVAi+fF9+8dIXt7d7I8yE1w9WQ0+Z0nLYarbUqFjx0?=
 =?us-ascii?Q?+Ht2WR9OJLCQmhjezSHgUnXHq7eDpzzViVqetyOy0RYXt8pryL1Z3QwC13f7?=
 =?us-ascii?Q?mWO2TTsPpOXswCgQjVchW2wH1eG4nr8n/akaXrMfV1Ruolu8/NZf73QeFpCd?=
 =?us-ascii?Q?klx1ueVJ3ut3feX9DCg6ZU5rnANDqUtBXtkcoU9vvhzY5SDGBoqZOMwtSyZl?=
 =?us-ascii?Q?Gp00CczKKUwXiqxXqsJbX5ZJ2rQZRNS+KweUhwe1Uqltz3Ok7BemxhZuTzxl?=
 =?us-ascii?Q?Hanog5H71J1spAWw8kxO5RjF+V16sFSGd/Gxw5e76tgg32xOr2nVByx3py/h?=
 =?us-ascii?Q?8tJhl6/0UGYduljC6wC4mykL3do2VhLnjS4qGukZqvrwGYJOUO1Lw/yCgEi/?=
 =?us-ascii?Q?S7L738KK0SWDhlrwPpSwYUTeAwtAeXk6hNmXqmZpf8lkax6QKVyzLzDuwa5X?=
 =?us-ascii?Q?dSXXUeWLWZfcOvW1akHG7Jukzfwccq7SPsmgikSSK2TPMvNzlvxPk6lIg6g1?=
 =?us-ascii?Q?U/uOKlvbsF1TKQboiHKdb3jc8xFFB4xX24l+INeOQJqqj2efiZeErz68ITSL?=
 =?us-ascii?Q?9HCk8JF3aA7kaSSXgdXzPAklKbUEMnLJU8OqO7ilraw+O4IehZixO5aPn4We?=
 =?us-ascii?Q?XuSjpgaK1v9M7JrobA5IBLtQ2/Z5c7v9aexehyvhu4WoIPr6TKTJr7AYk9jP?=
 =?us-ascii?Q?bpbnhLfMUvmplHZNwjA34z5wba93s1f4He1+iDdclrLoTboyDNBmS2FC6ePQ?=
 =?us-ascii?Q?g5Zwxmt3ZGzoIRh1CZPcplgby5QAxwW4CILOk1osVRpxfmOR8J6wDGEl5+7H?=
 =?us-ascii?Q?NSMQ6sGHiKVM/8ds60/kex3ygVE+H4q3zGlsou4FO5aq4nTdMUN2+b2RgyDe?=
 =?us-ascii?Q?z4+1fJryTFFqZRy0b8NuJ7Zi8gAaNkNIQ4rOacXlGmb+TWU8lk4HUgtJ8v+K?=
 =?us-ascii?Q?oj5Jq1y8O7v9HS7ilDJoNMGok309ZDP01oZ4deoskC0EKKQRpMjWX8pjhKpf?=
 =?us-ascii?Q?fh7wO2r4wE+DZt+HVsz5b/FzGltqQIaTETwPRrvIATUtU07f0HN1/ScYOROP?=
 =?us-ascii?Q?CeVOZtUTtJfg7SZ+4JhAiI3PbfmQJ5zZ3QOJ0QqyG3mUSZqiciGlApcasJEP?=
 =?us-ascii?Q?lB6kUyqnVKAGt1BIsDAsAj6pMK1X7SWMih3KOI/vW29fUHQIOX2Uh9PkzkF9?=
 =?us-ascii?Q?1v3DVxvVcCVj9S4vVQSUhW8vJzU0SjEXxeoiub9PMQXsSywhId4u1bIiRhB9?=
 =?us-ascii?Q?ZoOCL/5sQeueL/c50x7FTPx74oHBgbInuNwisCMG5mWRo7QZfi/bWk7yWKJF?=
 =?us-ascii?Q?uQ/PFbuDplemU/V2gnY5O4I62YLr5SYUmHeqY72zptUIwRtdPa58Ojv39W/q?=
 =?us-ascii?Q?5eI5XmhUOg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87cdaeca-8dda-4a4a-1279-08de579a56bb
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2026 20:35:52.6295
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 18xKI5yb/l3rNnlINOO7Qc+Tr67uNazdd1Me4eHszTPb8NAHIXzPLHpRZxnuiaHc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6237
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_NONE,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, Jan 19, 2026 at 03:09:00PM -0500, Zi Yan wrote:
> > diff --git a/mm/internal.h b/mm/internal.h
> > index e430da900430a1..a7d3f5e4b85e49 100644
> > --- a/mm/internal.h
> > +++ b/mm/internal.h
> > @@ -806,14 +806,21 @@ static inline void prep_compound_head(struct page *page, unsigned int order)
> >  		atomic_set(&folio->_pincount, 0);
> >  		atomic_set(&folio->_entire_mapcount, -1);
> >  	}
> > -	if (order > 1)
> > +	if (order > 1) {
> >  		INIT_LIST_HEAD(&folio->_deferred_list);
> > +	} else {
> > +		folio->mapping = NULL;
> > +#ifdef CONFIG_MEMCG
> > +		folio->memcg_data = 0;
> > +#endif
> > +	}
> 
> prep_compound_head() is only called on >0 order pages. The above
> code means when order == 1, folio->mapping and folio->memcg_data are
> assigned NULL.

OK, fair enough, the conditionals would have to change and maybe it
shouldn't be called "compound_head" if it also cleans up normal pages.

> >  static inline void prep_compound_tail(struct page *head, int tail_idx)
> >  {
> >  	struct page *p = head + tail_idx;
> >
> > +	p->flags.f &= ~0xffUL;	/* Clear possible order, page head */
> 
> No one cares about tail page flags if it is not checked in check_new_page()
> from mm/page_alloc.c.

At least page_fixed_fake_head() does check PG_head in some
configurations. It does seem safer to clear it. Possibly order is
never used, but it is free to clear it.

> > -	if (order)
> > -		prep_compound_page(page, order);
> > +	prep_compound_page(page, order);
> 
> prep_compound_page() should only be called for >0 order pages. This creates
> another weirdness in device pages by assuming all pages are
> compound.

OK

> > +	folio = page_folio(page);
> > +	folio->pgmap = pgmap;
> > +	folio_lock(folio);
> > +	folio_set_count(folio, 1);
> 
> /* clear possible previous page->mapping */
> folio->mapping = NULL;
> 
> /* clear possible previous page->_nr_pages */
> #ifdef CONFIG_MEMCG
> 	folio->memcg_data = 0;
> #endif

This is reasonable too, but prep_compound_head() was doing more than
that, it is also clearing the order, and this needs to clear the head
bit.  That's why it was apppealing to reuse those functions, but you
are right they are not ideal.

I suppose we want some prep_single_page(page) and some reorg to share
code with the other prep function.

> This patch mixed the concept of page and folio together, thus
> causing confusion. Core MM sees page and folio two separate things:
> 1. page is the smallest internal physical memory management unit,
> 2. folio is an abstraction on top of pages, and other abstractions can be
>    slab, ptdesc, and more (https://kernelnewbies.org/MatthewWilcox/Memdescs).

I think the users of zone_device_page_init() are principally trying to
create something that can be installed in a non-special PTE. Meaning
the output is always a folio because it is going to be read as a folio
in the page walkers.

Thus, the job of this function is to take the memory range starting at
page for 2^order and turn it into a single valid folio with refcount
of 1.

> If device pages have to initialize on top of pages with obsolete states,
> at least it should be first initialized as pages, then as folios to avoid
> confusion.

I don't think so. It should do the above job efficiently and iterate
over the page list exactly once.

Jason

