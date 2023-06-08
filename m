Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 672AF7281B1
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Jun 2023 15:48:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QcQY31R8Nz3f87
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Jun 2023 23:48:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=m63+KFvT;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.com (client-ip=195.135.220.28; helo=smtp-out1.suse.de; envelope-from=pmladek@suse.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=m63+KFvT;
	dkim-atps=neutral
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QcQXB2Qq0z3dsq
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Jun 2023 23:48:09 +1000 (AEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
	by smtp-out1.suse.de (Postfix) with ESMTP id 7FFAF219A2;
	Thu,  8 Jun 2023 13:48:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1686232085; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yP9xLPyYFMGMpi467QcNnB+YH/wlZqcYZh3EWd4dmcY=;
	b=m63+KFvTBQEoswSYPzhIsHPn1FjqqayGRiQzC/FIKdmwxak8gkx7w9F9rldbURg/etSpZc
	BICnIf8C0z7eVZcnDvN4FdSPCN3o9oRJ9oMQtLZEJ/cLQcCi3cF2Tr8r9iBwWpkH8zBjE5
	J6OpJnSRXarKOZcGInmiJWE83pipteA=
Received: from suse.cz (unknown [10.100.208.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by relay2.suse.de (Postfix) with ESMTPS id 45B052C142;
	Thu,  8 Jun 2023 13:48:05 +0000 (UTC)
Date: Thu, 8 Jun 2023 15:48:04 +0200
From: Petr Mladek <pmladek@suse.com>
To: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH 7/7] watchdog/hardlockup: Define HARDLOCKUP_DETECTOR_ARCH
Message-ID: <ZIHcFDnQPuVe1vAc@alley>
References: <20230607152432.5435-1-pmladek@suse.com>
 <20230607152432.5435-8-pmladek@suse.com>
 <CAD=FV=U8CTttqz9jL6TockdKTd1dM1ApR4Nw+X3OF5tgoagfRQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD=FV=U8CTttqz9jL6TockdKTd1dM1ApR4Nw+X3OF5tgoagfRQ@mail.gmail.com>
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
Cc: kgdb-bugreport@lists.sourceforge.net, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, linux-perf-users@vger.kernel.org, sparclinux@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed 2023-06-07 16:37:10, Doug Anderson wrote:
> Hi,
> 
> On Wed, Jun 7, 2023 at 8:26 AM Petr Mladek <pmladek@suse.com> wrote:
> >
> > @@ -1102,6 +1103,14 @@ config HARDLOCKUP_DETECTOR_BUDDY
> >         depends on !HAVE_HARDLOCKUP_DETECTOR_ARCH
> >         select HARDLOCKUP_DETECTOR_COUNTS_HRTIMER
> >
> > +config HARDLOCKUP_DETECTOR_ARCH
> > +       bool
> > +       depends on HARDLOCKUP_DETECTOR
> > +       depends on HAVE_HARDLOCKUP_DETECTOR_ARCH
> > +       help
> > +         The arch-specific implementation of the hardlockup detector is
> > +         available.
> 
> nit: "is available" makes it sound a bit too much like a "have"
> version. Maybe "The arch-specific implementation of the hardlockup
> detector will be used" or something like that?

Makes sense. Will do this change in v2.

> Otherise:
> 
> Reviewed-by: Douglas Anderson <dianders@chromium.org>

Thanks,
Petr
