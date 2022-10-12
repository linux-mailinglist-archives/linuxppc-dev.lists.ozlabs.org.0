Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4173D5FC96F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Oct 2022 18:46:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mndpg0TJtz3c74
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Oct 2022 03:46:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=AVbEDK+R;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=srs0=g+ig=2n=zx2c4.com=jason@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=AVbEDK+R;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mndnh29ygz3dsV
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Oct 2022 03:46:00 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id C445BB81694;
	Wed, 12 Oct 2022 16:45:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A50E7C433C1;
	Wed, 12 Oct 2022 16:45:52 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="AVbEDK+R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1665593150;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TSht1t3DJSD+hCa5eztAtyyaCNDlKdgo6SBIjdjkWrQ=;
	b=AVbEDK+RM/LtmdRyRgkFg9SfqjpWY/wu5EEuGoqtLZgO9lwLm2SHEMBqU5dMljE4PHW9N5
	+s20+E+Bnj81IM20QVgXJqiYTZRoWgDJcAORwAt2JPLM+F1u77oUPDwlx2lC7gZy3P1AQl
	CD6vl9emDlZQwmQ0bbSy/vlKEGnl0JQ=
Received: 	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 8392b9ce (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Wed, 12 Oct 2022 16:45:50 +0000 (UTC)
Date: Wed, 12 Oct 2022 10:45:46 -0600
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-6.1-1 tag
Message-ID: <Y0bvOreqH2BdyVqt@zx2c4.com>
References: <87edvhntv0.fsf@mpe.ellerman.id.au>
 <20221012141827.GA2405914@roeck-us.net>
 <Y0biBtCUtc2mowbQ@zx2c4.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Y0biBtCUtc2mowbQ@zx2c4.com>
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
Cc: david@redhat.com, linux-kernel@vger.kernel.org, wsa+renesas@sang-engineering.com, nicholas@linux.ibm.com, windhl@126.com, cuigaosheng1@huawei.com, mikey@neuling.org, paul@paul-moore.com, haren@linux.ibm.com, joel@jms.id.au, lukas.bulwahn@gmail.com, nathanl@linux.ibm.com, ajd@linux.ibm.com, ye.xingchen@zte.com.cn, npiggin@gmail.com, nathan@kernel.org, rmclure@linux.ibm.com, hbathini@linux.ibm.com, atrajeev@linux.vnet.ibm.com, yuanjilin@cdjrlc.com, pali@kernel.org, farosas@linux.ibm.com, geoff@infradead.org, Linus Torvalds <torvalds@linux-foundation.org>, gustavoars@kernel.org, lihuafei1@huawei.com, aneesh.kumar@linux.ibm.com, zhengyongjun3@huawei.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Oct 12, 2022 at 09:49:26AM -0600, Jason A. Donenfeld wrote:
> On Wed, Oct 12, 2022 at 07:18:27AM -0700, Guenter Roeck wrote:
> > NIP [c000000000031630] .replay_soft_interrupts+0x60/0x300
> > LR [c000000000031964] .arch_local_irq_restore+0x94/0x1c0
> > Call Trace:
> > [c000000007df3870] [c000000000031964] .arch_local_irq_restore+0x94/0x1c0 (unreliable)
> > [c000000007df38f0] [c000000000f8a444] .__schedule+0x664/0xa50
> > [c000000007df39d0] [c000000000f8a8b0] .schedule+0x80/0x140
> > [c000000007df3a50] [c00000000092f0dc] .try_to_generate_entropy+0x118/0x174
> > [c000000007df3b40] [c00000000092e2e4] .urandom_read_iter+0x74/0x140
> > [c000000007df3bc0] [c0000000003b0044] .vfs_read+0x284/0x2d0
> > [c000000007df3cd0] [c0000000003b0d2c] .ksys_read+0xdc/0x130
> > [c000000007df3d80] [c00000000002a88c] .system_call_exception+0x19c/0x330
> > [c000000007df3e10] [c00000000000c1d4] system_call_common+0xf4/0x258
> 
> Obviously the first couple lines of this concern me a bit. But I think
> actually this might just be a catalyst for another bug. You could view
> that function as basically just:
> 
>     while (something)
>     	schedule();
> 
> And I guess in the process of calling the scheduler a lot, which toggles
> interrupts a lot, something got wedged.
> 
> Curious, though, I did try to reproduce this, to no avail. My .config is
> https://xn--4db.cc/rBvHWfDZ . What's yours?

I also just tried using your github linux-build-test scripts as a guide
for construction a config -- https://xn--4db.cc/B0HpEQDQ -- and loaded
up your rootfs over sdhci and such, and still couldn't manage to
reproduce. I tried commenting out the line "if (!bits)" in
_credit_init_bits(), so that the rng would never initialize, so that the
schedule() loop would just keep on running indefinitely, but still no
dice.

But also, I'm running Linus' tree. From your log, I see
"6.0.0-rc2-00163-ga5edf9815dd7". So maybe these bugs got fixed
elsewhere?

Jason
