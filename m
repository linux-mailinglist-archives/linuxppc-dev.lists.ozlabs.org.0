Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 413247BEE6E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Oct 2023 00:46:58 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=RgBHhLuW;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S4Dg40Dcfz3clw
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Oct 2023 09:46:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=RgBHhLuW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com; envelope-from=ansuelsmth@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S40Tt05Qyz3c13
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Oct 2023 00:38:08 +1100 (AEDT)
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-40651a72807so44206955e9.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 09 Oct 2023 06:38:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696858684; x=1697463484; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=u6KCxFngvX9I/hwQrj7ymkXhwkpFmhe1Y7OW2VCan1I=;
        b=RgBHhLuW7o6ArLD4eR+ELQkhIG0gWeGteHn7rlMSlPKpFoEFWeCm1sbskdOF1hfOAY
         JVioqyKXajxUx1T3BOfePXyk0Op/Ywv89qKnIXmO8Q4DUdklZQU70ykdoHRlaXthPpun
         0KdcRCYiOPYzyyr+3h9Ot24IiTKnPGmseb/1f/8vQ4aNrOWFjjefncznm3KZWfmPKtWo
         wsuzbxJQx2NDn9hx4zZEqExb+r+jsFdPMhccS7JapyXkGNaNPVcvWl1olHj0F/LjpsGS
         6thCLEpdfcvr4SsrxUtL6NPY8OZRD9AC4gbbKlv1Zhjn4jpA/s/kLWie+2RSqZPZugFA
         uCeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696858684; x=1697463484;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=u6KCxFngvX9I/hwQrj7ymkXhwkpFmhe1Y7OW2VCan1I=;
        b=hvOTsLeHi0wbEfhGHbuaoqp7HcyhKbKwrfEo/5OM0t9IxBU4ZtKrFGlK08gsjMvuZ1
         vWY4KFUXZFqnoWpAmuvuEbaX0pBW6DFaNS9AVVZ9oQlWcyLRQnj8nBKLtXLAVOjjwbFv
         pTH37T2o4LBoV6NkXOWacQgpZpXqVgFpeI8GDD98V+G4So/5/ecQMKJ3BOpXuxAPqf+U
         Oqefv/ZqW7IcWpF/cLhPmZ7Fgrevm+DGbvCdiAjIiW4TWRdSjrjmoZk+rL2m4f7hWvqt
         r0U4thGVcyY7VVgzYRwn3A5Nqr08DRdOF9mOv7Ev9h6JYkrK+lSx2UJSQR4EpVFEnmgY
         3GIw==
X-Gm-Message-State: AOJu0YxNi4evC3tYzvzGQNan85mhctvdRI6QJoYw1XcJmVyVxKvKgJ5U
	jbIdLUvKhyahGq7uVdgwhsQ=
X-Google-Smtp-Source: AGHT+IEMzVE5102E/rR+PKbFb4Y1qJpv3S+lyAIEK40sgvEz//IRItxHur9Z7ZsOHs5xcO/iYCxqbg==
X-Received: by 2002:adf:f78d:0:b0:320:926:26d5 with SMTP id q13-20020adff78d000000b00320092626d5mr13881386wrp.30.1696858683739;
        Mon, 09 Oct 2023 06:38:03 -0700 (PDT)
Received: from localhost.localdomain (93-34-89-13.ip49.fastwebnet.it. [93.34.89.13])
        by smtp.googlemail.com with ESMTPSA id t4-20020a0560001a4400b0032763287473sm9746160wry.75.2023.10.09.06.38.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Oct 2023 06:38:03 -0700 (PDT)
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
	Nick Child <nnac123@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
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
	Alex Elder <elder@linaro.org>,
	Bhupesh Sharma <bhupesh.sharma@linaro.org>,
	Simon Horman <horms@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bailey Forrest <bcf@google.com>,
	Junfeng Guo <junfeng.guo@intel.com>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Ziwei Xiao <ziweixiao@google.com>,
	Rushil Gupta <rushilg@google.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Yuri Karpov <YKarpov@ispras.ru>,
	Andrew Lunn <andrew@lunn.ch>,
	Zheng Zengkai <zhengzengkai@huawei.com>,
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
Subject: [net-next v3 1/5] netdev: replace simple napi_schedule_prep/__napi_schedule to napi_schedule
Date: Mon,  9 Oct 2023 15:37:50 +0200
Message-Id: <20231009133754.9834-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 10 Oct 2023 09:46:11 +1100
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
Reviewed-by: Eric Dumazet <edumazet@google.com>
---
Changes v3:
- Add Reviewed-by tag
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

