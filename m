Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E409940B43E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Sep 2021 18:11:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H87dG5wShz2yg3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Sep 2021 02:11:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=XIrYfLC8;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=ardb@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=XIrYfLC8; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H87cf5Dpgz2yHV
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Sep 2021 02:10:58 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6DDE661151
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Sep 2021 16:10:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631635856;
 bh=EG2I9oaRHQ+gf10Ljpq+PHD1qpxygSWw9ESK9c5OiTI=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=XIrYfLC8M1u8fqmn+EkYBkKiqzSzTO7EhMYSXJH82xQ02ADEiaOMHnSEH2Bp37Gn4
 I6kpkmbkiRSWbZdGan1zl7NTN4LATYpvHs2kJk2GQUUYoIK/WUeFC6wM3mJzLiP/N3
 P2AGwpufRp4H/QVU193YwkV5PYWtJlzAuyH6G2WI2MWMCbDJutN3zhL4XsJFWgGW8e
 OPp9tDBi88cUWRPe7QUbUd6MSCWw+Jylu/H4lSxC95EbbqJSS2JWs6+cuuBwyVM0Lf
 aPdzd6vCFX6OAHlkXWtXZNknZNNYDSO9RtCzqL//TbOcBAH5mYbJcxImTfKKTkl3yv
 bxJCfoHGV0FQg==
Received: by mail-ot1-f46.google.com with SMTP id
 x10-20020a056830408a00b004f26cead745so19205317ott.10
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Sep 2021 09:10:56 -0700 (PDT)
X-Gm-Message-State: AOAM533Q2SKrUNR+u2KfTGppjpTrgoMnu+3EYvd/4gFazdE7PsEX0rWd
 N1Jjd2kwWDnDJF54JIVfOz+0jib8gziAo6Wuc9w=
X-Google-Smtp-Source: ABdhPJy/NGgZ1IROAgHU5psXnjNt0DbcmbCt3vJiiC8iJFGuRSAXr6SftyZ8/TdDx/41hvt3tr6orITFhHtqOeCjlZU=
X-Received: by 2002:a9d:200b:: with SMTP id n11mr15316897ota.30.1631635845243; 
 Tue, 14 Sep 2021 09:10:45 -0700 (PDT)
MIME-Version: 1.0
References: <20210914121036.3975026-1-ardb@kernel.org>
 <20210914121036.3975026-6-ardb@kernel.org>
 <CAHk-=whLEofPLzzTKXN5etnH5WqsTPQRLVv8uQgHnx7c59omBg@mail.gmail.com>
 <CAMj1kXH_Q4a4Gsi0Xuw=YsV-b7Mu8TQndk3Ei-JFaRV=GSiqUQ@mail.gmail.com>
 <CAHk-=wiaVLChOjJ=7fdoQXKE4JHb98MjDtg8pPkA8EYfd5aj3g@mail.gmail.com>
In-Reply-To: <CAHk-=wiaVLChOjJ=7fdoQXKE4JHb98MjDtg8pPkA8EYfd5aj3g@mail.gmail.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Tue, 14 Sep 2021 18:10:33 +0200
X-Gmail-Original-Message-ID: <CAMj1kXHKn+RLQf1Nc_7Vs1qVoFZd6RL4=WX8AwoLst18i7n+LA@mail.gmail.com>
Message-ID: <CAMj1kXHKn+RLQf1Nc_7Vs1qVoFZd6RL4=WX8AwoLst18i7n+LA@mail.gmail.com>
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

On Tue, 14 Sept 2021 at 17:59, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Tue, Sep 14, 2021 at 8:53 AM Ard Biesheuvel <ardb@kernel.org> wrote:
> >
> > task_cpu() takes a 'const struct task_struct *', whereas
> > task_thread_info() takes a 'struct task_struct *'.
>
> Oh, annoying, but that's easily fixed. Just make that
>
>    static inline struct thread_info *task_thread_info(struct
> task_struct *task) ..
>
> be a simple
>
>   #define task_thread_info(tsk) (&(tsk)->thread_info)
>
> instead. That actually then matches the !THREAD_INFO_IN_TASK case anyway.
>
> Make the commit comment be about how that fixes the type problem.
>
> Because while in many cases inline functions are superior to macros,
> it clearly isn't the case in this case.
>

Works for me.
