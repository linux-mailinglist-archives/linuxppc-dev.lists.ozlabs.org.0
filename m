Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AC44B324957
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Feb 2021 04:20:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DmJ2Q51zKz3cmR
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Feb 2021 14:20:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=jw0Xysxt;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::636;
 helo=mail-pl1-x636.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=jw0Xysxt; dkim-atps=neutral
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DmJ2104j8z30Gg
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Feb 2021 14:20:07 +1100 (AEDT)
Received: by mail-pl1-x636.google.com with SMTP id p5so2429777plo.4
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Feb 2021 19:20:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1M9PAaSHYLOMK9Fz/7rvReA3OcopuFOpCqTwKLuBQYw=;
 b=jw0XysxtJueI2TQZVVV1sQN9jccyCo6W96wfdR2UczvL7LNCxTokH930UZh3p1RaMT
 jhgDKo2rwJ+SV0R4Uf96skmAK7ZgjW+3GyeQ+9JPXUKAYV6lGfIlKdgyORE53Clty6E1
 P758rAXV0tPvBwIvpXgsP+Y5PdWDwuQRYSUxOQpsUU8f5ICS+wxLZPDahjzD/N2jBKer
 P2axiMCtLm9uUtHDN9VJ7dg0MVMNIk35EMqMIGyBzYdTb/UbY4QDHzg7YAlABCzDk4rm
 KdyEQMzq3z1+q1M1Lfz6o6J0r3nnTNnxZpRJ+7S4TaaG6K+ZRE9qfYM88nCz9T+wz9zg
 zxaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1M9PAaSHYLOMK9Fz/7rvReA3OcopuFOpCqTwKLuBQYw=;
 b=gzqhce7ztDjWDAdJYQr8y5Dcub/wn2hrDsMOiTluq1wd31Tk5FNGNsVnpo3FDsPnxc
 QZ+igCONwrhhZEG6EeDtJ5P6OvmfxwGQuDYcF1QNcQHOx2Gork3QKKpoS2U0IOmwDQ/e
 utBfwWNYuvjSWiitV/MP9f6ezB63fNVzyZyDalAc5bA/R1Ft/zEwk2HveBFjXgni2U13
 4ipP9h0rr76a7AM+LY/Vl/Yj5V9phiCF6azKnrG7snl6DMDUZ7D0GhKuwNNQ9p3aZGnj
 c9Rys+3eePg7NeFVkXznAj5UivPQlPEhf9JgmwkLcjnibh4bABZFCPb18LYCnbpdAeGx
 y2pA==
X-Gm-Message-State: AOAM53088etFkIkF3Mif38yciaKgbJhy9ofZV1BbivGZEX3u5DMrsnRB
 LEYs0/w1ytAO1Rh1khQYyYpowcYIadU=
X-Google-Smtp-Source: ABdhPJxTSHRyNOhYReMn+tHzcu0t/b3G4f3GPRfqOizYd44PU+CBeExig6u4DR1mr6bA8klus5/KTw==
X-Received: by 2002:a17:90a:9318:: with SMTP id
 p24mr1088780pjo.23.1614223204262; 
 Wed, 24 Feb 2021 19:20:04 -0800 (PST)
Received: from tee480.ibm.com (159-196-117-139.9fc475.syd.nbn.aussiebb.net.
 [159.196.117.139])
 by smtp.gmail.com with ESMTPSA id lx1sm3995514pjb.8.2021.02.24.19.20.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Feb 2021 19:20:03 -0800 (PST)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/sstep: Fix VSX instruction emulation
Date: Thu, 25 Feb 2021 14:19:46 +1100
Message-Id: <20210225031946.1458206-1-jniethe5@gmail.com>
X-Mailer: git-send-email 2.25.1
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
Cc: ravi.bangoria@linux.ibm.com, Jordan Niethe <jniethe5@gmail.com>,
 bala24@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Commit af99da74333b ("powerpc/sstep: Support VSX vector paired storage
access instructions") added loading and storing 32 word long data into
adjacent VSRs. However the calculation used to determine if two VSRs
needed to be loaded/stored inadvertently prevented the load/storing
taking place for instructions with a data length less than 16 words.

This causes the emulation to not function correctly, which can be seen
by the alignment_handler selftest:

$ ./alignment_handler
[snip]
test: test_alignment_handler_vsx_207
tags: git_version:powerpc-5.12-1-0-g82d2c16b350f
VSX: 2.07B
        Doing lxsspx:   PASSED
        Doing lxsiwax:  FAILED: Wrong Data
        Doing lxsiwzx:  PASSED
        Doing stxsspx:  PASSED
        Doing stxsiwx:  PASSED
failure: test_alignment_handler_vsx_207
test: test_alignment_handler_vsx_300
tags: git_version:powerpc-5.12-1-0-g82d2c16b350f
VSX: 3.00B
        Doing lxsd:     PASSED
        Doing lxsibzx:  PASSED
        Doing lxsihzx:  PASSED
        Doing lxssp:    FAILED: Wrong Data
        Doing lxv:      PASSED
        Doing lxvb16x:  PASSED
        Doing lxvh8x:   PASSED
        Doing lxvx:     PASSED
        Doing lxvwsx:   FAILED: Wrong Data
        Doing lxvl:     PASSED
        Doing lxvll:    PASSED
        Doing stxsd:    PASSED
        Doing stxsibx:  PASSED
        Doing stxsihx:  PASSED
        Doing stxssp:   PASSED
        Doing stxv:     PASSED
        Doing stxvb16x: PASSED
        Doing stxvh8x:  PASSED
        Doing stxvx:    PASSED
        Doing stxvl:    PASSED
        Doing stxvll:   PASSED
failure: test_alignment_handler_vsx_300
[snip]

Fix this by making sure all VSX instruction emulation correctly
load/store from the VSRs.

Fixes: af99da74333b ("powerpc/sstep: Support VSX vector paired storage access instructions")
Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
---
 arch/powerpc/lib/sstep.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/lib/sstep.c b/arch/powerpc/lib/sstep.c
index 683f7c20f74b..3953e63bbba5 100644
--- a/arch/powerpc/lib/sstep.c
+++ b/arch/powerpc/lib/sstep.c
@@ -902,7 +902,7 @@ static nokprobe_inline int do_vsx_load(struct instruction_op *op,
 	if (!address_ok(regs, ea, size) || copy_mem_in(mem, ea, size, regs))
 		return -EFAULT;
 
-	nr_vsx_regs = size / sizeof(__vector128);
+	nr_vsx_regs = max(1ul, size / sizeof(__vector128));
 	emulate_vsx_load(op, buf, mem, cross_endian);
 	preempt_disable();
 	if (reg < 32) {
@@ -949,7 +949,7 @@ static nokprobe_inline int do_vsx_store(struct instruction_op *op,
 	if (!address_ok(regs, ea, size))
 		return -EFAULT;
 
-	nr_vsx_regs = size / sizeof(__vector128);
+	nr_vsx_regs = max(1ul, size / sizeof(__vector128));
 	preempt_disable();
 	if (reg < 32) {
 		/* FP regs + extensions */
-- 
2.25.1

