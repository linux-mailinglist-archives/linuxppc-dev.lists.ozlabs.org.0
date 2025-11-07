Return-Path: <linuxppc-dev+bounces-13931-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D3935C3FE92
	for <lists+linuxppc-dev@lfdr.de>; Fri, 07 Nov 2025 13:36:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d2z7b5nstz3bsN;
	Fri,  7 Nov 2025 23:36:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762518971;
	cv=none; b=TfO67xBoEpwrS3A5WHW8ynTX9D6tbpQFOEan4yhVra91EEXbfxzlGrsBZ4Uoq3f2RS8eC3SEpGAz8og3jPHchLGRWsmsJ7Ey4dqx2sQr1RstffBoZNWTwLs8Q+zLcn2mSuwBamjUXrulx8PwmQW4vgImcVcb0l4oS3kvOwIeEml0GaYE57Y7CqVK8/EDehIKC4LkjPlqG2Ypj9j6Cy215R0m+Ck+vmeMWnKAYRQA94vcyWT5GDaBtpjoSzFuxlRscqrMFyUcvy4CN7AhVfusQ5iG53yANzeHST6ujJwLTQL8fqn7MPs0GKYdU3BjEMM4uupYoKS3injBlpbXpLpUYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762518971; c=relaxed/relaxed;
	bh=yk5KcvEXnz/6e4GbGdsHUAlmvii4limw0COKHBHmBOg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OGsgVelxhkdk3foBMWogqu+oUvxkISrx5IB3zVN4D3qavFvMvAk2y911x6h6TLnPTC0WAIz0zLBxZSStWNZbX50K/8CQ8vle1xggO0ySjhc7+dGnjsiPCU7NY0WLZmaOHV0uUChhBMFYdxjmoDyGByTumAAefO2udX75pah+BXXz/lf9lte0ndR7DhXljrOBHu6sPQRcwtfZbMTNwymtHt2Z3dhpwYXpPks748k5SA4Jc2XHxUF3gqTN3Z2J8OIQ/j4NMdPhpVmpUy2F3vay2IhPVD43nMs/xu6lYvpXQ47ksI/XMq7hDJma8sYXDYTXQW+bxIY2Mu5kwTIThQAD9g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=tql71cxQ; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=tql71cxQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d2z7V5BJzz2yFJ
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Nov 2025 23:36:06 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5A7B88ct030770;
	Fri, 7 Nov 2025 12:35:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=yk5Kcv
	EXnz/6e4GbGdsHUAlmvii4limw0COKHBHmBOg=; b=tql71cxQc/zvjsCEASJb2h
	PBn7t7CRx8yh9pwoEc7MJYOgp/PE7INT7AbgQqNCCQFx65zXk1Qm+Ll1SrgBjMpa
	JUQuTNg6/Sinqq1FTQwdC+kkmH50EjrGGK9uYYztLPoHsEuQSuPTWFBwI1g6/qDs
	GjhqL8iPvIRniutbVUEpTTiBsrZ7UYtWRkqW4xaeYdqfjCxrc7OFRbAHdRVFrdY9
	X4QrMeKwonYjphKomp44FHHVs/sCERG5ViIaBJb4KTwdqXdQHabFeTZ+sqpdTt74
	QqH34ANCctO4+TMHrx2ol46vlAiWMNZXC/U3pAPfz6L95F99NgkGZb0z0LGcCh2w
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4a59v2b8ta-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 07 Nov 2025 12:35:58 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5A7CMkhW024042;
	Fri, 7 Nov 2025 12:35:58 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4a59v2b8t7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 07 Nov 2025 12:35:57 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5A7BF9jH025588;
	Fri, 7 Nov 2025 12:35:57 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4a5vht2tvg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 07 Nov 2025 12:35:56 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5A7CZrAk27329258
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 7 Nov 2025 12:35:53 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5066F20043;
	Fri,  7 Nov 2025 12:35:53 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9D62220040;
	Fri,  7 Nov 2025 12:35:48 +0000 (GMT)
Received: from [9.124.216.224] (unknown [9.124.216.224])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri,  7 Nov 2025 12:35:46 +0000 (GMT)
Message-ID: <5e4bc56e-f0ca-45b3-a7c8-114e7009dfd8@linux.ibm.com>
Date: Fri, 7 Nov 2025 18:05:42 +0530
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
Subject: Re: powerpc/e500: WARNING: at mm/hugetlb.c:4755 hugetlb_add_hstate
To: "David Hildenbrand (Red Hat)" <david@kernel.org>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Cc: Donet Tom <donettom@linux.ibm.com>,
        Andrew Morton <akpm@linux-foundation.org>
