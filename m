Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A76387F9AE
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Mar 2024 09:26:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TzPvd0YW0z77PM
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Mar 2024 19:26:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com (client-ip=92.121.34.21; helo=inva021.nxp.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org)
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TzPV15vb6z3w0T
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Mar 2024 19:07:53 +1100 (AEDT)
Received: from inva021.nxp.com (localhost [127.0.0.1])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id B2A39201381;
	Tue, 19 Mar 2024 09:07:50 +0100 (CET)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 4C36920136F;
	Tue, 19 Mar 2024 09:07:50 +0100 (CET)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 411721820F77;
	Tue, 19 Mar 2024 16:07:48 +0800 (+08)
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
Subject: [PATCH v15 01/16] media: v4l2-ctrls: add support for fraction_bits
Date: Tue, 19 Mar 2024 15:50:59 +0800
Message-Id: <1710834674-3285-2-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1710834674-3285-1-git-send-email-shengjiu.wang@nxp.com>
References: <1710834674-3285-1-git-send-email-shengjiu.wang@nxp.com>
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

From: Hans Verkuil <hverkuil@xs4all.nl>

This adds support for the fraction_bits field, used with integer controls.
This allows fixed point formats to be described.

The fraction_bits field is only exposed through VIDIOC_QUERY_EXT_CTRL.

For a given signed two's complement Qf fixed point value 'f' equals
fraction_bits.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 .../media/v4l/vidioc-queryctrl.rst            | 11 ++-
 drivers/media/v4l2-core/v4l2-ctrls-api.c      |  1 +
 drivers/media/v4l2-core/v4l2-ctrls-core.c     | 93 +++++++++++++++----
 include/media/v4l2-ctrls.h                    |  7 +-
 include/uapi/linux/videodev2.h                |  3 +-
 5 files changed, 95 insertions(+), 20 deletions(-)

diff --git a/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst b/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
index 4d38acafe8e1..e65c7e5d78ec 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
@@ -267,7 +267,16 @@ See also the examples in :ref:`control`.
       - The size of each dimension. The first ``nr_of_dims`` elements of
 	this array must be non-zero, all remaining elements must be zero.
     * - __u32
-      - ``reserved``\ [32]
+      - ``fraction_bits``
+      - The number of least significant bits of the control value that
+        form the fraction of the fixed point value. This is 0 if the value
+	is a regular integer. This can be used with all integer control types
+	(``INTEGER``, ``INTEGER64``, ``U8``, ``U16`` and ``U32``).
+	For the signed types the signed two's complement representation is used.
+	This field applies to the control value as well as the ``minimum``,
+	``maximum``, ``step`` and ``default_value`` fields.
+    * - __u32
+      - ``reserved``\ [31]
       - Reserved for future extensions. Applications and drivers must set
 	the array to zero.
 
