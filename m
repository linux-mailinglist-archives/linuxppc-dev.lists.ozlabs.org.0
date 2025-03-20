Return-Path: <linuxppc-dev+bounces-7229-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D2D3A6A3E8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Mar 2025 11:44:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZJMf55FTZz2yf4;
	Thu, 20 Mar 2025 21:44:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::349"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742467485;
	cv=none; b=map0seAfeC+h1+7tEJqtiReCpRnikx7zbnaFLdp6qHyTAsqu9h0OMj+ib0+2in6mEi1Mv45b0L+vugpvSnO0K5Q9nqPBYllEPYe/Ql7JiIDG0Bb3bxJhouXhk2TueOtiln8xecmzemhPAQBrCYs1tLjCjr26Ob8vh5BpV9YiadcmX5aQ4kXGG6z2jBw8uhrOSfIQlejveLSy0sXjtMQaTehI5Is9d9rOl30MRa/AAidKvWvpX5j3T0tpWZ8GySNseVqH5iaZXOxIqaJ6yxICvBO7i8J6vuFsykeQFLAbu6XbM1sE3X2eN1GjmypTALfPeoh7CdMnqi04W5AXUM9P/g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742467485; c=relaxed/relaxed;
	bh=j11DFSETqOLtc+vMOz1k4rHgXFA118EedepjEdU8Zqw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ABO7kgQbKAHFHcl8vKgwIrSsTJkOrXjuM0+Rln1i+zpQQt8yt5dmlyF2K4dzZ7o/9r5sBExJBVmoZ1YGuNP4bjT5BjI+SiGPlACQy+mlyN4vIzvXnsgzy+J4TUPF6mT9zexYmC+egTvTdH6rcVCmI3PJwwSpunYu7rxlxB9GweW9zt543QjPw2d23CLtW5B4NuYxy4frsq/tmptCy+TjhpHtxuwGVruSxaAYialWAZuiVw/R2S3Y2J2QnW0ztA60BG0g5OqXKB3BDl/vjLzhBPfR6mYe/JxhiYnmsMbqE9XPPCfyUJrkBDhxOK80g4P67C1OQbUJljDP8pHCF49hQA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=CdSNHyPj; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::349; helo=mail-wm1-x349.google.com; envelope-from=3mphbzwgkddewnpxznaotbbtyr.pbzyvahkccp-qriyvfgf.bmynof.bet@flex--jackmanb.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--jackmanb.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=CdSNHyPj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--jackmanb.bounces.google.com (client-ip=2a00:1450:4864:20::349; helo=mail-wm1-x349.google.com; envelope-from=3mphbzwgkddewnpxznaotbbtyr.pbzyvahkccp-qriyvfgf.bmynof.bet@flex--jackmanb.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x349.google.com (mail-wm1-x349.google.com [IPv6:2a00:1450:4864:20::349])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZJMf374zdz2ySW
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Mar 2025 21:44:43 +1100 (AEDT)
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-43d3b211d0eso9419185e9.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Mar 2025 03:44:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1742467480; x=1743072280; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=j11DFSETqOLtc+vMOz1k4rHgXFA118EedepjEdU8Zqw=;
        b=CdSNHyPjmeUAFRXhLGVXWiD3fG8KYb8cHQQlx8F1jz2mb8Y9kMJlUSZA1PsqWMsAKF
         GAGTvfNmlfYlrF/i/X20dJkX0D1NLxC77y9lVN7dPIyzT+smh/7mvE7uDwi9TLSKLAT7
         sF4Uh0Hc6GGDAtklZILGO6UIKulKOT4yrU2s91amFCNGYgxek8Nrn9ICj2933esZYw4t
         CJSykAsVz6T0ryK8mqGOeYMdSf+qiYZEKQXqAvrd8sEmtkmyYxCErdsRq5SnqQMo3fQ8
         YhHdRf3DW/zTn1BD1cjUhDeVBUFbOsZKEL82vblgsRWTzq9VHJ5tJtb8FFlarb7EBAPa
         kVEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742467480; x=1743072280;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=j11DFSETqOLtc+vMOz1k4rHgXFA118EedepjEdU8Zqw=;
        b=isNRvjoz+Me6D8XG/6WwFIfgw0OpTbqe0dnhAsDn5Ml4ubB6pFcfJsLCPQFk9u6yYN
         13V2S00C+DYMMNBt8SOFzFDEI3KITsL1sOMeU3VgMXmIzRuuEHVjyqkhnFHDh8aaQsUI
         J6WllrbpZReZEzWxrKWzuvPPWqKn178/BKyeP/N3WiIdCRto87HlilEHX1GOOWNWoqXN
         9GJZJyyhQzzGu+YZrSIYh+snc0F71eJnCuIh+m8xYk2hqbBiQZGWikg7hfBSFA6lr8lM
         0bZVTRTBY0Gkh9Z8ZktBGsTLnJFphEllt9Nj+sha6kh1kE9APworkLFe1tlWySUZZHvf
         bqyQ==
X-Forwarded-Encrypted: i=1; AJvYcCXuQLsTxpEDFt+2TTaK+Q2tBOu/BxQF43xVHCTJBy0gtJNbdBK9ioPRi2bf0+eYx1JgtgLey9qwwdb0k2k=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzFwyQcCkZtWyPNlSH4/RRfR0ucbyfudPkkcgsAQUlfcUCKVjQ2
	pr3srcMP/i1BpdsOj8Sh5CUOZHGhC0dnTsXutoKMDsGVAdYDxTC1uRYMlf1eevbuY1975Dv1y41
	Jelz1t9AZDQ==
X-Google-Smtp-Source: AGHT+IHmhdHTuCMOMffmpvyIMCzJObzjHJotMPvb7/CKZriBN1WJ2Qe2CHVhTxdEuiWThlixsbw8H9oOiShQMA==
X-Received: from wmgg15.prod.google.com ([2002:a05:600d:f:b0:43b:c450:ea70])
 (user=jackmanb job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1da2:b0:439:5f04:4f8d with SMTP id 5b1f17b1804b1-43d49187ba9mr20806165e9.12.1742467480075;
 Thu, 20 Mar 2025 03:44:40 -0700 (PDT)
Date: Thu, 20 Mar 2025 10:44:38 +0000
In-Reply-To: <Z9sRQ0cK0rupEiT-@google.com>
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
References: <20250110-asi-rfc-v2-v2-0-8419288bc805@google.com>
 <20250110-asi-rfc-v2-v2-4-8419288bc805@google.com> <20250319172935.GMZ9r-_zzXhyhHBLfj@fat_crate.local>
 <Z9sRQ0cK0rupEiT-@google.com>
X-Mailer: aerc 0.18.2
Message-ID: <D8L164U8HBTB.G5MS86AIISLM@google.com>
Subject: Re: [PATCH RFC v2 04/29] mm: asi: Add infrastructure for boot-time enablement
From: Brendan Jackman <jackmanb@google.com>
To: Yosry Ahmed <yosry.ahmed@linux.dev>, Borislav Petkov <bp@alien8.de>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, 
	<x86@kernel.org>, <linux-kernel@vger.kernel.org>, 
	<linux-alpha@vger.kernel.org>, <linux-snps-arc@lists.infradead.org>, 
	<linux-arm-kernel@lists.infradead.org>, <linux-csky@vger.kernel.org>, 
	<linux-hexagon@vger.kernel.org>, <loongarch@lists.linux.dev>, 
	<linux-m68k@lists.linux-m68k.org>, <linux-mips@vger.kernel.org>, 
	<linux-openrisc@vger.kernel.org>, <linux-parisc@vger.kernel.org>, 
	<linuxppc-dev@lists.ozlabs.org>, <linux-riscv@lists.infradead.org>, 
	<linux-s390@vger.kernel.org>, <linux-sh@vger.kernel.org>, 
	<sparclinux@vger.kernel.org>, <linux-um@lists.infradead.org>, 
	<linux-arch@vger.kernel.org>, <linux-mm@kvack.org>, 
	<linux-trace-kernel@vger.kernel.org>, <linux-perf-users@vger.kernel.org>, 
	<kvm@vger.kernel.org>, <linux-efi@vger.kernel.org>, 
	Junaid Shahid <junaids@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-8.6 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed Mar 19, 2025 at 6:47 PM UTC, Yosry Ahmed wrote:
> On Wed, Mar 19, 2025 at 06:29:35PM +0100, Borislav Petkov wrote:
> > On Fri, Jan 10, 2025 at 06:40:30PM +0000, Brendan Jackman wrote:
> > > Add a boot time parameter to control the newly added X86_FEATURE_ASI.
> > > "asi=on" or "asi=off" can be used in the kernel command line to enable
> > > or disable ASI at boot time. If not specified, ASI enablement depends
> > > on CONFIG_ADDRESS_SPACE_ISOLATION_DEFAULT_ON, which is off by default.
> > 
> > I don't know yet why we need this default-on thing...
>
> It's a convenience to avoid needing to set asi=on if you want ASI to be
> on by default. It's similar to HUGETLB_PAGE_OPTIMIZE_VMEMMAP_DEFAULT_ON
> or ZSWAP_DEFAULT_ON.
>
> [..]
> > > @@ -175,7 +184,11 @@ static __always_inline bool asi_is_restricted(void)
> > >  	return (bool)asi_get_current();
> > >  }
> > >  
> > > -/* If we exit/have exited, can we stay that way until the next asi_enter? */
> > > +/*
> > > + * If we exit/have exited, can we stay that way until the next asi_enter?
> > 
> > What is that supposed to mean here?
>
> asi_is_relaxed() checks if the thread is outside an ASI critical
> section.
>
> I say "the thread" because it will also return true if we are executing
> an interrupt that arrived during the critical section, even though the
> interrupt handler is not technically part of the critical section.
>
> Now the reason it says "if we exit we stay that way" is probably
> referring to the fact that an asi_exit() when interrupting a critical
> section will be undone in the interrupt epilogue by re-entering ASI.
>
> I agree the wording here is confusing. We should probably describe this
> more explicitly and probably rename the function after the API
> discussions you had in the previous patch.

Yeah, this is confusing. It's trying to very concisely define the
concept of "relaxed" but now I see it through Boris' eyes I realise
it's really unhelpful to try and do that. And yeah we should probably
just rework the terminology/API.

To re-iterate what Yosry said, aside from my too-clever comment style
the more fundamental thing that's confusing here is that, using the
terminology currently in the code there are two concepts at play:

- The critical section: this is the path from asi_enter() to
  asi_relax(). The critical section can be interrupted, and code
  running in those interupts is not said to be "in the critical
  section".

- Being "tense" vs "relaxed". Being "tense" means the _task_ is in a
  critical section, but the current code might not be.

This distinction is theoretically relevant because e.g. it's a bug to
access sensitive data in a critical section, but it's OK to access it
while in the tense state (we will switch to the restricted address
space, but this is OK because we will have a chance to asi_enter()
again before we get back to the untrusted code). 

BTW, just to be clear:

1. Both of these are only relevant to code that's pretty deeply aware
   of ASI. (TLB flushing code, entry code, stuff like that).

2. To be honest whenever you write:

     if (asi_in_critical_section())

   You probably mean:

     if (WARN_ON(asi_in_critical_section()))

   For example if we try to flush the TLB in the critical section,
   there's a thing we can do to handle it. But that really shouldn't
   be necessary.  We want the critical section code to be very small
   and straight-line code.

   And indeed in the present code we don't use
   asi_in_critical_section() for anything bur WARNing.

> asi_is_relaxed() checks if the thread is outside an ASI critical
> section.

Now I see it written this way, this is probably the best way to
conceptualise it. Instead of having two concepts "tense/relaxed" vs
"ASI critical section" we could just say "the task is in a critical
section" vs "the CPU is in a critical section". So we could have
something like:

bool asi_task_critical(void);
bool asi_cpu_critical(void);

(They could also accept an argument for the task/CPU, but I can't see
any reason why you'd peek at another context like that).

--

For everything else, Ack to Boris or +1 to Yosry respectively.

