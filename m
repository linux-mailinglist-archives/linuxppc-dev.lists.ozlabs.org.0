Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E37B94BB330
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Feb 2022 08:24:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K0NVn3Ff2z3ccM
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Feb 2022 18:24:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ZOFYp5FJ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1;
 helo=sin.source.kernel.org; envelope-from=arnd@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=ZOFYp5FJ; 
 dkim-atps=neutral
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K0NV73ZMnz3cQb
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Feb 2022 18:23:59 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 56455CE3153
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Feb 2022 07:23:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1C43C340F1
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Feb 2022 07:23:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645169038;
 bh=iX8k9YjATKpR4c62jPbZyUcM9GG/inNR2Rws8vh+5TI=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=ZOFYp5FJX2fGqfPSxuYQH+Bbh1OaV3AAAeBBi8chN0z46DV33qgEoqw/uVDLhAO3C
 M7SSK5KVCp/u690ji+AC6ddeNrmfrEtHlpxTQjywW7sqN41FCYUwU8u1S++u9E7NvJ
 r02NC0wGk3Js2i8Ig4ZzctmVJBkd/nbIt6BJMNxeOiLhLUuLmDw7ePtYo94Bm1dhvX
 zhvKG88l39cBSukRt8vW5fIaa74f7tmSeWBU4UjjB3Qs0utU9/ubuiEJT38Fpb+j2s
 4Qu9ryBlpI6oN7Ii5dugx++U3NyNLtEm3aR4rm4v88RlnNMK3N4jZeMvQv8yTrAfTl
 N/qcNAXY+Oaag==
Received: by mail-lj1-f172.google.com with SMTP id c15so2962475ljf.11
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Feb 2022 23:23:57 -0800 (PST)
X-Gm-Message-State: AOAM533hOaUNBCmmnfesHJD40RlZcmlyZiMR0PKVp7188SJaVtvWqqg4
 t/+Kgs5TtKFjMjQgDjKnvyDgrP6BnKbDgNG9h4g=
X-Google-Smtp-Source: ABdhPJy+O8dl23fyesXRWHjz7SZRLrJN54UunjRaSC3OSIYzwaAC/i9x7WkjUHComAvPWqTtg86CqT1E/gHbWgqhIZI=
X-Received: by 2002:adf:90c1:0:b0:1e4:ad27:22b9 with SMTP id
 i59-20020adf90c1000000b001e4ad2722b9mr4994775wri.219.1645169025031; Thu, 17
 Feb 2022 23:23:45 -0800 (PST)
MIME-Version: 1.0
References: <20220216131332.1489939-1-arnd@kernel.org>
 <20220216131332.1489939-14-arnd@kernel.org>
 <20220218063450.GI22576@lst.de>
In-Reply-To: <20220218063450.GI22576@lst.de>
From: Arnd Bergmann <arnd@kernel.org>
Date: Fri, 18 Feb 2022 08:23:29 +0100
X-Gmail-Original-Message-ID: <CAK8P3a17kdz0gKYz3cDSpvWa80TY6QNSom11HVAb8h91RZn0Jg@mail.gmail.com>
Message-ID: <CAK8P3a17kdz0gKYz3cDSpvWa80TY6QNSom11HVAb8h91RZn0Jg@mail.gmail.com>
Subject: Re: [PATCH v2 13/18] uaccess: generalize access_ok()
To: Christoph Hellwig <hch@lst.de>
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
 linux-ia64@vger.kernel.org, Linux-sh list <linux-sh@vger.kernel.org>,
 Peter Zijlstra <peterz@infradead.org>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 Linux-MM <linux-mm@kvack.org>, Guo Ren <guoren@kernel.org>,
 sparclinux <sparclinux@vger.kernel.org>,
 "open list:QUALCOMM HEXAGON..." <linux-hexagon@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, Will Deacon <will@kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>, linux-arch <linux-arch@vger.kernel.org>,
 linux-s390 <linux-s390@vger.kernel.org>, Brian Cain <bcain@codeaurora.org>,
 Helge Deller <deller@gmx.de>, the arch/x86 maintainers <x86@kernel.org>,
 Russell King - ARM Linux <linux@armlinux.org.uk>, linux-csky@vger.kernel.org,
 Ingo Molnar <mingo@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 "open list:SYNOPSYS ARC ARCHITECTURE" <linux-snps-arc@lists.infradead.org>,
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
 Dinh Nguyen <dinguyen@kernel.org>,
 "Eric W . Biederman" <ebiederm@xmission.com>,
 Richard Weinberger <richard@nod.at>, Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 David Miller <davem@davemloft.net>, Greentime Hu <green.hu@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Feb 18, 2022 at 7:34 AM Christoph Hellwig <hch@lst.de> wrote:
>
> > +#include <asm-generic/access_ok.h>
>
> Instead of the asm-generic games, shouldn't we just define access_ok in
> <linux/uaccess.h> if not already defined by the architecture?

I tried, but couldn't actually make it work because asm/uaccess.h tends
to contain inline functions that rely on access_ok(). It could work once we
move all the high-level functions into linux/uaccess.h, but that would likely
require another long patch series.

One option that can work is to require architectures to have an
asm/access_ok.h header that gets included by linux/uaccess.h.
On most architectures, that would be redirected to
asm-generic/access_ok.h, as only ia64, x86, arm64 and um
need to override the definition.

      Arnd
