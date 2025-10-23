Return-Path: <linuxppc-dev+bounces-13227-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A4606C033BA
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Oct 2025 21:53:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4csxXc0rRhz3bfQ;
	Fri, 24 Oct 2025 06:53:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761249184;
	cv=none; b=OZovzvT/KuSArKA3YaHCYvt0rixWhalgitRmu+0xZOV12dLUmcpUE5zY+q52w6s+1uorfmJ3BRwwQ2Ri8yk+1C5EBZQlyehzdaUuSF1/+LES9X6EKLeM9yW6CaFHoPWK2QFNK8JnNn/LDldwYmeXqvyMhIdCFUNTef/sJYthKdkplywvhHIGcVYvsWX1oLR21w1/tlUOF2Tad66QpHkCgleWXDjXMacoP59eVKHymih2vUWs+FKM5EgxbMAkm++0nWMY3U1WK7gOTvtiHdxvP4p/kVGgpeZbAjQBOqdBTnzZZM4F+QcWZp/iQCSiurHrUSdpy9nMNXzYVK5YfsMZNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761249184; c=relaxed/relaxed;
	bh=lu8DXyr9e+174zCCLKyjaz62dq3PQM0ss4FpqXHktAg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dzCEEjNvMIOic4dNO32HazSwgk3BSV6l51D0FOjLkqUC0ot0adxQeQlRi3sA8hKCjRcGwYwkw1CKObIHC80F8r3uWF+tpa88/jGFEbnm/LSOEaddqGaFDmXbkodBI3NXS8azGsO5wRpuFGe//6NDFIUC6gZEngIxrQp/S4629DcF/OdOAEaqSCHeKF/RLhJjfGjMxHO95dpEv2TnpMWy3zzDSsSqzqJCsA1mDvg3uV6fpAEou74b2ZFkubkPKdQyvpw0g8LcYA8I1h6bfg64aPRVRVDfLWKCXaz6KaQSbujq/Pqpt1y6dVgQdgvLId8254PO4uR2kRlMstvstbqJfw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=jAKbGxiC; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=jAKbGxiC; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=jAKbGxiC;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=jAKbGxiC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4csxXb0sdPz3bd0
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Oct 2025 06:53:02 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761249178;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=lu8DXyr9e+174zCCLKyjaz62dq3PQM0ss4FpqXHktAg=;
	b=jAKbGxiCK+cvgwHBgB0iTAkYuZZbqjQ5rhZ4s8q9xvBbxiDZOAAjOgnfZN7folnl3jC0YL
	E8tiiY3gc5InHQrw6GpQqV5kt8wuRA4ir/zzMQ4F/LzBek7LApdY/7X6pqXemVw/wLivst
	LthOYgFuoffLumBJUJOuVOunNVCl21A=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761249178;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=lu8DXyr9e+174zCCLKyjaz62dq3PQM0ss4FpqXHktAg=;
	b=jAKbGxiCK+cvgwHBgB0iTAkYuZZbqjQ5rhZ4s8q9xvBbxiDZOAAjOgnfZN7folnl3jC0YL
	E8tiiY3gc5InHQrw6GpQqV5kt8wuRA4ir/zzMQ4F/LzBek7LApdY/7X6pqXemVw/wLivst
	LthOYgFuoffLumBJUJOuVOunNVCl21A=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-529-aRV0qL6RO1uQKwVcFvUlBw-1; Thu, 23 Oct 2025 15:52:56 -0400
X-MC-Unique: aRV0qL6RO1uQKwVcFvUlBw-1
X-Mimecast-MFC-AGG-ID: aRV0qL6RO1uQKwVcFvUlBw_1761249175
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3ecdb10a612so710988f8f.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Oct 2025 12:52:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761249175; x=1761853975;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lu8DXyr9e+174zCCLKyjaz62dq3PQM0ss4FpqXHktAg=;
        b=HT+HHSt3s0yn257DTV6z5JvALg6dlfmhTs7FO31Ao2vYUmxJjDaozzSMix58aTKCmk
         wY+MYpTE51cGolfDp/OzoL8fVCtl7YZyolLt0yHp/zu4ylmqowRRtSCJxfTYe4YKs4F3
         rDfUrzSjyP5OKO59Fd8DUfbEYeTzqSKS7yeohfL5oS2nDRn48DQrP6KIXMBqTRJrnkQs
         npRozqB5gh4WNUYk8v3HyRYvN7NKjwma2H19pIdQ7Un9vP94hGqzoZc8mVoQzYwpivHL
         O06OlwWu/9NWMt1ANORP09/GMkY19zcFGyWWItdeERrU0YZGnLnugX8R4LicTCHNevde
         nSyA==
X-Forwarded-Encrypted: i=1; AJvYcCWMGMsBmCxts5ti617Rev+w2HyRuTrTzqPJGycBvYKT6rO1X2Fxb6miGw98MwG+lzEWTz3FtHBod+2fsuQ=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxC9GaqTKXMyOfjwCTW5vAsqyT+oYpTqW/6Gpp0sMQv0YS//MQK
	OlahYSACLe4MwGsTcmMO35V3poQTdX5ZVFqQH5fiMf/HZ3qjnTYDAfEjHyV6dMddtxotyBwjtES
	aF1PKFDcin1TTLIZlBjdr22LVVNCcs0f24/O1+uYORhJ70buQRYPNL0O8SG0nNNitXMc=
