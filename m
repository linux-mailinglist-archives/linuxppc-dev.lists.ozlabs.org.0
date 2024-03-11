Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 212D8877DF1
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Mar 2024 11:16:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TtXjv02LYz76sW
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Mar 2024 21:16:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com (client-ip=92.121.34.13; helo=inva020.nxp.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org)
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TtXbG1Q5Vz3vdR
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Mar 2024 21:10:34 +1100 (AEDT)
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 151C51A197B;
	Mon, 11 Mar 2024 11:10:31 +0100 (CET)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 7F5BD1A0B42;
	Mon, 11 Mar 2024 11:10:30 +0100 (CET)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id B891A183AD15;
	Mon, 11 Mar 2024 18:10:28 +0800 (+08)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: hverkuil@xs4all.nl,
	sakari.ailus@iki.fi,
	tfiga@chromium.org,
	m.szyprowski@samsung.com,
	mchehab@kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	nicoleotsuka@gmail.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v14 14/16] media: vivid: add fixed point test controls
Date: Mon, 11 Mar 2024 17:53:59 +0800
Message-Id: <1710150841-26991-15-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1710150841-26991-1-git-send-email-shengjiu.wang@nxp.com>
References: <1710150841-26991-1-git-send-email-shengjiu.wang@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
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

Add fixed point test controls, one is for Q4.16 format
another one is for Q63 format.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 drivers/media/test-drivers/vivid/vivid-core.h |  2 ++
 .../media/test-drivers/vivid/vivid-ctrls.c    | 26 +++++++++++++++++++
 include/media/v4l2-ctrls.h                    |  6 +++++
 3 files changed, 34 insertions(+)

diff --git a/drivers/media/test-drivers/vivid/vivid-core.h b/drivers/media/test-drivers/vivid/vivid-core.h
index cfb8e66083f6..f65465191bc9 100644
--- a/drivers/media/test-drivers/vivid/vivid-core.h
+++ b/drivers/media/test-drivers/vivid/vivid-core.h
@@ -222,6 +222,8 @@ struct vivid_dev {
 	struct v4l2_ctrl		*boolean;
 	struct v4l2_ctrl		*int32;
 	struct v4l2_ctrl		*int64;
+	struct v4l2_ctrl		*int32_q16;
+	struct v4l2_ctrl		*int64_q63;
 	struct v4l2_ctrl		*menu;
 	struct v4l2_ctrl		*string;
 	struct v4l2_ctrl		*bitmask;
diff --git a/drivers/media/test-drivers/vivid/vivid-ctrls.c b/drivers/media/test-drivers/vivid/vivid-ctrls.c
index f2b20e25a7a4..2444ea95b285 100644
--- a/drivers/media/test-drivers/vivid/vivid-ctrls.c
+++ b/drivers/media/test-drivers/vivid/vivid-ctrls.c
@@ -38,6 +38,8 @@
 #define VIVID_CID_U8_PIXEL_ARRAY	(VIVID_CID_CUSTOM_BASE + 14)
 #define VIVID_CID_S32_ARRAY		(VIVID_CID_CUSTOM_BASE + 15)
 #define VIVID_CID_S64_ARRAY		(VIVID_CID_CUSTOM_BASE + 16)
+#define VIVID_CID_INT_Q4_16		(VIVID_CID_CUSTOM_BASE + 17)
+#define VIVID_CID_INT64_Q63		(VIVID_CID_CUSTOM_BASE + 18)
 
 #define VIVID_CID_VIVID_BASE		(0x00f00000 | 0xf000)
 #define VIVID_CID_VIVID_CLASS		(0x00f00000 | 1)
@@ -182,6 +184,28 @@ static const struct v4l2_ctrl_config vivid_ctrl_int64 = {
 	.step = 1,
 };
 
+static const struct v4l2_ctrl_config vivid_ctrl_int32_q16 = {
+	.ops = &vivid_user_gen_ctrl_ops,
+	.id = VIVID_CID_INT_Q4_16,
+	.name = "Integer 32 Bits Q4.16",
+	.type = V4L2_CTRL_TYPE_INTEGER,
+	.min = v4l2_ctrl_fp_compose(-16, 0, 16),
+	.max = v4l2_ctrl_fp_compose(15, 0xffff, 16),
+	.step = 1,
+	.fraction_bits = 16,
+};
+
+static const struct v4l2_ctrl_config vivid_ctrl_int64_q63 = {
+	.ops = &vivid_user_gen_ctrl_ops,
+	.id = VIVID_CID_INT64_Q63,
+	.name = "Integer 64 Bits Q63",
+	.type = V4L2_CTRL_TYPE_INTEGER64,
+	.min = v4l2_ctrl_fp_compose(-1, 0, 63),
+	.max = v4l2_ctrl_fp_compose(0, LLONG_MAX, 63),
+	.step = 1,
+	.fraction_bits = 63,
+};
+
 static const struct v4l2_ctrl_config vivid_ctrl_u32_array = {
 	.ops = &vivid_user_gen_ctrl_ops,
 	.id = VIVID_CID_U32_ARRAY,
@@ -1670,6 +1694,8 @@ int vivid_create_controls(struct vivid_dev *dev, bool show_ccs_cap,
 	dev->button = v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_button, NULL);
 	dev->int32 = v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_int32, NULL);
 	dev->int64 = v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_int64, NULL);
+	dev->int32_q16 = v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_int32_q16, NULL);
+	dev->int64_q63 = v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_int64_q63, NULL);
 	dev->boolean = v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_boolean, NULL);
 	dev->menu = v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_menu, NULL);
 	dev->string = v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_string, NULL);
diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls.h
index c35514c5bf88..197d8b67ac13 100644
--- a/include/media/v4l2-ctrls.h
+++ b/include/media/v4l2-ctrls.h
@@ -1593,4 +1593,10 @@ void v4l2_ctrl_type_op_log(const struct v4l2_ctrl *ctrl);
  */
 int v4l2_ctrl_type_op_validate(const struct v4l2_ctrl *ctrl, union v4l2_ctrl_ptr ptr);
 
+/*
+ * Fixed point compose helper define. This helper maps to the value
+ * i + f / (1 << fraction_bits).
+ */
+#define v4l2_ctrl_fp_compose(i, f, fraction_bits) (((s64)(i) << fraction_bits) + (f))
+
 #endif
-- 
2.34.1

