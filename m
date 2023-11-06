Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C25FE7E25E2
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Nov 2023 14:44:19 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Shfglfvr;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SPCJ14s6Nz3cRG
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Nov 2023 00:44:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Shfglfvr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=devnull+nathanl.linux.ibm.com@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SPCH92kJ3z2ygZ
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Nov 2023 00:43:33 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 6264BCE0CF9;
	Mon,  6 Nov 2023 13:43:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9AE72C433CA;
	Mon,  6 Nov 2023 13:43:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699278209;
	bh=5pP4L1KbkPryMlNCo7VrCpEIR3YQnJ8zm2PPFi1oTnQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Shfglfvroj2FdhonCXxZ7X/B1izMyla5qPFpPN5xAKYK2nSVWT+rir4MFc2WUoeHd
	 jYWeJXVCb7/x10MvZLOj4u8U4oYONHcPNJthNG1r+5AF+EId5k6uXemMZC2TTRFM3M
	 KfCiSuAeXDuzqhNXNcfXEd0LEgi51MzufLF3C9IkFmCE7vJwOo6BQdgxqQgsJysBky
	 Q6Eaw7a2D4wFhn9HxroeuiOMBKxkqCVfqeovNqmI5Njt2NYo7EbdydtrGzmh/KIa1e
	 zPZNNnema1E0zwheWsHmWnRqnKkZIj69Pzcg7ZI5B8muxzgYskZvOod2uxPR1pP0xa
	 y6q3Q6fom6oXQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86E61C4332F;
	Mon,  6 Nov 2023 13:43:29 +0000 (UTC)
From: Nathan Lynch via B4 Relay <devnull+nathanl.linux.ibm.com@kernel.org>
Date: Mon, 06 Nov 2023 07:42:54 -0600
Subject: [PATCH 2/7] powerpc/rtas: Fix ppc_rtas_rmo_buf_show() kernel-doc
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231106-rtas-trivial-v1-2-61847655c51f@linux.ibm.com>
References: <20231106-rtas-trivial-v1-0-61847655c51f@linux.ibm.com>
In-Reply-To: <20231106-rtas-trivial-v1-0-61847655c51f@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, 
 Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1699278208; l=1171;
 i=nathanl@linux.ibm.com; s=20230817; h=from:subject:message-id;
 bh=MnmHwrzxob67ZPsK4bqOYSxHsOYqB81Q1mDqbzsffXI=;
 b=TrJuivsNnPgJjWeb4xWtS9Ju9o52A1tJtNTIM1pQ0awSCMtmEVw+mvMXSlrFdj/YofFdrTfFZ
 SLBUBA8ZkiLBv4bABkSVHp/K7TtW9JIqpnvw+zK/cQ7hvb4tkqaXecM
X-Developer-Key: i=nathanl@linux.ibm.com; a=ed25519;
 pk=jPDF44RvT+9DGFOH3NGoIu1xN9dF+82pjdpnKjXfoJ0=
X-Endpoint-Received:  by B4 Relay for nathanl@linux.ibm.com/20230817 with auth_id=78
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, kernel test robot <lkp@intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Nathan Lynch <nathanl@linux.ibm.com>

From a W=1 build:

>> arch/powerpc/kernel/rtas-proc.c:771: warning: Function parameter or member 'm' not described in
>> 'ppc_rtas_rmo_buf_show'
>> arch/powerpc/kernel/rtas-proc.c:771: warning: Function parameter or member 'v' not described in
>> 'ppc_rtas_rmo_buf_show'

Add the missing parameter descriptions.

Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202309211645.1Lvwmbv4-lkp@intel.com/
---
 arch/powerpc/kernel/rtas-proc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/powerpc/kernel/rtas-proc.c b/arch/powerpc/kernel/rtas-proc.c
index 9454b8395b6a..f38df72e64b8 100644
--- a/arch/powerpc/kernel/rtas-proc.c
+++ b/arch/powerpc/kernel/rtas-proc.c
@@ -752,6 +752,8 @@ static int ppc_rtas_tone_volume_show(struct seq_file *m, void *v)
 
 /**
  * ppc_rtas_rmo_buf_show() - Describe RTAS-addressable region for user space.
+ * @m: seq_file output target.
+ * @v: Unused.
  *
  * Base + size description of a range of RTAS-addressable memory set
  * aside for user space to use as work area(s) for certain RTAS

-- 
2.41.0

