Return-Path: <linuxppc-dev+bounces-14895-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 61688CCEF07
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Dec 2025 09:16:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dXgND0pqJz2yFY;
	Fri, 19 Dec 2025 19:16:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1766132171;
	cv=none; b=hGxO5wM+fvUTC/3AvGQerSZK5dkVawTOCLj5Qn2gpq1LxYSLF4nDZZHqAtpDgqHBgv5NgSiqVUGvhuFCfLkLmjfDEboztPp83VSGNvv0R01wPExn7aEDnTHit144FY3eTmF5XBh+NSycWUfc3Pa4CagXPaIN1kUSvosl/DKbAucJZqYju6+eUz0Kq9RjSvho4wE2EmJaIVS8XSogCOB/aIB0yRywC5AtFxaSVZMeBHVeRsRMtjx0WG3qqrviIrRg7UQIw+RRopxVOrr71zdI09KICYAHkdFNC6Zgl9ENINU3rz+UKo3OLbP3p5VfQOb9SeCK39ZmQ9f1kPOJWHAVqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1766132171; c=relaxed/relaxed;
	bh=TLmAC4hT0OSI18H7TcOFY4Ez6H/3FbSY2SyIRVYgovE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZyJlzckjAWwKO1u794RVIdl4YKIWWpu5lle4CQeuUxOc1AWjTv99fyOFzB3oRyZkdpfqgNrL+LzLOK9hR+D6+7xBBX3EKv03hUydQQWlTa8KsiAaytABh/dqaIgG0Q7NUhAisNVgb1eKQCHdxQYs/06yMYUvxEtwbX5z/Orrxt2N+aWtJgi3bG7ewUkFV0zappw5SlSbC9in/qv7FObRXdCTrJ/wepojeO5peldJuqAJNAAI1QDtD2g4dT/s+OIiYK/9qoJpVb1+IDWvGx478emPrhyvWxWkfBnn83qZiCu/fG+DtkXgXlxbXdHSFdzfMObaxBLuuS1W21/9egYyTg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=nwttFawp; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=nwttFawp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dXgNB4nJYz2xfK
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Dec 2025 19:16:10 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5BIJnu1C009885;
	Fri, 19 Dec 2025 08:14:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=TLmAC4
	hT0OSI18H7TcOFY4Ez6H/3FbSY2SyIRVYgovE=; b=nwttFawpHer+20l410dRlu
	cKOvNOTC0wkbEAA7HSAbXIOCiHGVn5aehw+coVbKAolv/DFC3dnlV/HidILC1RDJ
	CCh+RYEHq1677l3YMI5a4jFgK10x0QpRZlh1HCkN9LTk/yw36fMECqaei29Fe9yI
	4M9htiVhpMNWFIaJ5YfUW9tleDQOqpEwT6FMpR7//SG6E7lDT1HyS1g+jZFnHuqd
	AkEPq+c65fBdubmcTkNI8jbM/vyr734mKAZOMu5FTUY7lhh9gXEndXSUchimT2OX
	YLw6zfxTC34hZPeFM4kffGzkaOqNurRSILC7oN25rPEjRF7S+AgPqkuId6duBtGw
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4b4r3qacw0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 19 Dec 2025 08:14:23 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5BJ87tpl013021;
	Fri, 19 Dec 2025 08:14:22 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4b4r3qacvr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 19 Dec 2025 08:14:22 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5BJ7ZYkL001249;
	Fri, 19 Dec 2025 08:14:21 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4b4qvpjqj5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 19 Dec 2025 08:14:21 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5BJ8EHdx52822390
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 19 Dec 2025 08:14:17 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8C98B2005A;
	Fri, 19 Dec 2025 08:14:17 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CED9A20040;
	Fri, 19 Dec 2025 08:14:13 +0000 (GMT)
Received: from [9.124.209.192] (unknown [9.124.209.192])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 19 Dec 2025 08:14:13 +0000 (GMT)
Message-ID: <041352df-41ce-4898-8535-d6b7fd74a52b@linux.ibm.com>
Date: Fri, 19 Dec 2025 13:44:12 +0530
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
To: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
        linux-kernel@vger.kernel.org
Cc: Andrew Morton <akpm@linux-foundation.org>, Borislav Petkov
 <bp@alien8.de>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        David Hildenbrand <david@kernel.org>,
        Heiko Carstens <hca@linux.ibm.com>, Ingo Molnar <mingo@redhat.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Muchun Song <muchun.song@linux.dev>,
        Oscar Salvador <osalvador@suse.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Vasily Gorbik <gor@linux.ibm.com>, linux-mm@kvack.org,
        linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
        x86@kernel.org, linux-arm64@lists.infradead.org,
        linux-riscv@lists.infradead.org
