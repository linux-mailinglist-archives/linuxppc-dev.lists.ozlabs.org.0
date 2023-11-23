Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 95FDA7F686B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Nov 2023 21:20:50 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=J/IYGv0y;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SbqHh3Snhz3dS4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Nov 2023 07:20:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=J/IYGv0y;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SbqGm6vPDz3bYx
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Nov 2023 07:20:00 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id A11C8B81150;
	Thu, 23 Nov 2023 20:19:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C4C7C433C7;
	Thu, 23 Nov 2023 20:19:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1700770794;
	bh=UuTLzGGuH9YcnubjdF1BCJM+K4+61EnWHvDrzsYsIjU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=J/IYGv0y33AVuo6lVGfICAh9QGCeCF05WduzQig+AWwMeM7xMbDEiE049+6LzaOoR
	 vCfuf8Qyw4nfPp/Rm9M2b1iG9OSOokB5gWsSjAHpDRCU0D+3aOrtwDN1sfJpeFtR6p
	 bPHgaCBJvKCfquudN2B/3zcOdVZADe4nUm4aI0Qg=
Date: Thu, 23 Nov 2023 20:19:45 +0000
From: Greg KH <gregkh@linuxfoundation.org>
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
Subject: Re: [PATCH 00/17] tty: small cleanups and fixes
Message-ID: <2023112321-veto-trapping-ca47@gregkh>
References: <20231121092258.9334-1-jirislaby@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231121092258.9334-1-jirislaby@kernel.org>
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
Cc: linux-usb@vger.kernel.org, netdev@vger.kernel.org, linux-alpha@vger.kernel.org, Richard Henderson <richard.henderson@linaro.org>, linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, linux-serial@vger.kernel.org, Jan Kara <jack@suse.com>, Jakub Kicinski <kuba@kernel.org>, Matt Turner <mattst88@gmail.com>, Paolo Abeni <pabeni@redhat.com>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>, Laurentiu Tudor <laurentiu.tudor@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Nov 21, 2023 at 10:22:41AM +0100, Jiri Slaby (SUSE) wrote:
> This is a series to fix/clean up some obvious issues I revealed during
> u8+size_t conversions (to be posted later).

I applied most of these except the last few, as I think you were going
to reorder them, right?

thanks,

greg k-h
