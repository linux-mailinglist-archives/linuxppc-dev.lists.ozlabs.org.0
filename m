Return-Path: <linuxppc-dev+bounces-12983-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B94BDBE7858
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Oct 2025 11:15:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cnzg63xjzz3cZ9;
	Fri, 17 Oct 2025 20:14:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760692498;
	cv=none; b=fZlwY4d4/8+02Y1bMagyOSyDsMOOQWP5NGClsN8UWbH55CXNxb70y8SW5k8wy2OV77B/fD0vn3nNvjGanv6ESG4LJ2Li6RoesuLol5KG4xZgGqIa5knUtIsej4iryuAURt2hMKsT4O2tjBaiamXL4NLeplbGelYPuHlkOSN4V4Mj2Nl0L9ha4OzqX3Jk3AyAPzB9N6w0LkFB+tYe7DvqIYARcJlVoQgURhIN9f82F/MSva9Xl8fAkhPgVn+daWhsXCRtOhAd98dki4SrWOfmTxj0KJQkhQC1/rGfs4zo1q5I7hc9dSnq19cxQ2ZKze244NNgA/41kwoTPiY2agOUjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760692498; c=relaxed/relaxed;
	bh=+3Upo5OE7pHxEFe3tmbZpeawhzh4FlEoIXRxd4VSv28=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MsWWRxzcAhuEXgLugYQEETpXTudkEM+nWvjxSnpb02aLzhA8yJRXCDwiYY41LJgApAcKKmodl3DE8f6zo8PZHJyRsCyNSEJnwHvQfhdlGQl3T2BTbRWB8lKeDFsd2DaPTg/JzfF4wzIudM2wieF5Jsd44MbmmAjUi2xbytmQib5y7vOkzCA73hAHq6Ypd6X+ykOuRjzzginn9iTe09+l2+oD3OgIPz4VXlMcMAbtrAOBYV1RmGTWHX4T58HVhONYKPPUtNdPG23wQWrKl3SW3K/n39ZIEVIwJQb2+l+V8ZfgugeeCtqoh3+K0laJyTZGrC6eN+oJ08gD3uAAAYaKzw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=JsaKqEez; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=imbrenda@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=JsaKqEez;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=imbrenda@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cnzg55zqMz3bW7
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Oct 2025 20:14:57 +1100 (AEDT)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59H7iHlk001398;
	Fri, 17 Oct 2025 09:14:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=+3Upo5
	OE7pHxEFe3tmbZpeawhzh4FlEoIXRxd4VSv28=; b=JsaKqEezcfpud5WrRLycdc
	H+oQQuOQKt9AWS2MA2f2AWZxfvs/fKy1XLjRxCuyz+56f5TaICphCw6V+vG/C2bz
	F5gbzyBcSi8cacGtFSmpTAFrTlG2aUVsmy31GO+qAMN+54h8jCVe9POxWOaK8fN7
	/hJEpyoIAS2JTMgkwbRRg9OFM1BAa8/e1C7ZI4h8ECcspk29fPXdeARq+uJw8Tjf
	D5t5GR/pWKBSuIjzJXOp2kI6eD4WxDfkehxYD18sHbNqW2XhzgpvGBF1H6XEoi2M
	HcjAvo8sAVrEbNJQz08zCz9y9YqXcAvYvdU1ercKZUeSINmh7JZlhpwWWcKvdf1A
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 49rfp8c6xn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 Oct 2025 09:14:31 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 59H9EULh021760;
	Fri, 17 Oct 2025 09:14:30 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 49rfp8c6wu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 Oct 2025 09:14:30 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 59H8ubTK003613;
	Fri, 17 Oct 2025 09:14:29 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 49r1xyc2fw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 Oct 2025 09:14:29 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 59H9ENpC44826910
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 17 Oct 2025 09:14:23 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A877D2004D;
	Fri, 17 Oct 2025 09:14:23 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 12A9920043;
	Fri, 17 Oct 2025 09:14:22 +0000 (GMT)
