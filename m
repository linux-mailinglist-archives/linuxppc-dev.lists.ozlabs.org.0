Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 59B651AC5E3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Apr 2020 16:31:47 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4931rB5jxhzDr9T
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Apr 2020 00:31:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=205.139.110.61;
 helo=us-smtp-delivery-1.mimecast.com; envelope-from=pbonzini@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=K4Kxh+pY; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=fZ+NWlNV; 
 dkim-atps=neutral
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4931Yh68wNzDrgD
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Apr 2020 00:19:04 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587046613;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7hnF0DDKrlu0/wsAOrUaDsyzDUw85QJZaEcoKNO3lxk=;
 b=K4Kxh+pYxEWtus1HHkgACQr5eDuLNaRZjvAz8uMWXlzT3MPEhhsm3yqV9q0Vlx3ozhvLso
 EnHJq6DRraubFUJnVYunxN9W56AxgW4uC4StuU5vyOYgLst4gWBnvvJ4PSdZmR+t/ruFAx
 ouPOflVnOJViZRftpsb1J8olZL2enEk=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587046741;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7hnF0DDKrlu0/wsAOrUaDsyzDUw85QJZaEcoKNO3lxk=;
 b=fZ+NWlNVVVEuJbEgmYDN0v+RiWMHD6BXPOl74zENIHzSMIrYvZ5sH4R1uT32/Eyha2onwz
 3JYg+lyHiWSyvmRO9lCcFWozOHBNuJ1cNARyf4HfYDyvq7c4VD6eTvCtjS0FH8GlIEOIvW
 Y1kf98tfQcPmw3xkzM6DYd4r5tha6iY=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-348-tbqAb1ScPzSBjl2hzGcYqw-1; Thu, 16 Apr 2020 10:16:49 -0400
X-MC-Unique: tbqAb1ScPzSBjl2hzGcYqw-1
Received: by mail-wr1-f71.google.com with SMTP id s11so1785525wru.6
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Apr 2020 07:16:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7hnF0DDKrlu0/wsAOrUaDsyzDUw85QJZaEcoKNO3lxk=;
 b=EF5OYDjDTcAfu5YoeNhU0FtJiUHJOmHy17c7i5YNfgjNMmh/Ihxst3QAKya5oPUJI4
 qxmgpRfrmt75IbD7318VxCKeVLEaocofQ2rh4hCf7vTmaE5ZTu+EWFWVeltL9KNydp+6
 ywqZoGKMKJKOfaJ93TDEfbzCYSZzWJIkru9TKjvY4NoZ4u41e2H62WF1oUCU7WnCgAc9
 daK/gU8/4S24nTZQUVWK+jjiA5iQeUht08HKG26dmjBF67pnexq9Pq0ZIMOqV06qFIBE
 SPv3v0WW+nzsQL0zQRTrdhoUtZcOkfK1h27PKar4LZXYo3LkZUSbvE22rohqJCnBTIgk
 gS6g==
X-Gm-Message-State: AGi0PubMHvQ0LwrMfy/v7nufTT5rOabtGO0S0JAdhAVVYx5aEtj3nqVI
 PFhwdgTAFH3KXf/kVoIn64143loV3Ec9eRrU0IZ4HPgBZohYkAQbKZXJbgGt+LvhnK9C9FWNFvO
 rD6fSbLfckwF99uDgRU/fPveZ8A==
X-Received: by 2002:a5d:6584:: with SMTP id q4mr24139440wru.403.1587046608291; 
 Thu, 16 Apr 2020 07:16:48 -0700 (PDT)
X-Google-Smtp-Source: APiQypJaroci/qQpvf8qcrl+CF8Sz/BzOeyBmpL55iYWlGov5mFc7JlBFtlz5rT24UUwp7LeJ9OTfQ==
X-Received: by 2002:a5d:6584:: with SMTP id q4mr24139399wru.403.1587046607973; 
 Thu, 16 Apr 2020 07:16:47 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:399d:3ef7:647c:b12d?
 ([2001:b07:6468:f312:399d:3ef7:647c:b12d])
 by smtp.gmail.com with ESMTPSA id d133sm4118344wmc.27.2020.04.16.07.16.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Apr 2020 07:16:47 -0700 (PDT)
