Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AFF5F8B8B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Nov 2019 10:17:19 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47C2FS2qqLzF56f
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Nov 2019 20:17:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.167.196;
 helo=mail-oi1-f196.google.com; envelope-from=geert.uytterhoeven@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux-m68k.org
Received: from mail-oi1-f196.google.com (mail-oi1-f196.google.com
 [209.85.167.196])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47C29t63wQzF25Y
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Nov 2019 20:14:08 +1100 (AEDT)
Received: by mail-oi1-f196.google.com with SMTP id e9so14150771oif.8
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Nov 2019 01:14:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=CcFia2f8UjT7Hz7B3H/t2zQe97c4U387QE8r5XjOH8A=;
 b=a4LFBxoNmxFXwQQ78b6cBAry6Xv0k6oMddMK6dEVcxADaPaQle8pSqFeASdIV8SioR
 B8jqOLwoQ92N+QOCoH8fwTWeerJ+H0u0EFklyFWlZ1Dp4qTgpRE22FS7F03Gy8jsZPEx
 LU2YVTNGKbgOurj2GkHVVT5BH7Ot3yEYJW1NAKfbpTusAaQ/53BtqcRVAvhHDLF4s9w+
 73JKSlaxXoW8RjcRzp3IZirPX2xvt8xbP3yml3Nk1sY256cSbKDn3XJm6w+6cZi3faFP
 tDKKxfkGNXks3reLWmWybFQ7b4xFRbLA9iGSUTqh31mEv/cOX0O5Qyc0TBrjRiWzkhvV
 xuCw==
X-Gm-Message-State: APjAAAWVe0wmtbJujc9lhf53WN8dwHFhMrn4Yka6ESqRPRP5+CxI0tMS
 M0aBa0I3KkmcHlrXsiYAIDqGa83EM5dcjqIS0aY=
X-Google-Smtp-Source: APXvYqxbSiMMCm9vOSRUI81fzjT2IZ3Fd4CYajnzFOk7q7brNKIrKnb1uqJhXwzzLHRJu12wVQ5KC28YV3eKlUAChCc=
X-Received: by 2002:aca:3a86:: with SMTP id h128mr2951038oia.131.1573550045207; 
 Tue, 12 Nov 2019 01:14:05 -0800 (PST)
MIME-Version: 1.0
References: <20191011000609.29728-1-keescook@chromium.org>
 <20191011000609.29728-12-keescook@chromium.org>
 <CAMuHMdXfPyti1wFBb0hhf3CeDSQ=zVv7cV-taeYCmDswMQkXPQ@mail.gmail.com>
 <201911110922.17A2112B0@keescook>
 <CAMuHMdUJ8QPvqf51nVmOg1Zm20SNT7pXR72z=qmco=ecwawZ7A@mail.gmail.com>
 <20191112090736.GA32336@zn.tnic>
In-Reply-To: <20191112090736.GA32336@zn.tnic>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 12 Nov 2019 10:13:53 +0100
Message-ID: <CAMuHMdXayF+z4z+Ds-gm4+YFA=BCMo0_9Q3uXcbQQgQkLxZ4uw@mail.gmail.com>
Subject: Re: [PATCH v2 11/29] vmlinux.lds.h: Replace RODATA with RO_DATA
To: Borislav Petkov <bp@alien8.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Linux-Arch <linux-arch@vger.kernel.org>,
 linux-s390 <linux-s390@vger.kernel.org>, Michal Simek <monstr@monstr.eu>,
 the arch/x86 maintainers <x86@kernel.org>,
 "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
 Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>,
 linux-xtensa@linux-xtensa.org, Dave Hansen <dave.hansen@linux.intel.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Parisc List <linux-parisc@vger.kernel.org>, Andy Lutomirski <luto@kernel.org>,
 alpha <linux-alpha@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>, Will Deacon <will@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-c6x-dev@linux-c6x.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Borislav,

On Tue, Nov 12, 2019 at 10:08 AM Borislav Petkov <bp@alien8.de> wrote:
> On Mon, Nov 11, 2019 at 07:08:51PM +0100, Geert Uytterhoeven wrote:
> > vmlinux-std.lds: All other classic 680x0 targets with an MMU, e.g. plai=
n
> >                  defconfig aka multi_defconfig.
>
> FWIW, the defconfig doesn't build with the cross compiler=C2=B9 here, eve=
n with Kees'
> patch applied but for a different reason:
>
> $ make.cross ARCH=3Dm68k defconfig
> ...
>
> $make.cross ARCH=3Dm68k 2>w.log
> ...
> drivers/video/fbdev/c2p_planar.o: In function `transp8':
> c2p_planar.c:(.text+0x13a): undefined reference to `c2p_unsupported'
> c2p_planar.c:(.text+0x1de): undefined reference to `c2p_unsupported'
> drivers/video/fbdev/c2p_iplan2.o: In function `transp4x.constprop.0':
> c2p_iplan2.c:(.text+0x98): undefined reference to `c2p_unsupported'
> make: *** [Makefile:1094: vmlinux] Error 1

The fix for that regression (finally) made it in rc7:
b330f3972f4f2a82 ("fbdev: c2p: Fix link failure on non-inlining").

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
