Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 627394C498C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Feb 2022 16:50:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K4vPK4bjjz3bZR
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Feb 2022 02:50:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=arndb.de
 (client-ip=212.227.126.130; helo=mout.kundenserver.de;
 envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.130])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K4vNt47xmz3bN6
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 26 Feb 2022 02:50:05 +1100 (AEDT)
Received: from mail-wr1-f47.google.com ([209.85.221.47]) by
 mrelayeu.kundenserver.de (mreue012 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MA4ja-1nUjJp1Pz8-00Bdfe for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Feb
 2022 16:50:03 +0100
Received: by mail-wr1-f47.google.com with SMTP id d17so5126125wrc.9
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Feb 2022 07:50:03 -0800 (PST)
X-Gm-Message-State: AOAM530Uo2LLZD3eCXG0JYn3MB5MXoeyafnZf/F7gHx2HcRyr1mRSrj5
 UAIwZN8q2SVLmtSVSEAO2rqdAo0PDdUbwtJJAv8=
X-Google-Smtp-Source: ABdhPJysyJQAyOWUBXwECRmjF7nJ/3KDCWU/jhvnP3qXA/ljoo2U2xK+NNU2HPSONjjfnno6VeVoMKIwA9lIuOaBaho=
X-Received: by 2002:a5d:59aa:0:b0:1ed:9f45:c2ff with SMTP id
 p10-20020a5d59aa000000b001ed9f45c2ffmr6588564wrr.192.1645804202754; Fri, 25
 Feb 2022 07:50:02 -0800 (PST)
MIME-Version: 1.0
References: <20220224085410.399351-1-guoren@kernel.org>
 <20220224085410.399351-17-guoren@kernel.org>
 <CAK8P3a13_VBpTidoF_pUdV5g0MFqpSe17rgw=XUv69CCFCN0_g@mail.gmail.com>
 <CAJF2gTTu5=XwDUwNq=PfnzVRj-jPHH+0cOGhhLr_dFED1H24_g@mail.gmail.com>
In-Reply-To: <CAJF2gTTu5=XwDUwNq=PfnzVRj-jPHH+0cOGhhLr_dFED1H24_g@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 25 Feb 2022 16:49:46 +0100
X-Gmail-Original-Message-ID: <CAK8P3a0MtcB7YMWKZKvpcy4Txi4JTXT61KqFoKZOqhVP530oEA@mail.gmail.com>
Message-ID: <CAK8P3a0MtcB7YMWKZKvpcy4Txi4JTXT61KqFoKZOqhVP530oEA@mail.gmail.com>
Subject: Re: [PATCH V6 16/20] riscv: compat: vdso: Add rv32 VDSO base code
 implementation
To: Guo Ren <guoren@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:CQlMiYGipcNhi3SqgKJV2WKfFFCIc96rTAm+cyYZxk4eP5Kprxt
 iD1+XZrv46IED/Q0/zQ9EV9QvItrgou98ula8LGMjhYQqL4B1YPFGBPlnifnuGHogdmYMXB
 LmzMHzE6IQQr+BbvOyXI85+SZ9JgGchjkTZwkZn1gv7Zv2Cfknj52UbyRwu7WdHyKVsTzh+
 6lW7xl5qYVDP2iRsPik1w==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:rBmx7fhkXo0=:hgRswOH/dWwLAllKLzstBS
 NOskflIqAz5A2r2YDFYBJL/p4d8HfZqSguGlS0fy+cDiWmxKSsDRCThYl3iE2Ic7hzLG0H6T/
 Hvk4IQKP/nw71gbgpKRP8KDXNTBPTtNqhZNTme/2qJSk2ZCvGyDH6nIprcAFw/m+51FAstN+Y
 rL9IghqsveyhLdweI2P4hMpZb2TTtyGEvghsoej/yqM/7ULfqhA7W92P//lSJCP601HPl1vnb
 RurE/l+0MltZ+nolWah2gco030Rdoy0Ihq3Hi8c5X4eNJr0vkUNvrLnJc2Q1Gbrj3sM5uM+52
 wthWO9DzYpJoqNDo7fjj0v1zYpqA/gP+3OyXRZBrSL9L8aBWhboE7XkDt7GjQdlL0nCH/+anL
 8FVT2aJNQ6mGouznaAJNzseFfvSlM7HwPZi/d/C6ku9yHTTt/V+zLHZt9Gox4tG5SMmcCLls9
 CP2zyEYWBFuu3AlZTsLgyvfwhcflD8B1RfG3LiNZkcJ/FePmRb+CkqdG0Xk6oyzPx/XCgJx8N
 HEdTRJAj299acn23bvPQs3OzfR/QE0QfemEchPX+fyHBdUic2aMGSWkBaPke/hq1xF/PCDYQf
 mzJ9S6yBLU3Y0XTiC+jJ4U95bYTbqe/vFl1y1jfOLLYhkI8geGYSoTjGM7Hs1tsWX2mMFvmtd
 cP6Om6eLSZ7Emnem0/tvX6X8PfQYJO7QTxQlgoed6Y5kqyhwzjfgU+rsYwSphb7c/86R25j5p
 sroVJRSDIMLDQLHA/NWmWYWxvIyOIa76IU5nwHbRKm/Qw4THkikSrfm+VEDYmUffhtA/kLoUt
 PrULqquTnK/D9lHlNP2DukfB8HPQ+hX/9wslTU2npKgOoqlR2k=
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

On Fri, Feb 25, 2022 at 4:42 PM Guo Ren <guoren@kernel.org> wrote:
>
> Hi Arnd & Palmer,
>
> Here is the new modified compat_vdso/Makefile, please have a look,
> first. Then I would update it to v7:
> ===========================================
> # SPDX-License-Identifier: GPL-2.0-only
> #
> # Makefile for compat_vdso
> #
>
> # Symbols present in the compat_vdso
> compat_vdso-syms  = rt_sigreturn
> compat_vdso-syms += getcpu
> compat_vdso-syms += flush_icache
>
> ifdef CROSS_COMPILE_COMPAT
>         COMPAT_CC := $(CROSS_COMPILE_COMPAT)gcc
>         COMPAT_LD := $(CROSS_COMPILE_COMPAT)ld
> else
>         COMPAT_CC := $(CC)
>         COMPAT_LD := $(LD)
> endif
>
> COMPAT_CC_FLAGS := -march=rv32g -mabi=ilp32
> COMPAT_LD_FLAGS := -melf32lriscv

Have you come across a case in which a separate cross toolchain
is required? If not, I would leave this out and just set the flags for the
normal toolchain.

I also think it would be a nicer split to build the two vdso variants
as vdso64/vdso32 rather than vdso/compat_vdso. That way,
the build procedure can be kept as close as possible to the
native 32-bit build.

        Arnd
