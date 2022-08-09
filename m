Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BB89858D3BC
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Aug 2022 08:28:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M236S54Lvz3bmL
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Aug 2022 16:28:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=OaR3KmtM;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=OaR3KmtM;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M235m56Csz2xG6
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Aug 2022 16:27:40 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2796HQNs009565;
	Tue, 9 Aug 2022 06:27:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=LqV0tgEDHn/Q8ToMnuJPXMSZh5ZnjNrsgHVySJI4MnY=;
 b=OaR3KmtMcw6xOBqO+m4VoT14iyYFhB8G2LYtHkWL9efXPVjSTyQUJwFBpKQ3Mxp4hPWQ
 KwJzJH/sjFhSEtsKVRbJhzWbzq24s65r5v/qyIGwdi7jxnApA9vq87jsc/4iB4spVwDz
 t0+gRZH+Xv+4Gd5JzxInecimRiRRfq50eRKxgjWKVhjYNLinkDiTZP+VX6gqFta35P4b
 g/riHGV0PR8E+4gEhEWmJFehsWE7qp6B8yluHJTgqCwoJzrurbtxncf7Bygs+LDP8we7
 h9Ctb6/WJlZ+/PFHAFG/iYKlP/nIhPyuxBLJRl6QR/Vg5L7RgA65L0vCUvtvPl1lur5M sw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3huj6d07gq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Aug 2022 06:27:30 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2796K849024628;
	Tue, 9 Aug 2022 06:27:29 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3huj6d07g3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Aug 2022 06:27:29 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
	by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2796KwOp006106;
	Tue, 9 Aug 2022 06:27:28 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
	by ppma06ams.nl.ibm.com with ESMTP id 3hu4rp8pa0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Aug 2022 06:27:27 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com [9.149.105.62])
	by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2796RPaq18285010
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 9 Aug 2022 06:27:25 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8A4B5AE04D;
	Tue,  9 Aug 2022 06:27:25 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B0AD6AE045;
	Tue,  9 Aug 2022 06:27:23 +0000 (GMT)
Received: from [9.109.205.170] (unknown [9.109.205.170])
	by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Tue,  9 Aug 2022 06:27:23 +0000 (GMT)
Message-ID: <31d46397-76a4-dba0-5a74-f112134e69cb@linux.ibm.com>
Date: Tue, 9 Aug 2022 11:57:22 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v3] powerpc/mm: Support execute-only memory on the Radix
 MMU
Content-Language: en-US
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
        Russell Currey <ruscur@russell.cc>,
        "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
References: <20220809024433.17644-1-ruscur@russell.cc>
 <a92bd3e4-a351-02a4-12df-bb08d489327f@csgroup.eu>
