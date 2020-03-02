Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 482671755F3
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Mar 2020 09:24:43 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48WCqV55R6zDqXf
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Mar 2020 19:24:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.167.194;
 helo=mail-oi1-f194.google.com; envelope-from=geert.uytterhoeven@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux-m68k.org
Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com
 [209.85.167.194])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48WCnX2nHWzDqVB
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  2 Mar 2020 19:22:55 +1100 (AEDT)
Received: by mail-oi1-f194.google.com with SMTP id a22so9431104oid.13
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 02 Mar 2020 00:22:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cNjwUjeyqSUMReZ1hj8pk3fvMoKCAR8VkF8kU/CEAmI=;
 b=qOWH3oIb5OTrx3IS0O2gdWjQVUfo2imesAreBcFGRaganPI7ViBQNpZfMrv6VeN3O/
 Rd5dPUBzZVKeM9A0xyc7JFERpNW1HLjy+sVCJWpR59xbhALgZv1YiQWQaGS16turz8C5
 GBcwkG0jQTjnvv+fgQN7VaLnkzZB0uXqRiU0EnfCNusvIsgtPvPVG5hOB4m3RIlbgLHG
 1UxsNmqm5MqzINLGzXFyCybEkJzBo8BNhmuuczjNNdUhSegnneOeJ60rpP5AjzlONTfm
 yaJ4bCtSan0j73ge2RkfR/UmtTZl0XWHmuK+AE83ejI4HFIA8VMzGKH9a118kNLa0+Vu
 9TDw==
X-Gm-Message-State: APjAAAVYLAXYEDx3tVEm9E/bUDWv/geB3Q3hk48aEP2f0X8y+SBpUp9o
 bigeTZTenlvyOQrVw3pu5lfqW5LTpwgU//Z3Mmw=
X-Google-Smtp-Source: APXvYqxOxJxSBMm4mxQtyQaE+vbuwqLPCHyyR1SXxHSga4s6HjiXJaifhzoYpNbqmVOhS7uE1qHfAQr6kjTf+c7mdpQ=
X-Received: by 2002:aca:b4c3:: with SMTP id
 d186mr10506660oif.131.1583137372687; 
 Mon, 02 Mar 2020 00:22:52 -0800 (PST)
MIME-Version: 1.0
References: <1583131666-15531-1-git-send-email-anshuman.khandual@arm.com>
 <1583131666-15531-2-git-send-email-anshuman.khandual@arm.com>
In-Reply-To: <1583131666-15531-2-git-send-email-anshuman.khandual@arm.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 2 Mar 2020 09:22:41 +0100
Message-ID: <CAMuHMdUfm0X3cgEDzzF6fs0HQj83OPR=xVjQaT7uVDi2WbtHog@mail.gmail.com>
Subject: Re: [RFC 1/3] mm/vma: Define a default value for VM_DATA_DEFAULT_FLAGS
To: Anshuman Khandual <anshuman.khandual@arm.com>
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
Cc: Rich Felker <dalias@libc.org>,
 "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
 Linux-sh list <linux-sh@vger.kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>, linux-mips@vger.kernel.org,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Linux MM <linux-mm@kvack.org>, Guo Ren <guoren@kernel.org>,
 sparclinux <sparclinux@vger.kernel.org>,
 "open list:QUALCOMM HEXAGON..." <linux-hexagon@vger.kernel.org>,
 linux-riscv@lists.infradead.org, Jonas Bonn <jonas@southpole.se>,
 linux-s390 <linux-s390@vger.kernel.org>,
 arcml <linux-snps-arc@lists.infradead.org>, linux-c6x-dev@linux-c6x.org,
 Brian Cain <bcain@codeaurora.org>, Russell King <linux@armlinux.org.uk>,
 Ley Foon Tan <ley.foon.tan@intel.com>,
 Parisc List <linux-parisc@vger.kernel.org>, Mark Salter <msalter@redhat.com>,
 Paul Burton <paulburton@kernel.org>,
 "moderated list:H8/300 ARCHITECTURE" <uclinux-h8-devel@lists.sourceforge.jp>,
 "open list:TENSILICA XTENSA PORT \(xtensa\)" <linux-xtensa@linux-xtensa.org>,
 Jeff Dike <jdike@addtoit.com>, linux-um <linux-um@lists.infradead.org>,
 linux-m68k <linux-m68k@lists.linux-m68k.org>,
 Openrisc <openrisc@lists.librecores.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>,
 Guan Xuetao <gxt@pku.edu.cn>, Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Richard Henderson <rth@twiddle.net>, Chris Zankel <chris@zankel.net>,
 Michal Simek <monstr@monstr.eu>, Tony Luck <tony.luck@intel.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Nick Hu <nickhu@andestech.com>,
 Vineet Gupta <vgupta@synopsys.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Ralf Baechle <ralf@linux-mips.org>, alpha <linux-alpha@vger.kernel.org>,
 nios2-dev@lists.rocketboards.org, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Mar 2, 2020 at 7:48 AM Anshuman Khandual
<anshuman.khandual@arm.com> wrote:
> There are many platforms with exact same value for VM_DATA_DEFAULT_FLAGS
> This creates a default value for VM_DATA_DEFAULT_FLAGS in line with the
> existing VM_STACK_DEFAULT_FLAGS. While here, also define some more macros
> with standard VMA access flag combinations that are used frequently across
> many platforms. Apart from simplification, this reduces code duplication
> as well.

> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>

>  arch/m68k/include/asm/page.h       |  3 ---

For m68k:
Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
