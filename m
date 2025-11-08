Return-Path: <linuxppc-dev+bounces-13960-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1034BC424E0
	for <lists+linuxppc-dev@lfdr.de>; Sat, 08 Nov 2025 03:33:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d3Kjz4sX1z2yqh;
	Sat,  8 Nov 2025 13:33:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::42f"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762569223;
	cv=none; b=CA5pWcXqjBtWulP9AUocZv07Wv+QXhL51qM0lTsSZhKK3NuIWBhtug2mhNriIBShYOthpU6qVWkugHGaRdye+TXPWx7u2iu+BP/dbdGE2l2z30HErMVqho89uK9JDsL33b4bhOY+pDFX/sJXKTWpMUUG5A00GbwtAPhh4PCQWR6grfJERslg26Wkim6V16dK0qC63MWO7qqUb8VLcSwPmz+WuPBTHePYI8oGNquCtiFrL46Id6uE7g/e11bGyMyuA61TeaEsMFTCi45OfJ4R8Nw+iGAhRPKGfZ5/ufrhHNkI/e9z0rwPG5ZfIQx1+faKBrMrP8hWOVmLYXPnJlVYlw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762569223; c=relaxed/relaxed;
	bh=8bKq5Kbap+TGIzkU08hwTVasn8Atv2TAiFfbpOuCLu4=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References:
	 MIME-Version:Content-Type; b=lz6LrIbMJnd2Rn7vMkpddN6JqO1cImATOiPE44NAg3CIZkMr7XPtmfeNlld/Z9lnhd/KYEK3TwaEmY8D53I3pJ3FbprzXOH/qOJFyVRELKLn+terDIytT0guW2D55Whbo66nK/vbNHBkKHPK/xmFO3fHgTlSLhNMiIcXzKd4v7D4Qtpv9E/Fq3wPimEO8psFTI4JFAnvgnEA1V7N1DMl0p7F0Ro9wRmIsy5q+xJq2JDjUarHodzEpwRzPNun+Uw19gB1TZH7/tJrEfb13np3IeV/Hz5SbqJH1TSDL8JLFxg+xMZGNPnXqPdQpIGDOfgKxG86K+IxBMskckSkrMQ7yA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=CPby9Ysd; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::42f; helo=mail-pf1-x42f.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=CPby9Ysd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42f; helo=mail-pf1-x42f.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d3Kjy28Tbz2yG5
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 Nov 2025 13:33:41 +1100 (AEDT)
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-79af647cef2so1137133b3a.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 07 Nov 2025 18:33:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762569218; x=1763174018; darn=lists.ozlabs.org;
        h=mime-version:references:message-id:date:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=8bKq5Kbap+TGIzkU08hwTVasn8Atv2TAiFfbpOuCLu4=;
        b=CPby9YsdZMibOYa6xKJjsZpaGPxd7Aa8gTpd/qghmTVqrpLOrK2+Q/SzfGvLAQAomA
         eIlGSfRCTaWA284eCk2D3Kk+gpZwOh/CFM2rNbqg6muw7CNodRNt4pr3VvwCx/2y8a8T
         J2vz3ue3kTKAF5cbg/9eU5CZ9Yx5z0KBQxw433Xx/QX7rOhI89D3Xgfc+CVbT0PXAIOZ
         6ejfvs2CU/s7wi6ffGXjh2t8YbpcNMH/ZYHGChPKjc58xN5cAjjHxWLPzFM31plV4GrS
         jX3nrDv4pniG2DePLfZZzZdKmpFW0vK6mr0qJX4Tr51YB5r28O2WmtilDYgNrP+qhSvw
         PFHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762569218; x=1763174018;
        h=mime-version:references:message-id:date:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8bKq5Kbap+TGIzkU08hwTVasn8Atv2TAiFfbpOuCLu4=;
        b=u2X5Aoh8ZwTFZWSovV0Vo+rGeJnBBFnyOH+DGMM8TAsdtdD3hrL2qlSgPbgfK0UfGu
         eUxxG6ytJ9I8Ne8aQ7QsEJa+1ucPRbLQ1WutqH1E/caOAiU1g0ef95fwqEweswu0ntNJ
         BiPh6JnJb8Si42brRcKxGDzpTe7xppv1/YtGjG9l44+yfxm8sOvWVSTTjMbB2+UD+xca
         Yo3l3ZA962bKPLJ9LB8x98ajeSi6EbNZ+WXGwyllx3fQy8y9UcYpcNOoQYLaSuyz2ZdM
         9YfYP1ZZXHIuZGKYco1+4kEhf1kjtcch7AB2KTibWjMv+jY9xgOyFJwRTbiNLcRjxASU
         wKOA==
X-Forwarded-Encrypted: i=1; AJvYcCWyiUgNH5bOZAMKj9FpAGM+MHmzq7UkdAFdp91rjjV2R2kIIkJ2F1l3wa7yON9HzY2HF6AVfpBiQHdzmU4=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyhiL9sO02WHJurVPMjyD4SDwhT90701GeEocEf009QVvcYXrHP
	JjJhvC4D3CvNSGHIKhmjoY+SHWVRUTytCVYY2HtWFCnEzcWuf3c1r8M1
