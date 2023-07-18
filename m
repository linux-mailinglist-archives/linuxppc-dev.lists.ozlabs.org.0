Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 45B87757CBF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jul 2023 15:06:10 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=m5dvqAwN;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R4zjD1FKjz3dTf
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jul 2023 23:06:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=m5dvqAwN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=ardb@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R4zZ64B88z3bX9
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jul 2023 22:59:58 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E5C3A61579;
	Tue, 18 Jul 2023 12:59:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0484EC433C7;
	Tue, 18 Jul 2023 12:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689685196;
	bh=GKaoOTrRRgm3th2yeQunqYwl7QvKD9b4yz/UgiWU3NQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=m5dvqAwNacmP9ofhTkW3T21chYyCqFIyw+EZKp42wVyn1aBnT5CMtykmkhXPBNAq/
	 dGkTWQjllhBsahtnxuWrT87+tMg5Aj23IVinvMXW8KOejUf8GgnDVVVmMVKVvh2QtE
	 R0+XyqV+Xe9Ab43eG/9cXVw4nBOiwYdiyBav7XTJ2PoskZrgMQQ8fTOZMOsQtUA1NO
	 yIPJjP9XtCxFVuinva0jPVu4cDhNmqsnTt8xiABPoaB0ZVmS+o/RqHoyAe5Fplb5Us
	 e4ZptUjNImOL1KKyHCWo/EJNvdPApIHEdnjfzLoE3LCknGqVwsN0292H46WRVCLqVX
	 ANtj4BazzH8OQ==
From: Ard Biesheuvel <ardb@kernel.org>
To: linux-crypto@vger.kernel.org
Subject: [RFC PATCH 06/21] ubifs: Avoid allocating buffer space unnecessarily
Date: Tue, 18 Jul 2023 14:58:32 +0200
Message-Id: <20230718125847.3869700-7-ardb@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230718125847.3869700-1-ardb@kernel.org>
References: <20230718125847.3869700-1-ardb@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1605; i=ardb@kernel.org; h=from:subject; bh=GKaoOTrRRgm3th2yeQunqYwl7QvKD9b4yz/UgiWU3NQ=; b=owGbwMvMwCFmkMcZplerG8N4Wi2JIWVbTwlX6/4+66t8K795H8qq3nyxPGW6+prOkJjeOC3pB VKTDl7pKGVhEONgkBVTZBGY/ffdztMTpWqdZ8nCzGFlAhnCwMUpABMJ38fIcIktU2XVksXxPvnz 7ZMjji6vymHbt3vhb8tlaW3L36gWdjAy/KlaojvPzyKk+4acZfHypV+1GfmK5ggkHxKI0X7uaXa XGwA=
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
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
Cc: Giovanni Cabiddu <giovanni.cabiddu@intel.com>, Eric Dumazet <edumazet@google.com>, linux-mtd@lists.infradead.org, Ard Biesheuvel <ardb@kernel.org>, Steffen Klassert <steffen.klassert@secunet.com>, Herbert Xu <herbert@gondor.apana.org.au>, Minchan Kim <minchan@kernel.org>, Richard Weinberger <richard@nod.at>, qat-linux@intel.com, Eric Biggers <ebiggers@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Kees Cook <keescook@chromium.org>, linux-block@vger.kernel.org, Nick Terrell <terrelln@fb.com>, Jens Axboe <axboe@kernel.dk>, netdev@vger.kernel.org, David Ahern <dsahern@kernel.org>, linux-kernel@vger.kernel.org, Sergey Senozhatsky <senozhatsky@chromium.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The recompression scratch buffer is only used when the data node is
compressed, and there is no need to allocate it otherwise. So move the
allocation into the branch of the if() that actually makes use of it.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 fs/ubifs/journal.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/fs/ubifs/journal.c b/fs/ubifs/journal.c
index 4e5961878f336033..5ce618f82aed201b 100644
--- a/fs/ubifs/journal.c
+++ b/fs/ubifs/journal.c
@@ -1485,16 +1485,9 @@ static int truncate_data_node(const struct ubifs_info *c, const struct inode *in
 			      unsigned int block, struct ubifs_data_node *dn,
 			      int *new_len, int dn_size)
 {
-	void *buf;
+	void *buf = NULL;
 	int err, dlen, compr_type, out_len, data_size;
 
-	out_len = le32_to_cpu(dn->size);
-	buf = kmalloc_array(out_len, WORST_COMPR_FACTOR, GFP_NOFS);
-	if (!buf)
-		return -ENOMEM;
-
-	out_len *= WORST_COMPR_FACTOR;
-
 	dlen = le32_to_cpu(dn->ch.len) - UBIFS_DATA_NODE_SZ;
 	data_size = dn_size - UBIFS_DATA_NODE_SZ;
 	compr_type = le16_to_cpu(dn->compr_type);
@@ -1508,6 +1501,13 @@ static int truncate_data_node(const struct ubifs_info *c, const struct inode *in
 	if (compr_type == UBIFS_COMPR_NONE) {
 		out_len = *new_len;
 	} else {
+		out_len = le32_to_cpu(dn->size);
+		buf = kmalloc_array(out_len, WORST_COMPR_FACTOR, GFP_NOFS);
+		if (!buf)
+			return -ENOMEM;
+
+		out_len *= WORST_COMPR_FACTOR;
+
 		err = ubifs_decompress(c, &dn->data, dlen, buf, &out_len, compr_type);
 		if (err)
 			goto out;
-- 
2.39.2

