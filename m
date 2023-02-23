Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 95FAB6A0443
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Feb 2023 09:57:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PMn3H3PNmz3cNN
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Feb 2023 19:57:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=GicTjADw;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PMn2M3zbWz3c63
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Feb 2023 19:56:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=GicTjADw;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4PMn2G21kNz4x7j;
	Thu, 23 Feb 2023 19:56:38 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1677142599;
	bh=dVU6A67pHBa4R69qFtAyoB1kpoC8kE9avrpf4rmf5Ew=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=GicTjADwu19QiNQtSftsopmG71q+HnjregXjDHqBaRiWOwY7IpHAhLuNV/Sc+fUen
	 FY2mL+7uT7zQZ6qfLprABzp2AIHQ/q81yCGh5wUR29HkTfSDhMbNfWzQhPxW6j15E5
	 hhu8iqkEZ3OhTT6Z7QMGiScZd7IQaTcoWGWiJx5RZZ1Kv12hkm4gDxxl2q6ioJhgQ5
	 PAKzImdO+qCNyyBYd8Ca1YZkqOboJPgbSsjmq3I6HOMTQElft40nNc0tJzI4lR1LUn
	 fJujwmY90SX9GjWwpSATwt4uP+yu5tuu0rZEYofAh9C4UG3+Nv40jfpTuLiCxBlUqm
	 +cTQcN+Np19Cw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] macintosh: via-pmu-led: *********************************
In-Reply-To: <20230223014151.19270-1-rdunlap@infradead.org>
References: <20230223014151.19270-1-rdunlap@infradead.org>
Date: Thu, 23 Feb 2023 19:56:36 +1100
Message-ID: <877cw8bvzv.fsf@mpe.ellerman.id.au>
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
Cc: Randy Dunlap <rdunlap@infradead.org>, Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org, Elimar Riesebieter <riesebie@lxtec.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Randy Dunlap <rdunlap@infradead.org> writes:
> LEDS_TRIGGER_DISK depends on ATA, so selecting LEDS_TRIGGER_DISK
> when ATA is not set/enabled causes a Kconfig warning:
>
> WARNING: unmet direct dependencies detected for LEDS_TRIGGER_DISK
>   Depends on [n]: NEW_LEDS [=y] && LEDS_TRIGGERS [=y] && ATA [=n]
>   Selected by [y]:
>   - ADB_PMU_LED_DISK [=y] && MACINTOSH_DRIVERS [=y] && ADB_PMU_LED [=y] && LEDS_CLASS [=y]
>
> Fix this by making ADB_PMU_LED_DISK depend on ATA.

Should it just depend on LEDS_TRIGGER_DISK ?

cheers

> Seen on both PPC32 and PPC64.
>
> Fixes: 0e865a80c135 ("macintosh: Remove dependency on IDE_GD_ATA if ADB_PMU_LED_DISK is selected")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> Cc: Paul Mackerras <paulus@samba.org>
> Cc: Elimar Riesebieter <riesebie@lxtec.de>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: linuxppc-dev@lists.ozlabs.org
> ---
>  drivers/macintosh/Kconfig |    1 +
>  1 file changed, 1 insertion(+)
>
> diff -- a/drivers/macintosh/Kconfig b/drivers/macintosh/Kconfig
> --- a/drivers/macintosh/Kconfig
> +++ b/drivers/macintosh/Kconfig
> @@ -86,6 +86,7 @@ config ADB_PMU_LED
>  
>  config ADB_PMU_LED_DISK
>  	bool "Use front LED as DISK LED by default"
> +	depends on ATA
>  	depends on ADB_PMU_LED
>  	depends on LEDS_CLASS
>  	select LEDS_TRIGGERS
