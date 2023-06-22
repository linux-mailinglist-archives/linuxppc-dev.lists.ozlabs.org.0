Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 67B5C739A26
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Jun 2023 10:41:21 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=ps0suCBT;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qmv3g2CtXz309q
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Jun 2023 18:41:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=ps0suCBT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.com (client-ip=2001:67c:2178:6::1d; helo=smtp-out2.suse.de; envelope-from=pmladek@suse.com; receiver=lists.ozlabs.org)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qmv2k5WvBz2yyV
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Jun 2023 18:40:28 +1000 (AEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
	by smtp-out2.suse.de (Postfix) with ESMTP id 88A3320427;
	Thu, 22 Jun 2023 08:40:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1687423217; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mJUeHRwvSRI1USK97hB/jvNr2ApKuOYeUxF/NEMnAOo=;
	b=ps0suCBTBthe6h0Nfl48mHNnsZr5TTQOTH2AvK9D3K1jom6XmgEiduYWXRN7jhwIr7Q24d
	MRFAbIkqkq6luq/8bxxMkxc5T059iRnT6N7MBpKOrCqbETiNOcLWUAeeY89i+aSh2ofn9u
	mrwh50t0CC6d/jj7vksrsGgCk6SdodI=
Received: from suse.cz (pmladek.udp.ovpn2.prg.suse.de [10.100.201.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by relay2.suse.de (Postfix) with ESMTPS id 393382C141;
	Thu, 22 Jun 2023 08:40:15 +0000 (UTC)
Date: Thu, 22 Jun 2023 10:40:11 +0200
From: Petr Mladek <pmladek@suse.com>
To: Douglas Anderson <dianders@chromium.org>
Subject: Re: [PATCH] powerpc: Move arch_trigger_cpumask_backtrace from nmi.h
 to irq.h
Message-ID: <ZJQI6_P2yfJKZK52@alley>
References: <20230621164809.1.Ice67126857506712559078e7de26d32d26e64631@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230621164809.1.Ice67126857506712559078e7de26d32d26e64631@changeid>
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, Tom Rix <trix@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, Laurent Dufour <ldufour@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed 2023-06-21 16:48:19, Douglas Anderson wrote:
> The powerpc architecture was the only one that defined
> arch_trigger_cpumask_backtrace() in asm/nmi.h instead of
> asm/irq.h. Move it to be consistent.
> 
> This fixes compile time errors introduced by commit 7ca8fe94aa92
> ("watchdog/hardlockup: define HARDLOCKUP_DETECTOR_ARCH"). That commit

Will this commit end up in the mainline wihtout rebasing?
We could use only final commit hashes in the commit messages.

> caused <asm/nmi.h> to stop being included if the hardlockup detector
> wasn't enabled. The specific errors were:
>   error: implicit declaration of function ‘nmi_cpu_backtrace’
>   error: implicit declaration of function ‘nmi_trigger_cpumask_backtrace’
> 
> Fixes: 7ca8fe94aa92 ("watchdog/hardlockup: define HARDLOCKUP_DETECTOR_ARCH")
> Reported-by: Michael Ellerman <mpe@ellerman.id.au>
> Closes: https://lore.kernel.org/r/871qi5otdh.fsf@mail.lhotse
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

Looks like a reasonable solution:

Reviewed-by: Petr Mladek <pmladek@suse.com>

Thanks a lot for fixing the regression.

Best Regards,
Petr
