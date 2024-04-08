Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BEC2989B72C
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Apr 2024 07:31:58 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=xoNo3d1g;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VCd4r4Jmmz3dVj
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Apr 2024 15:31:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=xoNo3d1g;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.alibaba.com (client-ip=115.124.30.100; helo=out30-100.freemail.mail.aliyun.com; envelope-from=yang.lee@linux.alibaba.com; receiver=lists.ozlabs.org)
Received: from out30-100.freemail.mail.aliyun.com (out30-100.freemail.mail.aliyun.com [115.124.30.100])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VCd476q63z3bX3
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  8 Apr 2024 15:31:18 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1712554274; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=k23jdKfibshf2paiE8mb65YrFHJxxTS5h12Q4rCwBqE=;
	b=xoNo3d1gveM9Bk5ovWSsKjb/6ewm8ls1jh4N8iHL/yUpWfeReH2680JiWUiOx4pWFZaXjSijUth9PvOUvNoORZQcsoaSQJTG9GGsmYdrgt/BCzmEBfb2bZxyXelBvrkK4QF0FZZn7QxCRWxN85UnpAb9lO/iQ1ZJbNkc2vvaPmA=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R181e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018046059;MF=yang.lee@linux.alibaba.com;NM=1;PH=DS;RN=10;SR=0;TI=SMTPD_---0W439DQO_1712554273;
Received: from localhost(mailfrom:yang.lee@linux.alibaba.com fp:SMTPD_---0W439DQO_1712554273)
          by smtp.aliyun-inc.com;
          Mon, 08 Apr 2024 13:31:13 +0800
From: Yang Li <yang.lee@linux.alibaba.com>
To: rdunlap@infradead.org,
	arnd@arndb.de,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	christophe.leroy@csgroup.eu,
	aneesh.kumar@kernel.org,
	naveen.n.rao@linux.ibm.com
Subject: [PATCH -next 3/3 v2] powerpc/rtas: Add kernel-doc comments to smp_startup_cpu()
Date: Mon,  8 Apr 2024 13:31:09 +0800
Message-Id: <20240408053109.96360-2-yang.lee@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
In-Reply-To: <20240408053109.96360-1-yang.lee@linux.alibaba.com>
References: <20240408053109.96360-1-yang.lee@linux.alibaba.com>
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
Cc: Yang Li <yang.lee@linux.alibaba.com>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This commit adds kernel-doc style comments with complete parameter
descriptions for the function smp_startup_cpu().

Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
---
 arch/powerpc/platforms/cell/smp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/platforms/cell/smp.c b/arch/powerpc/platforms/cell/smp.c
index 30394c6f8894..fee638fd8970 100644
--- a/arch/powerpc/platforms/cell/smp.c
+++ b/arch/powerpc/platforms/cell/smp.c
@@ -54,6 +54,7 @@ static cpumask_t of_spin_map;
 
 /**
  * smp_startup_cpu() - start the given cpu
+ * @lcpu: Logical CPU ID of the CPU to be started.
  *
  * At boot time, there is nothing to do for primary threads which were
  * started from Open Firmware.  For anything else, call RTAS with the
-- 
2.20.1.7.g153144c

