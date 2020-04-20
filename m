Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 31DA21B166A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Apr 2020 21:59:22 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 495cwR38pkzDqfj
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Apr 2020 05:59:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=arndb.de
 (client-ip=212.227.126.133; helo=mout.kundenserver.de;
 envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arndb.de
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 495ctQ0fqxzDqcV
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Apr 2020 05:57:32 +1000 (AEST)
Received: from mail-qt1-f177.google.com ([209.85.160.177]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1MIxFi-1jgUTF3MCY-00KM6O for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Apr
 2020 21:57:28 +0200
Received: by mail-qt1-f177.google.com with SMTP id 71so9644759qtc.12
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Apr 2020 12:57:27 -0700 (PDT)
X-Gm-Message-State: AGi0PuayLU+vwCJWPhXURzTFaKKtzuWnOQr+L7i65jOjRF+yNSca+Oyy
 rjA5Ox8bRMN80WsuRcNZMnEelS1qRi4mVOetZMc=
X-Google-Smtp-Source: APiQypInnw/7oNYx/8ddrJ6wNqe8VjAmS6wcn2pUIGPpe8WVzo1dDQTGa7G0KfTaObn2R3jT+v4Zk6Fys9mI49clMeo=
X-Received: by 2002:ac8:4c8d:: with SMTP id j13mr11333587qtv.142.1587412646124; 
 Mon, 20 Apr 2020 12:57:26 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1587401492.git.christophe.leroy@c-s.fr>
In-Reply-To: <cover.1587401492.git.christophe.leroy@c-s.fr>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 20 Apr 2020 21:57:09 +0200
X-Gmail-Original-Message-ID: <CAK8P3a11t=piuDq+TuGMo0xDiN06OLMxsym0PGiWNv5qYSUXLQ@mail.gmail.com>
Message-ID: <CAK8P3a11t=piuDq+TuGMo0xDiN06OLMxsym0PGiWNv5qYSUXLQ@mail.gmail.com>
Subject: Re: [PATCH v7 0/7] powerpc: switch VDSO to C implementation
To: Christophe Leroy <christophe.leroy@c-s.fr>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:FvXPHfXS1rpZn+WhsUmwjl45qfWcsAjjvOHrsR+RyevYa0GIWAN
 L0xa1vRgINywkRAE2xdaF5uAdSCYkWfXzV2ULr2DE+xVMRc45t2xhDa0IbthkY51Mal55iR
 KjFoxn22Uo9tGIDRCgt6wOxbGC62An2sE6tHMnNZZ96rnxBhu6dcEEGjDLJjx0nZmRIYqHY
 rolJf1EZscaDc/eW0jACA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:3YR4NCLCvH8=:tUMbivi3CdvobVtM81AsTe
 HSoAjhsu4TXMbYjf5UnYseN6gFjJwcRUZHzHIVsMxuuwFXj277vLw4JgqasbbF7u3fFwkqc9W
 +F+NA7fHxdeC4BUXYB4NFq5Ayj6gTMY0noHiCR7YpRz8ujqZBiJR2DYxG9ekflSpiuf6eBKgG
 Z3M7J/3h12Q12VtIc4H4G8DOjvSRiVjmZYZ96874yb2s7l0MTdOyuT/ELxeZS0Ta1HEdOmoWu
 hYZG+YtV4zJ1PcJD4YzlTmgNJQYyJS/OsbMYE6u2SoOVcRdCvlIbBPeoLjty6+Mjw2SLPvLDP
 hLS4npaIM/s1MsWgq6Lc0dXUL3BhukIYkNbjwnIjI+fgo3COg/kVYpnV4P+XCnYGDi5FcTMe/
 t5GKF21SyEulkumpCWPTo/GgANo5LZkSf0qdkGYyicQ16XSxutv/uMYJEs9NWt7AFpe1Gwetk
 AGAoHI4D3i8JnSHnaOV0hIgJ5xGpTslFjVawgoT4wz9Z+40ILyLz+E6vVV220+kMMtdRi4GFj
 I8Fcr/taBlewpVvDcy6TNirTFAReO6ZWY+ke0HRW7kdUCTXYlybMWJ26ZGg+0L7Px3B8l78xg
 NoNiMnbNuUW93YP9JElQD7aYdsL0d36LrFc27djSoXay4PCClL739l755DYoqv89ttX92miRA
 IdSWkuN+BlXScuL536eAjhh3TXjyalSmDa2ZzqG4GWiXVaTx+GdMigYoLCbfK76JonaDqFIPm
 PxjG+i3tN11yOmx3b8bbs0UNtz1RQTHI6Xfek9tKtQP6U4LDdgafrGzwAYbVhjCkpxkjkt7Ii
 PucL5DhcleP8JU3GMUYug2AXapBox8GexFxrD2AOOFSQK6AbnI=
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Paul Mackerras <paulus@samba.org>, Andy Lutomirski <luto@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Apr 20, 2020 at 6:56 PM Christophe Leroy
<christophe.leroy@c-s.fr> wrote:
>
> This is the seventh version of a series to switch powerpc VDSO to
> generic C implementation.
>
> Main changes since v6 are:
> - Added -fasynchronous-unwind-tables in CFLAGS
> - Split patch 2 in two parts
> - Split patch 5 (which was patch 4) in two parts
>
> This series applies on today's powerpc/merge branch.
>
> See the last two patches for details on changes and performance.
>
> Christophe Leroy (7):
>   powerpc/vdso64: Switch from __get_datapage() to get_datapage inline
>     macro
>   powerpc/vdso: Remove __kernel_datapage_offset and simplify
>     __get_datapage()
>   powerpc/vdso: Remove unused \tmp param in __get_datapage()
>   powerpc/processor: Move cpu_relax() into asm/vdso/processor.h
>   powerpc/vdso: Prepare for switching VDSO to generic C implementation.
>   powerpc/vdso: Switch VDSO to generic C implementation.

This all looks fine, but I'm a bit puzzled why you don't add a
clock_gettime64() implementation in the same series. Isn't
that the main purpose of doing all that work?

Without it, any 32-bit user space has to go through the system call
for time()/getttimeofday()/clock_gettime() when built with a
modern libc.

         Arnd
