Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D1F3C8BD8CE
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 May 2024 03:11:06 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=sSc2ij4U;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VYKwS3dmBz30TQ
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 May 2024 11:11:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=sSc2ij4U;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=kuba@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VYKvl1Tkfz30TM
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 May 2024 11:10:27 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 6ABF3CE1002;
	Tue,  7 May 2024 01:10:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C19C2C116B1;
	Tue,  7 May 2024 01:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715044222;
	bh=6jpWZYJhOwDYSVa62rHeydfZ5WH5ACGOAf5+pfKDKQw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=sSc2ij4UUZgD9OWbLGvsrNaXu/Cbm+dphilCpEgFnbHTE4ZKifDQg+yJivCnvx2X5
	 OwRfzu8BOfMt86CzbYdvhxS1mFyWzQjjJNf4dUOdek1DKNf8S/SNjqYTyLfmEgfNrS
	 t/dyJKyZMEaKnErjk3bUN4JqWUkDdxAeUXy/Wq20Va5Vo0+y1I8xBH7IpuJ+WJgSFe
	 mxzgr3F1u+KLg/gkgj2+86/pO3qkH4mOT/OZ/gQJIbYdWEweBM205SQw7ecolj7HBK
	 ukEfrDttRqOM6xeyfXHGRFTpsGY/nbRUMXV/PhnDWk+VcLAqzenIALVpQ6b+0PopVG
	 CVt4FXKS7lMZA==
Date: Mon, 6 May 2024 18:10:20 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Erhard Furtner <erhard_f@mailbox.org>
Subject: Re: WARNING: CPU: 1 PID: 1 at net/core/netpoll.c:370
 netpoll_send_skb+0x1fc/0x20c at boot when netconsole is enabled (kernel
 v6.9-rc5, v6.8.7, sungem, PowerMac G4 DP)
Message-ID: <20240506181020.292b25f0@kernel.org>
In-Reply-To: <20240507024258.07980f55@yea>
References: <20240428125306.2c3080ef@legion>
	<20240429183630.399859e2@kernel.org>
	<20240505232713.46c03b30@yea>
	<20240506072645.448bc49f@kernel.org>
	<20240507024258.07980f55@yea>
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

On Tue, 7 May 2024 02:42:58 +0200 Erhard Furtner wrote:
> And indeed without gem_poll_controller() I don't hit the "WARNING: CPU: 1 PID: 1 at net/core/netpoll.c:370 netpoll_send_skb+0x1fc/0x20c" and "WARNING: CPU: 1 PID: 1 at kernel/locking/irqflag-debug.c:10 warn_bogus_irq_restore+0x30/0x44" or the according lockdep bug at boot!
> 
> Re-booted the machine about 20 times without anything suspicious showing up in the dmesg. With the unpatched kernel I got the WARNING at the 2nd reboot.

Excellent! Do you want to submit that as an official patch?
The explanation is that we can't call disable_irq() from atomic
context (which which netpoll runs). But the callback is no longer
necessary as we can depend on NAPI to do the polling these days.

> What I still get with 'modprobe -v dev_addr_lists_test', even with gem_poll_controller() removed is:
> 
> [...]
> KTAP version 1
> 1..1
>     KTAP version 1
>     # Subtest: dev-addr-list-test
>     # module: dev_addr_lists_test
>     1..6
> 
> ====================================
> WARNING: kunit_try_catch/1770 still has locks held!
> 6.9.0-rc6-PMacG4-dirty #5 Tainted: G        W        N
> ------------------------------------
> 1 lock held by kunit_try_catch/1770:
>  #0: c0dbfce4 (rtnl_mutex){....}-{3:3}, at: dev_addr_test_init+0xbc/0xc8 [dev_addr_lists_test]

I think that's fixed in net-next.
