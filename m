Return-Path: <linuxppc-dev+bounces-7220-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 52EBAA69677
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Mar 2025 18:30:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZHwhZ0Kqnz2yqT;
	Thu, 20 Mar 2025 04:30:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742405422;
	cv=none; b=nbs5fhgrq1eRdHI5o2aGRtGm2z2LpTzJhK4dW3TOQdJynmNgUArqqnTQRLwzZBPH9ykU/cZUzv0PLMQ/NT/YrLek5o0dAUcEEPvTP09FqVszn7aTOXHmnnO++6r5HhXpSvNqZ8NbdjkMIX2xkarN1rcSgKHMMAae4pR3sRJnmwrWvdcKItMiR57UPeEhtIAFwnCeITrjen7abhe4zj5V3isEGihHZWQ0zKVSReH4QxURAwsaXy1OlWrm6k5UbVlaJw672D3zEssnoHXKNLW6Kduzwh4+CFmLqL8MiydnbGFSis1rWcsGqvqaITqCn2jhB1e6dATmNLPsRRVu/47zWw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742405422; c=relaxed/relaxed;
	bh=AsfoyWYQwkuNnFqxzeEPQqfO/94I4+8DnMEa+Vta9E4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WwxxzZzU8YArURNJbfzDfAaqDPy14JoZZElyYbsO2ZWK9aLKcU595Jq58x449jsvePby0cyVEDDaUYt3QEKOy6VySrnLFeLR/IS7n+ntwecJ5NqCP5SHIb1nyb4tpAEVPZCmlZGxSdpfZuEPaLu+Vfnd+V+OqTRF95RzpZjII34GeTbp6HUcr1sNeOPuFrBmRIaFrFfn/9x7gvRlid5FAqvMYw22p8LbNlKqORlq/GiGSufyEDLdonbeTgYnhVYcahHHI7CyS/l9dYvNDHnvs4F/UxIi52H/Sdgy6Peq2DeCA6sazNOtCr/uB2dy+jI0M16DkxFrbYClOhvWBImcDQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Z9biRIG4; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=nathan@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Z9biRIG4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=nathan@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZHwhY2zYFz2xlQ
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Mar 2025 04:30:21 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id AC9715C499F;
	Wed, 19 Mar 2025 17:28:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4230AC4CEEC;
	Wed, 19 Mar 2025 17:30:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742405418;
	bh=gpKrn8HW8AZZySNjAdZoJyOHfdkLfMonlBIG0pb7rJs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Z9biRIG4v4RALHETyvhDmvsnPST2Po+0NgCvGoxxlYmK5oqGJFq3Rp9gX67v29Wa1
	 bH7PO28pgmcU0v/QDX91o2kqmi4Ab/alUwXSnKEhUVmpijp2QXT1kbAeE/BeUTB2w4
	 DztQSBkjHjFDEOE1vXLqLSxoM+x0cOQXFjAy/9AkqphJzxmv9vEJiHhiDLT1IF9R0a
	 fvSkmrweH3Uqz5StTuzwnCRMzNnOP5xPmKGZG3FJCiX6/cCFVHJE4wc1QmxnLfYKX6
	 xZfGhbjQVQFVC+38sI2KRQZeyUXfOYxq9jp9xJit0e9jNp+XS4+tmVbVnRQlE5ZirP
	 KE1eon15QED6w==
Date: Wed, 19 Mar 2025 10:30:10 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Arnd Bergmann <arnd@kernel.org>,
	Linux-Arch <linux-arch@vger.kernel.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Matt Turner <mattst88@gmail.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Greg Ungerer <gerg@linux-m68k.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	"James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>,
	Helge Deller <deller@gmx.de>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Julian Vetter <julian@outer-limits.org>,
	Bjorn Helgaas <bhelgaas@google.com>, linux-alpha@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org
Subject: Re: [PATCH 5/6] mips: drop GENERIC_IOMAP wrapper
Message-ID: <20250319173010.GA84652@ax162>
References: <20250315105907.1275012-1-arnd@kernel.org>
 <20250315105907.1275012-6-arnd@kernel.org>
 <20250318203906.GA4089579@ax162>
 <5b2779f8-573d-401e-817e-979e02f811d3@app.fastmail.com>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5b2779f8-573d-401e-817e-979e02f811d3@app.fastmail.com>
X-Spam-Status: No, score=-1.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Mar 18, 2025 at 10:13:35PM +0100, Arnd Bergmann wrote:
> Thanks for the report, I missed that the generic ioport_map() function
> is missing the PCI_IOBASE macro, we should probably remove that from
> the asm-generic/io.h header and require architectures to define it
> themselves, since the NULL fallback is pretty much always wrong.
> 
> There is also a type mismatch between the MIPS
> PCI_IOBASE/mips_io_port_base and the one that asm-generic/io.h
> expects, so I had to add a couple of extra typecasts, which
> makes it rather ugly, but the change below seems to work.

Thanks, that does make the -Wnull-pointer-arithmetic warnings disappear.
That build still fails in next-20250319 (which includes that change) at
the end with:

  $ make -skj"$(nproc)" ARCH=mips CROSS_COMPILE=mips-linux- mrproper malta_defconfig all
  ERROR: modpost: "pci_iounmap" [drivers/net/wireless/intel/ipw2x00/ipw2100.ko] undefined!

which appears related to this original change.

Cheers,
Nathan

