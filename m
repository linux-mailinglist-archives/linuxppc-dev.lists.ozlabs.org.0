Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A5BB2BD0CA
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Sep 2019 19:41:28 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46d7ln1stLzDqWx
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Sep 2019 03:41:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kernel.org
 (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="x7AezjFQ"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46d6Y659ZfzDqTW
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Sep 2019 02:47:06 +1000 (AEST)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C0D9620673;
 Tue, 24 Sep 2019 16:47:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1569343624;
 bh=gZEbCzvR1/O4Ovsw88o4m4Y9SV68i6dLQbo8HdTZnv0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=x7AezjFQ8mFXox+A+ohH1vYUf9j3/zw5abkL2QfPMUiQvkf0B0VlBLZFo0xhRQzpi
 ByQLvt3049g/nIEwhOuRJRsBMN39E1UQML5x3kdR/A9NfDEk2Ane93iAUtuG2+hm4c
 WQU1+cyQRmAqt3r/L5IMhoCAjaHKJdUd89ZOu+8I=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.2 32/70] powerpc/xmon: Check for HV mode when
 dumping XIVE info from OPAL
Date: Tue, 24 Sep 2019 12:45:11 -0400
Message-Id: <20190924164549.27058-32-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190924164549.27058-1-sashal@kernel.org>
References: <20190924164549.27058-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Sasha Levin <sashal@kernel.org>, linuxppc-dev@lists.ozlabs.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Cédric Le Goater <clg@kaod.org>

[ Upstream commit c3e0dbd7f780a58c4695f1cd8fc8afde80376737 ]

Currently, the xmon 'dx' command calls OPAL to dump the XIVE state in
the OPAL logs and also outputs some of the fields of the internal XIVE
structures in Linux. The OPAL calls can only be done on baremetal
(PowerNV) and they crash a pseries machine. Fix by checking the
hypervisor feature of the CPU.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Link: https://lore.kernel.org/r/20190814154754.23682-2-clg@kaod.org
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/powerpc/xmon/xmon.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
index 4a721fd624069..e15ccf19c1533 100644
--- a/arch/powerpc/xmon/xmon.c
+++ b/arch/powerpc/xmon/xmon.c
@@ -2532,13 +2532,16 @@ static void dump_pacas(void)
 static void dump_one_xive(int cpu)
 {
 	unsigned int hwid = get_hard_smp_processor_id(cpu);
-
-	opal_xive_dump(XIVE_DUMP_TM_HYP, hwid);
-	opal_xive_dump(XIVE_DUMP_TM_POOL, hwid);
-	opal_xive_dump(XIVE_DUMP_TM_OS, hwid);
-	opal_xive_dump(XIVE_DUMP_TM_USER, hwid);
-	opal_xive_dump(XIVE_DUMP_VP, hwid);
-	opal_xive_dump(XIVE_DUMP_EMU_STATE, hwid);
+	bool hv = cpu_has_feature(CPU_FTR_HVMODE);
+
+	if (hv) {
+		opal_xive_dump(XIVE_DUMP_TM_HYP, hwid);
+		opal_xive_dump(XIVE_DUMP_TM_POOL, hwid);
+		opal_xive_dump(XIVE_DUMP_TM_OS, hwid);
+		opal_xive_dump(XIVE_DUMP_TM_USER, hwid);
+		opal_xive_dump(XIVE_DUMP_VP, hwid);
+		opal_xive_dump(XIVE_DUMP_EMU_STATE, hwid);
+	}
 
 	if (setjmp(bus_error_jmp) != 0) {
 		catch_memory_errors = 0;
-- 
2.20.1

