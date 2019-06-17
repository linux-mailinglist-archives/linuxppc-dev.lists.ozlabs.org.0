Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CCF948620
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Jun 2019 16:54:01 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45SDkF45rPzDqY6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jun 2019 00:53:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux-m68k.org
 (client-ip=195.130.132.45; helo=newton.telenet-ops.be;
 envelope-from=geert@linux-m68k.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=glider.be
Received: from newton.telenet-ops.be (newton.telenet-ops.be [195.130.132.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45SDhG28fwzDqWS
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jun 2019 00:52:12 +1000 (AEST)
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be
 [IPv6:2a02:1800:110:4::f00:19])
 by newton.telenet-ops.be (Postfix) with ESMTPS id 45SDh72070zMqvYC
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Jun 2019 16:52:07 +0200 (CEST)
Received: from ramsan ([84.194.111.163]) by laurent.telenet-ops.be with bizsmtp
 id Rqs52000E3XaVaC01qs5gl; Mon, 17 Jun 2019 16:52:06 +0200
Received: from rox.of.borg ([192.168.97.57]) by ramsan with esmtp (Exim 4.90_1)
 (envelope-from <geert@linux-m68k.org>)
 id 1hcszN-0002MC-Px; Mon, 17 Jun 2019 16:52:05 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
 (envelope-from <geert@linux-m68k.org>)
 id 1hcszN-0001mb-Ol; Mon, 17 Jun 2019 16:52:05 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Shuah Khan <shuah@kernel.org>
Subject: [PATCH] selftests/powerpc: Add missing newline at end of file
Date: Mon, 17 Jun 2019 16:52:04 +0200
Message-Id: <20190617145204.6810-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
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
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

"git diff" says:

    \ No newline at end of file

after modifying the file.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 tools/testing/selftests/powerpc/mm/.gitignore | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/powerpc/mm/.gitignore b/tools/testing/selftests/powerpc/mm/.gitignore
index ba919308fe3052f3..16861ab840f57e90 100644
--- a/tools/testing/selftests/powerpc/mm/.gitignore
+++ b/tools/testing/selftests/powerpc/mm/.gitignore
@@ -3,4 +3,4 @@ subpage_prot
 tempfile
 prot_sao
 segv_errors
-wild_bctr
\ No newline at end of file
+wild_bctr
-- 
2.17.1

