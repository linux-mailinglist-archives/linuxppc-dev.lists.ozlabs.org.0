Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EDF021F5381
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Jun 2020 13:37:20 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49hlMf4BcRzDqS8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Jun 2020 21:37:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::244;
 helo=mail-lj1-x244.google.com; envelope-from=linus.walleij@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=q6IUMGq1; dkim-atps=neutral
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49hkxq5C60zDqLP
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Jun 2020 21:18:22 +1000 (AEST)
Received: by mail-lj1-x244.google.com with SMTP id z9so1932186ljh.13
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Jun 2020 04:18:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=R/H/MbVOF2wG1dAksFZHKza8JjVA0mBuXbjfgXmU1gI=;
 b=q6IUMGq1BoyrzF+yphtauVJSkEKnYVpLrCpHxSKEezsjWMWsSneZ9MYEZWLufzYv4m
 WB77pudqkIPq6h8aSKtcawWDrMyuyYGSYoPz17sFJ/BYCfBHD9A3DHYrWfjUFKpprjh/
 q4LWZnmqgeJJr9AObHAQPaOoFzNGEYnTOX0xjDfNvmVANSGexwCLUNdWIPjSYskLdxMR
 GGEMS42Kcoiij8ZCTppz+8QMyN3zCO80Yplre+E0lPj/0pRIfppGHm9IQrkERGt0sCpB
 xL3cuSSmEXLwhqu5Yp+z0o+3pgf1BIRAtIMP7019kxuiRumrgAAbRi4zQWbzrt8V7teP
 J/Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=R/H/MbVOF2wG1dAksFZHKza8JjVA0mBuXbjfgXmU1gI=;
 b=J26rV3MOXfDVIyByO5T6NeeBtqzlVh58qlP42gEUKC3Wl3OAx5p7McqE6Ceg2rawj1
 1AkgL97mfBYENEQRSv+whTQjvB9chxfjQ4x+65QOOBzApx/Y77oKsrT3AFWItpz2h+1N
 ojJDzEyFfqVR8ZrnfXnnEfM3ux05rrsU9N03FGe+HFNO8FUtiGIuKZGB36PrVhLCZPRt
 UCmgxCzLJL1I1hLup8GMLpYqplIV3bqtHwvjW9WwDLWWOw+HLuE96AzrWev76+SZ2MbY
 0zFvBFKkj8uwW9TTD5zrZa7/9TCjgqboiKQcJyKNsMSY6W4ZXsxjlfTbAL3lDGuA07Rz
 /9QQ==
X-Gm-Message-State: AOAM530+woIr7SbyLHVsQhm4eIdy0+EZoN9wfP2hkVEgP11wkwzQ2PmT
 OoEGHwOperutgAwW1QofthMHGpLv0YML5V1driQ8lg==
X-Google-Smtp-Source: ABdhPJwYHSqLY8+MZktVcG/jK3d2tobvKvb5DukA5J3ghqqrGvCncKgJl0YY4MKk7oh9UCfApO7oANgemtP3qCfhFRk=
X-Received: by 2002:a2e:7303:: with SMTP id o3mr1616150ljc.100.1591787897894; 
 Wed, 10 Jun 2020 04:18:17 -0700 (PDT)
MIME-Version: 1.0
References: <bafd8df9e743c433196c727293c5015620fae2b8.1591428452.git.christophe.leroy@csgroup.eu>
In-Reply-To: <bafd8df9e743c433196c727293c5015620fae2b8.1591428452.git.christophe.leroy@csgroup.eu>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 10 Jun 2020 13:18:06 +0200
Message-ID: <CACRpkdasvyWRLiaHuZ+vkDC4MxNqx3qvjhy7Q8Qnfn+d74Xpkg@mail.gmail.com>
Subject: Re: [PATCH] tty: serial: cpm_uart: Fix behaviour for non existing
 GPIOs
To: Christophe Leroy <christophe.leroy@csgroup.eu>
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "linuxppc-dev@lists.ozlabs.org list" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
 Jiri Slaby <jslaby@suse.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Christophe!

On Sat, Jun 6, 2020 at 9:30 AM Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:


>                 gpiod = devm_gpiod_get_index(dev, NULL, i, GPIOD_ASIS);
>
> -               if (gpiod) {
> +               if (!IS_ERR_OR_NULL(gpiod)) {
>                         if (i == GPIO_RTS || i == GPIO_DTR)
>                                 ret = gpiod_direction_output(gpiod, 0);
>                         else

This code, and the way descriptors are used in the driver leads
me to believe that the right solution is to use the optional
call with a hard error check:

gpiod = devm_gpiod_get_index_optional(...);

if (IS_ERR(gpiod))
    return PTR_ERR(gpiod);

if (gpiod) {
... followed by the old code ...

This makes sure that the array member is left NULL if there is no
GPIO on this line, and all other errors, such as -EPROBE_DEFER
which currently absolutely does not work, will lead to us properly
exiting with an error.

Yours,
Linus Walleij
