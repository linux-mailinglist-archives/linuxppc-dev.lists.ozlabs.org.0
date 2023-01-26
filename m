Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F2BB67D5F1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Jan 2023 21:08:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P2sGS0bvxz3fG4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Jan 2023 07:08:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=H+6SnUs6;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::b2e; helo=mail-yb1-xb2e.google.com; envelope-from=linus.walleij@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=H+6SnUs6;
	dkim-atps=neutral
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com [IPv6:2607:f8b0:4864:20::b2e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P2sFY3JyLz3cgR
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Jan 2023 07:07:42 +1100 (AEDT)
Received: by mail-yb1-xb2e.google.com with SMTP id u72so3427381ybi.7
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Jan 2023 12:07:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FLvduNoOt8LztTYVpuNMVnPelMmnqyRxqRLyg6HGxcg=;
        b=H+6SnUs6VnnGPZqMii9E04B2jZbdPO8JEzKwKb/AJ8KxiwwnK2MNII3exjLOSl5gid
         77VoL20WxdjPiAd6mM/Frt++DnvRBGeYkCnMZxJPaMaSvtgB/RUnrDdxLVgKkeveSvqV
         LrzyjFLEy9Ju1waaH1L59m7AUNdOGsFP/ugRIHnpl2AenIYyj6LEgFSvN6LFq6cNKlEq
         E2X18z1uBxOTst1xMvqGuCwKxTd4bVYXZAD93G/mIzNmkdajWluOkGUV1vYYnY3i2Fdw
         fllbaK801dFQ1i7INkpwSx52GZBr7tIxG6tWtQsCZln8/tPnjiETmnRpLougqogGIAL/
         B/Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FLvduNoOt8LztTYVpuNMVnPelMmnqyRxqRLyg6HGxcg=;
        b=LEzKZBtasVsUiiW7nc/hnxZDHN1H2GaWzV7OxDVdHqxYsEG5/1JeRkc0Lp9Df7enh8
         ySFmWdoBuTlQsP+VrvJPvApR8YpUa5T6cjHGJOg/hQNOnCaMT+ddPwg9PZBZqm90bkMJ
         TXQxC3s5km/YDrf1AxU6Wt/hwYXWlZO6bMmYZ/wPmHZ85VLQLnKng2/ys6EnnZj20Ntb
         O6V/bnoZo3O90MVwXiQGuq5o4KGKbKVghjJV5ZY5VL27fuglKTbfaMM3aaY6HqjmwmFf
         6ndWQszXB6sqXSHYnQ0vhH/kB8bq87mXkTF4rri8qDk7GewCUgMhALjvrSivo6fvoSRS
         pBwA==
X-Gm-Message-State: AO0yUKUeCduwFfYIVklnQjxj9Q5QsGq2zeCDSAYKCoo9fWgiKiRAybir
	PuPD/bGspfe+1gIWQCGzZUsxAPYfmrUCxXnTq8dP2A==
X-Google-Smtp-Source: AK7set+RXU546bCG2ieA1RNematBemc4AFyAycDDxbMQYNdnjp7iUSmTGAk1mBuk641lDSfvZ/bqCOrkZeydPqsG8fw=
X-Received: by 2002:a25:f81b:0:b0:80b:821f:b621 with SMTP id
 u27-20020a25f81b000000b0080b821fb621mr881734ybd.24.1674763659341; Thu, 26 Jan
 2023 12:07:39 -0800 (PST)
MIME-Version: 1.0
References: <20221226123630.6515-1-pali@kernel.org> <db008af4-2918-4458-aa68-2392674475c8@app.fastmail.com>
 <Y8rMJcX0cqThKj2N@google.com>
In-Reply-To: <Y8rMJcX0cqThKj2N@google.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 26 Jan 2023 21:07:27 +0100
Message-ID: <CACRpkdZrL3Wpk6_Pka_Ye-9C0Ewx5ULZ8pt396kO-e95kqku_A@mail.gmail.com>
Subject: Re: [PATCH RESEND 0/8] Resend LED patches
To: Lee Jones <lee@kernel.org>
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
Cc: Arnd Bergmann <arnd@arndb.de>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, soc@kernel.org, Pavel Machek <pavel@ucw.cz>, =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>, linux-leds@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jan 20, 2023 at 6:15 PM Lee Jones <lee@kernel.org> wrote:

> If everyone is convinced that applying these drivers is the correct
> thing to do, I'd be happy to (rather) take them via LEDs.

Oh you are co-maintainer of the LED subsystem since a month!

Sadly this series stalled way before that, so that's why we didn't notice.

By all means, pick it up!

Yours,
Linus Walleij
