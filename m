Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B5C92F5C0F
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Nov 2019 00:50:57 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 478xqL3HcVzF7fP
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Nov 2019 10:50:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.210.67; helo=mail-ot1-f67.google.com;
 envelope-from=pku.leo@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=nxp.com
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
 [209.85.210.67])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 478xn63NqvzF3qw
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 Nov 2019 10:48:58 +1100 (AEDT)
Received: by mail-ot1-f67.google.com with SMTP id t4so6720613otr.1
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 08 Nov 2019 15:48:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XMVjsfRFCMgyyIBo6SJuyhGa3vmCkYAAcBk1J2DsBuY=;
 b=Nk3vy/i0ZctKSrZDaQ3b64Po1Y0puQ3QQhjo9MIbphV4ldppTxNEZ/7Nc3pvqex7rB
 4xnCO+b6V2DvdxBOvFfZFhTMI1I/vbCHOgyYhmscrpZGxgQj0Jf2Y3xVCya0cDKluzYi
 0eBGabrLnnGtIcp0oRwhnyjdmDQsMRBc5CidoGZncf2BcDDCrsrnrXNux74VTayxoA85
 dVtTp1CZ6bLb9cmQFv1On6430A0QQklK8ERmnxkuHYqbfCf05VQY8D0UZYZinr/2Pp1w
 th6bh3wyYpdl+1btzHFeUNC3ntMI2cIYitxHIHo+srchU4o4ClmZhUu/dTs7jOpkjd4q
 +39A==
X-Gm-Message-State: APjAAAUBymtt+YrKssRjZgBD4WSOrj4o6ps05fX5GokwrPPTrbfZL8vM
 hNwvZSN4VhKfQeyved16NUc16O9LudQ=
X-Google-Smtp-Source: APXvYqwsZ+qLHxHdgL2cYYEvqRX3SKANfuXV9NF5IGRTa4GC1iUFPO0PMb6O8a4zNu+EBfT9bVJXNw==
X-Received: by 2002:a05:6830:224c:: with SMTP id
 t12mr10500742otd.299.1573256935564; 
 Fri, 08 Nov 2019 15:48:55 -0800 (PST)
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com.
 [209.85.210.49])
 by smtp.gmail.com with ESMTPSA id j8sm2447169otj.42.2019.11.08.15.48.54
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Nov 2019 15:48:55 -0800 (PST)
Received: by mail-ot1-f49.google.com with SMTP id z6so6706294otb.2
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 08 Nov 2019 15:48:54 -0800 (PST)
X-Received: by 2002:a05:6830:17c2:: with SMTP id
 p2mr11400428ota.74.1573256934498; 
 Fri, 08 Nov 2019 15:48:54 -0800 (PST)
MIME-Version: 1.0
References: <20191108130123.6839-1-linux@rasmusvillemoes.dk>
 <20191108130123.6839-48-linux@rasmusvillemoes.dk>
In-Reply-To: <20191108130123.6839-48-linux@rasmusvillemoes.dk>
From: Li Yang <leoyang.li@nxp.com>
Date: Fri, 8 Nov 2019 17:48:43 -0600
X-Gmail-Original-Message-ID: <CADRPPNQwnmPCh8nzQ5vBTLoieO-r2u0huh17mwcinhfhNgo04A@mail.gmail.com>
Message-ID: <CADRPPNQwnmPCh8nzQ5vBTLoieO-r2u0huh17mwcinhfhNgo04A@mail.gmail.com>
Subject: Re: [PATCH v4 47/47] soc: fsl: qe: remove PPC32 dependency from
 CONFIG_QUICC_ENGINE
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
Cc: lkml <linux-kernel@vger.kernel.org>, Scott Wood <oss@buserror.net>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, Qiang Zhao <qiang.zhao@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Nov 8, 2019 at 7:05 AM Rasmus Villemoes
<linux@rasmusvillemoes.dk> wrote:
>
> There are also ARM and ARM64 based SOCs with a QUICC Engine, and the
> core QE code as well as net/wan/fsl_ucc_hdlc and tty/serial/ucc_uart
> has now been modified to not rely on ppcisms.
>
> So extend the architectures that can select QUICC_ENGINE, and add the
> rather modest requirements of OF && HAS_IOMEM.
>
> The core code as well as the ucc_uart driver has been tested on an
> LS1021A (arm), and it has also been tested that the QE code still
> works on an mpc8309 (ppc).
>
> Signed-off-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
> ---
>  drivers/soc/fsl/qe/Kconfig | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/soc/fsl/qe/Kconfig b/drivers/soc/fsl/qe/Kconfig
> index cfa4b2939992..f1974f811572 100644
> --- a/drivers/soc/fsl/qe/Kconfig
> +++ b/drivers/soc/fsl/qe/Kconfig
> @@ -5,7 +5,8 @@
>
>  config QUICC_ENGINE
>         bool "QUICC Engine (QE) framework support"
> -       depends on FSL_SOC && PPC32
> +       depends on OF && HAS_IOMEM
> +       depends on PPC32 || ARM || ARM64 || COMPILE_TEST

Can you also add PPC64?  It is also used on some PPC64 platforms
(QorIQ T series).

>         select GENERIC_ALLOCATOR
>         select CRC32
>         help
> --
> 2.23.0
>
