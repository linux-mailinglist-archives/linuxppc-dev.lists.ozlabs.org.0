Return-Path: <linuxppc-dev+bounces-15733-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 641F2D1EFEF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Jan 2026 14:12:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4drmk41DJ0z2xT6;
	Thu, 15 Jan 2026 00:12:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::336"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768396348;
	cv=none; b=nx1qIXlhgGpWc0NTk4oA8oRi55m8r1rpRlPt8JxqGBHLgTC9mfuWgnJ5m1SjMSq2DfJIH4QZR9078Z2+By9LXskoni/omAbDAMlvNg5giVuJRv6OqEOmzCbngxFD4xL44eR4T40TKpoJsxYBOI+2Y3ZKrY/zNCpdWugClvrRqYiIFiTtxBPz/h+oSQgD2vp61THvuBYd1eMnl+M9kMLymnZwy7bRCkQo6zxwhu2xwLtZEnqh/UB6pI264hdTOYEVFH5t2LfXPeFqhGezXgifBWtoXz1sEJmljQ1wGJ+8I4glxPBErZ5BcKDa/IqK2IIOYdVYmp2bTVgJK1lyweuhCA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768396348; c=relaxed/relaxed;
	bh=ucpTGToIn8N6Wm60fm7MZ05SRRlKYptl+ek5X25PfwQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iKoHifse27bMdPRSW8R+HUIVOjFvggz1qINPl/9c8X+dCsOXRvLX+S/pZgSDnUnL1sSKXCHKtCoRokl1M8qAtOft97J7z6R58J0C65yYo70rKOAtd3fByv112vsmVq5rZ/rSNCsmhCw1OqodudHo+STouQLdb6S3ER/y99kTQncelP9obOiMgm7H3SJXR/zpMKANp/nRGEaRf5djhuuQZ1qB7hnJNTPASG2L9G4BKyBWHIH95NGq5i0/grG6eA69zfTRPgVGI7uXBZfMPQv3CsZV0MGwODYilYgJMm3ZTMHAjjmPbX6+LfdOD7LlL7dS3tLZzylNR0qhEaVktu1oMg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Hfblj1sv; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com; envelope-from=pmladek@suse.com; receiver=lists.ozlabs.org) smtp.mailfrom=suse.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Hfblj1sv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.com (client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com; envelope-from=pmladek@suse.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4drmk22FJ5z2xMQ
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Jan 2026 00:12:25 +1100 (AEDT)
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-47d3ffa5f33so39470605e9.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Jan 2026 05:12:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1768396342; x=1769001142; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ucpTGToIn8N6Wm60fm7MZ05SRRlKYptl+ek5X25PfwQ=;
        b=Hfblj1svQHqJu0EIGQSgvpOcEHQg3EZs2fj5NyBSLeihVDirKyO+iqxHouIR3x4CTJ
         MB0LcCayKOw+SxTiHAXJoqF0vfuRN7lbpZ/O4wQbApVCBsnJUe45L4Bbajq/9RH0lZIF
         FJgOEdrZ0LdsrmF9jQk8J28ENl+N1X5VZJ7HIm/SUkDMsi7GsPubeLS2di9JKfilYpzN
         csd8uKF+dEi7Jbz1xX7PTFyCKaR3em02JgXrNtSsePk8yWL45sXkccKiuIRJoeyXm19D
         BuyPmjEsxxdmfCoA6EkU4SMm353EbsP8S037OqyTY1l5j7MjmwdIhDkUH3sHQx176qcK
         dXSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768396342; x=1769001142;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ucpTGToIn8N6Wm60fm7MZ05SRRlKYptl+ek5X25PfwQ=;
        b=XCKYHvYmqgzQPY/4FkuVhnNDXdtppLt5YiQeGj6crQEf9caq+zQASHP6O2/XmAGY8r
         1a0ejmgxvb+qP+SOi3bGmUXzt3fBSmTTseJCZTB11/woxuzagcYAw2bPjU0pGOoGnkfl
         o3n+3OJrDdFNWzI+EnF0h4/Iq2JOgwPoRu5mQBFpXwPkpHR3KxOU2ygMGZrNbgmozt0g
         bYcVmRwNeukLnZ7ZshIkK8cslWkJIlmFMoXX8pffU0SbJh2+ZfHlLufUBEsJib6WxpN1
         7vzIYcaA55eZgtwXv4oNAPU81338gfbxm8hmWlZy7j7mLf5OS/cOeMQJJDez3Az04MiZ
         va1Q==
X-Forwarded-Encrypted: i=1; AJvYcCVGjqQETCfFPhg+NJt2FIi8Ghx6v8ATkW0+ipoNVq9S4EdpcLrj6ALLLLksc6V8T/9My3Mv+d0oZQ/Tzho=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YysWETK27R/sS2gKL9o9QMYkBORbdzc0fLyaRXzHyTJUB7JPOXt
	sUquqWnrPkQEGSr2TQ91vD23rtys6FxidWpPWOUDIa15sUiTiq/nKFV6BAuQmt7S9wc=
X-Gm-Gg: AY/fxX7xZcdGUJ/IoR0ndycCFoD0z3sOsir0U47LQHJjjMnhCgbzjT8HQsp6p2yPIiG
	0L4tvuOh3W9ZljnSqstM6qE1nqukvjyuxBRequl35lqCc+cOpX76dJH9FGJYvAL3jIHBEdWQYVW
	qK+oQN2mOd2QeWMrqYwCgHRn3c6yG71jRxHfJko/n+zLmBcTEZsk1sdB/gKRJA0T1w6AZEjjenb
	qwf4IyGUeQCNah2pGUM/SqVv+SllqWoJPQRbdKupUKrwXsQMPA9bc5AkMiS518baekU0wFkZuMb
	zcBoJ89EaC563KasA0Wgbo3jL0xGo0iS/GC9U0+ZbYAx1jZBUYIiCeQU040bziEP7Bpb/ebtL/z
	jji+B3kchoycuAiEVzEvuKbmd8sZL8PWGuhP0h2dyTFazeMCH1zqW8QQL2efPupCLu+KPyJBIZQ
	BOL7MfcKZkoQ29Zkz2b3Z3ON+y
X-Received: by 2002:a05:600c:5490:b0:479:3876:22a8 with SMTP id 5b1f17b1804b1-47ee3356d5dmr36820375e9.16.1768396341643;
        Wed, 14 Jan 2026 05:12:21 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47ee54b8c9bsm27274065e9.3.2026.01.14.05.12.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 05:12:21 -0800 (PST)
Date: Wed, 14 Jan 2026 14:12:18 +0100
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
Subject: Re: [PATCH 04/19] printk: Reintroduce consoles_suspended global state
Message-ID: <aWeWMga1VaT0sYwj@pathway.suse.cz>
References: <20251227-printk-cleanup-part3-v1-0-21a291bcf197@suse.com>
 <20251227-printk-cleanup-part3-v1-4-21a291bcf197@suse.com>
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
In-Reply-To: <20251227-printk-cleanup-part3-v1-4-21a291bcf197@suse.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Sat 2025-12-27 09:16:11, Marcos Paulo de Souza wrote:
> This change partially reverts commit 9e70a5e109a4
> ("printk: Add per-console suspended state"). The intent of the original
> commit was to move the management of the console suspended state to the
> consoles themselves to be able to use SRCU instead of console lock.
> 
> But having a global state is still useful when checking if the global
> suspend was triggered by power management. This way, instead of setting
> the state of each individual console, the code would only set/read from the
> global state.
> 
> Along with this change, two more fixes are necessary: change
> console_{suspend,resume} to set/clear CON_SUSPEND instead of setting
> CON_ENABLED and change show_cons_active to call __console_is_usable to
> check console usefulness.

I would invert the logic a bit. I think that the main motivation
is to replace CON_ENABLE -> CON_SUSPEND.

<proposal>
The flag CON_ENABLE is cleared when serial drivers get suspended. This
"hack" has been added by the commit 33c0d1b0c3ebb6 ("[PATCH] Serial
driver stuff") back in v2.5.28.

Stop hijacking CON_ENABLE flag and use the CON_SUSPEND flag instead.

Still allow to distinguish when:

  - the backing device is being suspended, see console_suspend().

  - the power management wants to calm down all consoles using
    a big-hammer, see console_suspend_all().

And restore the global "consoles_suspended" flag which was removed
by the commit 9e70a5e109a4 ("printk: Add per-console suspended state").

The difference is that accesses to the new global flag are
synchronized the same way as to the CON_SUSPEND flag. It allows
to read it under console_srcu_read_lock().

Finally, use __console_is_usable() in show_cons_active(). It is the
last location where the CON_ENABLED flag was checked directly.

The patch should not change the existing behavior because all users check
the state of the console using console_is_usable().
</proposal>

> diff --git a/drivers/tty/tty_io.c b/drivers/tty/tty_io.c
> index e2d92cf70eb7..7d2bded75b75 100644
> --- a/drivers/tty/tty_io.c
> +++ b/drivers/tty/tty_io.c
> @@ -3552,9 +3552,9 @@ static ssize_t show_cons_active(struct device *dev,
>  	for_each_console(c) {
>  		if (!c->device)
>  			continue;
> -		if (!(c->flags & CON_NBCON) && !c->write)
> -			continue;
> -		if ((c->flags & CON_ENABLED) == 0)
> +		if (!__console_is_usable(c, c->flags,
> +					 consoles_suspended,
> +					 NBCON_USE_ANY))

It would be better to move this into a separate patch.

>  			continue;
>  		cs[i++] = c;
>  		if (i >= ARRAY_SIZE(cs))

Otherwise, it looks good.

Best Regards,
Petr

