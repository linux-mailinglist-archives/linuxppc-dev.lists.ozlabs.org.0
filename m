Return-Path: <linuxppc-dev+bounces-15658-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C07AD1AAD5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Jan 2026 18:38:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4drGgP2F6Pz2xjb;
	Wed, 14 Jan 2026 04:38:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768325905;
	cv=none; b=MrmaixRE/fc+ddk2v5N+012SPyBlbUUzz7qJ5AnTyaVXbNJMGtAb11eJRxiqeC9XlwHfaPz75Yc9hulCtBXd9+6fEHZUx6WveunE1Y6QuN7GhyP2rRBfKfdVrIQeufl5NMwr62FxZm67yVvjoi40/zKiNQe6FW4OEcEkb+v/gZazAJ4XUCXFNzmF7lTGOTb9hbwIqAumgW45E2Y8vlA1pTVe7SHq9ZZxgK9R27+VHed8WqDZzQn6POhQ+3aL+T+NgUMJnNkOq8tyTbyiY33J8GWl/FK9UzzC+CHSn3uU2ouP1dc6+CgaMTZDTqMtUTfjFqi+lNUQQ3qQtReWlWFgdg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768325905; c=relaxed/relaxed;
	bh=/CVOy4tPw1zWY0e6rYcKRwtfrfRvUlKFzd8YTNoGp5w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gMiLBUjS0r47WSw8zz5qqeEE/OfImNNNkDOzMMm4R82U3mDpAp6sIMCt68nBHZoa++NrMnoMvYHWGE4jYXG6ttN7659EdH1itrasrJN7ewWb+1Pb/QgxDs+PJMe7MwJIaTgb7qp84cRcpHGe780lKHjCd/uxVDiu6H9jc8pUDnwpDGh+vEwLQbxggPqPAs0Vjvkzk9CvD3bq4IfOd11F2FU6i75i4gyfyB2i08d+Ub0wlTvCCdTajyvW5HiWSDQVuy2Afo1Zin9snO6LgAjttHm447g/5GXnTuU9EJAUdDfFkjBwTSDo7aWIqkWGHxlpNsa4pTvK00Vr7bQSjmdTVg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=URiGpBl2; dkim-atps=neutral; spf=pass (client-ip=209.85.221.49; helo=mail-wr1-f49.google.com; envelope-from=pmladek@suse.com; receiver=lists.ozlabs.org) smtp.mailfrom=suse.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=URiGpBl2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.com (client-ip=209.85.221.49; helo=mail-wr1-f49.google.com; envelope-from=pmladek@suse.com; receiver=lists.ozlabs.org)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4drGgM6Sslz2xWJ
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Jan 2026 04:38:23 +1100 (AEDT)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-430f5ecaa08so3739909f8f.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Jan 2026 09:38:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1768325840; x=1768930640; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/CVOy4tPw1zWY0e6rYcKRwtfrfRvUlKFzd8YTNoGp5w=;
        b=URiGpBl2IQX66coWtxWZapjMZXn9NKAQe7EMc7jFOu/fawhEL0KjegWODoAXqN+lTS
         TijPGEchlIPP3mf/EY+tAQTIeWDn3HzUYFGyj7y8hd6C7bCNUB0abOOAZZt1akO9Tv3S
         M225ATxbv+eYj7DS1YE5zdt4i5djIgP43GlqbKqpQRKTcFk0lYKbtIoSTbGj8VF93zQQ
         sbcZkV0kyplZvg4lCEBUVQbIpB76cYkIMFl1DUMK8dZzdQV9qYmpUs2jPrJfnNfy98OZ
         Z6Bh6+ngHuiCuf0rObpCCuU/dLMf/7iVEpApnoiaCv8Op84CRBcERA8t+vkUmjsmTDfq
         p+wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768325840; x=1768930640;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/CVOy4tPw1zWY0e6rYcKRwtfrfRvUlKFzd8YTNoGp5w=;
        b=PLqqxlk4MrQq5/802cGvJrx6tic6o7kmdYJq153obbYXkeyxZFEG2FGasrI/HObHJF
         4Du010GhKopuPVK+wdxUzA32047F+hix7tQ5XtUYCIwq3F9gb4ifmqnZbatJJox/MnWX
         StDJXF3ol24IPGGsUm4lDoF6eXKNyxVdi8sue8ydopQx5OqBxlq6qa6w6fArYZJl1WhE
         +Bbpk3LSFV0a9nOMQljUcRILU4aqASu2KUsTN2w1sNon7nRZlJs6B2WjW9h8RtDMUahn
         WJSw3Q2lpN2nbAD3g82O8dbXek+DwX0XIsEROA/UkflwpQVncjLXKynlZM4UrDaf2YAd
         36qQ==
X-Forwarded-Encrypted: i=1; AJvYcCVxXB3esn3j+5/ngIlFfRZzyJY0+2I88MIMBvLiPeCECeE4/N9e0xAz/ydr9QaIo5eho1TvhUVxqbEBEZw=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yw3boc/GHDs6+3sIRv5A8GxULQR3Zfh3T1TMKYKx8AdOVyDeiWz
	d9JCtohL/+8gRIhdcFc4N3hIGPPyQf9nxbIN+GAGx2ViF87+zuDFTyYzhhLviAHiqRM=
