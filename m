Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 073B5575930
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Jul 2022 03:46:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LkZ2P5hB8z3cdl
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Jul 2022 11:46:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=qReu0qeW;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::535; helo=mail-ed1-x535.google.com; envelope-from=jcmvbkbc@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=qReu0qeW;
	dkim-atps=neutral
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LkZ1p6B3yz3c1W
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Jul 2022 11:45:33 +1000 (AEST)
Received: by mail-ed1-x535.google.com with SMTP id fd6so4557573edb.5
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Jul 2022 18:45:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sKJrgib6NlReGRP7CDPUE/smLyqBXa9C7wMlxNQsBTA=;
        b=qReu0qeW9uesDP35O40Ak1r8idK4O9CgbEfPz8c7sbqOOC4g19rgOwc7Y7Nf0cMJve
         VHwud/zZzm5annCADY978tvLQA29IgL5uKARrzb7nA7Kp/u9ohAHU/Uoc3laFfeyFv82
         3NvE6Fr+IPR9MFSUs+KYaXTLE4npBFJ2Vcj4F42Mz6qv3HaC4MCx+ag8MrpcmkWW+LoD
         A8pexKC8qY5puSe0QuRx1/diSs17MAvOjpvCEI7jRLHU+cirQYK6oQpe7bjOxKMCXwV4
         h3T37BG2LAfhfJKirkYm4c6biwPu6itaR0LZe1EIroqmoe0m+x1vrKsTKeSrtgYQAI2e
         A1DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sKJrgib6NlReGRP7CDPUE/smLyqBXa9C7wMlxNQsBTA=;
        b=HuFIJDIhbMssCphCO62QjpLDC93b7Ww3mWi69VE0Ismf7Crpc0cseDNC7o7dyrziDq
         9aRp7MDrEy7vAjBOQeyImCKoI7zXfFlb0atoXAPAvMU0lOXCYOionQ614DcCIc7+rADE
         L4GpN55bYYMAbfBLlrPZ85SAPNZSrQLDq8vn09EjCqODdBNJDkzOQ3lmjFFKiC2mYwcw
         WNNMTiIhpuxYQfQhO99ffzr1EjfUJzR/DPRpk9o4L0Wubuvt5XTT3v9UYxMoWUk41p5X
         k37qWweE85RRrLwS3WxmW6PgArxIfoihos6AVHoh/mt1edJyGtl/6qyc6sbbwc19LqOR
         tD8A==
X-Gm-Message-State: AJIora+yrDkoBRol8KPcD2PyQPI9tZz/2XwHgLmD3RnEYcfF3hlwD93E
	r3wu5nZ+pkPR1GvmhVGclTzdhePx2sgmw25O6lM=
X-Google-Smtp-Source: AGRyM1tepyPfDbQ4UhlRvunVyrzw1+yZr5IvnNlxW7Dt+XzNG9dCJyVfB1/RFmHMmXMFxtwby6G/IhCp+VsAA17XQ40=
X-Received: by 2002:a05:6402:2714:b0:43a:c8ff:e319 with SMTP id
 y20-20020a056402271400b0043ac8ffe319mr16158414edd.33.1657849526605; Thu, 14
 Jul 2022 18:45:26 -0700 (PDT)
