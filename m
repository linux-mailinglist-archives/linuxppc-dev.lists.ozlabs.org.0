Return-Path: <linuxppc-dev+bounces-15815-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CAA30D240FA
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Jan 2026 12:06:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dsKsg2qnNz309N;
	Thu, 15 Jan 2026 22:05:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::441"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768475159;
	cv=none; b=WEWs78MvjcY1qh7e1OgVhUFDOF4o1oYCROOJEYpmgJmp3yOgCYi9f+FcEde2Crzs+x4HRQUrHDloZByX6so68tGdfVUHrUVrOkDX6KRYHVjAtpqChZEhcCsHOoBRIbBv06FyJQla76UMtm2/Y3MPvutUDoQCDB6OFGld5On4psdo1JMwPvpzbI0KivMWkp11U9Y4D6xEt08BtUC92RhkOxNZk9tLn7jUMkziPIKEdLKNOQgInTB7XZucna5xs2i6Z4tS/TdSxUatAn6oya+3tT9mZ6kBIQOR0GBypqsM+aRFSfX8c8doTFdc8JSb7IBSzDmMXWzh6TrnkbAVgduMMA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768475159; c=relaxed/relaxed;
	bh=AuZzUvIQYamq4W1YoLrzX7y0En5/TpcBTyFE7gx3A0A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DqYRawg9iiy+VSQUt+mZBcq67B5Wm0hDQeta5UO3xk6jcD6Rodade5gHEjo0qqqd5D7N7ml3ZIoitMm/TlyoQreWWbLL36E8nPaiR/F6fIPBo29nLUJ6mfsv4ys0NDn0K3M+mzReaPMspzKAYpnOzvvbQ+iPjSjpYfxcNUW6MzBcvauIPBW1bH1487R4LriwH1nfVjqwnH5n7xZigIQu2gcLgE8EoGo8B96PlKRL+0Y8fwNUv5Q2CYHnihvY0SqsRz+nrUM0VNiRcrIjPcd9CoMZb5iMtgVC/CQ164hwQJqhrrJWFOy1o2gTBw06FwxM2ZcKbarkG51QcNrKixaNFA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Vph05Mvp; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::441; helo=mail-wr1-x441.google.com; envelope-from=pmladek@suse.com; receiver=lists.ozlabs.org) smtp.mailfrom=suse.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Vph05Mvp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.com (client-ip=2a00:1450:4864:20::441; helo=mail-wr1-x441.google.com; envelope-from=pmladek@suse.com; receiver=lists.ozlabs.org)
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dsKsf0YWJz2xJ6
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Jan 2026 22:05:57 +1100 (AEDT)
Received: by mail-wr1-x441.google.com with SMTP id ffacd0b85a97d-432d2670932so671736f8f.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Jan 2026 03:05:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1768475155; x=1769079955; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AuZzUvIQYamq4W1YoLrzX7y0En5/TpcBTyFE7gx3A0A=;
        b=Vph05MvpUCxtpiAr0G1E7jkcl6SiCy7j7LcZff+B7ZDegPslBKOES9wfSb9KgtIF6O
         akHa/KkJL5gpYam9kFudqA9VJiEnDdIafmwS2REkWjOaKwB0ESmMD+axo0dbRqAaLiUD
         Db/qQvQjXY/eWMH2pvMmWjG31MwVMNSJXW4s1a/P4KtLv2nzyHOvd4CBeDDIqS49vnEU
         ViCTfcXaOQIqylWLMLK60FS1tD50cl8+4h3FdMlO9Ra0nzyKnb5udz/6BW7bk906wePo
         KDOQ+CDLh8CSfp3TT9u8hEwYPDXaoFLmZPyqpWfLsVE6qTHHeR0C+kMPIt34gHdX4GgH
         SoJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768475155; x=1769079955;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AuZzUvIQYamq4W1YoLrzX7y0En5/TpcBTyFE7gx3A0A=;
        b=dkRVg6p2Z7pjE2VLFY/EKE6cRcMn4a2zyZaWRbl9nIKBGoFkhs3xZWNemiKg7Ku3qF
         qyGuFW3SohumpzQM7L2ci/FR8bBiEinAJXSyn2wJ7IvEEDiqL6IJMjBvxR6fGhi1E9Rv
         N94xkX7x/AZJKCRXFOyU0+FiP7wZls4JMERemH3dp7U32Z5QG9sr6IPXCEjPlyGuJiAK
         +gQMS4CT2wfxNGzOLUACrMcGfgVBs74ngzYg+yDujwQMr2k5L7pQZGyfbggctxOE0RYG
         1XcQIawSbu18gSaeeeYNSW7cvYsxi3lNMO+pYrnPKg3Wjt4DSjUap/Khb4saTzCpthdt
         OEig==
