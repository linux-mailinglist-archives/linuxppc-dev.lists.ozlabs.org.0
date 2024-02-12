Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BF49850D36
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Feb 2024 05:32:29 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HJy+HGm8;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TYBQ30Z7nz3dC0
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Feb 2024 15:32:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HJy+HGm8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=rdunlap@infradead.org; receiver=lists.ozlabs.org)
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TYBNR4Dy0z2yVd
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Feb 2024 15:31:03 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=O+ppX+9FxVt0ChoDJ88PQbcPFT09KUvFH7ZhZ4SJ20U=; b=HJy+HGm8HxjsAAoLvpYdAKzJT+
	zfiQF6tDqDlWVWdYNYE6YthGatoa98LzxMFKSkfgzcxXuFNadaMtiMG7Mn9XtpbCx6t4pcIKLGgfP
	7BN5QgGCDj6c0XPqNLklNOi0oo6Keox0B2uvivfj5WeZcCpekHnLT5UVpJVsnRsSkAwYxUwi3R+16
	hHJQjR4saEl92DNWL/DBruC4sMXMzlXvzqXQvdpOlojjMF5wABSSdLoVr8mXT/9n1QPOb+arlrbH9
	axjOFna6oU0KeIJ3AopaG8AB1vg3w7viTlUxFV7i/aWVlBapknY1QdFXLFCsorfmODwqMGQLLSLip
	mfHOh09w==;
Received: from [50.53.50.0] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZNy9-00000004J78-2CXS;
	Mon, 12 Feb 2024 04:31:01 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 RESEND] soc: fsl: dpio: fix kernel-doc typos
Date: Sun, 11 Feb 2024 20:31:00 -0800
Message-ID: <20240212043100.28984-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.43.0
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
Cc: Roy Pledge <Roy.Pledge@nxp.com>, Randy Dunlap <rdunlap@infradead.org>, Frank Li <Frank.Li@nxp.com>, Li Yang <leoyang.li@nxp.com>, Guanhua Gao <guanhua.gao@nxp.com>, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Correct spelling of 2 words.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Li Yang <leoyang.li@nxp.com>
Cc: linuxppc-dev@lists.ozlabs.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: Frank Li <Frank.Li@nxp.com>
Cc: Guanhua Gao <guanhua.gao@nxp.com>
Cc: Roy Pledge <Roy.Pledge@nxp.com>
---
v2:  update Cc: list, rebase

 include/soc/fsl/dpaa2-io.h |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff -- a/include/soc/fsl/dpaa2-io.h b/include/soc/fsl/dpaa2-io.h
--- a/include/soc/fsl/dpaa2-io.h
+++ b/include/soc/fsl/dpaa2-io.h
@@ -22,7 +22,7 @@ struct device;
  * DOC: DPIO Service
  *
  * The DPIO service provides APIs for users to interact with the datapath
- * by enqueueing and dequeing frame descriptors.
+ * by enqueueing and dequeueing frame descriptors.
  *
  * The following set of APIs can be used to enqueue and dequeue frames
  * as well as producing notification callbacks when data is available
@@ -33,7 +33,7 @@ struct device;
 
 /**
  * struct dpaa2_io_desc - The DPIO descriptor
- * @receives_notifications: Use notificaton mode. Non-zero if the DPIO
+ * @receives_notifications: Use notification mode. Non-zero if the DPIO
  *                  has a channel.
  * @has_8prio:      Set to non-zero for channel with 8 priority WQs.  Ignored
  *                  unless receives_notification is TRUE.
