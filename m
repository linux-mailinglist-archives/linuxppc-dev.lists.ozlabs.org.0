Return-Path: <linuxppc-dev+bounces-4217-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D61539F415A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Dec 2024 04:56:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YC30H3BHJz2yk6;
	Tue, 17 Dec 2024 14:56:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734407807;
	cv=none; b=IlSiExnX6BEcG5AFmuHqjjKGyMd+DLR39yg04Yo2mhoAUbkKj5FtM9hWI3sGBmmD4AqxmJzZuR0K9KA7Or9SNlSfSwU9KhyycMrnWE64zWxTgXUpL967fV/wYUgw7yB7adllOVcxpqI2sT0jXmjXMg9LIp0ahcOWgQBLYWJwGgrluzFacWvFE76SIp5vYQ9b59XMpwYjR1fTulD1j3quLCcOXubMf9uqyGzEQng+od5UuZ9nkQ1EWWkPyBuMWkEF/A+tIPUkoQ+QKOLedDqf/9h5OkZHaJ2jpgLYaNhGvfkg3PsDrQveHSqKBu4YMRS0zJvQZ0hmB/hg34e1Zd6nBg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734407807; c=relaxed/relaxed;
	bh=ocqUixpySLRcGX5uIMsUIfrKCTgh7ROSLsVpKaoocNE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Hty8y5IoYeI6EcbnB/4+LSX6SuPCOz9yYI7N9xXasTGpASQ145wuiq4F4Lar2t+ID/tuMoYIDxDN5qAgvQmATEUnhmtgHPsfONRe5OiTxyI0W/Sb9vH0MB7HzGOILX5uzLZJPrzh1jgBXTdMtmvFAfFJy4JUpZwWUJvcACrfQOggR5GlUCGVnc6vZ4Dj6dI6ZkL7iDNN6ly8osIeAT6s5c16bel2O3QZMQR33d2fkJLP6pGTl/PQGN9vXw0GlJ9i8D9MGCpyDipLgOlDp9pQcJMuZT38kWVUArSUeiI1P1/PkLUXDIzsNiNLduHSgPavYVt/0D52/1P0LBMdQ1Xmiw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=fxtAsYxw; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=fxtAsYxw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YC30G23rMz2yZ4
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Dec 2024 14:56:45 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BGM1l42011312;
	Tue, 17 Dec 2024 03:56:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=ocqUix
	pySLRcGX5uIMsUIfrKCTgh7ROSLsVpKaoocNE=; b=fxtAsYxw3q1r/IWdjtOuiI
	J+HKPbalp84lR3biCY00vrryecOHs4PrdL9JSBWnaIJ/d7cMp2FWtP3EzL7LI50e
	TDy2L6g1/XN/nHav1kq/8kzpq+NZxiY+go8lFWtTSnYt/k/Z1I2pXP87l8BJXuwI
	DXyXs2f2X4lJyqfO/WQJ9xOz9OL20GVS2c13dAYXgUESuF9IPAN7BJ5VYYy5Pz6a
	PiqMyeFbZjKqnU08VFuZTBjuS0IbOOi16lweUwUpxfMMmAUaRF9b/3WLQuvVvkuC
	MQVqyvELrYbxbraXbN5Pm4KN53BRJmPNJI6m4UDVoe0fcmWm6SrZolTplLFZoXAQ
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 43jnp4k7dc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 03:56:34 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4BH3rX7B001641;
	Tue, 17 Dec 2024 03:56:33 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 43jnp4k7da-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 03:56:33 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 4BH2GE25005488;
	Tue, 17 Dec 2024 03:56:33 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 43hnbn12qn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 03:56:32 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4BH3uTHJ49152404
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 17 Dec 2024 03:56:29 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1BF5720040;
	Tue, 17 Dec 2024 03:56:29 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0F3B520043;
	Tue, 17 Dec 2024 03:56:27 +0000 (GMT)
Received: from [9.43.29.128] (unknown [9.43.29.128])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 17 Dec 2024 03:56:26 +0000 (GMT)
Message-ID: <51f0c5cc-87bb-49c3-9131-801834700638@linux.ibm.com>
Date: Tue, 17 Dec 2024 09:26:25 +0530
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
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] powerpc/book3s64/hugetlb: Fix disabling hugetlb when
 fadump is active
To: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
        linuxppc-dev@lists.ozlabs.org
Cc: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
        Hari Bathini <hbathini@linux.ibm.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Mahesh Salgaonkar <mahesh@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>
References: <20241202054310.928610-1-sourabhjain@linux.ibm.com>
 <87h6734gp8.fsf@gmail.com>
Content-Language: en-US
From: Sourabh Jain <sourabhjain@linux.ibm.com>
In-Reply-To: <87h6734gp8.fsf@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: AH2h5lEMLzx3cFRlnUOO2K8WTWEnxaMO
X-Proofpoint-ORIG-GUID: d5oseG65QVty6bShGCnzwUiDQHtNEL4j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 clxscore=1011
 malwarescore=0 adultscore=0 bulkscore=0 mlxscore=0 spamscore=0
 priorityscore=1501 phishscore=0 suspectscore=0 mlxlogscore=999
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412170026
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hello Ritesh,

