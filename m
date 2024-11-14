Return-Path: <linuxppc-dev+bounces-3206-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1578B9C8B8E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Nov 2024 14:12:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xq0sc00Ryz30T6;
	Fri, 15 Nov 2024 00:11:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2404:9400:2221:ea00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731589891;
	cv=none; b=NNIY/Yy+Who347AS+za5fKuEgduKWe+BsdP4tX1bGMFOnSONG9BDSd208QHHL0YF2v1cMNmimLkozQQaMx7FPDt8ZPc6gJMSCLubXDHo6rjYXL2Z5F/mcaRKIIv/pWSEgjji0ehQUu26C0S94uD0iESykecNyf200TSfpRBBg5vmkDDHqEiUMmG5zufBg0A1uqyDTdL4tpV4gbebailbenukBAAfco9CTYjc026Z4ViFRYySRI+y0r9dTpQakBaXnXphXnjX3pg7SOtm1iFOhDtCSCraekBjG6NoEMBLLvlFKnoHFfwUwSQoTspu03jd0/V0YoeVEYVdRJ4QRAxYNw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731589891; c=relaxed/relaxed;
	bh=3HHrt9JXL4ThP5wuiQcz7NG0VDFUaMnu1vJNfkoLS80=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G7y6FC4IMphqUTrPacYz8hbi1lbaMxM5vejccnESTfXJmXl4ORqed6d4jR7TqeMnK1BXKg24fBBfJM4dsproEIQTdR4mQ61Ovmq7Rxd5UEM+byaNnObk7pSpPR68AvMGHG/M86FGB74PPhF1zkH918Jno7mHCwo/2B6utqJP8SwvGn3iEQNGGTy40KUQPDecR87MOYS0qyiS0+qB3Ze1lrET9wMEJ0SeX/QLJPmpHc1Q3fBYVBJ4mwkzOAYjISzhmDefgzJesRRcZ9Qorp1/pFvm3eulU5JO18UF47Zk3AdLALh5JH8YiET5k8vrx/UOjPNnMLPRTNRN2xS3wDuA/w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=CPGk9jca; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=CPGk9jca;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xq0sZ26tnz30Jy
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Nov 2024 00:11:30 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1731589883;
	bh=3HHrt9JXL4ThP5wuiQcz7NG0VDFUaMnu1vJNfkoLS80=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CPGk9jcab/LjC6fZuuxvf7PVwqwG+3YzYu1vbbFEQaQfGssdt+WRmRND+41nYFWFb
	 AG3EOaS3eIW8h0dg1KTCyBCtQg7R15988vsqT2JIDa5k7swkHIN2rnEL8ATQQUSyUP
	 n1DcyoPMuqrOdlxi/quzX4yPblLFGzhRYffo7q05v0iMrnkUp1lvwVDoa9JwRwCegl
	 YN1c4XJSF+HeQiaX26UsJCCpzwSwCkfJozVRXOUKnO16xDa57eyj9NiaZCFPrE9i32
	 QxUwfWzAF/xmEIkukH3pCrIxkJzn2YmOz3Cb2c2MEEko9Aa/u8whyRB68BelD9ZfIL
	 y6kzJm2H6C/hQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Xq0sR4bDKz4x8H;
	Fri, 15 Nov 2024 00:11:23 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Cc: <linux-kernel@vger.kernel.org>,
	<geert@linux-m68k.org>,
	<arnd@arndb.de>
Subject: [RFC PATCH 05/10] powerpc/rtasd: Remove machine_is(chrp) tests
Date: Fri, 15 Nov 2024 00:11:08 +1100
Message-ID: <20241114131114.602234-5-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241114131114.602234-1-mpe@ellerman.id.au>
References: <20241114131114.602234-1-mpe@ellerman.id.au>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Now that the chrp machine has been removed these tests can never be
true, remove them.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/kernel/rtasd.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kernel/rtasd.c b/arch/powerpc/kernel/rtasd.c
index 9bba469239fc..ce039c187156 100644
--- a/arch/powerpc/kernel/rtasd.c
+++ b/arch/powerpc/kernel/rtasd.c
@@ -502,7 +502,7 @@ static int __init rtas_event_scan_init(void)
 {
 	int err;
 
-	if (!machine_is(pseries) && !machine_is(chrp))
+	if (!machine_is(pseries))
 		return 0;
 
 	/* No RTAS */
@@ -545,7 +545,7 @@ static int __init rtas_init(void)
 {
 	struct proc_dir_entry *entry;
 
-	if (!machine_is(pseries) && !machine_is(chrp))
+	if (!machine_is(pseries))
 		return 0;
 
 	if (!rtas_log_buf)
-- 
2.47.0


