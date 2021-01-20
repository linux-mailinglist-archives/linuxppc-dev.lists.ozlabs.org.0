Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B1692FD297
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Jan 2021 15:31:33 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DLSdF6Pv8zDqKJ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Jan 2021 01:31:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=farosas@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=gZL++4pz; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DLSYR4V98zDq7t
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Jan 2021 01:28:11 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 10KE3ewZ126306; Wed, 20 Jan 2021 09:28:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=97yAGHY0MFwvD6eNI1hLKhB1ltZzOEl9TAIgB0hjtGg=;
 b=gZL++4pziDYT9yHe7i/vWIh0ib3zTW6HD0jJTnys6V+cBrI16wjA5MmQWSDQbr6qvYKj
 h+NgL6Lk43oS75+mG9AplZfK4bjbJpCjPWoYqnPpVJcQjEw3TseBOXl0EJlIqUikgnnK
 Zl+PGciobLWvulM4SSz7kpV0LNz0m6DsSJqtsKahWAe6pqXMmmaAUUDmVQFPIVnTf+wC
 6RygO5Mhg6Y26KN917yf53p+G8JFgUt4HsSkNBv8mDxQxqkGF/44yba4kjjljApoq2MH
 UzT8gZelV4f4YweYYuR9QpFP4QI21spXb2MM7o0nUEX308nyKlxoMhm7S/3kAEwiAijl 0w== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 366ntjh0tk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 20 Jan 2021 09:28:09 -0500
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 10KE3fHW126331;
 Wed, 20 Jan 2021 09:28:08 -0500
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 366ntjh0re-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 20 Jan 2021 09:28:08 -0500
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 10KEMsmS006932;
 Wed, 20 Jan 2021 14:28:06 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma04dal.us.ibm.com with ESMTP id 3668p2p178-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 20 Jan 2021 14:28:06 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 10KES67p36897044
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 20 Jan 2021 14:28:06 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E6F6BAE060;
 Wed, 20 Jan 2021 14:28:05 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 13674AE063;
 Wed, 20 Jan 2021 14:28:05 +0000 (GMT)
Received: from localhost (unknown [9.163.16.99])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTPS;
 Wed, 20 Jan 2021 14:28:04 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: Nicholas Piggin <npiggin@gmail.com>, kvm-ppc@vger.kernel.org
Subject: Re: [PATCH 1/4] KVM: PPC: Book3S HV: Remove support for running HPT
 guest on RPT host without mixed mode support
In-Reply-To: <1611099866.a9bsenxeey.astroid@bobo.none>
References: <20210118062809.1430920-1-npiggin@gmail.com>
 <20210118062809.1430920-2-npiggin@gmail.com>
 <87czy1bsvz.fsf@linux.ibm.com> <1611025782.s66bkxjtqz.astroid@bobo.none>
 <87a6t4bpp2.fsf@linux.ibm.com> <1611099866.a9bsenxeey.astroid@bobo.none>
Date: Wed, 20 Jan 2021 11:27:57 -0300
Message-ID: <877do7bs42.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-20_05:2021-01-20,
 2021-01-20 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 priorityscore=1501 spamscore=0 phishscore=0 adultscore=0 mlxscore=0
 suspectscore=0 malwarescore=0 impostorscore=0 clxscore=1015 bulkscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101200079
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

> Excerpts from Fabiano Rosas's message of January 20, 2021 7:07 am:
>> Nicholas Piggin <npiggin@gmail.com> writes:
>> 
>>> Excerpts from Fabiano Rosas's message of January 19, 2021 11:46 am:
>>>> Resending because the previous got spam-filtered:
>>>> 
>>>> Nicholas Piggin <npiggin@gmail.com> writes:
>>>> 
>>>>> This reverts much of commit c01015091a770 ("KVM: PPC: Book3S HV: Run HPT
>>>>> guests on POWER9 radix hosts"), which was required to run HPT guests on
>>>>> RPT hosts on early POWER9 CPUs without support for "mixed mode", which
>>>>> meant the host could not run with MMU on while guests were running.
>>>>>
>>>>> This code has some corner case bugs, e.g., when the guest hits a machine
>>>>> check or HMI the primary locks up waiting for secondaries to switch LPCR
>>>>> to host, which they never do. This could all be fixed in software, but
>>>>> most CPUs in production have mixed mode support, and those that don't
>>>>> are believed to be all in installations that don't use this capability.
>>>>> So simplify things and remove support.
>>>> 
>>>> With this patch in a DD2.1 machine + indep_threads_mode=N +
>>>> disable_radix, QEMU aborts and dumps registers, is that intended?
>>>
>>> Yes. That configuration is hanging handling MCEs in the guest with some 
>>> threads waiting forever to synchronize. Paul suggested it was never a
>>> supported configuration so we might just remove it.
>>>
>> 
>> OK, so:
>> 
>> Tested-by: Fabiano Rosas <farosas@linux.ibm.com>
>> 
>>>> Could we use the 'no_mixing_hpt_and_radix' logic in check_extension to
>>>> advertise only KVM_CAP_PPC_MMU_RADIX to the guest via OV5 so it doesn't
>>>> try to run hash?
>>>> 
>>>> For instance, if I hack QEMU's 'spapr_dt_ov5_platform_support' from
>>>> OV5_MMU_BOTH to OV5_MMU_RADIX_300 then it boots succesfuly, but the
>>>> guest turns into radix, due to this code in prom_init:
>>>> 
>>>> prom_parse_mmu_model:
>>>> 
>>>> case OV5_FEAT(OV5_MMU_RADIX): /* Only Radix */
>>>> 	prom_debug("MMU - radix only\n");
>>>> 	if (prom_radix_disable) {
>>>> 		/*
>>>> 		 * If we __have__ to do radix, we're better off ignoring
>>>> 		 * the command line rather than not booting.
>>>> 		 */
>>>> 		prom_printf("WARNING: Ignoring cmdline option disable_radix\n");
>>>> 	}
>>>> 	support->radix_mmu = true;
>>>> 	break;
>>>> 
>>>> It seems we could explicitly say that the host does not support hash and
>>>> that would align with the above code.
>>>
>>> I'm not sure, sounds like you could, on the other hand these aborts seem 
>>> like the prefered failure mode for these kinds of configuration issues, 
>>> I don't know what the policy is, is reverting back to radix acceptable?
>>>
>> 
>> Yeah, I couldn't find documentation about why we're reverting back to
>> radix. I personally dislike it, but there is already a precedent so I'm
>> not sure. A radix guest on a hash host does the same transparent
>> conversion AFAICT.
>> 
>> But despite that, this patch removes support for hash MMU in this
>> particular scenario. I don't see why continuing to tell the guest we
>> support hash.
>> 
>> Anyway, here's a patch if you decide to go that way (tested w/ DD2.1 &
>> 2.3 machines):
>
> Thanks, I don't mind it, have to see if the maintainer will take it :)
>
> You could add a small changelog / SOB and I could putit after my patch?
>

