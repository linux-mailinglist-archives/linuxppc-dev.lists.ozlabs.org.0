Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E2DD63FDDC4
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Sep 2021 16:24:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H05sG5rjPz2yZB
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Sep 2021 00:24:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=DKH5jCD3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=farosas@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=DKH5jCD3; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H05rX1d4Fz2xnd
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Sep 2021 00:23:24 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 181E9qwj182066; Wed, 1 Sep 2021 10:23:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=qtGkWcWIfIT2o6KIzYTlv0wcqQyNONQNavuF82l46pw=;
 b=DKH5jCD3XXI1sx4p2JeZFBdioa+i+fwt6c1wk1SZTo2N2A3WGfuPW2wSPk/VNXcEnvfG
 8at2AovM6Eqjh+2XwsPgZAG8igRI2p9mPx8c2QyVWQj27KycTlxZ3YaSaKGDsgTgJWWf
 0MGNQow6u5+vi2qzo+g/hQdaSDc2t8dYK/AapcD39Bx+smXI77JiIVBpJZE9+axuvVf2
 mQUbrAe/q2LOmM7H9UrkDsnAz9tlQECCzYBZrHIhJJOiAxeLJEoDpUeps16TQpLJvQL6
 O6ggQTW/DdKEiJbukopgDiBAJkbQ7jf3ILmOUFBK1X/kho/T+qaAu3eomVJ90gitN7qd lg== 
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3at6xm7nua-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 01 Sep 2021 10:23:15 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 181E2f4K010729;
 Wed, 1 Sep 2021 14:23:14 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma04dal.us.ibm.com with ESMTP id 3aqcse57va-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 01 Sep 2021 14:23:14 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 181ENDxE33620324
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 1 Sep 2021 14:23:13 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 310C9AE062;
 Wed,  1 Sep 2021 14:23:13 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1DA36AE05C;
 Wed,  1 Sep 2021 14:23:12 +0000 (GMT)
Received: from localhost (unknown [9.211.58.54])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTPS;
 Wed,  1 Sep 2021 14:23:11 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: Alexey Kardashevskiy <aik@ozlabs.ru>, Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH kernel] KVM: PPC: Book3S HV: Make unique debugfs nodename
In-Reply-To: <2fe01488-5a9b-785e-7c05-1d527dead18d@ozlabs.ru>
References: <20210707041344.3803554-1-aik@ozlabs.ru>
 <be02290c-60a0-48af-0491-61e8a6d5b7b7@ozlabs.ru>
 <87pmubu306.fsf@linux.ibm.com>
 <a1be1913-f564-924b-1750-03efa859a0b1@ozlabs.ru>
 <2fe01488-5a9b-785e-7c05-1d527dead18d@ozlabs.ru>
Date: Wed, 01 Sep 2021 11:23:08 -0300
Message-ID: <87lf4gv0hf.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Oxrg4cnMxpRPZAwMEWuhiXMGxe0kH9PR
X-Proofpoint-ORIG-GUID: Oxrg4cnMxpRPZAwMEWuhiXMGxe0kH9PR
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-09-01_04:2021-09-01,
 2021-09-01 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0
 priorityscore=1501 mlxscore=0 impostorscore=0 suspectscore=0 spamscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1011 mlxlogscore=999 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2109010084
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 kvm-ppc@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Alexey Kardashevskiy <aik@ozlabs.ru> writes:

> On 24/08/2021 18:37, Alexey Kardashevskiy wrote:
>>=20
>>=20
>> On 18/08/2021 08:20, Fabiano Rosas wrote:
>>> Alexey Kardashevskiy <aik@ozlabs.ru> writes:
>>>
>>>> On 07/07/2021 14:13, Alexey Kardashevskiy wrote:
>>>
>>>> alternatively move this debugfs stuff under the platform-independent
>>>> directory, how about that?
>>>
>>> That's a good idea. I only now realized we have two separate directories
>>> for the same guest:
>>>
>>> $ ls /sys/kernel/debug/kvm/ | grep $pid
>>> 19062-11
>>> vm19062
>>>
>>> Looks like we would have to implement kvm_arch_create_vcpu_debugfs for
>>> the vcpu information and add a similar hook for the vm.
>>=20
>> Something like that. From the git history, it looks like the ppc folder=
=20
>> was added first and then the generic kvm folder was added but apparently=
=20
>> they did not notice the ppc one due to natural reasons :)
>>=20
>> If you are not too busy, can you please merge the ppc one into the=20
>> generic one and post the patch, so we won't need to fix these=20
>> duplication warnings again? Thanks,
>
>
>
> Turns out it is not that straight forward as I thought as the common KVM=
=20
> debugfs entry is created after PPC HV KVM created its own and there is=20
> no obvious way to change the order (no "post init" hook in
> kvmppc_ops).

That is why I mentioned creating a hook similar to
kvm_create_vcpu_debugfs in the common KVM code. kvm_create_vm_debugfs or
something.

Alternatively, maybe kvm_create_vm_debugfs could be moved earlier into
kvm_create_vm, before kvm_arch_post_init_vm and we could move our code
into kvm_arch_post_init_vm.

>
> Also, unlike the common KVM debugfs setup, we do not allocate structures=
=20
> to support debugfs nodes so we do not leak anything to bother with a=20
> mutex like 85cd39af14f4 did.
>
> So I'd stick to the original patch to reduce the noise in the dmesg, and=
=20
> it also exposes lpid which I find rather useful for finding the right=20
> partition scope tree in partition_tb.
>
> Michael?
>
>
>>=20
>>=20
>>=20
>>>>> ---
>>>>> =C2=A0=C2=A0 arch/powerpc/kvm/book3s_hv.c | 2 +-
>>>>> =C2=A0=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/arch/powerpc/kvm/book3s_hv.c=20
>>>>> b/arch/powerpc/kvm/book3s_hv.c
>>>>> index 1d1fcc290fca..0223ddc0eed0 100644
>>>>> --- a/arch/powerpc/kvm/book3s_hv.c
>>>>> +++ b/arch/powerpc/kvm/book3s_hv.c
>>>>> @@ -5227,7 +5227,7 @@ static int kvmppc_core_init_vm_hv(struct kvm=20
>>>>> *kvm)
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * Create a debugfs directo=
ry for the VM
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
>>>>> -=C2=A0=C2=A0=C2=A0 snprintf(buf, sizeof(buf), "vm%d", current->pid);
>>>>> +=C2=A0=C2=A0=C2=A0 snprintf(buf, sizeof(buf), "vm%d-lp%ld", current-=
>pid, lpid);
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 kvm->arch.debugfs_dir =3D debugf=
s_create_dir(buf,=20
>>>>> kvm_debugfs_dir);
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 kvmppc_mmu_debugfs_init(kvm);
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (radix_enabled())
>>>>>
>>=20
