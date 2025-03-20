Return-Path: <linuxppc-dev+bounces-7227-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 22199A69D34
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Mar 2025 01:23:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZJ5sL44TGz2ys0;
	Thu, 20 Mar 2025 11:23:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742430214;
	cv=none; b=mI4MfPffOE+U6XE2PfedbZ8wYWhJZV4htETUiTGPKlYpALpdaEzt3rAppL9kQ2OLukaFMP5SdCJ+cOgBSi7hpYaRsWEB/VQliDLClrBgx702jANTW4Xjj69uScNDzZ0sAPcCNQeDf+GFBbk2YMVVAfUuHKd2mvdEKz90NTAnYgM2xXMAEGKUYole0fWbWltJ3p/YYsc87wVHCvXss0OqJCKgeRo8w4SgHNt3n/SCD/VHkYLiUjUWKFdP/H1LeNs7l/iQ5rtvIzUB6gZ0Cbhm/kMKVZwLjdtHzzdY/xCRp+LqHuK0Atf4taIk6c0H5wctBJ/RIRnoQwk7HejXV98MOA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742430214; c=relaxed/relaxed;
	bh=dAmZLpDiMQYCKogBSFFB2PhtBHc71B8HKr7YGw2WdWI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MXfQNZ0Ik0WTVBX74XdHrzb1+01HVmB3VR7B1390Movb89gipFBffnYD9Hjpn2Zpeysf1mEzcgSn9a7GKbDiLfZpvuq49RFmrqqMKNJDb6xFFCyGsLTGrrM0IMrfiqKCgAdLwkeybvjC41dDNhaCsEjWeJnv3lb6xGPlfxDjpUWRe+GtrFtdjFKLMxWDuzD/+SImFsx5IKa96gIuH7FH1X9vz5tGnfiTOhyN/mcXJuOUHfIB67p4DdDFztYwUUuobRiLSIofkb3D8L5kwuDzFxQClN+RVckud8KLMKczs3y0zYB7+flO1cLAiaYyXuZ5gs1Z9wf0ewakdHru6ZQKxQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=OwvDFVYe; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=andi.shyti@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=OwvDFVYe;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=andi.shyti@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZJ5sK5PNxz2yrp
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Mar 2025 11:23:33 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1B79A6166C;
	Thu, 20 Mar 2025 00:23:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A48C9C4CEE4;
	Thu, 20 Mar 2025 00:23:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742430208;
	bh=PLlGPu13lwUvjhab9LGjWlYnOdDLh4IYoJeW/dS/6H8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OwvDFVYeRWNt4Go1WWNiDAksolgD/KKL9rClnuDhtRjnwagIXpaa34ntS/3ezBdt0
	 G90wIpvGRNU31jdHgMw6uqDScCnm3ptixfAnRMVRbVXd3wBVlxwRiMISO8h2nnLNMw
	 H+WT0q5X7YaN+1oyrlrBFCFuUVZc0UpiE/kzm1m58ywZ0xONuF/3tEkCYKqOkS8QSw
	 2xEStXdqjyZ0VqODkhM93DgOD0ueevOGWrU2ewNrUkJahusGrXO17Y4sqEYBch2P4I
	 7rAy/W0uMURLicaK2gwD6Wqn54om6hu1507zYiKACDS+wXEeP7DtEXcIhQeomsCxOh
	 FJvtfP3tQ+Ogg==
Date: Thu, 20 Mar 2025 01:23:25 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: sven@svenpeter.dev
Cc: Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Naveen N Rao <naveen@kernel.org>, linuxppc-dev@lists.ozlabs.org, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Hector Martin <marcan@marcan.st>
Subject: Re: [PATCH 1/4] i2c: pasemi: Add registers bits and switch to BIT()
Message-ID: <rjvak3c2k5a64jw4ef23i5uptg4zzl3u7lqszqbg56l4hqms77@hrkn5eydxwiy>
References: <20250222-pasemi-fixes-v1-0-d7ea33d50c5e@svenpeter.dev>
 <20250222-pasemi-fixes-v1-1-d7ea33d50c5e@svenpeter.dev>
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
In-Reply-To: <20250222-pasemi-fixes-v1-1-d7ea33d50c5e@svenpeter.dev>
X-Spam-Status: No, score=-1.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Sven,

On Sat, Feb 22, 2025 at 01:38:33PM +0000, Sven Peter via B4 Relay wrote:
> From: Sven Peter <sven@svenpeter.dev>
> 
> Add the missing register bits to the defines and also switch
> those to use the BIT macro which is much more readable than
> using hardcoded masks
> 
> Co-developed-by: Hector Martin <marcan@marcan.st>
> Signed-off-by: Hector Martin <marcan@marcan.st>
> Signed-off-by: Sven Peter <sven@svenpeter.dev>

Just this patch merged to i2c/i2c-host.

Patch 3 and 4 look good, just some comments on patch 2.

Thanks,
Andi

