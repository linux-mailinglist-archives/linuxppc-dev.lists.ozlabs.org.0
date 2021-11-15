Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A473C4509EA
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Nov 2021 17:45:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HtFRl3Ktfz2ynk
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Nov 2021 03:45:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=g0iqrBMJ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::42a;
 helo=mail-wr1-x42a.google.com; envelope-from=elver@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=g0iqrBMJ; dkim-atps=neutral
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HtFR60qYgz2y7P
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Nov 2021 03:44:47 +1100 (AEDT)
Received: by mail-wr1-x42a.google.com with SMTP id s13so32019965wrb.3
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Nov 2021 08:44:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=ebmLJNm972HwzSUFY9uX5jVcx5/iRccpx4YVQ/Ccmok=;
 b=g0iqrBMJQyEnc9qSvvS/XvHhd4djVrsEvm98CX1l0gQprLyW37oWizStTVfu+JpU4j
 1snhgegTeq2Go6+vBUOrpXihNI10YMbkcvvXaEwefmt0nfKCUqM6py3tUZZT1Yz+ysvt
 RtY0+uWnRT0CdzccrmRVIVXM3cI2M0sPczP6vvdlmzk8FrzjyEthEg9YPZL+bo2ajWHS
 EIUTacEpVfIuOn/rHjnvRUH4nNnMrd2RlGND++F7kkjRGZrkroOEqdM26t6d1RsdGwrK
 OgfAqIsE5ct/iU3rWgdDMBkLWE8Ys1mZWvoN7azO5tlcvifNOBh4n+QQwZMY/xUjR6Uj
 4KlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=ebmLJNm972HwzSUFY9uX5jVcx5/iRccpx4YVQ/Ccmok=;
 b=2YU0lSgsmSG3AvMdnr3y3RGIW6OYoemVxbYbzWGy42+QSKOoWCrNaM7WVvfnQajcCj
 l/tQ4qHeDnZW5KTWMQFoiqFM4imvJXjZGPjaJeABky4jK4dLPHmOzggNzPNySg43GOcf
 zCcRyZozJxQgWFCie3eBY8c2iu6qXfQVg4NV6ark1Fs1P/i3gpMGGbc8Sry5nL4JabKU
 fun+bqpZ6+yngrSdE6NRHxDAJu7GsntN3Hz5zUPBHKtnFU07z+RSdEz7vr1eCGn22F8B
 UjLlUELd3p7lOupghUs1HKXtBUhNvGU3i7jbiVLYgzgQnQqAEHYUNeUy4aSFJq2a2niW
 ow2A==
X-Gm-Message-State: AOAM533sxn4M/bYtGSkz1dTOJakZe+iyxDoWC0C4UcJrTxHWF1Hn16qb
 U1OQbpvhJ41e441k7PQBjR9fwA==
X-Google-Smtp-Source: ABdhPJwPwppatgTfARevG5qj57LzkviHyAEVrbH6osVFyFMK9ugSZOG8qsD/QNJudQxR5pXFv4wYIw==
X-Received: by 2002:adf:e810:: with SMTP id o16mr394870wrm.359.1636994681553; 
 Mon, 15 Nov 2021 08:44:41 -0800 (PST)
Received: from elver.google.com ([2a00:79e0:15:13:6385:6bd0:4ede:d8c6])
 by smtp.gmail.com with ESMTPSA id 126sm19916816wmz.28.2021.11.15.08.44.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Nov 2021 08:44:40 -0800 (PST)
Date: Mon, 15 Nov 2021 17:44:33 +0100
From: Marco Elver <elver@google.com>
To: Kees Cook <keescook@chromium.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: Build regressions/improvements in v5.16-rc1
Message-ID: <YZKOce4XhAU49+Yn@elver.google.com>
References: <20211115155105.3797527-1-geert@linux-m68k.org>
 <CAMuHMdUCsyUxaEf1Lz7+jMnur4ECwK+JoXQqmOCkRKqXdb1hTQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdUCsyUxaEf1Lz7+jMnur4ECwK+JoXQqmOCkRKqXdb1hTQ@mail.gmail.com>
User-Agent: Mutt/2.0.5 (2021-01-21)
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
Cc: Peter Zijlstra <peterz@infradead.org>,
 linux-pci <linux-pci@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Andrey Ryabinin <ryabinin.a.a@gmail.com>, Stan Skowronek <stan@corellium.com>,
 Herbert Xu <herbert@gondor.apana.org.au>, Helge Deller <deller@gmx.de>,
 kasan-dev <kasan-dev@googlegroups.com>,
 Sergio Paracuellos <sergio.paracuellos@gmail.com>,
 Anton Altaparmakov <anton@tuxera.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Nick Terrell <terrelln@fb.com>, Joey Gouly <joey.gouly@arm.com>,
 =?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@collabora.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Parisc List <linux-parisc@vger.kernel.org>,
 linux-ntfs-dev@lists.sourceforge.net, Hector Martin <marcan@marcan.st>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Clark <robdclark@gmail.com>,
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Nov 15, 2021 at 05:12PM +0100, Geert Uytterhoeven wrote:
[...]
> >   + /kisskb/src/include/linux/fortify-string.h: error: call to '__read_overflow' declared with attribute error: detected read beyond size of object (1st parameter):  => 263:25, 277:17
> 
>     in lib/test_kasan.c
> 
> s390-all{mod,yes}config
> arm64-allmodconfig (gcc11)

Kees, wasn't that what [1] was meant to fix?
[1] https://lkml.kernel.org/r/20211006181544.1670992-1-keescook@chromium.org

Thanks,
-- Marco
