Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 13AC01A2F1B
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Apr 2020 08:22:52 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48yWKM1NxlzDrB8
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Apr 2020 16:22:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::142;
 helo=mail-il1-x142.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=MlrdG9R8; dkim-atps=neutral
Received: from mail-il1-x142.google.com (mail-il1-x142.google.com
 [IPv6:2607:f8b0:4864:20::142])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48yWHK0xKnzDr8D
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Apr 2020 16:21:00 +1000 (AEST)
Received: by mail-il1-x142.google.com with SMTP id a6so9229771ilr.4
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 08 Apr 2020 23:21:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=pZ4DWqLnGcBZqPy5SWPS8IgowhAn9/4UN8cxqBn9TZ8=;
 b=MlrdG9R8zcLHeS0TBNnhj/LYBndV39219+ZbY78ax+KFsgjFXSGfE/9qlhsHhF3WFh
 Cx7G+oCRe8Qs7zTCmIJBDtkDmGkVmsm6rHpbgHq1j75lmjMM8P9Xz3q6tg8994YUHttG
 IDlkQntqw8+Wr6U0Ja+RGVZOSRNsHJD77Yi+kfYlpUj2NN3ZhE166ZwBQRgW3FSHI10+
 vP1/CNZp1gvVefD/Mw4/4RX7OndWKJvPLHDD+5j2aET9XIidZhlLy+Y9FFMgrOvtM8Tj
 fVgujuVZjJx5rLY/xu0ha7oHPqXx9iUuGvvSdpbCyWL33wSzAq+4ejB7SS77WhAgxRdL
 O6RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=pZ4DWqLnGcBZqPy5SWPS8IgowhAn9/4UN8cxqBn9TZ8=;
 b=BnZ7OVlEf4m/2QTDLVBd6Uia/7+IAGo0eoqzC4UbveY9t4s/6BHdhnz0gAfduGROsB
 mcPcjdsv8M2iK+YtXogJ3Rh4XxBy0VXVx2Ueo0bM/Ik4eBHQEHASyaIfZ9ELENoabsN1
 GWhKvsNdjnqbE5BschtRscL79pyGqLWtfk1TAlsEiu8AwRvfZEymYLBmQIPqxpdD4BTx
 mGwcjueugSuJZ2KZbGbnSWKopW5v8R0dDYntTofnqqZi5yu5rcgMeev6huk5FF42ZO5I
 1iP3mOBVmbHpS94+BSUOshkdjQF+MY1YHFsYMgtSQyFy4wESSLPbpXuoYPUPbU3s2ZnA
 iQfA==
X-Gm-Message-State: AGi0PubZ4MOseFE6CKo1Gt7AppFSIrx87wODMGtj7fWDVhZAJLiIE6qP
 NYSTKh8TKrrJYQy4AEw34/qrSzBjnj1JU4A1HxO3qQ==
X-Google-Smtp-Source: APiQypJd33gGWY+DXsI0dMD5DZggk9qzCNWAniSCfqJTqyokchVJEweIJx0JzTJW4hPgabIIHD62w7rCta2CH85vhlQ=
X-Received: by 2002:a92:4018:: with SMTP id n24mr11047744ila.185.1586413257226; 
 Wed, 08 Apr 2020 23:20:57 -0700 (PDT)
MIME-Version: 1.0
References: <20200409061337.9187-1-oohall@gmail.com>
In-Reply-To: <20200409061337.9187-1-oohall@gmail.com>
From: "Oliver O'Halloran" <oohall@gmail.com>
Date: Thu, 9 Apr 2020 16:20:45 +1000
Message-ID: <CAOSf1CEWSMAMNP57U4otRZU5wwbLy4=1OoZFSTvZm=naLKXyPg@mail.gmail.com>
Subject: Re: [PATCH] powernv/pci: Print an error when device enable is blocked
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Apr 9, 2020 at 4:13 PM Oliver O'Halloran <oohall@gmail.com> wrote:
>
> If the platform decides to block enabling the device nothing is printed
> currently. This can lead to some confusion since the dmesg output will
> usually print an error with no context e.g.
>
>         e1000e: probe of 0022:01:00.0 failed with error -22
>
> This shouldn't be spammy since pci_enable_device() already prints a
> messages when it succeeds.
>
> Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
> ---
>  arch/powerpc/platforms/powernv/pci-ioda.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/arch/powerpc/platforms/powernv/pci-ioda.c b/arch/powerpc/platforms/powernv/pci-ioda.c
> index cda0933..17fdf46 100644
> --- a/arch/powerpc/platforms/powernv/pci-ioda.c
> +++ b/arch/powerpc/platforms/powernv/pci-ioda.c
> @@ -3296,8 +3296,10 @@ static bool pnv_pci_enable_device_hook(struct pci_dev *dev)
>                 return true;
>
>         pdn = pci_get_pdn(dev);
> -       if (!pdn || pdn->pe_number == IODA_INVALID_PE)
> +       if (!pdn || pdn->pe_number == IODA_INVALID_PE) {
> +               pci_err("pci_enable_device() blocked, no PE assigned.\n");
Maybe I should start compiling my code before I sent it out. Maybe.

>                 return false;
> +       }
>
>         return true;
>  }
> --
> 2.9.5
>
