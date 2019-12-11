Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D1EE011B961
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Dec 2019 17:58:25 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Y3670QrYzDqJc
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Dec 2019 03:58:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="zUi4a0kP"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Y1742p0nzDqPM
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Dec 2019 02:29:04 +1100 (AEDT)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E79A6222C4;
 Wed, 11 Dec 2019 15:29:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1576078142;
 bh=V3c61UjcYe4scFRc07uwvsawsHuVtrB91ryO+pxN9bs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=zUi4a0kPU/sXMIbBPqx5ZPhAgsU+BKehomgZ8kOckr9vhAkoTgMH0R0yXO2qqBKHz
 uNxeryu+amonz5Y7/HClhaMvud7eGn73yp8x+Kv4/685tWG71NVlcILTMKs5BtBoyi
 MLTID55iJXlCalQ02BhFav68xccAb6ZEeG7hdMVI=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.14 29/58] powerpc/security: Fix wrong message when
 RFI Flush is disable
Date: Wed, 11 Dec 2019 10:28:02 -0500
Message-Id: <20191211152831.23507-29-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191211152831.23507-1-sashal@kernel.org>
References: <20191211152831.23507-1-sashal@kernel.org>
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
Cc: "Gustavo L. F. Walbon" <gwalbon@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, Sasha Levin <sashal@kernel.org>,
 "Mauro S . M . Rodrigues" <maurosr@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: "Gustavo L. F. Walbon" <gwalbon@linux.ibm.com>

[ Upstream commit 4e706af3cd8e1d0503c25332b30cad33c97ed442 ]

The issue was showing "Mitigation" message via sysfs whatever the
state of "RFI Flush", but it should show "Vulnerable" when it is
disabled.

If you have "L1D private" feature enabled and not "RFI Flush" you are
vulnerable to meltdown attacks.

"RFI Flush" is the key feature to mitigate the meltdown whatever the
"L1D private" state.

SEC_FTR_L1D_THREAD_PRIV is a feature for Power9 only.

So the message should be as the truth table shows:

  CPU | L1D private | RFI Flush |                sysfs
  ----|-------------|-----------|-------------------------------------
   P9 |    False    |   False   | Vulnerable
   P9 |    False    |   True    | Mitigation: RFI Flush
   P9 |    True     |   False   | Vulnerable: L1D private per thread
   P9 |    True     |   True    | Mitigation: RFI Flush, L1D private per thread
   P8 |    False    |   False   | Vulnerable
   P8 |    False    |   True    | Mitigation: RFI Flush

Output before this fix:
  # cat /sys/devices/system/cpu/vulnerabilities/meltdown
  Mitigation: RFI Flush, L1D private per thread
  # echo 0 > /sys/kernel/debug/powerpc/rfi_flush
  # cat /sys/devices/system/cpu/vulnerabilities/meltdown
  Mitigation: L1D private per thread

Output after fix:
  # cat /sys/devices/system/cpu/vulnerabilities/meltdown
  Mitigation: RFI Flush, L1D private per thread
  # echo 0 > /sys/kernel/debug/powerpc/rfi_flush
  # cat /sys/devices/system/cpu/vulnerabilities/meltdown
  Vulnerable: L1D private per thread

Signed-off-by: Gustavo L. F. Walbon <gwalbon@linux.ibm.com>
Signed-off-by: Mauro S. M. Rodrigues <maurosr@linux.vnet.ibm.com>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Link: https://lore.kernel.org/r/20190502210907.42375-1-gwalbon@linux.ibm.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/powerpc/kernel/security.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/arch/powerpc/kernel/security.c b/arch/powerpc/kernel/security.c
index fef3f09fc238b..b3f540c9f4109 100644
--- a/arch/powerpc/kernel/security.c
+++ b/arch/powerpc/kernel/security.c
@@ -134,26 +134,22 @@ ssize_t cpu_show_meltdown(struct device *dev, struct device_attribute *attr, cha
 
 	thread_priv = security_ftr_enabled(SEC_FTR_L1D_THREAD_PRIV);
 
-	if (rfi_flush || thread_priv) {
+	if (rfi_flush) {
 		struct seq_buf s;
 		seq_buf_init(&s, buf, PAGE_SIZE - 1);
 
-		seq_buf_printf(&s, "Mitigation: ");
-
-		if (rfi_flush)
-			seq_buf_printf(&s, "RFI Flush");
-
-		if (rfi_flush && thread_priv)
-			seq_buf_printf(&s, ", ");
-
+		seq_buf_printf(&s, "Mitigation: RFI Flush");
 		if (thread_priv)
-			seq_buf_printf(&s, "L1D private per thread");
+			seq_buf_printf(&s, ", L1D private per thread");
 
 		seq_buf_printf(&s, "\n");
 
 		return s.len;
 	}
 
+	if (thread_priv)
+		return sprintf(buf, "Vulnerable: L1D private per thread\n");
+
 	if (!security_ftr_enabled(SEC_FTR_L1D_FLUSH_HV) &&
 	    !security_ftr_enabled(SEC_FTR_L1D_FLUSH_PR))
 		return sprintf(buf, "Not affected\n");
-- 
2.20.1

