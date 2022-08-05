Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A8DF558A497
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Aug 2022 03:56:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LzTGh4Gsqz3bhF
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Aug 2022 11:56:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=russell.cc header.i=@russell.cc header.a=rsa-sha256 header.s=fm1 header.b=hCaTlOjh;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=jhOgFziP;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=russell.cc (client-ip=64.147.123.20; helo=wout4-smtp.messagingengine.com; envelope-from=ruscur@russell.cc; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=russell.cc header.i=@russell.cc header.a=rsa-sha256 header.s=fm1 header.b=hCaTlOjh;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=jhOgFziP;
	dkim-atps=neutral
X-Greylist: delayed 413 seconds by postgrey-1.36 at boromir; Fri, 05 Aug 2022 11:55:50 AEST
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com [64.147.123.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LzTFy5mFfz2xGy
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Aug 2022 11:55:50 +1000 (AEST)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.west.internal (Postfix) with ESMTP id 61F8232005CA;
	Thu,  4 Aug 2022 21:48:51 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Thu, 04 Aug 2022 21:48:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=russell.cc; h=cc
	:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:sender:subject:subject:to:to;
	 s=fm1; t=1659664130; x=1659750530; bh=4bWYZAh0mJDLS7baSHABVd0oa
	w8TqBTZWuT/M2jiYHU=; b=hCaTlOjhfpCsKSvJ97E29babSkOth+7cijhb5rc3i
	rJKE9E9deIG2x+FZg/tXYN+4yk+j5t7lUYKge3b6+1mRbqPudqjkYPMBq9xWG/56
	69iLIiIf6ab28Cl9MdqwfBO9FK9owNIh3ejDLbUtbl8fuj5Dpgu2oqQs3/fpoy0g
	aZHHyVVjoOx8+sWSXo5WwW62aU6QpuSj7yjAJpVLXojykKWR1lx4YndSoSF2ZfGf
	6bYdZja1CpS9Tcma3+fYie0HPunyN47bJAs+4BnGm7TOuDKBQDgVrcqhR2Oqjtn0
	LWUro/9G4kjV7ZOFMGS3RJBfp3xaA+0ONX2iynpr9guWQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1659664130; x=1659750530; bh=4bWYZAh0mJDLS7baSHABVd0oaw8TqBTZWuT
	/M2jiYHU=; b=jhOgFziPPyGqn1cGsjpOSFgeQcQQyeR/FHz721pMetZeo8jZrrJ
	wbWhGMxmgnaPxaT9Kk4adsMmo/IZDvT1ov59YRW+nVl4nrVnXuz7eRmHcXGI9PPs
	JjWrvRP0UMH/qV/TPJhi0UlIYo9rq0cE4W+qVS3g5q5UxjqDmFTFVko4OdWTfaBe
	bf+61LLJmwQ/XJ+OCX7bpIAsQcU+fb7HeNk7BnrQUfghpGBWGGCc/N3bZj1b+Alv
	Q80QmXC54r/QCOyoG/NQv0YkuBvQ6BNeP9jtds7bKjx6Z04w2iKzXlD6V4lAZ/Em
	rV86j1esVw8BiIvXwratDGFTS1iTmEQotaw==
X-ME-Sender: <xms:AXfsYj7GiRIkL5eo46XL7YWAhlzBLkK8irDqsZMWs73_iWI3JpH-Ng>
    <xme:AXfsYo4443lVnsfN_mvfKcGVenb3otIdu1kEF7-YpJgpYfP_NFsUzBRgj29PCLrw_
    MhtunZXbqMGvKZheQ>
X-ME-Received: <xmr:AXfsYqcA10i4qbuoIuAQN7UpGIH0Cxa_fcs0l1G2vLanNrL1nHYArH5SdTA4yzKn1hTxLJzFS8KwrQDH-kWo_QzbcTj8JVPp77q-15YLcy3Mxw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdeftddghedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    gfrhhlucfvnfffucdludehmdenucfjughrpefhvfevufffkffoggfgsedtkeertdertddt
    necuhfhrohhmpeftuhhsshgvlhhlucevuhhrrhgvhicuoehruhhstghurhesrhhushhsvg
    hllhdrtggtqeenucggtffrrghtthgvrhhnpedvgeduteejgfevveevuddtieegleeuffev
    hfefueehueffkefhffehgeehjefhtdenucevlhhushhtvghrufhiiigvpedtnecurfgrrh
    grmhepmhgrihhlfhhrohhmpehruhhstghurhesrhhushhsvghllhdrtggt
X-ME-Proxy: <xmx:AnfsYkK9-N5aXc5Tk51dUScHcldlm6SQYjbDcTNPtVeI972G7FCj8A>
    <xmx:AnfsYnKlDVtm5hZl23zwMiusBhcTWsrI0cXrrArC6iQqmuzWE4-gKw>
    <xmx:AnfsYtx5cum1NB1uyfljXJG558WiHvPy2E-dB-ONNRvQpU7YJZFmvQ>
    <xmx:AnfsYv2-5VcbD6fA2x-YQzXBQ8MARmVTmZaSMIJZEXGfTLffGfQyfw>
Feedback-ID: i4421424f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 4 Aug 2022 21:48:48 -0400 (EDT)
From: Russell Currey <ruscur@russell.cc>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] selftests/powerpc: Don't run spectre_v2 test by default
Date: Fri,  5 Aug 2022 11:48:07 +1000
Message-Id: <20220805014807.34913-1-ruscur@russell.cc>
X-Mailer: git-send-email 2.37.1
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
Cc: Eirik Fuller <efuller@redhat.com>, Russell Currey <ruscur@russell.cc>, david@gibson.dropbear.id.au
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The spectre_v2 selftest has issues that I'm unsure of how to resolve.
It uses context to determine intended behaviour, but that context is
unreliable - as an example, when running as a KVM guest, qemu can
deliberately misreport mitigation status for compatibility purposes.

As a result, the selftest is unreliable as a pass/fail test without
the test runner knowing what they expect its behaviour to be.  I don't
think the selftest is useless so we should keep it around, but we
shouldn't have run_tests run it by default.

Suggested-by: Eirik Fuller <efuller@redhat.com>
Signed-off-by: Russell Currey <ruscur@russell.cc>
---
 tools/testing/selftests/powerpc/security/Makefile | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/powerpc/security/Makefile b/tools/testing/selftests/powerpc/security/Makefile
index 7488315fd847..c954d79aeb80 100644
--- a/tools/testing/selftests/powerpc/security/Makefile
+++ b/tools/testing/selftests/powerpc/security/Makefile
@@ -1,6 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0+
 
-TEST_GEN_PROGS := rfi_flush entry_flush uaccess_flush spectre_v2
+TEST_GEN_PROGS := rfi_flush entry_flush uaccess_flush
+TEST_GEN_PROGS_EXTENDED := spectre_v2
 TEST_PROGS := mitigation-patching.sh
 
 top_srcdir = ../../../../..
@@ -10,6 +11,7 @@ CFLAGS += -I../../../../../usr/include
 include ../../lib.mk
 
 $(TEST_GEN_PROGS): ../harness.c ../utils.c
+$(TEST_GEN_PROGS_EXTENDED): ../harness.c ../utils.c
 
 $(OUTPUT)/spectre_v2: CFLAGS += -m64
 $(OUTPUT)/spectre_v2: ../pmu/event.c branch_loops.S
-- 
2.37.1

