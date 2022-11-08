Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F8BE621941
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Nov 2022 17:21:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N6Cz371bkz3cdy
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Nov 2022 03:21:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=jgOlJCy9;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::635; helo=mail-pl1-x635.google.com; envelope-from=dmitry.torokhov@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=jgOlJCy9;
	dkim-atps=neutral
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N6Cy53vcrz3cJL
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Nov 2022 03:20:44 +1100 (AEDT)
Received: by mail-pl1-x635.google.com with SMTP id g24so14630031plq.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 08 Nov 2022 08:20:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=fcOTwRt74ZUVDeA76qVKozYMO1aqfbJjR0DYqZfdJoQ=;
        b=jgOlJCy9S5gp21jGo9mQxzBK+hBiRAXgddp+NZJ6U5V5orcLW9BzzSJOD9Qsky6ITl
         teDTlteRzITS5V8xd2L2VW/zflT0w4cs7WiZsOw4z++zYSDHtVADYshhQbgi/16YZrV2
         2af3rZUPvFyr1JVtmJa24pm/fK++e4PCUDnlThz+G6LckZAMWGoysf+6Epd6TjDRv1uA
         bm+ksxg+auVmeaBc3OvCXCtijS6gbjV6hTycASzez1w6qJO55qO6ILh8u92RqHcdN5Ga
         W/cIjE4Go4/RJh2Cc8T4eUKEfNADi2aOQs8MQbLbsnjIzfqfDpuB3ea6y3poIp+ZHGnX
         531A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fcOTwRt74ZUVDeA76qVKozYMO1aqfbJjR0DYqZfdJoQ=;
        b=FDo2yK/lUG567DqoDhKdyC3YafZn0x6XJ3igIkkp7boaAuZaadgvE908d6tLmtLlce
         DLByfcYCqr7myd5nKmmjkTzPeK0xTEnXj/cG6xCSG41FBmQbLrEQn+qN0UsncPUZHVXr
         Sv8jdBQts1lYjf6rX4zP5TRUUwwW59/Mp1bzVJDjIqzvAYt7WLa4zi5E8pL4WAnWAXOH
         +scnkZhv3qCnPy1Qqo37LK54EGyUTxNQY36kZEpmQbdPp3YVO66yfIfaEJmiQ0ZNityL
         uilyoSm5IxK3RJC2UySP+1ts0NlzAcE/7VlG+uXGVcNTSDxXpX8MP1EVNNRqtoLfSaPp
         dJWQ==
X-Gm-Message-State: ACrzQf3qx4exdWl/j/WJ5C+pbOgKRXaFex/VY7yhdj6veCwBt4npr45m
	hJNYBDNyxpbfQpZ/yXlAKuA=
X-Google-Smtp-Source: AMsMyM5JNkw4ZkI3BmSYbnomBaqSCJ9lcpfu/3fXi6rQ1LR5WG8SRwMJ2atG+pMlOBzMySNhkzYCDg==
X-Received: by 2002:a17:90a:d794:b0:20b:590:46b1 with SMTP id z20-20020a17090ad79400b0020b059046b1mr1025563pju.83.1667924441551;
        Tue, 08 Nov 2022 08:20:41 -0800 (PST)
Received: from ?IPv6:::1? ([2607:fb90:8e10:f652:ac39:6d51:4e64:df08])
        by smtp.gmail.com with ESMTPSA id p6-20020a63e646000000b0046b2ebb0a52sm5883889pgj.17.2022.11.08.08.20.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Nov 2022 08:20:40 -0800 (PST)
Date: Tue, 08 Nov 2022 08:20:38 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] soc: fsl: qe: request pins non-exclusively
User-Agent: K-9 Mail for Android
In-Reply-To: <CACRpkdaW-dwKNtTQ2_Mj4JpG34N3m19g+s5xcs3Xj=2kAdE0cw@mail.gmail.com>
References: <Y2nKIbKxHAMimxII@google.com> <CACRpkdaW-dwKNtTQ2_Mj4JpG34N3m19g+s5xcs3Xj=2kAdE0cw@mail.gmail.com>
Message-ID: <490B1A14-9DD0-4001-9F39-869F42F7AAA7@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

On November 8, 2022 2:50:07 AM PST, Linus Walleij <linus=2Ewalleij@linaro=
=2Eorg> wrote:
>On Tue, Nov 8, 2022 at 4:16 AM Dmitry Torokhov
><dmitry=2Etorokhov@gmail=2Ecom> wrote:
>
>> Commit 84582f9ed090 ("soc: fsl: qe: Avoid using gpio_to_desc()") change=
d
>> qe_pin_request() to request and hold GPIO corresponding to a given pin=
=2E
>> Unfortunately this does not work, as fhci-hcd requests these GPIOs
>> first, befor calling qe_pin_request() (see
>> drivers/usb/host/fhci-hcd=2Ec::of_fhci_probe())=2E
>> To fix it change qe_pin_request() to request GPIOs non-exclusively, and
>> free them once the code determines GPIO controller and offset for each
>> GPIO/pin=2E
>>
>> Also reaching deep into gpiolib implementation is not the best idea=2E =
We
>> should either export gpio_chip_hwgpio() or keep converting to the globa=
l
>> gpio numbers space until we fix the driver to implement proper pin
>> control=2E
>>
>> Fixes: 84582f9ed090 ("soc: fsl: qe: Avoid using gpio_to_desc()")
>> Signed-off-by: Dmitry Torokhov <dmitry=2Etorokhov@gmail=2Ecom>
>
>Wow! Thanks for fixing this!
>
>Reviewed-by: Linus Walleij <linus=2Ewalleij@linaro=2Eorg>
>
>I just sent that patch into the SoC patch tracker (soc@kernel=2Eorg)
>with a not to apply it directly, I suggest you do the same (or ask me
>to sign it off and send it)=2E

I am not really plugged into soc patch/workflow so if you could do that th=
at would be wonderful=2E=20

Thanks!


--=20
Dmitry
