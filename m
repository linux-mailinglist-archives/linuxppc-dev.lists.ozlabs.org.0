Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 276B35825BB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Jul 2022 13:39:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LtBdQ1lh9z3cBw
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Jul 2022 21:39:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=HdzweyLf;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LtBcr2RX1z304j
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Jul 2022 21:38:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=HdzweyLf;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4LtBck6JMdz4x1b;
	Wed, 27 Jul 2022 21:38:46 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1658921926;
	bh=vZ1KHTTvl4WPZCMlJGF7NAqeZrcXyA51xm2ZpU8RaFs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=HdzweyLffYlDjINn3KByiOAq2xYh8/sex4xMv+SVDRPDCVaB7HUEtM0/hD32aZDR8
	 gUPymMEIBmarc1AreFhzNyo1quyf71VI7EqCv78Evz1HHhAPCag7lOaPaB24P8VVcz
	 i9+Jzbd/b2L7BV2I4BmJ3rHH2IZscj34Tb5C8zxFFAKPBhXbN+I9mN+Tdf91d3vZz3
	 j00Sx7bTsyuN+MyhXJVIb4C8jXptBpyUozcU4aIq2wMUI0nheRq4CEFn11qBMjQNqp
	 7RPkFWe2DIBSfHb+USXKU5sytMm/PI0XFsBl7bBYV4+h20kF6bCOweEdk1nouxP0Gh
	 InPlO/YEquB3w==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Laurent Dufour <ldufour@linux.ibm.com>
Subject: Re: [PATCH] watchdog: Fix build error when
 CONFIG_SOFTLOCKUP_DETECTOR is not set
In-Reply-To: <20220727092109.31362-1-ldufour@linux.ibm.com>
References: <20220727092109.31362-1-ldufour@linux.ibm.com>
Date: Wed, 27 Jul 2022 21:38:44 +1000
Message-ID: <87sfmmaipn.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: linux-next@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Sachin Sant <sachinp@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Laurent Dufour <ldufour@linux.ibm.com> writes:
> Sachin reported the following build error when CONFIG_SOFTLOCKUP_DETECTOR
> is not set:
>
> kernel/watchdog.c:597:20: error: static declaration of 'lockup_detector_reconfigure' follows non-static declaration
>  static inline void lockup_detector_reconfigure(void)
>                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
> In file included from kernel/watchdog.c:17:
> ./include/linux/nmi.h:125:6: note: previous declaration of 'lockup_detector_reconfigure' was here
>  void lockup_detector_reconfigure(void);
>       ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>
> The definition of lockup_detector_reconfigure should be exported even in
> that case, and __lockup_detector_reconfigure should remain static.
>
> Fixes: 24a1260705b7 ("watchdog: export lockup_detector_reconfigure")
> Reported-by: Sachin Sant <sachinp@linux.ibm.com>
> Signed-off-by: Laurent Dufour <ldufour@linux.ibm.com>
> ---
>  kernel/watchdog.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Thanks.

I'll squash that in to the original commit.

cheers
