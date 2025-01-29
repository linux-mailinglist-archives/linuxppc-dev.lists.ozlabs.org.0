Return-Path: <linuxppc-dev+bounces-5662-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4192CA2179A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jan 2025 07:06:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YjWqn2l5nz2yhT;
	Wed, 29 Jan 2025 17:06:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::636"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738130773;
	cv=none; b=DoMvBQSTmfgqVeD3N+DnqpkxFIvoSNerkPZnLdgDo+hI8kqH0q1yKRhhrHRIHAADxR/7uBqEmkZUz6NGbXYVzUsmqPXoh32GReLftuwl1aSeLnJ7+cZRMxzL6Leukq/sOQbrJV6GDDwYXxtly7LCdWlccTNgWmYba/a8ISphcK3LYFxRBdOysKoSCse3GcGfxKFL+YuY9/UKm9D6hmJObqY16dDyl9VAVgfuVxW14n2tCQf+0MT3gJi64maaTBZeXvfGZQlrB6bnKzNbITtSBYFkU/izEALNtWnDUmLtZrttIdKWsag0+SaD7eNO7U+tD1xreDL7Gv8EW6njZ68Xdw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738130773; c=relaxed/relaxed;
	bh=62HPA9SZHK46UH07M3yO3xbQvVeHfdm6K4iT8luGSJQ=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:
	 References:In-Reply-To; b=G8CwuArIFcy7OBaMu0Zas/hy1Bq6zqQZsVOVbqWl1+kp5kiBrhXotye+cI9ElOOt1lNQOPS6XHRFZFgXOhSYgT0FPoSl/0z/TJBovvGBJjpzakVQ0FEvWL0mdRs0vsN9zSONacT5n/mrFXt9UEd92tsFODP5uml4s6PLOB6GPh0iN6VUulwLEzvMdfeDlhaW2NcjrEOVSpSjXJnZSUybEGjcs/ghuqxkgChKPbnVTWQtrUiAD2agLyw5H5gIO6fT2Dh9RM+hZk0d8mmtsrWINC8aXn87h0/YYt5IG+Qp4tvgalMrNZr3BFinDHRy8+P43FHZ1HUCm+gNLMQRHORfAw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=WbcaIjE2; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::636; helo=mail-pl1-x636.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=WbcaIjE2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::636; helo=mail-pl1-x636.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YjWqm4Dz3z2yPD
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jan 2025 17:06:11 +1100 (AEDT)
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2165448243fso138481645ad.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Jan 2025 22:06:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738130770; x=1738735570; darn=lists.ozlabs.org;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=62HPA9SZHK46UH07M3yO3xbQvVeHfdm6K4iT8luGSJQ=;
        b=WbcaIjE2kApF5IrD9B89cvBlWYTnW7uI+IEWZEE/zJitEcoFCdYwv6RUsBuQIKGVyK
         FUKkiTAWkuxuYBenN7G9DwOS0vhLYme6PKFZd4XHJDhEGF7yGQWHJFLcpJp6gj66m+g6
         BcDx8RBUytPalXNj+va893egSQ67jFnkjPT/L58q+ZDETL19Nj74uZGst7sFyWyWochJ
         VYG+Mn0I+43y/dLC7v5XK3+F+aqc+qnCl+D874u2xhqrQDSPlFIdXUk9UhFgQGxi3GrT
         h6JbUboEQR8QXKETw8n50NdIRV8qmKHXiSka5Zs1tFGsFM6zZ8DtJoO/Vo/j78Q02jE+
         WBtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738130770; x=1738735570;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=62HPA9SZHK46UH07M3yO3xbQvVeHfdm6K4iT8luGSJQ=;
        b=aYrj37JY1qH/B7vpJnDwSMN3iP3HVdj/C2uaolfRoJW1W/gJ803iS4rEgQD50FHbkQ
         aykqi1aNwyaANAAfXaSZ+zRMlHwtA8gH8yqxXwVCDTKwXuwqJgUnALyep/ne2rUYn18Z
         zbKCc+uhKAf7DsJDka3ju0R+q247bhcA4wytUc6rE9PbS46GDPnRrEj3sVHkwU9Uu/+u
         /vBE6CW0JynxxZMpZqDS5UT59CFl6RQdZEwL0JUBLn+glwGRk5lWnI58BqhCBEM6TEnk
         bCDiQWoD1VE9tq5xt0ocKTjET7Ic6QJUXYw5V4z22E9R5gVelT9TBHm5wQ1QRqt6Uypi
         dRnA==