diff --git a/drivers/media/v4l2-core/v4l2-ctrls-api.c b/drivers/media/v4l2-core/v4l2-ctrls-api.c
index d9a422017bd9..ef16b00421ec 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-api.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-api.c
@@ -1101,6 +1101,7 @@ int v4l2_query_ext_ctrl(struct v4l2_ctrl_handler *hdl, struct v4l2_query_ext_ctr
 	qc->elems = ctrl->elems;
 	qc->nr_of_dims = ctrl->nr_of_dims;
 	memcpy(qc->dims, ctrl->dims, qc->nr_of_dims * sizeof(qc->dims[0]));
+	qc->fraction_bits = ctrl->fraction_bits;
 	qc->minimum = ctrl->minimum;
 	qc->maximum = ctrl->maximum;
 	qc->default_value = ctrl->default_value;
diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/v4l2-core/v4l2-ctrls-core.c
index c4d995f32191..d83a37198bb5 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
@@ -252,12 +252,61 @@ void v4l2_ctrl_type_op_init(const struct v4l2_ctrl *ctrl, u32 from_idx,
 }
 EXPORT_SYMBOL(v4l2_ctrl_type_op_init);
 
+static void v4l2_ctrl_log_fp(s64 v, unsigned int fraction_bits)
+{
+	s64 i, f, mask;
+
+	if (!fraction_bits) {
+		pr_cont("%lld", v);
+		return;
+	}
+
+	mask = (1ULL << fraction_bits) - 1;
+
+	/*
+	 * Note: this function does not support fixed point u64 with
+	 * fraction_bits set to 64. At the moment there is no U64
+	 * control type, but if that is added, then this code will have
+	 * to add support for it.
+	 */
+	if (fraction_bits >= 63)
+		i = v < 0 ? -1 : 0;
+	else
+		i = div64_s64(v, 1LL << fraction_bits);
+
+	f = v < 0 ? -((-v) & mask) : (v & mask);
+
+	if (!f) {
+		pr_cont("%lld", i);
+	} else if (fraction_bits < 20) {
+		u64 div = 1ULL << fraction_bits;
+
+		if (!i && f < 0)
+			pr_cont("-%lld/%llu", -f, div);
+		else if (!i)
+			pr_cont("%lld/%llu", f, div);
+		else if (i < 0 || f < 0)
+			pr_cont("-%lld-%llu/%llu", -i, -f, div);
+		else
+			pr_cont("%lld+%llu/%llu", i, f, div);
+	} else {
+		if (!i && f < 0)
+			pr_cont("-%lld/(2^%u)", -f, fraction_bits);
+		else if (!i)
+			pr_cont("%lld/(2^%u)", f, fraction_bits);
+		else if (i < 0 || f < 0)
+			pr_cont("-%lld-%llu/(2^%u)", -i, -f, fraction_bits);
+		else
+			pr_cont("%lld+%llu/(2^%u)", i, f, fraction_bits);
+	}
+}
+
 void v4l2_ctrl_type_op_log(const struct v4l2_ctrl *ctrl)
 {
 	union v4l2_ctrl_ptr ptr = ctrl->p_cur;
 
 	if (ctrl->is_array) {
-		unsigned i;
+		unsigned int i;
 
 		for (i = 0; i < ctrl->nr_of_dims; i++)
 			pr_cont("[%u]", ctrl->dims[i]);
@@ -266,7 +315,7 @@ void v4l2_ctrl_type_op_log(const struct v4l2_ctrl *ctrl)
 
 	switch (ctrl->type) {
 	case V4L2_CTRL_TYPE_INTEGER:
-		pr_cont("%d", *ptr.p_s32);
+		v4l2_ctrl_log_fp(*ptr.p_s32, ctrl->fraction_bits);
 		break;
 	case V4L2_CTRL_TYPE_BOOLEAN:
 		pr_cont("%s", *ptr.p_s32 ? "true" : "false");
@@ -281,19 +330,19 @@ void v4l2_ctrl_type_op_log(const struct v4l2_ctrl *ctrl)
 		pr_cont("0x%08x", *ptr.p_s32);
 		break;
 	case V4L2_CTRL_TYPE_INTEGER64:
-		pr_cont("%lld", *ptr.p_s64);
+		v4l2_ctrl_log_fp(*ptr.p_s64, ctrl->fraction_bits);
 		break;
 	case V4L2_CTRL_TYPE_STRING:
 		pr_cont("%s", ptr.p_char);
 		break;
 	case V4L2_CTRL_TYPE_U8:
-		pr_cont("%u", (unsigned)*ptr.p_u8);
+		v4l2_ctrl_log_fp(*ptr.p_u8, ctrl->fraction_bits);
 		break;
 	case V4L2_CTRL_TYPE_U16:
-		pr_cont("%u", (unsigned)*ptr.p_u16);
+		v4l2_ctrl_log_fp(*ptr.p_u16, ctrl->fraction_bits);
 		break;
 	case V4L2_CTRL_TYPE_U32:
-		pr_cont("%u", (unsigned)*ptr.p_u32);
+		v4l2_ctrl_log_fp(*ptr.p_u32, ctrl->fraction_bits);
 		break;
 	case V4L2_CTRL_TYPE_H264_SPS:
 		pr_cont("H264_SPS");
@@ -1753,11 +1802,12 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct v4l2_ctrl_handler *hdl,
 			u32 id, const char *name, enum v4l2_ctrl_type type,
 			s64 min, s64 max, u64 step, s64 def,
 			const u32 dims[V4L2_CTRL_MAX_DIMS], u32 elem_size,
-			u32 flags, const char * const *qmenu,
+			u32 fraction_bits, u32 flags, const char * const *qmenu,
 			const s64 *qmenu_int, const union v4l2_ctrl_ptr p_def,
 			void *priv)
 {
 	struct v4l2_ctrl *ctrl;
+	unsigned int max_fraction_bits = 0;
 	unsigned sz_extra;
 	unsigned nr_of_dims = 0;
 	unsigned elems = 1;
@@ -1779,20 +1829,28 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct v4l2_ctrl_handler *hdl,
 
 	/* Prefill elem_size for all types handled by std_type_ops */
 	switch ((u32)type) {
+	case V4L2_CTRL_TYPE_INTEGER:
+		elem_size = sizeof(s32);
+		max_fraction_bits = 31;
+		break;
 	case V4L2_CTRL_TYPE_INTEGER64:
 		elem_size = sizeof(s64);
+		max_fraction_bits = 63;
 		break;
 	case V4L2_CTRL_TYPE_STRING:
 		elem_size = max + 1;
 		break;
 	case V4L2_CTRL_TYPE_U8:
 		elem_size = sizeof(u8);
+		max_fraction_bits = 8;
 		break;
 	case V4L2_CTRL_TYPE_U16:
 		elem_size = sizeof(u16);
+		max_fraction_bits = 16;
 		break;
 	case V4L2_CTRL_TYPE_U32:
 		elem_size = sizeof(u32);
+		max_fraction_bits = 32;
 		break;
 	case V4L2_CTRL_TYPE_MPEG2_SEQUENCE:
 		elem_size = sizeof(struct v4l2_ctrl_mpeg2_sequence);
@@ -1876,10 +1934,10 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct v4l2_ctrl_handler *hdl,
 	}
 
 	/* Sanity checks */
-	if (id == 0 || name == NULL || !elem_size ||
-	    id >= V4L2_CID_PRIVATE_BASE ||
-	    (type == V4L2_CTRL_TYPE_MENU && qmenu == NULL) ||
-	    (type == V4L2_CTRL_TYPE_INTEGER_MENU && qmenu_int == NULL)) {
+	if (id == 0 || !name || !elem_size ||
+	    fraction_bits > max_fraction_bits || id >= V4L2_CID_PRIVATE_BASE ||
+	    (type == V4L2_CTRL_TYPE_MENU && !qmenu) ||
+	    (type == V4L2_CTRL_TYPE_INTEGER_MENU && !qmenu_int)) {
 		handler_set_err(hdl, -ERANGE);
 		return NULL;
 	}
@@ -1940,6 +1998,7 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct v4l2_ctrl_handler *hdl,
 	ctrl->name = name;
 	ctrl->type = type;
 	ctrl->flags = flags;
+	ctrl->fraction_bits = fraction_bits;
 	ctrl->minimum = min;
 	ctrl->maximum = max;
 	ctrl->step = step;
@@ -2038,7 +2097,7 @@ struct v4l2_ctrl *v4l2_ctrl_new_custom(struct v4l2_ctrl_handler *hdl,
 	ctrl = v4l2_ctrl_new(hdl, cfg->ops, cfg->type_ops, cfg->id, name,
 			type, min, max,
 			is_menu ? cfg->menu_skip_mask : step, def,
-			cfg->dims, cfg->elem_size,
+			cfg->dims, cfg->elem_size, cfg->fraction_bits,
 			flags, qmenu, qmenu_int, cfg->p_def, priv);
 	if (ctrl)
 		ctrl->is_private = cfg->is_private;
@@ -2063,7 +2122,7 @@ struct v4l2_ctrl *v4l2_ctrl_new_std(struct v4l2_ctrl_handler *hdl,
 		return NULL;
 	}
 	return v4l2_ctrl_new(hdl, ops, NULL, id, name, type,
-			     min, max, step, def, NULL, 0,
+			     min, max, step, def, NULL, 0, 0,
 			     flags, NULL, NULL, ptr_null, NULL);
 }
 EXPORT_SYMBOL(v4l2_ctrl_new_std);
@@ -2096,7 +2155,7 @@ struct v4l2_ctrl *v4l2_ctrl_new_std_menu(struct v4l2_ctrl_handler *hdl,
 		return NULL;
 	}
 	return v4l2_ctrl_new(hdl, ops, NULL, id, name, type,
-			     0, max, mask, def, NULL, 0,
+			     0, max, mask, def, NULL, 0, 0,
 			     flags, qmenu, qmenu_int, ptr_null, NULL);
 }
 EXPORT_SYMBOL(v4l2_ctrl_new_std_menu);
@@ -2128,7 +2187,7 @@ struct v4l2_ctrl *v4l2_ctrl_new_std_menu_items(struct v4l2_ctrl_handler *hdl,
 		return NULL;
 	}
 	return v4l2_ctrl_new(hdl, ops, NULL, id, name, type,
-			     0, max, mask, def, NULL, 0,
+			     0, max, mask, def, NULL, 0, 0,
 			     flags, qmenu, NULL, ptr_null, NULL);
 
 }
@@ -2150,7 +2209,7 @@ struct v4l2_ctrl *v4l2_ctrl_new_std_compound(struct v4l2_ctrl_handler *hdl,
 		return NULL;
 	}
 	return v4l2_ctrl_new(hdl, ops, NULL, id, name, type,
-			     min, max, step, def, NULL, 0,
+			     min, max, step, def, NULL, 0, 0,
 			     flags, NULL, NULL, p_def, NULL);
 }
 EXPORT_SYMBOL(v4l2_ctrl_new_std_compound);
@@ -2174,7 +2233,7 @@ struct v4l2_ctrl *v4l2_ctrl_new_int_menu(struct v4l2_ctrl_handler *hdl,
 		return NULL;
 	}
 	return v4l2_ctrl_new(hdl, ops, NULL, id, name, type,
-			     0, max, 0, def, NULL, 0,
+			     0, max, 0, def, NULL, 0, 0,
 			     flags, NULL, qmenu_int, ptr_null, NULL);
 }
 EXPORT_SYMBOL(v4l2_ctrl_new_int_menu);
diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls.h
index 59679a42b3e7..c35514c5bf88 100644
--- a/include/media/v4l2-ctrls.h
+++ b/include/media/v4l2-ctrls.h
@@ -211,7 +211,8 @@ typedef void (*v4l2_ctrl_notify_fnc)(struct v4l2_ctrl *ctrl, void *priv);
  *		except for dynamic arrays. In that case it is in the range of
  *		1 to @p_array_alloc_elems.
  * @dims:	The size of each dimension.
- * @nr_of_dims:The number of dimensions in @dims.
+ * @nr_of_dims: The number of dimensions in @dims.
+ * @fraction_bits: The number of fraction bits for fixed point values.
  * @menu_skip_mask: The control's skip mask for menu controls. This makes it
  *		easy to skip menu items that are not valid. If bit X is set,
  *		then menu item X is skipped. Of course, this only works for
@@ -228,6 +229,7 @@ typedef void (*v4l2_ctrl_notify_fnc)(struct v4l2_ctrl *ctrl, void *priv);
  *		:math:`ceil(\frac{maximum - minimum}{step}) + 1`.
  *		Used only if the @type is %V4L2_CTRL_TYPE_INTEGER_MENU.
  * @flags:	The control's flags.
+ * @fraction_bits: The number of fraction bits for fixed point values.
  * @priv:	The control's private pointer. For use by the driver. It is
  *		untouched by the control framework. Note that this pointer is
  *		not freed when the control is deleted. Should this be needed
@@ -286,6 +288,7 @@ struct v4l2_ctrl {
 	u32 new_elems;
 	u32 dims[V4L2_CTRL_MAX_DIMS];
 	u32 nr_of_dims;
+	u32 fraction_bits;
 	union {
 		u64 step;
 		u64 menu_skip_mask;
@@ -426,6 +429,7 @@ struct v4l2_ctrl_handler {
  * @dims:	The size of each dimension.
  * @elem_size:	The size in bytes of the control.
  * @flags:	The control's flags.
+ * @fraction_bits: The number of fraction bits for fixed point values.
  * @menu_skip_mask: The control's skip mask for menu controls. This makes it
  *		easy to skip menu items that are not valid. If bit X is set,
  *		then menu item X is skipped. Of course, this only works for
@@ -455,6 +459,7 @@ struct v4l2_ctrl_config {
 	u32 dims[V4L2_CTRL_MAX_DIMS];
 	u32 elem_size;
 	u32 flags;
+	u32 fraction_bits;
 	u64 menu_skip_mask;
 	const char * const *qmenu;
 	const s64 *qmenu_int;
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index a8015e5e7fa4..b8573e9ccde6 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -1947,7 +1947,8 @@ struct v4l2_query_ext_ctrl {
 	__u32                elems;
 	__u32                nr_of_dims;
 	__u32                dims[V4L2_CTRL_MAX_DIMS];
-	__u32		     reserved[32];
+	__u32                fraction_bits;
+	__u32		     reserved[31];
 };
 
 /*  Used in the VIDIOC_QUERYMENU ioctl for querying menu items */
-- 
2.34.1

