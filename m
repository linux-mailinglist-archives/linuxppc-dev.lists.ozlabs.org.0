Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B030974BEAE
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Jul 2023 20:06:01 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=Tig9LWLQ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qyyqq49sYz3byy
	for <lists+linuxppc-dev@lfdr.de>; Sun,  9 Jul 2023 04:05:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=Tig9LWLQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2a00:1450:4864:20::52f; helo=mail-ed1-x52f.google.com; envelope-from=torvalds@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qyypy0rFpz30Nn
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  9 Jul 2023 04:05:11 +1000 (AEST)
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-51cff235226so5805882a12.0
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 08 Jul 2023 11:05:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1688839507; x=1691431507;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MjnZGX1PQcWVMUP4ngUH52YPa64eL7ZPB4WTz7UhRF0=;
        b=Tig9LWLQHv1fd8ToIKJR7XM7HajkQZKUlFYdJLW5bVkh1LxFCsxx8ZYc2JI2tUvyCF
         ktptoBEAJKb0Opk3ugpsqsFroXyFPmu+nGdiwVcLcLdjhpPlKVve52dpjHBuwFqOKzE7
         Dhmg9r4XhM8ecNaGNDlyb6GnivkhM43v/qAPI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688839507; x=1691431507;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MjnZGX1PQcWVMUP4ngUH52YPa64eL7ZPB4WTz7UhRF0=;
        b=TNZS/nW2n6Rybda5opdamPEuudSmNq1hlsLlrNjDsLFUC0P6TH9nHqazh6/MGDzHVl
         8R6SHF95/chteKcxyu6URvQWlRA0FlHoIkH50lpxh0IUVHe9Xs9DE+RaAEGMTUDl67c6
         G52kxTFU2cWWIUjuV4Lbr9JsKRr20gYKNhhHfD8z+hQyV23+VRm3fHeblpCfl9fA7Ea7
         c/yU1+3RSJqPmlwxyY+oAAtU0nOdwZyELB6TeNy/ubDY9X6lRiP0MRNzr2MrvpmYeaRD
         /cYP1aiFU7dDsW2A9J5y9WZ2FqLG7jNGfauJY9dQbF8qWAmjVE2g2gYhC94Y3ImhUWB0
         /9/g==
X-Gm-Message-State: ABy/qLaFmmUETEckQWPZv46TygLexRKRPjmW4BYcRwrUlDenMpQpBeu9
	csAJoY4H/EW0HIFvig2gjRLL2xvtJODh67j8gYVgXtSc
X-Google-Smtp-Source: APBJJlESOkp9Lr7g8I5I4ksbJAu9roN/2NE5WK2S+bN4XA8QOyXow+/c08YWnuCSFmz3z1qBmn3UEA==
X-Received: by 2002:a05:6402:27ca:b0:51e:4218:b91b with SMTP id c10-20020a05640227ca00b0051e4218b91bmr4851646ede.1.1688839507736;
        Sat, 08 Jul 2023 11:05:07 -0700 (PDT)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com. [209.85.208.43])
        by smtp.gmail.com with ESMTPSA id k23-20020aa7d8d7000000b0051a4fcf7187sm3542927eds.62.2023.07.08.11.05.06
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 08 Jul 2023 11:05:06 -0700 (PDT)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-51e344efd75so5315477a12.1
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 08 Jul 2023 11:05:06 -0700 (PDT)
X-Received: by 2002:a05:6402:274c:b0:51b:d59f:8518 with SMTP id
 z12-20020a056402274c00b0051bd59f8518mr12625706edd.16.1688839506127; Sat, 08
 Jul 2023 11:05:06 -0700 (PDT)
