Return-Path: <linuxppc-dev+bounces-4926-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 85B76A0806D
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jan 2025 20:07:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YTZ6T4vVtz3c5s;
	Fri, 10 Jan 2025 06:07:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::104a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736449649;
	cv=none; b=MBzEjRMpWkG3GEpPaIyKfTdduOeyUXLBl8Pk+c0++EnUqQo3vaRytnBybrdJ3+/HO4+UWMJWCTYqqsuTIb9SRy22jmcnsSTyzlr92DLVgoPir2fL4p/s9zDnoPtACMtGNQEFP85dezpQS+1/CUVmN72a1o7jVMOoYhpiQ+Q2kkSkRJc0KTKgDPDF6zKUZtZGzY1m/2boluMJGhxrS1wMFImbwaiIEshLIdkSqlc01Mg25bMX57hywbCQ+t/ncxvvobNjHsf5CjAXe4wmjgISarAQ7JA4xQn+24csWU1/tQnh+kf+/39YFssTn0p3l6ilAL21okkVDkT5mPFSpAEV0g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736449649; c=relaxed/relaxed;
	bh=YAFl8oxMn+4OWiBfmOCqt1n9SmilznMI/rM3XM++rFU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=F4LDDsxPHmQs3OZcYsQq2h2xGUzVJWzLUVFJkDredBpWkg9rXatyClu877i4fitbqZXlCHwYibrB/lpVW7xfaah1t3m3OoVMGUVr+V8wWHMe/2ce+0j0rvq5JzX4u+OgSmCFblAD6FWIYgjFxnTtIrCR/8QTCDToysmKvm8YZ3RmMc3g+vrZgz1SG2zZ/EEDzq2PjQ2tjF63VJcjZgul+r6/uW6IPMeqsdXEkuJBbuwQkMGim+GLTxk+XIMAGRknFB6c6gUG9wYhGDDEMvjcLCezbxFxFSoeL1suEg4FWes4fUtIxlXMSIvcF8dtWETIUJp1gDai0AL2pB4Jl+3zPA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=sXGpa/v8; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::104a; helo=mail-pj1-x104a.google.com; envelope-from=3br6azwykdowgsobxquccuzs.qcazwbilddq-rsjzwghg.cnzopg.cfu@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=sXGpa/v8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::104a; helo=mail-pj1-x104a.google.com; envelope-from=3br6azwykdowgsobxquccuzs.qcazwbilddq-rsjzwghg.cnzopg.cfu@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x104a.google.com (mail-pj1-x104a.google.com [IPv6:2607:f8b0:4864:20::104a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YTZ6S3BjXz3c30
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Jan 2025 06:07:27 +1100 (AEDT)
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-2ef9864e006so3577640a91.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 09 Jan 2025 11:07:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736449646; x=1737054446; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=YAFl8oxMn+4OWiBfmOCqt1n9SmilznMI/rM3XM++rFU=;
        b=sXGpa/v8pH4HNFTWKGE63W7W1gh/EOjVkJ7v+AV1vKs9SpePKR0UmVtYOj7FBEZFV7
         GD7qyVoUPX+MfNsnk0ixSdI9mG8AKVENIUHivjGtDDGoYoq+P57rxi0A6PDMBeMC37r/
         JD5psa/hS8XfFKCWtj0UmWl5lVxzvuvBFpK+JZGe1TH47foIEb9cWs/JQpWzt2WkxSdv
         Vuu/r+uiOMSxNIpH7J5Sv0fcfvBBpHG57+XwWIa42AOJjUIb5j8CkmYOgbbKz5Kn+bao
         diuuWZ/pYNA08noBigk5tSdDfAcWFDIUiNj39CEoJ3ccuEBeHKeQZF5zrejDg9zmLxCh
         GBzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736449646; x=1737054446;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YAFl8oxMn+4OWiBfmOCqt1n9SmilznMI/rM3XM++rFU=;
        b=Ksg3m+sh4oSb9E6A2Kbfg4Xzv8RZRRQZOVyyooAtHiuG2gaU2lFMkHnvHdTZsienQK
         J174U8cYY421ajOs2+6hlwAC5TCHj5IMZ6EmMQFJaEm7PNl+CW4LJbhuPmucsbe54mro
         9/PWMPJAnqk+o+GN76eV/lc78W15AB6lu52ITiT66HkB8M2dR/rFHuQvCXR6ouWVfZey
         XcHZdS2bVyFbjyTZSQ3qR49VWGYTuVmpInzdcf4xgrv0uNhGXB5VlFYFIBetagKPaNd8
         q2yRVmplW1iZvkli0m9k2nPETBW00KcPgkuNjgSqYOb+T3J12BT503pHfWmPYhvUCAYt
         GP7w==
X-Forwarded-Encrypted: i=1; AJvYcCUqLNICgGJsmzKbYd9J2rVTMGc8zZmG0D/u6IxT+gcgeXz0hakbyRlkGGaajY8GVQYKV/oWnLMNVjpDDGI=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzMxDQ1n/laZ0Z7R3oyukVn5DNwLxqxx4DjMg7XCgqFHNuQAxE+
	ocME4RgdFe7vccPXXGuEFWtBKqrE8HLeB3M4YT1NK9+o58Q2EPhijdh2TrVdzC6EEKPX9BAm1dQ
	xIg==
X-Google-Smtp-Source: AGHT+IGfqHfrrOW1TXoHzJjl1gNv82mqMiJA/BmNQ6TyvR9A3FEwcV69xv4bF8nQUa/IsMCkbReXjlWsoDg=
X-Received: from pjb12.prod.google.com ([2002:a17:90b:2f0c:b0:2ea:5469:76c2])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:1f91:b0:2ee:d797:40a4
 with SMTP id 98e67ed59e1d1-2f548f09ef9mr12271408a91.8.1736449645722; Thu, 09
 Jan 2025 11:07:25 -0800 (PST)
Date: Thu, 9 Jan 2025 11:07:24 -0800
In-Reply-To: <20250109133817.314401-6-pbonzini@redhat.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Mime-Version: 1.0
References: <20250109133817.314401-1-pbonzini@redhat.com> <20250109133817.314401-6-pbonzini@redhat.com>
Message-ID: <Z4AebPhhcQfGVmNO@google.com>
Subject: Re: [PATCH 5/5] KVM: e500: perform hugepage check after looking up
 the PFN
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: linux-kernel@vger.kernel.org, kvm@vger.kernel.org, oliver.upton@linux.dev, 
	Will Deacon <will@kernel.org>, Anup Patel <apatel@ventanamicro.com>, 
	Andrew Jones <ajones@ventanamicro.com>, linuxppc-dev@lists.ozlabs.org, 
	regressions@lists.linux.dev
Content-Type: text/plain; charset="us-ascii"
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Thu, Jan 09, 2025, Paolo Bonzini wrote:
> @@ -483,7 +383,7 @@ static inline int kvmppc_e500_shadow_map(struct kvmppc_vcpu_e500 *vcpu_e500,
>  	 * can't run hence pfn won't change.
>  	 */
>  	local_irq_save(flags);
> -	ptep = find_linux_pte(pgdir, hva, NULL, NULL);
> +	ptep = find_linux_pte(pgdir, hva, NULL, &psize);
>  	if (ptep) {
>  		pte_t pte = READ_ONCE(*ptep);

LOL, this code is such a mess.  If no ptep is found, IRQs are left disabled.  The
bug has existed since commit 691e95fd7396 ("powerpc/mm/thp: Make page table walk
safe against thp split/collapse"), i.e. we didn't accidentally delete a
local_irq_restore() at some point.

@@ -468,14 +469,23 @@ static inline int kvmppc_e500_shadow_map(struct kvmppc_vcpu_e500 *vcpu_e500,
 
 
        pgdir = vcpu_e500->vcpu.arch.pgdir;
+       /*
+        * We are just looking at the wimg bits, so we don't
+        * care much about the trans splitting bit.
+        * We are holding kvm->mmu_lock so a notifier invalidate
+        * can't run hence pfn won't change.
+        */
+       local_irq_save(flags);
        ptep = find_linux_pte_or_hugepte(pgdir, hva, NULL);
        if (ptep) {
                pte_t pte = READ_ONCE(*ptep);
 
-               if (pte_present(pte))
+               if (pte_present(pte)) {
                        wimg = (pte_val(pte) >> PTE_WIMGE_SHIFT) &
                                MAS2_WIMGE_MASK;
-               else {
+                       local_irq_restore(flags);
+               } else {
+                       local_irq_restore(flags);
                        pr_err_ratelimited("%s: pte not present: gfn %lx,pfn %lx\n",
                                           __func__, (long)gfn, pfn);
                        ret = -EINVAL;

