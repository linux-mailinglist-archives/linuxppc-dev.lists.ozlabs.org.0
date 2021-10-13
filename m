Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ED0242CF29
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Oct 2021 01:23:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HV7qr5TDvz3bYD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Oct 2021 10:23:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=OqT1oEZA;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=robh+dt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=OqT1oEZA; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HV7qB1rpRz2yMs
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Oct 2021 10:22:30 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id B7776610CE
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Oct 2021 23:22:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634167346;
 bh=K5KsIlS9mVWjzKzbP+EwldW57G6BoWfvsfYiavmtyik=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=OqT1oEZAJlox3bcvPNUTZGrXxa3T7rZNlH1iqIqhncwVz4rV7GWn3h18yr5y1Ha9u
 u1d6xaO0Ih6LONwBGwEUJOvToQRNlDT9Mm3o7x3GjDCsmAhznIfoiNgOe5hjM9o33d
 RPhyzETlV0NPJahQqWZ9HxZK8QRNNqkYxMtlZcWblbnCAtuROO3qCt2Tsw+Ojem3qo
 O9UmnxtUsiC0iYt5lfaBivvZru/iKR40sUygK1aUjYb1mYrDmy+yQtI2cOfWYER6iM
 Cr55v4KCxM5ZQgfdbNdEYA8r26zyvXLnWMF1hoLNN+VJOpQ7IDyGKhVmTivORok7MI
 kGbasftgTfHWw==
Received: by mail-ed1-f45.google.com with SMTP id z20so16761247edc.13
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Oct 2021 16:22:26 -0700 (PDT)
X-Gm-Message-State: AOAM533ZkcpJOjcNAXBPGSxeHuhAOqLm6R26jGTwgTxNhscFLURQNs73
 7EAPMPovcegsJxq9ZdjKZJx98s2aa1br2Rd7AQ==
X-Google-Smtp-Source: ABdhPJyUy4HLQa9Am8aZBwEmHklQVZ9rPvCBp9S58spLgaM4WzZGcyNsKEEty06SU62BPKNJ///cgxizZ5xdwFC1eI0=
X-Received: by 2002:a05:6402:4382:: with SMTP id
 o2mr3382495edc.271.1634167345178; 
 Wed, 13 Oct 2021 16:22:25 -0700 (PDT)
MIME-Version: 1.0
References: <20211008164728.30e3d3a3@canb.auug.org.au>
 <20211011082704.3cff4568@canb.auug.org.au>
 <CAL_JsqJE_GHnehBz-71BOGXfjm6q2p0u6FQA5KwO8zK_i1LpMQ@mail.gmail.com>
 <CAK8P3a1EcNuxT-w-8w-HDr2+idsP=vFZ3Cn27fX7o56GOuu_Cg@mail.gmail.com>
 <20211014001232.3becbe99@crub>
 <CAL_JsqJSqqYya-xe8YQs0-0KTF3LzwkyGD_2dUxQY9SKVV7RMw@mail.gmail.com>
 <20211014002841.7c4ccf2f@crub>
In-Reply-To: <20211014002841.7c4ccf2f@crub>
From: Rob Herring <robh+dt@kernel.org>
Date: Wed, 13 Oct 2021 18:22:13 -0500
X-Gmail-Original-Message-ID: <CAL_JsqL1uKAOR3z8freTWo_GNEtRAeYcgTuRF6s3X6DOvzCFww@mail.gmail.com>
Message-ID: <CAL_JsqL1uKAOR3z8freTWo_GNEtRAeYcgTuRF6s3X6DOvzCFww@mail.gmail.com>
Subject: Re: linux-next: build warnings in Linus' tree
To: Anatolij Gustschin <agust@denx.de>
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 PowerPC <linuxppc-dev@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Arnd Bergmann <arnd@arndb.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Oct 13, 2021 at 5:28 PM Anatolij Gustschin <agust@denx.de> wrote:
>
> On Wed, 13 Oct 2021 17:17:25 -0500
> Rob Herring robh+dt@kernel.org wrote:
> ...
> >In general, you shouldn't need to be changing the drivers. Can you
> >tell me which warnings need driver changes?
>
> ethernet and mdio drivers share registers, so they use same unit-address:
>
> arch/powerpc/boot/dts/tqm5200.dts:127.17-133.5: Warning (unique_unit_address): /soc5200@f0000000/ethernet@3000: duplicate unit-address (also used in node /soc5200@f0000000/mdio@3000)
>
> arch/powerpc/boot/dts/mpc5200b.dtsi:218.23-223.5: Warning (unique_unit_address): /soc5200@f0000000/ethernet@3000: duplicate unit-address (also used in node /soc5200@f0000000/mdio@3000)
>   also defined at arch/powerpc/boot/dts/digsy_mtc.dts:60.17-62.5

Those are W=1 warnings and off by default. You shouldn't fix them if
it breaks compatibility with the driver.

Rob
