Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DDA1870069D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 May 2023 13:22:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QHmZb5m6Cz3fWF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 May 2023 21:22:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=KpIW+Hu8;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.com (client-ip=195.135.220.28; helo=smtp-out1.suse.de; envelope-from=pmladek@suse.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=KpIW+Hu8;
	dkim-atps=neutral
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QHmYk5T03z2xYL
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 May 2023 21:21:45 +1000 (AEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
	by smtp-out1.suse.de (Postfix) with ESMTP id AA27E228E0;
	Fri, 12 May 2023 11:21:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1683890501; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8Mll1DAMbLGCFXSubtx4QEn03KKOCJspxVpDzXoQOQ4=;
	b=KpIW+Hu8ySVymSB28TiB64CYpeKVwXlVWvacchzaLtI9q7FObkmBCPO2LZ7HOgvYh0awWb
	Vu/XmXFI2k4C5E7HKbYqv+kv7F2CMc4cHuQv9iabvQkMtDDbD2aVX1La9fkct2gRNR0/Iu
	dWM7bdtfBmqRCNU9EtJIGZIfqdvJIxc=
Received: from suse.cz (pmladek.tcp.ovpn2.prg.suse.de [10.100.208.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by relay2.suse.de (Postfix) with ESMTPS id A80022C152;
	Fri, 12 May 2023 11:21:37 +0000 (UTC)
Date: Fri, 12 May 2023 13:21:34 +0200
From: Petr Mladek <pmladek@suse.com>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v4 11/17] watchdog/hardlockup: Rename some "NMI watchdog"
 constants/function
Message-ID: <ZF4hPiEjvr4_ditV@alley>
References: <20230504221349.1535669-1-dianders@chromium.org>
 <20230504151100.v4.11.I91f7277bab4bf8c0cb238732ed92e7ce7bbd71a6@changeid>
 <CSE0GBQQDUAY.1QAJIC3D3OBVU@wheely>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CSE0GBQQDUAY.1QAJIC3D3OBVU@wheely>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Ian Rogers <irogers@google.com>, Randy Dunlap <rdunlap@infradead.org>, Lecopzer Chen <lecopzer.chen@mediatek.com>, kgdb-bugreport@lists.sourceforge.net, ricardo.neri@intel.com, Stephane Eranian <eranian@google.com>, sparclinux@vger.kernel.org, Guenter Roeck <groeck@chromium.org>, Will Deacon <will@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>, Andi Kleen <ak@linux.intel.com>, Chen-Yu Tsai <wens@csie.org>, Matthias Kaehlcke <mka@chromium.org>, Catalin Marinas <catalin.marinas@arm.com>, Masayoshi Mizuma <msys.mizuma@gmail.com>, ravi.v.shankar@intel.com, Tzung-Bi Shih <tzungbi@chromium.org>, Stephen Boyd <swboyd@chromium.org>, Pingfan Liu <kernelfans@gmail.com>, linux-arm-kernel@lists.infradead.org, Sumit Garg <sumit.garg@linaro.org>, ito-yuichi@fujitsu.com, Douglas Anderson <dianders@chromium.org>, linux-perf-users@vger.kernel.org, Marc Zyngier <maz@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
 , davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri 2023-05-05 13:06:41, Nicholas Piggin wrote:
> On Fri May 5, 2023 at 8:13 AM AEST, Douglas Anderson wrote:
> > Do a search and replace of:
> > - NMI_WATCHDOG_ENABLED => HARD_WATCHDOG_ENABLED
> > - watchdog_nmi_ => watchdog_hardlockup_
> 
> These are just making prefixes inconsistent again.

Yeah, HARD_WATCHDOG_ENABLED does not fit in. I would personally
rename:

  - NMI_WATCHDOG_ENABLED => WATCHDOG_HARDLOCKUP_ENABLED
  - SOFT_WATCHDOG_ENABLED => WATCHDOG_SOFTOCKUP_ENABLED

to follow the new name space.

> If you really want to do a prefix, I would call it hardlockup which

I wish, we found a good short prefix. My problem with hardlockup_
is that for example "hardlockup_enable() looks ugly.

Also some stuff is common for both softlockup and hardlockup
detectors. And some stuff will be common for both perf and
buddy hardlockup detectors.

Possible alternatives:

   a) watchdog_, watchdog_sl_ and watchdog_hl_, watchdog_hl_buddy_
   b) wd_, wd_hardlockup_, wd_softlockup_, wd_hardlockup_buddy_
   c) wd_, wd_hl_, wd_sl_, wd_hl_buddy_
   d_ wd_, wdhl_, wdsl_, wdhl_buddy_

If you want something shorter then c) looks the best to me.

The wd_ prefix seems to be already used in:

   + arch/powerpc/kernel/watchdog.c
   + kernel/time/clocksource.c

, but it is not used in the core watchdog code at all so it
would require renaming almost everything.


> probably best matches existing code and sysctl / boot stuff, and
> concentrate on non-static symbols.

Yeah, we could hardly change the sysctl interface visible to
userspace. But we could change at least the internal code.

And if we are changing the API anyway because of the
nmi/perf/buddy/hardlockup/hard mess then lets choose
something that will help to distinguish the common watchdog
vs. softlockup/hardlockup/buddy/perf-specific watchdog code.

And I would change it to the watchdog_hardlockup_ as it is
done in this patchset:

   + the names were mostly long even before
   + the code mostly stayed within the 80-chars per-line limit
   + the patches are ready


> No problem with minor things like this that touch arch/powerpc
> going through Andrew's tree though. I'm sure sparc maintainers
> wouldn't mind either.

Good to know.

Best Regards,
Petr
