Return-Path: <linuxppc-dev+bounces-10354-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BA706B0D5DF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Jul 2025 11:24:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bmWzw6HZmz3bV6;
	Tue, 22 Jul 2025 19:24:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1753176252;
	cv=none; b=jkfjYWUY0zbhOWpu2gCR5k3si2FqR2Dx//6ycA0demJI4foEl2UGFhEtan97Sio4tTxSzRNWEqs2o8Ut5QcR61Kbq3XhOG1quNBF+I/zm+rNxkAvseenUOhFG2kEzJ42LhjqoeGphvOpJMmATO5Ccy3rs5sTRL+DI58UoeEaH8Q8rTVPcabY3V79zq9Sh5AK11Mf79ESjIIWOq9z3upxTiclk2Ztv7Prs5ksS4XNQAxu/R79/heshN+IGjFcd8v9ueL80iufthmNqzNt/xvRpBRcSMhW68Re14rvshxjXvDPZF9uyvzanOq6Uym/xmIu334Lo6O5ehm3qc0jfaju+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1753176252; c=relaxed/relaxed;
	bh=BFmGu5onRhNC7oCFD6HQWHvUKHNJDs2FmdzhpgzLs44=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OBzqoaJKPcvtVlIDR/Qe8WPBbKb5pksBp8m6lJI1zOkITuQnuA6MdMufHaZIfIs7psF6qQPez5hxv8fEjAcYdci8Pvup9qdee5WQc8IYtT+Zl/WnTSZQh5toRXjE2xExGx90d5+9t4dke5Zm/YQAQkIAqET40HgHW3fibO1fOTJSOIpnrL+it0YNjXfjzssNl0QzQQ/+imtBtsbKLLIdewnm5zxk9+2aUI8u2Lnvh4ZbhaZ4kP/bYgmwLPb+4PkBYaUEBt73dc9aSWsG9dumIKl9245vnLFXP/bvgWtp++6Q3aAXvtDkpRb5edlthmb/qJf467gqSw7RpT1KuWLu+Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=Vap6x1qD; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=LbQI0CjY; dkim-atps=neutral; spf=pass (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=namcao@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=Vap6x1qD;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=LbQI0CjY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=namcao@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bmWzv4Q2qz2yhb
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Jul 2025 19:24:11 +1000 (AEST)
Date: Tue, 22 Jul 2025 11:24:02 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1753176244;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BFmGu5onRhNC7oCFD6HQWHvUKHNJDs2FmdzhpgzLs44=;
	b=Vap6x1qDls3aE1XarapJgdisRQ84gWiHdxF+OZlLlHab1Wi/pkGoKAX04NZv2jV1LRwa4N
	B1uae0PVks7/UKezhCChoeMJl8xgxi/a3ZOC1FIFeyFRCPAWHWxZbgWQUPz8CT+mPxKH6q
	tPzUOuypFdF2Sdby0CGbxwgIg1y5xr2xXGpPILAyJtiEok7srAXBJH7gUfpFhYlq6yTD5x
	GW8TepMfPiY71MaHbdzAAPcgx7VbUFgvbi919T1FteBxxTMu32XH/L7HsdhcqbGfDsAkwJ
	OxATR/OaOOrhCHf9FUYFhUGgkh4mx9/LBLCjZpngnQlOTCczsWnxf4WdMr2xmQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1753176244;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BFmGu5onRhNC7oCFD6HQWHvUKHNJDs2FmdzhpgzLs44=;
	b=LbQI0CjY/6FtiEgNBnARlAY/0AQbn08RbLGf/Y9w9iyW6yeX+K4YtAzKScr1iPov7hP+cd
	kGFC2X1d8EIWIGDg==
From: Nam Cao <namcao@linutronix.de>
To: Gautam Menghani <gautam@linux.ibm.com>
Cc: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] powerpc: Cleanup and convert to MSI parent domain
Message-ID: <20250722092402.uMLOYoII@linutronix.de>
References: <cover.1750861319.git.namcao@linutronix.de>
 <aH9Na8ZqrI0jPhtl@li-c6426e4c-27cf-11b2-a85c-95d65bc0de0e.ibm.com>
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
In-Reply-To: <aH9Na8ZqrI0jPhtl@li-c6426e4c-27cf-11b2-a85c-95d65bc0de0e.ibm.com>
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Jul 22, 2025 at 02:05:55PM +0530, Gautam Menghani wrote:
> I am seeing a boot failure after applying this series on top of the pci
> tree [1]. Note that this error was seen on a system where I have a
> dedicated NVME. Systems without dedicated disk boot fine

Thanks for the report.

Using QEMU, I cannot reproduce the exact same problem, but I do observe a
different one. They are likely from the same root cause.

Let me investigate..

Nam

