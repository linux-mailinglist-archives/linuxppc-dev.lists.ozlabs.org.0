Return-Path: <linuxppc-dev+bounces-14922-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 15F33CD3130
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Dec 2025 15:51:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dYS6L1TpSz2yFQ;
	Sun, 21 Dec 2025 01:51:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1766242314;
	cv=none; b=Fqzi9Je/EbY0HSZYddqZZK51qaj1eK0mCd0FF+YKpyyDVgx824hhbJzlNq7lRz7xNIbdIdQe7hFwp76pFvpB7mDkwp/usGF5pvl4F6JLk8Ilgu8erHMxC24E4GSHOv/PMl0iWGFB3ENkunxoeKi1iuVsJ4deAA0T7Bs4mSyWhYYzjvcXu9PS03WSu7nBBC+tGm604iGZD5RKg5xHbog1LCCyKLqGEmaxIdferP0b84JJlR/Z01eoEVv56kM33Gj+BLUEHJn0Y743tUlQnxSsv3okD4CowK+qZgnXZIfus2dP9sEnBkCTfHgKQmbbp1A3pyFuTlsf+LbvDrnjrcD1BA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1766242314; c=relaxed/relaxed;
	bh=djfhIuJvYr8fZjpwPdnh6ePE1iA9EV9e5HBHaApl7YE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VKsjBpSk6oZmK3IwFC7NdwPcpvgQPj0qI/Y9Kwc8q03KPRklvYFB/NdegW6ahCKDQ5IyiHxjItzOsCA33bpeUemSpLenIbtj+/XtbA4W3lGunoMMcZxGSsXPxe5z0uXTYZO5yebLjql6RxXEkotHUK7a2rCO/fBbEWKuiANjYlJDzb0Hh4NXa+KxzkaDtU321ueCS7+reLHl7WKfR9Sv6kjAsuzmJhj007Ocxsa/JCiFqSjOJs7ClNp2fsaOsn02RLHNnssnjg+5q8Np3eTvp+Jv111xb31XvaIAWns5fcGY5Ussk0f+uO+c33cQpnATF7B11TXYSDx9wlBVbKTgiA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=dxSCe++J; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=dxSCe++J;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dYS6J2wXxz2xlF
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 21 Dec 2025 01:51:51 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5BK2u2OC016773;
	Sat, 20 Dec 2025 14:50:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=djfhIu
	JvYr8fZjpwPdnh6ePE1iA9EV9e5HBHaApl7YE=; b=dxSCe++Jf2cc1xWe9cI8+q
	8VhoG/4hiDU81tLrM9wnVlYBVLxkcVtNq0/dbohCXCiKgDI8/F6h0DuegrzDndXk
	kcMHdpnBrgZGYIbb5lvFhr0fH/y05s1M1aeWsvCZpJfP6J8paz7ZAiAMqSEXgU4f
	ubBxEFHG0+FaAlGY8Vmvjy3ychYjHG51gFCok4DTFsBUv0vd1o1KbY/IM0Y8afCD
	ZDkopg94qC8GTbx7rMCvt4lZwiFj+o2HQ5TqWNasPOxdL+rnRCaBW5fZA2ALjFer
	gzhC6vtNAK6BOU/V+fkO5QdRDw0wyu9sAwrbOXB2lauLrqOWFOZCiIRa4deC25lw
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4b5kethexa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 20 Dec 2025 14:50:55 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5BKEosAG001104;
	Sat, 20 Dec 2025 14:50:54 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4b5kethex8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 20 Dec 2025 14:50:54 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5BK954Q5006164;
	Sat, 20 Dec 2025 14:50:53 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4b4qvqrrw0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 20 Dec 2025 14:50:53 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5BKEonUX31588812
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 20 Dec 2025 14:50:49 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8AC7C2004B;
	Sat, 20 Dec 2025 14:50:49 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0ACF420040;
	Sat, 20 Dec 2025 14:50:46 +0000 (GMT)
Received: from [9.124.209.127] (unknown [9.124.209.127])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sat, 20 Dec 2025 14:50:45 +0000 (GMT)
Message-ID: <a2bc427d-a41c-4b8f-b006-021390ff0070@linux.ibm.com>
Date: Sat, 20 Dec 2025 20:20:44 +0530
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
Subject: Re: [PATCH v5] mm/hugetlb: ignore hugepage kernel args if hugepages
 are unsupported
To: "David Hildenbrand (Red Hat)" <david@kernel.org>,
        linux-kernel@vger.kernel.org
Cc: Andrew Morton <akpm@linux-foundation.org>, Borislav Petkov
 <bp@alien8.de>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Heiko Carstens <hca@linux.ibm.com>, Ingo Molnar <mingo@redhat.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Muchun Song <muchun.song@linux.dev>,
        Oscar Salvador <osalvador@suse.de>,
        "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Vasily Gorbik <gor@linux.ibm.com>, linux-mm@kvack.org,
        linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
        x86@kernel.org, linux-riscv@lists.infradead.org
References: <20251218114154.228484-1-sourabhjain@linux.ibm.com>
 <83920c44-47f5-4a46-bfa7-76713197d7e4@kernel.org>
 <1fddcf72-26f7-4fb4-84b8-1328e486d58e@linux.ibm.com>
 <64a9ca24-2968-4532-ac04-594c340ec2a2@kernel.org>
