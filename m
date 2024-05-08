Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CAC408BFF81
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 May 2024 15:52:07 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=eV9g7Oo6;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VZGm52M9Sz791q
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 May 2024 23:52:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=eV9g7Oo6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=kuba@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VZGgf1p2dz78JN
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 May 2024 23:48:14 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A1D4B61BE3;
	Wed,  8 May 2024 13:48:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D59BCC113CC;
	Wed,  8 May 2024 13:48:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715176088;
	bh=xgHln/S0N3xK3r9g48jliwLklyosUPHMKzEFivOOsFM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=eV9g7Oo6aO4YBPs5bYhHrXa84k6uIdcZjdL8HHkIG2T0iag+LPv9vxwLxZMKZmRQp
	 TFYUVEMfmpe4sfsA52OayAmHd9ftUj/zYyCXQZ+EtFP4OSeLSOXoJsNhFkcFw4jZ6a
	 TJEgGmhfdwafv0hg9VVkVik3buLHJFnpfrzR62LiwujKAdTEgmaIjAxRmb2xkMUrfo
	 FdxvUdp24w/XgV+KfZRWEmee9ZuwAXAjUCGT+O7kF9WBilofRH7n6tkapwqlq7xf2e
	 +qFLNcA3XlVlovFYwxr9FWjzTdNOKLiGHUsCa+CM/m0bsHVYFFvfYp2FaocBRb53Bx
	 xb5Ye07+8rGGw==
Date: Wed, 8 May 2024 06:48:06 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Erhard Furtner <erhard_f@mailbox.org>
Subject: Re: WARNING: CPU: 1 PID: 1 at net/core/netpoll.c:370
 netpoll_send_skb+0x1fc/0x20c at boot when netconsole is enabled (kernel
 v6.9-rc5, v6.8.7, sungem, PowerMac G4 DP)
Message-ID: <20240508064806.10b95d29@kernel.org>
In-Reply-To: <20240508105505.098efd6c@yea>
References: <20240428125306.2c3080ef@legion>
	<20240429183630.399859e2@kernel.org>
	<20240505232713.46c03b30@yea>
	<20240506072645.448bc49f@kernel.org>
	<20240507024258.07980f55@yea>
	<20240506181020.292b25f0@kernel.org>
	<20240508105505.098efd6c@yea>
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

On Wed, 8 May 2024 10:55:05 +0200 Erhard Furtner wrote:
> I could do that with the explanation you stated. But should any
> further questions arise in this process I would also lack the
> technical background to deal with them. ;)

Alright, submitted :)

> I also noticed a similar #ifdef CONFIG_NET_POLL_CONTROLLER logic shows up in
> many network drivers, e.g. net/ethernet/realtek/8139too.c:
> 
> #ifdef CONFIG_NET_POLL_CONTROLLER
> static void rtl8139_poll_controller(struct net_device *dev);
> #endif
> [...]
> #ifdef CONFIG_NET_POLL_CONTROLLER
> /*
>  * Polling receive - used by netconsole and other diagnostic tools
>  * to allow network i/o with interrupts disabled.
>  */
> static void rtl8139_poll_controller(struct net_device *dev)
> {
>         struct rtl8139_private *tp = netdev_priv(dev);
>        	const int irq = tp->pci_dev->irq;
> 
>        	disable_irq_nosync(irq);
>        	rtl8139_interrupt(irq, dev);
>        	enable_irq(irq);
> }
> #endif
> [...]
> #ifdef CONFIG_NET_POLL_CONTROLLER
>        	.ndo_poll_controller    = rtl8139_poll_controller,
> #endif
> 
> 
> Should it be removed here too? This would be more cards I can test.
> So far I only see this on my G4 and I think something similar on an
> old Pentium4 box I no longer have. 

That one looks legit. Note the _nosync() which solves the immediate
IRQ masking / deadlock issue. And the rtl8139_interrupt() function
actually does the packet cleanup in case of 8139too.
