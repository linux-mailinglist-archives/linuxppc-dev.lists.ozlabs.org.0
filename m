Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 057E93D7899
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Jul 2021 16:37:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GYzsS6nGPz3bbv
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Jul 2021 00:37:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=MZeR0fkg;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=farosas@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=MZeR0fkg; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GYzry1D8gz3005
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Jul 2021 00:37:05 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16REXgq9178457; Tue, 27 Jul 2021 10:36:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=MQ4ux33af7VadX0imatqcwUcNfNmUpD8TX9W/+DBEt0=;
 b=MZeR0fkgwbSXvS6OMfEquZ7bn2+U6rdOBFFkrIHMqlDFkL7CcTLDaAe7+IIlL1WFqsgx
 5L8s2ATFs1qiKzISu8Su1a4b6Jmh7wQY67m0+3LG2IxyPBhmA2JKoShx9VNqw+t68OMi
 nK1XnwQbuVbnu0JFkFxxbiO/lR3cZ7M23yls8elHNoJ7lVP1rA7crVGnuJNKhxsnPC8E
 vLYUB+GhWeD7R3bwpqGkLhm7rXMBpImSRxfbsxlCSzepCFwdGPByxsYT9hqhq3fzTUSu
 Vt7Renq85HDAku5KmS3gUoOuCy2wqf4SoGbOwdI6vzXR7g0+BPRCXeQoR0UuxprpcJNa BQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3a2g7bj8gk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 27 Jul 2021 10:36:56 -0400
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 16REXtMi179616;
 Tue, 27 Jul 2021 10:36:39 -0400
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3a2g7bj7ey-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 27 Jul 2021 10:36:38 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 16REM61O003606;
 Tue, 27 Jul 2021 14:36:24 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma02dal.us.ibm.com with ESMTP id 3a2362dpuc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 27 Jul 2021 14:36:24 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 16REaNAQ50397554
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 27 Jul 2021 14:36:23 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3CF8D112066;
 Tue, 27 Jul 2021 14:36:23 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 837F6112070;
 Tue, 27 Jul 2021 14:36:22 +0000 (GMT)
Received: from localhost (unknown [9.211.99.174])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTPS;
 Tue, 27 Jul 2021 14:36:22 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: Nicholas Piggin <npiggin@gmail.com>, kvm-ppc@vger.kernel.org
Subject: Re: [PATCH v5 2/2] KVM: PPC: Book3S HV: Stop forwarding all HFUs to L1
In-Reply-To: <1627355201.gqa4czyyxy.astroid@bobo.none>
References: <20210726201710.2432874-1-farosas@linux.ibm.com>
 <20210726201710.2432874-3-farosas@linux.ibm.com>
 <1627355201.gqa4czyyxy.astroid@bobo.none>
Date: Tue, 27 Jul 2021 11:36:20 -0300
Message-ID: <87o8anddsr.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 46Un7Zj04E9iCj213-wdxD8JkNpIXPK9
X-Proofpoint-ORIG-GUID: vqsRGzEaj4gq5C088sZ7HWVto0aY2lNW
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-27_10:2021-07-27,
 2021-07-27 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 impostorscore=0 suspectscore=0
 phishscore=0 bulkscore=0 clxscore=1015 mlxlogscore=999 priorityscore=1501
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2107270086
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nicholas Piggin <npiggin@gmail.com> writes:

