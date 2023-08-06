Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ADAEC7715EC
	for <lists+linuxppc-dev@lfdr.de>; Sun,  6 Aug 2023 17:37:57 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=WsGd4QRK;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RJk9b4H4Yz30QQ
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Aug 2023 01:37:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=WsGd4QRK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=horms@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RJk8j0GcTz2yG9
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  7 Aug 2023 01:37:08 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 1F1D5611A0;
	Sun,  6 Aug 2023 15:37:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 579F7C433C7;
	Sun,  6 Aug 2023 15:37:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691336226;
	bh=2mjUK8700j2g79TU7Ih+YIIZC0YtpcE+kTjNT8R0CGc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WsGd4QRKxt0EYKFdTHhkTw3chr5tuibu0t6WAJe5OHdfSMg+qMmcOUrAz7VHLVjx+
	 8HZqicBCR2C3uNmmqt8FfB0PwZSr2/K/cDNTFiczGwWKdHQoMdk3CP8CMRoNvs0CH2
	 mKhqq9MX3spfTbVK67nqyea0Z1MYlPmu9jVUD20x6/ss78WPchc33rcnyLV9D8FGjd
	 RwFnH3ruq7PQEdmo0kv8bHwVN9E46h9wqAMrFpxo+3LFVnYgjJcztsXO2MxewWXNrv
	 S/+2uOzKfWp5bkjYPmiV8pXeaf/H60Bsjt1DXpR7iFFW6sfPhIPHdvfMWZxoQsFQa1
	 +Xvhb4jcbQnbg==
Date: Sun, 6 Aug 2023 17:37:02 +0200
From: Simon Horman <horms@kernel.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH net-next v2 10/10] net: fs_enet: Use cpm_muram_xxx()
 functions instead of cpm_dpxxx() macros
Message-ID: <ZM++Hq8h6EUnUGQL@vergenet.net>
References: <cover.1691155346.git.christophe.leroy@csgroup.eu>
 <2400b3156891adb653dc387fff6393de10cf2b24.1691155347.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2400b3156891adb653dc387fff6393de10cf2b24.1691155347.git.christophe.leroy@csgroup.eu>
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
Cc: robh@kernel.org, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, Eric Dumazet <edumazet@google.com>, netdev@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Aug 04, 2023 at 03:30:20PM +0200, Christophe Leroy wrote:
> cpm_dpxxx() macros are now always referring to cpm_muram_xxx() fonctions

nit: fonctions -> functions

Thanks Christophe,

This minor nit notwithstanding, this series looks good to me.
I'll send a reviewed-by tag for the whole series in response
to the cover letter.

...
