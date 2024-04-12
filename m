Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C16728A2535
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Apr 2024 06:37:08 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=LZ4SAqsk;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VG3gk4LSJz3vZy
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Apr 2024 14:37:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=LZ4SAqsk;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VG3g11yJpz3d42
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Apr 2024 14:36:29 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1712896586;
	bh=knRQtJ7kQMDSJLodYLmrJSnjcAkp2nMWpieNQrKmKPw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=LZ4SAqskdbrQ2uJm/VBr9YtTV03OFQdqdm4oNMjenFZWh7YP7YzFh+NwhToU4MzE0
	 B0xwSsXc4VHePvvMjCNX0PDXo+47FdqTiHFO8D7LxZVTK9nyxErUUcAAfaIW1Kz+Ri
	 ynUHF6c4doYK3pnfRFPj6hk/VST31HZB4PXyh7DvZuza0thH9TC8xNfsiwZ13+bMS9
	 PI9wdWgGVGPkNysHzTazXT8GkcI0D2GGsi2aLqYN/zttw0osT+YbCLA2lMT+6fmKP4
	 KgkrK6/KSI1G83OrtdoieohcnRZ9kAe1VFudTvNLhAo2U5VqLYYEznemR+JCGneOII
	 Rx0bFCKrewuag==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VG3fy0nT8z4wnr;
	Fri, 12 Apr 2024 14:36:26 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Greg KH <greg@kroah.com>
Subject: Re: linux-next: duplicate patch in the driver-core.current tree
In-Reply-To: <20240412084310.035f018d@canb.auug.org.au>
References: <20240412084310.035f018d@canb.auug.org.au>
Date: Fri, 12 Apr 2024 14:36:25 +1000
Message-ID: <87mspzci46.fsf@mail.lhotse>
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
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, PowerPC <linuxppc-dev@lists.ozlabs.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Stephen Rothwell <sfr@canb.auug.org.au> writes:
> Hi all,
>
> The following commit is also in the powerpc-fixes tree as a different
> commit (but the same patch):
>
>   156539fd6501 ("Documentation: embargoed-hardware-issues.rst: Add myself for Power")
>
> This is commit
>
>   36627111b568 ("Documentation: embargoed-hardware-issues.rst: Add myself for Power")
>
> in the powerpc-fixes tree.

I can drop my version easily enough.

cheers
