Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F156C8AC3CF
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Apr 2024 07:39:34 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Jl4rwGSv;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VNDb84wf0z3cfx
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Apr 2024 15:39:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Jl4rwGSv;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VNDZS4Qq5z3c05
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Apr 2024 15:38:56 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1713764336;
	bh=G/aHh5doH7tvZjPRnwTkrCGV4ORMj01WDY46RGpRjdE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Jl4rwGSvyYZEL8vfNo6LWVlEY2KvjdbmHOClU3kUBuViu8mtWo9RUUDt7mloAKoCj
	 5lwpD1aEytFxTHdZhJ4rp0bNm+W1n1fHVvaCcpwH1z/A7dWahoxuvTWuKPpAL3Drwx
	 7bcuYrQkBedulrsAseLBI5/LHE1AgaCkOjWoj+SW2LsTWStm/+gN/EogiAIGIBLpva
	 ov0sgF8nbfDr3MF46MSUtq2PATHC86BTpHRB4e3FRgSf4yGikPYVbozIa41KSgSw/5
	 +L8he12z7SSKpxn5avmyQzrlYQ/b3W6n2HbyKLlfOz/zgIwwaLXsaaBAixc70UJMeD
	 4NnpMqPSy0aaQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VNDZS1QCmz4wyj;
	Mon, 22 Apr 2024 15:38:55 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Lukas Wunner <lukas@wunner.de>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/6] driver core: Add device_show_string() helper for
 sysfs attributes
In-Reply-To: <2e3eaaf2600bb55c0415c23ba301e809403a7aa2.1713608122.git.lukas@wunner.de>
References: <cover.1713608122.git.lukas@wunner.de>
 <2e3eaaf2600bb55c0415c23ba301e809403a7aa2.1713608122.git.lukas@wunner.de>
Date: Mon, 22 Apr 2024 15:38:54 +1000
Message-ID: <87zftmj6s1.fsf@mail.lhotse>
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Lukas Wunner <lukas@wunner.de> writes:
> For drivers wishing to expose an unsigned long, int or bool at a static
> memory location in sysfs, the driver core provides ready-made helpers
> such as device_show_ulong() to be used as ->show() callback.
>
> Some drivers need to expose a string and so far they all provide their
> own ->show() implementation.  arch/powerpc/perf/hv-24x7.c went so far
> as to create a device_show_string() helper but kept it private.
>
> Make it public for reuse by other drivers.  The pattern seems to be
> sufficiently frequent to merit a public helper.
>
> Add a DEVICE_STRING_ATTR_RO() macro in line with the existing
> DEVICE_ULONG_ATTR() and similar macros to ease declaration of string
> attributes.
>
> Signed-off-by: Lukas Wunner <lukas@wunner.de>
> ---
>  arch/powerpc/perf/hv-24x7.c | 10 ----------
>  drivers/base/core.c         |  9 +++++++++
>  include/linux/device.h      | 15 +++++++++++++++
>  3 files changed, 24 insertions(+), 10 deletions(-)

Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)

cheers
