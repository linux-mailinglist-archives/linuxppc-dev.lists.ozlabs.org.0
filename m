Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F0DF84F02FC
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 Apr 2022 15:50:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KVz1r6DKlz30G6
	for <lists+linuxppc-dev@lfdr.de>; Sun,  3 Apr 2022 00:50:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=nifty.com header.i=@nifty.com header.a=rsa-sha256 header.s=dec2015msa header.b=UjBNWOsJ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (domain owner discourages use of this
 host) smtp.mailfrom=kernel.org (client-ip=202.248.20.67;
 helo=condef-02.nifty.com; envelope-from=masahiroy@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=nifty.com header.i=@nifty.com header.a=rsa-sha256
 header.s=dec2015msa header.b=UjBNWOsJ; 
 dkim-atps=neutral
X-Greylist: delayed 234 seconds by postgrey-1.36 at boromir;
 Sun, 03 Apr 2022 00:47:02 AEDT
Received: from condef-02.nifty.com (condef-02.nifty.com [202.248.20.67])
 by lists.ozlabs.org (Postfix) with ESMTP id 4KVyyG1gkRz3fJs
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  3 Apr 2022 00:47:02 +1100 (AEDT)
Received: from conssluserg-02.nifty.com ([10.126.8.81])by condef-02.nifty.com
 with ESMTP id 232DddXV021872
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 2 Apr 2022 22:39:39 +0900
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
 [209.85.216.53]) (authenticated)
 by conssluserg-02.nifty.com with ESMTP id 232DdMnR014940
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 2 Apr 2022 22:39:22 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com 232DdMnR014940
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1648906762;
 bh=DjlDOU+QMjAfHhVG3DyTJmpT3lFDSgL63YIdZlYs+Z8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=UjBNWOsJyDXN7Ik/vwlvvrJkUL3xcxEeg90yUV1f+r5ew2JO7uDPlWeIA2kNCDqEE
 ETj8LWZUJPnYjBjS9QYitIqBWohRa0mjtjCy7cBR8iXTaGfIbhWCc1NXWZ1cw5JxiY
 2vi5QtrPy/3OUu0OYzdLi51TT9qzBH8nJURyyACPdN49U+KhpkF82BO0ztcEVikKL9
 XTxGKqtlAdv2MopYNjZ+KEk1aH+VC4LwedXc6I7LtAd/tdc5Q95a4YNcsChFI+XkrM
 obNKeytY00Sy3kB7FVsQx/4zvlMOZjhq7dvmSJjIyqWa5P4Sap4+WRoCxJgzCbmYZX
 L4dCUCgCPLXEQ==
X-Nifty-SrcIP: [209.85.216.53]
Received: by mail-pj1-f53.google.com with SMTP id jx9so4695562pjb.5
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 02 Apr 2022 06:39:22 -0700 (PDT)
X-Gm-Message-State: AOAM532lAPBjO5EjKO+KRCrplrvwSjdryRob2Vhf3+c4waS6HiWmiRZm
 a+rZcaq0fYlTzXViN+7HQU7QLKigncxEUrVzpa8=
X-Google-Smtp-Source: ABdhPJw2exoLpxI5c+cAeuK679q0cyMySJSrkv8rzRvz/yceSC8H6FLOcidZ+Bg1m2/S7aiMae+xzlzCK43rihaAn5w=
X-Received: by 2002:a17:90b:4d01:b0:1c9:ec79:1b35 with SMTP id
 mw1-20020a17090b4d0100b001c9ec791b35mr16659993pjb.77.1648906761882; Sat, 02
 Apr 2022 06:39:21 -0700 (PDT)
MIME-Version: 1.0
References: <20220402133544.2690231-1-guoren@kernel.org>
 <20220402133544.2690231-5-guoren@kernel.org>
In-Reply-To: <20220402133544.2690231-5-guoren@kernel.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 2 Apr 2022 22:38:34 +0900
X-Gmail-Original-Message-ID: <CAK7LNAS8i2xe2zFQo7mcJeujymhWB7hyp36UWS4Rp9T9dMUu2g@mail.gmail.com>
Message-ID: <CAK7LNAS8i2xe2zFQo7mcJeujymhWB7hyp36UWS4Rp9T9dMUu2g@mail.gmail.com>
Subject: Re: [PATCH V10 04/20] kconfig: Add SYSVIPC_COMPAT for all
 architectures
To: Guo Ren <guoren@kernel.org>
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

On Sat, Apr 2, 2022 at 10:36 PM <guoren@kernel.org> wrote:
>
> From: Guo Ren <guoren@linux.alibaba.com>
>
> The existing per-arch definitions are pretty much historic cruft.
> Move SYSVIPC_COMPAT into init/Kconfig.
>
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Signed-off-by: Guo Ren <guoren@kernel.org>
> Acked-by: Arnd Bergmann <arnd@arndb.de>
> Reviewed-by: Christoph Hellwig <hch@lst.de>
> Tested-by: Heiko Stuebner <heiko@sntech.de>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> ---

Please use "arch:" or something for the commit subject.

I want to see "kconfig:" for
changes under scripts/kconfig/.



-- 
Best Regards
Masahiro Yamada
