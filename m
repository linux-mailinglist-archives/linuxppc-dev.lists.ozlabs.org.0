Return-Path: <linuxppc-dev+bounces-15883-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A3593D2F2AD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Jan 2026 11:00:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dswMH6XMLz2xm3;
	Fri, 16 Jan 2026 21:00:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::42d"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768557611;
	cv=none; b=eKjti21PNyv7HOYukShkEUj8wRHX4xgytWpuGFfD9bLBEZqOV9nRjH0NZmxXm/Nk2XaYjMQrlPaYOJyMv4PaMux8MV3DIO8JCX5YCrALDQZf/fFiXS5jddzqh9n6PKpLoE9NfLxxHEh9cBVNPWAiaYlsF+TPDeCrInZ0I6YQgIFYYrWt1CqZlQMo3cdbRzBJcy3WeYQ3ah6pCA1NnLWjGZI6hS+7TXxs+5n7n+zjLJdLM35GUWLd+tWAIM8+TFtcPFGKlZDrIkSPywz0UDuHSoM6biF+C8TFUoGauasHFApdJyAFvJAHKrupFs1zoVv7Cz5sOp+2r931Nc++U588eg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768557611; c=relaxed/relaxed;
	bh=ik7nBSUvqjiZji8p0UMpcxyJ9CmKYvj/STnQwZRmw6o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cRwlgrwBvTo6RwGFJHwJ8VR12lK37rvyHa5QqfbPAVaWdpQ04FsMK9Ki2asFfmJudGzjnOER5nD7sGdOk9anCP9TBCLfq0DI2wZb1pjKZJ1zOR7PWzQM95miRoA1+aSpsQZnVcLXPbFWFbALHWuwUi2dYnWRv+vs0XcHorqn22XD2b6QNdf/iXtaZVI/y20kKnwHFzjyjm8ncyi06GY2qdobm1utYROJ2QrmuOmPjgN4Ppx4I9bizLsfF/jx2YcaJzTh62u4DGhm+sLDsKUJGpKNtGgBWZSSr1LKhw/GAg/YCIq0j+/VKE4msppAOtBduDN408wBVjvBJo9So/W+Ew==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=OUdsDh7L; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com; envelope-from=pmladek@suse.com; receiver=lists.ozlabs.org) smtp.mailfrom=suse.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=OUdsDh7L;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.com (client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com; envelope-from=pmladek@suse.com; receiver=lists.ozlabs.org)
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dswMG12QJz2xPL
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Jan 2026 21:00:09 +1100 (AEDT)
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-432d2c7dd52so1639860f8f.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Jan 2026 02:00:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1768557601; x=1769162401; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ik7nBSUvqjiZji8p0UMpcxyJ9CmKYvj/STnQwZRmw6o=;
        b=OUdsDh7LaPt6ViYYTEAfQTH3bsiQrjfB8aTyM796hr6iCTQGyO3gK29KpPHBWl7GbS
         aMhtFyI01oxXdVyQbWPTp8+AD/SbKrxImcPjSri2qLRaa4tmhSRPyjdlckzHssKiNIK5
         byDol8ftwtXimPQURPcSc0x65w+Wxl0DckGhcxXuS+3fvsZ7WXBIwzK1qVHrlJ/OiROh
         fklm2qWC705xudoH2U7j7MKbvDs68zahE/xeczh87ZQAbHGUv7Z678oB3uyT+WFN5HYP
         Tni4a/gwucXHweWkmablgY2tUBVYZJsOlvOKyy8BQrGvzYcv3CM2P8xi00BYDEPmvIuZ
         Fczw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768557601; x=1769162401;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ik7nBSUvqjiZji8p0UMpcxyJ9CmKYvj/STnQwZRmw6o=;
        b=JxWD0IHl2M7OGe0f7KIB1MoXSGIIHctDg0PM9ZSsIzL6lMjjLikxAEzKOyoBq21Zo/
         JtRzZYblsPgiwo9qzAmYDvsV9IQTaX3UTrn2RVC7REdeQAH98fozF1EV40UdC+CtdBSr
         KmbaVN8AfjcNv1l7pzdjTpYP2UrTVH2jd/6D5jbXKH+2bD0VN3WLYFFUEGy3IVY6l/rK
         3CIfomXRPNuHthUcCtI35wmcEoRKNIBFqkNx9rqClJceFnPps0dson0Dm8Ldqs+GEixJ
         mBMgEKIWAezU/cHJd8aa6D3QAYCaF+Ppu6YuLZlfmOMZJ/Sh31YavHqVQhxw1Dq/Txje
         ttZQ==
