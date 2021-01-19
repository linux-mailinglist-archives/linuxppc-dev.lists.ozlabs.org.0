Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C4F62FC1E3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Jan 2021 22:09:42 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DL1W73rw8zDr0m
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Jan 2021 08:09:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=farosas@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=qxMJ5Ve3; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DL1TG1FwkzDqBN
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Jan 2021 08:08:01 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 10JL3H3V134035; Tue, 19 Jan 2021 16:07:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=XD7r40TksqhrE9iNi68RN+Y7arOqZvlaJb/uJGaw7RE=;
 b=qxMJ5Ve3kEogs7Qv7mxfCzMXyq1+z14/7cfQOTaJO5x15EIiIHPIEMJv8l//7KJ/t01b
 6oYO4UFOl8HmZUezMxb28XYwqTWKDhH207zQh7dpQm0aWgxDmLpt0xTKT4qkS8yJzJAS
 5kswLDqKnQC0DZdPXPHtg41Y+W8fEl6NlnrAXNAaHc0pgsB5FH3q9umUYtV2vBje0Kk1
 kcF1s2kPiwKCnlqq5zhL9bNxH13casg1Pzm9QGcC2vvQGacbdkc9aMGv1R0/MhuN98tD
 /8yDeylXNa4kfieEVXKWRZ0crfPj4fJal0zZ7wXuzBfVSbfS5PxfWNsVpeIleltgAX54 4w== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3665wnhm7p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 19 Jan 2021 16:07:59 -0500
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 10JL3hK5136598;
 Tue, 19 Jan 2021 16:07:58 -0500
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3665wnhm61-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 19 Jan 2021 16:07:58 -0500
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 10JL16BA007894;
 Tue, 19 Jan 2021 21:07:57 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma01wdc.us.ibm.com with ESMTP id 363qs912td-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 19 Jan 2021 21:07:57 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 10JL7ubO11600298
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 19 Jan 2021 21:07:56 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7CBF57805F;
 Tue, 19 Jan 2021 21:07:56 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C1AEA78064;
 Tue, 19 Jan 2021 21:07:55 +0000 (GMT)
Received: from localhost (unknown [9.211.74.236])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Tue, 19 Jan 2021 21:07:55 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: Nicholas Piggin <npiggin@gmail.com>, kvm-ppc@vger.kernel.org
Subject: Re: [PATCH 1/4] KVM: PPC: Book3S HV: Remove support for running HPT
 guest on RPT host without mixed mode support
In-Reply-To: <1611025782.s66bkxjtqz.astroid@bobo.none>
References: <20210118062809.1430920-1-npiggin@gmail.com>
 <20210118062809.1430920-2-npiggin@gmail.com>
 <87czy1bsvz.fsf@linux.ibm.com> <1611025782.s66bkxjtqz.astroid@bobo.none>
Date: Tue, 19 Jan 2021 18:07:53 -0300
Message-ID: <87a6t4bpp2.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-19_09:2021-01-18,
 2021-01-19 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 mlxlogscore=999 mlxscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101190115
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

