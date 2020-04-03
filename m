Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9979B19CF87
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Apr 2020 06:47:47 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48tnVS5TmKzDrYX
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Apr 2020 15:47:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.70.90;
 helo=nam04-sn1-obe.outbound.protection.outlook.com;
 envelope-from=hoan@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=os.amperecomputing.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com
 header.a=rsa-sha256 header.s=selector2 header.b=C/RN0huH; 
 dkim-atps=neutral
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700090.outbound.protection.outlook.com [40.107.70.90])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48tnSt0s6HzDqCZ
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Apr 2020 15:46:19 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jGpMKVIkwAdXntA2yf2j03qE+409aE5cQ+wmaNuD0yluA4BPkyk/8IBlDVDqowBm1VR9ASmABGKz5Z2pIT0PfNKJM8+FXaYn/LCigUCElTbDjmwFFfejJiO/NPjJI1B2U2fKJmZPRyEp1Mix8eMcrVBC4UMDOlPNhD6VhaGbeeI0IBSnKa5GpTO18nAFhiNKaW5SfuTRgirP64qoEj4wP2txQMY85qdbeASaQz43yWm3eeftndYeceOuhhIZfi8RLIuXHL+KJ6rNPSvUOkTIwd0wS8r36iljEw9r/5kxjRABFsOPZABuC/ExQbdETFNK3JOI3qghD3gvvCTcD0fjsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lxoh9T0pU6vFadEAAtqvcqN0XObwhZl1NRyNPPOYH3A=;
 b=m6N4psEmBdmldgviaoFFI4cqLtoEqjvnhqmfW35eVf78OF3U2ZijusByJ967Mjh0kKhyJz7AZUgPFAUh6T3Z8KI2kA3cXw97+F1bzKxrhCVnZCO6wO/A9NkRurgrBnlmRg0P7UVx2L/75qzgeC1R3SxLhB/b4imdNqvoxmCj6oupctXlJFIe8V7w6HgP3z96efce60rFIPB4xsKnA66I3Fj6NoVvUYB03ER9Z4tRWCr1IP2GfNTl1/q9tyWzpZW9fHZ5bSkflko2xB2N3xrft6In4bgd7Q+TkhM708eKAGchZnzk9+6qfrxU5RmysMS6I7ZI2EOLqXDP2NQtQ0NF0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lxoh9T0pU6vFadEAAtqvcqN0XObwhZl1NRyNPPOYH3A=;
 b=C/RN0huH0NuRbidJQBDNAXBPwsemozkVHAT7y5ar/8XuvXv/ZWRhB4P3Jr3Vv7m/jHrlw13NU8i5Np44vcLHutGQNF3S9Cce4gYxSisCiQU1HGGJ7ZILil1P/JqQtWtDkL8vgAnvCXb32ogzSsEtgZAHMLdfobHf+9Vph4tKyjM=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=hoan@os.amperecomputing.com; 
Received: from BYAPR01MB5494.prod.exchangelabs.com (2603:10b6:a03:127::30) by
 BYAPR01MB4824.prod.exchangelabs.com (2603:10b6:a03:8d::30) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2856.20; Fri, 3 Apr 2020 04:46:12 +0000
Received: from BYAPR01MB5494.prod.exchangelabs.com
 ([fe80::a979:b2e2:fdaf:1ccb]) by BYAPR01MB5494.prod.exchangelabs.com
 ([fe80::a979:b2e2:fdaf:1ccb%6]) with mapi id 15.20.2856.019; Fri, 3 Apr 2020
 04:46:11 +0000
Subject: Re: [PATCH v3 0/5] mm: Enable CONFIG_NODES_SPAN_OTHER_NODES by
 default for NUMA
To: Baoquan He <bhe@redhat.com>, Michal Hocko <mhocko@kernel.org>
References: <1585420282-25630-1-git-send-email-Hoan@os.amperecomputing.com>
 <20200330074246.GA14243@dhcp22.suse.cz>
 <20200330175100.GD30942@linux.ibm.com>
 <20200330182301.GM14243@dhcp22.suse.cz>
 <20200331081423.GE30942@linux.ibm.com>
 <20200331085513.GE30449@dhcp22.suse.cz>
 <20200331140332.GA2129@MiWiFi-R3L-srv>
 <20200331142138.GL30449@dhcp22.suse.cz>
 <20200331143140.GA2402@MiWiFi-R3L-srv>
