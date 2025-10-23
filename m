Return-Path: <linuxppc-dev+bounces-13223-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CA0DC0331B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Oct 2025 21:37:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4csxB94ZDHz3bfF;
	Fri, 24 Oct 2025 06:37:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761248225;
	cv=none; b=HzaC9on1yUiAUWOfmu+cuVriHKmos9FsExMCBCoEaCemQ2MxKZbnAhd14NbYW2G66YR/FgkNgknDuJ7uc9nw4/N0ubsQ9hjiIWWt9dzFyjRQijSl7hwEqElTtnT2k3yiZpiVboXNDugNzXdB5VOVH0PcAxla9lg/K0OpHXmGGcerbmIFtxnxTjxfHS9+Mm757MpEpyiNwGh9l1QG3VU0HNBj/c+j8FO75F7HyVDr2hPQvw0SpueZwaHQGQuqAJrspUT5iGcmgtqC05c7rRRLbvgDmaN8iDJquX7UL36fMGklAtIdlRS9uaqrsuwnUGhMK66GhvmwEVAG5JneGCZXUg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761248225; c=relaxed/relaxed;
	bh=GAR+zcyIiLP0EmlRcHQPsRsm2ZVMdnZLABW6LHegPGk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VaKU49/yTq1HEMHfrJWwrKpiNLdYj3SWOcNNZygLEdNYDb4wFA2Uh2ZxpzmCAIlMtaEnB0eXUiJOZ0nL3RwyEQKJ8c9Ls1eBO/nNytuK389QL84p8G549+51L0jkRhlV5MShSAyUZBuVS/UXB+kKO1E9oGcg9RQDYbhuIZSUy9nO9mUqEZ5NtFx8ogp4YEDzubxWmE64FHElUJQaYbnqfKw1h7w1HWTWCrjGZh7PH3atpz8JHUCKvg9zDsm0AChUjBxtJpPpiQXPtYwxRprIkzkvdVM/D2z82IOhWaoR1LsbfQ1v10c35QWFPmGekXQ9RtrDmodEOShclmhweuo+Pw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=YYr/t9f8; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ddEQt0Kt; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=YYr/t9f8;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ddEQt0Kt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4csxB82FVjz3bf4
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Oct 2025 06:37:02 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761248217;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=GAR+zcyIiLP0EmlRcHQPsRsm2ZVMdnZLABW6LHegPGk=;
	b=YYr/t9f88DnfRGtalD5RRA3EJOwyBFx2tqF4AsdZj2aulW97W4kocfQxs8R+UFqKUQFgxK
	xOIwzVhEuE+Bs/SPO/21gWS4GzYciF1a9N/18FHLBpd0VNi+zxRtq0sYa/0dns5B4MWzaU
	a7dh0ggzzpPG8UUbwMpNevka400Js0s=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761248218;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=GAR+zcyIiLP0EmlRcHQPsRsm2ZVMdnZLABW6LHegPGk=;
	b=ddEQt0Kt8lZ79ZA6CZgPLmbcEnAQJyncuifEtEeCZw4EQoQPgWyf/KdhTHVmoy3bjnJ0c5
	ELAGsPwdfiO5ZEmukOCf4KWF4f6fI7Ybs/foQePCTAAYn4LGNUp8H7hLly/cfnhhdwdpTA
	rfj6r0sdSGm0gqtX2vQWtihBfc5A7IA=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-664-g9cySFQpPceNy_C79MixKQ-1; Thu, 23 Oct 2025 15:36:56 -0400
X-MC-Unique: g9cySFQpPceNy_C79MixKQ-1
X-Mimecast-MFC-AGG-ID: g9cySFQpPceNy_C79MixKQ_1761248215
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-4298da9fc21so134499f8f.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Oct 2025 12:36:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761248215; x=1761853015;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GAR+zcyIiLP0EmlRcHQPsRsm2ZVMdnZLABW6LHegPGk=;
        b=vHBazZto4LVUhsBEAP1eMvCtA1QcF8wVzvQqfUpeBhH738FFr8R5OVs0TSuFLjYjAC
         hdpwM0xdE7eYHeuS23hdCiB5c4z5aZae+7MwO2hxots1hRPZ6gGWmkU8Q/kHin5Q5qH1
         t6KBaoXFzsBjgUU+xV6FwJGNdi7FteT9ZJYgBRVI55XPp4u0F+LLJ9Z7+rkPzv1H6Ror
         hqxMjbZ3yU4KxI7JxKwTsbDigDkE1XP49kSYjdLDoJ/7u25HyobVhYNhVkmtVydN6SHw
         6KrndkurOXLzjlsoljTKr5R3l0UH8Uay7O69v637pP7AEzFEl7ccUOrJlsfJxvt4F+py
         oTOg==
