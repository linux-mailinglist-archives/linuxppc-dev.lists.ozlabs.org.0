Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 40A7E34F808
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Mar 2021 06:35:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F9D4w1L43z3c8K
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Mar 2021 15:35:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256 header.s=201707 header.b=viee5o80;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=paulus@ozlabs.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256
 header.s=201707 header.b=viee5o80; dkim-atps=neutral
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F9D4S2KBqz3bth
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Mar 2021 15:34:48 +1100 (AEDT)
Received: by ozlabs.org (Postfix, from userid 1003)
 id 4F9D4R57SWz9sWK; Wed, 31 Mar 2021 15:34:47 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1617165287; bh=M8wBblT1g1uK1hduyoudLisyaXN7+YXCuqNzj9Dhb/g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=viee5o80vBg3ho5ACESOQ+9T1l4UA7qgWjYMS0IsH7WLxihifZO9EDgZvp7iCQn/P
 kLO5oM+SJTWXpP2NVSm/sTLQ2xf9OPFgwRDxmafsp0Qac7esRneKzqeVjCZSDBqvhZ
 UyTqydirhtL3ttvod6DUf2DNgFWHu/g98O7R2obc5rSGsxWJgvPs17Vnifv5IRmf00
 yKfEH/czMg/zX50H2q8wR39y5n/ZcChWuXjGsK2Wp0CJBKaRARxplrKUBivpIP2UuP
 HrDSuYsKHtkNhtqsCU1Vd/x8/+pyaXP0tsMxPXh/lV4QWdMy7UJ9c6Gy0g9AJOasS1
 pJKsrFc8TPsYg==
Date: Wed, 31 Mar 2021 15:34:41 +1100
From: Paul Mackerras <paulus@ozlabs.org>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v4 04/46] KVM: PPC: Book3S HV: Prevent radix guests from
 setting LPCR[TC]
Message-ID: <YGP74QVmx5yyE8Rc@thinks.paulus.ozlabs.org>
References: <20210323010305.1045293-1-npiggin@gmail.com>
 <20210323010305.1045293-5-npiggin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210323010305.1045293-5-npiggin@gmail.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, kvm-ppc@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Mar 23, 2021 at 11:02:23AM +1000, Nicholas Piggin wrote:
> This bit only applies to hash partitions.
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>  arch/powerpc/kvm/book3s_hv.c        | 6 ++++++
>  arch/powerpc/kvm/book3s_hv_nested.c | 3 +--
>  2 files changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
> index c5de7e3f22b6..1ffb0902e779 100644
> --- a/arch/powerpc/kvm/book3s_hv.c
> +++ b/arch/powerpc/kvm/book3s_hv.c
> @@ -1645,6 +1645,12 @@ static int kvm_arch_vcpu_ioctl_set_sregs_hv(struct kvm_vcpu *vcpu,
>   */
>  unsigned long kvmppc_filter_lpcr_hv(struct kvmppc_vcore *vc, unsigned long lpcr)
>  {
> +	struct kvm *kvm = vc->kvm;
> +
> +	/* LPCR_TC only applies to HPT guests */
> +	if (kvm_is_radix(kvm))
> +		lpcr &= ~LPCR_TC;

I'm not sure I see any benefit from this, and it is a little extra
complexity.

>  	/* On POWER8 and above, userspace can modify AIL */
>  	if (!cpu_has_feature(CPU_FTR_ARCH_207S))
>  		lpcr &= ~LPCR_AIL;
> diff --git a/arch/powerpc/kvm/book3s_hv_nested.c b/arch/powerpc/kvm/book3s_hv_nested.c
> index f7b441b3eb17..851e3f527eb2 100644
> --- a/arch/powerpc/kvm/book3s_hv_nested.c
> +++ b/arch/powerpc/kvm/book3s_hv_nested.c
> @@ -140,8 +140,7 @@ static void sanitise_hv_regs(struct kvm_vcpu *vcpu, struct hv_guest_state *hr)
>  	/*
>  	 * Don't let L1 change LPCR bits for the L2 except these:
>  	 */
> -	mask = LPCR_DPFD | LPCR_ILE | LPCR_TC | LPCR_AIL | LPCR_LD |
> -		LPCR_LPES | LPCR_MER;
> +	mask = LPCR_DPFD | LPCR_ILE | LPCR_AIL | LPCR_LD | LPCR_LPES | LPCR_MER;

Doesn't this make it completely impossible to set TC for any guest?

Paul.
