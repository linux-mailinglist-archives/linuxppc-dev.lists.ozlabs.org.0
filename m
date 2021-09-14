Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1027340B406
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Sep 2021 18:00:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H87N35XC8z305J
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Sep 2021 02:00:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=bXLrDvRw;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=2a00:1450:4864:20::236;
 helo=mail-lj1-x236.google.com; envelope-from=torvalds@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org
 header.a=rsa-sha256 header.s=google header.b=bXLrDvRw; 
 dkim-atps=neutral
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H87MQ1kF8z2xxn
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Sep 2021 01:59:28 +1000 (AEST)
Received: by mail-lj1-x236.google.com with SMTP id f2so24847626ljn.1
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Sep 2021 08:59:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XpWi4volfcYSm2oFWphGxI70Xoc4gQDszmXfggbAPag=;
 b=bXLrDvRwiE9LUrsUdTaOb8qv3MpstEI39Z126QnyB2PTkNIRA+z5Ylw/tbECp2MHmV
 gX1JHV2JOFK1e1MJCTTlwV1kibUe3fFGD3LyBUKt18UoGfT0okDbQ+10t1fJme/j5P5U
 D2vgNrnv1RgcRafeCGUDJ8RsTcI/ITO4E3K7Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XpWi4volfcYSm2oFWphGxI70Xoc4gQDszmXfggbAPag=;
 b=6nOPHNfgiMdiTi0B2K3aZrXIMHr9ybQz+d7gADdSSEbzf8+JcJe6n/V5qeMBqZEV5K
 AKY7y/6tlL5Suh9sNLfhVCYGGY41av+bv5XWOaneDIv/Bwl8sZXTPylQg7l8pN409+1b
 eTm2ViZGTbotlq+Ozcy1+mV88py/E+2WD14pAAwKCWbqJrCpf+19HHuXNDhmUYjGAfKL
 4SSAD66FIGEuTnPyEbLCIhca7msDdD0NE4+f+IwiQSuvPwBDMLuZ8Tq2UKorfb38+lZw
 aqxY4fb/8b6sB1JpFd+jhe8LnYy5/TATgXUVub9KJWdb2qHZxc7pzsD02JMsxNazW+k7
 H6jA==
X-Gm-Message-State: AOAM531rq7o1L47hRvQ+T1M84KVZZhKb1DDTPyMrYSVEThdWnLoU9rVu
 rzVfy5nu+J66azRAB41SpEMdIsRo4qp8eKWdCuk=
X-Google-Smtp-Source: ABdhPJw/qsG4reje+RXXyWydLZHAIRH/xx9oJK7KufmhCYCq0X+s6dlQDxWJfAKtmNUi/KalPriKmg==
X-Received: by 2002:a05:651c:3dd:: with SMTP id
 f29mr16359738ljp.69.1631635165038; 
 Tue, 14 Sep 2021 08:59:25 -0700 (PDT)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com.
 [209.85.208.175])
 by smtp.gmail.com with ESMTPSA id r2sm1386658ljj.14.2021.09.14.08.59.24
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Sep 2021 08:59:24 -0700 (PDT)
Received: by mail-lj1-f175.google.com with SMTP id w4so24797281ljh.13
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Sep 2021 08:59:24 -0700 (PDT)
X-Received: by 2002:a2e:8107:: with SMTP id d7mr16501365ljg.68.1631635154125; 
 Tue, 14 Sep 2021 08:59:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210914121036.3975026-1-ardb@kernel.org>
 <20210914121036.3975026-6-ardb@kernel.org>
 <CAHk-=whLEofPLzzTKXN5etnH5WqsTPQRLVv8uQgHnx7c59omBg@mail.gmail.com>
 <CAMj1kXH_Q4a4Gsi0Xuw=YsV-b7Mu8TQndk3Ei-JFaRV=GSiqUQ@mail.gmail.com>
In-Reply-To: <CAMj1kXH_Q4a4Gsi0Xuw=YsV-b7Mu8TQndk3Ei-JFaRV=GSiqUQ@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 14 Sep 2021 08:58:58 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiaVLChOjJ=7fdoQXKE4JHb98MjDtg8pPkA8EYfd5aj3g@mail.gmail.com>
Message-ID: <CAHk-=wiaVLChOjJ=7fdoQXKE4JHb98MjDtg8pPkA8EYfd5aj3g@mail.gmail.com>
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

On Tue, Sep 14, 2021 at 8:53 AM Ard Biesheuvel <ardb@kernel.org> wrote:
>
> task_cpu() takes a 'const struct task_struct *', whereas
> task_thread_info() takes a 'struct task_struct *'.

Oh, annoying, but that's easily fixed. Just make that

   static inline struct thread_info *task_thread_info(struct
task_struct *task) ..

be a simple

  #define task_thread_info(tsk) (&(tsk)->thread_info)

instead. That actually then matches the !THREAD_INFO_IN_TASK case anyway.

Make the commit comment be about how that fixes the type problem.

Because while in many cases inline functions are superior to macros,
it clearly isn't the case in this case.

              Linus
