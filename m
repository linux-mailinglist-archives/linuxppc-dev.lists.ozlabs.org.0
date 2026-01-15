Return-Path: <linuxppc-dev+bounces-15761-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C2CAD226E6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Jan 2026 06:28:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dsBMn39jHz2xrC;
	Thu, 15 Jan 2026 16:28:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c111::5" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768454885;
	cv=pass; b=j+0nC5o8MaGpTFZTMqH92PdpUizJD+qqusMp9iuK9vetdptscT3Qp//hWcZMQPUuqIJ/XAMtjn5bsQgW1hGkB3fIiZToKoIIk16iYovfG8bR3BtDLun9u6AwlAJ6Z/l4KL51+Zir4/0pYD+zXrX3S5Az+XNvUEoVO2cbD8/+lUv6MVo/Yy7E2eEEffjAbIbI4X0143Wb2J1CtX/aD+B4qNTqsckklYqQPelEoz9/5Wj1uiekiYRG5cWIZ0GtMMjE37riD7rMDp9Fw480XJblrZJIC560Yj//tSa1xpJ0x9ZuskoY9B8SYcS5k+6DfWV4mPFaRfqsM/aDicM0KSpSWQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768454885; c=relaxed/relaxed;
	bh=oqkF8qFO4m1AXK8UhAnkZyaQ84SfZzU6O2W38CJYArs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Pa0xlfLtL/L/Kb4RnJQd3bPZX0je6WtlHRG4F9cOanw5d5E4SXcwBhS9eHj34V3A7A3vMMOipq2Q4tFM5PcBbn1hEKuW/cke90ObUn/A8fG+dfWLrnLG3BpyBB8rm3fpq9PPWcTcP89eCXoLpyozxuICKGnSDxJ4ZtL2DzsQ/mOPohWMbhBGQOqBKaNyUb3ax4KAGUZhX2l6scXo3Feg6UhGTGbWI/2y9K66K4UB8NRE+bsS8nS1TvHtxzAvMzaj1z0IgaOm1syGHSmHy0BIJBaJVXFmtSrBcxaegg2/yVzzWEMejafSIlUd9MjPEDxeo9khPT/02qaruBO8+UH+xQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=IqwiDEfW; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c111::5; helo=dm1pr04cu001.outbound.protection.outlook.com; envelope-from=apopple@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=IqwiDEfW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:c111::5; helo=dm1pr04cu001.outbound.protection.outlook.com; envelope-from=apopple@nvidia.com; receiver=lists.ozlabs.org)
Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazlp170100005.outbound.protection.outlook.com [IPv6:2a01:111:f403:c111::5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dsBMh54kRz2xHW
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Jan 2026 16:28:00 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e5fSKh4PnvMUux701XWR8dFs/IF0+zrXXgscGe1uIiMRzm0oEJ2L+9zi6M4pJIFcFFQzHyJSbGGk9TjSMr1wzW5lgRZyX+xrGLk8IdM48+/hVLV8YYVKz8Gg48EDTa7CtoBEFNqPtnOJLqOQW/HR56q4sTt8SibEUfH7XGAIu4IZkWRyeH40hTb6yKU0y2Z7QTMZGKG0ovH5XfhIZVTZOqI2P31euazR2Rt62tzBFD+VU5D3GswYMYaMSpzXjTVo/xq0s8mxCP/pLA4vk8IHvTrYYJZ5QQ52WOETHYSEf6JR0/83rntybJSi7/IuvJcaJ4aksI8hKk2bhYu04/to5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oqkF8qFO4m1AXK8UhAnkZyaQ84SfZzU6O2W38CJYArs=;
 b=qLZ/eVPtsZtBe5LDHKFV7poKzELWGAoUYCPrZxV70LB99vv8KDj1mYbsEHTCcFHL3oEJRUGaGoOrOr+ZYzHgb6gcOg8wEa4q1FGaQHTyb60B8aSj3h1FueNjgMm09G0r/8adpJI67lPYFx+1DADbCmg3DWOd+8/Rma8zYcjZjl/qafKU4TTGy83vHEJ653yS3JmAYMblXEb/fvbkooM/wieGJ9KWyiJpy3JayMJAPIYuEfi9IsYyO+m1FfkVXA0BV23gdvyw2wBjJjPgpVpUtJt84ymT4u2aHrRf1F9/64ykdUd28QaLyE8zHp3XihVXzrBKlGmqnENmFqcHYLioiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oqkF8qFO4m1AXK8UhAnkZyaQ84SfZzU6O2W38CJYArs=;
 b=IqwiDEfW9wwffpnkjro4GxRMjl7MVZAT+ECcvWeLxn1f0N6sCp+qkqTZ54eNhgHtlCpasxEx+1LeR8Ve+ZYr7xaRwe+Up4G9pXF9oQq9Yfkca8IeRDq+6NM936sRymySS2QdOrFuiKZhFc/S8had3uiXy8XIIkldB25kbsxapBoPyhKQRE3L5vRp/H9Mx2blV2ZEIJ2C/+04//cODXtw7BT4Nd1J3qVKMSOIF9stY+ca29MhnN6qxory39vU/oAIC04UZ02eWw9/CnF5yaC/kTiK1u9f6ib4GFFldotcSqCa9FJuT7oD95hpMHsQYsD9obITCKtvBopbFOFGNem/rA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 PH7PR12MB6883.namprd12.prod.outlook.com (2603:10b6:510:1b9::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Thu, 15 Jan
 2026 05:27:31 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%4]) with mapi id 15.20.9520.005; Thu, 15 Jan 2026
 05:27:30 +0000
