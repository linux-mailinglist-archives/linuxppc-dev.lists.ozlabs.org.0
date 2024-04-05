Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 849088994A4
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Apr 2024 07:07:20 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=K+n8iegU;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V9mgp2crxz3vZF
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Apr 2024 16:07:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=K+n8iegU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::62b; helo=mail-ej1-x62b.google.com; envelope-from=andy.shevchenko@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V9mg02dvwz3dTp
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Apr 2024 16:06:34 +1100 (AEDT)
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-a519eae91d1so65918066b.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 04 Apr 2024 22:06:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712293587; x=1712898387; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sebt93aHymKxS1oWwauAtqnPitLNbEXG6RlgwpBarSs=;
        b=K+n8iegUaaPYy2xO1tm6sUNNXoPl6bOwiih6TmX01f+hrelcC7XDzI5rctb3kuzQ7k
         529djCR93xc7YXBKcZSIAmaGEhkxXQn5pZQ8e2YHUJHwCfcgXw5bK0+evbLlr/b82hDg
         pMbrcv230a2gt//PT9iAfLElZoYFJtu2gHdynM0doMrhXeOh19gyV8g+ClwC2pPfVdrA
         2uZi87sEpZFPcGdxS1yrfxodiM4gSrPswCAjaXWwyjg0ccM3McIrUH3dhwLLHAAdET4O
         WugXfBiWHh4Qej9vqyA8D6m3yBkoL+GgT8QC/2AyyE+OoiteEPNVfYmZ/CTwUzivETo/
         vB/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712293587; x=1712898387;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Sebt93aHymKxS1oWwauAtqnPitLNbEXG6RlgwpBarSs=;
        b=JaToJYUbb9r77nFM3K4cnSQcZw2FUucg1KB0+CpH1Fyc9JcHKBMNCsf6OWDwOo9rTS
         MMUEBIuulMTzhtGym1VQN6GpLyg/yxwczEmhAVaH0PBy+oZyQ3SRIRnQz8iITlWrEe82
         VCNPxHUaMrvQdASPW7TQZeb7vcc1E4wIELCLBAjq4949e1yUJGeWlGmkzm7UO5ZV8p4r
         S/MaylpGH3pNvUhJlMrmBdaA4lZamEkQL9FeYlzK9kzE3+7eryXjv7UpfA+jnueb7hMJ
         LLom7SK6jQD9u6aD0EdZZHHJ1kVIkBL2Z+TJUr8qOjzW4Kb3gw13kvweMAbPgVYVoehI
         WXXg==
X-Forwarded-Encrypted: i=1; AJvYcCVrJpjbL3xB5LuUxUOxQ0jpFOjW5/Bp0s/xs8UHj5I+OfyQbTf6umhewVdm7eJwaXXsmlppWgT9wrNRqL19VqYSGSBcYBTRNc1IQa/nmw==
X-Gm-Message-State: AOJu0YzkkOjPK9N9hdLPtSMGk9TIeVYKdVLojFHU6chRYWAuHx2nb0T4
	YnyiqJtWZfo2ErenutG1gPLVXWFgNkq9l+icQ6ys2dNZV7WoYGZuTmb4RWUJGbwFtGzGB9c1Qic
	C3HV8l5IeWxxZcmwTa4ZlzrWomNg=
X-Google-Smtp-Source: AGHT+IH5UaoZ1lqiUtwAAZvTUwGnrAg/GCbjcl9oYf28LvmdvgmcJ9HrjMUzZXEnFiUjAjm989T6vTu1elJupyLaKig=
X-Received: by 2002:a17:906:5784:b0:a4e:6580:eec5 with SMTP id
 k4-20020a170906578400b00a4e6580eec5mr183356ejq.27.1712293587311; Thu, 04 Apr
 2024 22:06:27 -0700 (PDT)
MIME-Version: 1.0
References: <dda2187e128bfaaf092351812e4538e2e41c17f6.1711599093.git.fthain@linux-m68k.org>
 <Zg3YZN-QupyVaTPm@surfacebook.localdomain> <8f234f26-d5e3-66ed-ab0c-86d3c9852b4a@linux-m68k.org>
 <CAHp75VcxLez_Nm0N8=gpWd7SKGd9JF2QXEOOB_gvX3ZtTzj6HQ@mail.gmail.com> <5dd285bd-b9a8-c85c-9bd9-a839c10e78fd@linux-m68k.org>
In-Reply-To: <5dd285bd-b9a8-c85c-9bd9-a839c10e78fd@linux-m68k.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 5 Apr 2024 08:05:50 +0300
Message-ID: <CAHp75Vc75xFK_kq4AHmHqt-bC_dk+St9M-AgBa0XUEAc1fB7AQ@mail.gmail.com>
Subject: Re: [PATCH] serial/pmac_zilog: Remove flawed mitigation for rx irq flood
To: Finn Thain <fthain@linux-m68k.org>
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, linux-m68k@lists.linux-m68k.org, Nicholas Piggin <npiggin@gmail.com>, linux-serial@vger.kernel.org, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Jiri Slaby <jirislaby@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Apr 5, 2024 at 1:15=E2=80=AFAM Finn Thain <fthain@linux-m68k.org> w=
rote:
> On Thu, 4 Apr 2024, Andy Shevchenko wrote:
>
> > > > > ---
> > > > (here is a good location for Cc:)
> > >
> > > Documentation/process/submitting-patches.rst indicats that it should
> > > be above the "---" separator together with Acked-by etc. Has this
> > > convention changed recently?
> >
> > I see, I will prepare a patch to discuss this aspect.
>
> If you are going to veto patches on the basis of rules yet unwritten, I
> think you risk turning the kernel development process into a lottery.

It's already a lottery, if you haven't noticed, i.e. it highly relies
on the style preferences of the maintainers and is yet undocumented (a
few years ago it was a new section introduced for closing this gap).

> How many other patches presently under review will need to be dropped jus=
t
> in case they don't conform with possible future rules?

What you are saying is pure speculation.

I rely on at least two things (besides already explained):
- the fact that Submitting Patches refers to the commit message
reduction due to the unnecessariness of some lines
- my experience and common sense (why duplicate the data?).

--=20
With Best Regards,
Andy Shevchenko
