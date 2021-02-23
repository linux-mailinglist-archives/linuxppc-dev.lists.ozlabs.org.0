Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DE2E4323453
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Feb 2021 00:46:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DlbL16Kmzz3cTL
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Feb 2021 10:46:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=saEOfLk6;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=kuba@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=saEOfLk6; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DlbKd1K1Pz30Jk
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Feb 2021 10:46:13 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id E24D764DAF;
 Tue, 23 Feb 2021 23:46:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614123969;
 bh=YpnspKf25v9kzFrBwfaJ6e6sH4o+qxbqGQg+T9/x7J0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=saEOfLk6BF5SgtZzQzfxddA2ZW4SVPmT0VuNs3Iy8EVEEvMj0A2S0wKfKMXtNT0IG
 0jTvBSndMVZfLJcrPfSE93UETOLfdSsnxT7qR2F7BvHpHPSqhnmzO2pmlMDKR5LLKH
 9LN5qswjsPGWpuVrRl0a3ayoHtW3GnA/UngUFzFbrbqI8uw1gN6ACXN7ecQyQNl/zX
 Tt66phBbx0L85+fqLm3uQAzK72IcEBPKTJHzHTliQGdYAoLR72a+sPiImD6lSDktjg
 Ko+SaKyWu0fNSleXOkWTzhwlkF8EmBYsOLuICfxwrKk65WWUzZQg7+M9LxK27s/YUX
 LaiR3eQU45lTg==
Date: Tue, 23 Feb 2021 15:46:05 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Yang Li <yang.lee@linux.alibaba.com>
Subject: Re: [PATCH] ibmveth: Switch to using the new API kobj_to_dev()
Message-ID: <20210223154605.3a658f4a@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <1613980941-45992-1-git-send-email-yang.lee@linux.alibaba.com>
References: <1613980941-45992-1-git-send-email-yang.lee@linux.alibaba.com>
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
Cc: cforno12@linux.ibm.com, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, paulus@samba.org, linuxppc-dev@lists.ozlabs.org,
 davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 22 Feb 2021 16:02:21 +0800 Yang Li wrote:
> fixed the following coccicheck:
> ./drivers/net/ethernet/ibm/ibmveth.c:1805:51-52: WARNING opportunity for
> kobj_to_dev()
> 
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>

# Form letter - net-next is closed

We have already sent the networking pull request for 5.12 and therefore
net-next is closed for new drivers, features, code refactoring and
optimizations. We are currently accepting bug fixes only.

Please repost when net-next reopens after 5.12-rc1 is cut.

Look out for the announcement on the mailing list or check:
http://vger.kernel.org/~davem/net-next.html

RFC patches sent for review only are obviously welcome at any time.
