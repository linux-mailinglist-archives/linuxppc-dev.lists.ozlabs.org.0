Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 047B4614381
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Nov 2022 04:11:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N1ZmG6WHNz3cL7
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Nov 2022 14:11:10 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=a7otUj02;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=patchwork-bot+netdevbpf@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=a7otUj02;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N1ZlJ5Wbzz3c6M
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Nov 2022 14:10:20 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 51E13B81B80;
	Tue,  1 Nov 2022 03:10:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DF5C2C43470;
	Tue,  1 Nov 2022 03:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667272215;
	bh=00tgkg0rGEd48pHqTKhFELe6yDno6b421PHnb0VEc1k=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=a7otUj02VnDMk2Id3srJjGIysXtYVbbFgC18xDBTqO5rpdpEWTWPsE30bkNxrP0iJ
	 G6lEauI1Go1KUy0z8mKxhKBGktfyARviycOLYxaYIjok6DaGCEVb+KjZ5mJDTz3iBu
	 D2twvT66Kt4SM+TBwrkv0+GrAW40iLmyFpNY48dSCqSDYO+SKEG6KMcwnarObD12wN
	 ZwEHbxWzeYRpUgGxIAaOVDo1pM3JENoI4bEueL3pJS5LfNHBvX8sb305pjNawlOZL1
	 4E2/CkvNVR/EsnLWUaUacQ+KkJSfmEV/asRrK5KF3U1zFVlH3VVZSsj40yp1WCehj0
	 u4qSNUnEhzK1w==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id C4C05E50D71;
	Tue,  1 Nov 2022 03:10:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] Change maintainers for vnic driver
From: patchwork-bot+netdevbpf@kernel.org
Message-Id:  <166727221580.414.3977218413726824805.git-patchwork-notify@kernel.org>
Date: Tue, 01 Nov 2022 03:10:15 +0000
References: <20221028203509.4070154-1-ricklind@us.ibm.com>
In-Reply-To: <20221028203509.4070154-1-ricklind@us.ibm.com>
To: Rick Lindsley <ricklind@us.ibm.com>
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
Cc: nnac123@linux.ibm.com, netdev@vger.kernel.org, haren@linux.ibm.com, tlfalcon@linux.ibm.com, danymadden@us.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello:

This patch was applied to netdev/net.git (master)
by Jakub Kicinski <kuba@kernel.org>:

On Fri, 28 Oct 2022 13:35:11 -0700 you wrote:
> Changed maintainers for vnic driver, since Dany has new responsibilities.
> Also added Nick Child as reviewer.
> 
> Signed-off-by: Rick Lindsley <ricklind@us.ibm.com>
> 
> ---
>  MAINTAINERS | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)

Here is the summary with links:
  - Change maintainers for vnic driver
    https://git.kernel.org/netdev/net/c/e230d36f7d4c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