Received: from p-imbrenda (unknown [9.111.16.217])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with SMTP;
	Fri, 17 Oct 2025 09:14:21 +0000 (GMT)
Date: Fri, 17 Oct 2025 11:12:41 +0200
From: Claudio Imbrenda <imbrenda@linux.ibm.com>
To: Sean Christopherson <seanjc@google.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>,
        Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>,
        Huacai Chen <chenhuacai@kernel.org>,
        Madhavan Srinivasan
 <maddy@linux.ibm.com>,
        Anup Patel <anup@brainfault.org>, Paul Walmsley
 <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou
 <aou@eecs.berkeley.edu>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Janosch Frank <frankja@linux.ibm.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        "Kirill A. Shutemov" <kas@kernel.org>,
        linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
        kvm@vger.kernel.org, loongarch@lists.linux.dev,
        linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
        x86@kernel.org, linux-coco@lists.linux.dev,
        linux-kernel@vger.kernel.org, Ira Weiny
 <ira.weiny@intel.com>,
        Kai Huang <kai.huang@intel.com>, Michael Roth
 <michael.roth@amd.com>,
        Yan Zhao <yan.y.zhao@intel.com>,
        Vishal Annapurve
 <vannapurve@google.com>,
        Rick Edgecombe <rick.p.edgecombe@intel.com>,
        Ackerley Tng <ackerleytng@google.com>,
        Binbin Wu
 <binbin.wu@linux.intel.com>
Subject: Re: [PATCH v3 01/25] KVM: Make support for
 kvm_arch_vcpu_async_ioctl() mandatory
Message-ID: <20251017111241.3ce81f4f@p-imbrenda>
In-Reply-To: <20251017003244.186495-2-seanjc@google.com>
References: <20251017003244.186495-1-seanjc@google.com>
	<20251017003244.186495-2-seanjc@google.com>
Organization: IBM
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: WPthx5jfwUZwmBXm82Ziu6FlbYNGp6QD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDEyMDA4NCBTYWx0ZWRfX5i24UI+B1MAY
 VWfB/xDHmOzuGKZz+zkZ2l9x8ZFHXJp4bGgLzsCYZhO0HnyGdmaDMrR3mpcUClvHV/6yUf/DJgW
 ovv0s0yH2DpJzEoDalTUQ7xn8+BsGsuUL1Evgi81/rNK8f7liy/e1u5Eplk2Ps1PMqe9VGG88Gd
 B/PWIRzNBJouLYr5zASWk7TtznxP5X/Q7AcX7MyEwpCz/kio7cNBjUypNeg4aqEfYVvH1iNdnqr
 DDQxOpdTs6xRl/ZL81gMulg8gwbv+0DLWp2ISeg0UnUuPhPGkSeiVmEYx2auRl+f/B7rfTpWlo4
 36AvglRUTKXS0RgNKsrmRPKBst0ScMzACFqT/FpbRDvXiLwKYRDDM1MCJ2Zszccck9R4e2QBfwT
 CUAxfvzW0pSyHs9EaJzGgT7XBGLbiw==
X-Proofpoint-GUID: R3CWxwVp1MSUDtnlqjQzPeUreuCpS978
X-Authority-Analysis: v=2.4 cv=af5sXBot c=1 sm=1 tr=0 ts=68f208f7 cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=kj9zAlcOel0A:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=1XWaLZrsAAAA:8 a=VnNF1IyMAAAA:8 a=Pqhxwy0yHowpa1wmBDEA:9
 a=3CZKy65qupELU2PZ:21 a=CjuIK1q_8ugA:10 a=nl4s5V0KI7Kw-pW0DWrs:22
 a=pHzHmUro8NiASowvMSCR:22 a=xoEH_sTeL_Rfw54TyV31:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-17_03,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 priorityscore=1501 spamscore=0 adultscore=0 suspectscore=0
 bulkscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510120084
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, 16 Oct 2025 17:32:19 -0700
Sean Christopherson <seanjc@google.com> wrote:

