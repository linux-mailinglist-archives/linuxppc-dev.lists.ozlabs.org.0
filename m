Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E16047CA84A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Oct 2023 14:44:55 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=bpDEZnHH;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S8Gz95zvvz3vYj
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Oct 2023 23:44:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=bpDEZnHH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42c; helo=mail-pf1-x42c.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S8GxL5Lccz30Q4
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Oct 2023 23:43:18 +1100 (AEDT)
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-6be0277c05bso684320b3a.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Oct 2023 05:43:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697460195; x=1698064995; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FHFNauDcUWKtivz1H+j8KgAD3PFnM59+M+NZETg+vSA=;
        b=bpDEZnHH9uqfOMGAogcrbqAtoJLKir68q2Mk6Hhiw+6YTKKvAVfUDiYXVjaPPpzrz0
         iu/cKgXs9VaEjxe9SGELwLjyVDPewzNMWEqzOInL9TGzS4Y2wfFzo3JdK/AsEuH7dP0u
         pOPpjdlF6ZzW9X/5WWsGMBKphGbnNC3QsACDKHbZXNnimmZNqvsYcJ8SmtLOGwr0Y2Hv
         me4Tr22xZy2kTLDYiueuv+B90EzZCyd9/FFGJZFQoWMBP8htltplKj+JtecPLrDGn6tT
         pZEjDdDM9ehMSA1a/YxkOae4+TELWU3YWhtefGaj5AoLSGvpVL0kCkf0MZjf0odkULTr
         AzSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697460195; x=1698064995;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FHFNauDcUWKtivz1H+j8KgAD3PFnM59+M+NZETg+vSA=;
        b=uqhoxnPPCks7NE7Xoa9qBQnThnHK0Idtf7lJlsf7h6OB65Bs0LSSPIALzfYOTW9XpX
         J7V99vRy9CyAHmUrU42dBSk/pzOZgTaUasoasLBM2h3BP9DrKRuwABslEytsuQQujheg
         dvkqRzk4ZU1RZC578EbZ8ObBNHy8CNjmdGd5rNuhwaZlA6qeNBSrlrqUFhW4iBtxIM1k
         vxPwjjjyq4mcOoDqG7nHVCAZiS1GqAQnzdWBjyZeju9ilrz681Y6OHQCgb1q660DZGVm
         leaE/BDpMVhPVOeQN7+pJRdqyqcNjucby5rNOyb3OBgWJWSVUv37FO0VEo7qV5BTezY5
         Fzhw==
X-Gm-Message-State: AOJu0Yxlynzl4yhxCeOEk81JXqWyAnbvIUizi+enZIm9UEolDDz8tx6P
	2V2knKOEbBFQ3rm7rrXP0CgjCS4SuOQ=
X-Google-Smtp-Source: AGHT+IHeRC2fJ0RrClgasakjX/wQYTAjd6pHck3fEjqsV2hNaPJQJNZZV6GLrfPTSBzZ/eCp+fURYQ==
X-Received: by 2002:a05:6a00:2d1b:b0:6bd:7cbd:15a2 with SMTP id fa27-20020a056a002d1b00b006bd7cbd15a2mr2707554pfb.26.1697460195529;
        Mon, 16 Oct 2023 05:43:15 -0700 (PDT)
Received: from wheely.local0.net (193-116-200-79.tpgi.com.au. [193.116.200.79])
        by smtp.gmail.com with ESMTPSA id t123-20020a625f81000000b0068c10187dc3sm6298850pfb.168.2023.10.16.05.43.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Oct 2023 05:43:15 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 1/6] powerpc/qspinlock: Fix stale propagated yield_cpu
Date: Mon, 16 Oct 2023 22:43:00 +1000
Message-ID: <20231016124305.139923-2-npiggin@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231016124305.139923-1-npiggin@gmail.com>
References: <20231016124305.139923-1-npiggin@gmail.com>
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
Cc: Shrikanth Hegde <sshegde@linux.vnet.ibm.com>, Laurent Dufour <ldufour@linux.ibm.com>, Srikar Dronamraju <srikar@linux.vnet.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, "Nysal Jan K . A" <nysal@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

yield_cpu is a sample of a preempted lock holder that gets propagated
back through the queue. Queued waiters use this to yield to the
preempted lock holder without continually sampling the lock word (which
would defeat the purpose of MCS queueing by bouncing the cache line).

The problem is that yield_cpu can become stale. It can take some time to
be passed down the chain, and if any queued waiter gets preempted then
it will cease to propagate the yield_cpu to later waiters.

This can result in yielding to a CPU that no longer holds the lock,
which is bad, but particularly if it is currently in H_CEDE (idle),
then it appears to be preempted and some hypervisors (PowerVM) can
cause very long H_CONFER latencies waiting for H_CEDE wakeup. This
results in latency spikes and hard lockups on oversubscribed
partitions with lock contention.

This is a minimal fix. Before yielding to yield_cpu, sample the lock
word to confirm yield_cpu is still the owner, and bail out of it is not.

Thanks to a bunch of people who reported this and tracked down the
exact problem using tracepoints and dispatch trace logs.

Fixes: 28db61e207ea ("powerpc/qspinlock: allow propagation of yield CPU down the queue")
Reported-by: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Reported-by: Laurent Dufour <ldufour@linux.ibm.com>
Reported-by: Shrikanth Hegde <sshegde@linux.vnet.ibm.com>
Debugged-by: Nysal Jan K.A <nysal@linux.ibm.com>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/lib/qspinlock.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/powerpc/lib/qspinlock.c b/arch/powerpc/lib/qspinlock.c
index 253620979d0c..6dd2f46bd3ef 100644
--- a/arch/powerpc/lib/qspinlock.c
+++ b/arch/powerpc/lib/qspinlock.c
@@ -406,6 +406,9 @@ static __always_inline bool yield_to_prev(struct qspinlock *lock, struct qnode *
 	if ((yield_count & 1) == 0)
 		goto yield_prev; /* owner vcpu is running */
 
+	if (get_owner_cpu(READ_ONCE(lock->val)) != yield_cpu)
+		goto yield_prev; /* re-sample lock owner */
+
 	spin_end();
 
 	preempted = true;
-- 
2.42.0

