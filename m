Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D6E95F5F80
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Oct 2022 05:21:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MjcCq0SzGz30Ky
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Oct 2022 14:21:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=pLX/SuYY;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MjcBw1Xh3z2xHW
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Oct 2022 14:20:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=pLX/SuYY;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4MjcBt2hrhz4xG5;
	Thu,  6 Oct 2022 14:20:22 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1665026422;
	bh=fbHEiluM4pkQ3yVlztrDvkhsBr+e4r4CdlwHVew/9KU=;
	h=From:To:Subject:Date:From;
	b=pLX/SuYYsLGyP2lFfiOCL7DXs/LR6MSu/q6JSAG7vAT+pDSP4AtXSjAMMisa2LUVM
	 L6ifPAfqYqbcyyQq7iTzp+xENcSyspZHWMK1Qm/OG5iH/+3xZPA5ADFIheamPUfvG0
	 4vQ796U1YCimluY5UOxApvfxRtDsvdH9aw6uB5xdoddPiVP7X3ZrUVhZtpPoJC1jHG
	 JqhpiUmR6MnMnLlfzl3RqHuoPCZWNMNE+nx9oZtj9gBqvqXt/oglxRa74fel5an6Kx
	 T1d2hdsi00j33wYpqbDRawrItpCADhmZ7vf7hj2o83BKQAX1iZIhC24F6iIgTZSs30
	 iPJeKKGJwb0dQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH 1/2] powerpc: Make instruction dump work with scripts/decodecode
Date: Thu,  6 Oct 2022 14:20:18 +1100
Message-Id: <20221006032019.1128624-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Matt reported that scripts/decodecode doesn't work for the instruction
dump in the powerpc oops output. Although there are scripts around that
can decode it, it would be preferable if the standard in-tree script
worked.

All other arches prefix the instruction dump with "Code:", and that's
what the script looks for, so use that.

The script then works as expected:

  $ CROSS_COMPILE=powerpc64le-linux-gnu- ./scripts/decodecode
  Code:
  fbc1fff0 f821ffc1 7c7d1b78 7c9c2378 ebc30028 7fdff378 48000018 60000000
  60000000 ebff0008 7c3ef840 41820048 <815f0060> e93f0000 5529077c 7d295378
  ^D

  All code
  ========
     0:   f0 ff c1 fb     std     r30,-16(r1)
     4:   c1 ff 21 f8     stdu    r1,-64(r1)
     8:   78 1b 7d 7c     mr      r29,r3
     ...

Note that the script doesn't cope well with printk timestamps or printk
caller info.

Reported-by: Matthew Wilcox <willy@infradead.org>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/kernel/process.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
index 37df0428e4fb..1d22a539d45c 100644
--- a/arch/powerpc/kernel/process.c
+++ b/arch/powerpc/kernel/process.c
@@ -1359,7 +1359,7 @@ static void show_instructions(struct pt_regs *regs)
 	unsigned long nip = regs->nip;
 	unsigned long pc = regs->nip - (NR_INSN_TO_PRINT * 3 / 4 * sizeof(int));
 
-	printk("Instruction dump:");
+	printk("Code:");
 
 	/*
 	 * If we were executing with the MMU off for instructions, adjust pc
-- 
2.37.3

