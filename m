Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DEDB904D94
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jun 2024 10:07:09 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=timesys-com.20230601.gappssmtp.com header.i=@timesys-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=2ao9zGAC;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VzdRq1fVqz3fpF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jun 2024 18:07:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=timesys.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=timesys-com.20230601.gappssmtp.com header.i=@timesys-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=2ao9zGAC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=timesys.com (client-ip=2607:f8b0:4864:20::f30; helo=mail-qv1-xf30.google.com; envelope-from=piotr.wojtaszczyk@timesys.com; receiver=lists.ozlabs.org)
Received: from mail-qv1-xf30.google.com (mail-qv1-xf30.google.com [IPv6:2607:f8b0:4864:20::f30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VzdR75Y8Mz3bpN
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jun 2024 18:06:26 +1000 (AEST)
Received: by mail-qv1-xf30.google.com with SMTP id 6a1803df08f44-6b09072c9d9so6337316d6.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jun 2024 01:06:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=timesys-com.20230601.gappssmtp.com; s=20230601; t=1718179583; x=1718784383; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jU0s9gEKbGXmqfGEflzcwnbnMDxLuaH6EgnphUim8yM=;
        b=2ao9zGACDLLr0ARwiDP4LpPzMsZMhKbaOwJFeoFyZHJarOR0w7xoON/Td4goBAkiTt
         EzUHm7vFjOl6E+kUxOfd2q+9tPBSp5aeuCaRzfx4/F5hUDvsqfDgr0010mg6YFT5NulB
         JJSwyInpPUAxnYqCKEHDQfd9aMZHeZU1wGR28pbZWJXURjlGQCCCwDDMIE8w6JJduyfy
         HzpPJDm8Hlo+pQt88GmILnp8dSTlEPPR8Kh7Q23FHCFt0vfft+IahKa4e4WYw3ThCenm
         CvYErTDJh4ibvt1POLNTEHUDAE8iw1gIBcTkdRe6QAzEN5WYN7SglLcwupAqUgXBo4Pz
         8F4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718179583; x=1718784383;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jU0s9gEKbGXmqfGEflzcwnbnMDxLuaH6EgnphUim8yM=;
        b=o8h2+ftzdUy8XaNeXn3YBKt2D3rxWFeAqPcQJ2RLOrktl53nq58it44SkpIanEQKsj
         sl9QWWywwbFG0SAgnAsVM6xSl2KS+K1aOZ0IZumGkGVMnxIXiRlVuOEnaLFNOpVP+4Zh
         26RgGJc/o1Xfvg+XOtiiBqsciYzyT6lsX+OrWW1D0O216o+FnVvVAiAN/3Ou1tSicdbA
         eLeDvo1Q/hpJV8HV2NixWMlfKALh8ABgpEHzaHTBbkk9iuCGUUIVIJXD3qi5U/h5AGUp
         kE0DCmfOrHQHoL3dD+NBzw3OEccj9FoZ9ii5sFnDYa5Qy/ORbi2ndv/XitG8j6d2+6wi
         JhRw==
X-Forwarded-Encrypted: i=1; AJvYcCVpEW94uKFCY/iBH6+6mZ2wm7frs2DJuejb/I3mzGEpoINhr8QHx1DEix4wV598v+Asd/4+VBUQjzeLG3L3xlgR++KplNQkGX0hYI2KPA==
X-Gm-Message-State: AOJu0YzVcPyjF5sL6RkfnljqqESU5o4zLdCK3KdJ8DNOcPaC2W0NwIn+
	AOAx18OwvtDH+YZMJ+Cstv60nvxw8IPaPLzpyozILodLQvAIEU7kYaUWRpmwE/Eprrs8p4rxTOu
	SE6UXQTycPcfgb2b6hVjABH59iFG3Wxjaw9p/nA==
X-Google-Smtp-Source: AGHT+IG1/F1xQpU9EkBs57YWAqg59A4uhPeAz2DU+7fqEukJUGW0HybNnc7pOII0nGwuizPlb618ysTlXm0ZvIeJ3Yo=
X-Received: by 2002:ad4:5d4d:0:b0:6ad:752d:1530 with SMTP id
 6a1803df08f44-6b08a0780damr78312956d6.27.1718179582619; Wed, 12 Jun 2024
 01:06:22 -0700 (PDT)
MIME-Version: 1.0
References: <20240611094810.27475-1-piotr.wojtaszczyk@timesys.com>
 <20240611094810.27475-2-piotr.wojtaszczyk@timesys.com> <51eeec03-47da-44b5-a21e-f280d0c4b47c@kernel.org>
In-Reply-To: <51eeec03-47da-44b5-a21e-f280d0c4b47c@kernel.org>
From: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
Date: Wed, 12 Jun 2024 10:06:11 +0200
Message-ID: <CAG+cZ06EN4Uw7Cy+kwsiPzu16Kp7tsF19Oit6oN6GUcSe464JQ@mail.gmail.com>
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

On Tue, Jun 11, 2024 at 12:45=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
> > Changes for v2:
> > - Added maintainers field
> > - Dropped clock-names
> > - Dropped unused unneded interrupts field
>
> Does the device has interrupts or not? This should justify decision, not
> current usage by drivers.
Yes the device has interrupts but feeding data FIFOs is handled by DMA
(amba-pl08x.c).
Should I declare interrupts despite they are not used in the compatible dri=
ver?

--=20
Piotr Wojtaszczyk
Timesys
