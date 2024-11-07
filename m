Return-Path: <linuxppc-dev+bounces-3006-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6119C9C0D4D
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Nov 2024 18:52:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XkqQQ1yMyz3bnB;
	Fri,  8 Nov 2024 04:51:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731001918;
	cv=none; b=DuwodUT3OCletpAMhPTN9EKcfnnnH2V3KwVeIXBp1lomU9NsfDywman4Yz9vPmGpl5mLhhc8ubzNolKaXga6Z6GteKDY7O/6aWjtzdwJ1LSiBOuAEVNoXaEU2hhom4lc/9s41xGT9PifFlXPSDHCnFxs9QXZdu9B2H//MWrKp4ktMJyFrrZMe9KTNHUlCDLU5uJkmpNLmBr7ZkPJWU9lgTS0o/YLKv7wzPoWZM0FiJE2k6P6vfPz2LEAf/mqbBLlOcFlTKczZ5XUbfRMy7/ecUvxK7rRhBNZUtlc7eoe/RzoreMM39cfuRk7lY1E56ZI4XqZXTKKdVeEmIl9VtZWFw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731001918; c=relaxed/relaxed;
	bh=VTX/qMfY3i1jVfedgdybn7RbAb/9rhIjtakkTYoriP8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QWUX56W+MUfJd0znLbZW1j0qsOIGHCap+c9OwYUVZ5v+QsVxWPRxCPlpEZOV2zGCAJfnZujsDls8c3kw2WiVnA7v0qylWaoqo/YxLBv1rikD3mPOeUOReaTX8vO8+c2Qf/BkRb0kK1egWdDrYXTvw6Os5OTV6jexAU8figwxw/smz8s+/nWwkYteveSyetsQkICAdYPp0/0ONHETssMVstUZIlZOnUt++bw7CBuqQ4v5uX+rk3iAniK5twD+sseIU6b4HLcf7mmxfq9HpATj/+fDGLlTu++7ZwFSOFpTJpkq+iiTePgSFcy67Yvkr24FpA4eYxc2iBrQdHH4YlzCQg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; dkim=pass (1024-bit key; unprotected) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=Pallv/nJ; dkim-atps=neutral; spf=pass (client-ip=156.67.10.101; helo=vps0.lunn.ch; envelope-from=andrew@lunn.ch; receiver=lists.ozlabs.org) smtp.mailfrom=lunn.ch
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=Pallv/nJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=lunn.ch (client-ip=156.67.10.101; helo=vps0.lunn.ch; envelope-from=andrew@lunn.ch; receiver=lists.ozlabs.org)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XkqQP2czVz3bkf
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Nov 2024 04:51:57 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=VTX/qMfY3i1jVfedgdybn7RbAb/9rhIjtakkTYoriP8=; b=Pallv/nJMHV7iZux+Ob/roeq9X
	/E2DpyqXe6D/fqUEme2NP5f/inf0Ze4v8P1V3BPjrdWJ0OMhZBkZ02WkQ/W2N00lRtzcvSyX2J22T
	un2gub2wdSq3ZJxTgZ3CY2+Fx3od6i/baWCCy/S+G2597Kfx/w4Ptt1qhkSmuEEwPqPc=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1t96fY-00CUYV-67; Thu, 07 Nov 2024 18:51:44 +0100
Date: Thu, 7 Nov 2024 18:51:44 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: davem@davemloft.net, Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Russell King <linux@armlinux.org.uk>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Heiner Kallweit <hkallweit1@gmail.com>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, thomas.petazzoni@bootlin.com,
	Herve Codina <herve.codina@bootlin.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH net-next 6/7] net: freescale: ucc_geth: Hardcode the
 preamble length to 7 bytes
Message-ID: <7c8e1d44-cdcf-4d46-b9a8-b93e0cd39d43@lunn.ch>
References: <20241107170255.1058124-1-maxime.chevallier@bootlin.com>
 <20241107170255.1058124-7-maxime.chevallier@bootlin.com>
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
In-Reply-To: <20241107170255.1058124-7-maxime.chevallier@bootlin.com>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Thu, Nov 07, 2024 at 06:02:53PM +0100, Maxime Chevallier wrote:
> The preamble length can be configured in ucc_geth, however it just
> ends-up always being configured to 7 bytes, as nothing ever changes the
> default value of 7.
> 
> Make that value the default value when the MACCFG2 register gets
> initialized, and remove the code to configure that value altogether.
> 
> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

