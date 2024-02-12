Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C7E7A850D33
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Feb 2024 05:31:47 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gl/KlI5n;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TYBPF5QnDz3bt2
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Feb 2024 15:31:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=rdunlap@infradead.org; receiver=lists.ozlabs.org)
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TYBNK5cCPz2yVd
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Feb 2024 15:30:55 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=K9RNZrjlQWEBnvc1kEhCFcqKAhg1GOG9b2dv8n13vIE=; b=gl/KlI5nmtzS0gxwXS2PXLNk8s
	hCIopXrAr1Bn92aRSCpT6M4p14Rw/iLW5XP1cD+YBYS8qY8cWexT8n7JdQyxthsKNlJfCl6MUBxb4
	6TqjxdVGk5Av/CPHvcT1kL3NT7NBpwjMf4ewVe/EpyqDcgot5AVqEqm+lBcpww7d+SUmR28yNOHIs
	Mt4hoJ/fDkO28Rg+p5frMlz90ijfdj6C9z6ZyhNwTnHd6wJy7ScyP+jOm+/18Ynw4JuijQB+++FGH
	a5Ugux0odmu0kLIhSgAT1qoIWG7ib/wGJ/z8oXFMbggKIre1QjMelGflIsf4wf4d55gL+qxCQqCnx
	o7fJEIog==;
Received: from [50.53.50.0] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZNxy-00000004J3s-364K;
	Mon, 12 Feb 2024 04:30:50 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 RESEND] soc: fsl: fix kernel-doc warnings and typos
Date: Sun, 11 Feb 2024 20:30:50 -0800
Message-ID: <20240212043050.28964-1-rdunlap@infradead.org>
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

Correct spelling of "list".

Fix a kernel-doc warning by describing the nested structure completely:

include/soc/fsl/dpaa2-fd.h:52: warning: Function parameter or member 'simple' not described in 'dpaa2_fd'

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Li Yang <leoyang.li@nxp.com>
Cc: linuxppc-dev@lists.ozlabs.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: Frank Li <Frank.Li@nxp.com>
Cc: Guanhua Gao <guanhua.gao@nxp.com>
Cc: Roy Pledge <Roy.Pledge@nxp.com>
---
v2:  update Cc: list, rebase

 include/soc/fsl/dpaa2-fd.h |   19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff -- a/include/soc/fsl/dpaa2-fd.h b/include/soc/fsl/dpaa2-fd.h
--- a/include/soc/fsl/dpaa2-fd.h
+++ b/include/soc/fsl/dpaa2-fd.h
@@ -25,14 +25,15 @@
 
 /**
  * struct dpaa2_fd - Struct describing FDs
- * @words:         for easier/faster copying the whole FD structure
- * @addr:          address in the FD
- * @len:           length in the FD
- * @bpid:          buffer pool ID
- * @format_offset: format, offset, and short-length fields
- * @frc:           frame context
- * @ctrl:          control bits...including dd, sc, va, err, etc
- * @flc:           flow context address
+ * @words:                for easier/faster copying the whole FD structure
+ * @simple:               struct for the FD fields
+ * @simple.addr:          address in the FD
+ * @simple.len:           length in the FD
+ * @simple.bpid:          buffer pool ID
+ * @simple.format_offset: format, offset, and short-length fields
+ * @simple.frc:           frame context
+ * @simple.ctrl:          control bits...including dd, sc, va, err, etc
+ * @simple.flc:           flow context address
  *
  * This structure represents the basic Frame Descriptor used in the system.
  */
@@ -497,7 +498,7 @@ static inline void dpaa2_fl_set_addr(str
  * dpaa2_fl_get_frc() - Get the frame context in the FLE
  * @fle: the given frame list entry
  *
- * Return the frame context field in the frame lsit entry.
+ * Return the frame context field in the frame list entry.
  */
 static inline u32 dpaa2_fl_get_frc(const struct dpaa2_fl_entry *fle)
 {
