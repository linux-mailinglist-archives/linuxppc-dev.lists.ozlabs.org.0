Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B5F6B302173
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Jan 2021 05:54:03 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DPHZb4kSHzDqlc
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Jan 2021 15:53:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ananth@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=fe6TLaUR; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DPHXt3GSMzDqjy
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Jan 2021 15:52:29 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 10P4VFoQ142104; Sun, 24 Jan 2021 23:52:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=reply-to : subject : to
 : cc : references : from : message-id : date : mime-version : in-reply-to
 : content-type : content-transfer-encoding; s=pp1;
 bh=uXwS8pEZBOv0UZXHNmaJyaLojpd95+/Z/7F7wb6AYoE=;
 b=fe6TLaURcEbSgZYhAx5Id4S86ir69AxzYS3KJh83dWEojap2jGp4KmX9gY5IfZQDJmOJ
 Fw5bOiyN4n99/faIn4CyJGpv4nkD3L35DSQcZ/+2BxJ/vtvT9G2CJTFIgjT5vJVM8Kj7
 dyqy7lzKU62D5A81aowhVYQyumYO35nC0QUN/I2JJZ2+Kb1cj2zWG+Z6eldpK3m7bmUT
 Fol6dgsvYVDFQFNlFx1n+8KXMwAS8a+ZqP9of8k2X8UvjOYoBaLbrQ74U/xvcfeRBNZV
 YASu/JsfgUVe0s3HWwxRDrLBJCz308lq7IZgFVN4tWcqyRHcVrJ9Y+T6N26UpfQdwogk Dw== 
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0b-001b2d01.pphosted.com with ESMTP id 369pregn45-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 24 Jan 2021 23:52:22 -0500
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 10P4gXMA000339;
 Mon, 25 Jan 2021 04:52:22 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma03dal.us.ibm.com with ESMTP id 368be8q8vb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 25 Jan 2021 04:52:22 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 10P4qK5M30999006
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 25 Jan 2021 04:52:20 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 814F67805E;
 Mon, 25 Jan 2021 04:52:20 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 89F117805F;
 Mon, 25 Jan 2021 04:52:18 +0000 (GMT)
Received: from [9.199.63.224] (unknown [9.199.63.224])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 25 Jan 2021 04:52:18 +0000 (GMT)
Subject: Re: [PATCH] lib/sstep: Fix incorrect return from analyze_instr()
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org
References: <161124771457.333703.14641179082577500423.stgit@thinktux.local>
 <87zh10pk50.fsf@mpe.ellerman.id.au>
From: Ananth N Mavinakayanahalli <ananth@linux.ibm.com>
Organization: IBM
Message-ID: <c3ed79d8-ab18-ddd9-2dab-216a19a73f34@linux.ibm.com>
Date: Mon, 25 Jan 2021 10:22:17 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <87zh10pk50.fsf@mpe.ellerman.id.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-25_01:2021-01-22,
 2021-01-25 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0
 impostorscore=0 mlxlogscore=999 malwarescore=0 lowpriorityscore=0
 mlxscore=0 phishscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101250020
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
Reply-To: ananth@linux.ibm.com
Cc: naveen.n.rao@linux.ibm.com, ravi.bangoria@linux.ibm.com, paulus@samba.org,
 sandipan@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 1/23/21 6:03 AM, Michael Ellerman wrote:
> Ananth N Mavinakayanahalli <ananth@linux.ibm.com> writes:
>> We currently just percolate the return value from analyze_instr()
>> to the caller of emulate_step(), especially if it is a -1.
>>
>> For one particular case (opcode = 4) for instructions that
>> aren't currently emulated, we are returning 'should not be
>> single-stepped' while we should have returned 0 which says
>> 'did not emulate, may have to single-step'.
>>
>> Signed-off-by: Ananth N Mavinakayanahalli <ananth@linux.ibm.com>
>> Tested-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
>> ---
>>   arch/powerpc/lib/sstep.c |   49 +++++++++++++++++++++++++---------------------
>>   1 file changed, 27 insertions(+), 22 deletions(-)
>>
>> diff --git a/arch/powerpc/lib/sstep.c b/arch/powerpc/lib/sstep.c
>> index 5a425a4a1d88..a3a0373843cd 100644
>> --- a/arch/powerpc/lib/sstep.c
>> +++ b/arch/powerpc/lib/sstep.c
>> @@ -1445,34 +1445,39 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
>>   
>>   #ifdef __powerpc64__
>>   	case 4:
>> -		if (!cpu_has_feature(CPU_FTR_ARCH_300))
>> -			return -1;
>> -
>> -		switch (word & 0x3f) {
>> -		case 48:	/* maddhd */
>> -			asm volatile(PPC_MADDHD(%0, %1, %2, %3) :
>> -				     "=r" (op->val) : "r" (regs->gpr[ra]),
>> -				     "r" (regs->gpr[rb]), "r" (regs->gpr[rc]));
>> -			goto compute_done;
>> +		/*
>> +		 * There are very many instructions with this primary opcode
>> +		 * introduced in the ISA as early as v2.03. However, the ones
>> +		 * we currently emulate were all introduced with ISA 3.0
>> +		 */
>> +		if (cpu_has_feature(CPU_FTR_ARCH_300)) {
>> +			switch (word & 0x3f) {
>> +			case 48:	/* maddhd */
>> +				asm volatile(PPC_MADDHD(%0, %1, %2, %3) :
>> +					     "=r" (op->val) : "r" (regs->gpr[ra]),
>> +					     "r" (regs->gpr[rb]), "r" (regs->gpr[rc]));
>> +				goto compute_done;
> 
> Indenting everything makes this patch harder to read, and I think makes
> the resulting code harder to read too. We already have two levels of
> switch here, and we're inside a ~1700 line function, so keeping things
> simple is important I think.
> 
> Doesn't this achieve the same result?
> 
> diff --git a/arch/powerpc/lib/sstep.c b/arch/powerpc/lib/sstep.c
> index bf7a7d62ae8b..d631baaf1da2 100644
> --- a/arch/powerpc/lib/sstep.c
> +++ b/arch/powerpc/lib/sstep.c
> @@ -1443,8 +1443,10 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
>   
>   #ifdef __powerpc64__
>   	case 4:
> -		if (!cpu_has_feature(CPU_FTR_ARCH_300))
> -			return -1;
> +		if (!cpu_has_feature(CPU_FTR_ARCH_300)) {
> +			op->type = UNKNOWN;
> +			return 0;
> +		}
>   
>   		switch (word & 0x3f) {
>   		case 48:	/* maddhd */
> @@ -1470,7 +1472,8 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
>   		 * There are other instructions from ISA 3.0 with the same
>   		 * primary opcode which do not have emulation support yet.
>   		 */
> -		return -1;
> +		op->type = UNKNOWN;
> +		return 0;
>   #endif
>   
>   	case 7:		/* mulli */
> 

Looks good to me.

Acked-by: Ananth N Mavinakayanahalli <ananth@linux.ibm.com>


-- 
Ananth
