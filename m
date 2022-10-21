Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 808456072C6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Oct 2022 10:46:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MtykT2wgFz3drY
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Oct 2022 19:46:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=BySkZbgU;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com; envelope-from=colin.i.king@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=BySkZbgU;
	dkim-atps=neutral
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MtyjY3dbGz3bXn
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Oct 2022 19:45:52 +1100 (AEDT)
Received: by mail-wr1-x435.google.com with SMTP id a10so3251904wrm.12
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Oct 2022 01:45:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JxsO3aS7NjLpZUBDpCGoh/+bxorngRfIVIYvqLMlg2w=;
        b=BySkZbgUWMqqHNxMGo1gF6+KBubryJBs8Bou3znSPFC6nKDtO3lj2HdgvK++atrWvF
         KLvM06m+uoiRSbqpF97+wMG7+ksLIGtMuM4iLu0OHcwD3VG6WEwDLWpU7BPOXpvmcQcz
         tPTJizRnZRsT+oPZ8smNdDYr8UPjWZuIwSaJ2EF/8lpGe7U7rqzyJzfRQQHAAMWRKyGK
         AW9XiBX1UdY1GpjABdJRMwzWO+4h2tza1t5i/WpsGDt22rXziAge/rsTIy9mKOFflJQA
         u3mVq0TKWU47iODMmAS7DU74odTQGEZZDzuJ+ZFu7DklJsrJA13x/0Ys4NVoC/oPR2yJ
         gVzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JxsO3aS7NjLpZUBDpCGoh/+bxorngRfIVIYvqLMlg2w=;
        b=H1cKmc8zxA6S59aFsyIgAyGN1KehT5N4rzmzlutxlR0FfmOyuItQE/Cg1FqJijeZwI
         DfB+FDaAbXrZfxrrbXeiYh6Xmd3MQK8kGrDDVuQyXrwYi3GyEniaPrhDMAmgC4TLGKKq
         cu8dQNZ3jdtAaf1lvw1xV4ymRpgh1D1dB5tPBO9c2hAt4qs9t9PHyvS82t4Of9L72LIB
         OdHUsmxICiPtyR1t4t04JPLEIVmH+TLPCdXT83g30HC58Bs1MUZHyUmuC6fgV4hz4N7w
         I7G9wYKZt7HnCS1FQWhMc59VmPDIGzzXT6r+o+3Q2hBqrXzd+zw4tBU/ByyyVSY4hZiJ
         AwSQ==
X-Gm-Message-State: ACrzQf1X41U5sAZeynY1a9YtEN07e/1mMyD3lkowsf9wV1lnM/2UsyJ3
	+LFyZZ3bQOP4CwAgFTTcWfE=
X-Google-Smtp-Source: AMsMyM6XDUT6X/iWNzzTZNVgmPGxFjL4tJSmQ3m8l/mUiVDpjEDHPQrOqLtNM95ZeM+p6vHgNuqcUQ==
X-Received: by 2002:adf:d23a:0:b0:236:467e:a3bc with SMTP id k26-20020adfd23a000000b00236467ea3bcmr4323041wrh.542.1666341946452;
        Fri, 21 Oct 2022 01:45:46 -0700 (PDT)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net. [80.193.200.194])
        by smtp.gmail.com with ESMTPSA id t13-20020a05600c198d00b003c6c1686b10sm2352593wmq.7.2022.10.21.01.45.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Oct 2022 01:45:46 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Shuah Khan <shuah@kernel.org>,
	linuxppc-dev@lists.ozlabs.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH] selftests/powerpc: Fix spelling mistake "mmaping" -> "mmapping"
Date: Fri, 21 Oct 2022 09:45:45 +0100
Message-Id: <20221021084545.65973-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

There is a spelling mistake in a perror message. Fix it.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 tools/testing/selftests/powerpc/ptrace/core-pkey.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/powerpc/ptrace/core-pkey.c b/tools/testing/selftests/powerpc/ptrace/core-pkey.c
index bbc05ffc5860..1a70a96f0bfe 100644
--- a/tools/testing/selftests/powerpc/ptrace/core-pkey.c
+++ b/tools/testing/selftests/powerpc/ptrace/core-pkey.c
@@ -329,7 +329,7 @@ static int parent(struct shared_info *info, pid_t pid)
 
 	core = mmap(NULL, core_size, PROT_READ, MAP_PRIVATE, fd, 0);
 	if (core == (void *) -1) {
-		perror("Error mmaping core file");
+		perror("Error mmapping core file");
 		ret = TEST_FAIL;
 		goto out;
 	}
-- 
2.37.3

