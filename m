Return-Path: <linuxppc-dev+bounces-14934-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A8BE7CD4BA9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Dec 2025 06:40:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dZRmx1Mh4z2yFb;
	Mon, 22 Dec 2025 16:40:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1766382017;
	cv=none; b=J5clU5A2yYkLvGXYp5H+ay6U0Db/4mZRJFKX8R59dVxfmdXeNHykRn9bDIjNCtA1qfUPaZiX9a9C6bK2eogg+fjhh/Ekp7LacADyEHYyTIDMK/A5N7NdgFJaGy7+cocL4E+iJlMux60SR/ILcSWjFx/5+c+uRPfEaXrMbCY+GfhlXV7dtRzg5ZPMr54QJhfOo0wkJcupMn4oFsJ9ao2XjqAjSXzDkfP4qJDacrFlBBD0FC/+ZFRIZLQuIBusn3zN0lOUNk2xRmRo5QkRk+LS4h6RTpHFUs/qE0hRVWm936AJXKG3Xr22+LUYY1/RQ7av7SeIzmuDxr888h77H2Aq0A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1766382017; c=relaxed/relaxed;
	bh=bPrvbESkSgpp2WWexJD4gcdzcojzOAas7o1H9mduoIs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Nq5MVFHu92L8uvudoiexm95YZy0CnsDqXEgCa7GaS8ywPH+cQqLuF6I4Caj8/r750xT3q6TaWXs99/hWfItMgOI8Z+OuSGKKCyJwrserHuo/b7t7RjGjTwWZt+DatEPnpaIlz5wT0pvDqw9WDt0u5y/cpOylMqU5Yj96iOHek3D6hUZB68SyOn8jt/r/xfov6RP+iOVE+TCkiLPjngjND3FFkVKIFTRxGmGy+SL9KXALE1zgNXYSJjnvJP08n9ljFhKPsH+YKCG+vMbJ38L0pQ+mFMNvTVmSgEtvaohc0ywcx62zILktYuSCK0DfMsCN4RfeGHxDdAZCrziVl0tAlg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=UTYePHwr; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=UTYePHwr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dZRmw1LGVz2xnl
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Dec 2025 16:40:15 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5BLNjF83013087;
	Mon, 22 Dec 2025 05:39:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=bPrvbE
	SkSgpp2WWexJD4gcdzcojzOAas7o1H9mduoIs=; b=UTYePHwrRVJJT8bAG4yalB
	aMGC1zn6wFxfkDesL0EL4u0sNEtqEB8bLLVa0yVhNf0Dj8P2DgVQATZXW/9O2Jf8
	KtxNC7oEKzdGE4F0HJx7xaw94vF81AM5NdZGAB/F8vg5dnnHzCYrQjCHHbmEaSCu
	2pY9M4iaAqtiXefjnEHSOjgVupBES/ei1c2gU8sNjW/SurGnIYrJIYNBQMhskYdq
	XXe1WUaXzD/1n75TeL9kXvr4bgq3sozantlWBx+Zf4FHgOI7LET+8m7jU4uIDleh
	+xRwB5slFlZLP5JNNK6MKrLO1+DYpxEdhBN4ldMfmeiJDKP8eeFjS8iZiNt3S1xw
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4b5kh46dhp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 22 Dec 2025 05:39:15 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5BM5dFER009164;
	Mon, 22 Dec 2025 05:39:15 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4b5kh46dhk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 22 Dec 2025 05:39:15 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5BM256AH032274;
	Mon, 22 Dec 2025 05:39:14 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4b68u0v5mx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 22 Dec 2025 05:39:14 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5BM5d90m45482272
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 22 Dec 2025 05:39:09 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2ACE020043;
	Mon, 22 Dec 2025 05:39:09 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 44B0C20040;
	Mon, 22 Dec 2025 05:39:05 +0000 (GMT)
Received: from [9.124.208.188] (unknown [9.124.208.188])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 22 Dec 2025 05:39:04 +0000 (GMT)
Message-ID: <25467781-3b81-4a6b-87d3-91bcb4f42aab@linux.ibm.com>
Date: Mon, 22 Dec 2025 11:09:04 +0530
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
Subject: Re: [PATCH v6] mm/hugetlb: ignore hugepage kernel args if hugepages
 are unsupported
To: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Borislav Petkov
 <bp@alien8.de>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Heiko Carstens <hca@linux.ibm.com>, Ingo Molnar <mingo@redhat.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Muchun Song <muchun.song@linux.dev>,
        Oscar Salvador <osalvador@suse.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Vasily Gorbik <gor@linux.ibm.com>, linux-mm@kvack.org,
        linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
        x86@kernel.org, linux-riscv@lists.infradead.org,
        "David Hildenbrand (Red Hat)" <david@kernel.org>,
        linux-kernel@vger.kernel.org
References: <20251221053611.441251-1-sourabhjain@linux.ibm.com>
 <87a4zcml36.ritesh.list@gmail.com>
