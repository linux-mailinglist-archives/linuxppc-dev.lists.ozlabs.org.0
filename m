Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 91F674BBF08
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Feb 2022 19:08:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K0fnN0hMpz3cmH
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Feb 2022 05:08:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=amacapital-net.20210112.gappssmtp.com header.i=@amacapital-net.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=5c/qRto3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=amacapital.net (client-ip=2a00:1450:4864:20::530;
 helo=mail-ed1-x530.google.com; envelope-from=luto@amacapital.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=amacapital-net.20210112.gappssmtp.com
 header.i=@amacapital-net.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=5c/qRto3; dkim-atps=neutral
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K0fmZ4x4Cz3cWp
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Feb 2022 05:07:26 +1100 (AEDT)
Received: by mail-ed1-x530.google.com with SMTP id u18so16835111edt.6
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Feb 2022 10:07:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amacapital-net.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3DIqXxPmp6dtbTijOx2KTFQ/AdtfYUTWecKVh7q3dDI=;
 b=5c/qRto3YK3Y6/Rhnnpp4RzKmf8QhiKseObhkqXIpnLfhpnv2ua8Z7YCExbmjSYUCG
 SbBSycxSpm4FRe5zOaxst92xyRDLRie0B4d4p8x0W6snNr+dG6MghxLfcakTWMQA17Pf
 gOp7JS9gIpdJumtDaMv9IluyX8dB5LI5eLR/YC2U+D7T5N3aQr9NOYHAOP982E02xanw
 SC1uTLhbyKEp3+LiMa1bFSquyveVGLxTCPf/eSvmTiEZzxEI+wIe4AMdv5VgRD2GYf6G
 kO3gnVVxKK1wWuKxjcQ5nhLyDgmj/c1nxTJoqfRQTmuVCBNlEZ4IpVOo74LURbiOVsEg
 CBWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3DIqXxPmp6dtbTijOx2KTFQ/AdtfYUTWecKVh7q3dDI=;
 b=Ti1L6/A7IT9lgmL+CLMDsmPH3JULrsZ1+6sYnphwF0E8aSpaFflZbbGDG0jjMvlMS+
 5elAyukx/FFZ0NcUEGThFPNN8UFPPni17Iv652NPgFM3GSp26Ms7oWMDFR4ap2abbVc5
 FqPH8mBHwew5GvocyUj0JiIoi3I26M4kFQv1QWDv9GY5/+a+20M6e+zYYoxeXqfbd0bq
 4C4tSDXa+RwHZSrFXu9+9v5kVibA4Vz/YZwayoWyKc6EIHD8Ca3N5kFas6L501e9iHa8
 n+oCG4SVLSgzx1xTgUQB9PzCjre4ZZgcuwxm9ktGUY4lsjuUyM+7Rgpmq4+9YcQ6XBcg
 pB2Q==
X-Gm-Message-State: AOAM5339xmm257hWtR9UbU9hD72L+0sZ40rUipgh0yIwmPyG2a8hn/xV
 2BZ0OIk45LC5cvqS8hDm+1gLzJrblFASREjZRdlN8A==
X-Google-Smtp-Source: ABdhPJzKi9/dAquBFvy+ZlpESpcVBT1I3X4XtLJClo2SaEqFpqb8kdqwnL9Fphl8e/qcsjqeDfp/tX4JIrAspWajnck=
X-Received: by 2002:a05:6402:430f:b0:410:a082:c6da with SMTP id
 m15-20020a056402430f00b00410a082c6damr9386454edc.438.1645207638871; Fri, 18
 Feb 2022 10:07:18 -0800 (PST)
MIME-Version: 1.0
References: <20220216131332.1489939-1-arnd@kernel.org>
 <20220216131332.1489939-14-arnd@kernel.org>
 <CALCETrVOvYPN4_6hS8wpm2v9bGZupZ5x4=vZAseG57OUgvLGfw@mail.gmail.com>
 <93a1ee797e9d4f789dff85a3c0f0c232@AcuMS.aculab.com>
In-Reply-To: <93a1ee797e9d4f789dff85a3c0f0c232@AcuMS.aculab.com>
From: Andy Lutomirski <luto@amacapital.net>
Date: Fri, 18 Feb 2022 10:07:07 -0800
Message-ID: <CALCETrWTB65vJXsQTPd_o7BRoSU=uqD0pFzKS+r4YgDuiCCqaQ@mail.gmail.com>
Subject: Re: [PATCH v2 13/18] uaccess: generalize access_ok()
To: David Laight <David.Laight@aculab.com>
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
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>,
 "dalias@libc.org" <dalias@libc.org>,
 "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
 "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>,
 "peterz@infradead.org" <peterz@infradead.org>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "guoren@kernel.org" <guoren@kernel.org>,
 "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>,
 "linux-hexagon@vger.kernel.org" <linux-hexagon@vger.kernel.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "will@kernel.org" <will@kernel.org>, Christoph Hellwig <hch@lst.de>,
 "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 "bcain@codeaurora.org" <bcain@codeaurora.org>, "deller@gmx.de" <deller@gmx.de>,
 "x86@kernel.org" <x86@kernel.org>,
 "linux@armlinux.org.uk" <linux@armlinux.org.uk>,
 "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>,
 "ardb@kernel.org" <ardb@kernel.org>, "mingo@redhat.com" <mingo@redhat.com>,
 "geert@linux-m68k.org" <geert@linux-m68k.org>,
 "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
 "linux-xtensa@linux-xtensa.org" <linux-xtensa@linux-xtensa.org>,
 "arnd@arndb.de" <arnd@arndb.de>, "hca@linux.ibm.com" <hca@linux.ibm.com>,
 "linux-alpha@vger.kernel.org" <linux-alpha@vger.kernel.org>,
 "linux-um@lists.infradead.org" <linux-um@lists.infradead.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-m68k@lists.linux-m68k.org" <linux-m68k@lists.linux-m68k.org>,
 "openrisc@lists.librecores.org" <openrisc@lists.librecores.org>,
 "viro@zeniv.linux.org.uk" <viro@zeniv.linux.org.uk>,
 "shorne@gmail.com" <shorne@gmail.com>, Arnd Bergmann <arnd@kernel.org>,
 "monstr@monstr.eu" <monstr@monstr.eu>,
 "tsbogend@alpha.franken.de" <tsbogend@alpha.franken.de>,
 "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>,
 "nickhu@andestech.com" <nickhu@andestech.com>,
 "jcmvbkbc@gmail.com" <jcmvbkbc@gmail.com>,
 "linux-api@vger.kernel.org" <linux-api@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dinguyen@kernel.org" <dinguyen@kernel.org>,
 "ebiederm@xmission.com" <ebiederm@xmission.com>,
 "richard@nod.at" <richard@nod.at>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 "davem@davemloft.net" <davem@davemloft.net>,
 "green.hu@gmail.com" <green.hu@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Feb 18, 2022 at 1:30 AM David Laight <David.Laight@aculab.com> wrote:
>
> From: Andy Lutomirski
> > Sent: 17 February 2022 19:15
> ...
> > This isn't actually optimal.  On x86, TASK_SIZE_MAX is a bizarre
> > constant that has a very specific value to work around a bug^Wdesign
> > error^Wfeature of Intel CPUs.  TASK_SIZE_MAX is the maximum address at
> > which userspace is permitted to allocate memory, but there is a huge
> > gap between user and kernel addresses, and any value in the gap would
> > be adequate for the comparison.  If we wanted to optimize this, simply
> > checking the high bit (which x86 can do without any immediate
> > constants at all) would be sufficient and, for an access known to fit
> > in 32 bits, one could get even fancier and completely ignore the size
> > of the access.  (For accesses not known to fit in 32 bits, I suspect
> > some creativity could still come up with a construction that's
> > substantially faster than the one in your patch.)
> >
> > So there's plenty of room for optimization here.
> >
> > (This is not in any respect a NAK -- it's just an observation that
> > this could be even better.)
>
> For 64bit arch that use the top bit to separate user/kernel
> you can test '(addr | size) >> 62)'.
> The compiler optimises out constant sizes.
>
> This has all been mentioned a lot of times.
> You do get different fault types.
>
> OTOH an explicit check for constant size (less than something big)
> can use the cheaper test of the sign bit.
> Big constant sizes could be compile time errors.

The different fault type issue may well be a real problem.  Right now
the core x86 fault code reserves the right to grouch if we get #GP
instead of #PF.  We could change that.
