Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DC7063D6E9D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Jul 2021 08:03:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GYmSP6Gk7z3bYQ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Jul 2021 16:03:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=EE3116pW;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=casper.srs.infradead.org (client-ip=2001:8b0:10b:1236::1;
 helo=casper.infradead.org;
 envelope-from=batv+120c431586dc67e47307+6547+infradead.org+hch@casper.srs.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=casper.20170209 header.b=EE3116pW; 
 dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GYmS06v0Wz2xZL
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Jul 2021 16:03:12 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=iOFMfubZNap8awOdEeuB+1FnsFdyWL++zNMgqZMjxF4=; b=EE3116pW/ZHDPtIu3qDf41HBYY
 FM1h6w0lGS5hR20ymFRp8+II4vtz6h1rmMOZNlfErtIdeBvb/oPG44XSrpAkC+qapz6QrTJCEvAm1
 MZp7LcMfaeb8HnfEiwT5Lq+uZmlc7UCoZpM37rQDaFBKdyYdiG0xQ/z0dTqca35oPiyHqDS9m86Mf
 s+7YlHRXNCu0qzQyK1sflfAYiEmSaOOArrx+dT5T9SylGjrBMZkW0an+ieci9UUu3AoXSXqFH70A7
 NzTS+NeWDqYH1rBzP4+4yN/vDJk30A4LjL9MKLseW5GMeoxAVVVhVLz+2VD4rMJiEUoozwhn4tkLN
 Z1PuNM5w==;
Received: from [2001:4bb8:184:87c5:b7fb:1299:a9e5:ff56] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m8G6e-00EiKC-9G; Tue, 27 Jul 2021 05:59:07 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH 01/15] MIPS: don't include <linux/genhd.h> in
 <asm/mach-rc32434/rb.h>
Date: Tue, 27 Jul 2021 07:56:32 +0200
Message-Id: <20210727055646.118787-2-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210727055646.118787-1-hch@lst.de>
References: <20210727055646.118787-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
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
Cc: linux-arch@vger.kernel.org, linux-block@vger.kernel.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>,
 Mike Snitzer <snitzer@redhat.com>, Geoff Levand <geoff@infradead.org>,
 linuxppc-dev@lists.ozlabs.org, ceph-devel@vger.kernel.org,
 linux-mips@vger.kernel.org, Dongsheng Yang <dongsheng.yang@easystack.cn>,
 linux-kernel@vger.kernel.org,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 dm-devel@redhat.com, "Martin K . Petersen" <martin.petersen@oracle.com>,
 Andrew Morton <akpm@linux-foundation.org>, Ira Weiny <ira.weiny@intel.com>,
 Ilya Dryomov <idryomov@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

There is no need to include genhd.h from a random arch header, and not
doing so prevents the possibility for nasty include loops.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
Reviewed-by: Martin K. Petersen <martin.petersen@oracle.com>
Reviewed-by: Ira Weiny <ira.weiny@intel.com>
---
 arch/mips/include/asm/mach-rc32434/rb.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/mips/include/asm/mach-rc32434/rb.h b/arch/mips/include/asm/mach-rc32434/rb.h
index d502673a4f6c..34d179ca020b 100644
--- a/arch/mips/include/asm/mach-rc32434/rb.h
+++ b/arch/mips/include/asm/mach-rc32434/rb.h
@@ -7,8 +7,6 @@
 #ifndef __ASM_RC32434_RB_H
 #define __ASM_RC32434_RB_H
 
-#include <linux/genhd.h>
-
 #define REGBASE		0x18000000
 #define IDT434_REG_BASE ((volatile void *) KSEG1ADDR(REGBASE))
 #define UART0BASE	0x58000
-- 
2.30.2