From: Aneesh Kumar K V <aneesh.kumar@linux.ibm.com>
In-Reply-To: <a92bd3e4-a351-02a4-12df-bb08d489327f@csgroup.eu>
Content-Type: text/plain; charset=UTF-8
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 7TDFYcblgG1aBfMS_5cdEENEEnZ8zbdd
X-Proofpoint-ORIG-GUID: h1EVujkW9OCDjLkqblpzs15dX_CT0Kuj
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-09_03,2022-08-09_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 bulkscore=0 impostorscore=0 mlxscore=0 adultscore=0 suspectscore=0
 spamscore=0 mlxlogscore=999 priorityscore=1501 clxscore=1011 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2208090026
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
Cc: "linux-hardening@vger.kernel.org" <linux-hardening@vger.kernel.org>, "ajd@linux.ibm.com" <ajd@linux.ibm.com>, "npiggin@gmail.com" <npiggin@gmail.com>, "anshuman.khandual@arm.com" <anshuman.khandual@arm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 8/9/22 11:21 AM, Christophe Leroy wrote:
> Le 09/08/2022 à 04:44, Russell Currey a écrit :
>> The Hash MMU already supports XOM (i.e. mmap with PROT_EXEC only)
>> through the execute-only pkey.  A PROT_EXEC-only mapping will actually
>> map to RX, and then the pkey will be applied on top of it.
> 
> I don't think XOM is a commonly understood accronym. Maybe the first 
> time you use it it'd be better to say something like:
> 
> The Hash MMU already supports execute-only memory (XOM)
> 
> When you say that Hash MMU supports it through the execute-only pkey, 
> does it mean that it is taken into account automatically at mmap time, 
> or does the userspace app has to do something special to use the key ? 
> If it is the second, it means that depending on whether you are radix or 
> not, you must do something different ? Is that expected ?
> 
>>
>> Radix doesn't have pkeys, but it does have execute permissions built-in
>> to the MMU, so all we have to do to support XOM is expose it.
>>
>> Signed-off-by: Russell Currey <ruscur@russell.cc>
>> ---
>> v3: Incorporate Aneesh's suggestions, leave protection_map untouched
>> Basic test: https://github.com/ruscur/junkcode/blob/main/mmap_test.c
>>
>>   arch/powerpc/include/asm/book3s/64/pgtable.h |  2 ++
>>   arch/powerpc/mm/book3s64/pgtable.c           | 11 +++++++++--
>>   arch/powerpc/mm/fault.c                      |  6 +++++-
>>   3 files changed, 16 insertions(+), 3 deletions(-)
>>
>> diff --git a/arch/powerpc/include/asm/book3s/64/pgtable.h b/arch/powerpc/include/asm/book3s/64/pgtable.h
>> index 392ff48f77df..486902aff040 100644
>> --- a/arch/powerpc/include/asm/book3s/64/pgtable.h
>> +++ b/arch/powerpc/include/asm/book3s/64/pgtable.h
>> @@ -151,6 +151,8 @@
>>   #define PAGE_COPY_X	__pgprot(_PAGE_BASE | _PAGE_READ | _PAGE_EXEC)
>>   #define PAGE_READONLY	__pgprot(_PAGE_BASE | _PAGE_READ)
>>   #define PAGE_READONLY_X	__pgprot(_PAGE_BASE | _PAGE_READ | _PAGE_EXEC)
>> +/* Radix only, Hash uses PAGE_READONLY_X + execute-only pkey instead */
>> +#define PAGE_EXECONLY	__pgprot(_PAGE_BASE | _PAGE_EXEC)
>>   
>>   /* Permission masks used for kernel mappings */
>>   #define PAGE_KERNEL	__pgprot(_PAGE_BASE | _PAGE_KERNEL_RW)
>> diff --git a/arch/powerpc/mm/book3s64/pgtable.c b/arch/powerpc/mm/book3s64/pgtable.c
>> index 7b9966402b25..62f63d344596 100644
>> --- a/arch/powerpc/mm/book3s64/pgtable.c
>> +++ b/arch/powerpc/mm/book3s64/pgtable.c
>> @@ -553,8 +553,15 @@ EXPORT_SYMBOL_GPL(memremap_compat_align);
>>   
>>   pgprot_t vm_get_page_prot(unsigned long vm_flags)
>>   {
>> -	unsigned long prot = pgprot_val(protection_map[vm_flags &
>> -					(VM_READ|VM_WRITE|VM_EXEC|VM_SHARED)]);
>> +	unsigned long prot;
>> +
>> +	/* Radix supports execute-only, but protection_map maps X -> RX */
>> +	if (radix_enabled() && ((vm_flags & (VM_READ|VM_WRITE|VM_EXEC)) == VM_EXEC)) {
> 
> Maybe use VM_ACCESS_FLAGS ?
> 
>> +		prot = pgprot_val(PAGE_EXECONLY);
>> +	} else {
>> +		prot = pgprot_val(protection_map[vm_flags &
>> +				  (VM_READ|VM_WRITE|VM_EXEC|VM_SHARED)]);
>> +	}
>>   
>>   	if (vm_flags & VM_SAO)
>>   		prot |= _PAGE_SAO;
>> diff --git a/arch/powerpc/mm/fault.c b/arch/powerpc/mm/fault.c
>> index 014005428687..59e4cbcf3109 100644
>> --- a/arch/powerpc/mm/fault.c
>> +++ b/arch/powerpc/mm/fault.c
>> @@ -270,7 +270,11 @@ static bool access_error(bool is_write, bool is_exec, struct vm_area_struct *vma
>>   		return false;
>>   	}
>>   
>> -	if (unlikely(!vma_is_accessible(vma)))
>> +	/* On Radix, a read fault could be from PROT_NONE or PROT_EXEC */
>> +	if (unlikely(radix_enabled() && !(vma->vm_flags & VM_READ)))
>> +		return true;
> 
> Why do you need the radix_enabled() here ?
> Even if it doesn't fault directly, reading a non readable area is still 
> an error and should be handled as such, even on hardware that will not 
> generate a fault for it at the first place. So I'd just do:
> 
> 	if (!(vma->vm_flags & VM_READ)))
> 		return true;
> 
>> +	/* Check for a PROT_NONE fault on other MMUs */
>> +	else if (unlikely(!vma_is_accessible(vma)))
>>   		return true;
>>   	/*
>>   	 * We should ideally do the vma pkey access check here. But in the
> 
> Don't use an if/else construct, there is no other 'else' in that 
> function, or in similar functions like bad_kernel_fault() for instance.
> 
> So leave the !vma_is_accessible(vma) untouched and add your check as a 
> standalone check before or after it.


What does vma_is_accessible() check bring if we have the VM_READ check unconditional ?

-aneesh


