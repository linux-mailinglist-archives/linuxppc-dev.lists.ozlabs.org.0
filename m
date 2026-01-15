Return-Path: <linuxppc-dev+bounces-15813-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A057D23EE3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Jan 2026 11:26:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dsK076G8Qz309H;
	Thu, 15 Jan 2026 21:26:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::329"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768472791;
	cv=none; b=JhdJ0NZqOQggy9L9khlgZxfgmI18cO3sAKu1mHY7ykEactXNkVHoKfce/ajVgBWsYLmbhZZKQ17T7Zo2C2Hw4YEHwaat0x6X5PvW8/dxqLlQinSz3NogGBlHkECDKnl+FhuD0ZNh7MF1UtgojdfOOFLKlCJNiFxqtEFpWZLbcUxPzo0GQSHSoO0TE2vcp6IUHyYZfbF8ueVNq8Fu0FhR4ItaiVviMRKfpYfCktFPGjYPxqDQEE5c4AwuoY4vJTTRdD+e/r3XmYRJNzJc5WMG/gFmMZJuD1eCSq2tTbGwi5y118GjpBFFyE9beinREjmxtBqRljO4+f+JvlBL8MOFfA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768472791; c=relaxed/relaxed;
	bh=JLly7CGERK95lIS5prsdJ95HAbwiiwFAFGJDvTd/YQs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CLxOipsIGFdhEjuahVj/sQGq1oLEQR9bGGEuqb6BmJWo0yV9OzfhePk9issgqTLVsabVmotH9o0QDl0ooA509IFFRxe/4xF4yisNknJHprlFpf+bQWBe0s5KndW+gRk2Xd2eVyBRVxXcTZgCCQfRgV2IddFcO7ukdH2jjIJgbYyvQGfVJD1HE9ftH2JI4OvyLoUFtIFD/aQpXKJQC159uuUZ0OEtJ/lRIKHihF7ZwmelsIu/19gUHT1x78na6tA7+hJGEYufqEZJnnkvPbv0WvqylkBgbLhleLv/t9RFwOQ+O14/T0ig43xmj9qMQ6vSoYKllM50s+MNDytTICR/HA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=P669AbOr; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com; envelope-from=pmladek@suse.com; receiver=lists.ozlabs.org) smtp.mailfrom=suse.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=P669AbOr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.com (client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com; envelope-from=pmladek@suse.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dsK064Yw3z2xqj
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Jan 2026 21:26:30 +1100 (AEDT)
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-47d63594f7eso4746525e9.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Jan 2026 02:26:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1768472787; x=1769077587; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JLly7CGERK95lIS5prsdJ95HAbwiiwFAFGJDvTd/YQs=;
        b=P669AbOrynfA5ftYyBpMyPnPJNO9KNQES/FMSnZWNeRWEYQT2AEAJqX4RLlEVzS5qe
         FRKnnPQVFctnrlq94eCqLFXPxryEoG0/+aMqWKodpSJQsbqo62tE108gE2UP6/REdlTU
         r0TAA0VsPAPnjSiTHEGaakUM/5jkpnJsJYweDDyeO/xbFJILi4PMiIfvv2mNxQGMDMK3
         QEC8hdkKpnf/CdPFrr0O/KClgcDZ5w9HFY8v11eT3N1AYsYR5T77D192R9PJfdkbS2i0
         jhLDTNvpR72Li9TwOZS7TA8OVuHAStfJJADGWkILJffSFIPVJ5JeuLZrbND4Eaz1LwwP
         OYWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768472787; x=1769077587;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JLly7CGERK95lIS5prsdJ95HAbwiiwFAFGJDvTd/YQs=;
        b=EgOrUKsD2loCcGQC9XPtPQjwjF7JvsSGwHJJvmgsmB7RnoKZXF56ed5C2YgGQ0+x75
         E7LzKcDKF5/phV3KF0B/pQlojmAzUYu+UB0z+QL0KVRnbjKooU5ZPa57UQhm+fn2y4pT
         V7dX6wpmvPU5k75Ak9AV6pGzsFXdNeAiDNqgdqOZd+m08lXImHOVTtqbKq+bUu74B5uo
         QTmSVEMU2zCufkAwdYOf7aFzZ49uwFGWCVUkIgpio8JP2qd/VC0+nS6AxFT+VGjJR4R9
         GDQZWxtWQb7YelyP4MOtCwMHKU7o3Qiq1SnQD8P9Cf57MpmgsA4CE8o5zrrvw79bIZUp
         XcwQ==
X-Forwarded-Encrypted: i=1; AJvYcCV5T99aOIQkX2Ql38Z/8NApY9LEkjDay0zr20y1i7MfhjN1b8eMb0XcvhtRWrkZmNCxs1e66ohthSd2/eg=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyA08ntJ7KK8AY/BrQKstN/S9IYIK0tchFaadheKwsiIWEpTZ+9
	3KPMheDtNRJxR/gT7glSuCsL2KHNiN6kPYUBtL17jkF6ehS7QMwxldPljii/eKHIOyc=
X-Gm-Gg: AY/fxX439wiMx69xrIYvSXuq6AOTvHgQk9sWw7u8ey/naxPAcLQ023mGGFGGFH4NWhT
	BoH6NygNhMvZbLV0ZFPE02+Sgw1XZ8QGH6CKsCwJJERemYjRweqIGHylwvZBZ9vPmRJs2T1++Vq
	6Js8BsYt/GFRvIWQclge/Mg74McLzX8CodZyoxceNvQt+WlgXmhrXJd0CN32kzOYtUxEk2SMruD
	yffWTyefx/0g203BC3rFzb1uyTmC4iNJVsdYHxOfNqvPuVmKBp38d7FclsyB+AesyufLdviNqHb
	vEu2FfE94vBVaD8rTKARREYtabP5Zmw0EykT6XPh6ujap8ZK9mdUjokORtfoy74Il6e2Z0cXZng
	WcusXk3XfzJsH2yEKrCIFZBPsudCa08+Z0Y5LJX77XCa5/gmrxRtq0LttnXmcuFCT4SYLA9OQta
	94h2GNptXTFFwpAQ==
X-Received: by 2002:a05:600c:8b77:b0:477:afc5:fb02 with SMTP id 5b1f17b1804b1-47ee4819d6emr64067955e9.21.1768472787399;
        Thu, 15 Jan 2026 02:26:27 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-434af6d90aasm4935338f8f.29.2026.01.15.02.26.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 02:26:26 -0800 (PST)
Date: Thu, 15 Jan 2026 11:26:18 +0100
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
Subject: Re: [PATCH 09/19] m68k: emu: nfcon.c: Migrate to
 register_console_force helper
Message-ID: <aWjAysWXHUOHSisl@pathway.suse.cz>
References: <20251227-printk-cleanup-part3-v1-0-21a291bcf197@suse.com>
 <20251227-printk-cleanup-part3-v1-9-21a291bcf197@suse.com>
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
In-Reply-To: <20251227-printk-cleanup-part3-v1-9-21a291bcf197@suse.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Sat 2025-12-27 09:16:16, Marcos Paulo de Souza wrote:
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

