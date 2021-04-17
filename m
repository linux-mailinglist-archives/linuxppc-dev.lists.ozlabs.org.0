Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ED52436327A
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Apr 2021 23:21:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FN5cM6lSwz3c83
	for <lists+linuxppc-dev@lfdr.de>; Sun, 18 Apr 2021 07:21:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=nHQ55oHr;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=amd.com
 (client-ip=40.107.95.61; helo=nam02-dm3-obe.outbound.protection.outlook.com;
 envelope-from=thomas.lendacky@amd.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=nHQ55oHr; 
 dkim-atps=neutral
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam07on2061.outbound.protection.outlook.com [40.107.95.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FN5bs6tk4z2yht
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 18 Apr 2021 07:21:11 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bl+5+HRXFW/MakV5JzouCezfNzKY6yiCeu2MgA+E8mRSpm1GAwjaH9zUDtzYI0noB/BpY8KLxssLxN/1shTBCETP8uhhEMyFrkiPTYPaSup77eZ89GgCJpmZyN1SFh5cnP5mDWmkY6h741r9/oiI7r4FkK8ULIP3TzNWDqTtGz6JdgH6fz2WbIb9H1O6EFG59+VXuhtTQzfhy7xoblpkS50hpksf+YXXEZmEL0Z6dQhwtWNcmm2mfJAG5WgXimgrvdPlR8fgO4S8Ew3oRAQKQzWWRc0c47Z8NURlEp7xDzaiR/ufg4QjB16OoWgdr2352aT0SKAIghP2+8aySpO7lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KMRCQAz62yxAxQYydZ3OIU/kAdlPzJGamQ+EZHW0nQc=;
 b=WGCf+sZRFbsLCRSwBXppYref1BB/W0w5kcjwu6jUBGl9eAS1usJtcsr5RecVaMbXfXtKr+T5jSC6wuv1ZaHDPLqY38DzZkKXj6SOc2y4G26t0LVINOOG5Su0nybf24tW2mru5w4LRw8ROsTMF66I7PNPVRAbB9fWzFHM+RT8+Q7bn+afa4Tk0w0mj8tsujLK4BDZ9eWcoukw/EdBxtQNWp9hzsSoGcgG2U7nUWBPvuQVwRfOtlQtDqJJvqpaozuuIyweLd12G0ViXD18uE5KAAo8gbAl3kzpzdaFM22fMsnodwOFnQ2vO9Bsx8ETDt4aLFHxBI+tdWIQpG8wIVmZBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KMRCQAz62yxAxQYydZ3OIU/kAdlPzJGamQ+EZHW0nQc=;
 b=nHQ55oHrAKkxuZNApL6nacP+W1rU98a4c/ph+s0UUplS8z3vQgBFtyKk6PiYEs7goDaZqn9tSeA2LuD2cMadYJoAQy35/ETUFaxifyVl/Isv76nDft9114ai8nepfwHr1iNwKxw1hdwc9CzVO5IRDvy2PI0VaVExJtXP+R1Ioqk=
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=amd.com;
Received: from DM5PR12MB1355.namprd12.prod.outlook.com (2603:10b6:3:6e::7) by
 DM5PR12MB1771.namprd12.prod.outlook.com (2603:10b6:3:110::22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4020.18; Sat, 17 Apr 2021 21:21:00 +0000
Received: from DM5PR12MB1355.namprd12.prod.outlook.com
 ([fe80::b914:4704:ad6f:aba9]) by DM5PR12MB1355.namprd12.prod.outlook.com
 ([fe80::b914:4704:ad6f:aba9%12]) with mapi id 15.20.4042.023; Sat, 17 Apr
 2021 21:20:59 +0000
Subject: Re: swiotlb cleanups v3
From: Tom Lendacky <thomas.lendacky@amd.com>
To: hch@lst.de
References: <20210318161424.489045-1-hch@lst.de>
 <0349082c-59c5-20d7-f324-279981c3f6ea@amd.com>
Message-ID: <5a7dc9af-980f-f580-8a51-aac72c9c3c21@amd.com>
Date: Sat, 17 Apr 2021 16:20:57 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <0349082c-59c5-20d7-f324-279981c3f6ea@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [67.79.209.213]
X-ClientProxiedBy: SN4PR0501CA0092.namprd05.prod.outlook.com
 (2603:10b6:803:22::30) To DM5PR12MB1355.namprd12.prod.outlook.com
 (2603:10b6:3:6e::7)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from office-linux.texastahm.com (67.79.209.213) by
 SN4PR0501CA0092.namprd05.prod.outlook.com (2603:10b6:803:22::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.8 via Frontend
 Transport; Sat, 17 Apr 2021 21:20:58 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ccaa76a2-2eb4-46e6-8b85-08d901e6b230
X-MS-TrafficTypeDiagnostic: DM5PR12MB1771:
X-Microsoft-Antispam-PRVS: <DM5PR12MB17717D36093BA282C199D672EC4B9@DM5PR12MB1771.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ceCX6hzwZDUxlavMtsl545irSjjUfLPyc57HobYCM8pdEQNPqmTkEoa3Rv3EjiWPLpqcZajSG6/VwT19ZLuAS77hQiKexUcMvZtN7Dtd5j8i91F4v4OmI6y+EnNlgWLd/eH/uipUBEVz5lhY6tHqV//8ao73VAruCDrZcUu04HmJbtBzAAqO412HEAz8BbV+I/ZbPT510vFE8HSvMkq/z7M0WEHAdpKOnOrkOAdI/y3waAtSYFZRGwJn0rkF6EOQ5seEjxf7/VbTjiHUl4M8fw+yHaCOrZrBK5xQ4JW74gfjLRj+B6b56ZpyFop2UXAXzhjNYJZmlwQJTVmKPWlbGJDbEiBFUS9c9DLmvbJggIH6bs6Ub6P6zLXERYZhgW1/6d8Ejxyy9bHl2i2COgvZHvlqeJD0AYnLQH+6wE4EOLgPfQ0l46MyUIvwMe4lvj5gwAFKIqv570YV9gObBvQHcQjepC+zgGYr9yVGqeFNXIMWYGL4jKvnZfJowg3mF7Q9byyHdLnO5mBupW98sZGzhtJedFAIrqiu3Fr1KdtTjObfcesMu5dJ8vRF1PR62OIeZZcn0onnt9sdR9aIcnoqz83E7zUiHHFJAPbvtLwevEjmBWZJFUiBnCt9vQv5qg74qXB2Wxg7s7HxR9zaznoy9j/415x9L7pVPcl6FaIw3h9k327wx7feiagdWo97k5dF
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB1355.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(346002)(366004)(376002)(39860400002)(136003)(31696002)(6512007)(26005)(4326008)(66946007)(8936002)(7116003)(31686004)(5660300002)(186003)(6506007)(956004)(66556008)(66476007)(316002)(36756003)(6486002)(83380400001)(478600001)(6916009)(2616005)(2906002)(38100700002)(8676002)(16526019)(53546011)(86362001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Mk85UkZ5VXhrU1E2VGFXK2kyR1dZVUR6dHNlOCt5NXdxTzJ4TjFPRHVrMHcr?=
 =?utf-8?B?NjM2cDJQR2xFZVkvZTRCSUkycTRjbCs2OURyMEVsL1M3MGlKK1diNzFiWGlF?=
 =?utf-8?B?R2s2czE4M0Q5bkQvN0F6YmkwQklROGlZWXRNQWNla0FySXErNFlWcVdTTUMr?=
 =?utf-8?B?NzJ3RmkyZXJnUjZ3TWx6OFNUSmpwRE5INXUvZ2VScHhvK1FQN3B3U0J6c0kw?=
 =?utf-8?B?bEx1TUFPZ00wSFViSzI2czFNZWo0WTBvVUhMZTU0R3VxYytZbThxQXUySVBL?=
 =?utf-8?B?UmptT1MvbjZ3VGZuenFySE1ySGdQQjVmaDFWVmlKQzJPQjh4YVRiUzE5OXBn?=
 =?utf-8?B?QjJ1WlQ2dFdhZnkxRWJHbTVUcjlWUWMrc0J1cWt3WDhmZUNDZlN4SWgvSDNj?=
 =?utf-8?B?dUpBVTkxdkVYODdwdmM3VGtXK051bHh3c3lUOTBFZTZKS2RiNmU5V204Yk8v?=
 =?utf-8?B?eGhvcUxTUWtxL3NEMDNjNExkOWM5RTBzTFhESkw0dDM5MDJNdVAydUFxVGFG?=
 =?utf-8?B?R2dSTkNwS0xudkdCZDFsM293V0o5UUhmcmVraHV3SzRBdGVCZEpCSTQwdTk2?=
 =?utf-8?B?aXNLYzkyckdsV3FYUklLb3Y2MFhyWkpTM0thdGx1amZhQlJiSVNmdndIVFYv?=
 =?utf-8?B?TDh6ZTJnQWlZRXM4UmRCNTF5MXlCbGUxV2dRZmY3TjVCSlNjckxQbVYzRXVz?=
 =?utf-8?B?YkFiNVFIem9UNjJRV0NrdlJZOXBqOEhabWlrSlU5SzVkN0w3V1F2Q0dPVmxH?=
 =?utf-8?B?R0Y3d0d5amZjWm9ZVmlYekFFejN2UXNlaEZHTE9DRmxST1F5VE9TZ3JQdGlt?=
 =?utf-8?B?VnAyWFVya1ViMThvZHdjNnFwRmlMOFdoNEtId2RMelRXWERpMEt2RFhUSmo0?=
 =?utf-8?B?UDVVZGNzbElNUElpNEd1Tk5uaGtuMmNzMVBxZWJNZldXd0IwMFFWVFRNWmVV?=
 =?utf-8?B?MUh3ZFp0SmRub2NVaFIvUDk4ZkJ1QnJmeXVvVnF4eVF4WTNIQnp5ME1qeDFz?=
 =?utf-8?B?eml3S21DdER5Y2w4akJqRUVmOTkyR1Q1ZGRZelpmVkd1dWFVVFdUYjVtWHhL?=
 =?utf-8?B?VkZ1V1JTTXQxU0ppZUN4WDQycE5pb090RjE0V3Y1dUI3WXk2ZlNKMVl3Mkk3?=
 =?utf-8?B?NE9wdzlsNTZUdnB3dHVERThUdEpKb3RUSXNGa2dhblRZNXkwdXYyQkZjL0w1?=
 =?utf-8?B?Uk1sMnBPdUpkQTcvN0x2QkxxZWpqNUhpVjBRQng2RHYyejNhMnpJVk55SE1G?=
 =?utf-8?B?TEZKakt2c0hpaWluOU54aU1ZbDZDbXhPQjRWZHVQU2xHaVI0M3poMytIUFhW?=
 =?utf-8?B?MEx6VXU2TExoWkxsNEJRTWl0Y2dIblo3S2RSRDgvSkFLSjd0ZTJzRFhiWDdO?=
 =?utf-8?B?ZVArSmZhK003VmVUV21mS2YxdnpMV1prQ1k2dGdMRzRna0RpalYwbkpvakRk?=
 =?utf-8?B?R1VYcWZZMXdwYytUWGFJWk1Za0FXRkdId2VzS2NaWWFyMnJ5UFNvRis0ZlBy?=
 =?utf-8?B?d3RYZ003amN4czV3V3hqZXMwbi9FSkZNbU0zbjRWUWx5L1RwM2tqeGFzMWRl?=
 =?utf-8?B?cDVHMnJXMlk2SGtvRmVsSE1ud1JpTjBwbERPbE8zTXVyaXg4blRxSWFVOCtP?=
 =?utf-8?B?SC9PWmpEYjZXcVFqUWpNRGVFTG1mN282ZjArYzg4MXF6ZW1xWmpuT3BTV1ov?=
 =?utf-8?B?TlV0SkFlem8xWkZhWm5ndEJjaWpzM2ozUENTZ1l4WDBtaXlFdGhOcllrSnVU?=
 =?utf-8?Q?vidKZ0gIvjdUUo2MsIgimdid42jXK17u6izlNBB?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ccaa76a2-2eb4-46e6-8b85-08d901e6b230
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB1355.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2021 21:20:59.5936 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PN2AELms0UZzCOfAq94JFJbNCDLqIgYmVHKcdL1fwxk+RHClPejHRlOlK2T5p8wdKfgUxVxfvqpARm1fvjIZfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1771
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
Cc: xen-devel@lists.xenproject.org, konrad.wilk@oracle.com,
 dongli.zhang@oracle.com, iommu@lists.linux-foundation.org,
 tientzu@chromium.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 4/17/21 11:39 AM, Tom Lendacky wrote:
>> Hi Konrad,
>>
>> this series contains a bunch of swiotlb cleanups, mostly to reduce the
>> amount of internals exposed to code outside of swiotlb.c, which should
>> helper to prepare for supporting multiple different bounce buffer pools.
> 
> Somewhere between the 1st and 2nd patch, specifying a specific swiotlb
> for an SEV guest is no longer honored. For example, if I start an SEV
> guest with 16GB of memory and specify swiotlb=131072 I used to get a
> 256MB SWIOTLB. However, after the 2nd patch, the swiotlb=131072 is no
> longer honored and I get a 982MB SWIOTLB (as set via sev_setup_arch() in
> arch/x86/mm/mem_encrypt.c).
> 
> I can't be sure which patch caused the issue since an SEV guest fails to
> boot with the 1st patch but can boot with the 2nd patch, at which point
> the SWIOTLB comes in at 982MB (I haven't had a chance to debug it and so
> I'm hoping you might be able to quickly spot what's going on).

Ok, I figured out the 1st patch boot issue (which is gone when the
second patch is applied). Here's the issue if anyone is interested:

diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
index d9c097f0f78c..dbe369674afe 100644
--- a/kernel/dma/swiotlb.c
+++ b/kernel/dma/swiotlb.c
@@ -226,7 +226,7 @@ int __init swiotlb_init_with_tbl(char *tlb, unsigned long nslabs, int verbose)
 
 	alloc_size = PAGE_ALIGN(mem->nslabs * sizeof(size_t));
 	mem->alloc_size = memblock_alloc(alloc_size, PAGE_SIZE);
-	if (mem->alloc_size)
+	if (!mem->alloc_size)
 		panic("%s: Failed to allocate %zu bytes align=0x%lx\n",
 		      __func__, alloc_size, PAGE_SIZE);
 

The 1st patch still allowed the command line specified size of 256MB
SWIOTLB. So that means the 2nd patch causes the command line specified
256MB SWIOTLB size to be ignored and results in a 982MB SWIOTLB size
for the 16GB guest.

Thanks,
Tom

> 
> Thanks,
> Tom
> 
>>
>> Changes since v2:
>>  - fix a bisetion hazard that did not allocate the alloc_size array
>>  - dropped all patches already merged
>>
>> Changes since v1:
>>  - rebased to v5.12-rc1
>>  - a few more cleanups
>>  - merge and forward port the patch from Claire to move all the global
>>    variables into a struct to prepare for multiple instances
> 
