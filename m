Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D5D78563F82
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 Jul 2022 12:43:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LZpZP5Pjqz3cBV
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 Jul 2022 20:43:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=TUr6pdwq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=srs0=7yq7=xh=zx2c4.com=jason@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=TUr6pdwq;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LZpY53W2Zz3bl6
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  2 Jul 2022 20:42:17 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8C6DD60AE5;
	Sat,  2 Jul 2022 10:42:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3928FC341CA;
	Sat,  2 Jul 2022 10:42:13 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="TUr6pdwq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1656758530;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=u8fAn9797jRbZNaW0d3FED+Ys0K9zSRMLsQCe2CEo5Q=;
	b=TUr6pdwqH8nNG5xfM0O+VpKEE1ieV3t8IyMMVH3fO6/K0vgRzNS/rx6+VUhE14oy5i1fK6
	fhyzTRG1RdA5Bb0H7tJVB4x3rPHrAgTbs9EcYyilPJCk9ied7vToL52kH+pha5xIaWVK5S
	pPCSJBBV5MlGUeJ+C9eLY8tCX1O2Ab4=
Received: 	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 8c993921 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO);
	Sat, 2 Jul 2022 10:42:10 +0000 (UTC)
Date: Sat, 2 Jul 2022 12:42:06 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Sachin Sant <sachinp@linux.ibm.com>, mpe@ellerman.id.au,
	benh@kernel.crashing.org, paulus@samba.org
Subject: Re: [PATCH] powerpc/powernv: delay rng of node creation until later
 in boot
Message-ID: <YsAg/hixHvdxnWNL@zx2c4.com>
References: <Yr2PQSZWVtr+Y7a2@zx2c4.com>
 <20220630121654.1939181-1-Jason@zx2c4.com>
 <8A9A296D-D7BD-42BE-AB32-C951C29E4C40@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <8A9A296D-D7BD-42BE-AB32-C951C29E4C40@linux.ibm.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, stable@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Benjamin, Paul,

On Thu, Jun 30, 2022 at 07:24:05PM +0530, Sachin Sant wrote:
> > On 30-Jun-2022, at 5:46 PM, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> > 
> > The of node for the rng must be created much later in boot. Otherwise it
> > tries to connect to a parent that doesn't yet exist, resulting on this
> > splat:
> > 
> > [    0.000478] kobject: '(null)' ((____ptrval____)): is not initialized, yet kobject_get() is being called.
> > [    0.002925] [c000000002a0fb30] [c00000000073b0bc] kobject_get+0x8c/0x100 (unreliable)
> > [    0.003071] [c000000002a0fba0] [c00000000087e464] device_add+0xf4/0xb00
> > [    0.003194] [c000000002a0fc80] [c000000000a7f6e4] of_device_add+0x64/0x80
> > [    0.003321] [c000000002a0fcb0] [c000000000a800d0] of_platform_device_create_pdata+0xd0/0x1b0
> > [    0.003476] [c000000002a0fd00] [c00000000201fa44] pnv_get_random_long_early+0x240/0x2e4
> > [    0.003623] [c000000002a0fe20] [c000000002060c38] random_init+0xc0/0x214
> > 
> > This patch fixes the issue by doing the of node creation inside of
> > machine_subsys_initcall.
> > 
> > Fixes: f3eac426657d ("powerpc/powernv: wire up rng during setup_arch")
> > Cc: stable@vger.kernel.org
> > Cc: Michael Ellerman <mpe@ellerman.id.au>
> > Reported-by: Sachin Sant <sachinp@linux.ibm.com>
> > Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
> > ---
> 
> Thanks Jason for the patch. This fixes the reported problem for me.
> 
> Tested-by: Sachin Sant <sachinp@linux.ibm.com>
> 
> - Sachin

It sounds like Michael is on vacation for a few weeks. Think you could
queue this up so we can get POWER8 booting again?

Sorry I broke things before :-(

Jason
