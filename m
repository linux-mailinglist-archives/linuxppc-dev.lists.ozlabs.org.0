Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB0D5743824
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Jun 2023 11:20:21 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=ARtNh02g;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QsqXz5Pw8z3bv8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Jun 2023 19:20:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=ARtNh02g;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.com (client-ip=195.135.220.28; helo=smtp-out1.suse.de; envelope-from=pmladek@suse.com; receiver=lists.ozlabs.org)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QsqX42WTMz30hw
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Jun 2023 19:19:30 +1000 (AEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
	by smtp-out1.suse.de (Postfix) with ESMTP id CB2422189C;
	Fri, 30 Jun 2023 09:19:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1688116765; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=j3GEhaNA0apRlT03hhOFTYFrxGOQIyTB0AkaO1T1KQQ=;
	b=ARtNh02gLnlihH768pnMUpK2PYdehqY6uxev1Di3n+k98cR4mQlmkMzSfkf3LncAmI49wn
	yiR/DEFowAKXKSBPRK4SlYsJ4QDXZEZXuXh6mflFI9Z219zQoMBDfFrgNLDYLg+XZrjxcY
	HtN7M5t79qkAs03dyevmiNWIlq5ZOfI=
Received: from suse.cz (unknown [10.100.201.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by relay2.suse.de (Postfix) with ESMTPS id 00B2D2C141;
	Fri, 30 Jun 2023 09:19:22 +0000 (UTC)
Date: Fri, 30 Jun 2023 11:19:22 +0200
From: Petr Mladek <pmladek@suse.com>
To: Douglas Anderson <dianders@chromium.org>
Subject: Re: [PATCH] powerpc: Include asm/nmi.c in mobility.c for
 watchdog_hardlockup_set_timeout_pct()
Message-ID: <ZJ6eGnySMpMh7cRv@alley>
References: <20230629124500.1.I55e2f4e7903d686c4484cb23c033c6a9e1a9d4c4@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230629124500.1.I55e2f4e7903d686c4484cb23c033c6a9e1a9d4c4@changeid>
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>, Jilin Yuan <yuanjilin@cdjrlc.com>, Tom Rix <trix@redhat.com>, Randy Dunlap <rdunlap@infradead.org>, Haren Myneni <haren@linux.ibm.com>, linux-kernel@vger.kernel.org, Luis Chamberlain <mcgrof@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrew Morton <akpm@linux-foundation.org>, Laurent Dufour <ldufour@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu 2023-06-29 12:45:06, Douglas Anderson wrote:
> The powerpc/platforms/pseries/mobility.c calls
> watchdog_hardlockup_set_timeout_pct(), which is declared in
> <asm/nmi.h>. We used to automatically get <asm/nmi.h> included, but
> that changed as of commit 7ca8fe94aa92 ("watchdog/hardlockup: define
> HARDLOCKUP_DETECTOR_ARCH"). Let's add the explicit include.
> 
> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> Closes: https://lore.kernel.org/r/af19b76d-aa4b-6c88-9cac-eae4b2072497@infradead.org
> Fixes: 7ca8fe94aa92 ("watchdog/hardlockup: define HARDLOCKUP_DETECTOR_ARCH")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

Thanks for the patch:

Reviewed-by: Petr Mladek <pmladek@suse.com>

Best Regards,
Petr
