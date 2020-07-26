Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4001B22DAFB
	for <lists+linuxppc-dev@lfdr.de>; Sun, 26 Jul 2020 02:44:04 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BDkhc03CczF1Nf
	for <lists+linuxppc-dev@lfdr.de>; Sun, 26 Jul 2020 10:44:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org;
 envelope-from=rdunlap@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=casper.20170209 header.b=etwC9UVe; 
 dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BDkZL1rlbzDrDN
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 26 Jul 2020 10:38:34 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=u2v0btuUs27+9chKj5MA8maE5KTIeN5cHiAZvmuqoA8=; b=etwC9UVeLF+u6Zd6kocW75bzAQ
 liAEQB7MnaQwdtR9j5C7133ZA6nn8+LlBrAiY6Oo32FjYrpMak+ycfYol1dY5a2Ha5tyPNawVGKwk
 b2GETPR81grpBn6ya8/0xJWw75WD5yI2n5rryXf3Q/396NnIaQtzDn5EbVGDQw/FRu7ro5X7ecifz
 9Wed//4V18RrFhiETjqNMbbCCGt0QRb0Bghh4YTSA971k6ldO6bABopQHYM1Huu4HUkBd0EZ66pBk
 F7mAy8TIRjxhe9x/luI3Kkt5LmCeMCXHEJU9y6+U/LWbmID8m/PfIzyo7rH3NZZirpBSAWp61DOBb
 7UnPiLsg==;
Received: from [2601:1c0:6280:3f0::19c2] (helo=smtpauth.infradead.org)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jzUgG-0003Cq-5n; Sun, 26 Jul 2020 00:38:20 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 4/9] powerpc: epapr_hcalls.h: delete duplicated words
Date: Sat, 25 Jul 2020 17:38:04 -0700
Message-Id: <20200726003809.20454-5-rdunlap@infradead.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200726003809.20454-1-rdunlap@infradead.org>
References: <20200726003809.20454-1-rdunlap@infradead.org>
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
Cc: Randy Dunlap <rdunlap@infradead.org>, Paul Mackerras <paulus@samba.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Drop the repeated words "file" and "the".

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Paul Mackerras <paulus@samba.org>
Cc: linuxppc-dev@lists.ozlabs.org
---
 arch/powerpc/include/asm/epapr_hcalls.h |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

--- linux-next-20200720.orig/arch/powerpc/include/asm/epapr_hcalls.h
+++ linux-next-20200720/arch/powerpc/include/asm/epapr_hcalls.h
@@ -37,7 +37,7 @@
  * SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
  */
 
-/* A "hypercall" is an "sc 1" instruction.  This header file file provides C
+/* A "hypercall" is an "sc 1" instruction.  This header file provides C
  * wrapper functions for the ePAPR hypervisor interface.  It is inteded
  * for use by Linux device drivers and other operating systems.
  *
@@ -246,7 +246,7 @@ static inline unsigned int ev_int_get_ma
  * ev_int_eoi - signal the end of interrupt processing
  * @interrupt: the interrupt number
  *
- * This function signals the end of processing for the the specified
+ * This function signals the end of processing for the specified
  * interrupt, which must be the interrupt currently in service. By
  * definition, this is also the highest-priority interrupt.
  *
