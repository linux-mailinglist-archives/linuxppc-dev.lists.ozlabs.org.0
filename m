Return-Path: <linuxppc-dev+bounces-3369-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DD8B9D0392
	for <lists+linuxppc-dev@lfdr.de>; Sun, 17 Nov 2024 13:26:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xrqj24qSsz3bZ3;
	Sun, 17 Nov 2024 23:25:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2404:9400:2221:ea00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731846326;
	cv=none; b=IAUBJc60Xlo7kFR4Rr7MpvJQKphjUAhOHrrn2gUSCn9PoeegEW7qd4+HreavVsDuzRKI7eS5OwsBVITpF7uVzDsIeKliFovUanU55JZX0m4AQLZG2S/eob117vDKLbGFI0ke7Xde5bcL03YfWQRJqnR2lU9PxPbl+WH1STByUQAsMQjxrjXG1kr0q21O8RnEcOCbsApbrDkdWVyoLQ51ITe47p+8MnjqkR4/QZ/Vhgfn8yNZ03bai3Mfq1gYGhz5MHQhtg6dkMi8pJ28Ag29Bc9VCKxaURFSBrenKPaXPVDLcMiTdr/FUmOCrl8DT/xEXs1DUojXJxg1OHKdbXDrgg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731846326; c=relaxed/relaxed;
	bh=3Q8GF405lgPrVBMNIcWwlkYcIcKlMKmYZQRNZamOSn8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Oa8LnYTR4roeICP883UHddQZfgGEb3amrHnV4Zgp0gBXH24Jt45job/t+98SJOC3g00CnztFyjkKB3iD0kmGynp/HGADG6fUHRhzKkv4zNK0/CDzcv10gAuVvKOmTG0ouzbsaXwaWSy4MgONjkl84Owd18lY3NbbLeWaJLTGx3y6aRDpbanlskRlkN1rLcmC6Zvw5NtGmp2UrEaexKI4gYdNUrIL6GMV11MNAFkc7KPwQz4yIWY3rudqTMw5Frqi8aKuEcrbZbC/jiWq/3VGdtslatZdeKHlSEvinxzg7FTmdRoZGIWYFUH64/OSDSFT8EbgOHKkroVbw/3L/cFBzQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=de3N7xye; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=de3N7xye;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xrqj20LKdz3bfB
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 17 Nov 2024 23:25:26 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1731846323;
	bh=3Q8GF405lgPrVBMNIcWwlkYcIcKlMKmYZQRNZamOSn8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=de3N7xyekklCVojBYAsLV7SwZQaYEA5qDTjTXw8a8r3iLi8xPMcUsFxoI3AWHUK/Q
	 4ziG7DmSyzGQafjZ4A+8hy8pI9Tv9+b5icFGZLsQ8jcHBEF8U5n4ljXk0HOsAVI9Zv
	 qSCn5qk7a9Me7PFPL55Q3+ociPNKooHr8TI4j5X6JYWyWXkILKv/tjKuaqmtUnoaZN
	 k95mU8mj3KruLMC1Z2bvT5AwPt29bo/SsFYXm0J46zYslL4P0QnSPy3EfWpNqHdKce
	 Jjt5YrL49S86/zMeewnM5OzHIX7rd6zH2jqnEGWrNdaFqy6NJ2qhQbk1QG9MAYOnb9
	 P8E6m6UO+fTsw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Xrqhy405Kz4xf3;
	Sun, 17 Nov 2024 23:25:22 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Scott Wood <oss@buserror.net>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, Paul Gortmaker <paul.gortmaker@windriver.com>, linuxppc-dev@lists.ozlabs.org, Lukas Bulwahn <lbulwahn@redhat.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Lukas Bulwahn <lukas.bulwahn@redhat.com>
In-Reply-To: <20240927095203.392365-1-lukas.bulwahn@redhat.com>
References: <20240927095203.392365-1-lukas.bulwahn@redhat.com>
Subject: Re: [PATCH] powerpc: remove dead config options for MPC85xx platform support
Message-Id: <173184539765.890800.8133214752125480117.b4-ty@ellerman.id.au>
Date: Sun, 17 Nov 2024 23:09:57 +1100
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Fri, 27 Sep 2024 11:52:03 +0200, Lukas Bulwahn wrote:
> Commit 384e338a9187 ("powerpc: drop MPC8540_ADS and MPC8560_ADS platform
> support") and commit b751ed04bc5e ("powerpc: drop MPC85xx_CDS platform
> support") removes the platform support for MPC8540_ADS, MPC8560_ADS and
> MPC85xx_CDS in the source tree, but misses to remove the config options in
> the Kconfig file. Hence, these three config options are without any effect
> since then.
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc: remove dead config options for MPC85xx platform support
      https://git.kernel.org/powerpc/c/f20b0a03674cef555a5f48b65f81b82868b17cdd

cheers

