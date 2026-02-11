Return-Path: <linuxppc-dev+bounces-16797-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id tHn6IR0tjGl8iwAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16797-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Feb 2026 08:17:49 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F2781121D20
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Feb 2026 08:17:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f9qWs4JsNz2xlk;
	Wed, 11 Feb 2026 18:17:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770794265;
	cv=none; b=opoWRjgcyrWtIxUuBQThje9736Ob9x0ss2OQd5C8Z/iO+XVEPA0LajLdxdhfdtzoG+jQhQYGf5rxaPpKz+39IN2PwpDsF/997UOEUB1iGFO1LZP8qNZ/1K2RsT0XVx4CDI8L7eekcP7uge7h0LGHVQiWSZ/DDjSNkrk2MzJhEF21gH+T30yk4CgSJZFTWfuCv1lBZqZdBkiDQbnfcXfFM9AcMZab+fkoffFXLIUJBlvur0j6sovQagaeVim5TbKqpiv8QIaMavMZrieqtNbiW5u+vofzjXsvOsM8mLHFCpfYI0mu8b2jpkZDaUzbWZh2fSg3UiUW9TfJg60X/SJ/Lg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770794265; c=relaxed/relaxed;
	bh=rOrabWDWlsl4i0N/Sz+/mAPq29P2YHk3fkva++SGgpM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OIgUtToc7IXUa5UBRaUzR2fNsQYVYDSQZDjY8ZkuLuQfb2dGul4p5Dazv9/d/rFC0FbslkSL/UITQSou4PEQsm8nvgzUE8LIq6eL4ZfkEPJZlEI/Vg9jdfaNU/RR1rZGDym8aMbYvoKcveSAc4i24TvxQe0sCyICR03osZFLrceZBZBkPP1iwrm0ERDBBtE/i0XQv07Btn9UUdeIBY0n4SPrUvCYpXhOB3t4LpgCNEDj/NM4zyHpvz2+mQWDWjAtE9MrLaQ36C3jO9d4x6rTRH1A90WfR2toHq3KtD0/O668lpOPyVzrmve5X+pJySECqtI2VdTBuql2P4L3ml22LA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=CMECliyx; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=CMECliyx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f9qWr1pKxz2xSb
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Feb 2026 18:17:43 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61ANxSQG205004;
	Wed, 11 Feb 2026 07:17:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=rOrabW
	DWlsl4i0N/Sz+/mAPq29P2YHk3fkva++SGgpM=; b=CMECliyxsizS/zv08+VezE
	WDW222P54qiJdRbQiqLCVwReoBO1vg0urDHlPx4h8aufnDn/Oe45biVqmiXzLACd
	Y1z/RQ19v5dz8h4wZPvI03eobZpAmYuwtEGavxsoXMyKHb0QQHPulqxjHmktbVm5
	l1HvUaTqQMQf2q+64D8ccVcsfNGa1iFtwbJAW7OKcbpYlj1ushvtJnyDBXv6x6aI
	6abYyvdapD92faXLvjcwqOmOo5iXgbJs9a1gLCj5FGKwHcR4UoaAtlSxbY1KZq6B
	klDJIDN6+Xcsp371IghFNJuCiOu57nULyZLJNo2SmyxTsrmHZW2e2i+F3t7RqT2A
	==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4c696v5j2t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Feb 2026 07:17:23 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 61B6VU9h001873;
	Wed, 11 Feb 2026 07:17:22 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4c6je24hn9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Feb 2026 07:17:22 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 61B7HDJR50594252
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 11 Feb 2026 07:17:13 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 715922004D;
	Wed, 11 Feb 2026 07:17:13 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9B58320040;
	Wed, 11 Feb 2026 07:17:11 +0000 (GMT)
Received: from [9.109.204.116] (unknown [9.109.204.116])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 11 Feb 2026 07:17:11 +0000 (GMT)
Message-ID: <a66d659f-320a-4307-ac01-7d0bc3119ec7@linux.ibm.com>
Date: Wed, 11 Feb 2026 12:47:28 +0530
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
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] powerpc/crash: sort crash memory ranges before preparing
 elfcorehdr
To: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
        linuxppc-dev@lists.ozlabs.org
Cc: Andrew Morton <akpm@linux-foundation.org>, Baoquan he <bhe@redhat.com>,
        Jinjie Ruan <ruanjinjie@huawei.com>,
        Hari Bathini <hbathini@linux.ibm.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Mahesh Salgaonkar <mahesh@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Shivang Upadhyay <shivangu@linux.ibm.com>,
        linux-kernel@vger.kernel.org
