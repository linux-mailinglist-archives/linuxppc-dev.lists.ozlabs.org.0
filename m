Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1351E6D2DF6
	for <lists+linuxppc-dev@lfdr.de>; Sat,  1 Apr 2023 05:32:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PpN4z6z89z3fXT
	for <lists+linuxppc-dev@lfdr.de>; Sat,  1 Apr 2023 14:32:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=lpLjgFFh;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=timur@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=lpLjgFFh;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PpN463R6Vz3f4k
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  1 Apr 2023 14:31:34 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5A8AD62641
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  1 Apr 2023 03:31:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EAA7C4339E
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  1 Apr 2023 03:31:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680319889;
	bh=Q7c4c+RY22KeWJ/6uXRisSnChQKt8LeWKraYLrFdG44=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=lpLjgFFhbpZegkAbU50XIUAWnA6183iLf9IWaR0Ns2TTx0If7l+GDWiC7/rMIIgVs
	 qxF8+XF8zVAk6bDb+tqok1VyIPRQ6cXq7GlfR2ayuC2q4wCnQfxTvPHQ41ohMCPgnH
	 YByuXDCG7phn0nl9c7NveWt5hOuPDmjv3uRqcVzgUEyFezAw4VxeCp+py4YSKRrdWb
	 8aW/GBXul9LF3osj3WhGQnpnn0rAkOTu6cnQ9Y/9qS9d/Q444rr/rCA4oBjSymiqpR
	 +qcc+LajJ+bsNP+cOgByb+Y+9IYZoyiTN8lgBpA7SUJdDpkwmAoOIbbUpIPvA8A1wD
	 xmgO2QTYSr5Xg==
Received: by mail-ed1-f52.google.com with SMTP id cn12so97261202edb.4
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 Mar 2023 20:31:29 -0700 (PDT)
X-Gm-Message-State: AAQBX9eoPAByBO1Yof4a4Y7FhzoGR5ttc11DjEqiWiUoH2ns9ZIscp3S
	noqsO1SCN0W1TbxEBmT/ihA8hpYsjixJbw707VA=
X-Google-Smtp-Source: AKy350a73nHShUqaxQ4pOVyv2riRCY11tklTbXjhohiW8sHVhKSoq36mJRcY1c6SaoSyODpJyWQSekcJERUzox94eUI=
X-Received: by 2002:a50:d543:0:b0:4ad:7439:cec7 with SMTP id
 f3-20020a50d543000000b004ad7439cec7mr14379125edj.7.1680319887322; Fri, 31 Mar
 2023 20:31:27 -0700 (PDT)
MIME-Version: 1.0
References: <20230310144727.1545699-1-robh@kernel.org>
In-Reply-To: <20230310144727.1545699-1-robh@kernel.org>
From: Timur Tabi <timur@kernel.org>
Date: Fri, 31 Mar 2023 22:30:50 -0500
X-Gmail-Original-Message-ID: <CAOZdJXUo=o1k+TeToiZT=EbSC=NKZ5B+AsONpH5G1CkZJtVp=w@mail.gmail.com>
Message-ID: <CAOZdJXUo=o1k+TeToiZT=EbSC=NKZ5B+AsONpH5G1CkZJtVp=w@mail.gmail.com>
Subject: Re: [PATCH] serial: Use of_property_read_bool() for boolean properties
To: Rob Herring <robh@kernel.org>
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
Cc: devicetree@vger.kernel.org, linux-serial@vger.kernel.org, Jiri Slaby <jirislaby@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sascha Hauer <s.hauer@pengutronix.de>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, NXP Linux Team <linux-imx@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <festevam@gmail.com>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Mar 10, 2023 at 8:48=E2=80=AFAM Rob Herring <robh@kernel.org> wrote=
:
>
> It is preferred to use typed property access functions (i.e.
> of_property_read_<type> functions) rather than low-level
> of_get_property/of_find_property functions for reading properties.
> Convert reading boolean properties to to of_property_read_bool().
>
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  drivers/tty/serial/imx.c       | 14 +++++---------
>  drivers/tty/serial/mxs-auart.c |  4 ++--
>  drivers/tty/serial/ucc_uart.c  |  2 +-

ucc_uart.c portion:

Acked-by: Timur Tabi <timur@kernel.org>
