Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F84DFD3D1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Nov 2019 05:52:52 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47DmDx1VVdzF6Jj
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Nov 2019 15:52:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=timur@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="U6HSO2Yx"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47DmBs6gy7zDrc4
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Nov 2019 15:51:01 +1100 (AEDT)
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com
 [209.85.222.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2654720731
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Nov 2019 04:50:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1573793459;
 bh=Zf6sTIMli76oYQWsxTvqKPeMc72IZB/Z2B0hBOL0C+w=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=U6HSO2YxLNSLY6xFeYZ9L9kZOnK1zLpDkmnckCZ40n7Wa2tNA8RrHy8A/3JbXDRMO
 0c59Tcos/mF4g2JiaTaJAqm7VWCRDVjlegnSnsoXJdJUDHp9MEEUWO4o2/BDcp1Zog
 VLk+oFYf+bN8ZPmHI3WhZycAGPyJWHg/ObSj/sa8=
Received: by mail-qk1-f182.google.com with SMTP id e187so7152681qkf.4
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Nov 2019 20:50:59 -0800 (PST)
X-Gm-Message-State: APjAAAXc0TNYqn3PU1rukMqMwFAJZeJYmZGLmmIUty1WyRDc3GZ0++N6
 XZa9fUPx0rUwOvQsJsugWzOvShApAZ9vjGTXMPs=
X-Google-Smtp-Source: APXvYqzfQ+D+sIW1zancKDC1U3nM1foEwdOLpsyTt+w7ZHUDx3VbOqfLeYpK5/1wDeVyzBxq3G2x5b7W0mA8w1wSKUE=
X-Received: by 2002:a37:9d44:: with SMTP id g65mr10669230qke.302.1573793458206; 
 Thu, 14 Nov 2019 20:50:58 -0800 (PST)
MIME-Version: 1.0
References: <20191108130123.6839-1-linux@rasmusvillemoes.dk>
 <20191108130123.6839-8-linux@rasmusvillemoes.dk>
In-Reply-To: <20191108130123.6839-8-linux@rasmusvillemoes.dk>
From: Timur Tabi <timur@kernel.org>
Date: Thu, 14 Nov 2019 22:50:21 -0600
X-Gmail-Original-Message-ID: <CAOZdJXXHK9U_Y7_VgVmuOFKDAh4OqBJ7hZx58hisZZ6Cz6xE2w@mail.gmail.com>
Message-ID: <CAOZdJXXHK9U_Y7_VgVmuOFKDAh4OqBJ7hZx58hisZZ6Cz6xE2w@mail.gmail.com>
Subject: Re: [PATCH v4 07/47] soc: fsl: qe: qe.c: guard use of
 pvr_version_is() with CONFIG_PPC32
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
 Scott Wood <oss@buserror.net>, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Qiang Zhao <qiang.zhao@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Nov 8, 2019 at 7:04 AM Rasmus Villemoes
<linux@rasmusvillemoes.dk> wrote:
>
> +static bool qe_general4_errata(void)
> +{
> +#ifdef CONFIG_PPC32
> +       return pvr_version_is(PVR_VER_836x) || pvr_version_is(PVR_VER_832x);
> +#endif
> +       return false;
> +}
> +
>  /* Program the BRG to the given sampling rate and multiplier
>   *
>   * @brg: the BRG, QE_BRG1 - QE_BRG16
> @@ -223,7 +231,7 @@ int qe_setbrg(enum qe_clock brg, unsigned int rate, unsigned int multiplier)
>         /* Errata QE_General4, which affects some MPC832x and MPC836x SOCs, says
>            that the BRG divisor must be even if you're not using divide-by-16
>            mode. */

Can you also move this comment (and fix the comment formatting so that
it's a proper function comment) to qe_general4_errata()?
