Return-Path: <linuxppc-dev+bounces-5686-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B920AA21F16
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jan 2025 15:26:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YjkxR40jKz30JH;
	Thu, 30 Jan 2025 01:26:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::135"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738160811;
	cv=none; b=lf5wVvo629l7zL1YvmhNKqgY9H+fM7764pwM0Hpn23Ncj055jf8xTbXW8Lf8spSwC2sD5n+PXdrEbINlutQrqbIFfYPfviT+y3lCjJ+/EyKWRZGHUZ2xLtXkZPt2u1GMMD8Qc5sTj43YMHhbFPeI+Gu2lJxpfRAjXB8cEcIt16qRGUpzI8TcwTs1piVbc1OfqdxazmvqoZ5GD5SY+Qzv1jGrqQCwvwv1nnl67f6lRzEZzipBJFp+NnXmWG4ro5Wf7BJhxYsDzHxiAcaub4+4YfWbL8ds2n7OF8c5UtTW3wbYNxS42cO2fqDUkhXq4KpNdtb6unkGYcBTbUyShw3BMA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738160811; c=relaxed/relaxed;
	bh=Jwe7mBceHrKCWCe+WWOlzsCntFwRsEjHulxFCd8Sbfc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dStsdGjpbydhvOhP7k40BmQyNldUUwbJqO4EauOhFyswI0AIKax8DanpApsdLKIt5xNSG7ZcukxZXXidpNcla2ugSgLPK/5DaYYCOHaMiKI+wh2wMqHMmRVsH4qcz6f+Z0xMxF+chlmVnouC9t62gUv2KstWJpXjJFMxd+seijHpAa90F+BWcxGiRy/V2C6uzwQIUWQVXHH/lwnzbfN4MMJ/vbrXcXI68h+NfibTPE7WN3Q9kM+nZuRAI01v3wgqkd8BGeli7eZL0pE8PSeyM6rSc5gY5t+q2zOIw5+/CbSHtfhCRQ/7SRXlkfPYvLMzcOQiSK0Xj+HHmjttalWDag==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org; dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=DNuCrzrp; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::135; helo=mail-lf1-x135.google.com; envelope-from=linus.walleij@linaro.org; receiver=lists.ozlabs.org) smtp.mailfrom=linaro.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=DNuCrzrp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::135; helo=mail-lf1-x135.google.com; envelope-from=linus.walleij@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YjkxQ2FXVz305v
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Jan 2025 01:26:49 +1100 (AEDT)
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-5401bd6ccadso7117888e87.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jan 2025 06:26:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738160804; x=1738765604; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jwe7mBceHrKCWCe+WWOlzsCntFwRsEjHulxFCd8Sbfc=;
        b=DNuCrzrppMTDniXYVvsRR9D92Bamp5KJY0xRcYsLvdaxph5Luhayx4LN8OuUtWRqyZ
         gajRC3fmcrJOTKxSJyGEjFMryMRb4pFY5mbdysZRIAqOcC3pA0xwv+rUz0XAcdqAvGgW
         ZlOueQfIUvYU5B2apITxqN4MgJGuUMEz/ym86kKxowg9Mui8WNHw0JfhjU2XlQKzu210
         NthjiJjRTFbAuP1WEG3h5+B3DbAYwBMl15Iwh9qpiG5aA6s6NDxiC8AG1CsNStSrkZgf
         j+/xoqYVn6wmMdKc/539XAleAtQzEvJQlzCB+rvXvf8zcR/mwudWNufd65S+356moNws
         /jXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738160804; x=1738765604;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jwe7mBceHrKCWCe+WWOlzsCntFwRsEjHulxFCd8Sbfc=;
        b=SlTclp6ufDyMmweyHqZXbiSHr+Vfr2zM9na2RMVgAnmFenwXGdmTfN3bQKmbhPKMwK
         u4oBbrybxTwf7hsvxm+Hw+ymChT8KgVTww7TKDFclt0HMSE8A7QhaBIqXaETbhFbaxGl
         PmVQ3bo5jXXpelh23AW8oJN9lxlCArvho/063H0GwcfdAsCtT6H38u/yvG0BYiBMC5n8
         NFOFQ1VAwfZmWTnxhyENaDQ559i93Pdq2JQ12F5NR6ZzkjrtNI88FRh9RbwYYIVngUdQ
         LcfujqH9VTl15y7Fg72gAjeAC8EP1loIkhe3m7v7Jbft7CoBGaNoR7GUxuW3MdhdjkKS
         x0Qg==
