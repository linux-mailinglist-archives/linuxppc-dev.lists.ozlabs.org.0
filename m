Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0905C37AC21
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 May 2021 18:39:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FfkCx0N9Hz30Bw
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 May 2021 02:39:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20161025 header.b=QxHK/U0N;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::1036;
 helo=mail-pj1-x1036.google.com; envelope-from=seanjc@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=QxHK/U0N; dkim-atps=neutral
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FfkCR6ctZz2yRy
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 May 2021 02:39:13 +1000 (AEST)
Received: by mail-pj1-x1036.google.com with SMTP id
 gc22-20020a17090b3116b02901558435aec1so1688395pjb.4
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 May 2021 09:39:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=bFTI8zSDkjnfRrp4pddqJA+R4m+BpZrkydiUQ78vx4o=;
 b=QxHK/U0NucnlckkDp56+qA8LXDSaLwYN9N/AmXKnYeJtggPd6Ss4Fc4HNnL/IZnB4a
 2mj8dJG3L0mHCiN/A+4AuQFO9eOPKGqwadY/aG4HbrzYwwydFuT6Xgm6tAx5sxNCorUb
 4jyTmBibzbzfJUaMr/2ITrYoA+LLiN5v0E/ApruvOPoyhMh8ywMwLUSaOayKc/XfcBkn
 /EBOGnCih42xrwcqbFF/qevQKG5s2mIT+xIyJ8NQZGxmtxhaUpSuuNLCAxiXXGby4Tuu
 BSlLQ7xgILtJM8SXiT4AJSOe+0z7CkqCZFgw6BYydxENIs6HYPpR0G0t4I6fXymsDJXw
 OKSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=bFTI8zSDkjnfRrp4pddqJA+R4m+BpZrkydiUQ78vx4o=;
 b=C7A0Z1krwUVGsay4lai0JQnWgVi7kUO2PW/CJoqHyLXcnSJKFVBhVogNKAEegwEaHK
 zVLM+N04El4YHIWiSBj+AL4BkBE5jCAcRNu5hGtwQKpYX+HHCQUx5cGqPK4xxyxFqFRz
 ksEWN+YoRhvpkiQFENJgcHtq7WqwaUtpexpbdyD4o0OQaMnMB/CdfKE+sxo2rBL+72pM
 UnmmuBmVKenUJsyc3nO1yKrYheuvFKTvYvWOLserbNX1u5Fj1YU/aS+XV3iyTFpl4JMi
 73js/PteY5ohNLKkzhjNMl7KvBxLkfYOQIRcV3Fg0lc2Pl05UYeFS5gLZRSYMNvEMGo6
 OKVQ==
X-Gm-Message-State: AOAM530BnIfTcDw/cCwGHfoJJ9zmD2K5IxBAGmZn34XsPWEu+zscS8kk
 9ry6ElygqzfxoR3m+se904biMg==
X-Google-Smtp-Source: ABdhPJyks2yUVlb+ScMYVY2rHW7w8eOFF30A6QmRs3zSCswJQ6IcK20YYudgV1jFoTUmwDdevc3REA==
X-Received: by 2002:a17:90a:d90c:: with SMTP id
 c12mr6230691pjv.129.1620751148273; 
 Tue, 11 May 2021 09:39:08 -0700 (PDT)
Received: from google.com (240.111.247.35.bc.googleusercontent.com.
 [35.247.111.240])
 by smtp.gmail.com with ESMTPSA id x4sm14249272pfr.160.2021.05.11.09.39.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 May 2021 09:39:07 -0700 (PDT)
Date: Tue, 11 May 2021 16:39:03 +0000
From: Sean Christopherson <seanjc@google.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH] KVM: PPC: Book3S HV: Fix kvm_unmap_gfn_range_hv() for
 Hash MMU
Message-ID: <YJqzJyBvU0A8VG9p@google.com>
References: <20210511105459.800788-1-mpe@ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210511105459.800788-1-mpe@ellerman.id.au>
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
Cc: kvm-ppc@vger.kernel.org, pbonzini@redhat.com, linuxppc-dev@lists.ozlabs.org,
 kvm@vger.kernel.org, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, May 11, 2021, Michael Ellerman wrote:
> Commit 32b48bf8514c ("KVM: PPC: Book3S HV: Fix conversion to gfn-based
> MMU notifier callbacks") fixed kvm_unmap_gfn_range_hv() by adding a for
> loop over each gfn in the range.
> 
> But for the Hash MMU it repeatedly calls kvm_unmap_rmapp() with the
> first gfn of the range, rather than iterating through the range.
> 
> This exhibits as strange guest behaviour, sometimes crashing in firmare,
> or booting and then guest userspace crashing unexpectedly.
> 
> Fix it by passing the iterator, gfn, to kvm_unmap_rmapp().
> 
> Fixes: 32b48bf8514c ("KVM: PPC: Book3S HV: Fix conversion to gfn-based MMU notifier callbacks")
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
> ---
>  arch/powerpc/kvm/book3s_64_mmu_hv.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> I plan to take this via the powerpc fixes branch.

FWIW,

Reviewed-by: Sean Christopherson <seanjc@google.com>

> 
> diff --git a/arch/powerpc/kvm/book3s_64_mmu_hv.c b/arch/powerpc/kvm/book3s_64_mmu_hv.c
> index 2d9193cd73be..c63e263312a4 100644
> --- a/arch/powerpc/kvm/book3s_64_mmu_hv.c
> +++ b/arch/powerpc/kvm/book3s_64_mmu_hv.c
> @@ -840,7 +840,7 @@ bool kvm_unmap_gfn_range_hv(struct kvm *kvm, struct kvm_gfn_range *range)
>  			kvm_unmap_radix(kvm, range->slot, gfn);
>  	} else {
>  		for (gfn = range->start; gfn < range->end; gfn++)
> -			kvm_unmap_rmapp(kvm, range->slot, range->start);
> +			kvm_unmap_rmapp(kvm, range->slot, gfn);
>  	}
>  
>  	return false;
> -- 
> 2.25.1
> 
