Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C448E7BEE7B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Oct 2023 00:49:29 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=UH+0Lwpw;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S4Djz3N72z3vdq
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Oct 2023 09:49:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=UH+0Lwpw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com; envelope-from=ansuelsmth@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S40V01jnvz3c4t
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Oct 2023 00:38:16 +1100 (AEDT)
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-32615eaa312so4159789f8f.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 09 Oct 2023 06:38:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696858692; x=1697463492; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EzAWHH01VVS9IgkvFldWVDddj9E+l4PxhyRk8MwG584=;
        b=UH+0LwpwxlLTgbciuQBHkmvPRUilQomCsIn7Z1LAe1i+an2KKqF4dYETbxbYYl+JWn
         KAyunMYSMEf+BcKToIb09BmJk6t1CzE9RobLIH8LldGRYacg8K1hE6WMhog+i4iYH6cG
         IiT+B490tKy1J2xjP1thMerPASjQ834H5xhUKkgMLB6lu6uOXIeBXAEbZi+HGNfOAp7w
         KCGkvVv8IvTcejUrOEHwyWyp3+dRgbCDNHPJcjaodIZ0UYkUDZ/aEP3DV4OlQ9ojM0k7
         Ou61vm849sjESESHITZX4hB9tKnKEtMRleDtOrFqLdj6/a6XQwE+O55BWVcDbS6/P+y4
         hJ4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696858692; x=1697463492;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EzAWHH01VVS9IgkvFldWVDddj9E+l4PxhyRk8MwG584=;
        b=iw2aSgQ7Q8WaFlpNjkBElQTctyqPJWKhGQzpderuohbXiI0zzthFI8CXgIKWL0UVJm
         lSIYsXirBC4sThMHb8D0B1v4H695g1R39fW0+Xhioqko9L4HtTDmB0aq+BHK7iP2hW/W
         RzpttgfuXtDyFJNjbtNIlyhYuddNasquDBsD+/wsuE1yTZzJ5G5tVp7AyUjX93Y1kyKS
         tfRsT80lcTyvOJHlFPUtZM6cKX5t9X9lwNR9E9p0436WAdE/NUiuD5VzzUB9GoL9LTCJ
         omgwVR7ZphFd7HxKb32tDG10Nw6UPO4TMXm/RhKsp9QlR8+wlZ7f2NGh5Go+ansa2Y1s
         1XAQ==
X-Gm-Message-State: AOJu0YwrXaTX5mq/jsYg0qqI7ZuqkmzkivIOtYhhAfUFUWTHGmi56nFU
	6+0irP4KUCc+Ny+Ns/+cwMQ=
X-Google-Smtp-Source: AGHT+IHsAsFvK5zcfvpEHNpBjlrUZf2mmc5SciLA+pPQWufHQKhdvJk6OO5q7vOl9k3p/vj4f/tuWw==
X-Received: by 2002:adf:e9d0:0:b0:31f:f432:b541 with SMTP id l16-20020adfe9d0000000b0031ff432b541mr13440190wrn.69.1696858692458;
        Mon, 09 Oct 2023 06:38:12 -0700 (PDT)
Received: from localhost.localdomain (93-34-89-13.ip49.fastwebnet.it. [93.34.89.13])
        by smtp.googlemail.com with ESMTPSA id t4-20020a0560001a4400b0032763287473sm9746160wry.75.2023.10.09.06.38.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Oct 2023 06:38:11 -0700 (PDT)
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
Subject: [net-next v3 4/5] net: tc35815: rework network interface interrupt logic
Date: Mon,  9 Oct 2023 15:37:53 +0200
Message-Id: <20231009133754.9834-4-ansuelsmth@gmail.com>
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

Rework network interface logic. Before this change, the code flow was:
1. Disable interrupt
2. Try to schedule a NAPI
3. Check if it was possible (NAPI is not already scheduled)
4. emit BUG() if we receive interrupt while a NAPI is scheduled

If some application busy poll or set gro_flush_timeout low enough, it's
possible to reach the BUG() condition. Given that the condition may
happen and it wouldn't be a bug, rework the logic to permit such case
and prevent stall with interrupt never enabled again.

Disable the interrupt only if the NAPI can be scheduled (aka it's not
already scheduled) and drop the printk and BUG() call. With these
change, in the event of a NAPI already scheduled, the interrupt is
simply ignored with nothing done.

Suggested-by: Eric Dumazet <edumazet@google.com>
Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/ethernet/toshiba/tc35815.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/toshiba/tc35815.c b/drivers/net/ethernet/toshiba/tc35815.c
index 14cf6ecf6d0d..6e3758dfbdbd 100644
--- a/drivers/net/ethernet/toshiba/tc35815.c
+++ b/drivers/net/ethernet/toshiba/tc35815.c
@@ -1434,14 +1434,10 @@ static irqreturn_t tc35815_interrupt(int irq, void *dev_id)
 	u32 dmactl = tc_readl(&tr->DMA_Ctl);
 
 	if (!(dmactl & DMA_IntMask)) {
-		/* disable interrupts */
-		tc_writel(dmactl | DMA_IntMask, &tr->DMA_Ctl);
-		if (napi_schedule_prep(&lp->napi))
+		if (napi_schedule_prep(&lp->napi)) {
+			/* disable interrupts */
+			tc_writel(dmactl | DMA_IntMask, &tr->DMA_Ctl);
 			__napi_schedule(&lp->napi);
-		else {
-			printk(KERN_ERR "%s: interrupt taken in poll\n",
-			       dev->name);
-			BUG();
 		}
 		(void)tc_readl(&tr->Int_Src);	/* flush */
 		return IRQ_HANDLED;
-- 
2.40.1

