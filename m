Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6890436513B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Apr 2021 06:18:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FPVmX2LtMz30BP
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Apr 2021 14:18:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=N4fxzvqb;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=N4fxzvqb; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FPVm44t8Cz2xZJ
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Apr 2021 14:18:11 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13K43WmU112472; Tue, 20 Apr 2021 00:18:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=bOHkQXXeK+XZM1wREc9gNSE/adu70CjJYkS4jYY+dis=;
 b=N4fxzvqbo+80husMp8U/fZVo5GIoZbTf7JSNdK8xvEgQkAXtD19N12sze+vtHhrWWNtn
 Pe/2uy2YIXK72xjVUYczrxy0I+YkOzNLq/A4Y0DhqSZ1KxAtu6n92KZDUkNFbr+CxRob
 XAEh6eYMm7rlOy5LVByzub/V7XP2ZLbV5BkVmPG/uEhVGjdv9vGQ4h1ilTsiIdUSr4N0
 T2yht2DI7RIi1xHngcBw+Ge43L8ODU9yDSxmetnZME8UeKZFlubO4G/Uag3DFEIklB9r
 5LVegrvi39EjozwsVdjmq2BlPCtf5CSlwS+VSxWDcVMv77IP0BfyhBFW79ktdefhvhpt Pg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 381gsy116h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 20 Apr 2021 00:18:00 -0400
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 13K44RJC114362;
 Tue, 20 Apr 2021 00:17:59 -0400
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com with ESMTP id 381gsy115x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 20 Apr 2021 00:17:59 -0400
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13K4DPYG008639;
 Tue, 20 Apr 2021 04:17:57 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma01fra.de.ibm.com with ESMTP id 37yqa88sd9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 20 Apr 2021 04:17:57 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 13K4HVEG33423726
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 20 Apr 2021 04:17:31 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A0928A4054;
 Tue, 20 Apr 2021 04:17:54 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 57027A405B;
 Tue, 20 Apr 2021 04:17:53 +0000 (GMT)
Received: from [9.199.43.214] (unknown [9.199.43.214])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 20 Apr 2021 04:17:53 +0000 (GMT)
Subject: Re: [PATCH v4 6/9] mm/mremap: Use range flush that does TLB and page
 walk cache flush
To: Michael Ellerman <mpe@ellerman.id.au>, linux-mm@kvack.org,
 akpm@linux-foundation.org
References: <20210414085915.301189-1-aneesh.kumar@linux.ibm.com>
 <20210414085915.301189-7-aneesh.kumar@linux.ibm.com>
 <87fszld3bt.fsf@mpe.ellerman.id.au>
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Message-ID: <18072419-dcf8-ef12-380f-50a55be41ccb@linux.ibm.com>
Date: Tue, 20 Apr 2021 09:47:52 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <87fszld3bt.fsf@mpe.ellerman.id.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 9Zu5fJ56CRtws_pC2_rMHAsQ-CL_6k4l
X-Proofpoint-GUID: ZPorBC7MGzJi11JbREzlOeDZ0LVeLHBX
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-20_01:2021-04-19,
 2021-04-20 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxlogscore=999
 priorityscore=1501 spamscore=0 clxscore=1015 phishscore=0 mlxscore=0
 suspectscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104200028
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
Cc: joel@joelfernandes.org, linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com,
 kaleshsingh@google.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 4/20/21 9:17 AM, Michael Ellerman wrote:
> "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com> writes:
>> Some architectures do have the concept of page walk cache which need
>> to be flush when updating higher levels of page tables. A fast mremap
>> that involves moving page table pages instead of copying pte entries
>> should flush page walk cache since the old translation cache is no more
>> valid.
>>
>> Add new helper flush_pte_tlb_pwc_range() which invalidates both TLB and
>> page walk cache where TLB entries are mapped with page size PAGE_SIZE.
>>
>> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
>> ---
>>   arch/powerpc/include/asm/book3s/64/tlbflush.h | 11 +++++++++++
>>   mm/mremap.c                                   | 15 +++++++++++++--
>>   2 files changed, 24 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/powerpc/include/asm/book3s/64/tlbflush.h b/arch/powerpc/include/asm/book3s/64/tlbflush.h
>> index f9f8a3a264f7..c236b66f490b 100644
>> --- a/arch/powerpc/include/asm/book3s/64/tlbflush.h
>> +++ b/arch/powerpc/include/asm/book3s/64/tlbflush.h
>> @@ -80,6 +80,17 @@ static inline void flush_hugetlb_tlb_range(struct vm_area_struct *vma,
>>   	return flush_hugetlb_tlb_pwc_range(vma, start, end, false);
>>   }
>>   
>> +#define flush_pte_tlb_pwc_range flush_tlb_pwc_range
>> +static inline void flush_pte_tlb_pwc_range(struct vm_area_struct *vma,
>> +					   unsigned long start, unsigned long end,
>> +					   bool also_pwc)
> 
> This still uses the also_pwc name, which is a bit inconsistent with the
> previous patch.
> 

will fix that.

> But, does it even need to be a parameter? AFAICS you always pass true,
> and pwc=true is sort of implied by the name isn't it?
> 

I don't have strong opinion about that. I was wondering having flush_pwc 
explicitly called out is a better indication of we are flushing page 
walk cache. Will drop that in the next update.


-aneesh
