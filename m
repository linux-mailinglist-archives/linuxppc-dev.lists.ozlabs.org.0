Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9430D4C4A16
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Feb 2022 17:07:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K4vnM5rxYz3cMd
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Feb 2022 03:07:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=WkbIlFcJ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1;
 helo=dfw.source.kernel.org; envelope-from=guoren@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=WkbIlFcJ; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K4vmk6qnlz2yfm
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 26 Feb 2022 03:07:18 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7972E61B18
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Feb 2022 16:07:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42994C36AE2
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Feb 2022 16:07:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645805236;
 bh=KbJfW32hJ/F19yfN7A1bXil25wuVvtsMCViBmRGt63Q=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=WkbIlFcJhtK50zmM1SUqT+c2BPoPb/PAsS5g6c6LqFS7dLJTZxLAPvig1x6SXi8te
 l5Cx5rIlFRnbSFqV0Md2Gt99TvNmEAE85nc8zZkW2KAysaFXNYW8weU3KRSI1Joub1
 XfgGa954+3/CiMxkbGo51ZitZf59ze3/G/mztC6h6fIENRXkrcAjUFFN1d6J+PDcBw
 gx1uVRfyOgaOR4bZKjVcG7PIz/MCA3RNLoXSnngVfstymXQ0A55zH1r8rE0BbpfyBI
 53H/HcqUiVVHaCBF70mR9z8l6owgUIz3VOsTGHF1gt/NgeAutWcTYSskkxOKLmnMHx
 9rb/DOmJIf44g==
Received: by mail-ua1-f42.google.com with SMTP id 102so2685131uag.6
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Feb 2022 08:07:16 -0800 (PST)
X-Gm-Message-State: AOAM533RxnPOcqjidg8IaA07k/pPgYBWIlmjTBVCiBcv7Oy4buc81pY5
 cGjEzcDKlPF7EYoS5/pbvhbbhX/nQ1Wvdx3bZyQ=
X-Google-Smtp-Source: ABdhPJzyFkCkLFwk2uiu55UbxfUmfSs3x9iDpfEO2XzZ1mh9E9zaiS00R4pCw1xb9Wsx0R973/NIBGmLnXTfXz/Q4Mk=
X-Received: by 2002:ab0:1112:0:b0:33e:802f:e335 with SMTP id
 e18-20020ab01112000000b0033e802fe335mr3769822uab.57.1645805235064; Fri, 25
 Feb 2022 08:07:15 -0800 (PST)
MIME-Version: 1.0
References: <20220224085410.399351-1-guoren@kernel.org>
 <20220224085410.399351-17-guoren@kernel.org>
 <CAK8P3a13_VBpTidoF_pUdV5g0MFqpSe17rgw=XUv69CCFCN0_g@mail.gmail.com>
 <CAJF2gTTu5=XwDUwNq=PfnzVRj-jPHH+0cOGhhLr_dFED1H24_g@mail.gmail.com>
 <CAK8P3a0MtcB7YMWKZKvpcy4Txi4JTXT61KqFoKZOqhVP530oEA@mail.gmail.com>
In-Reply-To: <CAK8P3a0MtcB7YMWKZKvpcy4Txi4JTXT61KqFoKZOqhVP530oEA@mail.gmail.com>
From: Guo Ren <guoren@kernel.org>
Date: Sat, 26 Feb 2022 00:07:04 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQtUonLQn+aRyf6f1Ei9o6wWCrjHXNkfa2rxKMEGuDw2g@mail.gmail.com>
Message-ID: <CAJF2gTQtUonLQn+aRyf6f1Ei9o6wWCrjHXNkfa2rxKMEGuDw2g@mail.gmail.com>
Subject: Re: [PATCH V6 16/20] riscv: compat: vdso: Add rv32 VDSO base code
 implementation
To: Arnd Bergmann <arnd@arndb.de>
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
Cc: linux-arch <linux-arch@vger.kernel.org>,
 linux-s390 <linux-s390@vger.kernel.org>, Guo Ren <guoren@linux.alibaba.com>,
 Parisc List <linux-parisc@vger.kernel.org>,
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

On Fri, Feb 25, 2022 at 11:50 PM Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Fri, Feb 25, 2022 at 4:42 PM Guo Ren <guoren@kernel.org> wrote:
> >
> > Hi Arnd & Palmer,
> >
> > Here is the new modified compat_vdso/Makefile, please have a look,
> > first. Then I would update it to v7:
> > ===========================================
> > # SPDX-License-Identifier: GPL-2.0-only
> > #
> > # Makefile for compat_vdso
> > #
> >
> > # Symbols present in the compat_vdso
> > compat_vdso-syms  = rt_sigreturn
> > compat_vdso-syms += getcpu
> > compat_vdso-syms += flush_icache
> >
> > ifdef CROSS_COMPILE_COMPAT
> >         COMPAT_CC := $(CROSS_COMPILE_COMPAT)gcc
> >         COMPAT_LD := $(CROSS_COMPILE_COMPAT)ld
> > else
> >         COMPAT_CC := $(CC)
> >         COMPAT_LD := $(LD)
> > endif
> >
> > COMPAT_CC_FLAGS := -march=rv32g -mabi=ilp32
> > COMPAT_LD_FLAGS := -melf32lriscv
>
> Have you come across a case in which a separate cross toolchain
> is required? If not, I would leave this out and just set the flags for the
> normal toolchain.
Okay

>
> I also think it would be a nicer split to build the two vdso variants
> as vdso64/vdso32 rather than vdso/compat_vdso. That way,
> the build procedure can be kept as close as possible to the
> native 32-bit build.
Yes, current native 32-bit vdso & 64-bit vdso use the same
vdso/Makfile. So, I think it could be another patch for this cleanup.

>
>         Arnd



-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/
