Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A17087B70FC
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Oct 2023 20:34:28 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=G4p7ZSrQ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S0RLV3G7Mz3vZn
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Oct 2023 05:34:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=G4p7ZSrQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com; envelope-from=ansuelsmth@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S0Fgl2Bv4z2ysB
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Oct 2023 22:18:41 +1100 (AEDT)
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-40566f8a093so7475875e9.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 03 Oct 2023 04:18:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696331917; x=1696936717; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=dRmt6j5dxjz0MCUrCJcyD2cXKQxyJFJdm8ATGNw+KGc=;
        b=G4p7ZSrQYLxb5Ps2VBvu83M6m441EVxQiebrcM9+b5SnfNskie6afsIqiFQ4a/QpbJ
         8KTmcs7TwvXXDPw8ojnCCU/TOsnEoPycUc6EhjzWl5QuaK5nNILshFCTJD5Pfj4B0dQ+
         RIYzU50vHohym9rd1iG7JAQLQlWW3FbvJ9OdbRyDmZsrKmWi0siT8/2BGypLCDclq0l1
         Ak72TrNj3O5FVOCnVffuBAi1eGFpwbn9ZxJFSKeqVisOk/DX+tppcY6GRzEMOdFGEEAy
         sJgCUDE4Vm3QKZArIbdKUjRC31pR4L5h1iQ3UuJwhHOYQ8nnLfYVTsiKCaerxMp0ZoqO
         noLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696331917; x=1696936717;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dRmt6j5dxjz0MCUrCJcyD2cXKQxyJFJdm8ATGNw+KGc=;
        b=SKdQobWiLkN2mqYjYMUART+AKbj+FuLw7mmOAe0nkD8a5QQpETlcRTWIDBzsMnLyPy
         1m8sAXJaRN11JI7sxUcbe0a8S0hiI/lq04fVHps9P/iJpHSMva/oZavIS2SZ3sN7L/uF
         xovDIHGXEFgwt1/16Ks2gHV+9Wux24ysiV8po+1Qh0K4Pm6rwByH9r73MvvXT8AmLpMo
         jCe54/9UWVoEfQt0I12jYzFpzSxYw94F2KRksJSP2pliRmKteCNl3zwUEXhqlmw+fw5d
         Endamzy76BuJmsYuI5GNonzBcIQwuJTnO1L5YRwu7K2z1X/NDaHwJGKSU5dr73Y0YOJo
         sEgw==
X-Gm-Message-State: AOJu0YypO3u0BxGFf9KcAZsjqW9rCgV0Bc8y83EIzd6q46Y8SGJKfGOe
	VnLtTxZ0e4PYrBP74wEWSDA=
X-Google-Smtp-Source: AGHT+IFLbiLzMIjYq17N9d6C9xhiAG+ijgYatVYbYzZACplv9aboPtXUhqao5fQwPpvl9QyVVVJ1HA==
X-Received: by 2002:a7b:ce89:0:b0:402:f07c:4b48 with SMTP id q9-20020a7bce89000000b00402f07c4b48mr11269565wmj.28.1696331917146;
        Tue, 03 Oct 2023 04:18:37 -0700 (PDT)
Received: from Ansuel-xps. (93-34-89-13.ip49.fastwebnet.it. [93.34.89.13])
        by smtp.gmail.com with ESMTPSA id y24-20020a05600c365800b0040652e8ca13sm9195716wmq.43.2023.10.03.04.18.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Oct 2023 04:18:36 -0700 (PDT)
Message-ID: <651bf88c.050a0220.3a982.31fc@mx.google.com>
X-Google-Original-Message-ID: <ZRv4iZmOuLubYSiN@Ansuel-xps.>
Date: Tue, 3 Oct 2023 13:18:33 +0200
From: Christian Marangi <ansuelsmth@gmail.com>
To: Marc Kleine-Budde <mkl@pengutronix.de>
Subject: Re: [net-next PATCH 3/4] netdev: replace napi_reschedule with
 napi_schedule
References: <20231002151023.4054-1-ansuelsmth@gmail.com>
 <20231002151023.4054-3-ansuelsmth@gmail.com>
 <20231003-living-seltzer-172ea6aec629-mkl@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231003-living-seltzer-172ea6aec629-mkl@pengutronix.de>
