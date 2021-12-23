Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CE96847DC47
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Dec 2021 01:40:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JKBDh5SQrz2ypX
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Dec 2021 11:40:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uASdYGx5;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2607:7c80:54:e::133; helo=bombadil.infradead.org;
 envelope-from=rdunlap@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=bombadil.20210309 header.b=uASdYGx5; 
 dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JKBD26m3Nz2xr8
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Dec 2021 11:39:46 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=y85KIQynpcqwkxXuxfk0jZty0aHUozStMeo+njW6LbM=; b=uASdYGx5J6gMiAAMBLOkzKVser
 iQZaeIa4AKA6lrmMEf4hZnKqKWOLyhBUjXcr4n/arXK9Np2UjeMgb1r5GSDZYb7BV8PPmVp6bkcBp
 cH+S9kyMxsHYaFELJMbUDGOfh9ZGUepcBR6Rz84JHUT8lnVCkJx3W9mt5nw0D8qP36TLJV/UppdVr
 Lbka5CVOABpu3/bkFMtX/ZUaV5IEvgS0jpqCXhZqSWBQTkRqVK8W41rHKm7znROAcwjdgQzubnEG+
 LvcVQd6xxE4rnTB5DlAmfzVhotGR9i7aehgHshNbu0B+A5klsKYQmENOXo21RMFpk3jZU4cZq+snY
 jryTAVqA==;
Received: from [2601:1c0:6280:3f0::aa0b] (helo=bombadil.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n0C91-00Bb5X-Ls; Thu, 23 Dec 2021 00:39:43 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc: fix spelling of "its"
Date: Wed, 22 Dec 2021 16:39:42 -0800
Message-Id: <20211223003942.22098-1-rdunlap@infradead.org>
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
Cc: Randy Dunlap <rdunlap@infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Use the possessive "its" instead of the contraction of "it is" (it's).

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/perf/hv-24x7.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-next-20211222.orig/arch/powerpc/perf/hv-24x7.c
+++ linux-next-20211222/arch/powerpc/perf/hv-24x7.c
@@ -756,7 +756,7 @@ static ssize_t catalog_event_len_validat
 	}
 
 	if (calc_ev_end > ev_end) {
-		pr_warn("event %zu exceeds it's own length: event=%pK, end=%pK, offset=%zu, calc_ev_end=%pK\n",
+		pr_warn("event %zu exceeds its own length: event=%pK, end=%pK, offset=%zu, calc_ev_end=%pK\n",
 			event_idx, event, ev_end, offset, calc_ev_end);
 		return -1;
 	}
