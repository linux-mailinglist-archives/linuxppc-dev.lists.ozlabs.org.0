Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B5F67E9957
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Nov 2023 10:47:23 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=iiXLE8Ur;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4STPjP33bKz3cZ5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Nov 2023 20:47:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=iiXLE8Ur;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::430; helo=mail-pf1-x430.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4STPgY1pb0z3cHP
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Nov 2023 20:45:44 +1100 (AEDT)
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-6c32a20d5dbso3585053b3a.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Nov 2023 01:45:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699868741; x=1700473541; darn=lists.ozlabs.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jzM7qsd4kxlzFFVzlxkQP7hy5Byv9YvRdWtaoTYAspI=;
        b=iiXLE8UrW1ajL9DNAHox9Ltp1ha/sCoyc81U5m21DECgG2vdjLJ30yzsG4ckbcX5MM
         wg7RLgRE/dPIDPl27vSzz7YIvGFvVj2tpAT/grdgBX8Efz2kWCK/XFxxKvO7IigTSTKr
         nzLj6CFabAU8JbtfXJLPcNirAhigOeJsPer2L7fbTbCd26XP/d2h4HyEvVOq64HC/LZJ
         zNX1BEsuBERTS0YRZDy6cVgWjNudaBNxDG5x4w1SR6b3cE3QFYvdqmASLQi6rw4R8TG3
         IStG9hlESUtY26UZmWm7tCHpzJE7EDrueF1Uz9uhNXHus5zTE67hUBWMKd3XxSfMJ0qF
         ZVzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699868741; x=1700473541;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jzM7qsd4kxlzFFVzlxkQP7hy5Byv9YvRdWtaoTYAspI=;
        b=BNBjaumOZPSVR4C5IQ0K0g+FbPEcb8h0MNQEBapNdJJzZwYkzuK50/7k6KoV5Qd7kF
         I8G+IUYNAoqQH2Zxw1eg3loLU9NPOcDz2lwWSKv/lrxf9QcbrNlBcOI06LZzrfjwqwD1
         ZisWp17QqzMt0gKE14cVDdLpOYl0FLGkFAk+PFg5q+5rtad0ETAEoTtTakutcnEqSYQx
         nqe/zWC/rRH8Kg+nyesOU/njOxsCqwlRXylhkxieN9wbfa2RhIapUkarw8wSpN+P013g
         CzVRJFMPUWJGSmN1Gbjc/5sucZQQor5oMm9G42M371CAh3gkBKL6r25aOYLl9b6IkcAB
         +7vg==
X-Gm-Message-State: AOJu0Ywl1E+PjbjeUiRFQ14F6KEWFPq2nZeijKRUJeqWHBeIIHkJBH/V
	iqJ0tn03ebqFwxif95E6scM=
X-Google-Smtp-Source: AGHT+IG1wFy1xio7JaUU6hUVa0c8LjvOmg/Y99hOi073oUDxSBl7T1/PO8Vs1QrJeMUJvyIqt9Tocg==
X-Received: by 2002:a62:ab0c:0:b0:68e:3772:4e40 with SMTP id p12-20020a62ab0c000000b0068e37724e40mr3655156pff.3.1699868741168;
        Mon, 13 Nov 2023 01:45:41 -0800 (PST)
Received: from localhost (121-44-82-40.tpgi.com.au. [121.44.82.40])
        by smtp.gmail.com with ESMTPSA id it13-20020a056a00458d00b006b58af8aae3sm3544447pfb.77.2023.11.13.01.45.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Nov 2023 01:45:40 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 13 Nov 2023 19:45:34 +1000
Message-Id: <CWXL6C3YNTI6.2OBLBYUWUQG3W@wheely>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 "Michael Ellerman" <mpe@ellerman.id.au>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Jiri Slaby" <jirislaby@kernel.org>
Subject: Re: [PATCH 2/2] tty: hvc: hvc_opal: Convert to platform remove
 callback returning void
From: "Nicholas Piggin" <npiggin@gmail.com>
X-Mailer: aerc 0.15.2
References: <20231105214406.3765906-4-u.kleine-koenig@pengutronix.de>
 <20231105214406.3765906-6-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20231105214406.3765906-6-u.kleine-koenig@pengutronix.de>
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
Cc: linuxppc-dev@lists.ozlabs.org, kernel@pengutronix.de, linux-serial@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon Nov 6, 2023 at 7:44 AM AEST, Uwe Kleine-K=C3=B6nig wrote:
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is ignored (apart
> from emitting a warning) and this typically results in resource leaks.
>
> To improve here there is a quest to make the remove callback return
> void. In the first step of this quest all drivers are converted to
> .remove_new(), which already returns void. Eventually after all drivers
> are converted, .remove_new() will be renamed to .remove().
>
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.

Reviewed-by: Nicholas Piggin <npiggin@gmail.com>

>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> ---
>  drivers/tty/hvc/hvc_opal.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/tty/hvc/hvc_opal.c b/drivers/tty/hvc/hvc_opal.c
> index 8995b253cf90..2cdf66e395cc 100644
> --- a/drivers/tty/hvc/hvc_opal.c
> +++ b/drivers/tty/hvc/hvc_opal.c
> @@ -232,7 +232,7 @@ static int hvc_opal_probe(struct platform_device *dev=
)
>  	return 0;
>  }
> =20
> -static int hvc_opal_remove(struct platform_device *dev)
> +static void hvc_opal_remove(struct platform_device *dev)
>  {
>  	struct hvc_struct *hp =3D dev_get_drvdata(&dev->dev);
>  	int termno;
> @@ -242,13 +242,11 @@ static int hvc_opal_remove(struct platform_device *=
dev)
>  	if (hvc_opal_privs[termno] !=3D &hvc_opal_boot_priv)
>  		kfree(hvc_opal_privs[termno]);
>  	hvc_opal_privs[termno] =3D NULL;
> -
> -	return 0;
>  }
> =20
>  static struct platform_driver hvc_opal_driver =3D {
>  	.probe		=3D hvc_opal_probe,
> -	.remove		=3D hvc_opal_remove,
> +	.remove_new	=3D hvc_opal_remove,
>  	.driver		=3D {
>  		.name	=3D hvc_opal_name,
>  		.of_match_table	=3D hvc_opal_match,

