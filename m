Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DD6F24A35F4
	for <lists+linuxppc-dev@lfdr.de>; Sun, 30 Jan 2022 12:33:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jmpwc5f2yz3cRh
	for <lists+linuxppc-dev@lfdr.de>; Sun, 30 Jan 2022 22:33:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=arndb.de
 (client-ip=217.72.192.75; helo=mout.kundenserver.de;
 envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.75])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jmpw45BtXz2xrc
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 30 Jan 2022 22:32:51 +1100 (AEDT)
Received: from mail-ot1-f54.google.com ([209.85.210.54]) by
 mrelayeu.kundenserver.de (mreue109 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MVeDq-1mmWt92ZnA-00RbJA for <linuxppc-dev@lists.ozlabs.org>; Sun, 30 Jan
 2022 12:32:47 +0100
Received: by mail-ot1-f54.google.com with SMTP id
 j38-20020a9d1926000000b0059fa6de6c71so10235752ota.10
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 30 Jan 2022 03:32:46 -0800 (PST)
X-Gm-Message-State: AOAM531RYUxNV3/0sXs+9FEuhbJatc8jsPROP14tOkbs6rBCkL2yoQUJ
 OTgH1itq+9S44DA42uTVs2DKXvH6sJKskcLICNs=
X-Google-Smtp-Source: ABdhPJwfE8JwIPR39kNR+t9u+MXKrX+M/IvR4BevQAZ6Ex6kYRsjbH69gpBCBcpvwPyYexj/E8Z2vleiIWqqwcDE0P4=
X-Received: by 2002:a05:6830:33c2:: with SMTP id
 q2mr8818491ott.368.1643542365934; 
 Sun, 30 Jan 2022 03:32:45 -0800 (PST)
MIME-Version: 1.0
References: <20220129121728.1079364-1-guoren@kernel.org>
 <20220129121728.1079364-9-guoren@kernel.org>
 <CAK8P3a3JGP6fLVOyLgdNw2YpRSmArbEX8orUhRrN=GHmcdk=1g@mail.gmail.com>
 <CAJF2gTQQnrUFNQ85vvoMkpxnCWuMw8iXtPZOJwWGaEA9f+rTwA@mail.gmail.com>
In-Reply-To: <CAJF2gTQQnrUFNQ85vvoMkpxnCWuMw8iXtPZOJwWGaEA9f+rTwA@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Sun, 30 Jan 2022 12:32:29 +0100
X-Gmail-Original-Message-ID: <CAK8P3a12CygLFT7qoQ9K=sowvTgNpeRej6Zh6Pv2PL_e2zMhMQ@mail.gmail.com>
Message-ID: <CAK8P3a12CygLFT7qoQ9K=sowvTgNpeRej6Zh6Pv2PL_e2zMhMQ@mail.gmail.com>
Subject: Re: [PATCH V4 08/17] riscv: compat: syscall: Add compat_sys_call_table
 implementation
To: Guo Ren <guoren@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:PZ7F4wPXBAocaDqBj58NqaE7WKLx79Ss8Nq+eh7iS3qFHzCvXoV
 euQgp8TDxycJGu527RNelJrctN/0v6e3dGt31QSgyF+GOq+jC+5tlSZ7eUXrhW92oNNiM6C
 Ebi1l7ncZAtgtHrVZzvSR8J7TIb2B+Wd1pqZ6M7Dd7SfKSTCyWquQ4qKZ2wshwPNQPDu1VY
 M4t4OxgeCLMYU0/aOZjSQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:QCoGGa5PIbI=:1/4CE211wWQ1uzuVYBUlY9
 Wn8M/2IcrhuU+l6dkYO0w+MR9Apda72yD6qFv6EnvOkVMrXL6Rt2bvVMC19oVF/Unja6MYPMc
 114tEnezR2sjqPVcR+6losq5XiAFCoClL+YVhh8LoKtzipD8jfLMIuBmDS6gyKSGfxmH+RzzD
 HqOIRZ/l1Tl6h0nxUQnsiw8VwAn67dtm4tE4Q2zKmOStA/5dRkHlaTSZETnDSOIvb+p5VZqcc
 d2IR6+Cb9bwGjy4mNGftrJ80ywnGJ4QePVOw/Ih2/yeIbehazOuX6zdv4fFkhfsDUxhG68Nin
 MP36vknTLNzn3lJJMqe9pR8pAph3AawP+PsuHhTcJPsBAJwafheeKEG2PypDPpVJuToHPNFw9
 CnTV3/a9oIo75MC+c3dj5tUUTgsf/yg+hpzUQsZohWRweLFjuqW6AMJ7e7+WpkaXnimCXCtHU
 zszeK1XyzQHLwTpEYJvCvfE7ap2dFXU5I1a7ztFauwNy/qU/mQuesds6Mr7pjqIaWeMe6mvrd
 1fU8kabfuWQWCNzLF5/Lt8ThovT2p6RL0isr77A/1GcClZcPr/VAMwlrmFEso3MBkq3UOqkSB
 SxeHMrTQtnP8E0ac8f83aPpgkG5vkS7MiIjBJ11V9wVRAYxJzdwOA5zRh2InodeRKota+OR2t
 whWEVYUNCi3sjBvkmH34Igxr+wxAQNQHLR0LPKcBzdWXEX6EuShrqg0qktihAr4p2g80=
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
 linux-riscv <linux-riscv@lists.infradead.org>, Christoph Hellwig <hch@lst.de>,
 linux-arch <linux-arch@vger.kernel.org>,
 linux-s390 <linux-s390@vger.kernel.org>, Anup Patel <anup@brainfault.org>,
 the arch/x86 maintainers <x86@kernel.org>, linux-csky@vger.kernel.org,
 Christoph Hellwig <hch@infradead.org>, Arnd Bergmann <arnd@arndb.de>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Parisc List <linux-parisc@vger.kernel.org>,
 Drew Fustini <drew@beagleboard.org>, gregkh <gregkh@linuxfoundation.org>,
 Wang Junqiang <wangjunqiang@iscas.ac.cn>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, liush <liush@allwinnertech.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Wei Fu <wefu@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, Jan 30, 2022 at 6:54 AM Guo Ren <guoren@kernel.org> wrote:
> On Sun, Jan 30, 2022 at 6:41 AM Arnd Bergmann <arnd@arndb.de> wrote:
> >
> > I would make these endian-specific, and reverse them on big-endian
> > architectures. That way it
> > should be possible to share them across all compat architectures
> > without needing the override
> > option.
> I hope it could be another patch. Because it's not clear to
> _LITTLE_ENDIAN definition in archs.
>
> eg: Names could be __ORDER_LITTLE_ENDIAN__ CPU_LITTLE_ENDIAN
> SYS_SUPPORTS_LITTLE_ENDIAN __LITTLE_ENDIAN
>
> riscv is little-endian, but no any LITTLE_ENDIAN definition.
>
> So let's keep them in the patch, first, Thx

The correct way to do it is to check for CONFIG_CPU_BIG_ENDIAN,
which works on all architectures. Since nothing else selects the
__ARCH_WANT_COMPAT_* symbols, there is also no risk for
regressions, so just use this and leave the #ifndef compat_arg_u64
check in place.

      Arnd