X-Gm-Gg: AY/fxX5h+CIVTmGFNs4heQCjG30gDfz92AYbXRIFSXMEuz6FsT0QJtu5mF2z+947nlh
	CmvCJSo5mDptBSJQZjX9TWETnSf1QVMWAWiWZkRUjHFY9mUyTYosHU6nKV1u2RKW5cXOc5tkqYw
	V+qRMsZKsc4PMEBcUnVlV8IXgV2qaRRPcdMrkgpAUcUCTPV3G+7oB4pY5wFLxGISwkpVP+tGisl
	zwmyxoxSnDeMiIf89HBJdHsT8Rbn50x/WSPLmc+lOMHRyrZIswda9tZ7Lya6RoKlGuwNhgAEl7S
	Oy+8yYHOi6x+BEQs48+3C76gUH4KSGskbN/TwKggzaX4eUSeSuix4gTlcCgdhwYxKm752eayjyZ
	SCcCaCopLhFm/LGhN5aYinB+VRgLOK5FeA12UlBYjXH6HpYmQi5KdMHhvao4qlpf0BcB6ac2p/3
	aghFCUnFOKMbCb2A==
X-Google-Smtp-Source: AGHT+IHUReQqvVgC0db5F0/UgqAPwHgCcpq2ZD0lhm0g7XnDeEa3Phlj1/GEitKl8zvqkUFbSZC6XA==
X-Received: by 2002:a05:6000:2dc9:b0:430:fced:902 with SMTP id ffacd0b85a97d-432c36436fbmr29258778f8f.26.1768325840268;
        Tue, 13 Jan 2026 09:37:20 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432d9610671sm28342147f8f.34.2026.01.13.09.37.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 09:37:19 -0800 (PST)
Date: Tue, 13 Jan 2026 18:37:17 +0100
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
Subject: Re: [PATCH 02/19] printk: Introduce console_is_nbcon
Message-ID: <aWaCzZ8_UuyAa6xp@pathway.suse.cz>
References: <20251227-printk-cleanup-part3-v1-0-21a291bcf197@suse.com>
 <20251227-printk-cleanup-part3-v1-2-21a291bcf197@suse.com>
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
In-Reply-To: <20251227-printk-cleanup-part3-v1-2-21a291bcf197@suse.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Sat 2025-12-27 09:16:09, Marcos Paulo de Souza wrote:
> Besides checking if the current console is NBCON or not, console->flags
> is also being read in order to serve as argument of the console_is_usable
> function.
> 
> But CON_NBCON flag is unique: it's set just once in the console
> registration and never cleared. In this case it can be possible to read
> the flag when console_srcu_lock is held (which is the case when using
> for_each_console).
> 
> This change makes possible to remove the flags argument from
> console_is_usable in the next patches.
> 
> Signed-off-by: Petr Mladek <pmladek@suse.com>
> Signed-off-by: Marcos Paulo de Souza <mpdesouza@suse.com>
> ---
>  include/linux/console.h   | 27 +++++++++++++++++++++++++++
>  kernel/debug/kdb/kdb_io.c |  2 +-
>  kernel/printk/nbcon.c     |  2 +-
>  kernel/printk/printk.c    | 15 ++++++---------
>  4 files changed, 35 insertions(+), 11 deletions(-)
> 
> diff --git a/include/linux/console.h b/include/linux/console.h
> index 35c03fc4ed51..dd4ec7a5bff9 100644
> --- a/include/linux/console.h
> +++ b/include/linux/console.h
> @@ -561,6 +561,33 @@ static inline void console_srcu_write_flags(struct console *con, short flags)
>  	WRITE_ONCE(con->flags, flags);
>  }
>  
> +/**
> + * console_srcu_is_nbcon - Locklessly check whether the console is nbcon

There is _srcu in the function name, see below.

> + * @con:	struct console pointer of console to check
> + *
> + * Requires console_srcu_read_lock to be held, which implies that @con might
> + * be a registered console. The purpose of holding console_srcu_read_lock is
> + * to guarantee that no exit/cleanup routines will run if the console
> + * is currently undergoing unregistration.
> + *
> + * If the caller is holding the console_list_lock or it is _certain_ that
> + * @con is not and will not become registered, the caller may read
> + * @con->flags directly instead.
> + *
> + * Context: Any context.
> + * Return: True when CON_NBCON flag is set.
> + */
> +static inline bool console_is_nbcon(const struct console *con)

And here it is without _srcu.

I would prefer the variant with _srcu to make it clear that it
can be called only under _srcu. Similar to console_srcu_read_flags(con).

> +{
> +	WARN_ON_ONCE(!console_srcu_read_lock_is_held());
> +
> +	/*
> +	 * The CON_NBCON flag is statically initialized and is never
> +	 * set or cleared at runtime.
> +	 */
> +	return data_race(con->flags & CON_NBCON);
> +}
> +
>  /* Variant of console_is_registered() when the console_list_lock is held. */
>  static inline bool console_is_registered_locked(const struct console *con)
>  {

Otherwise, it looks good to me.

With a consistent name, feel free to use:

Reviewed-by: Petr Mladek <pmladek@suse.com>

Best Regards,
Petr

