Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 11F926695E0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Jan 2023 12:51:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ntfrm68czz3fDv
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Jan 2023 22:51:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=JzTEkcGL;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::1030; helo=mail-pj1-x1030.google.com; envelope-from=ulf.hansson@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=JzTEkcGL;
	dkim-atps=neutral
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ntfqr21tpz3c8b
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Jan 2023 22:50:29 +1100 (AEDT)
Received: by mail-pj1-x1030.google.com with SMTP id s13-20020a17090a6e4d00b0022900843652so5227091pjm.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Jan 2023 03:50:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rFVgmIxrk90lFoGOEgFIcDPxsYDGEz86NTdN/MqEtyo=;
        b=JzTEkcGLA1mIEarXE1ZY5wQgCcFZWI1nv4isKxRQRxq1jL1YylOUINiCYtACUPYXGG
         m06aiSvNrQP6lfWXHn2o6Xj3x5kNTQT0e/NSB5xbCjpM90GKx4Xmbcn0vkjyJu1Dm5JZ
         aDKVi1Seq0JwhR78QDA8HKuWsDhatGXxtxLNlulHzYfwzE3fjQ0wdGsp/5mao6GAd7E8
         xVm7W0YUKsNmXk1zIth6NWlRHArMhv/oatDDXOU+Rj5RXLCx4azLxyDbdvU2P/s4CHJ4
         0mWINPLff0/BL/qYYQwWE1fDevbXlS/lGLhq0IY2+WbPJSs8kMZg6sXBfULTs7uE0L/0
         ME9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rFVgmIxrk90lFoGOEgFIcDPxsYDGEz86NTdN/MqEtyo=;
        b=WSUGvTd5czuySj65YM87Xt78wU/JdG2XhFt2tHA3qpIj0HeRbI3K3OTSVGHOvwlm2a
         pJizhpzjcEJjMPxNtM4h79vXVCT++cZqv1sGZnNOzIZsP/nnz1t+8Rao1HVu8BzFOYCs
         HwZQ5U9EccM72a7OqV/iYYd3DU+IT9IDJow783mWsxqkT9KdCLgORGfXs3ogObjMNCNi
         P/znJ2JjhEhaM3hCHT4CCnNwyINfvGasfe2CwJQKu6V+KZlsIp1lmN2lxWRlnrf5Beee
         907JF3O8ksGfRSCX8KjC0zL3TxyHqNLtDbp/cwRpW06d1Us9H/N5h2ZBG6uK+NKVialc
         Plfw==
X-Gm-Message-State: AFqh2kp7pKathV/UNIsehvRmpAinG81faLMRCiWTfDJSeq0Xi1iWPP50
	SJHrRvkE/HEQMQIu97Ex1pDTpTsr7zsi8uCPLd5qhg==
X-Google-Smtp-Source: AMrXdXslNT0rcFozWtTrkBiy6JjJ0BfYiTZwNT6w5uemM3FDcYmR6mYw4qWxce+goOSgxUjRwE9wqRT3vqMgfUVrhMk=
X-Received: by 2002:a17:90a:7d01:b0:228:edb0:1493 with SMTP id
 g1-20020a17090a7d0100b00228edb01493mr946253pjl.164.1673610625407; Fri, 13 Jan
 2023 03:50:25 -0800 (PST)