References: <20251218114154.228484-1-sourabhjain@linux.ibm.com>
 <875xa3ksz9.ritesh.list@gmail.com>
Content-Language: en-US
From: Sourabh Jain <sourabhjain@linux.ibm.com>
In-Reply-To: <875xa3ksz9.ritesh.list@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: PyctZo-oqOS2S2ryVat7yBVzS80fLUM4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDA2MyBTYWx0ZWRfXytVrcdj3UhfX
 Z8Vv9kMP0lMlwbFYhGcACf7pjgeECzAYFhQeBfU3P07X5wGgFiK9l1nnIAu5mg9e4G5uAYB6xak
 th58W2VYeaEcbUbuCrtcQn3a+sUnLl8JD6j3hdBrzuJfg4KQ7rt5RmL1A+BVc2qz79P2hwYP5ed
 WqgZGZ/zmGdlvU+WpcYuFcw9dwq4Bj/OYhjS3fXjQAAsifERVxszD6rP/QQorzk4k/i7xH/AOuT
 S+27eQb0MkDCeQ96c/ngWWgd6r2PMNDX3+vjEA6GID2JdwjmSh1jNLVO5Un4ntk2bMzcTjk0tVC
 s9U+7Ay7aQva8pBivlzQDr+mXwnPciyysNUsjcyRXEj+gouTutQCHOZI62FwHpPivwDtoOXqlAx
 H0Zm3o0A+OeCQJlE9WX7ZBlPQxgVRvroPCdMLKmlpeP9yVIs9shPkc0ydrcVnBTV9M6rTm6GeLl
 Uez/4l3A21EnUiLKd/A==
X-Proofpoint-ORIG-GUID: KZXZSziruriyHL7lrh2IB41nqPbe4UYL
X-Authority-Analysis: v=2.4 cv=C/HkCAP+ c=1 sm=1 tr=0 ts=6945095f cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8 a=pGLkceISAAAA:8 a=ejwGrTNpCrPNuk7NXeMA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_02,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0
 suspectscore=0 clxscore=1015 priorityscore=1501 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2512120000 definitions=main-2512190063
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On 19/12/25 09:45, Ritesh Harjani (IBM) wrote:
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
>> For example, fadump kernel booting with the kernel arguments
>> default_hugepagesz=1GB hugepagesz=1GB hugepages=200 prints the
>> following logs:
>>
>> HugeTLB: allocating 200 of page size 1.00 GiB failed.  Only allocated 58 hugepages.
>> HugeTLB support is disabled!
>> HugeTLB: huge pages not supported, ignoring associated command-line parameters
>> hugetlbfs: disabling because there are no supported hugepage sizes
>>
>> Even though the logs say that hugetlb support is disabled, gigantic
>> hugepages are still getting allocated, which causes the fadump kernel
>> to run out of memory during boot.
>>
>> To fix this, the gigantic hugepage allocation should come under
>> hugepages_supported().
>>
>> To bring gigantic hugepage allocation under hugepages_supported(), two
>> approaches were previously proposed:
>> [1] Check hugepages_supported() in the generic code before allocating
>> gigantic hugepages.
>> [2] Make arch_hugetlb_valid_size() return false for all hugetlb sizes.
>>
>> Approach [2] has two minor issues:
>> 1. It prints misleading logs about invalid hugepage sizes
>> 2. The kernel still processes hugepage kernel arguments unnecessarily
>>
> And that every other architecture will have to duplicate this in their
> arch_hugetlb_valid_size() whenever they face the same problem.
>
> Instead like at other places, hugepages_supported() should also be
> checked in the following cmdlines setup functions.
>
>> To control gigantic hugepage allocation, it is proposed to skip
>> processing the hugepage kernel arguments (hugepagesz, hugepages, and
>> default_hugepagesz) when hugepages_support() returns false.
>>
> Right. Thanks for taking care of it. I guess after this patch [1] moves
> hugetlbpage_init_defaultsize() to mmu_early_init_devtree(), it's good to
> bring back these checks in the respective cmdline setup functions which
> was removed as part of commit [2]
>
> [1]:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=2354ad252b66695be02f4acd18e37bf6264f0464
>
> [2]: https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=c2833a5bf75b3657c4dd20b3709c8c702754cb1f
>
> LGTM. Please feel free to add:
> Reviewed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>

Thank you for the review Ritesh.

- Sourabh Jain

