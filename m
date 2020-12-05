Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DAC0F2CFEF7
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Dec 2020 21:57:59 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CpMNN3Gh2zDqpv
	for <lists+linuxppc-dev@lfdr.de>; Sun,  6 Dec 2020 07:57:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=kuba@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=XjLCieWX; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CpMHl0ztlzDqKD
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  6 Dec 2020 07:53:54 +1100 (AEDT)
Date: Sat, 5 Dec 2020 12:53:51 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1607201632;
 bh=uUWQNjkzP7jsDA3hiG3fn47VNCNDg6puRbpmbUSoqew=;
 h=From:To:Cc:Subject:In-Reply-To:References:From;
 b=XjLCieWXIm6u9BddBMaTSLjRjSBqYozZZtAuX4WYNSgGOXBggGw8bQpNXPv4mCFkx
 aJVrWlp0Y4044T/EwN1cyjYjsHfe5S48jhYbjkX3GjJLoA5akyMU8ZYn7fEJC46TFL
 oNf8l5w+376M2S+L39d1/Jv9YsOyH8omIEnsPi3A3YGfXdIp3z1IJsAuXlWIPpsDoh
 Yov5Hh5MsUQZih8EIlQ6fKakYy5AWIwEwp6mXeENpv/0PQtHfojcpfz+AcbS3viH89
 vUV7ZsgC0V3/fyF6A309vg4zjwek9xtHUpT38hiYneb7CVmvwOnQsCI36tZkRqMJEO
 /rMzuG1EiWr7A==
From: Jakub Kicinski <kuba@kernel.org>
To: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
Subject: Re: [PATCH 00/20] ethernet: ucc_geth: assorted fixes and
 simplifications
Message-ID: <20201205125351.41e89579@kicinski-fedora-pc1c0hjn.DHCP.thefacebook.com>
In-Reply-To: <20201205191744.7847-1-rasmus.villemoes@prevas.dk>
References: <20201205191744.7847-1-rasmus.villemoes@prevas.dk>
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
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Li Yang <leoyang.li@nxp.com>, Vladimir Oltean <vladimir.oltean@nxp.com>,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, Qiang Zhao <qiang.zhao@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat,  5 Dec 2020 20:17:23 +0100 Rasmus Villemoes wrote:
> While trying to figure out how to allow bumping the MTU with the
> ucc_geth driver, I fell into a rabbit hole and stumbled on a whole
> bunch of issues of varying importance - some are outright bug fixes,
> while most are a matter of simplifying the code to make it more
> accessible.
> 
> At the end of digging around the code and data sheet to figure out how
> it all works, I think the MTU issue might be fixed by a one-liner, but
> I'm not sure it can be that simple. It does seem to work (ping -s X
> works for larger values of X, and wireshark confirms that the packets
> are not fragmented).
> 
> Re patch 2, someone in NXP should check how the hardware actually
> works and make an updated reference manual available.

Looks like a nice clean up on a quick look.

Please separate patches 1 and 11 (which are the two bug fixes I see)
rebase (retest) and post them against the net tree:

https://git.kernel.org/pub/scm/linux/kernel/git/netdev/net.git/

so they are available for backports.

The reset should go into net-next:

https://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next.git/

Please indicate the tree in the tag like [PATCH net] or [PATCH
net-next] so the test bots know which base to use for testing.

Thanks!
