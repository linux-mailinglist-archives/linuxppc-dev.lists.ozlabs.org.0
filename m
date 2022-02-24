Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D2D7A4C28F6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Feb 2022 11:12:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K47y80sxZz3bV4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Feb 2022 21:12:48 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K47x45l54z30H3
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Feb 2022 21:11:50 +1100 (AEDT)
Received: from mail-lj1-f181.google.com ([209.85.208.181]) by
 mrelayeu.kundenserver.de (mreue108 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MIx7U-1ngLqS2aFe-00KQTZ for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Feb
 2022 11:11:46 +0100
Received: by mail-lj1-f181.google.com with SMTP id t14so2063289ljh.8
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Feb 2022 02:11:46 -0800 (PST)
X-Gm-Message-State: AOAM531lk4GiZCjIGtnprIJNQ3wUnPxQQ0lXG6bKCj0cBdx8i74R0FAB
 Xf7xcYhiGTTaXFToqA1v7AFgg32xvvufF6N6Yt0=
X-Google-Smtp-Source: ABdhPJzPVQaW1f3Bbzw+kTDiMg4Tajz+c6SJ2JtQUsJaSw6D1lJ8eGh3OG9MaDTzij1odC2MMgMswcl0VWfIMCexGbY=
X-Received: by 2002:a5d:59aa:0:b0:1ed:9f45:c2ff with SMTP id
 p10-20020a5d59aa000000b001ed9f45c2ffmr1412807wrr.192.1645694019453; Thu, 24
 Feb 2022 01:13:39 -0800 (PST)
MIME-Version: 1.0
References: <20220224085410.399351-1-guoren@kernel.org>
 <20220224085410.399351-17-guoren@kernel.org>
In-Reply-To: <20220224085410.399351-17-guoren@kernel.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 24 Feb 2022 10:13:23 +0100
X-Gmail-Original-Message-ID: <CAK8P3a13_VBpTidoF_pUdV5g0MFqpSe17rgw=XUv69CCFCN0_g@mail.gmail.com>
Message-ID: <CAK8P3a13_VBpTidoF_pUdV5g0MFqpSe17rgw=XUv69CCFCN0_g@mail.gmail.com>
Subject: Re: [PATCH V6 16/20] riscv: compat: vdso: Add rv32 VDSO base code
 implementation
To: Guo Ren <guoren@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:YwC9hPLRemzSS9iv93W2npwB1GRdGAsFE8MLUPSDO72VQNcjDvp
 AtafuyY3Tq3nIJgTYHEHalw8MaaKm2adU0dkPylHs0fD5vm1e+lX253h2DAfb5VAtRUrh5N
 gyfLk+wOgXnkUp9cau3ApC5PHL6hCOyt8dVjVPiPvpcpfx5jTo7JaYeQMfvHN5b+teSkzLS
 7AofxhParZfGUpYpXbTIw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:hEYwuA0NSFI=:RHxqmSKF0NnoMj7gdiXB0h
 YACgmsfXI3JcLyWXNWh3HGoh4n4E0xkJnFpBC8Mm31rWpG2Sdqgsij6/Bz6+CS7hlyPCa3gSb
 kfUsz6+8vJBFI1dCtWbV2KdVx0hUrCtVqbw7R5EbYjTHFtxW0MefrFMuLAUoGqW5tMIgUIg9E
 plkZ5zCPdXKbQRfHAvJ0aV/y8FMSG9LRDkmW8RCc3/zB/F0Xs1/ZNuFb9t+bkhqwDmXlx/Nxh
 ANpFqrIQ+raXyZwV1W+FrservbXqqATP6qp58VAqjgZlbwM5GEyfn9q8xK1ffFuSrzzeGRvZH
 Qj6ef15FOqeQTpwEKgPl8Nmfv8B1XVTrif5p6ovAHnr30M56msdWg/7AzpeunZ+Ip7v/R5MaW
 E2shJizWeQZ7YmqZ7OJPY0SiAwbCDc3A4s1SsdxGcFl+meGkaN5YlBqeF/i02MLBx2a8vXtTV
 to1FrRaB6TXDI/5BlyfRlAG6QyBHcUi4mtmwYkQnFn4JeR3yvVutw4DX6DSlGJI92AnljzsmK
 hrmFF6iVsDXvgGmpQBgmnmGq5QZKF4qTm9qASWfnfsbimyOBSGxJ/JweWzqeweoxJ2gzCbUq+
 ifKenmxNoTakAGEc95/LXNkRmbFLZw+cE4e84rSyNQ2TNLcUG4NfacySadKcvp/1wY4P66ap5
 wrkafTIeF/bs467i301JGiM1Ok26SysPw74JrabGQXagwQgz8B6YY0eEgfpyOdYax8ypmqfQg
 XlTPKcqV0bDHWd3Bv5n1hZ35KXCJKH/uBkgL3FhusPBoIWZwcM2Ic2yqc3jv68ABMxP+CNrES
 2PIxhSVpU5mLxGg8eGlCPMrZv8BexwQH/T9nBx0VGt0vdMrIK0=
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
Cc: linux-arch <linux-arch@vger.kernel.org>,
 linux-s390 <linux-s390@vger.kernel.org>, Guo Ren <guoren@linux.alibaba.com>,
 Parisc List <linux-parisc@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 gregkh <gregkh@linuxfoundation.org>, Drew Fustini <drew@beagleboard.org>,
 Anup Patel <anup@brainfault.org>, Wang Junqiang <wangjunqiang@iscas.ac.cn>,
 the arch/x86 maintainers <x86@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-csky@vger.kernel.org,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, liush <liush@allwinnertech.com>,
 sparclinux <sparclinux@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Christoph Hellwig <hch@lst.de>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, Wei Fu <wefu@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Feb 24, 2022 at 9:54 AM <guoren@kernel.org> wrote:
>
> From: Guo Ren <guoren@linux.alibaba.com>
>
> There is no vgettimeofday supported in rv32 that makes simple to
> generate rv32 vdso code which only needs riscv64 compiler. Other
> architectures need change compiler or -m (machine parameter) to
> support vdso32 compiling. If rv32 support vgettimeofday (which
> cause C compile) in future, we would add CROSS_COMPILE to support
> that makes more requirement on compiler enviornment.

I think it's just a bug that rv32 doesn't have the vdso version of the
time syscalls. Fixing that is of course independent of the compat support,
but I think you need that anyway, and it would be better to start
out by building the compat vdso with the correct
architecture level.

At least this should be a lot easier than on arch/arm64 because you
can assume that an rv64 compiler is able to also build rv32 output.

        Arnd