> Implement kvm_arch_vcpu_async_ioctl() "natively" in x86 and arm64 instead
> of relying on an #ifdef'd stub, and drop HAVE_KVM_VCPU_ASYNC_IOCTL in
> anticipation of using the API on x86.  Once x86 uses the API, providing a
> stub for one architecture and having all other architectures opt-in
> requires more code than simply implementing the API in the lone holdout.
> 
> Eliminating the Kconfig will also reduce churn if the API is renamed in
> the future (spoiler alert).
> 
> No functional change intended.
> 
> Signed-off-by: Sean Christopherson <seanjc@google.com>

Acked-by: Claudio Imbrenda <imbrenda@linux.ibm.com>

> ---
>  arch/arm64/kvm/arm.c       |  6 ++++++
>  arch/loongarch/kvm/Kconfig |  1 -
>  arch/mips/kvm/Kconfig      |  1 -
>  arch/powerpc/kvm/Kconfig   |  1 -
>  arch/riscv/kvm/Kconfig     |  1 -
>  arch/s390/kvm/Kconfig      |  1 -
>  arch/x86/kvm/x86.c         |  6 ++++++
>  include/linux/kvm_host.h   | 10 ----------
>  virt/kvm/Kconfig           |  3 ---
>  9 files changed, 12 insertions(+), 18 deletions(-)
> 
> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
> index f21d1b7f20f8..785aaaee6a5d 100644
> --- a/arch/arm64/kvm/arm.c
> +++ b/arch/arm64/kvm/arm.c
> @@ -1828,6 +1828,12 @@ long kvm_arch_vcpu_ioctl(struct file *filp,
>  	return r;
>  }
>  
> +long kvm_arch_vcpu_async_ioctl(struct file *filp, unsigned int ioctl,
> +			       unsigned long arg)
> +{
> +	return -ENOIOCTLCMD;
> +}
> +
>  void kvm_arch_sync_dirty_log(struct kvm *kvm, struct kvm_memory_slot *memslot)
>  {
>  
> diff --git a/arch/loongarch/kvm/Kconfig b/arch/loongarch/kvm/Kconfig
> index ae64bbdf83a7..ed4f724db774 100644
> --- a/arch/loongarch/kvm/Kconfig
> +++ b/arch/loongarch/kvm/Kconfig
> @@ -25,7 +25,6 @@ config KVM
>  	select HAVE_KVM_IRQCHIP
>  	select HAVE_KVM_MSI
>  	select HAVE_KVM_READONLY_MEM
> -	select HAVE_KVM_VCPU_ASYNC_IOCTL
>  	select KVM_COMMON
>  	select KVM_GENERIC_DIRTYLOG_READ_PROTECT
>  	select KVM_GENERIC_HARDWARE_ENABLING
> diff --git a/arch/mips/kvm/Kconfig b/arch/mips/kvm/Kconfig
> index ab57221fa4dd..cc13cc35f208 100644
> --- a/arch/mips/kvm/Kconfig
> +++ b/arch/mips/kvm/Kconfig
> @@ -22,7 +22,6 @@ config KVM
>  	select EXPORT_UASM
>  	select KVM_COMMON
>  	select KVM_GENERIC_DIRTYLOG_READ_PROTECT
> -	select HAVE_KVM_VCPU_ASYNC_IOCTL
>  	select KVM_MMIO
>  	select KVM_GENERIC_MMU_NOTIFIER
>  	select KVM_GENERIC_HARDWARE_ENABLING
> diff --git a/arch/powerpc/kvm/Kconfig b/arch/powerpc/kvm/Kconfig
> index 2f2702c867f7..c9a2d50ff1b0 100644
> --- a/arch/powerpc/kvm/Kconfig
> +++ b/arch/powerpc/kvm/Kconfig
> @@ -20,7 +20,6 @@ if VIRTUALIZATION
>  config KVM
>  	bool
>  	select KVM_COMMON
> -	select HAVE_KVM_VCPU_ASYNC_IOCTL
>  	select KVM_VFIO
>  	select HAVE_KVM_IRQ_BYPASS
>  
> diff --git a/arch/riscv/kvm/Kconfig b/arch/riscv/kvm/Kconfig
> index c50328212917..77379f77840a 100644
> --- a/arch/riscv/kvm/Kconfig
> +++ b/arch/riscv/kvm/Kconfig
> @@ -23,7 +23,6 @@ config KVM
>  	select HAVE_KVM_IRQCHIP
>  	select HAVE_KVM_IRQ_ROUTING
>  	select HAVE_KVM_MSI
> -	select HAVE_KVM_VCPU_ASYNC_IOCTL
>  	select HAVE_KVM_READONLY_MEM
>  	select HAVE_KVM_DIRTY_RING_ACQ_REL
>  	select KVM_COMMON
> diff --git a/arch/s390/kvm/Kconfig b/arch/s390/kvm/Kconfig
> index cae908d64550..96d16028e8b7 100644
> --- a/arch/s390/kvm/Kconfig
> +++ b/arch/s390/kvm/Kconfig
> @@ -20,7 +20,6 @@ config KVM
>  	def_tristate y
>  	prompt "Kernel-based Virtual Machine (KVM) support"
>  	select HAVE_KVM_CPU_RELAX_INTERCEPT
> -	select HAVE_KVM_VCPU_ASYNC_IOCTL
>  	select KVM_ASYNC_PF
>  	select KVM_ASYNC_PF_SYNC
>  	select KVM_COMMON
> diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
> index b4b5d2d09634..ca5ba2caf314 100644
> --- a/arch/x86/kvm/x86.c
> +++ b/arch/x86/kvm/x86.c
> @@ -7240,6 +7240,12 @@ static int kvm_vm_ioctl_set_clock(struct kvm *kvm, void __user *argp)
>  	return 0;
>  }
>  
> +long kvm_arch_vcpu_async_ioctl(struct file *filp, unsigned int ioctl,
> +			       unsigned long arg)
> +{
> +	return -ENOIOCTLCMD;
> +}
> +
>  int kvm_arch_vm_ioctl(struct file *filp, unsigned int ioctl, unsigned long arg)
>  {
>  	struct kvm *kvm = filp->private_data;
> diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
> index 5bd76cf394fa..7186b2ae4b57 100644
> --- a/include/linux/kvm_host.h
> +++ b/include/linux/kvm_host.h
> @@ -2437,18 +2437,8 @@ static inline bool kvm_arch_no_poll(struct kvm_vcpu *vcpu)
>  }
>  #endif /* CONFIG_HAVE_KVM_NO_POLL */
>  
> -#ifdef CONFIG_HAVE_KVM_VCPU_ASYNC_IOCTL
>  long kvm_arch_vcpu_async_ioctl(struct file *filp,
>  			       unsigned int ioctl, unsigned long arg);
> -#else
> -static inline long kvm_arch_vcpu_async_ioctl(struct file *filp,
> -					     unsigned int ioctl,
> -					     unsigned long arg)
> -{
> -	return -ENOIOCTLCMD;
> -}
> -#endif /* CONFIG_HAVE_KVM_VCPU_ASYNC_IOCTL */
> -
>  void kvm_arch_guest_memory_reclaimed(struct kvm *kvm);
>  
>  #ifdef CONFIG_HAVE_KVM_VCPU_RUN_PID_CHANGE
> diff --git a/virt/kvm/Kconfig b/virt/kvm/Kconfig
> index 5f0015c5dd95..267c7369c765 100644
> --- a/virt/kvm/Kconfig
> +++ b/virt/kvm/Kconfig
> @@ -78,9 +78,6 @@ config HAVE_KVM_IRQ_BYPASS
>         tristate
>         select IRQ_BYPASS_MANAGER
>  
> -config HAVE_KVM_VCPU_ASYNC_IOCTL
> -       bool
> -
>  config HAVE_KVM_VCPU_RUN_PID_CHANGE
>         bool
>  


