Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 56C98BD116
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Sep 2019 19:58:01 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46d86t5qHmzDqRs
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Sep 2019 03:57:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kernel.org
 (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="VQbofE0M"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46d6Yz1KR4zDqTb
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Sep 2019 02:47:51 +1000 (AEST)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 250ED20673;
 Tue, 24 Sep 2019 16:47:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1569343669;
 bh=szCeKCu1HOCfG8Xa5dhnSRI7Vdwm04GAxX3XtKErotk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=VQbofE0MsdjroR/zv5valnd6YlN+3HpXlkjL3pBpvUItK7EF66CfoTI1E2/pzGuiJ
 gPopTmzcFRfCTLpGRP1/JaAoSYQ3CDwJPquOF3tw5w+g+YTeW6ODNsus5G/KkfxbqO
 a2F9G1rVDzELCfOGiQILmmwMV9WlTaq/O2/zA2Z0=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.2 48/70] selftests/powerpc: Retry on host facility
 unavailable
Date: Tue, 24 Sep 2019 12:45:27 -0400
Message-Id: <20190924164549.27058-48-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190924164549.27058-1-sashal@kernel.org>
References: <20190924164549.27058-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>,
 "Desnes A . Nunes do Rosario" <desnesn@linux.ibm.com>,
 Gustavo Romero <gromero@linux.vnet.ibm.com>, linux-kselftest@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Gustavo Romero <gromero@linux.vnet.ibm.com>

[ Upstream commit 6652bf6408895b09d31fd4128a1589a1a0672823 ]

TM test tm-unavailable must take into account aborts due to host aborting
a transactin because of a facility unavailable exception, just like it
already does for aborts on reschedules (TM_CAUSE_KVM_RESCHED).

Reported-by: Desnes A. Nunes do Rosario <desnesn@linux.ibm.com>
Tested-by: Desnes A. Nunes do Rosario <desnesn@linux.ibm.com>
Signed-off-by: Gustavo Romero <gromero@linux.vnet.ibm.com>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Link: https://lore.kernel.org/r/1566341651-19747-1-git-send-email-gromero@linux.vnet.ibm.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 tools/testing/selftests/powerpc/tm/tm.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/powerpc/tm/tm.h b/tools/testing/selftests/powerpc/tm/tm.h
index 97f9f491c541a..c402464b038fc 100644
--- a/tools/testing/selftests/powerpc/tm/tm.h
+++ b/tools/testing/selftests/powerpc/tm/tm.h
@@ -55,7 +55,8 @@ static inline bool failure_is_unavailable(void)
 static inline bool failure_is_reschedule(void)
 {
 	if ((failure_code() & TM_CAUSE_RESCHED) == TM_CAUSE_RESCHED ||
-	    (failure_code() & TM_CAUSE_KVM_RESCHED) == TM_CAUSE_KVM_RESCHED)
+	    (failure_code() & TM_CAUSE_KVM_RESCHED) == TM_CAUSE_KVM_RESCHED ||
+	    (failure_code() & TM_CAUSE_KVM_FAC_UNAV) == TM_CAUSE_KVM_FAC_UNAV)
 		return true;
 
 	return false;
-- 
2.20.1