Sure, I'll reply to this thread with a proper patch.

>> 
>> ---
>> diff --git a/arch/powerpc/include/asm/kvm_ppc.h b/arch/powerpc/include/asm/kvm_ppc.h
>> index 0a056c64c317b..53743555676d6 100644
>> --- a/arch/powerpc/include/asm/kvm_ppc.h
>> +++ b/arch/powerpc/include/asm/kvm_ppc.h
>> @@ -314,6 +314,7 @@ struct kvmppc_ops {
>>  			      int size);
>>  	int (*enable_svm)(struct kvm *kvm);
>>  	int (*svm_off)(struct kvm *kvm);
>> +	bool (*hash_possible)(void);
>>  };
>>  
>>  extern struct kvmppc_ops *kvmppc_hv_ops;
>> diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
>> index 6f612d240392f..2d1e8aba22b85 100644
>> --- a/arch/powerpc/kvm/book3s_hv.c
>> +++ b/arch/powerpc/kvm/book3s_hv.c
>> @@ -5599,6 +5599,15 @@ static int kvmhv_svm_off(struct kvm *kvm)
>>  	return ret;
>>  }
>>  
>> +static bool kvmppc_hash_possible(void)
>> +{
>> +	if (radix_enabled() && no_mixing_hpt_and_radix)
>> +		return false;
>> +
>> +	return cpu_has_feature(CPU_FTR_ARCH_300) &&
>> +		cpu_has_feature(CPU_FTR_HVMODE);
>> +}
>
> Just be careful, it's hash_v3 specifically. Either make this return true 
> for arch < 300 add the ARCH_300 check in the ioctl, or rename to include
> v3.
>
>> +
>>  static struct kvmppc_ops kvm_ops_hv = {
>>  	.get_sregs = kvm_arch_vcpu_ioctl_get_sregs_hv,
>>  	.set_sregs = kvm_arch_vcpu_ioctl_set_sregs_hv,
>> @@ -5642,6 +5651,7 @@ static struct kvmppc_ops kvm_ops_hv = {
>>  	.store_to_eaddr = kvmhv_store_to_eaddr,
>>  	.enable_svm = kvmhv_enable_svm,
>>  	.svm_off = kvmhv_svm_off,
>> +	.hash_possible = kvmppc_hash_possible,
>>  };
>>  
>
> How about adding an op which can check extensions? It could return false
> if it wasn't checked and so default to the generic checks in 
> kvm_vm_ioctl_check_extension, and take a pointer to 'r' to set.
>

I'm not sure I get the part about "return false if it wasn't
checked". Do you mean like this?

static bool kvmhv_check_extension(long ext, int *r)
{
	switch (ext) {
	case KVM_CAP_PPC_MMU_HASH_V3:
		r = kvmppc_hash_v3_possible();
		break;
	default:
		return false;
	}
	return true;
}

And then we could move all of the #ifdef CONFIG_KVM_BOOK3S_HV_POSSIBLE
cases into it and early in kvm_vm_ioctl_check_extension have something
like:

if (hv_enabled && kvmppc_hv_ops->check_extension(ext, &r))
	return r;

>>  static int kvm_init_subcore_bitmap(void)
>> diff --git a/arch/powerpc/kvm/powerpc.c b/arch/powerpc/kvm/powerpc.c
>> index cf52d26f49cd7..99ced6c570e74 100644
>> --- a/arch/powerpc/kvm/powerpc.c
>> +++ b/arch/powerpc/kvm/powerpc.c
>> @@ -611,8 +611,7 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
>>  		r = !!(hv_enabled && radix_enabled());
>>  		break;
>>  	case KVM_CAP_PPC_MMU_HASH_V3:
>> -		r = !!(hv_enabled && cpu_has_feature(CPU_FTR_ARCH_300) &&
>> -		       cpu_has_feature(CPU_FTR_HVMODE));
>> +		r = !!(hv_enabled && kvmppc_hv_ops->hash_possible());
>>  		break;
>>  	case KVM_CAP_PPC_NESTED_HV:
>>  		r = !!(hv_enabled && kvmppc_hv_ops->enable_nested &&
>
> Thanks,
> Nick
