Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 85DDA2A4A07
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Nov 2020 16:40:17 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CQYrZ0LwszDqMb
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Nov 2020 02:40:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::441;
 helo=mail-wr1-x441.google.com; envelope-from=lee.jones@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=JaziDNI2; dkim-atps=neutral
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CQYcX1X1WzDqhC
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Nov 2020 02:29:46 +1100 (AEDT)
Received: by mail-wr1-x441.google.com with SMTP id x7so19027326wrl.3
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 03 Nov 2020 07:29:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qtstZ8Ss1ZAgmytvl8BCDCnRUt17GN9LrR/wkx5bkhc=;
 b=JaziDNI2dZRnNVL5YCwTqVWJum+QZWTUU+vs6VYmxJT7BLEQH5posc6/WC0AWBKwwX
 4EA5q8jb1aDG1Qx8mSIZIvnF38Fmo9qbDB+CflrTNa5NulvbCNZXnBF9VEZQT8KG7DxU
 6+3I7zAk4NLRGqNIWxSsf7NVHdlBanIQn/093/L5uzkRt/gwwkBjtCbRLH8IZ9FOlvIe
 4mAv1E7ipUbKi6Ug07SR2idrs0IX2STzlguTxLvcvRsHMYITCo9255Iv6zU2eRFF1R3e
 NrSz765fBbjXJUk3Nfjy2gOSshWI1nJKMnhi+SZ6rf/XcpwkS7M6bwWro1jkNr6bymOa
 aDZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qtstZ8Ss1ZAgmytvl8BCDCnRUt17GN9LrR/wkx5bkhc=;
 b=STk5gHoCAN/PiUq+eNjEyyhqv4JM5TmdgT59DIEg6+7bb+rw7No9LlarElfqoN+MxK
 ya8afq+QGK93OPU6vFbQ3SH1A7aL73FCoB1rmaFuhGG/u+Sg7aqq3hUJkmm0esvOfHyi
 euy0wRwQh6zQAVn+OvRU0DlTtWMVpUBxXaqs9ZH8Gnwnw9+e5XX9KClsKP8Zg6tGsUOD
 2K/gl0qABiw3Ctf7DZ3sDNQu2uaLV23P2fsHv4rFl7uUhHmL07SOT9452tUrK/tn1x56
 +ttF34jZOaZ/8kO2ZVCQDa4oRRYrqtVEhs+srZsfMIR+Z9nkkHbGwOzRilPdZNSj2yO/
 y01Q==
X-Gm-Message-State: AOAM530Z19amqfnP564+9UI9TtwvR7q6Dz/tTh9cenOrHa3ksHGgdtCc
 wP3m7ZmqTsnZqs0PRd+jbwklVQ==
X-Google-Smtp-Source: ABdhPJwfFIvO98y22nwny1fM75XJYeVuQtBFhjTRJDvug6VV5vIaDlVpdV8Lsm6ohJKNfWsYSxQtRg==
X-Received: by 2002:adf:c101:: with SMTP id r1mr25707250wre.87.1604417382870; 
 Tue, 03 Nov 2020 07:29:42 -0800 (PST)
Received: from dell.default ([91.110.221.242])
 by smtp.gmail.com with ESMTPSA id j127sm3491779wma.31.2020.11.03.07.29.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Nov 2020 07:29:42 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 25/25] soc: fsl: qbman: qman: Remove unused variable
 'dequeue_wq'
Date: Tue,  3 Nov 2020 15:28:38 +0000
Message-Id: <20201103152838.1290217-26-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201103152838.1290217-1-lee.jones@linaro.org>
References: <20201103152838.1290217-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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
Cc: linuxppc-dev@lists.ozlabs.org, YueHaibing <yuehaibing@huawei.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Li Yang <leoyang.li@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Fixes the following W=1 kernel build warning(s):

 drivers/soc/fsl/qbman/qman.c: In function ‘qman_shutdown_fq’:
 drivers/soc/fsl/qbman/qman.c:2700:8: warning: variable ‘dequeue_wq’ set but not used [-Wunused-but-set-variable]

Cc: Li Yang <leoyang.li@nxp.com>
Cc: YueHaibing <yuehaibing@huawei.com>
Cc: linuxppc-dev@lists.ozlabs.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/soc/fsl/qbman/qman.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/soc/fsl/qbman/qman.c b/drivers/soc/fsl/qbman/qman.c
index 9888a70618730..62b182c3a8b04 100644
--- a/drivers/soc/fsl/qbman/qman.c
+++ b/drivers/soc/fsl/qbman/qman.c
@@ -2622,7 +2622,7 @@ int qman_shutdown_fq(u32 fqid)
 	union qm_mc_command *mcc;
 	union qm_mc_result *mcr;
 	int orl_empty, drain = 0, ret = 0;
-	u32 channel, wq, res;
+	u32 channel, res;
 	u8 state;
 
 	p = get_affine_portal();
@@ -2655,7 +2655,7 @@ int qman_shutdown_fq(u32 fqid)
 	DPAA_ASSERT((mcr->verb & QM_MCR_VERB_MASK) == QM_MCR_VERB_QUERYFQ);
 	/* Need to store these since the MCR gets reused */
 	channel = qm_fqd_get_chan(&mcr->queryfq.fqd);
-	wq = qm_fqd_get_wq(&mcr->queryfq.fqd);
+	qm_fqd_get_wq(&mcr->queryfq.fqd);
 
 	if (channel < qm_channel_pool1) {
 		channel_portal = get_portal_for_channel(channel);
@@ -2697,7 +2697,6 @@ int qman_shutdown_fq(u32 fqid)
 			 * to dequeue from the channel the FQ is scheduled on
 			 */
 			int found_fqrn = 0;
-			u16 dequeue_wq = 0;
 
 			/* Flag that we need to drain FQ */
 			drain = 1;
@@ -2705,11 +2704,8 @@ int qman_shutdown_fq(u32 fqid)
 			if (channel >= qm_channel_pool1 &&
 			    channel < qm_channel_pool1 + 15) {
 				/* Pool channel, enable the bit in the portal */
-				dequeue_wq = (channel -
-					      qm_channel_pool1 + 1)<<4 | wq;
 			} else if (channel < qm_channel_pool1) {
 				/* Dedicated channel */
-				dequeue_wq = wq;
 			} else {
 				dev_err(dev, "Can't recover FQ 0x%x, ch: 0x%x",
 					fqid, channel);
-- 
2.25.1

