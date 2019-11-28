Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AC77F10C8A4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Nov 2019 13:24:58 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Nxfb4cQxzDr0r
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Nov 2019 23:24:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::242;
 helo=mail-lj1-x242.google.com; envelope-from=linus.walleij@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.b="jabLiYoV"; 
 dkim-atps=neutral
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47NxbF221DzDqdW
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Nov 2019 23:22:00 +1100 (AEDT)
Received: by mail-lj1-x242.google.com with SMTP id u17so914766lja.4
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Nov 2019 04:22:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SXCA4P1++mZ4GjWU0WE3nsYL5FMcWa3cXbIapek2T/s=;
 b=jabLiYoVLgEE4KTwesZZ2DmLmaC34ZclwZ1kroQlBm1emD0PcHERirT/hIXKWoQFos
 FXGKTcgMut7RTmZ5gXXmVxyK4gRpeofT8e2F8s6uLfmA+TQObcbJyQh1OR+sP5z3w+vH
 iVyRWxpvtyGd0kqgtzW3CQRScRwwOudpNBwxE1TAHpVCjIzAJwfin6SsgPTMGVpotdh3
 ooylYNSUGySU9KKHhWVPly1OHawrnLauXENT78d93EllPbBwpznUq9al7WKA6Jc+w8X2
 yzAsA4EJ59JuX+Vfi82qtpXLIyN+EOD8BlzexqqEakfaRNLtDQBtKzorXhAlD3MTM1sV
 03JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SXCA4P1++mZ4GjWU0WE3nsYL5FMcWa3cXbIapek2T/s=;
 b=MYFVoTvUUGJ2GY65BgYEkP9gSFaR/h4rScZW16vZOjYs5SFkDJ4FJHGMryGGN65lCn
 jjCSkEh8MitfaHcwl5xDiOylVqpiTsQ27bNG0WBifgpV8+5CvhMp7YsCv5kPpaPBrmHS
 42QSQttdgwJOTBui56MaFAvwK6+cAmbRicxjAwvPeFM7vb6BM5HcKWe2iwER0/n2qjvw
 NpNPhlCtaTGZvmRkQwTJKxLpwp+2Qfr7Tb0CmBKQbptmDz933dajAS59KNQtjfH42NVB
 BgmvKcHbIZmbnT+eDUPjG35DXLV/WONfUpJ/tn1Kcdxj0HTgsfoPGFJip9K0b9tDT7/S
 jl9Q==
X-Gm-Message-State: APjAAAX5B2fr66FooHo2jC5PwTKfUhFm3ALbXywbPxXqXynNsrtPGL9K
 T3eM36q62r5ZnhAx7A5aE2R1bM/h+ImeRdsRlBWIhA==
X-Google-Smtp-Source: APXvYqxC+CilfFecs694uPA2TkzfBRgLiP8clA3RZ7THF3M8WYbpWuyE8yJFEz9LrJzLIs8TgrYqaoLQgeR+Iv/pMiA=
X-Received: by 2002:a05:651c:1049:: with SMTP id
 x9mr13384895ljm.233.1574943715334; 
 Thu, 28 Nov 2019 04:21:55 -0800 (PST)
MIME-Version: 1.0
References: <7556683b57d8ce100855857f03d1cd3d2903d045.1574943062.git.christophe.leroy@c-s.fr>
In-Reply-To: <7556683b57d8ce100855857f03d1cd3d2903d045.1574943062.git.christophe.leroy@c-s.fr>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 28 Nov 2019 13:21:43 +0100
Message-ID: <CACRpkdZZc5QKqX74WbyO8WQmVw7SSm2HYYMtoxjbEWomGvnkUg@mail.gmail.com>
Subject: Re: [PATCH] powerpc/devicetrees: Change 'gpios' to 'cs-gpios' on
 fsl,spi nodes
To: Christophe Leroy <christophe.leroy@c-s.fr>
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, linux-spi <linux-spi@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>, Paul Mackerras <paulus@samba.org>,
 "linuxppc-dev@lists.ozlabs.org list" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Nov 28, 2019 at 1:16 PM Christophe Leroy
<christophe.leroy@c-s.fr> wrote:

> Since commit 0f0581b24bd0 ("spi: fsl: Convert to use CS GPIO
> descriptors"), the prefered way to define chipselect GPIOs is using
> 'cs-gpios' property instead of the legacy 'gpios' property.
>
> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
