Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C17201DBBA2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 May 2020 19:37:31 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49S0Lv3wnvzDqcm
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 May 2020 03:37:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ldufour@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49S0Jt4VsHzDqXK
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 May 2020 03:35:42 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 04KHXvS1122470; Wed, 20 May 2020 13:35:30 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 312cqpnavx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 20 May 2020 13:35:29 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 04KHUX26009637;
 Wed, 20 May 2020 17:35:27 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma03ams.nl.ibm.com with ESMTP id 313xas42xy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 20 May 2020 17:35:27 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 04KHYDdi66584912
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 20 May 2020 17:34:13 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7D54DAE051;
 Wed, 20 May 2020 17:35:25 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 11121AE045;
 Wed, 20 May 2020 17:35:25 +0000 (GMT)
Received: from pomme.local (unknown [9.145.151.133])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 20 May 2020 17:35:24 +0000 (GMT)
Subject: Re: [PATCH] KVM: PPC: Book3S HV: relax check on H_SVM_INIT_ABORT
To: Greg Kurz <groug@kaod.org>
References: <20200520165110.71020-1-ldufour@linux.ibm.com>
 <20200520193259.0b66db32@bahia.lan>
From: Laurent Dufour <ldufour@linux.ibm.com>
Message-ID: <22bc6a9f-e7fd-eb24-3441-444216a38e60@linux.ibm.com>
Date: Wed, 20 May 2020 19:35:24 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200520193259.0b66db32@bahia.lan>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.676
 definitions=2020-05-20_13:2020-05-20,
 2020-05-20 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0
 adultscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 malwarescore=0
 suspectscore=0 lowpriorityscore=0 clxscore=1011 cotscore=-2147483648
 spamscore=0 priorityscore=1501 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2005200142
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
Cc: linuxram@us.ibm.com, linux-kernel@vger.kernel.org, kvm-ppc@vger.kernel.org,
 paulus@samba.org, sukadev@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Le 20/05/2020 à 19:32, Greg Kurz a écrit :
> On Wed, 20 May 2020 18:51:10 +0200
> Laurent Dufour <ldufour@linux.ibm.com> wrote:
> 
>> The commit 8c47b6ff29e3 ("KVM: PPC: Book3S HV: Check caller of H_SVM_*
>> Hcalls") added checks of secure bit of SRR1 to filter out the Hcall
>> reserved to the Ultravisor.
>>
>> However, the Hcall H_SVM_INIT_ABORT is made by the Ultravisor passing the
>> context of the VM calling UV_ESM. This allows the Hypervisor to return to
>> the guest without going through the Ultravisor. Thus the Secure bit of SRR1
>> is not set in that particular case.
>>
>> In the case a regular VM is calling H_SVM_INIT_ABORT, this hcall will be
>> filtered out in kvmppc_h_svm_init_abort() because kvm->arch.secure_guest is
>> not set in that case.
>>
> 
> Why not checking vcpu->kvm->arch.secure_guest then ?

I don't think that's the right place.
> 
>> Fixes: 8c47b6ff29e3 ("KVM: PPC: Book3S HV: Check caller of H_SVM_* Hcalls")
>> Signed-off-by: Laurent Dufour <ldufour@linux.ibm.com>
>> ---
>>   arch/powerpc/kvm/book3s_hv.c | 4 +---
>>   1 file changed, 1 insertion(+), 3 deletions(-)
>>
>> diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
>> index 93493f0cbfe8..eb1f96cb7b72 100644
>> --- a/arch/powerpc/kvm/book3s_hv.c
>> +++ b/arch/powerpc/kvm/book3s_hv.c
>> @@ -1099,9 +1099,7 @@ int kvmppc_pseries_do_hcall(struct kvm_vcpu *vcpu)
>>   			ret = kvmppc_h_svm_init_done(vcpu->kvm);
>>   		break;
>>   	case H_SVM_INIT_ABORT:
>> -		ret = H_UNSUPPORTED;
>> -		if (kvmppc_get_srr1(vcpu) & MSR_S)
>> -			ret = kvmppc_h_svm_init_abort(vcpu->kvm);
> 
> or at least put a comment to explain why H_SVM_INIT_ABORT
> doesn't have the same sanity check as the other SVM hcalls.

I agree that might help. I'll send a v2 with a comment there.

> 
>> +		ret = kvmppc_h_svm_init_abort(vcpu->kvm);
>>   		break;
>>   
>>   	default:
> 

