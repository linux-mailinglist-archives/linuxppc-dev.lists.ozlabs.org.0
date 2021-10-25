Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B6FBC43A630
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Oct 2021 23:51:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HdTDL54Bfz3cmy
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Oct 2021 08:51:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HdTBm6PZtz2ynb
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Oct 2021 08:49:52 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
 by localhost (Postfix) with ESMTP id 4HdTBT5VJvz9s2X;
 Mon, 25 Oct 2021 23:49:37 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6yTr61mJL7ux; Mon, 25 Oct 2021 23:49:37 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.203.117])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (Client did not present a certificate)
 by pegase1.c-s.fr (Postfix) with ESMTPS id 4HdTBT3BbZz9s2S;
 Mon, 25 Oct 2021 23:49:36 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
 by PO20335.IDSI0.si.c-s.fr (8.16.1/8.16.1) with ESMTPS id 19PLnAIv007255
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Mon, 25 Oct 2021 23:49:12 +0200
Received: (from chleroy@localhost)
 by PO20335.IDSI0.si.c-s.fr (8.16.1/8.16.1/Submit) id 19PLiYBD007032;
 Mon, 25 Oct 2021 23:44:34 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to
 christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH v3 08/10] powerpc/fsl_booke: Allocate separate TLBCAMs for
 readonly memory
Date: Mon, 25 Oct 2021 23:44:20 +0200
Message-Id: <88d25497d80a7187725c7e08b86b7f51366cd9e4.1635198209.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <f34898e2edb21db1bcb1c9a96ac7433a141d50c2.1635198209.git.christophe.leroy@csgroup.eu>
References: <f34898e2edb21db1bcb1c9a96ac7433a141d50c2.1635198209.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1635198260; l=1825; s=20211009;
 h=from:subject:message-id; bh=Or6PqbOLc9GUOH2m6t0vW9BFnrj3cbeyCezL4Oe4UDg=;
 b=A4fIdEmH9G4+lcnH+xAHpCopFeiJucb66dqdq/7QDSBalFvufl1ufNtEDOCa4nMLdDHLbWooE5l3
 NbP5Ph7MBi+P38KTmSTw8y9Bb+UOsMSEC+Ld2kk7qoM6GrlHIysM
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519;
 pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Reorganise TLBCAM allocation so that when STRICT_KERNEL_RWX is
enabled, TLBCAMs are allocated such that readonly memory uses
different TLBCAMs.

This results in an allocation looking like:

Memory CAM mapping: 4/4/4/1/1/1/1/16/16/16/64/64/64/256/256 Mb, residual: 256Mb

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
v3: No change
v2: No change
---
 arch/powerpc/mm/nohash/fsl_book3e.c | 25 ++++++++++++++++++++++---
 1 file changed, 22 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/mm/nohash/fsl_book3e.c b/arch/powerpc/mm/nohash/fsl_book3e.c
index 8ae1ba7985df..88132cab3442 100644
--- a/arch/powerpc/mm/nohash/fsl_book3e.c
+++ b/arch/powerpc/mm/nohash/fsl_book3e.c
@@ -172,15 +172,34 @@ static unsigned long map_mem_in_cams_addr(phys_addr_t phys, unsigned long virt,
 {
 	int i;
 	unsigned long amount_mapped = 0;
+	unsigned long boundary;
+
+	if (strict_kernel_rwx_enabled())
+		boundary = (unsigned long)(_sinittext - _stext);
+	else
+		boundary = ram;
 
 	/* Calculate CAM values */
-	for (i = 0; ram && i < max_cam_idx; i++) {
+	for (i = 0; boundary && i < max_cam_idx; i++) {
+		unsigned long cam_sz;
+		pgprot_t prot = PAGE_KERNEL_X;
+
+		cam_sz = calc_cam_sz(boundary, virt, phys);
+		if (!dryrun)
+			settlbcam(i, virt, phys, cam_sz, pgprot_val(prot), 0);
+
+		boundary -= cam_sz;
+		amount_mapped += cam_sz;
+		virt += cam_sz;
+		phys += cam_sz;
+	}
+	for (ram -= amount_mapped; ram && i < max_cam_idx; i++) {
 		unsigned long cam_sz;
+		pgprot_t prot = PAGE_KERNEL_X;
 
 		cam_sz = calc_cam_sz(ram, virt, phys);
 		if (!dryrun)
-			settlbcam(i, virt, phys, cam_sz,
-				  pgprot_val(PAGE_KERNEL_X), 0);
+			settlbcam(i, virt, phys, cam_sz, pgprot_val(prot), 0);
 
 		ram -= cam_sz;
 		amount_mapped += cam_sz;
-- 
2.31.1

