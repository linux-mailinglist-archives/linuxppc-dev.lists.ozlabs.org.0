Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 83B6B84FF60
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Feb 2024 23:03:25 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=jHY/ue5I;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TWnt33Q9Rz3cnS
	for <lists+linuxppc-dev@lfdr.de>; Sat, 10 Feb 2024 09:03:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=jHY/ue5I;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=kuba@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TWnsG0354z3c2G
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 10 Feb 2024 09:02:41 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 48D23CE1C27;
	Fri,  9 Feb 2024 22:02:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23D8EC433C7;
	Fri,  9 Feb 2024 22:02:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707516155;
	bh=vtEET3uyoCJTR2xzZC0XhdsJ1n+MqemqXmujTlSCaoQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=jHY/ue5IKYv+3rg7wvYqE1vBLPgfeLKvHvEmchnLNSXJP1N/JfnztQWQ9RiUN1ywT
	 AIbagXHUZefIGsy4+d5tBpCG4dXz0FfdijjFIt5nh0y8UC+jLAkwx7JJld9tii5KDn
	 /jqmr+yV/lOUvD9qEy3I52mjzrALKfT2kkYjc/4MjgUJE6i68LK0nSVG4YjDmwSpYC
	 5TnPblCYvgZfpGSp4RhwhmF/rC6QD9JAdc/ZiegjYDQ6Nq9S3yIynRrAq2dTn56hZC
	 opBxpvvDarDpyXVtDe9UfEIZTLXgiwCnO6e9GfOWuwTED4X0UZeQfXdFwOp+azJ6JC
	 sBeg0CPjOWoPw==
Date: Fri, 9 Feb 2024 14:02:34 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Herve Codina <herve.codina@bootlin.com>
Subject: Re: [PATCH v3 4/6] bitmap: Introduce bitmap_off()
Message-ID: <20240209140234.10e150b1@kernel.org>
In-Reply-To: <20240206140717.107930-5-herve.codina@bootlin.com>
References: <20240206140717.107930-1-herve.codina@bootlin.com>
	<20240206140717.107930-5-herve.codina@bootlin.com>
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
Cc: Andrew Lunn <andrew@lunn.ch>, Vadim Fedorenko <vadim.fedorenko@linux.dev>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>, Mark Brown <broonie@kernel.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Paolo Abeni <pabeni@redhat.com>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue,  6 Feb 2024 15:07:14 +0100 Herve Codina wrote:
> The bitmap_onto() function translates one bitmap relative to another but
> no function are present to perform the reverse translation.
> 
> Introduce bitmap_off() to fill this hole.

Argh, Yury is not even CCed on this? I was about to ping him but then 
I realized his email is completely missing :o

Please repost this and CC the appropriate maintainers...
-- 
pw-bot: cr
