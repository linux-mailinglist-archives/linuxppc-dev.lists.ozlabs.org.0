Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 42EDA94296D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Jul 2024 10:45:28 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ZfJyoowh;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WYlzV1Rqjz3dCH
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Jul 2024 18:45:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ZfJyoowh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=horms@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WYlyq02qrz3c8x
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Jul 2024 18:44:50 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6484862274;
	Wed, 31 Jul 2024 08:44:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5647C116B1;
	Wed, 31 Jul 2024 08:44:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722415488;
	bh=WzC80hl1AW1tiBkiKAI6/dELkDarMZZqpTulR3LSY6Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZfJyoowhJ0sxAIFJP8EH8/5EeNk5XFa+k/rD9fPPqt89+baW6O46DfPVbZHwu06z4
	 vUYjpNjYSV+X976z7l28rQZ5LswYHGqZ+GERZq076T5w3mHwLSfZQtYNyD7txtZU+6
	 lyVixwyfS4Qzu6d0QtITvrqZ7CjxFVYoFz/I/KpXaopCd1xUNdHvtyRTZfU5rogwud
	 sQzATIetOuPz2X7ltmYAL0zW1qY6wBeHFAMnLzBFWQgTwtOrpSaEr3WCjtyCZTu+M9
	 YX5QW8mtHcV8yjGjccDem99PPL5YUzsAXOi6bOz5H13AQHfJhFSOTuGLrriW6NXNoX
	 1YQf5cUB3m49Q==
Date: Wed, 31 Jul 2024 09:44:43 +0100
From: Simon Horman <horms@kernel.org>
To: Herve Codina <herve.codina@bootlin.com>
Subject: Re: [PATCH net v1] net: wan: fsl_qmc_hdlc: Discard received CRC
Message-ID: <20240731084443.GL1967603@kernel.org>
References: <20240730063133.179598-1-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240730063133.179598-1-herve.codina@bootlin.com>
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
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Christophe Leroy <christophe.leroy@csgroup.eu>, Eric Dumazet <edumazet@google.com>, stable@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jul 30, 2024 at 08:31:33AM +0200, Herve Codina wrote:
> Received frame from QMC contains the CRC.
> Upper layers don't need this CRC and tcpdump mentioned trailing junk
> data due to this CRC presence.
> 
> As some other HDLC driver, simply discard this CRC.

It might be nice to specifically site an example.
But yes, I see this pattern in hdlc_rx_done().

> 
> Fixes: d0f2258e79fd ("net: wan: Add support for QMC HDLC")
> Cc: stable@vger.kernel.org
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> ---
>  drivers/net/wan/fsl_qmc_hdlc.c | 24 ++++++++++++++++++------
>  1 file changed, 18 insertions(+), 6 deletions(-)

The above notwithstanding, this looks good to me.

Reviewed-by: Simon Horman <horms@kernel.org>
