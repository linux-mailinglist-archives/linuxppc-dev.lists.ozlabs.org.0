Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F15E85EEC62
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Sep 2022 05:22:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MdJZ80LFnz3cB6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Sep 2022 13:22:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=CylrtXTK;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::633; helo=mail-pl1-x633.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=CylrtXTK;
	dkim-atps=neutral
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MdJYS4m8qz2xy6
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Sep 2022 13:21:31 +1000 (AEST)
Received: by mail-pl1-x633.google.com with SMTP id w20so113701ply.12
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Sep 2022 20:21:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=aJFNn5/nas7uzIve82N1+Ng6qU4ptNlPvlG/1ppnY6U=;
        b=CylrtXTKKvJTP52kivUgy+g/TfSo57XfB8GM2+JTDFNb9VgFUQXe0L9VBk96g5DQJ/
         eU4gcAjyJzTNjmw+vuXGOsTuECpM++IAVoHolbQsryGXaIcjjXSbU/p84BKJlJS5ngFA
         Fysvriiu/oIngFJXLFHxGHlN6+MErPALpAK03TBlzr+G9ErGuEsd99IlNQJ/GGDy/lVx
         jospiGvXNNReJikRhfkKWUMHKlgyouDgwbbT9MNjlywUTb35ijYKRQ/VRDf2DnTTCj3o
         Sl41R8Rf7mg/9DxVE/ACFhdofcioP6+PA3rcgug26j3TLMJWxEsEZuKaG7cN/ZrNjTcO
         CBBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=aJFNn5/nas7uzIve82N1+Ng6qU4ptNlPvlG/1ppnY6U=;
        b=z1MKVUMxrDa+uafPatb+14dgHpOlZezPNjKQoZ9KDhRK7m7q4mBP1/GOy9oMGOBmjB
         4l1UYcOm7DVCI6NKighhUGEOdN0/+pkrFkUf3hekrmw9gpgn3El7xcXwHl0TPSUEQ/XD
         t/C0+P78jzWyjZNvqZqodO3z0FtIbu8q7kOdmEomhHANwEWLw3orbeMNFMyYBd6PBhMP
         NNCKakHmT1X986p2xmSNjbhaBe3TVWHkn9cIsECRMEPEbaMfKJZJ7aV9R2oY4yrds9cs
         9hpkGnjZsDwU4C8QqClDg+xRIm2Fus6vrMy/1OjTo1y30u1J+QbQ8InaUSSPo0LI0ehQ
         te4A==
X-Gm-Message-State: ACrzQf0N1TdgzCiL7XfMdi6IQkrvh5S9jQPlL8SvXNca0NV4FAHx/Ekp
	7QFPj5CbEbpCTATnZ29dzi8x0nyiEDc=
X-Google-Smtp-Source: AMsMyM4oMKZIvtEGrsOf64OmRjkAg3HUMiBxdOdrVSpWKr+5nFKAyVfJbCgUBqpJkOmegjhWTr73xw==
X-Received: by 2002:a17:902:e74f:b0:178:3af4:fb13 with SMTP id p15-20020a170902e74f00b001783af4fb13mr1240701plf.19.1664421689364;
        Wed, 28 Sep 2022 20:21:29 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (193-116-92-8.tpgi.com.au. [193.116.92.8])
        by smtp.gmail.com with ESMTPSA id j68-20020a625547000000b0053788e9f865sm4805898pfb.21.2022.09.28.20.21.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Sep 2022 20:21:28 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc: remove orphan systbl_chk.sh
Date: Thu, 29 Sep 2022 13:21:20 +1000
Message-Id: <20220929032120.3592593-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

arch/powerpc/kernel/systbl_chk.sh has not been referenced since commit
ab66dcc76d6a ("powerpc: generate uapi header and system call table
files"). Remove it.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/systbl_chk.sh | 30 ------------------------------
 1 file changed, 30 deletions(-)
 delete mode 100644 arch/powerpc/kernel/systbl_chk.sh

diff --git a/arch/powerpc/kernel/systbl_chk.sh b/arch/powerpc/kernel/systbl_chk.sh
deleted file mode 100644
index c7ac3ed657c4..000000000000
--- a/arch/powerpc/kernel/systbl_chk.sh
+++ /dev/null
@@ -1,30 +0,0 @@
-#!/bin/sh
-# SPDX-License-Identifier: GPL-2.0-or-later
-#
-# Just process the CPP output from systbl_chk.c and complain
-# if anything is out of order.
-#
-# Copyright © 2008 IBM Corporation
-#
-
-awk	'BEGIN { num = -1; }	# Ignore the beginning of the file
-	/^#/ { next; }
-	/^[ \t]*$/ { next; }
-	/^START_TABLE/ { num = 0; next; }
-	/^END_TABLE/ {
-		if (num != $2) {
-			printf "Error: NR_syscalls (%s) is not one more than the last syscall (%s)\n",
-				$2, num - 1;
-			exit(1);
-		}
-		num = -1;	# Ignore the rest of the file
-	}
-	{
-		if (num == -1) next;
-		if (($1 != -1) && ($1 != num)) {
-			printf "Error: Syscall %s out of order (expected %s)\n",
-				$1, num;
-			exit(1);
-		};
-		num++;
-	}' "$1"
-- 
2.37.2

