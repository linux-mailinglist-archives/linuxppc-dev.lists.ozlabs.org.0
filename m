Return-Path: <linuxppc-dev+bounces-8471-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F043AAB106E
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 May 2025 12:22:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zv4n33Lfxz3bkT;
	Fri,  9 May 2025 20:22:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::232"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746786135;
	cv=none; b=X0qxYWYWiop0Ank4MFmllUjpSvJFXbz2IWdpLhzyZQNzoPxMCcj2gbN2GSgFf6x11b/r+a3WnUQ0wIxi28YLsg7KvXQWVF0p0WTLYghRVNWN71bd1Eoa5za0az/27+PFkSXOV8Zv3ZFCOSRn9fakwEbILiiUm5ApYdG7Pys909jE/qoKDg0h/Y/ZE7A/6usPio+iz3Sf66Eq7VZR77Rmek02vjpGemALs6RPfj5XDPLkpBvMVHV9icu6sunfjdLXO3QX75KxQYVYaaV1z9TAV+zY3rHc3PzkmdBLlsA8bPx7t55U7DzaeeyDoetURR+36W2dtbxGWpC2no5xHhvrQA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746786135; c=relaxed/relaxed;
	bh=lEKN1jbgilqN3iHLAzkRRI/T6QIJDoiiG8dqLEcN47U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ANeM5BSqUgqyOVf9ZN/BF/8jMWtpXyRvZzZ81IqqQzuo8HYsHjLoYDRncpGhZQhM5C2hXjnkBXYxV9+iTexLMb9Rf/9Lj1Mxw+xieM4dRefvt2Y03QPfoQQAZpiLdyi19zuqyf9dtkI6mq8OdCNPh5MYKKFpEEhnOw3/cZbqGa9nblkUlOAKA/vsBa70Brvvb5NVXUR+6bp2miv83mjpBiC4WiO613P9QYWU0YZXtw+2mhcnBD+vwr3z6pFUwrAN1Rikr/075vna5L06x8hw4iVsVos1LQvh4Sk3FUvkpderDh+mIAUXAUUa54eVhn8oH6pr+bRoQ8B+N2GBa1Bd+g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; dkim=pass (2048-bit key; unprotected) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=bIYlYKgN; dkim-atps=neutral; spf=none (client-ip=2a00:1450:4864:20::232; helo=mail-lj1-x232.google.com; envelope-from=brgl@bgdev.pl; receiver=lists.ozlabs.org) smtp.mailfrom=bgdev.pl
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=bIYlYKgN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=bgdev.pl (client-ip=2a00:1450:4864:20::232; helo=mail-lj1-x232.google.com; envelope-from=brgl@bgdev.pl; receiver=lists.ozlabs.org)
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zv4n100G1z3bkL
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 May 2025 20:22:11 +1000 (AEST)
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-3106217268dso17483501fa.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 09 May 2025 03:22:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1746786125; x=1747390925; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lEKN1jbgilqN3iHLAzkRRI/T6QIJDoiiG8dqLEcN47U=;
        b=bIYlYKgNLl9GbAGhDsa37aimV/JNscSPjagKp89oHOIDpYqgmNT6RpTFU59wqExmH/
         JHLKm6g9RvnURgqkXZjTYgZY5MdWuFp2fJ3L8J8ioQupTy3xnpO5jsxophYTG2IRPwwQ
         Jd1hdfM3DbDvucyFtU6MJRggEl870ZODXyX2HS+YC+5c1BdhFwsWyiA2Tfql39RgScyc
         lRm39hFnkjlizRMPIfdnzbnXdnxU0yoKnA+5ZerUc/etCXlmf/R7M1ndJJzKVW5tu/2k
         SZVkI0ceAa8mxYNHpK3c4t1QmCZazstkTshzSTf0DQbUWmXZqMyrLhz98vsfFeJgK1MH
         MmLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746786125; x=1747390925;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lEKN1jbgilqN3iHLAzkRRI/T6QIJDoiiG8dqLEcN47U=;
        b=XJQvlBoDxG2pAENh0DAAHWDhIq4f6pEpaQClcOcRSbCYvq1pGjvy2hc55XYBqZNajs
         QK+AHsDQ/f3ZEVzWn4u6jhqa/D5uxZx4cDBZbVb8cn45L0zxd0eFnNUFStmT6F0BjS9h
         bfOgywA2XyssskNB0PEHkMcHNqnj84Yi9TfwYisFifeQGFHgYW5chKssHZJZ/Ys6DPce
         y1iVnf0nC72weNfXJzNGqfGua2FGTQUXENcRs1CBr8nOLOMSm7uMONoa0Mk0f0n83mcN
         GttZ0OH/x+VqJRCKTSSJESAlfYaLR+Z78HZeLX36l1ZtNWCaKhNJoG8q++scHnsxih1K
         3N9Q==
