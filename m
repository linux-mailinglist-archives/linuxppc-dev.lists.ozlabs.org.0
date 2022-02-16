Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E83A64B8DD2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Feb 2022 17:23:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JzNYD3FCjz3cTf
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Feb 2022 03:23:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=NpcKNj54;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=imbrenda@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=NpcKNj54; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JzNXS6v1Zz3089
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Feb 2022 03:22:32 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21GGA5GZ012323; 
 Wed, 16 Feb 2022 16:21:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=hGygGfyBZQzZARePJKDSLYnI6/62xJHqBNUbgyKANO0=;
 b=NpcKNj54knmv3Q5MF4nttEklExUtM0QnFXSfFbH5fLroMiw0N1L7Xa8MLBKzbA6+xhQ6
 1A8V5M87+X3b1Tfo3x3mtxwXzFS1xpSvWBWB8iweUnRh03hK72itY3iUFxMEbeHOIznG
 2Td6sv6OHHJzOk0G9CrzEyOZMv0aIC8BNEwe+rtBpzHIGFiAjTGQdp6oFWqTi/59eQbg
 9tTXXKOPFhxVhGmjWZycA6pFuATn9SUX0YqIsTUBOLn7Yzfvnxk+4oePTb8kPoJrb301
 V9f49DqQaHsVmTi8wL7XIpuMFT/EZujLouFH1tVpnV5z0mnMUfpCFGODtIFQce3j7Uk1 ow== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3e944t8q6u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Feb 2022 16:21:34 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 21GGB0gQ015426;
 Wed, 16 Feb 2022 16:21:32 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3e944t8q61-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Feb 2022 16:21:32 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21GGCjBB022708;
 Wed, 16 Feb 2022 16:21:30 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma03ams.nl.ibm.com with ESMTP id 3e64haaj7w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Feb 2022 16:21:30 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 21GGLLhJ38535620
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 16 Feb 2022 16:21:21 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F295DA4062;
 Wed, 16 Feb 2022 16:21:20 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 00B50A4069;
 Wed, 16 Feb 2022 16:21:19 +0000 (GMT)
Received: from p-imbrenda (unknown [9.145.2.54])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 16 Feb 2022 16:21:18 +0000 (GMT)
Date: Wed, 16 Feb 2022 17:21:17 +0100
From: Claudio Imbrenda <imbrenda@linux.ibm.com>
To: Chao Gao <chao.gao@intel.com>
Subject: Re: [PATCH v4 2/6] Partially revert "KVM: Pass kvm_init()'s opaque
 param to additional arch funcs"
Message-ID: <20220216172117.194e5309@p-imbrenda>
In-Reply-To: <20220216031528.92558-3-chao.gao@intel.com>
References: <20220216031528.92558-1-chao.gao@intel.com>
 <20220216031528.92558-3-chao.gao@intel.com>
Organization: IBM
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 3fTH7-ZleMRtuhzk036tkK96NWkQJCFz
X-Proofpoint-ORIG-GUID: dWyQhtdRuToKG8BmT7g8zOnlfvrlm7Bk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-16_07,2022-02-16_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxscore=0
 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 mlxlogscore=999
 impostorscore=0 priorityscore=1501 adultscore=0 suspectscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202160095
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
Cc: linux-s390@vger.kernel.org, x86@kernel.org,
 Wanpeng Li <wanpengli@tencent.com>, kvm@vger.kernel.org,
 David Hildenbrand <david@redhat.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-mips@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, "H. Peter Anvin" <hpa@zytor.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>, Will Deacon <will@kernel.org>,
 "Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>, maz@kernel.org,
 Janosch Frank <frankja@linux.ibm.com>, Anup Patel <anup@brainfault.org>,
 Joerg Roedel <joro@8bytes.org>, Huacai Chen <chenhuacai@kernel.org>,
 linux-riscv@lists.infradead.org, kvmarm@lists.cs.columbia.edu,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Ingo Molnar <mingo@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>, kevin.tian@intel.com,
 Albert Ou <aou@eecs.berkeley.edu>, Vasily Gorbik <gor@linux.ibm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Heiko Carstens <hca@linux.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>, Borislav Petkov <bp@alien8.de>,
 Atish Patra <atishp@atishpatra.org>, tglx@linutronix.de,
 Alexandru Elisei <alexandru.elisei@arm.com>,
 linux-arm-kernel@lists.infradead.org, Jim Mattson <jmattson@google.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, seanjc@google.com,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 Bharata B Rao <bharata@linux.ibm.com>, James Morse <james.morse@arm.com>,
 Sven Schnelle <svens@linux.ibm.com>, kvm-riscv@lists.infradead.org,
 pbonzini@redhat.com, Vitaly Kuznetsov <vkuznets@redhat.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 16 Feb 2022 11:15:17 +0800
