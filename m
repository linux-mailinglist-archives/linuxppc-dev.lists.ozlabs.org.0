Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C8EA40B371
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Sep 2021 17:48:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H876G5q5Cz2yNS
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Sep 2021 01:48:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=R7AKqlIg;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=2a00:1450:4864:20::135;
 helo=mail-lf1-x135.google.com; envelope-from=torvalds@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org
 header.a=rsa-sha256 header.s=google header.b=R7AKqlIg; 
 dkim-atps=neutral
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H875W62Fvz2yHH
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Sep 2021 01:47:25 +1000 (AEST)
Received: by mail-lf1-x135.google.com with SMTP id y28so5561420lfb.0
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Sep 2021 08:47:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AuGH7A1j3mwghnSNlt7ii3pSP3zqhI3ZLfhyE1/i7mY=;
 b=R7AKqlIgzHsNi6Tq6c2IwOarByE0iXqz4YlcYfOLGqwYPfSWeFNr9LdrOHY0sHRCu8
 naDWlgwpYmTs3LAeSJhTpybHunXV2G0Zr6u1AYtP8z+sHgAVUF85Ux4F5km4EfIbfx7r
 jZuWndb2Alk2aESrYA3wH6fpzGqN1esmqt/VE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AuGH7A1j3mwghnSNlt7ii3pSP3zqhI3ZLfhyE1/i7mY=;
 b=6ww2tytm1d9xPRrQIld5AmaMyEmYbtqI8jjG89jsJr7wm94PF5Xe264cQKf2hog8U1
 6xD9kTBMYEYjaLJ0cC4W7FCBJiqUYgKuT01T9FUSMZh9kJKawpQzSUZOSbsps+4QyXCA
 KQo0W89AH6U3zZN2cfk3lcJuzR3gO35Ty9b06ZH9uz1QYPJ+kXS+CmBApmVRj55B9pry
 J93VuwYiaee5atNaIQPclao+YefzuJF0rIlZphompdrkW+4r1cKugFNE2MWCzAVfH6Np
 EqSHZheipBwM4KMRMgc8v6L8rXr6gDyKT2iTMUbsr0HKDxAqp+z3tIXgmLjarUSDQnkB
 mIvw==
X-Gm-Message-State: AOAM533alKD4z5oCF1ODD1B4BijdUiC1TsQGt8+yCCB/wUg3Zvb8ZhJ/
 ZLMRb4J3gLGfJBrkbtEuD5/dHebXlD8uwfJds/c=
X-Google-Smtp-Source: ABdhPJxf4L+ZVvnn8LGDbBQZDw6pAGvEhMceobeDxNw26lYnuCt4EjXqyKODpBHwErkOqRSn6VxRBg==
X-Received: by 2002:a05:6512:10c6:: with SMTP id
 k6mr13278881lfg.327.1631634441390; 
 Tue, 14 Sep 2021 08:47:21 -0700 (PDT)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com.
 [209.85.208.170])
 by smtp.gmail.com with ESMTPSA id c20sm1147142lfb.29.2021.09.14.08.47.20
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Sep 2021 08:47:21 -0700 (PDT)
Received: by mail-lj1-f170.google.com with SMTP id s3so24752270ljp.11
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Sep 2021 08:47:20 -0700 (PDT)
X-Received: by 2002:a2e:8185:: with SMTP id e5mr15545178ljg.31.1631634430421; 
 Tue, 14 Sep 2021 08:47:10 -0700 (PDT)
MIME-Version: 1.0
References: <20210914121036.3975026-1-ardb@kernel.org>
 <20210914121036.3975026-6-ardb@kernel.org>
In-Reply-To: <20210914121036.3975026-6-ardb@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 14 Sep 2021 08:46:54 -0700
X-Gmail-Original-Message-ID: <CAHk-=whLEofPLzzTKXN5etnH5WqsTPQRLVv8uQgHnx7c59omBg@mail.gmail.com>
Message-ID: <CAHk-=whLEofPLzzTKXN5etnH5WqsTPQRLVv8uQgHnx7c59omBg@mail.gmail.com>
Subject: Re: [RFC PATCH 5/8] sched: move CPU field back into thread_info if
 THREAD_INFO_IN_TASK=y
To: Ard Biesheuvel <ardb@kernel.org>
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

On Tue, Sep 14, 2021 at 5:11 AM Ard Biesheuvel <ardb@kernel.org> wrote:
>
>  static inline unsigned int task_cpu(const struct task_struct *p)
>  {
>  #ifdef CONFIG_THREAD_INFO_IN_TASK
> -       return READ_ONCE(p->cpu);
> +       return READ_ONCE(p->thread_info.cpu);
>  #else
>         return READ_ONCE(task_thread_info(p)->cpu);
>  #endif

Those two lines look different, but aren't.

Please just remove the CONFIG_THREAD_INFO_IN_TASK conditional, and use

          return READ_ONCE(task_thread_info(p)->cpu);

unconditionally, which now does the right thing regardless.

             Linus