References: <20260210120803.433978-1-sourabhjain@linux.ibm.com>
 <875x840x6v.ritesh.list@gmail.com>
Content-Language: en-US
From: Sourabh Jain <sourabhjain@linux.ibm.com>
In-Reply-To: <875x840x6v.ritesh.list@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: XJxWFGKelXzlrQo5w0R1AdsF4P70HYEL
X-Proofpoint-ORIG-GUID: eb2mMYKf5IIQdWLtJaB6U4NrADWkpV5L
X-Authority-Analysis: v=2.4 cv=JdWxbEKV c=1 sm=1 tr=0 ts=698c2d03 cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=VwQbUJbxAAAA:8
 a=i0EeH86SAAAA:8 a=VnNF1IyMAAAA:8 a=Z4Rwk6OoAAAA:8 a=20KFwNOVAAAA:8
 a=pGLkceISAAAA:8 a=5dAAW_aV5X8ElluqeskA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=HkZW87K1Qel5hWWM3VKY:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjExMDA1OCBTYWx0ZWRfXzuuMRXLvxnyQ
 y6VlO5PJ6625LsCxLncr7QwaPj1bM0eTD5iO9KY8Xvr9SE6/zYLPOZKCEckoulWs+j+nAJzA+D8
 zORV/ISKptegt9a63m6girx5J4v1q8YyiqQmTrnOxgT+SbTNenHjYVQ4vsvpl3K7d1fwBbp+48r
 sRHyquGvebgyrDfjs6Szy6VwXiQfFnCLka1ChsKZEweZ5tNMY7D0qBZIHSW99YOE+CweKlqJfXI
 LbO1Lh9nV4q+qH0QpNMrqEWd7Jt1gCp58SX9m3TKHPGDcpx3/VQyBmzQT3EBEml9MUJMzdgdo7o
 FzJNUl82Ad/9fhp5Xm9fBGGxRX9+QekXw2qGkuyHeguCq6kcYHg74ZGZohDh0WR9j/3eGRgKm3v
 lAJr6Olt9KobAZtTLl8+l0K49iPno1nkK3nz5rPz9cMgXHEFLizjaKHWTit4bggEtT2TlnOhiBm
 xyvzuBO0cS8h5ijZx/g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-10_03,2026-02-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 impostorscore=0 bulkscore=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 spamscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602110058
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ibm.com,none];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[ibm.com:s=pp1];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-16797-lists,linuxppc-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,lists.ozlabs.org];
	FORGED_SENDER(0.00)[sourabhjain@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:ritesh.list@gmail.com,m:linuxppc-dev@lists.ozlabs.org,m:akpm@linux-foundation.org,m:bhe@redhat.com,m:ruanjinjie@huawei.com,m:hbathini@linux.ibm.com,m:maddy@linux.ibm.com,m:mahesh@linux.ibm.com,m:mpe@ellerman.id.au,m:shivangu@linux.ibm.com,m:linux-kernel@vger.kernel.org,m:riteshlist@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns,huawei.com:email,ellerman.id.au:email,linux.ibm.com:mid];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_NEQ_ENVFROM(0.00)[sourabhjain@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ibm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: F2781121D20
X-Rspamd-Action: no action



On 11/02/26 09:05, Ritesh Harjani (IBM) wrote:
> Sourabh Jain <sourabhjain@linux.ibm.com> writes:
>
>> During a memory hot-remove event, the elfcorehdr is rebuilt to exclude
>> the removed memory. While updating the crash memory ranges for this
>> operation, the crash memory ranges array can become unsorted. This
>> happens because remove_mem_range() may split a memory range into two
>> parts and append the higher-address part as a separate range at the end
>> of the array.
>>
>> So far, no issues have been observed due to the unsorted crash memory
>> ranges. However, this could lead to problems once crash memory range
>> removal is handled by generic code, as introduced in the upcoming
>> patches in this series.
> Do you have the link of the discussion, to where you have pointed about,
> what sort of problems this unsorted memory ranges might bring up with
> the new patch series?

No, we didn’t discuss this anywhere. This occurred to me while I
was reviewing [1].

The issue is that [1] moves the exclusion of crashkernel reserved
memory into a generic function. With [1] included, the architecture
prepares the initial set of crash_mem ranges, and later the generic
function removes the crashkernel memory range from those crash_mem
ranges by calling crash_exclude_mem_range().

crash_exclude_mem_range() expects the crash_mem ranges to be sorted,
but that may not be true on powerpc if the ranges come from the
hotplug remove path, where remove_mem_range() is called to exclude
the hot-removed memory range.


[1] 
https://lore.kernel.org/all/20260209095931.2813152-1-ruanjinjie@huawei.com/
>
>
>> Currently, powerpc uses a platform-specific function,
>> remove_mem_range(), to exclude hot-removed memory from the crash memory
>> ranges. This function performs the same task as the generic
>> crash_exclude_mem_range() in crash_core.c. The generic helper also
>> ensures that the crash memory ranges remain sorted. So remove the
>> redundant powerpc-specific implementation and instead call
>> crash_exclude_mem_range_guarded() (which internally calls
>> crash_exclude_mem_range()) to exclude the hot-removed memory ranges.
>>
>> Cc: Andrew Morton <akpm@linux-foundation.org>
>> Cc: Baoquan he <bhe@redhat.com>
>> Cc: Jinjie Ruan <ruanjinjie@huawei.com>
>> Cc: Hari Bathini <hbathini@linux.ibm.com>
>> Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
>> Cc: Mahesh Salgaonkar <mahesh@linux.ibm.com>
>> Cc: Michael Ellerman <mpe@ellerman.id.au>
>> Cc: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
>> Cc: Shivang Upadhyay <shivangu@linux.ibm.com>
>> Cc: linux-kernel@vger.kernel.org
>> Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
>> ---
>>
>> Requesting this patch to part of the below patch series.
>> https://lore.kernel.org/all/20260209095931.2813152-1-ruanjinjie@huawei.com/
>>
>> ---
>>   arch/powerpc/include/asm/kexec_ranges.h |  4 +-
>>   arch/powerpc/kexec/crash.c              |  5 +-
>>   arch/powerpc/kexec/ranges.c             | 87 +------------------------
>>   3 files changed, 7 insertions(+), 89 deletions(-)
>>
>> diff --git a/arch/powerpc/include/asm/kexec_ranges.h b/arch/powerpc/include/asm/kexec_ranges.h
>> index 14055896cbcb..ad95e3792d10 100644
>> --- a/arch/powerpc/include/asm/kexec_ranges.h
>> +++ b/arch/powerpc/include/asm/kexec_ranges.h
>> @@ -7,7 +7,9 @@
>>   void sort_memory_ranges(struct crash_mem *mrngs, bool merge);
>>   struct crash_mem *realloc_mem_ranges(struct crash_mem **mem_ranges);
>>   int add_mem_range(struct crash_mem **mem_ranges, u64 base, u64 size);
>> -int remove_mem_range(struct crash_mem **mem_ranges, u64 base, u64 size);
>> +int crash_exclude_mem_range_guarded(struct crash_mem **mem_ranges,
>> +				    unsigned long long mstart,
>> +				    unsigned long long mend);
>>   int get_exclude_memory_ranges(struct crash_mem **mem_ranges);
>>   int get_reserved_memory_ranges(struct crash_mem **mem_ranges);
>>   int get_crash_memory_ranges(struct crash_mem **mem_ranges);
>> diff --git a/arch/powerpc/kexec/crash.c b/arch/powerpc/kexec/crash.c
>> index a325c1c02f96..31462e8415ff 100644
>> --- a/arch/powerpc/kexec/crash.c
>> +++ b/arch/powerpc/kexec/crash.c
>> @@ -431,7 +431,7 @@ static void update_crash_elfcorehdr(struct kimage *image, struct memory_notify *
>>   	struct crash_mem *cmem = NULL;
>>   	struct kexec_segment *ksegment;
>>   	void *ptr, *mem, *elfbuf = NULL;
>> -	unsigned long elfsz, memsz, base_addr, size;
>> +	unsigned long elfsz, memsz, base_addr, size, end;
>>   
>>   	ksegment = &image->segment[image->elfcorehdr_index];
>>   	mem = (void *) ksegment->mem;
>> @@ -450,7 +450,8 @@ static void update_crash_elfcorehdr(struct kimage *image, struct memory_notify *
>>   	if (image->hp_action == KEXEC_CRASH_HP_REMOVE_MEMORY) {
>>   		base_addr = PFN_PHYS(mn->start_pfn);
>>   		size = mn->nr_pages * PAGE_SIZE;
>> -		ret = remove_mem_range(&cmem, base_addr, size);
>> +		end = base_addr - size - 1;
>
> end should be "base_addr + size - 1", isn't it?

oops, my bad. I will fix it in v2.


Thanks for the review, Ritesh.
>
>
>> +		ret = crash_exclude_mem_range_guarded(&cmem, base_addr, end);
>>   		if (ret) {
>>   			pr_err("Failed to remove hot-unplugged memory from crash memory ranges\n");
>>   			goto out;
> -ritesh


