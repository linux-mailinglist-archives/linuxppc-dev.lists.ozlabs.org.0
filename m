Return-Path: <linuxppc-dev+bounces-15829-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 69B52D24686
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Jan 2026 13:14:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dsMP1742sz309N;
	Thu, 15 Jan 2026 23:14:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::433"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768479285;
	cv=none; b=JRJZKtC3ibmcUelabpR4jFcmfWVc2uBY9vMnYFCtwrtT6ieeAcZpHbBrHhmekDFuRCdXF/CcuVY+GXxrTmc7bXvQOcgugCRsukL5DYXQmqvn1LW0X1I6s68skBq+B6sVbfqYhaJX+YnOewjdxJ6B4ijOp4yQCEuu0/J/nkk61NtZ30u7OPmEyWB+gvrrQ7RPxS/pURDQRExgQq3fEdMI3KgYZCZpEjoxGvo2dscnM2VjgtZ5sgNrMlk9KQSLbN066F2V7IAJ+V6orZFy9pNvqtrWHRcG2bECSOEhJIxlIgwZQQG4zASyRtYNER7yHK60e9ZPDo8SKZVLFHGgeildqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768479285; c=relaxed/relaxed;
	bh=zx4s5ogULMWiwAg3H50k8gmoVyZOh2DwfMGC+/dY5Co=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kHCcShPiiChFvPJLeK8vI/KcVEkeIMJam6YCLRRdkJhOQB0xUgMM3br9ba+vkwxPjmzDMsAUPRTs6pgESUSoXsXcYncWx6h9sXtjcHGigEaAO1YgRw0wMusmqJuo1vlMeZJNk11aIyPQq+RJSYmNr1zinEg/LXLMJoac09Nansby8sHmCKYYONdlQ+ztMsjEACLyJPCZSDUlOdDyZiCuNQMcsdnTgbrWovoohFiOKShBqvXRN6yVGbpLRbW22q422qL4lhha1jxKjiHmVbJIcZ1At+2fD8YVUPURgOH5D9E8Rdw12E6R+sB9cKQYw/m5GoSn+iDH5oa0vDSe+weEEg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=M2Sd7ym1; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::433; helo=mail-wr1-x433.google.com; envelope-from=pmladek@suse.com; receiver=lists.ozlabs.org) smtp.mailfrom=suse.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=M2Sd7ym1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.com (client-ip=2a00:1450:4864:20::433; helo=mail-wr1-x433.google.com; envelope-from=pmladek@suse.com; receiver=lists.ozlabs.org)
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dsMP03Vdfz2xNg
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Jan 2026 23:14:44 +1100 (AEDT)
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-432d256c2a9so830065f8f.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Jan 2026 04:14:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1768479281; x=1769084081; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zx4s5ogULMWiwAg3H50k8gmoVyZOh2DwfMGC+/dY5Co=;
        b=M2Sd7ym13y/YTFODOjv82+l5KovSECsRGKHSm362fN6Vof/PDicR8uU/jRoIdQqIR8
         JR7e5THW58PzFVuREsDt/pXvEket437U9kEFmQBNQzIr1mbA/1BYXwak5lBG4xCc7ITQ
         7J7z71nRODcLWyIp0DPdjfY9dVfNKOXnxk9a+Vhsa2NQUIJ42qjiGLD+PMRmR9Bj6hPa
         28rD3HBPTdZHrv9fYO2gs2qPCaTPPCv1T0aEq5mrko17H5nWxPDJxuAllISE0aR4LhgY
         DpbvEGO3tJmOTNYeJEQ2Zp1QsSQtpMTmivr9bymiZUcSPRTRpD6Mt+QXto5WqdA6S+3+
         XF3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768479281; x=1769084081;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zx4s5ogULMWiwAg3H50k8gmoVyZOh2DwfMGC+/dY5Co=;
        b=qyQqTEE7jfuHELlLSMhVxOFqehfGdfQS2a1E/ir96WsGju5apSUIW5MrDC0BxGw0wU
         Bh5glNuRpxLop4/tceIethdn0VE0d5jx/aiAF3l1SlaFGU9Lua4yJ5cECJVN8OJNm3ms
         gr37wgsJOatTfvnwJzkW7zVEziOPMuKiCbdPBlUCNCSl2aV2QQP3jWIapuqatjvhl01j
         rxaH2K7zIU878rcVO44YnGVj5zMlH+daqgVgoZ2MMvX3M22ITSKNB102oz70zDQCTiXn
         IkFLHRrojfkSM55a5y3o5yq4xABrBga7dKKnjhVHfWzlo6+U3trMCINXCQDJ0oUV/Fbe
         x5Hw==
X-Forwarded-Encrypted: i=1; AJvYcCVw8L26Rs26ryi8FjG4iQTjtUkNGMKBlhE8LWtrswtr8f6c9Fo7pKEP1FHu4kK7kHSNlpoVFi5rbKnQr0w=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yz1WdnMNJEBhV2Z2m5aQHVdWhtaox725QdV3drFsROJ0zwEUj3m
	CrzqnuF1zvOvqdJvgjLaaWBHmN2RGLc1MnhHeT0kGbUM9kVyPRLk359SOI4LBYgclcI=
X-Gm-Gg: AY/fxX7ABFRfrddaGGA3NDXWRcYdwatxXup1F8tUAK8SWjG6FjLpOXyGnciJZyUOhXb
	EfmX5oQE9Cix21sOJ7WXWGn35fTTgv7kLV++Urdo99ku2piHk9kC2PxmcGzZ5LXOi6OtSAbzTza
	XuS6CLXp+BkoVNPkFHJH0zbeA95u7/MbeI1izqIsc3FLelKzkI2SBaNkSyMCOZEDW2TqNGSEEk4
	b2UDFNYbLvze/mrqK7QTwbabyyhAnRPy3SWMgAt71JQ3TVdHVVC0AkG0vA8/pkRLivoYSTRnEAA
	gMFJ95+Q+oKeOnZcbAIMoUE36xkYgClOVL/a0JEQ64+36AE3X+Qys8Gx2Rnad588vxo0TzKfoww
	m5qa2RT57tN/xXDGhUUX5MfreBjbVGEiR7T3VcFljxFB4bEtYK77l2ZqNu+e9kftFSMkt1RRLiw
	gqRa9HCDW/BtSBEA==
X-Received: by 2002:a05:6000:3101:b0:431:abb:942f with SMTP id ffacd0b85a97d-4342c557b93mr7715812f8f.54.1768479281353;
        Thu, 15 Jan 2026 04:14:41 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-434af64a778sm5591185f8f.3.2026.01.15.04.14.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 04:14:40 -0800 (PST)
Date: Thu, 15 Jan 2026 13:14:38 +0100
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
Subject: Re: [PATCH 12/19] sparc: kernel: btext: Migrate to
 register_console_force helper
Message-ID: <aWjaLhzRoTLalIrM@pathway.suse.cz>
References: <20251227-printk-cleanup-part3-v1-0-21a291bcf197@suse.com>
 <20251227-printk-cleanup-part3-v1-12-21a291bcf197@suse.com>
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
In-Reply-To: <20251227-printk-cleanup-part3-v1-12-21a291bcf197@suse.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Sat 2025-12-27 09:16:19, Marcos Paulo de Souza wrote:
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

