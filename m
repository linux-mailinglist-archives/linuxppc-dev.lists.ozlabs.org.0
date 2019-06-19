Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B26204B64A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jun 2019 12:38:09 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45TLy70Y4RzDqdk
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jun 2019 20:38:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=fbarrat@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45TLwG1fXPzDqHm
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jun 2019 20:36:29 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5JAVjqw015692
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jun 2019 06:36:26 -0400
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2t7gsw0by0-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jun 2019 06:36:26 -0400
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <fbarrat@linux.ibm.com>;
 Wed, 19 Jun 2019 11:36:22 +0100
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 19 Jun 2019 11:36:18 +0100
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x5JAaGwx43974834
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 19 Jun 2019 10:36:17 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C834511C066;
 Wed, 19 Jun 2019 10:36:16 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 833E711C054;
 Wed, 19 Jun 2019 10:36:16 +0000 (GMT)
Received: from pic2.home (unknown [9.145.171.67])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 19 Jun 2019 10:36:16 +0000 (GMT)
Subject: Re: [PATCH] ocxl: Allow contexts to be attached with a NULL mm
To: Andrew Donnellan <ajd@linux.ibm.com>,
 "Alastair D'Silva" <alastair@au1.ibm.com>, alastair@d-silva.org
References: <20190617044152.13707-1-alastair@au1.ibm.com>
 <81f8951e-a095-3e13-4229-6475f6a8d4a5@linux.ibm.com>
From: Frederic Barrat <fbarrat@linux.ibm.com>
Date: Wed, 19 Jun 2019 12:36:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <81f8951e-a095-3e13-4229-6475f6a8d4a5@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19061910-0012-0000-0000-0000032A768C
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19061910-0013-0000-0000-000021639726
Message-Id: <682c9b63-7edd-eb4e-8d6f-2bfdd36453e4@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-19_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=889 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1906190088
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 18/06/2019 à 03:50, Andrew Donnellan a écrit :
> On 17/6/19 2:41 pm, Alastair D'Silva wrote:
>> From: Alastair D'Silva <alastair@d-silva.org>
>>
>> If an OpenCAPI context is to be used directly by a kernel driver, there
>> may not be a suitable mm to use.
>>
>> The patch makes the mm parameter to ocxl_context_attach optional.
>>
>> Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
> 
> The one issue I can see here is that using mm == NULL bypasses our 
> method of enabling/disabling global TLBIs in mm_context_add_copro().
> 
> Discussing this privately with Alastair and Fred - this should be fine, 
> but perhaps we should document that.


So indeed we should be fine. I confirmed with Nick that kernel space 
invalidations are already global today.
Nick mentioned that we should still be fine tomorrow, but in the distant 
future, we could imagine local usage of some part of the kernel space. 
It will require some work, but it would be best to add a comment in one 
of the kernel invalidation function (for example 
radix__flush_tlb_kernel_range()) that if a kernel invalidation ever 
becomes local, then clients of the nest MMU may need some work.

A few more comments below.


>> ---
>>   drivers/misc/ocxl/context.c |  9 ++++++---
>>   drivers/misc/ocxl/link.c    | 12 ++++++++----
>>   2 files changed, 14 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/misc/ocxl/context.c b/drivers/misc/ocxl/context.c
>> index bab9c9364184..994563a078eb 100644
>> --- a/drivers/misc/ocxl/context.c
>> +++ b/drivers/misc/ocxl/context.c
>> @@ -69,6 +69,7 @@ static void xsl_fault_error(void *data, u64 addr, 
>> u64 dsisr)
>>   int ocxl_context_attach(struct ocxl_context *ctx, u64 amr, struct 
>> mm_struct *mm)
>>   {
>>       int rc;
>> +    unsigned long pidr = 0;
>>       // Locks both status & tidr
>>       mutex_lock(&ctx->status_mutex);
>> @@ -77,9 +78,11 @@ int ocxl_context_attach(struct ocxl_context *ctx, 
>> u64 amr, struct mm_struct *mm)
>>           goto out;
>>       }
>> -    rc = ocxl_link_add_pe(ctx->afu->fn->link, ctx->pasid,
>> -            mm->context.id, ctx->tidr, amr, mm,
>> -            xsl_fault_error, ctx);
>> +    if (mm)
>> +        pidr = mm->context.id;
>> +
>> +    rc = ocxl_link_add_pe(ctx->afu->fn->link, ctx->pasid, pidr, 
>> ctx->tidr,
>> +                  amr, mm, xsl_fault_error, ctx);
>>       if (rc)
>>           goto out;
>> diff --git a/drivers/misc/ocxl/link.c b/drivers/misc/ocxl/link.c
>> index cce5b0d64505..43542f124807 100644
>> --- a/drivers/misc/ocxl/link.c
>> +++ b/drivers/misc/ocxl/link.c
>> @@ -523,7 +523,8 @@ int ocxl_link_add_pe(void *link_handle, int pasid, 
>> u32 pidr, u32 tidr,
>>       pe->amr = cpu_to_be64(amr);
>>       pe->software_state = cpu_to_be32(SPA_PE_VALID);
>> -    mm_context_add_copro(mm);
>> +    if (mm)
>> +        mm_context_add_copro(mm);


Same as above, we should add a comment here in the driver code that a 
kernel context is ok because invalidations are global.


We also need a new check in xsl_fault_handler(). A valid kernel address 
shouldn't fault, but it's still possible for the FPGA to try accessing a 
bogus kernel address. In which case, xsl_fault_handler() would be 
entered, with a valid fault context. We'll find pe_data in the tree 
based on the valid pe_handle, but pe_data->mm will be NULL. In that, we 
can return early, acknowledging the interrupt with ADDRESS_ERROR value 
(like we do if pe_data is not found in the tree).

   Fred


>>       /*
>>        * Barrier is to make sure PE is visible in the SPA before it
>>        * is used by the device. It also helps with the global TLBI
>> @@ -546,7 +547,8 @@ int ocxl_link_add_pe(void *link_handle, int pasid, 
>> u32 pidr, u32 tidr,
>>        * have a reference on mm_users. Incrementing mm_count solves
>>        * the problem.
>>        */
>> -    mmgrab(mm);
>> +    if (mm)
>> +        mmgrab(mm);
>>       trace_ocxl_context_add(current->pid, spa->spa_mem, pasid, pidr, 
>> tidr);
>>   unlock:
>>       mutex_unlock(&spa->spa_lock);
>> @@ -652,8 +654,10 @@ int ocxl_link_remove_pe(void *link_handle, int 
>> pasid)
>>       if (!pe_data) {
>>           WARN(1, "Couldn't find pe data when removing PE\n");
>>       } else {
>> -        mm_context_remove_copro(pe_data->mm);
>> -        mmdrop(pe_data->mm);
>> +        if (pe_data->mm) {
>> +            mm_context_remove_copro(pe_data->mm);
>> +            mmdrop(pe_data->mm);
>> +        }
>>           kfree_rcu(pe_data, rcu);
>>       }
>>   unlock:
>>
> 

