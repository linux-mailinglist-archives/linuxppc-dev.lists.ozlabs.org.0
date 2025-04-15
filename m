Return-Path: <linuxppc-dev+bounces-7674-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B5B10A8AA1D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Apr 2025 23:28:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zccj04Zs1z3bmC;
	Wed, 16 Apr 2025 07:28:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:41d0:1004:224b::bc"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744737470;
	cv=none; b=UijvmJQpGX+DXIA7AfbO2OV9FLI8ZHTR34PhcJu+oyyXc7Op/HFj3YA3S23UYfL2q0JKW9X+bsnepZtxWQLfoZIHJ65QT89RrY4ail+TLKtMfmptez7oNWEbgeOTxWar1t1Fn67nySb84HT0KKlrCE7tC/NED3xlGIrsFPvfVoNGcnr3WE1fK1Q+ReWDCRFd501XlufOg76cWcmzKEkBpM0u5CJtPsYiLT1XQMNybwePtKpI4jRiV3ypH0WYuq/mu6Amw7ickCOU8Pbb1NURYZ5khf6B0Oe0btNhMVJ3m9G6Q0R9oypzhXZMkEysJD4Tk7RoFuBZcKafWSVPC579Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744737470; c=relaxed/relaxed;
	bh=l+ItDRvc2CgbELkYEQjQqulbuQxz4MyRUQS30G+nsPs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PPNpGG4xHr+MaRLX+K+KcxZCf6tLzPQICo+amqvWR0SlUocEBi4+R+THRAoeHaMAikoj4BHDPlrU1k8YRQzYOMXdS+Iun2XokSlNqOs/sOQAjwZLA2W9+CbO6g6XypACiihNYABkgwW4kBSaQrIhM2QtqKZMeIJ+I1rYmJ1BN1OixzJzCo9Lo/qZai/npUt3ZzL1x26j39V4EcxCJh3gn4TBNsS/IQerNejRbJGeJamYYrkv4rGIkmuTayr+IWDtWcZr5L8I6BzbLxIMBhK0/+6ek0a9eLgXiCQnhhGTYgeKPTp2nhSO9ZXTrKgjMSGFfhh3uogdrfqZrlwG1tXF8g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=rosenzweig.io; dkim=pass (2048-bit key; unprotected) header.d=rosenzweig.io header.i=@rosenzweig.io header.a=rsa-sha256 header.s=key1 header.b=c6y3umwu; dkim-atps=neutral; spf=pass (client-ip=2001:41d0:1004:224b::bc; helo=out-188.mta0.migadu.com; envelope-from=alyssa@rosenzweig.io; receiver=lists.ozlabs.org) smtp.mailfrom=rosenzweig.io
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=rosenzweig.io
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=rosenzweig.io header.i=@rosenzweig.io header.a=rsa-sha256 header.s=key1 header.b=c6y3umwu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=rosenzweig.io (client-ip=2001:41d0:1004:224b::bc; helo=out-188.mta0.migadu.com; envelope-from=alyssa@rosenzweig.io; receiver=lists.ozlabs.org)
Received: from out-188.mta0.migadu.com (out-188.mta0.migadu.com [IPv6:2001:41d0:1004:224b::bc])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZcW7d3d6rz3bjg
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Apr 2025 03:17:49 +1000 (AEST)
Date: Tue, 15 Apr 2025 13:10:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosenzweig.io;
	s=key1; t=1744737045;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=l+ItDRvc2CgbELkYEQjQqulbuQxz4MyRUQS30G+nsPs=;
	b=c6y3umwuPNz+nEZojVdyszn3dB7XfYQ6DeOGO0pEcfZYHJZFEQC6gO5ZQENAnnJouRPvUL
	rUhnMlvqolEh+vEcC1cc4b7bgSH+GUDph2yh1qNZiao/yEgJp2XvIMepfstsT6bFB3+QhS
	MTA46PVnNK36GsCw0NqCSieU1jNsHRBqqc5MzIT0iNRcm+g82GQ5gFMqSCdeHlvU+gxypA
	+6oHbfKbxam8Qcqns2H0PlmeebG6aZQgmz8onhwLASMlbmXaTFSwxes+N5HMdDIjybb9od
	lPFK9bY9pBc4bVRjV+60lkAcZp0K9HG0rVT3Jd3emgWqSPifN2Dw0OL4SM8mBQ==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Alyssa Rosenzweig <alyssa@rosenzweig.io>
To: sven@svenpeter.dev
Cc: Janne Grunau <j@jannau.net>, Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>, Neal Gompa <neal@gompa.dev>,
	Hector Martin <marcan@marcan.st>, linuxppc-dev@lists.ozlabs.org,
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v2 1/6] i2c: pasemi: Use correct bits.h include
Message-ID: <Z_6TENulj4zwBzfm@blossom>
References: <20250415-pasemi-fixes-v2-0-c543bf53151a@svenpeter.dev>
 <20250415-pasemi-fixes-v2-1-c543bf53151a@svenpeter.dev>
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
In-Reply-To: <20250415-pasemi-fixes-v2-1-c543bf53151a@svenpeter.dev>
X-Migadu-Flow: FLOW_OUT
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Reviewed-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>

Le Tue , Apr 15, 2025 at 03:36:55PM +0000, Sven Peter via B4 Relay a écrit :
> From: Sven Peter <sven@svenpeter.dev>
> 
> When changing the #defines to use BIT and GENMASK the bitfield.h include
> was added instead of the correct bits.h include.
> 
> Reported-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> Closes: https://lore.kernel.org/asahi/Z965tVhC5jxy1kqZ@surfacebook.localdomain/
> Fixes: 8b4da3ef9206 ("i2c: pasemi: Add registers bits and switch to BIT()")
> Signed-off-by: Sven Peter <sven@svenpeter.dev>
> ---
>  drivers/i2c/busses/i2c-pasemi-core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/busses/i2c-pasemi-core.c b/drivers/i2c/busses/i2c-pasemi-core.c
> index bd128ab2e2ebb64929f2f6a3525835a880c3114d..71cc8cfc7c5cbf3924269f6217712d42008c03ff 100644
> --- a/drivers/i2c/busses/i2c-pasemi-core.c
> +++ b/drivers/i2c/busses/i2c-pasemi-core.c
> @@ -5,7 +5,7 @@
>   * SMBus host driver for PA Semi PWRficient
>   */
>  
> -#include <linux/bitfield.h>
> +#include <linux/bits.h>
>  #include <linux/module.h>
>  #include <linux/pci.h>
>  #include <linux/kernel.h>
> 
> -- 
> 2.34.1
> 
> 

