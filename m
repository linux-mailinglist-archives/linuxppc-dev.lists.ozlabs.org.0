Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D4AD495C67
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jan 2022 09:57:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JgCv30rqSz3cV4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jan 2022 19:57:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=arndb.de
 (client-ip=212.227.126.187; helo=mout.kundenserver.de;
 envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.187])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JgCtV4mY6z2x9X
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Jan 2022 19:57:05 +1100 (AEDT)
Received: from mail-oi1-f171.google.com ([209.85.167.171]) by
 mrelayeu.kundenserver.de (mreue011 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MPGBR-1mwj561YvF-00PfRP for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Jan
 2022 09:57:01 +0100
Received: by mail-oi1-f171.google.com with SMTP id s127so12707154oig.2
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Jan 2022 00:57:00 -0800 (PST)
X-Gm-Message-State: AOAM5314hWW747y03xMsvqMUB9uFzW1rV7+lsuyLCgvL4ylX871iNVcN
 0Z+Uj5eHefIQIasrsD9VkeUkk5w3djUu9pULGRc=
X-Google-Smtp-Source: ABdhPJylnMQV70n0iz9SImQwsqAn8J+KL/hKoGrWF8c1XxnGFchA2qX7H9h0ZVY5igqqe7kHNmQOCuoQNmiaakrHJBA=
X-Received: by 2002:a05:6808:9a:: with SMTP id
 s26mr2365492oic.108.1642755419287; 
 Fri, 21 Jan 2022 00:56:59 -0800 (PST)
MIME-Version: 1.0
References: <20220120073911.99857-9-guoren@kernel.org>
 <CAK8P3a0LxB3we9wHOa4OPmNow6wz5NP49zeYhh7QXNv-MiR8UA@mail.gmail.com>
 <CAJF2gTQVUF4LSO0a6_MV8x-UAiJw32pAFyS1oPNLXhcEaemzqg@mail.gmail.com>
In-Reply-To: <CAJF2gTQVUF4LSO0a6_MV8x-UAiJw32pAFyS1oPNLXhcEaemzqg@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 21 Jan 2022 09:56:43 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1sOejkdOyoRUfw4ESS7ewX_8Wj9tQNrZ40OiuDqJnrmw@mail.gmail.com>
Message-ID: <CAK8P3a1sOejkdOyoRUfw4ESS7ewX_8Wj9tQNrZ40OiuDqJnrmw@mail.gmail.com>
Subject: Re: [PATCH V3 08/17] riscv: compat: syscall: Add compat_sys_call_table
 implementation
To: Guo Ren <guoren@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:YWwMzpHgJ5/ZtHdD/IXd/3oXULFVjqhfMFpIIdcPV8kHBfsNsIw
 MowMn90UzNyvT1tbRTiOBlY78jVNI/bHYJspzsbuhlOq4g8XoRB+bDYdCNFa4tYG3po8FJV
 0EEOUMS/yiD8RjuwX7S/vZTgQirtpqDvbGrwX3iThx83HVem/VXrkSgZ8i8EeRGsgHg2EpL
 svCCRU+0GTJZ0T5bvKONw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:aYvv/prH7KQ=:Li/nRV1otdl3Qqvw/ySXuf
 0H1OwxH3eb5xSBtC5CD84noqXYOHU4xWZBaZ/9UVx2uEIGmD7Do960VnARdwpLNik7X3qaY1F
 1P3x1MXBFud64g3u3p1jOOEmrli7g2v2kDPVt0w6zvVQMPSvn9IXM2jkSj5F7jCU7e4SVSxsV
 rfLvsQB7MN1JmygSyv6jubmNCrRYTavt4mJb5aEkwLq2vEqJkZMJgFGR6QSVx9PCpfY44I883
 Yj5vTW9ePyYsPsL9mDg/AubWKggzXWXHjr1xh/6CdrFAzxaBySupI6F4Q9ajztfwvgyPLdh/f
 X8W9WPED27vG+X37Ica/n/+BM/OUImji6RkcFKLVfreNAxYMAU9Zb31LIY0B5+D/8duyJu47y
 Cqe5c90T3VXFvQ8TOAA/f0zH/AFGb4lvElN2DdCOTp8TouHoCJBxvfkJqHlBuFI5sEX7DwQvU
 Gxd8m06qDS2aMjZxE22Y89ck1fIfk3y9/v57hmnFy5n4Qdo6+Cx2a8javbppR1s/xTZWLWn5a
 lEIA7F0PgDtmyCypbwRl8b3U53Z8c9eZZ92m4VE1QcvctuvcDBmJefqH6aDMvvbcpxeNqbsP1
 MR1JtIeDHxzjHCUjl0IfNzWwwtGkMD2hhvMVwHpoI+RiV3fLUf0q9oCl1WRaSKlVGOMJXjboc
 /jfoZNFYjbgEx8JpvEvvefyM0ailSD3Q5Y3phpFkkvsqrW7bPy4MEt5qZwjYiRcYH6oYEHna/
 mINC11UHo3BtrBD8ViFjOlWQ12GJFHuZ0ICLbUmVU347ES00XJOmf/TZq30/kqL+ZdH42M44z
 8lCLQT5DYikcu0IC/Q1C9oKIgDpV4JAR5RDGbBX4HaaCAhCxdE=
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
Cc: linux-s390 <linux-s390@vger.kernel.org>, Guo Ren <guoren@linux.alibaba.com>,
 Arnd Bergmann <arnd@arndb.de>, gregkh <gregkh@linuxfoundation.org>,
 Drew Fustini <drew@beagleboard.org>, Anup Patel <anup@brainfault.org>,
 Wang Junqiang <wangjunqiang@iscas.ac.cn>,
 the arch/x86 maintainers <x86@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-csky@vger.kernel.org, inux-parisc@vger.kernel.org,
 Christoph Hellwig <hch@infradead.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 liush <liush@allwinnertech.com>, sparclinux <sparclinux@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Christoph Hellwig <hch@lst.de>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, Wei Fu <wefu@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jan 21, 2022 at 7:25 AM Guo Ren <guoren@kernel.org> wrote:
> On Thu, Jan 20, 2022 at 10:43 PM Arnd Bergmann <arnd@arndb.de> wrote:
> > On Thu, Jan 20, 2022 at 8:39 AM <guoren@kernel.org> wrote:

> > Are you sure these are the right calling conventions? According to [1],
> > I think the 64-bit argument should be in an aligned pair of registers,
> > which means you need an extra pad argument as in the arm64 version
> > of these functions. Same for ftruncate64, pread64, pwrite64, and
> > readahead.
>
> [1] has abandoned.
>
> See:
> https://github.com/riscv-non-isa/riscv-elf-psabi-doc/blob/master/riscv-cc.adoc

Ok, thanks for the reference, I picked the first one that came up in
a google search and didn't expect this to ever have changed.

> > I still feel like these should be the common implementations next to the
> > native handlers inside of an #ifdef CONFIG_COMPAT.
> >
> > The names clash with the custom versions defined for powerpc and sparc,
> > but the duplicates look compatible if you can account for the padded
> > argument and the lo/hi order of the pairs, so could just be removed here
> > (all other architectures use custom function names instead).
> I would try it later.

This becomes easier then, as powerpc and sparc already have the non-padded
calling conventions, so you could just generalize those without looking at
the other architectures or adding the padding. The powerpc version already
has the dual-endian version, so using that will work on big-endian sparc and
on little-endian riscv as well, though we may need to come up with a better name
for the arg_u32/arg_u64/merge_64 macros in order to put that into a global
header without namespace collisions.

         Arnd
