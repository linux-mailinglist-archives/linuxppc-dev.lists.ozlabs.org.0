Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F24990C48F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jun 2024 09:46:26 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=timesys-com.20230601.gappssmtp.com header.i=@timesys-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=F6zDUT/c;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W3Jj66PKvz3cQq
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jun 2024 17:46:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=timesys.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=timesys-com.20230601.gappssmtp.com header.i=@timesys-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=F6zDUT/c;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=timesys.com (client-ip=2607:f8b0:4864:20::f2f; helo=mail-qv1-xf2f.google.com; envelope-from=piotr.wojtaszczyk@timesys.com; receiver=lists.ozlabs.org)
Received: from mail-qv1-xf2f.google.com (mail-qv1-xf2f.google.com [IPv6:2607:f8b0:4864:20::f2f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W3JhL2yLrz3bNs
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jun 2024 17:45:34 +1000 (AEST)
Received: by mail-qv1-xf2f.google.com with SMTP id 6a1803df08f44-6a3652a732fso22286716d6.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jun 2024 00:45:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=timesys-com.20230601.gappssmtp.com; s=20230601; t=1718696728; x=1719301528; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6y9EBQd9spPSlym6ahMvT//O8fjaB25I4zeYnyNC18E=;
        b=F6zDUT/cU3CpcQYv6s3YaJHp7XwtneBcT5KAqUyQvuDi0cItu5PEDhd8X25oOSfKLq
         gUjdjb2lNl32d9kGPXuHObRK3aM3thXah4QiUuItQli24uSUoyew6sCFP3W7Gxw1IFpi
         SRVkKALw6jvVrSEctPRxiNID9mlxhDQ9m0RtBr1DNsMTSd7aRq4Gc4H/jTxepC/le6T8
         W/m/IF4TRHp9q3r+mW89KOvzjN8mETNe+wrOzCq0P7q2zzDUjNc3/YxdPYAD8Cvwx3yA
         v2+RNEHb1p9qp9gRwi6a+cFWHIdC7njmjF7O2JwGVsco5U/dMjVyx+WTaygqOuKUVgsG
         oDzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718696728; x=1719301528;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6y9EBQd9spPSlym6ahMvT//O8fjaB25I4zeYnyNC18E=;
        b=a4DbJKXNnlUwa1sT39TzqsGT3tEQCxo+edEEbY8i1v3a32KLLxWj2fPVpZb6kutdnQ
         qrT36iAN+U5pL7gF1mHIjtZEAKT1tCQsT8aES/WJ+pvME6lfn7ptt3aBLqKg9OzBO6YN
         R3E9ssqeLT2/jhflEM7OTirS6/YYdX5Zn37MuAJBhmvAnZyJ/46fQloy2BqeU36P35CH
         RoX5HkdH9WDGlXKsycSOKSI29mvgcZNm8HfF90c1e4Njlx77zm8mNSId4LS2A3DhCSzW
         V/y6xqYMqL8wqUKZ6Ik89ymdHI0bWKCZvtJDnXM9hRBdjKTIyajjdShxTOZ8QGqtwNVw
         JEzQ==
X-Forwarded-Encrypted: i=1; AJvYcCV9Uxig40cygtw/rhfTXOE42wSFM4NVNnNR+ZM24Er1W9li89AiDyQ+KJL6q01zM0cI9jJhWA4M4htYZDRjOddKcN9PcSGtdjYR8hUrVw==
X-Gm-Message-State: AOJu0Ywl86491xvFv2UMZuHXfmmdeEnsDlhmA2Yt2MszDHEWoceFLzMH
	ngGnRVumR6Lv0OzSF3Cl/iK26aVOuW0OCK4J7OYzlpiKkyWu3wbRU58f162sjrhn8zhuP0Gq1uI
	uc2TBDNmO3FCkMoiaSbHIpSUPD5VyAh0ZWMcBbA==
X-Google-Smtp-Source: AGHT+IH7+3WcSHlqSCn8E776/vDX4KlNni6h709sa81SFyuFMo7TNQZN/dD9TK/cBC9XEnkBmumnQonT9vtIqu2MJcM=
X-Received: by 2002:a0c:c58d:0:b0:6b1:e371:99cb with SMTP id
 6a1803df08f44-6b2afd7792dmr117082556d6.3.1718696728034; Tue, 18 Jun 2024
 00:45:28 -0700 (PDT)
MIME-Version: 1.0
References: <20240614163500.386747-5-piotr.wojtaszczyk@timesys.com> <3fb7f6db-6822-413e-9aa3-953a5e3cd566@web.de>
In-Reply-To: <3fb7f6db-6822-413e-9aa3-953a5e3cd566@web.de>
From: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
Date: Tue, 18 Jun 2024 09:45:16 +0200
Message-ID: <CAG+cZ05LW5WZJqzs1yXZ3zV972iA-mE2HBtdGZPf+B0bAyWO_A@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] ASoC: fsl: Add i2s and pcm drivers for LPC32xx CPUs
To: Markus Elfring <Markus.Elfring@web.de>
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
Cc: Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, alsa-devel@alsa-project.org, Arnd Bergmann <arnd@arndb.de>, Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>, LKML <linux-kernel@vger.kernel.org>, linux-sound@vger.kernel.org, Jaroslav Kysela <perex@perex.cz>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Mark Brown <broonie@kernel.org>, Chancel Liu <chancel.liu@nxp.com>, Jonathan Downing <jonathan.downing@nautel.com>, Russell King <linux@armlinux.org.uk>, Vladimir Zapolskiy <vz@mleia.com>, linuxppc-dev@lists.ozlabs.org, Rob Herring <robh@kernel.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jun 17, 2024 at 9:30=E2=80=AFPM Markus Elfring <Markus.Elfring@web.=
de> wrote:
> Would you become interested to apply a statement like =E2=80=9Cguard(mute=
x)(&i2s_info_p->lock);=E2=80=9D?
> https://elixir.bootlin.com/linux/v6.10-rc4/source/include/linux/mutex.h#L=
196

I take it. Thanks.


--=20
Piotr Wojtaszczyk
Timesys
