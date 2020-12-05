Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3908E2CFF39
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Dec 2020 22:30:43 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CpN672f1QzDqmC
	for <lists+linuxppc-dev@lfdr.de>; Sun,  6 Dec 2020 08:30:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=kuba@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=TTX4lDSW; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CpN2K1hcCzDqNv
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  6 Dec 2020 08:27:20 +1100 (AEDT)
Date: Sat, 5 Dec 2020 13:27:16 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1607203637;
 bh=FD4PyLI/19p+zpfFll8rCI/9aR2mAR3+g29XkXnp8fg=;
 h=From:To:Cc:Subject:In-Reply-To:References:From;
 b=TTX4lDSWJHCfeyKYmYD9VrgrqASPFYttBYRKKTns5roGvSnFK3Kq5CoKFGaPAR1hL
 G2QRaExRTzQMCPRCXh3Di3nJWQiZsvKKesb5zgry6C+j3XHay2YgZaSbJA/Rz6/GdL
 wqGIf4q7Rj7I816+wSsVd4rdJPLFOBlA8zmtp0heGz5DcD8FYqWuff6RFCb/meZCEB
 NQgnzrJvmNXJ4C93auUBsON/ISUhtdyHQrBPReZw/UYgC21OYyn8oIlihZ8FUscYsT
 Ey6OMIKZj3Q856OKy99W7lWinZA0ryZzXwxbGp7QesIxYBJv6CZ8XXkDEryf4Z+ozv
 scwKn5k/YSwHQ==
From: Jakub Kicinski <kuba@kernel.org>
To: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
Subject: Re: [PATCH 00/20] ethernet: ucc_geth: assorted fixes and
 simplifications
Message-ID: <20201205132716.4c68e35d@kicinski-fedora-pc1c0hjn.DHCP.thefacebook.com>
In-Reply-To: <7e78df84-0035-6935-acb0-adbd0c648128@prevas.dk>
References: <20201205191744.7847-1-rasmus.villemoes@prevas.dk>
 <20201205125351.41e89579@kicinski-fedora-pc1c0hjn.DHCP.thefacebook.com>
 <7e78df84-0035-6935-acb0-adbd0c648128@prevas.dk>
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

On Sat, 5 Dec 2020 22:11:39 +0100 Rasmus Villemoes wrote:
> > Looks like a nice clean up on a quick look.
> > 
> > Please separate patches 1 and 11 (which are the two bug fixes I see)  
> 
> I think patch 2 is a bug fix as well, but I'd like someone from NXP to
> comment.

Sure, makes sense.

> > rebase (retest) and post them against the net tree:
> > 
> > https://git.kernel.org/pub/scm/linux/kernel/git/netdev/net.git/  
> 
> So I thought this would go through Li Yang's tree. That's where my
> previous QE related patches have gone through, and at least some need
> some input from NXP folks - and what MAINTAINERS suggests. So not
> marking the patches with net or net-next was deliberate. But I'm happy
> to rearrange and send to net/net-next as appropriate if that's what you
> and Li Yang can agree to.

Ah, now I noticed you didn't CC all of the patches to netdev.
Please don't do that, build bots won't be able to validate partially
posted patches.
