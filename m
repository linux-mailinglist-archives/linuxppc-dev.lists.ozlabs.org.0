Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FB5A3A7343
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Jun 2021 03:22:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G3rBx0F1Dz3095
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Jun 2021 11:22:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=de+jUgWh;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=srs0=3lgx=lj=gmail.com=npiggin@ozlabs.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=de+jUgWh; dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G3rBV6qswz2xYg
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Jun 2021 11:21:38 +1000 (AEST)
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by ozlabs.org (Postfix) with ESMTP id 4G3rBT6qplz9sWF
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Jun 2021 11:21:37 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 4G3rBT6KMmz9sWD; Tue, 15 Jun 2021 11:21:37 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62f;
 helo=mail-pl1-x62f.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=de+jUgWh; dkim-atps=neutral
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 4G3rBT2t65z9sW8;
 Tue, 15 Jun 2021 11:21:36 +1000 (AEST)
Received: by mail-pl1-x62f.google.com with SMTP id x10so7583101plg.3;
 Mon, 14 Jun 2021 18:21:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:references:in-reply-to:mime-version:message-id
 :content-transfer-encoding;
 bh=oS1vYZy5EqBFOLFH6kjbDRjgMKJlHR7t8mhk3lljdBk=;
 b=de+jUgWhoZQEoRq+mbn6wZ2Dcmi5usHsNIGwQc/PSv5QSTonlev1ISiHYA4hTYbKza
 wPYPEzbN40NloKv1NofOoCcxjCgepzm9USGZg8kWkkHZ157AwdhP27R1yj5tsElWsTLB
 mdQYU9jGQDx5EOSJupQF/FyQlqJAxfeWe5fMi6jRMwuK8ReE1/UEa2kfKawvgFetWwUe
 uWi94pVR2o/+HpAT8fEaNTAslcNkk4/rTyOTje7S2r0zSmJwc/FPs5OH/3ZvgIZBKeGi
 poufCDxk0DwxxdPvru0QeR7fKW+jMeWoNLUViA3BkHvFf48vLrXKkkOjvdEUhUV4/FLi
 756A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=oS1vYZy5EqBFOLFH6kjbDRjgMKJlHR7t8mhk3lljdBk=;
 b=DgB46bVGj7ENWDCxj318yi1C7g+U9rSt1+O6B4uVBtFJuG5fsZH6w+bEcOzbWK5wJ7
 cpI5RcgenNMsHltWKmRXNTIzbctNuxiZVpewLP4QFtzfOde5S6QJcB+kN6wETYavgwzY
 kaWxRs3k4l3rbej/El0hknd/ECUjq8fv3fJFZBiW5BOZlKA80AFZp2YK0Eu2Mbg055Hj
 42YDZrqha7JOTssOCJKvKoF9CiS46KfeHM4JnexJ28e63TUtTc0F1eGIEIjjVfZa/l32
 nkg/t1Cc5X+749y+S9iPvK0x2oYDF3SJJPReBknAAEX/0vpXa+65Sq61HoAtdQ6p5f7e
 m8Kw==
X-Gm-Message-State: AOAM530VnXJw1L4A/P90tas411UJU0jB4Y1sCO5YhsawPvunOjHQuDcG
 joV/88QTMLEpv9sfNXspJ2QUKMuZnqk=
X-Google-Smtp-Source: ABdhPJxTHc/qEMxS+adilFtc+kS2C7DBNZ2tVo6hWM6+moB3004XigW5V5ngzDkop6FK6SZ2YeSUXg==
X-Received: by 2002:a17:902:c3d5:b029:100:742f:fce9 with SMTP id
 j21-20020a170902c3d5b0290100742ffce9mr1560476plj.46.1623720093133; 
 Mon, 14 Jun 2021 18:21:33 -0700 (PDT)
Received: from localhost (60-242-147-73.tpgi.com.au. [60.242.147.73])
 by smtp.gmail.com with ESMTPSA id z3sm6926224pfb.127.2021.06.14.18.21.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jun 2021 18:21:32 -0700 (PDT)
Date: Tue, 15 Jun 2021 11:21:27 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 11/11] powerpc/microwatt: Disable interrupts in boot
 wrapper main program
To: linuxppc-dev@ozlabs.org, Paul Mackerras <paulus@ozlabs.org>
References: <YMfeswgEHeXSLOUF@thinks.paulus.ozlabs.org>
 <YMfgt4ndMrtYwWYY@thinks.paulus.ozlabs.org>
In-Reply-To: <YMfgt4ndMrtYwWYY@thinks.paulus.ozlabs.org>
MIME-Version: 1.0
Message-Id: <1623719958.7rk8136sap.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Paul Mackerras's message of June 15, 2021 9:05 am:
> This ensures that we don't get a decrementer interrupt arriving before
> we have set up a handler for it.

Would this be better off merged in the previous patch (maybe with=20
comment)? Why don't other platform_init()s seem to require this?

Thanks,
Nick

>=20
> Signed-off-by: Paul Mackerras <paulus@ozlabs.org>
> ---
>  arch/powerpc/boot/microwatt.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/arch/powerpc/boot/microwatt.c b/arch/powerpc/boot/microwatt.=
c
> index ac922dd0aa4d..86a07bceaadf 100644
> --- a/arch/powerpc/boot/microwatt.c
> +++ b/arch/powerpc/boot/microwatt.c
> @@ -12,6 +12,7 @@ void platform_init(unsigned long r3, unsigned long r4, =
unsigned long r5)
>  {
>  	unsigned long heapsize =3D 16*1024*1024 - (unsigned long)_end;
> =20
> +	__asm__ volatile("mtmsrd %0,1" : : "r" (0));
>  	simple_alloc_init(_end, heapsize, 32, 64);
>  	fdt_init(_dtb_start);
>  	serial_console_init();
> --=20
> 2.31.1
>=20
>=20