Chao Gao <chao.gao@intel.com> wrote:

> This partially reverts commit b99040853738 ("KVM: Pass kvm_init()'s opaque
> param to additional arch funcs") remove opaque from
> kvm_arch_check_processor_compat because no one uses this opaque now.
> Address conflicts for ARM (due to file movement) and manually handle RISC-V
> which comes after the commit.
> 
> And changes about kvm_arch_hardware_setup() in original commit are still
> needed so they are not reverted.
> 
> Signed-off-by: Chao Gao <chao.gao@intel.com>
> Reviewed-by: Sean Christopherson <seanjc@google.com>

for KVM s390:

Acked-by: Claudio Imbrenda <imbrenda@linux.ibm.com>

> ---
>  arch/arm64/kvm/arm.c       |  2 +-
>  arch/mips/kvm/mips.c       |  2 +-
>  arch/powerpc/kvm/powerpc.c |  2 +-
>  arch/riscv/kvm/main.c      |  2 +-
>  arch/s390/kvm/kvm-s390.c   |  2 +-
>  arch/x86/kvm/x86.c         |  2 +-
>  include/linux/kvm_host.h   |  2 +-
>  virt/kvm/kvm_main.c        | 16 +++-------------
>  8 files changed, 10 insertions(+), 20 deletions(-)
> 
> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
> index ecc5958e27fe..0165cf3aac3a 100644
> --- a/arch/arm64/kvm/arm.c
> +++ b/arch/arm64/kvm/arm.c
> @@ -73,7 +73,7 @@ int kvm_arch_hardware_setup(void *opaque)
>  	return 0;
>  }
>  
> -int kvm_arch_check_processor_compat(void *opaque)
> +int kvm_arch_check_processor_compat(void)
>  {
>  	return 0;
>  }
> diff --git a/arch/mips/kvm/mips.c b/arch/mips/kvm/mips.c
> index a25e0b73ee70..092d09fb6a7e 100644
> --- a/arch/mips/kvm/mips.c
> +++ b/arch/mips/kvm/mips.c
> @@ -140,7 +140,7 @@ int kvm_arch_hardware_setup(void *opaque)
>  	return 0;
>  }
>  
> -int kvm_arch_check_processor_compat(void *opaque)
> +int kvm_arch_check_processor_compat(void)
>  {
>  	return 0;
>  }
> diff --git a/arch/powerpc/kvm/powerpc.c b/arch/powerpc/kvm/powerpc.c
> index 2ad0ccd202d5..30c817f3fa0c 100644
> --- a/arch/powerpc/kvm/powerpc.c
> +++ b/arch/powerpc/kvm/powerpc.c
> @@ -423,7 +423,7 @@ int kvm_arch_hardware_setup(void *opaque)
>  	return 0;
>  }
>  
> -int kvm_arch_check_processor_compat(void *opaque)
> +int kvm_arch_check_processor_compat(void)
>  {
>  	return kvmppc_core_check_processor_compat();
>  }
> diff --git a/arch/riscv/kvm/main.c b/arch/riscv/kvm/main.c
> index 2e5ca43c8c49..992877e78393 100644
> --- a/arch/riscv/kvm/main.c
> +++ b/arch/riscv/kvm/main.c
> @@ -20,7 +20,7 @@ long kvm_arch_dev_ioctl(struct file *filp,
>  	return -EINVAL;
>  }
>  
> -int kvm_arch_check_processor_compat(void *opaque)
> +int kvm_arch_check_processor_compat(void)
>  {
>  	return 0;
>  }
> diff --git a/arch/s390/kvm/kvm-s390.c b/arch/s390/kvm/kvm-s390.c
> index 577f1ead6a51..0053b81c6b02 100644
> --- a/arch/s390/kvm/kvm-s390.c
> +++ b/arch/s390/kvm/kvm-s390.c
> @@ -252,7 +252,7 @@ int kvm_arch_hardware_enable(void)
>  	return 0;
>  }
>  
> -int kvm_arch_check_processor_compat(void *opaque)
> +int kvm_arch_check_processor_compat(void)
>  {
>  	return 0;
>  }
> diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
> index 9b484ed61f37..ffb88f0b7265 100644
> --- a/arch/x86/kvm/x86.c
> +++ b/arch/x86/kvm/x86.c
> @@ -11509,7 +11509,7 @@ void kvm_arch_hardware_unsetup(void)
>  	static_call(kvm_x86_hardware_unsetup)();
>  }
>  
> -int kvm_arch_check_processor_compat(void *opaque)
> +int kvm_arch_check_processor_compat(void)
>  {
>  	struct cpuinfo_x86 *c = &cpu_data(smp_processor_id());
>  
> diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
> index f11039944c08..2ad78e729bf7 100644
> --- a/include/linux/kvm_host.h
> +++ b/include/linux/kvm_host.h
> @@ -1413,7 +1413,7 @@ int kvm_arch_hardware_enable(void);
>  void kvm_arch_hardware_disable(void);
>  int kvm_arch_hardware_setup(void *opaque);
>  void kvm_arch_hardware_unsetup(void);
> -int kvm_arch_check_processor_compat(void *opaque);
> +int kvm_arch_check_processor_compat(void);
>  int kvm_arch_vcpu_runnable(struct kvm_vcpu *vcpu);
>  bool kvm_arch_vcpu_in_kernel(struct kvm_vcpu *vcpu);
>  int kvm_arch_vcpu_should_kick(struct kvm_vcpu *vcpu);
> diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> index 83c57bcc6eb6..ee47d33d69e1 100644
> --- a/virt/kvm/kvm_main.c
> +++ b/virt/kvm/kvm_main.c
> @@ -5643,22 +5643,14 @@ void kvm_unregister_perf_callbacks(void)
>  }
>  #endif
>  
> -struct kvm_cpu_compat_check {
> -	void *opaque;
> -	int *ret;
> -};
> -
> -static void check_processor_compat(void *data)
> +static void check_processor_compat(void *rtn)
>  {
> -	struct kvm_cpu_compat_check *c = data;
> -
> -	*c->ret = kvm_arch_check_processor_compat(c->opaque);
> +	*(int *)rtn = kvm_arch_check_processor_compat();
>  }
>  
>  int kvm_init(void *opaque, unsigned vcpu_size, unsigned vcpu_align,
>  		  struct module *module)
>  {
> -	struct kvm_cpu_compat_check c;
>  	int r;
>  	int cpu;
>  
> @@ -5686,10 +5678,8 @@ int kvm_init(void *opaque, unsigned vcpu_size, unsigned vcpu_align,
>  	if (r < 0)
>  		goto out_free_1;
>  
> -	c.ret = &r;
> -	c.opaque = opaque;
>  	for_each_online_cpu(cpu) {
> -		smp_call_function_single(cpu, check_processor_compat, &c, 1);
> +		smp_call_function_single(cpu, check_processor_compat, &r, 1);
>  		if (r < 0)
>  			goto out_free_2;
>  	}

