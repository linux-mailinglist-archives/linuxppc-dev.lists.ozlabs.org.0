Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 244B2904D78
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jun 2024 10:03:48 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=timesys-com.20230601.gappssmtp.com header.i=@timesys-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=htNCgg2K;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VzdMy32tnz3fmr
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jun 2024 18:03:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=timesys.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=timesys-com.20230601.gappssmtp.com header.i=@timesys-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=htNCgg2K;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=timesys.com (client-ip=2607:f8b0:4864:20::f2b; helo=mail-qv1-xf2b.google.com; envelope-from=piotr.wojtaszczyk@timesys.com; receiver=lists.ozlabs.org)
Received: from mail-qv1-xf2b.google.com (mail-qv1-xf2b.google.com [IPv6:2607:f8b0:4864:20::f2b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VzdMF2jkzz3cT9
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jun 2024 18:03:05 +1000 (AEST)
Received: by mail-qv1-xf2b.google.com with SMTP id 6a1803df08f44-6b081c675e7so14720726d6.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jun 2024 01:03:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=timesys-com.20230601.gappssmtp.com; s=20230601; t=1718179383; x=1718784183; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oZhvy6kkbKYCk5v6xkrBCIcY4DF51uW5QFIx01DmAzk=;
        b=htNCgg2KCQHXAhgF7T0SHvpzwm02vjkTcusymf/c8k5KJZNTStBtyxL7LzvfRVa9H8
         nrFod0O/r6bo2y+mZ4Ad+nKfCRQgjEXDe0V+X50pd5AaiDJF3/BI2emg/XscD1CmgQaO
         t3SAdntePWNj9CevtMgKvom6AR11MuFhms8mBLcU/UXRKpf1m0UeFUbz1VkelD40R3C0
         La5p+k91RFRwmk0aGgrIY+DFyICCO7m2JQHCvfGtOAF8khju3cgZGbkjc/M15hh2HHKs
         ZxdunZ9+zTxQBrT1vKwCieeytITeM6R7wPfsG1EuZauRtQ+XsBHxGMQqakwPlm+IbpGN
         qn0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718179383; x=1718784183;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oZhvy6kkbKYCk5v6xkrBCIcY4DF51uW5QFIx01DmAzk=;
        b=jTBSAq8OmJBu3ElOTZxEvJF5YYmj8U8+gUfWu2iovzxZ+XxIlLXJR1QKrC3OhrBcmh
         n8NpVdLkXTMKnj8tsFuFhPWrV9mf/bADE36ivrOCCHbeKjiWo/fIGFhjgPTmxE5sSJw/
         PPbz5I0pUMlIl+TflENnXA62rxws9AZ9zruVAMlQPzr5e7UXhf7ecAQJPY39y/VUSH2/
         z2nEoVCYm142OCkZTpWAP7SOq7rLjBp6srpTf8YYmt2am+DCrLFpgyRvsJ8043Q5sDtI
         QDEZNDNyezt8FHBfKkYYP4CnprND/VpFH/PQXTrdfujBnDtAqvrEVsr3HA1WQtGBJMHE
         YI+w==
X-Forwarded-Encrypted: i=1; AJvYcCUKeHFvznULYJgadAch3v5p9IwDrCzFjeJHaORgcw0rEM70gxG27VrO1JPiBTjpAeIiIH2XzAKZ7PKCkE0KnAiF/Ae0IbowBUO7f+O/JQ==
X-Gm-Message-State: AOJu0Yxps0lwBU5REGBsdx38ArHq+WphUIlO8ryNNxpv72H7xh/5K0wz
	SfAuOf1HtqP20I6dpvPOOc/9OcxBlx1KUWmij2Spf/J/8TmSBxW65nKqtWMAwWXIeAWQpeMWdS/
	VLfsTMI09w50OjV3xOXd7Q0NKugSX1AOAAgQrOw==
X-Google-Smtp-Source: AGHT+IFBoGLGnRCfXUTT6MkmXv5tkb/vW4wlOs2DaIN1mKJ7KPlKywflPDae5tbSNQuiVC2G0raN2IzC+x3zhZJMYtQ=
X-Received: by 2002:a05:6214:4606:b0:6b0:77fb:8f16 with SMTP id
 6a1803df08f44-6b191778bdbmr10576316d6.21.1718179382867; Wed, 12 Jun 2024
 01:03:02 -0700 (PDT)
MIME-Version: 1.0
References: <20240611094810.27475-1-piotr.wojtaszczyk@timesys.com>
 <20240611094810.27475-2-piotr.wojtaszczyk@timesys.com> <1ea92ff0-7e2d-4a9f-bef4-d50fc93b86e6@kernel.org>
In-Reply-To: <1ea92ff0-7e2d-4a9f-bef4-d50fc93b86e6@kernel.org>
From: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
Date: Wed, 12 Jun 2024 10:02:51 +0200
Message-ID: <CAG+cZ07jpi0dobjf8JYt263qqy1tYWAvzsV9cgKaAW05mBoCeQ@mail.gmail.com>
Subject: Re: [Patch v2 2/2] ASoC: dt-bindings: lpc32xx: Add lpc32xx i2s DT binding
To: Krzysztof Kozlowski <krzk@kernel.org>
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
Cc: alsa-devel@alsa-project.org, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, devicetree@vger.kernel.org, Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org, Vladimir Zapolskiy <vz@mleia.com>, Mark Brown <broonie@kernel.org>, Chancel Liu <chancel.liu@nxp.com>, linux-arm-kernel@lists.infradead.org, Russell King <linux@armlinux.org.uk>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jun 11, 2024 at 12:18=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
> I do not see my comment about DAI being addressed.
Were you asking if it's a DAI? yes it is.

--=20
Piotr Wojtaszczyk
Timesys
