Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CE4F3233345
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Jul 2020 15:41:47 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BHWm918KGzDqNG
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Jul 2020 23:41:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gondor.apana.org.au (client-ip=216.24.177.18;
 helo=fornost.hmeau.com; envelope-from=herbert@gondor.apana.org.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=gondor.apana.org.au
Received: from fornost.hmeau.com (unknown [216.24.177.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BHVhM6DkqzDr0C
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Jul 2020 22:53:21 +1000 (AEST)
Received: from gwarestrin.arnor.me.apana.org.au ([192.168.0.7])
 by fornost.hmeau.com with smtp (Exim 4.92 #5 (Debian))
 id 1k183P-0006Z9-Of; Thu, 30 Jul 2020 22:53:00 +1000
Received: by gwarestrin.arnor.me.apana.org.au (sSMTP sendmail emulation);
 Thu, 30 Jul 2020 22:52:59 +1000
Date: Thu, 30 Jul 2020 22:52:59 +1000
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Li Yang <leoyang.li@nxp.com>, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
Subject: [PATCH] soc: fsl: Remove bogus packed attributes from qman.h
Message-ID: <20200730125259.GA8948@gondor.apana.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

There are two __packed attributes in qman.h that are both unnecessary
and causing compiler warnings because they're conflicting with
explicit alignment requirements set on members within the structure.

This patch removes them both.

Signed-off-by: Herbert Xu <herbert@gondor.apana.org.au>

diff --git a/include/soc/fsl/qman.h b/include/soc/fsl/qman.h
index cfe00e08e85b..d81ff185dc0b 100644
--- a/include/soc/fsl/qman.h
+++ b/include/soc/fsl/qman.h
@@ -256,7 +256,7 @@ struct qm_dqrr_entry {
 	__be32 context_b;
 	struct qm_fd fd;
 	u8 __reserved4[32];
-} __packed;
+};
 #define QM_DQRR_VERB_VBIT		0x80
 #define QM_DQRR_VERB_MASK		0x7f	/* where the verb contains; */
 #define QM_DQRR_VERB_FRAME_DEQUEUE	0x60	/* "this format" */
@@ -289,7 +289,7 @@ union qm_mr_entry {
 		__be32 tag;
 		struct qm_fd fd;
 		u8 __reserved1[32];
-	} __packed ern;
+	} ern;
 	struct {
 		u8 verb;
 		u8 fqs;		/* Frame Queue Status */
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
