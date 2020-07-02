Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 26D3A211D92
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Jul 2020 09:56:20 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49y9QT39f1zDqTg
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Jul 2020 17:56:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1044;
 helo=mail-pj1-x1044.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=PCTOgeyX; dkim-atps=neutral
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49y9GB1dWtzDqKl
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Jul 2020 17:49:06 +1000 (AEST)
Received: by mail-pj1-x1044.google.com with SMTP id o22so7113983pjw.2
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 02 Jul 2020 00:49:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fa9T6PNML2/xkl0bGh/Ztj2VCHxJI+rGnDXzulQp9g4=;
 b=PCTOgeyXmxCRHqkPbdWbNCD5RF4HWZdbQyTIojx6EjkOEWF+8/wPlG+BElrR7+YXPZ
 sLjTHouTQD0P60dVOilWpe+9ScH0g0t3DQfrJjVACgVsaQop6YHakwMXx0bTb/i9Kpyr
 IfE7/orhNh+x85icci2L+rRczXIMxKvjeObHUliBHpTheYNK4UHn2US9x2BpsMUNug+I
 EusvpjUPF/4LJKVp6u8AbSLcPZwrmIIEF3Y1b5zCKSh3qKcVdNqSh8SeyDBvoKorJgff
 xdbFqgnTG+Pi2peG6cNEYSMF+oKs2l5g3Bon66SblCaVCGRP5jxZmJeOVkncsl3jVmza
 hxSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fa9T6PNML2/xkl0bGh/Ztj2VCHxJI+rGnDXzulQp9g4=;
 b=mEV53sDFgc0Gb7PldosSu5T4kY4FoZqgJ+a717vTZG1hTjfEglptvJZMjV77T/jWR+
 i7mvieAZMdzCs4SsL2lvJ7mEP/xZ5yI7TXh40hkj0FVTFe3VhkJq8hzzP8qsE1PNUpTN
 hX8/0d5PY4MQd1E/K0DL2eHLXhXgcc+F7dY74dwqhHbY2Gl8InD8DTwAdU6WUUrk/D6o
 bylVnLiu5Aew0OBAl8SJgXezKog+JJP2Hx3O6ocrfzE8amhAv/fEvT8mvdrgQs19tU95
 o+f3tIxTiThTuVWWUNdIIBwnhGqXlC29KbqGrErCiEH91aHxGgh7EUZVHSBchXKbA+DF
 mIDQ==
X-Gm-Message-State: AOAM531puh+gDdnMFdi7PtoyvwZ/oaHgvn/ZepDzr0FfNIQ4j2sE69Nr
 jpMQF80jjrd2D56R/n0b0Av7U5wb
X-Google-Smtp-Source: ABdhPJz0DrYb1pN7ZPb0vDXXXEcS0FJvLihL6IDzUc7haMlJV7H/L6XRfoSOyJ9cS7kxACtRgiESpQ==
X-Received: by 2002:a17:90a:950c:: with SMTP id
 t12mr32900004pjo.173.1593676144195; 
 Thu, 02 Jul 2020 00:49:04 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (61-68-186-125.tpgi.com.au. [61.68.186.125])
 by smtp.gmail.com with ESMTPSA id 17sm6001953pfv.16.2020.07.02.00.48.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jul 2020 00:49:03 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: 
Subject: [PATCH 2/8] powerpc/pseries: use smp_rmb() in H_CONFER spin yield
Date: Thu,  2 Jul 2020 17:48:33 +1000
Message-Id: <20200702074839.1057733-3-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200702074839.1057733-1-npiggin@gmail.com>
References: <20200702074839.1057733-1-npiggin@gmail.com>
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
Cc: linux-arch@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 linuxppc-dev@lists.ozlabs.org, Boqun Feng <boqun.feng@gmail.com>,
 linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>,
 virtualization@lists.linux-foundation.org, Ingo Molnar <mingo@redhat.com>,
 kvm-ppc@vger.kernel.org, Waiman Long <longman@redhat.com>,
 Will Deacon <will@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

There is no need for rmb(), this allows faster lwsync here.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/lib/locks.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/lib/locks.c b/arch/powerpc/lib/locks.c
index 6440d5943c00..47a530de733e 100644
--- a/arch/powerpc/lib/locks.c
+++ b/arch/powerpc/lib/locks.c
@@ -30,7 +30,7 @@ void splpar_spin_yield(arch_spinlock_t *lock)
 	yield_count = be32_to_cpu(lppaca_of(holder_cpu).yield_count);
 	if ((yield_count & 1) == 0)
 		return;		/* virtual cpu is currently running */
-	rmb();
+	smp_rmb();
 	if (lock->slock != lock_value)
 		return;		/* something has changed */
 	plpar_hcall_norets(H_CONFER,
@@ -56,7 +56,7 @@ void splpar_rw_yield(arch_rwlock_t *rw)
 	yield_count = be32_to_cpu(lppaca_of(holder_cpu).yield_count);
 	if ((yield_count & 1) == 0)
 		return;		/* virtual cpu is currently running */
-	rmb();
+	smp_rmb();
 	if (rw->lock != lock_value)
 		return;		/* something has changed */
 	plpar_hcall_norets(H_CONFER,
-- 
2.23.0

