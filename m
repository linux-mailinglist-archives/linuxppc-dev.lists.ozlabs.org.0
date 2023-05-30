Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C710671645E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 May 2023 16:38:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QVw4v5S72z3fFJ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 May 2023 00:38:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=H9+gDrhD;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.com (client-ip=2001:67c:2178:6::1d; helo=smtp-out2.suse.de; envelope-from=pmladek@suse.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=H9+gDrhD;
	dkim-atps=neutral
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QVw4110B1z3cDk
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 May 2023 00:38:07 +1000 (AEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
	by smtp-out2.suse.de (Postfix) with ESMTP id B68D31FDBD;
	Tue, 30 May 2023 14:38:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1685457483; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=EEWDz7JwGiqY+ip6MkjEhTCueHSdAyErkZJwkzbYyE4=;
	b=H9+gDrhDk7P6aYZALA8W3gBxOfmADodBMBnKpnh9CR1bOZrBKtUPxNNU0Fxz9HL7TjURP9
	0QlCDBA6daGwBCzSQ8b8m1IXqGxF0MwzIX889H27PzrH4M5Gqse83WRsSFSCTrF2ec44jL
	t8a6iKbactbBCYzF384qgrhrrBTKxKs=
Received: from suse.cz (unknown [10.100.201.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by relay2.suse.de (Postfix) with ESMTPS id 4A9252C142;
	Tue, 30 May 2023 14:38:03 +0000 (UTC)
Date: Tue, 30 May 2023 16:38:02 +0200
From: Petr Mladek <pmladek@suse.com>
To: Douglas Anderson <dianders@chromium.org>
Subject: Re: [PATCH 02/10] watchdog/hardlockup: HAVE_NMI_WATCHDOG must
 implement watchdog_hardlockup_probe()
Message-ID: <ZHYKSnLBU82fM1O2@alley>
References: <20230527014153.2793931-1-dianders@chromium.org>
 <20230526184139.2.Ic6ebbf307ca0efe91f08ce2c1eb4a037ba6b0700@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230526184139.2.Ic6ebbf307ca0efe91f08ce2c1eb4a037ba6b0700@changeid>
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

On Fri 2023-05-26 18:41:32, Douglas Anderson wrote:
> Right now there is one arch (sparc64) that selects HAVE_NMI_WATCHDOG
> without selecting HAVE_HARDLOCKUP_DETECTOR_ARCH. Because of that one
> architecture, we have some special case code in the watchdog core to
> handle the fact that watchdog_hardlockup_probe() isn't implemented.
> 
> Let's implement watchdog_hardlockup_probe() for sparc64 and get rid of
> the special case.
> 
> As a side effect of doing this, code inspection tells us that we could
> fix a minor bug where the system won't properly realize that NMI
> watchdogs are disabled. Specifically, on powerpc if
> CONFIG_PPC_WATCHDOG is turned off the arch might still select
> CONFIG_HAVE_HARDLOCKUP_DETECTOR_ARCH which selects
> CONFIG_HAVE_NMI_WATCHDOG. Since CONFIG_PPC_WATCHDOG was off then
> nothing will override the "weak" watchdog_hardlockup_probe() and we'll
> fallback to looking at CONFIG_HAVE_NMI_WATCHDOG.
> 
> Suggested-by: Petr Mladek <pmladek@suse.com>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

Looks good:

Reviewed-by: Petr Mladek <pmladek@suse.com>

> ---
> Though this does fix a minor bug, I didn't mark this as "Fixes"
> because it's super minor. One could also argue that this wasn't a bug
> at all but simply was never an implemented feature. The code that
> added some amount of dynamicness here was commit a994a3147e4c
> ("watchdog/hardlockup/perf: Implement init time detection of perf")
> which, as per the title, was only intending to make "perf"
> dynamic. The old NMI watchdog presumably has never been handled
> dynamically.

I agree that it is a minor bug and Fixes tag is not needed.

Another motivation is that all the dependencies are quite
complicated. IMHO, it is not worth spending time on
reviewing potential backports.

That said, I am afraid that the artificial intelligence will nominate
this patch for stable backports even without the Fixes tag.
You know, there are the words "fix" and "bug" in the commit message ;-)

Best Regards,
Petr
