Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DFA8468F57F
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Feb 2023 18:37:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PBnJ35FXMz3f5S
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Feb 2023 04:37:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=iQlyfdDm;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=imbrenda@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=iQlyfdDm;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PBnH34r0pz3bWC
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Feb 2023 04:36:31 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 318HHkOQ007083;
	Wed, 8 Feb 2023 17:35:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=w8wjwMlgb9GsgoiOCFXp4yyLA2K11B5J/RaqzGmUZsQ=;
 b=iQlyfdDmDN5+8c2FxTO+NZYAeS/32r3k5LjX151TY4iQU9gpQ99bLxRJslWjYLg3Rbcs
 SpZ4AJFF+3LwRWYlp3/s9lheOrup6+zAmmHeDYSOj+pILxxke92luvi+GfifAo/eCkO1
 9aOia16dX6fPgAT1Uq0FAB4wC607DPSAZ4nqeqAlT4Zrmn8s9GrJebzbbC5vsMkfb/vA
 prZjUimKOH7MCsmq9k73JDwg3TWQk+30/+9x9TMH0QxL1CyVqXYGeFl65u20XSbzl7VD
 NiDSIgGc9W0MphwU07hg9Z8nsAmQEs/4bGFuKrjTaPh6LR+NzKkdkvbISlH4ga3wxB0+ Zw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nmfx08w5m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Feb 2023 17:35:58 +0000
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 318HI5Pn008839;
	Wed, 8 Feb 2023 17:35:57 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com [169.51.49.99])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nmfx08w4a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Feb 2023 17:35:57 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
	by ppma04ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3185ag5Q024247;
	Wed, 8 Feb 2023 17:35:55 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma04ams.nl.ibm.com (PPS) with ESMTPS id 3nhf06w746-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Feb 2023 17:35:54 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 318HZpH743647422
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 8 Feb 2023 17:35:51 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 686DE2004B;
	Wed,  8 Feb 2023 17:35:51 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E311C20040;
	Wed,  8 Feb 2023 17:35:50 +0000 (GMT)
Received: from p-imbrenda (unknown [9.152.224.56])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  8 Feb 2023 17:35:50 +0000 (GMT)
Date: Wed, 8 Feb 2023 18:35:49 +0100
From: Claudio Imbrenda <imbrenda@linux.ibm.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 7/7] KVM: Change return type of kvm_arch_vm_ioctl() to
 "int"
Message-ID: <20230208183549.145b708d@p-imbrenda>
In-Reply-To: <20230203094230.266952-8-thuth@redhat.com>
References: <20230203094230.266952-1-thuth@redhat.com>
	<20230203094230.266952-8-thuth@redhat.com>
Organization: IBM
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 5z7FZjk3Eq_9afR6qjVBjFisFOAsYUoj
X-Proofpoint-GUID: rTE80i3B1iv3R7DqYEkof08grhL3yDR7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-08_08,2023-02-08_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 phishscore=0 malwarescore=0 spamscore=0 mlxlogscore=960
 mlxscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302080153
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
Cc: Janosch Frank <frankja@linux.ibm.com>, kvm@vger.kernel.org, Suzuki K Poulose <suzuki.poulose@arm.com>, Sean Christopherson <seanjc@google.com>, David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, Zenghui Yu <yuzenghui@huawei.com>, James Morse <james.morse@arm.com>, kvm-riscv@lists.infradead.org, Marc Zyngier <maz@kernel.org>, kvmarm@lists.linux.dev, Paolo Bonzini <pbonzini@redhat.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri,  3 Feb 2023 10:42:30 +0100
Thomas Huth <thuth@redhat.com> wrote:

> All kvm_arch_vm_ioctl() implementations now only deal with "int"
> types as return values, so we can change the return type of these
> functions to use "int" instead of "long".
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Acked-by: Claudio Imbrenda <imbrenda@linux.ibm.com>

