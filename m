Return-Path: <linuxppc-dev+bounces-15736-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 05333D1F64C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Jan 2026 15:23:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4drpHd3Mbrz2xNg;
	Thu, 15 Jan 2026 01:23:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::441"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768400589;
	cv=none; b=JOJ9SOOT78dEFrtLEs4S6S49A+KawHhmGoDfKGXoxXuLYH6VozMTDr3wDldEEfJfV1wXCAOdjbt4bwzfRQLgtj5RakDBp/DjI+Usqs2EqLm85VQs0xXqrs7QO1Is3zGxmzXmLlg0SdK5gEVZUkM6VtkdqWHRQsJoMiVMH3NjkgY+COWyEs0xbDYITkf0yYWCqSIZsaHxfUUkYFP2KNIXxFHW9DwMkgEXjwCD4VoCGVO0kImr/x8VoA/GkUZRXKVWdGThcd/BlyAvnhZZsVAabFxYRPaubZXMDK+VwS8KjIkUo1EijboYhNPKNUzWeQQVUvNi9/Du6iOK1xQ8gQ2MJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768400589; c=relaxed/relaxed;
	bh=rjJ0doliNf6plVmMYQkV7IlLiBwqr6x+viyB7m/anSs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HHn05TJsv9vxvnSkWXg2tClmwnkuttrOc5mHWDsiGdyjNHrmFMas77/DyB7uRDxG0Tl0aBL8OTP/bTmoidF0HoUepQ+ST/wjl2vl+n9+xuPglEgm3SEqHeQre4nmAItMgWWAE4XVuWamzFm2mtkC7E11lHjG1mEWMDS6iL3I46TF9plK0CbFUy39ZTcPzXru7rlAhKQHhpn97OIEcp+57+u573nlVUtGVy06jKkNqqlOllyhBde+R9kxdPM+vvM6CPG0PZSkdrNqOZ7DoyhAmHu36MPF31oj0+MPPG8niOuwCzPgwbshCso911HnLjshauBNrSoR2PF6dwCqzveCcg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=b5IpbKNM; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::441; helo=mail-wr1-x441.google.com; envelope-from=pmladek@suse.com; receiver=lists.ozlabs.org) smtp.mailfrom=suse.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=b5IpbKNM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.com (client-ip=2a00:1450:4864:20::441; helo=mail-wr1-x441.google.com; envelope-from=pmladek@suse.com; receiver=lists.ozlabs.org)
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4drpHb5cZDz2xMt
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Jan 2026 01:23:06 +1100 (AEDT)
Received: by mail-wr1-x441.google.com with SMTP id ffacd0b85a97d-432d256c2a9so4921282f8f.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Jan 2026 06:23:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1768400583; x=1769005383; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rjJ0doliNf6plVmMYQkV7IlLiBwqr6x+viyB7m/anSs=;
        b=b5IpbKNM/ccbd6DbcOelmD3TLxiGgVEDGWpdfwW8Og5aNC/6Klo4m1QlFdrnfWVrsb
         8XVsFd7lMUy0flJXvKvwQNsOXe03M38hFLv98fi8xafJuFwfJcBf8hthmyhPk89KMUZP
         bxvyYjwltbGdTlzwC0Td5CwZtIy1TquXIZKBgoqnojF+o1emkZ+rPtmSnnaNEleLP5vo
         51YzIyUjVQHnj+3wsYiH9quSi+gp++Sn27BxoGrsYAWGdc+1ULs4i6gee7TlPGCT/j40
         jf4jyx1YKF8kXJTMAlMhXz89aqffldLx2TqkoStJvZOPZPC1TZZEBXfcslJZ7yRZdDNy
         24QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768400583; x=1769005383;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rjJ0doliNf6plVmMYQkV7IlLiBwqr6x+viyB7m/anSs=;
        b=sVnF2PojqfdCNwFhfWaTZu5bJKc8Or0gGullpmRRABgdx7aXtZu5loz6fOKOeIQPnm
         UeHymR5wTfca7Jt6MWxjorXcD75yVosMioKBiPlwm0zXg6hlLziNe0nhyxvqVBoxgjux
         h7m99Uidf0J54t/h2sV3HeHqdEgH1s6fBingR9v0e4fkdWb2Me4CDdnxvprN+1y9AbLq
         2zgY26r5hdu3knGZfJNvxPvOnqL2pNP811EF35eI8cFj+BwuEnJqupEo0NEEKCY0YZuT
         4dqnLYIwd24glfspWtzkirmqF+iG7iGsh/lNzU8mnuWrQkL4yJYLnzFj2YGSyYSMxEfW
         yRUA==
