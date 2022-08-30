Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C2445A6927
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Aug 2022 19:03:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MHDC431Nvz3c7k
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Aug 2022 03:02:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=rMMt+yf0;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=timur@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=rMMt+yf0;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MHDBP6l2jz2xjj
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Aug 2022 03:02:21 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 05F78B80EF4
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Aug 2022 17:02:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9E21C433D6
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Aug 2022 17:02:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1661878935;
	bh=zuE5tGcx5l76KiYALJlcPI3yxgrWlUht/PYPUm0d3Pc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=rMMt+yf0YcS4YEGrBZB3F8AKE8BCcZVzmWFFz5+lOWh5M6+cnzxTA/5Ilr29ggpTd
	 LTm988Wa1stViNGxb3TSbRxMaU52eIyctqWYLZMWqtWNugkSZ+eCqdjwCkbbYYnUC3
	 FNym7noYDd09zQb/M0pWXTnT1+JCbkTWwgPkxWkcZEcOoeoEv5qMNvLu/adXRKJMFZ
	 2wefNSf3OAKwz1WBKSYA0MecFVgpkes/qc2riKV40RTnuaF4q4BaKXAJWjEwunPw8+
	 g16VRLATLmKPNQDaoAxu+JtNKgVC0Jt3ia4/ubETBpdjZCAz3dAe8W6/dMBVMBYLQ/
	 3ekIe/uXwGWTA==
Received: by mail-ot1-f51.google.com with SMTP id l5-20020a05683004a500b0063707ff8244so8485666otd.12
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Aug 2022 10:02:15 -0700 (PDT)
X-Gm-Message-State: ACgBeo3ztKsdOqtO9EVVdaZK1YYUQeygPFPmFOpAqS1ajj6SCkI2WTm8
	aTPDHM99zbgWi6pEcE9F8r5LMoKcWnNRcVFhKQI=
X-Google-Smtp-Source: AA6agR6f59zdB8lJJrFAGXPCZn/Rpe0ho5wIpCSfjqQnPjR+27z8ENLOP8XFp8/Lw2qT/IwjRESPQOWObdDrjOI8nmU=
X-Received: by 2002:a05:6830:b85:b0:605:4e76:f077 with SMTP id
 a5-20020a0568300b8500b006054e76f077mr8547324otv.211.1661878934868; Tue, 30
 Aug 2022 10:02:14 -0700 (PDT)
MIME-Version: 1.0
References: <20220830084925.5608-1-ilpo.jarvinen@linux.intel.com> <20220830084925.5608-2-ilpo.jarvinen@linux.intel.com>
In-Reply-To: <20220830084925.5608-2-ilpo.jarvinen@linux.intel.com>
From: Timur Tabi <timur@kernel.org>
Date: Tue, 30 Aug 2022 12:01:37 -0500
X-Gmail-Original-Message-ID: <CAOZdJXXDaqG5uR-A3gC4qrFBwtbm7ZwFp0oXwUYGVDU=Ru-gPQ@mail.gmail.com>
Message-ID: <CAOZdJXXDaqG5uR-A3gC4qrFBwtbm7ZwFp0oXwUYGVDU=Ru-gPQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] serial: ucc_uart: Remove custom frame size calculation
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
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
Cc: Timur Tabi <timur@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, PowerPC Mailing List <linuxppc-dev@lists.ozlabs.org>, lkml <linux-kernel@vger.kernel.org>, Andy Shevchenko <andy.shevchenko@gmail.com>, linux-serial@vger.kernel.org, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Jiri Slaby <jirislaby@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Aug 30, 2022 at 3:49 AM Ilpo J=C3=A4rvinen
<ilpo.jarvinen@linux.intel.com> wrote:
>
> The number of bits can be calculated using tty_get_frame_size(), no
> need for the driver to do it on its own.
>
> Also remove a comment on number of bits that doesn't match the code nor
> the comment on ucc_uart_pram's rx_length ("minus 1" part differs). That
> comment seems a verbatim copy of that in cpm_uart/cpm_uart_core.c
> anyway so perhaps it was just copied over w/o much thinking.
>
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> Signed-off-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>

Acked-by: Timur Tabi <timur@kernel.org>
