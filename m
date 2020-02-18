Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 13EAE163720
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Feb 2020 00:26:17 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48McRp10YJzDqdp
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Feb 2020 10:26:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48MLN23lb0zDqg4
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Feb 2020 23:52:02 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=nifty.com header.i=@nifty.com header.a=rsa-sha256
 header.s=dec2015msa header.b=bdjuPCCo; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 48MLN150MLz8sy8
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Feb 2020 23:52:01 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 48MLMz0H9dz9sSG; Tue, 18 Feb 2020 23:51:59 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=softfail (domain owner discourages use of this
 host) smtp.mailfrom=kernel.org (client-ip=202.248.20.68;
 helo=condef-03.nifty.com; envelope-from=masahiroy@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=nifty.com header.i=@nifty.com header.a=rsa-sha256
 header.s=dec2015msa header.b=bdjuPCCo; 
 dkim-atps=neutral
X-Greylist: delayed 345 seconds by postgrey-1.36 at bilbo;
 Tue, 18 Feb 2020 23:51:55 AEDT
Received: from condef-03.nifty.com (condef-03.nifty.com [202.248.20.68])
 by ozlabs.org (Postfix) with ESMTP id 48MLMv72B1z9sRG
 for <linuxppc-dev@ozlabs.org>; Tue, 18 Feb 2020 23:51:55 +1100 (AEDT)
Received: from conssluserg-04.nifty.com ([10.126.8.83])by condef-03.nifty.com
 with ESMTP id 01ICfWLl029602
 for <linuxppc-dev@ozlabs.org>; Tue, 18 Feb 2020 21:41:32 +0900
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com
 [209.85.222.51]) (authenticated)
 by conssluserg-04.nifty.com with ESMTP id 01ICf2n7028138
 for <linuxppc-dev@ozlabs.org>; Tue, 18 Feb 2020 21:41:03 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com 01ICf2n7028138
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1582029663;
 bh=5WLyBNqBfdHbXYcVbM4zJouzFsvML+0yqJnzNVlR5y4=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=bdjuPCCoRQrRKByanB4+c05cQY7zO0rPYRmM5kDyiwgJUB1y/K32drUDSu29u2/99
 nCx5sGqi+siuBCbe+uxYTpqMipVw6akIrFfOcOVKEQNfZbhSmhfBSsDjCvJEgRnE7J
 dpUOczs7kXzClHdHqj+vS/d7v2CQ6OFKmqblow3r8BppPW/zyEIafHObRBvNqBau63
 l6Mlwszu/rom6DeDRjAOM7X5MZRk5nZohB42avIvq0M9OzTzU7LLduDPWPU5B4Ls0p
 1By3oiCKYnTXbHBf6KtTvTWhDhRBGrq+8cKFbHg/ZgFZTCgvdhrfYNZEmXmcGSfg6d
 rhJZtLf4gCnSw==
X-Nifty-SrcIP: [209.85.222.51]
Received: by mail-ua1-f51.google.com with SMTP id a33so7365378uad.11
 for <linuxppc-dev@ozlabs.org>; Tue, 18 Feb 2020 04:41:03 -0800 (PST)
X-Gm-Message-State: APjAAAXPnBtiLeCjaOZV0fB714nzgm+pbW2BVCGmBaebFQKiSbWd0O+W
 WY+MK+Z6VHXPNIIhpoK/jHaIAUx2WdCBj3ws6ZU=
X-Google-Smtp-Source: APXvYqyOx0VaGjr3MLtfBXvQBCzxhxw/amncW9F7TWzMdPNiNjJ9e1zJFUwPiaYkCDZuL7Ij/S4cVsEv1be0B4hehF0=
X-Received: by 2002:ab0:45c7:: with SMTP id u65mr9743531uau.109.1582029661933; 
 Tue, 18 Feb 2020 04:41:01 -0800 (PST)
MIME-Version: 1.0
References: <20200218111842.1641-1-mpe@ellerman.id.au>
In-Reply-To: <20200218111842.1641-1-mpe@ellerman.id.au>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 18 Feb 2020 21:40:26 +0900
X-Gmail-Original-Message-ID: <CAK7LNARM5nf4NhG=E7UZedDpm_Ndwa5zFCDF=XFM7gXBf5uVow@mail.gmail.com>
Message-ID: <CAK7LNARM5nf4NhG=E7UZedDpm_Ndwa5zFCDF=XFM7gXBf5uVow@mail.gmail.com>
Subject: Re: [PATCH] powerpc/Makefile: Mark phony targets as PHONY
To: Michael Ellerman <mpe@ellerman.id.au>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Wed, 19 Feb 2020 10:24:45 +1100
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
Cc: linuxppc-dev@ozlabs.org,
 Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Feb 18, 2020 at 8:19 PM Michael Ellerman <mpe@ellerman.id.au> wrote:
>
> Some of our phony targets are not marked as such. This can lead to
> confusing errors, eg:
>
>   $ make clean
>   $ touch install
>   $ make install
>   make: 'install' is up to date.
>   $
>
> Fix it by adding them to the PHONY variable which is marked phony in
> the top-level Makefile. In arch/powerpc/boot/Makefile we do it
> manually.


You can do likewise in arch/powerpc/boot/Makefile
because it is marked phony in scripts/Makefile.build





-- 
Best Regards
Masahiro Yamada
