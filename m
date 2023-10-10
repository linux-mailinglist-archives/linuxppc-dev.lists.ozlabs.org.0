Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7827C7BF959
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Oct 2023 13:12:08 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=L5xNj/EN;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S4YBt3Xbdz30hY
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Oct 2023 22:12:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=L5xNj/EN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com; envelope-from=ttoukan.linux@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S4Sq70152z30Q4
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Oct 2023 18:54:42 +1100 (AEDT)
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4054496bde3so49597155e9.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Oct 2023 00:54:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696924476; x=1697529276; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iwwM7auPgZJMU7dH/X5o56/hwua6iH2A1QFl6/0EOd0=;
        b=L5xNj/ENDOiydMI8Ph91SmLSqOq8QNx4O5jYixWkp/BviNYq5AMZMQeuFo7acupijH
         c99KzyN17sm/1GrkjOJAB5K8VAvYbwtq5mSG3lDPqwea0YVkMbuBBsnMYqqkQd5D5cRo
         5paNh9yHuRHUyxspNjQQDCCv6YyNdM68Y6gLyP0c6d8yTARnbGERSy914q5111G4IX5V
         rwqBmR8nEYEwEHv9ASg9hL9QjZVTKeBUyRpDAm+4ADOX2fj5yuR040nUCNgRSIfNFoDL
         gMJvm5GGr2Jb/HRupqKxjz1tgxJfsIqSjr0D8v2Jig8otb1rY7sTXLYoFe5v3xwJDrjI
         1KCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696924476; x=1697529276;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iwwM7auPgZJMU7dH/X5o56/hwua6iH2A1QFl6/0EOd0=;
        b=ox0/zYgYv8DLa91hL1qoIOxYECOgBfXdmT4YjZTCpinG6eYg3a+C2P13aZ3+90RHeZ
         eX7YSDq5oRZphYF0uOaDJ5G188PHavsCj0DVDGOKlLvUvoaZSmk+1t7iFsebmodktANC
         BKB0fdm88DQlxP2ftSWP6iP3jemVYuh1WSsLpt2XnH38FO1WBFwusTCNRmi8/ZVg8UUW
         gasenVNxmVmX69W2UP+lOPpzaVFUGc8vRAZ9O2TYPAJpxg/8eRaaI4Fhxda1l5sPfQUs
         4vCz4A7M6Ad3ZBTBiVBjU9VLuABlRyoWLUI1ohG7o4pvMVbQaP16DY3nwUoa7pdlKLOe
         jTtA==
X-Gm-Message-State: AOJu0Yzim6MSnFhX0kUoRWFa07dq/qCBuDqNqxzrOJClIHRniJpSVwws
	84b4DelI7ztqyCugs97scBc=
X-Google-Smtp-Source: AGHT+IFoXHF3xhB1R1QbXfa6gtatnLXym3Q5nnEunh6zFeATAVA0tqJjWKSQ447yVOYMirHfwQlOJg==
X-Received: by 2002:a5d:500b:0:b0:319:8a66:f695 with SMTP id e11-20020a5d500b000000b003198a66f695mr13345455wrt.55.1696924475419;
        Tue, 10 Oct 2023 00:54:35 -0700 (PDT)
Received: from [192.168.0.101] ([77.126.80.27])
        by smtp.gmail.com with ESMTPSA id z3-20020a056000110300b0031c6581d55esm11802488wrw.91.2023.10.10.00.54.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Oct 2023 00:54:35 -0700 (PDT)
Message-ID: <f288a1cd-0e15-4301-8522-d46840dd2d93@gmail.com>
Date: Tue, 10 Oct 2023 10:54:26 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [net-next v3 3/5] netdev: replace napi_reschedule with
 napi_schedule
Content-Language: en-US
To: Christian Marangi <ansuelsmth@gmail.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Leon Romanovsky <leon@kernel.org>, Wolfgang Grandegger <wg@grandegger.com>,
 Marc Kleine-Budde <mkl@pengutronix.de>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Chris Snook <chris.snook@gmail.com>, Raju Rangoju <rajur@chelsio.com>,
 Jeroen de Borst <jeroendb@google.com>,
 Praveen Kaligineedi <pkaligineedi@google.com>,
 Shailend Chand <shailend@google.com>, Douglas Miller
 <dougmill@linux.ibm.com>, Nick Child <nnac123@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Haren Myneni <haren@linux.ibm.com>, Rick Lindsley <ricklind@linux.ibm.com>,
 Dany Madden <danymadden@us.ibm.com>, Thomas Falcon <tlfalcon@linux.ibm.com>,
 Tariq Toukan <tariqt@nvidia.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Halasa <khalasa@piap.pl>, Kalle Valo <kvalo@kernel.org>,
 Jeff Johnson <quic_jjohnson@quicinc.com>,
 Gregory Greenman <gregory.greenman@intel.com>,
 Chandrashekar Devegowda <chandrashekar.devegowda@intel.com>,
 Intel Corporation <linuxwwan@intel.com>,
 Chiranjeevi Rapolu <chiranjeevi.rapolu@linux.intel.com>,
 Liu Haijun <haijun.liu@mediatek.com>,
 M Chetan Kumar <m.chetan.kumar@linux.intel.com>,
 Ricardo Martinez <ricardo.martinez@linux.intel.com>,
 Loic Poulain <loic.poulain@linaro.org>,
 Sergey Ryazanov <ryazanov.s.a@gmail.com>,
 Johannes Berg <johannes@sipsolutions.net>,
 Yuanjun Gong <ruc_gongyuanjun@163.com>, Alex Elder <elder@linaro.org>,
 Bhupesh Sharma <bhupesh.sharma@linaro.org>, Simon Horman <horms@kernel.org>,
 Rob Herring <robh@kernel.org>, Bailey Forrest <bcf@google.com>,
 Junfeng Guo <junfeng.guo@intel.com>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Ziwei Xiao <ziweixiao@google.com>, Rushil Gupta <rushilg@google.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Yuri Karpov <YKarpov@ispras.ru>, Andrew Lunn <andrew@lunn.ch>,
 Zheng Zengkai <zhengzengkai@huawei.com>, Dawei Li <set_pte_at@outlook.com>,
 Anjaneyulu <pagadala.yesu.anjaneyulu@intel.com>,
 Benjamin Berg <benjamin.berg@intel.com>, linux-rdma@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-can@vger.kernel.org,
 netdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, ath10k@lists.infradead.org,
 linux-wireless@vger.kernel.org
