Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C8A3C7BABA1
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Oct 2023 22:50:20 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=4Gbiq94z;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S1kGL5q6Nz3vf2
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Oct 2023 07:50:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=4Gbiq94z;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com; envelope-from=edumazet@google.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S1cl33sDGz3cN6
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Oct 2023 03:41:18 +1100 (AEDT)
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-405459d9a96so1955e9.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 05 Oct 2023 09:41:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1696524075; x=1697128875; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kKTDRIoUmCSN9wKAZkd+bxIJEDblkCbUKypHY3ps4Iw=;
        b=4Gbiq94zQfZu4LzLZMFDFYJ8msFuBtwoTs1lPhAaR/KiS359h2apV9yVNB7gkqcnBF
         QBJAuzNHrYCJvMbmd88G7+vuAmNL1KsEEXAyY11zPsParRRZ/61KtpsM+wyJ2PB/YiV8
         A9cw2uymzgurBFHcM7RAL5M+i7+3U7IZiJrEfdP+IICHwn6HapgpL8txSsn13SKyS/2D
         RZnLRmsInHL62whAuRixeaepaGGPYYvttgMEGO6Eo/2GOKlg4u+voF3ig372CprtRYOX
         5C/WRxGlD9XXVy193UPA4Lz4bltot4hc9WIvuMF0WzHIJOfd9r3QA0c2lM4GCAjikS0W
         r2iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696524075; x=1697128875;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kKTDRIoUmCSN9wKAZkd+bxIJEDblkCbUKypHY3ps4Iw=;
        b=bCzfcR8nVGVaXMKkWTBjiiJOgAQpYBbcNEyPYtfkFpSbL/c4e7lPr/FRCoU9P4Ay8D
         92prhpa3JhVLJ/EVphlEPFk/ZvuAHmsW1r3y2oTucgKiH4FPxXyA8OsMPvVkBbYJ8fsh
         LGFT+Z6MPSmhmLUYCqY7CM0WNCWXrTyUp2qe+TEccfCovh5pPTKcuO6oUi8cUeGzOcfr
         ed2HX+IrgXoVR50iLEqfzM45FxwnD2uXg+0V0kTlzEfmekmT762rMaR0JIt4FzO79s31
         HJaigBRuYjZHnrZcax7wYC0Mzn7PiKvYgJ6dpWmapHWo1wkXoskVf09e3+1Cn0cQTQEr
         GZVA==
X-Gm-Message-State: AOJu0YwhRzAXYIx40WKXLiHK1txqBUtVx4rKgbEhBiC01C1eIRQTwf8f
	U6D66ayNpBQ4P/0XFL6K/MzBJeMnPuQsMlVLJgGdZA==
X-Google-Smtp-Source: AGHT+IHCYz0blMBWwpdJoZ1RUCKFkOGFeBm9VdaHikhjZLlf2r3eA9UAmptIepXMQVxXyXzuuEUlEkvL8t18CpmL0rk=
X-Received: by 2002:a05:600c:2301:b0:405:38d1:e146 with SMTP id
 1-20020a05600c230100b0040538d1e146mr66369wmo.4.1696524074654; Thu, 05 Oct
 2023 09:41:14 -0700 (PDT)
MIME-Version: 1.0
References: <20231003145150.2498-1-ansuelsmth@gmail.com> <20231003145150.2498-3-ansuelsmth@gmail.com>
 <CANn89iK226C-pHUJm7HKMyEtMycGC=KCA2M6kw2KJaUj0cCT6w@mail.gmail.com> <20231005093253.2e25533a@kernel.org>
In-Reply-To: <20231005093253.2e25533a@kernel.org>
From: Eric Dumazet <edumazet@google.com>
Date: Thu, 5 Oct 2023 18:41:03 +0200
Message-ID: <CANn89iJQ50AdXP2C1YB2pGjE02WCJ-QCsZqE1yGXtcGsfLA0Jw@mail.gmail.com>
Subject: Re: [net-next PATCH v2 3/4] netdev: replace napi_reschedule with napi_schedule
To: Jakub Kicinski <kuba@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
  =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, linux-wireless@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>, Wei Fang <wei.fang@nxp.com>, Christian Marangi <ansuelsmth@gmail.com>, Wolfgang Grandegger <wg@grandegger.com>, Nick Child <nnac123@linux.ibm.com>, Simon Horman <horms@kernel.org>, Liu Haijun <haijun.liu@mediatek.com>, Kalle Valo <kvalo@kernel.org>, linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>, linux-can@vger.kernel.org, Yuanjun Gong <ruc_gongyuanjun@163.com>, Shailend Chand <shailend@google.com>, Marc Kleine-Budde <mkl@pengutronix.de>, Benjamin Berg <benjamin.berg@intel.com>, M Chetan Kumar <m.chetan.kumar@linux.intel.com>, Thomas Gleixner <tglx@linutronix.de>, Coco Li <lixiaoyan@google.com>, linux-arm-kernel@lists.infradead.org, Chandrashekar Devegowda <chandrashekar.devegowda@intel.com>, Ricardo Martinez <ricardo.martinez@linux.intel.com>, Loic Poulain <loic.poulain@linaro.org>, Zheng Zengkai <zhengzengkai@huawei.com>, Maxim
 ilian Luz <luzmaximilian@gmail.com>, Anjaneyulu <pagadala.yesu.anjaneyulu@intel.com>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Douglas Miller <dougmill@linux.ibm.com>, linux-kernel@vger.kernel.org, Tariq Toukan <tariqt@nvidia.com>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Junfeng Guo <junfeng.guo@intel.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Raju Rangoju <rajur@chelsio.com>, Praveen Kaligineedi <pkaligineedi@google.com>, Johannes Berg <johannes@sipsolutions.net>, Jeff Johnson <quic_jjohnson@quicinc.com>, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Oct 5, 2023 at 6:32=E2=80=AFPM Jakub Kicinski <kuba@kernel.org> wro=
te:
>
> On Thu, 5 Oct 2023 18:11:56 +0200 Eric Dumazet wrote:
> > OK, but I suspect some users of napi_reschedule() might not be race-fre=
e...
>
> What's the race you're thinking of?

This sort of thing... the race is in fl_starving() though...

diff --git a/drivers/net/ethernet/chelsio/cxgb4/sge.c
b/drivers/net/ethernet/chelsio/cxgb4/sge.c
index 98dd78551d89..b5ff2e1a9975 100644
--- a/drivers/net/ethernet/chelsio/cxgb4/sge.c
+++ b/drivers/net/ethernet/chelsio/cxgb4/sge.c
@@ -4261,7 +4261,7 @@ static void sge_rx_timer_cb(struct timer_list *t)

                        if (fl_starving(adap, fl)) {
                                rxq =3D container_of(fl, struct sge_eth_rxq=
, fl);
-                               if (napi_reschedule(&rxq->rspq.napi))
+                               if (napi_schedule(&rxq->rspq.napi))
                                        fl->starving++;
                                else
                                        set_bit(id, s->starving_fl);
