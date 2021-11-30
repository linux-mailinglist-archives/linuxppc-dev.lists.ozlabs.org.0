Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 326E44635DB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Nov 2021 14:54:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J3Nxp2hyBz3c65
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Dec 2021 00:54:38 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=pLHexAzN;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=mailbox.org (client-ip=2001:67c:2050::465:101;
 helo=mout-p-101.mailbox.org; envelope-from=erhard_f@mailbox.org;
 receiver=<UNKNOWN>)
X-Greylist: delayed 448 seconds by postgrey-1.36 at boromir;
 Wed, 01 Dec 2021 00:53:32 AEDT
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org
 [IPv6:2001:67c:2050::465:101])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J3NwX674tz2xv5
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Dec 2021 00:53:31 +1100 (AEDT)
Received: from smtp202.mailbox.org (smtp202.mailbox.org [80.241.60.245])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4J3NwN2C1QzQjlj;
 Tue, 30 Nov 2021 14:53:24 +0100 (CET)
X-Virus-Scanned: amavisd-new at heinlein-support.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1638280401;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=181oU0HPgQagS5rGNx1alC4GUB5Nvu1JRAcuMk+Je3I=;
 b=pLHexAzNxCgIST0bt1VHCUKePxUguTHTrSRk+9wbvMTNTVsFP8xVdsZkMse439DnjlGnOT
 QWlIXhw7uApDzCHq30k+FBxFBCqCqz5G5jg53sKwcy0egJGGidOTBqHQsAlcduRVrHyZmE
 Sc5sOfG3cGx2Dit5YWISHN6T++AwNFZW17Yct54ahI65bD9p13kWHR4D9H0N+nORrh772F
 gjJ1MWJqAL1s41uPblYr4oCrQy+aqwVgLTGBW/aeVVCzrqa8KFWoXcRZ+uteaJDFRAZpb5
 ON1i81dFMXEMbhWg2BtYDxxBhdxQVCYH2va/Ok64lbxi8keUruQspAQADpVYsg==
Date: Tue, 30 Nov 2021 14:53:18 +0100
From: "Erhard F." <erhard_f@mailbox.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] powerpc/powermac: Add missing lockdep_register_key()
Message-ID: <20211130145318.5fcdf633@yea>
In-Reply-To: <69e4f55565bb45ebb0843977801b245af0c666fe.1638264741.git.christophe.leroy@csgroup.eu>
References: <69e4f55565bb45ebb0843977801b245af0c666fe.1638264741.git.christophe.leroy@csgroup.eu>
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
Cc: linuxppc-dev@lists.ozlabs.org, Paul Mackerras <paulus@samba.org>,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 30 Nov 2021 10:32:42 +0100
Christophe Leroy <christophe.leroy@csgroup.eu> wrote:

> KeyWest i2c @0xf8001003 irq 42 /uni-n@f8000000/i2c@f8001000
> BUG: key c2d00cbc has not been registered!
> ------------[ cut here ]------------
> DEBUG_LOCKS_WARN_ON(1)
> WARNING: CPU: 0 PID: 1 at kernel/locking/lockdep.c:4801 lockdep_init_map_type+0x4c0/0xb4c
> Modules linked in:
> CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.15.5-gentoo-PowerMacG4 #9
> NIP:  c01a9428 LR: c01a9428 CTR: 00000000
> REGS: e1033cf0 TRAP: 0700   Not tainted  (5.15.5-gentoo-PowerMacG4)
> MSR:  00029032 <EE,ME,IR,DR,RI>  CR: 24002002  XER: 00000000
> 
> GPR00: c01a9428 e1033db0 c2d1cf20 00000016 00000004 00000001 c01c0630 e1033a73
> GPR08: 00000000 00000000 00000000 e1033db0 24002004 00000000 f8729377 00000003
> GPR16: c1829a9c 00000000 18305357 c1416fc0 c1416f80 c006ac60 c2d00ca8 c1416f00
> GPR24: 00000000 c21586f0 c2160000 00000000 c2d00cbc c2170000 c216e1a0 c2160000
> NIP [c01a9428] lockdep_init_map_type+0x4c0/0xb4c
> LR [c01a9428] lockdep_init_map_type+0x4c0/0xb4c
> Call Trace:
> [e1033db0] [c01a9428] lockdep_init_map_type+0x4c0/0xb4c (unreliable)
> [e1033df0] [c1c177b8] kw_i2c_add+0x334/0x424
> [e1033e20] [c1c18294] pmac_i2c_init+0x9ec/0xa9c
> [e1033e80] [c1c1a790] smp_core99_probe+0xbc/0x35c
> [e1033eb0] [c1c03cb0] kernel_init_freeable+0x190/0x5a4
> [e1033f10] [c000946c] kernel_init+0x28/0x154
> [e1033f30] [c0035148] ret_from_kernel_thread+0x14/0x1c
> 
> Add missing lockdep_register_key()
> 
> Reported-by: Erhard Furtner <erhard_f@mailbox.org>
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>  arch/powerpc/platforms/powermac/low_i2c.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/powerpc/platforms/powermac/low_i2c.c b/arch/powerpc/platforms/powermac/low_i2c.c
> index f77a59b5c2e1..de34fa34c42d 100644
> --- a/arch/powerpc/platforms/powermac/low_i2c.c
> +++ b/arch/powerpc/platforms/powermac/low_i2c.c
> @@ -582,6 +582,7 @@ static void __init kw_i2c_add(struct pmac_i2c_host_kw *host,
>  	bus->close = kw_i2c_close;
>  	bus->xfer = kw_i2c_xfer;
>  	mutex_init(&bus->mutex);
> +	lockdep_register_key(&bus->lock_key);
>  	lockdep_set_class(&bus->mutex, &bus->lock_key);
>  	if (controller == busnode)
>  		bus->flags = pmac_i2c_multibus;
> -- 
> 2.33.1
> 

The patch applied on 5.15.5 but unfortunately was not enough to fix the lockdep bug.

Originally was bug #200055 (https://bugzilla.kernel.org/show_bug.cgi?id=200055).

Regards,
Erhard
