Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E849C4DB876
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Mar 2022 20:19:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KJg7H6J2Rz3bSy
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Mar 2022 06:19:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=kFkCd6Xr;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1;
 helo=sin.source.kernel.org; envelope-from=kuba@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=kFkCd6Xr; 
 dkim-atps=neutral
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KJg6b4QKqz3085
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Mar 2022 06:18:31 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 4D5E3CE1EC4;
 Wed, 16 Mar 2022 19:18:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38C04C340EC;
 Wed, 16 Mar 2022 19:18:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647458307;
 bh=auNLxIlGNcIvuiL+RdmhXJCK5ajm41FRCgIOC4esN5E=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=kFkCd6XrMQQVoD8lv83V5bL/E3lN5kQ79S73Q6S9ll8D0YJLHRoMe1N42IINmKBWv
 lwTCljjh0ksccCJNhkRK2y/1Ttb5Xj01ACVKlpZcg4F/3u0It5AptN2GlmphGZxCU2
 A/4zul/LJFf2jatf4kI/oFxJc3SZk0f5RbqmouNPHcG28KWWYGWeLaDgC6b76M52zw
 g6CF/sRdA4L8hb/aavbc4eu4atEhkQTwubi5g1dHXc7ywQpdHjUr1YnXO/RPh+0SiA
 YuduwxNSVSqfJ2MoDDaxh4DwyfG3KXZzEtTE1uErU1uf3TuP/E+R0Dz79wYPG9rNca
 BB69rHuckvCFw==
Date: Wed, 16 Mar 2022 12:18:25 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Michal Kubecek <mkubecek@suse.cz>
Subject: Re: [EXT] Re: bnx2x: ppc64le: Unable to set message level greater
 than 0x7fff
Message-ID: <20220316121825.6eb08c07@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <20220316185232.ttsuvp4wbdxztned@lion.mk-sys.cz>
References: <0497a560-8c7b-7cf8-84ee-bde1470ae360@molgen.mpg.de>
 <20220315183529.255f2795@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
 <db796473-69cf-122e-ec40-de62659517b0@molgen.mpg.de>
 <ade0ed87-be4f-e3c7-5e01-4bfdb78fae07@molgen.mpg.de>
 <BY3PR18MB4612AD5E7F7D59233990A21DAB119@BY3PR18MB4612.namprd18.prod.outlook.com>
 <20220316111754.5316bfb5@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
 <20220316185232.ttsuvp4wbdxztned@lion.mk-sys.cz>
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
Cc: Paul Menzel <pmenzel@molgen.mpg.de>, Ariel Elior <aelior@marvell.com>,
 Manish Chopra <manishc@marvell.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "it+netdev@molgen.mpg.de" <it+netdev@molgen.mpg.de>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 Sudarsana Reddy Kalluru <skalluru@marvell.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 16 Mar 2022 19:52:32 +0100 Michal Kubecek wrote:
> > Yup, IIUC it works for Paul on a 5.17 system, that system likely has
> > old ethtool user space tool which uses ioctls instead of netlink.
> > 
> > What makes the netlink path somewhat non-trivial is that there is 
> > an expectation that the communication can be based on names (strings)
> > as well as bit positions. I think we'd need a complete parallel
> > attribute to carry vendor specific bits :S  
> 
> Yes, that would be a way to go. However, in such case I would prefer
> separating these driver/device specific message flags completely rather
> then letting drivers grab currently unused flags (as is the case here,
> IIUC) as those are likely to collide with future global ones.

I was thinking let the driver specify which flags it is squatting on in
a mask in ethtool_ops, and then make sure the generic vs non-generic
flags are routed appropriately in the user space <> core communication.
We can also split the private vs generic on the ethtool_op level.

User space would have to jump thru extra hoops to figure the separation
out (maybe we can expose the "private mask" in get?)

I agree that the more we can separate the private and generic flags,
the better, that's just what I could come up with.
