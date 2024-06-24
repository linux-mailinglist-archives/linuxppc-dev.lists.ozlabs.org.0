Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E79F915378
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Jun 2024 18:23:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W7Cv16h2hz3cyb
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jun 2024 02:23:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.208.53; helo=mail-ed1-f53.google.com; envelope-from=breno.debian@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W7CsS5DG3z3dBG
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jun 2024 02:22:04 +1000 (AEST)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-57d06101d76so4779197a12.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Jun 2024 09:22:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719246122; x=1719850922;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lI0lpN6kx7yRxic2Ty5k5Kh7yOrOrpZPNGmNxWXyvto=;
        b=VobXq+O15UMoCya1XuX+ruloHAet17cenIs9vv/gcPPIbGlfGXfQ9tUWjy8yebVUP3
         PIjeFuALMgJZ56NKTre6Bhr9KE9cGt4o8djOV07i5YkaWeIUomuSAiMednM7RW72yVQv
         UxRcA3K8c2h8P3+XO3owinl2yypphG5V8XYVv406IBoEXQuskxTghghFDA1hVHhsIZmx
         ++8uW5hjamxBw/tC+hVm68HMl2wrM+uMgNQKWDpODPC3JOJkQGaTWBZ3A7B5y8n+h4GD
         KPfQm9K6gvyb1+u7exuzUeF3G0UFtYgZ9QFb1fiTLXwaq61Rd01XQQImi9W69gxJUw7Z
         fcsw==
X-Gm-Message-State: AOJu0YwcopVNshXwdjNiYH7N9j77Hzvt6MlEI0DCyFnS3kTTH4nbHqJS
	iJuuOD4sy+CEFoyeQpxqg4vWobqN6QEw4/nGukmSid7H3dnPcMJY8VWFr7bZ
X-Google-Smtp-Source: AGHT+IEwMy3K4qn6NThj+xHIEW9HQLoF5ZMgOFTPxFANNhr7dKPUd+SfBDJ7IMkyk+RxYL401G7l8g==
X-Received: by 2002:a50:cc85:0:b0:57c:8027:534d with SMTP id 4fb4d7f45d1cf-57d4a01f393mr3282346a12.27.1719246121917;
        Mon, 24 Jun 2024 09:22:01 -0700 (PDT)
Received: from localhost (fwdproxy-lla-114.fbsv.net. [2a03:2880:30ff:72::face:b00c])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57d303d7aecsm4854506a12.20.2024.06.24.09.22.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jun 2024 09:22:01 -0700 (PDT)
From: Breno Leitao <leitao@debian.org>
To: linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	netdev@vger.kernel.org,
	=?UTF-8?q?Horia=20Geant=C4=83?= <horia.geanta@nxp.com>,
	Pankaj Gupta <pankaj.gupta@nxp.com>,
	Gaurav Jain <gaurav.jain@nxp.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>
Subject: [PATCH 4/4] crypto: caam: Unembed net_dev structure in dpaa2
Date: Mon, 24 Jun 2024 09:21:22 -0700
Message-ID: <20240624162128.1665620-4-leitao@debian.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240624162128.1665620-1-leitao@debian.org>
References: <20240624162128.1665620-1-leitao@debian.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: kuba@kernel.org, Roy.Pledge@nxp.com, "open list:FREESCALE CAAM Cryptographic Acceleration and...,
	linux-kernel@vger.kernel.org open list" <linux-crypto@vger.kernel.org>, horms@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Embedding net_device into structures prohibits the usage of flexible
arrays in the net_device structure. For more details, see the discussion
at [1].

Un-embed the net_devices from struct dpaa2_caam_priv_per_cpu by
converting them into pointers, and allocating them dynamically. Use the
leverage alloc_netdev_dummy() to allocate the net_device object at
dpaa2_dpseci_setup().

The free of the device occurs at dpaa2_dpseci_disable().

