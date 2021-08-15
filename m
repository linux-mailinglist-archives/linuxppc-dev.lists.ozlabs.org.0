Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 56C7F3ECBA9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Aug 2021 00:24:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GnsKX183tz3cHB
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Aug 2021 08:24:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rCc+gnCJ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2607:7c80:54:e::133; helo=bombadil.infradead.org;
 envelope-from=rdunlap@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=bombadil.20210309 header.b=rCc+gnCJ; 
 dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GnsJn0Tmwz2yMG
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Aug 2021 08:23:52 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=pTmqCP6bDwFCjXTWd+UHBKtuuPwOHDbSrKzlepP0BUE=; b=rCc+gnCJNt6uQBsnSfjHECCJaQ
 RR2RCy+gM9PIBaLzI6yeTNNaWpVxrHG2KZr8wDCjTivJqG4m3xg1jSgSUNR1nH7zmx9WqbGHxjXpk
 e2FtzH7M36jJIAE8dAVu6qvAGu59fh5h5yOW4p6ZUVdAtK5oQnultq+Bvr2TAMZeyI1ZMcbfAiDzA
 D0Qs7FCkRFrdPdPOaIXW7gC6MJ/HmZ6re9xerz+2afIszMMye0b4xki4gcaNH4B7Wvnzv62NeVqdt
 /6/7KP0QIgKNxc7m7sI2yQSMaW+P0LPnC2wMC5qniRTQFqqEJpegXvRhxYEeB98Pkvv+vOlmRkr9l
 Szdy269g==;
Received: from [2601:1c0:6280:3f0:e65e:37ff:febd:ee53]
 (helo=bombadil.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mFOXX-00Fj6S-CE; Sun, 15 Aug 2021 22:23:35 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] powerpc/head_check: use stdout for error messages
Date: Sun, 15 Aug 2021 15:23:34 -0700
Message-Id: <20210815222334.9575-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.31.1
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
Cc: "Chen, Rong A" <rong.a.chen@intel.com>,
 Randy Dunlap <rdunlap@infradead.org>, Nicholas Piggin <npiggin@gmail.com>,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Prefer stderr instead of stdout for error messages.
This is a good practice and can help CI error detecting and
reporting (0day in this case).

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: "Chen, Rong A" <rong.a.chen@intel.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Paul Mackerras <paulus@samba.org>
Cc: linuxppc-dev@lists.ozlabs.org
Cc: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/tools/head_check.sh |   12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

--- linux-next-20210813.orig/arch/powerpc/tools/head_check.sh
+++ linux-next-20210813/arch/powerpc/tools/head_check.sh
@@ -56,9 +56,9 @@ expected_start_head_addr=$vma
 start_head_addr=$(cat .tmp_symbols.txt | grep " t start_first_256B$" | cut -d' ' -f1)
 
 if [ "$start_head_addr" != "$expected_start_head_addr" ]; then
-	echo "ERROR: head code starts at $start_head_addr, should be $expected_start_head_addr"
-	echo "ERROR: try to enable LD_HEAD_STUB_CATCH config option"
-	echo "ERROR: see comments in arch/powerpc/tools/head_check.sh"
+	echo "ERROR: head code starts at $start_head_addr, should be $expected_start_head_addr" 1>&2
+	echo "ERROR: try to enable LD_HEAD_STUB_CATCH config option" 1>&2
+	echo "ERROR: see comments in arch/powerpc/tools/head_check.sh" 1>&2
 
 	exit 1
 fi
@@ -70,9 +70,9 @@ expected_start_text_addr=$(cat .tmp_symb
 start_text_addr=$(cat .tmp_symbols.txt | grep " t start_text$" | cut -d' ' -f1)
 
 if [ "$start_text_addr" != "$expected_start_text_addr" ]; then
-	echo "ERROR: start_text address is $start_text_addr, should be $expected_start_text_addr"
-	echo "ERROR: try to enable LD_HEAD_STUB_CATCH config option"
-	echo "ERROR: see comments in arch/powerpc/tools/head_check.sh"
+	echo "ERROR: start_text address is $start_text_addr, should be $expected_start_text_addr" 1>&2
+	echo "ERROR: try to enable LD_HEAD_STUB_CATCH config option" 1>&2
+	echo "ERROR: see comments in arch/powerpc/tools/head_check.sh" 1>&2
 
 	exit 1
 fi
