Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F334E3FF0B4
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Sep 2021 18:06:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H0m4f6thrz2ymg
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Sep 2021 02:06:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=dn11zXMq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=2a00:1450:4864:20::129;
 helo=mail-lf1-x129.google.com; envelope-from=torvalds@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org
 header.a=rsa-sha256 header.s=google header.b=dn11zXMq; 
 dkim-atps=neutral
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H0m3w0L15z2xtQ
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Sep 2021 02:05:30 +1000 (AEST)
Received: by mail-lf1-x129.google.com with SMTP id bq28so5395885lfb.7
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 02 Sep 2021 09:05:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=F57f7dVpJfotG0ZNhC9Jf0r1S23wHXlht59pY76lP5Q=;
 b=dn11zXMq7ooJ/wfmhg8E+OLuNJ5QEsMU7P/mm3M/yU8U6EmtmkLHvwPSHOyZJBA/tq
 lzIg5qITAnC5ZlDTbPdqkUYQuPljtkB27eKVU7OqT/rTtxnTf46Q1mq0ts0hPKpZ9TW+
 mlG98gvUPhvCnaKD3f02Jt+wVXhVi3Xzt8kek=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=F57f7dVpJfotG0ZNhC9Jf0r1S23wHXlht59pY76lP5Q=;
 b=q3Kr1Imeak2nPjnUqBaWI1aZUc/JSGE6WYX0xMIHkqvEIrAIB5Cnc0olR2Hc5+ogv3
 yTRiDeEvXo33lpNsaaA4xu2ByImHb4Iq2vUZjqHNP3wHf84H9T1LV5Soo5UiqaDatiCe
 sZH8JlXY5eo1nZ8+tj3rPTNwBV2fdJ3CO8otOvUGttXA0h4ubNTN2FJYarGNCrcHuSWU
 +j8tz5y0K3H5Cu+V0PCfTrvcMvOsiR/Rdd0EYBqmjhBfoCfzNokr5t5T2h4pQ6PIA55c
 WkiWBbmXSZ+8hQNqydpyuEfgbv1vU1LQBryUjQK13S6W9glb89I5S0nINg+0ZhaNdE50
 /VIA==
X-Gm-Message-State: AOAM532MYzzTXoxZ4jThv3jBKj8K1GzciK0gtGDqVG9PlIWbnHoER4SX
 o2D98uJVEt97a2cz73JV1ri5BqH4lkAMGtwv
X-Google-Smtp-Source: ABdhPJwPounqX7E8fLsEmBdGeKSsX2Ym+DsIg1HFiPEm9pjaqdnvtFE7hZVMEZDGJV2mE0G098vRoQ==
X-Received: by 2002:a05:6512:32c9:: with SMTP id
 f9mr3044891lfg.249.1630598721779; 
 Thu, 02 Sep 2021 09:05:21 -0700 (PDT)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com.
 [209.85.167.49])
 by smtp.gmail.com with ESMTPSA id y23sm236113lfg.277.2021.09.02.09.05.21
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Sep 2021 09:05:21 -0700 (PDT)
Received: by mail-lf1-f49.google.com with SMTP id h16so2546950lfk.10
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 02 Sep 2021 09:05:21 -0700 (PDT)
X-Received: by 2002:a05:6512:230b:: with SMTP id
 o11mr2990046lfu.377.1630598720898; 
 Thu, 02 Sep 2021 09:05:20 -0700 (PDT)
MIME-Version: 1.0
References: <fd7938d94008711d441551c06b25a033669a0618.1629732940.git.christophe.leroy@csgroup.eu>
 <a94be61f008ab29c231b805e1a97e9dab35cb0cc.1629732940.git.christophe.leroy@csgroup.eu>
 <YTB1F7o15FrxmmP1@infradead.org>
In-Reply-To: <YTB1F7o15FrxmmP1@infradead.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 2 Sep 2021 09:05:05 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjUN=Eu_FqY8sSU3yT+NUD+khQwhaD8FvfvgbhDYE-mqw@mail.gmail.com>
Message-ID: <CAHk-=wjUN=Eu_FqY8sSU3yT+NUD+khQwhaD8FvfvgbhDYE-mqw@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] signal: Add unsafe_copy_siginfo_to_user()
To: Christoph Hellwig <hch@infradead.org>
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
Cc: Peter Zijlstra <peterz@infradead.org>, Josh Poimboeuf <jpoimboe@redhat.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Paul Mackerras <paulus@samba.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Sep 1, 2021 at 11:55 PM Christoph Hellwig <hch@infradead.org> wrote:
>
> I'm a little worried about all these unsafe helper in powerpc and the
> ever increasing scope of the unsafe sections.  Can you at least at
> powerpc support to objtool to verify them?  objtool verifications has
> helped to find quite a few bugs in unsafe sections on x86.

.. yeah, objdump was particularly useful for the really subtle ones
where there are random function calls due to things like KASAN etc.

No human would ever have noticed "oh, we're walking the kernel stack
with user mode accesses enabled because the compiler inserted magical
debug code here". Objdump sees those things - assuming you teach it
about that special user space access enable/disable sequence.

            Linus
