Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B148E486589
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jan 2022 14:50:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JV76J5067z3bVc
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jan 2022 00:50:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=hXHNk4mx;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org;
 envelope-from=patchwork-bot+netdevbpf@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=hXHNk4mx; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JV75d6ckYz2x9P
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Jan 2022 00:50:13 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B2E4861C19;
 Thu,  6 Jan 2022 13:50:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E32E0C36AF3;
 Thu,  6 Jan 2022 13:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1641477009;
 bh=xXCkLiQRvcLtcwQnqeQGnbErIHJb2qOUr3F3LiGUgZA=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=hXHNk4mxtbOyueeO0+wRS/REaOCtmy3u2orqFlGLn7ur3RxsL2DLOxeJENStWXPdE
 hxxOm8uoqyvzkEEptvC4ONz4nmKj/oEQ4hOLg7uFSE9NOJ7+qZtbbQKWlfG2HHkGB9
 i8fSEZSzcKU6jQaElZSXtmrwcvEXKu3WMEMf7VO4hplOBz6dKYan9aAfcC6au8itHl
 NQPxSxAgZa6rlqed7BzTO6BoO4rrWKUMFZtrsfpYFM9/9CD+GTYf041pnmPC4zcbad
 cTNESK7AkrM8WhE/YVPOYaSNLYU28uyewY9ZCi7tKB8K+eHjGOhpR2RL8xKSKg27Xf
 tumjQuVkeoZuA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 CC129F79403; Thu,  6 Jan 2022 13:50:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] ethernet: ibmveth: use default_groups in kobj_type
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <164147700982.9137.17250987780109904845.git-patchwork-notify@kernel.org>
Date: Thu, 06 Jan 2022 13:50:09 +0000
References: <20220105184101.2859410-1-gregkh@linuxfoundation.org>
In-Reply-To: <20220105184101.2859410-1-gregkh@linuxfoundation.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
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
 netdev@vger.kernel.org, paulus@samba.org, kuba@kernel.org,
 linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello:

This patch was applied to netdev/net-next.git (master)
by David S. Miller <davem@davemloft.net>:

On Wed,  5 Jan 2022 19:41:01 +0100 you wrote:
> There are currently 2 ways to create a set of sysfs files for a
> kobj_type, through the default_attrs field, and the default_groups
> field.  Move the ibmveth sysfs code to use default_groups
> field which has been the preferred way since aa30f47cf666 ("kobject: Add
> support for default attribute groups to kobj_type") so that we can soon
> get rid of the obsolete default_attrs field.
> 
> [...]

Here is the summary with links:
  - ethernet: ibmveth: use default_groups in kobj_type
    https://git.kernel.org/netdev/net-next/c/c288bc0db2d1

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


