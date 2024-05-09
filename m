Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 84E808C1864
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 May 2024 23:31:38 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=FC7NFHRn;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vb4vq5tsyz3dFy
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 May 2024 07:31:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=FC7NFHRn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:2415::600; helo=nam11-dm6-obe.outbound.protection.outlook.com; envelope-from=jhubbard@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on20600.outbound.protection.outlook.com [IPv6:2a01:111:f403:2415::600])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vb4v50Q8kz3cfm
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 May 2024 07:30:54 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LqCe74kFwVF3q8PU9A35ZoWyRReZpB6FTUfZNDaN6pST7FQ1X4pniYSnV5I2bq3T44p6YUIUQsYS5tyPlHFr7OGXo4bBdzaRN2tNaidECqWz2jqvlJQLv7/PgSTBGYYt3yHtXgqlkfshHCzEQBegz5AlsIG2sik3D0ea3XYAALgwrAllWD5hzZUMnM60urHXKR2y1ue7CWDySGmEpv7eQSCsmAPZNqnNYhjvq2dR9CpcAIFLS6JswKjOsFHVpw0qtn56ZYWfq/0qCmJYEYgWj4NmKpw6rbogPKzHwjy7FpDoxkihdB2zlZ5XIDi3pkyLbVNqY33okEKrE5eFJQDqmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=md4cbEyCram6XLEw6qMfKnlTDwYajy/D4S56EgW6QqQ=;
 b=IxQQyZ6qVSk5HJc7DvlL+bLfH9ngPhF+lBKFHym8T2updJOwdvGOjkIh+VRqOSLtyBYTUl0S4QxJ01MDOXS2zDh8t4XiUY2zB8Syqb4APKrseEZKoueuthLJLaCZjrLHQRRU/wDqaayIyWkUdMGb9DgCCMwRAZiLqauOPtcQ+2saLPB/5T4WgwA1AggdiM8RI/MsIfEKFCaogdXjA6h99ZYC4JnXmTwkiknVBNmoly5Jv9SEUO/+N77OixQ5WOHQcLv3/HXQY7TbnFrphF1Z57WwAO34IGD9/57lu9PTlKsRo2jzu8H5LvvR5V6pVIrKnQSWa8fXEpbLS8/d/mbDzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=md4cbEyCram6XLEw6qMfKnlTDwYajy/D4S56EgW6QqQ=;
 b=FC7NFHRn7WEQlhlpIwyE/z9PqKe39LGikjp/URCD95iZJFl7ZbXfS7WjRhAcbwnubaKaSAXwNxdU6y0Nug7ZIipG7gMXNZYbNGOW8dY/SN1sHFeGE2/Gl1N9y8VOKbH+ooxLJo4DWSLRysvXS+4R8JC7wzsaYh9N9lGMWH/EYYWboGU9Xn7kwEH0Ni680eiLX9LNpGp4jTUjHTYAxEKZqwATg27EHBviZo/PnAj6xdJUeCvkfp0REhmzDgCumoC7RMTKOxTg1JIGxJphKCxSNGGqF83bOYnYfwA4dXfYRi1iw131UaAtUnJ8zmCoaWAjlbRSwVdU3uMvJ7rcXbEfRQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BY5PR12MB4130.namprd12.prod.outlook.com (2603:10b6:a03:20b::16)
 by DM6PR12MB4108.namprd12.prod.outlook.com (2603:10b6:5:220::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.46; Thu, 9 May
 2024 21:30:33 +0000
Received: from BY5PR12MB4130.namprd12.prod.outlook.com
 ([fe80::2cf4:5198:354a:cd07]) by BY5PR12MB4130.namprd12.prod.outlook.com
 ([fe80::2cf4:5198:354a:cd07%4]) with mapi id 15.20.7544.046; Thu, 9 May 2024
 21:30:33 +0000
Message-ID: <d04a838b-848d-405d-9317-40282cd58c36@nvidia.com>
Date: Thu, 9 May 2024 14:30:21 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] arch/fault: don't print logs for simulated poison
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
 <20240509203907.504891-2-axelrasmussen@google.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <20240509203907.504891-2-axelrasmussen@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY3PR03CA0014.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::19) To BY5PR12MB4130.namprd12.prod.outlook.com
 (2603:10b6:a03:20b::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR12MB4130:EE_|DM6PR12MB4108:EE_
X-MS-Office365-Filtering-Correlation-Id: cb80d50d-18e3-452c-859a-08dc706f41fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230031|1800799015|376005|366007|7416005|921011;
X-Microsoft-Antispam-Message-Info: 	=?utf-8?B?dldmSitQOU9JY3pJVWk1bkJLb2Z2RGhxVyttOWo2S3dRVXB1L3J0NnREbWFI?=
 =?utf-8?B?cWNxWU0raGlYNExvVzdyNkZDcWhtU212ejRZcnlWbys5RDhjZGk5VktqMFBP?=
 =?utf-8?B?dldHK0pCRzdWaExrWlcralhPS1g4UXJOV3NYdkpsNHIwU2dTQzdYS0orRWdK?=
 =?utf-8?B?a0hIU0ZMeU8wbmFEWEg2bExUWEZtcHpOQWVwZWgrbVZobk1uT0tRTWt6ODJT?=
 =?utf-8?B?Y2ZCcWY0akJGTjREYm0wTmg3T05uNjlFVHk2OExWZlNIWmI3UVA0ZERKR3R0?=
 =?utf-8?B?QmRBYWw5cWtPT3BPV0lNS3VCYkZBOTY2U000eFRyREgrd2tUcFVDcUNVZ09P?=
 =?utf-8?B?UnQzN21EL2tqbUlzc0ZZZGFzOHBRWEM0TzdtRkZtaklTNWtyeVF5WjFpYjRl?=
 =?utf-8?B?bWVlU2hIS0RWaExleGRvYWpPOHlwSlBSUWpBSDJkako3VDQrWC9qWFVLd3Bj?=
 =?utf-8?B?V3E2ZnFjM0wyUWIydDNoUjU3am9PdDBIV2pXeE5ieHFyTVRVWHo4czFkZ3V1?=
 =?utf-8?B?UGI5NUFDTGR2bTlZOHRzSlQ0UXkvV08ybGZIdXFKdmlFeCs2ZkczbGs5YW84?=
 =?utf-8?B?dkNsK21CckRDbldvZURDV1k3Si9yMVYwU3VlMHE2NFNHOHExUi9FL2ViaDhv?=
 =?utf-8?B?ejlJcWIrcWw4VXQvaHM3amh5bjNVVzNQMm10MklVTEt0WVN4UU5aK1JUY0RW?=
 =?utf-8?B?WlUybXBsSEo1UURlWEo2dllIeUtLZ2hNVVB3OFFXNERZd201MEZHR1BVMlRX?=
 =?utf-8?B?aVVDcFRoSDhEMUVKQ3pVVkxaYmhxWlBUSm9LOUY5OVhQcHA0dHV3aGJVL0JV?=
 =?utf-8?B?S0YxWXJvWDhYRTZHaC9lQ0JkR0Z6bSt2YUR3RldxUjBJdUZEaXJDQlQvN2My?=
 =?utf-8?B?M3lxRFEzbWVkVDVEWE9ubGpXcUJuZWQ3dUxmbVFOVWVFdk1zcjJBS1l5bWFl?=
 =?utf-8?B?MFhMVVlPdVJqbVJhL2ZKc1lNbjVodmlFNFFadk83a3FtZFlYbXBVQ3ByekVC?=
 =?utf-8?B?TXYvZkd2c1kza0lWMDk5RzhHOEhpczNPNFYvdHcxTDRKTGY1dHRKb0hBOU1V?=
 =?utf-8?B?NFdtNCs4cmVyZEpLN2pSaXRURlN6d0xKdnRneTFaYVRWMHJBMi9ob1JFUGdh?=
 =?utf-8?B?RGZVMk9wemJHZ1lUWW80bHBPVDFkT0Y4NkJyTjhoT1lZRGNoK3VuNSs0R2Fj?=
 =?utf-8?B?ajNIOVAzS2pMb3c0elZLekhFZXNxaU1vZFpBNzFva015Njg1anNWRy9VV2dS?=
 =?utf-8?B?UjlNZW94a1lpeU55aHZMNW9NZUQyRUFHTytNTUF0TjBDL1h1YnpTZGNzcDFB?=
 =?utf-8?B?NWVKWFdoVkl4Yml4bUhZUXRYOHl5d1NnZ2U4N3ZiWTlSSGNBbGNoOGFVdU9E?=
 =?utf-8?B?YkN0ZTNwOWtkcWE4U09sbVVmdDZabEhGY1BHU1ViUElsUU5KSkxHS3ZIekpG?=
 =?utf-8?B?SGRtQlVsSlNzckp3ZUE0SUZYeFlmeUluMXR0Ulppa0lSR3ZGSUZVcHlVNlY3?=
 =?utf-8?B?Vkk1ZG5sVFhoYytoV1pEczJxWFpwbGRUdkpRcTR6emZ3WHRxOHBpYUQ4ZmEx?=
 =?utf-8?B?ZUZlR2l0VWttd1FwUXpSVXFqd2t4NnhkbmV2a0JmbVR3a3Noak15VzE4VlVF?=
 =?utf-8?B?VE1WOEVIYWNReFI0T3JrOXdZdFBsNFBYNjVKZFVvaEgwQXZYV0dGYXFwb3k4?=
 =?utf-8?B?Q3ByaWllVHhpSEdlazBwTGNPcThIQ0IrdVV0Vkg1UHNXbWFWRzZPNkRNOTlR?=
 =?utf-8?Q?3QKO8T5HssKAi5j8bzFocNdo8WwsANfqJH+i1gD?=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR12MB4130.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(366007)(7416005)(921011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?SUJ1cWQ2YVAvZEdnZjZIZDg4TWRtY3IxZWxOZlNFTitiMk9uVVNhYUtXSUZl?=
 =?utf-8?B?VTRyYWo4MzhSaFhKaWFmK1BxVVRKZU8wWUV1cVR5TU1hWUN2L2VaQmxUMTJX?=
 =?utf-8?B?d1I5Si9kU1V1NzNERTlOaVhGRnBwWFpCeUtjRmcxdXRiQWxOb256M25vclMw?=
 =?utf-8?B?U2NFTlV1bjFnLzg0YnB1UW5lNURtRzYvSjF0VFhsQnhrL1RQUVY2aHAvRVUy?=
 =?utf-8?B?dFVYTDVUelJhYmovdWF5R2g4YkxaYWpkdUNkb2YzMEJCV1JaS2dhNk5GUnVX?=
 =?utf-8?B?UkVoMGV2VERjUnd1Q043RWpwa0dYek50M0tSNmY0clUzcEswa2l2RHZKbHhp?=
 =?utf-8?B?dmtmeUtuU0t0dEk5eGhva3pMNktzMmF6eENzYzM4T0QxWW9sQW9pb2ZVMEZG?=
 =?utf-8?B?L0Zxa0NjVUtIRGJTM0pXZHdpYitsVUxlcUN5cFpoZGw2VW9ydHU1YTZ1SEhJ?=
 =?utf-8?B?RlRCbVRLcndLL1RuUkNJRWdaOTRsbFhDZTVJcWFsM0lON3dNcnBjelJXTEow?=
 =?utf-8?B?Qjk2d3NOZ04zeEsvdHJna2xrK0I3RllDVXJIWU9YcGlZeEhMejZIUGhlT3FO?=
 =?utf-8?B?bm5UVDJFc2Nva0s2YnpISU5DYXpJOWg4MjU2Smg2dEdyYnFSemFhd1pkRjNW?=
 =?utf-8?B?OXFMdjZPNVY5UUpXRzdYTzJNdnRSa3ArZXk4RENwSFVtbjg5MEt1L0ZGQkRw?=
 =?utf-8?B?SVdjdkN4ckRZeThxQk1iRkJ6OWNaRnI3aEUvRFUxdkp4ZlBHUUNLODgwQTNq?=
 =?utf-8?B?U0IvM2FFaGNaUmthY2pLUkR2a29KUmlCOFBkR2tHRllyVHNUMEcwSXR0Q0VU?=
 =?utf-8?B?OFZpVU1saUJKUmNmRXVBemVoYjZEMityM05hK3dxbFZDUVRybjBQWjd4WkRh?=
 =?utf-8?B?LzQyUjJ3L2h5WTM0dDFKeXJ4U2kwZTVyemtnTWFLM09lOUJIelpHRDMySkZr?=
 =?utf-8?B?QTJJbEFFUE9FWFF2Sk52eFdvMHBTWnI1WVByRkdnQUMxU1NDdnEyZWpRUXZT?=
 =?utf-8?B?TmhPRlVkVllYYXd1OXA0YXhka3BzL0VzMHhKNkdIUFlaSFVtQzRETlRRaW1N?=
 =?utf-8?B?UlA0THBvVnpWR3FWN2VhMGZiMXBiWVpSY3RMQXNoQ3JQaldpemdFSzdyNUVs?=
 =?utf-8?B?TGF0NXdWYzZzY2NwdFpHeWxzSUFJamtaSzhuVkpDUVFlZEsrVjRiRkZiS2J6?=
 =?utf-8?B?ek9HMWs4ay9aT1BoeDI0UVYvK2hYSlRabW8zY3g0MHlUQ0p1ZlpBbXhVNTd1?=
 =?utf-8?B?aTBxYnA4Q0Q3eUNaQkxoNWJQNDN3WWMrbTdjQklHd3VpUFNmdHF5Ry95ZGlt?=
 =?utf-8?B?WFRwYllmU2FCOU95ZThPWC83V1ZvM1pIWWo2b2tLLzRlS25neHBrU04venZO?=
 =?utf-8?B?WEhERWtuREV2UlMxL01oS3NNTElrYkpLNGh3cDRsT0tKZUZkRXFaaGNkQVJy?=
 =?utf-8?B?UkZqZWY1UlcxZmYrM2M0L2gwMmpDeG5FMi9RUnBGdk5iTUhUNW5TeTIzSzRr?=
 =?utf-8?B?WTludms4YXBuUmFKNjA3RUZoRGlXQVNwSXRRdkJtR3BwaC80RUZ0cFhjUkYz?=
 =?utf-8?B?eDljU0V6NmFBL2pnQjJkd3ZPaVNubytrN1Q4SmxzV2wydUlLZjRwNElhbFNq?=
 =?utf-8?B?YnJVankyZ3l6U3d6czUraXgxM0tQRUVqamJqSWduaWVWZFpzRFQza1FxS0dM?=
 =?utf-8?B?bE1MaEJWVENSc1lIS1pCSTNtdVp4S1BHTEJCdzY1L0Y0UFNBWFQxMWFxSkxo?=
 =?utf-8?B?cVB0QzVwbS9TZXVEWFN2OFdneE9Oek96YTlBVURMSXp4K0JMaWhHOWVqeVJz?=
 =?utf-8?B?SkVmZ0dhdlRhNkNjYzRrQUhGeXU4alpmcWl1Q3paeCtOMGJ6UEdaSG1tcUpQ?=
 =?utf-8?B?RDNJWWdZT3pTbUFZUzhXajB0MFlHaGlHcGJEaFhzOEp3aUE0SVBoVGE5dlJ1?=
 =?utf-8?B?UGFRMzFyMXhzQ2lTa2FFTmp0SXh4MEdqVHpWZks3RGIvQWZ2MXdjTWNJakJt?=
 =?utf-8?B?RmhpWFpkOHpVTHdyUUQ5djUxQ25hWE1lVTBHT0FINnFYcXNvTHBEUGhldWU3?=
 =?utf-8?B?SkFCdWMvdG5uMEVCRys3aUZyVitKQ2RvS3ZwVjExVjVlblg2c2p0cXFoUVRZ?=
 =?utf-8?B?K3pGNlhySStVZFRabUdac016VStxUUt1SElMSVNQTjJDTllsNnhXaUtPRmZw?=
 =?utf-8?B?NkE9PQ==?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb80d50d-18e3-452c-859a-08dc706f41fb
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4130.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2024 21:30:33.1565
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GjUJiST415epQwt7PGQYHN+gjZDQeJKosMRYCWmj5YVrSoGrG4RELlBLRTq85snztlwBi5vOnUe+FBIYVGmjcQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4108
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
> For real MCEs, various architectures print log messages when poisoned
> memory is accessed (which results in a SIGBUS). These messages can be
> important for users to understand the issue.
> 
> On the other hand, we have the userfaultfd UFFDIO_POISON operation,
> which can "simulate" memory poisoning. That particular process will get
> SIGBUS on access to the memory, but this effect is tied to an MM, rather
> than being global like a real poison event. So, we don't want to log
> about this case to the global kernel log; instead, let the process
> itself log or whatever else it wants to do. This avoids spamming the
> kernel log, and avoids e.g. drowning out real events with simulated
> ones.
> 
> To identify this situation, add a new VM_FAULT_HWPOISON_SIM flag. This
> is expected to be set *in addition to* one of the existing
> VM_FAULT_HWPOISON or VM_FAULT_HWPOISON_LARGE flags (which are mutually
> exclusive).
> 
> Signed-off-by: Axel Rasmussen <axelrasmussen@google.com>
> ---
>   arch/parisc/mm/fault.c   | 7 +++++--
>   arch/powerpc/mm/fault.c  | 6 ++++--
>   arch/x86/mm/fault.c      | 6 ++++--
>   include/linux/mm_types.h | 5 +++++
>   mm/hugetlb.c             | 3 ++-
>   mm/memory.c              | 2 +-
>   6 files changed, 21 insertions(+), 8 deletions(-)
> 

This completely fixes the uffd-unit-test behavior, I just did a quick
test run to be sure as well.

Reviewed-by: John Hubbard <jhubbard@nvidia.com>

thanks,
-- 
John Hubbard
NVIDIA


> diff --git a/arch/parisc/mm/fault.c b/arch/parisc/mm/fault.c
> index c39de84e98b0..e5370bcadf27 100644
> --- a/arch/parisc/mm/fault.c
> +++ b/arch/parisc/mm/fault.c
> @@ -400,9 +400,12 @@ void do_page_fault(struct pt_regs *regs, unsigned long code,
>   #ifdef CONFIG_MEMORY_FAILURE
>   		if (fault & (VM_FAULT_HWPOISON|VM_FAULT_HWPOISON_LARGE)) {
>   			unsigned int lsb = 0;
> -			printk(KERN_ERR
> +
> +			if (!(fault & VM_FAULT_HWPOISON_SIM)) {
> +				pr_err(
>   	"MCE: Killing %s:%d due to hardware memory corruption fault at %08lx\n",
> -			tsk->comm, tsk->pid, address);
> +				tsk->comm, tsk->pid, address);
> +			}
>   			/*
>   			 * Either small page or large page may be poisoned.
>   			 * In other words, VM_FAULT_HWPOISON_LARGE and
> diff --git a/arch/powerpc/mm/fault.c b/arch/powerpc/mm/fault.c
> index 53335ae21a40..ac5e8a3c7fba 100644
> --- a/arch/powerpc/mm/fault.c
> +++ b/arch/powerpc/mm/fault.c
> @@ -140,8 +140,10 @@ static int do_sigbus(struct pt_regs *regs, unsigned long address,
>   	if (fault & (VM_FAULT_HWPOISON|VM_FAULT_HWPOISON_LARGE)) {
>   		unsigned int lsb = 0; /* shutup gcc */
>   
> -		pr_err("MCE: Killing %s:%d due to hardware memory corruption fault at %lx\n",
> -			current->comm, current->pid, address);
> +		if (!(fault & VM_FAULT_HWPOISON_SIM)) {
> +			pr_err("MCE: Killing %s:%d due to hardware memory corruption fault at %lx\n",
> +				current->comm, current->pid, address);
> +		}
>   
>   		if (fault & VM_FAULT_HWPOISON_LARGE)
>   			lsb = hstate_index_to_shift(VM_FAULT_GET_HINDEX(fault));
> diff --git a/arch/x86/mm/fault.c b/arch/x86/mm/fault.c
> index e4f3c7721f45..16d077a3ad14 100644
> --- a/arch/x86/mm/fault.c
> +++ b/arch/x86/mm/fault.c
> @@ -928,9 +928,11 @@ do_sigbus(struct pt_regs *regs, unsigned long error_code, unsigned long address,
>   		struct task_struct *tsk = current;
>   		unsigned lsb = 0;
>   
> -		pr_err_ratelimited(
> +		if (!(fault & VM_FAULT_HWPOISON_SIM)) {
> +			pr_err_ratelimited(
>   	"MCE: Killing %s:%d due to hardware memory corruption fault at %lx\n",
> -			tsk->comm, tsk->pid, address);
> +				tsk->comm, tsk->pid, address);
> +		}
>   		if (fault & VM_FAULT_HWPOISON_LARGE)
>   			lsb = hstate_index_to_shift(VM_FAULT_GET_HINDEX(fault));
>   		if (fault & VM_FAULT_HWPOISON)
> diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
> index 5240bd7bca33..7f8fc3efc5b2 100644
> --- a/include/linux/mm_types.h
> +++ b/include/linux/mm_types.h
> @@ -1226,6 +1226,9 @@ typedef __bitwise unsigned int vm_fault_t;
>    * @VM_FAULT_HWPOISON_LARGE:	Hit poisoned large page. Index encoded
>    *				in upper bits
>    * @VM_FAULT_SIGSEGV:		segmentation fault
> + * @VM_FAULT_HWPOISON_SIM	Hit poisoned, PTE marker; this indicates a
> + *				simulated poison (e.g. via usefaultfd's
> + *                              UFFDIO_POISON), not a "real" hwerror.
>    * @VM_FAULT_NOPAGE:		->fault installed the pte, not return page
>    * @VM_FAULT_LOCKED:		->fault locked the returned page
>    * @VM_FAULT_RETRY:		->fault blocked, must retry
> @@ -1245,6 +1248,7 @@ enum vm_fault_reason {
>   	VM_FAULT_HWPOISON       = (__force vm_fault_t)0x000010,
>   	VM_FAULT_HWPOISON_LARGE = (__force vm_fault_t)0x000020,
>   	VM_FAULT_SIGSEGV        = (__force vm_fault_t)0x000040,
> +	VM_FAULT_HWPOISON_SIM   = (__force vm_fault_t)0x000080,
>   	VM_FAULT_NOPAGE         = (__force vm_fault_t)0x000100,
>   	VM_FAULT_LOCKED         = (__force vm_fault_t)0x000200,
>   	VM_FAULT_RETRY          = (__force vm_fault_t)0x000400,
> @@ -1270,6 +1274,7 @@ enum vm_fault_reason {
>   	{ VM_FAULT_HWPOISON,            "HWPOISON" },	\
>   	{ VM_FAULT_HWPOISON_LARGE,      "HWPOISON_LARGE" },	\
>   	{ VM_FAULT_SIGSEGV,             "SIGSEGV" },	\
> +	{ VM_FAULT_HWPOISON_SIM,	"HWPOISON_SIM" },	\
>   	{ VM_FAULT_NOPAGE,              "NOPAGE" },	\
>   	{ VM_FAULT_LOCKED,              "LOCKED" },	\
>   	{ VM_FAULT_RETRY,               "RETRY" },	\
> diff --git a/mm/hugetlb.c b/mm/hugetlb.c
> index 65456230cc71..2b4e0173e806 100644
> --- a/mm/hugetlb.c
> +++ b/mm/hugetlb.c
> @@ -6485,7 +6485,8 @@ vm_fault_t hugetlb_fault(struct mm_struct *mm, struct vm_area_struct *vma,
>   				pte_marker_get(pte_to_swp_entry(entry));
>   
>   			if (marker & PTE_MARKER_POISONED) {
> -				ret = VM_FAULT_HWPOISON_LARGE |
> +				ret = VM_FAULT_HWPOISON_SIM |
> +				      VM_FAULT_HWPOISON_LARGE |
>   				      VM_FAULT_SET_HINDEX(hstate_index(h));
>   				goto out_mutex;
>   			}
> diff --git a/mm/memory.c b/mm/memory.c
> index d2155ced45f8..29a833b996ae 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -3910,7 +3910,7 @@ static vm_fault_t handle_pte_marker(struct vm_fault *vmf)
>   
>   	/* Higher priority than uffd-wp when data corrupted */
>   	if (marker & PTE_MARKER_POISONED)
> -		return VM_FAULT_HWPOISON;
> +		return VM_FAULT_HWPOISON | VM_FAULT_HWPOISON_SIM;
>   
>   	if (pte_marker_entry_uffd_wp(entry))
>   		return pte_marker_handle_uffd_wp(vmf);