> Excerpts from Fabiano Rosas's message of January 19, 2021 11:46 am:
>> Resending because the previous got spam-filtered:
>> 
>> Nicholas Piggin <npiggin@gmail.com> writes:
>> 
>>> This reverts much of commit c01015091a770 ("KVM: PPC: Book3S HV: Run HPT
>>> guests on POWER9 radix hosts"), which was required to run HPT guests on
>>> RPT hosts on early POWER9 CPUs without support for "mixed mode", which
>>> meant the host could not run with MMU on while guests were running.
>>>
>>> This code has some corner case bugs, e.g., when the guest hits a machine
>>> check or HMI the primary locks up waiting for secondaries to switch LPCR
>>> to host, which they never do. This could all be fixed in software, but
>>> most CPUs in production have mixed mode support, and those that don't
>>> are believed to be all in installations that don't use this capability.
>>> So simplify things and remove support.
>> 
>> With this patch in a DD2.1 machine + indep_threads_mode=N +
>> disable_radix, QEMU aborts and dumps registers, is that intended?
>
> Yes. That configuration is hanging handling MCEs in the guest with some 
> threads waiting forever to synchronize. Paul suggested it was never a
> supported configuration so we might just remove it.
>

OK, so:

Tested-by: Fabiano Rosas <farosas@linux.ibm.com>

>> Could we use the 'no_mixing_hpt_and_radix' logic in check_extension to
>> advertise only KVM_CAP_PPC_MMU_RADIX to the guest via OV5 so it doesn't
>> try to run hash?
>> 
>> For instance, if I hack QEMU's 'spapr_dt_ov5_platform_support' from
>> OV5_MMU_BOTH to OV5_MMU_RADIX_300 then it boots succesfuly, but the
>> guest turns into radix, due to this code in prom_init:
>> 
>> prom_parse_mmu_model:
>> 
>> case OV5_FEAT(OV5_MMU_RADIX): /* Only Radix */
>> 	prom_debug("MMU - radix only\n");
>> 	if (prom_radix_disable) {
>> 		/*
>> 		 * If we __have__ to do radix, we're better off ignoring
>> 		 * the command line rather than not booting.
>> 		 */
>> 		prom_printf("WARNING: Ignoring cmdline option disable_radix\n");
>> 	}
>> 	support->radix_mmu = true;
>> 	break;
>> 
>> It seems we could explicitly say that the host does not support hash and
>> that would align with the above code.
>
> I'm not sure, sounds like you could, on the other hand these aborts seem 
> like the prefered failure mode for these kinds of configuration issues, 
> I don't know what the policy is, is reverting back to radix acceptable?
>

Yeah, I couldn't find documentation about why we're reverting back to
radix. I personally dislike it, but there is already a precedent so I'm
not sure. A radix guest on a hash host does the same transparent
conversion AFAICT.

But despite that, this patch removes support for hash MMU in this
particular scenario. I don't see why continuing to tell the guest we
support hash.

Anyway, here's a patch if you decide to go that way (tested w/ DD2.1 &
2.3 machines):

---
diff --git a/arch/powerpc/include/asm/kvm_ppc.h b/arch/powerpc/include/asm/kvm_ppc.h
index 0a056c64c317b..53743555676d6 100644
--- a/arch/powerpc/include/asm/kvm_ppc.h
+++ b/arch/powerpc/include/asm/kvm_ppc.h
@@ -314,6 +314,7 @@ struct kvmppc_ops {
 			      int size);
 	int (*enable_svm)(struct kvm *kvm);
 	int (*svm_off)(struct kvm *kvm);
+	bool (*hash_possible)(void);
 };
 
 extern struct kvmppc_ops *kvmppc_hv_ops;
diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 6f612d240392f..2d1e8aba22b85 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -5599,6 +5599,15 @@ static int kvmhv_svm_off(struct kvm *kvm)
 	return ret;
 }
 
+static bool kvmppc_hash_possible(void)
+{
+	if (radix_enabled() && no_mixing_hpt_and_radix)
+		return false;
+
+	return cpu_has_feature(CPU_FTR_ARCH_300) &&
+		cpu_has_feature(CPU_FTR_HVMODE);
+}
+
 static struct kvmppc_ops kvm_ops_hv = {
 	.get_sregs = kvm_arch_vcpu_ioctl_get_sregs_hv,
 	.set_sregs = kvm_arch_vcpu_ioctl_set_sregs_hv,
@@ -5642,6 +5651,7 @@ static struct kvmppc_ops kvm_ops_hv = {
 	.store_to_eaddr = kvmhv_store_to_eaddr,
 	.enable_svm = kvmhv_enable_svm,
 	.svm_off = kvmhv_svm_off,
+	.hash_possible = kvmppc_hash_possible,
 };
 
 static int kvm_init_subcore_bitmap(void)
diff --git a/arch/powerpc/kvm/powerpc.c b/arch/powerpc/kvm/powerpc.c
index cf52d26f49cd7..99ced6c570e74 100644
--- a/arch/powerpc/kvm/powerpc.c
+++ b/arch/powerpc/kvm/powerpc.c
@@ -611,8 +611,7 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
 		r = !!(hv_enabled && radix_enabled());
 		break;
 	case KVM_CAP_PPC_MMU_HASH_V3:
-		r = !!(hv_enabled && cpu_has_feature(CPU_FTR_ARCH_300) &&
-		       cpu_has_feature(CPU_FTR_HVMODE));
+		r = !!(hv_enabled && kvmppc_hv_ops->hash_possible());
 		break;
 	case KVM_CAP_PPC_NESTED_HV:
 		r = !!(hv_enabled && kvmppc_hv_ops->enable_nested &&
---

https://github.com/farosas/linux/commit/0ae6c65ba9592c23215899c473acf392bd6e36d5.patch


> Thanks,
> Nick
