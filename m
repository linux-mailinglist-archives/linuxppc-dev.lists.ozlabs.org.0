Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 60C8610B955
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Nov 2019 21:52:44 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47NXyx3sQKzDqPM
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Nov 2019 07:52:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=205.139.110.61;
 helo=us-smtp-delivery-1.mimecast.com; envelope-from=pbonzini@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.b="OF3rHfMs"; 
 dkim-atps=neutral
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47NXlB5ySJzDqsD
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Nov 2019 07:42:29 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574887346;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=D9clyZwt1Uy0kISk+R89yEnPo3r3EiKdUvG2fY8pwo4=;
 b=OF3rHfMsDBbfC4jA0NbDGKHBqv3YfFBK5FdfQEcBqMKPlAxIuMJT3cNRjuJxwyj3b02BBj
 TtYJcSdo6PaTYLOYYdq8i6lPtc4NUy9x4qJkqLlNWejfZuLnoP1FLk52//gDuIJOWTwYEB
 7oUQ3qsEuubv3vXbeipr6ZqbBt7fFuY=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-196-c11vlsa5ORuU8u_C-qu6Zg-1; Wed, 27 Nov 2019 11:40:57 -0500
Received: by mail-wm1-f72.google.com with SMTP id y133so2605275wmd.8
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Nov 2019 08:40:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=D9clyZwt1Uy0kISk+R89yEnPo3r3EiKdUvG2fY8pwo4=;
 b=KeVcp2y3f5cgDDdoC3Di62LS1co20WVrbJ+3+fw6aQBfG1Q1+ULjPE9Furk6xZI579
 N20YZsQpHr/b7GuUvRT0YrWUuowGscFWDNbNuFWJaItX5yZOAkPwjCsNoC7Ru2H1te1d
 s1DT3HfEWDJNiUTWNYWXLKlt4CEA5xLblWwrxIMkNXGR+53zR2wFRDW+/oo8yMlXiuwh
 /vQzHkuSGRqBjMIK9cD8Ka9+SDlSEkFu38e8/fzJnxDSSx7EFsFgoqG0ZR7PMe8GTdFp
 VBXmdJ+rEOlYK+vCwN2LuREVRVtwJv4/U9THhTtiNRJjGYBrIXmsCVdWTmYkcMDwI/Am
 NpXg==
X-Gm-Message-State: APjAAAUrZFz5koxSJJvVgRPbLAeVkEtYQIySyr2YWtSsXXSycEeYp7HL
 XgqQV1FyOq/WxNh1m8meUy9eUxHSry8hb3svUIWkyi6mKXm6mpezZ7rtQwMpzHhLI0QI5dFOadx
 ZrQXp8MJbzitsCHcoFYJqFcynOQ==
X-Received: by 2002:a5d:6548:: with SMTP id z8mr46445805wrv.273.1574872856521; 
 Wed, 27 Nov 2019 08:40:56 -0800 (PST)
X-Google-Smtp-Source: APXvYqwJQYQNL5K2QbppXpn6b5gcGOLuYeQF7OCPZVcjBL74U3Lx1Ff4ldEAiNEf3QLlek78dqhKpg==
X-Received: by 2002:a5d:6548:: with SMTP id z8mr46445770wrv.273.1574872856109; 
 Wed, 27 Nov 2019 08:40:56 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:459f:99a9:39f1:65ba?
 ([2001:b07:6468:f312:459f:99a9:39f1:65ba])
 by smtp.gmail.com with ESMTPSA id b63sm6832818wmb.40.2019.11.27.08.40.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Nov 2019 08:40:55 -0800 (PST)
Subject: Re: [PATCH 1/1] powerpc/kvm/book3s: Fixes possible 'use after
 release' of kvm
To: Leonardo Bras <leonardo@linux.ibm.com>,
 Sean Christopherson <sean.j.christopherson@intel.com>,
 kvm-ppc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org
References: <20191126175212.377171-1-leonardo@linux.ibm.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <f3750cf8-88fc-cae7-1cfb-cb4b86b44704@redhat.com>
Date: Wed, 27 Nov 2019 17:40:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191126175212.377171-1-leonardo@linux.ibm.com>
Content-Language: en-US
X-MC-Unique: c11vlsa5ORuU8u_C-qu6Zg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
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
Cc: =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 26/11/19 18:52, Leonardo Bras wrote:
> Fixes a possible 'use after free' of kvm variable.
> It does use mutex_unlock(&kvm->lock) after possible freeing a variable
> with kvm_put_kvm(kvm).
> 
> Signed-off-by: Leonardo Bras <leonardo@linux.ibm.com>
> ---
>  arch/powerpc/kvm/book3s_64_vio.c | 3 +--
>  virt/kvm/kvm_main.c              | 8 ++++----
>  2 files changed, 5 insertions(+), 6 deletions(-)
> 
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
>  	kfree(stt);
>   fail_acct:
>  	account_locked_vm(current->mm, kvmppc_stt_pages(npages), false);

This part is a good change, as it makes the code clearer.  The
virt/kvm/kvm_main.c bits, however, are not necessary as explained by Sean.

Paolo

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
>  
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
> 

