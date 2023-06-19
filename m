Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A03AB735187
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Jun 2023 12:08:46 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=kpNSnf7r;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ql57w3krRz3cjf
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Jun 2023 20:08:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=kpNSnf7r;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.com (client-ip=2001:67c:2178:6::1d; helo=smtp-out2.suse.de; envelope-from=pmladek@suse.com; receiver=lists.ozlabs.org)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ql4rS0tyNz3c54
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Jun 2023 19:55:19 +1000 (AEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
	by smtp-out2.suse.de (Postfix) with ESMTP id 680A91F38A;
	Mon, 19 Jun 2023 09:55:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1687168508; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BqmUWIwDB6MccYaGRsbpmDX+MgysrUEAbIREmqAE7tY=;
	b=kpNSnf7reRG026G37InlC9KBsz3JngC4BSohPCpE0Ofc8ydoyz5aDha+1hAEwNWXhASmzX
	JV7x4Bu/lZZHnRlKAzxfLi3A7L5vetPl1KZBY3/H/ktCk4Lt0ZiiylFlNJrfUgRwyPoKfP
	BcAm8JrzmAlSyJ7pzGIK0PKATklgyIU=
Received: from suse.cz (unknown [10.100.208.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by relay2.suse.de (Postfix) with ESMTPS id A3CCF2C141;
	Mon, 19 Jun 2023 09:55:06 +0000 (UTC)
Date: Mon, 19 Jun 2023 11:55:06 +0200
From: Petr Mladek <pmladek@suse.com>
To: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH v2 4/6] watchdog/hardlockup: Make HAVE_NMI_WATCHDOG
 sparc64-specific
Message-ID: <ZJAl-rznBaZubY3-@alley>
References: <20230616150618.6073-1-pmladek@suse.com>
 <20230616150618.6073-5-pmladek@suse.com>
 <CAD=FV=U=ox4ApMbDL7v=ivNF6x=UyG=dd4MU_Dt0rppNCEwCpw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD=FV=U=ox4ApMbDL7v=ivNF6x=UyG=dd4MU_Dt0rppNCEwCpw@mail.gmail.com>
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

On Fri 2023-06-16 09:48:06, Doug Anderson wrote:
> Hi,
> 
> On Fri, Jun 16, 2023 at 8:07 AM Petr Mladek <pmladek@suse.com> wrote:
> >
> > There are several hardlockup detector implementations and several Kconfig
> > values which allow selection and build of the preferred one.
[...]
> > Note that HARDLOCKUP_DETECTOR_PREFER_BUDDY, HARDLOCKUP_DETECTOR_PERF,
> > and HARDLOCKUP_DETECTOR_BUDDY may conflict only with
> > HAVE_HARDLOCKUP_DETECTOR_ARCH. They depend on HARDLOCKUP_DETECTOR
> > and it is not longer enabled when HAVE_NMI_WATCHDOG is set.
> >
> > Signed-off-by: Petr Mladek <pmladek@suse.com>
> >
> > watchdog/sparc64: Rename HAVE_NMI_WATCHDOG to HAVE_HARDLOCKUP_WATCHDOG_SPARC64
[...]
> > Also the variable is set only on sparc64. Move the definition
> > from arch/Kconfig to arch/sparc/Kconfig.debug.
> >
> > Signed-off-by: Petr Mladek <pmladek@suse.com>
> 
> I think you goofed up when squashing the patches. You've now got a
> second patch subject after your first Signed-off-by and then a second
> Signed-off-by... I assume everything after the first Signed-off-by
> should be dropped?

Ah, you are right. It seems that Andrew has fixed this when taking
the patch.

Thank you both,
Petr
