Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0461A31B170
	for <lists+linuxppc-dev@lfdr.de>; Sun, 14 Feb 2021 18:10:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DdtzH0TTyz30Kq
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Feb 2021 04:10:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=nifty.com header.i=@nifty.com header.a=rsa-sha256 header.s=dec2015msa header.b=eW5SCVd/;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (domain owner discourages use of this
 host) smtp.mailfrom=kernel.org (client-ip=202.248.20.68;
 helo=condef-03.nifty.com; envelope-from=masahiroy@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=nifty.com header.i=@nifty.com header.a=rsa-sha256
 header.s=dec2015msa header.b=eW5SCVd/; 
 dkim-atps=neutral
X-Greylist: delayed 204 seconds by postgrey-1.36 at boromir;
 Mon, 15 Feb 2021 04:10:09 AEDT
Received: from condef-03.nifty.com (condef-03.nifty.com [202.248.20.68])
 by lists.ozlabs.org (Postfix) with ESMTP id 4Ddtyn6LMgz2yTR
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Feb 2021 04:10:09 +1100 (AEDT)
Received: from conssluserg-04.nifty.com ([10.126.8.83])by condef-03.nifty.com
 with ESMTP id 11EH1XLt030887
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Feb 2021 02:01:33 +0900
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
 [209.85.210.170]) (authenticated)
 by conssluserg-04.nifty.com with ESMTP id 11EH1Den003094
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Feb 2021 02:01:14 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com 11EH1Den003094
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1613322074;
 bh=SP1sGJk9Sz6Zv6lJ9Wi/Vff8sScxvUIuNUkChOHpFR8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=eW5SCVd/ORO2ykDHxnNRrd0j5pNeofX24lJWfc1sAWEZK87VwCvlyBONkk1p+q0pw
 n9urDcCM7JXO/83SDgjvjWIuq0kCzJpxghQ0kdEY/9lSUqF57fsB4kVM44LTekaoBL
 2K5usgTVkdb+i9kzobmJV+tecZNrbgkAygUEWwX3cvMZxzFNtx08+4IWsN9L58B4V9
 msLNld5lBI4A8trmLyO3EgTzKOINsLN5xgyvh+eWnDvPTyAVb6rNcHXCo6xnYQ8S9l
 7hdmlhpR1RGeMV1AEHEn5ADueffOKPk44du6buIJ89LAEEs34fToTGEhTLY+vWrQY3
 BiMMNZH6MaRbw==
X-Nifty-SrcIP: [209.85.210.170]
Received: by mail-pf1-f170.google.com with SMTP id m6so2790931pfk.1
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 14 Feb 2021 09:01:13 -0800 (PST)
X-Gm-Message-State: AOAM533SxYugBHo2Aao1e54KulOjwhjY8nr/ugmrOU975TWtS57uXOHR
 z2kkxd1lrhLrC0XNcb6esXIr3+lqer3jqq+uaHM=
X-Google-Smtp-Source: ABdhPJynyvRuko2AvW0s/Rsmpz6hR6NWNFNxrImHm+1o7F+Y7g0dNzPk8oFZuEX0oJ2YCILzMn7MQK6BnXeqMrnP+x0=
X-Received: by 2002:a63:1f1d:: with SMTP id f29mr11945438pgf.47.1613322073045; 
 Sun, 14 Feb 2021 09:01:13 -0800 (PST)
MIME-Version: 1.0
References: <20210128005110.2613902-1-masahiroy@kernel.org>
 <20210128005110.2613902-22-masahiroy@kernel.org>
In-Reply-To: <20210128005110.2613902-22-masahiroy@kernel.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Mon, 15 Feb 2021 02:00:35 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQDcfqSCsCeG9+ytrJNfD5mS8OLS2uZS8WRBuTHRL1qRg@mail.gmail.com>
Message-ID: <CAK7LNAQDcfqSCsCeG9+ytrJNfD5mS8OLS2uZS8WRBuTHRL1qRg@mail.gmail.com>
Subject: Re: [PATCH 21/27] sparc: remove wrong comment from
 arch/sparc/include/asm/Kbuild
To: linux-arch <linux-arch@vger.kernel.org>, X86 ML <x86@kernel.org>
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
Cc: "open list:TENSILICA XTENSA PORT \(xtensa\)"
 <linux-xtensa@linux-xtensa.org>, linux-ia64@vger.kernel.org,
 linux-parisc@vger.kernel.org,
 Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
 Linux-sh list <linux-sh@vger.kernel.org>, linux-um@lists.infradead.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-mips@vger.kernel.org, linux-m68k <linux-m68k@lists.linux-m68k.org>,
 linux-alpha@vger.kernel.org, sparclinux <sparclinux@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jan 28, 2021 at 9:52 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> These are NOT exported to userspace.
>
> The headers listed in arch/sparc/include/uapi/asm/Kbuild are exported.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Applied to linux-kbuild/fixes.


> ---
>
>  arch/sparc/include/asm/Kbuild | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/arch/sparc/include/asm/Kbuild b/arch/sparc/include/asm/Kbuild
> index 3688fdae50e4..aec20406145e 100644
> --- a/arch/sparc/include/asm/Kbuild
> +++ b/arch/sparc/include/asm/Kbuild
> @@ -1,6 +1,4 @@
>  # SPDX-License-Identifier: GPL-2.0
> -# User exported sparc header files
> -
>  generated-y += syscall_table_32.h
>  generated-y += syscall_table_64.h
>  generated-y += syscall_table_c32.h
> --
> 2.27.0
>


-- 
Best Regards
Masahiro Yamada
