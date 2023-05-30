Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C2B5716559
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 May 2023 16:57:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QVwV36KY5z3f67
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 May 2023 00:57:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=X7CGi3j7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.com (client-ip=195.135.220.29; helo=smtp-out2.suse.de; envelope-from=pmladek@suse.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=X7CGi3j7;
	dkim-atps=neutral
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QVwTD2XXKz3cCW
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 May 2023 00:56:30 +1000 (AEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
	by smtp-out2.suse.de (Postfix) with ESMTP id 7A06F1FD85;
	Tue, 30 May 2023 14:56:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1685458587; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4zjZSXWgs35Ue3qF1WuzqRP54/h45jHQgSPnhYcIU8k=;
	b=X7CGi3j7OdaOafJPBf4V7/HfYwoFC4WhmdvEtMPU/E5sBlErtslZ0vRFR0mCB3gXTWC5M/
	pWYwuEZXPzhVsflGNNkoJ7gkdwRBeN017rNvllAhCW2x9iPDS+i86UBflSU835J+caFnAC
	vDypk4j2dnH67+rCEnPiE4IRyvA9VDI=
Received: from suse.cz (unknown [10.100.201.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by relay2.suse.de (Postfix) with ESMTPS id 261FD2C141;
	Tue, 30 May 2023 14:56:27 +0000 (UTC)
Date: Tue, 30 May 2023 16:56:26 +0200
From: Petr Mladek <pmladek@suse.com>
To: Douglas Anderson <dianders@chromium.org>
Subject: Re: [PATCH 06/10] watchdog/buddy: Cleanup how
 watchdog_buddy_check_hardlockup() is called
Message-ID: <ZHYOmkZBxd4TiTv-@alley>
References: <20230527014153.2793931-1-dianders@chromium.org>
 <20230526184139.6.I006c7d958a1ea5c4e1e4dc44a25596d9bb5fd3ba@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230526184139.6.I006c7d958a1ea5c4e1e4dc44a25596d9bb5fd3ba@changeid>
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

On Fri 2023-05-26 18:41:36, Douglas Anderson wrote:
> In the patch ("watchdog/hardlockup: detect hard lockups using
> secondary (buddy) CPUs"), we added a call from the common watchdog.c
> file into the buddy. That call could be done more cleanly.
> Specifically:
> 1. If we move the call into watchdog_hardlockup_kick() then it keeps
>    watchdog_timer_fn() simpler.
> 2. We don't need to pass an "unsigned long" to the buddy for the timer
>    count. In the patch ("watchdog/hardlockup: add a "cpu" param to
>    watchdog_hardlockup_check()") the count was changed to "atomic_t"
>    which is backed by an int, so we should match types.
> 
> Suggested-by: Petr Mladek <pmladek@suse.com>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>


The change looks fine:

Reviewed-by: Petr Mladek <pmladek@suse.com>

That said, I would prefer to squash it into the patch ("watchdog/hardlockup:
detect hard lockups using secondary (buddy) CPUs"). It would remove
some back and forth churn in the git history. But it is up to Andrew.

Best Regards,
Petr
