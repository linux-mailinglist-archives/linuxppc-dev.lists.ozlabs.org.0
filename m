Return-Path: <linuxppc-dev+bounces-171-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B134795681B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Aug 2024 12:19:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WnT964VPrz2xy6;
	Mon, 19 Aug 2024 20:19:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2404:9400:2221:ea00::3"
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Uhqe6piA;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WnT964NTNz2xxr
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Aug 2024 20:19:22 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1724062758;
	bh=LK7wkpPSnBuGzhxGUxSmpc4/F155DFfTozWzyWzCmxc=;
	h=From:To:Cc:Subject:Date:From;
	b=Uhqe6piAwiCldj5DGb+CeWuX9vI7vJvQqWj48r0RhE2ynRo1eZhssPJv3YmzHI3JR
	 nIXVImJBw3kRF8O7lUQ5CaIJ0jAHAHX5BI+b9n07DRIdKJB/tTjk3PATmDl2Ojd0c3
	 Ddy1mrw6xGaO5TCK4rEDr9Wde1y+DUBw6DqnnoBOoLkWE51ThGsK9xDyCrVXY5j9g3
	 /6KkZibg0T2v8gkwb2P4cQNY132/htHQfSkLLdp/MVdxS4RAStO2NcJ2pmaB9IuSOn
	 PPc/BcXP3Bd5tC1lhfWsZKFJ/+2hrn5RAoPj4AMU2MB46vlOP2q4jIVlZQ6CaZYnID
	 KFupb+Oymw10A==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WnT9203KRz4w2N;
	Mon, 19 Aug 2024 20:19:17 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: cassel@kernel.org
Cc: dlemoal@kernel.org,
	linux-ide@vger.kernel.org,
	<linux-kernel@vger.kernel.org>,
	<linuxppc-dev@lists.ozlabs.org>,
	<hch@lst.de>,
	linux-ppc@kolla.no,
	vidra@ufal.mff.cuni.cz
Subject: [RFC PATCH] ata: pata_macio: Use WARN instead of BUG
Date: Mon, 19 Aug 2024 20:19:13 +1000
Message-ID: <20240819101913.489513-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.46.0
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The overflow/underflow conditions in pata_macio_qc_prep() should never
happen. But if they do there's no need to kill the system entirely, a
WARN and failing the IO request should be sufficient and might allow the
system to keep running.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 drivers/ata/pata_macio.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

Not sure if AC_ERR_OTHER is the right error code to use?

diff --git a/drivers/ata/pata_macio.c b/drivers/ata/pata_macio.c
index eaffa510de49..552e3ac0d391 100644
--- a/drivers/ata/pata_macio.c
+++ b/drivers/ata/pata_macio.c
@@ -554,7 +554,8 @@ static enum ata_completion_errors pata_macio_qc_prep(struct ata_queued_cmd *qc)
 
 		while (sg_len) {
 			/* table overflow should never happen */
-			BUG_ON (pi++ >= MAX_DCMDS);
+			if (WARN_ON_ONCE(pi >= MAX_DCMDS))
+				return AC_ERR_OTHER;
 
 			len = (sg_len < MAX_DBDMA_SEG) ? sg_len : MAX_DBDMA_SEG;
 			table->command = cpu_to_le16(write ? OUTPUT_MORE: INPUT_MORE);
@@ -566,11 +567,13 @@ static enum ata_completion_errors pata_macio_qc_prep(struct ata_queued_cmd *qc)
 			addr += len;
 			sg_len -= len;
 			++table;
+			++pi;
 		}
 	}
 
 	/* Should never happen according to Tejun */
-	BUG_ON(!pi);
+	if (WARN_ON_ONCE(!pi))
+		return AC_ERR_OTHER;
 
 	/* Convert the last command to an input/output */
 	table--;
-- 
2.46.0


