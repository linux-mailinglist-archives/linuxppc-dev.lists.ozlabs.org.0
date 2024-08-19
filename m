Return-Path: <linuxppc-dev+bounces-190-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 726A29578C5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Aug 2024 01:46:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wnq4x01Tqz2xxm;
	Tue, 20 Aug 2024 09:46:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::52f"
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=dPW1dgd2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::52f; helo=mail-ed1-x52f.google.com; envelope-from=mmaurer@google.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wnpyz3S8Kz3bZK
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Aug 2024 09:41:45 +1000 (AEST)
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-5bebb241fddso1687a12.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Aug 2024 16:41:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1724110901; x=1724715701; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VyJ7DwTEeQRwF2J9itqF7qF9lyR7ouza0PHAuQm+FtY=;
        b=dPW1dgd2tsFboPF7NzkPEM6WjiKhEhK7Q7JwrmGewarMx9j7/Uh1RPKVH/Ckvi/DNZ
         DmB/wc36RHx7MZIolv1AH+FwicsYb6N8r69IJhXgTXoMcJT0w1f49Tw9CH4kE1ackPJG
         xn/sf0LULcnzNbVR3Pr+nszTpJCWj5oPY0VaGV2tWrZhUcX7+9mmyqD5CmxmJ+eD3H+2
         Ra/5FhMtaHOQ7kkO/lpgARA2GIKjdilqWCf06p01DoMXi+wbLO73oOsGb8KwqWz6EslX
         sHS8s2NaquaJXVdEqVqnfCjR9lbTAfZCRH0SyEctJYKW+YJl9cXgKxwkl6RO2QAntBzq
         higw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724110901; x=1724715701;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VyJ7DwTEeQRwF2J9itqF7qF9lyR7ouza0PHAuQm+FtY=;
        b=EQMaAmxgGQ4H+0v3RkQxrMSbBa/G6GijynFd+fKwy3UqO7hqhiG15xZ0v+JzhmY26u
         mfM8EvWf3vJai97D0yixZMNaAfLsVGj6fAB9qmALwtBoVRKtpK7LTO//20yNz67A+Fx5
         uvz9h3ZF7l3NQJAj8nZ/TxxCtIlAE0bbChmid4Un7jQ9/NNhJuTk4WdxVI14Zq2wZZon
         T8lAANxkbQGLBfjSHhqQdEjXoKJ9MZx4nBiMZuX4GuIrySsCZRMy0vQ1Cm1Z45Vr2c1O
         AYrtWLPHpHnlvCQ1FD2vFkPbb3GrWpdMufObknJYgb2reCRrSZ4vbyM+B3geClWzBMLX
         6ZKQ==
X-Forwarded-Encrypted: i=1; AJvYcCVBXtkMgHDQCBX7wGSespM4rQzNbjFiDCr/v9eVe7LBJCc3MNg+9qvlWy/zrts1CZa2Gm1G2CmWYTrPuNIqdWuaoMjArVU0rTk+M+JMug==
X-Gm-Message-State: AOJu0YxgXdOrabrKMeqmwVNGtCzroT8hau11rseVBDAbCO1lZUpm1G66
	T12yeCXRCWNZ+Uo/PGOu5cOLYyoreXMgjfwEiD+MmNl9VZtRLMBlP1qDrETw8tJk4QbweFK2Zg+
	hNOOSXQMMVbwK2ppqj0R0sIZdKOduSLi1jOSg
X-Google-Smtp-Source: AGHT+IEFf0La4uREmgZmbe880Nnbs8CZTxbPC4ox9daCMh8bMB0DPDlb/vwxR0dv4G47Vf1sgvElegvu9c36SV8SoxM=
X-Received: by 2002:a05:6402:3546:b0:59f:9f59:9b07 with SMTP id
 4fb4d7f45d1cf-5bf0c262b15mr42504a12.4.1724110900976; Mon, 19 Aug 2024
 16:41:40 -0700 (PDT)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
References: <20240806212106.617164-1-mmaurer@google.com> <20240806212106.617164-15-mmaurer@google.com>
 <87le0w2hop.fsf@mail.lhotse>
In-Reply-To: <87le0w2hop.fsf@mail.lhotse>
From: Matthew Maurer <mmaurer@google.com>
Date: Mon, 19 Aug 2024 16:41:29 -0700
Message-ID: <CAGSQo02r3NhWnpBF--5nB2RJ=1Hh97VshtiZmasDfknnL+UjmA@mail.gmail.com>
Subject: Re: [PATCH v3 14/16] modules: Support extended MODVERSIONS info
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: masahiroy@kernel.org, ndesaulniers@google.com, ojeda@kernel.org, 
	gary@garyguo.net, mcgrof@kernel.org, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Naveen N Rao <naveen@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, neal@gompa.dev, 
	marcan@marcan.st, j@jannau.net, asahi@lists.linux.dev, 
	Nicholas Piggin <npiggin@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Alice Ryhl <aliceryhl@google.com>, linuxppc-dev@lists.ozlabs.org, 
	linux-modules@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 16, 2024 at 4:04=E2=80=AFPM Michael Ellerman <mpe@ellerman.id.a=
u> wrote:
>
> Matthew Maurer <mmaurer@google.com> writes:
> > Adds a new format for MODVERSIONS which stores each field in a separate
> > ELF section. This initially adds support for variable length names, but
> > could later be used to add additional fields to MODVERSIONS in a
> > backwards compatible way if needed. Any new fields will be ignored by
> > old user tooling, unlike the current format where user tooling cannot
> > tolerate adjustments to the format (for example making the name field
> > longer).
> >
> > Since PPC munges its version records to strip leading dots, we reproduc=
e
> > the munging for the new format.
>
> AFAICS the existing code only strips a single leading dot, not all
> leading dots?

You appear to be correct, I'll update that in the next version, but
want to wait for more feedback on the rest of the patchset before
sending up another full series.

>
> cheers

