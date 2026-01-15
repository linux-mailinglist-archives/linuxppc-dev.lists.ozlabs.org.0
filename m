Return-Path: <linuxppc-dev+bounces-15810-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EC04D23E42
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Jan 2026 11:16:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dsJmn6kHLz309H;
	Thu, 15 Jan 2026 21:16:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::332"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768472201;
	cv=none; b=aLSHigKKbkMchw2fnA25mcmGVFaCZ467f2rbB/tvVjCUzdmgWvfKg4w4y3Magwysnb6GNFK+UkkpJKoxh1/XsJ6sxFSvq1quL3L1ghrvC0eLXHzsZU4tCkQmmp22/EWoNhfqJ5h9HvWAwaIIpaKnKb+dbpdSjP0TGfNMa3JcQh7fsgbSFA8bg6wmurWEd/FrlZ+f8OybEYK+MdGixJK+N67qi9dz30+ep6bS3vbOsA4WvunFdCYuRqx3qKGVqT0EFbvvlPn8M1gsZlVbxHubPHr4lielSpAbSLfxJU7ekRU4S4m8NHMG5/t5KLyMLyMMCMpVLkj9tuzwJqJASTsU7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768472201; c=relaxed/relaxed;
	bh=zwLrvsF0GMvPSCBeAjAWQZcmbWMJVYh05GZu4CqMmyk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jegK0gjDCiN22wNS2LoCDTcihzhcXr8i1wPjza1vPVgyFMEnZCU9YZ91eQ2JHLPFz6TRmZn17P+Hqf9dn4cIOoU8nlitYElsi/CsR5gpibT1MVBnKjljmkJ5X3pmUKZIsMAKyaW5H5yqVS9xbQso8cn2QHKQast9a/HlZDHMOR8S6LBh14HHMNT0kKy1T0XVd7cWJqT/bGgYufdf4M4hSDkXLCSHoVNE9HVL/ZBiywS2cNHt7660MA70NAdp9Ihv9NWg6um3djzSHCK2C5wNyKD9B4seTL4PiMbp8SpUi9beqs6GO/CfD5ZaimLmCmrazjGOQbVWbXfEyJG/c1b5lg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=AATk2nTw; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com; envelope-from=pmladek@suse.com; receiver=lists.ozlabs.org) smtp.mailfrom=suse.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=AATk2nTw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.com (client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com; envelope-from=pmladek@suse.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dsJmm14nzz2xNg
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Jan 2026 21:16:39 +1100 (AEDT)
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4801d24d91bso258005e9.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Jan 2026 02:16:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1768472195; x=1769076995; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zwLrvsF0GMvPSCBeAjAWQZcmbWMJVYh05GZu4CqMmyk=;
        b=AATk2nTwSzlC3aHTX5ATmE6OmpJO1/RvyFsyet9RwhYDFaiOVjCjDXwK1gf+cgpg/A
         SX367cROx6oN6seWY9+iswd6JIfYS4HW6Y5hGeRdo9i7E2XyNU39C5uv71DO/pdYtgvG
         xO+bek/F4dXI6mgPzuiX8COC2/7S69osMhEjTe10Jx+o8f0YpqwJ8gzgzqLc7DQFHIo4
         PiezCX9FEY8ADKseuzeucWjSjvWj53eBOA3ujnA2QO8qp8gmz/Blca53YFAHpszQdtxn
         kgO1RcrcaPOaQNvC5H/5ezR7SdyrRvdJH2G1+BVX/iIqwTTDVefJuhJBiGRT3DmXUbca
         wJqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768472195; x=1769076995;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zwLrvsF0GMvPSCBeAjAWQZcmbWMJVYh05GZu4CqMmyk=;
        b=Oufh2VQn2IJpPVoCZqPZV+JB4PSVHYZQi1pv5+zNBx2ZR1yCBq1s104SGUssV/WLQQ
         aUBkcEI/gcuVYUG2Vn8BOOEG4y2f14go/Nhu+4VPaOisXaarvwxbSk5fPdPBYx2I9cpg
         e+3b8GZojjt5qfnesayoTUYTwBUwNTNqlq67gjv39Jao3A/VmjRqpevKGO9KTMDN6gQG
         602ga5IKxH8DSr700+z/B9QRiYaTvsiA+qJGnWEF4b0Vay+sngFKkh/NO5t88rEAF9qy
         h4+G12X2G45m57kF6hnob+AcKlMZCvQnWbc51Zk+87rG9IBDSLPf/kVT5LlT+DIOesuW
         7OfA==
X-Forwarded-Encrypted: i=1; AJvYcCV13iIvPOlPw/8D8qzNo2bjQdPaSGRpzERTQ4zwVo1PbM/Hs/+D2ZW/dsMIwVm2uCiNUkJkMJr+DJbNz8k=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yz12uIXabLOQlXT5d9m2FCRw2euTvNqWMrefHGgoZUvVc+GO9B3
	HUtAoSabFizgD8aIo9jKLIhxDKIL6PVZXCHQ/pDGuYnUKec747sMFE6IEX+nzM1/cGc=
X-Gm-Gg: AY/fxX7RML/Ttsa7w20VUHpgMULe9VPOISy9IYhEaJ+8Tvl1G7zW6BrDeN3xg/CCpvL
	6Qde+sh6XWxcTcGQsDmRiNe9o9ubm1NsTj+KF6AbyEsHKLxmg2u7xiXli45WcJdBvewD0I27snk
	WISiEoZMfh2k0QVtv8+YzWNgRAdZ4ekX+NNjwvhI4ieBkYp4qTXa6UOeuIInxppYjMdb9CX90GD
	kKc2sr/QrqzLm7+dcwzR8aycpeS4JjElcRpt/x4Itw/ekmdcYoRcjg44xgYSTZ+rnsHlH1XCNDO
	ejkUA9opz7VhelweumnxPnK2dJMfjLxKLuqn9+YiN5p1Qduzs6OQ5PRva9O/jc4GFd+JRVUlCBG
	6Ixvt3hF4n125jsjjfQyLdLtwS2hUQbgUc5kW47EpDDLSw0T0bkWyaLE0m6rhc3mXkVlFjVOY3x
	NBc4cW/gg06ZbfbTdOaSU1TbP1
X-Received: by 2002:a05:600c:608c:b0:477:a246:8398 with SMTP id 5b1f17b1804b1-47ee32e0829mr58296485e9.2.1768472195426;
        Thu, 15 Jan 2026 02:16:35 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47ee28144aasm39739585e9.11.2026.01.15.02.16.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 02:16:34 -0800 (PST)
Date: Thu, 15 Jan 2026 11:16:31 +0100
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
Subject: Re: [PATCH 07/19] drivers: netconsole: Migrate to
 register_console_force helper
Message-ID: <aWi-f9LBJtxGWgWs@pathway.suse.cz>
References: <20251227-printk-cleanup-part3-v1-0-21a291bcf197@suse.com>
 <20251227-printk-cleanup-part3-v1-7-21a291bcf197@suse.com>
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
In-Reply-To: <20251227-printk-cleanup-part3-v1-7-21a291bcf197@suse.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Sat 2025-12-27 09:16:14, Marcos Paulo de Souza wrote:
> The register_console_force function was introduced to register consoles
> even on the presence of default consoles, replacing the CON_ENABLE flag
> that was forcing the same behavior.

I would add "No functional changes." like you did in the other
similar patches ;-)

> Signed-off-by: Marcos Paulo de Souza <mpdesouza@suse.com>

Nice clean up!

Reviewed-by: Petr Mladek <pmladek@suse.com>

Best Regards,
Petr

