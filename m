Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E493250457
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Aug 2020 19:01:12 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BZz0h5VVrzDqLf
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Aug 2020 03:01:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=qHa1y1Nb; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BZyX03YtQzDqPN
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Aug 2020 02:39:44 +1000 (AEST)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A5EBC22C9F;
 Mon, 24 Aug 2020 16:39:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598287182;
 bh=UHGPWOeMMPesFHOhN85ifiETrCaVltIOD1OiXejC61g=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=qHa1y1NbZd3c/pBuiBwKoGpFW2R6bicXWDVdGA0fk8tFCHLMAlb6Jadb+46pyAiK/
 tBJwTn4aAB6q9m3vLIKrSuqPrPKO8QDEWeJBNFk8nYcgJUhaCjBYAc6M19YoeqAn4o
 Rfg0Uf9f6vzNl88aiGbMsZhGyuMyLq1UHB9G0/9A=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.9 8/8] powerpc/perf: Fix soft lockups due to missed
 interrupt accounting
Date: Mon, 24 Aug 2020 12:39:31 -0400
Message-Id: <20200824163931.607291-8-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200824163931.607291-1-sashal@kernel.org>
References: <20200824163931.607291-1-sashal@kernel.org>
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>,
 Athira Rajeev <atrajeev@linux.vnet.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 Sasha Levin <sashal@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>

[ Upstream commit 17899eaf88d689529b866371344c8f269ba79b5f ]

Performance monitor interrupt handler checks if any counter has
overflown and calls record_and_restart() in core-book3s which invokes
perf_event_overflow() to record the sample information. Apart from
creating sample, perf_event_overflow() also does the interrupt and
period checks via perf_event_account_interrupt().

Currently we record information only if the SIAR (Sampled Instruction
Address Register) valid bit is set (using siar_valid() check) and
hence the interrupt check.

But it is possible that we do sampling for some events that are not
generating valid SIAR, and hence there is no chance to disable the
event if interrupts are more than max_samples_per_tick. This leads to
soft lockup.

Fix this by adding perf_event_account_interrupt() in the invalid SIAR
code path for a sampling event. ie if SIAR is invalid, just do
interrupt check and don't record the sample information.

Reported-by: Alexey Kardashevskiy <aik@ozlabs.ru>
Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Tested-by: Alexey Kardashevskiy <aik@ozlabs.ru>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Link: https://lore.kernel.org/r/1596717992-7321-1-git-send-email-atrajeev@linux.vnet.ibm.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/powerpc/perf/core-book3s.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/powerpc/perf/core-book3s.c b/arch/powerpc/perf/core-book3s.c
index ba49ae6625f1b..a10b67df83bae 100644
--- a/arch/powerpc/perf/core-book3s.c
+++ b/arch/powerpc/perf/core-book3s.c
@@ -2042,6 +2042,10 @@ static void record_and_restart(struct perf_event *event, unsigned long val,
 
 		if (perf_event_overflow(event, &data, regs))
 			power_pmu_stop(event, 0);
+	} else if (period) {
+		/* Account for interrupt in case of invalid SIAR */
+		if (perf_event_account_interrupt(event))
+			power_pmu_stop(event, 0);
 	}
 }
 
-- 
2.25.1

