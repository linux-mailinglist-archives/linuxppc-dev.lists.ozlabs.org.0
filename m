Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C9B5EBF2FA
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Sep 2019 14:29:02 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46fDkL4HfXzDqp5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Sep 2019 22:28:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::443; helo=mail-pf1-x443.google.com;
 envelope-from=oohall@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="eIxKDVCs"; 
 dkim-atps=neutral
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46fDf96NW1zDqhC
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Sep 2019 22:25:21 +1000 (AEST)
Received: by mail-pf1-x443.google.com with SMTP id 205so1773624pfw.2
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Sep 2019 05:25:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KvpgeRcLn6/gXzLZ0yQfM/bGb7Xd6+CQF+YZn5Xb6jk=;
 b=eIxKDVCs2cQBpTAOBXkJM2nYUG3IDOpcihnrSHIxZeysczOoxV6hxIuOgJPlGyr6W3
 FGwwfVNt29F3xNd4qDnzBXPKLUH0n0dFvIkSRUYZSIb8W1p3v8GFWTotBstKuoODQKGg
 TLNOmArxzb6iqH2hIXVt946a0lZ44eERhgchQBMDwT30WaZl/k658RMupQ9ytFu4p03Z
 h9i6E25ojIkfPRBA7MVQWEYc/a9Jo2NKpbl7ukrPocIVZECo0ucKJ44lze2e9j1lArZw
 81e7Sv2incpw0+o/mtFb7T+CmqOVIvsebjNqIWAIzjhF0UCu9sk3VDMFJbsZI+/yqBlT
 3Ylw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KvpgeRcLn6/gXzLZ0yQfM/bGb7Xd6+CQF+YZn5Xb6jk=;
 b=YrJIvua5HYLAFMrjRiP8pkPYskygNQcMPssbnGnAEFf0aWNtLJe063yOMQRvaah/RE
 6+Tj3DcZeA3GF/q6np2ukO3jjbYcJcRWsqtS7/cdb0EOHKD+EqtQzyhFIcEHT8VkG6qw
 IcQLKoX9NDXtrPbAPQnm6n84UrKmSjQC9pIEL4q8c+9OyohOSAeCJpG3EYcFHgn0CLMP
 eKaJsW0uV7n3XNJUxqRtYUQFSZf/T9oDUddieonsOwA4rRVhO44OKg6f7bIb1/IYbArq
 C8H4CPR6z7h1qr5Q4nB48TL+bxnXydrrJE3XoN2g/pJppHScSERmpDQ9SrPjno1+vbiA
 bqMA==
X-Gm-Message-State: APjAAAUnlyviJM3H+tQYB6GGepj26fGU7DpglDU8hA6XT300pLOsfwvA
 dOMmMKK7sXEkCK0LxR2lXhr2DAYB
X-Google-Smtp-Source: APXvYqzPT05DYkq1/PGQjHKSU3IvJGY2RDX1FkkHNnwOaFjiBL6G5A10mqk/m3jlHUhsMda0nWSckQ==
X-Received: by 2002:aa7:90c7:: with SMTP id k7mr3393485pfk.39.1569500717789;
 Thu, 26 Sep 2019 05:25:17 -0700 (PDT)
Received: from localhost.ibm.com ([61.69.151.62])
 by smtp.gmail.com with ESMTPSA id c1sm2671966pfb.135.2019.09.26.05.25.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Sep 2019 05:25:17 -0700 (PDT)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/eeh: s/CONFIG_IOV/CONFIG_PCI_IOV/
Date: Thu, 26 Sep 2019 22:25:02 +1000
Message-Id: <20190926122502.14826-1-oohall@gmail.com>
X-Mailer: git-send-email 2.21.0
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
Cc: Oliver O'Halloran <oohall@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Whoops.

Fixes: bd6461cc7b3c ("powerpc/eeh: Add a eeh_dev_break debugfs interface")
Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
---
 arch/powerpc/kernel/eeh.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/eeh.c b/arch/powerpc/kernel/eeh.c
index 0a91dee51245..7d744e2ee4d5 100644
--- a/arch/powerpc/kernel/eeh.c
+++ b/arch/powerpc/kernel/eeh.c
@@ -1960,7 +1960,7 @@ static int eeh_debugfs_break_device(struct pci_dev *pdev)
 	pci_err(pdev, "Going to break: %pR\n", bar);
 
 	if (pdev->is_virtfn) {
-#ifndef CONFIG_IOV
+#ifndef CONFIG_PCI_IOV
 		return -ENXIO;
 #else
 		/*
-- 
2.21.0

