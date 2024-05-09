Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 64EC08C1818
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 May 2024 23:09:57 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=MZdX3SZ1;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vb4Qp6mY9z3cYY
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 May 2024 07:09:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=MZdX3SZ1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:2418::601; helo=nam12-bn8-obe.outbound.protection.outlook.com; envelope-from=jhubbard@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on20601.outbound.protection.outlook.com [IPv6:2a01:111:f403:2418::601])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vb4Q362j1z3cBG
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 May 2024 07:09:13 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Whu6RO26po+FMiPK9FvRq44JH4P2Izh2j07wVPqAD+5jes8xSLDgV7iYqiE/J92beU0sX6jHZX0WPppF+ZaJlnYiXO6e0eaJjx/oIsSwx2xz4lLKoTWNF7utcer4vLoCo+cGTRcjM4IGmCq2VxrIX2fv+vn3LHQir5tr/bxHDLnhaoQCmkMgv6gQszUZOkJEvv2Xev4ADXlGShIFMtzBNCdCkSq3HG8YB8Qu1ia5XzY6rpZ95OBo0eyTVb07W0OBUBZOmCK301tz1bCt2KvGb/DPGbmebpHkjuF6WdGMF3mISZ5ewTcpJaw9/Q4OmH5Ql8a67YOfYkTYz57OoRyDFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tMm2NZjLRTdG0uRQrQadns3IDlpbKedncKQU9+BflrY=;
 b=BnjMeas/COa62gFqwaO7ZRVfKHDKQ/IrbCk5dOsWY7B6nsXsmv2kRl2fYhFSPVqIAdQanDq3anpgSaCnXmq/NFvMGSvNSWihRMBtbtjphJCLMwaepJsBCF4Oh5HmjDaXGOaQMWrQ/5UEvAGkINyRg8U+CyHQtGv9dBk7X6LzK5R4ehWcRX5OmDVFUkKjPfs7Wyn2UmkdHRepVTEvLUZ3G/auPGy7ve5VrJvzxTuNntn4jiUuYfsq9Pj3mc6m2Lu6jEp57wiiQHRRN431FWEVFFUDWH6smvtpnwYhhOE6HaliKl4J1aidqyzXIFy5gA48YvWxRAjrak4Xeamg1qGJ4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tMm2NZjLRTdG0uRQrQadns3IDlpbKedncKQU9+BflrY=;
 b=MZdX3SZ13wYrHHl9L2nXZ3r/BYKyBjzZsWrtuy288KULxFN0rFVliilByyu8FgwO7iMKFM+aaGOFVQIB86LzVVuVRs+oIMtA2fUBleZFUOffKjsw1unbz7jECZCDMy+y60lqVO9ZIBmSkoRw1R0xztJX9e7/VTW6afwjz85FyFa/fn4G/wEjNRXz8df+kMNyAKT/f3iSHqo+Q87GEV3BCaTp4MMRjHNL8fJzKXx8jG+PYq5aD9fvady8tFdaJP9kN276sICFBf5uytXMIF7Lojd41UYi2WvghLrJ6mWvdlkoSB8tGM7wFgYTg6sarDCS6qx/JEnaxzBMsWX9gXVCaQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BY5PR12MB4130.namprd12.prod.outlook.com (2603:10b6:a03:20b::16)
 by PH8PR12MB7256.namprd12.prod.outlook.com (2603:10b6:510:223::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.43; Thu, 9 May
 2024 21:08:36 +0000
Received: from BY5PR12MB4130.namprd12.prod.outlook.com
 ([fe80::2cf4:5198:354a:cd07]) by BY5PR12MB4130.namprd12.prod.outlook.com
 ([fe80::2cf4:5198:354a:cd07%4]) with mapi id 15.20.7544.046; Thu, 9 May 2024
 21:08:36 +0000
Message-ID: <fbc3f489-f8e2-4e1c-ad68-7a72b1bf3e70@nvidia.com>
Date: Thu, 9 May 2024 14:08:24 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/1] arch/fault: don't print logs for simulated poison
 errors
To: Axel Rasmussen <axelrasmussen@google.com>,
 Andrew Morton <akpm@linux-foundation.org>, Andy Lutomirski
 <luto@kernel.org>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
 Borislav Petkov <bp@alien8.de>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 David Hildenbrand <david@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>,
 Helge Deller <deller@gmx.de>, Ingo Molnar <mingo@redhat.com>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Liu Shixin <liushixin2@huawei.com>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Muchun Song <muchun.song@linux.dev>,
 "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>, Oscar Salvador <osalvador@suse.de>,
 Peter Xu <peterx@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
 Suren Baghdasaryan <surenb@google.com>, Thomas Gleixner <tglx@linutronix.de>
