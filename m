Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CC4D110C07A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Nov 2019 23:59:44 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47NbnT1tF5zDqXt
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Nov 2019 09:59:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47NblS05Q3zDq8B
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Nov 2019 09:57:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=ozlabs.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.b="SZGWVoQj"; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix, from userid 1003)
 id 47NblR578Xz9sRs; Thu, 28 Nov 2019 09:57:55 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1574895475; bh=7lp6WdXRNwAaexgJv4y1ZsBrYzUJGxl4fS7hta9XSwY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SZGWVoQj+QSnlUnXRnCLApCigVRU6ObmCz3AiNQEqFCI79oHl0qwlEFqq3BjC7y/V
 e4s2cQ3SEXBSjlxB7srz2osBnlDosqFASG/u0GeL2OMfYrpDYl0WZ1Awzx7VcjRfKM
 NVEIwDdZDHE8Yah5OKAtZ1bP9tZpGMJIV7t2FcOjQHr7gAcA5B5pWV4BorsKpgUi83
 4ENqWNp2Z+JmUrc1C9ToOTZnSw/cQ+3wXWLv3mQgBw+ih+xtgefamgkI8ytiAHPSVK
 1n3y5ZZEv/9XwiQEF0x79BjQ8hgDvKMfgnSvb8EEsy+DJaSS+jpbKzTMFHhxacOXZe
 7LlTq9MzCgrZQ==
Date: Thu, 28 Nov 2019 09:57:47 +1100
From: Paul Mackerras <paulus@ozlabs.org>
To: Leonardo Bras <leonardo@linux.ibm.com>
Subject: Re: [PATCH 1/1] powerpc/kvm/book3s: Fixes possible 'use after
 release' of kvm
Message-ID: <20191127225747.GA2317@blackberry>
References: <20191126175212.377171-1-leonardo@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191126175212.377171-1-leonardo@linux.ibm.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
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
Cc: kvm@vger.kernel.org, Radim =?utf-8?B?S3LEjW3DocWZ?= <rkrcmar@redhat.com>,
 linux-kernel@vger.kernel.org, kvm-ppc@vger.kernel.org,
 Sean Christopherson <sean.j.christopherson@intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Nov 26, 2019 at 02:52:12PM -0300, Leonardo Bras wrote:
> Fixes a possible 'use after free' of kvm variable.
> It does use mutex_unlock(&kvm->lock) after possible freeing a variable
> with kvm_put_kvm(kvm).

Comments below...

> diff --git a/arch/powerpc/kvm/book3s_64_vio.c b/arch/powerpc/kvm/book3s_64_vio.c
> index 5834db0a54c6..a402ead833b6 100644
> --- a/arch/powerpc/kvm/book3s_64_vio.c
> +++ b/arch/powerpc/kvm/book3s_64_vio.c
> @@ -316,14 +316,13 @@ long kvm_vm_ioctl_create_spapr_tce(struct kvm *kvm,
>  
>  	if (ret >= 0)
>  		list_add_rcu(&stt->list, &kvm->arch.spapr_tce_tables);
> -	else
> -		kvm_put_kvm(kvm);
>  
>  	mutex_unlock(&kvm->lock);
>  
>  	if (ret >= 0)
>  		return ret;
>  
> +	kvm_put_kvm(kvm);

There isn't a potential use-after-free here.  We are relying on the
property that the release function (kvm_vm_release) cannot be called
in parallel with this function.  The reason is that this function
(kvm_vm_ioctl_create_spapr_tce) is handling an ioctl on a kvm VM file
descriptor.  That means that a userspace process has the file
descriptor still open.  The code that implements the close() system
call makes sure that no thread is still executing inside any system
call that is using the same file descriptor before calling the file
descriptor's release function (in this case, kvm_vm_release).  That
means that this kvm_put_kvm() call here cannot make the reference
count go to zero.

>  	kfree(stt);
>   fail_acct:
>  	account_locked_vm(current->mm, kvmppc_stt_pages(npages), false);
> diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> index 13efc291b1c7..f37089b60d09 100644
> --- a/virt/kvm/kvm_main.c
> +++ b/virt/kvm/kvm_main.c
> @@ -2744,10 +2744,8 @@ static int kvm_vm_ioctl_create_vcpu(struct kvm *kvm, u32 id)
>  	/* Now it's all set up, let userspace reach it */
>  	kvm_get_kvm(kvm);
>  	r = create_vcpu_fd(vcpu);
> -	if (r < 0) {
> -		kvm_put_kvm(kvm);
> +	if (r < 0)
>  		goto unlock_vcpu_destroy;
> -	}
>  
>  	kvm->vcpus[atomic_read(&kvm->online_vcpus)] = vcpu;
>  
> @@ -2771,6 +2769,8 @@ static int kvm_vm_ioctl_create_vcpu(struct kvm *kvm, u32 id)
>  	mutex_lock(&kvm->lock);
>  	kvm->created_vcpus--;
>  	mutex_unlock(&kvm->lock);
> +	if (r < 0)
> +		kvm_put_kvm(kvm);
>  	return r;
>  }

Once again we are inside an ioctl on the kvm VM file descriptor, so
the reference count cannot go to zero.

> @@ -3183,10 +3183,10 @@ static int kvm_ioctl_create_device(struct kvm *kvm,
>  	kvm_get_kvm(kvm);
>  	ret = anon_inode_getfd(ops->name, &kvm_device_fops, dev, O_RDWR | O_CLOEXEC);
>  	if (ret < 0) {
> -		kvm_put_kvm(kvm);
>  		mutex_lock(&kvm->lock);
>  		list_del(&dev->vm_node);
>  		mutex_unlock(&kvm->lock);
> +		kvm_put_kvm(kvm);
>  		ops->destroy(dev);
>  		return ret;
>  	}

Same again here.

Paul.
