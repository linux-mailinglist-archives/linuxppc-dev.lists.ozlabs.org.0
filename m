Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A7AEA25B372
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Sep 2020 20:09:36 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BhX5S1c4CzDqvn
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Sep 2020 04:09:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=2a00:1450:4864:20::244;
 helo=mail-lj1-x244.google.com; envelope-from=torvalds@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux-foundation.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org
 header.a=rsa-sha256 header.s=google header.b=e/XkK5a4; 
 dkim-atps=neutral
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BhWxj15KXzDr1R
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Sep 2020 04:02:48 +1000 (AEST)
Received: by mail-lj1-x244.google.com with SMTP id b19so185359lji.11
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 02 Sep 2020 11:02:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0Bg5CH27blnlQEY7ZbxyRfRPKR4l4nMrtwYSLut004w=;
 b=e/XkK5a4GY2Tn3MbbkgTERsousdPaUdiykBfWX/XJUbDL2HXb1RusFjSc4NyV3OXh2
 wUI1X7pU3VNBI/2kfCnv8Y0VVuJ6ZzYVOMPrfytgciQOG+JtztPD9+Ld3/lP8gGs2rXX
 TPmC3FG6W1QBLPFZmovrW+3ivTUJBX+tEcPl4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0Bg5CH27blnlQEY7ZbxyRfRPKR4l4nMrtwYSLut004w=;
 b=BTEsmvWxFxH9u7tQAbeIHtDD7gTx7rdH/tw2lNy4mekNhd7fmpTcT5DGHmp36iWW8g
 uodBaBGHs0wbhH9X2fxLnkZCTfIzHg+OoE/ezZmBMxb+I7md0BfRNVKBqYj2XTuBPU0I
 B0KGKYYSDwHXeBFD8o70xz8ZnUvKfZf7QyIP+D96DJBjcyRJONMymr/XTGrNf6IMPh95
 PIuQUrHFCe2KNb2ocKUk9oL4qZgs0Do31JIPB6ONfCz4v3ZV7/gqOEqL2f0L8fgAXT92
 1HiXYV1acPfFJA6lAEId1NS8cyvxh1G+7nbW/dsGp8HUOc2NpBmZqTU4ATEXOVmecWwy
 oAcw==
X-Gm-Message-State: AOAM531wbmMXQKYUJqZ262JyPVYjX/DRuB/pgo8jBVgsFyp3uc/IadEv
 PoHDowzXTuE48RETYCvTIVG9LHTB9twC8A==
X-Google-Smtp-Source: ABdhPJxpOhZ8JjJw3tCY7TZUM6WZhYJK/dFOGrkUCqi6nmhmMZr9noZcnPD48tHbN6vlxR2wtgGz6Q==
X-Received: by 2002:a2e:95d4:: with SMTP id y20mr3591609ljh.351.1599069760870; 
 Wed, 02 Sep 2020 11:02:40 -0700 (PDT)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com.
 [209.85.208.180])
 by smtp.gmail.com with ESMTPSA id u2sm73187ljo.48.2020.09.02.11.02.38
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Sep 2020 11:02:39 -0700 (PDT)
Received: by mail-lj1-f180.google.com with SMTP id r13so279570ljm.0
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 02 Sep 2020 11:02:38 -0700 (PDT)
X-Received: by 2002:a2e:2e04:: with SMTP id u4mr3727925lju.102.1599069758523; 
 Wed, 02 Sep 2020 11:02:38 -0700 (PDT)
MIME-Version: 1.0
References: <20200827150030.282762-1-hch@lst.de>
 <20200827150030.282762-11-hch@lst.de>
 <8974838a-a0b1-1806-4a3a-e983deda67ca@csgroup.eu>
 <20200902123646.GA31184@lst.de>
 <d78cb4be-48a9-a7c5-d9d1-d04d2a02b4c6@csgroup.eu>
In-Reply-To: <d78cb4be-48a9-a7c5-d9d1-d04d2a02b4c6@csgroup.eu>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 2 Sep 2020 11:02:22 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiDCcxuHgENo3UtdFi2QW9B7yXvNpG5CtF=A6bc6PTTgA@mail.gmail.com>
Message-ID: <CAHk-=wiDCcxuHgENo3UtdFi2QW9B7yXvNpG5CtF=A6bc6PTTgA@mail.gmail.com>
Subject: Re: [PATCH 10/10] powerpc: remove address space overrides using
 set_fs()
To: Christophe Leroy <christophe.leroy@csgroup.eu>
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
Cc: linux-arch <linux-arch@vger.kernel.org>, Kees Cook <keescook@chromium.org>,
 the arch/x86 maintainers <x86@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Al Viro <viro@zeniv.linux.org.uk>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Christoph Hellwig <hch@lst.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Sep 2, 2020 at 8:17 AM Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
>
>
> With this fix, I get
>
> root@vgoippro:~# time dd if=/dev/zero of=/dev/null count=1M
> 536870912 bytes (512.0MB) copied, 6.776327 seconds, 75.6MB/s
>
> That's still far from the 91.7MB/s I get with 5.9-rc2, but better than
> the 65.8MB/s I got yesterday with your series. Still some way to go thought.

I don't see why this change would make any difference.

And btw, why do the 32-bit and 64-bit checks even differ? It's not
like the extra (single) instruction should even matter. I think the
main reason is that the simpler 64-bit case could stay as a macro
(because it only uses "addr" and "size" once), but honestly, that
"simplification" doesn't help when you then need to have that #ifdef
for the 32-bit case and an inline function anyway.

So why isn't it just

  static inline int __access_ok(unsigned long addr, unsigned long size)
  { return addr <= TASK_SIZE_MAX && size <= TASK_SIZE_MAX-addr; }

for both and be done with it?

The "size=0" check is only relevant for the "addr == TASK_SIZE_MAX"
case, and existed in the old code because it had that "-1" thing
becasue "seg.seg" was actually TASK_SIZE-1.

Now that we don't have any TASK_SIZE-1, zero isn't special any more.

However, I suspect a bigger reason for the actual performance
degradation would be the patch that makes things use "write_iter()"
for writing, even when a simpler "write()" exists.

For writing to /dev/null, the cost of setting up iterators and all the
pointless indirection is all kinds of stupid.

So I think "write()" should just go back to default to using
"->write()" rather than "->write_iter()" if the simpler case exists.

                   Linus
