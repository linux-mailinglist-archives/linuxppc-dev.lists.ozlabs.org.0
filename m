Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DCC864F02FA
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 Apr 2022 15:49:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KVz185Fwhz3cRW
	for <lists+linuxppc-dev@lfdr.de>; Sun,  3 Apr 2022 00:49:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=P5SNXXiZ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org;
 envelope-from=guoren@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=P5SNXXiZ; 
 dkim-atps=neutral
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KVysB6QRhz3cMg
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  3 Apr 2022 00:42:38 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id BE8E5CE0952
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  2 Apr 2022 13:42:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAEE5C34117
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  2 Apr 2022 13:42:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648906954;
 bh=Gu+xq607wcJLBd5767EU4rcp1lhQFK3gX5NsYIlfwpk=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=P5SNXXiZYJlwtDY9K7ILgja4Zc87hqaPdzZuA4XcIfQiCgWqgEAqauONat3Oymksi
 87Z+SmQtQCTWwkSUosNSjXfEN/6Jo7qguivEZVbHhPO+6f6ILrIyWD7+UlL+sR9eJi
 vcVJx+BsnnC1yfzFNFurIc6kR9rmo9R49wRg7UcSyTRxRPxKcLrwpgVt+0sOVwfu6c
 4Rw1eHf9eLdaWDKUZgEDb0kGbGBBTkThcnsCarYvj8Dv8khaCb4nOXAguU3V3I6XGi
 Mm/KhWYBr79E28kngvHTPnvvO3WVy6LkMMukedXIJwUV/9UhFvHbYbapjP7HcxRTx/
 Tr0ioD8VxBNgA==
Received: by mail-vs1-f49.google.com with SMTP id t123so5094115vst.13
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 02 Apr 2022 06:42:34 -0700 (PDT)
X-Gm-Message-State: AOAM530ZV5QMA/JAbSUwYjFIFxo6yv6Dkp3U7gX7/w2r86o4tbUj0Pkz
 kR7N/ZMWKalDKK0QLju1x9LSXdEg5pO8IDNB0dk=
X-Google-Smtp-Source: ABdhPJzkOByPICbGCNWRRHvRte+HkSIGERCcxR6bEJaVQtPFOc687kt90hJEYHoJbA8dMpQCnDf3561ZC2qPkk8E2t0=
X-Received: by 2002:a05:6102:1241:b0:325:6bfb:ab75 with SMTP id
 p1-20020a056102124100b003256bfbab75mr22778557vsg.2.1648906953574; Sat, 02 Apr
 2022 06:42:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220402133544.2690231-1-guoren@kernel.org>
 <20220402133544.2690231-5-guoren@kernel.org>
 <CAK7LNAS8i2xe2zFQo7mcJeujymhWB7hyp36UWS4Rp9T9dMUu2g@mail.gmail.com>
In-Reply-To: <CAK7LNAS8i2xe2zFQo7mcJeujymhWB7hyp36UWS4Rp9T9dMUu2g@mail.gmail.com>
From: Guo Ren <guoren@kernel.org>
Date: Sat, 2 Apr 2022 21:42:22 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQvDHFijfq+ekjZV4qj75Yyer84tY_eggsdxz3dL3SrYA@mail.gmail.com>
Message-ID: <CAJF2gTQvDHFijfq+ekjZV4qj75Yyer84tY_eggsdxz3dL3SrYA@mail.gmail.com>
Subject: Re: [PATCH V10 04/20] kconfig: Add SYSVIPC_COMPAT for all
 architectures
To: Masahiro Yamada <masahiroy@kernel.org>
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
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, X86 ML <x86@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-csky@vger.kernel.org,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, sparclinux <sparclinux@vger.kernel.org>,
 "open list:SIFIVE DRIVERS" <linux-riscv@lists.infradead.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Christoph Hellwig <hch@lst.de>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Apr 2, 2022 at 9:39 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> On Sat, Apr 2, 2022 at 10:36 PM <guoren@kernel.org> wrote:
> >
> > From: Guo Ren <guoren@linux.alibaba.com>
> >
> > The existing per-arch definitions are pretty much historic cruft.
> > Move SYSVIPC_COMPAT into init/Kconfig.
> >
> > Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> > Signed-off-by: Guo Ren <guoren@kernel.org>
> > Acked-by: Arnd Bergmann <arnd@arndb.de>
> > Reviewed-by: Christoph Hellwig <hch@lst.de>
> > Tested-by: Heiko Stuebner <heiko@sntech.de>
> > Cc: Palmer Dabbelt <palmer@dabbelt.com>
> > ---
>
> Please use "arch:" or something for the commit subject.
>
> I want to see "kconfig:" for
> changes under scripts/kconfig/.
Okay

>
>
>
> --
> Best Regards
> Masahiro Yamada



-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/
