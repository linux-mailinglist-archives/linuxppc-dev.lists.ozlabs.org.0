Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1940C3C2FC2
	for <lists+linuxppc-dev@lfdr.de>; Sat, 10 Jul 2021 04:31:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GMDZ474tkz3dR5
	for <lists+linuxppc-dev@lfdr.de>; Sat, 10 Jul 2021 12:31:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=MoSHurKj;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=MoSHurKj; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GMDYh1TSyz2yNL
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 10 Jul 2021 12:31:36 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 74CDB613B7;
 Sat, 10 Jul 2021 02:31:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625884294;
 bh=jwxkV8jZGl94FlM/nlAXZjfg9eIq3wI2w8TCMXtD7B8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=MoSHurKjWSTrJVA+Qj0qjPVK5mNcvCHc25eIj6XVhKxf/amy9DUzBeE7D0YPqqKvQ
 zcxMIfetuHzfca+Cv5HEkkeQS9j6ZmXL+0TiL76vlb368+IiuF3LokT1oayETi8OYa
 vCgA7TU13aDzZLU2GKgs8+17XbOcOTfKc+nEPBtSZjzmkwfXD/Iy6lAnlyJbGGnc4h
 1PccOd1436zexafXJraklaVpVyIs8C6brmTC3K0qvztHBQ85MfcrSQrSl97uryXACP
 eAbMcixYIHfqoWGGr5dCRFykGsBmrCs1Pqs/IqgBMb6Sx9vp+BOc4TR6Ju66aD/LHj
 36ddNuldAOQgg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 40/63] selftests/powerpc: Fix "no_handler" EBB
 selftest
Date: Fri,  9 Jul 2021 22:26:46 -0400
Message-Id: <20210710022709.3170675-40-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210710022709.3170675-1-sashal@kernel.org>
References: <20210710022709.3170675-1-sashal@kernel.org>
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
 Athira Rajeev <atrajeev@linux.vnet.ibm.com>,
 Shirisha Ganta <shirisha.ganta1@ibm.com>, linux-kselftest@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>

[ Upstream commit 45677c9aebe926192e59475b35a1ff35ff2d4217 ]

The "no_handler_test" in ebb selftests attempts to read the PMU
registers twice via helper function "dump_ebb_state". First dump is
just before closing of event and the second invocation is done after
closing of the event. The original intention of second
dump_ebb_state was to dump the state of registers at the end of
the test when the counters are frozen. But this will be achieved
with the first call itself since sample period is set to low value
and PMU will be frozen by then. Hence patch removes the
dump which was done before closing of the event.

Reported-by: Shirisha Ganta <shirisha.ganta1@ibm.com>
Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Tested-by: Nageswara R Sastry <rnsastry@linux.ibm.com <mailto:rnsastry@linux.ibm.com>>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Link: https://lore.kernel.org/r/1621950703-1532-2-git-send-email-atrajeev@linux.vnet.ibm.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 tools/testing/selftests/powerpc/pmu/ebb/no_handler_test.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/tools/testing/selftests/powerpc/pmu/ebb/no_handler_test.c b/tools/testing/selftests/powerpc/pmu/ebb/no_handler_test.c
index fc5bf4870d8e..01e827c31169 100644
--- a/tools/testing/selftests/powerpc/pmu/ebb/no_handler_test.c
+++ b/tools/testing/selftests/powerpc/pmu/ebb/no_handler_test.c
@@ -50,8 +50,6 @@ static int no_handler_test(void)
 
 	event_close(&event);
 
-	dump_ebb_state();
-
 	/* The real test is that we never took an EBB at 0x0 */
 
 	return 0;
-- 
2.30.2