MIME-Version: 1.0
References: <20230111142331.34518-1-ilpo.jarvinen@linux.intel.com> <20230111142331.34518-12-ilpo.jarvinen@linux.intel.com>
In-Reply-To: <20230111142331.34518-12-ilpo.jarvinen@linux.intel.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 13 Jan 2023 12:49:48 +0100
Message-ID: <CAPDyKFod1xTqrhr7NXpJUr1-2ymd-3zP9HcHD8daafG_tpnADQ@mail.gmail.com>
Subject: Re: [PATCH v3 11/13] tty/serial: Call ->dtr_rts() parameter active consistently
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
Cc: linux-arm-kernel@lists.infradead.org, Rodolfo Giometti <giometti@enneenne.com>, Alex Elder <elder@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, Arnd Bergmann <arnd@arndb.de>, linuxppc-dev@lists.ozlabs.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?Q?Samuel_Iglesias_Gons=C3=A1lvez?= <siglesias@igalia.com>, linux-staging@lists.linux.dev, linux-mmc@vger.kernel.org, Johan Hovold <johan@kernel.org>, David Lin <dtwlin@gmail.com>, greybus-dev@lists.linaro.org, linux-usb@vger.kernel.org, NXP Linux Team <linux-imx@nxp.com>, linux-serial@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <festevam@gmail.com>, Jiri Slaby <jirislaby@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 11 Jan 2023 at 15:24, Ilpo J=C3=A4rvinen
<ilpo.jarvinen@linux.intel.com> wrote:
>
> Convert various parameter names for ->dtr_rts() and related functions
> from onoff, on, and raise to active.
>
> Reviewed-by: Jiri Slaby <jirislaby@kernel.org>
> Signed-off-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>

Acked-by: Ulf Hansson <ulf.hansson@linaro.org> # For MMC

Kind regards
Uffe

