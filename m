Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C195873C19
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Mar 2024 17:23:45 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=JMFBK0Pn;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tqd670jS2z3vXX
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Mar 2024 03:23:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=JMFBK0Pn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=kuba@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tqd5N5TSHz3d2g
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Mar 2024 03:23:04 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 863DECE2243;
	Wed,  6 Mar 2024 16:23:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AD6FC433C7;
	Wed,  6 Mar 2024 16:23:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709742180;
	bh=24mhXff8LDVoMbm7CqvfvCGZksiGBKhKHIATyzFE2PA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=JMFBK0PnNMiwfUMScMG+NrwmxDyqseaiWtBJ5EZw+UjeFHPDlaJs3PFJ+qIU3ESG6
	 cpmueBKnRTCLMw0LKN0D0URc4gYNnDmgVmbCK11YilSR4cHlzgD4G3FnA1LUKDW0SJ
	 2z3qahBPYT4Sh24Xtxt/Y0LssSKwZpVx9Y6uoPwzyptI5ZJALkhmbn9NWW279W9TCa
	 BK1OM7R02Y242iRN2CscD0zmWvIcTc2aXQNmJ2+DIwmkqttNyqRF23bobGei0bknCP
	 9rOE8dOUqsUjExFwY1aO/M7iPvS8dbi61vs2aYuLWk2sbyn5ptXJvXpp/ISA98blwW
	 FJJgAql8v1eHw==
Date: Wed, 6 Mar 2024 08:22:59 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v6 1/5] net: wan: Add support for QMC HDLC
Message-ID: <20240306082259.5a29a5aa@kernel.org>
In-Reply-To: <Zehxwo2wCLkZBQzc@smile.fi.intel.com>
References: <20240306080726.167338-1-herve.codina@bootlin.com>
	<20240306080726.167338-2-herve.codina@bootlin.com>
	<ZehvV6kCD3RCumAL@yury-ThinkPad>
	<Zehxwo2wCLkZBQzc@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: Andrew Lunn <andrew@lunn.ch>, Vadim Fedorenko <vadim.fedorenko@linux.dev>, Yury Norov <yury.norov@gmail.com>, netdev@vger.kernel.org, Rasmus Villemoes <linux@rasmusvillemoes.dk>, linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>, Mark Brown <broonie@kernel.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Herve Codina <herve.codina@bootlin.com>, Paolo Abeni <pabeni@redhat.com>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 6 Mar 2024 15:38:10 +0200 Andy Shevchenko wrote:
> > It's minor, but you can avoid conditionals doing something like:
> > 
> > 		netdev->stats.rx_over_errors += !!(flags & QMC_RX_FLAG_HDLC_OVF);  
> 
> This is harder to read. 

+1
