Return-Path: <linuxppc-dev+bounces-13658-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C99FBC27DDB
	for <lists+linuxppc-dev@lfdr.de>; Sat, 01 Nov 2025 13:18:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4czH1h6Lj6z3cfv;
	Sat,  1 Nov 2025 23:18:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761999496;
	cv=none; b=Tgc+McxqSQa2m4H/Z0QqKkM0f+cjHGBC1NgD7vkIJ8NRxEYNFwTWxrBFmwdaXCJjfaRw7Ff1h8lpNORafIQsLFN0ySkW2sz8WdKO5V81eMisDUyrb0iVrY6OSBSenbKqsjOgLnWQZ27O8hW0OgAL2wErTIWbnElJcfMwVxiirM8hCTRwI6raB5WC338UMxi3Cm2kv6MWqwSLC+TstlPRfCMNMTEPbDEi/z8OW0Xo39Fl3CUm5g79CRZNiG+3C7nLQd8wTRcTkEOeAUeS7QAE3md8LzAhfaKi3hajkGrYEsTLfspaS8yGjB3Z2f4Yk8RqnSgc9qKyQYGWlR/Nay2DTA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761999496; c=relaxed/relaxed;
	bh=nakH/PvmVEC4FueXBEYiavMVStVvZPPhZqsGXFef+TU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YAXTPFY+WxdrJ1OTUWu7ITRXZioCc2CAGyF2vBxs7I7R3FjPHjpX+/Vg5yu0uxwk39CMQrN7remb3B8EuzRI8S74lMqUvAfOM0VWdUklI426pu95YAGND246Yl0rQNGkgwQdOt6s8hiva8zE9Qdr0fgSbUWWczJpbcVHwd/ZtTFIpmGUBAdImJr7925u6ep5gL/OG3pQ/SAJevoRWdcF8ydo8sux/hv2T4/zdfpYB9HhP5/n1/I6wj5n5ih+QbOoAjYKxy0/aU3l+tfvK6JO52rLHNlj/0yFqoaGdpBVacml8/kexYPwP0h9lamecpZwcmTiDOGSiD2FfeX2dHh47g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=STYNXe8J; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=STYNXe8J; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=STYNXe8J;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=STYNXe8J;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4czH1h01qbz2xQ6
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  1 Nov 2025 23:18:15 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761999493;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=nakH/PvmVEC4FueXBEYiavMVStVvZPPhZqsGXFef+TU=;
	b=STYNXe8J4IEZfoOWCA7WU2vgjBQJhgzBF8Edl4NefodU++NVvmlfvmyt3JJMbwgAersLmI
	gMncyqp8B0N5D24aqrClpUoU/8duQvx5xfM4mfqW7UQ1wB7kU4ZtujTvJzI7D+2zBI8n1t
	dWL3nMYsQ8qYShwfgB9cHHxyiAfHO34=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761999493;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=nakH/PvmVEC4FueXBEYiavMVStVvZPPhZqsGXFef+TU=;
	b=STYNXe8J4IEZfoOWCA7WU2vgjBQJhgzBF8Edl4NefodU++NVvmlfvmyt3JJMbwgAersLmI
	gMncyqp8B0N5D24aqrClpUoU/8duQvx5xfM4mfqW7UQ1wB7kU4ZtujTvJzI7D+2zBI8n1t
	dWL3nMYsQ8qYShwfgB9cHHxyiAfHO34=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-522-iNu8CxYIMS2tkDNesOTYQw-1; Sat, 01 Nov 2025 08:18:09 -0400
