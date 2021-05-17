Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A049382738
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 May 2021 10:41:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FkCJq39HWz2ysp
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 May 2021 18:40:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ctu4xTAj;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=ctu4xTAj; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FkCJJ1NqTz2xZs
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 May 2021 18:40:31 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14H8Y4at017531; Mon, 17 May 2021 04:40:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=kIU1lbbEqWOHWy62XHBeVXvsZ7VIazqJRbJoiGNYWyE=;
 b=ctu4xTAj6xkMTSebegg/MgZ4HG47p1Vpwd+bjNQr6S0OeGf0HP0889vV4WfTKh76yIf7
 e24UgtaYWwDT1HM4VD8uBejpiwjtyr4RX2uBezP92QfLa4JTwftajapoHWNioxKlexmw
 GSxtCAqFz7Wq32GlF4pD67fQfEdFpwc5UA1sL3PzIeclIZAcX1TJebFu3NbizbPTE39R
 6776lqx6K7d+jwO/4wxnDPD71Y6Og3/iYvAlhp9Az8G+IEBzE1hT/8T2GUSL9lxIlVZM
 EY98LGsueqHuDAOwYfcGJ5yKcMGDLHF1RN/w2uvGIqWYpFX5J2DGHCxYBLBr5ra+LkOS Yg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38khqsw8y4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 May 2021 04:40:11 -0400
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 14H8YG9K018138;
 Mon, 17 May 2021 04:40:11 -0400
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38khqsw8wy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 May 2021 04:40:10 -0400
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 14H8arb8003805;
 Mon, 17 May 2021 08:40:08 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma04fra.de.ibm.com with ESMTP id 38j5x80caf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 May 2021 08:40:08 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 14H8e6ru16843238
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 17 May 2021 08:40:06 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 079E011C058;
 Mon, 17 May 2021 08:40:06 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6FCAD11C05E;
 Mon, 17 May 2021 08:40:04 +0000 (GMT)
Received: from [9.199.40.240] (unknown [9.199.40.240])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 17 May 2021 08:40:04 +0000 (GMT)
Subject: Re: [PATCH v5 5/9] powerpc/mm/book3s64: Update tlb flush routines to
 take a page walk cache flush argument
To: Guenter Roeck <linux@roeck-us.net>
References: <20210422054323.150993-1-aneesh.kumar@linux.ibm.com>
 <20210422054323.150993-6-aneesh.kumar@linux.ibm.com>
 <20210515163525.GA1106462@roeck-us.net>
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Message-ID: <e0eba73a-c2df-71c3-e03d-d4074d908fca@linux.ibm.com>
Date: Mon, 17 May 2021 14:10:03 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210515163525.GA1106462@roeck-us.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: CgTrDKX4FOdkim7uHJ4rZNxjRWJUMIsx
X-Proofpoint-GUID: 6rJ0y8hBBV9htLm0-zEPoU_R1xL2GUsl
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-17_03:2021-05-12,
 2021-05-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0
 mlxscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 malwarescore=0 adultscore=0 clxscore=1011 mlxlogscore=999 spamscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2105170061
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
Cc: npiggin@gmail.com, linux-mm@kvack.org, kaleshsingh@google.com,
 joel@joelfernandes.org, akpm@linux-foundation.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 5/15/21 10:05 PM, Guenter Roeck wrote:
