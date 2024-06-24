Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 68835915373
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Jun 2024 18:23:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W7Ctb73xQz3dK9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jun 2024 02:23:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.218.47; helo=mail-ej1-f47.google.com; envelope-from=breno.debian@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W7CsQ4zpTz3d2W
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jun 2024 02:22:02 +1000 (AEST)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a689ad8d1f6so574145666b.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Jun 2024 09:22:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719246120; x=1719850920;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SNRZatXFYSvT7dWA5Z47QsnQSl5EsRqGGJzSsqaHcYY=;
        b=r+Xrp8HT3C/aYp2hV8HUH7DaVcMn6O0vARfuJZvSZG0cKHuW5dvM6K3GnyXWow7E8e
         zUFNCWI6oweBvkbENe4IcsjNMq6SbxXVxEFhA+lil+71S2XGoMavsgGO/1glbNA04Go+
         8aZ8Naza7vwXbuF9mx/HvLrc1ozSY9ZSTnT3HXF/mRMHqPMM+MqFdL/V9QvKP+r2mjS8
         GuQCN4svxrhKVm1v65Krzi8aMY7TAIcgC0LGs/ca2JqCxT/AyAVbn64EkGKNmQYzUF1y
         YHvvBxN5RgJhvMlaZbeNNdQY3tCPYMbD3JGxuPKRe+NZDwR8MbsT8yMWD8j93dyk2kam
         yZow==
X-Gm-Message-State: AOJu0YxKfzlAp0YdGZ5BiIncmNtVdnOci2vduGWUSX7imhXYN/zrvSRP
	+T1ndXi/py2khtOhSsix4WI0ONfYAU0mjf60U93Ejrce9J7aOrCwNN1/Wt5O
X-Google-Smtp-Source: AGHT+IGzJL+qgZxR9ubJMoPUs7gDPXfWNurJaThSzu++EbZAe9YtGjEOTHF/GkySo3VJEwJszmtBpw==
X-Received: by 2002:a17:907:d509:b0:a6f:27e6:8892 with SMTP id a640c23a62f3a-a7245dc9697mr402052666b.60.1719246116948;
        Mon, 24 Jun 2024 09:21:56 -0700 (PDT)
Received: from localhost (fwdproxy-lla-003.fbsv.net. [2a03:2880:30ff:3::face:b00c])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a72541fc49asm132301866b.74.2024.06.24.09.21.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jun 2024 09:21:56 -0700 (PDT)
From: Breno Leitao <leitao@debian.org>
To: linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	netdev@vger.kernel.org,
	=?UTF-8?q?Horia=20Geant=C4=83?= <horia.geanta@nxp.com>,
	Pankaj Gupta <pankaj.gupta@nxp.com>,
	Gaurav Jain <gaurav.jain@nxp.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>
Subject: [PATCH 3/4] crypto: caam: Unembed net_dev structure from qi
Date: Mon, 24 Jun 2024 09:21:21 -0700
Message-ID: <20240624162128.1665620-3-leitao@debian.org>
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

Un-embed the net_devices from struct caam_qi_pcpu_priv by converting them
into pointers, and allocating them dynamically. Use the leverage
alloc_netdev_dummy() to allocate the net_device object at
caam_qi_init().

The free of the device occurs at caam_qi_shutdown().

Link: https://lore.kernel.org/all/20240229225910.79e224cf@kernel.org/ [1]
Signed-off-by: Breno Leitao <leitao@debian.org>
---
PS: Unfortunately due to lack of hardware, this was not tested in real
hardware.

 drivers/crypto/caam/qi.c | 43 ++++++++++++++++++++++++++++++++--------
 1 file changed, 35 insertions(+), 8 deletions(-)