> ---
>  drivers/char/pcmcia/synclink_cs.c | 6 +++---
>  drivers/mmc/core/sdio_uart.c      | 6 +++---
>  drivers/staging/greybus/uart.c    | 4 ++--
>  drivers/tty/amiserial.c           | 4 ++--
>  drivers/tty/hvc/hvc_console.h     | 2 +-
>  drivers/tty/hvc/hvc_iucv.c        | 6 +++---
>  drivers/tty/mxser.c               | 4 ++--
>  drivers/tty/n_gsm.c               | 4 ++--
>  drivers/tty/serial/serial_core.c  | 8 ++++----
>  drivers/tty/synclink_gt.c         | 4 ++--
>  include/linux/tty_port.h          | 4 ++--
>  include/linux/usb/serial.h        | 2 +-
>  12 files changed, 27 insertions(+), 27 deletions(-)
>
> diff --git a/drivers/char/pcmcia/synclink_cs.c b/drivers/char/pcmcia/sync=
link_cs.c
> index 46a0b586d234..1577eba6fe0e 100644
> --- a/drivers/char/pcmcia/synclink_cs.c
> +++ b/drivers/char/pcmcia/synclink_cs.c
> @@ -378,7 +378,7 @@ static void async_mode(MGSLPC_INFO *info);
>  static void tx_timeout(struct timer_list *t);
>
>  static bool carrier_raised(struct tty_port *port);
> -static void dtr_rts(struct tty_port *port, bool onoff);
> +static void dtr_rts(struct tty_port *port, bool active);
>
>  #if SYNCLINK_GENERIC_HDLC
>  #define dev_to_port(D) (dev_to_hdlc(D)->priv)
> @@ -2442,13 +2442,13 @@ static bool carrier_raised(struct tty_port *port)
>         return info->serial_signals & SerialSignal_DCD;
>  }
>
> -static void dtr_rts(struct tty_port *port, bool onoff)
> +static void dtr_rts(struct tty_port *port, bool active)
>  {
>         MGSLPC_INFO *info =3D container_of(port, MGSLPC_INFO, port);
>         unsigned long flags;
>
>         spin_lock_irqsave(&info->lock, flags);
> -       if (onoff)
> +       if (active)
>                 info->serial_signals |=3D SerialSignal_RTS | SerialSignal=
_DTR;
>         else
>                 info->serial_signals &=3D ~(SerialSignal_RTS | SerialSign=
al_DTR);
> diff --git a/drivers/mmc/core/sdio_uart.c b/drivers/mmc/core/sdio_uart.c
> index c6b4b2b2a4b2..50536fe59f1a 100644
> --- a/drivers/mmc/core/sdio_uart.c
> +++ b/drivers/mmc/core/sdio_uart.c
> @@ -542,20 +542,20 @@ static bool uart_carrier_raised(struct tty_port *tp=
ort)
>  /**
>   *     uart_dtr_rts            -        port helper to set uart signals
>   *     @tport: tty port to be updated
> - *     @onoff: set to turn on DTR/RTS
> + *     @active: set to turn on DTR/RTS
>   *
>   *     Called by the tty port helpers when the modem signals need to be
>   *     adjusted during an open, close and hangup.
>   */
>
> -static void uart_dtr_rts(struct tty_port *tport, bool onoff)
> +static void uart_dtr_rts(struct tty_port *tport, bool active)
>  {
>         struct sdio_uart_port *port =3D
>                         container_of(tport, struct sdio_uart_port, port);
>         int ret =3D sdio_uart_claim_func(port);
>         if (ret)
>                 return;
> -       if (!onoff)
> +       if (!active)
>                 sdio_uart_clear_mctrl(port, TIOCM_DTR | TIOCM_RTS);
>         else
>                 sdio_uart_set_mctrl(port, TIOCM_DTR | TIOCM_RTS);
> diff --git a/drivers/staging/greybus/uart.c b/drivers/staging/greybus/uar=
t.c
> index 92d49740d5a4..20a34599859f 100644
> --- a/drivers/staging/greybus/uart.c
> +++ b/drivers/staging/greybus/uart.c
> @@ -701,7 +701,7 @@ static int gb_tty_ioctl(struct tty_struct *tty, unsig=
ned int cmd,
>         return -ENOIOCTLCMD;
>  }
>
> -static void gb_tty_dtr_rts(struct tty_port *port, bool on)
> +static void gb_tty_dtr_rts(struct tty_port *port, bool active)
>  {
>         struct gb_tty *gb_tty;
>         u8 newctrl;
> @@ -709,7 +709,7 @@ static void gb_tty_dtr_rts(struct tty_port *port, boo=
l on)
>         gb_tty =3D container_of(port, struct gb_tty, port);
>         newctrl =3D gb_tty->ctrlout;
>
> -       if (on)
> +       if (active)
>                 newctrl |=3D (GB_UART_CTRL_DTR | GB_UART_CTRL_RTS);
>         else
>                 newctrl &=3D ~(GB_UART_CTRL_DTR | GB_UART_CTRL_RTS);
> diff --git a/drivers/tty/amiserial.c b/drivers/tty/amiserial.c
> index 29d4c554f6b8..d7515d61659e 100644
> --- a/drivers/tty/amiserial.c
> +++ b/drivers/tty/amiserial.c
> @@ -1459,13 +1459,13 @@ static bool amiga_carrier_raised(struct tty_port =
*port)
>         return !(ciab.pra & SER_DCD);
>  }
>
> -static void amiga_dtr_rts(struct tty_port *port, bool raise)
> +static void amiga_dtr_rts(struct tty_port *port, bool active)
>  {
>         struct serial_state *info =3D container_of(port, struct serial_st=
ate,
>                         tport);
>         unsigned long flags;
>
> -       if (raise)
> +       if (active)
>                 info->MCR |=3D SER_DTR|SER_RTS;
>         else
>                 info->MCR &=3D ~(SER_DTR|SER_RTS);
> diff --git a/drivers/tty/hvc/hvc_console.h b/drivers/tty/hvc/hvc_console.=
h
> index 6d3428bf868f..9668f821db01 100644
> --- a/drivers/tty/hvc/hvc_console.h
> +++ b/drivers/tty/hvc/hvc_console.h
> @@ -66,7 +66,7 @@ struct hv_ops {
>         int (*tiocmset)(struct hvc_struct *hp, unsigned int set, unsigned=
 int clear);
>
>         /* Callbacks to handle tty ports */
> -       void (*dtr_rts)(struct hvc_struct *hp, bool raise);
> +       void (*dtr_rts)(struct hvc_struct *hp, bool active);
>  };
>
>  /* Register a vterm and a slot index for use as a console (console_init)=
 */
> diff --git a/drivers/tty/hvc/hvc_iucv.c b/drivers/tty/hvc/hvc_iucv.c
> index fe862a6882d6..543f35ddf523 100644
> --- a/drivers/tty/hvc/hvc_iucv.c
> +++ b/drivers/tty/hvc/hvc_iucv.c
> @@ -658,13 +658,13 @@ static void hvc_iucv_notifier_hangup(struct hvc_str=
uct *hp, int id)
>  /**
>   * hvc_iucv_dtr_rts() - HVC notifier for handling DTR/RTS
>   * @hp:                Pointer the HVC device (struct hvc_struct)
> - * @raise:     True to raise or false to lower DTR/RTS lines
> + * @active:    True to raise or false to lower DTR/RTS lines
>   *
>   * This routine notifies the HVC back-end to raise or lower DTR/RTS
>   * lines.  Raising DTR/RTS is ignored.  Lowering DTR/RTS indicates to
>   * drop the IUCV connection (similar to hang up the modem).
>   */
> -static void hvc_iucv_dtr_rts(struct hvc_struct *hp, bool raise)
> +static void hvc_iucv_dtr_rts(struct hvc_struct *hp, bool active)
>  {
>         struct hvc_iucv_private *priv;
>         struct iucv_path        *path;
> @@ -672,7 +672,7 @@ static void hvc_iucv_dtr_rts(struct hvc_struct *hp, b=
ool raise)
>         /* Raising the DTR/RTS is ignored as IUCV connections can be
>          * established at any times.
>          */
> -       if (raise)
> +       if (active)
>                 return;
>
>         priv =3D hvc_iucv_get_private(hp->vtermno);
> diff --git a/drivers/tty/mxser.c b/drivers/tty/mxser.c
> index d4fb11e39bb1..ef3116e87975 100644
> --- a/drivers/tty/mxser.c
> +++ b/drivers/tty/mxser.c
> @@ -465,7 +465,7 @@ static bool mxser_carrier_raised(struct tty_port *por=
t)
>         return inb(mp->ioaddr + UART_MSR) & UART_MSR_DCD;
>  }
>
> -static void mxser_dtr_rts(struct tty_port *port, bool on)
> +static void mxser_dtr_rts(struct tty_port *port, bool active)
>  {
>         struct mxser_port *mp =3D container_of(port, struct mxser_port, p=
ort);
>         unsigned long flags;
> @@ -473,7 +473,7 @@ static void mxser_dtr_rts(struct tty_port *port, bool=
 on)
>
>         spin_lock_irqsave(&mp->slock, flags);
>         mcr =3D inb(mp->ioaddr + UART_MCR);
> -       if (on)
> +       if (active)
>                 mcr |=3D UART_MCR_DTR | UART_MCR_RTS;
>         else
>                 mcr &=3D ~(UART_MCR_DTR | UART_MCR_RTS);
> diff --git a/drivers/tty/n_gsm.c b/drivers/tty/n_gsm.c
> index 8dd0d6441c42..4f29b00f2645 100644
> --- a/drivers/tty/n_gsm.c
> +++ b/drivers/tty/n_gsm.c
> @@ -3792,11 +3792,11 @@ static bool gsm_carrier_raised(struct tty_port *p=
ort)
>         return dlci->modem_rx & TIOCM_CD;
>  }
>
> -static void gsm_dtr_rts(struct tty_port *port, bool onoff)
> +static void gsm_dtr_rts(struct tty_port *port, bool active)
>  {
>         struct gsm_dlci *dlci =3D container_of(port, struct gsm_dlci, por=
t);
>         unsigned int modem_tx =3D dlci->modem_tx;
> -       if (onoff)
> +       if (active)
>                 modem_tx |=3D TIOCM_DTR | TIOCM_RTS;
>         else
>                 modem_tx &=3D ~(TIOCM_DTR | TIOCM_RTS);
> diff --git a/drivers/tty/serial/serial_core.c b/drivers/tty/serial/serial=
_core.c
> index b8fff667d4f0..da4e4e8a2b50 100644
> --- a/drivers/tty/serial/serial_core.c
> +++ b/drivers/tty/serial/serial_core.c
> @@ -169,9 +169,9 @@ uart_update_mctrl(struct uart_port *port, unsigned in=
t set, unsigned int clear)
>  #define uart_set_mctrl(port, set)      uart_update_mctrl(port, set, 0)
>  #define uart_clear_mctrl(port, clear)  uart_update_mctrl(port, 0, clear)
>
> -static void uart_port_dtr_rts(struct uart_port *uport, bool raise)
> +static void uart_port_dtr_rts(struct uart_port *uport, bool active)
>  {
> -       if (raise)
> +       if (active)
>                 uart_set_mctrl(uport, TIOCM_DTR | TIOCM_RTS);
>         else
>                 uart_clear_mctrl(uport, TIOCM_DTR | TIOCM_RTS);
> @@ -1885,7 +1885,7 @@ static bool uart_carrier_raised(struct tty_port *po=
rt)
>         return mctrl & TIOCM_CAR;
>  }
>
> -static void uart_dtr_rts(struct tty_port *port, bool raise)
> +static void uart_dtr_rts(struct tty_port *port, bool active)
>  {
>         struct uart_state *state =3D container_of(port, struct uart_state=
, port);
>         struct uart_port *uport;
> @@ -1893,7 +1893,7 @@ static void uart_dtr_rts(struct tty_port *port, boo=
l raise)
>         uport =3D uart_port_ref(state);
>         if (!uport)
>                 return;
> -       uart_port_dtr_rts(uport, raise);
> +       uart_port_dtr_rts(uport, active);
>         uart_port_deref(uport);
>  }
>
> diff --git a/drivers/tty/synclink_gt.c b/drivers/tty/synclink_gt.c
> index 2b786265ce7b..33f258d6fef9 100644
> --- a/drivers/tty/synclink_gt.c
> +++ b/drivers/tty/synclink_gt.c
> @@ -3138,13 +3138,13 @@ static bool carrier_raised(struct tty_port *port)
>         return info->signals & SerialSignal_DCD;
>  }
>
> -static void dtr_rts(struct tty_port *port, bool on)
> +static void dtr_rts(struct tty_port *port, bool active)
>  {
>         unsigned long flags;
>         struct slgt_info *info =3D container_of(port, struct slgt_info, p=
ort);
>
>         spin_lock_irqsave(&info->lock,flags);
> -       if (on)
> +       if (active)
>                 info->signals |=3D SerialSignal_RTS | SerialSignal_DTR;
>         else
>                 info->signals &=3D ~(SerialSignal_RTS | SerialSignal_DTR)=
;
> diff --git a/include/linux/tty_port.h b/include/linux/tty_port.h
> index c44e489de0ff..edf685a24f7c 100644
> --- a/include/linux/tty_port.h
> +++ b/include/linux/tty_port.h
> @@ -16,7 +16,7 @@ struct tty_struct;
>  /**
>   * struct tty_port_operations -- operations on tty_port
>   * @carrier_raised: return true if the carrier is raised on @port
> - * @dtr_rts: raise the DTR line if @raise is true, otherwise lower DTR
> + * @dtr_rts: raise the DTR line if @active is true, otherwise lower DTR
>   * @shutdown: called when the last close completes or a hangup finishes =
IFF the
>   *     port was initialized. Do not use to free resources. Turn off the =
device
>   *     only. Called under the port mutex to serialize against @activate =
and
> @@ -32,7 +32,7 @@ struct tty_struct;
>   */
>  struct tty_port_operations {
>         bool (*carrier_raised)(struct tty_port *port);
> -       void (*dtr_rts)(struct tty_port *port, bool raise);
> +       void (*dtr_rts)(struct tty_port *port, bool active);
>         void (*shutdown)(struct tty_port *port);
>         int (*activate)(struct tty_port *port, struct tty_struct *tty);
>         void (*destruct)(struct tty_port *port);
> diff --git a/include/linux/usb/serial.h b/include/linux/usb/serial.h
> index bad343c5e8a7..33afd9f3ebbe 100644
> --- a/include/linux/usb/serial.h
> +++ b/include/linux/usb/serial.h
> @@ -292,7 +292,7 @@ struct usb_serial_driver {
>                         struct serial_icounter_struct *icount);
>         /* Called by the tty layer for port level work. There may or may =
not
>            be an attached tty at this point */
> -       void (*dtr_rts)(struct usb_serial_port *port, bool on);
> +       void (*dtr_rts)(struct usb_serial_port *port, bool active);
>         bool (*carrier_raised)(struct usb_serial_port *port);
>         /* Called by the usb serial hooks to allow the user to rework the
>            termios state */
> --
> 2.30.2
>
