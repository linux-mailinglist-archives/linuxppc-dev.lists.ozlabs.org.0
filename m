Return-Path: <linuxppc-dev+bounces-2108-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B60A99A185
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Oct 2024 12:37:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XQ33c1gK4z3bwL;
	Fri, 11 Oct 2024 21:37:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728643052;
	cv=none; b=RY/8rRkLfGlre3GesoKOdlFRw/UiEWOVxuI6Apgftj98zhGvx1qsbQAeNByBD1HWp5JllsxqU8p34F9KCNf4ASut1kx91pdYRVJtPzXVspfTD3YgJ8cEZbO/bw9vFfSJ7YMN5UGLnb3OUhNp6KWsFf9wTl1Yz+Hw+2kuDLBnBmlitPK7Bwn9sso8EW/89UnpNbo/nZhOHS5t3pB04aLK+Kp8ekSsLvq3RUNslgGMmhjTZjfs4KXe+WijeJHcGimEyL+N2fj/cSqJu4PLbyULAtMaBaseZ/j0RIO5VREQtE5iE6MmOG9VoEiVQ37ykyOTgvIx81iPfCzH1zXrq/xINg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728643052; c=relaxed/relaxed;
	bh=eOi3s+J0p0Rr7NAS8srzm60cAmwu+YPFf/AT7DlY+X8=;
	h=From:To:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=hX4aXQPX7tYeaqgwteNuIDjDAjn+ad85iTJM4w9hPiUvH6Vl8RdAAs19zgX+bo2cstfvoG7TNpPPNt8UayrMvNrdXsMm/B3XboBC4ZaIEQJIWE+nx6f0jTwFNb/T6Xp7aMDl4Fe5/RzM8Li2RG8ZZ0ZNYo0sRV5Oqj0o/agm9WYgbN13F8Vgc0XXL4nKV1bcZWJmc6iy1jVlmrR0qUyf4hljuUi41YlW/MqWvcH4trr0v7RIXCStBTdBVBQHeBYh8ZYETTdJwYCM93EcQQYt7kabaXlRX48F2Ii1MmXa1rCJn3lCU8xpg++y107wpMqTbFYUMbPLxeLyFy+76pqxMQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=WUgf2/bb; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=WUgf2/bb;
	dkim-atps=neutral
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XQ33Z6xxqz3bw9
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Oct 2024 21:37:30 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1728643048;
	bh=eOi3s+J0p0Rr7NAS8srzm60cAmwu+YPFf/AT7DlY+X8=;
	h=From:To:Subject:In-Reply-To:References:Date:From;
	b=WUgf2/bb4LJatYWiCY0XLpmV+rffzesMAMwfAp+YUuDAt+gw8tmvFrHHligqdjw+P
	 1y6Ojs9+pdHT4uZkufk1le3fg1mT7JbaNGFbHUeyO4yAAKUcnNoJMPw3Rv/+R1Lhit
	 EuyLZ030ahnxk2KmT0gobRrhlZfulQpeknqSX6Kgksztt6dVQuH041aS6/lqN7B9Aw
	 Kl8bv+fmXaiKhELzxjBrbqNFuYazHeuvGSdcvEy8+B4d3PKudLDy/V8rG79rwHvA8M
	 bOPe4KnsdWkJ5xS1/Aiwci1Kg3ermDpe0crFL/nuJXEOWZkZUwpDubni3AuBmYHsxs
	 V9tVmx9/1XSsA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XQ33V63y8z4xN6;
	Fri, 11 Oct 2024 21:37:26 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Vishal Chourasia <vishalc@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller"
 <davem@davemloft.net>, Nicholas Piggin <npiggin@gmail.com>, Christophe
 Leroy <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>,
 Madhavan Srinivasan <maddy@linux.ibm.com>, linux-crypto@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: drivers/nx: Invalid wait context issue when rebooting
In-Reply-To: <ZwjjXJ5UtZ28FH6s@linux.ibm.com>
References: <ZwjjXJ5UtZ28FH6s@linux.ibm.com>
Date: Fri, 11 Oct 2024 21:37:27 +1100
Message-ID: <87wmif53iw.fsf@mail.lhotse>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Vishal Chourasia <vishalc@linux.ibm.com> writes:
> Hi,
> I am getting Invalid wait context warning printed when rebooting lpar
>
> kexec/61926 is trying to acquire `of_reconfig_chain.rwsem` while holding
> spinlock `devdata_mutex`
>
> Note: Name of the spinlock is misleading.

Oof, yeah let's rename that to devdata_spinlock at least.

