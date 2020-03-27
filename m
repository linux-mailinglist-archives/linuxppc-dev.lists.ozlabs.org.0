Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 324C8195CB6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Mar 2020 18:28:44 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48ppjj1vNJzDrF5
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Mar 2020 04:28:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::341;
 helo=mail-ot1-x341.google.com; envelope-from=natechancellor@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=p1kxgtdl; dkim-atps=neutral
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com
 [IPv6:2607:f8b0:4864:20::341])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48ppgy2RPBzDr0k
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Mar 2020 04:27:09 +1100 (AEDT)
Received: by mail-ot1-x341.google.com with SMTP id x11so10548467otp.6
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Mar 2020 10:27:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=ClBYvSVmf83rxBcoJPioNptteHGrQ49oK3IN7T/4Mgc=;
 b=p1kxgtdlAlcm9ZYp0voSXEtcsJCiehEdu2swGy2F/tJZXZEDEM0LiBh5bLYFtdgFZc
 vsH8oBKUYVuWCQSRJUlNW+M4qg4yLXiWgD2eK+pQCBZ69YoTQhmD3rwBCLNgQqIhOlvk
 ABETgIyKgHprRV5zGNhl+GGjY2bpPLCWeBOFSQCn0HbGJbZQ/g60ZuYwe2cfmOOAGajh
 Kf0cjQ/kS6FJKgws+xZ3OVq2EwfuFkKLdUaqmqF6Ul8xX/bBN2ZEnNowVyy1ujh15FJs
 xnswehxIsxVIpsUdnGDvqjPgUAqQSKKMrB0vNuBQo1ni7AIwNHppUSReQB9iSUvLNxD4
 T8Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=ClBYvSVmf83rxBcoJPioNptteHGrQ49oK3IN7T/4Mgc=;
 b=ttm+11+muvdWCxUyaA2l0d1QKDNiGuzXaBkonVxqWX91RTBBg657EmRZAVyR49RUEh
 rsH3wUEJpcJCjlL7gdgGC3WBXPjpdGMKpz1JH335PlL9GW6ZiHuIqbhky8RMoJk75f3o
 ROP/wOXHYLs/LT99RTRr8eBuC9eDKVTcyY+sIIaOBD5feVrSMkEuAectelehyHVx8qri
 lvt9cUTadhUj43x8PBFFSpEWvb9bbIY0PHQ/SrltljXh5XW2zDoKa31CaBFFJ+iOq8EC
 HYTQMXV8vtYSDfZ+aq9wz8wY5f/HCYUMLNzrPTfk14GNlTKhp/2D2VXBej4wQK1t/Kjh
 2oaA==
X-Gm-Message-State: ANhLgQ2N8kmRxyTsHvtWxmgEIXLTmhVwUxNjabBDy+Q+do0h/otS2Fsp
 DMDrHmWl0JmlbQk+tp0HvsU=
X-Google-Smtp-Source: ADFU+vvCryVp1EzUDSsGpKlMWDJ2IGkuG+A5nBaN01hdZ8Oaa4LyrQLUUb4FlTMO9zHE2KaPs5q0Og==
X-Received: by 2002:a4a:d88b:: with SMTP id b11mr421504oov.42.1585330026427;
 Fri, 27 Mar 2020 10:27:06 -0700 (PDT)
Received: from ubuntu-m2-xlarge-x86 ([2604:1380:4111:8b00::1])
 by smtp.gmail.com with ESMTPSA id t4sm1105871otm.45.2020.03.27.10.27.04
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 27 Mar 2020 10:27:05 -0700 (PDT)
Date: Fri, 27 Mar 2020 10:27:03 -0700
From: Nathan Chancellor <natechancellor@gmail.com>
To: Nick Desaulniers <ndesaulniers@google.com>
Subject: Re: [PATCH v1] powerpc: Make setjmp/longjump signature standard
Message-ID: <20200327172703.GA28580@ubuntu-m2-xlarge-x86>
References: <20200327100801.161671-1-courbet@google.com>
 <CAKwvOdmLmfJY4Uk-Atd9dT5+zQTPeoagjMZMcDqdVfKCU7_BuA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKwvOdmLmfJY4Uk-Atd9dT5+zQTPeoagjMZMcDqdVfKCU7_BuA@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: LKML <linux-kernel@vger.kernel.org>,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 Paul Mackerras <paulus@samba.org>, Clement Courbet <courbet@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Mar 27, 2020 at 10:10:44AM -0700, Nick Desaulniers wrote:
> On Fri, Mar 27, 2020 at 3:08 AM Clement Courbet <courbet@google.com> wrote:
> >
> > Declaring setjmp()/longjmp() as taking longs makes the signature
> > non-standard, and makes clang complain. In the past, this has been
> > worked around by adding -ffreestanding to the compile flags.
> >
> > The implementation looks like it only ever propagates the value
> > (in longjmp) or sets it to 1 (in setjmp), and we only call longjmp
> > with integer parameters.
> >
> > This allows removing -ffreestanding from the compilation flags.
> >
> > Context:
> > https://lore.kernel.org/patchwork/patch/1214060
> > https://lore.kernel.org/patchwork/patch/1216174
> >
> > Signed-off-by: Clement Courbet <courbet@google.com>

Thanks for fixing this properly, not really sure why I did not think of
this in the first place. I guess my thought was the warning makes it
seem like clang is going to ignore the kernel's implementation of
setjmp/longjmp but I can't truly remember.

> Hi Clement, thanks for the patch! Would you mind sending a V2 that
> included a similar fix to arch/powerpc/xmon/Makefile?

Agreed.

> For context, this was the original patch:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=aea447141c7e7824b81b49acd1bc78
> which was then modified to:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=c9029ef9c95765e7b63c4d9aa780674447db1ec0
> 
> So on your V2, if you include in the commit message, the line:
> 
> Fixes c9029ef9c957 ("powerpc: Avoid clang warnings around setjmp and longjmp")
> 
> then that will help our LTS branch maintainers back port it to the
> appropriate branches.

The tags should be:

Cc: stable@vger.kernel.org # v4.14+
Fixes: c9029ef9c957 ("powerpc: Avoid clang warnings around setjmp and longjmp")

that way it explicitly gets picked up for stable, rather than Sasha's
AUTOSEL process, which could miss it.

With the xmon/Makefile -ffreestanding removed and the tags updated,
consider this:

Reviewed-by: Nathan Chancellor <natechancellor@gmail.com>
Tested-by: Nathan Chancellor <natechancellor@gmail.com>

Cheers,
Nathan
