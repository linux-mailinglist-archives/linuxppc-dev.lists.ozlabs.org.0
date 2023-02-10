Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E559E6925C1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Feb 2023 19:49:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PD2ny5wzmz3fCb
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Feb 2023 05:49:10 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=HSVe1nx3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=devnull+nathanl.linux.ibm.com@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=HSVe1nx3;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PD2dw4D44z3f3g
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Feb 2023 05:42:12 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 32E2461E8F;
	Fri, 10 Feb 2023 18:42:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 02BD6C433EF;
	Fri, 10 Feb 2023 18:42:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676054528;
	bh=8I3d5rJJH3JRSEksF6GQBQ0ybMKlybE4nL3m/SYekfw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=HSVe1nx3GigPTadNtRKIdaWPWWHecpuy4Npong9LTuVm+/hz3OW2tLFjTrGzRabZw
	 dwzJWf4XHBZ8c8gSME1AfpgcuvZqcRIYxUKEalwFzvkD4Hjhg3LgW53ib1CHU5Apz3
	 8qM0fuuScWI2K3qnvbTrAuDnmdcru96hxHTcslHT3ZGbXSt6/925y+pVVOdH7gjzBN
	 DIPZcJy+YPbIhrzF3+pgnj4Az50wFp/Fm5i8FmAB/TglmipmiQ8fFXZkID75giodPF
	 k7qjHD3a9H0KxB2M+nSDnGC3NNAub0lbeNpkZsHKC2KVxBX2PIkqLCU/CC45kpEJos
	 uX68LFaMAbrmA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E52D3C05027;
	Fri, 10 Feb 2023 18:42:07 +0000 (UTC)
From: Nathan Lynch via B4 Submission Endpoint
 <devnull+nathanl.linux.ibm.com@kernel.org>
Date: Fri, 10 Feb 2023 12:41:54 -0600
Subject: [PATCH v3 06/20] powerpc/rtas: ensure 4KB alignment for
 rtas_data_buf
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230125-b4-powerpc-rtas-queue-v3-6-26929c8cce78@linux.ibm.com>
References: <20230125-b4-powerpc-rtas-queue-v3-0-26929c8cce78@linux.ibm.com>
In-Reply-To: <20230125-b4-powerpc-rtas-queue-v3-0-26929c8cce78@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, 
 Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Kajol Jain <kjain@linux.ibm.com>, Laurent Dufour <ldufour@linux.ibm.com>, 
 Mahesh J Salgaonkar <mahesh@linux.ibm.com>, 
 Andrew Donnellan <ajd@linux.ibm.com>, Nick Child <nnac123@linux.ibm.com>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1676054526; l=1665;
 i=nathanl@linux.ibm.com; s=20230206; h=from:subject:message-id;
 bh=MuO1pgar3FlbS4OavZYSdZbOByAYz8Q4+MRmu2VnP30=;
 b=0lR9vO5RPmy0r2K/vyhJTkMnYnGMXGKFK9a/HUbw8hjqt1pRURjpPVm4a7c+30iHe26m5/y8u
 B6ReltycigZC0+dH0+DjFGt+P5a/Acbelkde4nBMC4iYot8u2/8Kycg
X-Developer-Key: i=nathanl@linux.ibm.com; a=ed25519;
 pk=6daubz/ymoaMF+8voz7UHwnhluEsmDZuqygIIMWpQQY=
X-Endpoint-Received:  by B4 Submission Endpoint for nathanl@linux.ibm.com/20230206 with auth_id=27
X-Original-From: Nathan Lynch <nathanl@linux.ibm.com>
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
Reply-To: nathanl@linux.ibm.com
Cc: Nathan Lynch <nathanl@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Nathan Lynch <nathanl@linux.ibm.com>

Some RTAS functions that have work area parameters impose alignment
requirements on the work area passed to them by the OS. Examples
include:

- ibm,configure-connector
- ibm,update-nodes
- ibm,update-properties

4KB is the greatest alignment required by PAPR for such
buffers. rtas_data_buf used to have a __page_aligned attribute in the
arch/ppc64 days, but that was changed to __cacheline_aligned for
unknown reasons by commit 033ef338b6e0 ("powerpc: Merge rtas.c into
arch/powerpc/kernel"). That works out to 128-byte alignment
on ppc64, which isn't right.

This was found by inspection and I'm not aware of any real problems
caused by this. Either current RTAS implementations don't enforce the
alignment constraints, or rtas_data_buf is always being placed at a
4KB boundary by accident (or both, perhaps).

Use __aligned(SZ_4K) to ensure the rtas_data_buf has alignment
appropriate for all users.

Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
Fixes: 033ef338b6e0 ("powerpc: Merge rtas.c into arch/powerpc/kernel")
---
 arch/powerpc/kernel/rtas.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
index 86aff1cb8a0d..cce7f69b4ba1 100644
--- a/arch/powerpc/kernel/rtas.c
+++ b/arch/powerpc/kernel/rtas.c
@@ -75,7 +75,7 @@ static struct rtas_args rtas_args;
 DEFINE_SPINLOCK(rtas_data_buf_lock);
 EXPORT_SYMBOL_GPL(rtas_data_buf_lock);
 
-char rtas_data_buf[RTAS_DATA_BUF_SIZE] __cacheline_aligned;
+char rtas_data_buf[RTAS_DATA_BUF_SIZE] __aligned(SZ_4K);
 EXPORT_SYMBOL_GPL(rtas_data_buf);
 
 unsigned long rtas_rmo_buf;

-- 
2.39.1

