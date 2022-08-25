Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FF375A1079
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Aug 2022 14:30:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MD2Nh3551z3c8V
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Aug 2022 22:30:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=arndb.de (client-ip=217.72.192.73; helo=mout.kundenserver.de; envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.73])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MD2ND31k0z2ypD
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Aug 2022 22:29:47 +1000 (AEST)
Received: from mail-ed1-f41.google.com ([209.85.208.41]) by
 mrelayeu.kundenserver.de (mreue108 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1N9Mh8-1pU9212L6y-015Kfl for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Aug
 2022 14:29:41 +0200
Received: by mail-ed1-f41.google.com with SMTP id w10so13743799edc.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Aug 2022 05:29:40 -0700 (PDT)
X-Gm-Message-State: ACgBeo1U+4ejjGe9kxUE/aEh8HJTBmTv0wzHK/jsGfjotu5hOx7x2H4y
	yhvZAmBwFxzTflRM/dCccUoYltyoJAJgad1+w18=
X-Google-Smtp-Source: AA6agR7KLEkAM4h39WPvK1n/vrpN5oyAY305pogjb5TjxCoIxGhtM1grQtWxFDj0eVYDz8/thf8BgPF1EzfN/sp1J84=
X-Received: by 2002:a05:6402:5241:b0:447:47:5bf1 with SMTP id
 t1-20020a056402524100b0044700475bf1mr3109096edd.227.1661430580695; Thu, 25
 Aug 2022 05:29:40 -0700 (PDT)
MIME-Version: 1.0
References: <MN2PR01MB535838492432C910F2381F929F6F9@MN2PR01MB5358.prod.exchangelabs.com>
In-Reply-To: <MN2PR01MB535838492432C910F2381F929F6F9@MN2PR01MB5358.prod.exchangelabs.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 25 Aug 2022 14:29:21 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3rteX8N2A-K-8bmvWaUhLJjXLV_8JNLCY0ezBzkQODUg@mail.gmail.com>
Message-ID: <CAK8P3a3rteX8N2A-K-8bmvWaUhLJjXLV_8JNLCY0ezBzkQODUg@mail.gmail.com>
Subject: Re: [PATCH] i2c: pasemi: Add IRQ support for Apple Silicon
To: Arminder Singh <arminders208@outlook.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:s+vXCjUVf7lzIb0//m4qzrVuYm4TYO8sU+zDd4s00JCJ/mKFQX/
 X36Q4/vGgAemEYoMAtYuFshvA0dR6Pex1TViOCqXJJcgXrjDLV8RkDYTl63z++2iAEEhBdo
 cPn7oqIyxIG9xuHh75RudFO9q6aBy1PMLuimASWmDYswpg71SRw/Vs9o7ZylkprLWX6aFAC
 tbmolkB6cpIHWgfhJyNGg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:MMD6YSM+Mik=:KVS1dG6tJ1Bbyf2gnADYBw
 vOZ/tMwG73g4QD3DsjQBSk9HhmdQKhjAMQc6sxtKj2qBDZwBr/uvCKg/5W2bHk5GXQ0oOkThp
 L1DZtPV1O1dcjnJahIb3GUtjhLl3J636l/9R+xoVvrf78JT44Q8k9vmqtV3SrISpWm1Oxj3de
 2+RZnHibcClwdt59HpIeT95IXO26BYoywTolzm8Tm2qdTeURFwMvy0lXBO7HfuxkSNoKy+6OS
 puKbftcwVP9iAJ0bgdSQr46NIflE8/lpXYFEAenqjkUR6ygQnvUmmqf6T7JfDCP28SMono+RS
 j8pmwWXFunSgjp0O3yPxT/XGSHVli0NAYZy7TjCN5CokROImdjER8RMfuT0LNPslrMMSdQDy0
 Do2Ee5EXPpYVGR9W2dyXKmi5sOCyhd1leJEaBMKijHXIe59a/QKKPjYYQ+WZUUgsYS7NXrVPO
 4jYCGuvOEMsX7/wnZpSGB5w3cx+WhqLCIRJt8/4jCrKgvugXwkwM8Lt/oDs3VDN7mYmEL7c47
 ZERO2weZaEOMrM8Rt0H5e02M0Ph9AQ4tMdb41I/GfL+rWg1Yig36CSHWyD7Uxih3s0/C7/VSg
 32UO7SjxKjgYT1pwujdklW2G4U+HSySMQWIkFEE2H+lz+8EtUo98O0ZdSJ77CG1oumluu/GSJ
 GUm0Uh86XXR44gLLkyqYIxzn2okcbe/PNxrqgBm+oY5ARuSQ+SlEuH+pyJoecnerIwoGMD82g
 YwnnIeQ2H9lHk5BtzkZqNDuVFtSDEzV814PY7A==
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
Cc: Sven Peter <sven@svenpeter.dev>, Hector Martin <marcan@marcan.st>, linux-kernel@vger.kernel.org, Paul Mackerras <paulus@samba.org>, linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, Alyssa Rosenzweig <alyssa@rosenzweig.io>, linux-i2c@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Aug 20, 2022 at 9:45 PM Arminder Singh <arminders208@outlook.com> wrote:
>
> I also fixed a quick checkpatch warning on line 303. "i ++" is now "i++".

In general, anything that is mentioned in the changelog as "also done this"
is worth splitting into a separate patch, or dropping from the patch, to
make reviewing easier.

In this case, I would just not do the trivial change. Alternatively you
can consider doing a larger patch for coding style cleanup on the
patch, as there are possibly other issues as well. Usually it's not worth
changing things unless they hurt readability.

> @@ -80,14 +81,21 @@ static int pasemi_smb_waitready(struct pasemi_smbus *smbus)
>  {
>         int timeout = 10;
>         unsigned int status;
> +       unsigned int bitmask = SMSTA_XEN | SMSTA_MTN;
>
> +       if (smbus->use_irq) {
> +               reinit_completion(&smbus->irq_completion);
> +               reg_write(smbus, REG_IMASK, bitmask);
> +               wait_for_completion_timeout(&smbus->irq_completion, msecs_to_jiffies(10));
>                 status = reg_read(smbus, REG_SMSTA);
>         }
>
> +
>         /* Got NACK? */
>         if (status & SMSTA_MTN)
>                 return -ENXIO;
...
> @@ -356,3 +366,12 @@ int pasemi_i2c_common_probe(struct pasemi_smbus *smbus)
>
>         return 0;
>  }
> +
> +irqreturn_t pasemi_irq_handler(int irq, void *dev_id)
> +{
> +       struct pasemi_smbus *smbus = (struct pasemi_smbus *)dev_id;
> +
> +       reg_write(smbus, REG_IMASK, 0);
> +       complete(&smbus->irq_completion);
> +       return IRQ_HANDLED;
> +}

I think the completion structure gets out of sync if you run into a
timeout here,
so a subsequent wait_for_completion will never complete after we missed one
interrupt.

Since this already causes a bus reset, I think you can just do
reinit_completion() at the end of pasemi_reset() to avoid this.

        Arnd
