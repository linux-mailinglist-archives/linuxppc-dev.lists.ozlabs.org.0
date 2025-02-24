Return-Path: <linuxppc-dev+bounces-6434-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 83248A42F09
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Feb 2025 22:28:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z1v4F6l0Jz2yLB;
	Tue, 25 Feb 2025 08:28:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:41d0:203:375::ac"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1740421293;
	cv=none; b=d93oYdVBS6qVHuq0yXeCyCONsvx8+4gZfyCg/ylfNL5tJBUtpSn69YzmXNWzZg9TAAXq0sPm8ua7Q7yQdcV30YjsCojigLdU3mXUbfZbvH73gDjEzFj6DzOUd47XspSQiHTAN2xARw8eP6O8RE888FfPUs3G7ID5k3G1Uixj5O6kbVd5HRY8To6rS0IZ6DBIINldyPit3gQW0HgUVTLHMhTpEJv6tjf4Ck5AZQHrEqqcqISKJFt/LwKXXca+9TpDws8prJdS1h5Yw4rBw+md9pRW3IAmtutKl3GskY8XRr8PmXt31oXR4rn6Nq55clgkT6PpWUfA+5xBmFijFJQMJw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1740421293; c=relaxed/relaxed;
	bh=jyfu63sfgIIzRlQ97A+OgOAA0wyg2MUg45/jU8ca2fA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U1NGqsVX2gXh9sGjyuJi5ZEOWPFpOvV47ZZ4DjEMlls9Ar3s2uCieJzB14GfLjvCaYmKYDjkWpUBXUu0+qngCSsdWqHxbwUo8cb3YIb7TXRXSH3F90mqtRWdf0GmARaydmCSHHNWg5BocPwce4f6ytMoRXtnKUiHtKhnxvJr36VcGlxmPAyMigfmh+k7nIA02YWYKb2wbAeq6vLw8D+olgUImsMP3A0B0aJ/GqcIlaYqJyw/CJPAUD8WLIEdpaKxXUaav5a1pstTvHw+nH+EQPPHEq5wiSYcO88024aj7TLJwzBSm7zzCn3gbP2hX8xD27wj7aYaVY1vDjzhv6L82g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=rosenzweig.io; dkim=pass (2048-bit key; unprotected) header.d=rosenzweig.io header.i=@rosenzweig.io header.a=rsa-sha256 header.s=key1 header.b=aduryPCe; dkim-atps=neutral; spf=pass (client-ip=2001:41d0:203:375::ac; helo=out-172.mta1.migadu.com; envelope-from=alyssa@rosenzweig.io; receiver=lists.ozlabs.org) smtp.mailfrom=rosenzweig.io
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=rosenzweig.io
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=rosenzweig.io header.i=@rosenzweig.io header.a=rsa-sha256 header.s=key1 header.b=aduryPCe;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=rosenzweig.io (client-ip=2001:41d0:203:375::ac; helo=out-172.mta1.migadu.com; envelope-from=alyssa@rosenzweig.io; receiver=lists.ozlabs.org)
X-Greylist: delayed 412 seconds by postgrey-1.37 at boromir; Tue, 25 Feb 2025 05:21:28 AEDT
Received: from out-172.mta1.migadu.com (out-172.mta1.migadu.com [IPv6:2001:41d0:203:375::ac])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z1pw81GDKz2ygR
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Feb 2025 05:21:27 +1100 (AEDT)
Date: Mon, 24 Feb 2025 13:14:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosenzweig.io;
	s=key1; t=1740420849;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jyfu63sfgIIzRlQ97A+OgOAA0wyg2MUg45/jU8ca2fA=;
	b=aduryPCeM4tYkhcg7JxYGA3aRnwlpUI1Cqzuy3sVeDAA0L48aQpcZ1bZwNGSlWhZ3w1dNr
	M22gflzi1zaZGF+1ATAGhaYUrHhRiDO5bcWElFAMfvY6sYED66CiygBcpjtoQJCCierjoo
	WHw3oT1zrv2m181ST4yvz2KBT7q4tAfHUCFo8tFyafzjfV1GBF9GF0V3XFFRifqDZQGF2L
	MMt+13+CjKteS6y3hyeQRFtMDCjcYm/sjxyw1j59m5aZnMa9YQ+tbPkGsN/r46yRo1FXGg
	wRPsPIBQzcKuVIX+3mn0W5aZFiFJYBSS6hqAvwg9t0xibzpOULojUQ9SDljZnQ==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Alyssa Rosenzweig <alyssa@rosenzweig.io>
To: sven@svenpeter.dev
Cc: Janne Grunau <j@jannau.net>, Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>, linuxppc-dev@lists.ozlabs.org,
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	Hector Martin <marcan@marcan.st>
Subject: Re: [PATCH 0/4] Apple/PASemi i2c error recovery fixes
Message-ID: <Z7y26r88nrK2QKVN@blossom>
References: <20250222-pasemi-fixes-v1-0-d7ea33d50c5e@svenpeter.dev>
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
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250222-pasemi-fixes-v1-0-d7ea33d50c5e@svenpeter.dev>
X-Migadu-Flow: FLOW_OUT
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Reviewed-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>

Le Sat , Feb 22, 2025 at 01:38:32PM +0000, Sven Peter via B4 Relay a écrit :
> Hi,
> 
> This series adds a few fixes/improvements to the error recovery for
> Apple/PASemi i2c controllers.
> The patches have been in our downstream tree and were originally used
> to debug a rare glitch caused by clock strechting but are useful in
> general. We haven't seen the controller misbehave since adding these.
> 
> Best,
> 
> Sven
> 
> Signed-off-by: Sven Peter <sven@svenpeter.dev>
> ---
> Hector Martin (3):
>       i2c: pasemi: Improve error recovery
>       i2c: pasemi: Enable the unjam machine
>       i2c: pasemi: Log bus reset causes
> 
> Sven Peter (1):
>       i2c: pasemi: Add registers bits and switch to BIT()
> 
>  drivers/i2c/busses/i2c-pasemi-core.c | 121 ++++++++++++++++++++++++++---------
>  1 file changed, 92 insertions(+), 29 deletions(-)
> ---
> base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
> change-id: 20250220-pasemi-fixes-916cb77404ba
> 
> Best regards,
> -- 
> Sven Peter <sven@svenpeter.dev>
> 
> 