X-Forwarded-Encrypted: i=1; AJvYcCW3efDKYwuqN2oVjp8xL4n5b8//ksmvzCHPcjmGi0BRuWt3z+iW0K0NhBBL3eSEB3Becb74eTZiCsDBGbU=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyxN0tEqwNNUrxAw7pRQz4sT3C6E+Fa5n39KsLrfHoAkWJM+5uz
	P8V+pm6bxEUJfNLJgdIaV+tYMnRTuTp5kEVmo2qxm7AbGAQjEOYW2JDxPP5I
X-Gm-Gg: ASbGncupAuQTaGy6YBE2m4AjLBmwKh6AT1TT6Z9/RzBox9u3SlEu3N2EjjptHFu45Xz
	j/ayo0QSpqRP1rPFQGO07Zw/qJZalMJgfvFmQ+pwGuUpeVoKDrQdCoTpHUSWB/LDWqYPNLqGfOM
	9Sb+FrwZkCIkZ4l/nah9YxvJq0ASleOpHEZ7URfv4W8B5W52nHqVSkfmeoKbX13LI8ptrttMvYY
	mwgfWdTUpj2cm6WQuTY1wvY7Nx1GdTpvbeydcTW5DGyVP6T+kAbKO37ufjXCnt/Sljp+o7/EpCy
	dWmKeKsV
X-Google-Smtp-Source: AGHT+IH32E+HnWKdmiyLI/w82IJhr29OYWixPphJR38edqiB2/z72j97HVac3RrLoA1B+D/F/r2AMQ==
X-Received: by 2002:a05:6a00:2302:b0:72a:bc6a:3a85 with SMTP id d2e1a72fcca58-72fd0c72bbbmr2833956b3a.22.1738130769570;
        Tue, 28 Jan 2025 22:06:09 -0800 (PST)
Received: from localhost ([1.146.123.110])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72f8a7614dcsm10531081b3a.94.2025.01.28.22.06.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jan 2025 22:06:09 -0800 (PST)
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
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 29 Jan 2025 16:06:03 +1000
Message-Id: <D7EBXLB9JMZU.2T4WD5BP9C1GD@gmail.com>
Subject: Re: [PATCH 3/5] powerpc/microwatt: Define an idle power-save
 function
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Paul Mackerras" <paulus@ozlabs.org>, <linuxppc-dev@lists.ozlabs.org>
X-Mailer: aerc 0.19.0
References: <Z5lfDb8wsLlmSLBZ@thinks.paulus.ozlabs.org>
 <Z5lfyDQbGjxYT_eF@thinks.paulus.ozlabs.org>
In-Reply-To: <Z5lfyDQbGjxYT_eF@thinks.paulus.ozlabs.org>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Wed Jan 29, 2025 at 8:52 AM AEST, Paul Mackerras wrote:
> This uses the 'wait' instruction to pause instruction execution when
> idle until an interrupt occurs.
>
> Signed-off-by: Paul Mackerras <paulus@ozlabs.org>
> ---
>  arch/powerpc/platforms/microwatt/setup.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/arch/powerpc/platforms/microwatt/setup.c b/arch/powerpc/plat=
forms/microwatt/setup.c
> index 5e1c0997170d..97828a99780d 100644
> --- a/arch/powerpc/platforms/microwatt/setup.c
> +++ b/arch/powerpc/platforms/microwatt/setup.c
> @@ -34,10 +34,19 @@ static void __init microwatt_setup_arch(void)
>  	microwatt_rng_init();
>  }
> =20
> +static void microwatt_idle(void)
> +{
> +	if (!prep_irq_for_idle())
> +		return;
> +
> +	__asm__ __volatile__ ("wait");
> +}

Does wait cause MSR[EE] to be set? If not, do you need to use
prep_irq_for_idle_irqsoff() here maybe?

Thanks,
Nick

> +
>  define_machine(microwatt) {
>  	.name			=3D "microwatt",
>  	.compatible		=3D "microwatt-soc",
>  	.init_IRQ		=3D microwatt_init_IRQ,
>  	.setup_arch		=3D microwatt_setup_arch,
>  	.progress		=3D udbg_progress,
> +	.power_save		=3D microwatt_idle,
>  };


