Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C07222DB06
	for <lists+linuxppc-dev@lfdr.de>; Sun, 26 Jul 2020 02:55:36 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BDkxw6tCrzDrDX
	for <lists+linuxppc-dev@lfdr.de>; Sun, 26 Jul 2020 10:55:32 +1000 (AEST)
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
 header.s=casper.20170209 header.b=fQo6zQkS; 
 dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BDkZX0wJWzDqst
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 26 Jul 2020 10:38:44 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=sH3Q5iTjYfBvYZxROArpXeVz46XzFFrdUeQmFmyUWrU=; b=fQo6zQkS2cVLXjK+Ueg+9onuVe
 ZcohwyfF+STjTR/8y6CdOYR62bE3i0m4qwLg0SrIYbr66/ypRSKhHs+BBn4EpJ7a7i7Bz5yIn/+Zu
 T+Jui9Vg+XEjGkeJm+yx/5R15RjsoR2lxbzvewFB/+EAhcy9gjTiZHODwxi/LgtXAwyIzBlMhHYy0
 71mi/QgiYnZ0MK997QCKGbKJD6k8201rVYub7n1zcpRalCAunFdfUs5Z/LjH3BURSL0Q4JtDCj721
 Y/v1szVasSz2e71f28XKeQXepsGlOPJOsejKpt0iLG7qX9htIazsHhd/YrBr6rpLLGYm4tP6CdnhO
 bx87hjjw==;
Received: from [2601:1c0:6280:3f0::19c2] (helo=smtpauth.infradead.org)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jzUgQ-0003Cq-07; Sun, 26 Jul 2020 00:38:30 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 9/9] powerpc: powernv: pci.h: delete duplicated word
Date: Sat, 25 Jul 2020 17:38:09 -0700
Message-Id: <20200726003809.20454-10-rdunlap@infradead.org>
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

Drop the repeated word "for".

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Paul Mackerras <paulus@samba.org>
Cc: linuxppc-dev@lists.ozlabs.org
---
 arch/powerpc/platforms/powernv/pci.h |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-next-20200720.orig/arch/powerpc/platforms/powernv/pci.h
+++ linux-next-20200720/arch/powerpc/platforms/powernv/pci.h
@@ -87,7 +87,7 @@ struct pnv_ioda_pe {
 	bool			tce_bypass_enabled;
 	uint64_t		tce_bypass_base;
 
-	/* MSIs. MVE index is identical for for 32 and 64 bit MSI
+	/* MSIs. MVE index is identical for 32 and 64 bit MSI
 	 * and -1 if not supported. (It's actually identical to the
 	 * PE number)
 	 */
