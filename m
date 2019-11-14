Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id F2FA2FC859
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Nov 2019 15:04:33 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47DNWz2ZGYzF7H6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Nov 2019 01:04:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=timur@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="DYUqRhBS"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47DNNK4NR2zF4yY
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Nov 2019 00:57:53 +1100 (AEDT)
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com
 [209.85.219.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 74B4F2071B
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Nov 2019 13:57:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1573739870;
 bh=GB5ZNZwpUnrvTVpWesWOxcFz8LGlrrjCF/2UjAprWow=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=DYUqRhBS/0/ZWwPyWgKQMpSSxeMvAecfdApg1bCdDt9EKfmb7Yo1HHuOZ7fWBEcGV
 0Q2EKCCbPwEkyIj7bg3vpRuS8wmbpbGnFvY6pIXDaIpJm9qX1aCrI640uHbEJqRgYz
 pARS+Q7caIIdin7QRA7Q+fyYp98hhzth1wHsxfFI=
Received: by mail-qv1-f48.google.com with SMTP id y18so2355038qve.2
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Nov 2019 05:57:50 -0800 (PST)
X-Gm-Message-State: APjAAAVhj/0Gj6wS5EQluZfE/woCd4jWAw3tdrf8LQVztpGNuT9GYF+O
 M1Sf6H2fbeyCDSoQNaiS5BlVuQXnGeBJhGowmIY=
X-Google-Smtp-Source: APXvYqyBwvvpAdeB4tgNqw9NSS0VCm/ghop0mnQxOg76y+Cc8IN2tg15+QDHF2Yk/XPly8FONJJ4zXVNSp1SW8FSCJA=
X-Received: by 2002:ad4:4089:: with SMTP id l9mr2672727qvp.241.1573739869543; 
 Thu, 14 Nov 2019 05:57:49 -0800 (PST)
MIME-Version: 1.0
References: <20191108130123.6839-1-linux@rasmusvillemoes.dk>
 <20191108130123.6839-33-linux@rasmusvillemoes.dk>
In-Reply-To: <20191108130123.6839-33-linux@rasmusvillemoes.dk>
From: Timur Tabi <timur@kernel.org>
Date: Thu, 14 Nov 2019 07:57:12 -0600
X-Gmail-Original-Message-ID: <CAOZdJXU1ELqQh7TitAJW7bsmnj89wq3opJGVizC2B19nL_3_rQ@mail.gmail.com>
Message-ID: <CAOZdJXU1ELqQh7TitAJW7bsmnj89wq3opJGVizC2B19nL_3_rQ@mail.gmail.com>
Subject: Re: [PATCH v4 32/47] serial: ucc_uart: use of_property_read_u32() in
 ucc_uart_probe()
To: Rasmus Villemoes <linux@rasmusvillemoes.dk>
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
Cc: lkml <linux-kernel@vger.kernel.org>, Li Yang <leoyang.li@nxp.com>,
 Scott Wood <oss@buserror.net>, linux-serial@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Qiang Zhao <qiang.zhao@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Nov 8, 2019 at 7:03 AM Rasmus Villemoes
<linux@rasmusvillemoes.dk> wrote:
>
> -       if (*iprop)
> -               qe_port->port.uartclk = *iprop;
> +       if (val)
> +               qe_port->port.uartclk = val;
>         else {
>                 /*
>                  * Older versions of U-Boot do not initialize the brg-frequency
>                  * property, so in this case we assume the BRG frequency is
>                  * half the QE bus frequency.
>                  */

This bug in older U-Boots is definitely PowerPC-specific, so could you
change this so that it reports an error on ARM if brg-frequency is
zero, and displays a warning on PowerPC?
