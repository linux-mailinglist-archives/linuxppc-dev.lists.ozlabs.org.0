Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 59D0C55BA3B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Jun 2022 16:03:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LWqFw234nz3cj5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jun 2022 00:03:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=o9igboLh;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LWqDx66s3z3bbv
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Jun 2022 00:02:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=o9igboLh;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4LWqDv6nXjz4xXD;
	Tue, 28 Jun 2022 00:02:55 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1656338576;
	bh=+oz1itNFM+w7gCqHC0cAIwTC9/uFy1uecNFajAFDrjw=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=o9igboLhceI2qGCN8fiIsHOIoFP6tddlOKDCF3W6RJEMl9cAuTdoyrPDWHvDrNLp8
	 fVVGTFoYZkESHWu2w0VAj7ZBBbOeZBYlWxqWlKSmqwcNqr+HdOMEVbXfmRRBLmmlXY
	 F4ovMnjB9xDwdhCss8i8Gp7Rpas0fHLMAbngusBpdqR4VX3Mz95AcbZJWns5uL0ara
	 Lv8gJdpiCtoBK350AOlnrH0hi3g3gmHuGH3HulJ6JTjQKfaRlL+ORZ1s73VKdawH0Z
	 YR1fYbRfxnBEe2n/BxOQP+fPDaqW6ien2dxnPusmg4RkD/sXkZkT1Hwxf1y0CvI9ac
	 JiCNSVS45VDwg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH 02/13] selftests/powerpc/ptrace: Set LOCAL_HDRS
Date: Tue, 28 Jun 2022 00:02:28 +1000
Message-Id: <20220627140239.2464900-2-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220627140239.2464900-1-mpe@ellerman.id.au>
References: <20220627140239.2464900-1-mpe@ellerman.id.au>
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

Set LOCAL_HDRS so header changes cause rebuilds. The lib.mk logic adds
all the headers in LOCAL_HDRS as dependencies, so there's no need to
also list them explicitly.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 tools/testing/selftests/powerpc/ptrace/Makefile | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/powerpc/ptrace/Makefile b/tools/testing/selftests/powerpc/ptrace/Makefile
index a500639da97a..0b0652d88b1b 100644
--- a/tools/testing/selftests/powerpc/ptrace/Makefile
+++ b/tools/testing/selftests/powerpc/ptrace/Makefile
@@ -4,12 +4,13 @@ TEST_GEN_PROGS := ptrace-gpr ptrace-tm-gpr ptrace-tm-spd-gpr \
               ptrace-tm-spd-vsx ptrace-tm-spr ptrace-hwbreak ptrace-pkey core-pkey \
               perf-hwbreak ptrace-syscall ptrace-perf-hwbreak
 
+LOCAL_HDRS += $(patsubst %,$(selfdir)/powerpc/ptrace/%,$(wildcard *.h))
+
 top_srcdir = ../../../../..
 include ../../lib.mk
 
 CFLAGS += -m64 -I../../../../../usr/include -I../tm -mhtm -fno-pie
 
-$(OUTPUT)/ptrace-pkey $(OUTPUT)/core-pkey: child.h
 $(OUTPUT)/ptrace-pkey $(OUTPUT)/core-pkey: LDLIBS += -pthread
 
-$(TEST_GEN_PROGS): ../harness.c ../utils.c ../lib/reg.S ptrace.h
+$(TEST_GEN_PROGS): ../harness.c ../utils.c ../lib/reg.S
-- 
2.35.3

