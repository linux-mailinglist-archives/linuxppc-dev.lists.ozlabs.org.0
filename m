Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 30B5142EE57
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Oct 2021 12:03:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HW20Z6Dmmz3bw7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Oct 2021 21:03:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HW1zz1DdSz2xX4
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Oct 2021 21:03:08 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4HW1zp5Xbmz9sSD;
 Fri, 15 Oct 2021 12:03:02 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rX1f5kAGc3cB; Fri, 15 Oct 2021 12:03:02 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4HW1zp4l5nz9sSC;
 Fri, 15 Oct 2021 12:03:02 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 8CC778B796;
 Fri, 15 Oct 2021 12:03:02 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id ey2xwhUVwRcF; Fri, 15 Oct 2021 12:03:02 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.202.255])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 400D48B763;
 Fri, 15 Oct 2021 12:03:02 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
 by PO20335.IDSI0.si.c-s.fr (8.16.1/8.16.1) with ESMTPS id 19FA2rTD2627031
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Fri, 15 Oct 2021 12:02:53 +0200
Received: (from chleroy@localhost)
 by PO20335.IDSI0.si.c-s.fr (8.16.1/8.16.1/Submit) id 19FA2r762627030;
 Fri, 15 Oct 2021 12:02:53 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to
 christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH v1 3/8] powerpc/fsl_booke: Take exec flag into account when
 setting TLBCAMs
Date: Fri, 15 Oct 2021 12:02:44 +0200
Message-Id: <5467044e59f27f9fcf709b9661779e3ce5f784f6.1634292136.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <d1ad9fdd9b27da3fdfa16510bb542ed51fa6e134.1634292136.git.christophe.leroy@csgroup.eu>
References: <d1ad9fdd9b27da3fdfa16510bb542ed51fa6e134.1634292136.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1634292164; l=1637; s=20211009;
 h=from:subject:message-id; bh=VUiN0zfWHKdX8tK6tRjCob92KrEVETuLqxzdrolREd4=;
 b=xKWOqX0i6+8039f5lceeYrOXTPNwddzaedZk2lrBqegFnNKAfZppoQE07hoGM1FhqREeDvXodj0x
 tr6trg73BiZiUmPPYP1xJLgUYVkCR4awXRGL6Jr7Lu2e5v2x+hug
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

Don't force MAS3_SX and MAS3_UX at all time. Take into account the
exec flag.

While at it, fix a couple of closeby style problems (indent with space
and unnecessary parenthesis), it keeps more readability.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/mm/nohash/fsl_book3e.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/mm/nohash/fsl_book3e.c b/arch/powerpc/mm/nohash/fsl_book3e.c
index 03dacbe940e5..fdf1029e62f0 100644
--- a/arch/powerpc/mm/nohash/fsl_book3e.c
+++ b/arch/powerpc/mm/nohash/fsl_book3e.c
@@ -122,15 +122,17 @@ static void settlbcam(int index, unsigned long virt, phys_addr_t phys,
 	TLBCAM[index].MAS2 |= (flags & _PAGE_GUARDED) ? MAS2_G : 0;
 	TLBCAM[index].MAS2 |= (flags & _PAGE_ENDIAN) ? MAS2_E : 0;
 
-	TLBCAM[index].MAS3 = (phys & MAS3_RPN) | MAS3_SX | MAS3_SR;
-	TLBCAM[index].MAS3 |= ((flags & _PAGE_RW) ? MAS3_SW : 0);
+	TLBCAM[index].MAS3 = (phys & MAS3_RPN) | MAS3_SR;
+	TLBCAM[index].MAS3 |= (flags & _PAGE_BAP_SX) ? MAS3_SX : 0;
+	TLBCAM[index].MAS3 |= (flags & _PAGE_RW) ? MAS3_SW : 0;
 	if (mmu_has_feature(MMU_FTR_BIG_PHYS))
 		TLBCAM[index].MAS7 = (u64)phys >> 32;
 
 	/* Below is unlikely -- only for large user pages or similar */
 	if (pte_user(__pte(flags))) {
-	   TLBCAM[index].MAS3 |= MAS3_UX | MAS3_UR;
-	   TLBCAM[index].MAS3 |= ((flags & _PAGE_RW) ? MAS3_UW : 0);
+		TLBCAM[index].MAS3 |= MAS3_UR;
+		TLBCAM[index].MAS3 |= (flags & _PAGE_EXEC) ? MAS3_UX : 0;
+		TLBCAM[index].MAS3 |= (flags & _PAGE_RW) ? MAS3_UW : 0;
 	}
 
 	tlbcam_addrs[index].start = virt;
-- 
2.31.1

