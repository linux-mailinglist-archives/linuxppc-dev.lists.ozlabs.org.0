Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FCB47BEE80
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Oct 2023 00:50:18 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ExwpgqUN;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S4Dkw1C0vz3vjh
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Oct 2023 09:50:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ExwpgqUN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com; envelope-from=ansuelsmth@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S40V34dnGz3c54
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Oct 2023 00:38:19 +1100 (AEDT)
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-313e742a787so2688551f8f.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 09 Oct 2023 06:38:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696858695; x=1697463495; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6V3Yp/K15xx7ev3Qhf5+/0w5en07kzL7Wskfo0+HBPw=;
        b=ExwpgqUNuafmfxtEjHS4Df4LXG0sntsp0PlW0gC/Uje56oqqzXVPIYRV+3Q1ZKXikA
         ZkKgN/fd7fWjp/n2evyaRFo84A+yIYb+Q41MQJLjYWOWy2kqFOYFBQnUynk29HiV5exf
         cDPJ8IQWNqcUfEhDZX+pjMNUqZFCXbFhFpqVvS/TDhgPYQQtxZ9gZoWUxlc+DkW1htOi
         DpEbp+PfCusSNBiVSVE0lKyDjdh38z+TIza7jSHIPQjIATlGDDn0pr3JvdlQOLF9e5SD
         7pwqvcqmZntDl4Lbu/PjNe0KnD/z1sTpF+89NX924863HMYRBBONlCfqhLFnzViOwtGG
         Sqkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696858695; x=1697463495;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6V3Yp/K15xx7ev3Qhf5+/0w5en07kzL7Wskfo0+HBPw=;
        b=dpB5Nv+lXsi4C3RF7UjZJ6QXxoapysQjZM413dSkABkZa1qu6Z6+Ry6EhBdGJ+tLRr
         HVcngW6hfWBKujp0Cvheeu9LtSolZ0xmeN1xjkfg+nWMa206gTXyOTrImtm5M0eDXFWo
         UH3H1MVMqKu/jG79wT1rQo/ZCXKfbrn+oQ4WBvNzXWmXb/Ojm1b245wPx+kw1nzit8gT
         ycoAD9fPsfFmEcwEAN84kSlo1CBXBnJJ2awhVx684FXKY3VcCvGF70BOvSuXsV4Leg9O
         J5ISTJVEWgHV6nOcUbV0lnYb3eYZMJhPtd/I8wFPFG+BGmujmvysi3cm9o7FEeFRek11
         y1rg==
X-Gm-Message-State: AOJu0YxXi9o9tV2Zc+JYm0M+mT7KdpsgrD7+2jOwBDmIRm/f0oIdOwgP
	hJjgAcD0b1uGwKVP8+1EviQ=
X-Google-Smtp-Source: AGHT+IEg5HTR+xDE3IzwD0pbfXpmjGlWQO4VcUmgAYjzp1NHs11O05PimyYF9rp+Ru7+he92h2hBgA==
X-Received: by 2002:a05:6000:1112:b0:317:6734:c2ae with SMTP id z18-20020a056000111200b003176734c2aemr9423512wrw.11.1696858695077;
        Mon, 09 Oct 2023 06:38:15 -0700 (PDT)
Received: from localhost.localdomain (93-34-89-13.ip49.fastwebnet.it. [93.34.89.13])
        by smtp.googlemail.com with ESMTPSA id t4-20020a0560001a4400b0032763287473sm9746160wry.75.2023.10.09.06.38.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Oct 2023 06:38:14 -0700 (PDT)
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
Subject: [net-next v3 5/5] netdev: use napi_schedule bool instead of napi_schedule_prep/__napi_schedule
Date: Mon,  9 Oct 2023 15:37:54 +0200
Message-Id: <20231009133754.9834-5-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231009133754.9834-1-ansuelsmth@gmail.com>
References: <20231009133754.9834-1-ansuelsmth@gmail.com>
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

Replace if condition of napi_schedule_prep/__napi_schedule and use bool
from napi_schedule directly where possible.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
Changes v3:
- Drop toshiba change and rework in separate patch
---
 drivers/net/ethernet/atheros/atlx/atl1.c     | 4 +---
 drivers/net/wireless/intel/iwlwifi/pcie/rx.c | 4 +---
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/atheros/atlx/atl1.c b/drivers/net/ethernet/atheros/atlx/atl1.c
index 02aa6fd8ebc2..a9014d7932db 100644
--- a/drivers/net/ethernet/atheros/atlx/atl1.c
+++ b/drivers/net/ethernet/atheros/atlx/atl1.c
@@ -2446,7 +2446,7 @@ static int atl1_rings_clean(struct napi_struct *napi, int budget)
 
 static inline int atl1_sched_rings_clean(struct atl1_adapter* adapter)
 {
-	if (!napi_schedule_prep(&adapter->napi))
+	if (!napi_schedule(&adapter->napi))
 		/* It is possible in case even the RX/TX ints are disabled via IMR
 		 * register the ISR bits are set anyway (but do not produce IRQ).
 		 * To handle such situation the napi functions used to check is
@@ -2454,8 +2454,6 @@ static inline int atl1_sched_rings_clean(struct atl1_adapter* adapter)
 		 */
 		return 0;
 
-	__napi_schedule(&adapter->napi);
-
 	/*
 	 * Disable RX/TX ints via IMR register if it is
 	 * allowed. NAPI handler must reenable them in same
diff --git a/drivers/net/wireless/intel/iwlwifi/pcie/rx.c b/drivers/net/wireless/intel/iwlwifi/pcie/rx.c
index 23b5a0adcbd6..146bc7bd14fb 100644
--- a/drivers/net/wireless/intel/iwlwifi/pcie/rx.c
+++ b/drivers/net/wireless/intel/iwlwifi/pcie/rx.c
@@ -1660,9 +1660,7 @@ irqreturn_t iwl_pcie_irq_rx_msix_handler(int irq, void *dev_id)
 	IWL_DEBUG_ISR(trans, "[%d] Got interrupt\n", entry->entry);
 
 	local_bh_disable();
-	if (napi_schedule_prep(&rxq->napi))
-		__napi_schedule(&rxq->napi);
-	else
+	if (!napi_schedule(&rxq->napi))
 		iwl_pcie_clear_irq(trans, entry->entry);
 	local_bh_enable();
 
-- 
2.40.1

