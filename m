Return-Path: <linuxppc-dev+bounces-14896-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A2AC6CCEF2F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Dec 2025 09:22:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dXgX04KFgz2yFY;
	Fri, 19 Dec 2025 19:22:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1766132576;
	cv=none; b=Yj+esVl1eLsyhMJbPX/nxniVObWvHnS0CBK+P31kwrk0oeLRl9OSbPHL72DRCV610i85XxSTM7cusmHfLN7/2xZrqEtSqbUzhzBhGb5jm+oaHYnQtnPr5w7pw7LrhzLGLkHyismhmbkcNJc8ci6xPjyxcf4F82BQ3kO+8GaK5p6H5dc2VTezndB83oic42mX8OaFrPbbxEq4GxDrtlg7Mcr1xCjuAVxR4r1eCmWHGzPewZHL0YqOsbdunnlqUWQ+LmXlhu0OGdKyWfFW4Oqa9PXVJeBWiHUmgPYS0uJjpxoER/x9/otGwZAEJf1Z8zzd1iPw1+aengpmfvCsnnkNVA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1766132576; c=relaxed/relaxed;
	bh=6W3plN+ebcTGX0uV6ORb8fAOAbPv8HSPi9pqpKhBUug=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a0J5EyyMI0s/DIG+gRBlXI5HS9y0TGlSo6L+ZCJy1cUVvVMZ7HPk8l2jzEOKYSlhi9iondmgfzSzFSiMVl800QcGWrF/W9Vfb2EDRKgyOCwN+uB197aChFTmGifov+ThtwI1Dd49IvrIrhx6wkT1eWcCBt3vzqJQfcny6pCfoVgm+M0mosLZpIQlWB1XLdclRpQ2/ml711r4bneDK571CTJevPx6SUUMdqJQ4GAXsRrNzvH80b+kLrWaxeF19Fns6oLqmb9uJJkPJNoIc0bXltNRh4kjkYt3qP/VvWz+zP9r+XYcUP7KLKWEDl8z5eByuaHwEXUegefX5gxbxlgF9Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=bn9DTFHu; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=bn9DTFHu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dXgWz45qmz2xfK
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Dec 2025 19:22:54 +1100 (AEDT)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5BIJm9uq031421;
	Fri, 19 Dec 2025 08:21:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=6W3plN
	+ebcTGX0uV6ORb8fAOAbPv8HSPi9pqpKhBUug=; b=bn9DTFHuCZGrhE2gIiGUIs
	DDTJlsrfAs4XYUikyrmKJM0tRK09osVCOWl+8ItTqIBmNLHs8n21NVx1RYY7uJr6
	MIHSSnO7cZoESYZ55UBe6zjnF4vDuzb8OAhgZAxhwQhSumSx7A8ExN0NkJYR0/ev
	AVvWgo7CLtAeBpAfaolZ+YaVSoS/vRQZVbHYvaOan2SKbR7HuVWfhfj3gT6SCq8K
	FS2HH7G77YpZ33Ax7nvyzHxTDApLc5EaPBvh2QGu5YGnS+3I3pIgu6hu97vGdniy
	gkjhtbRHMsiDw0sNcXvVmdol5jd643yMdA68mawZAmlVmkhcWH+9f/INx/DpJrag
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4b4r3dje6v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 19 Dec 2025 08:21:24 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5BJ8G9nG022763;
	Fri, 19 Dec 2025 08:21:23 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4b4r3dje6s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 19 Dec 2025 08:21:23 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5BJ7o8Ws029562;
	Fri, 19 Dec 2025 08:21:22 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4b4qvqtrdv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 19 Dec 2025 08:21:22 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5BJ8LIEr30146976
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 19 Dec 2025 08:21:18 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A94342004B;
	Fri, 19 Dec 2025 08:21:18 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C470420040;
	Fri, 19 Dec 2025 08:21:14 +0000 (GMT)
Received: from [9.124.209.192] (unknown [9.124.209.192])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 19 Dec 2025 08:21:14 +0000 (GMT)
Message-ID: <5acfcde7-0e8f-4228-8d9f-36b740900213@linux.ibm.com>
Date: Fri, 19 Dec 2025 13:51:05 +0530
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
        x86@kernel.org, linux-arm64@lists.infradead.org,
        linux-riscv@lists.infradead.org
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
X-Proofpoint-ORIG-GUID: VMo57LUGB5mbL-L32x592RHzO_CETbAy
X-Proofpoint-GUID: b35NuxmB0yfBlN4o5xEw0Ah1QGoT25Rc
X-Authority-Analysis: v=2.4 cv=KrZAGGWN c=1 sm=1 tr=0 ts=69450b04 cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8 a=icKp7thR8Zr7BtekdgcA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDA2NyBTYWx0ZWRfX45K0c7/r6Utl
 KNKXLWfdlayLBssJjNgVj7rEPBSAevK6l/LaGoQ0M2OKhT5Qf9MlgqZGfC/OF8nWI4jvsFn1lQP
 Y1FjKKtiotAj6+SrSiT2+FmJLB8KR9khO/CWVPGQiIh8XbteCM4csCF1eNb+eKnmicpWDyTNt4r
 0/lr+1AHIzsVaZEimA7fpllXp0yY5lXI7MkrRSpPn7d9bCeMGQSsnCf3dSdDSavufzEzTbdfHcm
 ukyIRewxefX64hHILbTZT07U3yblpXnNyxZ0NJGc2CRKEL9JXZlpkw5ruePXww8vQnH47vMbhOY
 n2rMYhkujHoja5eoJ0Zb8IJnb4FhM1WEyK7wHdq8EfDWrufHxeEJuRau4OWrhgD1p54MAL5XR9L
 K3p3GYNKwEmN3/cuHCGpKGrQwzijtEyaBS/KG7EueNliCtpNZJdMNFqpQWsFyCTDFodp0uYcJu4
 ggpS+FRJEmgVlPMw/Cg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_02,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2512120000 definitions=main-2512190067
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

Sure, I will try to find it.

>
>>
>> I also noticed an interesting issue related to excessive memory
>> allocation, where the production/first kernel failed to boot.
>> While testing this patch, I configured a very high hugepages 
>> (hugepagesz=2M)
>> count, and the first kernel failed to boot as a result. I will report
>> this issue separately.
>
> I'd say that's rather expected: if you steal too much memory from the 
> kernel it will not be able to function. It's the same when using the 
> mem= parameter I would assume.
>
I reported this behavior as an issue yesterday; let's see what others 
think about it.
https://lore.kernel.org/all/cb9f3604-8a0a-478a-8bf7-2d139ccbc89d@linux.ibm.com/


Sourabh Jain


