Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C5524A4787
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 Jan 2022 13:49:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JnSZK71vMz3cPv
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 Jan 2022 23:49:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=arndb.de
 (client-ip=212.227.17.10; helo=mout.kundenserver.de;
 envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JnSYs2KtKz2x9N
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 31 Jan 2022 23:49:19 +1100 (AEDT)
Received: from mail-oi1-f179.google.com ([209.85.167.179]) by
 mrelayeu.kundenserver.de (mreue106 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MFL8J-1n3Fis2cRd-00Fh4u for <linuxppc-dev@lists.ozlabs.org>; Mon, 31 Jan
 2022 13:49:15 +0100
Received: by mail-oi1-f179.google.com with SMTP id s185so26430622oie.3
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 31 Jan 2022 04:49:15 -0800 (PST)
X-Gm-Message-State: AOAM531pjxuOThdz2PZ9GgzsB58vT+2s1k9H5WGIjvd11IK1Ko4tZGrK
 yxsSZqW3q8+yROMyppsf1qWMSwqB3wtnJ+dSQJE=
X-Google-Smtp-Source: ABdhPJy98n+kDWK/9SbbjWdkcIPv//3sxAoIsXTByqyfuSFCJCabGM0ZH14kpP64umFfYvpncQnk8rPRUpmA1wB2kjw=
X-Received: by 2002:aca:2b16:: with SMTP id i22mr15607147oik.128.1643633354113; 
 Mon, 31 Jan 2022 04:49:14 -0800 (PST)
MIME-Version: 1.0
References: <20220129121728.1079364-1-guoren@kernel.org>
 <20220129121728.1079364-6-guoren@kernel.org>
 <YffUqErSVDgbGLTu@infradead.org>
In-Reply-To: <YffUqErSVDgbGLTu@infradead.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 31 Jan 2022 13:48:58 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1jZyVBW70K6_u3mvXYNowV4DTBxivKc2L=HbRK8SgRXg@mail.gmail.com>
Message-ID: <CAK8P3a1jZyVBW70K6_u3mvXYNowV4DTBxivKc2L=HbRK8SgRXg@mail.gmail.com>
Subject: Re: [PATCH V4 05/17] riscv: Fixup difference with defconfig
To: Christoph Hellwig <hch@infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:6Hh4m1mSwq1zato+3F7Ijve2tQjgnrOXnG3f8XBsUYMgrKhMfQb
 e5tPGc1GoXE1O+No3rJwN8oYaYmjsRrYRuuOngAO2B1HtU5igIp9kuHQhLmYVVfU5Q9NfXX
 dbr03AwrQyfXHPHNgbj7KoyuL/dvhSIvP7q4mzVCViOVhFN55t6e+Apx7uyOdei69X9KjBH
 S1XBULzjhGCB6HUFvY3DQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:mQBY27/ze2Y=:PLReTDvecg5rIRU6VWM2oT
 7EDUmXS795qIa/l3oZf26j+4H0lQlPQDsGEgR8LzrxA12SRvLiphu4KfTomCQ2kb4d4wTugpW
 ZMA2AUKJXbzCwUHVfgq9/vRVgR3Leqj68SA0VQsVq/0FP2SpOxkYZSSPDN99emSorb0ZG4ne8
 RODcURAG7sdMPZm+PolkeRxrWwrBjCvdCU9PDXB10dmkuZ1E+e5ZOzmkXiTs43ocS8un6zV/9
 Xt/tW+W3JKWBFzxjg9/T2eyDmSH+QOdX14fwgmkPfza2SWQ/lO8eYK9CkYjrKKGRajiq4CPw0
 9FyS9sUtJjB6xVzzW6VB7xswAudjI4F+00TqGXIdWoKsBmPF5CM9+BKqOGaEcVSOUOmDX2yhz
 FC5OF64aVDlgASWvWyU6EuNLFTJAC0v23uY9Fw2I1FXpJtKSEL9j7XwdLS+TT44g07diXCIJV
 j3UBMt1zr1xuBKgd4ZtWpa/GSVOyx/DjP7ACnoYL+ZmpyWl1ZMjFKejvvzv5KBrblMSZMbRLm
 Y9e4Osw3YZ9UzW9USssW5NP/krafjV5PrHhnXUQX+awfZIeE3IkGIvA2g6iI+vpdP75m/w+pr
 dYcnhZNAYrVxK2reG10Hgp9TN2xcshJtFYzMdzzl4SOb5RwzXKcfIfhs77tUgacImNGj0HVZw
 aqtKyQ2BzMyzH1EEzpgc6V+OVYxX4r1Lf2mvQp5POUKGaVxIAKME1h+MyCkT5YDa2AKofqv8E
 CZe5I2zep1Q+HZRUQc4ivHo7sJD6FtrkGjA9FONMIL9mv8GgIvIbdgI2+/4COzDHjK5N7n5jf
 4MVa/gCzBZXAjio+TOrgWhyQfg5sHtOelpv73tp5k/OjffAui0=
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
 Guo Ren <guoren@kernel.org>, sparclinux <sparclinux@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 linux-arch <linux-arch@vger.kernel.org>,
 linux-s390 <linux-s390@vger.kernel.org>, Anup Patel <anup@brainfault.org>,
 the arch/x86 maintainers <x86@kernel.org>, linux-csky@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Parisc List <linux-parisc@vger.kernel.org>,
 Drew Fustini <drew@beagleboard.org>, liush <liush@allwinnertech.com>,
 Wang Junqiang <wangjunqiang@iscas.ac.cn>, Anup Patel <anup.patel@wdc.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, gregkh <gregkh@linuxfoundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Wei Fu <wefu@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jan 31, 2022 at 1:23 PM Christoph Hellwig <hch@infradead.org> wrote:
>
> On Sat, Jan 29, 2022 at 08:17:16PM +0800, guoren@kernel.org wrote:
> > From: Guo Ren <guoren@linux.alibaba.com>
> >
> > Let's follow the origin patch's spirit:
> >
> > The only difference between rv32_defconfig and defconfig is that
> > rv32_defconfig has  CONFIG_ARCH_RV32I=y.
> >
> > This is helpful to compare rv64-compat-rv32 v.s. rv32-linux.
> >
> > Fixes: 1b937e8faa87ccfb ("RISC-V: Add separate defconfig for 32bit systems")
> > Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> > Signed-off-by: Guo Ren <guoren@kernel.org>
>
> Wouldn't a common.config that generats both the 32-bit and 64-bit
> configs a better idea?

I thought that is what the patch does, there is already the normal 64-bit
defconfig, and the new makefile target makes this shared with 32-bit
to prevent them from diverging again.

        Arnd