X-Gm-Gg: ASbGnctbdMb/ryJmo3JDoNdQ3JxkPFiUmkyCl20rYmaBeLCEsqe1NPIPtujlpHyZEOc
	pOY3n7E10yLC0o8S84g6bo42PAxSt+WKrjUweIMQLZYyrSKx9gkqp7hE1/uQnGAiA+VqO5MKI1r
	A4dus3rLJ4nzUTm8bX6qUonrZeZRcVFuDfmgl6D8MbaiqJ/gfRdJLkLat1pFxyqV/BmY2tTBhVx
	afn7HUn08BTLNcDc5mTCn5tK3+6zEZEfc1guAH6cYD7oxmhF6Go0TXNW/aa+B4BFa40OuLxT2M+
	cYPOHlc10l9v3f6quKw4by1nIDDAnPCB9qT8H3LApHbtXPtW7n3CVpJTTjA7jv8V1n3mZjM7H3k
	qc2BI8OTNaajFvMasIWNxxwNDeHYcle/Se/hsBGLcB9UWLnPEyXgLKR96BJLU7WxhNWQAZrqI+P
	O+YlVb
X-Google-Smtp-Source: AGHT+IH/Pe7wf3Ci181tpT0LHXQVq+Kf1iV5vunI2sKT5fx4KiiLBfIeJu3hgL/jAYkDOG6ZWRYxGw==
X-Received: by 2002:a05:6a20:12c5:b0:33f:9581:5d2f with SMTP id adf61e73a8af0-3539f99e63emr1740681637.3.1762569218334;
        Fri, 07 Nov 2025 18:33:38 -0800 (PST)
Received: from dw-tp ([171.76.85.117])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ba8f8d7eedcsm6587378a12.2.2025.11.07.18.33.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Nov 2025 18:33:37 -0800 (PST)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Kevin Brodsky <kevin.brodsky@arm.com>, linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Andreas Larsson <andreas@gaisler.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Boris Ostrovsky <boris.ostrovsky@oracle.com>, Borislav Petkov <bp@alien8.de>, 
	Catalin Marinas <catalin.marinas@arm.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Dave Hansen <dave.hansen@linux.intel.com>, David Hildenbrand <david@redhat.com>, 
	"David S. Miller" <davem@davemloft.net>, David Woodhouse <dwmw2@infradead.org>, 
	"H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>, Jann Horn <jannh@google.com>, 
	Juergen Gross <jgross@suse.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Michal Hocko <mhocko@suse.com>, Mike Rapoport <rppt@kernel.org>, 
	Nicholas Piggin <npiggin@gmail.com>, Peter Zijlstra <peterz@infradead.org>, 
	Ryan Roberts <ryan.roberts@arm.com>, Suren Baghdasaryan <surenb@google.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Vlastimil Babka <vbabka@suse.cz>, Will Deacon <will@kernel.org>, 
	Yeoreum Yun <yeoreum.yun@arm.com>, linux-arm-kernel@lists.infradead.org, 
	linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org, 
	xen-devel@lists.xenproject.org, x86@kernel.org, 
	Venkat Rao Bagalkote <venkat88@linux.ibm.com>
Subject: Re: [PATCH v4 01/12] powerpc/64s: Do not re-activate batched TLB flush
In-Reply-To: <b3e4a92f-5b51-4eee-bfb8-c454add0f0d2@arm.com>
Date: Sat, 08 Nov 2025 06:05:17 +0530
Message-ID: <87cy5t4b0a.ritesh.list@gmail.com>
References: <20251029100909.3381140-1-kevin.brodsky@arm.com> <20251029100909.3381140-2-kevin.brodsky@arm.com> <87qzud42n1.ritesh.list@gmail.com> <b3e4a92f-5b51-4eee-bfb8-c454add0f0d2@arm.com>
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
Content-Type: text/plain
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Kevin Brodsky <kevin.brodsky@arm.com> writes:

> On 05/11/2025 02:46, Ritesh Harjani (IBM) wrote:
>> Kevin Brodsky <kevin.brodsky@arm.com> writes:
>>
>>> From: Alexander Gordeev <agordeev@linux.ibm.com>
>>>
>>> Since commit b9ef323ea168 ("powerpc/64s: Disable preemption in hash
>>> lazy mmu mode") a task can not be preempted while in lazy MMU mode.
>>> Therefore, the batch re-activation code is never called, so remove it.
>>>
>>> Signed-off-by: Alexander Gordeev <agordeev@linux.ibm.com>
>>> Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
>>> ---
>>>  arch/powerpc/include/asm/thread_info.h |  2 --
>>>  arch/powerpc/kernel/process.c          | 25 -------------------------
>>>  2 files changed, 27 deletions(-)
>>>
>> Since the commit referenced in above disables the preemption in
>> arch_enter_lazy_mmu(), so the expectation is that we will never be
>> context switched while in lazy_mmu, hence the code changes in
>> switch_to() around __flush_tlb_pending() should ideally never be called.
>
> Correct, that's the idea.
>
>> With this analysis - the patch looks good to me. I will give this entire
>> patch series a try on Power HW with Hash mmu too (which uses lazy mmu and
>> let you know the results of that)!
>
> That'd be very appreciated, thanks a lot!
>

I did give this patch series a run on Power10 with Hash MMU. I ran the
following stress-ng tests and didn't observe any issues (kernel warnings) so far.

stress-ng --all 0 -t 60s --perf -v --verify \
--tlb-shootdown 0 \
--fault 0 \
--userfaultfd 0 \
--fork 0 \
--exec 0 \
--memfd 0 \
--numa 0 \
--pkey 0 \
--remap 0 \
--vm 0 \
--rmap 0 \
-x swap,pagemove
(Note not all options shown here will work with --verify)

Let me know what else I can run for validation?
Do you know of any specific tests for validation of lazy mmu feature?

>> For this patch please feel free to add:
>> Reviewed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
>>
>>
>> CC: Venkat who also runs CI on linux Power HW for upstream testing :)
>
> Ack, will Cc you both in the next version.

Sure. Thanks!

-ritesh