Subject: Re: [PATCH v2] KVM: Optimize kvm_arch_vcpu_ioctl_run function
To: Tianjia Zhang <tianjia.zhang@linux.alibaba.com>,
 tsbogend@alpha.franken.de, paulus@ozlabs.org, mpe@ellerman.id.au,
 benh@kernel.crashing.org, borntraeger@de.ibm.com, frankja@linux.ibm.com,
 david@redhat.com, cohuck@redhat.com, heiko.carstens@de.ibm.com,
 gor@linux.ibm.com, sean.j.christopherson@intel.com, vkuznets@redhat.com,
 wanpengli@tencent.com, jmattson@google.com, joro@8bytes.org,
 tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, x86@kernel.org,
 hpa@zytor.com, maz@kernel.org, james.morse@arm.com,
 julien.thierry.kdev@gmail.com, suzuki.poulose@arm.com,
 christoffer.dall@arm.com, peterx@redhat.com, thuth@redhat.com
References: <20200416051057.26526-1-tianjia.zhang@linux.alibaba.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <db7b02c0-2b7b-7c93-9dd0-b0303ea5da5e@redhat.com>
Date: Thu, 16 Apr 2020 16:16:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200416051057.26526-1-tianjia.zhang@linux.alibaba.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: linux-s390@vger.kernel.org, kvm@vger.kernel.org, linux-mips@vger.kernel.org,
 kvm-ppc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, kvmarm@lists.cs.columbia.edu,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 16/04/20 07:10, Tianjia Zhang wrote:
