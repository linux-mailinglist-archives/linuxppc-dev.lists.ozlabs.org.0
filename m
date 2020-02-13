Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 59D5915CEC9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Feb 2020 00:50:48 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48JYDN3YVszDqSK
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Feb 2020 10:50:44 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48JYBW5zz7zDqHl
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Feb 2020 10:49:06 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01DNhZJt009530; Thu, 13 Feb 2020 18:49:03 -0500
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2y4j872wkc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 13 Feb 2020 18:49:03 -0500
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 01DNd7w5010543;
 Thu, 13 Feb 2020 23:49:02 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma04dal.us.ibm.com with ESMTP id 2y5bc02fxu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 13 Feb 2020 23:49:02 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 01DNn1h822610278
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 13 Feb 2020 23:49:01 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AB529112066;
 Thu, 13 Feb 2020 23:49:01 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BEA86112061;
 Thu, 13 Feb 2020 23:49:00 +0000 (GMT)
Received: from oc6336877782.ibm.com (unknown [9.18.239.29])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu, 13 Feb 2020 23:49:00 +0000 (GMT)
Subject: Re: [PATCH] KVM: PPC: Book3S HV: Treat unrecognized TM instructions
 as illegal
To: Segher Boessenkool <segher@kernel.crashing.org>,
 Gustavo Romero <gromero@linux.ibm.com>
References: <20200213151532.12559-1-gromero@linux.ibm.com>
 <20200213233148.GK22482@gate.crashing.org>
From: Gustavo Romero <gromero@linux.vnet.ibm.com>
Message-ID: <7968cea9-da2d-d5f6-bcb7-8549ac6c1899@linux.vnet.ibm.com>
Date: Thu, 13 Feb 2020 20:49:00 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20200213233148.GK22482@gate.crashing.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-13_09:2020-02-12,
 2020-02-13 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 mlxscore=0
 impostorscore=0 malwarescore=0 spamscore=0 mlxlogscore=999 clxscore=1011
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2002130171
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
Cc: linuxppc-dev@lists.ozlabs.org, kvm-ppc@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Segher,

Thanks a lot for reviewing it.

On 02/13/2020 08:31 PM, Segher Boessenkool wrote:

<snip>

>> ---
>>   arch/powerpc/kvm/book3s_hv_tm.c | 6 +++++-
>>   1 file changed, 5 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/powerpc/kvm/book3s_hv_tm.c b/arch/powerpc/kvm/book3s_hv_tm.c
>> index 0db937497169..d342a9e11298 100644
>> --- a/arch/powerpc/kvm/book3s_hv_tm.c
>> +++ b/arch/powerpc/kvm/book3s_hv_tm.c
>> @@ -3,6 +3,8 @@
>>    * Copyright 2017 Paul Mackerras, IBM Corp. <paulus@au1.ibm.com>
>>    */
>>   
>> +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
>> +
>>   #include <linux/kvm_host.h>
>>   
>>   #include <asm/kvm_ppc.h>
>> @@ -208,6 +210,8 @@ int kvmhv_p9_tm_emulation(struct kvm_vcpu *vcpu)
>>   	}
>>   
>>   	/* What should we do here? We didn't recognize the instruction */
>> -	WARN_ON_ONCE(1);
>> +	kvmppc_core_queue_program(vcpu, SRR1_PROGILL);
>> +	pr_warn_ratelimited("Unrecognized TM-related instruction %#x for emulation", instr);
>> +
>>   	return RESUME_GUEST;
>>   }
> 
> Do we actually know it is TM-related here?  Otherwise, looks good to me :-)

Correct, I understand it's only TM-related here, so I don't expect anything else to hit 0x1500.


Best regards,
Gustavo
