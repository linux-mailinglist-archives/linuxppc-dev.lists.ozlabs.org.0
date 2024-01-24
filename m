Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2308F83A302
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Jan 2024 08:37:16 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=j14Fku5M;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TKbQ16jW0z3cT7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Jan 2024 18:37:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=j14Fku5M;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=aneesh.kumar@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TKbPC1Zf9z30fn
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Jan 2024 18:36:31 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 268BB61FFC;
	Wed, 24 Jan 2024 07:36:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89F0CC433C7;
	Wed, 24 Jan 2024 07:36:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706081787;
	bh=LtV2lJtgnwiVmQbeUtkYL0cjel7dINRSK5cU4NbTPYU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=j14Fku5MIP7QS3obZiZv85tNEyLdKApuOxrGUo+lZuNiBkZ/t2OUCeO3/pK3U+CUp
	 NvnygqfFatP3hWUNiAhS5bN35oLcLzsKmNlKTTzdv22D74EqpqL8ST0sqYs73nTkRX
	 jJpbC3CPKlcHfLMoCnhKpKrzp1bHOgRSrk5OVjzNA9CYpBtpqXxpk4nKAkPVWpe30V
	 TYJSKX7LAT6mq8y5V6ItglnxSlFnqF6Fg3XGAjAfxDU8cWXauNv7GJCjMgadMksntD
	 ee4NTmnbdLKSaYqkKCoWtREx6vwgL3A0jnvezYzR0stXpYUPtwVA2E2dFEQOSxlgGX
	 qz+c5fuc5K7ZA==
X-Mailer: emacs 29.1 (via feedmail 11-beta-1 I)
From: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
To: Amit Machhiwal <amachhiw@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
	kvm@vger.kernel.org, kvm-ppc@vger.kernel.org
Subject: Re: [PATCH] KVM: PPC: Book3S HV: Fix L2 guest reboot failure due to
 empty 'arch_compat'
In-Reply-To: <20240118095653.2588129-1-amachhiw@linux.ibm.com>
References: <20240118095653.2588129-1-amachhiw@linux.ibm.com>
Date: Wed, 24 Jan 2024 13:06:19 +0530
Message-ID: <87v87jp4i4.fsf@kernel.org>
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
Cc: Jordan Niethe <jniethe5@gmail.com>, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, Vaidyanathan Srinivasan <svaidy@linux.ibm.com>, Amit Machhiwal <amachhiw@linux.ibm.com>, "Naveen N . Rao" <naveen.n.rao@linux.ibm.com>, Vaibhav Jain <vaibhav@linux.ibm.com>, Amit Machhiwal <amit.machhiwal@ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Amit Machhiwal <amachhiw@linux.ibm.com> writes:

> Currently, rebooting a pseries nested qemu-kvm guest (L2) results in
> below error as L1 qemu sends PVR value 'arch_compat' == 0 via
> ppc_set_compat ioctl. This triggers a condition failure in
> kvmppc_set_arch_compat() resulting in an EINVAL.
>
> qemu-system-ppc64: Unable to set CPU compatibility mode in KVM: Invalid
>
> This patch updates kvmppc_set_arch_compat() to use the host PVR value if
> 'compat_pvr' == 0 indicating that qemu doesn't want to enforce any
> specific PVR compat mode.
>
> Signed-off-by: Amit Machhiwal <amachhiw@linux.ibm.com>
> ---
>  arch/powerpc/kvm/book3s_hv.c          |  2 +-
>  arch/powerpc/kvm/book3s_hv_nestedv2.c | 12 ++++++++++--
>  2 files changed, 11 insertions(+), 3 deletions(-)
>
> diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
> index 1ed6ec140701..9573d7f4764a 100644
> --- a/arch/powerpc/kvm/book3s_hv.c
> +++ b/arch/powerpc/kvm/book3s_hv.c
> @@ -439,7 +439,7 @@ static int kvmppc_set_arch_compat(struct kvm_vcpu *vcpu, u32 arch_compat)
>  	if (guest_pcr_bit > host_pcr_bit)
>  		return -EINVAL;
>  
> -	if (kvmhv_on_pseries() && kvmhv_is_nestedv2()) {
> +	if (kvmhv_on_pseries() && kvmhv_is_nestedv2() && arch_compat) {
>  		if (!(cap & nested_capabilities))
>  			return -EINVAL;
>  	}
>

Instead of that arch_compat check, would it better to do

	if (kvmhv_on_pseries() && kvmhv_is_nestedv2()) {
		if (cap && !(cap & nested_capabilities))
			return -EINVAL;
	}

ie, if a capability is requested, then check against nested_capbilites
to see if the capability exist.



> diff --git a/arch/powerpc/kvm/book3s_hv_nestedv2.c b/arch/powerpc/kvm/book3s_hv_nestedv2.c
> index fd3c4f2d9480..069a1fcfd782 100644
> --- a/arch/powerpc/kvm/book3s_hv_nestedv2.c
> +++ b/arch/powerpc/kvm/book3s_hv_nestedv2.c
> @@ -138,6 +138,7 @@ static int gs_msg_ops_vcpu_fill_info(struct kvmppc_gs_buff *gsb,
>  	vector128 v;
>  	int rc, i;
>  	u16 iden;
> +	u32 arch_compat = 0;
>  
>  	vcpu = gsm->data;
>  
> @@ -347,8 +348,15 @@ static int gs_msg_ops_vcpu_fill_info(struct kvmppc_gs_buff *gsb,
>  			break;
>  		}
>  		case KVMPPC_GSID_LOGICAL_PVR:
> -			rc = kvmppc_gse_put_u32(gsb, iden,
> -						vcpu->arch.vcore->arch_compat);
> +			if (!vcpu->arch.vcore->arch_compat) {
> +				if (cpu_has_feature(CPU_FTR_ARCH_31))
> +					arch_compat = PVR_ARCH_31;
> +				else if (cpu_has_feature(CPU_FTR_ARCH_300))
> +					arch_compat = PVR_ARCH_300;
> +			} else {
> +				arch_compat = vcpu->arch.vcore->arch_compat;
> +			}
> +			rc = kvmppc_gse_put_u32(gsb, iden, arch_compat);
>

Won't a arch_compat = 0 work here?. ie, where you observing the -EINVAL from
the first hunk or does this hunk have an impact? 

>  			break;
>  		}
>  
> -- 
> 2.43.0

-aneesh
