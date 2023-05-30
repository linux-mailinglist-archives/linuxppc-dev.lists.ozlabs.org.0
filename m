Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A5E3F716375
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 May 2023 16:16:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QVvZz2Tk0z3f7Y
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 May 2023 00:16:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=qwneuzT8;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.com (client-ip=195.135.220.29; helo=smtp-out2.suse.de; envelope-from=pmladek@suse.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=qwneuzT8;
	dkim-atps=neutral
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QVvZ54SR6z3bkD
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 May 2023 00:15:39 +1000 (AEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
	by smtp-out2.suse.de (Postfix) with ESMTP id 71C5D1FD96;
	Tue, 30 May 2023 14:15:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1685456136; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=f03SjuaWbgPFKDNHkccYfxdvERRD4V1UOqT9AnVf20c=;
	b=qwneuzT8aVE62UwAlpeyfFZ8eI36IDinEAOaWAF5L4znVMIaf6zMod/lkB42XEy/NcnL2A
	C+hZu4NVw46mIT0SZgCF7kkibghDwAAeOiAUxhgDsFJLco5k09k1bbmKdbw6adC+Nk7rpu
	CJ0MBEUmWwYed0L2p4tEgaYiUAzHSJQ=
Received: from suse.cz (unknown [10.100.201.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by relay2.suse.de (Postfix) with ESMTPS id DEA372C141;
	Tue, 30 May 2023 14:15:33 +0000 (UTC)
Date: Tue, 30 May 2023 16:15:33 +0200
From: Petr Mladek <pmladek@suse.com>
To: Douglas Anderson <dianders@chromium.org>
Subject: Re: [PATCH 01/10] watchdog/hardlockup: Keep kernel.nmi_watchdog
 sysctl as 0444 if probe fails
Message-ID: <ZHYFBUnXmjAvhUFT@alley>
References: <20230527014153.2793931-1-dianders@chromium.org>
 <20230526184139.1.I0d75971cc52a7283f495aac0bd5c3041aadc734e@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230526184139.1.I0d75971cc52a7283f495aac0bd5c3041aadc734e@changeid>
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

On Fri 2023-05-26 18:41:31, Douglas Anderson wrote:
> The permissions for the kernel.nmi_watchdog sysctl have always been
> set at compile time despite the fact that a watchdog can fail to
> probe. Let's fix this and set the permissions based on whether the
> hardlockup detector actually probed.
> 
> Fixes: a994a3147e4c ("watchdog/hardlockup/perf: Implement init time detection of perf")
> Reported-by: Petr Mladek <pmladek@suse.com>
> Closes: https://lore.kernel.org/r/ZHCn4hNxFpY5-9Ki@alley
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

Looks good to me:

Reviewed-by: Petr Mladek <pmladek@suse.com>

Best Regards,
Petr
