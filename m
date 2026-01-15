Return-Path: <linuxppc-dev+bounces-15837-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 78896D2479C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Jan 2026 13:29:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dsMkK1tsVz309N;
	Thu, 15 Jan 2026 23:29:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::42e"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768480185;
	cv=none; b=YlVaiJ1xnMAqHkm+21eVWGACdQpB80RAjR7vt/0U6VCTUtcPCZRRo2mG4zCZK4+h/VMGjo8AJpdFgDgroBOvJhQ8FkecpKIZy+8kprWqzKCagbyVG6Zw6+rzyc7H5qp2qYux6ILdVf0Xa2VwdMe5uN1z8WNShwpHUSgSygOW7qvCtIvp+aQOdTss3UIV75Kd42FUX9Dqisj2O0ZeiYey2mEQ2Nbvzjav28FBrBMHENh+iVNy3mY0sexCx+nDAAPb8N3uVelHi+NE0q9n+51/N2OSPCvWWn44qqzeDogRfUALq+tBMFbgvO3/URcxfhiyxhUmY4kvM5FdMSIdP6F1dA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768480185; c=relaxed/relaxed;
	bh=Ld+As4KXLNBvjLuNePKBkF4h3CZ3gGNkmAsVzP6KebE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b9pQhyrCDbXaZFMFSzgCBPx4oQlMc4hP0xUw54ky2DkoI3qsigzynywuxQetyWcockNMxh41+uA71GBdAtUEyBXLBrwh8si0zDu6eqyj0D/eFFz0woNWpMFR/EpdiqD6SVtkySRPyoh7xC+FQvgiTb921dblCom0T/g4Qskls747CD2LhPJ1jVVeIEXsSLQwsO/l67WhW02AieQYTLLUfySUMJePV60BqaUS/lPFkAaDFhPhX5/nrjlg11kE971MJDSP0GF8xfaQsnROTlhQH2oTH/rairkYSFp8IO3AoVK/KCs5x2fQa2V9Pizlj6DSJ7prbtgXcSPkOQKMaA/ZSg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=NYgyitkj; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com; envelope-from=pmladek@suse.com; receiver=lists.ozlabs.org) smtp.mailfrom=suse.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=NYgyitkj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.com (client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com; envelope-from=pmladek@suse.com; receiver=lists.ozlabs.org)
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dsMkJ0nlKz2xNg
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Jan 2026 23:29:43 +1100 (AEDT)
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-43246af170aso453531f8f.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Jan 2026 04:29:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1768480181; x=1769084981; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ld+As4KXLNBvjLuNePKBkF4h3CZ3gGNkmAsVzP6KebE=;
        b=NYgyitkjoAl7FRwWn2k2IASz5Z/Skw4PxQnxUrb4y/5vE08kkPtsWImWGBDFYwbiQA
         bx+/ntFR5XILKJLckgLoD5mCGya2OmksJGPNlKy/UdFAy1ANNvF3OLbAlTiRVSm+PyuT
         ZA9Vmh7NvdYPB6QUmPfYfs6bAvo2kiPWjGlt7ATydL56ELVn/1smnQw1Ge+X7uuhjGpt
         psksKBCNLi2KleTLDtLI/WiU0N6bpL+BKXS8M8Q5jMRtxNvlGtqjxzE6G5sMroFaZKwo
         oTiEKx6KSlBqEk6EcNktlqLMFENnzwp/ZGrCLNtqQ6Jys5QWjlFDDBaOdSmXvFRFpt1J
         IWJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768480181; x=1769084981;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ld+As4KXLNBvjLuNePKBkF4h3CZ3gGNkmAsVzP6KebE=;
        b=L1EIMdh8IiFvGAj78DmyXje8Gs0uAc5brLv1N4c5s+6JNr1w2oRGqIVK2zGib45tOZ
         UTRELljqTz9irSIkKdopcJA5bds5pVy1GVcnjD6Cn4w0IC4hqKqOG0QXY95CjhAYwaDs
         0Bl4iEl+JIiEZb+W+zhVxIyRMpVkBGvz/+3JVeEwCG7BSmDvRyKuS9OWSmUW5VEkfQuE
         mwLONekf2D8+1ruAgiZoe9crI5rXKq9TY1qDXqQxvJ+fMSMMJbsE/IAMzhwOwPqnTTk8
         RX/FjPtFxsX9eWnHhXCj2w9HSuTlqT5O84fTHjF9h9OiUNzWmBgYo1Y519FCm1hqdywv
         JUSw==
X-Forwarded-Encrypted: i=1; AJvYcCWlSLvdwz0eC5TdluISvmbLCoMfx1vyRnwxcpkBy3fxNyACJonoUWLV2NNGO3feNVXv/8+w37pVRp3dxT0=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yx6TjNDOS+gIfuC03tJwsQ97rzVXS+in8Zqd4b130C1IIFDEAdS
	35qX0vwX+8MXI8rDxi8C3o0TY1IW552rZ1I+qIkf6JQzcEXyAC3tPNiFxn4ZWlLAHiw=
X-Gm-Gg: AY/fxX5UM/7Ep3xqZSYjQFqrXkN8NtKwSvLqS1eoLlUxeUTwDNZ6bi1g1EZH7WjBuMT
	mvlPi7T9e8JqXj0VaYJhZMOy72VYkV5eikEL30VT5Zyw5uiEdBZML2XHl3sRk40oBfXWlt161pQ
	GzKaIeRypsDZPmjUlpwQxaBX+U3E9pSyaPQwjL8+e2AatmIu2MW7UydKsOTVh+sc4IV6t/JqYlc
	TgLP7AVbbS4+AIMiNPcs5gh9AwZrxxZkhjn+P1QoX3apOJTHdxtw8Dw7FaQOCX3iITQvrQd1/Pm
	ovExieaLWP8Y9W048zpIIBfklF5LYj3O2qnginj9KztLdO0/ojTtmk3nlx8ZgVvYD4Y01NxTeHn
	uFCOrnPl2K1CalXZebH7NGa4cZoM9pCvGdzOCYjBQrqC0/PNI3JWCUCf254GoqmqojGIGrySJwU
	i45uDwuVD9akC71A==
X-Received: by 2002:a05:6000:420a:b0:42f:f627:3a88 with SMTP id ffacd0b85a97d-434ce7324b4mr3823468f8f.4.1768480180633;
        Thu, 15 Jan 2026 04:29:40 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-434af653576sm5965022f8f.17.2026.01.15.04.29.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 04:29:40 -0800 (PST)
Date: Thu, 15 Jan 2026 13:29:37 +0100
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
Subject: Re: [PATCH 14/19] drivers: hwtracing: stm: console.c: Migrate to
 register_console_force helper
Message-ID: <aWjdsbYev_5zfKEC@pathway.suse.cz>
References: <20251227-printk-cleanup-part3-v1-0-21a291bcf197@suse.com>
 <20251227-printk-cleanup-part3-v1-14-21a291bcf197@suse.com>
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
In-Reply-To: <20251227-printk-cleanup-part3-v1-14-21a291bcf197@suse.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Sat 2025-12-27 09:16:21, Marcos Paulo de Souza wrote:
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