Date: Thu, 15 Jan 2026 16:27:26 +1100
From: Alistair Popple <apopple@nvidia.com>
To: Francois Dugast <francois.dugast@intel.com>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	Matthew Brost <matthew.brost@intel.com>, Zi Yan <ziy@nvidia.com>, 
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
Message-ID: <6spceodgfobizdaziju4yvvfydwvvik2wjyoyfuglozq533rgl@vmkotau3m3kw>
References: <20260114192111.1267147-1-francois.dugast@intel.com>
 <20260114192111.1267147-2-francois.dugast@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260114192111.1267147-2-francois.dugast@intel.com>
X-ClientProxiedBy: SY6PR01CA0059.ausprd01.prod.outlook.com
 (2603:10c6:10:ea::10) To DS0PR12MB7726.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|PH7PR12MB6883:EE_
X-MS-Office365-Filtering-Correlation-Id: 23a9c9ca-c787-4c45-2ad5-08de53f6c72a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ckpSSWdQL0JLNTk1Ni9aVVI5TWs5K3dmZWROMFR1cHpwMzFQOW03bTNKakVZ?=
 =?utf-8?B?WUszUUNjRmhvZkN4RFNyRGMxaUVDWWdIY0N4M1pMd091elJZN3J4WnNOb3Ix?=
 =?utf-8?B?LzNLTkQyVGhDQkxtR1JEZFVmd0V1YkZGeEt4Q2tQbTZtNmpTVG56WDZrQ0cw?=
 =?utf-8?B?QWVOM0g4Qy9UaXFwT0xPTFVVMVdxVHArbjNCTU1KVGhBeFJTc2VTbU5ESmMy?=
 =?utf-8?B?UlZMcWhrbmU5WFVvMHFRZkhzR3dUTmVIYzV0N2EzajR4dWNwbDZYSndMcUpZ?=
 =?utf-8?B?WmhvSUVYeWQ4K2U3QUVRVEpmSC9BeXJrZGRtUFV5bjV0Mk5vd0VaSE5yRnBp?=
 =?utf-8?B?T3JmT21mWVhoZDM2ZDVjaENOSEJqdG1scVAxWVY1RXNYYURzckRDSmI0UkVX?=
 =?utf-8?B?cGNHd3k3TUloaGFMdFkxcm40MlZacTZ0L0NVbFk2S1picUNGWFZUSEh2ekkw?=
 =?utf-8?B?dy9uK0ZVMUcvVjVXYlAyZ0xzWUF2T3RSbHpHS1Y4eUlnU2RRdTZCNlVLUmpm?=
 =?utf-8?B?bG90RjV1aGVoWk4rbGtiUnpBMFpsb0lTT0puc2hWNi82Ykt3SVErcjIyaEx2?=
 =?utf-8?B?aFBaZ3ZTOVFMNkVCSjBvMnpjNlM0UHNDRForbHgxMWZNOGdRSFp3OUNoK0dP?=
 =?utf-8?B?V09Qb3lRNG42WHFyWEhheGNzQkcrNmF2TmoyakJSSTMzOFdCblVyT0UvL2tp?=
 =?utf-8?B?LzgzY0w2OVlxRXlWUU5kakp0SEIzWEhrY3BjeVBVNlFlR2tmTEluUG12SlZ2?=
 =?utf-8?B?bjl6S1NMS0JBMTdzdW9SUWhqSTVndjY3NkI2UDZ6R3BERm5wcnErSkoxb3hj?=
 =?utf-8?B?R080V0JyQlg4dUNhUkhlRmJiV3pEbDBnVCtJMnFKV2xMdTFDckkyT2F4RGJB?=
 =?utf-8?B?TFVCZHhVTHhvZEpNTUFNUURhRkJkLzIyclVUemIxWkVIZDRya0lmdXdxS0Vj?=
 =?utf-8?B?MC9EdE1jMGNoNWlJWFNwcXAzdUZibkdwN0huYk1QaFo4OENIQVdpY0VaKzJZ?=
 =?utf-8?B?WHNLMUxmQWdpZmpCNmE5cHo4VlZWRUVacjVFbVl4NHB5UGwzaUU1WVd6QTBC?=
 =?utf-8?B?WTdGYzRCS0JwYU9QZE90V1JLWjVvUEhhdFgxWmhELzJCZlBqUEVVUmNOSmxD?=
 =?utf-8?B?SGtiWTRlb25NQnRNb05hQ2s5Tm9kT2Y2THV4a2Y2NUcrUWtabUd1YnNJN1My?=
 =?utf-8?B?S1h0eGFPM2ZIN0oyVUdIVDZ1OU5DL2RJY08xamsrRzg0bmQwNUZVZ2tYUWdX?=
 =?utf-8?B?bFJESWptdXVlam1lM0pZbkRDRUdTeFVLemJQZDRMdmpLS2VUUzdEcnRja3FW?=
 =?utf-8?B?N1Jiay9jY3ZYSTRvSDJpc09FcG01L1BDR1p4eXZDSHh5OFNlYWtJVmZlbVZm?=
 =?utf-8?B?R0wwYWVKdUJRNkhiQlNjb3U0SlZsWjgvMk1IYjF1ZnpDSXFjS0NEVGthRDdx?=
 =?utf-8?B?d21aNlBDVE9adVVpWHZ0ZDhyQ0JUaUxnMWd1Znh2bnNwNE5SWGlRWXEralNO?=
 =?utf-8?B?bjRHMkJXTUJ2bm5tRkc5OHZHR3FPRGk1Z2doL2xxS3FNYjZPUjBtekRZVXFL?=
 =?utf-8?B?dEYzeGl2TE5zeTJnbVF3MzNzaEpRUlk1cjRvc0U0V3l4dlFyNGt5TWdXRnVI?=
 =?utf-8?B?T0MwTk43ek9iNW0xbjBtempmMDFQMnlJU3pBeTY4ZzBhS3FjcUQ4dXY1eVdJ?=
 =?utf-8?B?K1YvSEl1YldIekxjbjBzbHdQRlRTbHBPTElkemMyMzhSWGtuZXhMd01iVjR2?=
 =?utf-8?B?cFh5eG9ISEZGR1BOMy8xYW82U1ZzTXd6cnBjVVVmTXVUMkpiVy9ENFhKZFVu?=
 =?utf-8?B?ZjQ5VVU3TFBSRGZBZ25wVklzb1JuT0ozVmtQRTdORWQ1MnJZbDRBQUFKK3Ro?=
 =?utf-8?B?UDExYWZRNzdCTGEzWGZ6TGhLblk3UEVSNi96ajhPVzBlb094R3pjSFFaK0dD?=
 =?utf-8?B?VGxocDVCVnIrb0EzQjE1emhUZUE5RXJ2WDR3NGpmeVhLQ2Y1d1Y4UlJmQzZv?=
 =?utf-8?B?WldpcFdONC9RY1lrcHAweE1LTkVGbEhWc3p4eDI4dndLS053K2dvbldhRzV3?=
 =?utf-8?B?ODRUUFZUQ1Q4SC9aVFFhQkFPYSt1R2hoMnNvTGJvd0oyMUZzM1pPdXVyNU52?=
 =?utf-8?Q?yqfI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB7726.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OGd3K0owdmtTUWJkVGFWbUgrZ1pYNDFjWmdveExscHRWd1lYS3pLMEp1a29V?=
 =?utf-8?B?WnU3VFR5enB0Ujk5b2YwVDdsTzNqVURQTGVCM1BhbEFBOVpMejNndFNWZGs3?=
 =?utf-8?B?WlRiRFEwRHRYRGN0cGFnRFV3QXh5WHY5UnBBa3I3dTQyb1lRYUw4aGwwTm1i?=
 =?utf-8?B?cDAvU1hSVHFrbGJDV3VZYUV1ZXJTNkNQYTUxSFRldWxFVWxNVjFrdzBmWUJv?=
 =?utf-8?B?WlJzTTA4T28zaUM5NlhWZnRDTngvMm1Sek1oNVFXVjdjSktBNzBlazZnbHNu?=
 =?utf-8?B?c3I4ZEh5OCs1QmFpdmt2eTd1OE5RY05jSzRlcEdLeVAxejZWN2J5dFlBKzls?=
 =?utf-8?B?c2djTUJLUm9tWGJtSmRYM0VYUVorcmIvVnlSMEJ5Y0FYWU9paGYvQkZYYjFu?=
 =?utf-8?B?VXd2Q2NxU2U3U2QvcGhiY2tJRGJUbWl5VlpLN3Yzd1IvZVdSWUtYaUpCMUdF?=
 =?utf-8?B?d0duN3FWUmI3dnZqQndwY1NZbExoNWowRlN0cmJqakZpWXVyaXlDZldlTG1L?=
 =?utf-8?B?TXN4eUxGaEVvN0NhL0NtRTNaK0xyQlVRQ2lkODJmQXFnV1U5bklCVEtJWWdw?=
 =?utf-8?B?UG4xSy9QdXhja1psNzFxckk1ejBGcW5mV0hUWVI0a0VhUFZUTStCTEd0c212?=
 =?utf-8?B?anpWcXliL21yMDA4bXdkVWNFc0s0ODdmaGo5UWxjbmFZTkFNa0EyR0pBOXN4?=
 =?utf-8?B?QjBpK0lMQXdWeGRkZFVLZkVtN3RxREpQdE9wV01iOGs2cEhlNlNzUmJQamNu?=
 =?utf-8?B?U1pTeU00UVd5ZUhlbDF3N3BRaGlOb21GUFRCSzlvcGVDYk00VFFWUWhxSHhv?=
 =?utf-8?B?M1ZiQTRwVE9xTFhqREJ3UDVna2lkUURSRnJSTmt3cDRKclRQck5WVDRsamI0?=
 =?utf-8?B?K3VSK1ZwOWJhamhtWXg2NU1QMlhuR1hYVEJnWmZyZkJwaFNLNzFKbHkwNGcw?=
 =?utf-8?B?UW1xeTRQaU1QeTc1d25Bam40NUlseE1EOFJ6cmpocHZYMmlOWkg0ekMyUFVy?=
 =?utf-8?B?bktwRnljR3dDK1VwbDBDbFIxSnEra3FRc084TzZwREh0K2ZpR3d2UkpUUUtk?=
 =?utf-8?B?WElVeTBnUXowQ0ZFck1adlpCNDRiU2tRdHIxNThBMVcwWkx5WEhQV2VlYUdX?=
 =?utf-8?B?VTh2VGk2M0lHbC9KbDBGU2FVYXViWWpndnpHL09TS2JIakxMbk52TitJRlJz?=
 =?utf-8?B?dy91SWZOcTE1aUxxc1pMRHlLeGZ4WWowbVhIMUdoMEh2TW5IeTlNNElub0t3?=
 =?utf-8?B?K3BtZFF3VXFzT2xXV0FGb0llZnFUTnRBeDE1L1hIOTVxQ1VMNnFXYUZQWllW?=
 =?utf-8?B?cVhNVWtYUWE3WTF0c29xZXYxMk8rUDFaeXRXMlU2MG5oM1R5c0hoMXNvaHlQ?=
 =?utf-8?B?eWZ4dHlLSFhWVHVuMCtUaVFSN3F1VVVzdFZVL0RPZEJHRy9RRzBHNDM2bHQ4?=
 =?utf-8?B?bE1Wb0FBVXBYOHlseXc1V3FRdkhqbmJ2ZzVOY0tZRGowbWpUc1phTGQzTUpV?=
 =?utf-8?B?U0JhRjhuc2JkM2Y4Q0ZYWVhKNlVQMUVUNHFBV09DS01DeU1jejZXY1ZEMU5i?=
 =?utf-8?B?cHNubzRkVm9WSDJveWd6Y1pzSHBNbTMybmhmRGsxeVJtQk8zM2UwYUNjYXg1?=
 =?utf-8?B?ei9IWnREQzhMZTNlNmM2SXBKT3ZDRjRCeDVON1lkNllzZVQ4WmJtN0E3S3pK?=
 =?utf-8?B?Z3lOVzJudERMblRjQXczMVpIcUFQY0grYTE5Y2huRis3T0xMSjJUeVlubTQr?=
 =?utf-8?B?NitEUDNhMm1KeEp6V1I2Z04ybDFSdDdYSXVlVE9kMEZkQkdUZDNQL2l0bDJO?=
 =?utf-8?B?eExVbzR5R0RyQkpqcU9zQ3gzcHBrS1JHbEhuN2RtWkdMNXRJSzBzNi93SENR?=
 =?utf-8?B?MXZTaE5WWkwraDFJRXNwVmNEQitFMnFxVjBOWUpsSEVnRmpTdkh2UFluMk83?=
 =?utf-8?B?QmtuZVpVb09CcWtaVU5ESE5sL3RQTFVTQVBScFE4TFVNb2diWFBZTENWbFdy?=
 =?utf-8?B?Qmh6anUvdTNVYVUrT2UwSnRsTkg0MnNaem9lMnBUNTdYZTVMVU9nQ2pnVTF4?=
 =?utf-8?B?NDVST08rUTNyTjEvNnJsUEVYckpjZ1FnNnErZG8ycmYxQXNwNmE5b2pVZnJC?=
 =?utf-8?B?dXQ4ZFQ3Sysxbk03SlJRcFR2NnVHRUdFMmVaNlk3R0FBUEQrbklMTm1PK2RO?=
 =?utf-8?B?dDdaVUJmcEFiaWdvaW95c0VJeERMTjl0R05iWUhGdDFJUy9oenVaODYybUNP?=
 =?utf-8?B?TXN6UWF3SUJKSXJRcUJDd1ZQRlBwZGVBMmZHYVQxWE9CRzdKYndrRkVRNVJ1?=
 =?utf-8?B?OVkwcGg2alZsL1JiVnd0c2dTdHlOdWdjanZZalBWVk1xbFVDaStQQT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23a9c9ca-c787-4c45-2ad5-08de53f6c72a
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 05:27:30.3588
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DIBuIjqvIxROdI3Q9ERbJ4IGyxgpUxujBvAWy2Ac3EswHO7dA78T63oUJkuFTVjrDp4pgutnJpjiNGhA3Wrn4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6883
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_NONE,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 2026-01-15 at 06:19 +1100, Francois Dugast <francois.dugast@intel.com> wrote...
> From: Matthew Brost <matthew.brost@intel.com>
> 
> Reinitialize metadata for large zone device private folios in
> zone_device_page_init prior to creating a higher-order zone device
> private folio. This step is necessary when the folio’s order changes
> dynamically between zone_device_page_init calls to avoid building a
> corrupt folio. As part of the metadata reinitialization, the dev_pagemap
> must be passed in from the caller because the pgmap stored in the folio
> page may have been overwritten with a compound head.

