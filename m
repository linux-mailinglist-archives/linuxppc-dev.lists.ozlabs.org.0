Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 42A4270D935
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 May 2023 11:36:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QQThh17bTz3f7H
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 May 2023 19:36:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=KU08slto;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.com (client-ip=195.135.220.29; helo=smtp-out2.suse.de; envelope-from=pmladek@suse.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=KU08slto;
	dkim-atps=neutral
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QQTgn3TCRz30Qg
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 May 2023 19:35:15 +1000 (AEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
	by smtp-out2.suse.de (Postfix) with ESMTP id B6BD41FF45;
	Tue, 23 May 2023 09:35:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1684834512; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IAYq7YJVS2Hlnl42uVu2goasTRVPRgZ4NqjKSyNxGrQ=;
	b=KU08sltoiXCpoxueN/xTm1Dj8XgBHSTDWuL90uW147a2/O/Mr6ZoeLyNLFpVJWdIVW5kxX
	qqA4ifcAtaWSIWN6bnayexKSUglQmxet+EFMnoKUKq4Izsg5nga9Xy+G/qI4h+1EzPAbdY
	lsmjo1AyUZ4F7lDFhMIZqs6iohgJ0mY=
Received: from suse.cz (unknown [10.100.201.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by relay2.suse.de (Postfix) with ESMTPS id 46EBC2C141;
	Tue, 23 May 2023 09:35:07 +0000 (UTC)
Date: Tue, 23 May 2023 11:35:02 +0200
From: Petr Mladek <pmladek@suse.com>
To: Douglas Anderson <dianders@chromium.org>
Subject: Re: [PATCH v5 02/18] watchdog/perf: More properly prevent false
 positives with turbo modes
Message-ID: <ZGyIxvKhVjr-L8-I@alley>
References: <20230519101840.v5.18.Ia44852044cdcb074f387e80df6b45e892965d4a1@changeid>
 <20230519101840.v5.2.I843b0d1de3e096ba111a179f3adb16d576bef5c7@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230519101840.v5.2.I843b0d1de3e096ba111a179f3adb16d576bef5c7@changeid>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Ian Rogers <irogers@google.com>, ito-yuichi@fujitsu.com, Lecopzer Chen <lecopzer.chen@mediatek.com>, kgdb-bugreport@lists.sourceforge.net, ricardo.neri@intel.com, Stephane Eranian <eranian@google.com>, sparclinux@vger.kernel.org, Guenter Roeck <groeck@chromium.org>, Will Deacon <will@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>, Andi Kleen <ak@linux.intel.com>, Marc Zyngier <maz@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Matthias Kaehlcke <mka@chromium.org>, Catalin Marinas <catalin.marinas@arm.com>, Masayoshi Mizuma <msys.mizuma@gmail.com>, ravi.v.shankar@intel.com, Tzung-Bi Shih <tzungbi@chromium.org>, npiggin@gmail.com, Stephen Boyd <swboyd@chromium.org>, Pingfan Liu <kernelfans@gmail.com>, linux-arm-kernel@lists.infradead.org, Sumit Garg <sumit.garg@linaro.org>, Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozl
 abs.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri 2023-05-19 10:18:26, Douglas Anderson wrote:
> Currently, in the watchdog_overflow_callback() we first check to see
> if the watchdog had been touched and _then_ we handle the workaround
> for turbo mode. This order should be reversed.
> 
> Specifically, "touching" the hardlockup detector's watchdog should
> avoid lockups being detected for one period that should be roughly the
> same regardless of whether we're running turbo or not. That means that
> we should do the extra accounting for turbo _before_ we look at (and
> clear) the global indicating that we've been touched.

The ideal solution would be to reset the turbo-mode-related
variables when the watchdog is touched. And keep checking
watchdog_nmi_touch first.

But this ordering change should be good enough. It causes that
we always check watchdog_nmi_touch when the turbo-more-related
variables are already reset.

> NOTE: this fix is made based on code inspection. I am not aware of any
> reports where the old code would have generated false positives. That
> being said, this order seems more correct and also makes it easier
> down the line to share code with the "buddy" hardlockup detector.
> 
> Fixes: 7edaeb6841df ("kernel/watchdog: Prevent false positives with turbo modes")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

Reviewed-by: Petr Mladek <pmladek@suse.com>

Best Regards,
Petr
