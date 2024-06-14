Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C88C909028
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Jun 2024 18:25:54 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=timesys-com.20230601.gappssmtp.com header.i=@timesys-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=ZPN47ep/;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W14QR0sKlz3cbW
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Jun 2024 02:25:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=timesys.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=timesys-com.20230601.gappssmtp.com header.i=@timesys-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=ZPN47ep/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=timesys.com (client-ip=2607:f8b0:4864:20::f33; helo=mail-qv1-xf33.google.com; envelope-from=piotr.wojtaszczyk@timesys.com; receiver=lists.ozlabs.org)
Received: from mail-qv1-xf33.google.com (mail-qv1-xf33.google.com [IPv6:2607:f8b0:4864:20::f33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W14Ph2nxFz3cX7
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Jun 2024 02:25:08 +1000 (AEST)
Received: by mail-qv1-xf33.google.com with SMTP id 6a1803df08f44-6afbf9c9bc0so14197956d6.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Jun 2024 09:25:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=timesys-com.20230601.gappssmtp.com; s=20230601; t=1718382302; x=1718987102; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AJ9BKcjtQxEX9HY4AyHldVS/pYAF0bNjL6ygRqtnenQ=;
        b=ZPN47ep/7rxVeYuYz6Bcw/gcqr8ba6r8PpLlIWzCbkfWOvs6WpV+bklWGUfjcwyCwm
         Zbw4pguGAdZ8EyausQzhsssNvMAqXPUr+4282i+l3LnXbq/VnTx0GCCvBbKz+mq7Eqk5
         FeUISMR3f+MYK7lOphmv1Cuf7Pop4oukbKGoaOyzsatpemuVULSt96K0J7yd6SW00qvt
         uTtMOy6Qfcinzd839QbFV7EdxTR7ipLhI4UeyP2D0CmwvjAuI0Wagu1nCXl+kOUBRlon
         IiA4fnY3PVzZRcJNXFJWSXn7oAVh8TBLiWs1MbZjH7LsZN37XZiWJh5sIkDwb5GlVWKq
         y9XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718382302; x=1718987102;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AJ9BKcjtQxEX9HY4AyHldVS/pYAF0bNjL6ygRqtnenQ=;
        b=YLcrQig7W77eZDZ5iWlhVfL+DpfgecsDfFD6fiLckgPWcBHFyQwuxufe0rXO0sJ0P5
         1kDUdzaIqH/R+DpFKzNvrR4D/xu8HddDH1gyZYDahi6Sl46+j2vjNLDaQkCLxB06OPip
         Z/TIboRQW/51mX7ag47moALZ348SyzvfTxQVFm3FURfHI6VifDnP0d/AjQJ5Wkct8nQH
         VkXeg1shvrlFLU8CVQwzDiXbEpl2xSqAVc9o0MfgPUXHrthzvl952xqhL650APEkXl0N
         biCmnOAGIYDL9Ben5jNQteoJ257J125+ysKJioG/dm+BFRCKvHFwaCf185XA3fV/3vC3
         +CYA==
X-Forwarded-Encrypted: i=1; AJvYcCVUG9LclUHusj7NsD4b2LmQAW2qGwlyDW5AXvNeWRQ4EZbhR9YyludVru6sdA5JKXP6Jw0wKL+0p3SsLTW0SDC8n71KAaMQFk1XHz0ySw==
X-Gm-Message-State: AOJu0YwxJIKYGdyvMziZ5aRocOoYLGZTE7VbzP1m2OJVNr4xvEPgDHNC
	Q7PTsSlR91nTvuIXJgpPa62S7YDXOHmj8lv0jQsnCu4xBvNZ3QQu5rGC/cD0AFdO2CHE8r/K2Cv
	ahUIZ21UU52VHUkwgIwX5OPr72kTLl5RWORgOPw==
X-Google-Smtp-Source: AGHT+IFxjsSmHmfjxcdx9LWJjlcnDzbmg6MTEjpCpU1mp7pLjF7m25ZdRpimxrXWgRWc3HiQ8GE0JCG3qf8CO/aq5Sg=
X-Received: by 2002:ad4:448e:0:b0:6b0:820c:2d50 with SMTP id
 6a1803df08f44-6b2afc722c8mr36483566d6.1.1718382302054; Fri, 14 Jun 2024
 09:25:02 -0700 (PDT)
MIME-Version: 1.0
References: <20240611094810.27475-1-piotr.wojtaszczyk@timesys.com> <Zmgor8accyAiUkUO@finisterre.sirena.org.uk>
In-Reply-To: <Zmgor8accyAiUkUO@finisterre.sirena.org.uk>
From: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
Date: Fri, 14 Jun 2024 18:24:50 +0200
Message-ID: <CAG+cZ06B+AexqvwZtNP5FX50AmghAFLa=1ebxmKLvMoyVJ529w@mail.gmail.com>
Subject: Re: [Patch v2 1/2] ASoC: fsl: Add i2s and pcm drivers for LPC32xx CPUs
To: Mark Brown <broonie@kernel.org>
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
Cc: alsa-devel@alsa-project.org, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, devicetree@vger.kernel.org, Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org, Russell King <linux@armlinux.org.uk>, Chancel Liu <chancel.liu@nxp.com>, linux-arm-kernel@lists.infradead.org, Jaroslav Kysela <perex@perex.cz>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Vladimir Zapolskiy <vz@mleia.com>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jun 11, 2024 at 12:36=E2=80=AFPM Mark Brown <broonie@kernel.org> wr=
ote:
> > +config SND_SOC_FSL_LPC3XXX
> > +     tristate "SoC Audio for NXP LPC32XX CPUs"
> > +     depends on ARCH_LPC32XX && SND_SOC
>
> On a quick scan I can't see any architecture dependency for build,
> please add an || COMPILE_TEST for improved coverage.  As for all the
> other things enabled in this Kconfig file there is no need to explicitly
> depend on SND_SOC.
Ok. Later I will add a sound card driver to phytec3250 board which uses
arch/arm/configs/lpc32xx_defconfig config file so that the COMPILE_TEST
won't be needed.

--
Piotr Wojtaszczyk
Timesys
