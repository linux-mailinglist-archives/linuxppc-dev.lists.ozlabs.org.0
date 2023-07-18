Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AD747757CBB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jul 2023 15:05:21 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=SDalzP/Y;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R4zhH41ZLz3dL8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jul 2023 23:05:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=SDalzP/Y;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=ardb@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R4zZ16qzSz30MD
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jul 2023 22:59:53 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4EB4F6157C;
	Tue, 18 Jul 2023 12:59:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D366C433CA;
	Tue, 18 Jul 2023 12:59:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689685191;
	bh=ODoi2e+vcqIb799pflsdMhm1nGdkubtWgbUegajrVfU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SDalzP/YaXdnw/eO5FhMttHT+uo4cUQ0HEfzV/eVDhjrh2vL2AqqxXcAqh13yqJn4
	 AVbM5TSLu3q0pr2cIE2wClirkeGHzrnHwdeCo5pdmULzTvNEpku6b70jtE1ArlykWc
	 iaLRyhhRjQiHzGqDFnFYCpXBS8sZnvAGylTxo/SCUEVIt3zDITwUPYFYeNX441iuA5
	 UPvKWFmqWGmWjFjxj3GAvUxK0AMTKP3bw+ZiMK2blBchprVp/PM9vi8CkYksqH9lwv
	 0KW/Y7eXnjmHRBPOokrRrf/vKW7znD2how5Rm7j4/YU0ipme/NjIaZ8mn9lIi/NwrT
	 dtMt3ZU+yjBpQ==
From: Ard Biesheuvel <ardb@kernel.org>
To: linux-crypto@vger.kernel.org
Subject: [RFC PATCH 05/21] ubifs: Pass worst-case buffer size to compression routines
Date: Tue, 18 Jul 2023 14:58:31 +0200
Message-Id: <20230718125847.3869700-6-ardb@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230718125847.3869700-1-ardb@kernel.org>
References: <20230718125847.3869700-1-ardb@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1089; i=ardb@kernel.org; h=from:subject; bh=ODoi2e+vcqIb799pflsdMhm1nGdkubtWgbUegajrVfU=; b=owGbwMvMwCFmkMcZplerG8N4Wi2JIWVbT9FzF2aeyo1FL46LhUf9emTqUM1q5dWwJ2Dzr1cTG sRaswQ7SlkYxDgYZMUUWQRm/3238/REqVrnWbIwc1iZQIYwcHEKwETqRRgZriduT8+o3D0pY5fL upjHTB/UclQ3ycjOPOLy0+e+sqX/b4Z/Wgf3MzUs1I/L09XztZ/lvWNdMcPstI16pS5bDvIdeTO NGwA=
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

Currently, the ubifs code allocates a worst case buffer size to
recompress a data node, but does not pass the size of that buffer to the
compression code. This means that the compression code will never use
the additional space, and might fail spuriously due to lack of space.

So let's multiply out_len by WORST_COMPR_FACTOR after allocating the
buffer. Doing so is guaranteed not to overflow, given that the preceding
kmalloc_array() call would have failed otherwise.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 fs/ubifs/journal.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/fs/ubifs/journal.c b/fs/ubifs/journal.c
index dc52ac0f4a345f30..4e5961878f336033 100644
--- a/fs/ubifs/journal.c
+++ b/fs/ubifs/journal.c
@@ -1493,6 +1493,8 @@ static int truncate_data_node(const struct ubifs_info *c, const struct inode *in
 	if (!buf)
 		return -ENOMEM;
 
+	out_len *= WORST_COMPR_FACTOR;
+
 	dlen = le32_to_cpu(dn->ch.len) - UBIFS_DATA_NODE_SZ;
 	data_size = dn_size - UBIFS_DATA_NODE_SZ;
 	compr_type = le16_to_cpu(dn->compr_type);
-- 
2.39.2

