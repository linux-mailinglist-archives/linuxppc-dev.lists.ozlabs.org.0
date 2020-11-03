Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A7212A49FF
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Nov 2020 16:36:43 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CQYmS3PKLzDqjv
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Nov 2020 02:36:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::341;
 helo=mail-wm1-x341.google.com; envelope-from=lee.jones@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=FavDb9p/; dkim-atps=neutral
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CQYby5pzWzDqFF
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Nov 2020 02:29:18 +1100 (AEDT)
Received: by mail-wm1-x341.google.com with SMTP id d142so4537730wmd.4
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 03 Nov 2020 07:29:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jfZrsuegqx+OmRO4GpwLy9Cb2wkLW2cpKd0ybvPvY8c=;
 b=FavDb9p/+6vVsi5kkU5BM2yQpZuZMCuDxbCNPZ3i2ikOvdmu9oq9Wh+VBTzxnjRzvP
 1iMendN7Uq0YKDs1reiHHl4zQn3OrDfwrCM4qs8hgBK/oa3nwgnJ6pDqcrm4O8ER7bsN
 mz0l2zEiXnVbgU5XQQViAXUfN3GxwCvg19E4iBGPaj+qZMFaYb3M9ngKgm6cOKI9U6lS
 pPFRLfZfnZhb9MGFuKkpzp377YE0q4oZ3J3LIs4MHROhnVzX7VIINTCasqDAQ/+j8HJX
 xGgHPPYizzw14MsJKLzCqBevf+rG0b6ONujwXxMJRCK0/XdcAJJNXw43SC3Zku3Esoqu
 88Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jfZrsuegqx+OmRO4GpwLy9Cb2wkLW2cpKd0ybvPvY8c=;
 b=C1E8C5jOUoze8gKRe79Hb+V/ycvyPkj50BcUZTRCjiUhf6YVsnsh9hfpE1/AJMJKvM
 aZZ2VfT31zcgdyiVnbrgPlRBM29D9+5iNL7XeVWldzpJ4VCYSb/jL950P4uvScPMj859
 tFNQAwZHcSBNedCLojKgJu1Dzwgh2eH8vBflxMV/iyX/FLhh4K4UzBgS1PGAFjLv6LPq
 xt7i1QEmhLHFYtYvhyx0al2P4ZFb8H3RRJYvV9YmV0mAFKdAj5H9SzuDnuJndp3ZnhRb
 y1x7A8f3S8RPg3zXxib4NQ7kPt3zuQTSGTmUg0ohx1VL93Rdp6i8SkC5c79YWnG8kyc2
 K4Qw==
X-Gm-Message-State: AOAM5310XFM76kktBEPhSRTTswcYove1ARKh3pBbRYOypZSRRKsxRMoK
 wz23KsaG3uYQJqJQWlTgKecAeg==
X-Google-Smtp-Source: ABdhPJzliMylxUcb30fC3RVeqyOpaETp603v3eHDKWTv3/UzCu2Bz6MbuvwQNgVnJm4Khpek01d44A==
X-Received: by 2002:a1c:a982:: with SMTP id s124mr308897wme.65.1604417355037; 
 Tue, 03 Nov 2020 07:29:15 -0800 (PST)
Received: from dell.default ([91.110.221.242])
 by smtp.gmail.com with ESMTPSA id j127sm3491779wma.31.2020.11.03.07.29.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Nov 2020 07:29:14 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 04/25] soc: fsl: dpio: qbman-portal: Fix a bunch of kernel-doc
 misdemeanours
