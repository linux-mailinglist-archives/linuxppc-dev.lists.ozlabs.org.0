Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D6713854D59
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Feb 2024 16:51:14 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=brainfault-org.20230601.gappssmtp.com header.i=@brainfault-org.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=nVEtAp7f;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TZjNJ5KDYz3fCg
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Feb 2024 02:51:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=brainfault-org.20230601.gappssmtp.com header.i=@brainfault-org.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=nVEtAp7f;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=brainfault.org (client-ip=2607:f8b0:4864:20::12c; helo=mail-il1-x12c.google.com; envelope-from=anup@brainfault.org; receiver=lists.ozlabs.org)
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com [IPv6:2607:f8b0:4864:20::12c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TZjMV57PXz3c55
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Feb 2024 02:50:28 +1100 (AEDT)
Received: by mail-il1-x12c.google.com with SMTP id e9e14a558f8ab-363b8429f03so16388035ab.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Feb 2024 07:50:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1707925825; x=1708530625; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QSlVGbEelZs1+mCJGuJE5TbiYr0MAiLjyMJwC22PtNU=;
        b=nVEtAp7fegCS0QCXgLK9w1kFV0nl5DZ+HsfPDCys8YoS+KmqkwnQw6f0KgcMHjr27e
         NsAXHwYKwVzHZu3xn6ZmgxQSi54/UE3ysnk1B7JeRisn0vaR/579fhMyzziGvdJ/JPcR
         J53GzCAU9eLIL3AnOEsOxSPDoa6RpGsBUJVjzJGU5Keq4SQO2Y+R8z8StA34wIFnpuL8
         +Ft6y47XbsATpfsSTlPEccqj9rEjwmETKCfmy8HSdmrNzkQknzr9UTGUT6zlAxtad1CP
         0UBORyXqsOu5aNDKoXMxQCYv6rRLHIcNfmRj2sBhctHg+crd6Pk3fZ+w2pajj8QKP/Tf
         7raA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707925825; x=1708530625;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QSlVGbEelZs1+mCJGuJE5TbiYr0MAiLjyMJwC22PtNU=;
        b=CWSn0JwDjhSh8zjf0HwGN85ud1UWowlVuq01dFJZXfgfPf+/OxcSjACQz+Wusclx9+
         Q64W9C1WVrQuXNHeqkpR//fgGroHEzMkzJQFQYZSP8zAwN/cRjphalX6TJITi1ub+A7r
         7ZfzFpyLpMFnva0NApkAHJ35IqDC7PODAzQlCzOTGsZ0ODhHrE7eRMhnHB3v2xl070wW
         hd4o+KEeiuy/v2UCEDJp4LJ+IayKScm6+RDSt/x4RqjbZE/ZRyMBJV+Oou0AEm5GxtuC
         +KZ3uDAZNpF9MUD1fY1V7q+U6cE/ir1xPBFRvNQcJ05abZECz4NEjWDybGJ8Oo85j8id
         5FaA==
X-Forwarded-Encrypted: i=1; AJvYcCXD9QBHpUA2rtUqpZ1a851KC7hLJl2e5xIEj+fWZpAuwekhkKtHLsaHmt1X1tUn5iXGpx2xF5xMQWPSj1rxqa8YjJ8giGdnBroY2sD80g==
X-Gm-Message-State: AOJu0YzDUQRcac7RT9rVWbdPBCyOIV4JInHrE4EIUCRYBQs2aETIDlBd
	FiY/DPCT9lFWxWe/8Nj79EXaOi5/Kr+PK3RKlK64+CqwguSfICKrwFTWgSjxx+mLhtfkcTWSYhI
	oH2VQPNWCs77I0IU5jlR2C7LmhLoewCpsqAcVBQ==
X-Google-Smtp-Source: AGHT+IEg1mjBag5fQq6IiYnFAmtRUKSsf1C8M5YPUMlpqUwiUYtvbiinLPu7A8tR+cYW+rVJo79k/QL1npQnEykKim4=
X-Received: by 2002:a92:ca89:0:b0:363:d9eb:dae2 with SMTP id
 t9-20020a92ca89000000b00363d9ebdae2mr2993529ilo.13.1707925825474; Wed, 14 Feb
 2024 07:50:25 -0800 (PST)
MIME-Version: 1.0
References: <20240214153429.16484-2-palmer@rivosinc.com>
In-Reply-To: <20240214153429.16484-2-palmer@rivosinc.com>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 14 Feb 2024 21:20:13 +0530
Message-ID: <CAAhSdy3Tf=9jD1Cd11RjwKyDFPA_gHTqxMXSJ3HwANFFnR-8dA@mail.gmail.com>
Subject: Re: [PATCH] tty: hvc: Don't enable the RISC-V SBI console by default
To: Palmer Dabbelt <palmer@rivosinc.com>
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
Cc: apatel@ventanamicro.com, Emil Renner Berthing <kernel@esmil.dk>, Greg KH <gregkh@linuxfoundation.org>, Atish Patra <atishp@rivosinc.com>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, linux-riscv@lists.infradead.org, jirislaby@kernel.org, ajones@ventanamicro.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Feb 14, 2024 at 9:06=E2=80=AFPM Palmer Dabbelt <palmer@rivosinc.com=
> wrote:
>
> From: Palmer Dabbelt <palmer@rivosinc.com>
>
> The new SBI console has the same problem as the old one: there's only
> one shared backing hardware and no synchronization, so the two drivers
> end up stepping on each other.  This was the same issue the old SBI-0.1
> console drivers had, but that was disabled by default when SBI-0.1 was.
>
> So just mark the new driver as nonportable.
>
> Reported-by: Emil Renner Berthing <kernel@esmil.dk>
> Fixes: 88ead68e764c ("tty: Add SBI debug console support to HVC SBI drive=
r")
> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>

LTGM.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>  drivers/tty/hvc/Kconfig | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/tty/hvc/Kconfig b/drivers/tty/hvc/Kconfig
> index 6e05c5c7bca1..c2a4e88b328f 100644
> --- a/drivers/tty/hvc/Kconfig
> +++ b/drivers/tty/hvc/Kconfig
> @@ -108,13 +108,15 @@ config HVC_DCC_SERIALIZE_SMP
>
>  config HVC_RISCV_SBI
>         bool "RISC-V SBI console support"
> -       depends on RISCV_SBI
> +       depends on RISCV_SBI && NONPORTABLE
>         select HVC_DRIVER
>         help
>           This enables support for console output via RISC-V SBI calls, w=
hich
> -         is normally used only during boot to output printk.
> +         is normally used only during boot to output printk.  This drive=
r
> +         conflicts with real console drivers and should not be enabled o=
n
> +         systems that directly access the console.
>
> -         If you don't know what do to here, say Y.
> +         If you don't know what do to here, say N.
>
>  config HVCS
>         tristate "IBM Hypervisor Virtual Console Server support"
> --
> 2.43.0
>
>
