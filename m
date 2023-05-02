Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F06A6F46C5
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 May 2023 17:07:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q9k2N4P49z3cdX
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 May 2023 01:07:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=L+LxLoS7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52d; helo=mail-pg1-x52d.google.com; envelope-from=zhouzhouyi@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=L+LxLoS7;
	dkim-atps=neutral
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q9k1V4brqz2xdw
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 May 2023 01:06:21 +1000 (AEST)
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-51f3289d306so2639651a12.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 02 May 2023 08:06:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683039977; x=1685631977;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cfBsAGpRXFX3Iqed0oeLIM1q8SnmBVNgKImTrWph7ys=;
        b=L+LxLoS7h/tl6nAWBs0gTbJ1H4N0ce4HbF3BC1NXmG8821bTevRIf2S5vMWct1CrAH
         D7wJnuy9OeFP80iArWd4fQsmQwxC6kJX53RzRgWUNRFn+R/kElQ3Nwxf3B+Y8Uz6F+r9
         3Tu0LRZlY7vaXyA6+BGFgOiaaZxgz6fsc2s1up3U8xSUIQSmr1YBQhLHGzvLAtTPOLnb
         HK/hI3oKA1TaZ7MfPfjmDS7KgZzTjAr04RL7c+sfOk7DeJau13z91lWyFNfAEUNHNRvN
         ntZnRgqFPchzp81KoLSlde9XkPd94bkF/JWHbc2KTPyUBFIxsmn5SSVxg3XVLOnFclxD
         9ldQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683039977; x=1685631977;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cfBsAGpRXFX3Iqed0oeLIM1q8SnmBVNgKImTrWph7ys=;
        b=M3mc6OnfgHJuAIfd05Bwl7e3BjEvq3KzF60M5aehWgf6sCj+4xyR2PllvQXcwLWOzp
         1tkS2sYaclri+lmKerN8LHtakDemm1AJFtFhb3KaBKJ0qE5JcreQuQK8wHh8T/hy/Jsa
         zVjNGPuJREtixPghFZLKH8/cfOtipHYPMQEUZ+l+E3WedzL7XjEt6Q/Iw7F6lIKCVM8k
         S/KoeooUqVif9bXXTuW8EtGVV6dqr5aW0imSBDn+i8oopEsgJ7ds2D9xjzFHUI234b0N
         zJIT+Tcp4SnwJxVoJ+sesgY+2ka2PNejL/VY0OJD2hmhQSGIFyVCsMM9GQ0+ZoVWVoi0
         JBOQ==
X-Gm-Message-State: AC+VfDx88qkU+qSbpFCz3oMhbtygWdmxC6pSq8l0QfqLmYOam1zxhHCg
	U5qcIAYwtVMJ1RfkFe+ayio=
X-Google-Smtp-Source: ACHHUZ7islxlN/yKDPiKhGdceK+u8FJFTxYQ9Vxxh0/Z6Z830DQzWdjVccEHSpP8IBYIBpiaHqTOlg==
X-Received: by 2002:a05:6a21:3a91:b0:f0:6517:2fd with SMTP id zv17-20020a056a213a9100b000f0651702fdmr18369559pzb.2.1683039976916;
        Tue, 02 May 2023 08:06:16 -0700 (PDT)
Received: from localhost.localdomain ([154.220.3.115])
        by smtp.gmail.com with ESMTPSA id f20-20020a056a00229400b0063799398eb9sm21983103pfe.58.2023.05.02.08.06.15
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 02 May 2023 08:06:16 -0700 (PDT)
From: zhouzhouyi@gmail.com
To: paulmck@kernel.org,
	rcu@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	lance@osuosl.org
Subject: [PATCH RFC] rcu: torture: shorten the time between forward-progress tests
Date: Tue,  2 May 2023 23:06:02 +0800
Message-Id: <1683039962-15751-1-git-send-email-zhouzhouyi@gmail.com>
X-Mailer: git-send-email 1.7.1
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
Cc: Zhouyi Zhou <zhouzhouyi@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Zhouyi Zhou <zhouzhouyi@gmail.com>

Currently, default time between rcu torture forward-progress tests is 60HZ,
Under this configuration, false positive caused by __stack_chk_fail [1] is
difficult to reproduce (needs average 5*420 seconds for SRCU-P),
which means one has to invoke [2] 5 times in average to make [1] appear.