X-Forwarded-Encrypted: i=1; AJvYcCUu6w1QEKn0TWtj6mNZhQ1z+SZ6IiTaycphfb0uN2YNjeMya9oANZ+g/AdZGwRrZxVR657Y9pC6OLos4lw=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwsOLai2cNwF6w5IhdfGlFPwo8tbkbFEG0ZuXBxILVmptncZUh/
	ar3gNyJbiz5IHCeWw3HL3NI1mhv31mVvnN7pUlS1eJuodutRMGTMOiyEwgL4j7LQfUQ=
X-Gm-Gg: AY/fxX4Js+Ct++4KHiJQWfbH66S2d1LM68FXs7IaVIh/qFi1rSDgYWBAKR1UI1i683Q
	x2dt1ej+K4LWFPyNiiTpodzspesESM50H7ROh1AKQccWUcBNupu2ZLlQKV01xKcTWpjtNg4NlkO
	6rP9ld9qVUhlBioEyUzDFtXR9xAv6W2vFP9RTV08e0aNQVNjxW/Q+H6g6bTBonxW9qjEOiDxyXX
	FwSd/OE1s7eMe157vicjUwSrKzp8HhkTZLOXf4cI1c/BpQ4/wCz1EvjCkIp06xb72UzCjA+dQ6w
	QvsiTs9gD50BaHG3oD+YvTHEUlOZvv8wbyOJ5mqNAPtfYiEiWNJwOdX4Tv1u5vsy+zaWH7nkow3
	3zc5nyX2NxXha2z1mbt2VnH/eIjQ1THkur/7avoiYSU8u7hw4VAtVBSfjn9bChE/vRrsWNWgtYW
	TKNjG83jRAD09Gfw==
X-Received: by 2002:a05:6000:3105:b0:431:104:6dd5 with SMTP id ffacd0b85a97d-4342c5728e2mr3256518f8f.58.1768400582935;
        Wed, 14 Jan 2026 06:23:02 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd0dacd1sm49446446f8f.4.2026.01.14.06.23.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 06:23:02 -0800 (PST)
Date: Wed, 14 Jan 2026 15:22:59 +0100
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
Subject: Re: [PATCH 06/19] printk: Introduce register_console_force
Message-ID: <aWemw2ZCwtAd17I1@pathway.suse.cz>
References: <20251227-printk-cleanup-part3-v1-0-21a291bcf197@suse.com>
 <20251227-printk-cleanup-part3-v1-6-21a291bcf197@suse.com>
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
In-Reply-To: <20251227-printk-cleanup-part3-v1-6-21a291bcf197@suse.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Sat 2025-12-27 09:16:13, Marcos Paulo de Souza wrote:
> The register_console_force function will register a console even if it
> wasn't specified on boot. The new function will act like all consoles
> being registered were using the CON_ENABLED flag.

I am a bit confused by the last sentence. It might be bacause I am not
a native speaker. I wonder if the following is more clear:

<proposal>
The register_console_force() function will register a console even if it
wasn't preferred via the command line, SPCR, or device tree. Currently,
certain drivers pre-set the CON_ENABLE flag to achieve this.
</proposal>

