Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C1EEE704282
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 May 2023 02:54:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QKyRw4dwpz3f7Z
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 May 2023 10:54:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=orcam.me.uk (client-ip=78.133.224.34; helo=angie.orcam.me.uk; envelope-from=macro@orcam.me.uk; receiver=<UNKNOWN>)
X-Greylist: delayed 100773 seconds by postgrey-1.36 at boromir; Tue, 16 May 2023 10:53:52 AEST
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QKyRN6xd9z3c71
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 May 2023 10:53:50 +1000 (AEST)
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 9D7EE92009C; Tue, 16 May 2023 02:53:45 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 9709492009B;
	Tue, 16 May 2023 01:53:45 +0100 (BST)
Date: Tue, 16 May 2023 01:53:45 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: Re: [PATCH v5 14/26] alpha: Remove empty <uapi/asm/setup.h>
In-Reply-To: <20230306100508.1171812-15-alexghiti@rivosinc.com>
Message-ID: <alpine.DEB.2.21.2305160147100.11892@angie.orcam.me.uk>
References: <20230306100508.1171812-1-alexghiti@rivosinc.com> <20230306100508.1171812-15-alexghiti@rivosinc.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: Rich Felker <dalias@libc.org>, linux-ia64@vger.kernel.org, linux-doc@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, Palmer Dabbelt <palmer@rivosinc.com>, linux-mips@vger.kernel.org, "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>, Max Filippov <jcmvbkbc@gmail.com>, "H . Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org, WANG Xuerui <kernel@xen0n.name>, Will Deacon <will@kernel.org>, Alexander Gordeev <agordeev@linux.ibm.com>, linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, linux-snps-arc@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>, Yoshinori Sato <ysato@users.sourceforge.jp>, Jonathan Corbet <corbet@lwn.net>, linux-sh@vger.kernel.org, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, Russell King <linux@armlinux.org.uk>, Ingo Molnar <mingo@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Vineet Gupta <vgupta@kernel.org>, Matt Turner <mattst88@gma
 il.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, linux-xtensa@linux-xtensa.org, Albert Ou <aou@eecs.berkeley.edu>, Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, Richard Henderson <richard.henderson@linaro.org>, Nicholas Piggin <npiggin@gmail.com>, linux-m68k@lists.linux-m68k.org, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, loongarch@lists.linux.dev, Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, Chris Zankel <chris@zankel.net>, Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, Greg KH <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>, Sven Schnelle <svens@linux.ibm.com>, linux-alpha@vger.kernel.org, Borislav Petkov <bp@alien8.de>, linuxppc-dev@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 6 Mar 2023, Alexandre Ghiti wrote:

> diff --git a/arch/alpha/include/uapi/asm/setup.h b/arch/alpha/include/uapi/asm/setup.h
> deleted file mode 100644
> index 9b3b5ba39b1d..000000000000
> --- a/arch/alpha/include/uapi/asm/setup.h
> +++ /dev/null
> @@ -1,5 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
> -#ifndef _UAPI__ALPHA_SETUP_H
> -#define _UAPI__ALPHA_SETUP_H
> -
> -#endif /* _UAPI__ALPHA_SETUP_H */

 You can't just remove a UAPI header like this, something will break; cf. 
arch/arc/include/uapi/asm/setup.h, or arch/x86/include/uapi/asm/setup.h if 
you want it brief.

 I suggest that you fold it into 01/26 (it makes no sense to have empty 
multiple inclusion protection), and likewise for the relevant remaining 
headers.

  Maciej
