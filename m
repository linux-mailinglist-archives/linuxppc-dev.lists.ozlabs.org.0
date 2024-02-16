Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C303858671
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Feb 2024 20:55:53 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=i3I6X8lW;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tc2jf6tytz3vch
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Feb 2024 06:55:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=i3I6X8lW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:2405::600; helo=nam02-dm3-obe.outbound.protection.outlook.com; envelope-from=jhubbard@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on20600.outbound.protection.outlook.com [IPv6:2a01:111:f403:2405::600])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tc2hw047mz3bnk
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Feb 2024 06:55:09 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eREkjBD7OE03OGlcoRgVX4QcfsbMgF5wQ4m+t0MLofPuzPQTNVRFzPp3kXO/Y4/7bjm7XgSWXK57fG655OmgjXkEd/LGlBTiSVLdbWz9dFBoGbQRXq6Yb8F/9N59+KilWPR5LkH1JdSP7E3b3J8vq+Lho+ygDtweysGr0IfW1B+EZlbMdCFaHL0PNkI/T10QvK4cMmM4+FUpdSKyqkIzxnLklVeLzWEjtWAtwJv+padT5kZPQL0HUaUJNKidClFbFdMn8vpGrc/+/zdrSlPlEjQ7hRjQhU0thrTleohZgEDO8mBWLBkKtGa1DJ+vObG+u8SW+WOjCVi5KYzCrsv7dA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3eBl0YL4UveGysKbWrmJ/SGCE6Os0x5Ff4eZ4jDZzHE=;
 b=ey3Kjis6LmXiycGnMgiXHz5d3xoMNKAshp4cC8L+v8ne2Xt2/1UJJwP4f94nfAfSYP8CVlXrEyWI+7y37awwPe1SKYZZEZUlB+kSIT9h0CFVtNx7lwqovM8jJUsn5WyExEdJcGvJiEiD1K5VtveobK5AwDj8XZ/Q7l0OKz8++MAdXXJksvBwv/iBGbiAT8IfTTBBjvtD40LKxlyyPcdap5XtHI1ibeOzeXvdAxHh1cya+S4DHkA9/akJZ+5HAmNjjvzusR8IbQs+pGytRlfd3GsNM/iPpj5hQgAiFyrl4kL/YIUUy8ZHfiQBZhIYRKWLb2Mi2F8VkvOSG6e+4VdPwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3eBl0YL4UveGysKbWrmJ/SGCE6Os0x5Ff4eZ4jDZzHE=;
 b=i3I6X8lWMwXGN+RJ7oT8pgRgr15XR5QngTRoUJ+CiK663VlbGrHsIi75fpTbU5P5tHxiK5WRQDdKIOhxmNDhXijk4U8MCrXKv/i2Ef2xM05CA7AJcNLRWJA/vSY1zmBGErLYfFOa0yQRW4bSPsrFyoWMlx+u+cHEiRKUMsuzw1F8Y796kHW9fly0s/5tDCQmuVLQYBAVvPmb+o0ag0hW45RLgNI64Nl3d3uOiRrSpTWu0yAATQFY9jzgjmhk1Ti261LiG4fSOltcjRkTQjDOwFmHQ29ueRLF0HOP9Ua9yIzgcUIb/LqOcQPzWRaWZvNkm1LpPf53jvIi6JxLe7yZZQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BY5PR12MB4130.namprd12.prod.outlook.com (2603:10b6:a03:20b::16)
 by SA1PR12MB7037.namprd12.prod.outlook.com (2603:10b6:806:24c::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.15; Fri, 16 Feb
 2024 19:54:58 +0000
Received: from BY5PR12MB4130.namprd12.prod.outlook.com
 ([fe80::90bb:c583:cc57:aa1a]) by BY5PR12MB4130.namprd12.prod.outlook.com
 ([fe80::90bb:c583:cc57:aa1a%4]) with mapi id 15.20.7316.012; Fri, 16 Feb 2024
 19:54:58 +0000
Message-ID: <f9fc2b31-11cb-4969-8961-9c89fea41b74@nvidia.com>
Date: Fri, 16 Feb 2024 11:54:00 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 12/18] arm64/mm: Wire up PTE_CONT for user mappings
To: Catalin Marinas <catalin.marinas@arm.com>,
 Ryan Roberts <ryan.roberts@arm.com>
