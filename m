Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 49BB9547320
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Jun 2022 11:20:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LKskp13sYz3c8x
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Jun 2022 19:20:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=SWySVg6d;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=srs0=qlft=ws=zx2c4.com=jason@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=SWySVg6d;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LKsk55T5Sz2xKq
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Jun 2022 19:20:13 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 357A1B80E48;
	Sat, 11 Jun 2022 09:20:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57F3DC34116;
	Sat, 11 Jun 2022 09:20:08 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="SWySVg6d"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1654939206;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=d1nu/8OrD5lJ8ZJkrInQDHzhV+PXmqlwAeVMBiKufIU=;
	b=SWySVg6d9micIJRfHNSibZVmlDb6uPBkrfeQSdJ+hOzYAyGjsUJysA7fRpz/b2z1dbn3ID
	37ESovt/x+4UHZpQJM4EEHim+HuvggQyP1K/UFhIQymd0J7JH3x3ll6kabpCuleEwIPtbi
	EgfNsSx2cNfbQkC89CL5tJuEWuOBmqA=
Received: 	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 1cef741a (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO);
	Sat, 11 Jun 2022 09:20:06 +0000 (UTC)
Date: Sat, 11 Jun 2022 11:20:01 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] powerpc/rng: wire up during setup_arch
Message-ID: <YqReQbGQ3G5JxSgP@zx2c4.com>
References: <20220611081114.449165-1-Jason@zx2c4.com>
 <956d2faa-4dae-fc75-2c03-387c77806f2b@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <956d2faa-4dae-fc75-2c03-387c77806f2b@csgroup.eu>
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "stable@vger.kernel.org" <stable@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Christophe,

On Sat, Jun 11, 2022 at 09:16:24AM +0000, Christophe Leroy wrote:
> Le 11/06/2022 à 10:11, Jason A. Donenfeld a écrit :
> > The platform's RNG must be available before random_init() in order to be
> > useful for initial seeding, which in turn means that it needs to be
> > called from setup_arch(), rather than from an init call. Fortunately,
> > each platform already has a setup_arch function pointer, which means
> > it's easy to wire this up for each of the three platforms that have an
> > RNG. This commit also removes some noisy log messages that don't add
> > much.
> 
> Can't we use one of the machine initcalls for that ?
> Like machine_early_initcall() or machine_arch_initcall() ?

No, unfortunately. I tried this, and it's still too late. This must be
done in setup_arch().

> Today it is using  machine_subsys_initcall() and you didn't remove it. 
> It means rng_init() will be called twice. Is that ok ?

I did remove the calls to machine_subsys_initcall(). I just double
checked:

zx2c4@thinkpad ~/Projects/random-linux/arch/powerpc $ rg machine_subsys_initcall platforms/*/rng.c
zx2c4@thinkpad ~/Projects/random-linux/arch/powerpc $

Jason
