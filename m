Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BD38A14D700
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Jan 2020 08:24:08 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 487X0Q1ffJzDqf2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Jan 2020 18:24:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::d44;
 helo=mail-io1-xd44.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=OCWhpLHh; dkim-atps=neutral
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com
 [IPv6:2607:f8b0:4864:20::d44])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 487W7S46tPzDqV3
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Jan 2020 17:45:07 +1100 (AEDT)
Received: by mail-io1-xd44.google.com with SMTP id e7so2714755iof.11
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jan 2020 22:45:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=w2ejpwzpXnK4qz/Z7+jqv9oOfCgMOsuwpP4u3KSNIHc=;
 b=OCWhpLHhEaxamGDkENubkmAOvSlJ/Ga6kls3U5eyOM5hYbQuUZn7jqEzn+sdcbPHNj
 NS/qTThCeu34vduVA57QONuRc43HUVTlzuyv0ZFr5ri5/hp9DFu5lyJfihSBIqZG4v2Z
 U0S60phez8bDyO4XD7BxqtXY/b2cSliUmFiNmozvFvufkWoJ4+LYV8lltOBqi7sWNsCk
 IxKIl7WmLLOccyuKrgXG8T0TXt7aidNkjmvxCgV7DCA7WvJq2V1SASuvKCXreCyL38Pb
 U+JzsXbKS+0g/6COPy5tP6hFom3P5moYZG8Q8mjh6SeS1lHU0+aogYI89ok8J8D2+mOC
 8j4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=w2ejpwzpXnK4qz/Z7+jqv9oOfCgMOsuwpP4u3KSNIHc=;
 b=Ml7oqC0dD2b4NW7ALmutA4Jpcr+faLJomc6+iqohjsI25vRX+sb4v4iMWATQ9vLXBh
 FdkIUDMhlOl7MhJqy7SIcoyv9n+oq1Sc3NqchbdYIowZftLTvfxkSMUlNwj2ju8fkGKm
 ufWHiFnZgPsz2z2waV4D4KnY/aUZGcXlU/O+puaK19wZTJttTxihRGD34VAI3s1KoHHT
 PWaABp2DlKsGuV/vf4q3RJx0LGRipoZXtamsJp8w8HjtS4Ve7xU6lZ86pVw8Dw+tDTTt
 0+H3k61sSjAYjjJrPw/Pi4rnyjnkRQ54tgJNVfNjoiZznjoeCi0h8srDKmMz8gFmcIAj
 fC5A==
X-Gm-Message-State: APjAAAUlF1ONXXm5w/8dPbgsnbD78WrrxeLTQWUA0wa57zds7Vaa/AME
 ob3xX7XEQYVPH42b7YqIUAKKeHqGdSPoBIMMXL/X3A==
X-Google-Smtp-Source: APXvYqynKlbVeTVRPzCQzvsDa5TndvISPZvfAZYrNqK+tpi8oO7tndcOwLwc9BmSyzjZjP5GVbMJ7yLqcC0n+O+AaF4=
X-Received: by 2002:a5d:8043:: with SMTP id b3mr3013896ior.192.1580366703469; 
 Wed, 29 Jan 2020 22:45:03 -0800 (PST)
MIME-Version: 1.0
References: <20200130063153.19915-1-oohall@gmail.com>
 <20200130063153.19915-2-oohall@gmail.com>
In-Reply-To: <20200130063153.19915-2-oohall@gmail.com>
From: "Oliver O'Halloran" <oohall@gmail.com>
Date: Thu, 30 Jan 2020 17:44:52 +1100
Message-ID: <CAOSf1CHr-du-RtLzVr=3eJxiAqe8LSMxnH7Qi7jHA35JXsgoFA@mail.gmail.com>
Subject: Re: [PATCH 2/2] pseries/makefile: Remove CONFIG_PPC_PSERIES check
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

On Thu, Jan 30, 2020 at 5:32 PM Oliver O'Halloran <oohall@gmail.com> wrote:
>
> The platform makefile (arch/powerpc/platforms/pseries/Makefile) is only

doh

s/platform/pseries/

> included by the platform makefile (arch/powerpc/platform/Makefile) when
> CONFIG_PPC_PSERIES is selected, so checking for CONFIG_PPC_PSERIES in the
> pseries makefile is pointless.
>
> Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
> ---
>  arch/powerpc/platforms/pseries/Makefile | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/arch/powerpc/platforms/pseries/Makefile b/arch/powerpc/platforms/pseries/Makefile
> index a3c74a5..c8a2b0b 100644
> --- a/arch/powerpc/platforms/pseries/Makefile
> +++ b/arch/powerpc/platforms/pseries/Makefile
> @@ -29,6 +29,4 @@ obj-$(CONFIG_PPC_SPLPAR)      += vphn.o
>  obj-$(CONFIG_PPC_SVM)          += svm.o
>  obj-$(CONFIG_FA_DUMP)          += rtas-fadump.o
>
> -ifdef CONFIG_PPC_PSERIES
>  obj-$(CONFIG_SUSPEND)          += suspend.o
> -endif
> --
> 2.9.5
>
