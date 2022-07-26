Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EF51E580C39
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Jul 2022 09:14:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LsSpP6GxPz3cdj
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Jul 2022 17:14:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=E6X1X4Fm;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LsSnr4Jh8z30D8
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Jul 2022 17:14:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=E6X1X4Fm;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4LsSnn3Mv5z4xD9;
	Tue, 26 Jul 2022 17:14:05 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1658819647;
	bh=HL9LUglH5FauIY1Yvh8EE8Z+9W1+HaJf5dkKU4DN+SQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=E6X1X4FmKuciil/HbOmlYEtHmXJ+BMR5vul48kjJMX1SO9Gsa+IpPyOW0VL8Uuohp
	 bjHFehQqZcdZrded6uKD+1tQwNbYkS3Se7HRkp4DPOvKVC33vO7ohkHQaqlfVF8vgn
	 zPrpJyastWguyBgeaSnjGf4M+WbG2tOyKsuSiVF31dR2KFoMXJ8wu+ocpkc+S8MQR0
	 LZWo5hEjkP+Hc79FA18mr6uREAKIkFzVF5uboD2oknsPeCjSTF/u6Kcj8P+8Ueuivd
	 k40igXxAcpFahcDUAjqX/Pq+NFpUtwDOjq1M6Bx5xsfqCM2JOh7PSHA1juVpFAolos
	 5fq8KHTrrN00A==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Guenter Roeck <linux@roeck-us.net>, Scott Cheloha <cheloha@linux.ibm.com>
Subject: Re: [PATCH v3 4/4] watchdog/pseries-wdt: initial support for
 H_WATCHDOG-based watchdog timers
In-Reply-To: <20220725213026.GA1319556@roeck-us.net>
References: <20220713202335.1217647-1-cheloha@linux.ibm.com>
 <20220713202335.1217647-5-cheloha@linux.ibm.com>
 <28eb0fd6-4c4e-17d5-0f89-73eb68b051fa@roeck-us.net>
 <Yt7AvQjmYzUTYuVy@rascal-austin-ibm-com>
 <20220725213026.GA1319556@roeck-us.net>
Date: Tue, 26 Jul 2022 17:14:03 +1000
Message-ID: <87bktcbb2c.fsf@mpe.ellerman.id.au>
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
Cc: nathanl@linux.ibm.com, wvoigt@us.ibm.com, linux-watchdog@vger.kernel.org, aik@ozlabs.ru, vaishnavi@linux.ibm.com, npiggin@gmail.com, tzungbi@kernel.org, brking@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Guenter Roeck <linux@roeck-us.net> writes:
> On Mon, Jul 25, 2022 at 11:11:41AM -0500, Scott Cheloha wrote:
>> On Wed, Jul 13, 2022 at 01:50:14PM -0700, Guenter Roeck wrote:
>> > On 7/13/22 13:23, Scott Cheloha wrote:
>> > > PAPR v2.12 defines a new hypercall, H_WATCHDOG.  The hypercall permits
>> > > guest control of one or more virtual watchdog timers.  The timers have
>> > > millisecond granularity.  The guest is terminated when a timer
>> > > expires.
>> > > 
>> > > This patch adds a watchdog driver for these timers, "pseries-wdt".
>> > > 
>> > > pseries_wdt_probe() currently assumes the existence of only one
>> > > platform device and always assigns it watchdogNumber 1.  If we ever
>> > > expose more than one timer to userspace we will need to devise a way
>> > > to assign a distinct watchdogNumber to each platform device at device
>> > > registration time.
>> > > 
>> > > Signed-off-by: Scott Cheloha <cheloha@linux.ibm.com>
>> > 
>> > Acked-by: Guenter Roeck <linux@roeck-us.net>
>> 
>> Guenter, Michael,
>> 
>> Which tree is taking this series?

powerpc.

It's been in next-test/next for about a week.

It's in linux-next today.

> The series includes non-watchdog changes, so my expectation was that some
> other tree would take it.

Yep, thanks for the ack.

cheers
