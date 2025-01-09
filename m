Return-Path: <linuxppc-dev+bounces-4924-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DBF49A08055
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jan 2025 20:00:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YTYy44CTnz3c2b;
	Fri, 10 Jan 2025 06:00:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::649"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736449212;
	cv=none; b=mGZRiMGGQg85xcdGB8K55W9I3Ld9cQq12cCj5ZUbd6MtZwL6byfB+NF7MDqkVdzAqZYAkcctB4KbtRZHhVq2oO727JH8mYsyKnidVUU/4EyXA/RjmaUeiBDzNZC9wBURnx8h43F6dmk9dyqP8HWW3YlpnqvxYQDVpaqo8tzu8ixEzhtaYigTKlxOuHToyd3Dtn/K/SqvvyGuVVKlpBPJsogVssEMO/kwP9FY2ppG+aNqZtlGL52SDzxNJtiFozE6Zlz0K5pCLPpTY7cz0kjt8ycnJt30Ud7Jkm/wKjQljO4QOexjznCiQfYyDWblMG11UOnic0uN+yS8LXQIWvDtBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736449212; c=relaxed/relaxed;
	bh=haLW7l47J5rMTEJ8zSACBng3wk1nv637cJFnGsiAO+w=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=UF3sLC/mjuv+KTJVdgq+rCCxan6VmYFroQxeMBrJg/p8U2Ix9oYwKXo4hrqk/nCL9XbG8qPjxAftdc/6QECY0I6jNQh4RjKVAnkmjbdOvw2XS56p+DA8BrzbUk5JHBRzMh4pA7NIJe9uleViT2MMq1Tls53sT3tRGWZPT1fC3/B24HbS1lcAGOS9jMqjUG9pzoMTWLU2UtMYgR/SppSLgnzesO0e5CWugKoJx1mk3LdDyWHJAP3ofs75YZcz9EKtxB6Lqefybn4/Z6BJoMtoQ8IcwlGkqYD1nvsqsrut+zJvpY0wy64OkldadKEJEtp/ve0J3Tp+zClndRDy/TTZoA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=LnNfHr4B; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::649; helo=mail-pl1-x649.google.com; envelope-from=3shyazwykdc8dplyunrzzrwp.nzxwtyfiaan-opgwtded.zkwlmd.zcr@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=LnNfHr4B;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::649; helo=mail-pl1-x649.google.com; envelope-from=3shyazwykdc8dplyunrzzrwp.nzxwtyfiaan-opgwtded.zkwlmd.zcr@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x649.google.com (mail-pl1-x649.google.com [IPv6:2607:f8b0:4864:20::649])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YTYy16BcWz3bNm
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Jan 2025 06:00:08 +1100 (AEDT)
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-2163c2f32fdso30862015ad.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 09 Jan 2025 11:00:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736449203; x=1737054003; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=haLW7l47J5rMTEJ8zSACBng3wk1nv637cJFnGsiAO+w=;
        b=LnNfHr4BLc8rG8+VaOk38zNGM+7NyXvMUxRuBmKyaf225udGUDuUso76tKxkaog6Nj
         /g9zxbTzR6oNtYYbky8OMYTupLi7IM3xQBwgvk8TaHCvS7As3Jzx2H7dFfzk5s52ZSkm
         hqvTCSZLqCPVCwqs6tqhZN8BKnfkLINl96Gg8DiIQkL8aE6C/d9ZF8Ffr0HqMRiEXRdl
         5qTjbpP5IzHlLvIZBXm9SKgMTcM7XjIqdYoazq5E+pMnOBbSRkfimuwR0gibSjqjmwce
         JESBBFYx9G9g/mpY9n5pZkIpr3s+7xz0NYQgORGUD9etDzYYlSRK6t/CPR7MhIHs9ovQ
         7Gwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736449203; x=1737054003;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=haLW7l47J5rMTEJ8zSACBng3wk1nv637cJFnGsiAO+w=;
        b=AgUQ7Hk+U8xVQ4tJqcwFN8+dhblI3Lh7yriqB19OHU9U8tStTpou/2zSWhh6+dpfaR
         +DExK/32kFENGRRPu1FW8CuNUvGHmxuEN4Wig1XJ7LopYc7nEn8NcpFUsoSMQkrmhF3v
         U4X+jYFRzAsro26eOnCXmDIZ6l3YXW5C5SbkX2/a78cZYJf0oe27quy1jOf/GIGkHRmB
         0SqH+bO1PK3NRlFTIsRAYUbck3qGlbM2gh1J+LsO6d/ZyTJWvKmHu/l9Bvy8ce29OjnR
         x8mQOoqYhkfpr/xOLmyjvtG3x0OW+qUBZrUWOqqzGnNLkILITYNdaotJ3C9i4Ev2WZxO
         4eug==
