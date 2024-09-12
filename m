Return-Path: <linuxppc-dev+bounces-1289-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2845D976888
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Sep 2024 14:02:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X4GJk5nntz2yR9;
	Thu, 12 Sep 2024 22:02:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2404:9400:2221:ea00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726142534;
	cv=none; b=kjSTtGJnbYJezkwavA/SvqbzIdTiLVQLwAuH6zFE3vPSTUX/VBAyKCNd0j5QG9deeTxHoPdrCqecByYfJeDAzYi2i7sTRbOKO1+jhLIjSng4iff1xIvGE8iEVf0cNsfGnLoqif7D5NKwVKNTqE9zP5MN71ODTrFypAMRg862/P5IPWzh+Ofar1Mtc1IAZB0bizw9Qe8+o1rRgxfWAgnM36EVKIQH9Jgq58IGby1dtJnN9epTALaeGvsOP5YOnpWQWEW/m3rgkNEKKnpsmy5VaKMMQV8UtFmij2x4RlPjv08qEj3uEZEQH1GvfDXGQcx09hAonpwTVJmN2qU8qGN3Uw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726142534; c=relaxed/relaxed;
	bh=6g+RS/ylqdCqbB1Q2c6Fgvs+SDVVzoZ5Xt7vtRMzVfY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=f2zjYeu/FP97wZOEzq7cLQ2ZzYTiSFuGNhXcbs22gaP7BviApRNnvg6YrxJlJ+g8ExbJLVaKf4kfnMnjMT6nzvYaJID6zJqjeznj5jid+XFnZVTG9e2Tfibe9egz2l3FK2yxssRDsiPZw3CRG8ay0rIjHkFjrgsn8sMLxw38bdKC7mhiM+7Sk3YvIkXdGkpuDEuLozYTMnkBV9HIqPGLMdBS3zklDxdEBEnpIhYsA441CfZ6jbeif43k+vWGdy0xfz1AvfbLDcVtBxyK4gCID0Ie724rE3vNbwLBR3T6wF1LKEIgPIGld9l8j/AKjJ/gKLB2t7BgcGe+7r2DUc3WKw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=W0Smut2v; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=W0Smut2v;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X4GJj6lmTz2yHj
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Sep 2024 22:02:13 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1726142533;
	bh=6g+RS/ylqdCqbB1Q2c6Fgvs+SDVVzoZ5Xt7vtRMzVfY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=W0Smut2vTkBBqPUdcFdkT86zl744E6yyGywYsoAUv0jqhYF7DpI3Mk5KtlpvnIR0t
	 JunMv7VZXkbNGgVuneCJUdb/O2WRYba6Cmi9Xfs7BgigeNAgQ3Lr8anSfxYhENH9Wd
	 Cg5F6mFF7whMzzN74iTupN3Cw/D3t9w9+2NfYmOqmlMvqNB0wOE5CJC97H/4cCXXbN
	 c8iHUHmLCcenCJ2xdUUVW/AKRioUryfPhudk74WzDloUfUqb326NcuXjUeGZEXNkpx
	 TKWG3xdT73wEoj4xMxsTC3QNQGM7SEaY+StyS2egFI73M3ix0H105h/gTyUGY42Zdg
	 49BGDjHZqla3A==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4X4GJj5WrHz4x5M;
	Thu, 12 Sep 2024 22:02:13 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au, linux-kernel@vger.kernel.org, Narayana Murty N <nnmlinux@linux.ibm.com>
Cc: mahesh@linux.ibm.com, oohall@gmail.com, npiggin@gmail.com, christophe.leroy@csgroup.eu, naveen@kernel.org, vaibhav@linux.ibm.com, ganeshgr@linux.ibm.com, sbhat@linux.ibm.com
In-Reply-To: <20240909140220.529333-1-nnmlinux@linux.ibm.com>
References: <20240909140220.529333-1-nnmlinux@linux.ibm.com>
Subject: Re: [PATCH v3] powerpc/pseries/eeh: Fix pseries_eeh_err_inject
Message-Id: <172614240960.1297852.3298377330545085248.b4-ty@ellerman.id.au>
Date: Thu, 12 Sep 2024 22:00:09 +1000
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

On Mon, 09 Sep 2024 09:02:20 -0500, Narayana Murty N wrote:
> VFIO_EEH_PE_INJECT_ERR ioctl is currently failing on pseries
> due to missing implementation of err_inject eeh_ops for pseries.
> This patch implements pseries_eeh_err_inject in eeh_ops/pseries
> eeh_ops. Implements support for injecting MMIO load/store error
> for testing from user space.
> 
> The check on PCI error type (bus type) code is moved to platform
> code, since the eeh_pe_inject_err can be allowed to more error
> types depending on platform requirement. Removal of the check for
> 'type' in eeh_pe_inject_err() doesn't impact PowerNV as
> pnv_eeh_err_inject() already has an equivalent check in place.
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/pseries/eeh: Fix pseries_eeh_err_inject
      https://git.kernel.org/powerpc/c/b0e2b828dfca645a228f8c89d12fbc2baecfb7ea

cheers

