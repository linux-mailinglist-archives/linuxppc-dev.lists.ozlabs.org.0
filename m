Return-Path: <linuxppc-dev+bounces-3218-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 595D99C8D32
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Nov 2024 15:48:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xq3160bDtz2xG5;
	Fri, 15 Nov 2024 01:48:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.219.173
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731595690;
	cv=none; b=nqCIVvnrOMwTDtDWHEkVRxidCYJtimCOal+7dUJrdUeWwZUoXjFYM3+fRi0kcUX9fTavm+CHEHWNr8d80dPHvAa8lvowtMV2ifNl6/xIny7lP8bs/qP33hrBA7C8tEDJKGChwsnEfy4Ze8IJfpfbRFDrJ2oh2eGN8HCzPhw/VMsrYVWIeb/M7QdqCwI/TIcvX1EGlih+6u8nTFT6jU23SisrOA6Jmk6C9F2CWx4ppd3xuDbeayW7LHpopZJV6x1cJOokXFI1lG556/UfKyeDhMPJjbsSJb74nSaR7rbY2EGPF4Rjp3kV2yqn8shiCK9YCIuommUQlfxytCLZ4Jq6PA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731595690; c=relaxed/relaxed;
	bh=PPExdKQ/tJobJg3y/a7AXkHlNJlN5qknfYvlBFbwJ1g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d0CAor32fyYpbf77/4IdgEu+zyvAWfotQqOo7rkuKqKPg5zWbE46XDc2sQg04PieAW6wbMKNJQxiMTmfRvEELcTv3d3kfSJkyXpslcCPAeB6E890740ZNMvxrBVAhMVxUA3cl8rVT9IZEdPIN/g6CHth+DvubwgFS9787TYGGbCgE+rNN1ZXMRPGsKHmpX/94zIk0xYW9Yr0Go6zq9UsOQAtrMYDn0xVu7ek0hiWYqh/Aw7GuMNsYcUaavyZt4svs6vzzs+kMvGZK2VMEY/Ytynrdd8LPzqyJs7/pRXiW7jCIwCXqQVPDYjibNYlXhRJkNhJu1CYbaWLVvFmK8EBZQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass (client-ip=209.85.219.173; helo=mail-yb1-f173.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.219.173; helo=mail-yb1-f173.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xq3150L5sz2xFq
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Nov 2024 01:48:07 +1100 (AEDT)
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-e381460f782so607786276.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Nov 2024 06:48:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731595685; x=1732200485;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PPExdKQ/tJobJg3y/a7AXkHlNJlN5qknfYvlBFbwJ1g=;
        b=PuMDDt7xGXwhMV+6zAlLJVgE1eV2GA9MfTCfYrTXwV+uhjkRpWKceAHWghZb/plZpp
         zBajJ7dnBwchOwxgTx9Wc0E3kRQ6hFpbDk1WFiDjyAZLax6wZu8FkfvbdqyelAjQ4Zmd
         JqKznQcfmewkVbWWo96zb+2hxEuHtOXiYTgyP1QMj9bKs1MgNoRU/pkoboSwxFZTW9sI
         X+thxm+1MAF99zofvKrtlqNZclFeR9NnAHAJVdw1t7Qj+1s+bWy20fxJlPGf5V55mAm8
         R7P9BDdUe7ALMo1SIyMzNl8fF2xP4L/9PqC39dT3DDl8cH1Q7DFTsjk8fUKRyYBXsyTJ
         C4/g==
X-Gm-Message-State: AOJu0YwAyrvxq+sZVIvyIKjiNMv+me0eyMIR6rmTuRiMNdMwQkkDdOEn
	u0YU6gF21bhBvvOhDwBHfdrSEbZ7fWGGFoCmRaEsaOm1njswpSkcEqk71OAZ
X-Google-Smtp-Source: AGHT+IE/PD3P2N3hMZp+CyMIqQ4LgCCihSzgAbI7wOTW7r6vdqRuFbF2IIL4HxiCF9ZMaXQOB3fsfw==
X-Received: by 2002:a05:6902:a06:b0:e2b:a8b3:d650 with SMTP id 3f1490d57ef6-e337f8815b4mr22885128276.24.1731595684693;
        Thu, 14 Nov 2024 06:48:04 -0800 (PST)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com. [209.85.128.172])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e3815477c9bsm324790276.56.2024.11.14.06.48.03
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Nov 2024 06:48:03 -0800 (PST)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-6e9f8dec3daso6036957b3.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Nov 2024 06:48:03 -0800 (PST)
X-Received: by 2002:a05:690c:3684:b0:6e7:d974:8d05 with SMTP id
 00721157ae682-6eaddd86fffmr247240007b3.4.1731595683535; Thu, 14 Nov 2024
 06:48:03 -0800 (PST)
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
References: <20241114131114.602234-1-mpe@ellerman.id.au> <20241114131114.602234-9-mpe@ellerman.id.au>
In-Reply-To: <20241114131114.602234-9-mpe@ellerman.id.au>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 14 Nov 2024 15:47:52 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWtqNsmO=t=OF-2R-gA+khuKiGQOrBXRigE62bNjnUxPg@mail.gmail.com>
Message-ID: <CAMuHMdWtqNsmO=t=OF-2R-gA+khuKiGQOrBXRigE62bNjnUxPg@mail.gmail.com>
Subject: Re: [RFC PATCH 09/10] i2c: Remove I2C_HYDRA
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, arnd@arndb.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=0.2 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hi Michael,

On Thu, Nov 14, 2024 at 2:11=E2=80=AFPM Michael Ellerman <mpe@ellerman.id.a=
u> wrote:
> The i2c-hydra driver depends on PPC_CHRP which has now been removed,
> remove the driver also.
>
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>

Thanks for your patch!

> --- a/drivers/i2c/busses/i2c-hydra.c
> +++ /dev/null

> -#include <asm/hydra.h>

Looks like this was the last real user of arch/powerpc/include/asm/hydra.h.
drivers/scsi/mesh.c still includes it, but I don't see why it was ever
needed in upstream.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

