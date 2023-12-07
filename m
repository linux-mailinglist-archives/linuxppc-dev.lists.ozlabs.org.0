Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E2F880840D
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Dec 2023 10:16:18 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=I3enIjcB;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sm7tR47Yqz3d89
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Dec 2023 20:16:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=I3enIjcB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=aneesh.kumar@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sm7sZ0L8sz3cDy
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Dec 2023 20:15:29 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id F0A746203B;
	Thu,  7 Dec 2023 09:15:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFF49C433C7;
	Thu,  7 Dec 2023 09:15:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701940526;
	bh=/Ctyeihvym0TLJckEfSU+fK0IoOk5vWkpWC1s1zEMPM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=I3enIjcBzdi6ERkvUMs8ND5g/RZGWozPoSNu5732cRCy43npx7N7AXF7xHecPxUfr
	 JLwONzeAnrGWYNeNo8et4zlC1VfSLm1zI+lcNSeQfXcG43eA+DDPi98h8grwMZ9IPT
	 3LqvHIEfyqgrul+aqRCIT32OxkXczh3fP0eQRuMgP9dOySk3nh7j9D079xJIO/9E5e
	 r//l5DxlaUS92HGG69hxhjKqrIyy46OPYszmKMFw0pmP9vfgXwPGIRslihA8ZSBxyG
	 QIhm1BdjGsvR+3cSHaMtn1MK9bO326agDzFHXPCb+4GdoBqKltUuNdEECEW9RGkLG3
	 7taPRy/0u0j3A==
X-Mailer: emacs 29.1 (via feedmail 11-beta-1 I)
From: Aneesh Kumar K.V (IBM) <aneesh.kumar@kernel.org>
To: Vaibhav Jain <vaibhav@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
	kvm@vger.kernel.org, kvm-ppc@vger.kernel.org
Subject: Re: [PATCH 01/12] KVM: PPC: Book3S HV nestedv2: Invalidate RPT
 before deleting a guest
In-Reply-To: <20231201132618.555031-2-vaibhav@linux.ibm.com>
References: <20231201132618.555031-1-vaibhav@linux.ibm.com>
 <20231201132618.555031-2-vaibhav@linux.ibm.com>
Date: Thu, 07 Dec 2023 14:45:18 +0530
Message-ID: <878r66xtjt.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: mikey@neuling.org, sbhat@linux.ibm.com, amachhiw@linux.vnet.ibm.com, Jordan Niethe <jniethe5@gmail.com>, gautam@linux.ibm.com, Nicholas Piggin <npiggin@gmail.com>, David.Laight@ACULAB.COM, kconsul@linux.vnet.ibm.com, Vaibhav Jain <vaibhav@linux.ibm.com>, Vaidyanathan Srinivasan <svaidy@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Vaibhav Jain <vaibhav@linux.ibm.com> writes:

> From: Jordan Niethe <jniethe5@gmail.com>
>
> An L0 must invalidate the L2's RPT during H_GUEST_DELETE if this has not
> already been done. This is a slow operation that means H_GUEST_DELETE
> must return H_BUSY multiple times before completing. Invalidating the
> tables before deleting the guest so there is less work for the L0 to do.
>
> Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
> ---
>  arch/powerpc/include/asm/kvm_book3s.h | 1 +
>  arch/powerpc/kvm/book3s_hv.c          | 6 ++++--
>  arch/powerpc/kvm/book3s_hv_nested.c   | 2 +-
>  3 files changed, 6 insertions(+), 3 deletions(-)
>
> diff --git a/arch/powerpc/include/asm/kvm_book3s.h b/arch/powerpc/include/asm/kvm_book3s.h
> index 4f527d09c92b..a37736ed3728 100644
> --- a/arch/powerpc/include/asm/kvm_book3s.h
> +++ b/arch/powerpc/include/asm/kvm_book3s.h
> @@ -302,6 +302,7 @@ void kvmhv_nested_exit(void);
>  void kvmhv_vm_nested_init(struct kvm *kvm);
>  long kvmhv_set_partition_table(struct kvm_vcpu *vcpu);
>  long kvmhv_copy_tofrom_guest_nested(struct kvm_vcpu *vcpu);
> +void kvmhv_flush_lpid(u64 lpid);
>  void kvmhv_set_ptbl_entry(u64 lpid, u64 dw0, u64 dw1);
>  void kvmhv_release_all_nested(struct kvm *kvm);
>  long kvmhv_enter_nested_guest(struct kvm_vcpu *vcpu);
> diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
> index 1ed6ec140701..5543e8490cd9 100644
> --- a/arch/powerpc/kvm/book3s_hv.c
> +++ b/arch/powerpc/kvm/book3s_hv.c
> @@ -5691,10 +5691,12 @@ static void kvmppc_core_destroy_vm_hv(struct kvm *kvm)
>  			kvmhv_set_ptbl_entry(kvm->arch.lpid, 0, 0);
>  	}
>  
> -	if (kvmhv_is_nestedv2())
> +	if (kvmhv_is_nestedv2()) {
> +		kvmhv_flush_lpid(kvm->arch.lpid);
>  		plpar_guest_delete(0, kvm->arch.lpid);
>

I am not sure I follow the optimization here. I would expect the
hypervisor to kill all the translation caches as part of guest_delete.
What is the benefit of doing a lpid flush outside the guest delete?

> -	else
> +	} else {
>  		kvmppc_free_lpid(kvm->arch.lpid);
> +	}
>  
>  	kvmppc_free_pimap(kvm);
>  }
> diff --git a/arch/powerpc/kvm/book3s_hv_nested.c b/arch/powerpc/kvm/book3s_hv_nested.c
> index 3b658b8696bc..5c375ec1a3c6 100644
> --- a/arch/powerpc/kvm/book3s_hv_nested.c
> +++ b/arch/powerpc/kvm/book3s_hv_nested.c
> @@ -503,7 +503,7 @@ void kvmhv_nested_exit(void)
>  	}
>  }
>  
> -static void kvmhv_flush_lpid(u64 lpid)
> +void kvmhv_flush_lpid(u64 lpid)
>  {
>  	long rc;
>  
> -- 
> 2.42.0
