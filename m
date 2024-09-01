Return-Path: <linuxppc-dev+bounces-851-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 81DFA967BAE
	for <lists+linuxppc-dev@lfdr.de>; Sun,  1 Sep 2024 20:11:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wxg1b0m1Zz2xs0;
	Mon,  2 Sep 2024 04:11:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725214275;
	cv=none; b=M5neSHw24c8nOsEdOjdIQCiKeqYFUhEy7Zdt5317UrIojLDSun3mnFWzoqi0S2GDhryD98WtADtYCd0txOpmOkdmRFXuugkxJ+jUJsrfyEC1m7UozkIDr4Vop6USIznUG74roA1p7ltasLY+LAoW7vTroGAQYmeLA6Eo32wTmrLgsVgTCFkCP3i5pmtmSP+c0SJ6M3R3Xw8QX9MTbzqy+GK/B8VpWZXkIYFpeYgwDkcp1ghVhcuAidA+3gXEt6wBWYHcM3USu3Jm8iDdWz+TtvSR+f6MVlAwvl4OK0/sP4oVIIhf+pYLwDXpnyI+xPE85M2Y9ZqnA8HX3z4tWzcBpA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725214275; c=relaxed/relaxed;
	bh=mospxNQzEQmi1xlnzeu/+oljFVFe5zggEA3f9yO5JcU=;
	h=Received:Received:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=V/ydYSkgcBqaaoiXTfkxcNbhMfJ0iZlyNxOW2/NMoJn+QHYA54fmVK8OXI8bME1ZrjH5Rdv1OU2NEWPt0gNBj6zmfinboVWb5UT6jhvdzkrOsQl9fbNxjLR8W2q2lv0EuRx69tXdnv5jJoWOOJKHjm0h/QdAwuZRHUo7nmxsg0ZOAVlyBXshg3AwWQik3Rh+6ZfRivaA1eFThr7HqypwYx5cBKq6TKyC9BOqkClhIqcpOx8iMd4CcdAQuO6RfFWuAXEDFFWiGCXrxs5Yhke2As1UUpm1+Ccc4frfEN8lwxGe/KFTE7e0d36+bjozJObutLpXx1zKSgV52aL2BAUKcw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=zx2c4.com; dkim=pass (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=eLtfise2; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=srs0=mkha=p7=zx2c4.com=jason@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=zx2c4.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=eLtfise2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=srs0=mkha=p7=zx2c4.com=jason@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wxg1Z69x7z2xrv
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  2 Sep 2024 04:11:14 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 65CD05C56C2;
	Sun,  1 Sep 2024 18:11:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98BFFC4CEC3;
	Sun,  1 Sep 2024 18:11:11 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="eLtfise2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1725214269;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mospxNQzEQmi1xlnzeu/+oljFVFe5zggEA3f9yO5JcU=;
	b=eLtfise2dOqooXx5gFA6w1/NpU4xUGopgeSBn9jGRac1l8u8/q+3lHv3SVPcJhs3wIwY1b
	FF0GrRxD8NbNk9xNTQjx50ZcqAwXBTImtmW1im/vz5cdldvXrXD61E1gAjxnB3TTbJNKF6
	kb3N8lUKqbQzsVpXcL85xx7XrcEdVIs=
Received: 
	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 9082c1bf (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Sun, 1 Sep 2024 18:11:09 +0000 (UTC)
Date: Sun, 1 Sep 2024 20:11:07 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Shuah Khan <shuah@kernel.org>, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH] selftests: vDSO: Build vDSO tests with O2 optimisation
Message-ID: <ZtSuO2Bzbo5wL9se@zx2c4.com>
References: <46efa1f62e1604c98d10a1b6856a2b2aec0cfe9c.1725211324.git.christophe.leroy@csgroup.eu>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <46efa1f62e1604c98d10a1b6856a2b2aec0cfe9c.1725211324.git.christophe.leroy@csgroup.eu>

On Sun, Sep 01, 2024 at 07:24:03PM +0200, Christophe Leroy wrote:
> Without -O2, the generated code for testing chacha function is awful.
> GCC even implements rol32() as a function instead of just using the
> rotlwi instruction, that function is 20 instructions long.
> 
> 	~# time ./vdso_test_chacha
> 	TAP version 13
> 	1..1
> 	ok 1 chacha: PASS
> 	real    0m 37.16s
> 	user    0m 36.89s
> 	sys     0m 0.26s
> 
> Several other selftests directory add -O2, and the kernel is also
> always built with optimisation active. Do the same for vDSO selftests.
> 
> With this patch the time is reduced by approx 15%.
> 
> 	~# time ./vdso_test_chacha
> 	TAP version 13
> 	1..1
> 	ok 1 chacha: PASS
> 	real    0m 32.09s
> 	user    0m 31.86s
> 	sys     0m 0.22s
> 

Seems reasonable. I'll queue it up.

Thanks.

Jason