With time between rcu torture forward-progress tests be 1 HZ, above
phenomenon will be reproduced within 3 minutes, which means we can
reproduce [1] everytime we invoke [2].

Although [1] is a false positive, this change will make possible future
true bugs easier to be discovered.            
                   
[1] Link: https://lore.kernel.org/lkml/CAABZP2yS5=ZUwEZQ7iHkV0wDm_HgO8K-TeAhyJrZhavzKDa44Q@mail.gmail.com/T/
[2] tools/testing/selftests/rcutorture/bin/torture.sh

Tested in PPC VM of Opensource Lab of Oregon State Univerisity.
        
Signed-off-by: Zhouyi Zhou <zhouzhouyi@gmail.com>        
---
 tools/testing/selftests/rcutorture/configs/rcu/SRCU-N.boot  | 1 +
 tools/testing/selftests/rcutorture/configs/rcu/SRCU-P.boot  | 1 +
 tools/testing/selftests/rcutorture/configs/rcu/TRACE02.boot | 1 +
 tools/testing/selftests/rcutorture/configs/rcu/TREE02.boot  | 1 +
 tools/testing/selftests/rcutorture/configs/rcu/TREE10.boot  | 1 +
 5 files changed, 5 insertions(+)

diff --git a/tools/testing/selftests/rcutorture/configs/rcu/SRCU-N.boot b/tools/testing/selftests/rcutorture/configs/rcu/SRCU-N.boot
index ce0694fd9b92..982582bff041 100644
--- a/tools/testing/selftests/rcutorture/configs/rcu/SRCU-N.boot
+++ b/tools/testing/selftests/rcutorture/configs/rcu/SRCU-N.boot
@@ -1,2 +1,3 @@
 rcutorture.torture_type=srcu
 rcutorture.fwd_progress=3
+rcutorture.fwd_progress_holdoff=1
diff --git a/tools/testing/selftests/rcutorture/configs/rcu/SRCU-P.boot b/tools/testing/selftests/rcutorture/configs/rcu/SRCU-P.boot
index 2db39f298d18..18f5d7361d8a 100644
--- a/tools/testing/selftests/rcutorture/configs/rcu/SRCU-P.boot
+++ b/tools/testing/selftests/rcutorture/configs/rcu/SRCU-P.boot
@@ -1,4 +1,5 @@
 rcutorture.torture_type=srcud
 rcupdate.rcu_self_test=1
 rcutorture.fwd_progress=3
+rcutorture.fwd_progress_holdoff=1
 srcutree.big_cpu_lim=5
diff --git a/tools/testing/selftests/rcutorture/configs/rcu/TRACE02.boot b/tools/testing/selftests/rcutorture/configs/rcu/TRACE02.boot
index c70b5db6c2ae..b86bc7df7603 100644
--- a/tools/testing/selftests/rcutorture/configs/rcu/TRACE02.boot
+++ b/tools/testing/selftests/rcutorture/configs/rcu/TRACE02.boot
@@ -1,2 +1,3 @@
 rcutorture.torture_type=tasks-tracing
 rcutorture.fwd_progress=2
+rcutorture.fwd_progress_holdoff=1
diff --git a/tools/testing/selftests/rcutorture/configs/rcu/TREE02.boot b/tools/testing/selftests/rcutorture/configs/rcu/TREE02.boot
index dd914fa8f690..933302f885df 100644
--- a/tools/testing/selftests/rcutorture/configs/rcu/TREE02.boot
+++ b/tools/testing/selftests/rcutorture/configs/rcu/TREE02.boot
@@ -1 +1,2 @@
 rcutorture.fwd_progress=2
+rcutorture.fwd_progress_holdoff=1
diff --git a/tools/testing/selftests/rcutorture/configs/rcu/TREE10.boot b/tools/testing/selftests/rcutorture/configs/rcu/TREE10.boot
index dd914fa8f690..933302f885df 100644
--- a/tools/testing/selftests/rcutorture/configs/rcu/TREE10.boot
+++ b/tools/testing/selftests/rcutorture/configs/rcu/TREE10.boot
@@ -1 +1,2 @@
 rcutorture.fwd_progress=2
+rcutorture.fwd_progress_holdoff=1
-- 
2.34.1

