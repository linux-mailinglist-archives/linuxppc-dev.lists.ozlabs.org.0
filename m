Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E742B7C61FD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Oct 2023 02:52:58 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=VE5CUTDP;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S5WMX6Gj3z3dCy
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Oct 2023 11:52:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=VE5CUTDP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=patchwork-bot+netdevbpf@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S5W5H0K28z30GC
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Oct 2023 11:40:34 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C88A761B46;
	Thu, 12 Oct 2023 00:40:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 83E1DC43391;
	Thu, 12 Oct 2023 00:40:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697071229;
	bh=wGHJyiALp3GFYTvWaoHxyso+f2Vuj4QGs+ejJHlDf/k=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=VE5CUTDPsvYyqkldEDqOEXMVmFtYsTPZSIVSOrPhdqUiu+qC0gTSFu6e4mo37ejhQ
	 /nJHSRLR/5Uq37Vk7V8G+nOXlNvk8vH6E7h/jFJuVqHPRQONGS0TzuyWGyPhojUAH7
	 Y4urAQ4NY7DQHqZIv7DL90hwQTF8/SrBLn8tcK2EKIaO4+tESHK8SoJsiMlOStfslk
	 O/7RUIjozO0FXUzHR0diff2R+Z5LRSigjR9sS4lydG4rj6L1lOXawWzS/iyDrc3/8u
	 ubZ2+bqVueHFdmEqJE9Vi1b+9kyKU6EIaNcULLSEz66GZICCGoNPjSU3dE+Xj/HwlZ
	 8gXY0TDIzUzzA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 5A538E21ED9;
	Thu, 12 Oct 2023 00:40:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [net-next v3 1/5] netdev: replace simple
 napi_schedule_prep/__napi_schedule to napi_schedule
From: patchwork-bot+netdevbpf@kernel.org
Message-Id:  <169707122936.23011.6924255297609142862.git-patchwork-notify@kernel.org>
Date: Thu, 12 Oct 2023 00:40:29 +0000
References: <20231009133754.9834-1-ansuelsmth@gmail.com>
In-Reply-To: <20231009133754.9834-1-ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>
X-Mailman-Approved-At: Thu, 12 Oct 2023 11:52:14 +1100
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
Cc: andrew@lunn.ch, ryazanov.s.a@gmail.com, ziweixiao@google.com, chris.snook@gmail.com, ricklind@linux.ibm.com, alexandre.torgue@foss.st.com, linux-kernel@vger.kernel.org, khalasa@piap.pl, edumazet@google.com, ath10k@lists.infradead.org, danymadden@us.ibm.com, gregory.greenman@intel.com, set_pte_at@outlook.com, chiranjeevi.rapolu@linux.intel.com, linux-stm32@st-md-mailman.stormreply.com, linuxwwan@intel.com, robh@kernel.org, jeroendb@google.com, leon@kernel.org, linux-rdma@vger.kernel.org, haren@linux.ibm.com, rushilg@google.com, jgg@ziepe.ca, tlfalcon@linux.ibm.com, joabreu@synopsys.com, elder@linaro.org, linux-wireless@vger.kernel.org, kuba@kernel.org, pabeni@redhat.com, wg@grandegger.com, nnac123@linux.ibm.com, bhupesh.sharma@linaro.org, haijun.liu@mediatek.com, kvalo@kernel.org, u.kleine-koenig@pengutronix.de, bcf@google.com, npiggin@gmail.com, linux-can@vger.kernel.org, ruc_gongyuanjun@163.com, shailend@google.com, mkl@pengutronix.de, benjamin.berg@intel.com, m.chetan.kumar@lin
 ux.intel.com, tglx@linutronix.de, YKarpov@ispras.ru, linux-arm-kernel@lists.infradead.org, chandrashekar.devegowda@intel.com, ricardo.martinez@linux.intel.com, loic.poulain@linaro.org, zhengzengkai@huawei.com, netdev@vger.kernel.org, pagadala.yesu.anjaneyulu@intel.com, linuxppc-dev@lists.ozlabs.org, dougmill@linux.ibm.com, gustavoars@kernel.org, tariqt@nvidia.com, horms@kernel.org, krzysztof.kozlowski@linaro.org, junfeng.guo@intel.com, mcoquelin.stm32@gmail.com, rajur@chelsio.com, pkaligineedi@google.com, johannes@sipsolutions.net, quic_jjohnson@quicinc.com, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello:

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Mon,  9 Oct 2023 15:37:50 +0200 you wrote:
> Replace drivers that still use napi_schedule_prep/__napi_schedule
> with napi_schedule helper as it does the same exact check and call.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> Reviewed-by: Eric Dumazet <edumazet@google.com>
> ---
> Changes v3:
> - Add Reviewed-by tag
> Changes v2:
> - Add missing semicolon
> 
> [...]

Here is the summary with links:
  - [net-next,v3,1/5] netdev: replace simple napi_schedule_prep/__napi_schedule to napi_schedule
    https://git.kernel.org/netdev/net-next/c/ef724517b596
  - [net-next,v3,2/5] netdev: make napi_schedule return bool on NAPI successful schedule
    https://git.kernel.org/netdev/net-next/c/0a779003213b
  - [net-next,v3,3/5] netdev: replace napi_reschedule with napi_schedule
    https://git.kernel.org/netdev/net-next/c/73382e919f3d
  - [net-next,v3,4/5] net: tc35815: rework network interface interrupt logic
    https://git.kernel.org/netdev/net-next/c/be176234d0a8
  - [net-next,v3,5/5] netdev: use napi_schedule bool instead of napi_schedule_prep/__napi_schedule
    https://git.kernel.org/netdev/net-next/c/d1fea38f01ac

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