Content-Language: en-US
From: Sourabh Jain <sourabhjain@linux.ibm.com>
In-Reply-To: <87a4zcml36.ritesh.list@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=bulBxUai c=1 sm=1 tr=0 ts=6948d983 cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8 a=E0RgZOrFmug6THL7l80A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: THFbMRSaiISb1s41jq2UWF0mx8OZh7pJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIyMDA0NSBTYWx0ZWRfX0vXp8Po2cnuP
 m+ATDiOSQgBQtxY7ucShSj4isWiaJ+dnupb64+UuNNvx7BpOPFxmsPI/dr8sRrSZLQMCrAhbgGJ
 Uu7SgNpXam9GF3O+r40dxFPMe71em5mFnXmoXlHHBL9fQV7wRr5sVVscsmkQkMkPU+NZYBgb1vY
 pkHeECDtvgYIAnZiz/hS4yeA2oroC+STJEUF8X/7/C529p1lIFK+StUf3jwELrV0IUR12YUQoYd
 DjFNMmeT+Q6D1ddTpvUFpJjfN1tIBek3Xs11jbJ1fxTLZkgqkHW9fplE0bD2cw6sOMUEULSKaiv
 XPszuYY6x7IoTTVeNZ2bU8qlpiOdq3Wk7EguN6bXyVVYoEe1BzGnENd6CTG9RH2hY6Z1LYGtxup
 W1iWC7jzVgexG3XnHHyTkuzp4yky4GaK7H/9nh2ewyvpPd+oTWyYVlvkgmotyS21stSizlVVrI/
 udkDWLFG8UzqTYVWzIA==
X-Proofpoint-GUID: mL7M4Ewt3ZJPWfnEqof-eoMUjrtkqty-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-21_05,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 spamscore=0 malwarescore=0 bulkscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2512120000
 definitions=main-2512220045
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On 21/12/25 11:29, Ritesh Harjani (IBM) wrote:
> Hi Sourabh,
>
> Sourabh Jain <sourabhjain@linux.ibm.com> writes:
>
>> Skip processing hugepage kernel arguments (hugepagesz, hugepages, and
>> default_hugepagesz) when hugepages are not supported by the
>> architecture.
>>
>> Some architectures may need to disable hugepages based on conditions
>> discovered during kernel boot. The hugepages_supported() helper allows
>> architecture code to advertise whether hugepages are supported.
>>
>> Currently, normal hugepage allocation is guarded by
>> hugepages_supported(), but gigantic hugepages are allocated regardless
>> of this check. This causes problems on powerpc for fadump (firmware-
>> assisted dump).
>>
>> In the fadump (firmware-assisted dump) scenario, a production kernel
>> crash causes the system to boot into a special kernel whose sole
>> purpose is to collect the memory dump and reboot. Features such as
>> hugepages are not required in this environment and should be
>> disabled.
>>
>> For example, when the fadump kernel boots with the following kernel
>> arguments:
>> default_hugepagesz=1GB hugepagesz=1GB hugepages=200
>>
>> Before this patch, the kernel prints the following logs:
>>
>> HugeTLB: allocating 200 of page size 1.00 GiB failed.  Only allocated 58 hugepages.
>> HugeTLB support is disabled!
>> HugeTLB: huge pages not supported, ignoring associated command-line parameters
>> hugetlbfs: disabling because there are no supported hugepage sizes
>>
>> Even though the logs state that HugeTLB support is disabled, gigantic
>> hugepages are still allocated. This causes the fadump kernel to run out
>> of memory during boot.
>>
>> After this patch is applied, the kernel prints the following logs for
>> the same command line:
>>
>> HugeTLB: hugepages unsupported, ignoring default_hugepagesz=1GB cmdline
>> HugeTLB: hugepages unsupported, ignoring hugepagesz=1GB cmdline
>> HugeTLB: hugepages unsupported, ignoring hugepages=200 cmdline
>> HugeTLB support is disabled!
>> hugetlbfs: disabling because there are no supported hugepage sizes
>>
>> To fix the issue, gigantic hugepage allocation should be guarded by
>> hugepages_supported().
>>
>> Previously, two approaches were proposed to bring gigantic hugepage
>> allocation under hugepages_supported():
>>
>> [1] Check hugepages_supported() in the generic code before allocating
>> gigantic hugepages
>> [2] Make arch_hugetlb_valid_size() return false for all hugetlb sizes
>>
>> Approach [2] has two minor issues:
>> 1. It prints misleading logs about invalid hugepage sizes
>> 2. The kernel still processes hugepage kernel arguments unnecessarily
>>
>> To control gigantic hugepage allocation, skip processing hugepage kernel
>> arguments (default_hugepagesz, hugepagesz and hugepages) when
>> hugepages_supported() returns false.
>>
>> Link: https://lore.kernel.org/all/20250121150419.1342794-1-sourabhjain@linux.ibm.com/ [1]
>> Link: https://lore.kernel.org/all/20250128043358.163372-1-sourabhjain@linux.ibm.com/ [2]
>> Fixes: c2833a5bf75b ("hugetlbfs: fix changes to command line processing")
>
> I appreciate our proactiveness to respond quickly on mailing list, but I
> suggest we give enough time to folks before sending the next version
> please ;).

I agree that I posted the v6 too quickly. I will avoid that in future.

>
> Your email from last night [1] says that we will use this fixes tag but
> you haven't even given us 24hrs to respond to that email thread :). Now
> we've sent this v6, with Acked-by of David and Reviewed-by of mine,
> which seems like everything was agreed upon, but that isn't the case
> actually.

Yes, you are right. I should have waited until the discussion about the
Fixes tag was finished.

Thanks for pointing out things Ritesh.

- Sourabh Jain

