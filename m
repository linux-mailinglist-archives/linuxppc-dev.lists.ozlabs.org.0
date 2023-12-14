Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9223D8131ED
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Dec 2023 14:43:47 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=U7PAmcw1;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SrYTs23vgz3cWy
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Dec 2023 00:43:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=U7PAmcw1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::836; helo=mail-qt1-x836.google.com; envelope-from=andy.shevchenko@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com [IPv6:2607:f8b0:4864:20::836])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SrYT36dpjz2yDM
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Dec 2023 00:43:02 +1100 (AEDT)
Received: by mail-qt1-x836.google.com with SMTP id d75a77b69052e-425fbac8fc7so6769631cf.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Dec 2023 05:43:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702561379; x=1703166179; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4F5f95LcvN3I9tb1o2cf6Anqpz0ggkd9L4sVElAB9xQ=;
        b=U7PAmcw1QHlSOPP6ONNsGJCIvW0PF2Cq1GVzg/da4pniMnd8uagP0yfk+bzg4kPVOo
         RbO/eOwSNmOr04kq94d1UmmAU8ohDwcT/FYZr9zEMyqksZ7Di+Jc+tVHH44BE8E7FcKa
         IsL+oDU1tq5foY+7XXJL60pkGJWdFI/giLGr19k8LvW110kV+g3tprH0KP1m9+UXCFta
         7L2bDmDzHm2Mwlts60SD6wurJ3UHfSb/jISJgo1eA5wP0Ypm8E5z+KkvqNeuWF+tvmlA
         iLG/Jxmf6Pq4oxCuMHJ4SczJDmDj+E4+gUf72Hl4Oc2BdVaZIwiFNaJ6BzZColxfTU+Z
         NvqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702561379; x=1703166179;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4F5f95LcvN3I9tb1o2cf6Anqpz0ggkd9L4sVElAB9xQ=;
        b=V67XPC+XgKCzR8W+mJws8Hz3nYw67bBoIf7KQ8TXlx1QmPHNGKtl6qZONSDOQbcztz
         w6YPY6Ykk5FLbnsUBLpr1rhuO4N0JQL46vH6pej5tHQVLCVmDWdvq6yfWCmY1R4y9XXx
         xKlYVWUZSpwjCwJikqQ4U7VihzfUO5AYOW6qtZTTAalExeXbC8zVNLDNYh1VIcNoI7fQ
         A0nkwd+OuHSN5DPsURRJ0umu+ShqL1k/N48ZQd2W+Sn3Ml9qS84gCAsAU8jpKR9kdD5W
         551arlOvcgo8hLycn3MvZgW4yDAdtPyTUWSLM5njYVsmkXQGSFcrcn36axIgZXjejBrY
         YCFw==
X-Gm-Message-State: AOJu0Yx6Vc+eLzOJr+FLyStENh2QzoCrVKaOE9ENZOlC+rd85N0lrF13
	vWug7sSpFpXCWXzutlzBVBxVcm4ktFXKmee9I9E=
X-Google-Smtp-Source: AGHT+IG00DW8WGswWCLm8yY3QQCwaCYiYaSFZPez3AXd/Nc0ny4e8JjzlOJQZ461VPjmiEA7j5c6AF2J23iRG5qr0YA=
X-Received: by 2002:a05:622a:148f:b0:425:4043:1897 with SMTP id
 t15-20020a05622a148f00b0042540431897mr13407370qtx.74.1702561378940; Thu, 14
 Dec 2023 05:42:58 -0800 (PST)
MIME-Version: 1.0
References: <20231213223020.2713164-1-gnstark@salutedevices.com>
 <20231213223020.2713164-4-gnstark@salutedevices.com> <80881d5d-3ae9-4580-84c1-f25b421cc518@csgroup.eu>
 <99882775-af52-49ea-b17d-f3d1f23f8bbe@salutedevices.com> <717727a1-6a99-43ff-b032-b7a20542cca8@csgroup.eu>
In-Reply-To: <717727a1-6a99-43ff-b032-b7a20542cca8@csgroup.eu>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 14 Dec 2023 15:42:22 +0200
Message-ID: <CAHp75VdLT9cOuKn-d14Dp5Ve2NBXAdHQZWeXTLLjYxCQZZQtEw@mail.gmail.com>
Subject: Re: [PATCH v3 03/11] devm-helpers: introduce devm_mutex_init
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "vadimp@nvidia.com" <vadimp@nvidia.com>, "mazziesaccount@gmail.com" <mazziesaccount@gmail.com>, "peterz@infradead.org" <peterz@infradead.org>, "boqun.feng@gmail.com" <boqun.feng@gmail.com>, "lee@kernel.org" <lee@kernel.org>, "kernel@salutedevices.com" <kernel@salutedevices.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "npiggin@gmail.com" <npiggin@gmail.com>, "hdegoede@redhat.com" <hdegoede@redhat.com>, "mingo@redhat.com" <mingo@redhat.com>, "pavel@ucw.cz" <pavel@ucw.cz>, George Stark <gnstark@salutedevices.com>, "longman@redhat.com" <longman@redhat.com>, "nikitos.tr@gmail.com" <nikitos.tr@gmail.com>, "will@kernel.org" <will@kernel.org>, "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Dec 14, 2023 at 3:00=E2=80=AFPM Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
> Le 14/12/2023 =C3=A0 13:48, George Stark a =C3=A9crit :
> > [Vous ne recevez pas souvent de courriers de gnstark@salutedevices.com.
> > D=C3=A9couvrez pourquoi ceci est important =C3=A0
> > https://aka.ms/LearnAboutSenderIdentification ]
> > On 12/14/23 13:06, Christophe Leroy wrote:

...

> >> So you abandonned the idea of using mutex.h ?
> >
> > I'm not the one who make a choice here. The patch [1] you're talking
> > about was seen by everyone but it seems like no one had shown interest.
> > For me personally approach with #define mutex_destroy is not very usual
> > but if even slight mixing device with mutex.h is unacceptable what else
> > can we do? Avoiding the need to allocate devm slot for empty
> > mutex_destroy is more important.
> >
>
> Why would a forward declaration of struct device in mutex.h be
> unacceptable when it is done in so many headers ?
>
> $ git grep "struct device;" include/ | wc -l
> 164

I believe the main misunderstanding here is where to put the
implementation. AFAIU Christophe wants the implementation to be in the
very same _C_-file where mutex_destroy() is defined. mutex.h in this
case indeed requires the only forward declaration and hence doesn't
need to include device.h.

--=20
With Best Regards,
Andy Shevchenko
