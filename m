Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 402F4325CD1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Feb 2021 06:02:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DmyFP1ykwz3cZx
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Feb 2021 16:02:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256 header.s=google header.b=h+pajDz3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::42c;
 helo=mail-pf1-x42c.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256
 header.s=google header.b=h+pajDz3; dkim-atps=neutral
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com
 [IPv6:2607:f8b0:4864:20::42c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DmyDz2BPVz3cVn
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Feb 2021 16:01:51 +1100 (AEDT)
Received: by mail-pf1-x42c.google.com with SMTP id v200so5472806pfc.0
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Feb 2021 21:01:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=ONONQmKKLgRI6txfN7nZzG8ZKShi1zdqEa9NKzPqd3E=;
 b=h+pajDz3m4XZUqTFlaQVxPtcQPzwA7yMI2I9aemClWUrS6jzudQAza5o02EGuf1yRS
 RgYtUH3aeg41kRTdbDJsZ2OSAPDC92Ddd1Ste5BRlQPqcUC/rxZo++g8uywrFKu0P4Lm
 LXF4k/Vs2Q/4CuGhvuP7DCmFBE9WsNL76VbjU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=ONONQmKKLgRI6txfN7nZzG8ZKShi1zdqEa9NKzPqd3E=;
 b=phldHMucPpT2x71XAwANhKaROcgPqp1ND5Oaahx19eHAgD61UKrFS6KqmZKGJwEagW
 d12hq3Y0YuAuhPxl9sHoalysnFHy+6+J3H39VMgLZ1DEWaJoX9GdHeKQ5uDMvYH8x3rO
 0gRbUCC/u60pPX8ssiIzIDMLl4clOzQutujtTPoVTutwFn91ctstuniC5p/uGJmXi5tN
 lYziA2ig5rFTw1qWayuASsuHvLaX1BJRrQFBERBJlUeD6SFhhywhFBo1Muask+UwAslG
 PmSOkSrywUcHaTjgPJ/1Ddk6fXM0IqQnnL9m1PdL9afUoPk5ozwMWiDAEsmR2b225xIX
 RDpw==
X-Gm-Message-State: AOAM531r1NyS4Wtkbfb/lMBlq94KknfU754axUfOeszOVUOY7K1Sjo/b
 ms7vW42Kl3pAbU9FBAyCFYIP+g==
X-Google-Smtp-Source: ABdhPJzgjekTt0EMEqjOTzklf7dGBWjpxXDSUb3/tzvk0WOQlACltMeiroiwrvOEBI7gaeLGoT4BFw==
X-Received: by 2002:a63:ff53:: with SMTP id s19mr1306250pgk.347.1614315709698; 
 Thu, 25 Feb 2021 21:01:49 -0800 (PST)
Received: from localhost
 (2001-44b8-1113-6700-7ad2-5bb3-4fd4-d737.static.ipv6.internode.on.net.
 [2001:44b8:1113:6700:7ad2:5bb3:4fd4:d737])
 by smtp.gmail.com with ESMTPSA id h8sm7251059pfv.154.2021.02.25.21.01.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Feb 2021 21:01:49 -0800 (PST)
From: Daniel Axtens <dja@axtens.net>
To: Nicholas Piggin <npiggin@gmail.com>, kvm-ppc@vger.kernel.org
Subject: Re: [PATCH v2 01/37] KVM: PPC: Book3S 64: remove unused
 kvmppc_h_protect argument
In-Reply-To: <20210225134652.2127648-2-npiggin@gmail.com>
References: <20210225134652.2127648-1-npiggin@gmail.com>
 <20210225134652.2127648-2-npiggin@gmail.com>
Date: Fri, 26 Feb 2021 16:01:45 +1100
Message-ID: <878s7ba0cm.fsf@linkitivity.dja.id.au>
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
Cc: linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Nick,

> The va argument is not used in the function or set by its asm caller,
> so remove it to be safe.

Huh, so it isn't. I tracked the original implementation down to commit
a8606e20e41a ("KVM: PPC: Handle some PAPR hcalls in the kernel") where
paulus first added the ability to handle it in the kernel - there it
takes a va argument but even then doesn't do anything with it.

ajd also pointed out that we don't pass a va when linux is running as a
guest, and LoPAR does not mention va as an argument.

One small nit: checkpatch is complaining about spaces vs tabs:
ERROR: code indent should use tabs where possible
#25: FILE: arch/powerpc/include/asm/kvm_ppc.h:770:
+                      unsigned long pte_index, unsigned long avpn);$

WARNING: please, no spaces at the start of a line
#25: FILE: arch/powerpc/include/asm/kvm_ppc.h:770:
+                      unsigned long pte_index, unsigned long avpn);$

Once that is resolved,
  Reviewed-by: Daniel Axtens <dja@axtens.net>

Kind regards,
Daniel Axtens

> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>  arch/powerpc/include/asm/kvm_ppc.h  | 3 +--
>  arch/powerpc/kvm/book3s_hv_rm_mmu.c | 3 +--
>  2 files changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/arch/powerpc/include/asm/kvm_ppc.h b/arch/powerpc/include/asm/kvm_ppc.h
> index 8aacd76bb702..9531b1c1b190 100644
> --- a/arch/powerpc/include/asm/kvm_ppc.h
> +++ b/arch/powerpc/include/asm/kvm_ppc.h
> @@ -767,8 +767,7 @@ long kvmppc_h_remove(struct kvm_vcpu *vcpu, unsigned long flags,
>                       unsigned long pte_index, unsigned long avpn);
>  long kvmppc_h_bulk_remove(struct kvm_vcpu *vcpu);
>  long kvmppc_h_protect(struct kvm_vcpu *vcpu, unsigned long flags,
> -                      unsigned long pte_index, unsigned long avpn,
> -                      unsigned long va);
> +                      unsigned long pte_index, unsigned long avpn);
>  long kvmppc_h_read(struct kvm_vcpu *vcpu, unsigned long flags,
>                     unsigned long pte_index);
>  long kvmppc_h_clear_ref(struct kvm_vcpu *vcpu, unsigned long flags,
> diff --git a/arch/powerpc/kvm/book3s_hv_rm_mmu.c b/arch/powerpc/kvm/book3s_hv_rm_mmu.c
> index 88da2764c1bb..7af7c70f1468 100644
> --- a/arch/powerpc/kvm/book3s_hv_rm_mmu.c
> +++ b/arch/powerpc/kvm/book3s_hv_rm_mmu.c
> @@ -673,8 +673,7 @@ long kvmppc_h_bulk_remove(struct kvm_vcpu *vcpu)
>  }
>  
>  long kvmppc_h_protect(struct kvm_vcpu *vcpu, unsigned long flags,
> -		      unsigned long pte_index, unsigned long avpn,
> -		      unsigned long va)
> +		      unsigned long pte_index, unsigned long avpn)
>  {
>  	struct kvm *kvm = vcpu->kvm;
>  	__be64 *hpte;
> -- 
> 2.23.0
