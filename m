Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3108592E19E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Jul 2024 10:11:08 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=IV2U/pFh;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WKS9575NZz3cZR
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Jul 2024 18:11:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=IV2U/pFh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=andi.shyti@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WKS8Q5llGz30fp
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Jul 2024 18:10:30 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1BC9261C14;
	Thu, 11 Jul 2024 08:10:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58115C4AF0B;
	Thu, 11 Jul 2024 08:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720685426;
	bh=xzREfGGS/Sap7PbOCyPC8kX8oaYFEtcfObMfdJvQK1c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IV2U/pFhoZSEQNsWPDJs4kw9LPk+euDPeupf8SvrntFRu6SmpTMiRS6uBuFlsirBg
	 3gjZdXdBSuj3T8qvkg45Q3AuASJVtRlMjw6PE7LzbzI+tMfZ7E5cB4TmBQUDQli/C4
	 A+VJG8GsDRqLTKWib0lEb70U4vkPDnYPSljgms6mQLP2enIsVEETW+/rIjUR5sQFFg
	 GW0vrxRNeEq2BKOyNxn2O4CECXmzFCr/69/e2x9/hbM+sNGyIhop07vkod3nKYWaim
	 ND5JUKmsdTtIKTB8OKJl7wOYGzC7n1vvk/8mecv9dVOLJc9wVKQH7X66gLUIWp76Ow
	 z2a+h6ic7HUcA==
Date: Thu, 11 Jul 2024 10:10:23 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: Re: [PATCH v2 39/60] i2c: powermac: reword according to newest
 specification
Message-ID: <a35xwmcm5oia6v5u2geghssutcej5k3rvr4py7zlu2eonl4tgw@zsc4oa6e5yej>
References: <20240706112116.24543-1-wsa+renesas@sang-engineering.com>
 <20240706112116.24543-40-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240706112116.24543-40-wsa+renesas@sang-engineering.com>
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
Cc: Nicholas Piggin <npiggin@gmail.com>, linux-kernel@vger.kernel.org, Christophe Leroy <christophe.leroy@csgroup.eu>, linux-i2c@vger.kernel.org, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Wolfram,

> -static int i2c_powermac_master_xfer(	struct i2c_adapter *adap,
> -					struct i2c_msg *msgs,
> -					int num)
> +static int i2c_powermac_xfer(struct i2c_adapter *adap,
> +			     struct i2c_msg *msgs,
> +			     int num)

and we get a nice free cleanup here :-)

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

Thanks,
Andi
