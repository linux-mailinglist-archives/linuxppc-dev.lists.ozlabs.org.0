Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D45D87902E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Mar 2024 09:59:45 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=XXeEfi1D;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tv6z26rprz3cN6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Mar 2024 19:59:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=XXeEfi1D;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::52b; helo=mail-ed1-x52b.google.com; envelope-from=andy.shevchenko@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tv6yF5lKrz3cGK
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Mar 2024 19:59:00 +1100 (AEDT)
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-56840d872aeso3608221a12.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Mar 2024 01:58:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710233934; x=1710838734; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=evzEvBJepbXE0zhqomdwTyF3Gg2aETOcoMQgudr1UBY=;
        b=XXeEfi1DMa22XDoSyAp1KA9BRkpyEBfalAtfRtwVu4FMSgj/crVIGpNw0dXBiQeAaf
         fPIsyOhrh/5+Wa/jliNwf3LR/8u8E4QwWNjnqSeyQ+br5bYc816pZN9XV3SX8y5+dKMd
         2iT2n/6KT0nv8y3fRqmKDnS5UGg1/bN8NAcopJmU5L2YWl86vVHDVkmP2QrVGxLJJLtG
         YiNTrd0ImEiAbuNTaQF4ysdFsmhH4JgHTfcvFueG4D+7lF2XGqL5dVRDqSgwbVAgJ+dy
         hC3Buw77AeTSGaqgI4YKPO+RmqgsCWuOqp2/cMK0xw3DZctx1c9jhBVvyIRtFyfeLOXM
         +5AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710233934; x=1710838734;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=evzEvBJepbXE0zhqomdwTyF3Gg2aETOcoMQgudr1UBY=;
        b=BDpW1NptNps89jyR5XkDYr3GD+ZxVuodquhCTBTWNU+5HqgiijO0ln1bkw8i8HPk0f
         7cdsr8C6PRSoxozfBKJATvYL7bd5m3EoYhp+5MNiCySoEBDiEd8CYxwnArh3OTKrwYBG
         6UEtPn+hjNmj0eCyCK/cb+rXMC8UQrPTAZmOKuKCwURvL/8d36xkoTBtBYS+i3JBuZUf
         WtXE9+tNVHvwK67sjhprOduYMp8QQstwxoaITMnet764inExf09Ww0oy13m1wQCGJBiY
         slhWYw6Y8WQ1zI+vYisRZ7Xyv+nsUARv4Efq6J00K7MIFPPGRvBhIjcJIx8vgbJywdAw
         CyvA==
X-Forwarded-Encrypted: i=1; AJvYcCXWIrfGWo93cjXe4Y3posydKyEhJlSRz6gafqTl8fNBJrndF13GH5ctOT0QljKejnJPt+PtuYopKetzIx+zWzrUk7SAgD9+i/5vp5AptA==
X-Gm-Message-State: AOJu0YyC5g0zyygsCNAetunoV7nvUeG3Oe4wHlSUcoWw8BhqWByXDz2+
	34TOv3mSUAMzHdLQGlLs33KFFat1LydKVHNT/X8R6kJ6HR1LGnszabiMBJdjUWdwqpr1+A9czsJ
	x34ik4FdX7vRwhs+g2MVOmBorksM=
X-Google-Smtp-Source: AGHT+IF9JvJrb2/FplmixKFLcqdSBjT9Yznq++16jQFKdM0wr5aJDcwS8Gg5cNV8XDSYVFmVcsh9iBFWdXJxB+WlOIw=
X-Received: by 2002:a17:906:d10d:b0:a3f:ce8:1234 with SMTP id
 b13-20020a170906d10d00b00a3f0ce81234mr5101278ejz.68.1710233933409; Tue, 12
 Mar 2024 01:58:53 -0700 (PDT)
MIME-Version: 1.0
References: <20240307024034.1548605-1-gnstark@salutedevices.com>
 <20240307024034.1548605-3-gnstark@salutedevices.com> <CAHp75VfkTxRtMc_SpXoyoVjiWxm=c6_1VjeiRFUo4C7kH4HmUA@mail.gmail.com>
 <5ef5fb8d-f1be-4c8e-92fe-f40b68478228@salutedevices.com> <b7147fb3-fbe1-4063-823d-31f77b8ac801@csgroup.eu>
In-Reply-To: <b7147fb3-fbe1-4063-823d-31f77b8ac801@csgroup.eu>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 12 Mar 2024 10:58:16 +0200
Message-ID: <CAHp75Ve_4oM7PkNsWAQZ1XEBQ8knROjdjyh17YLdSeXw7M6juA@mail.gmail.com>
Subject: Re: [PATCH v5 02/10] locking/mutex: introduce devm_mutex_init
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
Cc: "kabel@kernel.org" <kabel@kernel.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "vadimp@nvidia.com" <vadimp@nvidia.com>, "mazziesaccount@gmail.com" <mazziesaccount@gmail.com>, "peterz@infradead.org" <peterz@infradead.org>, "boqun.feng@gmail.com" <boqun.feng@gmail.com>, "lee@kernel.org" <lee@kernel.org>, "kernel@salutedevices.com" <kernel@salutedevices.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "npiggin@gmail.com" <npiggin@gmail.com>, "hdegoede@redhat.com" <hdegoede@redhat.com>, "mingo@redhat.com" <mingo@redhat.com>, "pavel@ucw.cz" <pavel@ucw.cz>, George Stark <gnstark@salutedevices.com>, "longman@redhat.com" <longman@redhat.com>, "nikitos.tr@gmail.com" <nikitos.tr@gmail.com>, "will@kernel.org" <will@kernel.org>, "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Mar 12, 2024 at 7:41=E2=80=AFAM Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
> Le 12/03/2024 =C3=A0 01:01, George Stark a =C3=A9crit :
> > [Vous ne recevez pas souvent de courriers de gnstark@salutedevices.com.
> > D=C3=A9couvrez pourquoi ceci est important =C3=A0
> > https://aka.ms/LearnAboutSenderIdentification ]
> > On 3/7/24 13:34, Andy Shevchenko wrote:
> >> On Thu, Mar 7, 2024 at 4:40=E2=80=AFAM George Stark
> >> <gnstark@salutedevices.com> wrote:

...

> >>> Signed-off-by: George Stark <gnstark@salutedevices.com>
> >>> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> >>
> >>>   Hello Christophe. Hope you don't mind I put you SoB tag because you
> >>> helped alot
> >>>   to make this patch happen.
> >>
> >> You also need to figure out who should be the author of the patch and
> >> probably add a (missing) Co-developed-by. After all you should also
> >> follow the correct order of SoBs.
> >
> > Thanks for the review.
> > I explained in the other letter as I see it. So I'd leave myself
> > as author and add appropriate tag with Christophe's name.
> > BTW what do you mean by correct SoB order?
> > Is it alphabetical order or order of importance?

> The correct order is to first have the Author's SoB.

At the last one is submitters. So, if it's the same person, which one
should go first?

--=20
With Best Regards,
Andy Shevchenko
