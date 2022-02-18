Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D98D4BB4C8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Feb 2022 10:01:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K0QfY4fzHz3cV9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Feb 2022 20:01:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.217.48; helo=mail-vs1-f48.google.com;
 envelope-from=geert.uytterhoeven@gmail.com; receiver=<UNKNOWN>)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com
 [209.85.217.48])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K0Qf80Q15z3cJm
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Feb 2022 20:01:03 +1100 (AEDT)
Received: by mail-vs1-f48.google.com with SMTP id e5so9160601vsg.12
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Feb 2022 01:01:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1nYL/qjPVlkIqK+5dnbJ/5QVdVKG9AQSDTVmJuSTxwE=;
 b=bzbd/xkhU7FiXbsSFsFwBX/G5ifcKQZ+17z1JRrsG3g80fzXEzMwq+ilfdUyAMLCPC
 BOYKNiAsKlAU0bJNFXw4Xixkq00gaKcYauNEx7IUJwSH2JDvhx0xfx+VLLOPvj8NsQd0
 jRcG6L4ike37BFWMigBU/XiDzLZWasmzIXPnHDKcZAmRPn/AfXXEK68fqMdCq/Hm69Tp
 IWaDf2UP1ITZYLS6V7fyAs6jWcj779JuhzKWo8yLcmU/eYKYq5Kqvhi6cGHMoGYrz0wd
 XnbUE8j5/hqGMkpQHFI9G8QrCK7rQ3P7oTA52hyPU7QNNwzsVfbXFgAUPz25M5RKzBxo
 ASmA==
X-Gm-Message-State: AOAM532wf2GIFcQF+xuH+crFJInBx7Nc6O2fnGbYJMhMpFyBHJj4bbHM
 hCrO8ao0ZFaNAWItMCDHuQlL7lqmaF+3nw==
X-Google-Smtp-Source: ABdhPJwaL7EFbRoBWDxHoDeFa4i6SmB+xwDPG3JF4tuZBdmz2U0HtZCdcaE/L+mhDjzK2qh4porxaw==
X-Received: by 2002:a67:d582:0:b0:31c:e6c:6f81 with SMTP id
 m2-20020a67d582000000b0031c0e6c6f81mr256793vsj.0.1645174861361; 
 Fri, 18 Feb 2022 01:01:01 -0800 (PST)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com.
 [209.85.217.50])
 by smtp.gmail.com with ESMTPSA id w15sm4604013uam.13.2022.02.18.01.01.01
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Feb 2022 01:01:01 -0800 (PST)
Received: by mail-vs1-f50.google.com with SMTP id e26so9218161vso.3
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Feb 2022 01:01:01 -0800 (PST)
X-Received: by 2002:a67:e113:0:b0:30e:303d:d1d6 with SMTP id
 d19-20020a67e113000000b0030e303dd1d6mr3151546vsl.38.1645174850220; Fri, 18
 Feb 2022 01:00:50 -0800 (PST)
MIME-Version: 1.0
References: <20220216131332.1489939-1-arnd@kernel.org>
 <20220216131332.1489939-11-arnd@kernel.org>
In-Reply-To: <20220216131332.1489939-11-arnd@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 18 Feb 2022 10:00:39 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWMhP5WgZ7CvOz53SyfizaAvLkHbeuds8G+_nZkwzhWWw@mail.gmail.com>
Message-ID: <CAMuHMdWMhP5WgZ7CvOz53SyfizaAvLkHbeuds8G+_nZkwzhWWw@mail.gmail.com>
Subject: Re: [PATCH v2 10/18] m68k: fix access_ok for coldfire
To: Arnd Bergmann <arnd@kernel.org>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Rich Felker <dalias@libc.org>,
 "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
 Linux-sh list <linux-sh@vger.kernel.org>,
 Peter Zijlstra <peterz@infradead.org>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 Linux MM <linux-mm@kvack.org>, Guo Ren <guoren@kernel.org>,
 sparclinux <sparclinux@vger.kernel.org>,
 "open list:QUALCOMM HEXAGON..." <linux-hexagon@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, Will Deacon <will@kernel.org>,
 Christoph Hellwig <hch@lst.de>, Linux-Arch <linux-arch@vger.kernel.org>,
 linux-s390 <linux-s390@vger.kernel.org>, Brian Cain <bcain@codeaurora.org>,
 Helge Deller <deller@gmx.de>, the arch/x86 maintainers <x86@kernel.org>,
 Russell King <linux@armlinux.org.uk>, linux-csky@vger.kernel.org,
 Ard Biesheuvel <ardb@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 arcml <linux-snps-arc@lists.infradead.org>,
 "open list:TENSILICA XTENSA PORT \(xtensa\)" <linux-xtensa@linux-xtensa.org>,
 Arnd Bergmann <arnd@arndb.de>, Heiko Carstens <hca@linux.ibm.com>,
 alpha <linux-alpha@vger.kernel.org>, linux-um <linux-um@lists.infradead.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 linux-m68k <linux-m68k@lists.linux-m68k.org>,
 Openrisc <openrisc@lists.librecores.org>, Al Viro <viro@zeniv.linux.org.uk>,
 Stafford Horne <shorne@gmail.com>, Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Parisc List <linux-parisc@vger.kernel.org>, Nick Hu <nickhu@andestech.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Linux API <linux-api@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Dinh Nguyen <dinguyen@kernel.org>, "Eric W. Biederman" <ebiederm@xmission.com>,
 Richard Weinberger <richard@nod.at>, Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 "David S. Miller" <davem@davemloft.net>, Greentime Hu <green.hu@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Arnd,

On Wed, Feb 16, 2022 at 2:17 PM Arnd Bergmann <arnd@kernel.org> wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>
> While most m68k platforms use separate address spaces for user
> and kernel space, at least coldfire does not, and the other
> ones have a TASK_SIZE that is less than the entire 4GB address
> range.
>
> Using the default implementation of __access_ok() stops coldfire
> user space from trivially accessing kernel memory.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Thanks for your patch!

> --- a/arch/m68k/include/asm/uaccess.h
> +++ b/arch/m68k/include/asm/uaccess.h
> @@ -12,14 +12,21 @@
>  #include <asm/extable.h>
>
>  /* We let the MMU do all checking */
> -static inline int access_ok(const void __user *addr,
> +static inline int access_ok(const void __user *ptr,
>                             unsigned long size)
>  {
> +       unsigned long limit = TASK_SIZE;
> +       unsigned long addr = (unsigned long)ptr;
> +
>         /*
>          * XXX: for !CONFIG_CPU_HAS_ADDRESS_SPACES this really needs to check
>          * for TASK_SIZE!
> +        * Removing this helper is probably sufficient.
>          */

Shouldn't the above comment block be removed completely,
as this is now implemented below?

> -       return 1;
> +       if (IS_ENABLED(CONFIG_CPU_HAS_ADDRESS_SPACES))
> +               return 1;
> +
> +       return (size <= limit) && (addr <= (limit - size));
>  }

Any pesky compilers that warn (or worse with -Werror) about
"condition always true" for TASK_SIZE = 0xFFFFFFFFUL?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
