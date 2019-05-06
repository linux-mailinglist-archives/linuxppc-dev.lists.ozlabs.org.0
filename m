Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B672A144FC
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 May 2019 09:07:11 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44yDM124bGzDqKX
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 May 2019 17:07:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4864:20::344; helo=mail-wm1-x344.google.com;
 envelope-from=mingo.kernel.org@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="mhLOADL9"; 
 dkim-atps=neutral
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44yDKZ2gWVzDqDQ
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 May 2019 17:05:54 +1000 (AEST)
Received: by mail-wm1-x344.google.com with SMTP id b10so14378270wmj.4
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 06 May 2019 00:05:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=5V6LFql9im1SPXc8YxW9Jo3rXT30savTgK/RedsezR8=;
 b=mhLOADL9bqOSSqke/X5TKBE3LDOfe2nbKYMCQidDFMKBOdyksQDafV2jYPTRt2XxBe
 AdhtK98Z9Qxa7k22gSsr4uMp++J7DJbPsAhdgfb4d5rFBZ8JOqqMs1k4kRy78OluZ8NI
 pqQYYSOwsVMYq21D3e54iLqFIjWOrUzSsrICzv8PwvE7myCD7zrEUJp1hdO/BX13E0Nn
 wk/uUxhcjd9TslYzN8t1cQtvFP+7Et0dSRmpFlNiShDBF0XQ6b1XvX5nTSblzJmmF7rO
 c8AhnCXdKulvKkejpAhstMRJse9EKwnjepdomaYnKBuF4DTKvVcp9RCoyhnLMlTUZvdm
 QhgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=5V6LFql9im1SPXc8YxW9Jo3rXT30savTgK/RedsezR8=;
 b=YLByvYJTRJX6B7vL/dFsemSwAdjWRQakYLmRQ+JIBD5gE9nfcmAGwtWWjUJMvhIAYq
 Qx7cjs7KTvNT08UN9CPX6VNetKjtizlfw8X6YkQy6bmdW4D8Nqv6GnsogUqPmULjlf1C
 05TBd5++cbHIQz1vqX9NFZCdK1RSJzRAfjDnqirVfbYM9l2HYtQcJ3xgqgsNEJdJN/4H
 0B34iLEaLmwWDmx+ps5daLEZReu83DsVHGlLuXzL4GHbkX3Xi9Jpx6+Xr4AahvhTySP2
 BA8RBRltrOTHwhU0Uqovv6a95Bga+wU53XwM7kGmyuhATxOIlZSYYPuz8hP2VITZEiih
 kWxg==
X-Gm-Message-State: APjAAAUsahzoz0sWRmfjXZmT7herWkwyCs39fVgQSzHlxLWXg9Un/IUQ
 dHLNfIVhQSSUGGIGoRl+HMw=
X-Google-Smtp-Source: APXvYqy4zpd3s31UHNJkzYltTQzBio1Fvf2VRSVUdP+5SE+cZ9IqATPxo97xjNReMAPbQjW779nz8w==
X-Received: by 2002:a7b:ce10:: with SMTP id m16mr9133691wmc.36.1557126347523; 
 Mon, 06 May 2019 00:05:47 -0700 (PDT)
Received: from gmail.com (2E8B0CD5.catv.pool.telekom.hu. [46.139.12.213])
 by smtp.gmail.com with ESMTPSA id d3sm18551842wmf.46.2019.05.06.00.05.45
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 06 May 2019 00:05:46 -0700 (PDT)
Date: Mon, 6 May 2019 09:05:44 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Subject: Re: [PATCH 00/10] implement DYNAMIC_DEBUG_RELATIVE_POINTERS
Message-ID: <20190506070544.GA66463@gmail.com>
References: <20190409212517.7321-1-linux@rasmusvillemoes.dk>
 <1afb0702-3cc5-ba4f-2bdd-604d9da2b846@rasmusvillemoes.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1afb0702-3cc5-ba4f-2bdd-604d9da2b846@rasmusvillemoes.dk>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Nick Desaulniers <ndesaulniers@google.com>, Arnd Bergmann <arnd@arndb.de>,
 x86@kernel.org, Will Deacon <will.deacon@arm.com>,
 linux-kernel@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>,
 Jason Baron <jbaron@akamai.com>, Ingo Molnar <mingo@redhat.com>,
 Andy Lutomirski <luto@kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, Nathan Chancellor <natechancellor@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


* Rasmus Villemoes <linux@rasmusvillemoes.dk> wrote:

> On 09/04/2019 23.25, Rasmus Villemoes wrote:
> 
> > While refreshing these patches, which were orignally just targeted at
> > x86-64, it occured to me that despite the implementation relying on
> > inline asm, there's nothing x86 specific about it, and indeed it seems
> > to work out-of-the-box for ppc64 and arm64 as well, but those have
> > only been compile-tested.
> 
> So, apart from the Clang build failures for non-x86, I now also got a
> report that gcc 4.8 miscompiles this stuff in some cases [1], even for
> x86 - gcc 4.9 does not seem to have the problem. So, given that the 5.2
> merge window just opened, I suppose this is the point where I should
> pull the plug on this experiment :(
> 
> Rasmus
> 
> [1] Specifically, the problem manifested in net/ipv4/tcp_input.c: Both
> uses of the static inline inet_csk_clear_xmit_timer() pass a
> compile-time constant 'what', so the ifs get folded away and both uses
> are completely inlined. Yet, gcc still decides to emit a copy of the
> final 'else' branch of inet_csk_clear_xmit_timer() as its own
> inet_csk_reset_xmit_timer.part.55 function, which is of course unused.
> And despite the asm() that defines the ddebug descriptor being an "asm
> volatile", gcc thinks it's fine to elide that (the code path is
> unreachable, after all....), so the entire asm for that function is
> 
>         .section        .text.unlikely
>         .type   inet_csk_reset_xmit_timer.part.55, @function
> inet_csk_reset_xmit_timer.part.55:
>         movq    $.LC1, %rsi     #,
>         movq    $__UNIQUE_ID_ddebug160, %rdi    #,
>         xorl    %eax, %eax      #
>         jmp     __dynamic_pr_debug      #
>         .size   inet_csk_reset_xmit_timer.part.55,
> .-inet_csk_reset_xmit_timer.part.55
> 
> which of course fails to link since the symbol __UNIQUE_ID_ddebug160 is
> nowhere defined.

It's sad to see such nice data footprint savings go the way of the dodo 
just because GCC 4.8 is buggy.

The current compatibility cut-off is GCC 4.6:

  GNU C                  4.6              gcc --version

Do we know where the GCC bug was fixed, was it in GCC 4.9?

According to the GCC release dates:

  https://www.gnu.org/software/gcc/releases.html

4.8.0 was released in early-2013, while 4.9.0 was released in early-2014. 
So the tooling compatibility window for latest upstream would narrow from 
~6 years to ~5 years.

Thanks,

	Ingo
