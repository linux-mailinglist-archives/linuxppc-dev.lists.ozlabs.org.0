Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ABD84BB4AA
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Feb 2022 09:56:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K0QXz4qTLz3cbv
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Feb 2022 19:56:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.216.45; helo=mail-pj1-f45.google.com;
 envelope-from=geert.uytterhoeven@gmail.com; receiver=<UNKNOWN>)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com
 [209.85.216.45])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K0QXX14N1z3cJm
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Feb 2022 19:56:10 +1100 (AEDT)
Received: by mail-pj1-f45.google.com with SMTP id
 v5-20020a17090a4ec500b001b8b702df57so11806965pjl.2
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Feb 2022 00:56:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=acpcDWZvSxDwOAzGTb7O2RMIWdslBDMuoEt9Qz/Phu0=;
 b=QTI/U5ynuMzgMMpPndOzs2tB7pd9qu7uyeEHF1y7R5umWn0ITrA8aUvmR4egRGm543
 n7MlpKpEv1Jb8uHn+F50WPILBUn8cCV6ztJUSX9Us+vn6ZuC6zWHUM3a4BPuX1Raoy3Y
 x7cQ3fw1/g60WqYuwSiZ6pOn15m5mkHZ6zr85yNeTk2IbPfPMN9cszHAdYgcn+JzrecE
 I9I7arPh5fFapEe6isZYG7g7y1FS2wPt74Ps6pNoR9lc0TpTmSqmZ4b0fiQh8AEz28tU
 GehA28xx/dbF+6Gsdw9M6wWyRMn9MGKsWHKze3YYjyrIHBnsceQgsJC3QdmpecHsqmJf
 Z9rg==
X-Gm-Message-State: AOAM5311A4fBumUMxdWEgLzFyMp2P2Lq2MdongPKtDV+5O7bjNAW6R/N
 Kzr8dkpbkDVeg9yj/fnqbvA4NbV1gotn9g==
X-Google-Smtp-Source: ABdhPJwpTyHDclFi+cwGxV5naNFDAM7ARHD/p3dpwO0BlvVdeD5FtHkws0Q4whkR6wJ6yeZGVNDlqg==
X-Received: by 2002:a17:90b:b15:b0:1b1:de14:80f with SMTP id
 bf21-20020a17090b0b1500b001b1de14080fmr7383135pjb.47.1645174568087; 
 Fri, 18 Feb 2022 00:56:08 -0800 (PST)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com.
 [209.85.214.172])
 by smtp.gmail.com with ESMTPSA id rm8sm4547446pjb.5.2022.02.18.00.56.07
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Feb 2022 00:56:07 -0800 (PST)
Received: by mail-pl1-f172.google.com with SMTP id z17so6649094plb.9
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Feb 2022 00:56:07 -0800 (PST)
X-Received: by 2002:a67:e10e:0:b0:31b:956b:70cf with SMTP id
 d14-20020a67e10e000000b0031b956b70cfmr2916488vsl.77.1645174557092; Fri, 18
 Feb 2022 00:55:57 -0800 (PST)
MIME-Version: 1.0
References: <20220216131332.1489939-1-arnd@kernel.org>
 <20220216131332.1489939-9-arnd@kernel.org>
In-Reply-To: <20220216131332.1489939-9-arnd@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 18 Feb 2022 09:55:45 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVtRh5GHutxGf5dzGHBca7G4td3qqDTHM2KgoDr-kJ91Q@mail.gmail.com>
Message-ID: <CAMuHMdVtRh5GHutxGf5dzGHBca7G4td3qqDTHM2KgoDr-kJ91Q@mail.gmail.com>
Subject: Re: [PATCH v2 08/18] uaccess: add generic __{get,put}_kernel_nofault
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

On Wed, Feb 16, 2022 at 2:17 PM Arnd Bergmann <arnd@kernel.org> wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>
> Nine architectures are still missing __{get,put}_kernel_nofault:
> alpha, ia64, microblaze, nds32, nios2, openrisc, sh, sparc32, xtensa.
>
> Add a generic version that lets everything use the normal
> copy_{from,to}_kernel_nofault() code based on these, removing the last
> use of get_fs()/set_fs() from architecture-independent code.
>
> Reviewed-by: Christoph Hellwig <hch@lst.de>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

>  arch/m68k/include/asm/uaccess.h     |   2 -

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