X-Mailman-Approved-At: Wed, 04 Oct 2023 05:32:24 +1100
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
Cc: Andrew Lunn <andrew@lunn.ch>, Sergey Ryazanov <ryazanov.s.a@gmail.com>, Ziwei Xiao <ziweixiao@google.com>, Chris Snook <chris.snook@gmail.com>, Rick Lindsley <ricklind@linux.ibm.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>, Lee Jones <lee@kernel.org>, Dany Madden <danymadden@us.ibm.com>, Gregory Greenman <gregory.greenman@intel.com>, Zhengchao Shao <shaozhengchao@huawei.com>, Chiranjeevi Rapolu <chiranjeevi.rapolu@linux.intel.com>, Dawei Li <set_pte_at@outlook.com>, Intel Corporation <linuxwwan@intel.com>, Rob Herring <robh@kernel.org>, Jeroen de Borst <jeroendb@google.com>, Leon Romanovsky <leon@kernel.org>, linux-rdma@vger.kernel.org, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Haren Myneni <haren@linux.ibm.com>, linux-stm32@st-md-mailman.stormreply.com, Rushil Gupta <rushilg@google.com>, Jason Gunthorpe <jgg@ziepe.ca>, Thomas Falcon <tlfalcon@linux.ibm.com>, Jose Abreu <joabreu@synopsys.com>, Alex
  Elder <elder@linaro.org>, linux-wireless@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Wei Fang <wei.fang@nxp.com>, Wolfgang Grandegger <wg@grandegger.com>, Nick Child <nnac123@linux.ibm.com>, Simon Horman <horms@kernel.org>, Liu Haijun <haijun.liu@mediatek.com>, Kalle Valo <kvalo@kernel.org>, Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>, Bailey Forrest <bcf@google.com>, Nicholas Piggin <npiggin@gmail.com>, linux-can@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>, Yuanjun Gong <ruc_gongyuanjun@163.com>, Shailend Chand <shailend@google.com>, Krzysztof Halasa <khalasa@piap.pl>, Benjamin Berg <benjamin.berg@intel.com>, M Chetan Kumar <m.chetan.kumar@linux.intel.com>, Thomas Gleixner <tglx@linutronix.de>, Yuri Karpov <YKarpov@ispras.ru>, linux-arm-kernel@lists.infradead.org, Chandrashekar Devegowda <chandrashekar.devegowda@intel.com>, Ricardo Martinez <ricardo.martinez@linux.intel.com>, Loic Poulain <loic.poulain@linar
 o.org>, Zheng Zengkai <zhengzengkai@huawei.com>, netdev@vger.kernel.org, Anjaneyulu <pagadala.yesu.anjaneyulu@intel.com>, linuxppc-dev@lists.ozlabs.org, Douglas Miller <dougmill@linux.ibm.com>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, Tariq Toukan <tariqt@nvidia.com>, Junfeng Guo <junfeng.guo@intel.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Raju Rangoju <rajur@chelsio.com>, Praveen Kaligineedi <pkaligineedi@google.com>, Johannes Berg <johannes@sipsolutions.net>, ath10k@lists.infradead.org, Jeff Johnson <quic_jjohnson@quicinc.com>, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Oct 03, 2023 at 09:16:33AM +0200, Marc Kleine-Budde wrote:
> On 02.10.2023 17:10:22, Christian Marangi wrote:
> > Now that napi_schedule return a bool, we can drop napi_reschedule that
> > does the same exact function. The function comes from a very old commit
> > bfe13f54f502 ("ibm_emac: Convert to use napi_struct independent of struct
> > net_device") and the purpose is actually deprecated in favour of
> > different logic.
> > 
> > Convert every user of napi_reschedule to napi_schedule.
> > 
> > Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> > ---
> >  drivers/infiniband/ulp/ipoib/ipoib_ib.c                |  4 ++--
> >  drivers/net/can/dev/rx-offload.c                       |  2 +-
> 
> Acked-by: Marc Kleine-Budde # for can/dev/rx-offload.c

Just to make sure can I use the correct tag: (you didn't include the
mail)

Acked-by: Marc Kleine-Budde <mkl@pengutronix.de> # for can/dev/rx-offload.c

?

-- 
	Ansuel
