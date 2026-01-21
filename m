Return-Path: <linuxppc-dev+bounces-16094-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KFILKmxNcGnXXAAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16094-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Jan 2026 04:52:12 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BC52F509ED
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Jan 2026 04:52:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dwqyK2M14z2yFg;
	Wed, 21 Jan 2026 14:52:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c107::3" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768967529;
	cv=pass; b=GXxiX6MF2cqMIhMbbIcbGcjyglPAvieqQqAJHKScEi0SOV3fRk5pPmIaeZ92m3hd9b1kDhpmp5xZLW8br/c5HP476hX7z46X+IY1N3NyUy7X5IRn2QbJwcH4ZAuzmWMO0vCIDzBWH1oWIkqyq92FFE5ByqylgY+C/Lt15jX89x8MQTAY3uU7vtzxrKhGQMqEzUjbvTafDsbOzaGpfr8/5o5RZwG/rDSdldm6T6lLHvH3rV2EAhuWo3xPRCawKHfHITrLqT5eQTuH+a3OO5c3X9q33t8V2uOrkb0Ir+9jKGeC+BRDKyb7DIUj1yTYBJz42RGK3u1GynrV4kkaVvPxvw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768967529; c=relaxed/relaxed;
	bh=jShmZIVngANqG7DPU4WllOF4YE80X+9waShDA6iclpE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=XkjPOOVe2iMMs3k2j2WBhSH/8K1CxJibWMEUIpYeb3YfFheAq1MJL4OuR2HORvpmuecigB2xHKeXuZGM5zB7HnV6XyPjIC7IjXU2VBUNZC/DZENey5PCZRKOCFyLoQJCF+DtQN0FXB204DQPPfvryBeosBD22fwnfOpTtRpfIeClQeJEaBs6sEIa5lk7My2WSSbGtBDa0INkP/S8Ol6Y7/hP/ynfdS2AfKKakhwaGqugsziJCYlFwOuuSRlIXIzcgA5xpdMXbzZRUYgDDEy9kDq3K8BNEpe/xZNf0t+ncDNGs4E2/8597jZLCHiNcii05sdhhd/mJRYcL4edGq1SQQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=PNoaGv6v; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c107::3; helo=ph0pr06cu001.outbound.protection.outlook.com; envelope-from=balbirs@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=PNoaGv6v;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:c107::3; helo=ph0pr06cu001.outbound.protection.outlook.com; envelope-from=balbirs@nvidia.com; receiver=lists.ozlabs.org)
Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azlp170110003.outbound.protection.outlook.com [IPv6:2a01:111:f403:c107::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dwqyH4zqlz2xqD
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Jan 2026 14:52:06 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a57N3V56kYsmldNzv8TKaULL+mibz/Z9Cgh/aE3/YLwCqN2SaXZlhyCRIKLA7+TaKxuWbcaaiq4s2rcFgwVioH6UU2HrM2tq2oOm5oJwllFXIfB7qMzzbBwF6nWfpO7vvC0fnRtPrhT0UaMlcA/0yELNCQ6Ch3f6H8C6ecDBVn5Savq+bqJyyrKXGRKC+jICJX1vGw3vhddIuuS7JKqulM7Cr9IgV7BLBWZ2Pdxm1KForzgV/MZjXFjGa5v8Fuvc1/AZWbptjyuZ0ODLTfpg0Pj+rKqify7UTkxdoOOoUaLGQ2MgKTModhJCzNpPfAwrzWnQYZLpUr+yT1YabQgLAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jShmZIVngANqG7DPU4WllOF4YE80X+9waShDA6iclpE=;
 b=pgckJPlMBWXPElpVtSVYNGgYBn6fS1KmGxkyHUf1p6ifueeaVQ7cLTb2hMAKxt28nCubaJcVNG+zBFCIAGyEZquXVct9WLdreuVkKj4cC7EcfqrQKJPa2OOc787ECNgTQNb7LDDw0WOP6O42wbo0d6qmj2OgMnZV5QF9sRGhmkrq1+hdZweonNPCshH2fdGlNGWJW1CBO4rDxJvEsM9ZN1B0W5qn/P0RIyHztAj2Kp0ma8X1rm1UhnbtU5NJVc4Ne+NShn0Am3OyNoPEeLUNMOD5qS7nXD2Lws/1xytTwi1CrYnz4GIyrAVsqRyUXz2MICMVoFFo8P8bmKrMc3tAdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jShmZIVngANqG7DPU4WllOF4YE80X+9waShDA6iclpE=;
 b=PNoaGv6vNOHACIOo0Sgc7kISbzun5YOIIpI+v7N09WuTf+0NdMtvzhMGSSM70N8wc6z62y85eGqI506pj9614vLlHEe9Vc4bRWg4YOvjak7DUMZzS7nVGrYKZGHreliI02hJWy253hTXoJlaYtm8AEFRw1qeYcxat4KQj2TB2jA30qyNb5CZJZCRiO8U170J2JBExTpW4aP8YMb8SfS3v33C7wI57VMtZHHhJN6nHYKOC3/T5ij6M3GSMsx8oeGx7W1ylrTY27VslH9KkLnZCcDfYWBG0OHHx9n9r71P3tupbeDkapTD6Y7wg6/NXEH4Nek8bzLgfkQuHMQWbUVCqA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13)
 by LV3PR12MB9166.namprd12.prod.outlook.com (2603:10b6:408:19c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.6; Wed, 21 Jan
 2026 03:51:38 +0000
Received: from PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::2920:e6d9:4461:e2b4]) by PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::2920:e6d9:4461:e2b4%5]) with mapi id 15.20.9542.008; Wed, 21 Jan 2026
 03:51:38 +0000
