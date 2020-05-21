Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D48C21DC596
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 May 2020 05:26:01 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49SFPy46qNzDqnv
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 May 2020 13:25:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::543;
 helo=mail-pg1-x543.google.com; envelope-from=keescook@chromium.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=dQODjFoC; dkim-atps=neutral
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49SFN65LHtzDqjQ
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 May 2020 13:24:22 +1000 (AEST)
Received: by mail-pg1-x543.google.com with SMTP id f4so2438323pgi.10
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 May 2020 20:24:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=mWnBjl1zYC8g8arTkDhsLL1NSSPTMEKdZHG0NVZD9M8=;
 b=dQODjFoCNsXPgZtIsjjHamdC4Pu+mSJd0GckTyPx551zr98aODM5dJFMdkhXgPjklf
 VYPAt85gs5oCBBSY8ECg8cFn31wUYDRLAAh9PNMfsCMF8a+/KTkDsHPt9m0Jc9PtxSpU
 8wZgJVSDe5kxAm3oAtQuqWMfKgxPEZGlO2rzc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=mWnBjl1zYC8g8arTkDhsLL1NSSPTMEKdZHG0NVZD9M8=;
 b=Q/JqleJz02Qz7Eg1fHDdNrUGw2NH9/roXGtukXSsSQxKbD6w84fzEv4s5RaR/if9rL
 kyMqPRK8nHoVjyQOkWcxjRFRpkRzoZhtYwWGLm5p2Oad6Scrturo6hCeq5CQVI6A0vLq
 uGPZRn0mOyKfwoT5eg6zJo3FsWRVLYyj6DlhGdXkB5ievpmJMeKkziIv4aAQVZ4CAmor
 vao5Dy84dF3zflMhKrjcicdmosYhseEWYNAufuIob7qgk2sm2HR+sxTvMvCnN/6IWCP9
 7MVY+tDgj4NoDECZPm6FX5ChC51WYZBxSsG7LsgQ9DrqAec+kFz9lTlyNWBr8e1LtH8s
 53Ag==
X-Gm-Message-State: AOAM532UgPYdwdYnxjP/UmGvgnAiBrcDotSZOJtDx+uXCWLU4h1r3URd
 IA8hlaT0H03tcq5H4LjFPNBWPw==
X-Google-Smtp-Source: ABdhPJwEXKl6A+KQbb5Fp68HNAuocmXXpqB85QaVdfl5nI9EFTDUjgRqSfp1CPCQYOESq1iPuYQ3Xw==
X-Received: by 2002:a63:f242:: with SMTP id d2mr7158481pgk.212.1590031458617; 
 Wed, 20 May 2020 20:24:18 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id s206sm3325954pfc.31.2020.05.20.20.24.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 May 2020 20:24:16 -0700 (PDT)
Date: Wed, 20 May 2020 20:24:15 -0700
From: Kees Cook <keescook@chromium.org>
To: Li Yang <leoyang.li@nxp.com>
Subject: Re: [PATCH] soc: fsl: qe: Replace one-element array and use
 struct_size() helper
Message-ID: <202005202022.588918E61@keescook>
References: <20200518221904.GA22274@embeddedor>
 <202005181529.C0CB448FBB@keescook>
 <CADRPPNR-Croux9FgnrQJJmdF2jNnuAmC+2xMJSgSbkbRv9u8Mw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CADRPPNR-Croux9FgnrQJJmdF2jNnuAmC+2xMJSgSbkbRv9u8Mw@mail.gmail.com>
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
Cc: "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 lkml <linux-kernel@vger.kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, Qiang Zhao <qiang.zhao@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, May 20, 2020 at 06:52:21PM -0500, Li Yang wrote:
> On Mon, May 18, 2020 at 5:57 PM Kees Cook <keescook@chromium.org> wrote:
> > Hm, looking at this code, I see a few other things that need to be
> > fixed:
> >
> > 1) drivers/tty/serial/ucc_uart.c does not do a be32_to_cpu() conversion
> >    on the length test (understandably, a little-endian system has never run
> >    this code since it's ppc specific), but it's still wrong:
> >
> >         if (firmware->header.length != fw->size) {
> >
> >    compare to the firmware loader:
> >
> >         length = be32_to_cpu(hdr->length);
> >
> > 2) drivers/soc/fsl/qe/qe.c does not perform bounds checking on the
> >    per-microcode offsets, so the uploader might send data outside the
> >    firmware buffer. Perhaps:
> 
> We do validate the CRC for each microcode, it is unlikely the CRC
> check can pass if the offset or length is not correct.  But you are
> probably right that it will be safer to check the boundary and fail

Right, but a malicious firmware file could still match CRC but trick the
kernel code.

> quicker before we actually start the CRC check.  Will you come up with
> a formal patch or you want us to deal with it?

It sounds like Gustavo will be sending one, though I don't think either
of us have the hardware to test it with, so if you could do that part,
that would be great! :)

-- 
Kees Cook