References: <20231009133754.9834-1-ansuelsmth@gmail.com>
 <20231009133754.9834-3-ansuelsmth@gmail.com>
From: Tariq Toukan <ttoukan.linux@gmail.com>
In-Reply-To: <20231009133754.9834-3-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Tue, 10 Oct 2023 22:11:22 +1100
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 09/10/2023 16:37, Christian Marangi wrote:
> Now that napi_schedule return a bool, we can drop napi_reschedule that
> does the same exact function. The function comes from a very old commit
> bfe13f54f502 ("ibm_emac: Convert to use napi_struct independent of struct
> net_device") and the purpose is actually deprecated in favour of
> different logic.
> 
> Convert every user of napi_reschedule to napi_schedule.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com> # ath10k
> Acked-by: Nick Child <nnac123@linux.ibm.com> # ibm
> Acked-by: Marc Kleine-Budde <mkl@pengutronix.de> # for can/dev/rx-offload.c
> Reviewed-by: Eric Dumazet <edumazet@google.com>
> ---
> Changes v3:
> - Add Reviewed-by tag
> Changes v2:
> - Add ack tag
> ---
>   drivers/infiniband/ulp/ipoib/ipoib_ib.c                |  4 ++--
>   drivers/net/can/dev/rx-offload.c                       |  2 +-
>   drivers/net/ethernet/chelsio/cxgb4/sge.c               |  2 +-
>   drivers/net/ethernet/chelsio/cxgb4vf/sge.c             |  2 +-
>   drivers/net/ethernet/ezchip/nps_enet.c                 |  2 +-
>   drivers/net/ethernet/google/gve/gve_main.c             |  2 +-
>   drivers/net/ethernet/ibm/ehea/ehea_main.c              |  2 +-
>   drivers/net/ethernet/ibm/emac/mal.c                    |  2 +-
>   drivers/net/ethernet/ibm/ibmveth.c                     |  2 +-
>   drivers/net/ethernet/ibm/ibmvnic.c                     |  2 +-
>   drivers/net/ethernet/mellanox/mlx4/en_rx.c             |  2 +-
>   drivers/net/ethernet/ni/nixge.c                        |  2 +-
>   drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c |  2 +-
>   drivers/net/ethernet/xscale/ixp4xx_eth.c               |  4 ++--
>   drivers/net/fjes/fjes_main.c                           |  2 +-
>   drivers/net/wan/ixp4xx_hss.c                           |  4 ++--
>   drivers/net/wireless/ath/ath10k/pci.c                  |  2 +-
>   drivers/net/wwan/t7xx/t7xx_hif_dpmaif_rx.c             |  2 +-
>   include/linux/netdevice.h                              | 10 ----------
>   19 files changed, 21 insertions(+), 31 deletions(-)
> 

...

> diff --git a/drivers/net/ethernet/mellanox/mlx4/en_rx.c b/drivers/net/ethernet/mellanox/mlx4/en_rx.c
> index 332472fe4990..a09b6e05337d 100644
> --- a/drivers/net/ethernet/mellanox/mlx4/en_rx.c
> +++ b/drivers/net/ethernet/mellanox/mlx4/en_rx.c
> @@ -400,7 +400,7 @@ void mlx4_en_recover_from_oom(struct mlx4_en_priv *priv)
>   	for (ring = 0; ring < priv->rx_ring_num; ring++) {
>   		if (mlx4_en_is_ring_empty(priv->rx_ring[ring])) {
>   			local_bh_disable();
> -			napi_reschedule(&priv->rx_cq[ring]->napi);
> +			napi_schedule(&priv->rx_cq[ring]->napi);
>   			local_bh_enable();
>   		}
>   	}

For mlx4 part:
Acked-by: Tariq Toukan <tariqt@nvidia.com>

