Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D779BB903
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Sep 2019 18:05:35 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46cTgc47rWzDqLR
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Sep 2019 02:05:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kaod.org
 (client-ip=87.98.184.159; helo=4.mo6.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
X-Greylist: delayed 408 seconds by postgrey-1.36 at bilbo;
 Tue, 24 Sep 2019 02:03:43 AEST
Received: from 4.mo6.mail-out.ovh.net (4.mo6.mail-out.ovh.net [87.98.184.159])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46cTdW0Lx3zDqMC
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Sep 2019 02:03:41 +1000 (AEST)
Received: from player716.ha.ovh.net (unknown [10.108.35.124])
 by mo6.mail-out.ovh.net (Postfix) with ESMTP id 8D5421E27A0
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Sep 2019 17:56:48 +0200 (CEST)
Received: from kaod.org (lfbn-1-2240-157.w90-76.abo.wanadoo.fr [90.76.60.157])
 (Authenticated sender: clg@kaod.org)
 by player716.ha.ovh.net (Postfix) with ESMTPSA id 229F0A12E2CB;
 Mon, 23 Sep 2019 15:56:38 +0000 (UTC)
Subject: Re: [PATCH 6/6] KVM: PPC: Book3S HV: XIVE: Allow userspace to set the
 # of VPs
To: Greg Kurz <groug@kaod.org>, Paul Mackerras <paulus@ozlabs.org>
References: <156925341155.974393.11681611197111945710.stgit@bahia.lan>
 <156925344605.974393.13942051061218979129.stgit@bahia.lan>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <f02b7fa0-3267-90e3-3096-c3460c49af58@kaod.org>
Date: Mon, 23 Sep 2019 17:56:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <156925344605.974393.13942051061218979129.stgit@bahia.lan>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 16951548998588271549
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrvdekgdelhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
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
Cc: kvm@vger.kernel.org, =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@redhat.com>,
 kvm-ppc@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>,
 linuxppc-dev@lists.ozlabs.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 23/09/2019 17:44, Greg Kurz wrote:
> Add a new attribute to both legacy and native XIVE KVM devices so that
> userspace can require less interrupt servers than the current default
> (KVM_MAX_VCPUS, 2048). This will allow to allocate less VPs in OPAL,
> and likely increase the number of VMs that can run with an in-kernel
> XIVE implementation.
> 
> Since the legacy XIVE KVM device is exposed to userspace through the
> XICS KVM API, a new attribute group is added to it for this purpose.
> While here, fix the syntax of the existing KVM_DEV_XICS_GRP_SOURCES
> in the XICS documentation.
> 
> Signed-off-by: Greg Kurz <groug@kaod.org>

Reviewed-by: Cédric Le Goater <clg@kaod.org>

C.

> ---
>  Documentation/virt/kvm/devices/xics.txt |   14 ++++++++++++--
>  Documentation/virt/kvm/devices/xive.txt |    8 ++++++++
>  arch/powerpc/include/uapi/asm/kvm.h     |    3 +++
>  arch/powerpc/kvm/book3s_xive.c          |   10 ++++++++++
>  arch/powerpc/kvm/book3s_xive_native.c   |    3 +++
>  5 files changed, 36 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/virt/kvm/devices/xics.txt b/Documentation/virt/kvm/devices/xics.txt
> index 42864935ac5d..1cf9621f8341 100644
> --- a/Documentation/virt/kvm/devices/xics.txt
> +++ b/Documentation/virt/kvm/devices/xics.txt
> @@ -3,9 +3,19 @@ XICS interrupt controller
>  Device type supported: KVM_DEV_TYPE_XICS
>  
>  Groups:
> -  KVM_DEV_XICS_SOURCES
> +  1. KVM_DEV_XICS_GRP_SOURCES
>    Attributes: One per interrupt source, indexed by the source number.
>  
> +  2. KVM_DEV_XICS_GRP_CTRL
> +  Attributes:
> +    2.1 KVM_DEV_XICS_NR_SERVERS (write only)
> +  The kvm_device_attr.addr points to a __u32 value which is the number of
> +  interrupt server numbers (ie, highest possible vcpu id plus one).
> +  Errors:
> +    -EINVAL: Value greater than KVM_MAX_VCPUS.
> +    -EFAULT: Invalid user pointer for attr->addr.
> +    -EBUSY:  A vcpu is already connected to the device.
> +
>  This device emulates the XICS (eXternal Interrupt Controller
>  Specification) defined in PAPR.  The XICS has a set of interrupt
>  sources, each identified by a 20-bit source number, and a set of
> @@ -38,7 +48,7 @@ least-significant end of the word:
>  
>  Each source has 64 bits of state that can be read and written using
>  the KVM_GET_DEVICE_ATTR and KVM_SET_DEVICE_ATTR ioctls, specifying the
> -KVM_DEV_XICS_SOURCES attribute group, with the attribute number being
> +KVM_DEV_XICS_GRP_SOURCES attribute group, with the attribute number being
>  the interrupt source number.  The 64 bit state word has the following
>  bitfields, starting from the least-significant end of the word:
>  
> diff --git a/Documentation/virt/kvm/devices/xive.txt b/Documentation/virt/kvm/devices/xive.txt
> index 9a24a4525253..fd418b907d0e 100644
> --- a/Documentation/virt/kvm/devices/xive.txt
> +++ b/Documentation/virt/kvm/devices/xive.txt
> @@ -78,6 +78,14 @@ the legacy interrupt mode, referred as XICS (POWER7/8).
>      migrating the VM.
>      Errors: none
>  
> +    1.3 KVM_DEV_XIVE_NR_SERVERS (write only)
> +    The kvm_device_attr.addr points to a __u32 value which is the number of
> +    interrupt server numbers (ie, highest possible vcpu id plus one).
> +    Errors:
> +      -EINVAL: Value greater than KVM_KVM_VCPUS.
> +      -EFAULT: Invalid user pointer for attr->addr.
> +      -EBUSY:  A vCPU is already connected to the device.
> +
>    2. KVM_DEV_XIVE_GRP_SOURCE (write only)
>    Initializes a new source in the XIVE device and mask it.
>    Attributes:
> diff --git a/arch/powerpc/include/uapi/asm/kvm.h b/arch/powerpc/include/uapi/asm/kvm.h
> index b0f72dea8b11..264e266a85bf 100644
> --- a/arch/powerpc/include/uapi/asm/kvm.h
> +++ b/arch/powerpc/include/uapi/asm/kvm.h
> @@ -667,6 +667,8 @@ struct kvm_ppc_cpu_char {
>  
>  /* PPC64 eXternal Interrupt Controller Specification */
>  #define KVM_DEV_XICS_GRP_SOURCES	1	/* 64-bit source attributes */
> +#define KVM_DEV_XICS_GRP_CTRL		2
> +#define   KVM_DEV_XICS_NR_SERVERS	1
>  
>  /* Layout of 64-bit source attribute values */
>  #define  KVM_XICS_DESTINATION_SHIFT	0
> @@ -683,6 +685,7 @@ struct kvm_ppc_cpu_char {
>  #define KVM_DEV_XIVE_GRP_CTRL		1
>  #define   KVM_DEV_XIVE_RESET		1
>  #define   KVM_DEV_XIVE_EQ_SYNC		2
> +#define   KVM_DEV_XIVE_NR_SERVERS	3
>  #define KVM_DEV_XIVE_GRP_SOURCE		2	/* 64-bit source identifier */
>  #define KVM_DEV_XIVE_GRP_SOURCE_CONFIG	3	/* 64-bit source identifier */
>  #define KVM_DEV_XIVE_GRP_EQ_CONFIG	4	/* 64-bit EQ identifier */
> diff --git a/arch/powerpc/kvm/book3s_xive.c b/arch/powerpc/kvm/book3s_xive.c
> index 4a333dcfddd8..c1901583e6c0 100644
> --- a/arch/powerpc/kvm/book3s_xive.c
> +++ b/arch/powerpc/kvm/book3s_xive.c
> @@ -1905,6 +1905,11 @@ static int xive_set_attr(struct kvm_device *dev, struct kvm_device_attr *attr)
>  	switch (attr->group) {
>  	case KVM_DEV_XICS_GRP_SOURCES:
>  		return xive_set_source(xive, attr->attr, attr->addr);
> +	case KVM_DEV_XICS_GRP_CTRL:
> +		switch (attr->attr) {
> +		case KVM_DEV_XICS_NR_SERVERS:
> +			return kvmppc_xive_set_nr_servers(xive, attr->addr);
> +		}
>  	}
>  	return -ENXIO;
>  }
> @@ -1930,6 +1935,11 @@ static int xive_has_attr(struct kvm_device *dev, struct kvm_device_attr *attr)
>  		    attr->attr < KVMPPC_XICS_NR_IRQS)
>  			return 0;
>  		break;
> +	case KVM_DEV_XICS_GRP_CTRL:
> +		switch (attr->attr) {
> +		case KVM_DEV_XICS_NR_SERVERS:
> +			return 0;
> +		}
>  	}
>  	return -ENXIO;
>  }
> diff --git a/arch/powerpc/kvm/book3s_xive_native.c b/arch/powerpc/kvm/book3s_xive_native.c
> index 5e18364d52a9..8e954c5d5efb 100644
> --- a/arch/powerpc/kvm/book3s_xive_native.c
> +++ b/arch/powerpc/kvm/book3s_xive_native.c
> @@ -921,6 +921,8 @@ static int kvmppc_xive_native_set_attr(struct kvm_device *dev,
>  			return kvmppc_xive_reset(xive);
>  		case KVM_DEV_XIVE_EQ_SYNC:
>  			return kvmppc_xive_native_eq_sync(xive);
> +		case KVM_DEV_XIVE_NR_SERVERS:
> +			return kvmppc_xive_set_nr_servers(xive, attr->addr);
>  		}
>  		break;
>  	case KVM_DEV_XIVE_GRP_SOURCE:
> @@ -960,6 +962,7 @@ static int kvmppc_xive_native_has_attr(struct kvm_device *dev,
>  		switch (attr->attr) {
>  		case KVM_DEV_XIVE_RESET:
>  		case KVM_DEV_XIVE_EQ_SYNC:
> +		case KVM_DEV_XIVE_NR_SERVERS:
>  			return 0;
>  		}
>  		break;
> 

