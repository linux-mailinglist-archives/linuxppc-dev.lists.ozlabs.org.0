Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C869559378
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jun 2022 08:32:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LTnNb4LN6z3cgc
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jun 2022 16:32:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=TnhK007p;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LTnN22fNMz3brX
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Jun 2022 16:32:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=TnhK007p;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4LTnN159zNz4xZj;
	Fri, 24 Jun 2022 16:32:01 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1656052322;
	bh=P/l9k24ueAGNrZN2eX9B52ADsu9gsrUuIWkIUWXutKk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=TnhK007pd8/cxruAnH3n4r2z/szHgOCDRslEwn9VVdQ/+X+Is7Ln62BxoIAYZeC7T
	 Kg9l4Bdaq8UMZIQ3PDMxleL6NmeT3aBA20xUGEMUS/tK1tO0ZceChn6AYglus+RxBm
	 lW0n5syTWPaz/huNhuPhx7SGnH9LBxpF96H5F8Nm/OV7m9eDqRUTMxvRRqCk6H7AGw
	 K3svGvxdFvMtnlxEZkJDBgvwENR0PVgaxGgSCnqU+1kjdTlAV68e0oK7aHZ+vcw1li
	 BccZkpc3KOuEX7AnEc1dMaVuFYGv+f/mYY9+oCor8mzfPBFiBnTzppFz6zEV0bfN/+
	 E/mrugwXeO7eg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Laurent Dufour <ldufour@linux.ibm.com>, benh@kernel.crashing.org,
 paulus@samba.org, nathanl@linux.ibm.com, haren@linux.vnet.ibm.com,
 npiggin@gmail.com
Subject: Re: [PATCH v2 2/4] watchdog: export watchdog_mutex and
 lockup_detector_reconfigure
In-Reply-To: <20220614135414.37746-3-ldufour@linux.ibm.com>
References: <20220614135414.37746-1-ldufour@linux.ibm.com>
 <20220614135414.37746-3-ldufour@linux.ibm.com>
Date: Fri, 24 Jun 2022 16:31:55 +1000
Message-ID: <871qve6084.fsf@mpe.ellerman.id.au>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Laurent Dufour <ldufour@linux.ibm.com> writes:
> In some cricunstances it may be interesting to reconfigure the watchdog
> from inside the kernel.
>
> On PowerPC, this may helpful before and after a LPAR migration (LPM) is
> initiated, because it implies some latencies, watchdog, and especially NMI
> watchdog is expected to be triggered during this operation. Reconfiguring
> the watchdog, would prevent it to happen too frequently during LPM.
>
> The watchdog_mutex is exported to allow some variable to be changed under
> its protection and prevent any conflict.
> The lockup_detector_reconfigure() function is exported and is expected to
> be called under the protection of watchdog_mutex.
>
> Signed-off-by: Laurent Dufour <ldufour@linux.ibm.com>
> ---
>  include/linux/nmi.h | 3 +++
>  kernel/watchdog.c   | 6 +++---
>  2 files changed, 6 insertions(+), 3 deletions(-)

Is there a maintainer for kernel/watchdog.c ?

There's Wim & Guenter at linux-watchdog@vger but I think that's only for
drivers/watchdog?

Maybe we should Cc that list anyway?


> diff --git a/include/linux/nmi.h b/include/linux/nmi.h
> index 750c7f395ca9..84300fb0f90a 100644
> --- a/include/linux/nmi.h
> +++ b/include/linux/nmi.h
> @@ -122,6 +122,9 @@ int watchdog_nmi_probe(void);
>  int watchdog_nmi_enable(unsigned int cpu);
>  void watchdog_nmi_disable(unsigned int cpu);
>  
> +extern struct mutex watchdog_mutex;
> +void lockup_detector_reconfigure(void);

It would be preferable if we didn't export the mutex.

I think you could arrange that by ...

Renaming lockup_detector_configure() to __lockup_detector_configure()
and then adding a new lockup_detector_configure() that is non-static and
takes the lock around __lockup_detector_configure().

cheers