From: Hoan Tran <hoan@os.amperecomputing.com>
Message-ID: <cc717f09-2b18-b242-e438-3ec730c5dac0@os.amperecomputing.com>
Date: Thu, 2 Apr 2020 21:46:05 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.6.0
In-Reply-To: <20200331143140.GA2402@MiWiFi-R3L-srv>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CY4PR16CA0025.namprd16.prod.outlook.com
 (2603:10b6:910:60::12) To BYAPR01MB5494.prod.exchangelabs.com
 (2603:10b6:a03:127::30)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.138] (67.161.31.237) by
 CY4PR16CA0025.namprd16.prod.outlook.com (2603:10b6:910:60::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2878.15 via Frontend Transport; Fri, 3 Apr 2020 04:46:08 +0000
X-Originating-IP: [67.161.31.237]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5e55dba4-000d-4ff6-cf18-08d7d789ee75
X-MS-TrafficTypeDiagnostic: BYAPR01MB4824:|BYAPR01MB4824:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR01MB4824FDBC763485A1E2912745F1C70@BYAPR01MB4824.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-Forefront-PRVS: 0362BF9FDB
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR01MB5494.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10019020)(4636009)(396003)(366004)(39840400004)(136003)(346002)(376002)(186003)(5660300002)(316002)(52116002)(8936002)(2906002)(110136005)(81166006)(8676002)(81156014)(16576012)(54906003)(7416002)(2616005)(4326008)(66946007)(478600001)(107886003)(66476007)(26005)(86362001)(31696002)(31686004)(956004)(6486002)(66556008)(53546011)(16526019)(6666004);
 DIR:OUT; SFP:1102; 
