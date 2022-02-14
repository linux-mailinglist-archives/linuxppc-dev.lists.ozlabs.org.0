Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C37BD4B5A9A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Feb 2022 20:41:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JyF2c1yh3z3cVs
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Feb 2022 06:41:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=FB6LCtzh;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org;
 envelope-from=arnd@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=FB6LCtzh; 
 dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JyF1z0cJMz3bbj
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Feb 2022 06:40:38 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 899FEB8166D
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Feb 2022 19:40:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A3B2C340EE
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Feb 2022 19:40:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644867635;
 bh=5szbHF9etsKpvbwWwwc9H/Y1QakuvzjKYGUIBcYFA80=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=FB6LCtzhqken/QDOPyOwZ7wQpXfPikw3pdTyiG/plTo//u4LL21KcLieW6f3UDasd
 m+oZrXFq0g+10OYhhpfWoc66p3wYzH1yqgc9M/Ir+axOtsEuq/9I0L4rsyEdsA4DqV
 Akh3HKGFbae964Ns+9AAqIR8q2ETEq6jdm91TNaeypazn0g9zThClRvdRy2dhtQTVB
 huhrfM1rfEAPboTNO6qI3jB+K2Wk2ktxzMPEDCNV3Ppxg1UY9wNqs0jqFbwMJdfyF3
 wJOEIVpvplY+7kpXA5brHQ6R6B4+dmKM9rSodPkMt8v0CZbn+igDN37PabkIb6gL30
 unIqB3cjmS6Lw==
Received: by mail-wm1-f44.google.com with SMTP id
 l123-20020a1c2581000000b0037b9d960079so114843wml.0
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Feb 2022 11:40:35 -0800 (PST)
X-Gm-Message-State: AOAM533AvAy8diwveqs5eN+/AWJ/FloYBCA8YlzUGEogu41WU07d+SeS
 7BFQgfgN5QjFPiRIpPF62d9MSVUXX0BGiCNcylQ=
X-Google-Smtp-Source: ABdhPJzTYqCeBLA8ZZTCXfIkkUBrupnk+RLzKXVQdywxm2I/SfNIqW0R0tvlKvR6EMssd+gXW/CMf7zH4TFa2LGJB14=
X-Received: by 2002:a05:600c:1d27:b0:37c:74bb:2b4d with SMTP id
 l39-20020a05600c1d2700b0037c74bb2b4dmr252362wms.82.1644867623104; Mon, 14 Feb
 2022 11:40:23 -0800 (PST)
MIME-Version: 1.0
References: <20220214163452.1568807-1-arnd@kernel.org>
 <20220214163452.1568807-11-arnd@kernel.org>
 <YgqL/NJ3YHEAhj4i@infradead.org>
In-Reply-To: <YgqL/NJ3YHEAhj4i@infradead.org>
From: Arnd Bergmann <arnd@kernel.org>
Date: Mon, 14 Feb 2022 20:40:07 +0100
X-Gmail-Original-Message-ID: <CAK8P3a3eOw=QpxWFnODE61EFt8oGPJ7dcusfbPSD1vdEsUmekQ@mail.gmail.com>
Message-ID: <CAK8P3a3eOw=QpxWFnODE61EFt8oGPJ7dcusfbPSD1vdEsUmekQ@mail.gmail.com>
Subject: Re: [PATCH 10/14] uaccess: remove most CONFIG_SET_FS users
To: Christoph Hellwig <hch@infradead.org>
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
 Max Filippov <jcmvbkbc@gmail.com>, Guo Ren <guoren@kernel.org>,
 sparclinux <sparclinux@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, Will Deacon <will@kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>, linux-arch <linux-arch@vger.kernel.org>,
 linux-s390 <linux-s390@vger.kernel.org>, Brian Cain <bcain@codeaurora.org>,
 "open list:QUALCOMM HEXAGON..." <linux-hexagon@vger.kernel.org>,
 Helge Deller <deller@gmx.de>, the arch/x86 maintainers <x86@kernel.org>,
 Russell King - ARM Linux <linux@armlinux.org.uk>, linux-csky@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>, Ingo Molnar <mingo@redhat.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 "open list:SYNOPSYS ARC ARCHITECTURE" <linux-snps-arc@lists.infradead.org>,
 "open list:TENSILICA XTENSA PORT \(xtensa\)" <linux-xtensa@linux-xtensa.org>,
 Arnd Bergmann <arnd@arndb.de>, Heiko Carstens <hca@linux.ibm.com>,
 linux-um <linux-um@lists.infradead.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Richard Weinberger <richard@nod.at>,
 linux-m68k <linux-m68k@lists.linux-m68k.org>,
 Openrisc <openrisc@lists.librecores.org>, Greentime Hu <green.hu@gmail.com>,
 Stafford Horne <shorne@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Nick Hu <nickhu@andestech.com>, Parisc List <linux-parisc@vger.kernel.org>,
 Linux-MM <linux-mm@kvack.org>, Linux API <linux-api@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Dinh Nguyen <dinguyen@kernel.org>,
 "Eric W . Biederman" <ebiederm@xmission.com>,
 alpha <linux-alpha@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 David Miller <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Feb 14, 2022 at 6:06 PM Christoph Hellwig <hch@infradead.org> wrote:
>
> On Mon, Feb 14, 2022 at 05:34:48PM +0100, Arnd Bergmann wrote:
> > From: Arnd Bergmann <arnd@arndb.de>
> >
> > On almost all architectures, there are no remaining callers
> > of set_fs(), so CONFIG_SET_FS can be disabled, along with
> > removing the thread_info field and any references to it.
> >
> > This turns access_ok() into a cheaper check against TASK_SIZE_MAX.
>
> Wouldn't it make more sense to just merge this into the last patch?

Yes, sounds good. I wasn't sure at first if there is enough buy-in to get
all architectures cleaned up, and I hadn't done the ia64 patch, so it
seemed more important to do this part early, but now it seems that it
will all go in at the same time, so doing this as part of a big removal
at the end makes sense.

        Arnd
