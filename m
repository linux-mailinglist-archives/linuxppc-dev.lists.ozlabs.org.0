Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D1D66335D4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Nov 2022 08:23:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NGbMl1Gbcz3cKW
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Nov 2022 18:23:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yPfXGdX3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=bombadil.srs.infradead.org (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=batv+ebc7d116b695001c1e40+7030+infradead.org+hch@bombadil.srs.infradead.org; receiver=<UNKNOWN>)
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NGbLh6Sr8z3bjH
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Nov 2022 18:22:33 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=HqZw6QjNhVlud5qPqR6r0zQXS78KEejps5D5OQSFJE4=; b=yPfXGdX35y5eSFwSBbKVGZetfS
	QyUGjDGd32deZXGKyDyft9GyccXOYZTFE0UnQ+/Yv8TvEzj+jDIs91S4tyU1ebxNyA36Z2WkdRZex
	t7mRaHSa9hmUwOm8yKmSjeDRPiQeJEmz2JC8pW3xPrrwpZaYlH2KMO6HtEPH4ZhJfpjbAUVw0hXBM
	w7BUqyRGVhbGhYD0rpoucuzPxCILL4Grdr5Ed3wzKOf58HQAvIBpcecUTGroJotbVRalBQF2NmQxT
	voQr67QGwvv7jokn28yJ05HZbeCk3zbS1YlKCG3HOtVYDk8YLTMAiRrAOn4opmXZtcOVUMfCSok8U
	q9u6X3+w==;
Received: from [2001:4bb8:199:6d04:dcd2:c84e:1bc9:2053] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxNbv-005XaW-NW; Tue, 22 Nov 2022 07:22:28 +0000
From: Christoph Hellwig <hch@lst.de>
To: geoff@infradead.org,
	mpe@ellerman.id.au,
	npiggin@gmail.com
Subject: [PATCH] powerpc/ps3: mark ps3_system_bus_type static
Date: Tue, 22 Nov 2022 08:22:25 +0100
Message-Id: <20221122072225.423432-1-hch@lst.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

ps3_system_bus_type is only used inside of system-bus.c, so remove
the external declaration and the very outdated comment next to it.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/powerpc/include/asm/ps3.h          | 4 ----
 arch/powerpc/platforms/ps3/system-bus.c | 2 +-
 2 files changed, 1 insertion(+), 5 deletions(-)

diff --git a/arch/powerpc/include/asm/ps3.h b/arch/powerpc/include/asm/ps3.h
index 8a0d8fb3532863..d503dbd7856cb8 100644
--- a/arch/powerpc/include/asm/ps3.h
+++ b/arch/powerpc/include/asm/ps3.h
@@ -425,10 +425,6 @@ static inline void *ps3_system_bus_get_drvdata(
 	return dev_get_drvdata(&dev->core);
 }
 
-/* These two need global scope for get_arch_dma_ops(). */
-
-extern struct bus_type ps3_system_bus_type;
-
 /* system manager */
 
 struct ps3_sys_manager_ops {
diff --git a/arch/powerpc/platforms/ps3/system-bus.c b/arch/powerpc/platforms/ps3/system-bus.c
index 2502e9b17df4ab..38a7e02295c8f2 100644
--- a/arch/powerpc/platforms/ps3/system-bus.c
+++ b/arch/powerpc/platforms/ps3/system-bus.c
@@ -466,7 +466,7 @@ static struct attribute *ps3_system_bus_dev_attrs[] = {
 };
 ATTRIBUTE_GROUPS(ps3_system_bus_dev);
 
-struct bus_type ps3_system_bus_type = {
+static struct bus_type ps3_system_bus_type = {
 	.name = "ps3_system_bus",
 	.match = ps3_system_bus_match,
 	.uevent = ps3_system_bus_uevent,
-- 
2.30.2

