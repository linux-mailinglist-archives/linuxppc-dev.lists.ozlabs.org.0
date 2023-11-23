Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4439E7F5CA4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Nov 2023 11:40:31 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ventanamicro.com header.i=@ventanamicro.com header.a=rsa-sha256 header.s=google header.b=OqE876f3;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SbZQ51NJtz3dWj
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Nov 2023 21:40:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ventanamicro.com header.i=@ventanamicro.com header.a=rsa-sha256 header.s=google header.b=OqE876f3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ventanamicro.com (client-ip=2607:f8b0:4864:20::52b; helo=mail-pg1-x52b.google.com; envelope-from=apatel@ventanamicro.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SbZPG3FRGz2xqp
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Nov 2023 21:39:46 +1100 (AEDT)
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-5bdfbd69bd5so1353283a12.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Nov 2023 02:39:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1700735984; x=1701340784; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FQ5cHR9g9Ex7S7K/JEODWQbh9BgcOaeTZEBwA4kKzCg=;
        b=OqE876f3+RuUEcrVeNAwBYb732JEJLaUwEByRs2MAhJTN4RVz4qiVdkp50MRPVY04S
         UPTjOpsvI8FUnluQQ8/OgGUo66ZeaiwIj03nBsAKthMupEGWRrx9XEzgpKJeqgg3pb8N
         SCbmulDQRfqVzmbY/hL/iTy1iVsa93WSoyqzdPzWD9kIc3XRyoJLU872OZNPoqUaf7tK
         R2P6dq0IIS9H6dm/guhse8dhtVpKWPHmSBRiZK5uzv0/czu7a/QPwhov9px+3klpFIu5
         gUOYvZIcIbwRu6UqsgAN+DxqXP/nIVq0TGT6+mkqj+TZ69wQRBmd2vW3wwbP2sp46ojU
         iySQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700735984; x=1701340784;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FQ5cHR9g9Ex7S7K/JEODWQbh9BgcOaeTZEBwA4kKzCg=;
        b=SD37SrI21OEs3VtsmAa3fCvSopYpVDtbZnhfB2KvSY0EIBO3IrmBT38HpAiDycwv+9
         siClT/ChauAmE0PS7pYIGjgV2UgDbQOApQq/l338VFNuITChIlaEDrDqFSgcCesl0nia
         gjfBiwemAFfjHV3acQ5hB9Ih13IoeP1jr/M2C3av24Oy6XBz2TMbEruNWf3rD5XPAXNB
         +PnipcXrwK1SaUAGvI0lfme5O36mjrHKyZgVFjHA5ltKbCyIQAw8cKp67k+ghau/jdKq
         f4A9YkzKeP0ODEQJfFb26Qjw88RpSxBTbW/PoAOERzP7krcnOMLGjboMDX/CuN22GeZ7
         p+7w==
X-Gm-Message-State: AOJu0Yxm7TvKn8+23ZRXl6DrhwRid2z81e9ip5AAk0BpPv4/fO6wMzSn
	ddyGCtW0GMEY8XIM+25tpm3VXo+VSZIEuax/QwhbLg==
X-Google-Smtp-Source: AGHT+IG99YAMevSp0jGufV7mXYc4HBJFz0NMYVlrsS8HZwf7nEtTjYohwnzETeJL+MEJrNZlmD9vq5lOCr8swdpaVqw=
X-Received: by 2002:a17:90a:bf0b:b0:280:47ba:767a with SMTP id
 c11-20020a17090abf0b00b0028047ba767amr3176568pjs.16.1700735984411; Thu, 23
 Nov 2023 02:39:44 -0800 (PST)
MIME-Version: 1.0
References: <20231118033859.726692-1-apatel@ventanamicro.com>
 <20231118033859.726692-6-apatel@ventanamicro.com> <fb72e212-711e-4be9-9b92-89b2dc121476@sifive.com>
In-Reply-To: <fb72e212-711e-4be9-9b92-89b2dc121476@sifive.com>
From: Anup Patel <apatel@ventanamicro.com>
Date: Thu, 23 Nov 2023 16:09:32 +0530
Message-ID: <CAK9=C2W+Rb85Dm+sN=PXgN3wpbJFrvctBvC-Coi1Q_TsvthWYA@mail.gmail.com>
Subject: Re: [PATCH v4 5/5] RISC-V: Enable SBI based earlycon support
To: Samuel Holland <samuel.holland@sifive.com>
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
Cc: Jiri Slaby <jirislaby@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, linux-serial@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, Andrew Jones <ajones@ventanamicro.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Nov 22, 2023 at 4:18=E2=80=AFAM Samuel Holland
<samuel.holland@sifive.com> wrote:
>
> Hi Anup,
>
> On 2023-11-17 9:38 PM, Anup Patel wrote:
> > Let us enable SBI based earlycon support in defconfigs for both RV32
> > and RV64 so that "earlycon=3Dsbi" can be used again.
> >
> > Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> > Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> > ---
> >  arch/riscv/configs/defconfig      | 1 +
> >  arch/riscv/configs/rv32_defconfig | 1 +
> >  2 files changed, 2 insertions(+)
> >
> > diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfi=
g
> > index 905881282a7c..eaf34e871e30 100644
> > --- a/arch/riscv/configs/defconfig
> > +++ b/arch/riscv/configs/defconfig
> > @@ -149,6 +149,7 @@ CONFIG_SERIAL_8250_CONSOLE=3Dy
> >  CONFIG_SERIAL_8250_DW=3Dy
> >  CONFIG_SERIAL_OF_PLATFORM=3Dy
> >  CONFIG_SERIAL_SH_SCI=3Dy
> > +CONFIG_SERIAL_EARLYCON_RISCV_SBI=3Dy
> >  CONFIG_VIRTIO_CONSOLE=3Dy
> >  CONFIG_HW_RANDOM=3Dy
> >  CONFIG_HW_RANDOM_VIRTIO=3Dy
> > diff --git a/arch/riscv/configs/rv32_defconfig b/arch/riscv/configs/rv3=
2_defconfig
> > index 89b601e253a6..5721af39afd1 100644
> > --- a/arch/riscv/configs/rv32_defconfig
> > +++ b/arch/riscv/configs/rv32_defconfig
>
> This file isn't used anymore since 72f045d19f25 ("riscv: Fixup difference=
 with
> defconfig"), so there's no need to update it. I'll send a patch deleting =
it.

Okay, I will drop the changes in rv32_defconfig.

>
> Regards,
> Samuel
>
> > @@ -66,6 +66,7 @@ CONFIG_INPUT_MOUSEDEV=3Dy
> >  CONFIG_SERIAL_8250=3Dy
> >  CONFIG_SERIAL_8250_CONSOLE=3Dy
> >  CONFIG_SERIAL_OF_PLATFORM=3Dy
> > +CONFIG_SERIAL_EARLYCON_RISCV_SBI=3Dy
> >  CONFIG_VIRTIO_CONSOLE=3Dy
> >  CONFIG_HW_RANDOM=3Dy
> >  CONFIG_HW_RANDOM_VIRTIO=3Dy
>

Regards,
Anup
