Return-Path: <linuxppc-dev+bounces-13737-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 05B7FC31059
	for <lists+linuxppc-dev@lfdr.de>; Tue, 04 Nov 2025 13:38:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d17Ks3z26z3bfM;
	Tue,  4 Nov 2025 23:38:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762259921;
	cv=none; b=I3QsB0tzOq0AwpeomSvNnIV8Rpwy85b5gTx8TVj8/mPnxBeOS2eqvf6hWodpn3H/K+qkdFGZDlmAbja/c70hFeR4V53+DfCt3MPioMk+czjYkg+jdz6ny4A98FXX7GQRojgjM5TDMiQzSuvXJfJ/9nu8rItvLxprBRGOgTCTbMZ0rIusQHv1mSeIIwFA8P4KULwK4r6L4WcJzDTlVk9qrvANNRQZM6yzOW0zSCENmRwtBmAXFn9/+WWrMODXlXCkTF7X45gxyzsyBcpCM6Ip64DK+TKKw5ZCY0dH4XdNOMYjGtotXhofB5ZYPpmXKwqxrA4vADFswQtb7Hbxk/OkVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762259921; c=relaxed/relaxed;
	bh=+DhQ3aOdE4eF6XoGWE+LStOiAO7QQC0rUkGxKKgXU+o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PDMxe3uJ3d7OFzHNrD4aoZ5SEubqQmOD3GhU6z6qZElMbQtllUSFoyKxuA9BpE7CoCV3vKkh0HpOuNl4JeyLIGQk0kz5fefe7cFrm8nnVAots9cNWof9JRctzwz/4LKoPUW+fWQwqPXiGGTqIkaLTdShi+yDyxpFRd42yLjqn7GGImM/wKSoXIQiKxsmHQUIFjTchj1qmhxjlxZhz7BxUZAlc3rPD9JD/5kBxIljPTFtOG+zJNMBM+v1yhVrAhFDvYCoORPGrnj+HlahmfzKzEGprws5SKBPpIh+bPgbg1oXNl9rdyepevQMvBhQ2V5AGqNS2fYVhKfjbZIMbs1O+g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=YMFdwibI; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=YMFdwibI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d17Kq6vGCz3bf3
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Nov 2025 23:38:39 +1100 (AEDT)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5A41IxK7019236;
	Tue, 4 Nov 2025 12:38:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=+DhQ3a
	OdE4eF6XoGWE+LStOiAO7QQC0rUkGxKKgXU+o=; b=YMFdwibI8HgFpsjvwSn8Y2
	QrilKLBwqDaILY3iXuppJfpjt3sTYcnpW7cD61MZRgdV+hoVtrmqExsyrnGjOToV
	6mAXCYbXfTq+RL9g1Owq/KCawXaUT0aUok8m78OuGcK8hA7s43DDCAc3KGrM1jvS
	PWEqwvVwoMeKGsvO6uYfw4l41QDWQTOFBTo6CY0if0rg7HEkloZKqubtr51+H2zO
	rrmmA8wPZNfCcOmeZ3eMLKxbvTrNq6C6eThzhCF6SuHQn98BY+J364A0YHqbGO+8
	hTjAIjoyH7XmkLiWKHRycrb3stbPLAvwEIn66W5nvD4zGzgfZsgvdTfpE8yvN7Pg
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4a57mr3ywa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Nov 2025 12:38:26 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5A4CXeDD031274;
	Tue, 4 Nov 2025 12:38:26 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4a57mr3yw5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Nov 2025 12:38:26 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5A4BmKfX021515;
	Tue, 4 Nov 2025 12:38:25 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4a5xrjjut1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Nov 2025 12:38:25 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5A4CcL7f32047370
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 4 Nov 2025 12:38:22 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C9DF320043;
	Tue,  4 Nov 2025 12:38:21 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0CBD420040;
	Tue,  4 Nov 2025 12:38:20 +0000 (GMT)
Received: from [9.109.204.116] (unknown [9.109.204.116])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  4 Nov 2025 12:38:19 +0000 (GMT)
Message-ID: <c8bf2777-acd1-454d-8e57-aafb824f4be4@linux.ibm.com>
Date: Tue, 4 Nov 2025 18:08:19 +0530
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
Subject: Re: [PATCH v5] powerpc/kdump: Add support for crashkernel CMA
 reservation
To: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
        linuxppc-dev@lists.ozlabs.org
Cc: Baoquan he <bhe@redhat.com>, Jiri Bohac <jbohac@suse.cz>,
        Hari Bathini <hbathini@linux.ibm.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Mahesh Salgaonkar <mahesh@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Shivang Upadhyay <shivangu@linux.ibm.com>, kexec@lists.infradead.org
References: <20251103043747.1298065-1-sourabhjain@linux.ibm.com>
 <87y0on4ebh.ritesh.list@gmail.com>
 <7957bd55-5bda-406f-aab3-64e0620bd452@linux.ibm.com>
 <ea44849c-9d0f-43cc-9476-42bc619728f6@linux.ibm.com>
 <87v7jq3xjn.ritesh.list@gmail.com>
