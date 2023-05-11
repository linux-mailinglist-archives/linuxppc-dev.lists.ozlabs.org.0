Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AA6DB6FEDF4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 May 2023 10:40:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QH52R36kDz3f5Y
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 May 2023 18:40:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=KRxlm6Ku;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.com (client-ip=195.135.220.29; helo=smtp-out2.suse.de; envelope-from=pmladek@suse.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=KRxlm6Ku;
	dkim-atps=neutral
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QH51Z0zkbz3bdm
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 May 2023 18:40:01 +1000 (AEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
	by smtp-out2.suse.de (Postfix) with ESMTP id 373C81F388;
	Thu, 11 May 2023 08:39:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1683794397; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NXRHuyXM8rpe4qUASDvyNmrhcGnhIuyAUOQ0j7TuG3M=;
	b=KRxlm6KuhcYRuut5Ld+57zEuix1UM/lh3QaDTebljqkZebiCmbRUL2VE5j6KhI8NLtUF6g
	uTz4Fqa7EcHubjpJkiY38RTszd30kTaJWb0AFgyM3QYWNyVx3UpSzltfsdsXOZYEOXEXvF
	q3IjA46B7zTin0OxRhwRS2niCS9Bhi4=
Received: from suse.cz (unknown [10.100.201.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by relay2.suse.de (Postfix) with ESMTPS id B50ED2C141;
	Thu, 11 May 2023 08:39:54 +0000 (UTC)
Date: Thu, 11 May 2023 10:39:53 +0200
From: Petr Mladek <pmladek@suse.com>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v4 01/17] watchdog/perf: Define dummy
 watchdog_update_hrtimer_threshold() on correct config
Message-ID: <ZFyp2aCIf8W5w65v@alley>
References: <20230504221349.1535669-1-dianders@chromium.org>
 <20230504151100.v4.1.I8cbb2f4fa740528fcfade4f5439b6cdcdd059251@changeid>
 <CSDZYTDN5EHC.1AOZO6QV1UGJR@wheely>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CSDZYTDN5EHC.1AOZO6QV1UGJR@wheely>
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

On Fri 2023-05-05 12:43:49, Nicholas Piggin wrote:
> On Fri May 5, 2023 at 8:13 AM AEST, Douglas Anderson wrote:
> > The real watchdog_update_hrtimer_threshold() is defined in
> > watchdog_hardlockup_perf.c. That file is included if
> 
> In kernel/watchdog_hld.c.

With this fixed path:

Reviewed-by: Petr Mladek <pmladek@suse.com>

> > CONFIG_HARDLOCKUP_DETECTOR_PERF and the function is defined in that
> > file if CONFIG_HARDLOCKUP_CHECK_TIMESTAMP.
> >
> > The dummy version of the function in "nmi.h" didn't get that quite
> > right. While this doesn't appear to be a huge deal, it's nice to make
> > it consistent.
> 
> It doesn't break builds because CHECK_TIMESTAMP is only defined by
> x86 so others don't get a double definition, and x86 uses perf lockup
> detector, so it gets the out of line version.
> 
> So has no functional change but should be fixed.
> 
> Reviewed-by: Nicholas Piggin <npiggin@gmail.com>
> 
> >
> > Fixes: 7edaeb6841df ("kernel/watchdog: Prevent false positives with turbo modes")
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>

Best Regards,
Petr