References: <20240509203907.504891-1-axelrasmussen@google.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <20240509203907.504891-1-axelrasmussen@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0209.namprd05.prod.outlook.com
 (2603:10b6:a03:330::34) To BY5PR12MB4130.namprd12.prod.outlook.com
 (2603:10b6:a03:20b::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR12MB4130:EE_|PH8PR12MB7256:EE_
X-MS-Office365-Filtering-Correlation-Id: 650a29bb-8fe3-4d76-8c2f-08dc706c30fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230031|376005|1800799015|7416005|366007|921011;
X-Microsoft-Antispam-Message-Info: 	=?utf-8?B?Sm11akU4WndaYm02emJsdjE0TThwMm5BKzhGRitUR0hRTTlaVWQ0cGp5SVBM?=
 =?utf-8?B?TTlaUitWUUhla2RBTWFBQzZsdVhtOC9oN3o0dVA4OG5zZGwveDFZeDg4RmZj?=
 =?utf-8?B?MzF3YUFPR0RVSWVISGtQeUVjcTBmSjVxeXN6VG9Gc3RPV3pJM3BQOWFTbWJi?=
 =?utf-8?B?V0I1YVR3QTdoc0YrYmRISkJKY3Y0UW1aYzA3Y0JwMDJ5dUhuZmd3TG1oRGht?=
 =?utf-8?B?UjM4K3Z5L3NVUmphcitLZ2FMVzEvc2JVMVdIVWhDbHI5SXY2aEptSWFlakJz?=
 =?utf-8?B?V0U3V2pjVzZnM3pZQS9MMWhxOFRPZUsvb00rQWZla0NPbXdyM0JSWEYzblRi?=
 =?utf-8?B?VS90OVBKbGhpYWs4TmNHanRuY1NLZGVhYlVoRGhteDVqTCtnT1grakhOUzZO?=
 =?utf-8?B?NHZ5SGEzV2JDZGltSUkxM2pKRjZ3TGRPWkgreTk2L2d4MWtHd0hkb0s2Nk9s?=
 =?utf-8?B?QUQwZlZITGFNbnkrTndERk5DMlFqWldPSkc5UXNiaEowQnk3ME1MMENWQ2dm?=
 =?utf-8?B?dERTblErSW5WUmVDQWV4SzBKMGNRQkk3M2hlL00xOW54SnVkbGJiR1NIVjlX?=
 =?utf-8?B?QXp4aDl6QjhmZTRjcUFsd3VHWGxYelF0ZXBvSm9tYWNMd2tuYmVwNXBCd1dm?=
 =?utf-8?B?VFZ1ZTFYdFluam1lUzRGRk1YTDVLYm1HSGdFazJZZHBYUjhKTzhQYVFXczYw?=
 =?utf-8?B?cFRTNGNoQ28yTENWa0tDSGFsenBQck0vOFdQcmJEWXpUbENnSmgzMkdIOHFI?=
 =?utf-8?B?SVJvQWYzZjJNTGVNU1Y0WlVrT09EV3FkUkgyL3hlWjRyNm9OZHcyQmE1UUJW?=
 =?utf-8?B?M1ZVTGp2cU0zeWd4eUZWa0xRYUpyUWtsb055bkJUNXJxUG1PRk9zeGVWUGlj?=
 =?utf-8?B?MVUrb3IzU1loVUpDU3ZNUDBsTXJSRFRqMVVzOGh2amFCdmJPOW5WREZySFoz?=
 =?utf-8?B?bkxNMzlvZXJJb1crWndGQ1hDMGg3VGxzaFg5Mkl1UGtqTS9RMXA1dmQ2aW5Y?=
 =?utf-8?B?aUV6bHNkS1dGYUtvSDBid0FSZkp0N1RMR2dvY1Rjd0VZSFBxOXNHYm1SUHN4?=
 =?utf-8?B?ZTloWmR4OCswVExlZk9MblI1eTlBa0Q4ZURBamJmUmZPdEhFTGN0MjdHVm1I?=
 =?utf-8?B?U3pTMWRaUTNlNHBpM2QyN3NXdlNlWFBHamRPTHBHRkM3UzdoRjdxYkh2SFFh?=
 =?utf-8?B?QXNNMHZDeEIySHZkVUROTmFJeHJUVWVCTDVDVjMxTVMzS1dFRkhNZXZWeVZJ?=
 =?utf-8?B?UTRjbWhhbWlSNlhuR2FlQlI3K3kvQ3Q5Z1RrYThlS1lzdWdBdzFpU1NwZHZU?=
 =?utf-8?B?bmNtNzIvSm1TV0ZzYWczaEpxY2VoQ2tua2Nsbndjd3A3Tm1IcGJML3dkd0tJ?=
 =?utf-8?B?Q2NXRmhoM1hsYlBEeklKY0RZWm9qanZ0UTI4TC9halJqdStCY1NuTXFnb0xF?=
 =?utf-8?B?VjhNcUZocTVkR2xsS1VtWjl5eEhrUWUwSEN1ZGZpQ1d1ZnRzUi9jaHF0ZGxS?=
 =?utf-8?B?dThzQUM0bUNGU0ttZ1gzWWpHQVBQVTF1OU1Pd2o0MHNnQ0tIUGlvWkxnRkhv?=
 =?utf-8?B?UmNycmlycHRtUURUZHNhNWxWT1k5V3RtemRzeTlRbEVYbnhMTXRlRzROcVNX?=
 =?utf-8?B?TFI3aHliQSswVS9zWW1BZkdNN1g4RUNJa1dyUzBGVDdNTFpXblBFcVhCcndC?=
 =?utf-8?B?TlNnQXNHT212MDRHVkFBeDFKazduYXNOTWxBbjZvS2NiSk0zamdGSC85ME9n?=
 =?utf-8?B?NHRBbU02bFhaMHd6ekF5alBia0IvK2FBYlhUVHFKQTFOVWt6d1JqNHcvZUx5?=
 =?utf-8?B?dm9MOEdhV2JJOE1DVE8vUT09?=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR12MB4130.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(7416005)(366007)(921011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?RXp6L0U4NDlYN1I2VFpFcEFzaFowVWRES2IwRHlYU1hodnl1ZGpHMkZFRXhD?=
 =?utf-8?B?VzY3OW53M3NmMDB6cjIwdnp2VVA3SngvTlpzb3VmQVlyTzFQNmZiK284TGxj?=
 =?utf-8?B?bnhnR2hCdlBPNnFaSlZZMjJtSHpmSjdvRlROeURleCtYbEtKbnEyL0szanB2?=
 =?utf-8?B?b1ZTcDlyd3RmL0JzS3ZyL0toM0F1SlJuSVNTaXZyNTU0U2ptc0o3djZsL05S?=
 =?utf-8?B?WjQ1aXU4WEQ0aGU2ZStaRmI2MUh6V3VRUUdoRDVFSUpvVEZ3Mk9qNWRjVHVE?=
 =?utf-8?B?Q2hWaVVYbEpRTnArakc1VlBtcVRUdWtSZ3RDMVk3VFlPTjVnNHdqaG81YjNC?=
 =?utf-8?B?MGduWFRtcllTekVSNTFobWhNaWpvVXpxT08wMzA2U0h6cUVDTTRqb2hhQUNa?=
 =?utf-8?B?azl0Q1pZczkzWjVwakxVZkRqYmJPYzAzTUZFclIzNlhVOWF2enZtT2JJZTMr?=
 =?utf-8?B?enM1MkYyR0FEOXhFNmQ4dStKTVg2RzBwTE5lRzA2ZW1CK1BhcE5NVWpaUXBD?=
 =?utf-8?B?VVpvSmdDRFExQmZzdnY2UHZpMVhLWUh2T2ltS2ppYVI3THM1dGJMS1RQSk5V?=
 =?utf-8?B?Z0dBL01mWXEvVC9oWnFVN253KzJtYkg4eDgrT3oxQVFzcnphekhPM2x5cEd5?=
 =?utf-8?B?OTdZOEUyVmVua3YzSHlvUmNwbE9kcW1ic3NuVnkvYVFIc09SSVdFMnhDUmlj?=
 =?utf-8?B?VG5GMTZ1Q1QzbVpaU2N1STBCcFp4U0ZBL1M3MVh4cG9JZTN5d205em1WbFhY?=
 =?utf-8?B?U21UQW91dlloZmtrcXRjbzBoVGdTSHRXN3VZNVNBcEhPRENhcVFndU1ReU1W?=
 =?utf-8?B?WEtsejZaT1FPRHpueFpZYkhHVWErdHZRdFJWUHFzVVRmb2dCaW1teHZyN3Jm?=
 =?utf-8?B?OUEvK0ZSTTIxaTBwSWdScUtvY0JMU25veE1FbXRJVWtyZmxRQ0o3Nk0xaThX?=
 =?utf-8?B?TG40c3pjS2ZmV012bW9sN3ArRlA0NW5KcmFrcHgxVDlOV3FmYzZWUy9leFQw?=
 =?utf-8?B?T3h6WFMxUEIyYm5jaEU4M0dJMU9paTRXWkU5NGpmeUZFVXlsQkZIUkZSZjRD?=
 =?utf-8?B?YlVYLzFGTVk1SGE5VlIySXJPbmJML2N1djh6YkRoaG92WjUyalI2WmU4R1Ex?=
 =?utf-8?B?Z2U4aVpyZ3p5WDNRbzNGdEJreXlYeHFCU2NpSFdIWmtnNjRjbDR5emxXakJN?=
 =?utf-8?B?U0x6VVZYdmNpWWRVWjV4OG9IbWFDNTBRbmhRMUYxYW90Vm5XK1Y0U0llbzZT?=
 =?utf-8?B?WW0yaHIxbFo0RXJXL0wzWWNaZ2p1YVVrNXhUUWNZY0s3WjJlZGhXRkN6UDFK?=
 =?utf-8?B?NG8zeTQxV3RwNU00eXROSE9ETE83Z1dJa3k4b01qUE41bG1IS0pwM1o0NVVu?=
 =?utf-8?B?MExDNy8rWTAzSWFLek42OVFGbHJGVWtkbzQ0K3grRkdjQzFJTERCWEdDMVlC?=
 =?utf-8?B?TW8yWjludjVIS3FQQ1diTUpYZGx1Mzg4SGRNTVJWbTVTSHNFRkJ3TSticEhF?=
 =?utf-8?B?NVVXUHZQR1N5V2NQSno4RjlTdkRsZ1hWWlBHdkljL0FhSERUTTF5MTdhcSt0?=
 =?utf-8?B?ZjgzNXkvQjYyeUYzSXVTRG1pNUxZYnpZWVFnWS9wVGZGeWc3M2J0UjBJZGVz?=
 =?utf-8?B?N3JqaXpVNklNdW5mbW9yTkhhaXZFWHNlUThrQ2wwTzVuakt1Z0VXOVFIWGdo?=
 =?utf-8?B?ZTJwTXIvRW5UTllFMElHTUNxRU5GQVJua1hFUEl6Sllka015TDFTa1BRRUdh?=
 =?utf-8?B?eGxtY2c2bnhESzNUUXU2TVpMM2tDVGZGZ1dvdGdaQW9lRmg0NnE4eGJ1Ujcr?=
 =?utf-8?B?QVhmMHVSeVVGa0UxaS82eHJwckErNEg3UUJPTmxYa0VRZlhPeUlSdmswbnlE?=
 =?utf-8?B?bi9MSFlwMzZ3Tk9nVEF6d3A4QTJzbUtuWUpPMnFEMWhvcC9zdURYb0JqY2Nw?=
 =?utf-8?B?c0k3ckRvSUFNdUwvaEx4L1dkeHcvcUpIdlNubFl2aUtyaE4wWm03OEFUSVhT?=
 =?utf-8?B?MVg2ZkhTbVRqMS9TVHpnaHZwcithdERGNEE3emlEZ2RmWEgvaGF3VWcyMXdv?=
 =?utf-8?B?cUt6YVJ4TFNLRWxWWDVkd0xWTmJtUStnOEJCbkp1am5PaHdRd1Q3TzgzWGd5?=
 =?utf-8?B?TXJmZExvZ3FNOVNXS3RtV0xyQ241MG1PN29rbzJLZ05HQlU4anFxaXpOdUlD?=
 =?utf-8?B?Mnc9PQ==?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 650a29bb-8fe3-4d76-8c2f-08dc706c30fe
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4130.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2024 21:08:36.1841
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nz7/oCRUi8Pk/s0L18OufHAymdPBILZ6BFtkupJ9Xemhc8egwtC8WLhb6/lyRHM3NyhAA3puYtgeEylPUlp0Zw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7256
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: linux-mm@kvack.org, x86@kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 5/9/24 1:39 PM, Axel Rasmussen wrote:
> This patch expects to be applied on top of both of the following related
> fixes:
> 
> - x86/fault: speed up uffd-unit-test by 10x: rate-limit "MCE: Killing" logs
>    https://lore.kernel.org/r/20240507022939.236896-1-jhubbard@nvidia.com

This got mostly effectively nacked. I disagree with that but do not
intend to "appeal". :)

> - [0/2] Minor fixups for hugetlb fault path
>    https://lore.kernel.org/r/20240509100148.22384-1-osalvador@suse.de
> 
> The latter is in mm-unstable currently, but the former is not (yet?). It
> would need to be taken before this patch for it to apply cleanly.
> 
> Axel Rasmussen (1):
>    arch/fault: don't print logs for simulated poison errors
> 
>   arch/parisc/mm/fault.c   | 7 +++++--
>   arch/powerpc/mm/fault.c  | 6 ++++--
>   arch/x86/mm/fault.c      | 6 ++++--
>   include/linux/mm_types.h | 5 +++++
>   mm/hugetlb.c             | 3 ++-
>   mm/memory.c              | 2 +-
>   6 files changed, 21 insertions(+), 8 deletions(-)
> 
> --
> 2.45.0.118.g7fe29c98d7-goog
> 

thanks,
-- 
John Hubbard
NVIDIA

