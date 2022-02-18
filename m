Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B0A8C4BB317
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Feb 2022 08:16:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K0NKr0lQmz3cb7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Feb 2022 18:16:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=S3plJ1i8;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1;
 helo=sin.source.kernel.org; envelope-from=arnd@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=S3plJ1i8; 
 dkim-atps=neutral
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K0NKB6BVsz30gg
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Feb 2022 18:16:14 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 8D8D9CE3154
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Feb 2022 07:16:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C1FDC340F5
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Feb 2022 07:16:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645168571;
 bh=vgWt8lxnjYZUPlvwCFWcIBvafVy+fWmkyAOoKRaWgHQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=S3plJ1i8VZsFxU4X4RZ5M0asXLSW5oySYODKwT4DPWxWXfGFpsY5vG9UOIC2U3q0j
 WjEpt/efGJ2aSJzdi+66aowQsNxm0AW4k6WISoaPcoYTYReFyI9fzUxwxd9bMzVo2l
 zZ2THz3mgwac66ekXLDFZxqiRei3PAK6qclAXwvFuHmvaHcN7EtRPCE/0FTPJTVF5F
 BDyX0eluRTFAJNNLP2rF8rUVA1Apw0Q/TAla5xWBzjGUALx1LeJ21MRI44meY/J8m0
 xhUfWbiBQrlxaYiAAhGYPFKTgDiADdWWsl00U5GmTmBp1VVs8d39VVSARkdPfKCtm+
 OkghDXThmUdSA==
Received: by mail-ej1-f45.google.com with SMTP id qk11so12920367ejb.2
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Feb 2022 23:16:10 -0800 (PST)
X-Gm-Message-State: AOAM531Vlhu6y/o1TEXRdvA9UcoedAYxacG6An7Ngj9NDZ5xgUEvtcgl
 fdcDR11BAVtOSMP6b6MVjRfkiH1CEjYHf4dugaI=
X-Google-Smtp-Source: ABdhPJyN/H83BSKKeXJGtgECPVgYv1w4NoilhoSCj+92CRqaoOjPXRtnkFYRBhAzB91QtgFwdj4YRtpnThbImHSlPPw=
X-Received: by 2002:adf:90c1:0:b0:1e4:ad27:22b9 with SMTP id
 i59-20020adf90c1000000b001e4ad2722b9mr4972052wri.219.1645168558306; Thu, 17
 Feb 2022 23:15:58 -0800 (PST)
MIME-Version: 1.0
References: <20220216131332.1489939-1-arnd@kernel.org>
 <20220216131332.1489939-15-arnd@kernel.org>
 <20220218063549.GJ22576@lst.de>
In-Reply-To: <20220218063549.GJ22576@lst.de>
From: Arnd Bergmann <arnd@kernel.org>
Date: Fri, 18 Feb 2022 08:15:42 +0100
X-Gmail-Original-Message-ID: <CAK8P3a31_zG7npZbPHGixOYL0p28dGzs3f9ku_RB4p1tiEY0Tw@mail.gmail.com>
Message-ID: <CAK8P3a31_zG7npZbPHGixOYL0p28dGzs3f9ku_RB4p1tiEY0Tw@mail.gmail.com>
Subject: Re: [PATCH v2 14/18] lib/test_lockup: fix kernel pointer check for
 separate address spaces
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

On Fri, Feb 18, 2022 at 7:35 AM Christoph Hellwig <hch@lst.de> wrote:
>
> On Wed, Feb 16, 2022 at 02:13:28PM +0100, Arnd Bergmann wrote:
> > From: Arnd Bergmann <arnd@arndb.de>
> >
> > test_kernel_ptr() uses access_ok() to figure out if a given address
> > points to user space instead of kernel space. However on architectures
> > that set CONFIG_ALTERNATE_USER_ADDRESS_SPACE, a pointer can be valid
> > for both, and the check always fails because access_ok() returns true.
> >
> > Make the check for user space pointers conditional on the type of
> > address space layout.
>
> What is this code even trying to do?  It looks extremly broken.

As I understand it, this is only meant for debugging, and the module contains
intentionally broken lock usage to test whether the watchdog and lockup
detection in the kernel is able to find them.

I did not try that hard to understand how it works though.

      Arnd