X-MC-Unique: iNu8CxYIMS2tkDNesOTYQw-1
X-Mimecast-MFC-AGG-ID: iNu8CxYIMS2tkDNesOTYQw_1761999489
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-46e39567579so16950365e9.0
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 01 Nov 2025 05:18:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761999488; x=1762604288;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nakH/PvmVEC4FueXBEYiavMVStVvZPPhZqsGXFef+TU=;
        b=KxSRgegsC1q3Ug8ANbPzJTHCTP3F9dWubdNhv8LEKvlEPaN8K6fe7JDkaqGc+I/S5U
         CWzIVxLwt8uleBo9oyXc6DlfX466vuE90xDE5FBE/QGgM/bUsAtAqw6JjHmCZI/AnmHS
         NfiyJVp9zssIX68rH1XrPfGWpqYBOOFtQUVFeGsCEAn1oDJGoZm+nCAmnZcGhJs3dfXc
         Qf9GBK1OwzJR+hAKbZu3fVhY2NVxvHnwOETv/bXSwzYgH4kSDyzG3DgRZxhyYNo7s2EF
         tWRL1G/jSpc/bx1w910+Jksl6+9vdtq3VlRYqFBQ1UvcFLkl1zHGWYr3xGTYUAWRvmDO
         odrg==
X-Forwarded-Encrypted: i=1; AJvYcCW1hg0248f8EQQfjU06szw9RaKDgPQE5SLLReyemyGeU+jg3c69dAriThPetBpvyTXprdsWf+FklhMg8n4=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwLtR/LcR5HWG1j6sE+1UzLsUfzCH9QX7MPpXElmHHCrEBZA9h+
	ef9/owAaJPHDSXAS6vAlNzST/RSprQOSoEKB4xV3ZoREsiUsowf2AFInQoHwU4x6O6Jj/Jio31Z
	H2J5G9SVVkvmV8bYukh9mp8eO5ISUBXk7+Y8uit4m8Y5pi3Fl7pd6Lm4ZytWqL5RkhyI=
X-Gm-Gg: ASbGnctFXcgDmxZnl6mZW42jKjHzmNono4uG38FwV1a48wbLUZ/D/Z6+zW1GFBjvgIs
	ol1mmORwu2ePpb3pH3T2NLfOa9vokNRbLHtFSvoeoM5Opz9EVr6DtH9NBubqOxPy+AKatLATOJw
	xufrFe2TaEf5LgefrzATg5eSUGTJW8/f7HNFDWrSzHijawU+duMdIcIqzGEqoaUG5yXquy86E5d
	EOAbX650QqQCx8OX+2ln5+QonXfluOMqNDO2fJ4lOEm/APaeU8chXqAOvZd3RX+R8nThH3MYrhz
	3EBrOK1rc/sRvhlCRMGqRXr6J2DNbBvtBjqMVuDPGPjgK6MaZ4tKr/QSLN4beKZlrWMZgoTfKbp
	x8IjHMgYmc7+xQRvEa+BqINlxxUju/S6siSbi+iQYMiJ8gzTYXyptVk6SyFnU3VKsVPqpWwO4KD
	wUTPCtMqCTAVL5IP65n+62zNTx7sY=
X-Received: by 2002:a05:600c:1d9b:b0:46d:996b:826a with SMTP id 5b1f17b1804b1-477308c8b64mr64006415e9.36.1761999488369;
        Sat, 01 Nov 2025 05:18:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEYuiv87iZ7G8foU4ArwULKDJw8Idy7HTvUTtsGo13HOjZ3TpQsscDerygyrVDH0/hBtY+XhQ==
X-Received: by 2002:a05:600c:1d9b:b0:46d:996b:826a with SMTP id 5b1f17b1804b1-477308c8b64mr64006055e9.36.1761999487959;
        Sat, 01 Nov 2025 05:18:07 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f3f:4b00:ee13:8c22:5cc5:d169? (p200300d82f3f4b00ee138c225cc5d169.dip0.t-ipconnect.de. [2003:d8:2f3f:4b00:ee13:8c22:5cc5:d169])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4773c53ec2csm45855895e9.11.2025.11.01.05.18.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 01 Nov 2025 05:18:07 -0700 (PDT)
