Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 23F004A7E13
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Feb 2022 03:44:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jq3145tWjz3cRW
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Feb 2022 13:44:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=IfifaL/Y;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1;
 helo=dfw.source.kernel.org; envelope-from=guoren@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=IfifaL/Y; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jq30J4qvWz2yPY
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Feb 2022 13:44:16 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B2B246156A
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Feb 2022 02:44:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12FCCC340ED
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Feb 2022 02:44:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643856252;
 bh=V51eVJiRBfBtAiPpggOpCZR3uh94Yz/dWJnManIUqRA=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=IfifaL/YvkQeOydK0cgYgy7MaOnD1ofDN9TZ9U0AAgJgX5vkoOM/UCN+eqFDFX8e0
 SIROG24sqmSXhudRlXA3k1jWkp77oSEpy958cVODa3+sWBKJFg5/KfQgGGdSVjxxIs
 tBS1ttU+VD/lfGZc6laeZXX3nMQbkvJraFwXMBoSDxQnFXqyuk7KNTCbNzoNPaUxXu
 obu4PEKMkaRLF0VBJAceVG1kvUSawTvpCDv+XjctdvSnwyZA7NM+d+opMx9qUChsMA
 QIiebpV47EWTVL21TA8YNmrdIhNU6Tt7q6oAVfTnyRCqH7wGOKGMQC/DtV00pJqZ7Z
 uKgAZRx6fuHVA==
Received: by mail-ua1-f49.google.com with SMTP id p26so2677315uaa.11
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 02 Feb 2022 18:44:12 -0800 (PST)
X-Gm-Message-State: AOAM533rDRudU6UDVao0Kxu//JX8JM5IfnLRuBb70vJwkRV5916LF0ln
 +s7XHoV2Um68i9cPhzXjTb28bvPhBLKQAFFp+o0=
X-Google-Smtp-Source: ABdhPJwcymlbtGZh6tQbwNbq4eIqK1FMhWR2Ntg5Vpt7lVSBlW8sS85pNzZxGeDyQITxXLpJvbICejijlor03wlRbBs=
X-Received: by 2002:ab0:2092:: with SMTP id r18mr12760634uak.66.1643856251122; 
 Wed, 02 Feb 2022 18:44:11 -0800 (PST)
MIME-Version: 1.0
References: <20220201150545.1512822-1-guoren@kernel.org>
 <20220201150545.1512822-16-guoren@kernel.org>
 <20220202075159.GB18398@lst.de>
In-Reply-To: <20220202075159.GB18398@lst.de>
From: Guo Ren <guoren@kernel.org>
Date: Thu, 3 Feb 2022 10:44:00 +0800
X-Gmail-Original-Message-ID: <CAJF2gTTxzFo1kdkCDH=2RKkQ1gEzOnUCjxotcsjrqivG4qg-Dw@mail.gmail.com>
Message-ID: <CAJF2gTTxzFo1kdkCDH=2RKkQ1gEzOnUCjxotcsjrqivG4qg-Dw@mail.gmail.com>
Subject: Re: [PATCH V5 15/21] riscv: compat: Add hw capability check for elf
To: Christoph Hellwig <hch@lst.de>
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
 Parisc List <linux-parisc@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Drew Fustini <drew@beagleboard.org>, Anup Patel <anup@brainfault.org>,
 Wang Junqiang <wangjunqiang@iscas.ac.cn>,
 the arch/x86 maintainers <x86@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-csky@vger.kernel.org,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, liush <liush@allwinnertech.com>,
 sparclinux <sparclinux@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, Wei Fu <wefu@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Feb 2, 2022 at 3:52 PM Christoph Hellwig <hch@lst.de> wrote:
>
> On Tue, Feb 01, 2022 at 11:05:39PM +0800, guoren@kernel.org wrote:
> > +bool compat_elf_check_arch(Elf32_Ehdr *hdr)
> > +{
> > +     if (compat_mode_support && (hdr->e_machine == EM_RISCV))
> > +             return true;
> > +     else
> > +             return false;
> > +}
>
> This can be simplified to:
>
>         return compat_mode_support && hdr->e_machine == EM_RISCV;
Good point.

>
> I'd also rename compat_mode_support to compat_mode_supported
Okay

>
> > +
> > +static int compat_mode_detect(void)
> > +{
> > +     unsigned long tmp = csr_read(CSR_STATUS);
> > +
> > +     csr_write(CSR_STATUS, (tmp & ~SR_UXL) | SR_UXL_32);
> > +
> > +     if ((csr_read(CSR_STATUS) & SR_UXL) != SR_UXL_32) {
> > +             pr_info("riscv: 32bit compat mode detect failed\n");
> > +             compat_mode_support = false;
> > +     } else {
> > +             compat_mode_support = true;
> > +             pr_info("riscv: 32bit compat mode detected\n");
> > +     }
>
> I don't think we need these printks here.
Okay

>
> Also this could be simplified to:
>
>         compat_mode_supported = (csr_read(CSR_STATUS) & SR_UXL) == SR_UXL_32;
Okay



-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/
