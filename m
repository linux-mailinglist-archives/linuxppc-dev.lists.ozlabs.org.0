Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8950C64964
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Jul 2019 17:13:09 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45kN3l0tKrzDqMF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Jul 2019 01:13:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::442; helo=mail-pf1-x442.google.com;
 envelope-from=oohall@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="bqWFXMQD"; 
 dkim-atps=neutral
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45kMv45vq2zDqK6
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Jul 2019 01:05:36 +1000 (AEST)
Received: by mail-pf1-x442.google.com with SMTP id j2so1239951pfe.6
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Jul 2019 08:05:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OQkYrDXEoPAwahUlxQSh3bo+WaXqj1sBXJsMMIRkjL4=;
 b=bqWFXMQDp0txd8hirsascY1d4GCJId8RLV7ZU8r2wwJOkK+tP5KUXJA8AydLO9goG4
 cfQ/bcEHbaVXfY7zOwD5EJVXeCnsZfv/DJbcIlP7GobDaqfdCJzHqSYYiTD0JekQ5hfC
 6pEKDIzbZDCYzkinYvBO21qlp275Io/sztTC8m4/kVA/2BU/wOMyW+tlWEXOkypLsT57
 ZxhIyzaFYHY8AZEt7g++xw9gUnfYEaqDfme5NW03oZjGTDHR2ST0Uy2q3Oc4GBTmqK2C
 vNLNmo8k3gEa+f7YLLRwlkYO/fap0H4o9Fot/MdMdU6VzaCBIaLqzpjMqES+W5qvdajy
 Rshw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OQkYrDXEoPAwahUlxQSh3bo+WaXqj1sBXJsMMIRkjL4=;
 b=FRiSqe2np0V79NpRDXylidyl5MRfKXe1BWIx6CBIbJj5UhqrZKe2c/lgrRcURSZ0Il
 5kSXGCZBIXiloWonjD/iUXQ4cSJNIsYG8O9lzP3svVrZh9bw8VXIkTuBAMd7Yqqw2Bty
 1zlAfF7nbYODf1Co0y58yttewwjxlEuW7Gj452w8WSmrcGdw+/URRZlv9Rqknaismt0q
 SfumOwYd5buB/kluIIWNA62Vty4ImXtPKmfgWErxk+gRt8X4YZ9YY4xBfEBorJC/7RKC
 lYOPyV6clKenV51Jq+FiBQhe71Eg0v7QPUfJkdSpE0Tz7BVyRq30BzswLRcOlt7tS7em
 432g==
X-Gm-Message-State: APjAAAXjN1PDwU9wXUAKanWtjX/NFhyIGKBHWcatwIiwoEuSO2N83KWg
 rk2MrX0+9fTIhCGl1xhsiA4GC6wE
X-Google-Smtp-Source: APXvYqx4Fql17cuoC5a6bd5beAF2tI8PDMDyQlVhAQzDuSltdTIfsqTbLaqP5S86a8ET+1WYyAmvpA==
X-Received: by 2002:a63:f941:: with SMTP id q1mr38110557pgk.350.1562771131821; 
 Wed, 10 Jul 2019 08:05:31 -0700 (PDT)
Received: from 192-168-1-9.tpgi.com.au (123-243-231-26.tpgi.com.au.
 [123.243.231.26])
 by smtp.gmail.com with ESMTPSA id a3sm3347656pfo.49.2019.07.10.08.05.29
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 10 Jul 2019 08:05:31 -0700 (PDT)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/eeh: Handle hugepages in ioremap space
Date: Thu, 11 Jul 2019 01:05:17 +1000
Message-Id: <20190710150517.27114-1-oohall@gmail.com>
X-Mailer: git-send-email 2.21.0
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
Cc: Sachin Sant <sachinp@linux.vnet.ibm.com>,
 Oliver O'Halloran <oohall@gmail.com>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In commit 4a7b06c157a2 ("powerpc/eeh: Handle hugepages in ioremap
space") support for using hugepages in the vmalloc and ioremap areas was
enabled for radix. Unfortunately this broke EEH MMIO error checking.

Detection works by inserting a hook which checks the results of the
ioreadXX() set of functions.  When a read returns a 0xFFs response we
need to check for an error which we do by mapping the (virtual) MMIO
address back to a physical address, then mapping physical address to a
PCI device via an interval tree.

When translating virt -> phys we currently assume the ioremap space is
only populated by PAGE_SIZE mappings. If a hugepage mapping is found we
emit a WARN_ON(), but otherwise handles the check as though a normal
page was found. In pathalogical cases such as copying a buffer
containing a lot of 0xFFs from BAR memory this can result in the system
not booting because it's too busy printing WARN_ON()s.

There's no real reason to assume huge pages can't be present and we're
prefectly capable of handling them, so do that.

Cc: Nicholas Piggin <npiggin@gmail.com>
Fixes: 4a7b06c157a2 ("powerpc/eeh: Handle hugepages in ioremap space")
Reported-by: Sachin Sant <sachinp@linux.vnet.ibm.com>
Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
---
I'm assuming that we aren't going to be doing THP in the ioremap area.
---
 arch/powerpc/kernel/eeh.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/kernel/eeh.c b/arch/powerpc/kernel/eeh.c
index 4557fb1aeb2c..976ca0496442 100644
--- a/arch/powerpc/kernel/eeh.c
+++ b/arch/powerpc/kernel/eeh.c
@@ -354,10 +354,19 @@ static inline unsigned long eeh_token_to_phys(unsigned long token)
 	ptep = find_init_mm_pte(token, &hugepage_shift);
 	if (!ptep)
 		return token;
-	WARN_ON(hugepage_shift);
-	pa = pte_pfn(*ptep) << PAGE_SHIFT;
 
-	return pa | (token & (PAGE_SIZE-1));
+	pa = pte_pfn(*ptep);
+
+	/* On radix we can do hugepage mappings for io, so handle that */
+	if (hugepage_shift) {
+		pa <<= hugepage_shift;
+		pa |= token & ((1ul << hugepage_shift) - 1);
+	} else {
+		pa <<= PAGE_SHIFT;
+		pa |= token & (PAGE_SIZE - 1);
+	}
+
+	return pa;
 }
 
 /*
-- 
2.21.0

