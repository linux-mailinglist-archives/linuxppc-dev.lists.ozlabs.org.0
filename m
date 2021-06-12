Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 641C43A4E53
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Jun 2021 13:26:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G2FlF6lQgz3c5F
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Jun 2021 21:26:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=strGZZWe;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::22c;
 helo=mail-lj1-x22c.google.com; envelope-from=festevam@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=strGZZWe; dkim-atps=neutral
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G2Fkm0HfTz3069
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Jun 2021 21:25:35 +1000 (AEST)
Received: by mail-lj1-x22c.google.com with SMTP id r16so13129005ljk.9
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Jun 2021 04:25:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=o0wO5bT+5/3wJfzKFCtGQ3mV474XVeVqdnyyvbVk6mI=;
 b=strGZZWea2Rly+Mrzv1nw/2TB7vFF7mR6CY7At74zLU2w5wQ0HaoIhmWI/NUPIl7by
 h4/KcXsAbOGbWhuQrMbXMC1RvsqdxgDie4+7kKS9qln5lWruzeLkcAO3PO80RDloHD7X
 y4Y/WnsY/d+pEGeTk+a/3PsjlSQJRD9FlOVr+hDRHCkjJUX2wyQbkyrT/qZ873yURwP0
 stej8J1UvnqZC324Y24gqlB/1OcF4U0f4j3l6K1xI+PAjJ87MDU815EIB4OxydBDEO/7
 /KMT3KTujNxj2URzu1HQ2Mb5O8swj8kNtgbxytUNkkbl32B0Jwld+yes7+5pLd1Qa9tB
 DmYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=o0wO5bT+5/3wJfzKFCtGQ3mV474XVeVqdnyyvbVk6mI=;
 b=C7vmOzMjHSgAV/6YKtaYMkSQcgjrhOtd07nw9tSiRMVfTn4+0isXFlu5YZhGb7Jc+b
 TDL4QVoJfUtBc3C8nKizYVkniIX5E9k0a3O058LletwP1d+UNaRABNB6hs24zWfeuj0L
 H5RgN0zI7Z2xCCKI53YmdD/n2Hz1K5pVVO5uzY3NT62oM0QAM12IPCzqvdFrtiHvHIi4
 xbIXrKQ3x8HKnOMw+UYRhcC2dDrrGpc/fLg6OU5Ph7MHTK7IOUj/bl7Kt9ZLyJlHTK6c
 /VTwp1hBj27/G/joHF2UI4uVNdeOn6QZi+U/0BIqi6MraO1eR/5NYLRwCfxQ+/Qfv4c7
 CjhA==
X-Gm-Message-State: AOAM530e26fSuTyOijTXJ4OVaE5yyVpIy2bLueFkGYLGD7wRj0HAgAcK
 /aMOWPSMwsx7MtQFyTPIensyyi2RA5IlPbafwug=
X-Google-Smtp-Source: ABdhPJz1ZcfQJdludqHQ7YdtsU5jfSssrBkqeXci9YCTbcy2bFo3aPJ+r/RuY/tG8uvkDcw1gif0RezTE6/nDkGWHyw=
X-Received: by 2002:a05:651c:1111:: with SMTP id
 d17mr6482908ljo.116.1623497126417; 
 Sat, 12 Jun 2021 04:25:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210612003128.372238-1-leoyang.li@nxp.com>
In-Reply-To: <20210612003128.372238-1-leoyang.li@nxp.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Sat, 12 Jun 2021 08:25:14 -0300
Message-ID: <CAOMZO5AFpzUJeUm6jeRwiRAo1c09nY4pLbncGAi5UJVXi8LPkQ@mail.gmail.com>
Subject: Re: [PATCH] usb: gadget: fsl: properly remove remnant of MXC support
To: Li Yang <leoyang.li@nxp.com>
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
Cc: Felipe Balbi <balbi@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 USB list <linux-usb@vger.kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, Joel Stanley <joel@jms.id.au>,
 Ran Wang <ran.wang_1@nxp.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Li,

On Fri, Jun 11, 2021 at 9:31 PM Li Yang <leoyang.li@nxp.com> wrote:
>
> Commit a390bef7db1f ("usb: gadget: fsl_mxc_udc: Remove the driver")
> didn't remove all the MXC related stuff which can cause build problem
> for LS1021 when enabled again in Kconfig.  This patch remove all the
> remnants.
>
> Signed-off-by: Li Yang <leoyang.li@nxp.com>

Thanks for the fix:

Reviewed-by: Fabio Estevam <festevam@gmail.com>