Content-Language: en-US
From: Sourabh Jain <sourabhjain@linux.ibm.com>
In-Reply-To: <87v7jq3xjn.ritesh.list@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: nsLSFdxQKpeuQQqnd-JNMywcG67ulMyA
X-Authority-Analysis: v=2.4 cv=MKhtWcZl c=1 sm=1 tr=0 ts=6909f3c3 cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VnNF1IyMAAAA:8 a=20KFwNOVAAAA:8 a=pGLkceISAAAA:8 a=JfrnYn6hAAAA:8
 a=LGWCmCIqyMGvpOH6FMwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1CNFftbPRP8L7MoqJWF3:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-ORIG-GUID: ZVzYynnHaspYAyksD65eyxhC9a8ZBiBc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTAxMDAwMSBTYWx0ZWRfX1bV44qK+XmQM
 VgmdIXid88mZ3JTJxJKkgSeWcZBVzbAsbe10VCE1ytzJ+YWTn0yyid9etFEV6Vu4/b7FSh1TDMe
 a/jDCjHm/MqKQfxc6iVNSelD7AS1+Iopy0pA/qii95qvGSUFEsVuwfOz83jV9ncI8jb/q/kGfU+
 bq6KgEFh4y8Zii0umS8QOvekuB47i/c5GbGbMJ6g7Gy46UapUA+Qz0FQyl2XFSl1SSbFg3gbBRH
 1yK1g/0hmFfgrca94HxNmCWe9Ac1IJKROWzAKMyiy4AxzOiRmnxjSDSgdd8R8QZEXLLm0cPfsH8
 vNqLfR3v+fZEtL003ITQ1GHDxM7QR0nxmOLqJt+X1/Ug6gQDwWU21B/2EOW2zSSBw+xgcV5ThRX
 nKFRl1u0ccrUZ8BhglUVhFfWp3Sicw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-04_01,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 bulkscore=0 impostorscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 adultscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510240000 definitions=main-2511010001
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On 04/11/25 15:54, Ritesh Harjani (IBM) wrote:
> Sourabh Jain <sourabhjain@linux.ibm.com> writes:
>
>> On 04/11/25 10:48, Sourabh Jain wrote:
>>>
>>> On 03/11/25 15:40, Ritesh Harjani (IBM) wrote:
>>>> Sourabh Jain <sourabhjain@linux.ibm.com> writes:
>>>>
>>>>> Commit 35c18f2933c5 ("Add a new optional ",cma" suffix to the
>>>>> crashkernel= command line option") and commit ab475510e042 ("kdump:
>>>>> implement reserve_crashkernel_cma") added CMA support for kdump
>>>>> crashkernel reservation.
>>>>>
>>>>> Extend crashkernel CMA reservation support to powerpc.
>>>>>
>>>>> The following changes are made to enable CMA reservation on powerpc:
>>>>>
>>>>> - Parse and obtain the CMA reservation size along with other
>>>>> crashkernel
>>>>>     parameters
>>>>> - Call reserve_crashkernel_cma() to allocate the CMA region for kdump
>>>>> - Include the CMA-reserved ranges in the usable memory ranges for the
>>>>>     kdump kernel to use.
>>>>> - Exclude the CMA-reserved ranges from the crash kernel memory to
>>>>>     prevent them from being exported through /proc/vmcore.
>>>>>
>>>>> With the introduction of the CMA crashkernel regions,
>>>>> crash_exclude_mem_range() needs to be called multiple times to exclude
>>>>> both crashk_res and crashk_cma_ranges from the crash memory ranges. To
>>>>> avoid repetitive logic for validating mem_ranges size and handling
>>>>> reallocation when required, this functionality is moved to a new
>>>>> wrapper
>>>>> function crash_exclude_mem_range_guarded().
>>>>>
>>>>> To ensure proper CMA reservation, reserve_crashkernel_cma() is called
>>>>> after pageblock_order is initialized.
>>>>>
>>>>> Update kernel-parameters.txt to document CMA support for crashkernel on
>>>>> powerpc architecture.
>>>>>
>>>>> Cc: Baoquan he <bhe@redhat.com>
>>>>> Cc: Jiri Bohac <jbohac@suse.cz>
>>>>> Cc: Hari Bathini <hbathini@linux.ibm.com>
>>>>> Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
>>>>> Cc: Mahesh Salgaonkar <mahesh@linux.ibm.com>
>>>>> Cc: Michael Ellerman <mpe@ellerman.id.au>
>>>>> Cc: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
>>>>> Cc: Shivang Upadhyay <shivangu@linux.ibm.com>
>>>>> Cc: kexec@lists.infradead.org
>>>>> Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
>>>>> ---
>>>>> Changlog:
>>>>>
>>>>> v3 -> v4
>>>>>    - Removed repeated initialization to tmem in
>>>>>      crash_exclude_mem_range_guarded()
>>>>>    - Call crash_exclude_mem_range() with right crashk ranges
>>>>>
>>>>> v4 -> v5:
>>>>>    - Document CMA-based crashkernel support for ppc64 in
>>>>> kernel-parameters.txt
>>>>> ---
>>>>>    .../admin-guide/kernel-parameters.txt         |  2 +-
>>>>>    arch/powerpc/include/asm/kexec.h              |  2 +
>>>>>    arch/powerpc/kernel/setup-common.c            |  4 +-
>>>>>    arch/powerpc/kexec/core.c                     | 10 ++++-
>>>>>    arch/powerpc/kexec/ranges.c                   | 43
>>>>> ++++++++++++++-----
>>>>>    5 files changed, 47 insertions(+), 14 deletions(-)
>>>>>
>>>>> diff --git a/Documentation/admin-guide/kernel-parameters.txt
>>>>> b/Documentation/admin-guide/kernel-parameters.txt
>>>>> index 6c42061ca20e..0f386b546cec 100644
>>>>> --- a/Documentation/admin-guide/kernel-parameters.txt
>>>>> +++ b/Documentation/admin-guide/kernel-parameters.txt
>>>>> @@ -1013,7 +1013,7 @@
>>>>>                It will be ignored when crashkernel=X,high is not used
>>>>>                or memory reserved is below 4G.
>>>>>        crashkernel=size[KMG],cma
>>>>> -            [KNL, X86] Reserve additional crash kernel memory from
>>>>> +            [KNL, X86, ppc64] Reserve additional crash kernel
>>>>> memory from
>>>> Shouldn't this be PPC and not ppc64?
>>>>
>>>> If I see the crash_dump support...
>>>>
>>>> config ARCH_SUPPORTS_CRASH_DUMP
>>>>      def_bool PPC64 || PPC_BOOK3S_32 || PPC_85xx || (44x && !SMP)
>>>>
>>>> The changes below aren't specific to ppc64 correct?
>>> The thing is this feature is only supported with KEXEC_FILE and which
>>> only supported on PPC64:
>>>
>>> config ARCH_SUPPORTS_KEXEC_FILE
>>>      def_bool PPC64
>>>
>>> Hence I kept it as ppc64.
>>>
> I am not much familiar with the kexec_load v/s kexec_file_load
> internals. Maybe because of that I am unable to clearly understand your
> above points.
>
> But let me try and explain what I think you meant :)
>
> We first call "get_usable_memory_ranges(&umem)" which updates the usable
> memory ranges in "umem". We then call "update_usable_mem_fdt(fdt, umem)"
> which updates the FDT for the kdump kernel's fdt to inform about these
> usable memory ranges to the kdump kernel.
>
> Now since your patch only does that in get_usable_memory_range(), this
> extra CMA reservation is mainly only useful when the kdump load happens
> via kexec_file_load(), (because get_usable_memory_range() only gets
> called from kexec_file_load() path)
>
> Is this what you meant here?


