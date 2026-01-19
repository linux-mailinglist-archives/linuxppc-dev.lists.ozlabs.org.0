Return-Path: <linuxppc-dev+bounces-16022-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 87A28D3BAA9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Jan 2026 23:15:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dw4Xb6ZW0z2xm5;
	Tue, 20 Jan 2026 09:15:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c110::1" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768860943;
	cv=pass; b=nmzVPiy6DKnjrpvihfTvwecK9f073j/KkviS7rXYdPTk6WuVIIUH4vXafDEylay02TBXDH0IAQ0LHDIGbpmun05MbV1EtKXcO5dDOxxXhNsJnlBzS+uxLYXtKwmbBXR94Ns8TlRY8SmuuNR/sNLUS11ms4KzeoJUSBcwzgMaW6VtEnzMiZrJrPWhhyEchRKhU9RPsqipV9pMcDGjSOsgB+H8WgT+70/G+akaIDXpxxGuRK7/dsBVJXMO9/Em7rVMovBlFQ5bF4CdTILKwvhEDNCUa9ygL0rSFjbEEckPzx/DZZCFZdqhTiZjt2HJ4rcamsAP9XfAOSlJ0tAH/Hgudw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768860943; c=relaxed/relaxed;
	bh=MtePjGeMXIYcWbegumVLN0ub1lFDw2T9sNzA+3cugIA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=QF3E2hXyqpnxT8oCOGP8Vqc4JEkKe78SYh8DRqBN324/HuSdUs2gwRXZQ4klNmmZ1w/dZDGeDNp0TSIXToBU4PNe8Z/EI7bbrqIZguxR4Rb7vrHac/yywoWuMwVHfEiH0lLiuku1YECA0I3UcYDjFGjV8HcZ2rxdjTnj39YTvPbY2UJPj22aTlTg62lxDge2eeCpUieV1Tu7Ddh5vbcg9luROH/kQ0z96ZAAfC20w9wDhclbJJLVUK6KdGy2Ldij2GWP7f0HQA1MDVXNZe0Z25kZAdX1kBdjoX/Z0+fauFH3eDrcoBZBGQoLSPCq2mqjj+d71TxSP+uLYC8SwfUiPA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Qd7mmCOU; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c110::1; helo=bn1pr04cu002.outbound.protection.outlook.com; envelope-from=balbirs@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Qd7mmCOU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:c110::1; helo=bn1pr04cu002.outbound.protection.outlook.com; envelope-from=balbirs@nvidia.com; receiver=lists.ozlabs.org)
Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azlp170100001.outbound.protection.outlook.com [IPv6:2a01:111:f403:c110::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dw4XZ1jzXz2xjQ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Jan 2026 09:15:41 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VUkxwL1LBBv/3CaFKtHF/8nLS3tQmBk3sAeijUlJoBvyxQ7VZWoa0NgWVD7ocGzAd1WZS1Lgm7hR0C2LtcOj6mEn1T5lpclKCD5uJX3oTyaai+hiVUPwqoO7c5sRO3I345A63OkDYWWR9XtH3Jbjuzyq/yQxpsKIQWsScvzxLS608D1YZ8/iWzdhK8VHo3AjhmXmWP751RAjEgZ+SlGyz9VXVQ30o4Wue6VruhsfMicOARAHZbNl/CE/vko/EV4rjHbVkxzrreO3KuY6oJj6imBokNfxkisDqTBARidgIp0OlUyB/1BG9f2c05exM91aAwBnAJZ1bXojf4aDVHUUhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MtePjGeMXIYcWbegumVLN0ub1lFDw2T9sNzA+3cugIA=;
 b=ZUtFaQemOCat0p4gzSzrWCZQ6uscI7jJG7Mt8SNlY263Jf0dNSf8cHkGi88LyMTtjxTizldMr41LBZvAE2FsP8JkzUwWYxTxUE+vzOxW3XrCbO+15ttctsh9a/pP24kfONrdRv/BjetPkB9qLlOLfBeJNH91NXbDoB2dnHv+BjzzuLWpIXpPS/3zvUOsStzomRYyz0290ZpTRsjhvkYJ8Y8o8aCdHzQSSjj4mesCo9JePU4fbeEttHX3vd7PDU+D018T+0LMhLsFkwYRoJtGaI1igF/oGOla+NoXhv1QqYjmkN0M0SnrD3dYD+zmDaOuVevjgzwkWDjZo8SFVlBGjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MtePjGeMXIYcWbegumVLN0ub1lFDw2T9sNzA+3cugIA=;
 b=Qd7mmCOUQyIYcTLH410TDHT+7e88BvgDLr8Tzx+F3vppGgLiAs6WvkuNu5EW/TL9QuaiCzPEHl9TWunhKnbBvmnZf8qoWHjGqCZbR3/qcBPF2Gh+Apm4WVz8XGcAOlrZE6DzuUu0mEjpUhrWOv5Y7muEpDKSCRwKOCUgHD01J4IDPLQMbkOn5L8xwL943CxtM6MrpO4rO9+BYHtzotL2VTwNuFB6zJAk0M8CaeLUy+htoGoKved2k8+NrjZYlyCqIaBtHj8QY0teeHNgvL0QljYrOac+o0r1KsX9bqbH6/Xj6lqfBUNLviXWLyMj3dpi6TwBed18SORXWwWzEAlW9w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13)
 by CH3PR12MB8880.namprd12.prod.outlook.com (2603:10b6:610:17b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Mon, 19 Jan
 2026 22:15:14 +0000
Received: from PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::2920:e6d9:4461:e2b4]) by PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::2920:e6d9:4461:e2b4%5]) with mapi id 15.20.9520.006; Mon, 19 Jan 2026
 22:15:14 +0000