> On Thu, Apr 22, 2021 at 11:13:19AM +0530, Aneesh Kumar K.V wrote:
>> No functional change in this patch
>>
>> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
>> ---
>>   .../include/asm/book3s/64/tlbflush-radix.h    | 19 +++++++-----
>>   arch/powerpc/include/asm/book3s/64/tlbflush.h | 23 ++++++++++++---
>>   arch/powerpc/mm/book3s64/radix_hugetlbpage.c  |  4 +--
>>   arch/powerpc/mm/book3s64/radix_tlb.c          | 29 +++++++------------
>>   4 files changed, 42 insertions(+), 33 deletions(-)
>>
>> diff --git a/arch/powerpc/include/asm/book3s/64/tlbflush-radix.h b/arch/powerpc/include/asm/book3s/64/tlbflush-radix.h
>> index 8b33601cdb9d..171441a43b35 100644
>> --- a/arch/powerpc/include/asm/book3s/64/tlbflush-radix.h
>> +++ b/arch/powerpc/include/asm/book3s/64/tlbflush-radix.h
>> @@ -56,15 +56,18 @@ static inline void radix__flush_all_lpid_guest(unsigned int lpid)
>>   }
>>   #endif
>>   
>> -extern void radix__flush_hugetlb_tlb_range(struct vm_area_struct *vma,
>> -					   unsigned long start, unsigned long end);
>> -extern void radix__flush_tlb_range_psize(struct mm_struct *mm, unsigned long start,
>> -					 unsigned long end, int psize);
>> -extern void radix__flush_pmd_tlb_range(struct vm_area_struct *vma,
>> -				       unsigned long start, unsigned long end);
>> -extern void radix__flush_tlb_range(struct vm_area_struct *vma, unsigned long start,
>> +void radix__flush_hugetlb_tlb_range(struct vm_area_struct *vma,
>> +				    unsigned long start, unsigned long end,
>> +				    bool flush_pwc);
>> +void radix__flush_pmd_tlb_range(struct vm_area_struct *vma,
>> +				unsigned long start, unsigned long end,
>> +				bool flush_pwc);
>> +void radix__flush_tlb_pwc_range_psize(struct mm_struct *mm, unsigned long start,
>> +				      unsigned long end, int psize, bool flush_pwc);
>> +void radix__flush_tlb_range(struct vm_area_struct *vma, unsigned long start,
>>   			    unsigned long end);
>> -extern void radix__flush_tlb_kernel_range(unsigned long start, unsigned long end);
>> +void radix__flush_tlb_kernel_range(unsigned long start, unsigned long end);
>> +
>>   
>>   extern void radix__local_flush_tlb_mm(struct mm_struct *mm);
>>   extern void radix__local_flush_all_mm(struct mm_struct *mm);
>> diff --git a/arch/powerpc/include/asm/book3s/64/tlbflush.h b/arch/powerpc/include/asm/book3s/64/tlbflush.h
>> index 215973b4cb26..f9f8a3a264f7 100644
>> --- a/arch/powerpc/include/asm/book3s/64/tlbflush.h
>> +++ b/arch/powerpc/include/asm/book3s/64/tlbflush.h
>> @@ -45,13 +45,30 @@ static inline void tlbiel_all_lpid(bool radix)
>>   		hash__tlbiel_all(TLB_INVAL_SCOPE_LPID);
>>   }
>>   
>> +static inline void flush_pmd_tlb_pwc_range(struct vm_area_struct *vma,
>                   ^^^^
>> +					   unsigned long start,
>> +					   unsigned long end,
>> +					   bool flush_pwc)
>> +{
>> +	if (radix_enabled())
>> +		return radix__flush_pmd_tlb_range(vma, start, end, flush_pwc);
>> +	return hash__flush_tlb_range(vma, start, end);
>          ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> 
>> +}

In this specific case we won't have  build errors because,

static inline void hash__flush_tlb_range(struct vm_area_struct *vma,
				     unsigned long start, unsigned long end)
{


But I agree the below is better to read.

static inline void flush_pmd_tlb_pwc_range(struct vm_area_struct *vma,
					   unsigned long start,
					   unsigned long end,
					   bool flush_pwc)
{
	if (radix_enabled())
		radix__flush_pmd_tlb_range(vma, start, end, flush_pwc);
	else
		hash__flush_tlb_range(vma, start, end);
	return
}

> 
>>   
>>   #define __HAVE_ARCH_FLUSH_PMD_TLB_RANGE
>>   static inline void flush_pmd_tlb_range(struct vm_area_struct *vma,
>                   ^^^^
>>   				       unsigned long start, unsigned long end)
>> +{
>> +	return flush_pmd_tlb_pwc_range(vma, start, end, false);
>          ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> 
> Doesn't that cause build warnings/errors all over the place ?
> 
> Guenter
> 


-aneesh
