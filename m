Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 30D9240B409
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Sep 2021 18:01:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H87F05yfBz2ybB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Sep 2021 01:53:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=kr18PPZp;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=ardb@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=kr18PPZp; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H87DM5qD0z2yJh
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Sep 2021 01:53:23 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id B264460F11
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Sep 2021 15:53:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631634801;
 bh=SyILGKt3RsxWQZLKn6wlRw/UVoEX8mvp4miVI+z/vYo=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=kr18PPZpXsMdsQPT0HfQKft0E75vzXmhrldkFKd3PhPjFx0/GLNfxW9jgdQSQsa4v
 zViuZ3v17JtM352fw1FwXJYgxDbkGvzXIdYW54BZFmaXJOGFP58m682PGaKd7TqKCj
 9IEnpE1kdKBngNEXmS8ovu2ikvN5u5KVNAoDlKKo4+0xt0b/znmTzHNvE/kYVGNbod
 E2vUEgsSrmvTj3dVol7gzZ4SXDKwq2y5/lMABg1NaoH/h/qFywdFitAf3ZnJWnEX5J
 9jh02qpQ5URODBOQaBwbxoxKiXUTBoHxiyHLSiVDgYoR6ZGAUhqsbZ2xMtN3nkAqPr
 XNgvWCbX0rMDA==
Received: by mail-ot1-f48.google.com with SMTP id
 l7-20020a0568302b0700b0051c0181deebso19090714otv.12
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Sep 2021 08:53:21 -0700 (PDT)
X-Gm-Message-State: AOAM533m+D98BNu76nC2rS3XTYeGzTQ7OvFSZWVdc36oAUcLRamtxRMj
 0ZThVfXkV2rRZ4NGiIFQF9Lkbf1hHSN5geJxM8o=
X-Google-Smtp-Source: ABdhPJyDFc9VSO5h/RiqccbxZgmZOWSklBB73HxlIVY43T/ttJWTuXgDpoHxXQAJINO0RmpPM1mGY0nlklwutQHfE4k=
X-Received: by 2002:a4a:c904:: with SMTP id v4mr14629736ooq.26.1631634790945; 
 Tue, 14 Sep 2021 08:53:10 -0700 (PDT)
MIME-Version: 1.0
References: <20210914121036.3975026-1-ardb@kernel.org>
 <20210914121036.3975026-6-ardb@kernel.org>
 <CAHk-=whLEofPLzzTKXN5etnH5WqsTPQRLVv8uQgHnx7c59omBg@mail.gmail.com>
In-Reply-To: <CAHk-=whLEofPLzzTKXN5etnH5WqsTPQRLVv8uQgHnx7c59omBg@mail.gmail.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Tue, 14 Sep 2021 17:52:59 +0200
X-Gmail-Original-Message-ID: <CAMj1kXH_Q4a4Gsi0Xuw=YsV-b7Mu8TQndk3Ei-JFaRV=GSiqUQ@mail.gmail.com>
Message-ID: <CAMj1kXH_Q4a4Gsi0Xuw=YsV-b7Mu8TQndk3Ei-JFaRV=GSiqUQ@mail.gmail.com>
Subject: Re: [RFC PATCH 5/8] sched: move CPU field back into thread_info if
 THREAD_INFO_IN_TASK=y
To: Linus Torvalds <torvalds@linux-foundation.org>
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
Cc: Peter Zijlstra <peterz@infradead.org>, Paul Mackerras <paulus@samba.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, Will Deacon <will@kernel.org>,
 linux-s390 <linux-s390@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Russell King <linux@armlinux.org.uk>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Kees Cook <keescook@chromium.org>, Vasily Gorbik <gor@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, Keith Packard <keithpac@amazon.com>,
 Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 14 Sept 2021 at 17:49, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Tue, Sep 14, 2021 at 5:11 AM Ard Biesheuvel <ardb@kernel.org> wrote:
> >
> >  static inline unsigned int task_cpu(const struct task_struct *p)
> >  {
> >  #ifdef CONFIG_THREAD_INFO_IN_TASK
> > -       return READ_ONCE(p->cpu);
> > +       return READ_ONCE(p->thread_info.cpu);
> >  #else
> >         return READ_ONCE(task_thread_info(p)->cpu);
> >  #endif
>
> Those two lines look different, but aren't.
>
> Please just remove the CONFIG_THREAD_INFO_IN_TASK conditional, and use
>
>           return READ_ONCE(task_thread_info(p)->cpu);
>
> unconditionally, which now does the right thing regardless.
>

Unfortunately not.

task_cpu() takes a 'const struct task_struct *', whereas
task_thread_info() takes a 'struct task_struct *'.

Since task_thread_info()-><foo> is widely used as an lvalue, I would
need to update task_cpu()'s prototype and fix up all the callers, some
of which take the const flavor themselves. Or introduce
'const_task_thread_info()' which takes the const flavor, and cannot be
used to instantiate lvalues.

Suggestions welcome, but this is the cleanest I could come up with.