Message-ID: <dc433a44-0653-4554-a31e-cddd31135977@nvidia.com>
Date: Wed, 21 Jan 2026 14:51:29 +1100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/5] mm/zone_device: Reinitialize large zone device
 private folios
To: Zi Yan <ziy@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>
Cc: Matthew Wilcox <willy@infradead.org>, Alistair Popple
 <apopple@nvidia.com>, Matthew Brost <matthew.brost@intel.com>,
 Vlastimil Babka <vbabka@suse.cz>, Francois Dugast
 <francois.dugast@intel.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, adhavan Srinivasan <maddy@linux.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>,
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
 Felix Kuehling <Felix.Kuehling@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 David Hildenbrand <david@kernel.org>, Oscar Salvador <osalvador@suse.de>,
 Andrew Morton <akpm@linux-foundation.org>, Leon Romanovsky
 <leon@kernel.org>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R . Howlett" <Liam.Howlett@oracle.com>, Mike Rapoport
 <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, linuxppc-dev@lists.ozlabs.org,
 kvm@vger.kernel.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-mm@kvack.org, linux-cxl@vger.kernel.org
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
 <20260119203551.GQ1134360@nvidia.com>
 <ef6ef1e2-25f1-4f1b-a8d4-98c0d7b4ad0c@nvidia.com>
 <EE2956E3-CCEA-4EF9-A1A4-A483245091FC@nvidia.com>
