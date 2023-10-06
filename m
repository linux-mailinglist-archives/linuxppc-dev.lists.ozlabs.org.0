Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 16BB27BC0F0
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Oct 2023 23:06:17 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=cKc9DHqY;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S2LZG72Rtz3vgb
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 Oct 2023 08:06:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=cKc9DHqY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=devnull+nathanl.linux.ibm.com@kernel.org; receiver=lists.ozlabs.org)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S2LSW6XzZz30PJ
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  7 Oct 2023 08:01:15 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 3C29CB82A72;
	Fri,  6 Oct 2023 21:01:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8A17BC433CB;
	Fri,  6 Oct 2023 21:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696626071;
	bh=p08xip5llOn8avcZ/i/itHRMLmdBVkckMkou2Z5Hi8o=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=cKc9DHqYnRMTHmdLrGJhEp41+jbHvZiYqR9kahQCLgqmFUC9gEtz/458AQD7aYjsm
	 +PvhDiuP77UwpaOBi2D7scSTd3sO+UUlFWe2pxylEJUrUxLJPka33D9BMWqXbJll7/
	 ZAbBCLfKmqpmHwEDjQB84EDjPhkQ+rDEevgs3dqg/U8Fu15tn/gx87BGkCa5Cu/Gk6
	 nuojBQcZUV2FkxvGAJvSJA8lNBOfoQGBReTTqG425P/dfvVf3U26eF/T74TYf8oKhn
	 IGqp21g6VgeweWf0pohIgrF6Eh1MHBFFhfDBKy2gQsgn7c2R5nz1DZk1JC3LxV/1vP
	 vhbfXx43avZ7A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 766B0E9411B;
	Fri,  6 Oct 2023 21:01:11 +0000 (UTC)
From: Nathan Lynch via B4 Relay <devnull+nathanl.linux.ibm.com@kernel.org>
Date: Fri, 06 Oct 2023 16:01:07 -0500
Subject: [PATCH 4/7] powerpc/pseries/papr-sysparm: validate buffer object
 lengths
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id:  <20231006-papr-sys_rtas-vs-lockdown-v1-4-3a36bfb66e2e@linux.ibm.com>
References:  <20231006-papr-sys_rtas-vs-lockdown-v1-0-3a36bfb66e2e@linux.ibm.com>
In-Reply-To:  <20231006-papr-sys_rtas-vs-lockdown-v1-0-3a36bfb66e2e@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, 
 Nicholas Piggin <npiggin@gmail.com>, 
 =?utf-8?q?Michal_Such=C3=A1nek?= <msuchanek@suse.de>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1696626070; l=3564;
 i=nathanl@linux.ibm.com; s=20230817; h=from:subject:message-id;
 bh=6bbrgd0ovnUjw1itj15WIksclWVAl56tP1qwG+1R09U=;
 b=7yWFD6E0XhGaF5bGhQmIbPKUeIseq+a5oHUVltzOd6cUs0obeKkGX34jy/+C3RrPsmH7YHmtq
 tr0deufiAGYD66fp2sM25LOuXo3E/z7Pbl+FwxoNEl370o1rJ5IPMUq
X-Developer-Key: i=nathanl@linux.ibm.com; a=ed25519;
 pk=jPDF44RvT+9DGFOH3NGoIu1xN9dF+82pjdpnKjXfoJ0=
X-Endpoint-Received:  by B4 Relay for nathanl@linux.ibm.com/20230817 with auth_id=78
X-Original-From: Nathan Lynch <nathanl@linux.ibm.com>
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
Reply-To: nathanl@linux.ibm.com
Cc: Nathan Lynch <nathanl@linux.ibm.com>, tyreld@linux.ibm.com, gcwilson@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Nathan Lynch <nathanl@linux.ibm.com>

The ability to get and set system parameters will be exposed to user
space, so let's get a little more strict about malformed
papr_sysparm_buf objects.

* Create accessors for the length field of struct papr_sysparm_buf.
  The length is always stored in MSB order and this is better than
  spreading the necessary conversions all over.

