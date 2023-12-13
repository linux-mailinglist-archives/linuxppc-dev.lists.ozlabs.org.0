Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 93C6E812195
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Dec 2023 23:38:03 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=O7y+OY3m;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sr9Nn1lfkz3dTG
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Dec 2023 09:38:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=O7y+OY3m;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f2b; helo=mail-qv1-xf2b.google.com; envelope-from=andy.shevchenko@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-qv1-xf2b.google.com (mail-qv1-xf2b.google.com [IPv6:2607:f8b0:4864:20::f2b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sr9Mr0WZlz30MD
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Dec 2023 09:37:11 +1100 (AEDT)
Received: by mail-qv1-xf2b.google.com with SMTP id 6a1803df08f44-67eff5fcfe5so4649016d6.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Dec 2023 14:37:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702507028; x=1703111828; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YhslwT3u/DM8BEIb5CNvkmOQPz2c8s+oUi5ecuMmZqY=;
        b=O7y+OY3mpxRFE8/XUSvumRQZkVjxyP422lh2JcLg6PYOapFJbUPwhGA6ysAjy4Klx1
         0MbYkUaR2hSBCYiKTI8A4QaZbgaECDOp1SiEPOy7xBFV/3x3ncAtq2J7rAzGFYUYfYkl
         apC5bTTk0iHHVd9EhSF/vczfiwa2AfIwDwPjopm6HpLTN3QqNRU0n3q3VvluJYIeVTUL
         azuFR9DfPxwWw84ImmoZ4YmSwhBUI+fcJFKZatfQkpuxRF87B31Y+T9xg3D9nEiFZNA5
         kiznod+FF6Hmo2fYD+TarXhsELgV58K1IeJgtW89V21E92yg67+oVqjgCBhVuXaNp5CW
         9jZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702507028; x=1703111828;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YhslwT3u/DM8BEIb5CNvkmOQPz2c8s+oUi5ecuMmZqY=;
        b=LsEQpNzGJ2rNY4ky3Rp9QDPhcz2XztZ7Vl7fkuQC/uXzQOBxev//MREVs4nQrZjS/b
         SEai5BGQkkE6cfhmyM1NSqVn29JilJY0kvIXbFyH3LLBVhT+rLrNwRWdQdZUe8wqfJrN
         CN//NCZUf3DX7OjBuq8j45b5fYYp+yoDYGq/zg8lemPup2w5ExfOwMWhqJc2F38YQqvU
         c/fNrgirUSJI+LJNgrvKC9stKB11/ib3PE1Sa4N9qcy6R9Y6jblCdwfX4UsZJWnj5On2
         0mFRIqRzH4TJuwiIm963fAZ820ZK3K3Np8leO8AHs/KbM39nFwG5uplN7fjHcOQsB6O8
         vt/A==
X-Gm-Message-State: AOJu0Yx7Z3Xa6i81xyS8jPNFEDe8x1xkCtpSxET+lLf6Rh5gcy19BJBE
	xrxLWNxFMNM46QF1e4aJ94GTrBrKrpNfkzJpsXo=
X-Google-Smtp-Source: AGHT+IE/pf8cFq4+dbNNQjWRVssYU1BLZNUl2mjooowkoBVqDRSq1PjFThd80lRcIrnMdTuMrs0MuDyWQH3O1ow44WU=
X-Received: by 2002:a0c:c48b:0:b0:67a:a721:82f1 with SMTP id
 u11-20020a0cc48b000000b0067aa72182f1mr8302603qvi.75.1702507027837; Wed, 13
 Dec 2023 14:37:07 -0800 (PST)
MIME-Version: 1.0
References: <20231213223020.2713164-1-gnstark@salutedevices.com> <20231213223020.2713164-4-gnstark@salutedevices.com>
In-Reply-To: <20231213223020.2713164-4-gnstark@salutedevices.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 14 Dec 2023 00:36:31 +0200
Message-ID: <CAHp75Vc1zZFWB8PPrg8oeAKz9aHnQrrSjdGyGd8mWcmeZdJ9qA@mail.gmail.com>
Subject: Re: [PATCH v3 03/11] devm-helpers: introduce devm_mutex_init
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
Cc: linuxppc-dev@lists.ozlabs.org, vadimp@nvidia.com, mazziesaccount@gmail.com, peterz@infradead.org, boqun.feng@gmail.com, lee@kernel.org, kernel@salutedevices.com, linux-kernel@vger.kernel.org, npiggin@gmail.com, hdegoede@redhat.com, mingo@redhat.com, pavel@ucw.cz, longman@redhat.com, nikitos.tr@gmail.com, will@kernel.org, linux-leds@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Dec 14, 2023 at 12:30=E2=80=AFAM George Stark <gnstark@salutedevice=
s.com> wrote:
>
> Using of devm API leads to a certain order of releasing resources.
> So all dependent resources which are not devm-wrapped should be deleted
> with respect to devm-release order. Mutex is one of such objects that
> often is bound to other resources and has no own devm wrapper.
> Since mutex_destroy() actually does nothing in non-debug builds
> frequently calling mutex_destroy() is just ignored which is safe for now
> but wrong formally and can lead to a problem if mutex_destroy() is
> extended so introduce devm_mutex_init().

...

> +#ifdef mutex_destroy
> +static inline void devm_mutex_release(void *res)
> +{
> +       mutex_destroy(res);
> +}
> +#endif
> +
> +/**
> + * devm_mutex_init - Resource-managed mutex initialization
> + * @dev:       Device which lifetime mutex is bound to
> + * @lock:      Pointer to a mutex
> + *
> + * Initialize mutex which is automatically destroyed when the driver is =
detached.
> + *
> + * Returns: 0 on success or a negative error code on failure.
> + */
> +static inline int devm_mutex_init(struct device *dev, struct mutex *lock=
)
> +{
> +       mutex_init(lock);
> +#ifdef mutex_destroy
> +       return devm_add_action_or_reset(dev, devm_mutex_release, lock);
> +#else
> +       return 0;
> +#endif
> +}

If this is going to be accepted, you may decrease the amount of ifdeffery.

#ifdef ...
#else
#define devm_mutex_init(dev, lock)  mutex_init(lock)
#endif


--=20
With Best Regards,
Andy Shevchenko
