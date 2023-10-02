Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 85E777B5D74
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Oct 2023 00:58:27 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=YPx5MEwF;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RzxFY2TH8z3w0m
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Oct 2023 09:58:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=YPx5MEwF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=kuba@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RzwRY63n3z3c7s
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Oct 2023 09:22:01 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 7867BCE12DC;
	Mon,  2 Oct 2023 22:21:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFC12C433C8;
	Mon,  2 Oct 2023 22:21:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696285314;
	bh=CGV3l4m1Fsxjo5KVleucQ9ACIj7qp3IjWnhkCyY4rZo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=YPx5MEwF/HCg5A6rfAedz2iYizSQOXr/9gtMzV+E2dlwiqJvuiHqVp6YRtAwC9ZlS
	 iOAwE9rZIHCPbdG0ZKTqccGsZvdmJOo/00bYzDZF8QdQBQe94QFgEyvtBE9hUE1ZhX
	 FPhADmeOCjSVgRUmxviHjBL7ROHTUtdiWaeb4uQfNFQMva2lL3M61UoF3ATuxEMgMo
	 Uj/iFCrNIKmeNh9SROF1KxJx/VsHoXbgWm43eAwiShXr57QIf5n+H60C5Q59nRGkQM
	 Fnuq18MhzNA8vdaj3zP3dQsTNCYa/h7xuzPe+Ktf6dcjXsvZ3NikpBFsjOaB3zpmQy
	 FO3A4oVVbVVRw==
Date: Mon, 2 Oct 2023 15:21:42 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Subject: Re: [net-next PATCH 1/4] netdev: replace simple
 napi_schedule_prep/__napi_schedule to napi_schedule
Message-ID: <20231002152142.4e8e2cfb@kernel.org>
In-Reply-To: <20231002151023.4054-1-ansuelsmth@gmail.com>
References: <20231002151023.4054-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Tue, 03 Oct 2023 09:51:27 +1100
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
Cc: Andrew Lunn <andrew@lunn.ch>, Sergey Ryazanov <ryazanov.s.a@gmail.com>, Ziwei Xiao <ziweixiao@google.com>, Chris Snook <chris.snook@gmail.com>, Rick Lindsley <ricklind@linux.ibm.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-kernel@vger.kernel.org, Krzysztof Halasa <khalasa@piap.pl>, Eric Dumazet <edumazet@google.com>, Lee Jones <lee@kernel.org>, Dany Madden <danymadden@us.ibm.com>, Gregory Greenman <gregory.greenman@intel.com>, Zhengchao Shao <shaozhengchao@huawei.com>, Chiranjeevi Rapolu <chiranjeevi.rapolu@linux.intel.com>, Dawei Li <set_pte_at@outlook.com>, Intel Corporation <linuxwwan@intel.com>, Rob Herring <robh@kernel.org>, Jeroen de Borst <jeroendb@google.com>, Leon Romanovsky <leon@kernel.org>, linux-rdma@vger.kernel.org, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Haren Myneni <haren@linux.ibm.com>, linux-stm32@st-md-mailman.stormreply.com, Rushil Gupta <rushilg@google.com>, Jason Gunthorpe <jgg@ziepe.ca>, Thomas Falcon <tlfalcon@linux.ibm.com>, Jos
 e Abreu <joabreu@synopsys.com>, Alex Elder <elder@linaro.org>, linux-wireless@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>, Wei Fang <wei.fang@nxp.com>, Wolfgang Grandegger <wg@grandegger.com>, Nick Child <nnac123@linux.ibm.com>, Simon Horman <horms@kernel.org>, Liu Haijun <haijun.liu@mediatek.com>, Kalle Valo <kvalo@kernel.org>, Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@pengutronix.de>, Bailey Forrest <bcf@google.com>, Nicholas Piggin <npiggin@gmail.com>, linux-can@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>, Yuanjun Gong <ruc_gongyuanjun@163.com>, Shailend Chand <shailend@google.com>, Marc Kleine-Budde <mkl@pengutronix.de>, Benjamin Berg <benjamin.berg@intel.com>, M Chetan Kumar <m.chetan.kumar@linux.intel.com>, Thomas Gleixner <tglx@linutronix.de>, Yuri Karpov <YKarpov@ispras.ru>, linux-arm-kernel@lists.infradead.org, Chandrashekar Devegowda <chandrashekar.devegowda@intel.com>, Ricardo Martinez <ricardo.martinez@linux.intel.com>, Loic Poulain <loic.poulai
 n@linaro.org>, Zheng Zengkai <zhengzengkai@huawei.com>, netdev@vger.kernel.org, Anjaneyulu <pagadala.yesu.anjaneyulu@intel.com>, linuxppc-dev@lists.ozlabs.org, Douglas Miller <dougmill@linux.ibm.com>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, Tariq Toukan <tariqt@nvidia.com>, Junfeng Guo <junfeng.guo@intel.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Raju Rangoju <rajur@chelsio.com>, Praveen Kaligineedi <pkaligineedi@google.com>, Johannes Berg <johannes@sipsolutions.net>, ath10k@lists.infradead.org, Jeff Johnson <quic_jjohnson@quicinc.com>, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon,  2 Oct 2023 17:10:20 +0200 Christian Marangi wrote:
>  			queue_work(priv->xfer_wq, &priv->rx_work);
> -		else if (napi_schedule_prep(&priv->napi))
> -			__napi_schedule(&priv->napi);
> +		else
> +			napi_schedule(&priv->napi)

Missing semi-colon, please make sure each patch builds cleanly 
with allmodconfig.
-- 
pw-bot: cr