Content-Language: en-US
From: Sourabh Jain <sourabhjain@linux.ibm.com>
In-Reply-To: <64a9ca24-2968-4532-ac04-594c340ec2a2@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: -UJ_23oZBmFZhfvHtHo9iau46cSaqYPO
X-Authority-Analysis: v=2.4 cv=Qdxrf8bv c=1 sm=1 tr=0 ts=6946b7cf cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=z6Ez1-wMAixVQXjHHx4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: EIWVDUCMc9Mrg17J49sUpCdeutt-GuAL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIwMDEyNyBTYWx0ZWRfX1+huJTyQIbeo
 no9LO/EePOuyWY0Qs78ZfePtdlkwmKgnzx5jBZObrMuKxOyrfYlTYF3BN+3NJVMPqtsAvxUU+9Y
 wjG92PrqHSel+FQFGRaCGHi+PReMrcJc9bfI56RtoJ/WaxUXqSyXBwzuZ9hlzQiYdvrOUKGyarP
 UNMex/W0oJmqmhKn6vDN5nUTXXPjQga6nJ1Yf1S7NmUV3DcvSeninTQwBQMhSIpmvBmgprGPEx0
 LKIBT+0iV/uX8x5r8yQLxAZVmlM/5jrYVemys26LU8bEu/5Ad6MMwnWTWztK0aEpMXxq/YVTZPk
 OP25uBUwHptUDNSvIRgHXlZYbbL/m7m0Cn/xrYSE44X3ZkMa5s5HC/fodbo6C18T1SCToTVO3Pu
 PktBc5LbgoaID+BINaW097kiiNX7Xki+zD2+bXyVWRnnVBN9/nggJ8iV1V4IgqtX0MxB3XYAVbT
 +4pdLD2EAQy96bAU+tA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-20_03,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 phishscore=0 impostorscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2512120000 definitions=main-2512200127
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On 19/12/25 11:43, David Hildenbrand (Red Hat) wrote:
> On 12/18/25 14:06, Sourabh Jain wrote:
>>
>>
>> On 18/12/25 17:32, David Hildenbrand (Red Hat) wrote:
>>> On 12/18/25 12:41, Sourabh Jain wrote:
>>>> Skip processing hugepage kernel arguments (hugepagesz, hugepages, and
>>>> default_hugepagesz) when hugepages are not supported by the
>>>> architecture.
>>>>
>>>> Some architectures may need to disable hugepages based on conditions
>>>> discovered during kernel boot. The hugepages_supported() helper allows
>>>> architecture code to advertise whether hugepages are supported.
>>>>
>>>> Currently, normal hugepage allocation is guarded by
>>>> hugepages_supported(), but gigantic hugepages are allocated regardless
>>>> of this check. This causes problems on powerpc for fadump (firmware-
>>>> assisted dump).
>>>>
>>>> In the fadump (firmware-assisted dump) scenario, a production kernel
>>>> crash causes the system to boot into a special kernel whose sole
>>>> purpose is to collect the memory dump and reboot. Features such as
>>>> hugepages are not required in this environment and should be
>>>> disabled.
>>>>
>>>> For example, fadump kernel booting with the kernel arguments
>>>> default_hugepagesz=1GB hugepagesz=1GB hugepages=200 prints the
>>>> following logs:
>>>>
>>>> HugeTLB: allocating 200 of page size 1.00 GiB failed.  Only allocated
>>>> 58 hugepages.
>>>> HugeTLB support is disabled!
>>>> HugeTLB: huge pages not supported, ignoring associated command-line
>>>> parameters
>>>> hugetlbfs: disabling because there are no supported hugepage sizes
>>>>
>>>> Even though the logs say that hugetlb support is disabled, gigantic
>>>> hugepages are still getting allocated, which causes the fadump kernel
>>>> to run out of memory during boot.
>>>
>>> Yeah, that's suboptimal.
>>>
>>>>
>>>> To fix this, the gigantic hugepage allocation should come under
>>>> hugepages_supported().
>>>>
>>>> To bring gigantic hugepage allocation under hugepages_supported(), two
>>>> approaches were previously proposed:
>>>> [1] Check hugepages_supported() in the generic code before allocating
>>>> gigantic hugepages.
>>>> [2] Make arch_hugetlb_valid_size() return false for all hugetlb sizes.
>>>>
>>>> Approach [2] has two minor issues:
>>>> 1. It prints misleading logs about invalid hugepage sizes
>>>> 2. The kernel still processes hugepage kernel arguments unnecessarily
>>>>
>>>> To control gigantic hugepage allocation, it is proposed to skip
>>>> processing the hugepage kernel arguments (hugepagesz, hugepages, and
>>>> default_hugepagesz) when hugepages_support() returns false.
>>>
>>> You could briefly mention the new output here, so one has a
>>> before-after comparison.
>>
>> Here is the fadump kernel boot logs after this patch applied:
>> kernel command had: default_hugepagesz=1GB hugepagesz=1GB hugepages=200
>>
>> HugeTLB: hugepages unsupported, ignoring default_hugepagesz=1GB cmdline
>> HugeTLB: hugepages unsupported, ignoring hugepagesz=1GB cmdline
>> HugeTLB: hugepages unsupported, ignoring hugepages=200 cmdline
>> HugeTLB support is disabled!
>> hugetlbfs: disabling because there are no supported hugepage sizes
>>
>> I will wait for a day or two before sending v2 with the above logs
>> included in
>> the commit message.
>>
>>>
>>> Curious, should we at least add a Fixes: tag? Allocating memory when
>>> it's completely unusable sounds wrong.
>>
>> Not sure which commit I should use for Fixes. This issue has
>> been present for a long time, possibly since the beginning.
>
> I don't know the full history, but I would assume that support for 
> gigantic pages was added later?
>
> It would be great if you could dig a bit so we could add a Fixes:.

The below commit removed the hugepages_supported() call from all three
command-line parsing functions, which inadvertently created an issue
for fadump that my changes attempt to fix.

https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=c2833a5bf75b3657c4dd20b3709c8c702754cb1f

I will add fixes tag on above commit and send the next version.

- Sourabh Jain

