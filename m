Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5646F797627
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Sep 2023 18:02:32 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=ZoXmbJwo;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=Js3OrJdw;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RhPCB1219z3cGv
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Sep 2023 02:02:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=ZoXmbJwo;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=Js3OrJdw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=195.135.220.28; helo=smtp-out1.suse.de; envelope-from=msuchanek@suse.de; receiver=lists.ozlabs.org)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RhPBD2wncz2yQ8
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Sep 2023 02:01:39 +1000 (AEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
	by smtp-out1.suse.de (Postfix) with ESMTP id 306CB21869;
	Thu,  7 Sep 2023 16:01:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1694102496; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=R/D2ieUB1GswQ++8w/dBBsnHuUV980PASUrxA2YccPo=;
	b=ZoXmbJwo2m6uNKRJjqyAwLvp+pSKw+97AX5VABt9F0VNZuEDdnvcHHcZzHpnxZfEgcNxtW
	cMxN4207onNEaLv17ouu+3nMlhFzrRKdOQKYB7LBQLGFzVOBL2DeQWK2VZB2zzxb1u5Erw
	KD5nkIEciVzL5FxjF7R1cftIJ7iTgBM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1694102496;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=R/D2ieUB1GswQ++8w/dBBsnHuUV980PASUrxA2YccPo=;
	b=Js3OrJdwcFEKqr08B1ooVNuGNgMHzf5RCCDKC4afgcEOO9R1AXvzgW7A06y/p9P07tk/8w
	V7xOEqqDBc1/a0CQ==
Received: from kitsune.suse.cz (kitsune.suse.cz [10.100.12.127])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by relay2.suse.de (Postfix) with ESMTPS id AED622C142;
	Thu,  7 Sep 2023 16:01:35 +0000 (UTC)
Date: Thu, 7 Sep 2023 18:01:34 +0200
From: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To: Nathan Lynch <nathanl@linux.ibm.com>
Subject: Re: [PATCH RFC] powerpc/rtas: Make it possible to disable sys_rtas
Message-ID: <20230907160134.GZ8826@kitsune.suse.cz>
References: <20230822-papr-sys_rtas-vs-lockdown-v1-0-932623cf3c7b@linux.ibm.com>
 <20230906120855.28331-1-msuchanek@suse.de>
 <87bkefw0ws.fsf@li-e15d104c-2135-11b2-a85c-d7ef17e56be6.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87bkefw0ws.fsf@li-e15d104c-2135-11b2-a85c-d7ef17e56be6.ibm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: gcwilson@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>, tyreld@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Sep 06, 2023 at 02:34:59PM -0500, Nathan Lynch wrote:
> Michal Suchanek <msuchanek@suse.de> writes:
> 
> > Additional patch suggestion to go with the rtas devices:
> >
> > -----------------------------------------------------------------------
> >
> > With most important rtas functions available through different
> > interfaces the sys_rtas interface can be disabled completely.
> >
> > Do not remove it for now to make it possible to run older versions of
> > userspace tools that don't support other interfaces.
> 
> Thanks. I hope making sys_rtas on/off-configurable will make sense
> eventually, and I expect this series to get us closer to that. But to me
> it seems too early and too coarse. A kernel built with RTAS_SYSCALL=n is
> not something I'd want to support or run in production soon. It would
> break too many known use cases, and likely some unknown ones as well.

There are about 3 known use cases that absolutely need access by other
means than sys_rtas to work with lockdown, and about other 3 that would
work either way.

That's not so staggering that it could not be implemented in the kernel
from the start.
How long it will take for the known userspace users to catch up is
anotehr questio but again it's something that can be addressed.

Making it possible to turn off sys_rtas will make it easier to uncover
the not yet known cases.

What people want to support depends a lot on what is converted, and also
the situation of the distribution in question. Fast-rollong
distributions may want only the new interface quite soon, and so may
distributions that are starting development of new release.

All this makes sense only if there is a plan to discontinue sys_rtas
entirely. For the simple calls that don't need data buffers it's still
usable.

> It could be more useful in the near term to construct a configurable
> list of RTAS functions that sys_rtas is allowed to expose.

If we really need this level of datail I guess it is too early.

Thanks

Michal