Received-SPF: None (protection.outlook.com: os.amperecomputing.com does not
 designate permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oEEGCR2eMA4AgJBrJgAaQ8d2GNHB0KvR0ABG2D4vTV5A7EXhFGK2ZdPQdbioTSkdot8lZ08XJoleqxUiIw4ziEBXMxUR3FkIoe3te74eNbDYU2v6WSiMFlmQffu3Nhh1cVeubr4csCFB1IAxnU9qxi4p8YFIktAKRmyGT2nwg2I2siCVr87pLOYCQU3Q0RxgrMzrgFc31LIlkNtSAIWEzekkgSC1swTS6GskRbmjaDPAD/QXIZ0FNeSJlqjVREQGDjHwmEZibJQ2D2Jcxc1fA2bBaj4l2ibglN8K4HAMB0WVawWZVZTcd8vIOair3CZe6e6xhvXr6lWtZrAebE8jBMViXv1f1ohW5BXcqJ/6X9mFudgGCqsd2UzzXoQyLbNbTnOdI8idKoXxGL4ecOrOiDn9sP07wXWUrBl0XCk0FgJ/dGhppP4kQat0nJkl4Wbk
X-MS-Exchange-AntiSpam-MessageData: 7wnj+lh235edDCaZcVdSaJ5u2eDFJRFqdOznJbTFsgWrNxaS/8Bp85CCAlIWcr8ejUcMBHiCnk2GyX8gGmmLnuNo+sAIhCryV6woBok4IqTIkHwcEOoK2mQt6ZodYuRVY1A+AJs5Bj7wStEBiyV6fw==
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e55dba4-000d-4ff6-cf18-08d7d789ee75
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2020 04:46:11.5749 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zn6HjBwQUB2JO7TQfcSTSyt5aJE/Cmm+gW8VBrrM5iImE4ffuoNqHfYnt0n53H5nNsj12Sng3VUthH8wQOJgpRSNbTx+KZE/mGtrpbbCpUg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR01MB4824
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
Cc: mmorana@amperecomputing.com, Catalin Marinas <catalin.marinas@arm.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>,
 "open list:MEMORY MANAGEMENT" <linux-mm@kvack.org>,
 Paul Mackerras <paulus@samba.org>, "H. Peter Anvin" <hpa@zytor.com>,
 sparclinux@vger.kernel.org,
 Alexander Duyck <alexander.h.duyck@linux.intel.com>,
 linux-s390@vger.kernel.org, x86@kernel.org, Mike Rapoport <rppt@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Vlastimil Babka <vbabka@suse.cz>,
 Pavel Tatashin <pavel.tatashin@microsoft.com>, lho@amperecomputing.com,
 Vasily Gorbik <gor@linux.ibm.com>, Will Deacon <will.deacon@arm.com>,
 Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@linutronix.de>,
 linux-arm-kernel@lists.infradead.org, Oscar Salvador <osalvador@suse.de>,
 linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi All,

On 3/31/20 7:31 AM, Baoquan He wrote:
> On 03/31/20 at 04:21pm, Michal Hocko wrote:
>> On Tue 31-03-20 22:03:32, Baoquan He wrote:
>>> Hi Michal,
>>>
>>> On 03/31/20 at 10:55am, Michal Hocko wrote:
>>>> On Tue 31-03-20 11:14:23, Mike Rapoport wrote:
>>>>> Maybe I mis-read the code, but I don't see how this could happen. In the
>>>>> HAVE_MEMBLOCK_NODE_MAP=y case, free_area_init_node() calls
>>>>> calculate_node_totalpages() that ensures that node->node_zones are entirely
>>>>> within the node because this is checked in zone_spanned_pages_in_node().
>>>>
>>>> zone_spanned_pages_in_node does chech the zone boundaries are within the
>>>> node boundaries. But that doesn't really tell anything about other
>>>> potential zones interleaving with the physical memory range.
>>>> zone->spanned_pages simply gives the physical range for the zone
>>>> including holes. Interleaving nodes are essentially a hole
>>>> (__absent_pages_in_range is going to skip those).
>>>>
>>>> That means that when free_area_init_core simply goes over the whole
>>>> physical zone range including holes and that is why we need to check
>>>> both for physical and logical holes (aka other nodes).
>>>>
>>>> The life would be so much easier if the whole thing would simply iterate
>>>> over memblocks...
>>>
>>> The memblock iterating sounds a great idea. I tried with putting the
>>> memblock iterating in the upper layer, memmap_init(), which is used for
>>> boot mem only anyway. Do you think it's doable and OK? It yes, I can
>>> work out a formal patch to make this simpler as you said. The draft code
>>> is as below. Like this it uses the existing code and involves little change.
>>
>> Doing this would be a step in the right direction! I haven't checked the
>> code very closely though. The below sounds way too simple to be truth I
>> am afraid. First for_each_mem_pfn_range is available only for
>> CONFIG_HAVE_MEMBLOCK_NODE_MAP (which is one of the reasons why I keep
>> saying that I really hate that being conditional). Also I haven't really
>> checked the deferred initialization path - I have a very vague
>> recollection that it has been converted to the memblock api but I have
>> happilly dropped all that memory.
> 
> Thanks for your quick response and pointing out the rest suspect aspects,
> I will investigate what you mentioned, see if they impact.

I would like to check if we still move on with my patch to remove 
CONFIG_NODES_SPAN_OTHER_NODES and have another patch on top it?

Thanks
Hoan

> 
>>   
>>> diff --git a/mm/page_alloc.c b/mm/page_alloc.c
>>> index 138a56c0f48f..558d421f294b 100644
>>> --- a/mm/page_alloc.c
>>> +++ b/mm/page_alloc.c
>>> @@ -6007,14 +6007,6 @@ void __meminit memmap_init_zone(unsigned long size, int nid, unsigned long zone,
>>>   		 * function.  They do not exist on hotplugged memory.
>>>   		 */
>>>   		if (context == MEMMAP_EARLY) {
>>> -			if (!early_pfn_valid(pfn)) {
>>> -				pfn = next_pfn(pfn);
>>> -				continue;
>>> -			}
>>> -			if (!early_pfn_in_nid(pfn, nid)) {
>>> -				pfn++;
>>> -				continue;
>>> -			}
>>>   			if (overlap_memmap_init(zone, &pfn))
>>>   				continue;
>>>   			if (defer_init(nid, pfn, end_pfn))
>>> @@ -6130,9 +6122,17 @@ static void __meminit zone_init_free_lists(struct zone *zone)
>>>   }
>>>   
>>>   void __meminit __weak memmap_init(unsigned long size, int nid,
>>> -				  unsigned long zone, unsigned long start_pfn)
>>> +				  unsigned long zone, unsigned long range_start_pfn)
>>>   {
>>> -	memmap_init_zone(size, nid, zone, start_pfn, MEMMAP_EARLY, NULL);
>>> +	unsigned long start_pfn, end_pfn;
>>> +	unsigned long range_end_pfn = range_start_pfn + size;
>>> +	int i;
>>> +	for_each_mem_pfn_range(i, nid, &start_pfn, &end_pfn, NULL) {
>>> +		start_pfn = clamp(start_pfn, range_start_pfn, range_end_pfn);
>>> +		end_pfn = clamp(end_pfn, range_start_pfn, range_end_pfn);
>>> +		if (end_pfn > start_pfn)
>>> +			memmap_init_zone(size, nid, zone, start_pfn, MEMMAP_EARLY, NULL);
>>> +	}
>>>   }
>>>   
>>>   static int zone_batchsize(struct zone *zone)
>>
>> -- 
>> Michal Hocko
>> SUSE Labs
>>
> 
