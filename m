Return-Path: <linuxppc-dev+bounces-15833-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ECC2D24723
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Jan 2026 13:24:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dsMcc0Cvcz309H;
	Thu, 15 Jan 2026 23:24:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::436"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768479887;
	cv=none; b=LHSUF8oqwnX54A90P7aZt0OOTXsU1TJwVgMFSzG4KFUkyXfZjZCyYjUewMCoXTO3o59gnTxSva35RF3OjBEIFo4r8xEbsm+1RLFhUi/F8TNzVEU7IESEsnjsRdPPzvDTE70XtricVG5Q0XQYCY0hjWfnnfLbQHKWTFlel7iMR8NM+9xaAyFi7I4wB+gOKgY1QOCuVxx3AawG1t77etHM8QWLPuziVtoxpr09luZf/NQK5XhhLmjDu8IEXF/RCASxBC6tDcimwHGCBWMYi9HItFBsKAa4IlzqTCw3U0/RqwOZrG+pGIJmjxLCMgJhmXhIulBoNnG2ZdWgUKYM38Okng==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768479887; c=relaxed/relaxed;
	bh=jS491F7pY/6VV44vwrzsFaAyA9RjAqjEAkamZCNInAE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Cc6/vNJWrNXhFXqMu+Y3Se8lb5ESWYGf6ZleRQq5RO3dXjjzw5+6h7lPgZzwmMRyaFdIHzQqVkvbgBYBIJYbsVYF1p7LRcOT+lwnwHR7EmiillmYBAzKceS7xhOq5fRpwA9PxQy3rJzamBjxccpoZfqBK4hL2JoATQeEGf8MxoLBav320wTpkYH0ftnLRWjRhPIe5QeIUWHn/p9jHE0qRIYjTtOd7TWnGDGe9pv/tLjnzZ3kc2U7LeV3jfXyRaTWbaVZjQMJ0Uj0EEYq9MTShX39JqXuQaSxdElZmmVwk7KhFzemqyRaoLoyodfDb1ABokYoDMrlFxASPdZ7kRd0nA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=AriH5OMY; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com; envelope-from=pmladek@suse.com; receiver=lists.ozlabs.org) smtp.mailfrom=suse.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=AriH5OMY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.com (client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com; envelope-from=pmladek@suse.com; receiver=lists.ozlabs.org)
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dsMcZ65xtz2xNg
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Jan 2026 23:24:46 +1100 (AEDT)
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-42fb5810d39so634101f8f.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Jan 2026 04:24:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1768479883; x=1769084683; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jS491F7pY/6VV44vwrzsFaAyA9RjAqjEAkamZCNInAE=;
        b=AriH5OMYC88Au+o0QlolzkFsWWF4J9umeXhkVBIGm3XRNU0BGLEcfiPiNc5o/6D/Gf
         dx6H0+7lUbemVPbkIpIuIaxyglzEThJy5QqjbqT0jsVCUBMT3EEhJeCWMwQyPzMRuwch
         QldYjgzjP4pH2cOQT3WM0yyrWeIW+/46XZP+tQD7ruPb+WOiU2CPJX/IiDV5sBjmXgnm
         rtn9dUts007ZnAL7jEOVvt7fnhLB4zSXyQxY1glijBhxT6SgOdMUqdHTwmfPVShKN0zm
         w9r6MS22huWRq9s58s/SPyi1bpVHjMGhQWN5HpeEHYOQ9lQV9uIkGGjYFPwNbjlKOS5l
         t1OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768479883; x=1769084683;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jS491F7pY/6VV44vwrzsFaAyA9RjAqjEAkamZCNInAE=;
        b=jxV+33SSgUIrLBT4s80MkXuQqI/iiUZkJdpXrY5aSUkpReXLkImFWVCVksAaayvrR1
         B6BwNJsTGGqi7PV1b4e3W4N0NLWwnj92I424KvS/rEQpIeMaSx/KZQ5BogrWPafn3rWk
         i/a16n2KDipzoNxMP5G9kL5mGurdCdBZu2bWrtDhgnS73E+oQ0/FMIysPDEDwzLeEdQL
         tPjcA6yaLS1jtn5cHggPHnIH7GSzsgOw1NkijSMEqhUHobSliMVdHtNU7m8hJ1gx79Sl
         LRwhiit1Nf7KGX7nb6oI1N2xUYrGpMrvugUAdemqaDNW/NXJZ7Gs3e97rEKc8nCJwIBr
         Okgw==
X-Forwarded-Encrypted: i=1; AJvYcCUuRseff+MoKxxRQKYmDFHu++O8yLftvF4FtEr96foMHClkCditIegMny2BElGmEM4QU+CaAXQD/caqo0Q=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxuITccm1Xkor6kGh5ZXgDKTBbrwb5jzgZOdrqDlyPRpvZwWrgL
	JfWb2KaVtdYzlbObTEonMKVzpsRZ+UKrFcCoQWGx9+drXF9rsF6neJHGWGMLEaEbfmc=
X-Gm-Gg: AY/fxX7G4hsEvoHt1GESNFJ9ebF99Pm2U+Rw36BplQY2KeP1J9JkAiKou6pvTNCh4Kp
	iJ2XBx+50GS+pvY9CH3UWRVW8LiHaKeiQrXLY9YIV2+CwUzMyspZTKHDOgN738Ixx8rRZlrhOPi
	VoXNytbzQFY762J8WVVykUEtSvwtM2hx2CUyndsHnl/ByDxuf9GooBhQnYOtn0bH/hi3cGcLhKd
	/QFIrvO+ffObwZbnx9kWHGFA/guC+qn1a65vUDgqUvloUP/sQ4cvlI2wC1sHWIa7kCt7lPv6sVP
	8qktq+3eUP1Yz0zfMMg0O5XbRrk7YSnEfKYwXgVw/4jPqyYMKkgBpokGNhwUjdL/xGh8gpeHtuQ
	yVoRWo0GyEcAtwP8gB6hdFEQ3yIjYzXx+b7QbOdAPjqG577BxY205EYiTHGFMFjbqDRnDXn2cSN
	4hPANS1/D+khQ80A==
X-Received: by 2002:a05:6000:1789:b0:432:5c43:64 with SMTP id ffacd0b85a97d-4342c547aa9mr7495008f8f.41.1768479882771;
        Thu, 15 Jan 2026 04:24:42 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-434af64a650sm5653238f8f.4.2026.01.15.04.24.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 04:24:42 -0800 (PST)
Date: Thu, 15 Jan 2026 13:24:39 +0100
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
Subject: Re: [PATCH 13/19] um: drivers: mconsole_kern.c: Migrate to
 register_console_force helper
Message-ID: <aWjch-EcYm7tkF0t@pathway.suse.cz>
References: <20251227-printk-cleanup-part3-v1-0-21a291bcf197@suse.com>
 <20251227-printk-cleanup-part3-v1-13-21a291bcf197@suse.com>
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
In-Reply-To: <20251227-printk-cleanup-part3-v1-13-21a291bcf197@suse.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Sat 2025-12-27 09:16:20, Marcos Paulo de Souza wrote:
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

