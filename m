Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 760FC494F40
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jan 2022 14:43:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JfkHq2LFpz3bdG
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jan 2022 00:43:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=cN8TeiZR;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org;
 envelope-from=guoren@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=cN8TeiZR; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JfkH95q3tz2x9c
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Jan 2022 00:43:17 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0D94461762
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Jan 2022 13:43:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7858FC340E2
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Jan 2022 13:43:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642686195;
 bh=D+Etye9r3fua1x02UnecAbZv0CalmuxTOWCQ+e8HzdE=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=cN8TeiZRwruoIRJkOoV5cCJrRkANf7l3v6f2dnF2xlBmUXAwCKjGM3kmUmmr7lfcJ
 1APkSDv+D1H3WQp3uuaV0kT/S8OeoYHOyoCm+Uh5ZwvEw7IhawBDNn89d/q5eyXPa3
 nAY2sqd8hpAZSIAYJGf70xVxfIBc+dqte1gPEuhjwCNzY97jFtY3PEtY924x+w0WZd
 wAeTD/djlb2LaOfPp5PAZ48mZs2FwdBxQt7SiLMX8KePhQm69b789EqQ8wWQDq0dC/
 8Od7DRhnmvf6YwO+Awvtgi4eoym2J8Zy/zeuP32XDNFMzEGlHelD0Dh2qQJ7xmBcHR
 1Xfu4zn6tGfTQ==
Received: by mail-vk1-f169.google.com with SMTP id n14so3597664vkk.6
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Jan 2022 05:43:15 -0800 (PST)
X-Gm-Message-State: AOAM533k9CiAXjuQvleP5Xkbu/qxbcraCADkUt2rKenYN4o5K9x7f2S6
 nHlAMQ1h1SoTxA6INDZvm+Q938W10FeqvpbYeVM=
X-Google-Smtp-Source: ABdhPJxsPoD4QKSG5cjRmiwRNbBq9kp7PjD2iW5iWTPRRES5wTkmV/37UExZW0GDHhLl6tuiT3nFW4CEpN2qDzbKvC8=
X-Received: by 2002:a1f:2844:: with SMTP id o65mr15161979vko.2.1642686194514; 
 Thu, 20 Jan 2022 05:43:14 -0800 (PST)
MIME-Version: 1.0
References: <20220120073911.99857-16-guoren@kernel.org>
 <CAK8P3a0Mr2m2dVoVss59cN-9X7GVBD29VQLo3m4xswRznk_WUQ@mail.gmail.com>
In-Reply-To: <CAK8P3a0Mr2m2dVoVss59cN-9X7GVBD29VQLo3m4xswRznk_WUQ@mail.gmail.com>
From: Guo Ren <guoren@kernel.org>
Date: Thu, 20 Jan 2022 21:43:03 +0800
X-Gmail-Original-Message-ID: <CAJF2gTTGD_Ks2pO4jXx+QbiLV4nkjzk6mP-xKJOCvHtGTeFfOQ@mail.gmail.com>
Message-ID: <CAJF2gTTGD_Ks2pO4jXx+QbiLV4nkjzk6mP-xKJOCvHtGTeFfOQ@mail.gmail.com>
Subject: Re: [PATCH V3 15/17] riscv: compat: Add UXL_32 support in start_thread
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

On Thu, Jan 20, 2022 at 9:39 PM Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Thu, Jan 20, 2022 at 8:39 AM <guoren@kernel.org> wrote:
> > +
> > +#ifdef CONFIG_COMPAT
> > +       if (is_compat_task())
> > +               regs->status |= SR_UXL_32;
> > +#endif
>
>
> You should not need that #ifdef, as the is_compat_task() definition is
> meant to drop the code at compile time, unless the SR_UXL_32
> definition is not visible here.
I almost put CONFIG_COMPAT in every compat related code, because I
hope the next arch that wants to support COMPAT could easily find
where to be modified.

>
>          Arnd



-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/
