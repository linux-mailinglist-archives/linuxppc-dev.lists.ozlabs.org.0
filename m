Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ADCA528C82B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Oct 2020 07:14:56 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C9Nyg31fQzDqnx
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Oct 2020 16:14:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C9NwT0Y6XzDqg7
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Oct 2020 16:12:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=neuling.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=neuling.org header.i=@neuling.org header.a=rsa-sha256
 header.s=201811 header.b=AftGI4GL; dkim-atps=neutral
Received: from neuling.org (localhost [127.0.0.1])
 by ozlabs.org (Postfix) with ESMTP id 4C9NwR6BrTz9sTr;
 Tue, 13 Oct 2020 16:12:55 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=neuling.org;
 s=201811; t=1602565976;
 bh=Ffqd4hXCoAPgLS4eS0R3VPQY6UYl3q0HkeF9N/L79fA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=AftGI4GL1rpdjAz9z/FmlE/fIEAXlkC/Sb+yOzVatsFcalQwePLE0JAx1X4bOPA5t
 gng55pmi90oRIf7dJFH9Tb4Xbzzuo1xI/zItpmhvsDy3iBFIC4S1Yp3i/brbbWZRqa
 cTcL4OtOwI470raarNu+UyvWY+GbgL3zpIqJ/ubSqZRzDagePWWs2S6t4KbxoXwWMQ
 aCjSfTab4we8lBKCcJ+qnNbiXgFZZvFGak25YzxpZtjbGiHh6U41/Jrl7qlHMFURzo
 Wqm9e+gWCZdAYggtNyE5tpr8TSf4jMuVPuz6FNhDEb3nTT+ghJ+G4tLlZYtZ63HYFQ
 HmNCOF//D0t2Q==
Received: by neuling.org (Postfix, from userid 1000)
 id 2EFEA2C031D; Tue, 13 Oct 2020 15:37:43 +1100 (AEDT)
From: Michael Neuling <mikey@neuling.org>
To: mpe@ellerman.id.au
Subject: [PATCH 2/2] selftests/powerpc: Make alignment handler test P9N DD2.1
 vector CI load workaround
Date: Tue, 13 Oct 2020 15:37:41 +1100
Message-Id: <20201013043741.743413-2-mikey@neuling.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201013043741.743413-1-mikey@neuling.org>
References: <20201013043741.743413-1-mikey@neuling.org>
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
Cc: mikey@neuling.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

alignment_handler currently only tests the unaligned cases but it can
also be useful for testing the workaround for the P9N DD2.1 vector CI
load issue fixed by p9_hmi_special_emu(). This workaround was
introduced in 5080332c2c89 ("powerpc/64s: Add workaround for P9 vector
CI load issue").

This changes the loop to start from offset 0 rather than 1 so that we
test the kernel emulation in p9_hmi_special_emu().

Signed-off-by: Michael Neuling <mikey@neuling.org>
---
 .../selftests/powerpc/alignment/alignment_handler.c       | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/powerpc/alignment/alignment_handler.c b/tools/testing/selftests/powerpc/alignment/alignment_handler.c
index 2a0503bc7e49..cb53a8b777e6 100644
--- a/tools/testing/selftests/powerpc/alignment/alignment_handler.c
+++ b/tools/testing/selftests/powerpc/alignment/alignment_handler.c
@@ -266,8 +266,12 @@ int do_test(char *test_name, void (*test_func)(char *, char *))
 	}
 
 	rc = 0;
-	/* offset = 0 no alignment fault, so skip */
-	for (offset = 1; offset < 16; offset++) {
+	/*
+	 * offset = 0 is aligned but tests the workaround for the P9N
+	 * DD2.1 vector CI load issue (see 5080332c2c89 "powerpc/64s:
+	 * Add workaround for P9 vector CI load issue")
+	 */
+	for (offset = 0; offset < 16; offset++) {
 		width = 16; /* vsx == 16 bytes */
 		r = 0;
 
-- 
2.26.2

