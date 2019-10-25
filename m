Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 46BCAE4976
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Oct 2019 13:11:39 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4701dh0TXRzDqkJ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Oct 2019 22:11:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux-m68k.org
 (client-ip=195.130.137.77; helo=leibniz.telenet-ops.be;
 envelope-from=geert@linux-m68k.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=glider.be
Received: from leibniz.telenet-ops.be (leibniz.telenet-ops.be [195.130.137.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4701ZP70YzzDqCh
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Oct 2019 22:08:43 +1100 (AEDT)
Received: from andre.telenet-ops.be (andre.telenet-ops.be
 [IPv6:2a02:1800:120:4::f00:15])
 by leibniz.telenet-ops.be (Postfix) with ESMTPS id 4701ZF5L2pzMrDJT
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Oct 2019 13:08:37 +0200 (CEST)
Received: from ramsan ([84.195.182.253]) by andre.telenet-ops.be with bizsmtp
 id Hn8b2100S5USYZQ01n8bdN; Fri, 25 Oct 2019 13:08:36 +0200
Received: from rox.of.borg ([192.168.97.57]) by ramsan with esmtp (Exim 4.90_1)
 (envelope-from <geert@linux-m68k.org>)
 id 1iNxSN-0003rD-Lf; Fri, 25 Oct 2019 13:08:35 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
 (envelope-from <geert@linux-m68k.org>)
 id 1iNvu3-0006Or-Vv; Fri, 25 Oct 2019 11:29:04 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Jiri Kosina <trivial@kernel.org>, Scott Wood <oss@buserror.net>
Subject: [PATCH trivial resend] powerpc/booke: Spelling s/date/data/
Date: Fri, 25 Oct 2019 11:29:01 +0200
Message-Id: <20191025092901.24560-1-geert+renesas@glider.be>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Caching dates is never a good idea ;-)

Fixes: e7affb1dba0e9068 ("powerpc/cache: add cache flush operation for various e500")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/powerpc/kernel/cpu_setup_fsl_booke.S | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/cpu_setup_fsl_booke.S b/arch/powerpc/kernel/cpu_setup_fsl_booke.S
index 2b4f3ec0acf7d988..1d308780e0d31eb9 100644
--- a/arch/powerpc/kernel/cpu_setup_fsl_booke.S
+++ b/arch/powerpc/kernel/cpu_setup_fsl_booke.S
@@ -231,7 +231,7 @@ _GLOBAL(__setup_cpu_e5500)
 	blr
 #endif
 
-/* flush L1 date cache, it can apply to e500v2, e500mc and e5500 */
+/* flush L1 data cache, it can apply to e500v2, e500mc and e5500 */
 _GLOBAL(flush_dcache_L1)
 	mfmsr	r10
 	wrteei	0
-- 
2.17.1

