Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BA2F8429F30
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Oct 2021 10:02:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HT7Sb2fXtz30gd
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Oct 2021 19:02:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=arndb.de
 (client-ip=217.72.192.75; helo=mout.kundenserver.de;
 envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.75])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HT7S55h9bz2xtb
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Oct 2021 19:02:27 +1100 (AEDT)
Received: from mail-wr1-f47.google.com ([209.85.221.47]) by
 mrelayeu.kundenserver.de (mreue109 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MLR5h-1mIoTm05g3-00IR0T for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Oct
 2021 10:02:21 +0200
Received: by mail-wr1-f47.google.com with SMTP id m22so64291218wrb.0
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Oct 2021 01:02:20 -0700 (PDT)
X-Gm-Message-State: AOAM530rtGqwoDqlOwxtnJ74C26hC7C5pPxchvd5GFA5mYVKYP6vCx7n
 M0HTxnnFEypkfWgPRsOH8GuOO/GVXR3Sp2UBTEg=
X-Google-Smtp-Source: ABdhPJwnvZ0Y6Hum+PqySTSqvTb9cKPN3NBY9WwyA3F69Xi/jCmvpemQKNAXUmqZQmtOtxFaHVKwRHP1wYX1RAaUqTk=
X-Received: by 2002:adf:ab46:: with SMTP id r6mr29708426wrc.71.1634025739862; 
 Tue, 12 Oct 2021 01:02:19 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1633964380.git.christophe.leroy@csgroup.eu>
 <8ff3ec195d695033b652e9971fba2dc5528f7151.1633964380.git.christophe.leroy@csgroup.eu>
 <878ryy7m6v.fsf@mpe.ellerman.id.au>
In-Reply-To: <878ryy7m6v.fsf@mpe.ellerman.id.au>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 12 Oct 2021 10:02:03 +0200
X-Gmail-Original-Message-ID: <CAK8P3a09azJ0fshthGeOqK92uaYJ+m39Yg1=YQav=n9n_PNt5w@mail.gmail.com>
Message-ID: <CAK8P3a09azJ0fshthGeOqK92uaYJ+m39Yg1=YQav=n9n_PNt5w@mail.gmail.com>
Subject: Re: [PATCH v1 01/10] powerpc: Move 'struct ppc64_opd_entry' back into
 asm/elf.h
To: Michael Ellerman <mpe@ellerman.id.au>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:C/pME6omKt2fIzHLFfmGEVomthrdyhhQPBVq3drUAB+TwWGSDae
 dZHfau2ldByWi7SDolUI0bkklHLJ4KIES1gDeuYjXtDfP9siAG3kPlewpb8Zgzf/Hq0BPRq
 wMI7cFBw/mN3UuFTcrVeY2vwnMKKpE+yLu+T8Jy8S7JvYLcaFRoNvlijlJ5MdsubeC/S2sR
 SheA2jXRBXFmcVmO+qHzg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:6doHbmA0GD4=:hoObciW6nrqo4zBA6Rtqyz
 Vl3ujpabA+ljpNix3pBKK2URpr62zyaO2vNkdkVGUbxvgOhL+v82J8svWUeu5P0HP4fPu/Z5l
 SG8HMXE3S+JxNerKHql1TfdQ8KbN9HpUfwepPDUOmBZp4Y4pZJst+RSxuHeuBA1Zj42rkHrkf
 UrrQP4Zb3D5m50Shn9Q6LwTUOzeZ98CyGDRAVsdzWeEyB8GdtIf0OuFeZiAX9tRlCyZ9qu63C
 o8bg9m+ouUoAQ66q+FFJAYNXOtlz+HZE9Dqk4E4Vw5DXo4yXuNxGcc16dqMtGHcHh3ApmBs7w
 SiA9RhyXEgSA3zPsqHdeo0m6Ild8iSgNbqgtRKZXIFb7vJ2ix483hUSWHZlXMT2UgElCeD3s6
 hWTiUvyWZxZmhxcUIqrMgN9ID2QNA+NLMPy3feBLlu877H2vpI/Ph3M4xs2p0HYkT+x6Q26Al
 tuCFjwou3VDBUrwvVsrp5+0D/yWZ6XViOWVjjr2hxJlDmAzjz4O2J3zoO6+8DFUyMkipmF8PH
 SCivynjOBMQxS8dJdMj7RuRRjPSojwmoCDEVxCZnVLJRCcV9Y3njt5sMVZAp0pcNkvLYaiGf1
 3SDgII6RJags6eolX9TTn7MIeNEauY4h3PrK4Ixndic4CW3RrfmerM6BjkRUW5Nr2b2rBMGmB
 Rv4BQfE/eYXOU2ax3M5828BKiSxcSntW4IjOAW1wGoff5irL3K4dL5JKY3yYxtzT1/jc+dIYx
 w6g1+vxNLPrQ2J6QvBSgYvAaCWTPjIjfg7Bjfv8e4aCRhOtkHV6EA5HyV8YPJgXYmGfktu0NQ
 7U8zv7ErBHc8NBx8YpajbsfXzHwham/R9i9PXUhauzb6QwcK/Gaw3zjaOYYal2mrPAvyzRo9j
 62yi90KII7JOlahw8Z6g==
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
Cc: linux-arch <linux-arch@vger.kernel.org>, linux-ia64@vger.kernel.org,
 Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>,
 Helge Deller <deller@gmx.de>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Linux-MM <linux-mm@kvack.org>, Paul Mackerras <paulus@samba.org>,
 Parisc List <linux-parisc@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Oct 12, 2021 at 9:10 AM Michael Ellerman <mpe@ellerman.id.au> wrote:
> Christophe Leroy <christophe.leroy@csgroup.eu> writes:
> > 'struct ppc64_opd_entry' doesn't belong to uapi/asm/elf.h
> > But it was by mistake added outside of __KERNEL__ section,
> > therefore commit c3617f72036c ("UAPI: (Scripted) Disintegrate
> > arch/powerpc/include/asm") moved it to uapi/asm/elf.h
>
> ... it's been visible to userspace since the first commit moved it, ~13
> years ago in 2008, v2.6.27.
>
> > Move it back into asm/elf.h, this brings it back in line with
> > IA64 and PARISC architectures.
>
> Removing it from the uapi header risks breaking userspace, I doubt
> anything uses it, but who knows.
>
> Given how long it's been there I think it's a bit risky to remove it :/

I would not be too worried about it. While we should absolutely
never break existing binaries, changing the visibility of internal
structures in header files only breaks compiling applications
that do rely on these entries, and they really should not be using
this in the first place.

        Arnd
