Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B0194950A9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jan 2022 15:58:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jflxd1YHGz3cJl
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jan 2022 01:58:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=arndb.de
 (client-ip=217.72.192.73; helo=mout.kundenserver.de;
 envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JflxB3hgRz2yZt
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Jan 2022 01:57:49 +1100 (AEDT)
Received: from mail-oi1-f177.google.com ([209.85.167.177]) by
 mrelayeu.kundenserver.de (mreue106 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1M7KG2-1nDq8j34H6-007ksd for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Jan
 2022 15:57:45 +0100
Received: by mail-oi1-f177.google.com with SMTP id x193so9333464oix.0
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Jan 2022 06:57:44 -0800 (PST)
X-Gm-Message-State: AOAM5306zZug6V7+ksoRHEn/FHENQzE/v29YB/ziVxk0y2rr+1gbEZOS
 K18JNL0gabQGUbkygWxRO/XrqbiauvJhhQAt9MI=
X-Google-Smtp-Source: ABdhPJwjtLdN6iyHNeRuxhdvl9Y6OeJzbUgAsOZS1tuaBlnRH/pfBDfrQe9jdzUZRHtHuLOgUQesyOgPAeGaNPDH+P4=
X-Received: by 2002:a05:6808:9a:: with SMTP id
 s26mr7926312oic.108.1642690663723; 
 Thu, 20 Jan 2022 06:57:43 -0800 (PST)
MIME-Version: 1.0
References: <20220120073911.99857-8-guoren@kernel.org>
 <CAK8P3a1UvqsS-D7cVXBkp4KCRWDfquQ6QTkvrQ=FqLxhsAi7Rw@mail.gmail.com>
 <f16cf10425a14c2e8183d5c90667ce72@AcuMS.aculab.com>
 <CAJF2gTRwh40xDBkoRJWZEUketKFDAy7_z=-WW7E=T46yH4zPvw@mail.gmail.com>
In-Reply-To: <CAJF2gTRwh40xDBkoRJWZEUketKFDAy7_z=-WW7E=T46yH4zPvw@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 20 Jan 2022 15:57:27 +0100
X-Gmail-Original-Message-ID: <CAK8P3a3FLnqibdXCGR8c+mm92HSiuvocZDeW8MyoTO_L1sYT=w@mail.gmail.com>
Message-ID: <CAK8P3a3FLnqibdXCGR8c+mm92HSiuvocZDeW8MyoTO_L1sYT=w@mail.gmail.com>
Subject: Re: [PATCH V3 07/17] riscv: compat: Re-implement TASK_SIZE for
 COMPAT_32BIT
To: Guo Ren <guoren@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:eKTNCbutx/xV3TxiKiDzs9ZilL3zDgRk6CnJJyB/q1HgmTstKLv
 xPPlofxN7s5Kun4TthK9Z4AOa+cae2E/4RgDrmI5DIc65e4f+LbSnXBvFBtpL5iY5td7XBo
 oxWfL6y22BPOBKK9HQBuz8hRodkwokslZ2ui8YfMx1qhPOFAkAzrSUCkClUCeCkc6M6GsMm
 nXUnCau/K2wysA8Nisofg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:+YrgyFcz9pY=:ZKZZ7aR0mUrZMiAB7yaW80
 DJiv/qRqBufU/hnMmqXrUzKYfaMH7LbKy5mX8F3BS8SZnqRyd2LJfwVRC6ac1egn7/V5nfD8e
 8XfRLsJJCFhjLnEASiabekJIA+rT+lGnRIwIHdTtu+X6ZXYiI1rSNJYDdMbOF+/Ouo44IAQw4
 l8PKT7nyowpdw2/x/fhqy2PLRENSP8q6GmF2+gk0X+6IGH7t7szg7Hcv+RFUua9BgtushABVx
 H3uisBMphWTPmW+ZcYYaGSgo43qYkDu58jCA7oluigaYEBLx1KRwwBw6U/ihN0eT0pc+wNXrI
 pGn5biHxfpl43/JbEHWaELZsIuvMFsv6eFG9F/KUynWwuiw6fOiwiZRmXnObt1lVNqU05Qc8j
 hw5Q1FWnzUrAX2jsQh0AZDSqKrPTHLxVLTBk/P4Kxbf/r6/joePiU6ejz6MBiYSxSoyAfD5+N
 93COu+B8L0SA+x5qXLkIIS7deoXep5U6yPcxE00yAtMt6O2Nhy8utzwNh5lZ4bIms1HNGKrfe
 FOYCHL1ejgA9kEED5OW4hEbfWP5M7MWhZ6TLIgr4OeAwE7VA6dY/Rvk3bhzRwsN0c7desD7df
 w44yqL2u34tVt+ZHl3AFrwMw5+AtEKkEOR5dajkLW3hlud218CWSSsVAub+KZTJvm+fspeRc3
 cCtAEr7l/oGroKqPPR0lHs0dAIdvSJTI48emDEXZqRFmkK3w9QTtNIMXfV5R6M6dQF5ipQCNw
 UUvmDdu94oDaEfdsuK5SeNnhNX2y1zrtvEEtE3YyNjn2Bd6RB7XqC+1fFutkGKp3tTNUsqERH
 eqZkR2He5ExPpz4UrDF65mVpJLkSvfLsX+5cOu0ivuoGhTo7XI=
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
Cc: Guo Ren <guoren@linux.alibaba.com>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 sparclinux <sparclinux@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 "inux-parisc@vger.kernel.org" <inux-parisc@vger.kernel.org>,
 linux-s390 <linux-s390@vger.kernel.org>, Anup Patel <anup@brainfault.org>,
 the arch/x86 maintainers <x86@kernel.org>,
 "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>,
 Christoph Hellwig <hch@lst.de>, Christoph Hellwig <hch@infradead.org>,
 Arnd Bergmann <arnd@arndb.de>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Drew Fustini <drew@beagleboard.org>, gregkh <gregkh@linuxfoundation.org>,
 Wang Junqiang <wangjunqiang@iscas.ac.cn>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 David Laight <David.Laight@aculab.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 liush <liush@allwinnertech.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Wei Fu <wefu@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jan 20, 2022 at 2:27 PM Guo Ren <guoren@kernel.org> wrote:
> On Thu, Jan 20, 2022 at 8:53 PM David Laight <David.Laight@aculab.com> wrote:
> > I think the x86-64 32bit compat code even puts the boundary at 4GB.
> Yes, we could give rv32 compat for 4GB with some effort. But it's unnecessary.
>
> There are no history issues for rv32, we use compat mode to reduce
> memory footprint. eg: only 64MB memory available.
>
> At end compat for 4GB is another topic, let's give the initial compat
> for 2GB support to riscv.

I think it's fine either way. Having the entire 4GB space available is nice
when you are trying to build 32-bit software natively rather then using a
cross-compiler, as you can just do it on a larger machine that supports both.

One example of software that runs into virtual memory size limitations is
the gnu linker when building large applications, but it's unlikely that you'll
actually need to run applications that run into this, while also needing to
build them natively.

Using the same limit as on native 32-bit machines can help with compatibility
of certain software, but again this is rarely a problem and I have not seen any
reports of issues with the 4GB TASK_SIZE_32 on arm64. On x86, there
is an option to use the native 3GB TASK_SIZE for compat tasks. This was
introduced to work around buggy applications a long time ago, but is
probably not used any more in practice.

       Arnd
