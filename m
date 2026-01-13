Return-Path: <linuxppc-dev+bounces-15649-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E556D1A397
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Jan 2026 17:27:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4drF523gMRz2xl0;
	Wed, 14 Jan 2026 03:27:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768321622;
	cv=none; b=Cj6i0AatBmdQBLTUk2AWmgI02c5cABkixzFY5By11JJV/tJq4BmcYockLbH9bVjnrG2sCY2J9ueI+vaA9ITSDpTdjpd4hhHjcQtzz1FHiKboZElZWRmkjiZBc1EpMY6mWhzydbQlGQ26c2K56gT0GfD4Xz8cd8jtMtEfR1pU5cYmQ86C16nGCPzjtFh3GM2Ev/Ju4VvI9ZmIEqpMDn1hgexmnppB/5l0fKFJHbWcD1W6BtX+Fr1waTtCRLIpJxMuOhvX7RLynS8Uo/DS+8jwfyw8Asl1Iy5dtXEduGYcPFk/3G7GMwJnGJ0d5amJxZZ+sulcdleklzZEPMoJ6x1thQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768321622; c=relaxed/relaxed;
	bh=y9kSWtn88k+QkPqpOG7NN6Fxk/gRH5gvJVVHZoYjlVA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ltEZkYXS4d5cMukwEXZ6JEBES9D6fL4wJT7fzAFm+3uNkteUFnyj2wIf+Zuej39BQ3hBg8q/4jaLpkHkZzQa30OYjY1pG19/PkCn6UGueKObr2aeLH68VIO73GPLQFzRG68BxRDBENkaPxEJzA7UX4ZEblSM272ptQF/XemTe2QlsgMHWE76sRX3d/VLLjWsISd9FDiAgD/4tPFV9WltkNwSJcdlMnwAV3VrGsq69D2iDrXnAEmZXQBtHwK6Py51OsQ9qH3LvUr7GCfFg7MiLgM6JRTRdYpEXIhDcalXk4b5llACWg2y+kZLr/bueBNYyYI75cDUzp5H7fWnaUHezA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=RgM06nLN; dkim-atps=neutral; spf=pass (client-ip=209.85.128.51; helo=mail-wm1-f51.google.com; envelope-from=pmladek@suse.com; receiver=lists.ozlabs.org) smtp.mailfrom=suse.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=RgM06nLN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.com (client-ip=209.85.128.51; helo=mail-wm1-f51.google.com; envelope-from=pmladek@suse.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4drF511fwzz2xjK
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Jan 2026 03:27:00 +1100 (AEDT)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-47d3ffa6720so71218545e9.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Jan 2026 08:27:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1768321556; x=1768926356; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=y9kSWtn88k+QkPqpOG7NN6Fxk/gRH5gvJVVHZoYjlVA=;
        b=RgM06nLNuoXQOP0k0AU9S5/gqQs5mxDljMujnneMeSS+yNx+3e93SP2p12xaTMaoPc
         n8vxzg0gd54v1wDNRz/ca3yLMhGzAp2KUtp6z6IHR7a6sPoJFTKcvgr4KQDVViYCMFI0
         G1bb7X7PuHd4dbozMJjKQZRgaabgs/VUmjrJIw4DagGjRc+wzct6H7idDG4SGGEneb9I
         eC0oiltSEsi4gn235O5Y/E5qzRGrTtUj10clR/ic66OiwlrZfgcpuw//0P2x5+woSk1X
         2OS5f4YZBIhhcuPuNERAVodZS1QHGiUi15qqllDjwpWZGViM0AU+0E8hk8t9ZeRGQeoY
         lJyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768321556; x=1768926356;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y9kSWtn88k+QkPqpOG7NN6Fxk/gRH5gvJVVHZoYjlVA=;
        b=ZHluSwIgOkU55Pv4f7qwE9KeY7a/RVz+6snG4i/vtFhkKIxWWu595krsRfHwJcPft3
         TYU850Vfm9tRPD56NzHVSRyxIzrb2jNe5RDLmE/0y8nRApiVik7qqWUxaIImuw9Kix8p
         XKIudA1CjbRIeFdPfLfHnT/qxHj+jRO/PL/97lXabK98+mx5q8MZ4mWqT84DluD/dXQq
         LxjJTN25R7hAP3p48Qg3MfcZwKohpZ76MjIGG8RPf87/RWt1F31sJXp5WjvYxoH3u0rm
         v19zK9MHbleCjpooN7fww7soLExo6Tdqdhj6tUeBx0AGpA64HsSow/Iaz5/51eQo+fxv
         95FA==
X-Forwarded-Encrypted: i=1; AJvYcCVfhcJG7mwGn7YmoD+YfhRPg3urt4MmjZwNs33Ft6TcnwllhSbpFJMLkDYMXdh92jO+NIXGGL8W1jqz8gY=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yzc5EI/ugse/hhw4h0NjIVd3P/iQnKSjXbCSfrnHH7gHPvkHR17
	85kR8QwJvA8f6xFrqqIJ9Cfbnd9kPPhfAPxnYg+UcMjzMOtJ8qspTQIARcztQKJWkV8=
X-Gm-Gg: AY/fxX6oXPwIL39sEV8/SYxS0WngwfxBw9XrwRCnRwyNB5ZWwA8jgArJ0Fe/bKj23Pp
	wgIb5MlATslugZOMTRxdTH5P6vBnO6bAmog9Do5Q1AgC50lTUErq6hDZvbyCKF2A3NKPPimtPBm
	a9pXijF4+voyl4kPRAp4Ufcpo9VS5V7cUFTRRx24KqlG/JoEozcD+2YVBPn0KOB18E0tIBTmsd4
	65ZDjHSCC12sPIGO+pkiqPzXUGMBrNFTSRfQb5l3n3A9fEe1MrL9Qd3X/tIRkLvTH0QIW2lIBn4
	EJ/B1lTUmxdhG1xdJdZWJrTr7noL4IKHlguL9xIOuxtax8T9h1CyTRhxeywYnesDN1crickX1tb
	X1sOSfZOrs8+lcJY4MMjAbhwNuUVh/QycduFjJvEda6aIhEXFKngf9steicV2SMrrrUzznZlYI2
	PeIHP80X8gikLfIr6hiCWqLFMs
X-Google-Smtp-Source: AGHT+IG4o2sMRbjal/wNqE1AyBhrQEhgOmuQP9i1Wb50Y85ZgDNaJvwCCbv/cl0e10bMkrsnwOfPLQ==
X-Received: by 2002:a05:600c:1e1c:b0:477:58af:a91d with SMTP id 5b1f17b1804b1-47d84b0aa4bmr229523325e9.5.1768321556267;
        Tue, 13 Jan 2026 08:25:56 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd0dad8bsm45637605f8f.8.2026.01.13.08.25.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 08:25:55 -0800 (PST)
Date: Tue, 13 Jan 2026 17:25:52 +0100
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
Subject: Re: [PATCH 01/19] printk/nbcon: Use an enum to specify the required
 callback in console_is_usable()
Message-ID: <aWZyEHsOJFLRLRKT@pathway.suse.cz>
References: <20251227-printk-cleanup-part3-v1-0-21a291bcf197@suse.com>
 <20251227-printk-cleanup-part3-v1-1-21a291bcf197@suse.com>
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
In-Reply-To: <20251227-printk-cleanup-part3-v1-1-21a291bcf197@suse.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Sat 2025-12-27 09:16:08, Marcos Paulo de Souza wrote:
> The current usage of console_is_usable() is clumsy. The parameter
> @use_atomic is boolean and thus not self-explanatory. The function is
> called twice in situations when there are no-strict requirements.
> 
> Replace it with enum nbcon_write_cb which provides a more descriptive
> values for all 3 situations: atomic, thread or any.
> 
> Note that console_is_usable() checks only NBCON_USE_ATOMIC because
> .write_thread() callback is mandatory. But the other two values still
> make sense because they describe the intention of the caller.
> 
> --- a/include/linux/console.h
> +++ b/include/linux/console.h
> @@ -202,6 +202,19 @@ enum cons_flags {
>  	CON_NBCON_ATOMIC_UNSAFE	= BIT(9),
>  };
>  
> +/**
> + * enum nbcon_write_cb - Defines which nbcon write() callback must be used based
> + *                       on the caller context.
> + * @NBCON_USE_ATOMIC: Use con->write_atomic().
> + * @NBCON_USE_THREAD: Use con->write_thread().
> + * @NBCON_USE_ANY:    The caller does not have any strict requirements.
> + */
> +enum nbcon_write_cb {
> +	NBCON_USE_ATOMIC,
> +	NBCON_USE_THREAD,
> +	NBCON_USE_ANY,

AFAIK, this would define NBCON_USE_ATOMIC as zero. See below.

> +};
> +
>  /**
>   * struct nbcon_state - console state for nbcon consoles
>   * @atom:	Compound of the state fields for atomic operations
> @@ -622,7 +635,8 @@ extern void nbcon_kdb_release(struct nbcon_write_context *wctxt);
>   * which can also play a role in deciding if @con can be used to print
>   * records.
>   */
> -static inline bool console_is_usable(struct console *con, short flags, bool use_atomic)
> +static inline bool console_is_usable(struct console *con, short flags,
> +				     enum nbcon_write_cb nwc)
>  {
>  	if (!(flags & CON_ENABLED))
>  		return false;
> @@ -631,7 +645,7 @@ static inline bool console_is_usable(struct console *con, short flags, bool use_
>  		return false;
>  
>  	if (flags & CON_NBCON) {
> -		if (use_atomic) {
> +		if (nwc & NBCON_USE_ATOMIC) {

This will always be false because NBCON_USE_ATOMIC is zero.
I think that it was defined as "0x1" in the original proposal.

Let's keep it defined by as zero and use here:

		if (nwc == NBCON_USE_ATOMIC) {

Note that we do _not_ want to return "false" for "NBCON_USE_ANY"
when con->write_atomic does not exist.

>  			/* The write_atomic() callback is optional. */
>  			if (!con->write_atomic)
>  				return false;


Otherwise, it looks good to me.

Best Regards,
Petr