X-Forwarded-Encrypted: i=1; AJvYcCWH46DWPsS2K+FasWJJCBkznKhXJGOXIU9qSn9AzQ8UJLUs+WHbAjICz81OP/k54xDa+jKFYJkCOjL36WI=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwdWdyp7d/ttMr8DkZHx1ZH86Pfm+sB7OYQJr6psY+2q4Tkr5Pq
	C2bQ3Gs0BQfgkgSkMJINC9BF+0tAtruaNeO57dJMjmFNIcbuRKFcVJrDvzRPMlbM9FHIshlVSsm
	niA==
X-Google-Smtp-Source: AGHT+IGGyRrFtOiXTLX0QGUwtIUWJLQiVZ+xflS3X78Pqi0jjnUrRHfKUFCx6IqJaMIjpIbZnthCmIRTyvc=
X-Received: from pgak9.prod.google.com ([2002:a63:3d09:0:b0:7fd:432d:551a])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:db06:b0:216:725c:a12c
 with SMTP id d9443c01a7336-21a83f46a4dmr117318665ad.9.1736449202497; Thu, 09
 Jan 2025 11:00:02 -0800 (PST)
Date: Thu, 9 Jan 2025 11:00:01 -0800
In-Reply-To: <20250109133817.314401-2-pbonzini@redhat.com>
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
References: <20250109133817.314401-1-pbonzini@redhat.com> <20250109133817.314401-2-pbonzini@redhat.com>
Message-ID: <Z4Acsese_-Kh1GPr@google.com>
Subject: Re: [PATCH 1/5] KVM: e500: retry if no memslot is found
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: linux-kernel@vger.kernel.org, kvm@vger.kernel.org, oliver.upton@linux.dev, 
	Will Deacon <will@kernel.org>, Anup Patel <apatel@ventanamicro.com>, 
	Andrew Jones <ajones@ventanamicro.com>, linuxppc-dev@lists.ozlabs.org, 
	regressions@lists.linux.dev, stable@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Thu, Jan 09, 2025, Paolo Bonzini wrote:
> Avoid a NULL pointer dereference if the memslot table changes between the
> exit and the call to kvmppc_e500_shadow_map().
> 
> Cc: stable@vger.kernel.org
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  arch/powerpc/kvm/e500_mmu_host.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/arch/powerpc/kvm/e500_mmu_host.c b/arch/powerpc/kvm/e500_mmu_host.c
> index e5a145b578a4..732335444d68 100644
> --- a/arch/powerpc/kvm/e500_mmu_host.c
> +++ b/arch/powerpc/kvm/e500_mmu_host.c
> @@ -349,6 +349,11 @@ static inline int kvmppc_e500_shadow_map(struct kvmppc_vcpu_e500 *vcpu_e500,
>  	 * pointer through from the first lookup.
>  	 */
>  	slot = gfn_to_memslot(vcpu_e500->vcpu.kvm, gfn);
> +	if (!slot) {
> +		ret = -EAGAIN;
> +		goto out;
> +	}

This is unnecessary, __gfn_to_hva_many() checks for a NULL @slot.

  static unsigned long __gfn_to_hva_many(const struct kvm_memory_slot *slot, gfn_t gfn,
				       gfn_t *nr_pages, bool write)
  {
	if (!slot || slot->flags & KVM_MEMSLOT_INVALID)
		return KVM_HVA_ERR_BAD;

	if (memslot_is_readonly(slot) && write)
		return KVM_HVA_ERR_RO_BAD;

	if (nr_pages)
		*nr_pages = slot->npages - (gfn - slot->base_gfn);

	return __gfn_to_hva_memslot(slot, gfn);
  }

  unsigned long gfn_to_hva_memslot(struct kvm_memory_slot *slot,
					gfn_t gfn)
  {
	return gfn_to_hva_many(slot, gfn, NULL);
  }

Not checking the return value and doing a VMA lookup on hva=-1 when tlbsel==1 is
gross, but it should be functionally safe.

Returning -EAGAIN is nicer (kvmppc_e500_shadow_map() will inevitably return -EINVAL),
but in practice it doesn't matter because all callers ultimately ignore the return
value.

Since there's a ratelimited printk that yells if there's no slot, it's probably
best to let sleeping dogs lie.

	if (likely(!pfnmap)) {
		tsize_pages = 1UL << (tsize + 10 - PAGE_SHIFT);
		pfn = __kvm_faultin_pfn(slot, gfn, FOLL_WRITE, NULL, &page);
		if (is_error_noslot_pfn(pfn)) {
			if (printk_ratelimit())
				pr_err("%s: real page not found for gfn %lx\n",
				       __func__, (long)gfn);
			return -EINVAL;
		}



> +
>  	hva = gfn_to_hva_memslot(slot, gfn);
>  
>  	if (tlbsel == 1) {
> -- 
> 2.47.1
> 

