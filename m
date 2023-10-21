Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 639F07D19C6
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Oct 2023 02:04:05 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=HO41pWF4;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SC1ry2lJhz3vYV
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Oct 2023 11:04:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=HO41pWF4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=kuba@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SC1r65LFNz3bT8
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 21 Oct 2023 11:03:18 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 99B6B622D5;
	Sat, 21 Oct 2023 00:03:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 701EBC433C7;
	Sat, 21 Oct 2023 00:03:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697846594;
	bh=yx4b5fn0c6i/eWSkHChzUW6XYw4N9dR7DJEx3AAQzKc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=HO41pWF4QiVeyQdPM9A8bwglMTkInB+dDxLsibIcJ30M+4iCc9NpMlN4JttCNzuaK
	 I0X1YuLX1KLGw99923ETQopyWBDfkGs4geJUBuctgKXlTwLzelPSiWGMIY15iU+aUd
	 yMyu6R5D0p1G+noEVVZD3ia8XWI492fPN30rc3YTrazlWaBy7gEQ5KO63eh+IeqSwe
	 qaP4ucYpaw5nJPDqHHyzsvTdPJVSCwle669n/x7ACYuxC6EW/+MDpB2nOkRb/Djs+s
	 ykmMHQc+LybdfhMTFle5SpngmM//y3uCXr572zhDZa/75v1wJ0nr/q9GuZfKwG9HPT
	 qg3j2dn2Cs76A==
Date: Fri, 20 Oct 2023 17:03:12 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Kunwu Chan <chentao@kylinos.cn>
Subject: Re: [PATCH] treewide: Spelling fix in comment
Message-ID: <20231020170312.5baf8c59@kernel.org>
In-Reply-To: <20231020093156.538856-1-chentao@kylinos.cn>
References: <20231020093156.538856-1-chentao@kylinos.cn>
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
Cc: jeff@garzik.org, mokuno@sm.sony.co.jp, kunwu.chan@hotmail.com, dcbw@redhat.com, linville@tuxdriver.com, linux-kernel@vger.kernel.org, edumazet@google.com, npiggin@gmail.com, netdev@vger.kernel.org, pabeni@redhat.com, linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 20 Oct 2023 17:31:56 +0800 Kunwu Chan wrote:
> reques -> request
> 
> Fixes: 09dde54c6a69 ("PS3: gelic: Add wireless support for PS3")
> Signed-off-by: Kunwu Chan <chentao@kylinos.cn>

Appears to have been applied to net, thank you!
