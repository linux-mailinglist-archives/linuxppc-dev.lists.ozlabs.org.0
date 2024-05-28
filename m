Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTP id 998038D28AD
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 May 2024 01:21:47 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=treblig.org header.i=@treblig.org header.a=rsa-sha256 header.s=bytemarkmx header.b=ZYwygdX6;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VppFQ1nZ8z79mZ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 May 2024 09:12:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=treblig.org header.i=@treblig.org header.a=rsa-sha256 header.s=bytemarkmx header.b=ZYwygdX6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=treblig.org (client-ip=2a00:1098:5b::1; helo=mx.treblig.org; envelope-from=linux@treblig.org; receiver=lists.ozlabs.org)
Received: from mx.treblig.org (mx.treblig.org [IPv6:2a00:1098:5b::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VppDZ0kqnz3dW8
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 May 2024 09:11:40 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
	:Subject; bh=3wUIq6xPCIaufvK7kGIrfKOEwglQoa8/BC0hS2GpGnc=; b=ZYwygdX6i2mjHuOg
	9KAkc4OvywX8+xDgcmCOxN+z7eWExNP0nnHD5fKMFc8hBtgGy+nyJRuqLFqHkAwqw2LcsNl6Yd+z9
	kW/Sy63lqc5HDgarrxyxvBU17cRbOIgKXArVYLFrQQlpNtyT+Gb2lRMr8nqXZAFV876WSxwPt7o0Y
	s4uOVigETN4QRGUUgEK8SY269Ril3I7R+PwVQWeoAkjC4/JWQlxIvHhTn91MKokPTCV3r+aaXTMIO
	MeTDvToH4WnMNXtrfilC2SxhZSqtwk50mjclgxEb0KVpsF/a1OSMe144eWQhtSrtqjWTSoqZ0qUgB
	s8Mu1VNpSbowa92Ndg==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
	by mx.treblig.org with esmtp (Exim 4.96)
	(envelope-from <linux@treblig.org>)
	id 1sC5yX-0033zb-0u;
	Tue, 28 May 2024 23:11:25 +0000
From: linux@treblig.org
To: sean.anderson@linux.dev,
	camelia.groza@nxp.com
Subject: [PATCH] soc/fsl/qbman: remove unused struct 'cgr_comp'
Date: Wed, 29 May 2024 00:11:23 +0100
Message-ID: <20240528231123.136664-1-linux@treblig.org>
X-Mailer: git-send-email 2.45.1
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
Cc: "Dr. David Alan Gilbert" <linux@treblig.org>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: "Dr. David Alan Gilbert" <linux@treblig.org>

'cgr_comp' has been unused since
commit 96f413f47677 ("soc/fsl/qbman: fix issue in
qman_delete_cgr_safe()").

Remove it.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 drivers/soc/fsl/qbman/qman.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/soc/fsl/qbman/qman.c b/drivers/soc/fsl/qbman/qman.c
index 7e9074519ad2..4dc8aba33d9b 100644
--- a/drivers/soc/fsl/qbman/qman.c
+++ b/drivers/soc/fsl/qbman/qman.c
@@ -2546,11 +2546,6 @@ int qman_delete_cgr(struct qman_cgr *cgr)
 }
 EXPORT_SYMBOL(qman_delete_cgr);
 
-struct cgr_comp {
-	struct qman_cgr *cgr;
-	struct completion completion;
-};
-
 static void qman_delete_cgr_smp_call(void *p)
 {
 	qman_delete_cgr((struct qman_cgr *)p);
-- 
2.45.1