MIME-Version: 1.0
References: <20220714214657.2402250-1-shorne@gmail.com> <20220714214657.2402250-2-shorne@gmail.com>
In-Reply-To: <20220714214657.2402250-2-shorne@gmail.com>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Thu, 14 Jul 2022 18:45:27 -0700
Message-ID: <CAMo8BfKkGRHiFq1vu1ZKkURkUqC+Ee7D42yuKrCeDF+578s9cw@mail.gmail.com>
Subject: Re: [RFC PATCH 1/2] asm-generic: Remove pci.h copying code out to architectures
To: Stafford Horne <shorne@gmail.com>
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
Cc: "open list:IA64 \(Itanium\) PL..." <linux-ia64@vger.kernel.org>, Matthew Rosato <mjrosato@linux.ibm.com>, Dave Hansen <dave.hansen@linux.intel.com>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, Paul Mackerras <paulus@samba.org>, "H. Peter Anvin" <hpa@zytor.com>, "open list:SPARC + UltraSPAR..." <sparclinux@vger.kernel.org>, Alexander Gordeev <agordeev@linux.ibm.com>, linux-riscv <linux-riscv@lists.infradead.org>, Linux-Arch <linux-arch@vger.kernel.org>, linux-s390 <linux-s390@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, "maintainer:X86 ARCHITECTURE..." <x86@kernel.org>, Ingo Molnar <mingo@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>, linux-pci@vger.kernel.org, Matt Turner <mattst88@gmail.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, "open list:TENSILICA XTENSA PORT \(xtensa\)" <linux-xtensa@linux-xtensa.org>, Albert Ou <aou@eecs.berkeley.edu>, Kees Cook <keescook@chromium.org>, Vasily Gorbik <gor@linux.ibm.com>, Niklas Schnelle <schnelle@linux.ibm.com>,
  Heiko Carstens <hca@linux.ibm.com>, "open list:M68K ARCHITECTURE" <linux-m68k@lists.linux-m68k.org>, Borislav Petkov <bp@alien8.de>, Paul Walmsley <paul.walmsley@sifive.com>, Bjorn Helgaas <bhelgaas@google.com>, Thomas Gleixner <tglx@linutronix.de>, Richard Henderson <rth@twiddle.net>, Chris Zankel <chris@zankel.net>, Pierre Morel <pmorel@linux.ibm.com>, Nick Child <nick.child@ibm.com>, LKML <linux-kernel@vger.kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Sven Schnelle <svens@linux.ibm.com>, "open list:ALPHA PORT" <linux-alpha@vger.kernel.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jul 14, 2022 at 2:47 PM Stafford Horne <shorne@gmail.com> wrote:
>
> The generic pci.h header provides a definition of pci_get_legacy_ide_irq
> which is used by architectures that use PC-style interrupt numbers.
>
> This patch removes the old pci.h in order to make room for a new
> pci.h to be used by arm64, riscv, openrisc, etc.
>
> The existing code in pci.h is moved out to architectures.
>
> Suggested-by: Arnd Bergmann <arnd@arndb.de>
> Link: https://lore.kernel.org/lkml/CAK8P3a0JmPeczfmMBE__vn=Jbvf=nkbpVaZCycyv40pZNCJJXQ@mail.gmail.com/
> Signed-off-by: Stafford Horne <shorne@gmail.com>
> ---
>  arch/alpha/include/asm/pci.h   |  1 -
>  arch/ia64/include/asm/pci.h    |  1 -
>  arch/m68k/include/asm/pci.h    |  7 +++++--
>  arch/powerpc/include/asm/pci.h |  1 -
>  arch/s390/include/asm/pci.h    |  6 +++++-
>  arch/sparc/include/asm/pci.h   |  5 ++++-
>  arch/x86/include/asm/pci.h     |  6 ++++--
>  arch/xtensa/include/asm/pci.h  |  6 ++++--
>  include/asm-generic/pci.h      | 17 -----------------
>  9 files changed, 22 insertions(+), 28 deletions(-)
>  delete mode 100644 include/asm-generic/pci.h

[...]

> diff --git a/arch/xtensa/include/asm/pci.h b/arch/xtensa/include/asm/pci.h
> index 8e2b48a268db..f57ede61f5db 100644
> --- a/arch/xtensa/include/asm/pci.h
> +++ b/arch/xtensa/include/asm/pci.h
> @@ -43,7 +43,9 @@
>  #define ARCH_GENERIC_PCI_MMAP_RESOURCE 1
>  #define arch_can_pci_mmap_io()         1
>
> -/* Generic PCI */
> -#include <asm-generic/pci.h>

Ok.

> +static inline int pci_get_legacy_ide_irq(struct pci_dev *dev, int channel)
> +{
> +       return channel ? 15 : 14;
> +}

This addition does not make sense for the xtensa as it isn't even possible
to enable PNP support (the only user of this function) on xtensa.

-- 
Thanks.
-- Max