> Excerpts from Fabiano Rosas's message of July 27, 2021 6:17 am:
>> If the nested hypervisor has no access to a facility because it has
>> been disabled by the host, it should also not be able to see the
>> Hypervisor Facility Unavailable that arises from one of its guests
>> trying to access the facility.
>> 
>> This patch turns a HFU that happened in L2 into a Hypervisor Emulation
>> Assistance interrupt and forwards it to L1 for handling. The ones that
>> happened because L1 explicitly disabled the facility for L2 are still
>> let through, along with the corresponding Cause bits in the HFSCR.
>> 
>> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
>> Reviewed-by: Nicholas Piggin <npiggin@gmail.com>
>> ---
>>  arch/powerpc/kvm/book3s_hv_nested.c | 32 +++++++++++++++++++++++------
>>  1 file changed, 26 insertions(+), 6 deletions(-)
>> 
>> diff --git a/arch/powerpc/kvm/book3s_hv_nested.c b/arch/powerpc/kvm/book3s_hv_nested.c
>> index 8215dbd4be9a..d544b092b49a 100644
>> --- a/arch/powerpc/kvm/book3s_hv_nested.c
>> +++ b/arch/powerpc/kvm/book3s_hv_nested.c
>> @@ -99,7 +99,7 @@ static void byteswap_hv_regs(struct hv_guest_state *hr)
>>  	hr->dawrx1 = swab64(hr->dawrx1);
>>  }
>>  
>> -static void save_hv_return_state(struct kvm_vcpu *vcpu, int trap,
>> +static void save_hv_return_state(struct kvm_vcpu *vcpu,
>>  				 struct hv_guest_state *hr)
>>  {
>>  	struct kvmppc_vcore *vc = vcpu->arch.vcore;
>> @@ -118,7 +118,7 @@ static void save_hv_return_state(struct kvm_vcpu *vcpu, int trap,
>>  	hr->pidr = vcpu->arch.pid;
>>  	hr->cfar = vcpu->arch.cfar;
>>  	hr->ppr = vcpu->arch.ppr;
>> -	switch (trap) {
>> +	switch (vcpu->arch.trap) {
>>  	case BOOK3S_INTERRUPT_H_DATA_STORAGE:
>>  		hr->hdar = vcpu->arch.fault_dar;
>>  		hr->hdsisr = vcpu->arch.fault_dsisr;
>> @@ -128,9 +128,29 @@ static void save_hv_return_state(struct kvm_vcpu *vcpu, int trap,
>>  		hr->asdr = vcpu->arch.fault_gpa;
>>  		break;
>>  	case BOOK3S_INTERRUPT_H_FAC_UNAVAIL:
>> -		hr->hfscr = ((~HFSCR_INTR_CAUSE & hr->hfscr) |
>> -			     (HFSCR_INTR_CAUSE & vcpu->arch.hfscr));
>> -		break;
>> +	{
>> +		u8 cause = vcpu->arch.hfscr >> 56;
>
> Can this be u64 just to help gcc?
>

Yes.

>> +
>> +		WARN_ON_ONCE(cause >= BITS_PER_LONG);
>> +
>> +		if (!(hr->hfscr & (1UL << cause))) {
>> +			hr->hfscr = ((~HFSCR_INTR_CAUSE & hr->hfscr) |
>> +				     (HFSCR_INTR_CAUSE & vcpu->arch.hfscr));
>> +			break;
>> +		}
>> +
>> +		/*
>> +		 * We have disabled this facility, so it does not
>> +		 * exist from L1's perspective. Turn it into a HEAI.
>> +		 */
>> +		vcpu->arch.trap = BOOK3S_INTERRUPT_H_EMUL_ASSIST;
>> +		kvmppc_load_last_inst(vcpu, INST_GENERIC, &vcpu->arch.emul_inst);
>
> Hmm, this doesn't handle kvmpc_load_last_inst failure. Other code tends 
> to just resume guest and retry in this case. Can we do that here?
>

Not at this point. The other code does that inside
kvmppc_handle_exit_hv, which is called from kvmhv_run_single_vcpu. And
since we're changing the interrupt, I cannot load the last instruction
at kvmppc_handle_nested_exit because at that point this is still an HFU.

Unless I do it anyway at the HFU handler and put a comment explaining
the situation.

Or I could check for failure and clear vcpu->arch.emul_inst and
therefore also hr->heir if we couldn't load the instruction.

>> +
>> +		/* Don't leak the cause field */
>> +		hr->hfscr &= ~HFSCR_INTR_CAUSE;
>
> This hunk also remains -- shouldn't change HFSCR for HEA, only HFAC.

Ah of course, thanks.

>
> Thanks,
> Nick
