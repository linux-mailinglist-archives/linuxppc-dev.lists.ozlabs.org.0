Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EBEA3598B05
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Aug 2022 20:21:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M7tWL5Rw2z3ccy
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Aug 2022 04:21:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=K8C4Agko;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=kuba@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=K8C4Agko;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M7tVh52FGz3bZs
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Aug 2022 04:21:00 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2107661750;
	Thu, 18 Aug 2022 18:20:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 606ABC433C1;
	Thu, 18 Aug 2022 18:20:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1660846855;
	bh=1kMkNkUHY/JY7PcVcwI9S6QtIB1nJgM373f3ZZep8lc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=K8C4AgkofOFMA1fsWl3SxL2XRA53UBBQwQVZD205NCvL44pfFjDYGsldA7vYWy4gm
	 67Lm8kYDnP+F2zNYylvpdshQDLBx3H8gX4XuziAPrldQnOAad3EcjgsNj/j2UJhaLb
	 nM0KbRhPT00dL9uzSLVpUj6xQxyYHWrXdzPbWV+v5veyc2deHeV+PrtkwIinib5TvN
	 OGALZIEHa9b+dzk+4fvpuqACaRY9IqLfYhf6XnnFsEKMLKJhDZDSDxmeZX4v3aS1x9
	 uy2v0GCUL0g+CQV0aA8gTV4g7DqEu6V+8QFxRfOHB0rKfJn/5zaL82DCbM3fkC2KtF
	 w47fbkJOKRoUA==
Date: Thu, 18 Aug 2022 11:20:54 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Sean Anderson <sean.anderson@seco.com>
Subject: Re: [RESEND PATCH net-next v4 00/25] net: dpaa: Cleanups in
 preparation for phylink conversion
Message-ID: <20220818112054.29cd77fb@kernel.org>
In-Reply-To: <20220818161649.2058728-1-sean.anderson@seco.com>
References: <20220818161649.2058728-1-sean.anderson@seco.com>
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
Cc: devicetree@vger.kernel.org, Madalin Bucur <madalin.bucur@nxp.com>, netdev@vger.kernel.org, open list <linux-kernel@vger.kernel.org>, Li Yang <leoyang.li@nxp.com>, Eric Dumazet <edumazet@google.com>, Rob Herring <robh+dt@kernel.org>, Camelia Groza <camelia.groza@nxp.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paolo Abeni <pabeni@redhat.com>, linuxppc-dev@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 18 Aug 2022 12:16:24 -0400 Sean Anderson wrote:
> This series contains several cleanup patches for dpaa/fman. While they
> are intended to prepare for a phylink conversion, they stand on their
> own. This series was originally submitted as part of [1].

Still over the limit of patches in a patch series, and looks pretty
easy to chunk up. We review and apply patches in netdev in 1-3 days,
it really is more efficient to post smaller series. 

And with the other series you sent to the list we have nearly 50
patches from you queued for review. I don't think this is reasonable,
people reviewing this code are all volunteers trying to get their
work done as well :(
