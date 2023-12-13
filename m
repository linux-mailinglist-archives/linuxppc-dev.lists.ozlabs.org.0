Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2767781219C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Dec 2023 23:39:41 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=SzFl8qAy;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sr9Qf5r08z3dRj
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Dec 2023 09:39:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=SzFl8qAy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::a30; helo=mail-vk1-xa30.google.com; envelope-from=andy.shevchenko@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-vk1-xa30.google.com (mail-vk1-xa30.google.com [IPv6:2607:f8b0:4864:20::a30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sr9Pn3Jt7z307y
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Dec 2023 09:38:53 +1100 (AEDT)
Received: by mail-vk1-xa30.google.com with SMTP id 71dfb90a1353d-4b314f78326so2034738e0c.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Dec 2023 14:38:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702507129; x=1703111929; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HLWuIS891/i8mk8Po2VW+0HfMFW0IVIkJ746lLbBUXQ=;
        b=SzFl8qAyPgkbbWWWPweutajNggmSZUxP83RmE0CXLPeVAhj/UUbpiKBNuOpVjO1Cvz
         io92ouPrdUQ7aTuM3QCMown908MbJYyVJ41yc2XBuLTq+rr7PAa+OqEcbQFV0pcjiP8O
         qGFybGhnCZA72JPuQovs1RPmL4pZ6uuM84wdJrq15ZwedzVkQDm+AffVrEpgLt6iVeZo
         W36Jyn7l5vDOpCv2X4kcG5H3dtUoM44zwmtUi2NAAW6gDGSnSjW6bU2VVoAc28KIw19n
         MQ3LY7y2BJmwvu1+PbBctfzt/LGZ84CsFHxcG+MShb+26qDzxEsBqe+UdaR6BVUeCF+L
         Ew5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702507129; x=1703111929;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HLWuIS891/i8mk8Po2VW+0HfMFW0IVIkJ746lLbBUXQ=;
        b=ltC/fXnnxyC3MFuVJN3qU8xq0FYPUhPgGBtyybyTE2FJ8PZbgUI3or94bQGT8kCZc2
         8n8uQ08dxbjejGCQE7BIMaOmsTH+OFVdE9pUCxA0h4WOsdSkdxvC2qaSRaJ9Bl23fRg2
         wl989LxRt3OwrUg3/rmTXlC88zgLMIi7tupwuIHeS54GwPzp7feNB2Li7rjo2+kd6hGY
         smj/123hm83PlY8/wLndD9Ib7JI+BfysiR16eXotIMfgCnfsWWvXoaWZ3FDtxDv7PvBz
         hMKC7nTf9oLYQrse4+UobT5T6Ruz/y7Ip/EE6lhiXnKGJ8mfzuOuc5YxMOjiiTcMrnWb
         ah5g==
X-Gm-Message-State: AOJu0Yxpk7PAAyOnVP66TWcKxSbKmEzdUdltKXUM7Yzjf6IUv3cR1OAN
	PFwI85+ylZ1iuUzWcBtO5FYOXkgkD851HdP2YTA=
X-Google-Smtp-Source: AGHT+IEA72sJCg1tWb886mfGiZY/WmWBDak7hL7FWZISYncmdSFQJTEsSf1eyijU0ANVEDLcJi29rH8j1muZd8fNPec=
X-Received: by 2002:a05:6122:1699:b0:4ac:1423:1be9 with SMTP id
 25-20020a056122169900b004ac14231be9mr8733380vkl.13.1702507129585; Wed, 13 Dec
 2023 14:38:49 -0800 (PST)
MIME-Version: 1.0
References: <20231213223020.2713164-1-gnstark@salutedevices.com>
 <20231213223020.2713164-4-gnstark@salutedevices.com> <CAHp75Vc1zZFWB8PPrg8oeAKz9aHnQrrSjdGyGd8mWcmeZdJ9qA@mail.gmail.com>
In-Reply-To: <CAHp75Vc1zZFWB8PPrg8oeAKz9aHnQrrSjdGyGd8mWcmeZdJ9qA@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 14 Dec 2023 00:38:13 +0200
Message-ID: <CAHp75Vdxa5k-CLhL+PmK0iTPTNSpP77DA6ooWnxfViwSKiEOSw@mail.gmail.com>
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

On Thu, Dec 14, 2023 at 12:36=E2=80=AFAM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Thu, Dec 14, 2023 at 12:30=E2=80=AFAM George Stark <gnstark@salutedevi=
ces.com> wrote:
> >
> > Using of devm API leads to a certain order of releasing resources.
> > So all dependent resources which are not devm-wrapped should be deleted
> > with respect to devm-release order. Mutex is one of such objects that
> > often is bound to other resources and has no own devm wrapper.
> > Since mutex_destroy() actually does nothing in non-debug builds
> > frequently calling mutex_destroy() is just ignored which is safe for no=
w
> > but wrong formally and can lead to a problem if mutex_destroy() is
> > extended so introduce devm_mutex_init().

...

> > +#ifdef mutex_destroy
> > +static inline void devm_mutex_release(void *res)
> > +{
> > +       mutex_destroy(res);
> > +}
> > +#endif
> > +
> > +/**
> > + * devm_mutex_init - Resource-managed mutex initialization
> > + * @dev:       Device which lifetime mutex is bound to
> > + * @lock:      Pointer to a mutex
> > + *
> > + * Initialize mutex which is automatically destroyed when the driver i=
s detached.
> > + *
> > + * Returns: 0 on success or a negative error code on failure.
> > + */
> > +static inline int devm_mutex_init(struct device *dev, struct mutex *lo=
ck)
> > +{
> > +       mutex_init(lock);
> > +#ifdef mutex_destroy
> > +       return devm_add_action_or_reset(dev, devm_mutex_release, lock);
> > +#else
> > +       return 0;
> > +#endif
> > +}
>
> If this is going to be accepted, you may decrease the amount of ifdeffery=
.
>
> #ifdef ...
> #else
> #define devm_mutex_init(dev, lock)  mutex_init(lock)

More precisely ({ mutex_init(lock); 0; }) or as a static inline...

> #endif

--=20
With Best Regards,
Andy Shevchenko
