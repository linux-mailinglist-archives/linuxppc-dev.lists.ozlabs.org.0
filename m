Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D0EE8563F83
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 Jul 2022 12:45:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LZpcW5DSMz3c1N
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 Jul 2022 20:45:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=CTULaTMa;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=srs0=7yq7=xh=zx2c4.com=jason@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=CTULaTMa;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LZpby5g4Xz2yMK
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  2 Jul 2022 20:44:46 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id F350C60C48;
	Sat,  2 Jul 2022 10:44:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5784C34114;
	Sat,  2 Jul 2022 10:44:43 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="CTULaTMa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1656758681;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=X7VoST/gQQ8387KBGz1R5Ge4+KhTLxVtq6JIcf4KayM=;
	b=CTULaTMavdzWC1BD9E1NeGiwPVO8WSS3ibNUQ4m9IoONfBvYyM6BhNGe/L6Tfox7Et3/Jv
	l+ZG8Asihj8w5elqlVraEwCXcTvjc4cE33XyyU8dTRtrucPeSKz1CG/C1+CVh7cQO4fze/
	xrHfasK2j+FCs07jh3u4GFGctBS+6tY=
Received: 	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 106d8e3a (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO);
	Sat, 2 Jul 2022 10:44:41 +0000 (UTC)
Date: Sat, 2 Jul 2022 12:44:38 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Sachin Sant <sachinp@linux.ibm.com>
Subject: Re: [PATCH v4 0/2] powerpc rng cleanups
Message-ID: <YsAhlti36Q12Qjti@zx2c4.com>
References: <20220701084946.225357-1-Jason@zx2c4.com>
 <50CA4404-F30D-4503-918E-30464DC9DCF1@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <50CA4404-F30D-4503-918E-30464DC9DCF1@linux.ibm.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, paulus@samba.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Jul 02, 2022 at 04:00:03PM +0530, Sachin Sant wrote:
> > On 01-Jul-2022, at 2:19 PM, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> > 
> > These are two small cleanups for -next.
> > 
> > This is meant to be atop
> > https://lore.kernel.org/all/20220630121654.1939181-1-Jason@zx2c4.com/
> > which is expected to land first.
> > 
> > v4 fixes up an inversion of thr DR flag.
> > 
> > Jason A. Donenfeld (2):
> >  powerpc/powernv: rename remaining rng powernv_ functions to pnv_
> >  powerpc/kvm: don't crash on missing rng, and use darn
> > 
> 
> Boot tested this series and can successfully boot a Power8 server.
> 
> fwiw Tested-by: Sachin Sant <sachinp@linux.ibm.com>

Oh good. 4th time's a charm then. I had assumed this would be for 5.20,
but maybe it'll hit 5.19-rcx instead.

Jason
