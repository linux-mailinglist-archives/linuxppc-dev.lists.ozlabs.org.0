Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D82BA507C08
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Apr 2022 23:39:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kjcdb6WxNz2ypD
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Apr 2022 07:39:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=F9g5t4Hg;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::b30;
 helo=mail-yb1-xb30.google.com; envelope-from=linus.walleij@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=F9g5t4Hg; dkim-atps=neutral
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com
 [IPv6:2607:f8b0:4864:20::b30])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kjcd04rPvz2yY1
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Apr 2022 07:38:57 +1000 (AEST)
Received: by mail-yb1-xb30.google.com with SMTP id r189so13745716ybr.6
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Apr 2022 14:38:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lpixaXj6qNPyfuQi+711f00czQF/Nnw+LVQXzBb+S8Q=;
 b=F9g5t4HgbUdVEO+7E0ZaRfMM+SEy8iU+ns1cW1A9oOsOFSSwkkuANuzTMzZmRjMKtx
 No4Q1IoHiqt9yd6rB84MXHA+yXX6YwSNUiO66pvOO5eMIFO7uEtJlyPpRqVKtDKZIUak
 iwWZN0L8aq9SVoLAoPswC9n7QVWCW+F+R3XIXHZ1ywr4IWivMjByCVzO7jtS1yMaQGh4
 ygPAIOfmqRqoziZ4QlKCxcWJ2C98HH0SprzpWLQ/FQ+Zu/eXifGBrPPlWgvct9cOBIfa
 0v4U0L9yQZi8bxosZ9TIsRr50S/J6T5vJXHVjubMKBqYfGQXVXVWz2/9pZFmP1t612dR
 B/3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lpixaXj6qNPyfuQi+711f00czQF/Nnw+LVQXzBb+S8Q=;
 b=1n6M56MAYnQntHylufaiKXn/F4bWUJqK2crr9jE+f2lvl1SQIy3REOTNVvXnB99D8n
 5DWmQr4NJZZwyFm+KhWsC4KvalgALxTuKQkto25Lc73xhH0ho6BCH3uEut4McHwvAG80
 m8SIhHKj9hb4PcPK3hoUSqnJvERCr/Na/+Hs55HZ7RBPD09GbMrGbxsAxt21F+0TYtoS
 4f8oOyYxVB26mUwHIdeHEP61MRcbij9k+x1JmIZq/Kgr1GX1mo3HVmHL9PeR/PORBok9
 GPI8Bbg6tOAXPUPp3zLuL0blNcN9Spewmbi1skRUb+0CwSpB2rp/UtkQ1Uq21UH21zL3
 ELYQ==
X-Gm-Message-State: AOAM533onaxpDqwT3E/htJQdAaLSt0Dcbbz864eSjmT5HzcQra4Lqxfv
 pjEnPeslTAljyPNlMK8muAkgtY68G1EOyQl5gsj3mg==
X-Google-Smtp-Source: ABdhPJxLVTTgwCGxy+lO7TQGdgaHtKXCvsmRfdXfncWdJZBji/2RvB6wApY4h1lwCArWlAwDJd3CkXS8AyglvAtlQEk=
X-Received: by 2002:a25:a12a:0:b0:644:e94e:5844 with SMTP id
 z39-20020a25a12a000000b00644e94e5844mr12447288ybh.492.1650404334359; Tue, 19
 Apr 2022 14:38:54 -0700 (PDT)
MIME-Version: 1.0
References: <20220323174342.56187-1-andriy.shevchenko@linux.intel.com>
 <CACRpkdbUWE8knM=9uUVLTX792Y8_J1aPj4KtFh=yJxaKi+ZqRw@mail.gmail.com>
 <Yk2PE7+oEEtGri95@smile.fi.intel.com>
In-Reply-To: <Yk2PE7+oEEtGri95@smile.fi.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 19 Apr 2022 23:38:43 +0200
Message-ID: <CACRpkdbqfNiWQG6ayqMXACby4xkW0pY6JhdYE-x+pWkSxJU5TQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] powerpc/83xx/mpc8349emitx: Get rid of of_node
 assignment
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Michael Ellerman <mpe@ellerman.id.au>
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
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, linux-kernel@vger.kernel.org,
 Scott Wood <oss@buserror.net>, Paul Mackerras <paulus@samba.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Apr 6, 2022 at 3:02 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
> On Mon, Mar 28, 2022 at 03:16:08PM +0200, Linus Walleij wrote:
> > On Wed, Mar 23, 2022 at 6:43 PM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> >
> > > Let GPIO library to assign of_node from the parent device.
> > > This allows to move GPIO library and drivers to use fwnode
> > > APIs instead of being stuck with OF-only interfaces.
> > >
> > > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> >
> > That's a nice patch.
> > Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
>
> Thanks!
>
> Can we have this applied now?

I think Michael Ellerman could help with this?

Michael?

Yours,
Linus Walleij