Link: https://lore.kernel.org/all/20240229225910.79e224cf@kernel.org/ [1]
Signed-off-by: Breno Leitao <leitao@debian.org>
---
PS: Unfortunately due to lack of hardware, this was not tested in real
hardware.

 drivers/crypto/caam/caamalg_qi2.c | 28 +++++++++++++++++++++++++---
 drivers/crypto/caam/caamalg_qi2.h |  2 +-
 2 files changed, 26 insertions(+), 4 deletions(-)

diff --git a/drivers/crypto/caam/caamalg_qi2.c b/drivers/crypto/caam/caamalg_qi2.c
index a4f6884416a0..207dc422785a 100644
--- a/drivers/crypto/caam/caamalg_qi2.c
+++ b/drivers/crypto/caam/caamalg_qi2.c
@@ -4990,11 +4990,23 @@ static int dpaa2_dpseci_congestion_setup(struct dpaa2_caam_priv *priv,
 	return err;
 }
 
+static void free_dpaa2_pcpu_netdev(struct dpaa2_caam_priv *priv, const cpumask_t *cpus)
+{
+	struct dpaa2_caam_priv_per_cpu *ppriv;
+	int i;
+
+	for_each_cpu(i, cpus) {
+		ppriv = per_cpu_ptr(priv->ppriv, i);
+		free_netdev(ppriv->net_dev);
+	}
+}
+
 static int __cold dpaa2_dpseci_setup(struct fsl_mc_device *ls_dev)
 {
 	struct device *dev = &ls_dev->dev;
 	struct dpaa2_caam_priv *priv;
 	struct dpaa2_caam_priv_per_cpu *ppriv;
+	cpumask_t clean_mask;
 	int err, cpu;
 	u8 i;
 
@@ -5073,6 +5085,7 @@ static int __cold dpaa2_dpseci_setup(struct fsl_mc_device *ls_dev)
 		}
 	}
 
+	cpumask_clear(&clean_mask);
 	i = 0;
 	for_each_online_cpu(cpu) {
 		u8 j;
@@ -5096,15 +5109,23 @@ static int __cold dpaa2_dpseci_setup(struct fsl_mc_device *ls_dev)
 			priv->rx_queue_attr[j].fqid,
 			priv->tx_queue_attr[j].fqid);
 
-		ppriv->net_dev.dev = *dev;
-		INIT_LIST_HEAD(&ppriv->net_dev.napi_list);
-		netif_napi_add_tx_weight(&ppriv->net_dev, &ppriv->napi,
+		ppriv->net_dev = alloc_netdev_dummy(0);
+		if (!ppriv->net_dev) {
+			err = -ENOMEM;
+			goto err_alloc_netdev;
+		}
+		cpumask_set_cpu(cpu, &clean_mask);
+		ppriv->net_dev->dev = *dev;
+
+		netif_napi_add_tx_weight(ppriv->net_dev, &ppriv->napi,
 					 dpaa2_dpseci_poll,
 					 DPAA2_CAAM_NAPI_WEIGHT);
 	}
 
 	return 0;
 
+err_alloc_netdev:
+	free_dpaa2_pcpu_netdev(priv, &clean_mask);
 err_get_rx_queue:
 	dpaa2_dpseci_congestion_free(priv);
 err_get_vers:
@@ -5153,6 +5174,7 @@ static int __cold dpaa2_dpseci_disable(struct dpaa2_caam_priv *priv)
 		ppriv = per_cpu_ptr(priv->ppriv, i);
 		napi_disable(&ppriv->napi);
 		netif_napi_del(&ppriv->napi);
+		free_netdev(ppriv->net_dev);
 	}
 
 	return 0;
diff --git a/drivers/crypto/caam/caamalg_qi2.h b/drivers/crypto/caam/caamalg_qi2.h
index abb502bb675c..61d1219a202f 100644
--- a/drivers/crypto/caam/caamalg_qi2.h
+++ b/drivers/crypto/caam/caamalg_qi2.h
@@ -81,7 +81,7 @@ struct dpaa2_caam_priv {
  */
 struct dpaa2_caam_priv_per_cpu {
 	struct napi_struct napi;
-	struct net_device net_dev;
+	struct net_device *net_dev;
 	int req_fqid;
 	int rsp_fqid;
 	int prio;
-- 
2.43.0

