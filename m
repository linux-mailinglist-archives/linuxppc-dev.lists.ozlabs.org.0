Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 275472A79F4
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Nov 2020 10:02:02 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CRcw72qNdzDqZC
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Nov 2020 20:01:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::441;
 helo=mail-wr1-x441.google.com; envelope-from=lee.jones@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=iet3rID4; dkim-atps=neutral
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CRct51jnBzDqVr
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Nov 2020 20:00:12 +1100 (AEDT)
Received: by mail-wr1-x441.google.com with SMTP id g12so776254wrp.10
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 05 Nov 2020 01:00:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=OC9aACGGqpKEo7MnuaDGqRBy9T/1FYSfYU5LJ+QJCl8=;
 b=iet3rID42HqMn/ztHv9eczOUGQRszWGQ4gTxGQMciIqMK+4ZPQwPczqI+p4wnA/cls
 3KMpzJRDwZTGeHEAeQVc7BwEYhYUIfRfgnb+QwIxCfjpzgRfhgcyu4G7eAawtxEQrieT
 I7q/vTtpaF+Y+FefNaVDFIGfJ5CUMcwQgjKNB1eY/YlQtu6cVWya4DsiQakJEJxQjlfG
 +0UUkxOV2E7+IlHLR4NPuAESrUTjFXcofSoMWk3L1njZdLJ1bmt9NX1bNEjCmWtPVjN1
 3UBHONZSsQ3NQv9FyTFCvxkK0ZjfbtpubblFmrhhGCgdn9Sj1TqFUfzZTRiTbzbBhD8q
 B0kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=OC9aACGGqpKEo7MnuaDGqRBy9T/1FYSfYU5LJ+QJCl8=;
 b=afWGCI/6/mhnctD+DLPGBoUcPHJ86lVlGk7x/cECtFICtCYoxQ8tM535cCLmc/i8HS
 O6ehLRSuu5B+fAH5nVWChTI/8rnrpsQfFVd0DcgMiYfNsW7QATuDqIgRL5J1UsVWpBwQ
 LBQKRt8CuT/MlQlINKcEhrh+3BkVfRc+zB0BrNMkL0DVNXIm62Otjd+IBunnxcyFs+zR
 yboqV/HVU1SxD8qsoA7flt/Bwgo/brPNbacjwTroymRsID4/l+22JGSDAYURIBbvwzUu
 WPPsPO1F5UKO3qNJzWUlb+C0h9YxNYzTPWF1l0VzSLrsWjSLcmMYPxVN9fguJ24Yc/8O
 SNag==
X-Gm-Message-State: AOAM531HlinUq7zAfIsh2GQmqs1bbhhIgJ/UYb3J9KrwMois/9k7qsXu
 pVTgIFjxaVBV8qxZeq/G1fXBfXXQZEVjn5S4
X-Google-Smtp-Source: ABdhPJz5YH+O3f4r5/BhYEyIUJbNVI13RXq1//82HKWKaWy7iY9wQSpO1aKBSoydNPOzuoqt70Vkcw==
X-Received: by 2002:adf:f185:: with SMTP id h5mr1679324wro.10.1604566809726;
 Thu, 05 Nov 2020 01:00:09 -0800 (PST)
Received: from dell ([91.110.221.242])
 by smtp.gmail.com with ESMTPSA id g23sm1567257wmh.21.2020.11.05.01.00.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Nov 2020 01:00:09 -0800 (PST)
Date: Thu, 5 Nov 2020 09:00:07 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Jiri Slaby <jirislaby@kernel.org>
Subject: Re: [PATCH 34/36] tty: serial: pmac_zilog: Make disposable variable
 __always_unused
Message-ID: <20201105090007.GE4488@dell>
References: <20201104193549.4026187-1-lee.jones@linaro.org>
 <20201104193549.4026187-35-lee.jones@linaro.org>
 <445a6440-b4c8-4536-891b-0cefc78e5f57@csgroup.eu>
 <e027b620-56f8-7d8b-84ff-54839f94a4c7@kernel.org>
 <20201105083626.GW4488@dell>
 <a6b63789-1315-cec1-9575-0d858a6da1d5@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a6b63789-1315-cec1-9575-0d858a6da1d5@kernel.org>
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 linux-serial@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 05 Nov 2020, Jiri Slaby wrote:

> On 05. 11. 20, 9:36, Lee Jones wrote:
> > On Thu, 05 Nov 2020, Jiri Slaby wrote:
> > 
> > > On 05. 11. 20, 8:04, Christophe Leroy wrote:
> > > > 
> > > > 
> > > > Le 04/11/2020 à 20:35, Lee Jones a écrit :
> > > > > Fixes the following W=1 kernel build warning(s):
> > > > > 
> > > > >    drivers/tty/serial/pmac_zilog.h:365:58: warning: variable
> > > > > ‘garbage’ set but not used [-Wunused-but-set-variable]
> > > > 
> > > > Explain how you are fixing this warning.
> > > > 
> > > > Setting  __always_unused is usually not the good solution for fixing
> > > > this warning, but here I guess this is likely the good solution. But it
> > > > should be explained why.
> > 
> > There are normally 3 ways to fix this warning;
> > 
> >   - Start using/checking the variable/result
> >   - Remove the variable
> >   - Mark it as __{always,maybe}_unused
> > 
> > The later just tells the compiler that not checking the resultant
> > value is intentional.  There are some functions (as Jiri mentions
> > below) which are marked as '__must_check' which *require* a dummy
> > (garbage) variable to be used.
> > 
> > > Or, why is the "garbage =" needed in the first place? read_zsdata is not
> > > defined with __warn_unused_result__.
> > 
> > I used '__always_used' here for fear of breaking something.
> > 
> > However, if it's safe to remove it, then all the better.
> 
> Yes please -- this "garbage" is one of the examples of volatile misuses. If
> readb didn't work on volatile pointer, marking the return variable as
> volatile wouldn't save it.
> 
> > > And even if it was, would (void)!read_zsdata(port) fix it?
> > 
> > That's hideous. :D
> 
> Sure, marking reads as must_check would be insane.
> 
> > *Much* better to just use '__always_used' in that use-case.
> 
> Then using a dummy variable to fool must_check must mean must_check is used
> incorrectly, no :)? But there are always exceptions…

Agreed on all points.

Will fix.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
