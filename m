Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C91AF7BABA0
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Oct 2023 22:49:30 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=no9ws3a7;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S1kFN5tdcz3dCy
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Oct 2023 07:49:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=no9ws3a7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=kuba@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S1cYR20Sgz3c2H
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Oct 2023 03:32:59 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 61D5F61921;
	Thu,  5 Oct 2023 16:32:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB6E2C433C7;
	Thu,  5 Oct 2023 16:32:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696523576;
	bh=DwGgZF4pD8dMdjurYEUQSJd03FIsbJFkpL4uiIiTuZI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=no9ws3a7X4UxOs3t1ZnClQiQoxdBhGZlGNfhrbp5JYwIpj/luaWE1/qY2mSml/Kfv
	 zKudrb4eO3/FEIzOZYMQJKll4e2+nISBj2e5Rvu5vuQs/ZUa8I1Zn5+VpnT9OcLx2W
	 fvuvLuyWkgJ83aCEIvKvuGL1eIVFeTN24MUbRgt45QNq7GpmY3n38lq0MOtmUlI8QQ
	 iWoap0bfmYLCa2VFhE0e48qsh+nGdajFa+QB6GMzZwbrY6JBAYCgo9AWa3hcqOkaJQ
	 Qt19l3uNvUWIvQuiq1darSKlP0coe5ZIZFZXLNlx2kT97+BBmOlMO823CbI3XoIvg3
	 SR+zm46cxSuGQ==
Date: Thu, 5 Oct 2023 09:32:53 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Eric Dumazet <edumazet@google.com>
Subject: Re: [net-next PATCH v2 3/4] netdev: replace napi_reschedule with
 napi_schedule
Message-ID: <20231005093253.2e25533a@kernel.org>
In-Reply-To: <CANn89iK226C-pHUJm7HKMyEtMycGC=KCA2M6kw2KJaUj0cCT6w@mail.gmail.com>
References: <20231003145150.2498-1-ansuelsmth@gmail.com>
	<20231003145150.2498-3-ansuelsmth@gmail.com>
	<CANn89iK226C-pHUJm7HKMyEtMycGC=KCA2M6kw2KJaUj0cCT6w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Fri, 06 Oct 2023 07:46:16 +1100
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
Cc: Andrew Lunn <andrew@lunn.ch>, Sergey Ryazanov <ryazanov.s.a@gmail.com>, Ziwei Xiao <ziweixiao@google.com>, Chris Snook <chris.snook@gmail.com>, Rick Lindsley <ricklind@linux.ibm.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, Krzysztof Halasa <khalasa@piap.pl>, Yuri Karpov <YKarpov@ispras.ru>, netdev@vger.kernel.org, ath10k@lists.infradead.org, Dany Madden <danymadden@us.ibm.com>, Gregory Greenman <gregory.greenman@intel.com>, Zhengchao Shao <shaozhengchao@huawei.com>, Chiranjeevi Rapolu <chiranjeevi.rapolu@linux.intel.com>, Dawei Li <set_pte_at@outlook.com>, Intel Corporation <linuxwwan@intel.com>, Rob Herring <robh@kernel.org>, Jeroen de Borst <jeroendb@google.com>, Leon Romanovsky <leon@kernel.org>, linux-rdma@vger.kernel.org, Lee Jones <lee@kernel.org>, Haren Myneni <haren@linux.ibm.com>, linux-stm32@st-md-mailman.stormreply.com, Rushil Gupta <rushilg@google.com>, Jason Gunthorpe <jgg@ziepe.ca>, Thomas Falcon <tlfalcon@linux.ibm.com>, Jose Abreu <joabreu@synopsys.com>,
  Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@pengutronix.de>, linux-wireless@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>, Wei Fang <wei.fang@nxp.com>, Christian Marangi <ansuelsmth@gmail.com>, Wolfgang Grandegger <wg@grandegger.com>, Nick Child <nnac123@linux.ibm.com>, Simon Horman <horms@kernel.org>, Liu Haijun <haijun.liu@mediatek.com>, Kalle Valo <kvalo@kernel.org>, linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>, linux-can@vger.kernel.org, Yuanjun Gong <ruc_gongyuanjun@163.com>, Shailend Chand <shailend@google.com>, Marc Kleine-Budde <mkl@pengutronix.de>, Benjamin Berg <benjamin.berg@intel.com>, M Chetan Kumar <m.chetan.kumar@linux.intel.com>, Thomas Gleixner <tglx@linutronix.de>, Coco Li <lixiaoyan@google.com>, linux-arm-kernel@lists.infradead.org, Chandrashekar Devegowda <chandrashekar.devegowda@intel.com>, Ricardo Martinez <ricardo.martinez@linux.intel.com>, Loic Poulain <loic.poulain@linaro.org>, Zheng Zengkai <zhengzengkai@huawei.com>, Maxi
 milian Luz <luzmaximilian@gmail.com>, Anjaneyulu <pagadala.yesu.anjaneyulu@intel.com>, "Rafael J.
 Wysocki" <rafael.j.wysocki@intel.com>, Douglas Miller <dougmill@linux.ibm.com>, linux-kernel@vger.kernel.org, Tariq Toukan <tariqt@nvidia.com>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Junfeng Guo <junfeng.guo@intel.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Raju Rangoju <rajur@chelsio.com>, Praveen Kaligineedi <pkaligineedi@google.com>, Johannes Berg <johannes@sipsolutions.net>, Jeff Johnson <quic_jjohnson@quicinc.com>, "David S.
 Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 5 Oct 2023 18:11:56 +0200 Eric Dumazet wrote:
> OK, but I suspect some users of napi_reschedule() might not be race-free...

What's the race you're thinking of?
