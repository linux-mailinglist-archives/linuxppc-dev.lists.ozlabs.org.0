Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CC6FB8983E6
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Apr 2024 11:22:20 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=TVvxiquU;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V9GNV4Wpnz3vXC
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Apr 2024 20:22:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=TVvxiquU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::632; helo=mail-ej1-x632.google.com; envelope-from=andy.shevchenko@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V9GMm3HrQz3d4H
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Apr 2024 20:21:38 +1100 (AEDT)
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-a472f8c6a55so104067466b.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 04 Apr 2024 02:21:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712222493; x=1712827293; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IBtqvebZipirK0kh1olnmPcc8MM/cNoL1tv0Wtc1tsU=;
        b=TVvxiquU7K8HmZyFk4A9mNAuwamnK11jbag1TOgvRhFcayRthzKhlqiTKjH1FDSDy1
         ZEsjGvPl16vFrB+E2diBFkk6O5E6Vwwk5rIy888ZpiYHzRFWzbo9JCA9yjfgbLJY03rn
         tM9h+UOd9GGd7rb7bC26dYh6vgDt/QhtUc9U5xlbpWemxb3TiFn6eFVP91MIIYiBeXML
         1bIwppyKAjp0YEcRheadzLZPD+7dVZUxECRs9YWJUHkwFQaIZaw9gFm/hyB2z+X6TjTK
         6mnlHYjv53Q0yWmBqVLCweal2IxkfTbQGtE5nAGtZ2KWxG38daAirSPUDKHn0gyDot3E
         RZiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712222493; x=1712827293;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IBtqvebZipirK0kh1olnmPcc8MM/cNoL1tv0Wtc1tsU=;
        b=Qli9DEreohTVZ2zESan+zjmDZSjjvHwvNRYri8J+PbTcO8HBdhRa9wnG4wgRfC0hX8
         Lytv5YU9REunKqPtrQvM7fYqpmYwlrGJ8zNkETAsgX6eAvGU4nUmxKhuPmkNV9FeH0Z1
         XYMzTI8ZK/mDwjJzCMEVbzCdhcUhgUNznhknLw9hVZnwr+AGZmlEzz4KJsmRW8Lhkr4C
         qK+7yQAWxZs5eUjjSC56GJpfcsiInJFwXVyFXz3wvL4nslhBJVv98gI98wDd/yr1XyF5
         rQ/kKEGn+pE7jtbuHbZsP6CqlKA8st5KJ0wcaRPGYaMDViETbbPkiEiMCSRWmBtNskuT
         iJUA==
X-Forwarded-Encrypted: i=1; AJvYcCVd1HbAkbSzXvoKTZZD3RSEjc5dSnfFoeRxEiKHyIsQKmIi1xQQBOuNNUulMpO54tqMyHwj0GoSIJV8JmpC+vfw1Ur1SJhhv+yqu8tduQ==
X-Gm-Message-State: AOJu0Yxm6ysVmH+KwZc/+k4zYxK3tDzQoeSDmHYPtZOOZBkVXBhkT0ki
	tpacKS59mP+cxejsnM2n4ETSsStXkLZjoMPsh2OSSbWwnody+PXEXFm5bZJtVBmk6ogzErCfzJh
	sXL89zdLEYHK8+idVXJw7d2Qg0Q0=
X-Google-Smtp-Source: AGHT+IEuFsWQzjuoFKH6xP3gUs4bjys7kjQDLGl7XjPe+GUjpbLrwsjQcVsY5ZtSes7AfzSta2BDUCPfEFFQt++PcSk=
X-Received: by 2002:a17:906:6d4:b0:a47:32b3:18c5 with SMTP id
 v20-20020a17090606d400b00a4732b318c5mr1130270ejb.68.1712222493009; Thu, 04
 Apr 2024 02:21:33 -0700 (PDT)
MIME-Version: 1.0
References: <dda2187e128bfaaf092351812e4538e2e41c17f6.1711599093.git.fthain@linux-m68k.org>
 <Zg3YZN-QupyVaTPm@surfacebook.localdomain> <de576647-1147-4aa6-9d5f-aa6e3464fe1e@kernel.org>
In-Reply-To: <de576647-1147-4aa6-9d5f-aa6e3464fe1e@kernel.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 4 Apr 2024 12:20:56 +0300
Message-ID: <CAHp75VcQXQv26M1aLias2xnsgehqOr1PzX9sztSa_b1Ws=_L4g@mail.gmail.com>
Subject: Re: [PATCH] serial/pmac_zilog: Remove flawed mitigation for rx irq flood
To: Jiri Slaby <jirislaby@kernel.org>
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
Cc: Finn Thain <fthain@linux-m68k.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, linux-m68k@lists.linux-m68k.org, Nicholas Piggin <npiggin@gmail.com>, linux-serial@vger.kernel.org, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Apr 4, 2024 at 8:07=E2=80=AFAM Jiri Slaby <jirislaby@kernel.org> wr=
ote:
> On 04. 04. 24, 0:29, Andy Shevchenko wrote:

> >> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> >> Cc: Michael Ellerman <mpe@ellerman.id.au>
> >> Cc: Nicholas Piggin <npiggin@gmail.com>
> >> Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
> >> Cc: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
> >> Cc: "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>
> >> Cc: linux-m68k@lists.linux-m68k.org
> >
> > Second, please move these Cc to be after the '---' line
>
> Sorry, but why?

Really need to create a Q&A entry for this.

This will pollute the commit messages with irrelevant (to some extent)
information. Since we have a lore mail archive there is no need to
have this (the email itself will be sent to the list of people,
otherwise the Cc email headers can be tracked in the mail archive).
Also note, some developers may read git history on the mobile devices,
meaning small screens, this just (as for backtraces) simply blurs the
information with a high potential to lose significant piece(s) of
information). Last, but not least is environmentally friendly approach
(I'm not joking): having it on thousands of computers, scrolling with
longer time, power for compressing - decompressing -- all of this
wastes a lot of energy (maybe kWh:s per such a Cc list).

--=20
With Best Regards,
Andy Shevchenko
