Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B60215F0C4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Feb 2020 18:59:23 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48K1NR2FdyzDqR3
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Feb 2020 04:59:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=dUp1conf; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48Jyyh6l8PzDqVR
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Feb 2020 03:10:20 +1100 (AEDT)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 03ADB2468F;
 Fri, 14 Feb 2020 16:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1581696618;
 bh=VxGyWnEba5VNmYC+QZbrZ1DU0OE8ldnVhLLrAP06RRA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=dUp1confT9OiNuyhsL/IHtuZH1zvIMv/MEUqT/t2fGV8WDDAW9KwQO+OFdA9u2R4Y
 5Bmx+Z4wOLoIdxMMHMlXzDbN3eA/qoS/4qKbONQMQwjf7RZdytNwd5sqCOOs2d6snD
 II/c5eJxFsOZjDSPTvcV3mOV71DujtwObc6whJe4=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 400/459] powerpc/pseries/lparcfg: Fix display of
 Maximum Memory
Date: Fri, 14 Feb 2020 11:00:50 -0500
Message-Id: <20200214160149.11681-400-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200214160149.11681-1-sashal@kernel.org>
References: <20200214160149.11681-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, Michael Bringmann <mwb@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Michael Bringmann <mwb@linux.ibm.com>

[ Upstream commit f1dbc1c5c70d0d4c60b5d467ba941fba167c12f6 ]

Correct overflow problem in calculation and display of Maximum Memory
value to syscfg.

Signed-off-by: Michael Bringmann <mwb@linux.ibm.com>
[mpe: Only n_lmbs needs casting to unsigned long]
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Link: https://lore.kernel.org/r/5577aef8-1d5a-ca95-ff0a-9c7b5977e5bf@linux.ibm.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/powerpc/platforms/pseries/lparcfg.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/lparcfg.c b/arch/powerpc/platforms/pseries/lparcfg.c
index e33e8bc4b69bd..38c306551f76b 100644
--- a/arch/powerpc/platforms/pseries/lparcfg.c
+++ b/arch/powerpc/platforms/pseries/lparcfg.c
@@ -435,10 +435,10 @@ static void maxmem_data(struct seq_file *m)
 {
 	unsigned long maxmem = 0;
 
-	maxmem += drmem_info->n_lmbs * drmem_info->lmb_size;
+	maxmem += (unsigned long)drmem_info->n_lmbs * drmem_info->lmb_size;
 	maxmem += hugetlb_total_pages() * PAGE_SIZE;
 
-	seq_printf(m, "MaxMem=%ld\n", maxmem);
+	seq_printf(m, "MaxMem=%lu\n", maxmem);
 }
 
 static int pseries_lparcfg_data(struct seq_file *m, void *v)
-- 
2.20.1

