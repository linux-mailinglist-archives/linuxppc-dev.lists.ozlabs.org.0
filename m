Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F401B320C00
	for <lists+linuxppc-dev@lfdr.de>; Sun, 21 Feb 2021 18:16:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DkBmT0Rynz3cPT
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Feb 2021 04:16:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=nifty.com header.i=@nifty.com header.a=rsa-sha256 header.s=dec2015msa header.b=bMuBhHK7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (domain owner discourages use of this
 host) smtp.mailfrom=kernel.org (client-ip=210.131.2.91;
 helo=conssluserg-06.nifty.com; envelope-from=masahiroy@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=nifty.com header.i=@nifty.com header.a=rsa-sha256
 header.s=dec2015msa header.b=bMuBhHK7; 
 dkim-atps=neutral
Received: from conssluserg-06.nifty.com (conssluserg-06.nifty.com
 [210.131.2.91])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DkBm03WFyz30M8
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Feb 2021 04:15:44 +1100 (AEDT)
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com
 [209.85.167.176]) (authenticated)
 by conssluserg-06.nifty.com with ESMTP id 11LHFQrZ029418
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Feb 2021 02:15:27 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com 11LHFQrZ029418
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1613927727;
 bh=+E+JRgKeitH5eFBx4Z/rh8FyWasix1MSTNAEXqizMQU=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=bMuBhHK7G0jarpKwNRXWEMYT5MtPlzuF5j6jQhR0vKMbsbDlQYSfL7y4bC3BtKc+c
 +x9fwA0r9GMAlg25UIIjgntPPxvjQKVJXrieXIEBqLwSYbUOMLRJs/BBjg9S5lDoJe
 YFO+UWc6yok8wxWw5YHFcsaU+oWdY9hhIKQUV+1Vo8/hPo5kHU17wmhY2kmMkthXx1
 Aac2tia/pqlRCEWpFaoNZu15eFP3XovGAJdZrNhdopztTSxTvNrTvSYUa/Wc0pUBjc
 49b1LTdcahp1zJ37gWLuAPMixQeM/MK89EqDPRXF7Syn76qh20IGYMFKLKVDrjW2PT
 Ro+SpRajqEwHw==
X-Nifty-SrcIP: [209.85.167.176]
Received: by mail-oi1-f176.google.com with SMTP id 12so8884846oij.6
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 21 Feb 2021 09:15:27 -0800 (PST)
X-Gm-Message-State: AOAM533460o1CzGVlO+H9EXk/InbpLW+XK1UebRVde452dRjOWh+L/PN
 sJmCPg8JnxKBwFprbT1aITiFz2L2B/3adzxg7q0=
X-Google-Smtp-Source: ABdhPJxczjkYYwfFedULPavyehBQNlTo4yyE2oDz3aAz68ppY9EMF/VKLUDXMsDnW+fSNSL17VJtx2kpM0VX1zgRRK4=
X-Received: by 2002:a17:90a:609:: with SMTP id
 j9mr19512007pjj.198.1613927724902; 
 Sun, 21 Feb 2021 09:15:24 -0800 (PST)
MIME-Version: 1.0
References: <20210215004823.440102-1-masahiroy@kernel.org>
In-Reply-To: <20210215004823.440102-1-masahiroy@kernel.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Mon, 22 Feb 2021 02:14:47 +0900
X-Gmail-Original-Message-ID: <CAK7LNATvCAyHSUQNTdSck3JM1MfHNFcanjn0i4835okWE9Km5w@mail.gmail.com>
Message-ID: <CAK7LNATvCAyHSUQNTdSck3JM1MfHNFcanjn0i4835okWE9Km5w@mail.gmail.com>
Subject: Re: [PATCH 1/2] arch: syscalls: add missing FORCE and fix 'targets'
 to make if_changed work
To: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
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
Cc: Rich Felker <dalias@libc.org>, linux-ia64@vger.kernel.org,
 Linux-sh list <linux-sh@vger.kernel.org>, linux-mips@vger.kernel.org,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Paul Mackerras <paulus@samba.org>,
 "H. Peter Anvin" <hpa@zytor.com>, sparclinux <sparclinux@vger.kernel.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Helge Deller <deller@gmx.de>,
 X86 ML <x86@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Matt Turner <mattst88@gmail.com>,
 Fenghua Yu <fenghua.yu@intel.com>,
 "open list:TENSILICA XTENSA PORT \(xtensa\)" <linux-xtensa@linux-xtensa.org>,
 linux-m68k <linux-m68k@lists.linux-m68k.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Andy Lutomirski <luto@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Richard Henderson <rth@twiddle.net>,
 Chris Zankel <chris@zankel.net>, Michal Simek <monstr@monstr.eu>,
 Tony Luck <tony.luck@intel.com>, linux-parisc@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-alpha@vger.kernel.org, Borislav Petkov <bp@alien8.de>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Feb 15, 2021 at 9:50 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> The rules in these Makefiles cannot detect the command line change
> because the prerequisite 'FORCE' is missing.
>
> Adding 'FORCE' will result in the headers being rebuilt every time
> because the 'targets' additions are also wrong; the file paths in
> 'targets' must be relative to the current Makefile.
>
> Fix all of them so the if_changed rules work correctly.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>


Both applied to linux-kbuild.


-- 
Best Regards
Masahiro Yamada
