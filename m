Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8974D7B60F1
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Oct 2023 08:46:58 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=MnCuCkWb;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S07f83Sx6z3vY3
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Oct 2023 17:46:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=MnCuCkWb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::52b; helo=mail-ed1-x52b.google.com; envelope-from=edumazet@google.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S05mF2ddjz30fd
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Oct 2023 16:22:03 +1100 (AEDT)
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-537f07dfe8eso5243a12.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 02 Oct 2023 22:22:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1696310518; x=1696915318; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XqpR6B8+nR6pcymfGZfMhsWiKXO7OC+lMbowiW4LVxc=;
        b=MnCuCkWbnATrS/TN62x1vlkxql5XT5aUknpQiI2ufsQLvNy/QZ9Hv+75H/s1aslJyp
         926kByvrzahClh9w1IE5z2wgs2u+YN6qk0cYTgBudJs5G+J2eER4eth5ueiSrhxtaVyg
         4G+uhUOqX7GFkW4z3xPRlpqNnfDKHawEo5ZwUs9oa+Wr83HKUFVRDnB40MEVowWCsnJa
         j0YmYjD8NVAP86bygWwRXWevOMnshz/f3poy61Zs1sftOT2fETPgzD5P/QFA6q68s/AQ
         EjrgSNSAZEd3j3/3ZRGuzI39Qy3tb0of5iEDhiPczpNZ4TaxklCMOYLwhrSrYyfWjIC+
         wZ6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696310518; x=1696915318;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XqpR6B8+nR6pcymfGZfMhsWiKXO7OC+lMbowiW4LVxc=;
        b=ej8giI46LkM+rPDVcy2EA3K5pAt06cPty9wrMC2JylxUXS0DODLBOa9fBzirGvjbHy
         IYwsBY+9jf0qgf0C5dmeTkFWZ6eLE/oNFuNoIr2M2GfP/UIoBIbIpcSBCzoYgW2UFvuu
         yrhUyH5ZQj2KvaJoiCbO1Gn+zvr53QgTATbSAeq4A1XCMm4a6oFdcCcFG8rnJpxNa3UG
         25IyU2XOYTskGnOmyOZO51kNiA3lkG5ompisZiPFRZsmVCfZhFC7TophwpTuiphxCq4F
         NdK3BDjyML66w3jJhXdnN+KRlby8dNo02J3tf1hX7JwPdGNVsyeW4o10X6oO8KHTSOdG
         s7Jw==
X-Gm-Message-State: AOJu0YzTwUaaN2aTgAxuTEWlgXmoWnf1ffTEGaQAMf8dlDmuyKlCQ8d9
	bjA90pG77+N5mM486iLCQeAMP50voYNfqALLo/CQcw==
X-Google-Smtp-Source: AGHT+IFKI0HKrYVLDl5vmsJpfAS1RFLGp2hw35YvLJzj9lzKha+Fza93n9nqgIQgLugkI+eoDblKihBS9oaXtRjP+8s=
X-Received: by 2002:a50:d4d7:0:b0:538:1d3b:172f with SMTP id
 e23-20020a50d4d7000000b005381d3b172fmr49263edj.3.1696310517644; Mon, 02 Oct
 2023 22:21:57 -0700 (PDT)
MIME-Version: 1.0
References: <20231002151023.4054-1-ansuelsmth@gmail.com> <20231002151023.4054-2-ansuelsmth@gmail.com>
In-Reply-To: <20231002151023.4054-2-ansuelsmth@gmail.com>
From: Eric Dumazet <edumazet@google.com>
Date: Tue, 3 Oct 2023 07:21:46 +0200
Message-ID: <CANn89i+eSWYuE=wE1TPJFtAS1OCfFYytC_nAjDWkizxmR9e6JQ@mail.gmail.com>
Subject: Re: [net-next PATCH 2/4] netdev: make napi_schedule return bool on
 NAPI successful schedule
To: Christian Marangi <ansuelsmth@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Tue, 03 Oct 2023 17:46:13 +1100
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
Cc: Andrew Lunn <andrew@lunn.ch>, Sergey Ryazanov <ryazanov.s.a@gmail.com>, Ziwei Xiao <ziweixiao@google.com>, Chris Snook <chris.snook@gmail.com>, Rick Lindsley <ricklind@linux.ibm.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-kernel@vger.kernel.org, Krzysztof Halasa <khalasa@piap.pl>, Yuri Karpov <YKarpov@ispras.ru>, Lee Jones <lee@kernel.org>, Dany Madden <danymadden@us.ibm.com>, Gregory Greenman <gregory.greenman@intel.com>, Zhengchao Shao <shaozhengchao@huawei.com>, Chiranjeevi Rapolu <chiranjeevi.rapolu@linux.intel.com>, Dawei Li <set_pte_at@outlook.com>, Intel Corporation <linuxwwan@intel.com>, Rob Herring <robh@kernel.org>, Jeroen de Borst <jeroendb@google.com>, Leon Romanovsky <leon@kernel.org>, linux-rdma@vger.kernel.org, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Haren Myneni <haren@linux.ibm.com>, linux-stm32@st-md-mailman.stormreply.com, Rushil Gupta <rushilg@google.com>, Jason Gunthorpe <jgg@ziepe.ca>, Thomas Falcon <tlfalcon@linux.ibm.com>, Jose A
 breu <joabreu@synopsys.com>, Alex Elder <elder@linaro.org>, linux-wireless@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Wei Fang <wei.fang@nxp.com>, Wolfgang Grandegger <wg@grandegger.com>, Nick Child <nnac123@linux.ibm.com>, Simon Horman <horms@kernel.org>, Liu Haijun <haijun.liu@mediatek.com>, Kalle Valo <kvalo@kernel.org>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, Bailey Forrest <bcf@google.com>, Nicholas Piggin <npiggin@gmail.com>, linux-can@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>, Yuanjun Gong <ruc_gongyuanjun@163.com>, Shailend Chand <shailend@google.com>, Marc Kleine-Budde <mkl@pengutronix.de>, Benjamin Berg <benjamin.berg@intel.com>, M Chetan Kumar <m.chetan.kumar@linux.intel.com>, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, Chandrashekar Devegowda <chandrashekar.devegowda@intel.com>, Ricardo Martinez <ricardo.martinez@linux.intel.com>, Loic Poulain <loic.poulain@l
 inaro.org>, Zheng Zengkai <zhengzengkai@huawei.com>, netdev@vger.kernel.org, Anjaneyulu <pagadala.yesu.anjaneyulu@intel.com>, linuxppc-dev@lists.ozlabs.org, Douglas Miller <dougmill@linux.ibm.com>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, Tariq Toukan <tariqt@nvidia.com>, Junfeng Guo <junfeng.guo@intel.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Raju Rangoju <rajur@chelsio.com>, Praveen Kaligineedi <pkaligineedi@google.com>, Johannes Berg <johannes@sipsolutions.net>, ath10k@lists.infradead.org, Jeff Johnson <quic_jjohnson@quicinc.com>, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Oct 2, 2023 at 5:10=E2=80=AFPM Christian Marangi <ansuelsmth@gmail.=
com> wrote:
>
> Change napi_schedule to return a bool on NAPI successful schedule. This
> might be useful for some driver to do additional step after a NAPI ahs

This might be useful for some drivers to do additional steps after a
NAPI has been scheduled.

> been scheduled.
>
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>

Yeah, I guess you forgot to mention I suggested this patch ...

Reviewed-by: Eric Dumazet <edumazet@google.com>