On 17/12/24 00:07, Ritesh Harjani (IBM) wrote:
> Sourabh Jain <sourabhjain@linux.ibm.com> writes:
>
>> Commit 8597538712eb ("powerpc/fadump: Do not use hugepages when fadump
>> is active") disabled hugetlb support when fadump is active by returning
>> early from hugetlbpage_init():arch/powerpc/mm/hugetlbpage.c and not
>> populating hpage_shift/HPAGE_SHIFT.
>>
>> Later, commit 2354ad252b66 ("powerpc/mm: Update default hugetlb size
>> early") moved the allocation of hpage_shift/HPAGE_SHIFT to early boot,
>> which inadvertently re-enabled hugetlb support when fadump is active.
>>
>> Fix this by implementing hugepages_supported() on powerpc. This ensures
>> that disabling hugetlb for the fadump kernel is independent of
>> hpage_shift/HPAGE_SHIFT.
>>
> Thanks for describing the history of the changes clearly.
>
>> Fixes: 2354ad252b66 ("powerpc/mm: Update default hugetlb size early")
>> CC: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
>> CC: Hari Bathini <hbathini@linux.ibm.com>
>> CC: Madhavan Srinivasan <maddy@linux.ibm.com>
>> Cc: Mahesh Salgaonkar <mahesh@linux.ibm.com>
>> Cc: Michael Ellerman <mpe@ellerman.id.au>
>> CC: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
>> Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
>> ---
>>
>> Note: Even with this fix included, it is possible to enable gigantic
>> pages in the fadump kernel. IIUC, gigantic pages were never disabled
>> for the fadump kernel.
>>
>> Currently, gigantic pages are allocated during early boot as long as
>> the respective hstate is supported by the architecture.
>>
>> I will introduce some changes in the generic hugetlb code to allow the
>> architecture to decide on supporting gigantic pages on the go. Bringing
>> gigantic page allocation under hugepages_supported() does work for
>> powerpc but I need verify the impact on other architectures.
>>
>> Regarding the Fixes tag: This patch fixes a bug inadvertently introduced
>> by the commit mentioned under Fixes tag in the commit message. Feel free
>> to remove the tag if it is unnecessary.
>>
>> ---
>>   arch/powerpc/include/asm/hugetlb.h | 9 +++++++++
>>   1 file changed, 9 insertions(+)
>>
>> diff --git a/arch/powerpc/include/asm/hugetlb.h b/arch/powerpc/include/asm/hugetlb.h
>> index 18a3028ac3b6..f294e57663b0 100644
>> --- a/arch/powerpc/include/asm/hugetlb.h
>> +++ b/arch/powerpc/include/asm/hugetlb.h
>> @@ -15,6 +15,15 @@
>>   
>>   extern bool hugetlb_disabled;
>>   
>> +static inline int hugepages_supported(void)
>> +{
>> +	if (hugetlb_disabled)
>> +		return 0;
>> +
>> +	return HPAGE_SHIFT != 0;
>> +}
>> +#define hugepages_supported hugepages_supported
>> +
> In include/linux/hugetlb.h
>
> #ifndef hugepages_supported
> /*
>   * Some platform decide whether they support huge pages at boot
>   * time. Some of them, such as powerpc, set HPAGE_SHIFT to 0
>   * when there is no such support
>   */
> #define hugepages_supported() (HPAGE_SHIFT != 0)
> #endif
>
> The above comment is not entirely correct after this change 2354ad252b66
> ("powerpc/mm: Update default hugetlb size early), because we anyway go
> ahead and initialize HPAGE_SHIFT even when hugetlb_disabled is true. But
> nevertheless - we can fix the comment later. I see there are few other
> cleanups which could be clubbed too.


Agree. Since it requires generic changes, it can be handled separately.

> fadump when the capture kernel is active would like to disable hugetlb page
> allocation (to avoid OOMs) hence it uses hugetlb_disabled flag to mark
> it disabled. As you correctly pointed out, the change in question moved
> initialization of HPAGE_SHIFT to early boot as it was required to set the
> pageblock_order properly (especially for radix 2M huge pagesize).
>
> Now earlier generic hugepages_supported() was only checking for
> HPAGE_SHIFT != 0. This patch will now check for both, hugetlb_disabled
> should be false and HPAGE_SHIFT should not be 0. Only then hugetlb will
> go and allocate hugepages in hugetlb_init().
>
>
> So, the change looks good to me. Thanks for catching and fixing that.
> I hope we can add a testcase to cover this scenario as the problematic
> patch was added long ago - but we only noticed the problem now.

Yes, we have a plan to add a couple of test cases in op-test to cover
hugepages with fadump.

> Quick
> qn, was this caught due to any OOM? Or was it an observation?

Yes, the kernel was hitting OOM when hugepages were enabled and
fadump was active.

> The patch looks good to me. So please feel free to add -
> Reviewed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>

Thanks for the review, Ritesh.

- Sourabh Jain

