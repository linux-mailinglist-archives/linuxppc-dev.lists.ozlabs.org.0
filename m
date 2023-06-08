Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D571C727DD1
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Jun 2023 13:04:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QcLv84kRLz3dxQ
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Jun 2023 21:04:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=c8tiLtHY;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.com (client-ip=2001:67c:2178:6::1d; helo=smtp-out2.suse.de; envelope-from=pmladek@suse.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=c8tiLtHY;
	dkim-atps=neutral
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QcLtG4rcMz3dwm
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Jun 2023 21:03:34 +1000 (AEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
	by smtp-out2.suse.de (Postfix) with ESMTP id 73AB81FDCB;
	Thu,  8 Jun 2023 11:03:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1686222207; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OmGpYQHxrkRWd3zHWeEZ/+FUz6+Ti2y9azLyKi/9VXc=;
	b=c8tiLtHYMhWgJjrI950UtHFjJJ3An1MKHJgcx/Znq//lHtsgq5ldmCgdtfNVK7TuGeiKDE
	ZPtlKVMYawfGmguYaePV/4HFgd8zPjzk8L2wLXnrA3+eBLevEgpqSJuDEj8icgI59yO1GW
	rBoEh9e3GyFy8YgCMK3YOO9SBOeyoAE=
Received: from suse.cz (unknown [10.100.208.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by relay2.suse.de (Postfix) with ESMTPS id 38B7D2C141;
	Thu,  8 Jun 2023 11:03:27 +0000 (UTC)
Date: Thu, 8 Jun 2023 13:03:26 +0200
From: Petr Mladek <pmladek@suse.com>
To: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH 3/7] watchdog/hardlockup: Declare
 arch_touch_nmi_watchdog() only in linux/nmi.h
Message-ID: <ZIG1fpHf5ULK0zqU@alley>
References: <20230607152432.5435-1-pmladek@suse.com>
 <20230607152432.5435-4-pmladek@suse.com>
 <CAD=FV=XvUAeKFAcOD_xaT2to45=CCiKJMRbi-uxgrZ4mWN7hZg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD=FV=XvUAeKFAcOD_xaT2to45=CCiKJMRbi-uxgrZ4mWN7hZg@mail.gmail.com>
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

On Wed 2023-06-07 16:35:19, Doug Anderson wrote:
> Hi,
> 
> On Wed, Jun 7, 2023 at 8:25 AM Petr Mladek <pmladek@suse.com> wrote:
> >
> > arch_touch_nmi_watchdog() needs a different implementation for various
> > hardlockup detector implementations. And it does nothing when
> > any hardlockup detector is not build at all.
> 
> s/build/built/

Will fix in v2.

> 
> This looks right and is a nice cleanup.
> 
> Reviewed-by: Douglas Anderson <dianders@chromium.org>

Thanks a lot.

Best Regards,
Petr