> In earlier versions of kvm, 'kvm_run' is an independent structure
> and is not included in the vcpu structure. At present, 'kvm_run'
> is already included in the vcpu structure, so the parameter
> 'kvm_run' is redundant.
> 
> This patch simplify the function definition, removes the extra
> 'kvm_run' parameter, and extract it from the 'kvm_vcpu' structure
> if necessary.
> 
> Signed-off-by: Tianjia Zhang <tianjia.zhang@linux.alibaba.com>
> ---
> 
> v2 change:
>   remove 'kvm_run' parameter and extract it from 'kvm_vcpu'
> 
>  arch/mips/kvm/mips.c       |  3 ++-
>  arch/powerpc/kvm/powerpc.c |  3 ++-
>  arch/s390/kvm/kvm-s390.c   |  3 ++-
>  arch/x86/kvm/x86.c         | 11 ++++++-----
>  include/linux/kvm_host.h   |  2 +-
>  virt/kvm/arm/arm.c         |  6 +++---
>  virt/kvm/kvm_main.c        |  2 +-
>  7 files changed, 17 insertions(+), 13 deletions(-)
> 
> diff --git a/arch/mips/kvm/mips.c b/arch/mips/kvm/mips.c
> index 8f05dd0a0f4e..ec24adf4857e 100644
> --- a/arch/mips/kvm/mips.c
> +++ b/arch/mips/kvm/mips.c
> @@ -439,8 +439,9 @@ int kvm_arch_vcpu_ioctl_set_guest_debug(struct kvm_vcpu *vcpu,
>  	return -ENOIOCTLCMD;
>  }
>  
> -int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu, struct kvm_run *run)
> +int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
>  {
> +	struct kvm_run *run = vcpu->run;
>  	int r = -EINTR;
>  
>  	vcpu_load(vcpu);
> diff --git a/arch/powerpc/kvm/powerpc.c b/arch/powerpc/kvm/powerpc.c
> index e15166b0a16d..7e24691e138a 100644
> --- a/arch/powerpc/kvm/powerpc.c
> +++ b/arch/powerpc/kvm/powerpc.c
> @@ -1764,8 +1764,9 @@ int kvm_vcpu_ioctl_set_one_reg(struct kvm_vcpu *vcpu, struct kvm_one_reg *reg)
>  	return r;
>  }
>  
> -int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu, struct kvm_run *run)
> +int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
>  {
> +	struct kvm_run *run = vcpu->run;
>  	int r;
>  
>  	vcpu_load(vcpu);
> diff --git a/arch/s390/kvm/kvm-s390.c b/arch/s390/kvm/kvm-s390.c
> index 19a81024fe16..443af3ead739 100644
> --- a/arch/s390/kvm/kvm-s390.c
> +++ b/arch/s390/kvm/kvm-s390.c
> @@ -4333,8 +4333,9 @@ static void store_regs(struct kvm_vcpu *vcpu, struct kvm_run *kvm_run)
>  		store_regs_fmt2(vcpu, kvm_run);
>  }
>  
> -int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu, struct kvm_run *kvm_run)
> +int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
>  {
> +	struct kvm_run *kvm_run = vcpu->run;
>  	int rc;
>  
>  	if (kvm_run->immediate_exit)
> diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
> index 3bf2ecafd027..a0338e86c90f 100644
> --- a/arch/x86/kvm/x86.c
> +++ b/arch/x86/kvm/x86.c
> @@ -8707,8 +8707,9 @@ static void kvm_put_guest_fpu(struct kvm_vcpu *vcpu)
>  	trace_kvm_fpu(0);
>  }
>  
> -int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu, struct kvm_run *kvm_run)
> +int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
>  {
> +	struct kvm_run *kvm_run = vcpu->run;
>  	int r;
>  
>  	vcpu_load(vcpu);
> @@ -8726,18 +8727,18 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu, struct kvm_run *kvm_run)
>  		r = -EAGAIN;
>  		if (signal_pending(current)) {
>  			r = -EINTR;
> -			vcpu->run->exit_reason = KVM_EXIT_INTR;
> +			kvm_run->exit_reason = KVM_EXIT_INTR;
>  			++vcpu->stat.signal_exits;
>  		}
>  		goto out;
>  	}
>  
> -	if (vcpu->run->kvm_valid_regs & ~KVM_SYNC_X86_VALID_FIELDS) {
> +	if (kvm_run->kvm_valid_regs & ~KVM_SYNC_X86_VALID_FIELDS) {
>  		r = -EINVAL;
>  		goto out;
>  	}
>  
> -	if (vcpu->run->kvm_dirty_regs) {
> +	if (kvm_run->kvm_dirty_regs) {
>  		r = sync_regs(vcpu);
>  		if (r != 0)
>  			goto out;
> @@ -8767,7 +8768,7 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu, struct kvm_run *kvm_run)
>  
>  out:
>  	kvm_put_guest_fpu(vcpu);
> -	if (vcpu->run->kvm_valid_regs)
> +	if (kvm_run->kvm_valid_regs)
>  		store_regs(vcpu);
>  	post_kvm_run_save(vcpu);
>  	kvm_sigset_deactivate(vcpu);
> diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
> index 6d58beb65454..1e17ef719595 100644
> --- a/include/linux/kvm_host.h
> +++ b/include/linux/kvm_host.h
> @@ -866,7 +866,7 @@ int kvm_arch_vcpu_ioctl_set_mpstate(struct kvm_vcpu *vcpu,
>  				    struct kvm_mp_state *mp_state);
>  int kvm_arch_vcpu_ioctl_set_guest_debug(struct kvm_vcpu *vcpu,
>  					struct kvm_guest_debug *dbg);
> -int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu, struct kvm_run *kvm_run);
> +int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu);
>  
>  int kvm_arch_init(void *opaque);
>  void kvm_arch_exit(void);
> diff --git a/virt/kvm/arm/arm.c b/virt/kvm/arm/arm.c
> index 48d0ec44ad77..f5390ac2165b 100644
> --- a/virt/kvm/arm/arm.c
> +++ b/virt/kvm/arm/arm.c
> @@ -639,7 +639,6 @@ static void check_vcpu_requests(struct kvm_vcpu *vcpu)
>  /**
>   * kvm_arch_vcpu_ioctl_run - the main VCPU run function to execute guest code
>   * @vcpu:	The VCPU pointer
> - * @run:	The kvm_run structure pointer used for userspace state exchange
>   *
>   * This function is called through the VCPU_RUN ioctl called from user space. It
>   * will execute VM code in a loop until the time slice for the process is used
> @@ -647,8 +646,9 @@ static void check_vcpu_requests(struct kvm_vcpu *vcpu)
>   * return with return value 0 and with the kvm_run structure filled in with the
>   * required data for the requested emulation.
>   */
> -int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu, struct kvm_run *run)
> +int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
>  {
> +	struct kvm_run *run = vcpu->run;
>  	int ret;
>  
>  	if (unlikely(!kvm_vcpu_initialized(vcpu)))
> @@ -659,7 +659,7 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu, struct kvm_run *run)
>  		return ret;
>  
>  	if (run->exit_reason == KVM_EXIT_MMIO) {
> -		ret = kvm_handle_mmio_return(vcpu, vcpu->run);
> +		ret = kvm_handle_mmio_return(vcpu, run);
>  		if (ret)
>  			return ret;
>  	}
> diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> index 74bdb7bf3295..e18faea89146 100644
> --- a/virt/kvm/kvm_main.c
> +++ b/virt/kvm/kvm_main.c
> @@ -3135,7 +3135,7 @@ static long kvm_vcpu_ioctl(struct file *filp,
>  				synchronize_rcu();
>  			put_pid(oldpid);
>  		}
> -		r = kvm_arch_vcpu_ioctl_run(vcpu, vcpu->run);
> +		r = kvm_arch_vcpu_ioctl_run(vcpu);
>  		trace_kvm_userspace_exit(vcpu->run->exit_reason, r);
>  		break;
>  	}
> 

Queued, thanks.

Paolo