Yeah, for kexec_file_load, the FDT for the kdump kernel is prepared in 
the Linux
kernel (using the functions you mentioned), whereas for kexec_load, it 
is prepared
in the kexec tool (userspace). Hence, these changes are not sufficient 
to support
this feature with the kexec_load syscall.

The kexec tool must be updated to ensure that the FDT is prepared in a 
way that
marks the crashkernel CMA reservation as usable in the kdump FDT for the
kexec_load system call.

Anyway, it makes more sense to say that crashkernel=xM,cma support is 
available
on ppc rather than ppc64, since restricting crashkernel CMA reservation to
KEXEC_FILE does not help. The details are explained below.


>
>
>>> I think I should update that in the commit message.
>>>
>>> Also do you think is it good to restrict this feature to KEXEC_FILE?
>> Putting this under KEXEC_FILE may not help much because KEXEC_FILE is
>> enabled
>> by default in most configurations. Once it is enabled, the CMA
>> reservation will
>> happen regardless of which system call is used to load the kdump kernel
>> (kexec_load or kexec_file_load).
>>
> What I understood from the feature was that, on the normal production
> kernel this feature crashkernel=xM,cma allows to reserve an extra xMB of
> memory as a CMA region for kdump kernel's memory allocations. But this
> CMA reservation would happen in the normal kernel itself during
> setup_arch() -> kdump_cma_reserve()..
>
> And this CMA reservation happens irrespective of whether the kdump
> kernel will get loaded via whichever system call.

Yeah that's right.

>
>> However, not restricting this feature to KEXEC_FILE will allow the kexec
>> tool to
>> independently add support for this feature in the future for the kexec_load
>> system call.
> Sure.
>
>> With that logic, I think if we do not restrict this feature to
>> KEXEC_FILE, the support
>> will be available for ppc and not limited to ppc64.
>>
> Yes, that make sense.
>
> If one doesn't want to make the CMA reservation, then we need not pass
> the extra cmdline argument and no reservation will be made. So, no need
> to restrict this to PPC64 by making it available only for KEXEC_FILE.

Agree.