diff --git a/drivers/crypto/caam/qi.c b/drivers/crypto/caam/qi.c
index 46a083849a8e..0c13ffc81862 100644
--- a/drivers/crypto/caam/qi.c
+++ b/drivers/crypto/caam/qi.c
@@ -57,7 +57,7 @@ struct caam_napi {
  */
 struct caam_qi_pcpu_priv {
 	struct caam_napi caam_napi;
-	struct net_device net_dev;
+	struct net_device *net_dev;
 	struct qman_fq *rsp_fq;
 } ____cacheline_aligned;
 
@@ -144,7 +144,7 @@ static void caam_fq_ern_cb(struct qman_portal *qm, struct qman_fq *fq,
 {
 	const struct qm_fd *fd;
 	struct caam_drv_req *drv_req;
-	struct device *qidev = &(raw_cpu_ptr(&pcpu_qipriv)->net_dev.dev);
+	struct device *qidev = &(raw_cpu_ptr(&pcpu_qipriv)->net_dev->dev);
 	struct caam_drv_private *priv = dev_get_drvdata(qidev);
 
 	fd = &msg->ern.fd;
@@ -530,6 +530,7 @@ static void caam_qi_shutdown(void *data)
 
 		if (kill_fq(qidev, per_cpu(pcpu_qipriv.rsp_fq, i)))
 			dev_err(qidev, "Rsp FQ kill failed, cpu: %d\n", i);
+		free_netdev(pcpu_qipriv.net_dev);
 	}
 
 	qman_delete_cgr_safe(&priv->cgr);
@@ -573,7 +574,7 @@ static enum qman_cb_dqrr_result caam_rsp_fq_dqrr_cb(struct qman_portal *p,
 	struct caam_napi *caam_napi = raw_cpu_ptr(&pcpu_qipriv.caam_napi);
 	struct caam_drv_req *drv_req;
 	const struct qm_fd *fd;
-	struct device *qidev = &(raw_cpu_ptr(&pcpu_qipriv)->net_dev.dev);
+	struct device *qidev = &(raw_cpu_ptr(&pcpu_qipriv)->net_dev->dev);
 	struct caam_drv_private *priv = dev_get_drvdata(qidev);
 	u32 status;
 
@@ -718,12 +719,24 @@ static void free_rsp_fqs(void)
 		kfree(per_cpu(pcpu_qipriv.rsp_fq, i));
 }
 
+static void free_caam_qi_pcpu_netdev(const cpumask_t *cpus)
+{
+	struct caam_qi_pcpu_priv *priv;
+	int i;
+
+	for_each_cpu(i, cpus) {
+		priv = per_cpu_ptr(&pcpu_qipriv, i);
+		free_netdev(priv->net_dev);
+	}
+}
+
 int caam_qi_init(struct platform_device *caam_pdev)
 {
 	int err, i;
 	struct device *ctrldev = &caam_pdev->dev, *qidev;
 	struct caam_drv_private *ctrlpriv;
 	const cpumask_t *cpus = qman_affine_cpus();
+	cpumask_t clean_mask;
 
 	ctrlpriv = dev_get_drvdata(ctrldev);
 	qidev = ctrldev;
@@ -743,6 +756,8 @@ int caam_qi_init(struct platform_device *caam_pdev)
 		return err;
 	}
 
+	cpumask_clear(&clean_mask);
+
 	/*
 	 * Enable the NAPI contexts on each of the core which has an affine
 	 * portal.
@@ -751,10 +766,16 @@ int caam_qi_init(struct platform_device *caam_pdev)
 		struct caam_qi_pcpu_priv *priv = per_cpu_ptr(&pcpu_qipriv, i);
 		struct caam_napi *caam_napi = &priv->caam_napi;
 		struct napi_struct *irqtask = &caam_napi->irqtask;
-		struct net_device *net_dev = &priv->net_dev;
+		struct net_device *net_dev;
 
+		net_dev = alloc_netdev_dummy(0);
+		if (!net_dev) {
+			err = -ENOMEM;
+			goto fail;
+		}
+		cpumask_set_cpu(i, &clean_mask);
+		priv->net_dev = net_dev;
 		net_dev->dev = *qidev;
-		INIT_LIST_HEAD(&net_dev->napi_list);
 
 		netif_napi_add_tx_weight(net_dev, irqtask, caam_qi_poll,
 					 CAAM_NAPI_WEIGHT);
@@ -766,16 +787,22 @@ int caam_qi_init(struct platform_device *caam_pdev)
 				     dma_get_cache_alignment(), 0, NULL);
 	if (!qi_cache) {
 		dev_err(qidev, "Can't allocate CAAM cache\n");
-		free_rsp_fqs();
-		return -ENOMEM;
+		err = -ENOMEM;
+		goto fail2;
 	}
 
 	caam_debugfs_qi_init(ctrlpriv);
 
 	err = devm_add_action_or_reset(qidev, caam_qi_shutdown, ctrlpriv);
 	if (err)
-		return err;
+		goto fail2;
 
 	dev_info(qidev, "Linux CAAM Queue I/F driver initialised\n");
 	return 0;
+
+fail2:
+	free_rsp_fqs();
+fail:
+	free_caam_qi_pcpu_netdev(&clean_mask);
+	return err;
 }
-- 
2.43.0

