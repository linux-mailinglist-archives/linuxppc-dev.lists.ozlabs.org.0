Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1112464CF74
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Dec 2022 19:31:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NXP8874Kvz3cKW
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Dec 2022 05:31:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=0VH2FjUN;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=0VH2FjUN;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NXP7B51p6z3bZk
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Dec 2022 05:30:29 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id C1443B816B0;
	Wed, 14 Dec 2022 18:30:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F40B6C433EF;
	Wed, 14 Dec 2022 18:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1671042623;
	bh=NFgaBwH9iAJLgv24/VuvOV9n5tzSj9XqbZzAMz/3tu4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=0VH2FjUNTYSQnMWEHKm5osJzrQQrby1oskqhB8SQ2i7z4s3/91QgG63p6k6CGpo8D
	 tBjC5ukQteD2qpJRjxYkh7A08Gk73R4v1eHwITU1xsG8YbFbnGN3lar5AUJAFpclAK
	 5PlRyMca1PSOvPtuIC//ofH0xoS9xMKoOA5fOj/M=
Date: Wed, 14 Dec 2022 19:30:20 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] [REBASED for 4.14] once: add DO_ONCE_SLOW() for
 sleepable contexts
Message-ID: <Y5oWPJ2qApAUgRs4@kroah.com>
References: <df44c3cd06ae0155f04f9d87fff35db67761beea.1670934155.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <df44c3cd06ae0155f04f9d87fff35db67761beea.1670934155.git.christophe.leroy@csgroup.eu>
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
Cc: Sasha Levin <sashal@kernel.org>, linux-kernel@vger.kernel.org, stable@vger.kernel.org, Willy Tarreau <w@1wt.eu>, Eric Dumazet <edumazet@google.com>, linuxppc-dev@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Dec 13, 2022 at 01:22:40PM +0100, Christophe Leroy wrote:
> From: Eric Dumazet <edumazet@google.com>
> 
> [ Upstream commit 62c07983bef9d3e78e71189441e1a470f0d1e653 ]
> 
> Christophe Leroy reported a ~80ms latency spike
> happening at first TCP connect() time.
> 
> This is because __inet_hash_connect() uses get_random_once()
> to populate a perturbation table which became quite big
> after commit 4c2c8f03a5ab ("tcp: increase source port perturb table to 2^16")
> 
> get_random_once() uses DO_ONCE(), which block hard irqs for the duration
> of the operation.
> 
> This patch adds DO_ONCE_SLOW() which uses a mutex instead of a spinlock
> for operations where we prefer to stay in process context.
> 
> Then __inet_hash_connect() can use get_random_slow_once()
> to populate its perturbation table.
> 
> Fixes: 4c2c8f03a5ab ("tcp: increase source port perturb table to 2^16")
> Fixes: 190cc82489f4 ("tcp: change source port randomizarion at connect() time")
> Reported-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> Link: https://lore.kernel.org/netdev/CANn89iLAEYBaoYajy0Y9UmGFff5GPxDUoG-ErVB2jDdRNQ5Tug@mail.gmail.com/T/#t
> Signed-off-by: Eric Dumazet <edumazet@google.com>
> Cc: Willy Tarreau <w@1wt.eu>
> Tested-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> Signed-off-by: David S. Miller <davem@davemloft.net>
> Signed-off-by: Sasha Levin <sashal@kernel.org>
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>  include/linux/once.h       | 28 ++++++++++++++++++++++++++++
>  lib/once.c                 | 30 ++++++++++++++++++++++++++++++
>  net/ipv4/inet_hashtables.c |  4 ++--
>  3 files changed, 60 insertions(+), 2 deletions(-)

Now queued up, thanks.

greg k-h
