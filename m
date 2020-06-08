Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2219A1F2287
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jun 2020 01:09:46 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49gpqT756bzDqQv
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jun 2020 09:09:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=Qw225oKv; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49gpmL4kKxzDqQk
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Jun 2020 09:06:58 +1000 (AEST)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 40E6720842;
 Mon,  8 Jun 2020 23:06:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1591657616;
 bh=l4UrxZfPytW7PlaB2VeAq30RXCOzD1wa7DQI7P+EKhQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Qw225oKv1tBngdkVT2YvDqZlHfZBpcNREI7ipI6UPfl9PXNVki0m6kAhUmTywou3O
 UQj5JgYkHpOzJ8VOPgcD07vEdRB2IZkQi2+qJL6Ib68fY2K5RNDdDvt/PZXbtzuE7w
 90vxWZFDKQqb0CvzhsnwxVQ5NAmC7ykz8dZPDuHA=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.7 038/274] soc: fsl: dpio: properly compute the
 consumer index
Date: Mon,  8 Jun 2020 19:02:11 -0400
Message-Id: <20200608230607.3361041-38-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200608230607.3361041-1-sashal@kernel.org>
References: <20200608230607.3361041-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, Li Yang <leoyang.li@nxp.com>,
 Ioana Ciornei <ioana.ciornei@nxp.com>, linuxppc-dev@lists.ozlabs.org,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Ioana Ciornei <ioana.ciornei@nxp.com>

[ Upstream commit 7596ac9d19a9df25707ecaac0675881f62dd8c18 ]

Mask the consumer index before using it. Without this, we would be
writing frame descriptors beyond the ring size supported by the QBMAN
block.

Fixes: 3b2abda7d28c ("soc: fsl: dpio: Replace QMAN array mode with ring mode enqueue")
Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
Acked-by: Li Yang <leoyang.li@nxp.com>
Signed-off-by: David S. Miller <davem@davemloft.net>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/soc/fsl/dpio/qbman-portal.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/fsl/dpio/qbman-portal.c b/drivers/soc/fsl/dpio/qbman-portal.c
index 804b8ba9bf5c..23a1377971f4 100644
--- a/drivers/soc/fsl/dpio/qbman-portal.c
+++ b/drivers/soc/fsl/dpio/qbman-portal.c
@@ -669,6 +669,7 @@ int qbman_swp_enqueue_multiple_direct(struct qbman_swp *s,
 		eqcr_ci = s->eqcr.ci;
 		p = s->addr_cena + QBMAN_CENA_SWP_EQCR_CI;
 		s->eqcr.ci = qbman_read_register(s, QBMAN_CINH_SWP_EQCR_CI);
+		s->eqcr.ci &= full_mask;
 
 		s->eqcr.available = qm_cyc_diff(s->eqcr.pi_ring_size,
 					eqcr_ci, s->eqcr.ci);
-- 
2.25.1