> ---
>  arch/arm64/kvm/arm.c       | 3 +--
>  arch/mips/kvm/mips.c       | 4 ++--
>  arch/powerpc/kvm/powerpc.c | 5 ++---
>  arch/riscv/kvm/vm.c        | 3 +--
>  arch/s390/kvm/kvm-s390.c   | 3 +--
>  arch/x86/kvm/x86.c         | 3 +--
>  include/linux/kvm_host.h   | 3 +--
>  7 files changed, 9 insertions(+), 15 deletions(-)
> 
> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
> index 9c5573bc4614..e791ad6137b8 100644
> --- a/arch/arm64/kvm/arm.c
> +++ b/arch/arm64/kvm/arm.c
> @@ -1449,8 +1449,7 @@ static int kvm_vm_ioctl_set_device_addr(struct kvm *kvm,
>  	}
>  }
>  
> -long kvm_arch_vm_ioctl(struct file *filp,
> -		       unsigned int ioctl, unsigned long arg)
> +int kvm_arch_vm_ioctl(struct file *filp, unsigned int ioctl, unsigned long arg)
>  {
>  	struct kvm *kvm = filp->private_data;
>  	void __user *argp = (void __user *)arg;
> diff --git a/arch/mips/kvm/mips.c b/arch/mips/kvm/mips.c
> index a25e0b73ee70..84cadaa2c2d3 100644
> --- a/arch/mips/kvm/mips.c
> +++ b/arch/mips/kvm/mips.c
> @@ -1003,9 +1003,9 @@ void kvm_arch_flush_remote_tlbs_memslot(struct kvm *kvm,
>  	kvm_flush_remote_tlbs(kvm);
>  }
>  
> -long kvm_arch_vm_ioctl(struct file *filp, unsigned int ioctl, unsigned long arg)
> +int kvm_arch_vm_ioctl(struct file *filp, unsigned int ioctl, unsigned long arg)
>  {
> -	long r;
> +	int r;
>  
>  	switch (ioctl) {
>  	default:
> diff --git a/arch/powerpc/kvm/powerpc.c b/arch/powerpc/kvm/powerpc.c
> index 04494a4fb37a..6f6ba55c224f 100644
> --- a/arch/powerpc/kvm/powerpc.c
> +++ b/arch/powerpc/kvm/powerpc.c
> @@ -2386,12 +2386,11 @@ static int kvmppc_get_cpu_char(struct kvm_ppc_cpu_char *cp)
>  }
>  #endif
>  
> -long kvm_arch_vm_ioctl(struct file *filp,
> -                       unsigned int ioctl, unsigned long arg)
> +int kvm_arch_vm_ioctl(struct file *filp, unsigned int ioctl, unsigned long arg)
>  {
>  	struct kvm *kvm __maybe_unused = filp->private_data;
>  	void __user *argp = (void __user *)arg;
> -	long r;
> +	int r;
>  
>  	switch (ioctl) {
>  	case KVM_PPC_GET_PVINFO: {
> diff --git a/arch/riscv/kvm/vm.c b/arch/riscv/kvm/vm.c
> index 65a964d7e70d..c13130ab459a 100644
> --- a/arch/riscv/kvm/vm.c
> +++ b/arch/riscv/kvm/vm.c
> @@ -87,8 +87,7 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
>  	return r;
>  }
>  
> -long kvm_arch_vm_ioctl(struct file *filp,
> -		       unsigned int ioctl, unsigned long arg)
> +int kvm_arch_vm_ioctl(struct file *filp, unsigned int ioctl, unsigned long arg)
>  {
>  	return -EINVAL;
>  }
> diff --git a/arch/s390/kvm/kvm-s390.c b/arch/s390/kvm/kvm-s390.c
> index 8ad1972b8a73..86ca49814983 100644
> --- a/arch/s390/kvm/kvm-s390.c
> +++ b/arch/s390/kvm/kvm-s390.c
> @@ -2850,8 +2850,7 @@ static int kvm_s390_vm_mem_op(struct kvm *kvm, struct kvm_s390_mem_op *mop)
>  	return r;
>  }
>  
> -long kvm_arch_vm_ioctl(struct file *filp,
> -		       unsigned int ioctl, unsigned long arg)
> +int kvm_arch_vm_ioctl(struct file *filp, unsigned int ioctl, unsigned long arg)
>  {
>  	struct kvm *kvm = filp->private_data;
>  	void __user *argp = (void __user *)arg;
> diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
> index caa2541833dd..c03363efc774 100644
> --- a/arch/x86/kvm/x86.c
> +++ b/arch/x86/kvm/x86.c
> @@ -6653,8 +6653,7 @@ static int kvm_vm_ioctl_set_clock(struct kvm *kvm, void __user *argp)
>  	return 0;
>  }
>  
> -long kvm_arch_vm_ioctl(struct file *filp,
> -		       unsigned int ioctl, unsigned long arg)
> +int kvm_arch_vm_ioctl(struct file *filp, unsigned int ioctl, unsigned long arg)
>  {
>  	struct kvm *kvm = filp->private_data;
>  	void __user *argp = (void __user *)arg;
> diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
> index 4f26b244f6d0..ed2f1f02976b 100644
> --- a/include/linux/kvm_host.h
> +++ b/include/linux/kvm_host.h
> @@ -1398,8 +1398,7 @@ int kvm_vm_ioctl_irq_line(struct kvm *kvm, struct kvm_irq_level *irq_level,
>  			bool line_status);
>  int kvm_vm_ioctl_enable_cap(struct kvm *kvm,
>  			    struct kvm_enable_cap *cap);
> -long kvm_arch_vm_ioctl(struct file *filp,
> -		       unsigned int ioctl, unsigned long arg);
> +int kvm_arch_vm_ioctl(struct file *filp, unsigned int ioctl, unsigned long arg);
>  long kvm_arch_vm_compat_ioctl(struct file *filp, unsigned int ioctl,
>  			      unsigned long arg);
>  

