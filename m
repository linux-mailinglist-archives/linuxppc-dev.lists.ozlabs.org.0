Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A229620DC0
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Nov 2022 11:51:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N64dy3CGmz3cjY
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Nov 2022 21:51:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=HbSjHAG+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::631; helo=mail-ej1-x631.google.com; envelope-from=linus.walleij@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=HbSjHAG+;
	dkim-atps=neutral
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N64d13lJpz3bqt
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Nov 2022 21:50:26 +1100 (AEDT)
Received: by mail-ej1-x631.google.com with SMTP id q9so37636527ejd.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 08 Nov 2022 02:50:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cI1zMfq3lTc8UzWRLodrLvVbxywyN3pwGfeoh4TP7Pk=;
        b=HbSjHAG+XMjuE1yuF4Dqsww1Soriw/tDonvjEn0RhbG+dx+XK/8rNeqM9nIhaOci/i
         IhP4Iu9O+G4vaxfHK2IvYHtLJ3wrdJ7/2pByztIlpV6zD6khoDqfZwfecGHBtSu6Kbuh
         QMhjVDGzCZhCkUNYa1oFs+lzelwJLwKAWi22MirwImE3XSBLphjrI6wB9baH2oYH9Ijj
         nIWof0HDKDJUzG2DkSO5EmnherOt+8ASNa0iRG56Y1hzmQg9xkxB/o56l9XI/qvzUjaI
         XRh0xaRroeM3nx65FnZlrRtcNMAxDGy3d1RVQw2LFNcj215HWrk9t017EfrBrP070Rj+
         EDog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cI1zMfq3lTc8UzWRLodrLvVbxywyN3pwGfeoh4TP7Pk=;
        b=UXnOg6CUS1VIQ9gO88UfMwBHwz2N3pWgAUUCI9Vy+4HiScGWVQFJhkcm/jtSc0B8E3
         yFB5W3dnrduFewmzgy02ArbOtpPejCLuP3pNUQNtuPVkD3AUo3gXXg1yIoXa9Gm7N7vC
         vMmbPNOeTv3TTYkSSC4Re/Nt70tWIajeb/bTS/O5TaeLZnb8+K262HCPYRMxZj3yk51s
         zzhADZ+T9HirpwedhrDMcg5g72AGFchBciWOMfyitVvEbyGcRfs1L+E04o6PSL11qJv6
         z28YkgUoWUtU0/lo2griwx9XTtzug5kzWZuxY+NceiO/tY50gAxpQr3mr6x/g9FOTDm9
         5qSg==
X-Gm-Message-State: ACrzQf3ePkmS8xXqZvb18uV9qJTpEErKaChpUUr4amvgSfCRb8hTLYVc
	ZAg10vnx9Jq6XZZd5tlgdaL3yq+YyzXA1S4VTTnhlg==
X-Google-Smtp-Source: AMsMyM6TWlffPm2NhzhPMpDHWJ7vQjbA7Kdk+SXNums04xc/5fH3UzZ48rtJuLU8M+7f5WqkQMIJWkoF20YdR/IBeKQ=
X-Received: by 2002:a17:906:4c4b:b0:7ad:a197:b58e with SMTP id
 d11-20020a1709064c4b00b007ada197b58emr53429067ejw.203.1667904619249; Tue, 08
 Nov 2022 02:50:19 -0800 (PST)
MIME-Version: 1.0
References: <Y2nKIbKxHAMimxII@google.com>
In-Reply-To: <Y2nKIbKxHAMimxII@google.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 8 Nov 2022 11:50:07 +0100
Message-ID: <CACRpkdaW-dwKNtTQ2_Mj4JpG34N3m19g+s5xcs3Xj=2kAdE0cw@mail.gmail.com>
Subject: Re: [PATCH] soc: fsl: qe: request pins non-exclusively
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
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
Cc: Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, Li Yang <leoyang.li@nxp.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, Qiang Zhao <qiang.zhao@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Nov 8, 2022 at 4:16 AM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:

> Commit 84582f9ed090 ("soc: fsl: qe: Avoid using gpio_to_desc()") changed
> qe_pin_request() to request and hold GPIO corresponding to a given pin.
> Unfortunately this does not work, as fhci-hcd requests these GPIOs
> first, befor calling qe_pin_request() (see
> drivers/usb/host/fhci-hcd.c::of_fhci_probe()).
> To fix it change qe_pin_request() to request GPIOs non-exclusively, and
> free them once the code determines GPIO controller and offset for each
> GPIO/pin.
>
> Also reaching deep into gpiolib implementation is not the best idea. We
> should either export gpio_chip_hwgpio() or keep converting to the global
> gpio numbers space until we fix the driver to implement proper pin
> control.
>
> Fixes: 84582f9ed090 ("soc: fsl: qe: Avoid using gpio_to_desc()")
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Wow! Thanks for fixing this!

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

I just sent that patch into the SoC patch tracker (soc@kernel.org)
with a not to apply it directly, I suggest you do the same (or ask me
to sign it off and send it).

Yours,
Linus Walleij
