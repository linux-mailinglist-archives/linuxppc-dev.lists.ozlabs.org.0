Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 95D0511D624
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Dec 2019 19:47:29 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47YjTV6ySjzDr7Z
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Dec 2019 05:47:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=2a00:1450:4864:20::243;
 helo=mail-lj1-x243.google.com; envelope-from=torvalds@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux-foundation.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org
 header.b="ESVNK1Mw"; dkim-atps=neutral
X-Greylist: delayed 3693 seconds by postgrey-1.36 at bilbo;
 Fri, 13 Dec 2019 05:43:37 AEDT
Received: from mail-lj1-x243.google.com (unknown [IPv6:2a00:1450:4864:20::243])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47YjP54yd9zDr1c
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Dec 2019 05:43:36 +1100 (AEDT)
Received: by mail-lj1-x243.google.com with SMTP id m6so3444056ljc.1
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Dec 2019 10:43:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=daP2x4GLzegqYAtGzoN/GqQWx/OgbUZpFEmzsIb9AuY=;
 b=ESVNK1Mwi4VakiBbtSIOLOxnFTfo9yicVGMiebqVDAAObXDl8gUPGjFP3V6AoTVKJc
 HXbX49wJTIP8gVq4DIOHImreynSyKqrAyaVA413Sj66yFki8qzqdppnMRHspROxc1wIy
 o3RYW91grmKJW3WGA8r4+DqCoBMnHPzXSZzsw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=daP2x4GLzegqYAtGzoN/GqQWx/OgbUZpFEmzsIb9AuY=;
 b=gAq4XVBnOqcPN6KHKgR4U0Y+YsKFHNEsW5IXvRtC4ryiHup+ClYYvz2/Qc/rhYYIsh
 xdz+FXZK/ocezHA80Wj/numH9+GzHQvKnp+LWtdg2LlZF7NxmqmaLNLRjNASGgoYn70/
 6mp7NQktGHU4ne+npi7sMM/ky9rn1N7Y75s5iOiDZK1yghctStEVuImMypl1uV00Sdk1
 kVvhNUkoqh53koSH0DUiIs4CxkPbYXWBGX3DHfMZ8yVkKtFlPbI5bktCsRvcs/HMP1gw
 iShdcC0KGcdPuyP3bWFBWYBC2Vem26WvsN8PCaQmwF2+0ALKL6/lf2RbgRWw2k7NIPuX
 1MJg==
X-Gm-Message-State: APjAAAUx0Ud+yR5OA7Ntk97KjMt7fM6BISXkpryIHq6D/EvU251MNpfl
 CBQ9k9uiV5KWgK4XWq61sGwvE8C7msI=
X-Google-Smtp-Source: APXvYqwLSEUI91t3uR02ymjVRa46GyUXjEqmN4PzLgCHCNrDYCRr53pGtHrhcL1YTeGcU6FdRnKzig==
X-Received: by 2002:a2e:8953:: with SMTP id b19mr6374121ljk.249.1576176202434; 
 Thu, 12 Dec 2019 10:43:22 -0800 (PST)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com.
 [209.85.167.43])
 by smtp.gmail.com with ESMTPSA id z9sm3421454ljm.40.2019.12.12.10.43.21
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Dec 2019 10:43:21 -0800 (PST)
Received: by mail-lf1-f43.google.com with SMTP id 15so42883lfr.2
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Dec 2019 10:43:21 -0800 (PST)
X-Received: by 2002:ac2:4946:: with SMTP id o6mr6694407lfi.170.1576176201157; 
 Thu, 12 Dec 2019 10:43:21 -0800 (PST)
MIME-Version: 1.0
References: <87blslei5o.fsf@mpe.ellerman.id.au>
 <20191206131650.GM2827@hirez.programming.kicks-ass.net>
 <875zimp0ay.fsf@mpe.ellerman.id.au>
 <20191212080105.GV2844@hirez.programming.kicks-ass.net>
 <20191212100756.GA11317@willie-the-truck>
 <20191212104610.GW2827@hirez.programming.kicks-ass.net>
 <CAHk-=wjUBsH0BYDBv=q36482G-U7c=9bC89L_BViSciTfb8fhA@mail.gmail.com>
 <20191212180634.GA19020@willie-the-truck>
In-Reply-To: <20191212180634.GA19020@willie-the-truck>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 12 Dec 2019 10:43:05 -0800
X-Gmail-Original-Message-ID: <CAHk-=whRxB0adkz+V7SQC8Ac_rr_YfaPY8M2mFDfJP2FFBNz8A@mail.gmail.com>
Message-ID: <CAHk-=whRxB0adkz+V7SQC8Ac_rr_YfaPY8M2mFDfJP2FFBNz8A@mail.gmail.com>
Subject: Re: READ_ONCE() + STACKPROTECTOR_STRONG == :/ (was Re: [GIT PULL]
 Please pull powerpc/linux.git powerpc-5.5-2 tag (topic/kasan-bitops))
To: Will Deacon <will@kernel.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: linux-arch <linux-arch@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Peter Zijlstra <peterz@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Mark Rutland <mark.rutland@arm.com>, linuxppc-dev@lists.ozlabs.org,
 dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Dec 12, 2019 at 10:06 AM Will Deacon <will@kernel.org> wrote:
>
> I'm currently trying to solve the issue by removing volatile from the bitop
> function signatures

I really think that's the wrong thing to do.

The bitop signature really should be "volatile" (and it should be
"const volatile" for test_bit, but I'm not sure anybody cares).

Exactly because it's simply valid to say "hey, my data is volatile,
but do an atomic test of this bit". So it might be volatile in the
caller.

Now, I generally frown on actual volatile data structures - because
the data structure volatility often depends on _context_. The same
data might be volatile in one context (when you do some optimistic
test on it without locking), but 100% stable in another (when you do
have a lock).

So I don't want to see "volatile" on data definitions ("jiffies" being
the one traditional exception), but marking things volatile in code
(because you know you're working with unlocked data) and then passing
them down to various helper functions - including the bitops ones - is
quite traditional and accepted.

In other words, 'volatile" should be treated the same way "const" is
largely treated in C.

A pointer to "const" data doesn't mean that the data is read-only, or
that it cannot be modified _elsewhere_, it means that within this
particular context and this copy of the pointer we promise not to
write to it.

Similarly, a pointer to "volatile" data doesn't mean that the data
might not be stable once you take a lock, for example. So it's ok to
have volatile pointers even if the data declaration itself isn't
volatile - you're stating something about the context, not something
fundamental about the data.

And in the context of the bit operations, "volatile" is the correct thing to do.

                     Linus
