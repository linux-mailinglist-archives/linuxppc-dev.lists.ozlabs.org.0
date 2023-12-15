Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F377A814C3B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Dec 2023 17:00:13 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=gEy347kK;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SsDSq57wBz3dSf
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Dec 2023 03:00:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=gEy347kK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2001:4860:4864:20::2d; helo=mail-oa1-x2d.google.com; envelope-from=andy.shevchenko@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oa1-x2d.google.com (mail-oa1-x2d.google.com [IPv6:2001:4860:4864:20::2d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SsDRy47Lzz30XR
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Dec 2023 02:59:24 +1100 (AEDT)
Received: by mail-oa1-x2d.google.com with SMTP id 586e51a60fabf-1f03d9ad89fso544277fac.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Dec 2023 07:59:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702655961; x=1703260761; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MG9yAVm50lR8ICiHnRNf31I38rZ2htO3wSzdsU8ztZ4=;
        b=gEy347kK6eoi5kXjYGRvgBczNqClDDsn7krZ3u1XnZw5gqdWkP+U8KkXzvX7RWNIzp
         +H/6F5xGL7RepGTvlXdvdt6zPzez6OFUU3SSNOJkuiqGDGyes//VAqGN+7xKFlNhAxWx
         nkseFBIKUJCXpognAOnK0ErM8DimvhQuXhV0VdYaMFcI1wX7ek77A1dggjOnpKw9JK1x
         M0q4T9XdCUGgOzIeQU6Xgnsz5qJXuYyEpN8dddPi3Ja+AtcgdJpl0BUdbGrqBokFTdo0
         WBY4YFKJmoi9NIhTInWbrgDCVEdpnmGIlbm1LB5Ky87aK/gRxRhB1NsiT8QKhOO5/N4L
         c2Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702655961; x=1703260761;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MG9yAVm50lR8ICiHnRNf31I38rZ2htO3wSzdsU8ztZ4=;
        b=wByFBfQgJwX/ZfUyEvaaODoCo8gv1rRWD80sn+0P/Z7yoh3m4mHsq8T59QK61+lSX6
         UX5K5aShurOfShj8Nr+xAcqx6MX/hqXfknL1C3KfOHOnCS8UVZ9qamAgECzQMSGYhyeP
         QW4ya5EsLCZkh1ilWJuueD80481XhSnfh0CX9nXfDQtov+IzliMcYAXW1wMe+lmXuPNv
         EwRzzTEWXTDCDdEXSfOy/xoDcrgdxE5n4ZToGZqr5ahspvaMw35PzqGb84YIkclVkIz9
         iMJiYI4hQoMFXbSEgv3k8rDa/Ta+XICpvPa0qU3enz8O+Z3LyDFveEd2kSpVnZ9yUtli
         dKkQ==
X-Gm-Message-State: AOJu0YyqAfXY2Dlor+J15kJsJtrw1fsT3PuXjvc91RBOUQDrnv9ke5jC
	uIfrxDU/YIjUdQLuR5ShAnEoIEkSzriFf3D393Q=
X-Google-Smtp-Source: AGHT+IGLoY1Nw1pfnxSccxTPPQGkI5sLz3dmiL9hVukMxvSLrc6SwWXCmZBocGOvbRO13ErKz7EtuQ8V4zYiAag9VFM=
X-Received: by 2002:a05:6870:9383:b0:1f9:e6cb:7eb5 with SMTP id
 b3-20020a056870938300b001f9e6cb7eb5mr13635905oal.18.1702655961087; Fri, 15
 Dec 2023 07:59:21 -0800 (PST)
MIME-Version: 1.0
References: <20231214173614.2820929-3-gnstark@salutedevices.com> <c16599b23afa853a44d13b906af5683027959a26.1702621174.git.christophe.leroy@csgroup.eu>
In-Reply-To: <c16599b23afa853a44d13b906af5683027959a26.1702621174.git.christophe.leroy@csgroup.eu>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 15 Dec 2023 17:58:44 +0200
Message-ID: <CAHp75VfBcmTBXXtU6o1x0Ea24wG-_Qb46opkS0EXKQ1Ynh0Mcw@mail.gmail.com>
Subject: Re: [PATCH RFC v4-bis] locking: introduce devm_mutex_init
To: Christophe Leroy <christophe.leroy@csgroup.eu>
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
Cc: kernel@salutedevices.com, vadimp@nvidia.com, mazziesaccount@gmail.com, peterz@infradead.org, boqun.feng@gmail.com, lee@kernel.org, linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com, linux-kernel@vger.kernel.org, hdegoede@redhat.com, mingo@redhat.com, pavel@ucw.cz, George Stark <gnstark@salutedevices.com>, longman@redhat.com, nikitos.tr@gmail.com, will@kernel.org, linux-leds@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Dec 15, 2023 at 8:23=E2=80=AFAM Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
>
> From: George Stark <gnstark@salutedevices.com>
>
> Using of devm API leads to a certain order of releasing resources.
> So all dependent resources which are not devm-wrapped should be deleted
> with respect to devm-release order. Mutex is one of such objects that
> often is bound to other resources and has no own devm wrapping.
> Since mutex_destroy() actually does nothing in non-debug builds
> frequently calling mutex_destroy() is just ignored which is safe for now
> but wrong formally and can lead to a problem if mutex_destroy() will be
> extended so introduce devm_mutex_init()

Missing period.

...

>  } while (0)
>  #endif /* CONFIG_PREEMPT_RT */

^^^ (1)

> +struct device;
> +
> +/*
> + * devm_mutex_init() registers a function that calls mutex_destroy()
> + * when the ressource is released.
> + *
> + * When mutex_destroy() is a not, there is no need to register that
> + * function.
> + */
> +#ifdef CONFIG_DEBUG_MUTEXES

Shouldn't this be

#if defined(CONFIG_DEBUG_MUTEXES) && !defined(CONFIG_PREEMPT_RT)

(see (1) as well)?

> +void mutex_destroy(struct mutex *lock);
> +int devm_mutex_init(struct device *dev, struct mutex *lock);
> +#else
> +static inline void mutex_destroy(struct mutex *lock) {}
> +
> +static inline int devm_mutex_init(struct device *dev, struct mutex *lock=
)
> +{
> +       mutex_init(lock);
> +       return 0;
> +}
> +#endif

--=20
With Best Regards,
Andy Shevchenko