X-Gm-Gg: ASbGncttUJw2heuHmxJzpk89eQsWk3pDPqNioGZuacJyQie5BDHmjXfHMQzh8YcZiS3
	MLuN4R2I9AkOEufrtac8KKHIYx+QyTI8ekS/VqC+ARbu2QBsHKL4pcl/Kv5hW812LAECp7CjP0c
	yFHrovrVSb/7T8GlFyeM3V15g1KnANjr2F4PpBAPjsj0rJAAqR0b4VjsLUUIEGZctJCUyhAAOvZ
	7flY8Mybwy4rYvm3Lw8VzDKUbUrV4qWNbF5tdPfQMSE7oD/7fq/uV5tvGZytXlLSkvFFd4Eim9m
	OMnzGfhg0RZkLX0EyxmxFEkEDNNzV5IrOtxatSgqMxkacao0eV+C/w/uLVafNYwJ1qBqRGnv+n6
	iZsJYh68+sMgL2tA8jd6tbRhQzAugtIhlNtxrBXaXNcSQsTS6M7LmCWKYoR+gP4IRP05r9X1TCF
	TM2lDLv+WDAS0B3O89GtmyDHPYPC4=
X-Received: by 2002:a05:6000:2911:b0:3eb:df84:62e with SMTP id ffacd0b85a97d-42704d7e9f9mr18404403f8f.3.1761249174901;
        Thu, 23 Oct 2025 12:52:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF7U9VemhLNzul4GpnpOHuDDlV+F0CKxszXYKlJ5dnYJh0XFPFjlnxCdm5Nc2+v3zIM+vRJGA==
X-Received: by 2002:a05:6000:2911:b0:3eb:df84:62e with SMTP id ffacd0b85a97d-42704d7e9f9mr18404377f8f.3.1761249174285;
        Thu, 23 Oct 2025 12:52:54 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f4e:3200:c99d:a38b:3f3a:d4b3? (p200300d82f4e3200c99da38b3f3ad4b3.dip0.t-ipconnect.de. [2003:d8:2f4e:3200:c99d:a38b:3f3a:d4b3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429897ff3f5sm5656361f8f.22.2025.10.23.12.52.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Oct 2025 12:52:51 -0700 (PDT)
Message-ID: <73b274b7-f419-4e2e-8620-d557bac30dc2@redhat.com>
Date: Thu, 23 Oct 2025 21:52:49 +0200
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
Subject: Re: [PATCH v3 06/13] mm: introduce generic lazy_mmu helpers
To: Kevin Brodsky <kevin.brodsky@arm.com>, linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>,
 Andreas Larsson <andreas@gaisler.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Borislav Petkov
 <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 "David S. Miller" <davem@davemloft.net>, "H. Peter Anvin" <hpa@zytor.com>,
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
References: <20251015082727.2395128-1-kevin.brodsky@arm.com>
 <20251015082727.2395128-7-kevin.brodsky@arm.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
In-Reply-To: <20251015082727.2395128-7-kevin.brodsky@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 11j_A8EWnQZf7QZ0xE91vgWxIm1A-T8XpfSxCGoghuU_1761249175
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 15.10.25 10:27, Kevin Brodsky wrote:
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
> A couple of cases are noteworthy:
> 
> * madvise_*_pte_range() call arch_leave() in multiple paths, some
>    followed by an immediate exit/rescheduling and some followed by a
>    conditional exit. These functions assume that they are called
>    with lazy MMU disabled and we cannot simply use pause()/resume()
>    to address that. This patch leaves the situation unchanged by
>    calling enable()/disable() in all cases.

I'm confused, the function simply does

(a) enables lazy mmu
(b) does something on the page table
(c) disables lazy mmu
(d) does something expensive (split folio -> take sleepable locks,
     flushes tlb)
(e) go to (a)

Why would we use enable/disable instead?

> 
> * x86/Xen is currently the only case where explicit handling is
>    required for lazy MMU when context-switching. This is purely an
>    implementation detail and using the generic lazy_mmu_mode_*
>    functions would cause trouble when nesting support is introduced,
>    because the generic functions must be called from the current task.
>    For that reason we still use arch_leave() and arch_enter() there.

How does this interact with patch #11?

> 
> Note: x86 calls arch_flush_lazy_mmu_mode() unconditionally in a few
> places, but only defines it if PARAVIRT_XXL is selected, and we are
> removing the fallback in <linux/pgtable.h>. Add a new fallback
> definition to <asm/pgtable.h> to keep things building.

I can see a call in __kernel_map_pages() and 
arch_kmap_local_post_map()/arch_kmap_local_post_unmap().

I guess that is ... harmless/irrelevant in the context of this series?

[...]


-- 
Cheers

David / dhildenb