Message-ID: <8f3596e9-fe40-4591-946d-65e849955a2f@redhat.com>
Date: Sat, 1 Nov 2025 13:18:05 +0100
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
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 06/12] mm: introduce generic lazy_mmu helpers
To: Kevin Brodsky <kevin.brodsky@arm.com>, linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>,
 Andreas Larsson <andreas@gaisler.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Borislav Petkov
 <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 "David S. Miller" <davem@davemloft.net>,
 David Woodhouse <dwmw2@infradead.org>, "H. Peter Anvin" <hpa@zytor.com>,
 Ingo Molnar <mingo@redhat.com>, Jann Horn <jannh@google.com>,
 Juergen Gross <jgross@suse.com>, "Liam R. Howlett"
 <Liam.Howlett@oracle.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Michal Hocko <mhocko@suse.com>,
 Mike Rapoport <rppt@kernel.org>, Nicholas Piggin <npiggin@gmail.com>,
 Peter Zijlstra <peterz@infradead.org>, Ryan Roberts <ryan.roberts@arm.com>,
 Suren Baghdasaryan <surenb@google.com>, Thomas Gleixner
 <tglx@linutronix.de>, Vlastimil Babka <vbabka@suse.cz>,
 Will Deacon <will@kernel.org>, Yeoreum Yun <yeoreum.yun@arm.com>,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org, x86@kernel.org
References: <20251029100909.3381140-1-kevin.brodsky@arm.com>
 <20251029100909.3381140-7-kevin.brodsky@arm.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
In-Reply-To: <20251029100909.3381140-7-kevin.brodsky@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: q1Qwjpi6bfRWqKGIKKu3_XP0yaVez_9iNPcwzocoDxQ_1761999489
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 29.10.25 11:09, Kevin Brodsky wrote:
> The implementation of the lazy MMU mode is currently entirely
> arch-specific; core code directly calls arch helpers:
> arch_{enter,leave}_lazy_mmu_mode().
> 
> We are about to introduce support for nested lazy MMU sections.
> As things stand we'd have to duplicate that logic in every arch
> implementing lazy_mmu - adding to a fair amount of logic
> already duplicated across lazy_mmu implementations.
> 
> This patch therefore introduces a new generic layer that calls the
> existing arch_* helpers. Two pair of calls are introduced:
> 
> * lazy_mmu_mode_enable() ... lazy_mmu_mode_disable()
>      This is the standard case where the mode is enabled for a given
>      block of code by surrounding it with enable() and disable()
>      calls.
> 
> * lazy_mmu_mode_pause() ... lazy_mmu_mode_resume()
>      This is for situations where the mode is temporarily disabled
>      by first calling pause() and then resume() (e.g. to prevent any
>      batching from occurring in a critical section).
> 
> The documentation in <linux/pgtable.h> will be updated in a
> subsequent patch.
> 
> No functional change should be introduced at this stage.
> The implementation of enable()/resume() and disable()/pause() is
> currently identical, but nesting support will change that.
> 
> Most of the call sites have been updated using the following
> Coccinelle script:
> 
> @@
> @@
> {
> ...
> - arch_enter_lazy_mmu_mode();
> + lazy_mmu_mode_enable();
> ...
> - arch_leave_lazy_mmu_mode();
> + lazy_mmu_mode_disable();
> ...
> }
> 
> @@
> @@
> {
> ...
> - arch_leave_lazy_mmu_mode();
> + lazy_mmu_mode_pause();
> ...
> - arch_enter_lazy_mmu_mode();
> + lazy_mmu_mode_resume();
> ...
> }
> 
> A couple of notes regarding x86:
> 
> * Xen is currently the only case where explicit handling is required
>    for lazy MMU when context-switching. This is purely an
>    implementation detail and using the generic lazy_mmu_mode_*
>    functions would cause trouble when nesting support is introduced,
>    because the generic functions must be called from the current task.
>    For that reason we still use arch_leave() and arch_enter() there.
> 
> * x86 calls arch_flush_lazy_mmu_mode() unconditionally in a few
>    places, but only defines it if PARAVIRT_XXL is selected, and we
>    are removing the fallback in <linux/pgtable.h>. Add a new fallback
>    definition to <asm/pgtable.h> to keep things building.
> 
> Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
> ---

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Cheers

David / dhildenb


