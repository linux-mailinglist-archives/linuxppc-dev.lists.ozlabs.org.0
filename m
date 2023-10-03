Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FF0A7B7442
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Oct 2023 00:51:16 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=YUbMJzBd;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S0Y2n6rhjz3cNj
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Oct 2023 09:51:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=YUbMJzBd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com; envelope-from=ansuelsmth@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S0RP93W8Tz3vwc
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Oct 2023 05:36:45 +1100 (AEDT)
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-327be5fe4beso1178760f8f.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 03 Oct 2023 11:36:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696358197; x=1696962997; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Tm9YMom9fHhN1d1zUQG0VRznBhXAxuVYa9i0nGcBxaE=;
        b=YUbMJzBdCPrtf5OwKwGghXf8TiNg7A6/Ye9t21zvnnBvaJYMcaIle24/RoFH1zrtag
         wE3GWTiHrl2TZ9sM9KNlKdECbsQVY6KRp6s5I4xPaYWrEYmfSCTl9CD796Fk5Flq34dJ
         J4+6VdELvq2XpBE91hePHyfpBnyRTqzwUGVdiS9JNVtqLn+GBff/cP/rROKVxmRntd5s
         dzwSk2ky6oSvn1uhrJuYzfC9McGF4pGKkmIgldpjkJ3g8D/IX033x34L7PKECq0XGA68
         C3h0fgevGIa0U+RKejXOYxRQT3orE/2ziJyuGm1rbWQ7ZGeWN/r55NOojp9UAW7AuPzj
         Gq1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696358197; x=1696962997;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Tm9YMom9fHhN1d1zUQG0VRznBhXAxuVYa9i0nGcBxaE=;
        b=AD7sUdzBTe/WaYZdpEKS7pkO5Oa3QVSlIe/Cad4UfJqGXU3XNK1P5YoetisthnSKtq
         9sVae9EYhdOHARpHY53+sMjfsJ1U7DvftDUYkWcCMhXNC9m0XOVWiygS/4ZlekNN9Z1X
         1b6MfASx5Z+FsG4VTiDnRvft7w1Y+SiGtrJCr8Vp5qilDBU/9zqP1Y6tkBKAdItWEy9B
         +rrCLoTgYjqHDEpF2M4MPcGNHIhZ2HytGRbgMtDATyUsWpt+O7awC8VBem41m0EcoaNV
         eH25yu212d0kvv0Qf2pUxrebw/nV4FEXriV8xddhp+4rtDTtDtrnwN+uFhDQWOH62/Ue
         Ye6A==
X-Gm-Message-State: AOJu0YxlabQAfyrSB0sOy5gJH624jflvQBATflCnLvWxmfpmO3Zu3Xqv
	s3Hd0c79BRZN2plvnaiesaE=
X-Google-Smtp-Source: AGHT+IHmCEBSKPg2KzPhN3vxGxKbm3vSVCgg07JJ6ZMfT1RcykDF7kKuvKIwIWmfSE0q+HzXTkP5ww==
X-Received: by 2002:a5d:460a:0:b0:320:447:3bcc with SMTP id t10-20020a5d460a000000b0032004473bccmr40025wrq.51.1696358196705;
        Tue, 03 Oct 2023 11:36:36 -0700 (PDT)