* Reject attempts to submit invalid buffers to RTAS.

* Warn if RTAS returns a buffer with an invalid length, clamping the
  returned length to a safe value that won't overrun the buffer.

These are meant as precautionary measures to mitigate both firmware
and kernel bugs in this area, should they arise, but I am not aware of
any.

Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
---
 arch/powerpc/platforms/pseries/papr-sysparm.c | 47 +++++++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/arch/powerpc/platforms/pseries/papr-sysparm.c b/arch/powerpc/platforms/pseries/papr-sysparm.c
index fedc61599e6c..a1e7aeac7416 100644
--- a/arch/powerpc/platforms/pseries/papr-sysparm.c
+++ b/arch/powerpc/platforms/pseries/papr-sysparm.c
@@ -23,6 +23,46 @@ void papr_sysparm_buf_free(struct papr_sysparm_buf *buf)
 	kfree(buf);
 }
 
+static size_t papr_sysparm_buf_get_length(const struct papr_sysparm_buf *buf)
+{
+	return be16_to_cpu(buf->len);
+}
+
+static void papr_sysparm_buf_set_length(struct papr_sysparm_buf *buf, size_t length)
+{
+	WARN_ONCE(length > sizeof(buf->val),
+		  "bogus length %zu, clamping to safe value", length);
+	length = min(sizeof(buf->val), length);
+	buf->len = cpu_to_be16(length);
+}
+
+/*
+ * For use on buffers returned from ibm,get-system-parameter before
+ * returning them to callers. Ensures the encoded length of valid data
+ * cannot overrun buf->val[].
+ */
+static void papr_sysparm_buf_clamp_length(struct papr_sysparm_buf *buf)
+{
+	papr_sysparm_buf_set_length(buf, papr_sysparm_buf_get_length(buf));
+}
+
+/*
+ * Perform some basic diligence on the system parameter buffer before
+ * submitting it to RTAS.
+ */
+static bool papr_sysparm_buf_can_submit(const struct papr_sysparm_buf *buf)
+{
+	/*
+	 * Firmware ought to reject buffer lengths that exceed the
+	 * maximum specified in PAPR, but there's no reason for the
+	 * kernel to allow them either.
+	 */
+	if (papr_sysparm_buf_get_length(buf) > sizeof(buf->val))
+		return false;
+
+	return true;
+}
+
 /**
  * papr_sysparm_get() - Retrieve the value of a PAPR system parameter.
  * @param: PAPR system parameter token as described in
@@ -63,6 +103,9 @@ int papr_sysparm_get(papr_sysparm_t param, struct papr_sysparm_buf *buf)
 	if (token == RTAS_UNKNOWN_SERVICE)
 		return -ENOENT;
 
+	if (!papr_sysparm_buf_can_submit(buf))
+		return -EINVAL;
+
 	work_area = rtas_work_area_alloc(sizeof(*buf));
 
 	memcpy(rtas_work_area_raw_buf(work_area), buf, sizeof(*buf));
@@ -77,6 +120,7 @@ int papr_sysparm_get(papr_sysparm_t param, struct papr_sysparm_buf *buf)
 	case 0:
 		ret = 0;
 		memcpy(buf, rtas_work_area_raw_buf(work_area), sizeof(*buf));
+		papr_sysparm_buf_clamp_length(buf);
 		break;
 	case -3: /* parameter not implemented */
 		ret = -EOPNOTSUPP;
@@ -115,6 +159,9 @@ int papr_sysparm_set(papr_sysparm_t param, const struct papr_sysparm_buf *buf)
 	if (token == RTAS_UNKNOWN_SERVICE)
 		return -ENOENT;
 
+	if (!papr_sysparm_buf_can_submit(buf))
+		return -EINVAL;
+
 	work_area = rtas_work_area_alloc(sizeof(*buf));
 
 	memcpy(rtas_work_area_raw_buf(work_area), buf, sizeof(*buf));

-- 
2.41.0

