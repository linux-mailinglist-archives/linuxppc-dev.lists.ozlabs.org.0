Return-Path: <linuxppc-dev+bounces-15856-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B4C99D25BF6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Jan 2026 17:28:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dsT2H1kKrz309H;
	Fri, 16 Jan 2026 03:28:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::42c"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768494535;
	cv=none; b=hop2xMRz4uIj5DhhzDOGM7EWo5J8q4Ld209ghlg6V6JYZ7j8/Aj2Ce85/esXFuzfwC0lELne0K1A9T5TiZTME54ulSXxIThTZYNoodKSQTau+WolL7a81T4pcY0I2KYHNUJ7qrQ+3/4jd0Cyxo0tixOw31YNBUSvp6ylpVEVSWEwAfG2J+Vh/KBeFiFy78C1RmWefaDD6W0zBtng2f76BV9xmBE/yKzpVUYmQYXqNexmOg3wsLhcY8en8fN6nj0Etvi6h3PaDUH/ao94NwEyYMOz6uEz4jKKlDeas0bGF/muIU55BXaipmAeAciHhfdjBsNpgCUaSgYgybEd9oseUg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768494535; c=relaxed/relaxed;
	bh=URJX5xTHolO9FC46ryjpGruJ5TGEDEyfrbwATuqwgLQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OCAkrLMBNGWHhHluhQ1HzZj4h+72iQty/fFpWp67Kqousf/yOyciYA4s2HW5vAKbiKbaUxXw2mCrQNKcpsXUq+B74YIbly7jy0ESj6f7dm7W86fNtHPV1d1UUHDij31qxWHBPZEDn6ELv3TaQghqB6qf+VdHk0nyqJVQwXnkB+kb8QMhw0Kxwg0C/HQg4GRn0NDQeUzIA3lZzLPZlVpy6AUWbwhXn3eg+RmN8h9SQjCXicASIYNUnroePolWxNV9QqDJ1bLBUmJBlXTTcPGtSYiR9hwDva7+hqHtMeoOa0G47Icm3NxV0sKdf39YtJZSdZltORn3mEUmRe3+HsBOEA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=XTPwLJbm; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::42c; helo=mail-wr1-x42c.google.com; envelope-from=pmladek@suse.com; receiver=lists.ozlabs.org) smtp.mailfrom=suse.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=XTPwLJbm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.com (client-ip=2a00:1450:4864:20::42c; helo=mail-wr1-x42c.google.com; envelope-from=pmladek@suse.com; receiver=lists.ozlabs.org)
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dsT2F4f02z2xNg
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Jan 2026 03:28:53 +1100 (AEDT)
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-432d2c7dd52so967709f8f.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Jan 2026 08:28:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1768494529; x=1769099329; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=URJX5xTHolO9FC46ryjpGruJ5TGEDEyfrbwATuqwgLQ=;
        b=XTPwLJbm3ew8me5HUc960gym3vWVPg7LX4VvTzma6A5h+7Y6IM9RzpjY7vwEjrZT6S
         Dq8eJGCoED5nanTkijfz2JMfKGGLoOxeNrsxxnmfwyVVtk3BpqHjSnHCgVr9Tl9WzJZY
         nWsvTodN1ErgrXIU/LrxvYVvT/YSb1mmDTadbu3uyWc2T7a3FXW6dkVvdx2UWUKuhvtB
         uBxcANJId4zpMKsRpHxPcjq2HM7APSKYFhlgPeJd6pNb+UAjwdoQ+5kuQCNYC4adkl3K
         G+JiiqmXH9Lat2P6fRu3KumpwESgrSPr0AVqJyN2zPDAUoGAgLdlipQ2vLHPL41nT1TE
         zrNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768494529; x=1769099329;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=URJX5xTHolO9FC46ryjpGruJ5TGEDEyfrbwATuqwgLQ=;
        b=CRhVs7ur6ZBtdmwrIfiJSlXRGaRHrtEJvU9jnl1OtYIzGxbt2lLzaxs3lIOHVW2w0R
         JLw/bMTtoi72Q7zxi1vJPNLXLI8ky4QisbXN8/9FoxNcROTkh0UIn18yA6WEWlLDVCol
         +T4DTTXvgy/mUcHI3Jo6qdJpzH84Ikmf+2HpSE+zNUbLNQd4dTxzHH+wBJ7vgO5lgIbN
         oblrMKoLUZusHlutyTv5+GpcOVbTsplAVNva6CDJapSALQWmQ0zDmNXoTrhmJ1b4AB/4
         xxNBX8mfN30QzUxw0eD7bhFj/hH/JZWkoK7YY3s6ua3BIbynUDxcU4LHgxgVcHYrQ25X
         kRwA==
X-Forwarded-Encrypted: i=1; AJvYcCVOo64ihriNn/vKFlmUND6Sgp39BjwUV8aBLFVKOhZsk2EE0hC/doNBWSpByofu4ZjIfOOV8fLj8xwa0zI=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzK7br7N8Mf4OhKc8p9gQ1QgvzLqFzZJzNgKmUjDqk+pbwL4byb
	Zd+++dWxzidcIBfzDyjtEJMBmYUgz73fRoPicGw/ywAVpdMqcT9Fhoz6//F+J9KUu60=