Date: Tue,  3 Nov 2020 15:28:17 +0000
Message-Id: <20201103152838.1290217-5-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201103152838.1290217-1-lee.jones@linaro.org>
References: <20201103152838.1290217-1-lee.jones@linaro.org>
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
Cc: Roy Pledge <Roy.Pledge@nxp.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Li Yang <leoyang.li@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Fixes the following W=1 kernel build warning(s):

 drivers/soc/fsl/dpio/qbman-portal.c:430: warning: Function parameter or member 'inhibit' not described in 'qbman_swp_interrupt_set_inhibit'
 drivers/soc/fsl/dpio/qbman-portal.c:430: warning: Excess function parameter 'mask' description in 'qbman_swp_interrupt_set_inhibit'
 drivers/soc/fsl/dpio/qbman-portal.c:518: warning: Function parameter or member 'd' not described in 'qbman_eq_desc_clear'
 drivers/soc/fsl/dpio/qbman-portal.c:529: warning: Function parameter or member 'respond_success' not described in 'qbman_eq_desc_set_no_orp'
 drivers/soc/fsl/dpio/qbman-portal.c:529: warning: Excess function parameter 'response_success' description in 'qbman_eq_desc_set_no_orp'
 drivers/soc/fsl/dpio/qbman-portal.c:941: warning: Function parameter or member 's' not described in 'qbman_swp_push_get'
 drivers/soc/fsl/dpio/qbman-portal.c:941: warning: Excess function parameter 'p' description in 'qbman_swp_push_get'
 drivers/soc/fsl/dpio/qbman-portal.c:955: warning: Function parameter or member 's' not described in 'qbman_swp_push_set'
 drivers/soc/fsl/dpio/qbman-portal.c:955: warning: Excess function parameter 'p' description in 'qbman_swp_push_set'
 drivers/soc/fsl/dpio/qbman-portal.c:1052: warning: Function parameter or member 'd' not described in 'qbman_pull_desc_set_fq'
 drivers/soc/fsl/dpio/qbman-portal.c:1065: warning: Function parameter or member 'd' not described in 'qbman_pull_desc_set_wq'
 drivers/soc/fsl/dpio/qbman-portal.c:1079: warning: Function parameter or member 'd' not described in 'qbman_pull_desc_set_channel'
 drivers/soc/fsl/dpio/qbman-portal.c:1403: warning: Function parameter or member 'd' not described in 'qbman_release_desc_clear'
 drivers/soc/fsl/dpio/qbman-portal.c:1412: warning: Function parameter or member 'd' not described in 'qbman_release_desc_set_bpid'
 drivers/soc/fsl/dpio/qbman-portal.c:1412: warning: Function parameter or member 'bpid' not described in 'qbman_release_desc_set_bpid'
 drivers/soc/fsl/dpio/qbman-portal.c:1421: warning: Function parameter or member 'd' not described in 'qbman_release_desc_set_rcdi'
 drivers/soc/fsl/dpio/qbman-portal.c:1421: warning: Function parameter or member 'enable' not described in 'qbman_release_desc_set_rcdi'

