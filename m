Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 67210413327
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Sep 2021 14:07:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HDKtL1Rv4z2yb9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Sep 2021 22:07:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=N1e/+1EJ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=ardb@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=N1e/+1EJ; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HDKsh6wGxz2xXn
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Sep 2021 22:06:48 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id AF96960F43
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Sep 2021 12:06:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632226006;
 bh=qnWTodEwspkSMdWf5XON5Ep7daBqF5kbGbudj8UJ3BM=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=N1e/+1EJJsXKdHfalLr9TlFjFL/NACIZUBPeOwx03zMGBDN1bY3j0BKSiclyHte0J
 Y68HJVi5ioC3cxR2bQOYnxZTYwDJKAavbPEJzR+hdSdQDEMV1+4Z8XgpaztKI7jT/Q
 7WtMgE4u/t0us8CVMusI8qPPDSgdobEIf8UQE5cCSYnW4wG6tQwhGtcDiB/a9+NrKW
 iYtul/ubTaLL6mmo4QnpaAlqo2VBjXnpGUapqotTQVHgHgKaVB1CQuNKZahDEqx9g0
 PIICemrCzbqxGWLLuI3HwAfd8QwL0dagbHl5y5xIKCJfeCQIipno5PF1oWJNkjj3WI
 53Iw3q4mN4Hlw==
Received: by mail-oi1-f171.google.com with SMTP id u22so21092935oie.5
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Sep 2021 05:06:46 -0700 (PDT)
X-Gm-Message-State: AOAM531GaQL6z2Wg7iQb6TCyP0LmV9imqM9Pshg8E2YPtgP4OYFJFCfJ
 Tl+Q4tiug3VGUENOG2VvaxqApleBPoJBDWO9gAs=
X-Google-Smtp-Source: ABdhPJx1x7wQ2+Ve4iSZCDQmmYVEepXxo/5KRhWVQj/N//ixUTMX6irYoXDtuXoK84SNkd7MjELWyQDwt9BfbsPbMro=
X-Received: by 2002:a05:6808:1148:: with SMTP id
 u8mr1242229oiu.33.1632225995730; 
 Tue, 21 Sep 2021 05:06:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210914121036.3975026-1-ardb@kernel.org>
 <20210914135527.GC30247@C02TD0UTHF1T.local>
In-Reply-To: <20210914135527.GC30247@C02TD0UTHF1T.local>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Tue, 21 Sep 2021 14:06:24 +0200
X-Gmail-Original-Message-ID: <CAMj1kXGPcHwdSjy-doB09LBLvrXtqYT4dyxE5hU=D=2m8Fg8zg@mail.gmail.com>
Message-ID: <CAMj1kXGPcHwdSjy-doB09LBLvrXtqYT4dyxE5hU=D=2m8Fg8zg@mail.gmail.com>
Subject: Re: [RFC PATCH 0/8] Move task_struct::cpu back into thread_info
To: Mark Rutland <mark.rutland@arm.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Heiko Carstens <hca@linux.ibm.com>, Paul Mackerras <paulus@samba.org>,
 Borislav Petkov <bp@alien8.de>, 
 Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, 
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Ingo Molnar <mingo@redhat.com>
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
Cc: "open list:S390" <linux-s390@vger.kernel.org>,
 Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>,
 Catalin Marinas <catalin.marinas@arm.com>,
 "open list:LINUX FOR POWERPC \(32-BIT AND 64-BIT\)"
 <linuxppc-dev@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Russell King <linux@armlinux.org.uk>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Keith Packard <keithpac@amazon.com>, Andy Lutomirski <luto@kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, Will Deacon <will@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 14 Sept 2021 at 15:55, Mark Rutland <mark.rutland@arm.com> wrote:
>
> On Tue, Sep 14, 2021 at 02:10:28PM +0200, Ard Biesheuvel wrote:
> > Commit c65eacbe290b ("sched/core: Allow putting thread_info into
> > task_struct") mentions that, along with moving thread_info into
> > task_struct, the cpu field is moved out of the former into the latter,
> > but does not explain why.
>
> From what I recall of talking to Andy around that time, when converting
> arm64 over, the theory was that over time we'd move more and more out of
> thread_info and into task_struct or thread_struct, until task_struct
> supplanted thread_info entirely, and that all became generic.
>
> I think the key gain there was making things more *generic*, and there
> are other ways we could do that in future without moving more into
> task_struct (e.g. with a geenric thread_info and arch_thread_info inside
> that).
>
> With that in mind, and given the diffstat, I think this is worthwhile.
>
> FWIW, for the series:
>
> Acked-by: Mark Rutland <mark.rutland@arm.com>
>

Thanks.

Any comments on this from the various arch maintainers? Especially
power, as Christophe seems happy with this but there are 3 different
patches affecting power that need a maintainer ack.
