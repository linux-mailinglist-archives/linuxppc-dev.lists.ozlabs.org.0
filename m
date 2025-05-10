Return-Path: <linuxppc-dev+bounces-8486-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A228AAB2167
	for <lists+linuxppc-dev@lfdr.de>; Sat, 10 May 2025 08:02:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZvZys1Z7Zz3bmY;
	Sat, 10 May 2025 16:02:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746856949;
	cv=none; b=Wzy2sisMxAtUAJrHS7x9zbDSvfteg8eusQ/5QVdcaHXeIRbqb/f/+vc9RhJo1AqbuArFuNqGI+9MJskScZvIvbe50FgmFEdOCeK/a30M8SZ38rlEBBX5cjsCdDeW+lQw7ZSwvtPscvKGfv65sXpPrPLaS4SIe9GsF5ypJMC+4vzLIlsVm0/VtDpd9vTYYeIAWfQM6TXUSWSxZnSIfNx8gzOu3j7WXP4MXfU7faUDUrowYg2Ab4s4SMwdm4Cx5DubLpGPBmgOyY2M7JCwGDFf/vFjoXeB/vxdggs4SiRYl6TL0r5qu7DZvBcncyQr35wv6+hmgwmgjU3GqKgMt3/JGg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746856949; c=relaxed/relaxed;
	bh=0nW2Gaf428l7OMSgXg2xSCpd5DssxCVW8xIxn0vsOEc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NiCLhwqE0YFwbS2aJ4LxFBC2hLSeiUL3Ba2YCGwrZLgC7u2v2Rl7ts5SJwMy4O8nQ3Xv2wPlwANGgq+sY/VghvSNMnaI/y48FQve2IC4PahGfb8nF7oTcgurCbcf75G+YaTekZLnhNBlDbDvQSoXk/ysN7Fg5KKz+vFzY/fkAgpU7UZI8GZrpH1DWfLCPGbzJ8AwnwOYhiBhkbc2mpkq54weS8iIcJ4+1CCYASNJARCY6u3zZ/411QMC8lIG0iY+hvdipe7ujCaRA97LioySWlIMJM4ej/c8OhW4BkwBEpciti1BpVv6wfm7omNRpJdD3vHWjh6oXLwgTBSZRBe9KA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=NV/viZqF; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=NV/viZqF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZvZyr3m8Jz3bgn
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 10 May 2025 16:02:28 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D1B9E49D45;
	Sat, 10 May 2025 06:02:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 597E0C4CEE2;
	Sat, 10 May 2025 06:02:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746856945;
	bh=JlSsQetcX37kb+C7A/7Zl2d7NI2PP1OhBJ4yWdB2dq8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NV/viZqFlgmeYeOd+a37GQMGj2Wdbb597buCO2CHtoo5e9okzB+Nv34A5uSb9yT7U
	 T0U8EAQfSlJcGSLoQOiuuV37BPT2TZRRLYdrZg+Bf1h7FYKPqevWoI2XGpD7ZFv4Y1
	 ji3riEIa4f44hkK9/0xN6sFKUXg5wiWnmmFl9xRPL/L7AtODj4a9jdbpPx1Gq9lCsD
	 3NmTdIov3AhWHgJXT9gSdmYwd8K0vCiZ1fGQSnLiBRc1cFDJzHiEKcW4xcfQR011fO
	 rKOMjmaAad2EKQDQN4zhH6H5qvV8zabd6dfFzqfBG7IPuskgqzzU9ah2fg91EEzKSy
	 /t2IFMZsxRXRA==
Date: Fri, 9 May 2025 23:02:19 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
	Thorsten Leemhuis <linux@leemhuis.info>,
	Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
	LKML <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	Danny Tsen <dtsen@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [v2 PATCH] crypto: powerpc/poly1305 - Add poly1305_emit_arch
 wrapper
Message-ID: <20250510060219.GC505731@sol>
References: <aByX_Y64C6lVRR8M@gondor.apana.org.au>
 <f66620e2-77e3-4713-a946-ddb2c8a0bccb@linux.ibm.com>
 <aByiNZNxqyTerdYG@gondor.apana.org.au>
 <1d2c2fdc-5c36-4d4e-8b25-8289b865726d@linux.ibm.com>
 <aB31DI4QBBZuQObQ@gondor.apana.org.au>
 <20250510044450.GA505731@sol>
 <aB7fvi_FBdnmLUON@gondor.apana.org.au>
 <20250510053308.GB505731@sol>
 <aB7o2SiwNLfBTgQk@gondor.apana.org.au>
 <aB7pCuT2wfEe_xby@gondor.apana.org.au>
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
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aB7pCuT2wfEe_xby@gondor.apana.org.au>
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Sat, May 10, 2025 at 01:50:02PM +0800, Herbert Xu wrote:
> On Sat, May 10, 2025 at 01:49:13PM +0800, Herbert Xu wrote:
> >
> > Did I do something wrong?
> 
> OK perhaps it's just that the qemu emulation being slow.

Yes, non-native QEMU usually isn't any good for benchmarking the
architecture-optimized code, due to the instructions it uses having to be
emulated.  Just to give another random example, in (non-native) QEMU the RISC-V
CRC code is much slower than the generic CRC code.  But when run on an actual
RISC-V processor it's much faster.

- Eric

