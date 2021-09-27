Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C48D419782
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Sep 2021 17:13:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HJ5ks3t9Qz3bjM
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Sep 2021 01:13:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=kWuv8iV+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=ardb@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=kWuv8iV+; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HJ5jv3Mgtz2yg8
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Sep 2021 01:13:07 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3297F6108E
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Sep 2021 15:13:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632755585;
 bh=CKBeZqx1JroYNLrGq5H114mf1zFlMql7osjtvpITDCw=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=kWuv8iV+xytSwvyJ+WE7p4vZhlegf2K8K6wn11gaiRgiTqo86KkSu/HQc8WKXOYyp
 XOqIbD5SuJS5t7c5OqGBeJWQ+wfSD2VZBZKkvfK6k6vwqnIYxzbAWEk7Yv+HZIpAVl
 Ruj0gfXJN/5D3SnqG1XltMIEn5qjJSOKZF4UE3cWFIqMzV/x/0N0WHFy1GkKwLytjY
 qOPf0WQa3GWZNDmxHeoNKEFIEpKv1HIc1dbdNVTczTdAgfpeDAd7McPoUYytBNRhWt
 YIHXHQRJ58gNh9f1Kam2bK02typDuHssjytfmwZifwxTvvuBmLX6uQBGgXqT7l9DLe
 6QntdJIkMA4mw==
Received: by mail-oi1-f172.google.com with SMTP id e24so16085004oig.11
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Sep 2021 08:13:05 -0700 (PDT)
X-Gm-Message-State: AOAM530XZl6+NyTo8pnz/W/HFpzDX9sGgf56N/Shh3MbEniVC9U3h7J9
 BuJGuegUP2nlewU4+eW8qywK9mY7rpzfYzSma1k=
X-Google-Smtp-Source: ABdhPJyeC8BgibE5zzxbqU0l8Tut8FIpgncaCT3Q0Qb4RyOfhbEhCIFLxw2ikpv+mDHPe9VMwWn8YxftPxI0HPTWIJ0=
X-Received: by 2002:aca:32c2:: with SMTP id y185mr501704oiy.47.1632755574136; 
 Mon, 27 Sep 2021 08:12:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210914121036.3975026-1-ardb@kernel.org>
 <20210914121036.3975026-5-ardb@kernel.org>
In-Reply-To: <20210914121036.3975026-5-ardb@kernel.org>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Mon, 27 Sep 2021 17:12:43 +0200
X-Gmail-Original-Message-ID: <CAMj1kXEojbQbNzCP39KT4EzFAyW3J1Tfm_stCZ+fGo8_SO90PA@mail.gmail.com>
Message-ID: <CAMj1kXEojbQbNzCP39KT4EzFAyW3J1Tfm_stCZ+fGo8_SO90PA@mail.gmail.com>
Subject: Re: [RFC PATCH 4/8] powerpc: add CPU field to struct thread_info
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Michael Ellerman <mpe@ellerman.id.au>
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
Cc: Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Paul Mackerras <paulus@samba.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, Will Deacon <will@kernel.org>,
 "open list:S390" <linux-s390@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Russell King <linux@armlinux.org.uk>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Kees Cook <keescook@chromium.org>,
 Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 Keith Packard <keithpac@amazon.com>, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 "open list:LINUX FOR POWERPC \(32-BIT AND 64-BIT\)"
 <linuxppc-dev@lists.ozlabs.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Linus Torvalds <torvalds@linux-foundation.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 14 Sept 2021 at 14:11, Ard Biesheuvel <ardb@kernel.org> wrote:
>
> The CPU field will be moved back into thread_info even when
> THREAD_INFO_IN_TASK is enabled, so add it back to powerpc's definition
> of struct thread_info.
>
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>

Michael,

Do you have any objections or issues with this patch or the subsequent
ones cleaning up the task CPU kludge for ppc32? Christophe indicated
that he was happy with it.

Thanks,
Ard.


> ---
>  arch/powerpc/include/asm/thread_info.h | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/arch/powerpc/include/asm/thread_info.h b/arch/powerpc/include/asm/thread_info.h
> index b4ec6c7dd72e..5725029aaa29 100644
> --- a/arch/powerpc/include/asm/thread_info.h
> +++ b/arch/powerpc/include/asm/thread_info.h
> @@ -47,6 +47,9 @@
>  struct thread_info {
>         int             preempt_count;          /* 0 => preemptable,
>                                                    <0 => BUG */
> +#ifdef CONFIG_SMP
> +       unsigned int    cpu;
> +#endif
>         unsigned long   local_flags;            /* private flags for thread */
>  #ifdef CONFIG_LIVEPATCH
>         unsigned long *livepatch_sp;
> --
> 2.30.2
>