> In my case, I compiled a new vmlinux file and loaded it into the running
> kernel using `kexec -l` and then hit `reboot`
>
> dmesg:
> ------
>
> [ BUG: Invalid wait context ]
> 6.11.0-test2-10547-g684a64bf32b6-dirty #79 Not tainted

Is that v6.11 plus ~10,000 patches? O_o

Ah no, 684a64bf32b6 is roughly v6.12-rc1. Maybe if you fetch tags into
your tree you will get a more sensible version string?

Could also be good to try v6.12-rc2.

> -----------------------------
> kexec/61926 is trying to lock:
> c000000002d8b590 ((of_reconfig_chain).rwsem){++++}-{4:4}, at: blocking_notifier_chain_unregister+0x44/0xa0
> other info that might help us debug this:
> context-{5:5}
> 4 locks held by kexec/61926:
>  #0: c000000002926c70 (system_transition_mutex){+.+.}-{4:4}, at: __do_sys_reboot+0xf8/0x2e0
>  #1: c00000000291af30 (&dev->mutex){....}-{4:4}, at: device_shutdown+0x160/0x310
>  #2: c000000051011938 (&dev->mutex){....}-{4:4}, at: device_shutdown+0x174/0x310
>  #3: c000000002d88070 (devdata_mutex){....}-{3:3}, at: nx842_remove+0xac/0x1bc
  
That's pretty conclusive.

I don't understand why you're the first person to see this. I can't see
that any of the relevant code has changed recently. Unless something in
lockdep itself changed?

Did you just start seeing this on recent kernels? Can you bisect?

> stack backtrace:
> CPU: 2 UID: 0 PID: 61926 Comm: kexec Not tainted 6.11.0-test2-10547-g684a64bf32b6-dirty #79
> Hardware name: IBM,9080-HEX POWER10 (architected) 0x800200 0xf000006 of:IBM,FW1060.00 (NH1060_012) hv:phyp pSeries
> Call Trace:
> [c0000000bb577400] [c000000001239704] dump_stack_lvl+0xc8/0x130 (unreliable)
> [c0000000bb577440] [c000000000248398] __lock_acquire+0xb68/0xf00
> [c0000000bb577550] [c000000000248820] lock_acquire.part.0+0xf0/0x2a0
> [c0000000bb577670] [c00000000127faa0] down_write+0x70/0x1e0
> [c0000000bb5776b0] [c0000000001acea4] blocking_notifier_chain_unregister+0x44/0xa0
> [c0000000bb5776e0] [c000000000e2312c] of_reconfig_notifier_unregister+0x2c/0x40
> [c0000000bb577700] [c000000000ded24c] nx842_remove+0x148/0x1bc
> [c0000000bb577790] [c00000000011a114] vio_bus_remove+0x54/0xc0
> [c0000000bb5777c0] [c000000000c1a44c] device_shutdown+0x20c/0x310
> [c0000000bb577850] [c0000000001b0ab4] kernel_restart_prepare+0x54/0x70
> [c0000000bb577870] [c000000000308718] kernel_kexec+0xa8/0x110
> [c0000000bb5778e0] [c0000000001b1144] __do_sys_reboot+0x214/0x2e0
> [c0000000bb577a40] [c000000000032f98] system_call_exception+0x148/0x310
> [c0000000bb577e50] [c00000000000cedc] system_call_vectored_common+0x15c/0x2ec

I don't see why of_reconfig_notifier_unregister() needs to be called
with the devdata_mutext held, but I haven't looked that closely at it.

So the change below might work.

cheers

diff --git a/drivers/crypto/nx/nx-common-pseries.c b/drivers/crypto/nx/nx-common-pseries.c
index 35f2d0d8507e..a2050c5fb11d 100644
--- a/drivers/crypto/nx/nx-common-pseries.c
+++ b/drivers/crypto/nx/nx-common-pseries.c
@@ -1122,10 +1122,11 @@ static void nx842_remove(struct vio_dev *viodev)
 
 	crypto_unregister_alg(&nx842_pseries_alg);
 
+	of_reconfig_notifier_unregister(&nx842_of_nb);
+
 	spin_lock_irqsave(&devdata_mutex, flags);
 	old_devdata = rcu_dereference_check(devdata,
 			lockdep_is_held(&devdata_mutex));
-	of_reconfig_notifier_unregister(&nx842_of_nb);
 	RCU_INIT_POINTER(devdata, NULL);
 	spin_unlock_irqrestore(&devdata_mutex, flags);
 	synchronize_rcu();


