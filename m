Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 593F6874C81
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Mar 2024 11:36:16 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Ue0ZIusV;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tr5Lk11jQz3vcW
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Mar 2024 21:36:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Ue0ZIusV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::635; helo=mail-ej1-x635.google.com; envelope-from=andy.shevchenko@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tr5L130TXz2ykn
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Mar 2024 21:35:36 +1100 (AEDT)
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-a458eb7db13so104645666b.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 07 Mar 2024 02:35:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709807732; x=1710412532; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LktdwCr7E2g4+9C9lRYb0fZ1kq1OEB07GM3xOk1omb4=;
        b=Ue0ZIusVp/Nb3H9gp7MrZvmaPz8aa9AO5c0VqwZbPdRRw83I85+lVgIIYGy8BwMeLk
         cWvD/hxtQcU3hM05Bf+FoyKtImk0sUy1q6JmJHn/rrp3HtRDhxAWSmahe5J1Zc/EGZej
         /tDjTTNWwvD45+p6oPtLkVhUR6vI/HalDUbF1EkX5P33Fa0zQQLEnr/FvA0EoACu6iEG
         C5sTQP2G0aNhNwTrbYPRflCnYnH/K0hyr0uKqdrqFASiU8h3lkFdjDPmLjHIMTqDWUjz
         t8LvHIW1pcDqAN09YgL95T3P5dLx4sETt8IjDnaE45ihZdW+RNfdTiJQHfR17nUXrc0q
         AwDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709807732; x=1710412532;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LktdwCr7E2g4+9C9lRYb0fZ1kq1OEB07GM3xOk1omb4=;
        b=BPCOc4bk5v7oU6lpxcE83SjCP1IvN3v1W7KwtUqao4a1tMZNX2HYSfoKJjihOJFlX8
         UxHyl6LHQAeK1XqP5682c3b+sGFwpR2HrY3LOaObfNVlfmfA8Vv3LCYPw16z4mZj3ASK
         3smZ0VzWJt3HVnMyofKM2JI3DRR+Zu80Jy42FuFjoBhB7ZTJBThv/agp1bk0bdflm+uk
         O6LMDZ0TecdlpFSE1HyFSTKZF0OduV7jzg3uODse2MsXOqUnDj9yAcBX1L7FNhVHNwNg
         x24/XSja4y70RvcAFdomdk3EosCJ9KR1FZB1RnUHwjIgi3VoRkd1KFfBD7qzafRg4U/H
         VgsA==
X-Forwarded-Encrypted: i=1; AJvYcCWhDIuS5chVFC+rs5YTQI7Ralif3ieWAIjkeSfYcf12IxTI62NCsR97KxvEBKMGvACGZAu64lL3Z1UO49HUWyM46Yzfwx1HvijhcgfdqA==
X-Gm-Message-State: AOJu0YzMoZxa6PCL3ZWYrOe3sOvYUOgu9y/ODq+0UUcY0oqQXA7xiQRY
	0gcd4C0kzXfd3caDmYlIvjEMFQtu2Bo27z/w6jLsR7dnx/awHyTagmCFBvzdLKQBYPjeaiOPzrp
	wmz6GsDgZqN1dth0IRAzEFPz5G+s=
X-Google-Smtp-Source: AGHT+IG7MolBiSHVr/INkdjHQrA8QhTieyub8IO8rqNdLDpucjeMceusqvRWtjt+QmkAY6qqVrGrYIH/KY4d3qBfxhQ=
X-Received: by 2002:a17:906:b2cf:b0:a45:b273:17c2 with SMTP id
 cf15-20020a170906b2cf00b00a45b27317c2mr2858740ejb.2.1709807731966; Thu, 07
 Mar 2024 02:35:31 -0800 (PST)
MIME-Version: 1.0
References: <20240307024034.1548605-1-gnstark@salutedevices.com> <20240307024034.1548605-3-gnstark@salutedevices.com>
In-Reply-To: <20240307024034.1548605-3-gnstark@salutedevices.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 7 Mar 2024 12:34:55 +0200
Message-ID: <CAHp75VfkTxRtMc_SpXoyoVjiWxm=c6_1VjeiRFUo4C7kH4HmUA@mail.gmail.com>
Subject: Re: [PATCH v5 02/10] locking/mutex: introduce devm_mutex_init
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
Cc: kabel@kernel.org, linuxppc-dev@lists.ozlabs.org, vadimp@nvidia.com, mazziesaccount@gmail.com, peterz@infradead.org, boqun.feng@gmail.com, lee@kernel.org, kernel@salutedevices.com, linux-kernel@vger.kernel.org, npiggin@gmail.com, hdegoede@redhat.com, mingo@redhat.com, pavel@ucw.cz, longman@redhat.com, nikitos.tr@gmail.com, will@kernel.org, linux-leds@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Mar 7, 2024 at 4:40=E2=80=AFAM George Stark <gnstark@salutedevices.=
com> wrote:
>
> Using of devm API leads to a certain order of releasing resources.
> So all dependent resources which are not devm-wrapped should be deleted
> with respect to devm-release order. Mutex is one of such objects that
> often is bound to other resources and has no own devm wrapping.
> Since mutex_destroy() actually does nothing in non-debug builds
> frequently calling mutex_destroy() is just ignored which is safe for now
> but wrong formally and can lead to a problem if mutex_destroy() will be
> extended so introduce devm_mutex_init()
>
> Signed-off-by: George Stark <gnstark@salutedevices.com>
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>

>  Hello Christophe. Hope you don't mind I put you SoB tag because you help=
ed alot
>  to make this patch happen.

You also need to figure out who should be the author of the patch and
probably add a (missing) Co-developed-by. After all you should also
follow the correct order of SoBs.

--=20
With Best Regards,
Andy Shevchenko
