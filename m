Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5837D77EFCD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Aug 2023 06:20:36 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=lE4JMBK3;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RRBcy22kbz3c3c
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Aug 2023 14:20:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=lE4JMBK3;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RRBc22J3Gz2yWD
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Aug 2023 14:19:46 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1692245983;
	bh=46yCubrxx63LRVgs79NO4hFXQN620KYczJPZ0H00CuY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=lE4JMBK30qnpZWrJz4xFHBgGig/yKUZ+TibmZnye0s8WDrUpJDF4tBEVHOaiguYDM
	 O1tuycU+HIudU18qQ3bocu47yYK5moYKRW6obq+2MriTiZu8nHQe05bF9kSA/RdyNV
	 MkMPTdEm5i6P2yDEt93dK4Clz0IUh6oizkEG7TUjTwqc/zDVuPUNpE7F5d0UUD7u1t
	 52woLK6Rx5mtGHvGgbvPFcQfPOiI8i3fZtarRXbT2B8hI3zt4b1W7N4P3eFr6cQ3cm
	 8kp797Lo1sszlr/wjWrrRyia6YYY8u/Y4ymiCTcI3SJu9QgMNOIRbQnovABEdgOqfY
	 i2vFNiNsMyghQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4RRBbz1857z4wZn;
	Thu, 17 Aug 2023 14:19:43 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Jordan Niethe <jniethe5@gmail.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v3 5/6] KVM: PPC: Add support for nestedv2 guests
In-Reply-To: <20230807014553.1168699-6-jniethe5@gmail.com>
References: <20230807014553.1168699-1-jniethe5@gmail.com>
 <20230807014553.1168699-6-jniethe5@gmail.com>
Date: Thu, 17 Aug 2023 14:19:38 +1000
Message-ID: <87a5uq712d.fsf@mail.lhotse>
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
Cc: mikey@neuling.org, sbhat@linux.ibm.com, kvm@vger.kernel.org, amachhiw@linux.vnet.ibm.com, Jordan Niethe <jniethe5@gmail.com>, gautam@linux.ibm.com, npiggin@gmail.com, kvm-ppc@vger.kernel.org, vaibhav@linux.ibm.com, kconsul@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Jordan Niethe <jniethe5@gmail.com> writes:
> diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
> index 2357545dffd7..7d5edbc6ecd9 100644
> --- a/arch/powerpc/kvm/book3s_hv.c
> +++ b/arch/powerpc/kvm/book3s_hv.c
> @@ -4165,7 +4231,10 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
>  	vcpu_vpa_increment_dispatch(vcpu);
>  
>  	if (kvmhv_on_pseries()) {
> -		trap = kvmhv_vcpu_entry_p9_nested(vcpu, time_limit, lpcr, tb);
> +		if (kvmhv_is_nestedv1())
> +			trap = kvmhv_vcpu_entry_p9_nested(vcpu, time_limit, lpcr, tb);
> +		else if (kvmhv_is_nestedv2())
> +			trap = kvmhv_vcpu_entry_nestedv2(vcpu, time_limit, lpcr, tb);

Clang warns:

/linux/arch/powerpc/kvm/book3s_hv.c:4236:12: error: variable 'trap' is used uninitialized whenever 'if' condition is false [-Werror,-Wsometimes-uninitialized]
                else if (kvmhv_is_nestedv2())
                         ^~~~~~~~~~~~~~~~~~~
/linux/arch/powerpc/kvm/book3s_hv.c:4240:7: note: uninitialized use occurs here
                if (trap == BOOK3S_INTERRUPT_SYSCALL && !nested &&
                    ^~~~
/linux/arch/powerpc/kvm/book3s_hv.c:4236:8: note: remove the 'if' if its condition is always true
                else if (kvmhv_is_nestedv2())
                     ^~~~~~~~~~~~~~~~~~~~~~~~
/linux/arch/powerpc/kvm/book3s_hv.c:4219:10: note: initialize the variable 'trap' to silence this warning
        int trap;
                ^
                 = 0

cheers