X-Forwarded-Encrypted: i=1; AJvYcCXZlq0vfYyP3P2dv5/I535T3Scr8yuWbrcqYl0qJcO0+LvmhiAOmBKvfyGJpQrrMvBYqKZv61Q5mymxhN4=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yy8Lfzu1pCtDFJvK+jcO0+vrReBqMaLEXOmApoYInxtmT9YqMMv
	DkGqulWqPrCC5dVP6+Hi3UE59r8ownLDOqn4t1qLx2ccC9Bk9hdFdBuYTomRyV0NOXE=
X-Gm-Gg: AY/fxX6Os/xxjKbYwQYXClEIXnbltvVQaJeTE6HIclOzysl7E5cw069tJl7LwUbKywV
	YKX4D2fWIc0aiXFBoXmV4ur8CzlDTyq0HsQI9yo5ZIctK/DeCmY/KIR2sZa0Hk8RrTh+FS7O4bA
	cz/R7CIEowK25zJDB/64gFWCCIV5r+O9Y/6+XlGNsr4Ah+i5MjXnFqwIEnxI10qs7grnwsLYOE2
	ppnpU9hB8ZYj1mgx0MWoQh+qZ81yt5rqBdpwyQ+zFAGuRv6ILWM9npnjan0LZ2hCn/N/A5tTnQR
	4tLROBwfQm8hye/96H3inFnP83+j8Ed5Vd8GpU/nPa3f/V7AtNksn1B7Jx8LHD37mZNzvIpuTmO
	z2aIV5/Hza+UzwMdFJdaaeiBwycuNZqQ+GUurB6lwEs3QVnkEwtbEHF3gs4usPVJVLUVzz7leyx
	s2GqvJc8X8q61FTw==
X-Received: by 2002:a05:6000:2f84:b0:430:fa9a:74d with SMTP id ffacd0b85a97d-4342d3912bcmr7103110f8f.24.1768475154515;
        Thu, 15 Jan 2026 03:05:54 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-434af6d909fsm5297949f8f.31.2026.01.15.03.05.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 03:05:53 -0800 (PST)
Date: Thu, 15 Jan 2026 12:05:51 +0100
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
Subject: Re: [PATCH 10/19] fs: pstore: platform: Migrate to
 register_console_force helper
Message-ID: <aWjKD4jv8CySV0Rj@pathway.suse.cz>
References: <20251227-printk-cleanup-part3-v1-0-21a291bcf197@suse.com>
 <20251227-printk-cleanup-part3-v1-10-21a291bcf197@suse.com>
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
In-Reply-To: <20251227-printk-cleanup-part3-v1-10-21a291bcf197@suse.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Sat 2025-12-27 09:16:17, Marcos Paulo de Souza wrote:
> The register_console_force function was introduced to register consoles
> even on the presence of default consoles, replacing the CON_ENABLE flag
> that was forcing the same behavior.
> 
> No functional changes.

> --- a/fs/pstore/platform.c
> +++ b/fs/pstore/platform.c
> @@ -418,10 +418,10 @@ static void pstore_register_console(void)
>  		sizeof(pstore_console.name));
>  	/*
>  	 * Always initialize flags here since prior unregister_console()
> -	 * calls may have changed settings (specifically CON_ENABLED).
> +	 * calls may have changed settings.
>  	 */
> -	pstore_console.flags = CON_PRINTBUFFER | CON_ENABLED | CON_ANYTIME;
> -	register_console(&pstore_console);
> +	pstore_console.flags = CON_PRINTBUFFER | CON_ANYTIME;

As the original comment suggests, this was done primary because
of CON_ENABLED flag. Otherwise, the console was not registered again.

register_console() might remove CON_PRINTBUFFER when there was
a boot console and the newly registered console will get associated
with /dev/console. But I consider this a corner case. Other console
drivers ignore this scenario.

I suggest to define the two flags statically in
struct console pstore_console definition as it is done by
other console drivers. Remove this explicit dynamic assigment.
And add the following into the commit message:

<proposal>
Define the remaining console flags statically in the structure definition
as it is done by other console drivers.

The flags were re-defined primary because of the CON_ENABLED flag.
Otherwise, the re-registration failed.

The CON_PRINTBUFFER might get cleared when a boot console was registered
and the pstrore console got associated with /dev/console. In this
case, the pstore console would not re-play the entire ring buffer
on re-registration. But it is a corner case. And it actually might
be a desired behavior.
</proposal>

Otherwise, the next generations of kernel developers might think that
the re-assigment was there because of CON_PRINTBUFFER flag.
And it might cause non-necessary headaches ;-)


> +	register_console_force(&pstore_console);
>  }
>  
>  static void pstore_unregister_console(void)

Best Regards,
Petr