> The CON_ENABLED flag will be removed in the following patches and the
> drivers that use it will migrate to register_console_force instead.
> 
> --- a/kernel/printk/printk.c
> +++ b/kernel/printk/printk.c
> @@ -3858,7 +3858,7 @@ static int console_call_setup(struct console *newcon, char *options)
>   * enabled such as netconsole
>   */
>  static int try_enable_preferred_console(struct console *newcon,
> -					bool user_specified)
> +					bool user_specified, bool force)
>  {
>  	struct console_cmdline *c;
>  	int i, err;
> @@ -3896,12 +3896,15 @@ static int try_enable_preferred_console(struct console *newcon,
>  		return 0;
>  	}
>  
> +	if (force)
> +		newcon->flags |= CON_ENABLED;
> +

This makes sense because the pre-enabled CON_ENABLED flag is handled
right below.

>  	/*
>  	 * Some consoles, such as pstore and netconsole, can be enabled even
>  	 * without matching. Accept the pre-enabled consoles only when match()
>  	 * and setup() had a chance to be called.
>  	 */
> -	if (newcon->flags & CON_ENABLED && c->user_specified ==	user_specified)
> +	if (newcon->flags & CON_ENABLED && c->user_specified == user_specified)
>  		return 0;

But this location was not a good idea in the first place. It hides an unexpected
side-effect into this function. It is easy to miss. A good example is
the regression caused by the last patch in this patch set, see
https://lore.kernel.org/all/89409a0f48e6998ff6dd2245691b9954f0e1e435.camel@suse.com/

I actually have a patch removing this side-effect:

From d24cd6b812967669900f9866f6202e8b0b65325a Mon Sep 17 00:00:00 2001
From: Petr Mladek <pmladek@suse.com>
Date: Mon, 24 Nov 2025 17:34:25 +0100
Subject: [PATCH] printk/console: Do not rely on
 try_enable_preferred_console() for pre-enabled consoles

try_enable_preferred_console() has non-obvious side effects. It returns
success for pre-enabled consoles.

Move the check for pre-enabled consoles to register_console(). It makes
the handling of pre-enabled consoles more obvious.

Also it will allow call try_enable_preferred_console() only when there
is an entry in preferred_consoles[] array. But it would need some more
changes.

It is part of the code clean up. It should not change the existing
behavior.

Signed-off-by: Petr Mladek <pmladek@suse.com>
---
 kernel/printk/printk.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
index abf1b93de056..d6b1d0a26217 100644
--- a/kernel/printk/printk.c
+++ b/kernel/printk/printk.c
@@ -3826,14 +3826,6 @@ static int try_enable_preferred_console(struct console *newcon,
 		return 0;
 	}
 
-	/*
-	 * Some consoles, such as pstore and netconsole, can be enabled even
-	 * without matching. Accept the pre-enabled consoles only when match()
-	 * and setup() had a chance to be called.
-	 */
-	if (newcon->flags & CON_ENABLED && pc->user_specified == user_specified)
-		return 0;
-
 	return -ENOENT;
 }
 
@@ -4022,6 +4014,14 @@ void register_console(struct console *newcon)
 	if (err == -ENOENT)
 		err = try_enable_preferred_console(newcon, false);
 
+	/*
+	 * Some consoles, such as pstore and netconsole, can be enabled even
+	 * without matching. Accept them at this stage when they had a chance
+	 * to match() and call setup().
+	 */
+	if (err == -ENOENT && (newcon->flags & CON_ENABLED))
+		err = 0;
+
 	/* printk() messages are not printed to the Braille console. */
 	if (err || newcon->flags & CON_BRL) {
 		if (newcon->flags & CON_NBCON)
-- 
2.52.0


It would be better to do the above change 1st. Then the @force
parameter might be checked in __register_console() directly, like:

	/*
	 * Some consoles, such as pstore and netconsole, can be enabled even
	 * without matching. Accept them at this stage when they had a chance
	 * to match() and call setup().
	 */
	if (err == -ENOENT && (force || newcon->flags & CON_ENABLED))
		err = 0;

You might just remove the check of CON_ENABLED in the last patch.
I think that this should actually fix the regression. It will
handle also the case when the console was enabled by
try_enable_default_console() and try_enable_preferred_console()
returned -ENOENT.

Note: I have some more patches which clean up this mess. But they are
      more complicated because of how the Braille console support
      is wired. They still need some love. Anyway, the above patch should
      be good enough for removing CON_ENABLED flag.

Best Regards,
Petr