X-Gm-Gg: AY/fxX6kI5LU5WlY9D2fCs2vjsv5B4c8j2teDDWxu/kO9+HDBjHlGO1eKlNMn7d4M/o
	tQfJ4enro/qsOxAsZl2CfIYSYj9rVmceOcaTodJ+GwabD5ioqehTJoachF7nhdUanbhLcNonVBa
	yzxDn1zqs1LeAxLAzhK/kLYjMaTNrHcq6Pluo8oC0K/rM0+8BcSs2E7rEVnpqSrhk0ApVijNVFB
	HBQK/xp/yQLxW+XPggWXIC0iAcudCR9rzFNHpnsZba5H9C5IHGKBQKYL2SrcWtNxCb2fbB7E2PU
	0VswKZ7Ar1VRD2dtWG8mB2qb+C2TWgP53Z2QAbosw95Wih1Wg+jTMTJxUe4n/bw8BDumh1OGg6y
	lQLmX2lpMF7vF8uLhIlFHT+GJwxJK8S9gQ4tJnXQefML4urrs4za03zZUf1orOrTXuLWhjmWGsC
	sfBw7jy+jlEc2Fnw==
X-Received: by 2002:a5d:64c5:0:b0:430:fd0f:2910 with SMTP id ffacd0b85a97d-4342c501a57mr9777353f8f.26.1768494528600;
        Thu, 15 Jan 2026 08:28:48 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-434af6e148bsm6604069f8f.33.2026.01.15.08.28.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 08:28:47 -0800 (PST)
Date: Thu, 15 Jan 2026 17:28:44 +0100
From: Petr Mladek <pmladek@suse.com>
To: Marcos Paulo de Souza <mpdesouza@suse.com>
Cc: Richard Weinberger <richard@nod.at>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jason Wessel <jason.wessel@windriver.com>,
	Daniel Thompson <danielt@kernel.org>,
	Douglas Anderson <dianders@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	John Ogness <john.ogness@linutronix.de>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Jiri Slaby <jirislaby@kernel.org>, Breno Leitao <leitao@debian.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Andreas Larsson <andreas@gaisler.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>, linux-um@lists.infradead.org,
	linux-kernel@vger.kernel.org, kgdb-bugreport@lists.sourceforge.net,
	linux-serial@vger.kernel.org, netdev@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org, linux-hardening@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH 16/19] drivers: tty: serial: ma35d1_serial: Migrate to
 register_console_force helper
Message-ID: <aWkVvCu74HhV7W9s@pathway.suse.cz>
References: <20251227-printk-cleanup-part3-v1-0-21a291bcf197@suse.com>
 <20251227-printk-cleanup-part3-v1-16-21a291bcf197@suse.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251227-printk-cleanup-part3-v1-16-21a291bcf197@suse.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Sat 2025-12-27 09:16:23, Marcos Paulo de Souza wrote:
> The register_console_force function was introduced to register consoles
> even on the presence of default consoles, replacing the CON_ENABLE flag
> that was forcing the same behavior.
> 
> No functional changes.
> 
> Signed-off-by: Marcos Paulo de Souza <mpdesouza@suse.com>
> ---
>  drivers/tty/serial/ma35d1_serial.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/tty/serial/ma35d1_serial.c b/drivers/tty/serial/ma35d1_serial.c
> index 285b0fe41a86..d1e03dee5579 100644
> --- a/drivers/tty/serial/ma35d1_serial.c
> +++ b/drivers/tty/serial/ma35d1_serial.c
> @@ -633,7 +633,7 @@ static struct console ma35d1serial_console = {
>  	.write   = ma35d1serial_console_write,
>  	.device  = uart_console_device,
>  	.setup   = ma35d1serial_console_setup,
> -	.flags   = CON_PRINTBUFFER | CON_ENABLED,
> +	.flags   = CON_PRINTBUFFER,
>  	.index   = -1,
>  	.data    = &ma35d1serial_reg,
>  };
> @@ -657,7 +657,7 @@ static void ma35d1serial_console_init_port(void)
>  static int __init ma35d1serial_console_init(void)
>  {
>  	ma35d1serial_console_init_port();
> -	register_console(&ma35d1serial_console);
> +	register_console_force(&ma35d1serial_console);

Sigh, I am afraid that this is not enough.

I double checked how "ma35d1serial_console" was used. I guess
that it could get registered also via the generic uart device
driver code. I see the following:

#ifdef CONFIG_SERIAL_NUVOTON_MA35D1_CONSOLE
[...]
#define MA35D1SERIAL_CONSOLE    (&ma35d1serial_console)
#else
#define MA35D1SERIAL_CONSOLE    NULL
#endif

static struct uart_driver ma35d1serial_reg = {
[...]
	.cons         = MA35D1SERIAL_CONSOLE,
[...]
};

static int __init ma35d1serial_init(void)
{
[...]
	ret = uart_register_driver(&ma35d1serial_reg);
[...]
	ret = platform_driver_register(&ma35d1serial_driver);
[...]
}

And the gneric code:

uart_configure_port(struct uart_driver *drv, struct uart_state *state,
		    struct uart_port *port)
{
[...]
		/*
		 * If this driver supports console, and it hasn't been
		 * successfully registered yet, try to re-register it.
		 * It may be that the port was not available.
		 */
		if (port->cons && !console_is_registered(port->cons))
			register_console(port->cons);

[...]
}

, which can called via from:

  + mux_probe()
    + uart_add_one_port()
      + serial_ctrl_register_port()
	+serial_core_register_port()
	  + serial_core_add_one_port()
	    + uart_configure_port()
	      + register_console()


Honestly, I am not 100% sure. The struct console is assigned to
.cons in struct uart_driver. And uart_configure_port() function
passes port->cons from struct uart_port *port. But I believe
that they can get assigned somewhere in the maze of
the init/probe code.

I would feel more comfortable if we kept the information as
as flag in struct console so that even the generic callbacks
could use it.

Anyway, it makes sense to create a sepate flag for this
purpose, e.g. CON_FORCE or CON_FORCE_ENABLE.

>  	return 0;
>  }
>  console_initcall(ma35d1serial_console_init);

Best Regards,
Petr