Content-Language: en-US
From: Balbir Singh <balbirs@nvidia.com>
In-Reply-To: <EE2956E3-CCEA-4EF9-A1A4-A483245091FC@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0P220CA0018.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::28) To PH8PR12MB7277.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: PH8PR12MB7277:EE_|LV3PR12MB9166:EE_
X-MS-Office365-Filtering-Correlation-Id: c88f59fc-d78b-434c-80d7-08de58a06126
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|10070799003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UElVTzF3cE9HTk91N0lZckNUazVmekZtTmljRzFQbWw0RE82cEMwcVdtSG5V?=
 =?utf-8?B?QnRBMUhjT24xMXhmU3VDc2JhOHFheWx3TFRuOHV1ek5NNHRXZW9yMFdUcEw1?=
 =?utf-8?B?bmhiNUFQNVR2QndyeVNRd2g2KzBzaGdPQVZMenVVaEJvNXpPeGtZTXQ5ZEdG?=
 =?utf-8?B?bFBUZ2EvajZvR0trNGlVOG8yb3NxTXpZeUZQYzhWWTlKR3kwQ2tVYjhtaGJ5?=
 =?utf-8?B?dmJKQWROSVZkKzN0aWdPUzZDYTNla1UydDhDTnBnQmhiNW1ndUx3NElJRFJG?=
 =?utf-8?B?d21qTnpFSURoWVlMbTBpT1lUWXJEcFpxNGNwM2kvU3hpSlFrSEZIZ3RRZEQr?=
 =?utf-8?B?Zjh2bmRlU1dZcDdsdEFSb2pRNFJYM3cybHJIa25NTVdvVmxIWEZkT1NKcUFI?=
 =?utf-8?B?WllaRnA2WXVLQUVjVng2U3VHMWs1YkRoRWY0N0pwV1g4dEwva1pjdGwxT2p3?=
 =?utf-8?B?YzJ6SVlhMnB5ZDV2dlhMT1Q4a0VjZXJULzNVWk13L1lMdHdnMC9wOXVvUkFW?=
 =?utf-8?B?Yi8zNDRWakNkUmwxblJFcWFvaFJubmk3a3F4dmlSb3ZiWVduaVBHaERuTHdx?=
 =?utf-8?B?UU5SNmNSTERIQitDOWd2MTI5M3FnWFNTU2RDaUFIdUVzNlZtRG9mUmxNcU82?=
 =?utf-8?B?ZlpVM1RvZ2xIeGNKcmtSTjBBcEZhR2QwODlOaVFsOWFCV25OT2x5YU1GZ3JC?=
 =?utf-8?B?TXI4Yy92L0p3VWZNVVdINWtIV3lqYTJUa09wTXpqQUdwNDFHUHZ3M1oxUGwz?=
 =?utf-8?B?WTdJUUMrUWRRK1hzeDV6Q08xUkNaRWo2OXhkN2dnSFBjaGw1L2NIZFBpNk1r?=
 =?utf-8?B?VVBxSFdDUlA3cmxRUzJVSmhYK1U5bG5yaXloMSt4YW96YTQzbzl4SEo5S1R4?=
 =?utf-8?B?Vi9haHYvdzV1bnp4TUxpa2FtNDhFenUvTzZnYTZ3M1dmUGpiKzRvQ1BqdHhu?=
 =?utf-8?B?bDExcDl0WjdaZG9JWCtYdDM5MlhOczBWZW5zVUxYcWhBWXZ3WjVzTEp0V3lN?=
 =?utf-8?B?UFFUbHNGVVVsMkllWlBndm8wUk5BTUZ3K3h4dzRzWWE0aFl5dU90eERJMG8z?=
 =?utf-8?B?Vm05VTdYNTFaaU9MVnZmQXlFZjhJdlFIQjNSb1lYbjBJOVBMcnJIMVlXTGpO?=
 =?utf-8?B?WG9Kd056WTB1RC80WjZ0ZTdMQkhBSWZUS3F1NkhsaHR6VEZEN3k5U1pTaXN2?=
 =?utf-8?B?NjJ0NER6c1UvcDgyR3dWcEp5b2JGRU1hL2ZmTjFoV3p5OUZRKy9KWHJXUWVx?=
 =?utf-8?B?WmlKcndSaTN3TkR0bmpNMW96Ri9jSjl1Rld5NTFIaThtazVmSkJmdk9xSVNC?=
 =?utf-8?B?V2tyYUVFc3hjZkFyT3R6cjhyeEVQM2NERXhLa3NOU08rU25vLzUzYzA3WXEv?=
 =?utf-8?B?QVJmSTVFTzZ3b2JncjdUaUt2dGxWQ2VYYmo1R28rdlhCYkVnZ052SWpSWjR0?=
 =?utf-8?B?UzFxUmlLRy9MRExzWW9kVHh4d3RhQXRoYVhGek1oTitFVm5XMmY5cVBpRGhj?=
 =?utf-8?B?NWc4allrMjZqZ0dSZit2U3B4clVOYXRqMUU4UnFMNEpVRWxhNFdhVm1BTkdJ?=
 =?utf-8?B?TmJRbFdSSk9abmk5Rk90d0tFYU1la0FlQnZ2cTFLNWljVHpvNU5MVlNPYjVQ?=
 =?utf-8?B?d0RzMEdmVHZaNGcya2dmNmNaNzdjd1pDdUlzd3R3bjVwc2daYUh1eFVNQVI4?=
 =?utf-8?B?czB0aUQxKzJkN2plQ1loWkNsUk5oNzRwM0o4Vk9HaFRjZVo1TlBWU21hK0V3?=
 =?utf-8?B?MjhLMVU2TnVhL0JVbTYxWXIybkt1SlEzSllvL1NtdTVaWXVaUk40RHFRVVQx?=
 =?utf-8?B?eDFjUUxBa2pLci9IN0phUHVpZElIZmFCMzcxbnJyaVFOdGkvc0tMNXhMN0VJ?=
 =?utf-8?B?OG9uQzRwMW0vbzNMU0xWSlJiU3lXUk02Z2RIbWxOSEhSNEtzd3NBQnhIbGtH?=
 =?utf-8?B?eXNZV1NyMWtUSXl4M0NXRGc4alVNcXlJL3JmRHZMdHg2V1JDTnpqbDlvQW5S?=
 =?utf-8?B?ZWVjNTlaYm5hdkdKSVMzSWZ6OEFRU0NjMjVMVkI1VVBqMnJrdnBSL0dEL2xD?=
 =?utf-8?B?TmQzanRGNG42SlQ0M0J1Tk1Sd24rUFpBTm5KemV2N3ZRMWM3akN0TlM0cUc4?=
 =?utf-8?Q?rihc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7277.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VGRGYTdwbTc4VEFHZjl0NUFPbnptNTZ6RWVFQ1YvbGQ3WDd3aDNXUXZoOTds?=
 =?utf-8?B?bW42V1c3VVNUYVhYcXFSYmtob0RTbW5nWGJGelhDYkVMNUZvQlBSSEF0alRa?=
 =?utf-8?B?NS9JOVg0eHlDRHpwOGw3STUvNzQ4eFJBNFJYUFNsNkJkOCt3TzViL0ZzYzRT?=
 =?utf-8?B?dzJYZFZkMzUzMytCR1M1VlRNUkNqUW55UkNqai9Ga2M3Q282RmwwZ3BrRHp5?=
 =?utf-8?B?d25hYlpCTzNyaEJUT1FvOUtPMnJVeVBQZjNITmF0ZEJUbnRPT04wb2dQZ2t4?=
 =?utf-8?B?clVVUWE1Slc4ZHliSzhraGltTFV5VDVTQ0VOQTVYTVFLd3h5bThLdzkvSkJn?=
 =?utf-8?B?TTZrdDJkMUg0cUFBbGp0NzUwV2x6Zm5VbHRLbXVabUxUVzZkUVpvTGZNWUho?=
 =?utf-8?B?b2VpS1dTK0FFeGpBbkVXS1dtdUl4VlpuQlFyNXVnanlnMHJjLzFRV1VUSUNC?=
 =?utf-8?B?bEtUeWRiWTJJTUkrRWJxOHJRMkI4MzRqbnZQenc2ektQVW5qaFZKQVl6Zjkx?=
 =?utf-8?B?SndiblMzNGw4TzZSTE0vMGp2Ulhmb2o2d3F2djZMR0hMRzZNRHFaSXBPZjll?=
 =?utf-8?B?T3FvSFZVcHIwb0RlTkZxMWNKNnBzT3B5NlY5eEpwNE5EdkNLaVJ0R0pIOFBw?=
 =?utf-8?B?aXZiREFlK2NINm1nWE01eFFtRlkyYnM3cXhVSmQvS3l5dXlqbkM3ZkhVK2Yz?=
 =?utf-8?B?R3o4ek5UWWdUOUFSeXg3ZkFvMGZOZ3kvdTVVTGQ3WnNJdWt6S2s4ZHd4djdX?=
 =?utf-8?B?Yk5LVmxtTnI4a0QrU2NNU0EyWkZSZnB0V0xzYkk0a0xjVUhsZVhKZ0tvV3dY?=
 =?utf-8?B?ekVaaTZDZGovRmdpV3d0ZWtqN2xXZjZKTHhoVlRuK05Ta3VNQzlHZEptVUcr?=
 =?utf-8?B?U3JnOXJmczArUEk2R044TkhuaENJK0JjM2dPTktrTTdKVGRZbndSRVpQZStI?=
 =?utf-8?B?Z1hEc2tQeUJwSExiODJIWEVHWlRqWHZRUHVCMGtORlp1TWt0S2VCSXMweGlE?=
 =?utf-8?B?K1dQZWFOVEI0QzUzTndRTzdPZ0FhdWNXeXAwNVJ0Yk5KTS9US3JSaWN2TDJt?=
 =?utf-8?B?dGpKalQzMmRaTlhyS0RuYURoNzhWdlVmRk5zU2d2NlNyaTY5RGJEK3hxSDZ2?=
 =?utf-8?B?Q0loUC94RFYrSXFhSnRMTHkwYVlNc1FYL0VHZHdtVG45dVBSK3NSSUp0YVB4?=
 =?utf-8?B?Tk5sK2d4aE9WRysvN3ltZEZBc2ZJT2N2U0hPNFdUbUJOZmZsMlV3MTJ5M3R1?=
 =?utf-8?B?aHk4cmg2NldHRjZTajNTcVh3dEVGb3J2YVdJMW1aUysweG9BcWRoK1YzSGJv?=
 =?utf-8?B?WUpTSllXR0dPNTROVEMrbnRQYzhSOUZJODg1Y2g4L3NteVBXeHhoSnhWMVNx?=
 =?utf-8?B?b24vT2lwc3pidHlhRy9ia01VbXhuOWNuWTBrSFZtbS9oTXdZYVdyVkJQTmlv?=
 =?utf-8?B?VDdzNi9kanFwcXZVLzA2ZE50RXNwTGl5NFRiN3pBOWFrc0tjUTJnbkQrVWdq?=
 =?utf-8?B?Q3g5cVFLWWFKaUhnS3lzQjY3RjJHMmpSbk9aMVNaRWt3eTRoMUJXb1FnaUlF?=
 =?utf-8?B?akVJZ1d6Y1h4eHN3YStpc29zSDd0TFFhOE81M2F2WVJ2dm5VaWtGdXJSTVZO?=
 =?utf-8?B?LzBPaVlxQUdRN1Q0QmJ5Z2NhOFBRSHJoYkVuY213R21OWURpTHJEUER4ZEpI?=
 =?utf-8?B?MDJSVGxldkg5MFJmRmZRZGJYR3JlUVQxaWdpOG0xUmg5S2JoYTVJUGE1ZWd0?=
 =?utf-8?B?K2FHcEFaY0V3Z1ZxQVIwY1ZRdytpM0JJa284ek41RVloOEl4a0dmaWdKRVF6?=
 =?utf-8?B?VThTN1R4U05jZ2FaOXhvS2tOd0lMeW9mbzVoVU12UnA1VDBxOXh5SytTUHBs?=
 =?utf-8?B?VHdOQWp5SGxNSi81Y0VueUxsZ3QycE02ZVN0UU1NcStXODY5UHJxWWhTNVIr?=
 =?utf-8?B?bHhkUDE4SHBPRUlac3pXMU9mQkRLL3NkUU5XeDd6RHNOYWxQdkE1V3M5L1Rp?=
 =?utf-8?B?a2lvQ1hacVA0WDZEMWE5NGRNeHQ4SXF2UlhlZ0M3b0M3ZGNpM0tCb0dvdW9T?=
 =?utf-8?B?eEF0emNZN0FJZjZ2VC9WQUNPSzQyVjRPQm16cG40eWo0WDJSNjRtMzI3dDlo?=
 =?utf-8?B?bHJoWWdpRUVEMmQ0bzJGZmdMTkNNalE3STkxV2dqOStiSFpFOHNUUUpqSWtJ?=
 =?utf-8?B?cHZkR3lodi9GTnc5aWFEZ3RLVFY4aE1RRi9OQldmV2NlZ0V1aCtkeWgxQWh5?=
 =?utf-8?B?QU1qNnFRZFpwV1I3em0rOTFtTVBMZ1hmSW1reFJKb1hFZW9yK2phQ05yZ0RD?=
 =?utf-8?B?UFRKUlRtb1NLTXdCaGY4d1UxbFVjM3ByUG41NHh6Q1BydWVKWHR4MG4wSURY?=
 =?utf-8?Q?JCOiWPzX3XZ9Efn5lqPQInvlS1i0F+CJOjCgOl7HGXAPg?=
