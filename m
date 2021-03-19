Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 80856342036
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Mar 2021 15:55:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F26Ph3Rswz3c5w
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Mar 2021 01:55:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.222.44; helo=mail-ua1-f44.google.com;
 envelope-from=geert.uytterhoeven@gmail.com; receiver=<UNKNOWN>)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com
 [209.85.222.44])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F26PK2qVjz30GQ
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 20 Mar 2021 01:54:44 +1100 (AEDT)
Received: by mail-ua1-f44.google.com with SMTP id g5so3106062uan.8
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Mar 2021 07:54:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=t7iwM5Al+GjmpcCXrO+/PoTF1eT3fOyyCJF+hEmDRuY=;
 b=XqAbvFbqg+VXuZN9cxlCeGLbMAJXEtVA0tu7vIDdAztngK9M39clDPeXeMZL7QO9pz
 AN3jEoU0uwzxP7zYt/tzdAE5UodmZxjsLwJO/Qwc1KMuqBUQ0mx+bLnrtoSqMTDcf8QK
 One35e3jOHV5c7S9Dd1C+yZOs/iGWGPzGM4vTvOypg4x2RdPwH8i8/sQPO4YR8+LR/kR
 gLBo257mj1Sp3PNqaPzu0ENB5TM8PJMJfBgCw045gCZ59B04wVVXw2d1WsIHkEd+bUob
 8Te/AVCq8RSP5ivsm4wsUk+MMOnq8lOFuggjHRGJylkN91p5VbZnG60OUiFQ98X1wrpH
 ckXQ==
X-Gm-Message-State: AOAM530zAUQ4HRWrvsAezyvUsxu7uzNf3K6AiGaLOKHS+Ds1UBLvx7Zo
 KiSJnIdmTiRcg7XCnwL0ubkzwK+rGpY4Kq1x2M4=
X-Google-Smtp-Source: ABdhPJws2Ktj9BbIiCJ2GEgAVHw5Jy7feW23SDXRGODsXxsWn+4cet7pHOPZfquztis6cg4P7dw2c+QmSRw/42z1U4s=
X-Received: by 2002:a9f:35a1:: with SMTP id t30mr5801449uad.106.1616165680697; 
 Fri, 19 Mar 2021 07:54:40 -0700 (PDT)
MIME-Version: 1.0
References: <20210319143452.25948-1-david@redhat.com>
 <20210319143452.25948-3-david@redhat.com>
In-Reply-To: <20210319143452.25948-3-david@redhat.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 19 Mar 2021 15:54:29 +0100
Message-ID: <CAMuHMdVP433iVhyaweDd8G6p3ZCgSDq6M_ACko_BTgm+5m0qnA@mail.gmail.com>
Subject: Re: [PATCH RFC 2/3] mm: remove xlate_dev_kmem_ptr()
To: David Hildenbrand <david@redhat.com>
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
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Linux-sh list <linux-sh@vger.kernel.org>,
 "Peter Zijlstra \(Intel\)" <peterz@infradead.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Palmer Dabbelt <palmerdabbelt@google.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Linux MM <linux-mm@kvack.org>, Paul Mackerras <paulus@samba.org>,
 sparclinux <sparclinux@vger.kernel.org>,
 "open list:QUALCOMM HEXAGON..." <linux-hexagon@vger.kernel.org>,
 Ingo Molnar <mingo@kernel.org>, Linux-Arch <linux-arch@vger.kernel.org>,
 linux-s390 <linux-s390@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Brian Cain <bcain@codeaurora.org>, Helge Deller <deller@gmx.de>,
 Russell King <linux@armlinux.org.uk>, Krzysztof Kozlowski <krzk@kernel.org>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Parisc List <linux-parisc@vger.kernel.org>, Matt Turner <mattst88@gmail.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Niklas Schnelle <schnelle@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>,
 linux-m68k <linux-m68k@lists.linux-m68k.org>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Greentime Hu <green.hu@gmail.com>,
 Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Richard Henderson <rth@twiddle.net>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Pierre Morel <pmorel@linux.ibm.com>, Randy Dunlap <rdunlap@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 alpha <linux-alpha@vger.kernel.org>, Mikulas Patocka <mpatocka@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "David S. Miller" <davem@davemloft.net>,
 Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Mar 19, 2021 at 3:36 PM David Hildenbrand <david@redhat.com> wrote:
> Since /dev/kmem has been removed, let's remove the xlate_dev_kmem_ptr()
> leftovers.

> Signed-off-by: David Hildenbrand <david@redhat.com>

>  arch/m68k/include/asm/io_mm.h   |  5 -----

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
