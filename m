Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EDF7495A3E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jan 2022 08:00:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jg9Hr3cgQz3bVL
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jan 2022 18:00:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=rkWc8Grm;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1;
 helo=dfw.source.kernel.org; envelope-from=guoren@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=rkWc8Grm; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jg9H73Pxnz30NR
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Jan 2022 17:59:47 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C8FD761774
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Jan 2022 06:59:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B20FFC340EA
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Jan 2022 06:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642748382;
 bh=4ShAu9TMO9pCCFhxDCpJN37xIb8io+l6Oyhyz+wkc74=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=rkWc8GrmU4jDh8MIgKhU1tVmZnCPK978zpVeaoKL9BABXmrLvJhp7qT1axvVYenFf
 EXl+ILKxghGdYexiqzYSqUGqzgOJdRw9gxLBkPt1lugs/J2H5kUsa8aA2+geA99vJC
 kLBagAY8ht9vk/XtIQSnuK2KgVnBG1tZNY3D+9ZpekZpAe6KG4Y1gKHuohLVN8Frmz
 tT2NlAfoov0vkk9BzpknOsIfrUfWc/Co/Jj4RBd96p/9JkewBRZ2gjADB/m/KTeuzB
 RegN4xP87sZHPeAD0ROhV9YXpgX9yXjHzCBlxEjIP0LlJnVH/PD2rGtIyqpYIfLIwl
 Ft604c34avssg==
Received: by mail-vk1-f169.google.com with SMTP id j185so1318880vkc.1
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Jan 2022 22:59:42 -0800 (PST)
X-Gm-Message-State: AOAM530dbZFaXgg+yg5saTa65d56xo3Z9bIMwjKUNeIrJHh9PMwHYeOl
 sdybt2iIPz4UDP7sYyubnIgPEQVuIgZTWlCX/pI=
X-Google-Smtp-Source: ABdhPJzfHGuI3QjQ1xrUHESSAg6lyHrYGXHJnEkduCUf4mRHX9u1+bm5wEa4HeHgEF2DEq8OtNRB3r3xOJW73X//3VQ=
X-Received: by 2002:ac5:cbc8:: with SMTP id h8mr1146902vkn.8.1642748381690;
 Thu, 20 Jan 2022 22:59:41 -0800 (PST)
MIME-Version: 1.0
References: <20220120073911.99857-7-guoren@kernel.org>
 <CAK8P3a00uYPBBphpipBoqCnGFwr_C9vDzS1p1iLN==YTVOARug@mail.gmail.com>
In-Reply-To: <CAK8P3a00uYPBBphpipBoqCnGFwr_C9vDzS1p1iLN==YTVOARug@mail.gmail.com>
From: Guo Ren <guoren@kernel.org>
Date: Fri, 21 Jan 2022 14:59:30 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQVgDkyVdoezsrA4AN=9C7RMOxZBCyLB2JvQkKYsLud3Q@mail.gmail.com>
Message-ID: <CAJF2gTQVgDkyVdoezsrA4AN=9C7RMOxZBCyLB2JvQkKYsLud3Q@mail.gmail.com>
Subject: Re: [PATCH V3 06/17] riscv: compat: Add basic compat date type
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
Cc: linux-s390 <linux-s390@vger.kernel.org>, Guo Ren <guoren@linux.alibaba.com>,
 gregkh <gregkh@linuxfoundation.org>, Drew Fustini <drew@beagleboard.org>,
 Anup Patel <anup@brainfault.org>, Wang Junqiang <wangjunqiang@iscas.ac.cn>,
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

On Thu, Jan 20, 2022 at 5:35 PM Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Thu, Jan 20, 2022 at 8:38 AM <guoren@kernel.org> wrote:
>
> > @@ -0,0 +1,136 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only */
> > +#ifndef __ASM_COMPAT_H
> > +#define __ASM_COMPAT_H
> > +
> > +#define compat_mode_t  compat_mode_t
> > +typedef u16            compat_mode_t;
>
> I think this one is wrong, as rv32 should get the native definition from
>
> include/uapi/asm-generic/posix_types.h:typedef unsigned int     __kernel_mode_t;
>
> I think it works if you just remove those two lines. The rest looks good to me.
Yes, you are right. compat_mode_t should be unsigned int.

>
>        Arnd



-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/