X-Forwarded-Encrypted: i=1; AJvYcCWPd/MtoCOUFTTqWzidSFQcjw8grn5OlEoHhFZ+9HpxqpRVTA//X1+TsbeEfQHKKMGQqzZyslKvkbe12Rc=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yz6Pxt8EfhklKZb9TRkp2K9VpQdE4YDSKVr0USa5N/gO77HImcg
	RS6geTLKg1TO0GzNbup0MsSaxvGq/9OY4D450TK6WiRpoBssrozRB1Ai+J3XixtFatZfagmDkqd
	Ncr/3E4dlODB7RS+he6s0swe3hZRoo7ZdByuPsg==
X-Gm-Gg: ASbGnctH5ZsNU9abE3LAu8wDXP5s7m/K79vG5beRPStZusIe/PH21pVQjtUBvBnDp83
	5ShM+9IwVzsiKUN8Fjgy+Lh6DwpMyqEl/D1z0vu9fARdYq6j9KVrZWJdTdhbSLDOrhXUTWiHw56
	dbXDqkOtmqJjG2Bxao2lmvuV2BnZIETl2/3QtRLLl+5ygYZUyvJLwVFQ==
X-Google-Smtp-Source: AGHT+IFFnckVfV38yiKm/0tyz56i3avYrl46Y9age8QQDJkz0vCUqheVLftkCKucDo9t25Jxqs4Ykbmgz1ik3/urSi8=
X-Received: by 2002:a05:651c:2211:b0:30c:15b:1268 with SMTP id
 38308e7fff4ca-326c457e7cbmr11457661fa.15.1746786125175; Fri, 09 May 2025
 03:22:05 -0700 (PDT)
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
Precedence: list
MIME-Version: 1.0
References: <20250508130612.82270-1-markus.burri@mt.com>
In-Reply-To: <20250508130612.82270-1-markus.burri@mt.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 9 May 2025 12:21:53 +0200
X-Gm-Features: AX0GCFvERxh0VC7uLRRore07epYkHtQUe6fy6V21pIoKxIz0HhJctMM3W0tAElY
Message-ID: <CAMRc=MczDhGpxwbGCUoUxGm19dqNH2FzXVrbXewy7yMP=SEieA@mail.gmail.com>
Subject: Re: [PATCH v4 0/6] Fix potential out-of-bounds error in some drivers
To: Markus Burri <markus.burri@mt.com>
Cc: linux-kernel@vger.kernel.org, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, 
	"Oliver O'Halloran" <oohall@gmail.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>, 
	Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>, 
	Maciej Falkowski <maciej.falkowski@linux.intel.com>, Oded Gabbay <ogabbay@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Nuno Sa <nuno.sa@analog.com>, 
	Olivier Moysan <olivier.moysan@foss.st.com>, Jonathan Cameron <jic23@kernel.org>, 
	Lars-Peter Clausen <lars@metafoo.de>, linuxppc-dev@lists.ozlabs.org, 
	dri-devel@lists.freedesktop.org, linux-gpio@vger.kernel.org, 
	linux-iio@vger.kernel.org, Markus Burri <markus.burri@bbv.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=0.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, May 8, 2025 at 3:06=E2=80=AFPM Markus Burri <markus.burri@mt.com> w=
rote:
>
> Several drivers are using debugfs and follow the same pattern.
>
> A buffer is created on the stack with a limited size to copy the given da=
ta
> from user space. The copy is performed using simple_write_to_buffer.
> This function limits the input according to the specified buffer size, bu=
t
> it does not write a string terminator if the buffer is truncated.
> Therefore, the driver adds this zero terminator afterward.
> Unfortunately, the original buffer size is used as an index, which can le=
ad
> to an out-of-bounds error.
>
> This patch set fixes this issue in all the drivers I have detected so far=
.
> The fix is to return an error in case of an unexpectedly long buffer bein=
g
> received and to use the effective written size for the zero terminator fo=
r
> consistency.
>
> Changes in V4:
> * Revert the decrement of accepted size by one character
> * Added patches for drivers with the same pattern
>
> Changes in V3:
> * Decrement accepted size by one character according to feedback
>
> Changes in V2:
> * Use effective written size as index instead of original size
>
> ---
> [V3] https://lore.kernel.org/lkml/20250505203830.5117-1-markus.burri@mt.c=
om/
> [V2] https://lore.kernel.org/lkml/20250505045346.29647-1-markus.burri@mt.=
com/
> [V1] https://lore.kernel.org/lkml/20250501063240.25295-1-markus.burri@mt.=
com/
>
> Markus Burri (6):
>   iio: backend: fix out-of-bound write
>   accel/ivpu: Use effective buffer size for zero terminator
>   iio: fix potential out-of-bound write
>   gpio: fix potential out-of-bound write
>   powerpc/eeh: fix potential OoB
>   powerpc/eeh-powernv: fix potential OoB
>

Please, don't send this as a series, it makes absolutely no sense.
These patches - other than fixing similar issues - are completely
unrelated.

Bartosz

