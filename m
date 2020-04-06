Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C7CFA19F594
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Apr 2020 14:09:51 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48wq9863x0zDqWl
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Apr 2020 22:09:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=bombadil.srs.infradead.org (client-ip=2607:7c80:54:e::133;
 helo=bombadil.infradead.org;
 envelope-from=batv+f6ae1d3ed9d8f4aedd65+6070+infradead.org+hch@bombadil.srs.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lst.de
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48wq1m02GBzDqSk
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Apr 2020 22:03:23 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=X9T4vgxv3AED6WrMtBEfU9gKbzUFifrizTVGzClBy28=; b=lDBFdnMK7u5Ps2gCLlLSWzBICO
 NDp9wh6nvkix3LnCQc2911mE1kKuS6OWMmCXZ/SbIriHjG2y136Ouh1hSkJykTe2akQHQ0zXpEHyP
 SBk5zzkUJf8rM/AfM0a053N6JNxQCl6W3aDSMpVVSm6/cQSyvnsbjzWNfaWFBxHul25itMOg03dWy
 GH+PhZzfe1kKxhhXbeSsd0Fas7qNPH0AOC9wMkzEfdu96G05ZlwL2QFaxfcbOcmE61l7l0ZeGqODO
 hYAIuMXT79WPx07fJhI2LzxyTKtMG2jDFtjJ9zMonIeDIoDi08lEYMZ1SYSyvP8WfuTFjgAvdlB9w
 WmK+F0CQ==;
Received: from [2001:4bb8:180:5765:7ca0:239a:fe26:fec2] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jLQTG-0003Jb-SH; Mon, 06 Apr 2020 12:03:19 +0000
From: Christoph Hellwig <hch@lst.de>
To: Andrew Morton <akpm@linux-foundation.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>
Subject: [PATCH 2/6] binfmt_elf: open code copy_siginfo_to_user to kernelspace
 buffer
Date: Mon,  6 Apr 2020 14:03:08 +0200
Message-Id: <20200406120312.1150405-3-hch@lst.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200406120312.1150405-1-hch@lst.de>
References: <20200406120312.1150405-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
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
Cc: linux-fsdevel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 Jeremy Kerr <jk@ozlabs.org>, Arnd Bergmann <arnd@arndb.de>,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Instead of messing with the address limit just open code the trivial
memcpy + memset logic.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/binfmt_elf.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/fs/binfmt_elf.c b/fs/binfmt_elf.c
index f4713ea76e82..d744ce9a4b52 100644
--- a/fs/binfmt_elf.c
+++ b/fs/binfmt_elf.c
@@ -1556,10 +1556,9 @@ static void fill_auxv_note(struct memelfnote *note, struct mm_struct *mm)
 static void fill_siginfo_note(struct memelfnote *note, user_siginfo_t *csigdata,
 		const kernel_siginfo_t *siginfo)
 {
-	mm_segment_t old_fs = get_fs();
-	set_fs(KERNEL_DS);
-	copy_siginfo_to_user((user_siginfo_t __user *) csigdata, siginfo);
-	set_fs(old_fs);
+	memcpy(csigdata, siginfo, sizeof(struct kernel_siginfo));
+	memset((char *)csigdata + sizeof(struct kernel_siginfo), 0,
+		SI_EXPANSION_SIZE);
 	fill_note(note, "CORE", NT_SIGINFO, sizeof(*csigdata), csigdata);
 }
 
-- 
2.25.1

