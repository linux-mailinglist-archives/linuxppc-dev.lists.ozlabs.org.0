Return-Path: <linuxppc-dev+bounces-1359-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A7DF978BAD
	for <lists+linuxppc-dev@lfdr.de>; Sat, 14 Sep 2024 01:06:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X590q1vryz301n;
	Sat, 14 Sep 2024 09:06:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::833"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726266030;
	cv=none; b=br3fu7GhqcwWl5IkKAqYxH7T3DJ9NDN3OkhEY+weIBfxmLOjDTGL/6awcWC1EFsje923UUwWWhDMaCToRQFfCWJbCvxWCyMG5+iPFrRK2aeX7oONhBsficrfTRR8USRPj7K4ChnbiKSPLkk3dE/mU/vyQQd1wR3+j4q86UCakQgq0WjtCpAPivKuRGayVqoCiP3Z1MYzg3VA0cKhh0/NN3yaAz3K3YidJEQPvdxLmoG+fBHGFIQ/n0Y0VUlM9pqC+rVYcdB6K1JoomK2U5UxFJOI65e7o2N5R5koZTtrBOdVp2G676ES/5D0M9ofyK5wsrrGnwCfBb78tBNHoCBFWA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726266030; c=relaxed/relaxed;
	bh=4ReVohtII5cSTlqN3wK0UiuPDbS9FDQk1WOSWLM7E9c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Fs1Xwa7GFrWU0nesIhONec5alEWvRbgVze3MQXKbgzC5D+fuxPUFeP81z85Rh0DBv6AIkTKkdkAZ4yJCRQRYHvj0WOHTbYg2Kidz3Y5KR61P8afeIcjq3yK4ZMmzG3yEx+C2XGr4cGyeg6BfoYcYOdtcPQaWVh/mJNKcdFIWDELhQe5uP2EVeOnD8wxDGwGOa059b5n0+5SAPUSJg86Gl/F5uNDfpsI5x496Uyhp51k+RoAo8uCgJB9GBzV32gerRWT7aYtptRKXP0MllHL6KMdRNDyAaaUpBg2EARRmdgFiywyDh7vInvdcxmvnsLyBLPs5+nCQzMpFyfe7keJbNA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=B13ebIJW; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::833; helo=mail-qt1-x833.google.com; envelope-from=almasrymina@google.com; receiver=lists.ozlabs.org) smtp.mailfrom=google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=B13ebIJW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::833; helo=mail-qt1-x833.google.com; envelope-from=almasrymina@google.com; receiver=lists.ozlabs.org)
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com [IPv6:2607:f8b0:4864:20::833])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X57zf1jSxz2xs8
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 14 Sep 2024 08:20:29 +1000 (AEST)
Received: by mail-qt1-x833.google.com with SMTP id d75a77b69052e-4582fa01090so94041cf.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Sep 2024 15:20:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1726266027; x=1726870827; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4ReVohtII5cSTlqN3wK0UiuPDbS9FDQk1WOSWLM7E9c=;
        b=B13ebIJWIXQH1znzi9sGk3rL7mAkZCjDuiKiBCuGpl07F7F9RLq1hoD/H610KG5T2C
         nzpxcAjenGedJ+eanooGhw27LzERZEwSdy99K5gyDUh23TK+KK+Y5jl2bpr3NcHOpFni
         YF9jaKWpFGkBnxjUwXtEzdJ2sohkC93Hqo6vNmpdsCGMLNW6NKegmEKNgTgwS/BgGRdv
         bFnQNi22IZrH2utXHvdyKoKvfi5CazrryPiEGN2JHLbhDLtZX+tz0/5xLP3+k3A+/nm5
         ueaCrRpXi3lKf8wBbSKT6JOMuhQzvBsyNwIfujDs449cCKcG6RO0qZ5Vb8QurMC2xEiz
         Szow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726266027; x=1726870827;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4ReVohtII5cSTlqN3wK0UiuPDbS9FDQk1WOSWLM7E9c=;
        b=PqEteiY2rLe2nEizREFiUPNOLRIDeQuC7uOtBkPh3gdeFvqRVXoD+U5oJvNgkYSQfx
         dy0V/LyR+fhOfIq+B66CVP5CtLhOCHRA6JNHXGCQcuQfxbtjD+X3qwW3sWPSyK1fc4WM
         No/0sN5bbLdvxIPsIWJTTqMAly9ifNQOLGZFXWW+aPV9KHPZHTLkCUtccYfQkfmG8D1Z
         KOxwDcZLd6HIIcT4dHWmBq5uBnxUWZWgafguyWULnMigrzuXNz8z1YoMRtH/585IvZGD
         Mg/38LDt2U8TTdUj3nWpTUViENdJuQAAMvm5aU2Q27PGomi9Yc1qD+8TrOJ/40E2BtM0
         GUjQ==
