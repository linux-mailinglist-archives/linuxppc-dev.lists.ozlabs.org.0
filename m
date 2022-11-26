Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F2EC2639863
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Nov 2022 23:16:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NKR0l6Gxsz3f5b
	for <lists+linuxppc-dev@lfdr.de>; Sun, 27 Nov 2022 09:16:55 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=nifty.com header.i=@nifty.com header.a=rsa-sha256 header.s=dec2015msa header.b=r4RPRmXr;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=softfail (domain owner discourages use of this host) smtp.mailfrom=kernel.org (client-ip=202.248.20.72; helo=condef-07.nifty.com; envelope-from=masahiroy@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nifty.com header.i=@nifty.com header.a=rsa-sha256 header.s=dec2015msa header.b=r4RPRmXr;
	dkim-atps=neutral
Received: from condef-07.nifty.com (condef-07.nifty.com [202.248.20.72])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NKQzh61vfz3bjd
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 27 Nov 2022 09:16:00 +1100 (AEDT)
Received: from conssluserg-01.nifty.com ([10.126.8.80])by condef-07.nifty.com with ESMTP id 2AQMELIZ027183
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 27 Nov 2022 07:14:21 +0900
Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45]) (authenticated)
	by conssluserg-01.nifty.com with ESMTP id 2AQMDuo3012287
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 27 Nov 2022 07:13:57 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com 2AQMDuo3012287
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
	s=dec2015msa; t=1669500837;
	bh=s0a/zjAuK1ndkJmMZDENgzv3OKHe1ZW/pI+qHIjiGXc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=r4RPRmXrX2+AHDAToBmubkRg7hqChal7AwE/5XsNlEXRH4u+hVz9/l+w9P+qTSVJD
	 uMYcUjwZzYuw9gkg7lVWjSSzpQX63kvmPMf15/0lwmAuayYD4xck+oggIIUEOLJ8Gn
	 4KjPJBI8/mhgWGytSLujQUunIrfs7vG6A4gbpFlKWiD2hVMfqKY7/KF+WII1CZG/pL
	 8zA1mlFtp5wX9V0/x3LfmenKbK6Dcc26QcmPbkhdHUToSIB8XveWtDUVMXsvwVMhRq
	 smwHUHz+mzbxry6N6qF78pnzxcAkiHd632TDf8LXrzmBiq+wGf/YQsNr3V3rV8YWYI
	 JqRDS/x9kWffw==
X-Nifty-SrcIP: [209.85.161.45]
Received: by mail-oo1-f45.google.com with SMTP id e11-20020a4ab14b000000b0049be568062bso1134458ooo.4
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 26 Nov 2022 14:13:57 -0800 (PST)
X-Gm-Message-State: ANoB5pm/rRhwG4aZ/XiZUE1QCLvJXac7OxW1/5jz7wU1kf9pu46gwDD+
	u5V0LRTRfEiuMtCiFOPyZqhmvXw0OaWadoSHX7g=
X-Google-Smtp-Source: AA0mqf76l2wK3mKIAJDJVFArHaLGuBw/aE77Bp4mfFOjNad9WnYlYwpqmqrPYE5zkcyqlZw2pKl6aDCh1wOE1MLpfdw=
X-Received: by 2002:a4a:b145:0:b0:49f:449a:5f6c with SMTP id
 e5-20020a4ab145000000b0049f449a5f6cmr10807854ooo.93.1669500836106; Sat, 26
 Nov 2022 14:13:56 -0800 (PST)
MIME-Version: 1.0
References: <20221126051002.123199-1-linux@weissschuh.net>
In-Reply-To: <20221126051002.123199-1-linux@weissschuh.net>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sun, 27 Nov 2022 07:13:19 +0900
X-Gmail-Original-Message-ID: <CAK7LNASre69jM6symHY3h2fDPmN=kmZqOVGVrrVAvZ+8UzXxqA@mail.gmail.com>
Message-ID: <CAK7LNASre69jM6symHY3h2fDPmN=kmZqOVGVrrVAvZ+8UzXxqA@mail.gmail.com>
Subject: Re: [PATCH 1/3] firmware_loader: remove #include <generated/utsrelease.h>
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
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
Cc: Russ Weight <russell.h.weight@intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, Luis Chamberlain <mcgrof@kernel.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Nov 26, 2022 at 2:10 PM Thomas Wei=C3=9Fschuh <linux@weissschuh.net=
> wrote:
>
> utsrelease.h is potentially generated on each build.
> By removing this unused include we can get rid of some spurious
> recompilations.
>
> Signed-off-by: Thomas Wei=C3=9Fschuh <linux@weissschuh.net>
> ---

Reviewed-by: Masahiro Yamada <masahiroy@kernel.org>


>  drivers/base/firmware_loader/firmware.h | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/drivers/base/firmware_loader/firmware.h b/drivers/base/firmw=
are_loader/firmware.h
> index fe77e91c38a2..bf549d6500d7 100644
> --- a/drivers/base/firmware_loader/firmware.h
> +++ b/drivers/base/firmware_loader/firmware.h
> @@ -9,8 +9,6 @@
>  #include <linux/list.h>
>  #include <linux/completion.h>
>
> -#include <generated/utsrelease.h>
> -
>  /**
>   * enum fw_opt - options to control firmware loading behaviour
>   *
>
> base-commit: 0b1dcc2cf55ae6523c6fbd0d741b3ac28c9f4536
> --
> 2.38.1
>


--=20
Best Regards
Masahiro Yamada
