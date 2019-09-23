Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 42E86BB998
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Sep 2019 18:30:37 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46cVDT6RCCzDqJL
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Sep 2019 02:30:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kaod.org
 (client-ip=46.105.47.167; helo=11.mo5.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
X-Greylist: delayed 1799 seconds by postgrey-1.36 at bilbo;
 Tue, 24 Sep 2019 02:28:40 AEST
Received: from 11.mo5.mail-out.ovh.net (11.mo5.mail-out.ovh.net
 [46.105.47.167])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46cVBJ6j8bzDqHZ
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Sep 2019 02:28:37 +1000 (AEST)
Received: from player688.ha.ovh.net (unknown [10.109.146.132])
 by mo5.mail-out.ovh.net (Postfix) with ESMTP id 2CFE224EDBD
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Sep 2019 17:50:09 +0200 (CEST)
Received: from kaod.org (lfbn-1-2240-157.w90-76.abo.wanadoo.fr [90.76.60.157])
 (Authenticated sender: clg@kaod.org)
 by player688.ha.ovh.net (Postfix) with ESMTPSA id C3ADEA0DF651;
 Mon, 23 Sep 2019 15:49:56 +0000 (UTC)
Subject: Re: [PATCH 2/6] KVM: PPC: Book3S HV: XIVE: Set kvm->arch.xive when
 VPs are allocated
To: Greg Kurz <groug@kaod.org>, Paul Mackerras <paulus@ozlabs.org>
References: <156925341155.974393.11681611197111945710.stgit@bahia.lan>
 <156925342310.974393.12235498904930019791.stgit@bahia.lan>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <10ba5a33-fe96-7672-3803-b4969056ac75@kaod.org>
Date: Mon, 23 Sep 2019 17:49:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <156925342310.974393.12235498904930019791.stgit@bahia.lan>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 16839240482170833853
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrvdekgdelfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
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

On 23/09/2019 17:43, Greg Kurz wrote:
> If we cannot allocate the XIVE VPs in OPAL, the creation of a XIVE or
> XICS-on-XIVE device is aborted as expected, but we leave kvm->arch.xive
> set forever since the relase method isn't called in this case. Any

release

> subsequent tentative to create a XIVE or XICS-on-XIVE for this VM will
> thus always fail. This is a problem for QEMU since it destroys and
> re-creates these devices when the VM is reset: the VM would be
> restricted to using the emulated XIVE or XICS forever.
> 
> As an alternative to adding rollback, do not assign kvm->arch.xive before
> making sure the XIVE VPs are allocated in OPAL.
> 
> Fixes: 5422e95103cf ("KVM: PPC: Book3S HV: XIVE: Replace the 'destroy' method by a 'release' method")
> Signed-off-by: Greg Kurz <groug@kaod.org>


Reviewed-by: Cédric Le Goater <clg@kaod.org>

C.

> ---
>  arch/powerpc/kvm/book3s_xive.c        |   11 +++++------
>  arch/powerpc/kvm/book3s_xive_native.c |    2 +-
>  2 files changed, 6 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/powerpc/kvm/book3s_xive.c b/arch/powerpc/kvm/book3s_xive.c
> index cd2006bfcd3e..2ef43d037a4f 100644
> --- a/arch/powerpc/kvm/book3s_xive.c
> +++ b/arch/powerpc/kvm/book3s_xive.c
> @@ -2006,6 +2006,10 @@ static int kvmppc_xive_create(struct kvm_device *dev, u32 type)
>  
>  	pr_devel("Creating xive for partition\n");
>  
> +	/* Already there ? */
> +	if (kvm->arch.xive)
> +		return -EEXIST;
> +
>  	xive = kvmppc_xive_get_device(kvm, type);
>  	if (!xive)
>  		return -ENOMEM;
> @@ -2014,12 +2018,6 @@ static int kvmppc_xive_create(struct kvm_device *dev, u32 type)
>  	xive->kvm = kvm;
>  	mutex_init(&xive->lock);
>  
> -	/* Already there ? */
> -	if (kvm->arch.xive)
> -		ret = -EEXIST;
> -	else
> -		kvm->arch.xive = xive;
> -
>  	/* We use the default queue size set by the host */
>  	xive->q_order = xive_native_default_eq_shift();
>  	if (xive->q_order < PAGE_SHIFT)
> @@ -2040,6 +2038,7 @@ static int kvmppc_xive_create(struct kvm_device *dev, u32 type)
>  		return ret;
>  
>  	dev->private = xive;
> +	kvm->arch.xive = xive;
>  	return 0;
>  }
>  
> diff --git a/arch/powerpc/kvm/book3s_xive_native.c b/arch/powerpc/kvm/book3s_xive_native.c
> index e9cbb42de424..84a354b90f60 100644
> --- a/arch/powerpc/kvm/book3s_xive_native.c
> +++ b/arch/powerpc/kvm/book3s_xive_native.c
> @@ -1087,7 +1087,6 @@ static int kvmppc_xive_native_create(struct kvm_device *dev, u32 type)
>  
>  	xive->dev = dev;
>  	xive->kvm = kvm;
> -	kvm->arch.xive = xive;
>  	mutex_init(&xive->mapping_lock);
>  	mutex_init(&xive->lock);
>  
> @@ -1109,6 +1108,7 @@ static int kvmppc_xive_native_create(struct kvm_device *dev, u32 type)
>  		return ret;
>  
>  	dev->private = xive;
> +	kvm->arch.xive = xive;
>  	return 0;
>  }
>  
> 

