Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 10F074B9B8B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Feb 2022 09:55:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JzpYc1r01z3cWS
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Feb 2022 19:55:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=arndb.de
 (client-ip=217.72.192.74; helo=mout.kundenserver.de;
 envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JzpY74nnzz3bT6
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Feb 2022 19:54:34 +1100 (AEDT)
Received: from mail-ej1-f47.google.com ([209.85.218.47]) by
 mrelayeu.kundenserver.de (mreue107 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1M4rD7-1nJF6w0XQt-001xhq for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Feb
 2022 09:54:29 +0100
Received: by mail-ej1-f47.google.com with SMTP id k25so5489807ejp.5
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Feb 2022 00:54:28 -0800 (PST)
X-Gm-Message-State: AOAM532kEEJQVX4goqmDK5D+4ScBgivQf3m1Y6+vdnoxADQJIFLmi0jf
 fcxfoB8wFxs0toHgvnOrmglsVb9DxAnMVxTWkQE=
X-Google-Smtp-Source: ABdhPJwQLFNR2EKsG8wmZOAHPh9E9pyoICR3LxZT862dIjr2W4W3Sw6yF+ayzR5i5e/QGR8IN4+3KhdYVHoGFF4fNyc=
X-Received: by 2002:adf:ea01:0:b0:1e4:b3e6:1f52 with SMTP id
 q1-20020adfea01000000b001e4b3e61f52mr1268592wrm.317.1645084364936; Wed, 16
 Feb 2022 23:52:44 -0800 (PST)
MIME-Version: 1.0
References: <20220216131332.1489939-1-arnd@kernel.org>
 <20220216131332.1489939-14-arnd@kernel.org>
In-Reply-To: <20220216131332.1489939-14-arnd@kernel.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 17 Feb 2022 08:52:29 +0100
X-Gmail-Original-Message-ID: <CAK8P3a2T1Xr80GeM-3p1riyq=gKDJGeKVz_c5=r5=s14tXimLw@mail.gmail.com>
Message-ID: <CAK8P3a2T1Xr80GeM-3p1riyq=gKDJGeKVz_c5=r5=s14tXimLw@mail.gmail.com>
Subject: Re: [PATCH v2 13/18] uaccess: generalize access_ok()
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Christoph Hellwig <hch@lst.de>, 
 linux-arch <linux-arch@vger.kernel.org>, Linux-MM <linux-mm@kvack.org>, 
 Linux API <linux-api@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Al Viro <viro@zeniv.linux.org.uk>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:E/0I6ceQaczczzKo2fcjAQsINmF/SAmOkos1BnCsJYlqxqQzZuz
 +fOtQe34HVwC1dykxSiPsSVqXEOgdBPc0E33OpCD1iiCNWkHTAnPih1eL7LCoHPPGi7cIZk
 ye+repAzp3d1ScvD+iZWZJBg897VeXehcztWivSd9kqsV8ZdWhaVRgq/SwUujAHZz1C0lKV
 pmbgzvYAi/sasjCIaul+Q==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:x0bT95hQDME=:hzCcSij47f+0zHorkwURVK
 ZLiuVCLfF5ymfnWcWga6/p3YoJEn/bemsVFHCVg1pD7Ae1uk9qY8Tf3uwzS+x4y8YI77Ac0st
 vsT2fhBsVKeO8ifVqHESNjSpEwnKBXmH/WMlelmY6KYTMIRQTD0mjKuy43kjo+49mCsBLxc58
 eiOY6Lt4sOEVmFIKd7vzZco9UYCOtutMxsKG1ZWmnF1pfnW7n1XJp1Or/94Z3Tt0Ff/5oabK4
 ucW5X+cYtO1D/d1A8pgcbSQ9lQCZ7adL5eujioLKr0RhmwsntAPLcCl+nsAJR2PjHLpQjF92P
 ZZECbv37TeII2Pig2mxUvdA8ORVZxhZUNZ/9wJs5i+OBtNLBhcI9XZRhcqQsFL0T9B44zyxgd
 qvaDLctkbQuPHPXJ9vaaRKyr+GbwO3VqVzzlwR0k0oq3tdO9qbK5E+0W7L3J8Z1Lgoz0gONsQ
 eEpHY6S4ub/waYbHH4kSbERfTn1lNyAqD63r6pAMpezc24pUMQ0dSkIsf4Ty22kMTTrHCV7MV
 W+cB4rQPPmb0tI1JWP68kQylVoZ5PZMJpXAQncwiqgUUG66QsJthwcThvoIGkZv+//iIaTQLi
 khKXOyZuvz40RpwQ2w0GoOqM+dhv6B7kdRKY+g2//H+nL7fMX90DF+rGiKbFoZ0v3iHi7lYii
 jYkJ5ZPIkg9TOPsRVlTTo8Par/Smo3Aop8ii920yEEE88DMrW1ua1UO1qy1rlr5doh26pPpw1
 TLJjKwMS6ZavgwGFgpVWMcVyJI4KppshOdGQG00gToXp1OgUZm/vaPbSXtGsICF98pBr+GgBi
 qZq2YdorCgD8oGa4vpFydLLXx2tW0XobOqPnscTSYfLIwB9FoM=
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
 linux-ia64@vger.kernel.org, Linux-sh list <linux-sh@vger.kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, Max Filippov <jcmvbkbc@gmail.com>,
 Guo Ren <guoren@kernel.org>, sparclinux <sparclinux@vger.kernel.org>,
 "open list:QUALCOMM HEXAGON..." <linux-hexagon@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, Will Deacon <will@kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>, linux-s390 <linux-s390@vger.kernel.org>,
 Brian Cain <bcain@codeaurora.org>, Helge Deller <deller@gmx.de>,
 the arch/x86 maintainers <x86@kernel.org>,
 Russell King - ARM Linux <linux@armlinux.org.uk>, linux-csky@vger.kernel.org,
 Ingo Molnar <mingo@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 "open list:SYNOPSYS ARC ARCHITECTURE" <linux-snps-arc@lists.infradead.org>,
 "open list:TENSILICA XTENSA PORT \(xtensa\)" <linux-xtensa@linux-xtensa.org>,
 Heiko Carstens <hca@linux.ibm.com>, alpha <linux-alpha@vger.kernel.org>,
 linux-um <linux-um@lists.infradead.org>,
 linux-m68k <linux-m68k@lists.linux-m68k.org>,
 Openrisc <openrisc@lists.librecores.org>, Greentime Hu <green.hu@gmail.com>,
 Stafford Horne <shorne@gmail.com>, Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Parisc List <linux-parisc@vger.kernel.org>, Nick Hu <nickhu@andestech.com>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 Dinh Nguyen <dinguyen@kernel.org>,
 "Eric W . Biederman" <ebiederm@xmission.com>,
 Richard Weinberger <richard@nod.at>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 David Miller <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Feb 16, 2022 at 2:13 PM Arnd Bergmann <arnd@kernel.org> wrote:

> + * limit and catch all possible overflows.
> + * On architectures with separate user address space (m68k, s390, parisc,
> + * sparc64) or those without an MMU, this should always return true.
...
> +static inline int __access_ok(const void __user *ptr, unsigned long size)
> +{
> +       unsigned long limit = user_addr_max();
> +       unsigned long addr = (unsigned long)ptr;
> +
> +       if (IS_ENABLED(CONFIG_ALTERNATE_USER_ADDRESS_SPACE))
> +               return true;

I noticed that I'm missing the check for !CONFIG_MMU here, despite
mentioning that in the comment above it. I've added it now.

        Arnd
