Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D9777B7445
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Oct 2023 00:52:06 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=IFBX1YBS;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S0Y3l74k9z3vZS
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Oct 2023 09:52:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=IFBX1YBS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com; envelope-from=ansuelsmth@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S0RP93m5cz3vwf
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Oct 2023 05:36:45 +1100 (AEDT)
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-317c3ac7339so1278393f8f.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 03 Oct 2023 11:36:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696358200; x=1696963000; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m01pIjBrpccmB+UTqpe3DsPW+GxNRr1hhJrCHjJ41h8=;
        b=IFBX1YBSDaE6cr4sfG7sn0nQPnvuDFIcj2mJPqsn2lTtr723ALXysdB7VH5uKfQ2mu
         IezZ2ErsD/wbgM/Mabqwltbwx1ZEp/s4TG8Hg/jQZ6Ze/T6HgzYWugg5GKBdEvFwcFvU
         PjunIIi6WH4REAv6fd9B9JPk1sSENkjzTlG/1LLBogEnpj/AZgKkKlQaZVQp1zuAQ2P7
         /jGeSnKUQgA/ujxaaYfaDhMVjqs7A5PCLPCVUznHYi6ZARB5CRy7eNmDgvtMQ/wF03P9
         UN+YA9EzXqYlInp9BFL5d7JLbejJFu595VYx0TP1ZZqvLSrfLR7LUA54RVv4FMeq6h1X
         Vq8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696358200; x=1696963000;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m01pIjBrpccmB+UTqpe3DsPW+GxNRr1hhJrCHjJ41h8=;
        b=S1ZqNG3zlIamy59Q5Pv9ag6VaVoez328nwdPg9OwbOBsbs2vYUvag327qn1R/v7Qds
         X93TYe4i+dYhKvEygqhaanlQs1/rpfRH6jYafX+eKtrmUuqQ+aKikpggkBY5lCO1R6UM
         SFmR0e0lcAr0Wc3Ou1Z+reCiExZAKtQzST0yLY8n3xn+FNcZKS9i1N5dlVPzcAnAt0bU
         uQ9K7xSFpr1B1l25mVJiFVpsV/sL76iEYc8EzX8SJ8ekHm4CnF0+IOXMh7DLWF+A9C5Y
         RMdDKCnnrIssFXNOANzh+IpzxJSqIUjmaAtj5bgi+7/JZ3iHLXwqbZqCwOaWYSqAL5FU
         W/Zw==
X-Gm-Message-State: AOJu0YwNCakh5o/taPqeFwp37rRBsFxl8pul9wk9Fdx5habEMlNdDxz3
	Kocd+g4sYpHd60BmOF/R7N0=
X-Google-Smtp-Source: AGHT+IFujSOcsXudCvocPk/iZUw+s3sjadA+Lbuh1dKD9fGAxnHqk/kWYlUE+iYoiRJHe7APaefnLg==
X-Received: by 2002:a5d:5908:0:b0:317:6c19:6445 with SMTP id v8-20020a5d5908000000b003176c196445mr63201wrd.39.1696358199537;
        Tue, 03 Oct 2023 11:36:39 -0700 (PDT)
Received: from localhost.localdomain (93-34-89-13.ip49.fastwebnet.it. [93.34.89.13])
        by smtp.googlemail.com with ESMTPSA id k15-20020a7bc40f000000b004013797efb6sm10147400wmi.9.2023.10.03.11.36.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Oct 2023 11:36:39 -0700 (PDT)
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
Subject: [net-next PATCH v2 2/4] netdev: make napi_schedule return bool on NAPI successful schedule
Date: Tue,  3 Oct 2023 16:51:48 +0200
Message-Id: <20231003145150.2498-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231003145150.2498-1-ansuelsmth@gmail.com>
References: <20231003145150.2498-1-ansuelsmth@gmail.com>
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

Change napi_schedule to return a bool on NAPI successful schedule.
This might be useful for some driver to do additional steps after a
NAPI has been scheduled.

Suggested-by: Eric Dumazet <edumazet@google.com>
Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
Reviewed-by: Eric Dumazet <edumazet@google.com>
---
Changes v2:
- Add Suggested-by tag
- Add Reviewed-by tag
---
 include/linux/netdevice.h | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/include/linux/netdevice.h b/include/linux/netdevice.h
index 7e520c14eb8c..2bead8e2a14d 100644
--- a/include/linux/netdevice.h
+++ b/include/linux/netdevice.h
@@ -490,11 +490,18 @@ bool napi_schedule_prep(struct napi_struct *n);
  *
  * Schedule NAPI poll routine to be called if it is not already
  * running.
+ * Return true if we schedule a NAPI or false if not.
+ * Refer to napi_schedule_prep() for additional reason on why
+ * a NAPI might not be scheduled.
  */
-static inline void napi_schedule(struct napi_struct *n)
+static inline bool napi_schedule(struct napi_struct *n)
 {
-	if (napi_schedule_prep(n))
+	if (napi_schedule_prep(n)) {
 		__napi_schedule(n);
+		return true;
+	}
+
+	return false;
 }
 
 /**
-- 
2.40.1

