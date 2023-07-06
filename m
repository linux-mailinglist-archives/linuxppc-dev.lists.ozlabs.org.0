Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D994F749354
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jul 2023 03:55:48 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=DVvGohzI;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QxKPG5crLz3bnB
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jul 2023 11:55:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=DVvGohzI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::c35; helo=mail-oo1-xc35.google.com; envelope-from=isaku.yamahata@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oo1-xc35.google.com (mail-oo1-xc35.google.com [IPv6:2607:f8b0:4864:20::c35])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QxKNJ5q0Cz30GX
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Jul 2023 11:54:55 +1000 (AEST)
Received: by mail-oo1-xc35.google.com with SMTP id 006d021491bc7-5634db21a78so117032eaf.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 05 Jul 2023 18:54:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688608492; x=1691200492;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1R7giHFFm9lzKa2KFRVnvuXui30YgtW+mLiZpS636v4=;
        b=DVvGohzInocB2G0CE5BHhj00dNWqGoqrHPqrt2G17lPCsMUYKKsSVbf/v2qs4vd+BH
         TVAuRlrgj7qFdyc7ySUeR1ptkT6VqY8g0PcTuoGbfj+zpJtxWVA3ExnG9inRg72NB8ya
         97PvzrwpvZTE/IpWdnMQdtsBQKUgGylnqxFb0d+ku33oYPoxzLJqPitoAXs7P6qyNyOu
         WBvlYk74ZsB1GmBvxmmGoVL2B7UDS4BtOjPnsr9uMZp+cLqX2sFGbdLdIRNR0a2Ixofc
         kvxyXlICSAK6MZrMjNfH4kDVoONsBeKJXmSqNW6LuF2yi5fD78o/J6TRC+FmmtIvuU18
         uIdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688608492; x=1691200492;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1R7giHFFm9lzKa2KFRVnvuXui30YgtW+mLiZpS636v4=;
        b=U2II9l6H1h0ENZClcoHjhgGY6QPDbW/sdBoJckGCbjcKJnKjSjMe0W5NKHhWAw1Ry5
         iavzDKMF/GRwJnhNacG4Vga00/u5X8RQykOO0h6PhqTqM5+AZixHNrSOuNV+QqWXDT30
         vpUvtFs8qOBreCfpUMg0NqeMe3AEkGGWZT6NpcUmi+dpWiOKGMlPb1FQ5NUhiVeSviOM
         jIB4gQWe4n+Jk6Z+H3KU/Qr0HSB3ATrPIB3ZVxSFlL16uXz9oDaY5m4BiRSd3CsJuCny
         Yv1+19h8UyCFkda6ZF3A6G1vOoTTOxV2CQ4+0yHLtiBqnJySw5Y6hrEmEMZwx+CzLSA3
         nGSQ==
X-Gm-Message-State: ABy/qLZjSRATvDtvYqZuf3Ko0sH/8+cm/72hjxxbrGL6zF9BWNhXJPRh
	lB2WiHt/hvcD6gfm+t7BME4=
X-Google-Smtp-Source: APBJJlG1rcUiA7G6cfKIni/3YPqB6pOv+DveqzIRXSNVbOaD89TbpWJy4qWw7jhrSgFyIxdPitrcKA==
X-Received: by 2002:a05:6358:98a2:b0:134:c530:c2fa with SMTP id q34-20020a05635898a200b00134c530c2famr436044rwa.30.1688608491138;
        Wed, 05 Jul 2023 18:54:51 -0700 (PDT)
Received: from localhost ([192.55.54.50])
        by smtp.gmail.com with ESMTPSA id e16-20020a17090301d000b001a5fccab02dsm122674plh.177.2023.07.05.18.54.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jul 2023 18:54:50 -0700 (PDT)