X-Forwarded-Encrypted: i=1; AJvYcCVC8hv0MUZ7zK7ZEjLxGeOC+QW7zmqDRndU5rUSY6bb6w1kzngKTiZT/YkM4zT+r5OtlFS0WaYZbpaMMmA=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yz9VdOYWthZm+QIbkb0AiQvmWmfrgh51lfietZA8uNdnzO0iNse
	5rYfcFEAEC92iBS+m4fccAqWfkEKJzcc8+rmGZU0bDfJkFyCHyXSjIfGZL/uzXYu6ic=
X-Gm-Gg: AY/fxX5ypXUgvs8H9pmntEdh5SsK+vO2r6X/gDEZPRWtHsNbHMzBIdkPU8+RnFvIe1w
	xe6sYZcfvi5BeFA9xgsdf7zy1PSquW9O0iBbtnT6Z8yJZg6QVoX36I+sghWj/c3vx7BOW7v45ek
	qzKGc0JyH93wDqgM03hqfWuEbJvbiI7i7ZtRgTcE9ZYmQT/wxSVvcACFYZ9HeOFHVgzCQiWjMCy
	y3kdiFChFQG95iPf7pQVHHoxlFN2GQE0EZy+Tk/qhNpamT/StQ81UnIT85CYeJYUgGHHoXWvlky
	5ra91lpYTlePtqZhFCCpuNGT1M4/ZGopbtT6TUHOmRyC3L/3JUa5Lta1q3vxIYdVXgB5fHVGbtc
	gyTMMxmnlmFciLF4/7BHqTJRxRAmKxXWRfGFb09uq3SuySlo1GWObpCkf4XspXodwtvTmqZzTq/
	jro6GRv8VSfmaR4Q==
X-Received: by 2002:a05:6000:26ce:b0:432:dfea:1fa8 with SMTP id ffacd0b85a97d-43569bc5767mr3019291f8f.45.1768557601174;
        Fri, 16 Jan 2026 02:00:01 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43569921f6esm4337797f8f.4.2026.01.16.01.59.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 02:00:00 -0800 (PST)
Date: Fri, 16 Jan 2026 10:59:57 +0100
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
	Shan-Chun Hung <schung@nuvoton.com>,
	Laurentiu Tudor <laurentiu.tudor@nxp.com>,
	linux-um@lists.infradead.org, linux-kernel@vger.kernel.org,
	kgdb-bugreport@lists.sourceforge.net, linux-serial@vger.kernel.org,
	netdev@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
	linux-hardening@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	sparclinux@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH 15/19] drivers: tty: serial: mux.c: Migrate to
 register_console_force helper
Message-ID: <aWoMHbbn-BmmbZMg@pathway.suse.cz>
References: <20251227-printk-cleanup-part3-v1-0-21a291bcf197@suse.com>
 <20251227-printk-cleanup-part3-v1-15-21a291bcf197@suse.com>
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
In-Reply-To: <20251227-printk-cleanup-part3-v1-15-21a291bcf197@suse.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Sat 2025-12-27 09:16:22, Marcos Paulo de Souza wrote:
> The register_console_force function was introduced to register consoles
> even on the presence of default consoles, replacing the CON_ENABLE flag
> that was forcing the same behavior.
> 
> --- a/drivers/tty/serial/mux.c
> +++ b/drivers/tty/serial/mux.c
> @@ -390,7 +390,7 @@ static struct console mux_console = {
>  	.write =	mux_console_write,
>  	.device =	uart_console_device,
>  	.setup =	mux_console_setup,
> -	.flags =	CON_ENABLED | CON_PRINTBUFFER,
> +	.flags =	CON_PRINTBUFFER,
>  	.index =	0,
>  	.data =		&mux_driver,
>  };
> @@ -547,7 +547,7 @@ static int __init mux_init(void)
>  		mod_timer(&mux_timer, jiffies + MUX_POLL_DELAY);
>  
>  #ifdef CONFIG_SERIAL_MUX_CONSOLE
> -	        register_console(&mux_console);
> +		register_console_force(&mux_console);

The situation here is the same as in 16th patch for
ma35d1serial_console().

Also "mux_console" is assigned to

static int __init mux_probe(struct parisc_device *dev)
{
[...]
		mux_driver.cons = MUX_CONSOLE;

		status = uart_register_driver(&mux_driver);
[...]
		status = uart_add_one_port(&mux_driver, port);
[...]
}

So, that it can get registered also by:

  + mux_probe()
    + uart_add_one_port()
      + serial_ctrl_register_port()
	+ serial_core_register_port()
	  + serial_core_add_one_port()
	    + uart_configure_port()
	      + register_console()

And we would need to pass the "force" information via CON_FORCE flag.

Best Regards,
Petr

