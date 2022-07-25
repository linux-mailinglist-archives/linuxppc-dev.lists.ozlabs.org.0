Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 139C758046B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Jul 2022 21:21:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ls8yy3WNZz3cdw
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Jul 2022 05:20:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=AzQOEmHT;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2a00:1450:4864:20::62b; helo=mail-ej1-x62b.google.com; envelope-from=torvalds@linuxfoundation.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=AzQOEmHT;
	dkim-atps=neutral
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ls8yK0lw8z3bl6
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Jul 2022 05:20:23 +1000 (AEST)
Received: by mail-ej1-x62b.google.com with SMTP id va17so22430741ejb.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Jul 2022 12:20:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XVDIZFYcquyDU30LBhCPD/PXD8V3Ex6g+/4Jt+pCRG0=;
        b=AzQOEmHT1inFFysvEynnDtRbqEeUYeR3B2ZfONqWXZGdpODf9tTWJBIMwQvdfinCE6
         8EN+GqBKJQTMGcSZ9cYlGyaoEZMlReop1K92FAHZ1Kc+VjrcDKpUg8JJP71bsnkzKbs3
         mRPrDdQCmFJwtfI+xqu7XqXj1zo3TG0h/Dd74=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XVDIZFYcquyDU30LBhCPD/PXD8V3Ex6g+/4Jt+pCRG0=;
        b=P8dAu9KnIZnVEST0EJl+mAb8pJqo0RHAaCe4t/hqqVoqLZPgafh+CQdLXwAMCimhdt
         32j6etjUi8jG6vKUW3PRmdoni+yJiUguTk1K3M/jlgk4CAiCaokgZuoj8PG/MkubKHGO
         qSnYixiDRzvBtiMUDjP2Wv/n2/bxHsfM+aXUJu/Gvw9puO5sMYb83GwH5zK6f8w1e4lI
         K3jalyPChmXbdT5dFu/2PA7m8aP2ZU5KxMU94kZE91NOYBEAmCF89osbfYNp7ni9TfdB
         776Acw+oGptLi/i2z2rzEOX25tax6GseuQjzfywgn5jMFk9iOqpiHspg9k+neSE6W+dC
         BhYw==
X-Gm-Message-State: AJIora8KkAKxVdMZdpvN/93K2Jd6m/umUxaHMmcSgF0T0p6z5xxIzYl/
	xdQFAuM0lTOe9IFewx1JFxSxjvyGDDFD4Ei7
X-Google-Smtp-Source: AGRyM1vZ/FqglQGGMcOtll6YGVTAVbHuEYOEmg4UI71f/0Jnck/veK4vL0QehB5QqvofuAyBZMAeXg==
X-Received: by 2002:a17:907:720a:b0:72b:549e:305a with SMTP id dr10-20020a170907720a00b0072b549e305amr11037103ejc.691.1658776814083;
        Mon, 25 Jul 2022 12:20:14 -0700 (PDT)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com. [209.85.221.53])
        by smtp.gmail.com with ESMTPSA id a6-20020a056402168600b0043bdc47803csm4824964edv.30.2022.07.25.12.20.13
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Jul 2022 12:20:13 -0700 (PDT)
Received: by mail-wr1-f53.google.com with SMTP id u5so17367890wrm.4
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Jul 2022 12:20:13 -0700 (PDT)
X-Received: by 2002:a05:6000:180f:b0:21d:68f8:c4ac with SMTP id
 m15-20020a056000180f00b0021d68f8c4acmr8625583wrh.193.1658776813045; Mon, 25
 Jul 2022 12:20:13 -0700 (PDT)
MIME-Version: 1.0
References: <20220725123918.1903255-1-mpe@ellerman.id.au>
In-Reply-To: <20220725123918.1903255-1-mpe@ellerman.id.au>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 25 Jul 2022 12:19:57 -0700
X-Gmail-Original-Message-ID: <CAHk-=wihON4Ytte5zLHWNQtTapUvCpkToxY06OjX-_2B+Gq6Gg@mail.gmail.com>
Message-ID: <CAHk-=wihON4Ytte5zLHWNQtTapUvCpkToxY06OjX-_2B+Gq6Gg@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: Re-enable DCN for 64-bit powerpc
To: Michael Ellerman <mpe@ellerman.id.au>
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
Cc: dan@danny.cz, linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org, tpearson@raptorengineering.com, alexdeucher@gmail.com, linuxppc-dev@lists.ozlabs.org, linux@roeck-us.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jul 25, 2022 at 5:39 AM Michael Ellerman <mpe@ellerman.id.au> wrote:
>
> Further digging shows that the build failures only occur with compilers
> that default to 64-bit long double.

Where the heck do we have 'long double' things anywhere in the kernel?

I tried to grep for it, and failed miserably. I found some constants
that would qualify, but they were in the v4l colorspaces-details.rst
doc file.

Strange.

             Linus
