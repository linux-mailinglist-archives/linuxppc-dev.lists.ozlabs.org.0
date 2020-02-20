Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A3580166A06
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Feb 2020 22:42:07 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48Np2h52xdzDqR5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Feb 2020 08:42:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=gromero@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48Np0W2z8rzDq9T
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Feb 2020 08:40:10 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01KLSZWK049642; Thu, 20 Feb 2020 16:40:05 -0500
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2y9sbutp19-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 20 Feb 2020 16:40:05 -0500
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 01KLe4ZX025121;
 Thu, 20 Feb 2020 21:40:04 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma04wdc.us.ibm.com with ESMTP id 2y6896yyyx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 20 Feb 2020 21:40:04 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 01KLe3ci55116174
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 20 Feb 2020 21:40:03 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 51E5F78064;
 Thu, 20 Feb 2020 21:40:03 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E93FC78067;
 Thu, 20 Feb 2020 21:40:01 +0000 (GMT)
Received: from oc6336877782.ibm.com (unknown [9.18.235.171])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 20 Feb 2020 21:40:01 +0000 (GMT)
Subject: Re: [PATCH] KVM: PPC: Book3S HV: Treat TM-related invalid form
 instructions on P9 like the valid ones
To: Leonardo Bras <leonardo@linux.ibm.com>, kvm-ppc@vger.kernel.org,
 paulus@ozlabs.org
References: <20200218211324.23045-1-gromero@linux.ibm.com>
 <b19a8b0cb1ad8275458df16142756b30f8b288b7.camel@linux.ibm.com>
From: Gustavo Romero <gromero@linux.vnet.ibm.com>
Message-ID: <0b2174c9-dd72-c978-4410-73d358ab13d2@linux.vnet.ibm.com>
Date: Thu, 20 Feb 2020 18:40:01 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <b19a8b0cb1ad8275458df16142756b30f8b288b7.camel@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-20_17:2020-02-19,
 2020-02-20 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0
 mlxscore=0 malwarescore=0 bulkscore=0 mlxlogscore=999 impostorscore=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 suspectscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2002200157
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
Cc: mikey@neuling.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Leonardo,

Thanks a lot for the review.

On 02/20/2020 02:51 PM, Leonardo Bras wrote:
>> +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
>> +
> 
> Could not see where is this used.

This is used by pr_warn_ratelimited() below so the module name is printed before
the message, for instance:

[531454.670909] kvm_hv: Unrecognized TM-related instruction 0x7c00075c for emulation


>>   #include <linux/kvm_host.h>
>>
>>   #include <asm/kvm_ppc.h>
>> @@ -44,7 +46,18 @@ int kvmhv_p9_tm_emulation(struct kvm_vcpu *vcpu)
>>   	u64 newmsr, bescr;
>>   	int ra, rs;
>>
>> -	switch (instr & 0xfc0007ff) {
>> +	/*
>> +	 * rfid, rfebb, and mtmsrd encode bit 31 = 0 since it's a reserved bit
>> +	 * in these instructions, so masking bit 31 out doesn't change these
>> +	 * instructions. For treclaim., tsr., and trechkpt. instructions if bit
>> +	 * 31 = 0 then they are per ISA invalid forms, however P9 UM, in section
>> +	 * 4.6.10 Book II Invalid Forms, informs specifically that ignoring bit
>> +	 * 31 is an acceptable way to handle these invalid forms that have
>> +	 * bit 31 = 0. Moreover, for emulation purposes both forms (w/ and wo/
>> +	 * bit 31 set) can generate a softpatch interrupt. Hence both forms
>> +	 * are handled below for these instructions so they behave the same way.
>> +	 */
>> +	switch (instr & PO_XOP_OPCODE_MASK) {
>>
> <SNIP>
>> -	case PPC_INST_TRECHKPT:
>> +	/* ignore bit 31, see comment above */
>> +	case (PPC_INST_TRECHKPT & PO_XOP_OPCODE_MASK):
>>   		/* XXX do we need to check for PR=0 here? */
>>   		/* check for TM disabled in the HFSCR or MSR */
>>   		if (!(vcpu->arch.hfscr & HFSCR_TM)) {
>> @@ -208,6 +224,8 @@ int kvmhv_p9_tm_emulation(struct kvm_vcpu *vcpu)
>>   	}
>>
> 
> Seems good, using the same flag to mask out bit 31 of these macros.
> They are used only in a few places, and I think removing the macro bit
> would be ok, but I think your way is better to keep it documented.
> 
> I just noticed that there is a similar function that uses PPC_INST_TSR:
> kvmhv_p9_tm_emulation_early @ arch/powerpc/kvm/book3s_hv_tm_builtin.c.
> Wouldn't it need to be changed as well?

oh! you're right, I forgot that one. I'll send a v3.


>>   	/* What should we do here? We didn't recognize the instruction */
>> -	WARN_ON_ONCE(1);
>> +	kvmppc_core_queue_program(vcpu, SRR1_PROGILL);
>> +	pr_warn_ratelimited("Unrecognized TM-related instruction %#x for emulation", instr);
>> +
>>   	return RESUME_GUEST;
>>   }
> 
> I suppose this is the right thing to do, but I think it would be better
> to give this change it's own patch.
> 
> What do you think?

I think it's sufficiently self-contained and trivial to be in the same file and
to be in a single commit.


Best regards,
Gustavo