References: <20240215103205.2607016-1-ryan.roberts@arm.com>
 <20240215103205.2607016-13-ryan.roberts@arm.com> <Zc9UQy-mtYAzNWm2@arm.com>
 <892caa6a-e4fe-4009-aa33-0570526961c5@arm.com> <Zc-Tqqfksho3BHmU@arm.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <Zc-Tqqfksho3BHmU@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0168.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::23) To BY5PR12MB4130.namprd12.prod.outlook.com
 (2603:10b6:a03:20b::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR12MB4130:EE_|SA1PR12MB7037:EE_
X-MS-Office365-Filtering-Correlation-Id: 2bb9202b-d11d-4ead-fb87-08dc2f292765
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	FFDcAmfCUDi7lNIGoFKT5umchN/09hbUUKHVyRx0ypwbbG9jjVppZFRX+tbSq8vEUh8FkDVF6aTW9wv8suk4c4XS8xzlvP6eADr5E4XK9gLlbFi83PzfjC5xM5WK1o3q4fRZMcRoW7BUWOl/MzCMiQANioL/MOLZyFqS3a1zFQha9QJAtSWRoTSgCNT50IO5ZxELla0syHBjQ7LNODwseCTjIC/4wkWa6hb3lqWeI7WuY9iKBpY0AoC+Wd6HEMwj5rP85Eu2uiwdEOK1BBlhHtjmEf2TAjqyFhlVA9CP9QFoyBGdVFGjebBOkdVxDJLMc1hA7swEVmKKKWmq+PS8yhbPluPdbSzKeEA5B8knneRdCanyrcd2PoPvr9cj8dYl2PF0IPLCW954NC5+jFK16nRd0ASbwMcOmk0uZKx/P160GIZ3UckccMm96r5IuztUs4ASKbrdLFn9NrySVy7UWYdW7u06kXPmq+oSCapClnaTldwtmrMASJmrUuvxjYvLYKVB12P9aww0J3wGBZAATcE9gpcWVBDbM8NPY2LLkjCXC0fZgV9axQvzYYwlhmq+6H51IZjACcAFsUG54e9MpHowXbTeT44g7n56W0vz/d0=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR12MB4130.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(366004)(346002)(396003)(376002)(136003)(230922051799003)(1800799012)(186009)(451199024)(64100799003)(5660300002)(66556008)(31686004)(7416002)(8676002)(66476007)(4326008)(66946007)(8936002)(2906002)(86362001)(31696002)(36756003)(38100700002)(83380400001)(54906003)(2616005)(41300700001)(110136005)(966005)(478600001)(53546011)(6512007)(6486002)(6506007)(6666004)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?Sk1uMXlRMEw2azg5anh0Vi9WZG1NSlhGQ0lWbjl5VVNpcnE3ZXNnUDBUQ2JM?=
 =?utf-8?B?QUVsemk5Q2U1Y1d3S1hoMHhwYzFoeGdkM00zNmxFM1Rhc1EzTTdNK3dRaUJ0?=
 =?utf-8?B?Y3dRemNwVHMyaUNmNE12ZVRzU2VJTytRcXRnWGJ3bmxaMTdRYzBaNXhZWUN2?=
 =?utf-8?B?RE5jVFhiQmwxZk42MDRRQXVJVFJLaVNtenViRzVOSjVodUdkSk9mbksvTm5L?=
 =?utf-8?B?ZGkwRENWMVZmWkJwUmFTcGVVRjBvYjgvQlFuVlJubHQrOXJnRmMrVEZmZ1hv?=
 =?utf-8?B?NURPS0lOQnBHM0F3eVkzeEtqSGgvUUtrOThESGZ6K0JmSjJiM1B4dHZLMzNu?=
 =?utf-8?B?MjhPTVVyVTNHRmZnYVN6anFSZGc5eUNZNzY3dnNhSFFXd2JCbWIxVFBYb3pO?=
 =?utf-8?B?bFZ4bko0MHhXZmtSYlFldUhuK25tNmlKMlJ4SnMyN2NJbkNQcHU5aFBKMkZR?=
 =?utf-8?B?T1ZkZE1uaUFJa3RVVjZaREpQTWx4QVlvN2k3N0FrbU5acCtQclNVcXMwRHVm?=
 =?utf-8?B?aHB0RzNMUXlVRUhUZHpmTndIVWcyMWErWTJ4bFdCR0RTT0Ezd2Jobm9GSkd6?=
 =?utf-8?B?VVYrUElBRTNveVpoNnQ0L0dnUXVWUXVyRW5kYlpVUEF4N0xSYmd0UGFDdnR3?=
 =?utf-8?B?TU5SYksxL3N6azFmbW9MZU5uV2x0b00zSW96VGxnSjlQZk03RGV0WktYTHRw?=
 =?utf-8?B?M3FKSytEOXhsV2lVc3EyWHdXMm5qa1B6eUlvZEZUYUZmZWQ3UWc5MkdTcGlk?=
 =?utf-8?B?SUY2TTFtUUxxOGJEZUVheG5QQ1I1NFNxZW11a2RBdlFpNjNIbmtlYy9YVmE2?=
 =?utf-8?B?Z3pkWW93cDNUTXBlSnNLUjQ3SlYyY0UwOGVkOENBYVdJWk1pclpoRkNDQldT?=
 =?utf-8?B?MWJwVUw2WVYrSmxJUFFvL0hXVUhkVjg4aGZ6LzcwZUtMZlBGR09RSll5WWNm?=
 =?utf-8?B?VndFTXBQRGdYQUU0L2V5QS9Xd093YkkxSEJCZHlHcmJOQjA1REV6VEJucnlE?=
 =?utf-8?B?R0NrSHA1dlBOczl6djRwcktUMFRiWVRhVE45M08vMFpmTENpUkpENmtrVXJN?=
 =?utf-8?B?VFVnSER5UFN6YVBaQ211UDRETklNWTVLOE5ZbFFFK1llblc4a3hwYXFPU3Rl?=
 =?utf-8?B?YVAxRDRoa0dIVXBYaUtmbUIzblZ4K29XODZXMWJyOThHZmw1TUozcDlZQ0s3?=
 =?utf-8?B?cEdGVUg2dHB1RW8yMXB1aHE2dGRHKzl3WWsycU4yRGRnMzFqSDVpUkNEMW54?=
 =?utf-8?B?Y0o2ME05d1BTNmVSanFUSC95THFlKzdaVFpKSXpZeUZIVFNRM0RxS2xFOUNO?=
 =?utf-8?B?M0dVSXhVSkpPVHFqTjdFRHEwL1FwUkYrNEdjVFhjYW9aYnFGZXduTTU3S1RC?=
 =?utf-8?B?RU91V20zOGNpaXVWWG1RVXhTclRlUUhLV3hZSmY1ck9ncGRFQXlwTjdSSWly?=
 =?utf-8?B?S2dUeXhGTzNzci9Pc2ltWnlTWUZFWHpOKzRNZDVicjZMdkp2R0h3bTJHZ3lh?=
 =?utf-8?B?bWV3WGJLNzlORDJ1azcrU01KaEIvK3JCOTNyT01vU2dEWDRiWVY5eGh2Zkww?=
 =?utf-8?B?RHp2UVJXbFRZZXBFWkQxNkdVUXRWa1RIZ3pEQkV6S3ZjZ1BxRktSVGR1OGJw?=
 =?utf-8?B?eVVuZjlRc2JWUjVjRHk5dkRQNWxSZCtHSmJOZzBseXFVdDBQV1puTGUxRnQy?=
 =?utf-8?B?eEd3SlhGNFJlWGpsVFBiRlpMNHFlK1V2bEJENFBaWGNQKzhwMHRCN3lKK2dl?=
 =?utf-8?B?aVNlMTl6bW5iK2hpMXRWM09DaUxPd1U2eE8vQ1RMQTE3bEhBYVQ0a09IZ1VX?=
 =?utf-8?B?eTdYRXhpRHZtY0h2RUc0bDQ0dERtaTdVWFFSWjJEOVFVaHZxYlp6NDkwMS84?=
 =?utf-8?B?bVJzNXV6SkQ2cE81WkN5dXdzZ1lPaEdyMmdaODMwdmUzdlVLSEM1TXl5TFZu?=
 =?utf-8?B?UnhrM2hsa2toaXcwN1NhNTI3YTUzYmpvYnRJTmRDelBUaU1oUEduQnk1WERW?=
 =?utf-8?B?MEdWYW0wdjVSQnl4b20zWmFRT09BR1V3azlKMDZFRkVTY3V0RmJCTjFHV0xR?=
 =?utf-8?B?cDV4RVF1blNPL0ErWFhaUy9mSlVybEhqUGNvR1pmblBJL1NDaG9uVDNpRmx2?=
 =?utf-8?B?bUg1YTdwbWJTUFpOVkQzVndScEJPZHVxWitYR1ZlUmFrNGhxUkFieEt6ajlv?=
 =?utf-8?B?N3c9PQ==?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bb9202b-d11d-4ead-fb87-08dc2f292765
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4130.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2024 19:54:58.2522
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tYFs7QaSRMLyt/R7Q3aDY30BUASXNWQtAGnIcrtPe6onDe75TP6c4wBFGUw/H8keyUceOuUauu5pcbgjsT7SWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7037
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
Cc: Mark Rutland <mark.rutland@arm.com>, Kefeng Wang <wangkefeng.wang@huawei.com>, x86@kernel.org, David Hildenbrand <david@redhat.com>, Yang Shi <shy828301@gmail.com>, Dave Hansen <dave.hansen@linux.intel.com>, linux-mm@kvack.org, Andrey Ryabinin <ryabinin.a.a@gmail.com>, "H. Peter Anvin" <hpa@zytor.com>, Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, Marc Zyngier <maz@kernel.org>, Alistair Popple <apopple@nvidia.com>, Barry Song <21cnbao@gmail.com>, Matthew Wilcox <willy@infradead.org>, Ingo Molnar <mingo@redhat.com>, Zi Yan <ziy@nvidia.com>, Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, James Morse <james.morse@arm.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2/16/24 08:56, Catalin Marinas wrote:
...
>> The problem is that the contpte_* symbols are called from the ptep_* inline
>> functions. So where those inlines are called from modules, we need to make sure
>> the contpte_* symbols are available.
>>
>> John Hubbard originally reported this problem against v1 and I enumerated all
>> the drivers that call into the ptep_* inlines here:
>> https://lore.kernel.org/linux-arm-kernel/b994ff89-1a1f-26ca-9479-b08c77f94be8@arm.com/#t
>>
>> So they definitely need to be exported. Perhaps we can tighten it to

Yes. Let's keep the in-tree modules working.

>> EXPORT_SYMBOL_GPL(), but I was being cautious as I didn't want to break anything
>> out-of-tree. I'm not sure what the normal policy is? arm64 seems to use ~equal
>> amounts of both.

EXPORT_SYMBOL_GPL() seems appropriate and low risk. As Catalin says below,
these really are deeply core mm routines, and any module operating at this
level is not going to be able to survive on EXPORT_SYMBOL alone, IMHO.

Now, if only I could find an out of tree module to test that claim on... :)


> I don't think we are consistent here. For example set_pte_at() can't be
> called from non-GPL modules because of __sync_icache_dcache. OTOH, such
> driver is probably doing something dodgy. Same with
> apply_to_page_range(), it's GPL-only (called from i915).
> 
> Let's see if others have any view over the next week or so, otherwise
> I'd go for _GPL and relax it later if someone has a good use-case (can
> be a patch on top adding _GPL).

I think going directly to _GPL for these is fine, actually.


thanks,
-- 
John Hubbard
NVIDIA

