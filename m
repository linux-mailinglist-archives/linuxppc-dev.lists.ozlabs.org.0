Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 44EF6749388
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jul 2023 04:11:12 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=SiGwLZkX;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QxKl21S2hz30hQ
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jul 2023 12:11:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=SiGwLZkX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42f; helo=mail-pf1-x42f.google.com; envelope-from=isaku.yamahata@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QxKk80TX9z2xJ4
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Jul 2023 12:10:21 +1000 (AEST)
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-666edfc50deso131275b3a.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 05 Jul 2023 19:10:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688609419; x=1691201419;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XP4DoYShnes9Cy59WziHKZBgrcvxKmEUSZdVCQbtmAo=;
        b=SiGwLZkXRQbaBMbrgXGl2qlB55MI4HtE6Zz0Ahf+azm3H9frsgD3CHxeH0FMY/Ahga
         k5/N/N58xOlRM2rRxrpaXh8GHc3W6erqhZba0QnxabUDJMcTstryJjjebQykhyI3gWpc
         O+mJL3hfBfsidLjX5IzwfmAunrS2YBQeDsmnA0MIUUP+Ij5N9XkXDMEBpe8KbdfxOZ2i
         pl5hyh/aDVkMSXaOdqrccRZZCT1iAGKzCsOrD0KKswMgxTTZI+leyZQtEK0YAILR0vEo
         5Hg8tisFTY0f89837ayC6nQ/woPvdZPnsVLp/ROpM3QzHhjVCx2mN+LnzV3Dq3mV92Ly
         mUsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688609419; x=1691201419;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XP4DoYShnes9Cy59WziHKZBgrcvxKmEUSZdVCQbtmAo=;
        b=dRik62T2PTYcTXd15WX/utqofjY4azivROkb2gv5dBnPstcsJT6krA5uedKEbs2X9v
         kTEsY3tEruX/+TxpWyNR48vYjOOJIsPcYvJiVsUGVX22+icNANGTJi7hCbUyxWzY8nns
         sQ1nNcxv0MDVjIXXBkpZQ7392LkEi0WXh9INBMn1yBguK6OlL5QZ5cKsJKksDgP8fs8i
         ZKHqJiIXOIujIi7GOdeFOmw/YZ2lmhLbxH/aHSfULpeRDxdTwAKmHeTZGTdjIo/nndBx
         Qyjgi6aFzTDqXWB4qLEltADubSYqT3XXMScXUhWLo39TbZ4Iq8uW5ds8fSJwspdRCekW
         c7+Q==
X-Gm-Message-State: ABy/qLa/P13OYoHxHGVo8UKzd3UGhMM9XRuOkBbXd5z7SdQ15MaVTpiY
	V9Fbt/OWMRlM1ZlxyRNyV24=
X-Google-Smtp-Source: APBJJlFGIXMd21EZwNe+mHhmpVNVRsUEG4H560bcYgHix9NzfbeGSSSH0lTScJcFK2LuCN7La3jaWQ==
X-Received: by 2002:aa7:85d2:0:b0:666:6c01:2e9e with SMTP id z18-20020aa785d2000000b006666c012e9emr4693901pfn.15.1688609418703;
        Wed, 05 Jul 2023 19:10:18 -0700 (PDT)
Received: from localhost ([192.55.54.50])
        by smtp.gmail.com with ESMTPSA id 10-20020aa7924a000000b0066a31111cc5sm159784pfp.152.2023.07.05.19.10.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jul 2023 19:10:18 -0700 (PDT)
Date: Wed, 5 Jul 2023 19:10:16 -0700
From: Isaku Yamahata <isaku.yamahata@gmail.com>
To: David Stevens <stevensd@chromium.org>
Subject: Re: [PATCH v7 5/8] KVM: x86/mmu: Don't pass FOLL_GET to
 __kvm_follow_pfn
Message-ID: <20230706021016.GC3894444@ls.amr.corp.intel.com>
References: <20230704075054.3344915-1-stevensd@google.com>
 <20230704075054.3344915-6-stevensd@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230704075054.3344915-6-stevensd@google.com>
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

On Tue, Jul 04, 2023 at 04:50:50PM +0900,
David Stevens <stevensd@chromium.org> wrote:

> diff --git a/arch/x86/kvm/mmu/spte.c b/arch/x86/kvm/mmu/spte.c
> index cf2c6426a6fc..46c681dc45e6 100644
> --- a/arch/x86/kvm/mmu/spte.c
> +++ b/arch/x86/kvm/mmu/spte.c
> @@ -138,7 +138,7 @@ bool make_spte(struct kvm_vcpu *vcpu, struct kvm_mmu_page *sp,
>  	       const struct kvm_memory_slot *slot,
>  	       unsigned int pte_access, gfn_t gfn, kvm_pfn_t pfn,
>  	       u64 old_spte, bool prefetch, bool can_unsync,
> -	       bool host_writable, u64 *new_spte)
> +	       bool host_writable, bool is_refcounted, u64 *new_spte)
>  {
>  	int level = sp->role.level;
>  	u64 spte = SPTE_MMU_PRESENT_MASK;
> @@ -188,6 +188,8 @@ bool make_spte(struct kvm_vcpu *vcpu, struct kvm_mmu_page *sp,
>  
>  	if (level > PG_LEVEL_4K)
>  		spte |= PT_PAGE_SIZE_MASK;
> +	else if (is_refcounted)
> +		spte |= SPTE_MMU_PAGE_REFCOUNTED;

Is REFCOUNTED for 4K page only?  What guarantees that large page doesn't have
FOLL_GET? or can we set the bit for large page?


>  
>  	if (shadow_memtype_mask)
>  		spte |= static_call(kvm_x86_get_mt_mask)(vcpu, gfn,

-- 
Isaku Yamahata <isaku.yamahata@gmail.com>
