Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B23B34C0F35
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Feb 2022 10:28:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K3W0v4r6Jz3cPm
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Feb 2022 20:27:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qqmQ8wyO;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org;
 envelope-from=arnd@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=qqmQ8wyO; 
 dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K3W095Qh2z3Wtt
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Feb 2022 20:27:21 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 1246BB81EB2
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Feb 2022 09:27:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2FD6C340F7
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Feb 2022 09:27:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645608437;
 bh=D2jUPs6ryRSFqPbSylqUkNdDZuOthbzsmeMEmvziyjY=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=qqmQ8wyO3KiiRoY+dyct/TIYMNusVUOO5uBkZTYhtUECfjZmkRmaumdg0efpJyqu+
 1NUJbC9Z3gU9iKZ76MO3UpT4/QBmKBCF88pqLt144UXdY+HMEMC0NKwBLt8ddIYdhA
 4cfTyACUBNndKvI7l6kYGtTfeLVnOQvi9cvhrJ7Y5seMk3xdn+vhInqbypWk75PDVV
 ukutm41uLJwz1+2AWQrMOJbx4wCwKg3g5Buv7RBtSh5+DWH6WYdCZ0cfRiqBTSFz57
 YjiY60e2PdpP+9klK1djKE86K0i7Gd0U+HA/0LucKwfDZ0JvqvKDMnqMv8zSd6wwoq
 DHan5qZHkfXig==
Received: by mail-wm1-f47.google.com with SMTP id
 az26-20020a05600c601a00b0037c078db59cso3872193wmb.4
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Feb 2022 01:27:17 -0800 (PST)
X-Gm-Message-State: AOAM532GSSPlqsb0fB7bjd2ugWoioavBvR7hSK8xiHJMMgNznIWdh2dV
 LaPcYKENhLGCN+bnkIqhux0FNL0Qh7qqFGc90KM=
X-Google-Smtp-Source: ABdhPJwtMkGkHNVPhtWq1LOTi2OcT9JVNmxiOoaUyabWMpAtHbaXvG0B+oJZMTvLmHy/MuDTQEaSkGsJ6B3oEOPptXw=
X-Received: by 2002:a05:600c:1d27:b0:37c:74bb:2b4d with SMTP id
 l39-20020a05600c1d2700b0037c74bb2b4dmr6779098wms.82.1645608425823; Wed, 23
 Feb 2022 01:27:05 -0800 (PST)
MIME-Version: 1.0
References: <20220216131332.1489939-1-arnd@kernel.org>
 <20220216131332.1489939-10-arnd@kernel.org>
 <20220223074127.GA8287@alpha.franken.de>
In-Reply-To: <20220223074127.GA8287@alpha.franken.de>
From: Arnd Bergmann <arnd@kernel.org>
Date: Wed, 23 Feb 2022 10:26:49 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1nM3yPhjhMtUQyd5srgB99OkUvmapWv13KCuJXsf=euw@mail.gmail.com>
Message-ID: <CAK8P3a1nM3yPhjhMtUQyd5srgB99OkUvmapWv13KCuJXsf=euw@mail.gmail.com>
Subject: Re: [PATCH v2 09/18] mips: use simpler access_ok()
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
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
 Christoph Hellwig <hch@lst.de>, linux-arch <linux-arch@vger.kernel.org>,
 linux-s390 <linux-s390@vger.kernel.org>, Brian Cain <bcain@codeaurora.org>,
 Helge Deller <deller@gmx.de>, the arch/x86 maintainers <x86@kernel.org>,
 Russell King - ARM Linux <linux@armlinux.org.uk>, linux-csky@vger.kernel.org,
 Ard Biesheuvel <ardb@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 "open list:SYNOPSYS ARC ARCHITECTURE" <linux-snps-arc@lists.infradead.org>,
 "open list:TENSILICA XTENSA PORT \(xtensa\)" <linux-xtensa@linux-xtensa.org>,
 Arnd Bergmann <arnd@arndb.de>, Heiko Carstens <hca@linux.ibm.com>,
 alpha <linux-alpha@vger.kernel.org>, linux-um <linux-um@lists.infradead.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 linux-m68k <linux-m68k@lists.linux-m68k.org>,
 Openrisc <openrisc@lists.librecores.org>, Al Viro <viro@zeniv.linux.org.uk>,
 Stafford Horne <shorne@gmail.com>, Michal Simek <monstr@monstr.eu>,
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

On Wed, Feb 23, 2022 at 8:41 AM Thomas Bogendoerfer
<tsbogend@alpha.franken.de> wrote:
>
> On Wed, Feb 16, 2022 at 02:13:23PM +0100, Arnd Bergmann wrote:
> > diff --git a/arch/mips/include/asm/uaccess.h b/arch/mips/include/asm/uaccess.h
> > index db9a8e002b62..d7c89dc3426c 100644
> > --- a/arch/mips/include/asm/uaccess.h
> > +++ b/arch/mips/include/asm/uaccess.h
> > @@ -19,6 +19,7 @@
> >  #ifdef CONFIG_32BIT
> >
> >  #define __UA_LIMIT 0x80000000UL
> > +#define TASK_SIZE_MAX        __UA_LIMIT
>
> using KSEG0 instead would IMHO be the better choice. This gives the
> chance to remove __UA_LIMIT completly after cleaning up ptrace.c

Ok, changed now.

      Arnd