X-MS-Exchange-AntiSpam-MessageData-1: i7vGdnxOLt99xA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c88f59fc-d78b-434c-80d7-08de58a06126
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7277.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 03:51:38.2532
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6/0I0+/SXLTNSU/NsBLmLTKv7DmCOFTUsJkvSOesZJx3EpkbcvhakHgrbCWLOkpJeviiTXL0xiNhpL1ZuXAzDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9166
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Spamd-Result: default: False [-2.21 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[balbirs@nvidia.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[39];
	FORGED_RECIPIENTS(0.00)[m:ziy@nvidia.com,m:jgg@nvidia.com,m:willy@infradead.org,m:apopple@nvidia.com,m:matthew.brost@intel.com,m:vbabka@suse.cz,m:francois.dugast@intel.com,m:intel-xe@lists.freedesktop.org,m:dri-devel@lists.freedesktop.org,m:maddy@linux.ibm.com,m:npiggin@gmail.com,m:mpe@ellerman.id.au,m:chleroy@kernel.org,m:Felix.Kuehling@amd.com,m:alexander.deucher@amd.com,m:christian.koenig@amd.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:lyude@redhat.com,m:dakr@kernel.org,m:david@kernel.org,m:osalvador@suse.de,m:akpm@linux-foundation.org,m:leon@kernel.org,m:lorenzo.stoakes@oracle.com,m:Liam.Howlett@oracle.com,m:rppt@kernel.org,m:surenb@google.com,m:mhocko@suse.com,m:linuxppc-dev@lists.ozlabs.org,m:kvm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:amd-gfx@lists.freedesktop.org,m:nouveau@lists.freedesktop.org,m:linux-mm@kvack.org,m:linux-cxl@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	TAGGED_FROM(0.00)[bounces-16094-lists,linuxppc-dev=lfdr.de];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[balbirs@nvidia.com,linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[infradead.org,nvidia.com,intel.com,suse.cz,lists.freedesktop.org,linux.ibm.com,gmail.com,ellerman.id.au,kernel.org,amd.com,ffwll.ch,linux.intel.com,suse.de,redhat.com,linux-foundation.org,oracle.com,google.com,suse.com,lists.ozlabs.org,vger.kernel.org,kvack.org];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:mid,Nvidia.com:dkim,kernelnewbies.org:url,lists.ozlabs.org:rdns,lists.ozlabs.org:helo]
X-Rspamd-Queue-Id: BC52F509ED
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 1/20/26 13:50, Zi Yan wrote:
> On 19 Jan 2026, at 17:15, Balbir Singh wrote:
> 
>> On 1/20/26 07:35, Jason Gunthorpe wrote:
>>> On Mon, Jan 19, 2026 at 03:09:00PM -0500, Zi Yan wrote:
>>>>> diff --git a/mm/internal.h b/mm/internal.h
>>>>> index e430da900430a1..a7d3f5e4b85e49 100644
>>>>> --- a/mm/internal.h
>>>>> +++ b/mm/internal.h
>>>>> @@ -806,14 +806,21 @@ static inline void prep_compound_head(struct page *page, unsigned int order)
>>>>>  		atomic_set(&folio->_pincount, 0);
>>>>>  		atomic_set(&folio->_entire_mapcount, -1);
>>>>>  	}
>>>>> -	if (order > 1)
>>>>> +	if (order > 1) {
>>>>>  		INIT_LIST_HEAD(&folio->_deferred_list);
>>>>> +	} else {
>>>>> +		folio->mapping = NULL;
>>>>> +#ifdef CONFIG_MEMCG
>>>>> +		folio->memcg_data = 0;
>>>>> +#endif
>>>>> +	}
>>>>
>>>> prep_compound_head() is only called on >0 order pages. The above
>>>> code means when order == 1, folio->mapping and folio->memcg_data are
>>>> assigned NULL.
>>>
>>> OK, fair enough, the conditionals would have to change and maybe it
>>> shouldn't be called "compound_head" if it also cleans up normal pages.
>>>
>>>>>  static inline void prep_compound_tail(struct page *head, int tail_idx)
>>>>>  {
>>>>>  	struct page *p = head + tail_idx;
>>>>>
>>>>> +	p->flags.f &= ~0xffUL;	/* Clear possible order, page head */
>>>>
>>>> No one cares about tail page flags if it is not checked in check_new_page()
>>>> from mm/page_alloc.c.
>>>
>>> At least page_fixed_fake_head() does check PG_head in some
>>> configurations. It does seem safer to clear it. Possibly order is
>>> never used, but it is free to clear it.
>>>
>>>>> -	if (order)
>>>>> -		prep_compound_page(page, order);
>>>>> +	prep_compound_page(page, order);
>>>>
>>>> prep_compound_page() should only be called for >0 order pages. This creates
>>>> another weirdness in device pages by assuming all pages are
>>>> compound.
>>>
>>> OK
>>>
>>>>> +	folio = page_folio(page);
>>>>> +	folio->pgmap = pgmap;
>>>>> +	folio_lock(folio);
>>>>> +	folio_set_count(folio, 1);
>>>>
>>>> /* clear possible previous page->mapping */
>>>> folio->mapping = NULL;
>>>>
>>>> /* clear possible previous page->_nr_pages */
>>>> #ifdef CONFIG_MEMCG
>>>> 	folio->memcg_data = 0;
>>>> #endif
>>>
>>> This is reasonable too, but prep_compound_head() was doing more than
>>> that, it is also clearing the order, and this needs to clear the head
>>> bit.  That's why it was apppealing to reuse those functions, but you
>>> are right they are not ideal.
> 
> PG_head is and must be bit 6, that means the stored order needs to be
> at least 2^6=64 to get it set. Who allocates a folio with that large order?
> This p->flags.f &= ~0xffUL thing is unnecessary. What really needs
> to be done is folio->flags.f &= ~PAGE_FLAGS_CHECK_AT_PREP to make
> sure the new folio flags are the same as newly allocated folios
> from core MM page allocator.
> 
>>>
>>> I suppose we want some prep_single_page(page) and some reorg to share
>>> code with the other prep function.
> 
> This is just an unnecessary need due to lack of knowledge of/do not want
> to investigate core MM page and folio initialization code.
> 
>>>
>>
>> There is __init_zone_device_page() and __init_single_page(),
>> it does zero out the page and sets the zone, pfn, nid among other things.
>> I propose we use the current version with zone_device_free_folio() as is.
>>
>> We can figure out if __init_zone_device_page() can be reused or refactored
>> for the purposes to doing this with core MM API's
>>
>>
>>>> This patch mixed the concept of page and folio together, thus
>>>> causing confusion. Core MM sees page and folio two separate things:
>>>> 1. page is the smallest internal physical memory management unit,
>>>> 2. folio is an abstraction on top of pages, and other abstractions can be
>>>>    slab, ptdesc, and more (https://kernelnewbies.org/MatthewWilcox/Memdescs).
>>>
>>> I think the users of zone_device_page_init() are principally trying to
>>> create something that can be installed in a non-special PTE. Meaning
>>> the output is always a folio because it is going to be read as a folio
>>> in the page walkers.
>>>
>>> Thus, the job of this function is to take the memory range starting at
>>> page for 2^order and turn it into a single valid folio with refcount
>>> of 1.
>>>
>>>> If device pages have to initialize on top of pages with obsolete states,
>>>> at least it should be first initialized as pages, then as folios to avoid
>>>> confusion.
>>>
>>> I don't think so. It should do the above job efficiently and iterate
>>> over the page list exactly once.
> 
> folio initialization should not iterate over any page list, since folio is
> supposed to be treated as a whole instead of individual pages.
> 
> Based on my understanding,
> 
> folio->mapping = NULL;
> folio->memcg_data = 0;
> folio->flags.f &= ~PAGE_FLAGS_CHECK_AT_PREP;
> 
> should be enough.
> 

I think it should be enough as well, worst case memcg_data is aliased with
slab_obj_exts, but we don't expect zone device folios to have slab_obj_exts
to be set.

folio->memcg_data needs to be under an #ifdef CONFIG_MEMCG and folio->mapping
was set to NULL during previous free (one could assume it's unchanged)


> if (order)
> 	folio_set_large_rmappable(folio);
> 
> is done at zone_device_folio_init().
> 



Balbir