Date: Wed, 5 Jul 2023 18:54:49 -0700
From: Isaku Yamahata <isaku.yamahata@gmail.com>
To: David Stevens <stevensd@chromium.org>
Subject: Re: [PATCH v7 4/8] KVM: x86/mmu: Migrate to __kvm_follow_pfn
Message-ID: <20230706015449.GB3894444@ls.amr.corp.intel.com>
References: <20230704075054.3344915-1-stevensd@google.com>
 <20230704075054.3344915-5-stevensd@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230704075054.3344915-5-stevensd@google.com>
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
Cc: Marc Zyngier <maz@kernel.org>, kvm@vger.kernel.org, Sean Christopherson <seanjc@google.com>, linux-kernel@vger.kernel.org, Peter Xu <peterx@redhat.com>, isaku.yamahata@gmail.com, kvmarm@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jul 04, 2023 at 04:50:49PM +0900,
David Stevens <stevensd@chromium.org> wrote:

> From: David Stevens <stevensd@chromium.org>
> 
> Migrate from __gfn_to_pfn_memslot to __kvm_follow_pfn.
> 
> Signed-off-by: David Stevens <stevensd@chromium.org>
> ---
>  arch/x86/kvm/mmu/mmu.c | 35 +++++++++++++++++++++++++----------
>  1 file changed, 25 insertions(+), 10 deletions(-)
> 
> diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
> index ec169f5c7dce..e44ab512c3a1 100644
> --- a/arch/x86/kvm/mmu/mmu.c
> +++ b/arch/x86/kvm/mmu/mmu.c
> @@ -4296,7 +4296,12 @@ void kvm_arch_async_page_ready(struct kvm_vcpu *vcpu, struct kvm_async_pf *work)
>  static int __kvm_faultin_pfn(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault)
>  {
>  	struct kvm_memory_slot *slot = fault->slot;
> -	bool async;
> +	struct kvm_follow_pfn foll = {
> +		.slot = slot,
> +		.gfn = fault->gfn,
> +		.flags = FOLL_GET | (fault->write ? FOLL_WRITE : 0),
> +		.allow_write_mapping = true,
> +	};
>  
>  	/*
>  	 * Retry the page fault if the gfn hit a memslot that is being deleted
> @@ -4325,12 +4330,14 @@ static int __kvm_faultin_pfn(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault
>  			return RET_PF_EMULATE;
>  	}
>  
> -	async = false;
> -	fault->pfn = __gfn_to_pfn_memslot(slot, fault->gfn, false, false, &async,
> -					  fault->write, &fault->map_writable,
> -					  &fault->hva);
> -	if (!async)
> -		return RET_PF_CONTINUE; /* *pfn has correct page already */
> +	foll.flags |= FOLL_NOWAIT;
> +	fault->pfn = __kvm_follow_pfn(&foll);
> +
> +	if (!is_error_noslot_pfn(fault->pfn))

We have pfn in struct kvm_follow_pfn as output. Can we make __kvm_follow_pfn()
return int instead of kvm_pfn_t?  KVM_PFN_* seems widely used, though.


> +		goto success;
> +
> +	if (fault->pfn != KVM_PFN_ERR_NEEDS_IO)
> +		return RET_PF_CONTINUE;
>  
>  	if (!fault->prefetch && kvm_can_do_async_pf(vcpu)) {
>  		trace_kvm_try_async_get_page(fault->addr, fault->gfn);
> @@ -4348,9 +4355,17 @@ static int __kvm_faultin_pfn(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault
>  	 * to wait for IO.  Note, gup always bails if it is unable to quickly
>  	 * get a page and a fatal signal, i.e. SIGKILL, is pending.
>  	 */
> -	fault->pfn = __gfn_to_pfn_memslot(slot, fault->gfn, false, true, NULL,
> -					  fault->write, &fault->map_writable,
> -					  &fault->hva);
> +	foll.flags |= FOLL_INTERRUPTIBLE;
> +	foll.flags &= ~FOLL_NOWAIT;
> +	fault->pfn = __kvm_follow_pfn(&foll);
> +
> +	if (!is_error_noslot_pfn(fault->pfn))
> +		goto success;
> +
> +	return RET_PF_CONTINUE;
> +success:
> +	fault->hva = foll.hva;
> +	fault->map_writable = foll.writable;
>  	return RET_PF_CONTINUE;
>  }
>  
> -- 
> 2.41.0.255.g8b1d071c50-goog
> 

-- 
Isaku Yamahata <isaku.yamahata@gmail.com>