Thanks for fixing, a couple of minor comments below.

> Cc: Zi Yan <ziy@nvidia.com>
> Cc: Alistair Popple <apopple@nvidia.com>
> Cc: adhavan Srinivasan <maddy@linux.ibm.com>
> Cc: Nicholas Piggin <npiggin@gmail.com>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
> Cc: Felix Kuehling <Felix.Kuehling@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: "Christian König" <christian.koenig@amd.com>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Lyude Paul <lyude@redhat.com>
> Cc: Danilo Krummrich <dakr@kernel.org>
> Cc: David Hildenbrand <david@kernel.org>
> Cc: Oscar Salvador <osalvador@suse.de>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Jason Gunthorpe <jgg@ziepe.ca>
> Cc: Leon Romanovsky <leon@kernel.org>
> Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> Cc: Liam R. Howlett <Liam.Howlett@oracle.com>
> Cc: Vlastimil Babka <vbabka@suse.cz>
> Cc: Mike Rapoport <rppt@kernel.org>
> Cc: Suren Baghdasaryan <surenb@google.com>
> Cc: Michal Hocko <mhocko@suse.com>
> Cc: Balbir Singh <balbirs@nvidia.com>
> Cc: linuxppc-dev@lists.ozlabs.org
> Cc: kvm@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: amd-gfx@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: nouveau@lists.freedesktop.org
> Cc: linux-mm@kvack.org
> Cc: linux-cxl@vger.kernel.org
> Fixes: d245f9b4ab80 ("mm/zone_device: support large zone device private folios")
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> ---
>  arch/powerpc/kvm/book3s_hv_uvmem.c       |  2 +-
>  drivers/gpu/drm/amd/amdkfd/kfd_migrate.c |  2 +-
>  drivers/gpu/drm/drm_pagemap.c            |  2 +-
>  drivers/gpu/drm/nouveau/nouveau_dmem.c   |  2 +-
>  include/linux/memremap.h                 |  9 ++++++---
>  lib/test_hmm.c                           |  4 +++-
>  mm/memremap.c                            | 20 +++++++++++++++++++-
>  7 files changed, 32 insertions(+), 9 deletions(-)
> 
> diff --git a/arch/powerpc/kvm/book3s_hv_uvmem.c b/arch/powerpc/kvm/book3s_hv_uvmem.c
> index e5000bef90f2..7cf9310de0ec 100644
> --- a/arch/powerpc/kvm/book3s_hv_uvmem.c
> +++ b/arch/powerpc/kvm/book3s_hv_uvmem.c
> @@ -723,7 +723,7 @@ static struct page *kvmppc_uvmem_get_page(unsigned long gpa, struct kvm *kvm)
>  
>  	dpage = pfn_to_page(uvmem_pfn);
>  	dpage->zone_device_data = pvt;
> -	zone_device_page_init(dpage, 0);
> +	zone_device_page_init(dpage, &kvmppc_uvmem_pgmap, 0);
>  	return dpage;
>  out_clear:
>  	spin_lock(&kvmppc_uvmem_bitmap_lock);
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
> index af53e796ea1b..6ada7b4af7c6 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
> @@ -217,7 +217,7 @@ svm_migrate_get_vram_page(struct svm_range *prange, unsigned long pfn)
>  	page = pfn_to_page(pfn);
>  	svm_range_bo_ref(prange->svm_bo);
>  	page->zone_device_data = prange->svm_bo;
> -	zone_device_page_init(page, 0);
> +	zone_device_page_init(page, page_pgmap(page), 0);
>  }
>  
>  static void
> diff --git a/drivers/gpu/drm/drm_pagemap.c b/drivers/gpu/drm/drm_pagemap.c
> index 03ee39a761a4..c497726b0147 100644
> --- a/drivers/gpu/drm/drm_pagemap.c
> +++ b/drivers/gpu/drm/drm_pagemap.c
> @@ -201,7 +201,7 @@ static void drm_pagemap_get_devmem_page(struct page *page,
>  					struct drm_pagemap_zdd *zdd)
>  {
>  	page->zone_device_data = drm_pagemap_zdd_get(zdd);
> -	zone_device_page_init(page, 0);
> +	zone_device_page_init(page, zdd->dpagemap->pagemap, 0);
>  }
>  
>  /**
> diff --git a/drivers/gpu/drm/nouveau/nouveau_dmem.c b/drivers/gpu/drm/nouveau/nouveau_dmem.c
> index 58071652679d..3d8031296eed 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_dmem.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_dmem.c
> @@ -425,7 +425,7 @@ nouveau_dmem_page_alloc_locked(struct nouveau_drm *drm, bool is_large)
>  			order = ilog2(DMEM_CHUNK_NPAGES);
>  	}
>  
> -	zone_device_folio_init(folio, order);
> +	zone_device_folio_init(folio, page_pgmap(folio_page(folio, 0)), order);
>  	return page;
>  }
>  
> diff --git a/include/linux/memremap.h b/include/linux/memremap.h
> index 713ec0435b48..e3c2ccf872a8 100644
> --- a/include/linux/memremap.h
> +++ b/include/linux/memremap.h
> @@ -224,7 +224,8 @@ static inline bool is_fsdax_page(const struct page *page)
>  }
>  
>  #ifdef CONFIG_ZONE_DEVICE
> -void zone_device_page_init(struct page *page, unsigned int order);
> +void zone_device_page_init(struct page *page, struct dev_pagemap *pgmap,
> +			   unsigned int order);
>  void *memremap_pages(struct dev_pagemap *pgmap, int nid);
>  void memunmap_pages(struct dev_pagemap *pgmap);
>  void *devm_memremap_pages(struct device *dev, struct dev_pagemap *pgmap);
> @@ -234,9 +235,11 @@ bool pgmap_pfn_valid(struct dev_pagemap *pgmap, unsigned long pfn);
>  
>  unsigned long memremap_compat_align(void);
>  
> -static inline void zone_device_folio_init(struct folio *folio, unsigned int order)
> +static inline void zone_device_folio_init(struct folio *folio,
> +					  struct dev_pagemap *pgmap,
> +					  unsigned int order)
>  {
> -	zone_device_page_init(&folio->page, order);
> +	zone_device_page_init(&folio->page, pgmap, order);
>  	if (order)
>  		folio_set_large_rmappable(folio);
>  }
> diff --git a/lib/test_hmm.c b/lib/test_hmm.c
> index 8af169d3873a..455a6862ae50 100644
> --- a/lib/test_hmm.c
> +++ b/lib/test_hmm.c
> @@ -662,7 +662,9 @@ static struct page *dmirror_devmem_alloc_page(struct dmirror *dmirror,
>  			goto error;
>  	}
>  
> -	zone_device_folio_init(page_folio(dpage), order);
> +	zone_device_folio_init(page_folio(dpage),
> +			       page_pgmap(folio_page(page_folio(dpage), 0)),
> +			       order);
>  	dpage->zone_device_data = rpage;
>  	return dpage;
>  
> diff --git a/mm/memremap.c b/mm/memremap.c
> index 63c6ab4fdf08..6f46ab14662b 100644
> --- a/mm/memremap.c
> +++ b/mm/memremap.c
> @@ -477,10 +477,28 @@ void free_zone_device_folio(struct folio *folio)
>  	}
>  }
>  
> -void zone_device_page_init(struct page *page, unsigned int order)
> +void zone_device_page_init(struct page *page, struct dev_pagemap *pgmap,
> +			   unsigned int order)
>  {
> +	struct page *new_page = page;
> +	unsigned int i;
> +
>  	VM_WARN_ON_ONCE(order > MAX_ORDER_NR_PAGES);
>  
> +	for (i = 0; i < (1UL << order); ++i, ++new_page) {
> +		struct folio *new_folio = (struct folio *)new_page;
> +
> +		new_page->flags.f &= ~0xffUL;	/* Clear possible order, page head */

This seems odd to me, mainly due to the "magic" number. Why not just clear
the flags entirely? Or at least explicitly just clear the flags you care about
which would remove the need for the comment and  should let you use the proper
PageFlag functions.

> +#ifdef NR_PAGES_IN_LARGE_FOLIO
> +		((struct folio *)(new_page - 1))->_nr_pages = 0;
> +#endif
> +		new_folio->mapping = NULL;
> +		new_folio->pgmap = pgmap;	/* Also clear compound head */
> +		new_folio->share = 0;   /* fsdax only, unused for device private */

It would be nice if the FS DAX code actually used this as well. Is there a
reason that change was dropped from the series?

> +		VM_WARN_ON_FOLIO(folio_ref_count(new_folio), new_folio);
> +		VM_WARN_ON_FOLIO(!folio_is_zone_device(new_folio), new_folio);
> +	}
> +
>  	/*
>  	 * Drivers shouldn't be allocating pages after calling
>  	 * memunmap_pages().
> -- 
> 2.43.0
> 

