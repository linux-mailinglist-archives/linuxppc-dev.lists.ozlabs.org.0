Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E539D92D4AB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Jul 2024 17:06:49 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=buBiwgwM;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WK1RC5Q9Zz3cYV
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Jul 2024 01:06:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=buBiwgwM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WK1QX0dJYz30Tv
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Jul 2024 01:06:12 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id A6FA0CE16FC
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Jul 2024 15:06:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D8FEC4AF07
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Jul 2024 15:05:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720623955;
	bh=FDOqf3NZsuH6K85ttda3DFcxqrcrd0sCoBz7WWYK+7o=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=buBiwgwMpETkR87hwbkaQomyp8rP8g99MAYSG+UkgSuVODkJzxu1xuQIz97qcF9g6
	 wybZBhigsHK8Pv+mNlQ3QjTLMBcKICPTrAqKZIinDLt3CdXN5VtERxYKndgzwce+vZ
	 y3UeGgyr0W4z7pj0mDvU958nFkUwQZbNt/Nc+FOkSK5GbvpcYReX0DJAnaVoVjc+eG
	 6/ik+1FF5K/v2SOVtSwklNZcEed66p5M6Q2UMJb18ZffYmCcLKAFQPYmx7ta346V6t
	 aTyggwErqjG+k7RoNypUSRcZCAVnRRykvR95OknnWVrIBgLXjZBV3b0vb4R5Hkxcjj
	 eVfshG3om/eMg==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-52ea2f58448so8296508e87.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Jul 2024 08:05:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUZbwnSv6xDS5q6DylIl+b3EE3udvv6TeII9JpVbXXAhlcHwa2RXMhS8yGI/n+PMLxdsjgQtsASKfqiokLEWOyldpGXTzE549tmwcVhcw==
X-Gm-Message-State: AOJu0YwzKQz5Bw6gcqciIUDCamHoBm4tV8LZ5rmJGlypvOYMd1JRiJvf
	NPiKnJLukdFTBLa/r59y/fACUoWhGyyn8NLA2wFfV6UY+d/+625a986Wf942ZtOEwetWXQu4dNf
	HgAB8UWerR0PhDLJn1KAeMG2pOg==
X-Google-Smtp-Source: AGHT+IEIUkk/BsP8wkKMGirN8S3ezlwotGr6d0Lu6412aAG8/TajyZAFmIdYfqJvaNgLw8m5fcuAyLE1Puf5rWJHW+o=
X-Received: by 2002:a05:6512:200b:b0:52e:9ab9:da14 with SMTP id
 2adb3069b0e04-52eb999a268mr2794941e87.31.1720623953481; Wed, 10 Jul 2024
 08:05:53 -0700 (PDT)
MIME-Version: 1.0
References: <aeaa9b78-5853-473e-b985-b10241e88e0d@xenosoft.de>
 <8FDD860C-4DA4-46EF-BAD6-8F68837DA993@xenosoft.de> <c8010a06-9d8d-466a-9a83-ee25950f1885@xenosoft.de>
In-Reply-To: <c8010a06-9d8d-466a-9a83-ee25950f1885@xenosoft.de>
From: Rob Herring <robh@kernel.org>
Date: Wed, 10 Jul 2024 09:05:41 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJE+YZY3h+MZ0wzT2SZ5dLq_zR1iteNcdLUOoVPwKkxRw@mail.gmail.com>
Message-ID: <CAL_JsqJE+YZY3h+MZ0wzT2SZ5dLq_zR1iteNcdLUOoVPwKkxRw@mail.gmail.com>
Subject: Re: [PowerPC] [PASEMI] Issue with the identification of ATA drives
 after the of/irq updates 2024-05-29
To: Christian Zigotzky <chzigotzky@xenosoft.de>
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
Cc: apatel@ventanamicro.com, DTML <devicetree@vger.kernel.org>, Darren Stevens <darren@stevens-zone.net>, "R.T.Dickinson" <rtd2@xtra.co.nz>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, mad skateman <madskateman@gmail.com>, Marc Zyngier <maz@kernel.org>, Matthew Leaman <matthew@a-eon.biz>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Christian Zigotzky <info@xenosoft.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jul 9, 2024 at 9:53=E2=80=AFPM Christian Zigotzky
<chzigotzky@xenosoft.de> wrote:
>
> Hi All,
>
> The RC7 of kernel 6.10 boots without any problems [1] if we use the
> second irq patch [2]. Is it possible to add this patch to the mainline
> kernel?

Yes, sent it to Linus yesterday.

Rob
