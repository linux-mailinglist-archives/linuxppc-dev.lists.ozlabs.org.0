Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 07CE1451EFE
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Nov 2021 01:35:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HtRtb742mz304j
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Nov 2021 11:35:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=kRgsOovb;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::62c;
 helo=mail-pl1-x62c.google.com; envelope-from=keescook@chromium.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=kRgsOovb; dkim-atps=neutral
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HtRsy0Gxbz2xrl
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Nov 2021 11:35:17 +1100 (AEDT)
Received: by mail-pl1-x62c.google.com with SMTP id t21so15875925plr.6
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Nov 2021 16:35:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=6YrJDwz5lHylUrRKBiCCXn7XIadwbTCaDNmr8F8Qv+s=;
 b=kRgsOovbagRO/7210nSyOKEBlmhfA5hNYfPQV4k7lydus9N2uNl5Vt0UygZC7jGLy1
 CcSKdAOPN7CAjIaxG2Nk7LhNoTdTNyUIV57l7UZ/U0TQtm7n+dBKTmv+GCqWpklKxw86
 72xq1Tvc+lxHwltemgeZ72MdiUZIJVqjFa0RI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=6YrJDwz5lHylUrRKBiCCXn7XIadwbTCaDNmr8F8Qv+s=;
 b=3cWvYyMWq0FwumcHC/7suNwMeybHzualYQMbAfe4O+3LUq7fAJc6HPqT+virXvf9OG
 GXi7KYHEFtsFBgObczQV2HylLkv3gCRVkNdjFCDdwFuqR+bCTf8AspMBPHQN+QTO40g+
 IC7fjogA2W86MeOhmh/WVuOZFgjvQKr/orVw33EmOGxNrmwIFL8cFQjMFqRlH5Ja7u2J
 9em6HpdtbntIYkWQ+hWpJHPfDlASwbYCLmStiAbXj8ENwzZNSKMDeSMSbjvwO26EzBSg
 86gTNNBkKyh3DCr0UTJhFs52cM2828y2W/M0jxm2xLyLsWbJuugOBys/df3/bWzgpF8d
 ZmQA==
X-Gm-Message-State: AOAM532z8nEspJ2nLOApYerjn4db6jq/TjgBu80/NXiUBga7gZi3KVeC
 /hqOm4TXOxysswMysMaUjlzUTQ==
X-Google-Smtp-Source: ABdhPJy9iYaBB3Pj/LejC8q7/hsST+5gxO7ABIHhxz3+lYk9ZK6BkrL6e9tXPNM1m5lGV6jB9/FWOw==
X-Received: by 2002:a17:90a:c398:: with SMTP id
 h24mr3495024pjt.73.1637022914921; 
 Mon, 15 Nov 2021 16:35:14 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id s21sm16292860pfk.3.2021.11.15.16.35.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Nov 2021 16:35:14 -0800 (PST)
Date: Mon, 15 Nov 2021 16:35:14 -0800
From: Kees Cook <keescook@chromium.org>
To: Marco Elver <elver@google.com>
Subject: Re: Build regressions/improvements in v5.16-rc1
Message-ID: <202111151633.DE719CE@keescook>
References: <20211115155105.3797527-1-geert@linux-m68k.org>
 <CAMuHMdUCsyUxaEf1Lz7+jMnur4ECwK+JoXQqmOCkRKqXdb1hTQ@mail.gmail.com>
 <YZKOce4XhAU49+Yn@elver.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YZKOce4XhAU49+Yn@elver.google.com>
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
 Geert Uytterhoeven <geert@linux-m68k.org>,
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

On Mon, Nov 15, 2021 at 05:44:33PM +0100, Marco Elver wrote:
> On Mon, Nov 15, 2021 at 05:12PM +0100, Geert Uytterhoeven wrote:
> [...]
> > >   + /kisskb/src/include/linux/fortify-string.h: error: call to '__read_overflow' declared with attribute error: detected read beyond size of object (1st parameter):  => 263:25, 277:17
> > 
> >     in lib/test_kasan.c
> > 
> > s390-all{mod,yes}config
> > arm64-allmodconfig (gcc11)
> 
> Kees, wasn't that what [1] was meant to fix?
> [1] https://lkml.kernel.org/r/20211006181544.1670992-1-keescook@chromium.org

Ah, I found it:

http://kisskb.ellerman.id.au/kisskb/buildresult/14660585/log/

it's actually:

    inlined from 'kasan_memcmp' at /kisskb/src/lib/test_kasan.c:897:2:

and

    inlined from 'kasan_memchr' at /kisskb/src/lib/test_kasan.c:872:2:

I can send a patch doing the same as what [1] does for these cases too.

-- 
Kees Cook
