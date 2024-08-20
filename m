Return-Path: <linuxppc-dev+bounces-201-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 79AD5957BBA
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Aug 2024 05:04:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WnvSW2qByz2y7M;
	Tue, 20 Aug 2024 13:04:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2404:9400:2221:ea00::3"
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=TJnLdl5U;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WnvSW2fTjz2y7K
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Aug 2024 13:04:11 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1724123051;
	bh=j18FxuxXXJMOWMGzYuy1XXaguXnu+CDqwsfolFW8yPw=;
	h=From:To:Cc:Subject:Date:From;
	b=TJnLdl5UcrCgjvU63ZVQXCF1ofCK3w9mJviG/rZVuwaAKtp1bgOeSjdJuPFgUvgzd
	 kemIcAHqMrerA8ismK8KmApQPIkw2nxB7cDrEHYsyGZTE7vsrrD4IiM8lEbWvSozDD
	 tnNAwFAJyI3BzEtmBHy7U2wM1ABArdT+dpNj9s2vhxvNgbI3ZVU/PODux6ARuLkv1j
	 3AiiO8CpBpsUo4O9btT75QT5k4oUD2+znRMOGncZOk8ijD/VO7dEva199QK8+VnfSo
	 f9Jyt2CLYmoYMoXBY2c44T+oEvOJoh07i820ESWYCF9BCG1cwr2wnnS9UadvyY046p
	 jq+DTGWWTamIw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WnvSW1SKXz4wd6;
	Tue, 20 Aug 2024 13:04:11 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: cassel@kernel.org
Cc: dlemoal@kernel.org,
	linux-ide@vger.kernel.org,
	<linux-kernel@vger.kernel.org>,
	<linuxppc-dev@lists.ozlabs.org>,
	<hch@lst.de>,
	linux-ppc@kolla.no,
	vidra@ufal.mff.cuni.cz
Subject: [PATCH v2] ata: pata_macio: Use WARN instead of BUG
Date: Tue, 20 Aug 2024 13:04:07 +1000
Message-ID: <20240820030407.627785-1-mpe@ellerman.id.au>
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

v2: Use AC_ERR_SYSTEM as suggested by Damien.

diff --git a/drivers/ata/pata_macio.c b/drivers/ata/pata_macio.c
index 1cb8d24b088f..f2f36e55a1f4 100644
--- a/drivers/ata/pata_macio.c
+++ b/drivers/ata/pata_macio.c
@@ -554,7 +554,8 @@ static enum ata_completion_errors pata_macio_qc_prep(struct ata_queued_cmd *qc)
 
 		while (sg_len) {
 			/* table overflow should never happen */
-			BUG_ON (pi++ >= MAX_DCMDS);
+			if (WARN_ON_ONCE(pi >= MAX_DCMDS))
+				return AC_ERR_SYSTEM;
 
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
+		return AC_ERR_SYSTEM;
 
 	/* Convert the last command to an input/output */
 	table--;
-- 
2.46.0