Cc: Roy Pledge <Roy.Pledge@nxp.com>
Cc: Li Yang <leoyang.li@nxp.com>
Cc: linuxppc-dev@lists.ozlabs.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/soc/fsl/dpio/qbman-portal.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/soc/fsl/dpio/qbman-portal.c b/drivers/soc/fsl/dpio/qbman-portal.c
index 659b4a570d5b5..f13da4d7d1c52 100644
--- a/drivers/soc/fsl/dpio/qbman-portal.c
+++ b/drivers/soc/fsl/dpio/qbman-portal.c
@@ -424,7 +424,7 @@ int qbman_swp_interrupt_get_inhibit(struct qbman_swp *p)
 /**
  * qbman_swp_interrupt_set_inhibit() - write interrupt mask register
  * @p: the given software portal object
- * @mask: The mask to set in SWP_IIR register
+ * @inhibit: whether to inhibit the IRQs
  */
 void qbman_swp_interrupt_set_inhibit(struct qbman_swp *p, int inhibit)
 {
@@ -510,7 +510,7 @@ enum qb_enqueue_commands {
 #define QB_ENQUEUE_CMD_TARGET_TYPE_SHIFT     4
 #define QB_ENQUEUE_CMD_DCA_EN_SHIFT          7
 
-/**
+/*
  * qbman_eq_desc_clear() - Clear the contents of a descriptor to
  *                         default/starting state.
  */
@@ -522,7 +522,7 @@ void qbman_eq_desc_clear(struct qbman_eq_desc *d)
 /**
  * qbman_eq_desc_set_no_orp() - Set enqueue descriptor without orp
  * @d:                the enqueue descriptor.
- * @response_success: 1 = enqueue with response always; 0 = enqueue with
+ * @respond_success:  1 = enqueue with response always; 0 = enqueue with
  *                    rejections returned on a FQ.
  */
 void qbman_eq_desc_set_no_orp(struct qbman_eq_desc *d, int respond_success)
@@ -932,7 +932,7 @@ int qbman_swp_enqueue_multiple_desc_mem_back(struct qbman_swp *s,
 
 /**
  * qbman_swp_push_get() - Get the push dequeue setup
- * @p:           the software portal object
+ * @s:           the software portal object
  * @channel_idx: the channel index to query
  * @enabled:     returned boolean to show whether the push dequeue is enabled
  *               for the given channel
@@ -947,7 +947,7 @@ void qbman_swp_push_get(struct qbman_swp *s, u8 channel_idx, int *enabled)
 
 /**
  * qbman_swp_push_set() - Enable or disable push dequeue
- * @p:           the software portal object
+ * @s:           the software portal object
  * @channel_idx: the channel index (0 to 15)
  * @enable:      enable or disable push dequeue
  */
@@ -1046,6 +1046,7 @@ void qbman_pull_desc_set_numframes(struct qbman_pull_desc *d, u8 numframes)
 
 /**
  * qbman_pull_desc_set_fq() - Set fqid from which the dequeue command dequeues
+ * @d:    the pull dequeue descriptor to be set
  * @fqid: the frame queue index of the given FQ
  */
 void qbman_pull_desc_set_fq(struct qbman_pull_desc *d, u32 fqid)
@@ -1057,6 +1058,7 @@ void qbman_pull_desc_set_fq(struct qbman_pull_desc *d, u32 fqid)
 
 /**
  * qbman_pull_desc_set_wq() - Set wqid from which the dequeue command dequeues
+ * @d:    the pull dequeue descriptor to be set
  * @wqid: composed of channel id and wqid within the channel
  * @dct:  the dequeue command type
  */
@@ -1071,6 +1073,7 @@ void qbman_pull_desc_set_wq(struct qbman_pull_desc *d, u32 wqid,
 /**
  * qbman_pull_desc_set_channel() - Set channelid from which the dequeue command
  *                                 dequeues
+ * @d:    the pull dequeue descriptor to be set
  * @chid: the channel id to be dequeued
  * @dct:  the dequeue command type
  */
@@ -1398,6 +1401,7 @@ int qbman_result_has_new_result(struct qbman_swp *s, const struct dpaa2_dq *dq)
 /**
  * qbman_release_desc_clear() - Clear the contents of a descriptor to
  *                              default/starting state.
+ * @d: the pull dequeue descriptor to be cleared
  */
 void qbman_release_desc_clear(struct qbman_release_desc *d)
 {
@@ -1407,6 +1411,8 @@ void qbman_release_desc_clear(struct qbman_release_desc *d)
 
 /**
  * qbman_release_desc_set_bpid() - Set the ID of the buffer pool to release to
+ * @d:    the pull dequeue descriptor to be set
+ * @bpid: the bpid value to be set
  */
 void qbman_release_desc_set_bpid(struct qbman_release_desc *d, u16 bpid)
 {
@@ -1416,6 +1422,8 @@ void qbman_release_desc_set_bpid(struct qbman_release_desc *d, u16 bpid)
 /**
  * qbman_release_desc_set_rcdi() - Determines whether or not the portal's RCDI
  * interrupt source should be asserted after the release command is completed.
+ * @d:      the pull dequeue descriptor to be set
+ * @enable: enable (1) or disable (0) value
  */
 void qbman_release_desc_set_rcdi(struct qbman_release_desc *d, int enable)
 {
-- 
2.25.1

