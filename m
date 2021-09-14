Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 81B8D40AEE8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Sep 2021 15:29:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H842r3j8vz2ynj
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Sep 2021 23:29:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=jDEbjtKp;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::82d;
 helo=mail-qt1-x82d.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=jDEbjtKp; dkim-atps=neutral
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com
 [IPv6:2607:f8b0:4864:20::82d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H842B0dCSz2yHP
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Sep 2021 23:29:20 +1000 (AEST)
Received: by mail-qt1-x82d.google.com with SMTP id c19so11365900qte.7
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Sep 2021 06:29:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4FgA1glgZpagJ46LOd0B4shdbVImYVYjwX8zKpoYQeE=;
 b=jDEbjtKplhqhXyAvHLkStbE1o4RIlBRFgSo8rAoCRc1dsvJ1o73j8m29Rhs0b4lI3T
 j/SV1Xmpm9UMXh5D8ccZ0WW2Uw01tMueV8W9uhphq8igdxLedOnmf9g8Tl5zPzKcf+Vs
 tXtDi+9H7Syf6f3Hd6XW/eTqtZ0nH5uPN2/Mg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4FgA1glgZpagJ46LOd0B4shdbVImYVYjwX8zKpoYQeE=;
 b=taGkEo0kxtNbYmcs2UOgif94wz7fOS73+nO/m+L62NkxU0b6R/WLXgdzKCg//o8Ndk
 jAtWexJd7cTHEM8ihFDA+vXofw06YfJIPYoiZd4E7nYlx9qRPJea8VQWFvDUX9TdVvyF
 Epkjz1ScTxE2pNAToluJqUs5arHWodXAk1zBlsdwRaNdotJkHnSXRhi95ye/ZmHE4PYe
 m+Inr4LNuCVNFLuyUIvFBzxkQYtMth/SJjNA1qDFH1Wdvo9HCBn22iBJ5wsxJH5gHrF5
 KQdsApvUWjRnpH5uePThWDrxsLTBBb91DoKME2cGe1bB895vIMTNZiXD7Ix3G5D6bu8Z
 Ds5w==
X-Gm-Message-State: AOAM5311vuaLhLUctMnu2RUFBrANLm9IVEJ2vayAnwThGV+uObcvAwRd
 oJiddJ3D/iO/3/tVq8NaLa0qDCy7oAKNXFi01Q0=
X-Google-Smtp-Source: ABdhPJypqmbCZYSk67vRVazqeAmaKYPsT6JfdEZ1xwf7q6WP0XaamibAsFO4kXA1PTCxstxVix3KgjhCgFGfB2W7d9c=
X-Received: by 2002:ac8:7dca:: with SMTP id c10mr4542279qte.259.1631626155462; 
 Tue, 14 Sep 2021 06:29:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210914101646.30684-1-hegdevasant@linux.vnet.ibm.com>
In-Reply-To: <20210914101646.30684-1-hegdevasant@linux.vnet.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 14 Sep 2021 13:29:03 +0000
Message-ID: <CACPK8XdamQu4B+6keMjjn4EXyR1mx+r6Y5z03-V0dJm+6gqxTA@mail.gmail.com>
Subject: Re: [PATCH trivial] powerpc/powernv/dump: Fix typo is comment
To: Vasant Hegde <hegdevasant@linux.vnet.ibm.com>
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 14 Sept 2021 at 10:17, Vasant Hegde
<hegdevasant@linux.vnet.ibm.com> wrote:
>
> Signed-off-by: Vasant Hegde <hegdevasant@linux.vnet.ibm.com>

There's a typo in your commit message :)

> ---
>  arch/powerpc/platforms/powernv/opal-dump.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/powerpc/platforms/powernv/opal-dump.c b/arch/powerpc/platforms/powernv/opal-dump.c
> index 00c5a59d82d9..717d1d30ade5 100644
> --- a/arch/powerpc/platforms/powernv/opal-dump.c
> +++ b/arch/powerpc/platforms/powernv/opal-dump.c
> @@ -419,7 +419,7 @@ void __init opal_platform_dump_init(void)
>         int rc;
>         int dump_irq;
>
> -       /* ELOG not supported by firmware */
> +       /* Dump not supported by firmware */
>         if (!opal_check_token(OPAL_DUMP_READ))
>                 return;
>
> --
> 2.31.1
>
