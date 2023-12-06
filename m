Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CCE958065F1
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Dec 2023 05:01:19 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ZYE/lnhN;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SlNxT2HN8z3cXb
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Dec 2023 15:01:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ZYE/lnhN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=patchwork-bot+netdevbpf@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SlNwb28xGz3cT9
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Dec 2023 15:00:31 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id ACC4261A53;
	Wed,  6 Dec 2023 04:00:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4EAC3C433C7;
	Wed,  6 Dec 2023 04:00:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701835226;
	bh=Ch1hvqB7GoU/Da3vC7CIzaXtBMwgu6lLK49eDRsfEOE=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=ZYE/lnhNZ3fA7P/wA+eB9LFbhPHXs3kAIOnr+YOv9rCZ7ppJ3BYKlspx+veJIu9IR
	 1tlRQS64na1gSBNEEIFPG9UqDgeWg3Pzkh7R/92HmqN1NPxi17zWLTaO9Y61cgTzXF
	 ImL8dzW3qa2OpjM0VveLuVfHJ74VtOrtCgufpD1OwFK9ndVEF0GNaKnIrnG6pqU5R5
	 Jbz4BGfJON0+RNpKFFJFdJBwzRVA0W5LIzCXZ1yCu+rM2YNdydCpYqGZxpJ9duTFKY
	 pxXFLizsaqjyP1mldslbUD4XscngoE7J7MOFl2QNIYfkK+YxeNha9XX74dRmWfsoLm
	 C1zuuBh2FM9WQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 30028C41671;
	Wed,  6 Dec 2023 04:00:26 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v2 0/9] net*: Convert to platform remove callback
 returning void
From: patchwork-bot+netdevbpf@kernel.org
Message-Id:  <170183522618.32207.8967841669098706210.git-patchwork-notify@kernel.org>
Date: Wed, 06 Dec 2023 04:00:26 +0000
References: <cover.1701713943.git.u.kleine-koenig@pengutronix.de>
In-Reply-To: <cover.1701713943.git.u.kleine-koenig@pengutronix.de>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig_=3Cu=2Ekleine-koenig=40pengutronix=2Ede=3E?=@ci.codeaurora.org
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
Cc: andrew@lunn.ch, alex.aring@gmail.com, ryazanov.s.a@gmail.com, edumazet@google.com, miquel.raynal@bootlin.com, stefan@datenfreihafen.org, qiang.zhao@nxp.com, andersson@kernel.org, konrad.dybcio@linaro.org, linux@armlinux.org.uk, linux-wpan@vger.kernel.org, agross@kernel.org, kuba@kernel.org, pabeni@redhat.com, clement.leger@bootlin.com, ansuelsmth@gmail.com, nnac123@linux.ibm.com, stephan@gerhold.net, linux-arm-msm@vger.kernel.org, loic.poulain@linaro.org, mkl@pengutronix.de, linux-arm-kernel@lists.infradead.org, elder@kernel.org, netdev@vger.kernel.org, linusw@kernel.org, linux-renesas-soc@vger.kernel.org, kernel@pengutronix.de, johannes@sipsolutions.net, kaloz@openwrt.org, linuxppc-dev@lists.ozlabs.org, davem@davemloft.net, hkallweit1@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello:

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Mon,  4 Dec 2023 19:30:40 +0100 you wrote:
> Hello,
> 
> (implicit) v1 of this series can be found at
> https://lore.kernel.org/netdev/20231117095922.876489-1-u.kleine-koenig@pengutronix.de.
> Changes since then:
> 
>  - Dropped patch #1 as Alex objected. Patch #1 (was #2 before) now
>    converts ipa to remove_new() and introduces an error message in the
>    error path that failed before.
> 
> [...]

Here is the summary with links:
  - [net-next,v2,1/9] net: ipa: Convert to platform remove callback returning void
    https://git.kernel.org/netdev/net-next/c/a92dbb9cdf04
  - [net-next,v2,2/9] net: fjes: Convert to platform remove callback returning void
    https://git.kernel.org/netdev/net-next/c/2ce19934a4dc
  - [net-next,v2,3/9] net: pcs: rzn1-miic: Convert to platform remove callback returning void
    https://git.kernel.org/netdev/net-next/c/e36dc85c245f
  - [net-next,v2,4/9] net: sfp: Convert to platform remove callback returning void
    https://git.kernel.org/netdev/net-next/c/bb1afee98466
  - [net-next,v2,5/9] net: wan/fsl_ucc_hdlc: Convert to platform remove callback returning void
    https://git.kernel.org/netdev/net-next/c/2d0c06fd39be
  - [net-next,v2,6/9] net: wan/ixp4xx_hss: Convert to platform remove callback returning void
    https://git.kernel.org/netdev/net-next/c/2d8590858753
  - [net-next,v2,7/9] net: wwan: qcom_bam_dmux: Convert to platform remove callback returning void
    https://git.kernel.org/netdev/net-next/c/a06041e2f4ae
  - [net-next,v2,8/9] ieee802154: fakelb: Convert to platform remove callback returning void
    (no matching commit)
  - [net-next,v2,9/9] ieee802154: hwsim: Convert to platform remove callback returning void
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


