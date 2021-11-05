Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 80509446998
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Nov 2021 21:22:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HmBkk2vkSz2ywp
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Nov 2021 07:22:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=XhJq67XO;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::533;
 helo=mail-pg1-x533.google.com; envelope-from=seanjc@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=XhJq67XO; dkim-atps=neutral
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com
 [IPv6:2607:f8b0:4864:20::533])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HmBk11Y6fz2yfk
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  6 Nov 2021 07:21:43 +1100 (AEDT)
Received: by mail-pg1-x533.google.com with SMTP id b4so9232390pgh.10
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 05 Nov 2021 13:21:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=FChUXutBpeRG92vMItY2zirb2KiX64mqNa6lRjXS4/o=;
 b=XhJq67XOVehGKyOlop0ZgXHOTZHwcQNzObFkCi6/KagxRodpEZ8yllo88wcXd9u5A4
 JyHn3eOSHm71QE0Ho4vu+PMzSC+hk/kpLn0XoWAl+sEDJCXJH8yRiSGn+WDU3uzo/0Jz
 vKuoP+xD9+dM6PIdOwrxBIcZiSTMvIRnKJ1ZTnCiCFNuTdGdR0au4APz76smsdf0FTJU
 MNMzCzzdiPQ0CIWIuM2KFOvXL49l2ImI8P3640AzVXeG075F7RRRDlC4KR+jmtTfyE56
 DSWnC2bV/xJ5K5cAgxAaKeJQrMHJdJxDe+n/OzOHw9DBQw6HJa62AhCnvmDdn0hwLrnK
 Xi4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=FChUXutBpeRG92vMItY2zirb2KiX64mqNa6lRjXS4/o=;
 b=KImZaL1QhX+aFgTSNsbwjo1UAu8RBhZDBVHixwGuM1BrGcsRAqcldtlK/emCf7GZTZ
 ZIiy8AVgiQRCUz/H9kW9r7IlCOx0LiJni4k70E3lHUh1kxtYnU68Plz8yKuBP7M9Nw4c
 lojukwbg7xQ1wlKYXDFiOSP1ltJs0jmgf0HHGRUVa+giZXToHctaJDUKwucJK1dps9F3
 XA+9QXiyMy93UzmYuuhchhSiE2A47jvBMHSyNSk6oa8ROWwn1x4l+CuK/jpm137VWFx7
 jhDB7MKZK7mDd1swbmCCAt3Vqlao0eg6CaoItkINI4YZ6loMezDvDHGyPx7YpikWxcnL
 Eblg==
X-Gm-Message-State: AOAM5323VKhKb8pOwHCXmXsqmTWFp1cfB+HDwhyh1MRr0vpLhwTHC6X6
 d+UZk0b6Xc6HoVUpEvKQlKH6SQ==
X-Google-Smtp-Source: ABdhPJwJsyZkhGzgEWjIobCpYAvoWgic/EqtGUxZtysje8E+26IpZ1/HH08l9V0rneyI5sI9Ep2Vgg==
X-Received: by 2002:a05:6a00:c8f:b0:481:20a8:7c61 with SMTP id
 a15-20020a056a000c8f00b0048120a87c61mr32575696pfv.8.1636143700318; 
 Fri, 05 Nov 2021 13:21:40 -0700 (PDT)
Received: from google.com (157.214.185.35.bc.googleusercontent.com.
 [35.185.214.157])
 by smtp.gmail.com with ESMTPSA id c12sm5054054pfm.50.2021.11.05.13.21.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Nov 2021 13:21:39 -0700 (PDT)
Date: Fri, 5 Nov 2021 20:21:36 +0000
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH 5/5] KVM: Convert the kvm->vcpus array to a xarray
Message-ID: <YYWSUJ1qzhfqjQow@google.com>
References: <20211105192101.3862492-1-maz@kernel.org>
 <20211105192101.3862492-6-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211105192101.3862492-6-maz@kernel.org>
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
Cc: Juergen Gross <jgross@suse.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>, Anup Patel <anup.patel@wdc.com>,
 Janosch Frank <frankja@linux.ibm.com>, kvm@vger.kernel.org,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Huacai Chen <chenhuacai@kernel.org>, David Hildenbrand <david@redhat.com>,
 linux-mips@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>,
 Atish Patra <atish.patra@wdc.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Paul Mackerras <paulus@samba.org>, James Morse <james.morse@arm.com>,
 Paolo Bonzini <pbonzini@redhat.com>, kernel-team@android.com,
 Claudio Imbrenda <imbrenda@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 kvmarm@lists.cs.columbia.edu, Suzuki K Poulose <suzuki.poulose@arm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Nov 05, 2021, Marc Zyngier wrote:
> At least on arm64 and x86, the vcpus array is pretty huge (512 entries),
> and is mostly empty in most cases (running 512 vcpu VMs is not that
> common). This mean that we end-up with a 4kB block of unused memory
> in the middle of the kvm structure.

Heh, x86 is now up to 1024 entries.
 
> Instead of wasting away this memory, let's use an xarray instead,
> which gives us almost the same flexibility as a normal array, but
> with a reduced memory usage with smaller VMs.
> 
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---
> @@ -693,7 +694,7 @@ static inline struct kvm_vcpu *kvm_get_vcpu(struct kvm *kvm, int i)
>  
>  	/* Pairs with smp_wmb() in kvm_vm_ioctl_create_vcpu.  */
>  	smp_rmb();
> -	return kvm->vcpus[i];
> +	return xa_load(&kvm->vcpu_array, i);
>  }

It'd be nice for this series to convert kvm_for_each_vcpu() to use xa_for_each()
as well.  Maybe as a patch on top so that potential explosions from that are
isolated from the initiali conversion?

Or maybe even use xa_for_each_range() to cap at online_vcpus?  That's technically
a functional change, but IMO it's easier to reason about iterating over a snapshot
of vCPUs as opposed to being able to iterate over vCPUs as their being added.  In
practice I doubt it matters.

#define kvm_for_each_vcpu(idx, vcpup, kvm) \
	xa_for_each_range(&kvm->vcpu_array, idx, vcpup, 0, atomic_read(&kvm->online_vcpus))