MIME-Version: 1.0
References: <facbfec3-837a-51ed-85fa-31021c17d6ef@gmail.com>
 <5c7455db-4ed8-b54f-e2d5-d2811908123d@leemhuis.info> <CAJuCfpH7BOBYGEG=op09bZrh1x3WA8HMcGBXXRhe6M5RJaen5A@mail.gmail.com>
 <CAJuCfpH7t7gCV2FkctzG2eWTUVTFZD7CtD14-WuHqBqOYBo1jA@mail.gmail.com>
 <2023070359-evasive-regroup-f3b8@gregkh> <CAJuCfpF=XPpPYqp2Y1Vu-GUL=RBj4fyhXoXzjBY4EKtBnYE_eQ@mail.gmail.com>
 <2023070453-plod-swipe-cfbf@gregkh> <20230704091808.aa2ed3c11a5351d9bf217ac9@linux-foundation.org>
 <CAJuCfpE_WjRQoDT1XnvBghCH-kpqk+pfcBJGyDnK7DZLMVG5Mw@mail.gmail.com>
 <2023070509-undertow-pulverize-5adc@gregkh> <7668c45a-70b1-dc2f-d0f5-c0e76ec17145@leemhuis.info>
 <20230705084906.22eee41e6e72da588fce5a48@linux-foundation.org>
 <df1d7d39-56f3-699c-0d0f-fcc8774f182e@leemhuis.info> <CAHk-=whKd05V49AbZGF=inYmhU6H_yNvvw1grWyhQfQ=9+5-VQ@mail.gmail.com>
 <20230708103936.4f6655cd0d8e8a0478509e25@linux-foundation.org>
In-Reply-To: <20230708103936.4f6655cd0d8e8a0478509e25@linux-foundation.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 8 Jul 2023 11:04:49 -0700
X-Gmail-Original-Message-ID: <CAHk-=wh498i3s+BgOF=pUOF=Qe_A0A16-mFcH2YGy+iZXvNChQ@mail.gmail.com>
Message-ID: <CAHk-=wh498i3s+BgOF=pUOF=Qe_A0A16-mFcH2YGy+iZXvNChQ@mail.gmail.com>
Subject: Re: Fwd: Memory corruption in multithreaded user space program while
 calling fork
To: Andrew Morton <akpm@linux-foundation.org>
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
Cc: Jacob Young <jacobly.alt@gmail.com>, Linux regressions mailing list <regressions@lists.linux.dev>, Linux PowerPC <linuxppc-dev@lists.ozlabs.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Memory Management <linux-mm@kvack.org>, Thorsten Leemhuis <regressions@leemhuis.info>, Bagas Sanjaya <bagasdotme@gmail.com>, Greg KH <gregkh@linuxfoundation.org>, Laurent Dufour <ldufour@linux.ibm.com>, Suren Baghdasaryan <surenb@google.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, 8 Jul 2023 at 10:39, Andrew Morton <akpm@linux-foundation.org> wrote:
>
> That was the v1 fix, but after some discussion
> (https://lkml.kernel.org/r/20230705063711.2670599-1-surenb@google.com)
> it was decided to take the "excessive" approach.

That makes absolutely _zero_ sense.

It seems to be complete voodoo programming.

To some degree I don't care what happens in stable kernels, but
there's no way we'll do that kind of thing in mainline without some
logic or reason, when it makes no sense.

flush_cache_dup_mm() is entirely irrelevant to the whole issue, for
several reason, but the core one being that it only matters on broken
virtually indexed caches, so none of the architectures that do per-vma
locking.

And the argument that "After the mmap_write_lock_killable(), there
will still be a period where page faults can happen" may be true
(that's kind of the *point* of per-vma locking), but it's irrelevant.

It's true for *all* users of mmap_write_lock_killable, whether in fork
or anywhere else. What makes fork() so magically special?

It's why we have that vma_start_write(), to say "I'm now modifying
*this* vma, so stop accessing it in parallel".

Because no, flush_cache_dup_mm() is not the magical reason to do that thing.

Maybe there is something else going on, but no, we don't write crazy
code without a reason for it. That's completely unmaintainable,
because people will look at that code, not understand it (because
there is nothing to understand) and be afraid to touch it. For no
actual reason.

The obvious place to say "I'm now starting to modify the vma" is when
you actually start to modify the vma.

> Also, this change needs a couple more updates:

Those updates seem sane, and come with explanations of why they exist.
Looks fine to me.

Suren, please send me the proper fixes. Not the voodoo one. The ones
you can explain.

And if stable wants to do something else, then that's fine. But for
the development kernel,. we have two options:

 - fix the PER_VMA_LOCK code

 - decide that it's not worth it, and just revert it all

and honestly, I'm ok with that second option, simply because this has
all been way too much pain.

But no, we don't mark it broken thinking we can't deal with it, or do
random non-sensible code code we can't explain.

            Linus
