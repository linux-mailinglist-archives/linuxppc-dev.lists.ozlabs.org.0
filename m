Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F91C1C66AE
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 May 2020 06:18:53 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49H3Ht69b5zDqTs
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 May 2020 14:18:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::442;
 helo=mail-pf1-x442.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=eL4s/2+B; dkim-atps=neutral
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49H2bM6P3nzDqby
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 May 2020 13:47:11 +1000 (AEST)
Received: by mail-pf1-x442.google.com with SMTP id 18so330972pfv.8
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 05 May 2020 20:47:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=jeOT9EPaJYZG3b9oG+V6kVtLwGY3A7tvj/bdU/QCwNU=;
 b=eL4s/2+B4N4SCm8pH1HEUmN1Ui4ZnRheGm/iLkJKTjOzWogAm6k0gatoPalmRm8PnQ
 1/YY6moHfuAhB9UQ/fb+adXujStFkInzJRRgK4HFP+DdnMQOwJib4HCqNb7s5HcZqDHw
 vacRh+V4gevJanEXf12WavpjiFCWUlJnJ7t1/kRWE4E71eYqHpGdXU/WZ1FywlY/xX/w
 mKrxqT3QODemluEQSyGlrP+0X3vV/k1pHJ0Af9vqXBe8VRMpsXNRRA50i7WYPqqJ15cV
 92CCqTkND/vJw5tXQl5gUV4SgIis28PfsYgAwLJkIE8StX4t1NeUTyQFuaQF2db6gJNe
 7Z2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=jeOT9EPaJYZG3b9oG+V6kVtLwGY3A7tvj/bdU/QCwNU=;
 b=Y6bXkqAIIgPuNpFSxU/mxT+Q7OsXVHfAvMJwhc4ktY22hxTwbNr8CwzC4vSZg44E2V
 JsFFjqPUQ93mdbFp0CYTu2SYq59kfva/7AQNtjmkD3cCB6WpgScsOprqX+05+M/cnll+
 bmE1q3nDAMJH0tZji6iyusv0Kc5zTQJ1W2pAvw0YlsT+0ZfqGsCrgBzARyl8MXjOd8xc
 lzn+CdKOUeJTI8qXEUP3oz/GvqaAnAxlF3MvSCOm+IW51AR5AhKKWLP1TBC6L6Da2H/I
 lqNfhKfq5+7bRUOSrMLe93QNvA45ZlJI+mWEYbYOthDEgFR1/dGKmb9JnEuWEZCZG9YZ
 ruvw==
X-Gm-Message-State: AGi0PuZ5bg5+jKa0+74Sf3RVS1/RVuvvcrk1jIhGQ7o9tJR2x3TTNMfr
 K+0dFTWximPQs0Dw5hKh5c4w+HoqIj4l1A==
X-Google-Smtp-Source: APiQypLu+LHyudpzDUpEM+Kde9rovgrbVNyQ9XGy0I2yW+9Z1P/ek1Dpkmpd6Fjle1r/qtcGvuA8qA==
X-Received: by 2002:aa7:8f26:: with SMTP id y6mr6322935pfr.36.1588736828954;
 Tue, 05 May 2020 20:47:08 -0700 (PDT)
Received: from localhost.localdomain
 (180-150-65-4.b49641.syd.nbn.aussiebb.net. [180.150.65.4])
 by smtp.gmail.com with ESMTPSA id k4sm465676pgg.88.2020.05.05.20.46.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 May 2020 20:47:08 -0700 (PDT)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v8 19/30] powerpc/xmon: Move insertion of breakpoint for
 xol'ing
Date: Wed,  6 May 2020 13:40:39 +1000
Message-Id: <20200506034050.24806-20-jniethe5@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200506034050.24806-1-jniethe5@gmail.com>
References: <20200506034050.24806-1-jniethe5@gmail.com>
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
Cc: alistair@popple.id.au, npiggin@gmail.com, bala24@linux.ibm.com,
 naveen.n.rao@linux.vnet.ibm.com, Jordan Niethe <jniethe5@gmail.com>,
 dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

When a new breakpoint is created, the second instruction of that
breakpoint is patched with a trap instruction. This assumes the length
of the instruction is always the same. In preparation for prefixed
instructions, remove this assumption. Insert the trap instruction at the
same time the first instruction is inserted.

Reviewed-by: Alistair Popple <alistair@popple.id.au>
Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
---
v8: style
---
 arch/powerpc/xmon/xmon.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
index 7a9cbc6d9b21..4d6980d51456 100644
--- a/arch/powerpc/xmon/xmon.c
+++ b/arch/powerpc/xmon/xmon.c
@@ -878,7 +878,6 @@ static struct bpt *new_breakpoint(unsigned long a)
 		if (!bp->enabled && atomic_read(&bp->ref_count) == 0) {
 			bp->address = a;
 			bp->instr = (void *)(bpt_table + ((bp - bpts) * BPT_WORDS));
-			patch_instruction(bp->instr + 1, ppc_inst(bpinstr));
 			return bp;
 		}
 	}
@@ -910,6 +909,8 @@ static void insert_bpts(void)
 			continue;
 		}
 		patch_instruction(bp->instr, instr);
+		patch_instruction((void *)bp->instr + ppc_inst_len(instr),
+				  ppc_inst(bpinstr));
 		if (bp->enabled & BP_CIABR)
 			continue;
 		if (patch_instruction((struct ppc_inst *)bp->address,
-- 
2.17.1