X-Forwarded-Encrypted: i=1; AJvYcCWB2Uc8vbFetiOHwadjU8/0qWUUOtvHIkMVq/r/A6feyvVJUVpjvVq4OTjEqc7r+V8Erw3gzEkWHms5mX0=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyAx9kajNN1gFUzwKrDde0TfdLLvmsyVCDWUByIs7XtSNyl0Dno
	V7/HrWz63B7Y2LnCk13v385sKi7P3lryLbaVH4QC9x5jddbCElm5ffdPIlrKuCHA0g+DflVnzZU
	Nncg3ygybzq7Y4RbKx/bbB2bPQ383IU5XMB9jBFGUrgzq8nQcwZvu4FHcwHJcDEMy9PE=
X-Gm-Gg: ASbGncusUMdypkDgotukiZPcpfof+MwBCgYOTwDayalpXv7LQJvz57DSs5fBKiv7HSE
	deF2aRvog59yqjcr6ahJUOJqIRB/Pbr4JWenzmnLuI2Emebchvfrq4oYW2TmK8E7375KNY1Y62i
	nusldMd4imy2O/I0xHLtZleaI9mHjAx7gSnjRWTLKV4PzWRg1vKM5/W0eakn0L7SLNH+y+pSc05
	/jLUbq9txobUzpMa7B/W5wUFvgXJAVu+q6+pOLG1vXeId9wGBlQkbLKL1+9croh0jmgyRHbGN5i
	U8tmY7UVBWLriW+31oWDjU4qaev/JVom49iSWb0+eedk3Ys4yWPgOBofIPgQhd1tUNOq8GDsZY0
	UClA2w+eymYKNzxs4K7gkIByB4u9JUp75SD4UFx9buFZIkeDnq/gUweGdDfyyGp2ldPILxzhly4
	fOIxMKg0yDLl8KjRzRU/YAoeEtGjg=
X-Received: by 2002:a05:6000:2910:b0:426:d60f:746f with SMTP id ffacd0b85a97d-42704d94458mr15755895f8f.30.1761248214810;
        Thu, 23 Oct 2025 12:36:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFLONoaoN3j9k7k2WPBjhOeKfFc12IEn3iCcAu7lFYqr51oTxzPTHNLcPx+/xVbrYtjrgs6YQ==
X-Received: by 2002:a05:6000:2910:b0:426:d60f:746f with SMTP id ffacd0b85a97d-42704d94458mr15755849f8f.30.1761248214388;
        Thu, 23 Oct 2025 12:36:54 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f4e:3200:c99d:a38b:3f3a:d4b3? (p200300d82f4e3200c99da38b3f3ad4b3.dip0.t-ipconnect.de. [2003:d8:2f4e:3200:c99d:a38b:3f3a:d4b3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429898ecadbsm5715926f8f.45.2025.10.23.12.36.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Oct 2025 12:36:52 -0700 (PDT)
Message-ID: <60c55686-87dd-46d0-884e-80f7d423663b@redhat.com>
Date: Thu, 23 Oct 2025 21:36:48 +0200
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
Subject: Re: [PATCH v3 03/13] powerpc/mm: implement arch_flush_lazy_mmu_mode()
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
 <20251015082727.2395128-4-kevin.brodsky@arm.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
In-Reply-To: <20251015082727.2395128-4-kevin.brodsky@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: fJx7NWIdd4lODRfapOl-DzC8yPSTaGE_xzyDGLI1vo0_1761248215
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
> Upcoming changes to the lazy_mmu API will cause
> arch_flush_lazy_mmu_mode() to be called when leaving a nested
> lazy_mmu section.
> 
> Move the relevant logic from arch_leave_lazy_mmu_mode() to
> arch_flush_lazy_mmu_mode() and have the former call the latter.
> 
> Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
> ---
>   .../powerpc/include/asm/book3s/64/tlbflush-hash.h | 15 +++++++++++----
>   1 file changed, 11 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/book3s/64/tlbflush-hash.h b/arch/powerpc/include/asm/book3s/64/tlbflush-hash.h
> index 146287d9580f..7704dbe8e88d 100644
> --- a/arch/powerpc/include/asm/book3s/64/tlbflush-hash.h
> +++ b/arch/powerpc/include/asm/book3s/64/tlbflush-hash.h
> @@ -41,6 +41,16 @@ static inline void arch_enter_lazy_mmu_mode(void)
>   	batch->active = 1;
>   }
>   
> +static inline void arch_flush_lazy_mmu_mode(void)
> +{
> +	struct ppc64_tlb_batch *batch;
> +
> +	batch = this_cpu_ptr(&ppc64_tlb_batch);

The downside is the double this_cpu_ptr() now on the 
arch_leave_lazy_mmu_mode() path.

You could just have a helper function that is called by either or just 
... leave arch_leave_lazy_mmu_mode() alone and just replicate the two 
statements here in arch_flush_lazy_mmu_mode().

I would do just that :)

-- 
Cheers

David / dhildenb


