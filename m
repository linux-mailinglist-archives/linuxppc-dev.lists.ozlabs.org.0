Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E80F567458
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Jul 2022 18:30:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lcp7k3cFHz3btr
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Jul 2022 02:30:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=VQZeK+KO;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=robh@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=VQZeK+KO;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lcp761fpPz2yn5
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Jul 2022 02:30:10 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 642A5B8188D
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Jul 2022 16:30:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23CF0C341CF
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Jul 2022 16:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657038606;
	bh=aQRQTfK/Rd6YeI/kH1ApJs/gjWfPr8CLVdRZp1kXOGw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=VQZeK+KODTw132J4xGK8D9JxfXIfKOuuQ9lN+NaqQRcAwu+enUUO5uLG3bYHdh0wE
	 J+2oPh/BODb+NlJ5tNXav4xNcU6qWZc9GWveKj+7AZn+nMaZrQQKDojz2+KV/HkFit
	 3pLYo3C2Y53+YrUW9+pwMQX2IdaTv5fCbnzQgMzWxPc85QCAnzPT5LaDD6xW9JGeN0
	 X60GtlRxV+1dxD+iNB1CIKmZX6G4p+xBCA6GSBqr+IULI4xj4A5kUR3zj3TPh7NHWy
	 w7PbhAYGhh3hCFCm1OOeMpQbuhlVTUzAu6mIiZm8gnJHeOacTWedNpz1ZlkRGTS9nw
	 Se2PIFwQ1atkg==
Received: by mail-vs1-f50.google.com with SMTP id d187so12406163vsd.10
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 05 Jul 2022 09:30:06 -0700 (PDT)
X-Gm-Message-State: AJIora+yPeQsFB5FRUj323JAG+zHtLoESbyFBg9lFW4KTKoEOzxKp+ot
	ylz5w26zkuJJgJcwdxuyG4hhzcEdZ7Mgkxv0bw==
X-Google-Smtp-Source: AGRyM1sVtLtjcERxRubM7SzrfUKl6HHgPc94yiLBKPDEt0d6NiAQMFMB2d4xg2djNBPEW9awrYMdYnyf4N/lw/t+Nq8=
X-Received: by 2002:a67:d194:0:b0:357:8ea:5554 with SMTP id
 w20-20020a67d194000000b0035708ea5554mr175401vsi.0.1657038605004; Tue, 05 Jul
 2022 09:30:05 -0700 (PDT)
MIME-Version: 1.0
References: <20220702220355.63b36fb8@Cyrus.lan>
In-Reply-To: <20220702220355.63b36fb8@Cyrus.lan>
From: Rob Herring <robh@kernel.org>
Date: Tue, 5 Jul 2022 10:29:53 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+K7MN6kzMshNtBXYsM=1AKyJFL7OQpsevba2xmKz0=sg@mail.gmail.com>
Message-ID: <CAL_Jsq+K7MN6kzMshNtBXYsM=1AKyJFL7OQpsevba2xmKz0=sg@mail.gmail.com>
Subject: Re: [PATCH v3] drivers/usb/host/ehci-fsl: Fix interrupt setup in host mode.
To: Darren Stevens <darren@stevens-zone.net>
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
Cc: Shawn Guo <shawnguo@kernel.org>, Linux USB List <linux-usb@vger.kernel.org>, Yang-Leo Li <leoyang.li@nxp.com>, Scott Wood <oss@buserror.net>, Alan Stern <stern@rowland.harvard.edu>, Christian Zigotzky <chzigotzky@xenosoft.de>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Jul 2, 2022 at 3:04 PM Darren Stevens <darren@stevens-zone.net> wrote:
>
> In patch a1a2b7125e10 (Drop static setup of IRQ resource from DT
> core) we stopped platform_get_resource() from returning the IRQ, as all
> drivers were supposed to have switched to platform_get_irq()
> Unfortunately the Freescale EHCI driver in host mode got missed. Fix
> it.
>
> Fixes: a1a2b7125e10 (Drop static setup of IRQ resource from DT core)
> Reported-by: Christian Zigotzky <chzigotzky@xenosoft.de>
> Suggested-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Darren Stevens <darren@stevens-zone.net>
> ---
>  v3 - Corrected resource allocation in fsl-mph-dr-of.c
>
>  v2 - Fixed coding style, removed a couple of unneeded initializations,
>       cc'd Layerscape maintainers.
>
> Tested on AmigaOne X5000/20 and X5000/40 Contains code by Rob Herring
> (in fsl-mph-dr-of.c)

Thanks for fixing.

Acked-by: Rob Herring <robh@kernel.org>