References: <94377f5c-d4f0-4c0f-b0f6-5bf1cd7305b1@linux.ibm.com>
 <dd634b17-cc5e-497c-8228-2470f6533177@redhat.com>
 <82ef1da8-44c4-4a58-bd00-9839548cb72d@csgroup.eu>
 <ba3a2131-c8d4-481d-aebb-d25be7ae0d19@kernel.org>
 <e93e3a1b-5cf1-4d2a-9b2c-5049e211f593@linux.ibm.com>
 <b875435f-6a69-4989-bc21-4093c2ce6331@kernel.org>
Content-Language: en-US
From: Sourabh Jain <sourabhjain@linux.ibm.com>
In-Reply-To: <b875435f-6a69-4989-bc21-4093c2ce6331@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: r8gRlDEhBN4wEqaBaR_bCi37sPSPLYMr
X-Proofpoint-ORIG-GUID: PLQF6PgjHeeQg6Df2UBSpWsbeG6sn6TJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTAxMDAyMSBTYWx0ZWRfX1RVYHPT3Hawz
 d3LMFqQaemFNKRbIjsIjEqBFH2ERQ83VSYb4zmOLLKl1yYv9AgZ8sL9LGtULzWEm9iOj0ztR2a9
 5apzgN7voo8orzn6+yvvrXWfRS7hDrVlZeCQq2Tg/4bdJFbvAxb+wDMuiLEUaJqJx9ffqEF5EbP
 bnhc4a0rdXBkziZl8ftX6fRXaYebFaGGkiWYxi+5Z6aJ5S1C9fzO+AKYeU0zmdWV8GsnqX6TDFb
 jf23EXty4aOC/CffS0hAKDVqIW6hKq5rTP4p6qNWwZtJoZuY71mGalxOUtoKL1FAfIWJ8Hb85hw
 QRv+DgN9NDNQx5iKNtGrnu1DXhMEYp6qQJH/y/VgOb4tY41j8RFRfpILiQCm//nFf7IAKiIgYrS
 2XBVT5+MoHogAmkszKrexx35mNp9Ow==
X-Authority-Analysis: v=2.4 cv=H8HWAuYi c=1 sm=1 tr=0 ts=690de7ae cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=qiArQ2jmnHpOHsBwjaQA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-07_02,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 impostorscore=0 clxscore=1015 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510240000 definitions=main-2511010021
X-Spam-Status: No, score=0.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


On 07/11/25 14:32, David Hildenbrand (Red Hat) wrote:
> On 07.11.25 09:00, Sourabh Jain wrote:
>>
>>
>> On 06/11/25 20:32, David Hildenbrand (Red Hat) wrote:
>>>>> Yes, we discussed that in [1].
>>>>>
>>>>> We'll have to set ARCH_HAS_GIGANTIC_PAGE on ppc and increase
>>>>> MAX_FOLIO_ORDER, because apparently, there might be ppc configs that
>>>>> have even larger hugetlb sizes than PUDs.
>>>>>
>>>>> @Cristophe, I was under the impression that you would send a fix. Do
>>>>> you
>>>>> want me to prepare something and send it out?
>>>>
>>>> Indeed I would have liked to better understand the implications of all
>>>> this, but I didn't have the time.
>>>
>>> Indeed, too me longer than it should to understand and make up my mind
>>> as well.
>>>
>>>>
>>>> By the way, you would describe the fix better than me so yes if you 
>>>> can
>>>> prepare and send a fix please do.
>>>
>>> I just crafted the following. I yet have to test it more, some early
>>> feedback+testing would be appreciated!
>>>
>>>  From 274928854644c49c92515f8675c090dba15a0db6 Mon Sep 17 00:00:00 2001
>>> From: "David Hildenbrand (Red Hat)" <david@kernel.org>
>>> Date: Thu, 6 Nov 2025 11:31:45 +0100
>>> Subject: [PATCH] mm: fix MAX_FOLIO_ORDER on some ppc64 configs with
>>> hugetlb
>>
>> b4 did not detect this patch, and manually copying the patch text 
>> from this
>> reply also did not apply cleanly on upstream master and linuxppc
>> master/next.
>
> I have it on a branch here:
>
> https://github.com/davidhildenbrand/linux/commit/274928854644c49c92515f8675c090dba15a0db6 
>
>
> https://github.com/davidhildenbrand/linux.git max_folio_order
>

The above patch resolves the issue reported in this thread.

Thanks for the fix David.

Thanks,
Sourabh Jain

