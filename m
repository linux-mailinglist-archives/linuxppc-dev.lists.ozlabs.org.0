Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6184A646FCC
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Dec 2022 13:34:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NSYWX21f5z3c2L
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Dec 2022 23:34:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=IaRDONFB;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42b; helo=mail-pf1-x42b.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=IaRDONFB;
	dkim-atps=neutral
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NSYT233lYz30Qy
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Dec 2022 23:32:37 +1100 (AEDT)
Received: by mail-pf1-x42b.google.com with SMTP id d82so1160664pfd.11
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 08 Dec 2022 04:32:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rAOE69r/JKnylIb3KpHb2LeP2WHIbkNsM9AMOjmOmhc=;
        b=IaRDONFBHU70xUMsoK+a5ytMLXeifbAG92ZaKZGnqDpeohE+ShbZ408U1r5VmVNLjR
         fBpHRFvcKnm6AwqXChV9sgGqIqHshNtLes+aXc3bN/AEOr9jy68o22nXTmu38GCIstcI
         S8QlLgA94fCNgGpwoUH0A8CQ/cZB4ZJGZsJuhF0QYD1PLph12tde+3rl5kvReii1Nh1y
         4D5kF3HYHZYpwPJQvsvOGxQprwqc5EjG5zg70rX3OF5siXD3iM34RAtFx8DQ7MsvFYA8
         N3xoyuA7ytO7BsefsCX4JLqDZUkQAXLuh+/EOBTk7WGssvut1xF4iwywIpeelvQQXIQL
         S3UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rAOE69r/JKnylIb3KpHb2LeP2WHIbkNsM9AMOjmOmhc=;
        b=IrQLz9LXyXymsmeN74J38qW76wQICUkDxYaXtNIrW0wR32Z9sgESLh6s9nBi42l2hO
         5vLZ/Up5dVDZJWUv3BcoFEt89lGRwERlERfsncICunEszKtQVvBn2pWaoFircW319kTs
         oAIyxGYNbBCusQcpGamgz5HPQiD2bVroNV+wrT1gdFNDfs4VLa5vmjLV2w2jt7aTYuKz
         Ef1iDg9exj7IJPmQSNH7l2pfLXX75Nfkz0ZGRetLwCcjt/G3+uo1UJbfTZqfNQNtaBD4
         6ZfCwzpip3yiV6w0mQmf1aY/n38aA/7Yj9CkquBBfyDtVBNFyZoIGFCfuSv3vfVGagNl
         Lf/w==
X-Gm-Message-State: ANoB5plWHtIDDtYwZAbEzn6eLzi45/6ig030RPQ74yHD/aScMZb5bqdE
	CZqGsqTZfvXu3A0IUlHcpR9RnrKzzeE=
X-Google-Smtp-Source: AA0mqf6jw4pVpuFZsMpZ/CNSi52FD5qGIA8bVUjMVMR7ymyb0vLk00XCkjfSdctNxxXMKpL8HMFDvQ==
X-Received: by 2002:a05:6a00:4501:b0:56b:b049:6c6c with SMTP id cw1-20020a056a00450100b0056bb0496c6cmr81646304pfb.22.1670502754425;
        Thu, 08 Dec 2022 04:32:34 -0800 (PST)
Received: from bobo.ibm.com (27-33-250-210.static.tpgi.com.au. [27.33.250.210])
        by smtp.gmail.com with ESMTPSA id a3-20020a170902710300b0018963b8e131sm7188612pll.290.2022.12.08.04.32.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Dec 2022 04:32:33 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/qspinlock: Fix 32-bit build
Date: Thu,  8 Dec 2022 22:32:25 +1000
Message-Id: <20221208123225.1566113-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.37.2
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
Cc: kernel test robot <lkp@intel.com>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Some 32-bit configurations don't pull in the spin_begin/end/relax
definitions. Fix is to restore a lost include.

Reported-by: kernel test robot <lkp@intel.com>
Link: https://lore.kernel.org/oe-kbuild-all/202212050224.i7uh9fOh-lkp@intel.com
Fixes: 84990b169557 ("powerpc/qspinlock: add mcs queueing for contended waiters")
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/lib/qspinlock.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/lib/qspinlock.c b/arch/powerpc/lib/qspinlock.c
index 2eab84774911..c81fe8fff2b2 100644
--- a/arch/powerpc/lib/qspinlock.c
+++ b/arch/powerpc/lib/qspinlock.c
@@ -3,6 +3,7 @@
 #include <linux/compiler.h>
 #include <linux/export.h>
 #include <linux/percpu.h>
+#include <linux/processor.h>
 #include <linux/smp.h>
 #include <linux/topology.h>
 #include <linux/sched/clock.h>
-- 
2.37.2

