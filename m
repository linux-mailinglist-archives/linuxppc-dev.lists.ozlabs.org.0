Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 93B3D14496
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 May 2019 08:50:48 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44yD055r5qzDqNV
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 May 2019 16:50:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=rasmusvillemoes.dk
 (client-ip=2a00:1450:4864:20::241; helo=mail-lj1-x241.google.com;
 envelope-from=linux@rasmusvillemoes.dk; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=rasmusvillemoes.dk
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=rasmusvillemoes.dk header.i=@rasmusvillemoes.dk
 header.b="D8snUQHA"; dkim-atps=neutral
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44yCxK3M9JzDqK9
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 May 2019 16:48:20 +1000 (AEST)
Received: by mail-lj1-x241.google.com with SMTP id h21so10019895ljk.13
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 05 May 2019 23:48:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rasmusvillemoes.dk; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=C2U/Y3HrsZsGwgSrYLbL41jSdN4fVhl+NLwRQdY4iqY=;
 b=D8snUQHAfdzQm9GkWQI34dkVAxrAJuZkmWsqO5irUHT1hWyV2hkSyYSsSclecD9gti
 eZwTtFWJLX5djPnJJpwa1CrKEH1nOO0tvUGWucaebAmsJGSDQJQdRdXKpwRfY3sKAUYf
 4wqO50fRoeyvl+KoXsP2lu7dYVZcoUzjU59UA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=C2U/Y3HrsZsGwgSrYLbL41jSdN4fVhl+NLwRQdY4iqY=;
 b=PpjGni/l/orhGOkMfIs7u1GuBy19TiIz2fAoptLKhrpnZNVNM8y2IG5KrFrFNsv9n/
 QPn/KBdNmyqlPf8AppATo1HHgSQLw6dLGeNHlGbBgl5y2qNev+FluwnjIgTwkcG8v6Er
 mtfCoMRx+iwDwe219AWmkgarezXV35nr5GE4gYcV/eyMzK197pvlJNzQ1RSb80Tpk4uX
 caTK7PGDUJ/PqYgF4yIDhTfRLb1CoJfI+ZPTvjmAl4y9SxPZ1TyUIDzf0rVfXqT9Gw7E
 LYST4xDRpVlnpxBlyziTCiaPHNz4dk9GjySXA/mMhRjU4K5CwBXGIjnTezXMjyfVmvX+
 O7sw==
X-Gm-Message-State: APjAAAWpXgpMUNbOGYHgnqcGkxW/B4eW9CZ0nBIYB2rWg7CMDjLemBcq
 FwA02EGL1ILS5F2ge+Ow22/SsA==
X-Google-Smtp-Source: APXvYqzZ60bhW+zmKxgQWKFu3bPVmpIDGkgZaXEtzr6qDGU0QdrT3fUUEmHHE44uPUNcpPCQcav0rQ==
X-Received: by 2002:a2e:7503:: with SMTP id q3mr587089ljc.190.1557125297062;
 Sun, 05 May 2019 23:48:17 -0700 (PDT)
Received: from [172.16.11.26] ([81.216.59.226])
 by smtp.gmail.com with ESMTPSA id j13sm2142583lfb.34.2019.05.05.23.48.15
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 05 May 2019 23:48:16 -0700 (PDT)
Subject: Re: [PATCH 00/10] implement DYNAMIC_DEBUG_RELATIVE_POINTERS
To: Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Andrew Morton <akpm@linux-foundation.org>
References: <20190409212517.7321-1-linux@rasmusvillemoes.dk>
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Message-ID: <1afb0702-3cc5-ba4f-2bdd-604d9da2b846@rasmusvillemoes.dk>
Date: Mon, 6 May 2019 08:48:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190409212517.7321-1-linux@rasmusvillemoes.dk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
 linux-kernel@vger.kernel.org, Jason Baron <jbaron@akamai.com>,
 Ingo Molnar <mingo@redhat.com>, Nathan Chancellor <natechancellor@gmail.com>,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 09/04/2019 23.25, Rasmus Villemoes wrote:

> While refreshing these patches, which were orignally just targeted at
> x86-64, it occured to me that despite the implementation relying on
> inline asm, there's nothing x86 specific about it, and indeed it seems
> to work out-of-the-box for ppc64 and arm64 as well, but those have
> only been compile-tested.

So, apart from the Clang build failures for non-x86, I now also got a
report that gcc 4.8 miscompiles this stuff in some cases [1], even for
x86 - gcc 4.9 does not seem to have the problem. So, given that the 5.2
merge window just opened, I suppose this is the point where I should
pull the plug on this experiment :(

Rasmus

[1] Specifically, the problem manifested in net/ipv4/tcp_input.c: Both
uses of the static inline inet_csk_clear_xmit_timer() pass a
compile-time constant 'what', so the ifs get folded away and both uses
are completely inlined. Yet, gcc still decides to emit a copy of the
final 'else' branch of inet_csk_clear_xmit_timer() as its own
inet_csk_reset_xmit_timer.part.55 function, which is of course unused.
And despite the asm() that defines the ddebug descriptor being an "asm
volatile", gcc thinks it's fine to elide that (the code path is
unreachable, after all....), so the entire asm for that function is

        .section        .text.unlikely
        .type   inet_csk_reset_xmit_timer.part.55, @function
inet_csk_reset_xmit_timer.part.55:
        movq    $.LC1, %rsi     #,
        movq    $__UNIQUE_ID_ddebug160, %rdi    #,
        xorl    %eax, %eax      #
        jmp     __dynamic_pr_debug      #
        .size   inet_csk_reset_xmit_timer.part.55,
.-inet_csk_reset_xmit_timer.part.55

which of course fails to link since the symbol __UNIQUE_ID_ddebug160 is
nowhere defined.
