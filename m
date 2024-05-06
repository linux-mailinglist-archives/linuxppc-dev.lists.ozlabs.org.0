Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2215F8BD03E
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 May 2024 16:27:34 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=jk8aJL4C;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VY3dr5HVNz3brC
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 May 2024 00:27:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=jk8aJL4C;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=kuba@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VY3d66TChz2yhZ
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 May 2024 00:26:50 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 20E29CE0219;
	Mon,  6 May 2024 14:26:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C40EC116B1;
	Mon,  6 May 2024 14:26:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715005606;
	bh=WGXmiojuwyUlrWCas3x3xw7zG7o9mcYX/J2i6endN0c=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=jk8aJL4CP9zQEc/W5zos2YVKbvsteqzrxxPLN3rT/hGU+8kZObwcNizisNpKFp5Yd
	 6iqyKsKElOq1UMpEzXUtxd7wTCdncV9OA231f+kC6sbAbiMARqnw8hAAhcvv4A77p9
	 8QWSgu5TvhlOQUaHeU8samxnMInU/GGFVHH4wM1TQuFcS9i58Sa2un77NO5i/Wk1Ga
	 RIuFBtRkzTl4VkbjhGPavkjz+Fgb0/Y67pjsS0olU6Sg9MPgGC+hmP72S2bJFM5BSC
	 wI4qfv758H/hNlxOFKztEnCQpHHTW4VE1LK9zZWvM+kHAaNHC+0daL1BoYKlXBuUwe
	 TMfVcvl8UKKEw==
Date: Mon, 6 May 2024 07:26:45 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Erhard Furtner <erhard_f@mailbox.org>
Subject: Re: WARNING: CPU: 1 PID: 1 at net/core/netpoll.c:370
 netpoll_send_skb+0x1fc/0x20c at boot when netconsole is enabled (kernel
 v6.9-rc5, v6.8.7, sungem, PowerMac G4 DP)
Message-ID: <20240506072645.448bc49f@kernel.org>
In-Reply-To: <20240505232713.46c03b30@yea>
References: <20240428125306.2c3080ef@legion>
	<20240429183630.399859e2@kernel.org>
	<20240505232713.46c03b30@yea>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: netdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, 5 May 2024 23:27:13 +0200 Erhard Furtner wrote:
> > On Sun, 28 Apr 2024 12:53:06 +0200 Erhard Furtner wrote:  
> > > With netconsole enabled I get this "WARNING: CPU: 1 PID: 1 at
> > > net/core/netpoll.c:370 netpoll_send_skb+0x1fc/0x20c" and "WARNING:
> > > CPU: 1 PID: 1 at kernel/locking/irqflag-debug.c:10
> > > warn_bogus_irq_restore+0x30/0x44" at boot on my PowerMac G4 DP.
> > > Happens more often than not (6-7 out of 10 times booting):    
> > 
> > Could you try with LOCKDEP enabled?
> > I wonder if irqs_disabled() behaves differently than we expect.  
> 
> Ok, after a few tries I got a "BUG: spinlock wrong CPU on CPU#0, swapper/0/1" LOCKDEP hit. But this does not happen every time when I get the netpoll_send WARNING:

Oh, can you try deleting the gem_poll_controller() function?
Unhook it from ndo_poll_controller and remove it completely.