X-Forwarded-Encrypted: i=1; AJvYcCXKMok1pKjmqJF6RoAvNPQyuJX4u1wlglLc7XtmypPZC/CCbyCmMV9yhburzicSrgRO5h/VjZDruVfbun4=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxEfk6ywgHVVaCIP1vdpijXxKIFAG9g/b5t7/PwtBA+Y0pafSYN
	n8WnwaI9yVVFUN6E4iW42cP6VEg9XBJzNoGKjHobwYCvfRcPmN/ZbQBnoe7VYqqgCoFECVMTNio
	B0jD+zuDze4AlDjJPc+OXk3vwBQ0kMnwrLOzkrw==
X-Gm-Gg: ASbGncvsC0sx9HHeuaDrd1hKSllgQNYvkcnw/JiJ1tULAZcUEKBpApiD0aphbg5Dbe9
	8kDZiBljmTA/LP5JIP5ePWrC3pcQouatn0/lkGCa+7WrENIiKRtBuEStAYTUTcnNho/Odq751
X-Google-Smtp-Source: AGHT+IHw1F/lo1/Ko4z7pikW4LFnEDu5Ve1ZScMGRFoM5rAS+hq7npeLgI/60jvet6gNCQddPeFB19H+PtzGDKVNdzI=
X-Received: by 2002:a05:6512:4802:b0:542:28dc:a2b3 with SMTP id
 2adb3069b0e04-543e4beac65mr993160e87.22.1738160803896; Wed, 29 Jan 2025
 06:26:43 -0800 (PST)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
References: <20250128150228.GA15298@redhat.com> <20250128150307.GA15325@redhat.com>
In-Reply-To: <20250128150307.GA15325@redhat.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 29 Jan 2025 15:26:32 +0100
X-Gm-Features: AWEUYZl3XKXbgInDRKrHV1u1-_zdCdB6TJlCed9nhE-D94gFzevJM-mPjaUlV5g
Message-ID: <CACRpkdbEKYz_GFYeuBLsSv3xD3qjGjoDh16GWgzfdOfwRjOdYw@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] seccomp: fix the __secure_computing() stub for !HAVE_ARCH_SECCOMP_FILTER
To: Oleg Nesterov <oleg@redhat.com>
Cc: Kees Cook <kees@kernel.org>, Andy Lutomirski <luto@amacapital.net>, Will Drewry <wad@chromium.org>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Thomas Gleixner <tglx@linutronix.de>, 
	Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org, 
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Tue, Jan 28, 2025 at 4:03=E2=80=AFPM Oleg Nesterov <oleg@redhat.com> wro=
te:

> Depending on CONFIG_HAVE_ARCH_SECCOMP_FILTER, __secure_computing(NULL)
> will crash or not. This is not consistent/safe, especially considering
> that after the previous change __secure_computing(sd) is always called
> with sd =3D=3D NULL.
>
> Fortunately, if CONFIG_HAVE_ARCH_SECCOMP_FILTER=3Dn, __secure_computing()
> has no callers, these architectures use secure_computing_strict(). Yet
> it make sense make __secure_computing(NULL) safe in this case.
>
> Note also that with this change we can unexport secure_computing_strict()
> and change the current callers to use __secure_computing(NULL).
>
> Fixes: 8cf8dfceebda ("seccomp: Stub for !HAVE_ARCH_SECCOMP_FILTER")
> Signed-off-by: Oleg Nesterov <oleg@redhat.com>

I had no idea it was this complex, thanks a lot for looking into this Oleg!
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