Message-ID: <ef6ef1e2-25f1-4f1b-a8d4-98c0d7b4ad0c@nvidia.com>
Date: Tue, 20 Jan 2026 09:15:04 +1100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/5] mm/zone_device: Reinitialize large zone device
 private folios
To: Jason Gunthorpe <jgg@nvidia.com>, Zi Yan <ziy@nvidia.com>
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
Content-Language: en-US
From: Balbir Singh <balbirs@nvidia.com>
In-Reply-To: <20260119203551.GQ1134360@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY5PR17CA0068.namprd17.prod.outlook.com
 (2603:10b6:a03:167::45) To PH8PR12MB7277.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: PH8PR12MB7277:EE_|CH3PR12MB8880:EE_
X-MS-Office365-Filtering-Correlation-Id: bb93f5d7-21ae-4195-ba95-08de57a8384c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|10070799003|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cENyZEd1YjdVMmtCa1F2b1lVQWlUQmlqcSt5amRpSmxTWU5mZnRZK3ZRakNP?=
 =?utf-8?B?K0tzWEpIb0tsZ3ZiTDYxWlFYMjBETXVGeEpEZVppbU1WRUI2dnJjUUtvK043?=
 =?utf-8?B?YXFqSHZDOHRwaFZpNEFmNnczZnk5TVltVlkxMWlKU0x2QkZ1MFQ2Z3FKMldN?=
 =?utf-8?B?cGtzM21nNXFvcmprclFSc0tKYjlxbmNaUG1JY1FGeFg5ZE10Vi9Yc0NhUmk1?=
 =?utf-8?B?Y0t3RjBwcmJNdXQ2NVNUb2FVeDdtR3ppU3FIRHBjUnBjVS9WT3pBdFpINkxP?=
 =?utf-8?B?OW9ZNkRuc0d4dTRlb0N6T0VlalhHZFFCU3cwZTJRdnEvRU5aSnhYWmRhV1Va?=
 =?utf-8?B?N0VvUnVQbzd5cFdSMmtDa1J5QVJHZ3NjdDNpRmhMVnhuRG0rY0lGclVIUnRt?=
 =?utf-8?B?TXNRV3ZyaGJDNHR5VGlIZnlYN0lXOXNCZnp0VUFNQVBuODFzY1BObzAvZzZ3?=
 =?utf-8?B?bnVMR2lMQzVzN1dtY3l1bktQM28rVFVwdU5LZHFPZVg5QllMWlF2YnNPZVA0?=
 =?utf-8?B?RTdKdU9BaWNreml6K3orV00xM0pkLzBveUdwd1JXSTJlRHNlYzc1T21NanBM?=
 =?utf-8?B?NTFMSkY3aituUHFGNVVsbkE3bXFvQWc1UytaV3RQVkdRQk04VU45Y295N2RE?=
 =?utf-8?B?WnVXY0ZUTFU1UnliVk5xc0lsdno5aGs5MWRFU2w0U2k3cE9mdXhIeTJXWmtO?=
 =?utf-8?B?cm90Z2tjc3RyWTFJbk8rcDFwbXZ2UlMwYXM3eE91WTJ1d0k3MmY1d1U2MFpB?=
 =?utf-8?B?YnhoWDgxVjNBSFdiZVRjMkk5SExZOUhuWVNNSWV6YXBGRGZ6K1BKYzhkYk1n?=
 =?utf-8?B?cktSYml5TWYvdFVsTDhoUXVLSWFsN3l6VGlEZis2VjlBSnRBYmloM25sdDNI?=
 =?utf-8?B?NHYvd3cxT2lxbDhWdmVpK3lzQVNkT1VhSnRPUDFSZGk2bkxTM05qVnowT3Q5?=
 =?utf-8?B?T2IzWGVIMFRKM0YxTm5jNEM2bXJrV2RJR1ZONFBhYndYcXF1ZTJCc1NJaFJm?=
 =?utf-8?B?d1RuWWY1bXZnNGRnenZQeGtEcFo5dlRqSjh2QVY4aE81OHV6bVhKYzV0M25v?=
 =?utf-8?B?a1VWa1hWeFB5cWZBOG9kb2tMc2hqandVd01aLytFVEFtMFU3OGUwR2oxMnBr?=
 =?utf-8?B?dFlZVThnVHI3RmhrMndUWG9TK3NndGtrWkJMMTl5R2lzaXRIeUU1MnJuOEJE?=
 =?utf-8?B?U1Bpb0FFSm4zV0haWlk1elhDU3pXU3MzeVpoQWdiL3I2Y3V2T2FVTVlSKzh4?=
 =?utf-8?B?UlIyVnVLRnJaN05nR0FRRWVoRGIrdjRCdUI0L2pHdmVCSmdnaHZYMFc1ODhR?=
 =?utf-8?B?Tm44ellpYTV6UnF3U3NITHA0MExsK3NuYkk0dE93TDJCUjhqREVlMW9uYWxy?=
 =?utf-8?B?QmM5eHMvUzVpUjg5U0Y4ZUpuUTdGb25ENWZzUm5LbnlHNGljZTM2WUJPWFUx?=
 =?utf-8?B?V1hBSDdud2d6VmNQMm1qb0htOHlIQVl6SDhVcEg4NmJsRmJUVnpoL05SRGdm?=
 =?utf-8?B?VW5OUUczSnA3TkNITXQ2YWM1NjdiS1V1NlRFQUhsL0VjUEVaTHA0VDhMM2da?=
 =?utf-8?B?bmxLamRMREhZaENUTS9yQnN3TGZWWHNaR2NwSDlNWUxXSVRlMkt1KzN2djlW?=
 =?utf-8?B?MW5wdW1KSHg1eERMSHg1d0xtcFJITmlRSHI1eUo2cVhQMlJTTWtjNlU5NjU1?=
 =?utf-8?B?YXpHNjNON1RDWXpWWElXZnN5NWhyTktkbHRtY0RWVmJOaHFXQUxtS1pEZlRz?=
 =?utf-8?B?SW5lTlVtd3RYNzlCKzNYN0RDbmNNYlVzWlRac1JmcVpMZDlSS0NKd2puTFZu?=
 =?utf-8?B?OWx5MnpTTm8wYVBUTWJWRVlmQjA2QzZSbFN0cmd5QUNTNUVxREFXL3RONGJz?=
 =?utf-8?B?eEVhQmhQWG42Rmt6aXpZTmhWN1BHVnJGckVpTjZ5SG9ROFBkbTB0YzRRZ2Zy?=
 =?utf-8?B?NGxJVHBKbmNhU3NGWXB3R1BvMjEyT1JUenhBaEtjYndtL0dLNUlWZDlselI0?=
 =?utf-8?B?aGVPckdsM1FWT0hJVi8vZmdhRFpEdCtxVzhCWnczOU5yQzdJRmhFdmdVQ2hW?=
 =?utf-8?B?Ti9tcE1LU1VnNHlMaFlwTHNwTDFvclpkdmhYVjMwSXQ5eGZYK2VKdUs0d200?=
 =?utf-8?Q?/zMk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7277.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(10070799003)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eHB0ZUZMSGprUllVVGV1dUEzR1ZMa1JseVdiTmFPa1RCNytoMXhiTjRPYUMw?=
 =?utf-8?B?T1piTzlwVC9UTFV1Z2l2ZHFaQUxKTWdYcmVDMHVFRDZkT1c4SmhjSFhjeDJz?=
 =?utf-8?B?cjJCTXM2b0lLejdSYUtTODZIeFJML1NXUHljT1p0M0JOMlFqanhsVHMzUFNZ?=
 =?utf-8?B?OTVKZGJaYXd0amlHYURWczN3OFZmMXBtRUt4clRvSFE0NmRYZnk5N2hpZ096?=
 =?utf-8?B?RFJWZkJDY0hFbjFSVmZvOHdoalNqQ2dNUnFHS2lOTHU1bEUxRkNKYzE1Tkp1?=
 =?utf-8?B?dXV6NVhLVWdpMzYyVlAyV3p2dnJrVk9tNU4xZk5XQTh0TWdVT1NndFg3cXp6?=
 =?utf-8?B?WmJkZUsycnVvbjk3RVgrT1dmK2JROVZoa0RmQUkwdFVqNUs1b0VGVzBaTzcv?=
 =?utf-8?B?Y1ZSbkZMYjU3Z05vY0k4QnpSc0dSRWpjQlBFWTV2d0JORHNncHE2NFkyMlBm?=
 =?utf-8?B?YnlhVjhzS1hOMDlPeEdTNVo0QUpsYU9QZ1V2ZTVGSFVlU0tyS0xZeUtTbExC?=
 =?utf-8?B?aXBsSW1kK1NvUTl0VDVDTzE3WjZGTktHSm1IcWs4STJ6bldJdTlQQUVZUzZB?=
 =?utf-8?B?eWlQclYxbWxCMVphdG1qdDF1bnduUXhwV3I3bDZUNXFwa0RiN1BKdllncFdx?=
 =?utf-8?B?NlZTL0NJY3ZMN3JsbUNzNUlPY3JWdlJaS2dCL0U4SURGSzZHcUl4QjJCbUov?=
 =?utf-8?B?MnVDRTBNMXpPQTJPa3dHN2JWUC93Z2ZCeERiemdRTTFTL3JsTERuM243cU5u?=
 =?utf-8?B?WlVOWEhJUlFkQzFZV09Va2dGa1lUaEQ4VkdDbkh2UXhESVkxbERxWC9HTTc4?=
 =?utf-8?B?Z0dTZW5kWUljcjhNeFBwZHRZczlYYnpMeC8yaFRuMWhNNEFraXA1ZWtMa2Zu?=
 =?utf-8?B?QjRmclpDTm4rRnp2d2w0TE1RK291Zm5KVGFUWmhGV3RZdWVuRXF6d2xaVUhW?=
 =?utf-8?B?eEpyQVM4eVJVczY3RktLK1k3dm1PWGJra0xEVjkrWFN0dzZ2ZGIxdSs2M0FE?=
 =?utf-8?B?KzIzQS81MndlaDBGcHgramwza3R1S0lsUmZ1SlNxQTMzNjZHNlI5eEh0NUxw?=
 =?utf-8?B?N0NFZ2tqdVUxS1ZrYzhSVHBUODd1a3hMaGhVc2VHdTlVNjlwdjFaM3ltY0pG?=
 =?utf-8?B?YkUxUUdiQU12K05sLzl5cWF0VlZlSGZjM0RxWGZMNjQrQXM0Z1BiT2J6cXM4?=
 =?utf-8?B?OFA3akQrSE9qYzc5ZEdwRTNJeHJXeFAxNThLNWhxNlNBaFQ0NzFWRnk3ajho?=
 =?utf-8?B?N1NTN2hiWkJwa0xZSE1PdTJEMFNHY0k2RHBhR1JZa3QwSW9pQ01jTXJTOWxk?=
 =?utf-8?B?UGlkaUJXMlNsQkE4dXJ5TVBkdFJvekt5WUJNdElrNHpQRWovdFhJWStaQnpw?=
 =?utf-8?B?RmF1VVRxYkxndGQrZ0drcVdGTE9kQTlwMVp0SmxYUlkrQ1ZiTUxCbzRHTXNR?=
 =?utf-8?B?a0NLb0VBb01ody9Xa2VscTc3aGw3SDNQUEpodFp5RGl5cTFBdWQ1NEw4SzJP?=
 =?utf-8?B?em0wLzZQaXpyMDVTazU4YS9EZ0V5WGlncWxUUng1Q1l6RmdNV3JCSTFZZll2?=
 =?utf-8?B?ZFBVMm9vTzEvNFJRejN1NDZsd24rZmt3MFZVeHMrNGE1R1dGMGk3SHBGWG9I?=
 =?utf-8?B?WSt3WXNpdWZNQjJ3eHZpZ3pxazZqUGt3WWdCWFJnc25WeGIxelNSNFdVdzIx?=
 =?utf-8?B?N25BMlVWK0lRT2hCMlBHMUEzSCtqQURFQVNEL1hvMnJlSHIrZWVQL3V1eGI5?=
 =?utf-8?B?R0o3a1A1MnA1YUNuZkZjbnE1L3MyOW5uaU5yWkhVUm5HTmZyUENCQnFtMTlT?=
 =?utf-8?B?YS8yUllid0xBQWtUQk5FS05xMTJqSHBIRlRiUnF1ai82cHlrVkNaWStJT2Fx?=
 =?utf-8?B?VVgzclV1cis5MVlmcXZNS002eWQ4UlErZzNEeXRCM1dwdVZ1R2xTcHF5VFk0?=
 =?utf-8?B?eDZCWUNoTWRGTXVDclk3SEg4Nzc1bnVEVkZCWElJdUNxWHllZHRoWXc2MWdS?=
 =?utf-8?B?ZERwcHJmUEI0eUFsL0doKzhoVHNIRkpOODNtVWVucFVjY0lJWUQxRFoyYnJi?=
 =?utf-8?B?M2VzNzFMS3kyWWxhamhzQzlqRW04NGt4WEprQ2NzUHVzYklIUmZrUGJMS3VR?=
 =?utf-8?B?NEwxSjF0dzVlWFRMTmtrYTRqSHFQUUl3YU5pS2ZnMlErOVNpeE96ZHdKak0z?=
 =?utf-8?B?dUg1WVZxRGQ1SDNtenJydTdEQ1V2NVE4UFBaVlFNNHc0c3lvSVdDcS9xRkty?=
 =?utf-8?B?bUszUms0UUtmcFdWMkNRVU44dkM3Y1dJNFdDTzZhMi9SL2NxR24wZlU1YXpF?=
 =?utf-8?B?akcxTU9pVFRwVm5SU1FFc1V0dWkwN3l0WHZ5MC9wd3dwTDd3bGxvR0hZQVdm?=
 =?utf-8?Q?QGSLUkEzon9HV+bobpiCxkxw79FLiAtxcpu8F?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb93f5d7-21ae-4195-ba95-08de57a8384c
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7277.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2026 22:15:14.5436
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x6yiW5ctcLv968C3EMbtZ48hs0UU5r8g/2yLV1CXPAdu5NYzeRi+N6cgwZMhkhIoDTphl/otUG7TCJApdut9CA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8880
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_NONE,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 1/20/26 07:35, Jason Gunthorpe wrote:
> On Mon, Jan 19, 2026 at 03:09:00PM -0500, Zi Yan wrote:
>>> diff --git a/mm/internal.h b/mm/internal.h
>>> index e430da900430a1..a7d3f5e4b85e49 100644
>>> --- a/mm/internal.h
>>> +++ b/mm/internal.h
>>> @@ -806,14 +806,21 @@ static inline void prep_compound_head(struct page *page, unsigned int order)
>>>  		atomic_set(&folio->_pincount, 0);
>>>  		atomic_set(&folio->_entire_mapcount, -1);
>>>  	}
>>> -	if (order > 1)
>>> +	if (order > 1) {
>>>  		INIT_LIST_HEAD(&folio->_deferred_list);
>>> +	} else {
>>> +		folio->mapping = NULL;
>>> +#ifdef CONFIG_MEMCG
>>> +		folio->memcg_data = 0;
>>> +#endif
>>> +	}
>>
>> prep_compound_head() is only called on >0 order pages. The above
>> code means when order == 1, folio->mapping and folio->memcg_data are
>> assigned NULL.
> 
> OK, fair enough, the conditionals would have to change and maybe it
> shouldn't be called "compound_head" if it also cleans up normal pages.
> 
>>>  static inline void prep_compound_tail(struct page *head, int tail_idx)
>>>  {
>>>  	struct page *p = head + tail_idx;
>>>
>>> +	p->flags.f &= ~0xffUL;	/* Clear possible order, page head */
>>
>> No one cares about tail page flags if it is not checked in check_new_page()
>> from mm/page_alloc.c.
> 
> At least page_fixed_fake_head() does check PG_head in some
> configurations. It does seem safer to clear it. Possibly order is
> never used, but it is free to clear it.
> 
>>> -	if (order)
>>> -		prep_compound_page(page, order);
>>> +	prep_compound_page(page, order);
>>
>> prep_compound_page() should only be called for >0 order pages. This creates
>> another weirdness in device pages by assuming all pages are
>> compound.
> 
> OK
> 
>>> +	folio = page_folio(page);
>>> +	folio->pgmap = pgmap;
>>> +	folio_lock(folio);
>>> +	folio_set_count(folio, 1);
>>
>> /* clear possible previous page->mapping */
>> folio->mapping = NULL;
>>
>> /* clear possible previous page->_nr_pages */
>> #ifdef CONFIG_MEMCG
>> 	folio->memcg_data = 0;
>> #endif
> 
> This is reasonable too, but prep_compound_head() was doing more than
> that, it is also clearing the order, and this needs to clear the head
> bit.  That's why it was apppealing to reuse those functions, but you
> are right they are not ideal.
> 
> I suppose we want some prep_single_page(page) and some reorg to share
> code with the other prep function.
> 

There is __init_zone_device_page() and __init_single_page(), 
it does zero out the page and sets the zone, pfn, nid among other things.
I propose we use the current version with zone_device_free_folio() as is.

We can figure out if __init_zone_device_page() can be reused or refactored
for the purposes to doing this with core MM API's


>> This patch mixed the concept of page and folio together, thus
>> causing confusion. Core MM sees page and folio two separate things:
>> 1. page is the smallest internal physical memory management unit,
>> 2. folio is an abstraction on top of pages, and other abstractions can be
>>    slab, ptdesc, and more (https://kernelnewbies.org/MatthewWilcox/Memdescs).
> 
> I think the users of zone_device_page_init() are principally trying to
> create something that can be installed in a non-special PTE. Meaning
> the output is always a folio because it is going to be read as a folio
> in the page walkers.
> 
> Thus, the job of this function is to take the memory range starting at
> page for 2^order and turn it into a single valid folio with refcount
> of 1.
> 
>> If device pages have to initialize on top of pages with obsolete states,
>> at least it should be first initialized as pages, then as folios to avoid
>> confusion.
> 
> I don't think so. It should do the above job efficiently and iterate
> over the page list exactly once.
> 
> Jason

Agreed

Balbir