Received: from localhost.localdomain (93-34-89-13.ip49.fastwebnet.it. [93.34.89.13])
        by smtp.googlemail.com with ESMTPSA id k15-20020a7bc40f000000b004013797efb6sm10147400wmi.9.2023.10.03.11.36.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Oct 2023 11:36:36 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Jason Gunthorpe <jgg@ziepe.ca>,
	Leon Romanovsky <leon@kernel.org>,
	Wolfgang Grandegger <wg@grandegger.com>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Chris Snook <chris.snook@gmail.com>,
	Raju Rangoju <rajur@chelsio.com>,
	Jeroen de Borst <jeroendb@google.com>,
	Praveen Kaligineedi <pkaligineedi@google.com>,
	Shailend Chand <shailend@google.com>,
	Douglas Miller <dougmill@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Nick Child <nnac123@linux.ibm.com>,
	Haren Myneni <haren@linux.ibm.com>,
	Rick Lindsley <ricklind@linux.ibm.com>,
	Dany Madden <danymadden@us.ibm.com>,
	Thomas Falcon <tlfalcon@linux.ibm.com>,
	Tariq Toukan <tariqt@nvidia.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Krzysztof Halasa <khalasa@piap.pl>,
	Kalle Valo <kvalo@kernel.org>,
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
	Christian Marangi <ansuelsmth@gmail.com>,
	Yuanjun Gong <ruc_gongyuanjun@163.com>,
	Simon Horman <horms@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Ziwei Xiao <ziweixiao@google.com>,
	Rushil Gupta <rushilg@google.com>,
	Coco Li <lixiaoyan@google.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Junfeng Guo <junfeng.guo@intel.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Wei Fang <wei.fang@nxp.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Yuri Karpov <YKarpov@ispras.ru>,
	Zhengchao Shao <shaozhengchao@huawei.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Zheng Zengkai <zhengzengkai@huawei.com>,
	Lee Jones <lee@kernel.org>,
	Maximilian Luz <luzmaximilian@gmail.com>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	Dawei Li <set_pte_at@outlook.com>,
	Anjaneyulu <pagadala.yesu.anjaneyulu@intel.com>,
	Benjamin Berg <benjamin.berg@intel.com>,
	linux-rdma@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-can@vger.kernel.org,
	netdev@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	ath10k@lists.infradead.org,
	linux-wireless@vger.kernel.org
Subject: [net-next PATCH v2 1/4] netdev: replace simple napi_schedule_prep/__napi_schedule to napi_schedule
Date: Tue,  3 Oct 2023 16:51:47 +0200
Message-Id: <20231003145150.2498-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 04 Oct 2023 09:50:30 +1100
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

Replace drivers that still use napi_schedule_prep/__napi_schedule
with napi_schedule helper as it does the same exact check and call.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
Changes v2:
- Add missing semicolon
---
 drivers/net/ethernet/ni/nixge.c     | 3 +--
 drivers/net/ethernet/wiznet/w5100.c | 4 ++--
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/ni/nixge.c b/drivers/net/ethernet/ni/nixge.c
index 97f4798f4b42..f71a4f8bbb89 100644
--- a/drivers/net/ethernet/ni/nixge.c
+++ b/drivers/net/ethernet/ni/nixge.c
@@ -755,8 +755,7 @@ static irqreturn_t nixge_rx_irq(int irq, void *_ndev)
 		cr &= ~(XAXIDMA_IRQ_IOC_MASK | XAXIDMA_IRQ_DELAY_MASK);
 		nixge_dma_write_reg(priv, XAXIDMA_RX_CR_OFFSET, cr);
 
-		if (napi_schedule_prep(&priv->napi))
-			__napi_schedule(&priv->napi);
+		napi_schedule(&priv->napi);
 		goto out;
 	}
 	if (!(status & XAXIDMA_IRQ_ALL_MASK)) {
diff --git a/drivers/net/ethernet/wiznet/w5100.c b/drivers/net/ethernet/wiznet/w5100.c
index 341ee2f249fd..b26fd15c25ae 100644
--- a/drivers/net/ethernet/wiznet/w5100.c
+++ b/drivers/net/ethernet/wiznet/w5100.c
@@ -930,8 +930,8 @@ static irqreturn_t w5100_interrupt(int irq, void *ndev_instance)
 
 		if (priv->ops->may_sleep)
 			queue_work(priv->xfer_wq, &priv->rx_work);
-		else if (napi_schedule_prep(&priv->napi))
-			__napi_schedule(&priv->napi);
+		else
+			napi_schedule(&priv->napi);
 	}
 
 	return IRQ_HANDLED;
-- 
2.40.1

