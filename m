Return-Path: <linuxppc-dev+bounces-15827-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FCE9D24653
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Jan 2026 13:13:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dsMML0PwSz309H;
	Thu, 15 Jan 2026 23:13:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::333"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768479197;
	cv=none; b=lQZ1NiPgRyS269V9jLitTwu0jMS4p6vG1NU4a4+3YwvRIyh0YnCk7fkMyFOcy8S9cvYUsVDxB52QfnXbZDm8Xzt8nty9TQIvpt+z5NZHWSGzS2xcSBk4qahUS9mqHSIQcw/hkD5E7qD08L1AsOgRuxLXfvdxBJYcK1ne+dW8joGJvIn/VvtkizFIDKL9yutmlP5UbMF+Ov8lsOTmOCt7F8uj2cC8X3CpwOKZGlJvws4enLbe2loh0CyiowPxUUnEO4ZmSnbof3h+q/YGJyQse2N48MmV9+4Ncm66y3uHyg/n1CoFpONSbLU649VxIR18NG+5v9FFcnkDYram0RmupQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768479197; c=relaxed/relaxed;
	bh=tARhp8b6WpUCQdTEvi4pG8l7ncFl190/VBWtO1OWxSE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b9TaxTptOUhOrU6tQGpuwpcSoETNd+S89HeM9+SbWgsAI9AUm4cuWgqXXEw5XJoLXo3CoEQl9cPkUCOk2EPf3aJWj3GSzvT5zGPbnk+Wu/y+NXUBoD1Wl0ARTzWjSYqukUI+grjLDgZZHsvR2xxwJSluf2EAxtgyhKRwfG/iDtOEfmWi7fvUeitA1fSRA8npBg3DRd+0J/rfxD5e3LLo5hokyGPzesM41oOzVORL6LTkOf71PseCeWduGAFXCshvVAs4+F2P6TI0cHW8zQZiHmQ8YGJrteKah1ZOt39slVvwCLnthUcn/L6XoocFrUryODAYGL2F2kQ8YqdoXxSQVQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=hDy1GNxM; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com; envelope-from=pmladek@suse.com; receiver=lists.ozlabs.org) smtp.mailfrom=suse.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=hDy1GNxM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.com (client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com; envelope-from=pmladek@suse.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dsMMJ0P4Lz2xNg
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Jan 2026 23:13:14 +1100 (AEDT)
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-47f5c2283b6so5175475e9.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Jan 2026 04:13:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1768479186; x=1769083986; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tARhp8b6WpUCQdTEvi4pG8l7ncFl190/VBWtO1OWxSE=;
        b=hDy1GNxMQIia9aRmAnyfmaY4TiqHVFKbuwzzJZrGoT41BMtrY7tY6+o3mHxJnP94+J
         g/Xmw8Kpwo0huZtWcZwLLyYaw3hnp6PkIRP9c8i//TF4h8np9Ley4ZIV6a7TiXSsQr+m
         /QILiiWvSvj9m0IoB/4P26e+bXTw9QRlmyO/iPhtgnVZY3jfOIsOYhBTH1WnPva++aXq
         6b9XjkcJp724KyiUeIPZJqUmMNj9ZQCdLwtS8l2RphP0UOf0JP6BNIOohcFm9b3Q0oon
         kdWa+1FQrXSHvGGPY412hHMPNHYxFQLg6gdH1uuHwg6I7W2zOL9VArU2iLavDhgFdLqU
         I7KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768479186; x=1769083986;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tARhp8b6WpUCQdTEvi4pG8l7ncFl190/VBWtO1OWxSE=;
        b=t76E/T5OTjFVDenFF+cE1sOHWWQO048ZCQGqw6oaAdSw/qKblGnhQdQSCVuSn+6v1G
         NPU0BFr85N/zZRQVoN5vEuZ+MCBP/VB8KvNwo+2o62oMFxMnf88ty6JjHv33LvjXECrC
         pwRyES/tuFHKRvijzNf8TDvuasl4jPUI8NPZCclV1uLtLAHKP4TME2I+5RU2GZo0NTlO
         7jaTp/HAs8Y3dnRRNY3+p5sshJIV3OoMZ1uReqgkMW5z4IUkChr8KJ2eX4lM57qdIt1t
         kr040uBcgZpyPjKnQXTeApco1gbj8u7q8EBDDQy/IUH/iZt4dYZlSS/TgPfcMeVO1wZc
         6hXA==
X-Forwarded-Encrypted: i=1; AJvYcCUvFfmwEaMIpO2gkEWCvcPz4SyFWLJYGCGhdUL0xvy69hAN3ioAEVsU7sZAnN/2S5UEknO44UtxWzOWSq0=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yxts3D9QC61NceSBBdgBYxrGMwTdVdWXN42Zz8PeSP7J5ggOIHV
	YZVXuPnQFGN1kPkpu04e1Ar7o9eZSR0SexiOeLl+ULZRvwH4sv/RtQSmxojcI7J5HMo=
X-Gm-Gg: AY/fxX6GalQymAz8RVkvNUAjJbzwfmsrFIQLqqefKIv7y6kg/mGZGNRhbcMSH9RF0Sq
	ycSYV9Gg671w4/sEkThlO6lDQYVsqph+9oOixLeRFPtpKfkAEvf0ugx1ekkh1XYVZsVqiLIWSCW
	kaFExJu58lSqlAtkOO7QxZshwgnfiferJnemtDVvRMcwsXU4PvTFuQs2xyK0/a1jhQVjg+NWmdZ
	J05mq6EaQKZEm0mzHQ6FYBwNgbkHB68vISVa4nsV60NBAxzjIInpqEsZATmg2gegWtJ3N2dQ1H/
	BersV0wtiZyiqwpm+ZuhbHdjqEfxsi7zDx89pvPxvygIc14ABsbrXnVZHSzHxIGIHS4w6y2x5Qf
	hGRQgT7Ei53H9EKXZAQ3/JuGwMTFRUexhbTajyeJWNIm4BhUGzpfGD28qQCUbYmKV65JWbc4UdT
	luSTH9PRSD/4NApA==
X-Received: by 2002:a05:600c:1c20:b0:47e:e712:aa88 with SMTP id 5b1f17b1804b1-47ee712ac96mr42613125e9.31.1768479186231;
        Thu, 15 Jan 2026 04:13:06 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4801bc3e57fsm22590935e9.5.2026.01.15.04.13.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 04:13:05 -0800 (PST)
Date: Thu, 15 Jan 2026 13:13:02 +0100
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
Subject: Re: [PATCH 11/19] powerpc: kernel: udbg: Migrate to
 register_console_force helper
Message-ID: <aWjZzuY31bg95jiy@pathway.suse.cz>
References: <20251227-printk-cleanup-part3-v1-0-21a291bcf197@suse.com>
 <20251227-printk-cleanup-part3-v1-11-21a291bcf197@suse.com>
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
In-Reply-To: <20251227-printk-cleanup-part3-v1-11-21a291bcf197@suse.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Sat 2025-12-27 09:16:18, Marcos Paulo de Souza wrote:
> The register_console_force function was introduced to register consoles
> even on the presence of default consoles, replacing the CON_ENABLE flag
> that was forcing the same behavior.
> 
> No functional changes.
> 
> Signed-off-by: Marcos Paulo de Souza <mpdesouza@suse.com>

LGTM, nice cleanup!

Reviewed-by: Petr Mladek <pmladek@suse.com>

Best Regards,
Petr

