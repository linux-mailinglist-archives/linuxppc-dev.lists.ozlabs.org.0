Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 702F45FDE35
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Oct 2022 18:22:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MpFD40LCrz3bkC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Oct 2022 03:22:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=GP4P33Go;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=srs0=njaz=2o=zx2c4.com=jason@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=GP4P33Go;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MpFC50wsJz3c5q
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Oct 2022 03:21:37 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id A34AAB81F3E;
	Thu, 13 Oct 2022 16:21:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5671C433D6;
	Thu, 13 Oct 2022 16:21:28 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="GP4P33Go"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1665678086;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kPntWr7A6bA616PExnbnx5reDbccdV4V+F7u1oTVbdw=;
	b=GP4P33GoTZTXwgHWO1z/FqyjryY8qsqfXNBCumID69G06rmzAbuflrmGXm0knLxOwy6AOV
	r5Se8is8rcJ8teWZq2zoRDvfJGTZawQk7FulxMoGHupIBrT9us1rnRt6jRmg3GIbXoJ/w6
	20UjSRmQn/6S5nyrDvb7rvSacSvCVHE=
Received: 	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 5f752f1b (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Thu, 13 Oct 2022 16:21:25 +0000 (UTC)
Date: Thu, 13 Oct 2022 10:21:18 -0600
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Rolf Eike Beer <eike-kernel@sf-tec.de>
Subject: Re: [PATCH v6 5/7] treewide: use get_random_u32() when possible
Message-ID: <Y0g6/sIJMq/JRe6y@zx2c4.com>
References: <20221010230613.1076905-1-Jason@zx2c4.com>
 <3026360.ZldQQBzMgz@eto.sf-tec.de>
 <20221013101635.GB11818@breakpoint.cc>
 <11986571.xaOnivgMc4@eto.sf-tec.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <11986571.xaOnivgMc4@eto.sf-tec.de>
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
Cc: linux-wireless@vger.kernel.org, linux-doc@vger.kernel.org, linux-mmc@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-nvme@lists.infradead.org, patches@lists.linux.dev, linux-mm@kvack.org, linux-mtd@lists.infradead.org, sparclinux@vger.kernel.org, linux-s390@vger.kernel.org, Herbert Xu <herbert@gondor.apana.org.au>, linux-rdma@vger.kernel.org, x86@kernel.org, kasan-dev@googlegroups.com, linux-mips@vger.kernel.org, linux-media@vger.kernel.org, linux-um@lists.infradead.org, linux-block@vger.kernel.org, Thomas Graf <tgraf@suug.ch>, loongarch@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-parisc@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, Florian Westphal <fw@strlen.de>, linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org, netdev@vger.kernel.org, linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Oct 13, 2022 at 01:40:40PM +0200, Rolf Eike Beer wrote:
> Am Donnerstag, 13. Oktober 2022, 12:16:35 CEST schrieb Florian Westphal:
> > Rolf Eike Beer <eike-kernel@sf-tec.de> wrote:
> > > Florian, can you comment and maybe fix it?
> > 
> > Can't comment, do not remember -- this was 5 years ago.
> > 
> > > Or you wanted to move the variable before the loop and keep the random
> > > state between the loops and only reseed when all '1' bits have been
> > > consumed.
> > Probably.  No clue, best to NOT change it to not block Jasons series and
> > then just simplify this and remove all the useless shifts.
> 
> Sure. Jason, just in case you are going to do a v7 this could move to u8 then.

Indeed I think this is one to send individually to netdev@ once the tree
opens there for 6.2.

Jason
