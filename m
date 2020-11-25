Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 987E12C4225
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Nov 2020 15:24:31 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ch3710Nd1zDqsN
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Nov 2020 01:24:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=NTu8Mu3S; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Ch2Wc3ZltzDqrM
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Nov 2020 00:57:16 +1100 (AEDT)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0APDWZqO030881; Wed, 25 Nov 2020 08:57:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=YGnT9p4JwF8ZNImblN+4l0hFe0rlkrmyccVU904Men8=;
 b=NTu8Mu3S+CfIHhbt4D2Fz9DpUdVzswcAsw+oOva9aODt/IlyMZc6PRfG14mU/EX1dPeb
 snwZ9wONFZqenew+Xshs1g6A/uz3c9oS2lH9aixuTEb3X+qYtod10/2GD8wh7b+W/4jC
 mq5qG9GlDbS5LA0Bi14uX2YZ4JPe6ovvOphzDAF0CuJZAmr11ORc4ICYTOfSdnjiKaVn
 CsrLsy0gdXKoagd+PvCFfVOPkmfUUcyiAVZmOAXbg1vfqK+j77nJtx9VeYCYXN/BVCN9
 8OKVVR7ThFB9xe2D5VZoJTC+gwZROWnl7/11MBUEGxz5uMXaIFJiZkm7QrV+qAg7putW Yg== 
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com with ESMTP id 351qn6207e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 25 Nov 2020 08:57:05 -0500
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0APDqwto013358;
 Wed, 25 Nov 2020 13:57:02 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma05fra.de.ibm.com with ESMTP id 34y6k4t6jg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 25 Nov 2020 13:57:02 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 0APDv0rv42139918
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 25 Nov 2020 13:57:00 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7A22742047;
 Wed, 25 Nov 2020 13:57:00 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2733542045;
 Wed, 25 Nov 2020 13:56:59 +0000 (GMT)
Received: from [9.77.195.3] (unknown [9.77.195.3])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 25 Nov 2020 13:56:58 +0000 (GMT)
Subject: Re: [PATCH v6 11/22] powerpc/book3s64/pkeys: Inherit correctly on
 fork.
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
References: <20201125051634.509286-1-aneesh.kumar@linux.ibm.com>
 <20201125051634.509286-12-aneesh.kumar@linux.ibm.com>
 <38a05d5e-5009-9a00-c1fb-5dd60bba1802@csgroup.eu>
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Message-ID: <fd37ed84-6b46-17ed-af48-d303dd0da355@linux.ibm.com>
Date: Wed, 25 Nov 2020 19:26:57 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <38a05d5e-5009-9a00-c1fb-5dd60bba1802@csgroup.eu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-25_08:2020-11-25,
 2020-11-25 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0 spamscore=0
 malwarescore=0 mlxlogscore=999 priorityscore=1501 impostorscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011250080
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
Cc: Sandipan Das <sandipan@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 11/25/20 7:24 PM, Christophe Leroy wrote:
> 
> 
> Le 25/11/2020 à 06:16, Aneesh Kumar K.V a écrit :
>> Child thread.kuap value is inherited from the parent in 
>> copy_thread_tls. We still
>> need to make sure when the child returns from a fork in the kernel we 
>> start with the kernel
>> default AMR value.
>>
>> Reviewed-by: Sandipan Das <sandipan@linux.ibm.com>
>> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
>> ---
>>   arch/powerpc/kernel/process.c | 11 +++++++++++
>>   1 file changed, 11 insertions(+)
>>
>> diff --git a/arch/powerpc/kernel/process.c 
>> b/arch/powerpc/kernel/process.c
>> index b6b8a845e454..733680de0ba4 100644
>> --- a/arch/powerpc/kernel/process.c
>> +++ b/arch/powerpc/kernel/process.c
>> @@ -1768,6 +1768,17 @@ int copy_thread(unsigned long clone_flags, 
>> unsigned long usp,
>>           childregs->ppr = DEFAULT_PPR;
>>       p->thread.tidr = 0;
>> +#endif
>> +    /*
>> +     * Run with the current AMR value of the kernel
>> +     */
>> +#ifdef CONFIG_PPC_KUAP
>> +    if (mmu_has_feature(MMU_FTR_KUAP))
>> +        kregs->kuap = AMR_KUAP_BLOCKED;
>> +#endif
> 
> Do we need that ifdef at all ?
> 
> Shouldn't mmu_has_feature(MMU_FTR_KUAP) be always false and get 
> optimised out when CONFIG_PPC_KUAP is not defined ?
> 
>> +#ifdef CONFIG_PPC_KUEP
>> +    if (mmu_has_feature(MMU_FTR_KUEP))
>> +        kregs->iamr = AMR_KUEP_BLOCKED;
> 
> Same ?
> 
>>   #endif
>>       kregs->nip = ppc_function_entry(f);
>>       return 0;
>>

Not really. I did hit a compile error with this patch on 
mpc885_ads_defconfig and that required me to do

modified   arch/powerpc/kernel/process.c
@@ -1772,11 +1772,10 @@ int copy_thread(unsigned long clone_flags, 
unsigned long usp,
  	/*
  	 * Run with the current AMR value of the kernel
  	 */
-#ifdef CONFIG_PPC_KUAP
+#ifdef CONFIG_PPC_PKEY
  	if (mmu_has_feature(MMU_FTR_KUAP))
-		kregs->kuap = AMR_KUAP_BLOCKED;
-#endif
-#ifdef CONFIG_PPC_KUEP
+		kregs->amr = AMR_KUAP_BLOCKED;
+
  	if (mmu_has_feature(MMU_FTR_KUEP))
  		kregs->iamr = AMR_KUEP_BLOCKED;
  #endif