X-Forwarded-Encrypted: i=1; AJvYcCXsEx1tUCks6lpfZjYgWHUWFtAAftlgLM8qLlHj/nQWgT7LyFwJIvRmFFTLUWI8tF/QOFN30FOr2+dTLvU=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwP0OLRxcNjP22A2T553dX+zyIg+X6m40KY5UZ6MU6aVdcDLrQy
	flkQoMgIYjQQXBM4miWqiZPJu8o3XWWTAWrRCDSOZ8Su/lzVGw8B2oCqPIvB30X196M6iO+90L6
	HQsjtLVPhwyH/f40SdwxhkI1f8f2p3POyBkXj
X-Google-Smtp-Source: AGHT+IE0fYJ1AUzgoxfB7Sh6DszZg8+4BX/1w2yCAl0s1N4rHnq7fstPs0A7Ok4hht+CAAz8/BHHwxzYdIYuFld+XbQ=
X-Received: by 2002:ac8:5845:0:b0:453:5f2f:d5d2 with SMTP id
 d75a77b69052e-45864403792mr5623691cf.1.1726266026235; Fri, 13 Sep 2024
 15:20:26 -0700 (PDT)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
References: <20240913213351.3537411-1-almasrymina@google.com> <ZuS0wKBUTSWvD_FZ@casper.infradead.org>
In-Reply-To: <ZuS0wKBUTSWvD_FZ@casper.infradead.org>
From: Mina Almasry <almasrymina@google.com>
Date: Fri, 13 Sep 2024 15:20:13 -0700
Message-ID: <CAHS8izMwQDQ9-JNBpvVeN+yFMzmG+UB-hJWVtz_-ty+NHUdyGA@mail.gmail.com>
Subject: Re: [PATCH net-next v2] page_pool: fix build on powerpc with GCC 14
To: Matthew Wilcox <willy@infradead.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Jesper Dangaard Brouer <hawk@kernel.org>, Ilias Apalodimas <ilias.apalodimas@linaro.org>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Stephen Rothwell <sfr@canb.auug.org.au>, Linux Next Mailing List <linux-next@vger.kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, 
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 13, 2024 at 2:55=E2=80=AFPM Matthew Wilcox <willy@infradead.org=
> wrote:
>
> On Fri, Sep 13, 2024 at 09:33:51PM +0000, Mina Almasry wrote:
> > Building net-next with powerpc with GCC 14 compiler results in this
> > build error:
> >
> > /home/sfr/next/tmp/ccuSzwiR.s: Assembler messages:
> > /home/sfr/next/tmp/ccuSzwiR.s:2579: Error: operand out of domain (39 is
> > not a multiple of 4)
> > make[5]: *** [/home/sfr/next/next/scripts/Makefile.build:229:
> > net/core/page_pool.o] Error 1
> >
> > Root caused in this thread:
> > https://lore.kernel.org/netdev/913e2fbd-d318-4c9b-aed2-4d333a1d5cf0@cs-=
soprasteria.com/
>
> It would be better to include a direct link to the GCC bugzilla.
>

I have not reported the issue to GCC yet. From the build break thread
it seemed a fix was urgent, so I posted the fix and was planning to
report the issue after. If not, no problem, I'll report the issue and
repost the fix with a GCC bugzilla link, waiting 24hr before reposts
this time. I just need to go through the steps in
https://gcc.gnu.org/bugs/, shouldn't be an issue.

--=20
Thanks,
Mina

