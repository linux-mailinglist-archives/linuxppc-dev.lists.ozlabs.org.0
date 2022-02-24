Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 161984C2983
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Feb 2022 11:31:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K48MV2VcCz3cFX
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Feb 2022 21:31:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=uKMo67CX;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org;
 envelope-from=guoren@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=uKMo67CX; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K48Lr5dl3z2xY3
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Feb 2022 21:30:44 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1DDF36164A
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Feb 2022 10:30:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCAE7C34100
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Feb 2022 10:30:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645698641;
 bh=UVBFu/2kd+72msKvbsEhY06n98IaQ0VgsAo0y3uTQ2c=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=uKMo67CXZRSwdhBzi8/EEN9oztBr9soHLP8RvL0hIDZzDAQWECQ7f8/Z8eugIY42z
 hdfwcBluy+paiOgWEjWvgQKMnK4adKDRPYUcdzCO1eHFfPr8N0p6F+ynpzpVaLf9iv
 CZRG6rIeJEwNiFrzJtmKDTMeHAoxInP0LBcoot5lwoVNesSWsfBfyAK/NsNtQnkts0
 AMlDmrllC81ZcK3cvVTbMA9khRkXj8pu1dHnRsqHjwpW8ZIpgngP/5/BCpTl75RUUI
 vy/3K30H2fYs4D+RRMADFd4EhSy9aqCosQIJHK8SpqR9iXdhesbYPT0MaBTAKEOI9x
 ItmMoXkR49BCQ==
Received: by mail-vk1-f180.google.com with SMTP id j5so897919vkc.12
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Feb 2022 02:30:41 -0800 (PST)
X-Gm-Message-State: AOAM530atU0saISue+30wD6ITVTMPgwkX1H3izrisEU+Qw1Gs/A71R/f
 EkoQNBp5ttPKCXoKbkqjbLfO+mS19iETCAhfQRY=
X-Google-Smtp-Source: ABdhPJzrvZFAbp4Whh2uDrOBDpqD226YSRYRm6BxUCxiOKTwC758aaNZI0rGrTfTm/5o1TQu5AW4BErik6sfPZlMfiQ=
X-Received: by 2002:a1f:2355:0:b0:32a:e5bb:29a1 with SMTP id
 j82-20020a1f2355000000b0032ae5bb29a1mr790584vkj.2.1645698640594; Thu, 24 Feb
 2022 02:30:40 -0800 (PST)
MIME-Version: 1.0
References: <20220224085410.399351-1-guoren@kernel.org>
 <20220224085410.399351-12-guoren@kernel.org>
 <CAK8P3a3wg9S_zPad74FiJzYBn0M9bQyunuKzmH3z_QQrags5ng@mail.gmail.com>
In-Reply-To: <CAK8P3a3wg9S_zPad74FiJzYBn0M9bQyunuKzmH3z_QQrags5ng@mail.gmail.com>
From: Guo Ren <guoren@kernel.org>
Date: Thu, 24 Feb 2022 18:30:29 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQratosmRtoiKx9xTm3-gBSrnEaWgVrYj1U2WZafR1RVg@mail.gmail.com>
Message-ID: <CAJF2gTQratosmRtoiKx9xTm3-gBSrnEaWgVrYj1U2WZafR1RVg@mail.gmail.com>
Subject: Re: [PATCH V6 11/20] riscv: compat: syscall: Add compat_sys_call_table
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

On Thu, Feb 24, 2022 at 5:38 PM Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Thu, Feb 24, 2022 at 9:54 AM <guoren@kernel.org> wrote:
> >
> > From: Guo Ren <guoren@linux.alibaba.com>
> >
> > Implement compat sys_call_table and some system call functions:
> > truncate64, ftruncate64, fallocate, pread64, pwrite64,
> > sync_file_range, readahead, fadvise64_64 which need argument
> > translation.
> >
> > Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> > Signed-off-by: Guo Ren <guoren@kernel.org>
> > Cc: Arnd Bergmann <arnd@arndb.de>
> > Cc: Palmer Dabbelt <palmer@dabbelt.com>
>
> Here, I was hoping you'd convert some of the other architectures to use
> the same code, but the changes you did do look correct.
>
> Please at least add the missing bit for big-endian architectures here:
>
> +#if !defined(compat_arg_u64) && !defined(CONFIG_CPU_BIG_ENDIAN)
> +#define compat_arg_u64(name)           u32  name##_lo, u32  name##_hi
> +#define compat_arg_u64_dual(name)      u32, name##_lo, u32, name##_hi
> +#define compat_arg_u64_glue(name)      (((u64)name##_hi << 32) | \
> +                                        ((u64)name##_lo & 0xffffffffUL))
> +#endif
>
> with the lo/hi words swapped. With that change:
Got it, I would change it in next version of patch.

>
> Reviewed-by: Arnd Bergmann <arnd@arndb.de>



-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/
