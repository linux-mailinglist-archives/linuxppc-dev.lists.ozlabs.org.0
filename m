Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 59D24803C83
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Dec 2023 19:13:28 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=j52nTtV7;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SkWxd5wKyz3vlJ
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Dec 2023 05:13:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=j52nTtV7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2001:4860:4864:20::36; helo=mail-oa1-x36.google.com; envelope-from=andy.shevchenko@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oa1-x36.google.com (mail-oa1-x36.google.com [IPv6:2001:4860:4864:20::36])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SkWwq0bMBz3vhb
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Dec 2023 05:12:42 +1100 (AEDT)
Received: by mail-oa1-x36.google.com with SMTP id 586e51a60fabf-1fafe41bfb0so1909489fac.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 04 Dec 2023 10:12:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701713552; x=1702318352; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Be0ZogmXWjyNCUnYEc6/k4S4gqJjfHZoxi6an2eBP4w=;
        b=j52nTtV75ZilJPOKE9dkzyy6oKcZmBHtbR6vbihmMyQ7ITzrdPPl54JfXGmgwQ2bKc
         CQS8XezhpXn8L16XtOmrj78aRGYyQ0PfsfbqAAK/9A6EL1+p6R2iU+d53bF1OCEEJoQQ
         eBbS1D9vGrLLeNEpO2wEZGuGnrFqI0JJpQZ8WtENIqVd1IcRfz1Uosa8yfpHfBusDHRF
         CyKxLKip02KlP/z7OsvLFSvEeP9K2R8DF6tDRq6QfbWloRyFxfwvavBynKCE1+GJH6t+
         SkLs+IcB/b8yQFcKDttUSdR0yhzQNPu3lMnhove7x3kmrUQRtJv2hSBVfBbjc/Vxc8K8
         FTIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701713552; x=1702318352;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Be0ZogmXWjyNCUnYEc6/k4S4gqJjfHZoxi6an2eBP4w=;
        b=epb5YCUbiI5bWgWojjPolRUel3CUqQhI5CpCWPSy6+2STevCHfCaJpv9lxu/v6zqn0
         txaLCoNbxe88VZG121igzueEzjg3yhkxhWMXgYepU/15gjQbjJtddO1r0WYL0TMDHnQ1
         9F6ARx5UF73r6HC9AoZKLBAfihKl4MABlya+1ODjfFCSv7WS6z6PlO93SO6ECojlNmVf
         OhXXNyBkqoM7jAtGfSf+rkcPljGuxjaZpVKNfuT5//sHyMn4Efa4Qsskarr3llQU9wAY
         A515/gLosv7NGk5Us6y4ZhPwlVS97rfngaqs7d0ARULjKnQjIYS0a3tKiBGQdew8SDAy
         kmUQ==
X-Gm-Message-State: AOJu0Yy5U/0fLPZ8VnMeFjWCm25IxRAmzUAeo7JmubwvNFpRSefMfV0N
	aSh5sODYLow70Rtl+GBKB1p0mK+QlKf3RRNpTmc=
X-Google-Smtp-Source: AGHT+IEo/v04uit+NqPsJPFvQ4QJ4Byz54ZYjIz0w4BaTkdkZSk1wERugeLXeDpdfXBLqggfENkj6AbOID8cLEtkKyw=
X-Received: by 2002:a05:6870:d207:b0:1fa:dae2:8406 with SMTP id
 g7-20020a056870d20700b001fadae28406mr4513257oac.0.1701713552007; Mon, 04 Dec
 2023 10:12:32 -0800 (PST)
MIME-Version: 1.0
References: <20231204180603.470421-1-gnstark@salutedevices.com> <20231204180603.470421-2-gnstark@salutedevices.com>
In-Reply-To: <20231204180603.470421-2-gnstark@salutedevices.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 4 Dec 2023 20:11:55 +0200
Message-ID: <CAHp75Vc=GAnzwhWQTifLzw8OA7Lb35hrJCDxK-RkgZnX8JmfOg@mail.gmail.com>
Subject: Re: [PATCH v2 01/10] devm-helpers: introduce devm_mutex_init
To: George Stark <gnstark@salutedevices.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: linuxppc-dev@lists.ozlabs.org, vadimp@nvidia.com, mazziesaccount@gmail.com, kernel@salutedevices.com, lee@kernel.org, linux-kernel@vger.kernel.org, npiggin@gmail.com, hdegoede@redhat.com, pavel@ucw.cz, linux-leds@vger.kernel.org, jic23@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Dec 4, 2023 at 8:07=E2=80=AFPM George Stark <gnstark@salutedevices.=
com> wrote:
>
> Using of devm API leads to certain order of releasing resources.
> So all dependent resources which are not devm-wrapped should be deleted
> with respect to devm-release order. Mutex is one of such objects that
> often is bound to other resources and has no own devm wrapping.
> Since mutex_destroy() actually does nothing in non-debug builds
> frequently calling mutex_destroy() is just ignored which is safe for now
> but wrong formally and can lead to a problem if mutex_destroy() is
> extended so introduce devm_mutex_init().

...

Do you need to include mutex.h?

...

> +/**
> + * devm_mutex_init - Resource-managed mutex initialization
> + * @dev:       Device which lifetime work is bound to
> + * @lock:      Pointer to a mutex
> + *
> + * Initialize mutex which is automatically destroyed when driver is deta=
ched.

the driver

Have you run scripts/kernel-doc -v -Wall -none ... against this file?
I'm pretty sure it will complain.

> + */


--=20
With Best Regards,
Andy Shevchenko
